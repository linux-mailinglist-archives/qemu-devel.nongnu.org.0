Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13FEB565292
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 12:41:23 +0200 (CEST)
Received: from localhost ([::1]:45550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8JW5-0004qw-NT
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 06:41:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8JUp-0003vF-Lu
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 06:40:03 -0400
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f]:44813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8JUl-0006tX-Nb
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 06:40:03 -0400
Received: by mail-yb1-xb2f.google.com with SMTP id i7so16117858ybe.11
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 03:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=w0yuRKfXEk1Gp6D18ybQz3PnTWURa0NG239sPI2fOHM=;
 b=e+/DsoifQxiiDwtERLZP9heEKsYpfmbsLJQe5tGFJdHCqPwOxLxNjLMGoRLxZiYpWJ
 XHWcMNFK60ggV+VrX5EEqiTtBF14KobfV/Wq68SVH4dxNyo1/BIqApQ7qrfx3U8nNU69
 XG9i62eIbVMEsOk55RDffQBPD5kIGn4qa6oLIcb7iUR51Mm7BVkPsbhRF3OXxqSazjyr
 WdO1XHgHKMeqJ4G4rugF3nOeB2RPtSQDj1yaTW+UFMvmgD1n0dWpZL4CVczLeVxJrfQj
 UC6XYpihwxCEbAnCNDFBzT7Q8/+fMwFmmAeaeglXOG2OPFsJEaalBxTM02s0aTjvSdyo
 G56w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w0yuRKfXEk1Gp6D18ybQz3PnTWURa0NG239sPI2fOHM=;
 b=vuJTYQuJ90UBDpS9UFe0dVCqKyWFX+1fKRQBPBst8ITv4FcO41hlot3Z6AllEoOnpU
 d1r8neKAtLMEEm6SmXG5VLz1UCUByNv35f91DV4n5jn4P32h6Sh01SbYiAQdGfOvZhkf
 iz0blS0HnFRCf0g6LMVMqS2Roh34rMPUC5hZRzPbNmD5ZncZmZc6wyw3qOAnph3BuIWt
 79NV2qQt4SNBP80i/97KnTB7en+9EdwKhxvWDp+7bo8r0YEjE90/UZnsVbFO/vkV5gOG
 EjgNMYjdcjvEhCr6Sui1l0HzeU7JzmnkEd0TepqgyJcCjCcJHgsHuyK9ElDwFez/Bchc
 M1oA==
X-Gm-Message-State: AJIora/uIU60mRqZo9E+nos9kSNLeo9CEfF6H0jge+vyFGTtFslbY/iX
 IzA8y4REh4bHDRdsnPDpJaKXM2rTzw4MuebNVOnFWg==
X-Google-Smtp-Source: AGRyM1s2hLpcvuz/r76dR70fu/2cs9HpxD4E1jfhNblpCXFBEzRC9biolt5/jhIU0DNv3jTZI/pIiJzxdooggUqCUhM=
X-Received: by 2002:a05:6902:1183:b0:66e:4860:575d with SMTP id
 m3-20020a056902118300b0066e4860575dmr5332754ybu.479.1656931198439; Mon, 04
 Jul 2022 03:39:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220628042117.368549-1-richard.henderson@linaro.org>
 <20220628042117.368549-21-richard.henderson@linaro.org>
In-Reply-To: <20220628042117.368549-21-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jul 2022 11:39:47 +0100
Message-ID: <CAFEAcA_qDAR9YmXdZ0wuVVkaBeV3ArGzknjLkU=BqJn7hBAbjw@mail.gmail.com>
Subject: Re: [PATCH v4 20/45] target/arm: Implement SME LD1, ST1
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2f.google.com
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

On Tue, 28 Jun 2022 at 05:34, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We cannot reuse the SVE functions for LD[1-4] and ST[1-4],
> because those functions accept only a Zreg register number.
> For SME, we want to pass a pointer into ZA storage.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---


