Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4736F29CFF6
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Oct 2020 13:59:38 +0100 (CET)
Received: from localhost ([::1]:34902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kXl3A-00053w-RP
	for lists+qemu-devel@lfdr.de; Wed, 28 Oct 2020 08:59:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kXl1M-0004Q2-4q
 for qemu-devel@nongnu.org; Wed, 28 Oct 2020 08:57:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51313)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kXl1J-0001H6-Jq
 for qemu-devel@nongnu.org; Wed, 28 Oct 2020 08:57:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603889859;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jpte9eii4EhcqzW2UB2vR1HH08Y3qJCtKTAAHes7+VM=;
 b=dz2O8mXg1RuIvJr3k8BLIvFXakd4dIPBaLacsPragKJiE0AT1mZ1WQumQsoxw7rEkU1H9d
 FJXWWBiQKgpCBooa1X08tJxWuMtGAMm3+v9pKx244p8+PvlTXiYK1yOkzqn11PzR7CaNsM
 riiiI//NeKkj/ym4cUAweMc4rVsU4w4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-229-8jDTQ6NRPmWsU0tPfDzzCQ-1; Wed, 28 Oct 2020 08:57:37 -0400
X-MC-Unique: 8jDTQ6NRPmWsU0tPfDzzCQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7FC5818A2248;
 Wed, 28 Oct 2020 12:57:35 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-124.ams2.redhat.com [10.36.112.124])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1BFB219C4F;
 Wed, 28 Oct 2020 12:57:31 +0000 (UTC)
Subject: Re: [PATCH 1/9] target/i386: silence the compiler warnings in
 gen_shiftd_rm_T1
To: Chen Qun <kuhn.chenqun@huawei.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org, Richard Henderson <richard.henderson@linaro.org>
References: <20201028041819.2169003-1-kuhn.chenqun@huawei.com>
 <20201028041819.2169003-2-kuhn.chenqun@huawei.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <30ca9af0-dfc2-e236-5575-068cec679508@redhat.com>
Date: Wed, 28 Oct 2020 13:57:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20201028041819.2169003-2-kuhn.chenqun@huawei.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/28 01:50:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.921, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Eduardo Habkost <ehabkost@redhat.com>, zhang.zhanghailiang@huawei.com,
 ganqixin@huawei.com, Euler Robot <euler.robot@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28/10/2020 05.18, Chen Qun wrote:
> The current "#ifdef TARGET_X86_64" statement affects
> the compiler's determination of fall through.
> 
> When using -Wimplicit-fallthrough in our CFLAGS, the compiler showed warning:
> target/i386/translate.c: In function ‘gen_shiftd_rm_T1’:
> target/i386/translate.c:1773:12: warning: this statement may fall through [-Wimplicit-fallthrough=]
>          if (is_right) {
>             ^
> target/i386/translate.c:1782:5: note: here
>      case MO_32:
>      ^~~~
> 
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
> ---
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: Eduardo Habkost <ehabkost@redhat.com>
> ---
>  target/i386/translate.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/target/i386/translate.c b/target/i386/translate.c
> index caea6f5fb1..4c353427d7 100644
> --- a/target/i386/translate.c
> +++ b/target/i386/translate.c
> @@ -1777,9 +1777,9 @@ static void gen_shiftd_rm_T1(DisasContext *s, MemOp ot, int op1,
>          } else {
>              tcg_gen_deposit_tl(s->T1, s->T0, s->T1, 16, 16);
>          }
> -        /* FALLTHRU */
> -#ifdef TARGET_X86_64
> +        /* fall through */
>      case MO_32:
> +#ifdef TARGET_X86_64
>          /* Concatenate the two 32-bit values and use a 64-bit shift.  */
>          tcg_gen_subi_tl(s->tmp0, count, 1);
>          if (is_right) {

The whole code here looks a little bit fishy to me ... in case TARGET_X86_64
is defined, the MO_16 code falls through to MO_32 ... but in case it is not
defined, it falls through to the default case that comes after the #ifdef
block? Is this really the right thing here? If so, I think there should be
some additional comments explaining this behavior.

Richard, maybe you could help to judge what is right here...?

 Thomas


