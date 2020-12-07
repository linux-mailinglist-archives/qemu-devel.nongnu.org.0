Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9433B2D1867
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 19:22:09 +0100 (CET)
Received: from localhost ([::1]:58804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmL9E-0005U5-L6
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 13:22:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kmL2N-0001TG-SD
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 13:15:03 -0500
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641]:35768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kmL2L-0006KB-W7
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 13:15:03 -0500
Received: by mail-ej1-x641.google.com with SMTP id f23so20869665ejk.2
 for <qemu-devel@nongnu.org>; Mon, 07 Dec 2020 10:15:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0EASB3DKwDfU2PIFaIKcN2biqT2b8yPn0wzOsH2EcHI=;
 b=Sr3xxqfYwjH8E/RsxuGkZMZ71L1uKVmg2x7MT3I7fy1p+VLU5tgF1WyND+cNcBVUaj
 yTOp0sHwG9nkpWaCKXt0ylFciqzXY1Q3sm70yS0LAl/uvDYsGyI0+7HVlTa3bUh5kL9d
 10R80ZHuxvp24tab/9lFay2HQUGLMj0swwC8vMZa3JxxWUvZUgjpNwSoQ3PrivrfmFzj
 fTMoj1AwL2rhopdCHCEL8s2rnzMjdTMwuifqlEYifAeTS9uTN+9s5j4xJqDxwzN4Ocgw
 Tp9q8yJu7ySub0HzrBK3hoZi3H1XFZk98zH4p4BgF2y60YThcPGhswoQk8DOCsslYtmz
 W9qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0EASB3DKwDfU2PIFaIKcN2biqT2b8yPn0wzOsH2EcHI=;
 b=RE8SkDs4Z0kzdXHCEdpMrN6VW4p67kGg/4X9fF/kSNDzm/UM2pKspxX8VynJzCy1aq
 IW/19c4oLO2rqS4C4Rrd0ZdYwnoR6DCoamhMWAy4bYSi7oBmecv5+naky4SIPfzFPOik
 qa8f8qQx4Bvik8QMI+OyZzfyIfP0IH6d24BuvfUjtBuSrc+CQqKl5KVFHn0gT8HbizKt
 TB+W7ZUtGN1BMn09tBiWifgPyTz1/XBA5LR1XGhpTHEtf0/PIhoFDPxFq9MNhyUTC0hb
 wMUl0cahGvq4vqkC9A1vAvUnRrlNdl0xpqhHLoceWf5FY77WwNfCgiWSG9nYflv66uEF
 te6A==
X-Gm-Message-State: AOAM532xdYu5LAmJbql7HcAtnX78N7TtskwlamaP9X6uk+ibNf6QfuX5
 gBo6AHZccy//qUZYHals7Ws=
X-Google-Smtp-Source: ABdhPJyxZNLIVFdDuLL0RwVCyWiDNbsM5sMrCPxyp+z0utsMna1JVeXyBvwbMkk6w6+CpgyCWJM3Ug==
X-Received: by 2002:a17:906:13da:: with SMTP id
 g26mr5528766ejc.285.1607364900567; 
 Mon, 07 Dec 2020 10:15:00 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id gn21sm7744151ejc.27.2020.12.07.10.14.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Dec 2020 10:14:59 -0800 (PST)
Subject: Re: [PATCH 1/5] hw/mips: Add a bootloader helper
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org
References: <20201207050231.2712-1-jiaxun.yang@flygoat.com>
 <20201207050231.2712-2-jiaxun.yang@flygoat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <bcf3aad7-7ff9-fbd5-be99-9f7d20cd614a@amsat.org>
Date: Mon, 7 Dec 2020 19:14:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201207050231.2712-2-jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::641;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x641.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: chenhuacai@kernel.org, paulburton@kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Jiaxun,

On 12/7/20 6:02 AM, Jiaxun Yang wrote:
> Add a bootloader helper to generate simple bootloaders for kernel.
> It can help us reduce inline hex hack and also keep MIPS release 6
> compatibility easier.

Great idea :)

> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  hw/mips/bootloader.c      | 150 ++++++++++++++++++++++++++++++++++++++
>  hw/mips/meson.build       |   2 +-
>  include/hw/mips/cpudevs.h |   8 ++
>  3 files changed, 159 insertions(+), 1 deletion(-)
>  create mode 100644 hw/mips/bootloader.c
> 
> diff --git a/hw/mips/bootloader.c b/hw/mips/bootloader.c
> new file mode 100644
> index 0000000000..3210c26bb7
> --- /dev/null
> +++ b/hw/mips/bootloader.c
> @@ -0,0 +1,150 @@
> +/*
> + * Utility for QEMU MIPS to generate it's simple bootloader
> + *
> + * Instructions used here are carefully selected to keep compatibility with
> + * MIPS Release 6.
> + *
> + * Copyright (C) 2020 Jiaxun Yang <jiaxun.yang@flygoat.com>
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/bitops.h"
> +#include "cpu.h"
> +#include "hw/mips/cpudevs.h"

Please keep the include local, and name it accordingly (bootloader.h).

Also, can you use an enum for the register values to make the code
easier to review?

enum {
    R_a0 = 4,
    R_a1 = 5,
    ...
    R_t0 = 26,
    R_t1 = 27,
    ...
    R_pc = 31,
};

> +
> +/* Base types */
> +static void bl_gen_nop(uint32_t **p)
> +{
> +    stl_p(*p, 0);
> +    *p = *p + 1;
> +}
> +
> +static void bl_gen_r_type(uint32_t **p, uint8_t opcode, uint8_t rs, uint8_t rt,
> +                            uint8_t rd, uint8_t shift, uint8_t funct)
> +{
> +    uint32_t insn = 0;
> +
> +    insn = deposit32(insn, 26, 6, opcode);
> +    insn = deposit32(insn, 21, 5, rs);
> +    insn = deposit32(insn, 16, 5, rt);
> +    insn = deposit32(insn, 11, 5, rd);
> +    insn = deposit32(insn, 6, 5, shift);
> +    insn = deposit32(insn, 0, 6, funct);
> +
> +    stl_p(*p, insn);
> +    *p = *p + 1;
> +}
> +
> +static void bl_gen_i_type(uint32_t **p, uint8_t opcode, uint8_t rs, uint8_t rt,
> +                            uint16_t imm)
> +{
> +    uint32_t insn = 0;
> +
> +    insn = deposit32(insn, 26, 6, opcode);
> +    insn = deposit32(insn, 21, 5, rs);
> +    insn = deposit32(insn, 16, 5, rt);
> +    insn = deposit32(insn, 0, 16, imm);
> +
> +    stl_p(*p, insn);
> +    *p = *p + 1;
> +}
> +
> +/* Single instructions */
> +static void bl_gen_dsll(uint32_t **p, uint8_t rd, uint8_t rt, uint8_t sa)
> +{
> +    /* R6: OK, 32: NO */
> +    bl_gen_r_type(p, 0, 0, rt, rd, sa, 0x38);
> +}

We should convert cpu_supports_isa() as:
bool cpu_supports_isa(MIPSCPU *cpu, uint64_t isa);
so passing a MIPSCPU (or CPUMIPSState) argument, you can do:

static void bl_gen_dsll(MIPSCPU *cpu, uint32_t **p,
                        uint8_t rd, uint8_t rt, uint8_t sa)
{
    if (cpu_supports_isa(cpu, ISA_MIPS32R6 | ISA_MIPS64R6)) {
        bl_gen_r_type(p, 0, 0, rt, rd, sa, 0x38);
    } else {
        g_assert_not_reached(); /* unsupported */
    }
}

> +
> +static void bl_gen_daddiu(uint32_t **p, uint8_t rt, uint8_t rs, uint16_t imm)
> +{
> +    /* R6: OK, 32: NO */

Ditto, etc...

> +    bl_gen_i_type(p, 0x19, rs, rt, imm);
> +}
> +
> +static void bl_gen_jalr(uint32_t **p, uint8_t rs)
> +{
> +    /* R6: OK, 32: OK */
> +    bl_gen_r_type(p, 0, rs, 0, 31, 0, 0x9);
> +}
> +
> +static void bl_gen_lui(uint32_t **p, uint8_t rt, uint16_t imm)
> +{
> +    /* R6: It's a alias of AUI with RS = 0, 32: OK */
> +    bl_gen_i_type(p, 0xf, 0, rt, imm);
> +}
> +
> +static void bl_gen_ori(uint32_t **p, uint8_t rt, uint8_t rs, uint16_t imm)
> +{
> +    /* R6: OK, 32: OK */
> +    bl_gen_i_type(p, 0xd, rs, rt, imm);
> +}
> +
> +static void bl_gen_sw(uint32_t **p, uint8_t rt, uint8_t base, uint16_t offset)
> +{
> +    /* R6: OK, 32: NO */
> +    bl_gen_i_type(p, 0x2b, base, rt, offset);
> +}
> +
> +static void bl_gen_sd(uint32_t **p, uint8_t rt, uint8_t base, uint16_t offset)
> +{
> +    /* R6: OK, 32: NO */
> +    bl_gen_i_type(p, 0x3f, base, rt, offset);
> +}
> +
> +/* Pseudo instructions */
> +static void bl_gen_li(uint32_t **p, uint8_t rt, uint32_t imm)
> +{
> +    /* R6: OK, 32 OK */
> +    bl_gen_lui(p, rt, extract32(imm, 16, 16));
> +    bl_gen_ori(p, rt, rt, extract32(imm, 0, 16));
> +}
> +
> +static void bl_gen_dli(uint32_t **p, uint8_t rt, uint64_t imm)
> +{
> +    /* R6: OK, 32 NO */
> +    bl_gen_li(p, rt, extract64(imm, 32, 32));
> +    bl_gen_dsll(p, rt, rt, 16);
> +    bl_gen_daddiu(p, rt, rt, extract64(imm, 16, 16));
> +    bl_gen_dsll(p, rt, rt, 16);
> +    bl_gen_daddiu(p, rt, rt, extract64(imm, 0, 16));
> +}
> +
> +/* Helpers */
> +void bl_gen_jump_to(uint32_t **p, uint32_t jump_addr)

