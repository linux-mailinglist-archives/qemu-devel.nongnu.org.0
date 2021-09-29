Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5768941BF97
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 09:10:30 +0200 (CEST)
Received: from localhost ([::1]:54924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVTjZ-0004eG-6s
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 03:10:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mVTgg-0002zy-UY
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 03:07:32 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:57046
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mVTgb-0004Iq-AN
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 03:07:26 -0400
Received: from [2a00:23c4:8b9d:4100:5d98:71b5:90ca:dad1]
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mVTgN-0003mu-L9; Wed, 29 Sep 2021 08:07:15 +0100
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210926222716.1732932-1-f4bug@amsat.org>
 <20210926222716.1732932-37-f4bug@amsat.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <3e01a50f-2217-5b75-72b0-139f5ef8467e@ilande.co.uk>
Date: Wed, 29 Sep 2021 08:07:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20210926222716.1732932-37-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8b9d:4100:5d98:71b5:90ca:dad1
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v8 36/40] target/sparc: Restrict has_work() handler to
 sysemu
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.562,
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26/09/2021 23:27, Philippe Mathieu-Daudé wrote:

> Restrict has_work() to sysemu.
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   target/sparc/cpu.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
> index 0d252cb5bdc..8d61bf15f6c 100644
> --- a/target/sparc/cpu.c
> +++ b/target/sparc/cpu.c
> @@ -702,6 +702,7 @@ static void sparc_cpu_synchronize_from_tb(CPUState *cs,
>       cpu->env.npc = tb->cs_base;
>   }
>   
> +#if !defined(CONFIG_USER_ONLY)
>   static bool sparc_cpu_has_work(CPUState *cs)
>   {
>       SPARCCPU *cpu = SPARC_CPU(cs);
> @@ -710,6 +711,7 @@ static bool sparc_cpu_has_work(CPUState *cs)
>       return (cs->interrupt_request & CPU_INTERRUPT_HARD) &&
>              cpu_interrupts_enabled(env);
>   }
> +#endif /* !CONFIG_USER_ONLY */
>   
>   static char *sparc_cpu_type_name(const char *cpu_model)
>   {
> @@ -867,6 +869,7 @@ static const struct TCGCPUOps sparc_tcg_ops = {
>       .tlb_fill = sparc_cpu_tlb_fill,
>   
>   #ifndef CONFIG_USER_ONLY
> +    .has_work = sparc_cpu_has_work,
>       .cpu_exec_interrupt = sparc_cpu_exec_interrupt,
>       .do_interrupt = sparc_cpu_do_interrupt,
>       .do_transaction_failed = sparc_cpu_do_transaction_failed,
> @@ -888,7 +891,6 @@ static void sparc_cpu_class_init(ObjectClass *oc, void *data)
>   
>       cc->class_by_name = sparc_cpu_class_by_name;
>       cc->parse_features = sparc_cpu_parse_features;
> -    cc->has_work = sparc_cpu_has_work;
>       cc->dump_state = sparc_cpu_dump_state;
>   #if !defined(TARGET_SPARC64) && !defined(CONFIG_USER_ONLY)
>       cc->memory_rw_debug = sparc_cpu_memory_rw_debug;

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


ATB,

Mark.