> +
> +/*
> + * Clear elements in a tile slice comprising len bytes.
> + */
> +
> +typedef void ClearFn(void *ptr, size_t off, size_t len);
> +
> +static void clear_horizontal(void *ptr, size_t off, size_t len)
> +{
> +    memset(ptr + off, 0, len);
> +}
> +
> +static void clear_vertical_b(void *vptr, size_t off, size_t len)
> +{
> +    uint8_t *ptr = vptr;
> +    size_t i;
> +
> +    for (i = 0; i < len; ++i) {
> +        ptr[(i + off) * sizeof(ARMVectorReg)] = 0;
> +    }
> +}
> +
> +static void clear_vertical_h(void *vptr, size_t off, size_t len)
> +{
> +    uint16_t *ptr = vptr;
> +    size_t i;
> +
> +    for (i = 0; i < len / 2; ++i) {
> +        ptr[(i + off) * sizeof(ARMVectorReg)] = 0;
> +    }

The code for the bigger-than-byte vertical actions seems wrong:
because 'ptr' is a uint16_t here this expression is mixing
byte offsets (off, the multiply by sizeof(ARMVectorReg) with
halfword offsets (i, the fact we're calculating an index value
for a uint16_t array).

> +}
> +
> +static void clear_vertical_s(void *vptr, size_t off, size_t len)
> +{
> +    uint32_t *ptr = vptr;
> +    size_t i;
> +
> +    for (i = 0; i < len / 4; ++i) {
> +        ptr[(i + off) * sizeof(ARMVectorReg)] = 0;
> +    }
> +}
> +
> +static void clear_vertical_d(void *vptr, size_t off, size_t len)
> +{
> +    uint64_t *ptr = vptr;
> +    size_t i;
> +
> +    for (i = 0; i < len / 8; ++i) {
> +        ptr[(i + off) * sizeof(ARMVectorReg)] = 0;
> +    }
> +}
> +
> +static void clear_vertical_q(void *vptr, size_t off, size_t len)
> +{
> +    Int128 *ptr = vptr, zero = int128_zero();
> +    size_t i;
> +
> +    for (i = 0; i < len / 16; ++i) {
> +        ptr[(i + off) * sizeof(ARMVectorReg)] = zero;
> +    }
> +}
> +
> +/*
> + * Copy elements from an array into a tile slice comprising len bytes.
> + */
> +
> +typedef void CopyFn(void *dst, const void *src, size_t len);
> +
> +static void copy_horizontal(void *dst, const void *src, size_t len)
> +{
> +    memcpy(dst, src, len);
> +}
> +
> +static void copy_vertical_b(void *vdst, const void *vsrc, size_t len)
> +{
> +    const uint8_t *src = vsrc;
> +    uint8_t *dst = vdst;
> +    size_t i;
> +
> +    for (i = 0; i < len; ++i) {
> +        dst[i * sizeof(ARMVectorReg)] = src[i];
> +    }
> +}
> +
> +static void copy_vertical_h(void *vdst, const void *vsrc, size_t len)
> +{
> +    const uint16_t *src = vsrc;
> +    uint16_t *dst = vdst;
> +    size_t i;
> +
> +    for (i = 0; i < len / 2; ++i) {
> +        dst[i * sizeof(ARMVectorReg)] = src[i];

Similarly the array index calculation for dst[] here looks wrong.

> +    }
> +}
> +
> +static void copy_vertical_s(void *vdst, const void *vsrc, size_t len)
> +{
> +    const uint32_t *src = vsrc;
> +    uint32_t *dst = vdst;
> +    size_t i;
> +
> +    for (i = 0; i < len / 4; ++i) {
> +        dst[i * sizeof(ARMVectorReg)] = src[i];
> +    }
> +}
> +
> +static void copy_vertical_d(void *vdst, const void *vsrc, size_t len)
> +{
> +    const uint64_t *src = vsrc;
> +    uint64_t *dst = vdst;
> +    size_t i;
> +
> +    for (i = 0; i < len / 8; ++i) {
> +        dst[i * sizeof(ARMVectorReg)] = src[i];
> +    }
> +}
> +
> +static void copy_vertical_q(void *vdst, const void *vsrc, size_t len)
> +{
> +    const Int128 *src = vsrc;
> +    Int128 *dst = vdst;
> +    size_t i;
> +
> +    for (i = 0; i < len / 16; ++i) {
> +        dst[i * sizeof(ARMVectorReg)] = src[i];
> +    }
> +}
> +
> +/*
> + * Host and TLB primitives for vertical tile slice addressing.
> + */
> +
> +#define DO_LD(NAME, TYPE, HOST, TLB)                                        \
> +static inline void sme_##NAME##_v_host(void *za, intptr_t off, void *host)  \
> +{                                                                           \
> +    TYPE val = HOST(host);                                                  \
> +    *(TYPE *)(za + off * sizeof(ARMVectorReg)) = val;                       \
> +}                                                                           \
> +static inline void sme_##NAME##_v_tlb(CPUARMState *env, void *za,           \
> +                        intptr_t off, target_ulong addr, uintptr_t ra)      \
> +{                                                                           \
> +    TYPE val = TLB(env, useronly_clean_ptr(addr), ra);                      \
> +    *(TYPE *)(za + off * sizeof(ARMVectorReg)) = val;                       \
> +}