bl_gen_jump_to_u32?

> +{
> +    /* Use ra to jump */
> +    bl_gen_li(p, 31, jump_addr);
> +    bl_gen_jalr(p, 31);
> +    bl_gen_nop(p); /* delay slot, useless for R6 */
> +}
> +
> +void bl_gen_jump_kernel(uint32_t **p, uint32_t sp, uint32_t a0,
> +                        uint32_t a1, uint32_t a2, uint32_t a3,
> +                        uint32_t kernel_addr)

bl_gen_jump_kernel_u32?

> +{
> +    bl_gen_li(p, 29, sp);
> +    bl_gen_li(p, 4, a0);
> +    bl_gen_li(p, 5, a1);
> +    bl_gen_li(p, 6, a2);
> +    bl_gen_li(p, 7, a3);
> +
> +    bl_gen_jump_to(p, kernel_addr);
> +}
> +
> +void bl_gen_writel(uint32_t **p, uint32_t val, uint32_t addr)

bl_gen_write_u32?

> +{
> +    bl_gen_li(p, 26, val);
> +    bl_gen_li(p, 27, addr);
> +    bl_gen_sw(p, 26, 27, 0x0);
> +}
> +
> +void bl_gen_writeq(uint32_t **p, uint64_t val, uint32_t addr)

Well, addr has to be uint64_t... else you wrap KSEG1 on 64-bit.

bl_gen_write_u64?

> +{
> +    /* 64 Only */

       if (!cpu_supports_isa(cpu, ISA_MIPS64)) {
           g_assert_not_reached(); /* unsupported */
       }

> +    bl_gen_dli(p, 26, val);
> +    bl_gen_li(p, 27, addr);
> +    bl_gen_sd(p, 26, 27, 0x0);
> +}
> diff --git a/hw/mips/meson.build b/hw/mips/meson.build
> index bcdf96be69..053459377f 100644
> --- a/hw/mips/meson.build
> +++ b/hw/mips/meson.build
> @@ -1,5 +1,5 @@
>  mips_ss = ss.source_set()
> -mips_ss.add(files('addr.c', 'mips_int.c'))
> +mips_ss.add(files('addr.c', 'bootloader.c', 'mips_int.c'))
>  mips_ss.add(when: 'CONFIG_FULOONG', if_true: files('fuloong2e.c'))
>  mips_ss.add(when: 'CONFIG_JAZZ', if_true: files('jazz.c'))
>  mips_ss.add(when: 'CONFIG_MALTA', if_true: files('gt64xxx_pci.c', 'malta.c'))
> diff --git a/include/hw/mips/cpudevs.h b/include/hw/mips/cpudevs.h
> index 291f59281a..0b3e060c95 100644
> --- a/include/hw/mips/cpudevs.h
> +++ b/include/hw/mips/cpudevs.h
> @@ -12,6 +12,14 @@ uint64_t cpu_mips_kvm_um_phys_to_kseg0(void *opaque, uint64_t addr);
>  bool mips_um_ksegs_enabled(void);
>  void mips_um_ksegs_enable(void);
>  
> +/* bootloader.c */

Not related to CPU internal devices, add to hw/mips/bootloader.h.

> +void bl_gen_jump_to(uint32_t **p, uint32_t jump_addr);
> +void bl_gen_jump_kernel(uint32_t **p, uint32_t sp, uint32_t a0,
> +                        uint32_t a1, uint32_t a2, uint32_t a3,
> +                        uint32_t kernel_addr);
> +void bl_gen_writel(uint32_t **p, uint32_t val, uint32_t addr);
> +void bl_gen_writeq(uint32_t **p, uint64_t val, uint32_t addr);
> +
>  /* mips_int.c */
>  void cpu_mips_irq_init_cpu(MIPSCPU *cpu);
>  
> 

