Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E765A4F1167
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Apr 2022 10:52:04 +0200 (CEST)
Received: from localhost ([::1]:40596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbIRO-0006Na-Mc
	for lists+qemu-devel@lfdr.de; Mon, 04 Apr 2022 04:52:02 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nbIJe-0002x4-GT
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 04:44:02 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:57834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nbIJc-0000td-LV
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 04:44:02 -0400
Received: from [192.168.13.13] (unknown [195.68.53.70])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 0DF9720779;
 Mon,  4 Apr 2022 08:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1649061836;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jcwic/nXIqpdwSJ5ZwheNTMquRu7l+lv6KrKYOVzKVQ=;
 b=Uc8i+K0wTjyGLKT6n8CD4y9SrmQyoJdJu/HXi9Xx2lfZ0ejEwU8Y4NOfPgQyt3m9fs6Y2g
 HxmW6oGVYkzul+SbWHHejqJ7fbiCZsURLQhyMRUMbAVHQW/oPxK3KaJZuRa3zu8alyJG0W
 s5S+YRr8cDcuRdXVWvE+MYBsNog3bvc=
Message-ID: <9e0568cc-bb14-1d3f-ded1-80c4286999d5@greensocs.com>
Date: Mon, 4 Apr 2022 10:43:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] target/i386: Suppress coverity warning on fsave/frstor
Content-Language: en-US-large
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220401184635.327423-1-richard.henderson@linaro.org>
From: Damien Hedde <damien.hedde@greensocs.com>
In-Reply-To: <20220401184635.327423-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: eduardo@habkost.net, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 4/1/22 20:46, Richard Henderson wrote:
> Coverity warns that 14 << data32 may overflow with respect
> to the target_ulong to which it is subsequently added.
> We know this wasn't true because data32 is in [1,2],
> but the suggested fix is perfectly fine.
> 
> Fixes: Coverity CID 1487135, 1487256
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/i386/tcg/fpu_helper.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/target/i386/tcg/fpu_helper.c b/target/i386/tcg/fpu_helper.c
> index ebf5e73df9..30bc44fcf8 100644
> --- a/target/i386/tcg/fpu_helper.c
> +++ b/target/i386/tcg/fpu_helper.c
> @@ -2466,7 +2466,7 @@ static void do_fsave(CPUX86State *env, target_ulong ptr, int data32,
>   
>       do_fstenv(env, ptr, data32, retaddr);
>   
> -    ptr += (14 << data32);
> +    ptr += (target_ulong)14 << data32;
>       for (i = 0; i < 8; i++) {
>           tmp = ST(i);
>           do_fstt(env, tmp, ptr, retaddr);
> @@ -2488,7 +2488,7 @@ static void do_frstor(CPUX86State *env, target_ulong ptr, int data32,
>       int i;
>   
>       do_fldenv(env, ptr, data32, retaddr);
> -    ptr += (14 << data32);
> +    ptr += (target_ulong)14 << data32;
>   
>       for (i = 0; i < 8; i++) {
>           tmp = do_fldt(env, ptr, retaddr);

Reviewed-by: Damien Hedde <damien.hedde@greensocs.com>

