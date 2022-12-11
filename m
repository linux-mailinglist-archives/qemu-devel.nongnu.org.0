Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42298649198
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Dec 2022 01:19:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4A2G-0002eU-UU; Sat, 10 Dec 2022 19:17:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1p4A2F-0002eE-5L
 for qemu-devel@nongnu.org; Sat, 10 Dec 2022 19:17:39 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1p4A2B-0007oM-Ru
 for qemu-devel@nongnu.org; Sat, 10 Dec 2022 19:17:38 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 24582747FAD;
 Sun, 11 Dec 2022 01:16:02 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id AFD9874633D; Sun, 11 Dec 2022 01:16:01 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id ADE1A746307;
 Sun, 11 Dec 2022 01:16:01 +0100 (CET)
Date: Sun, 11 Dec 2022 01:16:01 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>
cc: qemu-devel@nongnu.org, Milica Lazarevic <milica.lazarevic@syrmia.com>, 
 Dragan Mladjenovic <Dragan.Mladjenovic@syrmia.com>, 
 Aurelien Jarno <aurelien@aurel32.net>, 
 Djordje Todorovic <djordje.todorovic@syrmia.com>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Bernhard Beschow <shentey@gmail.com>
Subject: Re: [PATCH-for-8.0 1/7] hw/mips/bootloader: Handle buffers as opaque
 arrays
