Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F2B3D41F4
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 23:07:26 +0200 (CEST)
Received: from localhost ([::1]:36944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m72OC-0003WK-Tv
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 17:07:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m72Mz-0002qb-Fo
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 17:06:09 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:37721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m72Mw-0004jj-O8
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 17:06:09 -0400
Received: by mail-wr1-x431.google.com with SMTP id l4so3684436wrs.4
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 14:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qDZFyiwenqwETKmvaIaSzwgUlCwtlPFojD7PcMfevZs=;
 b=LffaGah/ZSb56QxPKtiYOcCkITxIeK37Q5IyDDw1FIPbf27n96tKY3CcFh6foFX8BK
 LOxL8VC28VkO4MZ+Pj3/U+SW9oNOHdyWZdWsF0QZcwOuouUkuF7TemdWo1wlttAvQ/MA
 B1KJeNVJkshzafWoiHI2PiWmWTek/fPotQtE6FSTsgmX4DolFAhBt4q01QM078LeIS2b
 kSJwkuy8CPIwq85rKJEHDJgsO+oLVhSvkaRp0x1oTUY9vGXoYArdRKGnl69dpFoA69Wk
 V/eylzkJRRsLCON6o2N5aCwwIICMlW4cDzciPeU1xP3VcxVN3lWoZpdYr5XMTGXbJZGs
 Im1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qDZFyiwenqwETKmvaIaSzwgUlCwtlPFojD7PcMfevZs=;
 b=IdzJtn7tSS91pNPgnrzmbTlhnFYYZzr/YHQW0VVeI+lXyJbd1GnU//DXXJ78mZcpLF
 lSKKLi8ceEmYi9/GaFGNrHATqeZt04+WxFvku8kkPEOtIqOC+S1XixchtXkyDCEUf9dT
 mDjqf/3DGBJSGRPZGKrQ4fhwC/wqo2741LyrC0KdtZ7o5cltA9QhxLykvSyxq40IfgYK
 WwoSSz/MlFVBFwKxIggUlvUOH19swklXfDFy34Cc21yxniegZG3gji0QkwKY0TSBtEwU
 7UT+CGyvoQm1nCIX/wwiI30p+wtfCA+HwU+VdnfTuRGsPGLizkerWxjNF0CpkIdq/A4r
 7czg==
X-Gm-Message-State: AOAM533lbBNbnckR5BiwZCDCGJ9Uc47BRXC8a270BAXBEVLojwACe/bd
 zcTlE41pisO5Yx7lgNso6FU=
X-Google-Smtp-Source: ABdhPJz8NEc+GXZnZ8TxGPljGSV4tKLnBIwQGkt8Tos7QFwVGqJVNEGB+wmubND1gcdrZ7N1yLYJyA==
X-Received: by 2002:a5d:6482:: with SMTP id o2mr6904217wri.367.1627074364680; 
 Fri, 23 Jul 2021 14:06:04 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id r18sm34311444wrt.96.2021.07.23.14.06.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Jul 2021 14:06:04 -0700 (PDT)
Subject: Re: [PATCH v2] mips/tlb_helper: Add support for 'info tlb' cmd
To: Arkadiy <arkaisp2021@gmail.com>, qemu-devel@nongnu.org
References: <20210723092242.17024-1-arkaisp2021@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <2cd15299-a92e-5cde-cbfc-de4de41c1f14@amsat.org>
Date: Fri, 23 Jul 2021 23:06:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210723092242.17024-1-arkaisp2021@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.203,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: aleksandar.rikalo@syrmia.com, aurelien@aurel32.net,
 pavel.dovgaluk@ispras.ru
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 7/23/21 11:22 AM, Arkadiy wrote:
> From: NDNF <arkaisp2021@gmail.com>
> 
> This adds hmp 'info tlb' command support for the mips platform.
> 1k pages are not supported.
> 
> Signed-off-by: Ivanov Arkady <arkaisp2021@gmail.com>
> ---
>  hmp-commands-info.hx     |  3 ++-
>  target/mips/cpu.h        |  3 +++
>  target/mips/meson.build  |  1 +
>  target/mips/monitor.c    | 26 ++++++++++++++++++++++
>  target/mips/tlb_helper.c | 48 ++++++++++++++++++++++++++++++++++++++++
>  5 files changed, 80 insertions(+), 1 deletion(-)
>  create mode 100644 target/mips/monitor.c
> 
> diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
> index 117ba25f91..d6aab9839c 100644
> --- a/hmp-commands-info.hx
> +++ b/hmp-commands-info.hx
> @@ -222,7 +222,8 @@ SRST
>  ERST
>  
>  #if defined(TARGET_I386) || defined(TARGET_SH4) || defined(TARGET_SPARC) || \
> -    defined(TARGET_PPC) || defined(TARGET_XTENSA) || defined(TARGET_M68K)
> +    defined(TARGET_PPC) || defined(TARGET_XTENSA) || defined(TARGET_M68K) || \
> +    defined(TARGET_MIPS) || defined(TARGET_MIPS64)
>      {
>          .name       = "tlb",
>          .args_type  = "",
> diff --git a/target/mips/cpu.h b/target/mips/cpu.h
> index b9e227a30e..5aa6f2b760 100644
> --- a/target/mips/cpu.h
> +++ b/target/mips/cpu.h
> @@ -1337,6 +1337,9 @@ void itc_reconfigure(struct MIPSITUState *tag);
>  /* helper.c */
>  target_ulong exception_resume_pc(CPUMIPSState *env);
>  
> +/*tlb_helper.c*/
> +void dump_mmu(CPUMIPSState *env);
> +
>  static inline void cpu_get_tb_cpu_state(CPUMIPSState *env, target_ulong *pc,
>                                          target_ulong *cs_base, uint32_t *flags)
>  {
> diff --git a/target/mips/meson.build b/target/mips/meson.build
> index 9741545440..c0b19048ee 100644
> --- a/target/mips/meson.build
> +++ b/target/mips/meson.build
> @@ -31,6 +31,7 @@ mips_softmmu_ss.add(files(
>    'cp0_timer.c',
>    'machine.c',
>    'mips-semi.c',
> +  'monitor.c',
>  ))
>  mips_softmmu_ss.add(when: 'CONFIG_TCG', if_true: files(
>    'cp0_helper.c',
> diff --git a/target/mips/monitor.c b/target/mips/monitor.c
> new file mode 100644
> index 0000000000..9c9dfd2caa
> --- /dev/null
> +++ b/target/mips/monitor.c
> @@ -0,0 +1,26 @@
> +/*
> + * monitor.c
> + *
> + * Copyright (c) 2010-2021 Institute for System Programming
> + *                         of the Russian Academy of Sciences.
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + *
> + */
> +
> +#include "qemu/osdep.h"
> +#include "cpu.h"
> +#include "monitor/monitor.h"
> +#include "monitor/hmp-target.h"
> +#include "monitor/hmp.h"
> +
> +void hmp_info_tlb(Monitor *mon, const QDict *qdict)
> +{
> +    CPUArchState *env = mon_get_cpu_env(mon);

I don't understand which core you are dumping.

Please dump all cores instead. Or take the core index as
argument. See hmp_mce() which does qdict_get_int(qdict, "cpu_index");
Maybe hmp_info_registers() is a good example, as it uses CPU_FOREACH().

> +    if (!env) {
> +        monitor_printf(mon, "No CPU available\n");
> +        return;
> +    }
> +    dump_mmu(env);
> +}
> diff --git a/target/mips/tlb_helper.c b/target/mips/tlb_helper.c
> index 082c17928d..1c0c2831d6 100644
> --- a/target/mips/tlb_helper.c
> +++ b/target/mips/tlb_helper.c
> @@ -24,6 +24,7 @@
>  #include "exec/cpu_ldst.h"
>  #include "exec/log.h"
>  #include "hw/mips/cpudevs.h"
> +#include "qemu/qemu-print.h"
>  
>  enum {
>      TLBRET_XI = -6,
> @@ -37,6 +38,53 @@ enum {
>  
>  #if !defined(CONFIG_USER_ONLY)
>  
> +static void r4k_mmu_dump(CPUMIPSState *env)
> +{
> +    int i;

Maybe display TLB count?

> +    for (i = 0; i < env->tlb->tlb_in_use; i++) {
> +        r4k_tlb_t *tlb = &env->tlb->mmu.r4k.tlb[i];
> +
> +        bool mi = !!((env->CP0_Config5 >> CP0C5_MI) & 1);
> +
> +        qemu_printf("TLB[%i]:\nG = %i EHINV = %i\nPageMask = %08x", i, tlb->G,

Please prefix hexadecimal with 0x.

> +                    tlb->EHINV, tlb->PageMask);
> +        if (!tlb->EHINV) {
> +            if (mi) {
> +                qemu_printf(" MMID = %i", tlb->MMID);
> +            } else if (!tlb->G) {
> +                qemu_printf(" ASID = %i", tlb->ASID);
> +            }
> +            qemu_printf("\nVPN = "TARGET_FMT_lx" PFN[0] = %08lx RI0 = %i"
> +                        " XI0 = %i C0 = %i D0 = %i V0 = %i\n"
> +                        "VPN = "TARGET_FMT_lx" PFN[1] = %08lx RI1 = %i XI1 = %i"
> +                        " C1 = %i D1 = %i V1 = %i\n", tlb->VPN, tlb->PFN[0],
> +                        tlb->RI0, tlb->XI0, tlb->C0, tlb->D0, tlb->V0, tlb->VPN,
> +                        tlb->PFN[1], tlb->RI1, tlb->XI1,
> +                        tlb->C1, tlb->D1, tlb->V1);
> +        }
> +    }
> +}
> +
> +void dump_mmu(CPUMIPSState *env)
> +{
> +    switch (env->cpu_model->mmu_type) {
> +    case MMU_TYPE_NONE:
> +        qemu_printf("no MMU emulation\n");

Maybe "No TLB (no MMU)"

> +        break;
> +    case MMU_TYPE_R4000:
> +        r4k_mmu_dump(env);
> +        break;
> +    case MMU_TYPE_FMT:
> +        qemu_printf("fixed mapping MMU emulation\n");

and "No TLB (fixed mapping MMU)"?

> +        break;
> +    case MMU_TYPE_R3000:
> +    case MMU_TYPE_R6000:
> +    case MMU_TYPE_R8000:
> +    default:
> +        qemu_printf("MMU type not supported\n");

Simply g_assert_not_reached().

> +    }
> +}
> +
>  /* no MMU emulation */
>  int no_mmu_map_address(CPUMIPSState *env, hwaddr *physical, int *prot,
>                         target_ulong address, int rw, int access_type)
> 

