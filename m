Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23ED55652F3
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 13:01:50 +0200 (CEST)
Received: from localhost ([::1]:33404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8Jpr-00086x-W9
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 07:01:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1o8Jnf-0007Mr-US
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 06:59:31 -0400
Received: from mail.ispras.ru ([83.149.199.84]:47160)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1o8Jnd-0001ij-OG
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 06:59:31 -0400
Received: from [10.12.102.111] (unknown [85.142.117.226])
 by mail.ispras.ru (Postfix) with ESMTPSA id 437C140D403D;
 Mon,  4 Jul 2022 10:59:01 +0000 (UTC)
Message-ID: <36303c3f-14ee-478b-855f-0dddbfb26f3f@ispras.ru>
Date: Mon, 4 Jul 2022 13:59:01 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v3 4/4] target/mips: introduce Cavium Octeon CPU model
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: f4bug@amsat.org, jiaxun.yang@flygoat.com, aurelien@aurel32.net,
 aleksandar.rikalo@syrmia.com
References: <165572671617.167724.12940170194930233873.stgit@pasha-ThinkPad-X280>
 <165572673785.167724.7604881144978983510.stgit@pasha-ThinkPad-X280>
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
In-Reply-To: <165572673785.167724.7604881144978983510.stgit@pasha-ThinkPad-X280>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=83.149.199.84;
 envelope-from=pavel.dovgalyuk@ispras.ru; helo=mail.ispras.ru
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ping

This is the only non-reviewed patch in the series.

On 20.06.2022 15:05, Pavel Dovgalyuk wrote:
> This patch adds Cavium Octeon 68XX vCPU which provides
> Octeon-specific instructions.
> 
> Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
> 
> --
> v3 changes:
>   - split the patch to instruction set introduction and new vCPU
>     (suggested by Philippe Mathieu-Daudé)
> v2 changes:
>   - vCPU name changed to Octeon68XX (suggested by Richard Henderson)
> ---
>   target/mips/cpu-defs.c.inc |   28 ++++++++++++++++++++++++++++
>   1 file changed, 28 insertions(+)
> 
> diff --git a/target/mips/cpu-defs.c.inc b/target/mips/cpu-defs.c.inc
> index 582f940070..7f53c94ec8 100644
> --- a/target/mips/cpu-defs.c.inc
> +++ b/target/mips/cpu-defs.c.inc
> @@ -921,6 +921,34 @@ const mips_def_t mips_defs[] =
>           .insn_flags = CPU_MIPS64R2 | ASE_DSP | ASE_DSP_R2,
>           .mmu_type = MMU_TYPE_R4000,
>       },
> +    {
> +        /*
> +         * Octeon 68xx with MIPS64 Cavium Octeon features.
> +         */
> +        .name = "Octeon68XX",
> +        .CP0_PRid = 0x000D9100,
> +        .CP0_Config0 = MIPS_CONFIG0 | (0x1 << CP0C0_AR) | (0x2 << CP0C0_AT) |
> +                       (MMU_TYPE_R4000 << CP0C0_MT),
> +        .CP0_Config1 = MIPS_CONFIG1 | (0x3F << CP0C1_MMU) |
> +                       (1 << CP0C1_IS) | (4 << CP0C1_IL) | (1 << CP0C1_IA) |
> +                       (1 << CP0C1_DS) | (4 << CP0C1_DL) | (1 << CP0C1_DA) |
> +                       (1 << CP0C1_PC) | (1 << CP0C1_WR) | (1 << CP0C1_EP),
> +        .CP0_Config2 = MIPS_CONFIG2,
> +        .CP0_Config3 = MIPS_CONFIG3 | (1 << CP0C3_LPA) | (1 << CP0C3_DSPP) ,
> +        .CP0_Config4 = MIPS_CONFIG4 | (1U << CP0C4_M) |
> +                       (0x3c << CP0C4_KScrExist) | (1U << CP0C4_MMUExtDef) |
> +                       (3U << CP0C4_MMUSizeExt),
> +        .CP0_LLAddr_rw_bitmask = 0,
> +        .CP0_LLAddr_shift = 4,
> +        .CP0_PageGrain = (1 << CP0PG_ELPA),
> +        .SYNCI_Step = 32,
> +        .CCRes = 2,
> +        .CP0_Status_rw_bitmask = 0x12F8FFFF,
> +        .SEGBITS = 42,
> +        .PABITS = 49,
> +        .insn_flags = CPU_MIPS64R2 | INSN_OCTEON | ASE_DSP,
> +        .mmu_type = MMU_TYPE_R4000,
> +    },
>   
>   #endif
>   };
> 