In-Reply-To: <20221210155502.74609-2-philmd@linaro.org>
Message-ID: <8c25781a-5f18-42e6-3995-ff4ee946f38d@eik.bme.hu>
References: <20221210155502.74609-1-philmd@linaro.org>
 <20221210155502.74609-2-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-107067144-1670717761=:50948"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-107067144-1670717761=:50948
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Sat, 10 Dec 2022, Philippe Mathieu-Daudé wrote:
> It is irrelevant to the API what the buffers to fill are made of.
> In particular, some MIPS ISA have 16-bit wide instructions.
>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
> hw/mips/bootloader.c         | 55 +++++++++++++++++++++---------------
> hw/mips/malta.c              | 19 +++++++------
> include/hw/mips/bootloader.h | 10 +++----
> 3 files changed, 48 insertions(+), 36 deletions(-)
>
> diff --git a/hw/mips/bootloader.c b/hw/mips/bootloader.c
> index f5f42f2bf2..fc14eb0894 100644
> --- a/hw/mips/bootloader.c
> +++ b/hw/mips/bootloader.c
> @@ -55,16 +55,20 @@ static bool bootcpu_supports_isa(uint64_t isa_mask)
> }
>
> /* Base types */
> -static void bl_gen_nop(uint32_t **p)
> +static void bl_gen_nop(void **ptr)
> {
> -    stl_p(*p, 0);
> -    *p = *p + 1;
> +    uint32_t *p = (uint32_t *)*ptr;

Do you need to cast void * ? I thought in C that's not necessary but maybe 
I'm missing why it's needed here.

> +
> +    stl_p(p, 0);
> +    p++;
> +    *ptr = p;

Do you need a cast here though? (You could also combine the ++ either in 
stl_p(p++, 0) or *ptr = ++p but not sure you want to.)

Regards,
BALATON Zoltan

> }
>
> -static void bl_gen_r_type(uint32_t **p, uint8_t opcode,
> +static void bl_gen_r_type(void **ptr, uint8_t opcode,
>                           bl_reg rs, bl_reg rt, bl_reg rd,
>                           uint8_t shift, uint8_t funct)
> {
> +    uint32_t *p = (uint32_t *)*ptr;
>     uint32_t insn = 0;
>
>     insn = deposit32(insn, 26, 6, opcode);
> @@ -74,13 +78,16 @@ static void bl_gen_r_type(uint32_t **p, uint8_t opcode,
>     insn = deposit32(insn, 6, 5, shift);
>     insn = deposit32(insn, 0, 6, funct);
>
> -    stl_p(*p, insn);
> -    *p = *p + 1;
> +    stl_p(p, insn);
> +    p++;
> +
> +    *ptr = p;
> }
>
> -static void bl_gen_i_type(uint32_t **p, uint8_t opcode,
> +static void bl_gen_i_type(void **ptr, uint8_t opcode,
>                           bl_reg rs, bl_reg rt, uint16_t imm)
> {
> +    uint32_t *p = (uint32_t *)*ptr;
>     uint32_t insn = 0;
>
>     insn = deposit32(insn, 26, 6, opcode);
> @@ -88,12 +95,14 @@ static void bl_gen_i_type(uint32_t **p, uint8_t opcode,
>     insn = deposit32(insn, 16, 5, rt);
>     insn = deposit32(insn, 0, 16, imm);
>
> -    stl_p(*p, insn);
> -    *p = *p + 1;
> +    stl_p(p, insn);
> +    p++;
> +
> +    *ptr = p;
> }
>
> /* Single instructions */
> -static void bl_gen_dsll(uint32_t **p, bl_reg rd, bl_reg rt, uint8_t sa)
> +static void bl_gen_dsll(void **p, bl_reg rd, bl_reg rt, uint8_t sa)
> {
>     if (bootcpu_supports_isa(ISA_MIPS3)) {
>         bl_gen_r_type(p, 0, 0, rt, rd, sa, 0x38);
> @@ -102,28 +111,28 @@ static void bl_gen_dsll(uint32_t **p, bl_reg rd, bl_reg rt, uint8_t sa)
>     }
> }
>
> -static void bl_gen_jalr(uint32_t **p, bl_reg rs)
> +static void bl_gen_jalr(void **p, bl_reg rs)
> {
>     bl_gen_r_type(p, 0, rs, 0, BL_REG_RA, 0, 0x09);
> }
>
> -static void bl_gen_lui(uint32_t **p, bl_reg rt, uint16_t imm)
> +static void bl_gen_lui(void **p, bl_reg rt, uint16_t imm)
> {
>     /* R6: It's a alias of AUI with RS = 0 */
>     bl_gen_i_type(p, 0x0f, 0, rt, imm);
> }
>
> -static void bl_gen_ori(uint32_t **p, bl_reg rt, bl_reg rs, uint16_t imm)
> +static void bl_gen_ori(void **p, bl_reg rt, bl_reg rs, uint16_t imm)
> {
>     bl_gen_i_type(p, 0x0d, rs, rt, imm);
> }
>
> -static void bl_gen_sw(uint32_t **p, bl_reg rt, uint8_t base, uint16_t offset)
> +static void bl_gen_sw(void **p, bl_reg rt, uint8_t base, uint16_t offset)
> {
>     bl_gen_i_type(p, 0x2b, base, rt, offset);
> }
>
> -static void bl_gen_sd(uint32_t **p, bl_reg rt, uint8_t base, uint16_t offset)
> +static void bl_gen_sd(void **p, bl_reg rt, uint8_t base, uint16_t offset)
> {
>     if (bootcpu_supports_isa(ISA_MIPS3)) {
>         bl_gen_i_type(p, 0x3f, base, rt, offset);
> @@ -133,13 +142,13 @@ static void bl_gen_sd(uint32_t **p, bl_reg rt, uint8_t base, uint16_t offset)
> }
>
> /* Pseudo instructions */
> -static void bl_gen_li(uint32_t **p, bl_reg rt, uint32_t imm)
> +static void bl_gen_li(void **p, bl_reg rt, uint32_t imm)
> {
>     bl_gen_lui(p, rt, extract32(imm, 16, 16));
>     bl_gen_ori(p, rt, rt, extract32(imm, 0, 16));
> }
>
> -static void bl_gen_dli(uint32_t **p, bl_reg rt, uint64_t imm)
> +static void bl_gen_dli(void **p, bl_reg rt, uint64_t imm)
> {
>     bl_gen_li(p, rt, extract64(imm, 32, 32));
>     bl_gen_dsll(p, rt, rt, 16);
> @@ -148,7 +157,7 @@ static void bl_gen_dli(uint32_t **p, bl_reg rt, uint64_t imm)
>     bl_gen_ori(p, rt, rt, extract64(imm, 0, 16));
> }
>
> -static void bl_gen_load_ulong(uint32_t **p, bl_reg rt, target_ulong imm)
> +static void bl_gen_load_ulong(void **p, bl_reg rt, target_ulong imm)
> {
>     if (bootcpu_supports_isa(ISA_MIPS3)) {
>         bl_gen_dli(p, rt, imm); /* 64bit */
> @@ -158,14 +167,14 @@ static void bl_gen_load_ulong(uint32_t **p, bl_reg rt, target_ulong imm)
> }
>
> /* Helpers */
> -void bl_gen_jump_to(uint32_t **p, target_ulong jump_addr)
> +void bl_gen_jump_to(void **p, target_ulong jump_addr)
> {
>     bl_gen_load_ulong(p, BL_REG_T9, jump_addr);
>     bl_gen_jalr(p, BL_REG_T9);
>     bl_gen_nop(p); /* delay slot */
> }
>
> -void bl_gen_jump_kernel(uint32_t **p,
> +void bl_gen_jump_kernel(void **p,
>                         bool set_sp, target_ulong sp,
>                         bool set_a0, target_ulong a0,
>                         bool set_a1, target_ulong a1,
> @@ -192,7 +201,7 @@ void bl_gen_jump_kernel(uint32_t **p,
>     bl_gen_jump_to(p, kernel_addr);
> }
>
> -void bl_gen_write_ulong(uint32_t **p, target_ulong addr, target_ulong val)
> +void bl_gen_write_ulong(void **p, target_ulong addr, target_ulong val)
> {
>     bl_gen_load_ulong(p, BL_REG_K0, val);
>     bl_gen_load_ulong(p, BL_REG_K1, addr);
> @@ -203,14 +212,14 @@ void bl_gen_write_ulong(uint32_t **p, target_ulong addr, target_ulong val)
>     }
> }
>
> -void bl_gen_write_u32(uint32_t **p, target_ulong addr, uint32_t val)
> +void bl_gen_write_u32(void **p, target_ulong addr, uint32_t val)
> {
>     bl_gen_li(p, BL_REG_K0, val);
>     bl_gen_load_ulong(p, BL_REG_K1, addr);
>     bl_gen_sw(p, BL_REG_K0, BL_REG_K1, 0x0);
> }
>
> -void bl_gen_write_u64(uint32_t **p, target_ulong addr, uint64_t val)
> +void bl_gen_write_u64(void **p, target_ulong addr, uint64_t val)
> {
>     bl_gen_dli(p, BL_REG_K0, val);
>     bl_gen_load_ulong(p, BL_REG_K1, addr);
> diff --git a/hw/mips/malta.c b/hw/mips/malta.c
> index 1f4e0c7acc..944730af98 100644
> --- a/hw/mips/malta.c
> +++ b/hw/mips/malta.c
> @@ -838,6 +838,7 @@ static void write_bootloader(uint8_t *base, uint64_t run_addr,
>                              uint64_t kernel_entry)
> {
>     uint32_t *p;
> +    void *v;
>
>     /* Small bootloader */
>     p = (uint32_t *)base;
> @@ -880,38 +881,39 @@ static void write_bootloader(uint8_t *base, uint64_t run_addr,
> #else
> #define cpu_to_gt32 cpu_to_be32
> #endif
> +    v = p;
>
>     /* move GT64120 registers from 0x14000000 to 0x1be00000 */
> -    bl_gen_write_u32(&p, /* GT_ISD */
> +    bl_gen_write_u32(&v, /* GT_ISD */
>                      cpu_mips_phys_to_kseg1(NULL, 0x14000000 + 0x68),
>                      cpu_to_gt32(0x1be00000 << 3));
>
>     /* setup MEM-to-PCI0 mapping */
>     /* setup PCI0 io window to 0x18000000-0x181fffff */
> -    bl_gen_write_u32(&p, /* GT_PCI0IOLD */
> +    bl_gen_write_u32(&v, /* GT_PCI0IOLD */
>                      cpu_mips_phys_to_kseg1(NULL, 0x1be00000 + 0x48),
>                      cpu_to_gt32(0x18000000 << 3));
> -    bl_gen_write_u32(&p, /* GT_PCI0IOHD */
> +    bl_gen_write_u32(&v, /* GT_PCI0IOHD */
>                      cpu_mips_phys_to_kseg1(NULL, 0x1be00000 + 0x50),
>                      cpu_to_gt32(0x08000000 << 3));
>     /* setup PCI0 mem windows */
> -    bl_gen_write_u32(&p, /* GT_PCI0M0LD */
> +    bl_gen_write_u32(&v, /* GT_PCI0M0LD */
>                      cpu_mips_phys_to_kseg1(NULL, 0x1be00000 + 0x58),
>                      cpu_to_gt32(0x10000000 << 3));
> -    bl_gen_write_u32(&p, /* GT_PCI0M0HD */
> +    bl_gen_write_u32(&v, /* GT_PCI0M0HD */
>                      cpu_mips_phys_to_kseg1(NULL, 0x1be00000 + 0x60),
>                      cpu_to_gt32(0x07e00000 << 3));
>
> -    bl_gen_write_u32(&p, /* GT_PCI0M1LD */
> +    bl_gen_write_u32(&v, /* GT_PCI0M1LD */
>                      cpu_mips_phys_to_kseg1(NULL, 0x1be00000 + 0x80),
>                      cpu_to_gt32(0x18200000 << 3));
> -    bl_gen_write_u32(&p, /* GT_PCI0M1HD */
> +    bl_gen_write_u32(&v, /* GT_PCI0M1HD */
>                      cpu_mips_phys_to_kseg1(NULL, 0x1be00000 + 0x88),
>                      cpu_to_gt32(0x0bc00000 << 3));
>
> #undef cpu_to_gt32
>
> -    bl_gen_jump_kernel(&p,
> +    bl_gen_jump_kernel(&v,
>                        true, ENVP_VADDR - 64,
>                        /*
>                         * If semihosting is used, arguments have already been
> @@ -922,6 +924,7 @@ static void write_bootloader(uint8_t *base, uint64_t run_addr,
>                        true, ENVP_VADDR + 8,
>                        true, loaderparams.ram_low_size,
>                        kernel_entry);
> +    p = (uint32_t *)v;
>
>     /* YAMON subroutines */
>     p = (uint32_t *) (base + 0x800);
> diff --git a/include/hw/mips/bootloader.h b/include/hw/mips/bootloader.h
> index fffb0b7da8..c32f6c2835 100644
> --- a/include/hw/mips/bootloader.h
> +++ b/include/hw/mips/bootloader.h
> @@ -11,16 +11,16 @@
>
> #include "exec/cpu-defs.h"
>
> -void bl_gen_jump_to(uint32_t **p, target_ulong jump_addr);
> -void bl_gen_jump_kernel(uint32_t **p,
> +void bl_gen_jump_to(void **ptr, target_ulong jump_addr);
> +void bl_gen_jump_kernel(void **ptr,
>                         bool set_sp, target_ulong sp,
>                         bool set_a0, target_ulong a0,
>                         bool set_a1, target_ulong a1,
>                         bool set_a2, target_ulong a2,
>                         bool set_a3, target_ulong a3,
>                         target_ulong kernel_addr);
> -void bl_gen_write_ulong(uint32_t **p, target_ulong addr, target_ulong val);
> -void bl_gen_write_u32(uint32_t **p, target_ulong addr, uint32_t val);
> -void bl_gen_write_u64(uint32_t **p, target_ulong addr, uint64_t val);
> +void bl_gen_write_ulong(void **ptr, target_ulong addr, target_ulong val);
> +void bl_gen_write_u32(void **ptr, target_ulong addr, uint32_t val);
> +void bl_gen_write_u64(void **ptr, target_ulong addr, uint64_t val);
>
> #endif
>
--3866299591-107067144-1670717761=:50948--

