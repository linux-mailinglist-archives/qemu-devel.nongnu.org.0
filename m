Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 789BA50C904
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Apr 2022 12:07:56 +0200 (CEST)
Received: from localhost ([::1]:39998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1niCgF-0002zV-4l
	for lists+qemu-devel@lfdr.de; Sat, 23 Apr 2022 06:07:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1niCdk-00021s-9P; Sat, 23 Apr 2022 06:05:20 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:50803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1niCdh-0004ug-R8; Sat, 23 Apr 2022 06:05:19 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id D308D746399;
 Sat, 23 Apr 2022 12:05:12 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 83DD8746397; Sat, 23 Apr 2022 12:05:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 814B974632B;
 Sat, 23 Apr 2022 12:05:12 +0200 (CEST)
Date: Sat, 23 Apr 2022 12:05:12 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?V=EDctor_Colombo?= <victor.colombo@eldorado.org.br>
Subject: Re: [PATCH 04/20] target/ppc: Substitute msr_le macro with new
 M_MSR_LE macro
In-Reply-To: <20220422185450.107256-5-victor.colombo@eldorado.org.br>
Message-ID: <7032c7ad-6fed-196a-75c4-502d76c7b533@eik.bme.hu>
References: <20220422185450.107256-1-victor.colombo@eldorado.org.br>
 <20220422185450.107256-5-victor.colombo@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-2029831383-1650708312=:96653"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: danielhb413@gmail.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 groug@kaod.org, qemu-ppc@nongnu.org, clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-2029831383-1650708312=:96653
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Fri, 22 Apr 2022, Víctor Colombo wrote:
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
> ---
> target/ppc/cpu.h        |  2 +-
> target/ppc/cpu_init.c   |  2 +-
> target/ppc/gdbstub.c    |  2 +-
> target/ppc/mem_helper.c | 16 ++++++++--------
> 4 files changed, 11 insertions(+), 11 deletions(-)
>
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index 2ad023e981..d25a778b7c 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -354,6 +354,7 @@ typedef enum {
> #define MSR_LE   0  /* Little-endian mode                           1 hflags */
>
> #define M_MSR_PR (1ull << MSR_PR)
> +#define M_MSR_LE (1ull << MSR_LE)

We have BIT(nr) and BIT_ULL(nr) macros for this. Would it be simpler to 
use that instead of adding another set of defines? (Both ways are somewhat 
comfusing and needs care when to use which so I'm not sure the additional 
define makes it simpler or not.) We even have PPC_BIT(bit) macro which 
follows the numbering used in the docs (which is big endian/backwards) but 
these bits are not numbered that way here. Is it worth fixing it to match 
docs? That might cause trouble elsewhere where current defines are used 
though or in case of FPSCR the numbering is not even the same in docs for 
32 bit and 64 bit so at least in that case keeping the current numbering 
may be simpler.

Regards,
BALATON Zoltan

> /* PMU bits */
> #define MMCR0_FC     PPC_BIT(32)         /* Freeze Counters  */
> @@ -484,7 +485,6 @@ typedef enum {
> #define msr_ir   ((env->msr >> MSR_IR)   & 1)
> #define msr_dr   ((env->msr >> MSR_DR)   & 1)
> #define msr_ds   ((env->msr >> MSR_DS)   & 1)
> -#define msr_le   ((env->msr >> MSR_LE)   & 1)
> #define msr_ts   ((env->msr >> MSR_TS1)  & 3)
>
> #define DBCR0_ICMP (1 << 27)
> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index 6e2b23a859..9dddc0e8f6 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -7210,7 +7210,7 @@ static bool ppc_cpu_is_big_endian(CPUState *cs)
>
>     cpu_synchronize_state(cs);
>
> -    return !msr_le;
> +    return !(env->msr & M_MSR_LE);
> }
>
> #ifdef CONFIG_TCG
> diff --git a/target/ppc/gdbstub.c b/target/ppc/gdbstub.c
> index 1252429a2a..df1dcd90f0 100644
> --- a/target/ppc/gdbstub.c
> +++ b/target/ppc/gdbstub.c
> @@ -95,7 +95,7 @@ static int ppc_gdb_register_len(int n)
> void ppc_maybe_bswap_register(CPUPPCState *env, uint8_t *mem_buf, int len)
> {
> #ifndef CONFIG_USER_ONLY
> -    if (!msr_le) {
> +    if (!(env->msr & M_MSR_LE)) {
>         /* do nothing */
>     } else if (len == 4) {
>         bswap32s((uint32_t *)mem_buf);
> diff --git a/target/ppc/mem_helper.c b/target/ppc/mem_helper.c
> index bd219e9c9c..8ff99a6568 100644
> --- a/target/ppc/mem_helper.c
> +++ b/target/ppc/mem_helper.c
> @@ -33,9 +33,9 @@
> static inline bool needs_byteswap(const CPUPPCState *env)
> {
> #if TARGET_BIG_ENDIAN
> -  return msr_le;
> +  return env->msr & M_MSR_LE;
> #else
> -  return !msr_le;
> +  return !(env->msr & M_MSR_LE);
> #endif
> }
>
> @@ -470,8 +470,8 @@ uint32_t helper_stqcx_be_parallel(CPUPPCState *env, target_ulong addr,
> #endif
>
> /*
> - * We use msr_le to determine index ordering in a vector.  However,
> - * byteswapping is not simply controlled by msr_le.  We also need to
> + * We use MSR_LE to determine index ordering in a vector.  However,
> + * byteswapping is not simply controlled by MSR_LE.  We also need to
>  * take into account endianness of the target.  This is done for the
>  * little-endian PPC64 user-mode target.
>  */
> @@ -484,7 +484,7 @@ uint32_t helper_stqcx_be_parallel(CPUPPCState *env, target_ulong addr,
>         int adjust = HI_IDX * (n_elems - 1);                    \
>         int sh = sizeof(r->element[0]) >> 1;                    \
>         int index = (addr & 0xf) >> sh;                         \
> -        if (msr_le) {                                           \
> +        if (env->msr & M_MSR_LE) {                              \
>             index = n_elems - index - 1;                        \
>         }                                                       \
>                                                                 \
> @@ -511,7 +511,7 @@ LVE(lvewx, cpu_ldl_data_ra, bswap32, u32)
>         int adjust = HI_IDX * (n_elems - 1);                            \
>         int sh = sizeof(r->element[0]) >> 1;                            \
>         int index = (addr & 0xf) >> sh;                                 \
> -        if (msr_le) {                                                   \
> +        if (env->msr & M_MSR_LE) {                                      \
>             index = n_elems - index - 1;                                \
>         }                                                               \
>                                                                         \
> @@ -545,7 +545,7 @@ void helper_##name(CPUPPCState *env, target_ulong addr,                 \
>     t.s128 = int128_zero();                                             \
>     if (nb) {                                                           \
>         nb = (nb >= 16) ? 16 : nb;                                      \
> -        if (msr_le && !lj) {                                            \
> +        if ((env->msr & M_MSR_LE) && !lj) {                             \
>             for (i = 16; i > 16 - nb; i--) {                            \
>                 t.VsrB(i - 1) = cpu_ldub_data_ra(env, addr, GETPC());   \
>                 addr = addr_add(env, addr, 1);                          \
> @@ -576,7 +576,7 @@ void helper_##name(CPUPPCState *env, target_ulong addr,           \
>     }                                                             \
>                                                                   \
>     nb = (nb >= 16) ? 16 : nb;                                    \
> -    if (msr_le && !lj) {                                          \
> +    if ((env->msr & M_MSR_LE) && !lj) {                           \
>         for (i = 16; i > 16 - nb; i--) {                          \
>             cpu_stb_data_ra(env, addr, xt->VsrB(i - 1), GETPC()); \
>             addr = addr_add(env, addr, 1);                        \
>
--3866299591-2029831383-1650708312=:96653--

