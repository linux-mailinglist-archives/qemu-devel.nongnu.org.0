Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B20A487945
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 15:54:49 +0100 (CET)
Received: from localhost ([::1]:33308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5qdk-0007qm-F4
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 09:54:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n5qPr-0007cs-SK
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 09:40:30 -0500
Received: from [2a00:1450:4864:20::42e] (port=41602
 helo=mail-wr1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n5qPb-0000fL-NU
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 09:40:26 -0500
Received: by mail-wr1-x42e.google.com with SMTP id v6so11414059wra.8
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 06:40:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xYYvCbjbu/EdnZBubRyOhdij9GRu86btmS90ujh1p54=;
 b=aJ7YPndO3kYY4M/BIblZ6ya0T33R0NQgIVsbOMw17ftQ8q3yLOgJBzww/cQjkTG6tX
 +2SWnxfLnmbZ11+sQw7vZ2Arlih59ijJGllxhB6EoVVfILi3Iohxh6FZcYvqDs9Hpx3B
 mW0j5fHQnb3Qn1+TecOfPt8zim+8vvLyvfE4PZJDTvQWw/iVp1F1SYidBCQ+XuQHKtSB
 VJBC2Jmdgbtfh7xzIFc0FTofmvudbA0NwuLW93p3xUEASMf4yNhkslnh/TzvY20dnsPm
 L+nQUopnQsNYxEl8wixxdtriVzdwnTMMsdHUv2UxX5aa/PwZU+soH/8by3x8P1+lG3Mq
 KB1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xYYvCbjbu/EdnZBubRyOhdij9GRu86btmS90ujh1p54=;
 b=j7EN0yUsLrY0m9EyNyASN4DH7WhAe3cw/QgSV9tNnNNzqgrSP+P8m7CnjbrqszJvAV
 EihG5hnHGW3JtMA4WARPUEMN5AsBFsTEq+pvtoVS7Jnixp8fIo/A+eGNE4iLMuIIGGvg
 +QQ20xK7hbXwvDs9MpEI36607/Jx6KnBqpQsj1cgt5czNleFfNf9XbBDSTE8N9vzvvyI
 w8t8dWTVxmy6Ss3qgpO8HkAFINNdmPRU1IqZiZFepuGxXjEZok0EiczLJ/gsMGgJLfRC
 0j1lLS97NqkKMXbAB0q5euD0R5TD7VRnvEzMq5UXDtpeLYWTKiUqDASmrdJxx3H83QD5
 TFGA==
X-Gm-Message-State: AOAM531i+s4GajGv8QuYR2Rrq0/cc94cihbKJsCSLMQ6T4k18f+BNzoe
 8MmsmsF524i67scbGev5ra3mfM/UZvbz4juPUZJHlw==
X-Google-Smtp-Source: ABdhPJw5vnONSmvNmfJUqL8vYoNjIqEY33qJ2FEDkMMQHNxjqJC2YOvdkDVIZimbtzFF7YeElx5r4tzGVZo1Y7xG5k0=
X-Received: by 2002:adf:ea44:: with SMTP id j4mr10129208wrn.319.1641566410160; 
 Fri, 07 Jan 2022 06:40:10 -0800 (PST)
MIME-Version: 1.0
References: <20211208231154.392029-1-richard.henderson@linaro.org>
 <20211208231154.392029-7-richard.henderson@linaro.org>
In-Reply-To: <20211208231154.392029-7-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 7 Jan 2022 14:39:58 +0000
Message-ID: <CAFEAcA9+2Mt2uui06J1ONxFGS_hb3tEJt8nxNHBjjAyaHrvr3g@mail.gmail.com>
Subject: Re: [PATCH 6/6] target/arm: Implement FEAT_LPA2
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RDNS_NONE=0.793,
 SPF_PASS=-0.001, T_SPF_HELO_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 8 Dec 2021 at 23:21, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Again, a commit message would be nice.

> ---
>  target/arm/cpu.h       | 12 +++++++
>  target/arm/internals.h |  2 ++
>  target/arm/cpu64.c     |  2 ++
>  target/arm/helper.c    | 80 +++++++++++++++++++++++++++++++++++-------
>  4 files changed, 83 insertions(+), 13 deletions(-)
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 3149000004..379585352b 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -4283,6 +4283,18 @@ static inline bool isar_feature_aa64_i8mm(const ARMISARegisters *id)
>      return FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, I8MM) != 0;
>  }
>
> +static inline bool isar_feature_aa64_tgran4_lpa2(const ARMISARegisters *id)
> +{
> +    return sextract64(id->id_aa64mmfr0,
> +                      R_ID_AA64MMFR0_TGRAN4_SHIFT,
> +                      R_ID_AA64MMFR0_TGRAN4_LENGTH) >= 1;
> +}
> +
> +static inline bool isar_feature_aa64_tgran16_lpa2(const ARMISARegisters *id)
> +{
> +    return FIELD_EX64(id->id_aa64mmfr0, ID_AA64MMFR0, TGRAN16) >= 2;
> +}

