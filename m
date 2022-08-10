Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2193958ED46
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 15:31:02 +0200 (CEST)
Received: from localhost ([::1]:47736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLlnY-0000LR-OC
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 09:31:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oLlNJ-0008V8-QZ
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 09:03:55 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:45901)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oLlNG-0001oM-Dy
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 09:03:53 -0400
Received: by mail-ej1-x635.google.com with SMTP id dc19so27522675ejb.12
 for <qemu-devel@nongnu.org>; Wed, 10 Aug 2022 06:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc;
 bh=SNXDEcBeEU+OLP/I1h0gb9VSH/DEn6oaQZwqoJFv40I=;
 b=sxlvSEdv9rAYCTyiG5+m9uGhZ4ITcCTdJrV84ipXajCYbX7HMKc7YCp5YtiRO8JrkQ
 L+K0jWWRdb6yVqlYJa/i3vyqegQaekPauP3eZdCgNzeOYNt3QNl6lJJU66Vf4v8E5uwC
 Dzx1bn++QjJBlcoTPc27qtemDcojGPJd8Btb+qTcNg0UdO+dujs+lAcwXeHaqq9jLjtx
 izgglMTxxQ9NINdawUYcLvpi19LKw5m5w3hEpsI/QlaDBx4sDsJHvtqCS/vAgeLUNew8
 tjkWRW67VpNY3Eci3y1WsDhwRB/NFL/jDQpmOpLfoAQ/+2K3R+XkfmHROPVHnEwayPwj
 Fvkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc; bh=SNXDEcBeEU+OLP/I1h0gb9VSH/DEn6oaQZwqoJFv40I=;
 b=cydCcU1RNHQYsmWMZg0TBo0kxU9Uk4Lcq3HNH4WxguVBgf5TWIcLLHIMGatPP1cu0J
 /mlfJjBOMI8pzo6CaF1hPKnSf7hcyLQagw4FZiKP7lVN7Im/yzwctTElACnvAWIHDcPT
 sEE8ujSxBxBGpgVe4MWOTVe9/qTn/rbhc8ZpNF74iJUs3h89x/aeMKssM3036Qz4KJQa
 4Lx/B8J7s6R4tI+Re7CSJaweOtEUsz9JNTca9jyparSK7VWe6kOk/oJO+rBtZ5I2BpUe
 ptF8mXV/da+fXdmI8CbIfHiWNaqJwpyFwTW9jLV/wvuqKHhGI0+k+hISFzqxJbdsEKq6
 qjvg==
X-Gm-Message-State: ACgBeo04Ot2dboNDqvnNx8CbkBtKBRuvBENNAbxb62d2pTJ/HSsjINgc
 r+smp163oIsiVgw1nvMJxyuam3txV5Lrnw==
X-Google-Smtp-Source: AA6agR4hb0OQ1nR/Hb/QeBFuyalbCQYKtaTjF0Wg9zFZv8d/PJaNVE4rYdZUs6ejAx0VJkylew9ZDw==
X-Received: by 2002:a17:907:2c5b:b0:730:da23:5b58 with SMTP id
 hf27-20020a1709072c5b00b00730da235b58mr20129555ejc.123.1660136623615; 
 Wed, 10 Aug 2022 06:03:43 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 ew12-20020a056402538c00b0043bbbaa323dsm7580611edb.0.2022.08.10.06.03.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 06:03:42 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3BD191FFB7;
 Wed, 10 Aug 2022 14:03:42 +0100 (BST)
References: <20220703082419.770989-1-richard.henderson@linaro.org>
 <20220703082419.770989-9-richard.henderson@linaro.org>
User-agent: mu4e 1.8.8; emacs 28.1.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [PATCH 08/62] target/arm: Create GetPhysAddrResult
Date: Wed, 10 Aug 2022 14:02:20 +0100
In-reply-to: <20220703082419.770989-9-richard.henderson@linaro.org>
Message-ID: <87zggcmes1.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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


Richard Henderson <richard.henderson@linaro.org> writes:

> Combine 5 output pointer argument from get_phys_addr
> into a single struct.  Adjust all callers.

This looks to be an improvement - I guess the real benefit is the
compiler isn't jamming so many closely aligned pointers on the stack
frame for all the return values?

