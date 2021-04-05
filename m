Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC76353BEF
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Apr 2021 07:51:23 +0200 (CEST)
Received: from localhost ([::1]:51482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTI8v-0007DG-T2
	for lists+qemu-devel@lfdr.de; Mon, 05 Apr 2021 01:51:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1lTI86-0006m9-CM
 for qemu-devel@nongnu.org; Mon, 05 Apr 2021 01:50:30 -0400
Received: from mail.ispras.ru ([83.149.199.84]:37296)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1lTI82-0000np-QZ
 for qemu-devel@nongnu.org; Mon, 05 Apr 2021 01:50:30 -0400
Received: from [192.168.0.92] (unknown [62.118.151.149])
 by mail.ispras.ru (Postfix) with ESMTPSA id B913640755D3;
 Mon,  5 Apr 2021 05:50:19 +0000 (UTC)
Subject: Re: [PATCH] target/alpha: fix icount handling for timer instructions
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <161700373035.1135822.16451510827008616793.stgit@pasha-ThinkPad-X280>
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Message-ID: <d86c92c4-13ee-be15-8da5-c66701ed2b9a@ispras.ru>
Date: Mon, 5 Apr 2021 08:50:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <161700373035.1135822.16451510827008616793.stgit@pasha-ThinkPad-X280>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=83.149.199.84;
 envelope-from=pavel.dovgalyuk@ispras.ru; helo=mail.ispras.ru
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ping.

On 29.03.2021 10:42, Pavel Dovgalyuk wrote:
> This patch handles icount mode for timer read/write instructions,
> because it is required to call gen_io_start in such cases.
> 
> Signed-off-by: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/alpha/translate.c |    9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/target/alpha/translate.c b/target/alpha/translate.c
> index a02b4e70b7..f454adea5e 100644
> --- a/target/alpha/translate.c
> +++ b/target/alpha/translate.c
> @@ -1330,7 +1330,7 @@ static DisasJumpType gen_mfpr(DisasContext *ctx, TCGv va, int regno)
>       case 249: /* VMTIME */
>           helper = gen_helper_get_vmtime;
>       do_helper:
> -        if (icount_enabled()) {
> +        if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
>               gen_io_start();
>               helper(va);
>               return DISAS_PC_STALE;
> @@ -1366,6 +1366,7 @@ static DisasJumpType gen_mfpr(DisasContext *ctx, TCGv va, int regno)
>   static DisasJumpType gen_mtpr(DisasContext *ctx, TCGv vb, int regno)
>   {
>       int data;
> +    DisasJumpType ret = DISAS_NEXT;
>   
>       switch (regno) {
>       case 255:
> @@ -1395,6 +1396,10 @@ static DisasJumpType gen_mtpr(DisasContext *ctx, TCGv vb, int regno)
>   
>       case 251:
>           /* ALARM */
> +        if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> +            gen_io_start();
> +            ret = DISAS_PC_STALE;
> +        }
>           gen_helper_set_alarm(cpu_env, vb);
>           break;
>   
> @@ -1434,7 +1439,7 @@ static DisasJumpType gen_mtpr(DisasContext *ctx, TCGv vb, int regno)
>           break;
>       }
>   
> -    return DISAS_NEXT;
> +    return ret;
>   }
>   #endif /* !USER_ONLY*/
>   
> 