So in these functions is 'za' pre-adjusted to the start address of the
vertical column? Is 'off' a byte offset here (in which case the
arithmetic is wrong for anything except byte columns) or has it
been adjusted in the caller to be the index within the column?
(I can't see anything doing the adjustment in the caller but I might
have got tangled up in the macros :-))

> +
> +#define DO_ST(NAME, TYPE, HOST, TLB)                                        \
> +static inline void sme_##NAME##_v_host(void *za, intptr_t off, void *host)  \
> +{                                                                           \
> +    TYPE val = *(TYPE *)(za + off * sizeof(ARMVectorReg));                  \
> +    HOST(host, val);                                                        \
> +}                                                                           \
> +static inline void sme_##NAME##_v_tlb(CPUARMState *env, void *za,           \
> +                        intptr_t off, target_ulong addr, uintptr_t ra)      \
> +{                                                                           \
> +    TYPE val = *(TYPE *)(za + off * sizeof(ARMVectorReg));                  \
> +    TLB(env, useronly_clean_ptr(addr), val, ra);                            \
> +}
> +
> +/*
> + * The ARMVectorReg elements are stored in host-endian 64-bit units.
> + * For 128-bit quantities, the sequence defined by the Elem[] pseudocode
> + * corresponds to storing the two 64-bit pieces in little-endian order.
> + */
> +#define DO_LDQ(HNAME, VNAME, BE, HOST, TLB)                                 \
> +static inline void HNAME##_host(void *za, intptr_t off, void *host)         \
> +{                                                                           \
> +    uint64_t val0 = HOST(host), val1 = HOST(host + 8);                      \
> +    uint64_t *ptr = za + off;                                               \
> +    ptr[0] = BE ? val1 : val0, ptr[1] = BE ? val0 : val1;                   \
> +}                                                                           \
> +static inline void VNAME##_v_host(void *za, intptr_t off, void *host)       \
> +{                                                                           \
> +    HNAME##_host(za, off * sizeof(ARMVectorReg), host);                     \
> +}                                                                           \
> +static inline void HNAME##_tlb(CPUARMState *env, void *za, intptr_t off,    \
> +                               target_ulong addr, uintptr_t ra)             \
> +{                                                                           \
> +    uint64_t val0 = TLB(env, useronly_clean_ptr(addr), ra);                 \
> +    uint64_t val1 = TLB(env, useronly_clean_ptr(addr + 8), ra);             \
> +    uint64_t *ptr = za + off;                                               \
> +    ptr[0] = BE ? val1 : val0, ptr[1] = BE ? val0 : val1;                   \
> +}                                                                           \
> +static inline void VNAME##_v_tlb(CPUARMState *env, void *za, intptr_t off,  \
> +                               target_ulong addr, uintptr_t ra)             \
> +{                                                                           \
> +    HNAME##_tlb(env, za, off * sizeof(ARMVectorReg), addr, ra);             \
> +}
> +
> +#define DO_STQ(HNAME, VNAME, BE, HOST, TLB)                                 \
> +static inline void HNAME##_host(void *za, intptr_t off, void *host)         \
> +{                                                                           \
> +    uint64_t *ptr = za + off;                                               \
> +    HOST(host, ptr[BE]);                                                    \
> +    HOST(host + 1, ptr[!BE]);                                               \
> +}                                                                           \
> +static inline void VNAME##_v_host(void *za, intptr_t off, void *host)       \
> +{                                                                           \
> +    HNAME##_host(za, off * sizeof(ARMVectorReg), host);                     \
> +}                                                                           \
> +static inline void HNAME##_tlb(CPUARMState *env, void *za, intptr_t off,    \
> +                               target_ulong addr, uintptr_t ra)             \
> +{                                                                           \
> +    uint64_t *ptr = za + off;                                               \
> +    TLB(env, useronly_clean_ptr(addr), ptr[BE], ra);                        \
> +    TLB(env, useronly_clean_ptr(addr + 8), ptr[!BE], ra);                   \
> +}                                                                           \
> +static inline void VNAME##_v_tlb(CPUARMState *env, void *za, intptr_t off,  \
> +                               target_ulong addr, uintptr_t ra)             \
> +{                                                                           \
> +    HNAME##_tlb(env, za, off * sizeof(ARMVectorReg), addr, ra);             \
> +}
> +