(I wonder if we should have a FIELD_SEX64 etc ?)

> +
>  static inline bool isar_feature_aa64_ccidx(const ARMISARegisters *id)
>  {
>      return FIELD_EX64(id->id_aa64mmfr2, ID_AA64MMFR2, CCIDX) != 0;
> diff --git a/target/arm/internals.h b/target/arm/internals.h
> index 3e801833b4..868cae2a55 100644
> --- a/target/arm/internals.h
> +++ b/target/arm/internals.h
> @@ -1033,12 +1033,14 @@ static inline uint32_t aarch64_pstate_valid_mask(const ARMISARegisters *id)
>  typedef struct ARMVAParameters {
>      unsigned tsz    : 8;
>      unsigned ps     : 3;
> +    unsigned sh     : 2;
>      unsigned select : 1;
>      bool tbi        : 1;
>      bool epd        : 1;
>      bool hpd        : 1;
>      bool using16k   : 1;
>      bool using64k   : 1;
> +    bool ds         : 1;
>  } ARMVAParameters;
>
>  ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index 3bb79ca744..5a1940aa94 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -740,6 +740,8 @@ static void aarch64_max_initfn(Object *obj)
>
>          t = cpu->isar.id_aa64mmfr0;
>          t = FIELD_DP64(t, ID_AA64MMFR0, PARANGE, 6); /* FEAT_LPA: 52 bits */
> +        t = FIELD_DP64(t, ID_AA64MMFR0, TGRAN16, 2); /* FEAT_LPA2: 52 bits */
> +        t = FIELD_DP64(t, ID_AA64MMFR0, TGRAN4, 1);  /* FEAT_LPA2: 52 bits */

Shouldn't we also set the TGRAN4_2 and TGRAN16_2 fields?

>          cpu->isar.id_aa64mmfr0 = t;
>
>          t = cpu->isar.id_aa64mmfr1;
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index e39c1f5b3a..f4a8b37f98 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -11008,8 +11008,13 @@ static bool check_s2_mmu_setup(ARMCPU *cpu, bool is_aa64, int level,
>      const int grainsize = stride + 3;
>      int startsizecheck;
>
> -    /* Negative levels are never allowed.  */
> -    if (level < 0) {
> +    /*
> +     * Negative levels are usually not allowed...
> +     * Except for FEAT_LPA2, 4k page table, 52-bit address space, which
> +     * begins with level -1.  Note that previous feature tests will have
> +     * eliminated this combination if it is not enabled.
> +     */
> +    if (level < (inputsize == 52 && stride == 9 ? -1 : 0)) {
>          return false;
>      }

The checks on validity of 'level' are getting quite complicated:
 * we do this check here (which now involves 'stride')
 * some values of 'level' will cause the startsizecheck to fail
   (calculation of startsizecheck also involves 'stride')
 * we then switch on 'stride' and check for 'level' validity
   differently in the various cases

Can we simplify this at all ? Or are we just following the logic
the pseudocode uses (I haven't checked) ?

> @@ -11150,8 +11155,8 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
>                                     ARMMMUIdx mmu_idx, bool data)
>  {
>      uint64_t tcr = regime_tcr(env, mmu_idx)->raw_tcr;
> -    bool epd, hpd, using16k, using64k;
> -    int select, tsz, tbi, ps;
> +    bool epd, hpd, using16k, using64k, ds;
> +    int select, tsz, tbi, ps, sh;
>
>      if (!regime_has_2_ranges(mmu_idx)) {
>          select = 0;
> @@ -11165,7 +11170,9 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
>              hpd = extract32(tcr, 24, 1);
>          }
>          epd = false;
> +        sh = extract64(tcr, 12, 2);
>          ps = extract64(tcr, 16, 3);
> +        ds = extract64(tcr, 32, 1);
>      } else {
>          /*
>           * Bit 55 is always between the two regions, and is canonical for
> @@ -11175,6 +11182,7 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
>          if (!select) {
>              tsz = extract32(tcr, 0, 6);
>              epd = extract32(tcr, 7, 1);
> +            sh = extract32(tcr, 12, 2);
>              using64k = extract32(tcr, 14, 1);
>              using16k = extract32(tcr, 15, 1);
>              hpd = extract64(tcr, 41, 1);
> @@ -11184,9 +11192,11 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
>              using64k = tg == 3;
>              tsz = extract32(tcr, 16, 6);
>              epd = extract32(tcr, 23, 1);
> +            sh = extract32(tcr, 28, 2);
>              hpd = extract64(tcr, 42, 1);
>          }
>          ps = extract64(tcr, 32, 3);
> +        ds = extract64(tcr, 59, 1);
>      }
>
>      /* Present TBI as a composite with TBID.  */
> @@ -11199,12 +11209,14 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
>      return (ARMVAParameters) {
>          .tsz = tsz,
>          .ps = ps,
> +        .sh = sh,
>          .select = select,
>          .tbi = tbi,
>          .epd = epd,
>          .hpd = hpd,
>          .using16k = using16k,
>          .using64k = using64k,
> +        .ds = ds,
>      };
>  }
>
> @@ -11332,15 +11344,31 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
>                                     access_type != MMU_INST_FETCH);
>          level = 0;
>
> -        if (cpu_isar_feature(aa64_st, env_archcpu(env))) {
> +        /* Find the minimum allowed input address size. */
> +        if (cpu_isar_feature(aa64_st, cpu)) {
>              max_tsz = 48 - param.using64k;
>          }
> +
> +        /*
> +         * Find the maximum allowed input address size.
> +         * DS is RES0 unless FEAT_LPA2 is supported for the given page size;
> +         * adjust param.ds to the effective value of DS, as documented.
> +         */
>          if (param.using64k) {
> -            if (cpu_isar_feature(aa64_lva, env_archcpu(env))) {
> +            if (cpu_isar_feature(aa64_lva, cpu)) {
>                  min_tsz = 12;
>              }
> +            param.ds = false;
> +        } else if (param.ds) {
> +            /* ??? Assume tgran{4,16}_2 == 0, i.e. match tgran{4,16}. */

How painful would it be to fix this '???' ? Setting those fields to 0 is
deprecated, so it would be preferable not to start out depending on that.
(We don't currently use the tgran fields at all, I guess because we allow
all page sizes regardless of the ID register values. Maybe we should
correct that too.)

> +            if (param.using16k
> +                ? cpu_isar_feature(aa64_tgran16_lpa2, cpu)
> +                : cpu_isar_feature(aa64_tgran4_lpa2, cpu)) {
> +                min_tsz = 12;
> +            } else {
> +                param.ds = false;
> +            }
>          }
> -        /* TODO: FEAT_LPA2 */
>
>          /*
>           * If TxSZ is programmed to a value larger than the maximum,
> @@ -11441,10 +11469,19 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
>           * VTCR_EL2.SL0 field (whose interpretation depends on the page size)
>           */
>          uint32_t sl0 = extract32(tcr->raw_tcr, 6, 2);
> +        uint32_t sl2 = extract64(tcr->raw_tcr, 33, 1);
>          uint32_t startlevel;
>          bool ok;
>
> -        if (!aarch64 || stride == 9) {
> +        /* SL2 is RES0 unless DS=1 & 4kb granule. */
> +        if (param.ds && stride == 9 && sl2) {
> +            if (sl0 != 0) {
> +                level = 0;
> +                fault_type = ARMFault_Translation;
> +                goto do_fault;
> +            }
> +            startlevel = -1;
> +        } else if (!aarch64 || stride == 9) {
>              /* AArch32 or 4KB pages */
>              startlevel = 2 - sl0;
>
> @@ -11499,7 +11536,9 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
>       * but in ARMv8 they are checked for zero and an AddressSize fault
>       * is raised if they are not.
>       */
> -    if (aarch64 || arm_feature(env, ARM_FEATURE_V8)) {
> +    if (param.ds) {
> +        descaddrmask = MAKE_64BIT_MASK(0, 50);
> +    } else if (aarch64 || arm_feature(env, ARM_FEATURE_V8)) {
>          descaddrmask = MAKE_64BIT_MASK(0, 48);
>      } else {
>          descaddrmask = MAKE_64BIT_MASK(0, 40);
> @@ -11534,11 +11573,16 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
>
>          /*
>           * For FEAT_LPA and PS=6, bits [51:48] of descaddr are in [15:12]
> -         * of descriptor.  Otherwise, if descaddr is out of range, raise
> -         * AddressSizeFault.
> +         * of descriptor.  For FEAT_LPA2 and effective DS, bits [51:50] of
> +         * descaddr are in [9:8].  Otherwise, if descaddr is out of range,
> +         * raise AddressSizeFault.
>           */
>          if (outputsize > 48) {
> -            descaddr |= extract64(descriptor, 12, 4) << 48;
> +            if (param.ds) {
> +                descaddr |= extract64(descriptor, 8, 2) << 50;
> +            } else {
> +                descaddr |= extract64(descriptor, 12, 4) << 48;
> +            }
>          } else if (descaddr >> outputsize) {
>              fault_type = ARMFault_AddressSize;
>              goto do_fault;
> @@ -11632,7 +11676,17 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
>          assert(attrindx <= 7);
>          cacheattrs->attrs = extract64(mair, attrindx * 8, 8);
>      }
> -    cacheattrs->shareability = extract32(attrs, 6, 2);
> +
> +    /*
> +     * For FEAT_LPA2 and effective DS, the SH field in the attributes
> +     * was re-purposed for output address bits.  The SH attribute in
> +     * that case comes from TCR_ELx, which we extracted earlier.
> +     */
> +    if (param.ds) {
> +        cacheattrs->shareability = param.sh;
> +    } else {
> +        cacheattrs->shareability = extract32(attrs, 6, 2);
> +    }
>
>      *phys_ptr = descaddr;
>      *page_size_ptr = page_size;

The code above looks correct to me. There are some missing pieces
elsewhere, though:

(1) The handling of the BaseADDR field for TLB range
invalidates needs updating (there's a TODO to this effect in
tlbi_aa64_range_get_base()).

Side note: in that function, we shift the field by TARGET_PAGE_BITS,
but the docs say that the shift should depend on the configured
translation granule. Is that a bug?

(2) There are some new long-form fault status codes with FEAT_LPA2,
corresponding to various fault types that can now occur at level -1.
arm_fi_to_lfsc() needs updating to handle fi->level being -1.
(You could do this bit as a preceding patch; it doesn't need to
be squashed into this one.)

thanks
-- PMM

