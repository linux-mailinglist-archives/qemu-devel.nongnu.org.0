Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C0F6F09C9
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 18:23:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ps4Nl-0001UC-9M; Thu, 27 Apr 2023 12:22:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1ps4Nh-0001Tj-Ag
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 12:22:06 -0400
Received: from rev.ng ([5.9.113.41])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1ps4Nf-0003un-J3
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 12:22:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Reply-To:
 References:To:Subject:MIME-Version:Date:Message-ID:Sender:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PBk9ehRvDdJaYhHQEYbuI3wnL9uOYqu6kcNepJ0kvDo=; b=ePiLda/0od33YapOpiPzOf/atN
 z/fuw0fJx6J51nqRnRttERboO6hD+qqN6Sv4HCoUyzjZwscwLZtq1MiWDCt4N+b/8SqGd/wjuLXeV
 k3zbdQOJHwcVwYQbMWPSF0/JBzuxtCOWEWoaF4J+bp7o40brYoE61TA5HQUuxiTO52zY=;
Message-ID: <5df1bd76-466a-4c50-7701-4c226a2b25a5@rev.ng>
Date: Thu, 27 Apr 2023 18:21:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH] target/hexagon: fix = vs. == mishap
Content-Language: en-US
To: qemu-devel@nongnu.org
References: <20230427125632.104034-1-pbonzini@redhat.com>
Organization: rev.ng
In-Reply-To: <20230427125632.104034-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=5.9.113.41; envelope-from=anjo@rev.ng; helo=rev.ng
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-to:  anjo@rev.ng
X-ACL-Warn: ,  Anton Johansson <anjo@rev.ng>
From:  Anton Johansson via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


On 4/27/23 14:56, Paolo Bonzini wrote:
> Coverity reports a parameter that is "set but never used".  This is caused
> by an assignment operator being used instead of equality.
>
> Cc: Taylor Simpson <tsimpson@quicinc.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   target/hexagon/idef-parser/parser-helpers.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/hexagon/idef-parser/parser-helpers.c b/target/hexagon/idef-parser/parser-helpers.c
> index 86511efb62b9..0a01ec39b75e 100644
> --- a/target/hexagon/idef-parser/parser-helpers.c
> +++ b/target/hexagon/idef-parser/parser-helpers.c
> @@ -1123,7 +1123,7 @@ HexValue gen_extend_op(Context *c,
>                          HexValue *value,
>                          HexSignedness signedness)
>   {
> -    unsigned bit_width = (dst_width = 64) ? 64 : 32;
> +    unsigned bit_width = (dst_width == 64) ? 64 : 32;
>       HexValue value_m = *value;
>       HexValue src_width_m = *src_width;
>   
Reviewed-by: Anton Johansson <anjo@rev.ng>