> +static bool trans_LDST1(DisasContext *s, arg_LDST1 *a)
> +{
> +    typedef void GenLdSt1(TCGv_env, TCGv_ptr, TCGv_ptr, TCGv, TCGv_i32);
> +
> +    /*
> +     * Indexed by [esz][be][v][mte][st], which is (except for load/store)
> +     * also the order in which the elements appear in the function names,
> +     * and so how we must concatenate the pieces.
> +     */
> +
> +#define FN_LS(F)     { gen_helper_sme_ld1##F, gen_helper_sme_st1##F }
> +#define FN_MTE(F)    { FN_LS(F), FN_LS(F##_mte) }
> +#define FN_HV(F)     { FN_MTE(F##_h), FN_MTE(F##_v) }
> +#define FN_END(L, B) { FN_HV(L), FN_HV(B) }
> +
> +    static GenLdSt1 * const fns[5][2][2][2][2] = {
> +        FN_END(b, b),
> +        FN_END(h_le, h_be),
> +        FN_END(s_le, s_be),
> +        FN_END(d_le, d_be),
> +        FN_END(q_le, q_be),
> +    };
> +
> +#undef FN_LS
> +#undef FN_MTE
> +#undef FN_HV
> +#undef FN_END
> +
> +    TCGv_ptr t_za, t_pg;
> +    TCGv_i64 addr;
> +    int svl, desc = 0;
> +    bool be = s->be_data == MO_BE;
> +    bool mte = s->mte_active[0];
> +
> +    if (!dc_isar_feature(aa64_sme, s)) {
> +        return false;
> +    }
> +    if (!sme_smza_enabled_check(s)) {
> +        return true;
> +    }
> +
> +    t_za = get_tile_rowcol(s, a->esz, a->rs, a->za_imm, a->v);
> +    t_pg = pred_full_reg_ptr(s, a->pg);
> +    addr = tcg_temp_new_i64();
> +
> +    tcg_gen_shli_i64(addr, cpu_reg(s, a->rm), a->esz);
> +    tcg_gen_add_i64(addr, addr, cpu_reg_sp(s, a->rn));

Theoretically we ought to call gen_check_sp_alignment() here
for rn == 31, but I guess we didn't do that for any of the
non-base-A64 instructions like SVE either.

> +
> +    if (mte) {
> +        desc = FIELD_DP32(desc, MTEDESC, MIDX, get_mem_index(s));
> +        desc = FIELD_DP32(desc, MTEDESC, TBI, s->tbid);
> +        desc = FIELD_DP32(desc, MTEDESC, TCMA, s->tcma);
> +        desc = FIELD_DP32(desc, MTEDESC, WRITE, a->st);
> +        desc = FIELD_DP32(desc, MTEDESC, SIZEM1, (1 << a->esz) - 1);
> +        desc <<= SVE_MTEDESC_SHIFT;
> +    } else {
> +        addr = clean_data_tbi(s, addr);
> +    }
> +    svl = streaming_vec_reg_size(s);
> +    desc = simd_desc(svl, svl, desc);
> +
> +    fns[a->esz][be][a->v][mte][a->st](cpu_env, t_za, t_pg, addr,
> +                                      tcg_constant_i32(desc));
> +
> +    tcg_temp_free_ptr(t_za);
> +    tcg_temp_free_ptr(t_pg);
> +    tcg_temp_free_i64(addr);
> +    return true;
> +}
> --
> 2.34.1

thanks
-- PMM