>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/internals.h  |  13 ++++-
>  target/arm/helper.c     |  27 ++++-----
>  target/arm/m_helper.c   |  52 +++++------------
>  target/arm/ptw.c        | 125 +++++++++++++++++++++-------------------
>  target/arm/tlb_helper.c |  26 ++++-----
>  5 files changed, 113 insertions(+), 130 deletions(-)
>
> diff --git a/target/arm/internals.h b/target/arm/internals.h
> index 268c3c7380..7d08917f88 100644
> --- a/target/arm/internals.h
> +++ b/target/arm/internals.h
> @@ -1133,11 +1133,18 @@ typedef struct ARMCacheAttrs {
>      bool guarded:1;              /* guarded bit of the v8-64 PTE */
>  } ARMCacheAttrs;
>=20=20
> +/* Fields that are valid upon success. */
> +typedef struct GetPhysAddrResult {
> +    hwaddr phys;
> +    target_ulong page_size;
> +    int prot;
> +    MemTxAttrs attrs;
> +    ARMCacheAttrs cacheattrs;
> +} GetPhysAddrResult;
> +
>  bool get_phys_addr(CPUARMState *env, target_ulong address,
>                     MMUAccessType access_type, ARMMMUIdx mmu_idx,
> -                   hwaddr *phys_ptr, MemTxAttrs *attrs, int *prot,
> -                   target_ulong *page_size,
> -                   ARMMMUFaultInfo *fi, ARMCacheAttrs *cacheattrs)
> +                   GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
>      __attribute__((nonnull));
>=20=20
>  void arm_log_exception(CPUState *cs);
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index f6dcb1a115..fb13e0f4c0 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -3173,24 +3173,19 @@ static CPAccessResult ats_access(CPUARMState *env=
, const ARMCPRegInfo *ri,
>  static uint64_t do_ats_write(CPUARMState *env, uint64_t value,
>                               MMUAccessType access_type, ARMMMUIdx mmu_id=
x)
>  {
> -    hwaddr phys_addr;
> -    target_ulong page_size;
> -    int prot;
>      bool ret;
>      uint64_t par64;
>      bool format64 =3D false;
> -    MemTxAttrs attrs =3D {};
>      ARMMMUFaultInfo fi =3D {};
> -    ARMCacheAttrs cacheattrs =3D {};
> +    GetPhysAddrResult res =3D {};
>=20=20
> -    ret =3D get_phys_addr(env, value, access_type, mmu_idx, &phys_addr, =
&attrs,
> -                        &prot, &page_size, &fi, &cacheattrs);
> +    ret =3D get_phys_addr(env, value, access_type, mmu_idx, &res, &fi);
>=20=20
>      /*
>       * ATS operations only do S1 or S1+S2 translations, so we never
>       * have to deal with the ARMCacheAttrs format for S2 only.
>       */
> -    assert(!cacheattrs.is_s2_format);
> +    assert(!res.cacheattrs.is_s2_format);
>=20=20
>      if (ret) {
>          /*
> @@ -3296,12 +3291,12 @@ static uint64_t do_ats_write(CPUARMState *env, ui=
nt64_t value,
>          /* Create a 64-bit PAR */
>          par64 =3D (1 << 11); /* LPAE bit always set */
>          if (!ret) {
> -            par64 |=3D phys_addr & ~0xfffULL;
> -            if (!attrs.secure) {
> +            par64 |=3D res.phys & ~0xfffULL;
> +            if (!res.attrs.secure) {
>                  par64 |=3D (1 << 9); /* NS */
>              }
> -            par64 |=3D (uint64_t)cacheattrs.attrs << 56; /* ATTR */
> -            par64 |=3D cacheattrs.shareability << 7; /* SH */
> +            par64 |=3D (uint64_t)res.cacheattrs.attrs << 56; /* ATTR */
> +            par64 |=3D res.cacheattrs.shareability << 7; /* SH */
>          } else {
>              uint32_t fsr =3D arm_fi_to_lfsc(&fi);
>=20=20
> @@ -3321,13 +3316,13 @@ static uint64_t do_ats_write(CPUARMState *env, ui=
nt64_t value,
>           */
>          if (!ret) {
>              /* We do not set any attribute bits in the PAR */
> -            if (page_size =3D=3D (1 << 24)
> +            if (res.page_size =3D=3D (1 << 24)
>                  && arm_feature(env, ARM_FEATURE_V7)) {
> -                par64 =3D (phys_addr & 0xff000000) | (1 << 1);
> +                par64 =3D (res.phys & 0xff000000) | (1 << 1);
>              } else {
> -                par64 =3D phys_addr & 0xfffff000;
> +                par64 =3D res.phys & 0xfffff000;
>              }
> -            if (!attrs.secure) {
> +            if (!res.attrs.secure) {
>                  par64 |=3D (1 << 9); /* NS */
>              }
>          } else {
> diff --git a/target/arm/m_helper.c b/target/arm/m_helper.c
> index 308610f6b4..84c6796b8d 100644
> --- a/target/arm/m_helper.c
> +++ b/target/arm/m_helper.c
> @@ -183,19 +183,14 @@ static bool v7m_stack_write(ARMCPU *cpu, uint32_t a=
ddr, uint32_t value,
>  {
>      CPUState *cs =3D CPU(cpu);
>      CPUARMState *env =3D &cpu->env;
> -    MemTxAttrs attrs =3D {};
>      MemTxResult txres;
> -    target_ulong page_size;
> -    hwaddr physaddr;
> -    int prot;
> +    GetPhysAddrResult res =3D {};
>      ARMMMUFaultInfo fi =3D {};
> -    ARMCacheAttrs cacheattrs =3D {};
>      bool secure =3D mmu_idx & ARM_MMU_IDX_M_S;
>      int exc;
>      bool exc_secure;
>=20=20
> -    if (get_phys_addr(env, addr, MMU_DATA_STORE, mmu_idx, &physaddr,
> -                      &attrs, &prot, &page_size, &fi, &cacheattrs)) {
> +    if (get_phys_addr(env, addr, MMU_DATA_STORE, mmu_idx, &res, &fi)) {
>          /* MPU/SAU lookup failed */
>          if (fi.type =3D=3D ARMFault_QEMU_SFault) {
>              if (mode =3D=3D STACK_LAZYFP) {
> @@ -228,8 +223,8 @@ static bool v7m_stack_write(ARMCPU *cpu, uint32_t add=
r, uint32_t value,
>          }
>          goto pend_fault;
>      }
> -    address_space_stl_le(arm_addressspace(cs, attrs), physaddr, value,
> -                         attrs, &txres);
> +    address_space_stl_le(arm_addressspace(cs, res.attrs), res.phys, valu=
e,
> +                         res.attrs, &txres);
>      if (txres !=3D MEMTX_OK) {
>          /* BusFault trying to write the data */
>          if (mode =3D=3D STACK_LAZYFP) {
> @@ -276,20 +271,15 @@ static bool v7m_stack_read(ARMCPU *cpu, uint32_t *d=
est, uint32_t addr,
>  {
>      CPUState *cs =3D CPU(cpu);
>      CPUARMState *env =3D &cpu->env;
> -    MemTxAttrs attrs =3D {};
>      MemTxResult txres;
> -    target_ulong page_size;
> -    hwaddr physaddr;
> -    int prot;
> +    GetPhysAddrResult res =3D {};
>      ARMMMUFaultInfo fi =3D {};
> -    ARMCacheAttrs cacheattrs =3D {};
>      bool secure =3D mmu_idx & ARM_MMU_IDX_M_S;
>      int exc;
>      bool exc_secure;
>      uint32_t value;
>=20=20
> -    if (get_phys_addr(env, addr, MMU_DATA_LOAD, mmu_idx, &physaddr,
> -                      &attrs, &prot, &page_size, &fi, &cacheattrs)) {
> +    if (get_phys_addr(env, addr, MMU_DATA_LOAD, mmu_idx, &res, &fi)) {
>          /* MPU/SAU lookup failed */
>          if (fi.type =3D=3D ARMFault_QEMU_SFault) {
>              qemu_log_mask(CPU_LOG_INT,
> @@ -308,8 +298,8 @@ static bool v7m_stack_read(ARMCPU *cpu, uint32_t *des=
t, uint32_t addr,
>          goto pend_fault;
>      }
>=20=20
> -    value =3D address_space_ldl(arm_addressspace(cs, attrs), physaddr,
> -                              attrs, &txres);
> +    value =3D address_space_ldl(arm_addressspace(cs, res.attrs), res.phy=
s,
> +                              res.attrs, &txres);
>      if (txres !=3D MEMTX_OK) {
>          /* BusFault trying to read the data */
>          qemu_log_mask(CPU_LOG_INT, "...BusFault with BFSR.UNSTKERR\n");
> @@ -2008,13 +1998,9 @@ static bool v7m_read_half_insn(ARMCPU *cpu, ARMMMU=
Idx mmu_idx,
>      CPUState *cs =3D CPU(cpu);
>      CPUARMState *env =3D &cpu->env;
>      V8M_SAttributes sattrs =3D {};
> -    MemTxAttrs attrs =3D {};
> +    GetPhysAddrResult res =3D {};
>      ARMMMUFaultInfo fi =3D {};
> -    ARMCacheAttrs cacheattrs =3D {};
>      MemTxResult txres;
> -    target_ulong page_size;
> -    hwaddr physaddr;
> -    int prot;
>=20=20
>      v8m_security_lookup(env, addr, MMU_INST_FETCH, mmu_idx, &sattrs);
>      if (!sattrs.nsc || sattrs.ns) {
> @@ -2028,16 +2014,15 @@ static bool v7m_read_half_insn(ARMCPU *cpu, ARMMM=
UIdx mmu_idx,
>                        "...really SecureFault with SFSR.INVEP\n");
>          return false;
>      }
> -    if (get_phys_addr(env, addr, MMU_INST_FETCH, mmu_idx, &physaddr,
> -                      &attrs, &prot, &page_size, &fi, &cacheattrs)) {
> +    if (get_phys_addr(env, addr, MMU_INST_FETCH, mmu_idx, &res, &fi)) {
>          /* the MPU lookup failed */
>          env->v7m.cfsr[env->v7m.secure] |=3D R_V7M_CFSR_IACCVIOL_MASK;
>          armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_MEM, env->v7m.sec=
ure);
>          qemu_log_mask(CPU_LOG_INT, "...really MemManage with CFSR.IACCVI=
OL\n");
>          return false;
>      }
> -    *insn =3D address_space_lduw_le(arm_addressspace(cs, attrs), physadd=
r,
> -                                 attrs, &txres);
> +    *insn =3D address_space_lduw_le(arm_addressspace(cs, res.attrs), res=
.phys,
> +                                  res.attrs, &txres);
>      if (txres !=3D MEMTX_OK) {
>          env->v7m.cfsr[M_REG_NS] |=3D R_V7M_CFSR_IBUSERR_MASK;
>          armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_BUS, false);
> @@ -2060,17 +2045,12 @@ static bool v7m_read_sg_stack_word(ARMCPU *cpu, A=
RMMMUIdx mmu_idx,
>       */
>      CPUState *cs =3D CPU(cpu);
>      CPUARMState *env =3D &cpu->env;
> -    MemTxAttrs attrs =3D {};
>      MemTxResult txres;
> -    target_ulong page_size;
> -    hwaddr physaddr;
> -    int prot;
> +    GetPhysAddrResult res =3D {};
>      ARMMMUFaultInfo fi =3D {};
> -    ARMCacheAttrs cacheattrs =3D {};
>      uint32_t value;
>=20=20
> -    if (get_phys_addr(env, addr, MMU_DATA_LOAD, mmu_idx, &physaddr,
> -                      &attrs, &prot, &page_size, &fi, &cacheattrs)) {
> +    if (get_phys_addr(env, addr, MMU_DATA_LOAD, mmu_idx, &res, &fi)) {
>          /* MPU/SAU lookup failed */
>          if (fi.type =3D=3D ARMFault_QEMU_SFault) {
>              qemu_log_mask(CPU_LOG_INT,
> @@ -2088,8 +2068,8 @@ static bool v7m_read_sg_stack_word(ARMCPU *cpu, ARM=
MMUIdx mmu_idx,
>          }
>          return false;
>      }
> -    value =3D address_space_ldl(arm_addressspace(cs, attrs), physaddr,
> -                              attrs, &txres);
> +    value =3D address_space_ldl(arm_addressspace(cs, res.attrs), res.phy=
s,
> +                              res.attrs, &txres);
>      if (txres !=3D MEMTX_OK) {
>          /* BusFault trying to read the data */
>          qemu_log_mask(CPU_LOG_INT,
> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
> index 204c820026..1a946f3757 100644
> --- a/target/arm/ptw.c
> +++ b/target/arm/ptw.c
> @@ -2296,18 +2296,12 @@ static ARMCacheAttrs combine_cacheattrs(CPUARMSta=
te *env,
>   * @address: virtual address to get physical address for
>   * @access_type: 0 for read, 1 for write, 2 for execute
>   * @mmu_idx: MMU index indicating required translation regime
> - * @phys_ptr: set to the physical address corresponding to the virtual a=
ddress
> - * @attrs: set to the memory transaction attributes to use
> - * @prot: set to the permissions for the page containing phys_ptr
> - * @page_size: set to the size of the page containing phys_ptr
> + * @result: set on translation success.
>   * @fi: set to fault info if the translation fails
> - * @cacheattrs: (if non-NULL) set to the cacheability/shareability attri=
butes
>   */
>  bool get_phys_addr(CPUARMState *env, target_ulong address,
>                     MMUAccessType access_type, ARMMMUIdx mmu_idx,
> -                   hwaddr *phys_ptr, MemTxAttrs *attrs, int *prot,
> -                   target_ulong *page_size,
> -                   ARMMMUFaultInfo *fi, ARMCacheAttrs *cacheattrs)
> +                   GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
>  {
>      ARMMMUIdx s1_mmu_idx =3D stage_1_mmu_idx(mmu_idx);
>=20=20
> @@ -2318,43 +2312,53 @@ bool get_phys_addr(CPUARMState *env, target_ulong=
 address,
>           */
>          if (arm_feature(env, ARM_FEATURE_EL2)) {
>              hwaddr ipa;
> -            int s2_prot;
> +            int s1_prot;
>              int ret;
>              bool ipa_secure;
> -            ARMCacheAttrs cacheattrs2 =3D {};
> +            ARMCacheAttrs cacheattrs1;
>              ARMMMUIdx s2_mmu_idx;
>              bool is_el0;
>=20=20
> -            ret =3D get_phys_addr(env, address, access_type, s1_mmu_idx,=
 &ipa,
> -                                attrs, prot, page_size, fi, cacheattrs);
> +            ret =3D get_phys_addr(env, address, access_type, s1_mmu_idx,
> +                                result, fi);
>=20=20
>              /* If S1 fails or S2 is disabled, return early.  */
>              if (ret || regime_translation_disabled(env, ARMMMUIdx_Stage2=
)) {
> -                *phys_ptr =3D ipa;
>                  return ret;
>              }
>=20=20
> -            ipa_secure =3D attrs->secure;
> +            ipa =3D result->phys;
> +            ipa_secure =3D result->attrs.secure;
>              if (arm_is_secure_below_el3(env)) {
> -                if (ipa_secure) {
> -                    attrs->secure =3D !(env->cp15.vstcr_el2.raw_tcr & VS=
TCR_SW);
> -                } else {
> -                    attrs->secure =3D !(env->cp15.vtcr_el2.raw_tcr & VTC=
R_NSW);
> -                }
> +                result->attrs.secure =3D
> +                    (ipa_secure
> +                     ? !(env->cp15.vstcr_el2.raw_tcr & VSTCR_SW)
> +                     : !(env->cp15.vtcr_el2.raw_tcr & VTCR_NSW));
>              } else {
>                  assert(!ipa_secure);
>              }
>=20=20
> -            s2_mmu_idx =3D attrs->secure ? ARMMMUIdx_Stage2_S : ARMMMUId=
x_Stage2;
> +            s2_mmu_idx =3D (result->attrs.secure
> +                          ? ARMMMUIdx_Stage2_S : ARMMMUIdx_Stage2);
>              is_el0 =3D mmu_idx =3D=3D ARMMMUIdx_E10_0 || mmu_idx =3D=3D =
ARMMMUIdx_SE10_0;
>=20=20
> -            /* S1 is done. Now do S2 translation.  */
> +            /*
> +             * S1 is done, now do S2 translation.
> +             * Save the stage1 results so that we may merge
> +             * prot and cacheattrs later.
> +             */
> +            s1_prot =3D result->prot;
> +            cacheattrs1 =3D result->cacheattrs;
> +            memset(result, 0, sizeof(*result));
> +
>              ret =3D get_phys_addr_lpae(env, ipa, access_type, s2_mmu_idx=
, is_el0,
> -                                     phys_ptr, attrs, &s2_prot,
> -                                     page_size, fi, &cacheattrs2);
> +                                     &result->phys, &result->attrs,
> +                                     &result->prot, &result->page_size,
> +                                     fi, &result->cacheattrs);
>              fi->s2addr =3D ipa;
> +
>              /* Combine the S1 and S2 perms.  */
> -            *prot &=3D s2_prot;
> +            result->prot &=3D s1_prot;
>=20=20
>              /* If S2 fails, return early.  */
>              if (ret) {
> @@ -2370,20 +2374,21 @@ bool get_phys_addr(CPUARMState *env, target_ulong=
 address,
>                   *  Outer Write-Back Read-Allocate Write-Allocate.
>                   * Do not overwrite Tagged within attrs.
>                   */
> -                if (cacheattrs->attrs !=3D 0xf0) {
> -                    cacheattrs->attrs =3D 0xff;
> +                if (cacheattrs1.attrs !=3D 0xf0) {
> +                    cacheattrs1.attrs =3D 0xff;
>                  }
> -                cacheattrs->shareability =3D 0;
> +                cacheattrs1.shareability =3D 0;
>              }
> -            *cacheattrs =3D combine_cacheattrs(env, *cacheattrs, cacheat=
trs2);
> +            result->cacheattrs =3D combine_cacheattrs(env, cacheattrs1,
> +                                                    result->cacheattrs);
>=20=20
>              /* Check if IPA translates to secure or non-secure PA space.=
 */
>              if (arm_is_secure_below_el3(env)) {
>                  if (ipa_secure) {
> -                    attrs->secure =3D
> +                    result->attrs.secure =3D
>                          !(env->cp15.vstcr_el2.raw_tcr & (VSTCR_SA | VSTC=
R_SW));
>                  } else {
> -                    attrs->secure =3D
> +                    result->attrs.secure =3D
>                          !((env->cp15.vtcr_el2.raw_tcr & (VTCR_NSA | VTCR=
_NSW))
>                          || (env->cp15.vstcr_el2.raw_tcr & (VSTCR_SA | VS=
TCR_SW)));
>                  }
> @@ -2402,8 +2407,8 @@ bool get_phys_addr(CPUARMState *env, target_ulong a=
ddress,
>       * cannot upgrade an non-secure translation regime's attributes
>       * to secure.
>       */
> -    attrs->secure =3D regime_is_secure(env, mmu_idx);
> -    attrs->user =3D regime_is_user(env, mmu_idx);
> +    result->attrs.secure =3D regime_is_secure(env, mmu_idx);
> +    result->attrs.user =3D regime_is_user(env, mmu_idx);
>=20=20
>      /*
>       * Fast Context Switch Extension. This doesn't exist at all in v8.
> @@ -2420,20 +2425,22 @@ bool get_phys_addr(CPUARMState *env, target_ulong=
 address,
>=20=20
>      if (arm_feature(env, ARM_FEATURE_PMSA)) {
>          bool ret;
> -        *page_size =3D TARGET_PAGE_SIZE;
> +        result->page_size =3D TARGET_PAGE_SIZE;
>=20=20
>          if (arm_feature(env, ARM_FEATURE_V8)) {
>              /* PMSAv8 */
>              ret =3D get_phys_addr_pmsav8(env, address, access_type, mmu_=
idx,
> -                                       phys_ptr, attrs, prot, page_size,=
 fi);
> +                                       &result->phys, &result->attrs,
> +                                       &result->prot, &result->page_size=
, fi);
>          } else if (arm_feature(env, ARM_FEATURE_V7)) {
>              /* PMSAv7 */
>              ret =3D get_phys_addr_pmsav7(env, address, access_type, mmu_=
idx,
> -                                       phys_ptr, prot, page_size, fi);
> +                                       &result->phys, &result->prot,
> +                                       &result->page_size, fi);
>          } else {
>              /* Pre-v7 MPU */
>              ret =3D get_phys_addr_pmsav5(env, address, access_type, mmu_=
idx,
> -                                       phys_ptr, prot, fi);
> +                                       &result->phys, &result->prot, fi);
>          }
>          qemu_log_mask(CPU_LOG_MMU, "PMSA MPU lookup for %s at 0x%08" PRI=
x32
>                        " mmu_idx %u -> %s (prot %c%c%c)\n",
> @@ -2441,9 +2448,9 @@ bool get_phys_addr(CPUARMState *env, target_ulong a=
ddress,
>                        (access_type =3D=3D MMU_DATA_STORE ? "writing" : "=
execute"),
>                        (uint32_t)address, mmu_idx,
>                        ret ? "Miss" : "Hit",
> -                      *prot & PAGE_READ ? 'r' : '-',
> -                      *prot & PAGE_WRITE ? 'w' : '-',
> -                      *prot & PAGE_EXEC ? 'x' : '-');
> +                      result->prot & PAGE_READ ? 'r' : '-',
> +                      result->prot & PAGE_WRITE ? 'w' : '-',
> +                      result->prot & PAGE_EXEC ? 'x' : '-');
>=20=20
>          return ret;
>      }
> @@ -2488,14 +2495,14 @@ bool get_phys_addr(CPUARMState *env, target_ulong=
 address,
>                  address =3D extract64(address, 0, 52);
>              }
>          }
> -        *phys_ptr =3D address;
> -        *prot =3D PAGE_READ | PAGE_WRITE | PAGE_EXEC;
> -        *page_size =3D TARGET_PAGE_SIZE;
> +        result->phys =3D address;
> +        result->prot =3D PAGE_READ | PAGE_WRITE | PAGE_EXEC;
> +        result->page_size =3D TARGET_PAGE_SIZE;
>=20=20
>          /* Fill in cacheattr a-la AArch64.TranslateAddressS1Off. */
>          hcr =3D arm_hcr_el2_eff(env);
> -        cacheattrs->shareability =3D 0;
> -        cacheattrs->is_s2_format =3D false;
> +        result->cacheattrs.shareability =3D 0;
> +        result->cacheattrs.is_s2_format =3D false;
>          if (hcr & HCR_DC) {
>              if (hcr & HCR_DCT) {
>                  memattr =3D 0xf0;  /* Tagged, Normal, WB, RWA */
> @@ -2508,24 +2515,27 @@ bool get_phys_addr(CPUARMState *env, target_ulong=
 address,
>              } else {
>                  memattr =3D 0x44;  /* Normal, NC, No */
>              }
> -            cacheattrs->shareability =3D 2; /* outer sharable */
> +            result->cacheattrs.shareability =3D 2; /* outer sharable */
>          } else {
>              memattr =3D 0x00;      /* Device, nGnRnE */
>          }
> -        cacheattrs->attrs =3D memattr;
> +        result->cacheattrs.attrs =3D memattr;
>          return 0;
>      }
>=20=20
>      if (regime_using_lpae_format(env, mmu_idx)) {
>          return get_phys_addr_lpae(env, address, access_type, mmu_idx, fa=
lse,
> -                                  phys_ptr, attrs, prot, page_size,
> -                                  fi, cacheattrs);
> +                                  &result->phys, &result->attrs,
> +                                  &result->prot, &result->page_size,
> +                                  fi, &result->cacheattrs);
>      } else if (regime_sctlr(env, mmu_idx) & SCTLR_XP) {
>          return get_phys_addr_v6(env, address, access_type, mmu_idx,
> -                                phys_ptr, attrs, prot, page_size, fi);
> +                                &result->phys, &result->attrs,
> +                                &result->prot, &result->page_size, fi);
>      } else {
>          return get_phys_addr_v5(env, address, access_type, mmu_idx,
> -                                    phys_ptr, prot, page_size, fi);
> +                                &result->phys, &result->prot,
> +                                &result->page_size, fi);
>      }
>  }
>=20=20
> @@ -2534,21 +2544,16 @@ hwaddr arm_cpu_get_phys_page_attrs_debug(CPUState=
 *cs, vaddr addr,
>  {
>      ARMCPU *cpu =3D ARM_CPU(cs);
>      CPUARMState *env =3D &cpu->env;
> -    hwaddr phys_addr;
> -    target_ulong page_size;
> -    int prot;
> -    bool ret;
> +    GetPhysAddrResult res =3D {};
>      ARMMMUFaultInfo fi =3D {};
>      ARMMMUIdx mmu_idx =3D arm_mmu_idx(env);
> -    ARMCacheAttrs cacheattrs =3D {};
> +    bool ret;
>=20=20
> -    *attrs =3D (MemTxAttrs) {};
> -
> -    ret =3D get_phys_addr(env, addr, MMU_DATA_LOAD, mmu_idx, &phys_addr,
> -                        attrs, &prot, &page_size, &fi, &cacheattrs);
> +    ret =3D get_phys_addr(env, addr, MMU_DATA_LOAD, mmu_idx, &res, &fi);
> +    *attrs =3D res.attrs;
>=20=20
>      if (ret) {
>          return -1;
>      }
> -    return phys_addr;
> +    return res.phys;
>  }
> diff --git a/target/arm/tlb_helper.c b/target/arm/tlb_helper.c
> index 7476fcafeb..28495ff525 100644
> --- a/target/arm/tlb_helper.c
> +++ b/target/arm/tlb_helper.c
> @@ -209,11 +209,8 @@ bool arm_cpu_tlb_fill(CPUState *cs, vaddr address, i=
nt size,
>  {
>      ARMCPU *cpu =3D ARM_CPU(cs);
>      ARMMMUFaultInfo fi =3D {};
> -    hwaddr phys_addr;
> -    target_ulong page_size;
> -    int prot, ret;
> -    MemTxAttrs attrs =3D {};
> -    ARMCacheAttrs cacheattrs =3D {};
> +    GetPhysAddrResult res =3D {};
> +    int ret;
>=20=20
>      /*
>       * Walk the page table and (if the mapping exists) add the page
> @@ -223,8 +220,7 @@ bool arm_cpu_tlb_fill(CPUState *cs, vaddr address, in=
t size,
>       */
>      ret =3D get_phys_addr(&cpu->env, address, access_type,
>                          core_to_arm_mmu_idx(&cpu->env, mmu_idx),
> -                        &phys_addr, &attrs, &prot, &page_size,
> -                        &fi, &cacheattrs);
> +                        &res, &fi);
>      if (likely(!ret)) {
>          PageEntryExtra extra =3D {};
>=20=20
> @@ -234,22 +230,22 @@ bool arm_cpu_tlb_fill(CPUState *cs, vaddr address, =
int size,
>           * pass in the exact addresses.  This only happens for M-profile,
>           * which does not use or require PageEntryExtra.
>           */
> -        if (page_size >=3D TARGET_PAGE_SIZE) {
> -            phys_addr &=3D TARGET_PAGE_MASK;
> +        if (res.page_size >=3D TARGET_PAGE_SIZE) {
> +            res.phys &=3D TARGET_PAGE_MASK;
>              address &=3D TARGET_PAGE_MASK;
>=20=20
>              /* Record some particulars for later lookup. */
> -            extra.x =3D phys_addr;
> +            extra.x =3D res.phys;
>              extra.x =3D FIELD_DP64(extra.x, PAGEENTRYEXTRA, ATTRS,
> -                                 cacheattrs.attrs);
> +                                 res.cacheattrs.attrs);
>              extra.x =3D FIELD_DP64(extra.x, PAGEENTRYEXTRA, SHAREABILITY,
> -                                 cacheattrs.shareability);
> +                                 res.cacheattrs.shareability);
>              extra.x =3D FIELD_DP64(extra.x, PAGEENTRYEXTRA, GUARDED,
> -                                 cacheattrs.guarded);
> +                                 res.cacheattrs.guarded);
>          }
>=20=20
> -        tlb_set_page_with_extra(cs, address, phys_addr, attrs, extra,
> -                                prot, mmu_idx, page_size);
> +        tlb_set_page_with_extra(cs, address, res.phys, res.attrs, extra,
> +                                res.prot, mmu_idx, res.page_size);
>          return true;
>      } else if (probe) {
>          return false;


--=20
Alex Benn=C3=A9e

