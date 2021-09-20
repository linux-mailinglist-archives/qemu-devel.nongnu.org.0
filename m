Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43920411CD7
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 19:13:30 +0200 (CEST)
Received: from localhost ([::1]:35876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSMrA-0008Lk-Qn
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 13:13:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSMos-0006Dm-LD
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 13:11:10 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:40591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSMon-0000vi-NZ
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 13:11:06 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 n13-20020a17090a4e0d00b0017946980d8dso15673215pjh.5
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 10:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=dJmfX02vlRZ0Bt5+QpeNsUnHRIMRA2VH0hvYP2kiGfo=;
 b=BuXq7w5y+vF0ElTN6fjL56ZdPC5BwSeZ+XQqXbdE2ZwGE/NdzPtgjpIV/e3qiL8vzz
 +Gp9d6Jq/d/z3/ODa2nj9WSeZLsIpJR82JQc2QbdojK8SUfqbTMPdp/7B3dwakmPB+q+
 s0p0WBGA6G+Ctn6CdTqSdfZCgQgNSKmvTNddlMutJjbz2c7m5N2TR53YbmYMFTYf3ujn
 XAbszCw+qiycVqkT60Y7jaGIs1cU+G369R35EqXqSVoZVZUcfWCrY2Sl8COCq1oL//xi
 +IF6h0A2gYVlopDQNYpShPnEHdud7y/NYdWV4dMNcF+pmNPXPpd2BwaZ+L0qbPVjdooS
 lAUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dJmfX02vlRZ0Bt5+QpeNsUnHRIMRA2VH0hvYP2kiGfo=;
 b=zKP5M8KEGEgKfOJJ6Y/xu2ZJXp1TPmFytV4XWYK8Swxtc08+6d7+w1bNUHg2NNqtNK
 hvaL/QPCYqKhvlxlTQSqtH5f6MD5wT5pk5ro9HJEVwoqOK7LaZFq5kyjsHAKwF3HJiC+
 YWxgv01KbejjJ2ZGpskoax8jvRtNwye0doTpzAoP4j9f9X25UN/AcjSHxZUGHawX/7c7
 2d4W+YWu1WNy21eEu0Sw/rmJh/lAKWuAMNy7hq6XDWwhyicxGni8rCjyEcfr/72m82qd
 231wRQNIHUJFqrkpG1s09jIGQnEPeg7fADRKo7bRRn0puJ738nOLiTKYzxdsyqtGTuWf
 5TSw==
X-Gm-Message-State: AOAM531CLuVsA0StKPom55xNpjpb9LFETYtY47h62wNEIWxr/M2aEEoh
 eT6MHzX1SGx5RKYoFbvbiKdrFwdH9JKM5w==
X-Google-Smtp-Source: ABdhPJwC7NWLyMQQ6jGNbo3Q3TLPlY6ule7T5eaCeubK+PW0cKQuOywOPEJjieN/wStNLiXm6SDOtQ==
X-Received: by 2002:a17:90a:fb91:: with SMTP id
 cp17mr37430pjb.237.1632157860006; 
 Mon, 20 Sep 2021 10:11:00 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id b142sm7907242pfb.17.2021.09.20.10.10.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 10:10:59 -0700 (PDT)
Subject: Re: [PATCH 23/30] tcg/loongarch: Add softmmu load/store helpers,
 implement qemu_ld/qemu_st ops
To: WANG Xuerui <git@xen0n.name>, qemu-devel@nongnu.org
References: <20210920080451.408655-1-git@xen0n.name>
 <20210920080451.408655-24-git@xen0n.name>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <bd7c4980-6840-79f5-225b-4dba2d530e6f@linaro.org>
Date: Mon, 20 Sep 2021 10:10:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210920080451.408655-24-git@xen0n.name>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/20/21 1:04 AM, WANG Xuerui wrote:
> +static void tcg_out_goto(TCGContext *s, const tcg_insn_unit *target)
> +{
> +    tcg_out_opc_b(s, 0);
> +    bool ok = reloc_sd10k16(s->code_ptr - 1, target);
> +    tcg_debug_assert(ok);
> +}

Hmm.  This is an existing bug in tcg/riscv/.  We should have no asserts on relocations 
being in range.  We should always be able to tell our caller that the relocation failed, 
and we'll try again with a smaller TB.

In this case, return the result of reloc_sd10k16 and ...

> +
> +    tcg_out_goto(s, l->raddr);
> +    return true;
> +}

... return the result of tcg_out_goto.


> +static void tcg_out_tlb_load(TCGContext *s, TCGReg addrl, TCGMemOpIdx oi,
> +                             tcg_insn_unit **label_ptr, bool is_load)
> +{
> +    MemOp opc = get_memop(oi);
> +    unsigned s_bits = opc & MO_SIZE;
> +    unsigned a_bits = get_alignment_bits(opc);
> +    tcg_target_long compare_mask;
> +    int mem_index = get_mmuidx(oi);
> +    int fast_ofs = TLB_MASK_TABLE_OFS(mem_index);
> +    int mask_ofs = fast_ofs + offsetof(CPUTLBDescFast, mask);
> +    int table_ofs = fast_ofs + offsetof(CPUTLBDescFast, table);
> +    TCGReg mask_base = TCG_AREG0, table_base = TCG_AREG0;
> +
> +    tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TMP0, mask_base, mask_ofs);
> +    tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TMP1, table_base, table_ofs);

I think we can eliminate the mask_base and table_base variables now.  This dates from the 
TCG_TARGET_TLB_DISPLACEMENT_BITS thing, where we would need to compute an intermediate 
offset, and adjust these base registers.

> +    /* Clear the non-page, non-alignment bits from the address.  */
> +    compare_mask = (tcg_target_long)TARGET_PAGE_MASK | ((1 << a_bits) - 1);
> +    if (compare_mask == sextreg(compare_mask, 0, 12)) {
> +        tcg_out_opc_andi(s, TCG_REG_TMP1, addrl, compare_mask);

LoongArch uses an unsigned mask for andi, not signed.  The immediate case will never match 
for LoongArch.

> +static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
> +{
> +    TCGMemOpIdx oi = l->oi;
> +    MemOp opc = get_memop(oi);
> +    TCGReg a0 = tcg_target_call_iarg_regs[0];
> +    TCGReg a1 = tcg_target_call_iarg_regs[1];
> +    TCGReg a2 = tcg_target_call_iarg_regs[2];
> +    TCGReg a3 = tcg_target_call_iarg_regs[3];

Drop these, since you've already named TCG_REG_A0 etc.

> +
> +    /* We don't support oversize guests */
> +    if (TCG_TARGET_REG_BITS < TARGET_LONG_BITS) {
> +        g_assert_not_reached();
> +    }

This is redundant with TCG_TARGET_REG_BITS == 64.

> +    tcg_out_call(s, qemu_ld_helpers[opc & MO_SSIZE]);
> +    tcg_out_mov(s, (opc & MO_SIZE) == MO_64, l->datalo_reg, a0);

Because you have single-insn sign-extend instructions, it's better to always call the 
unsigned load function, and then sign-extend here.  See the aarch64 version.

> +    tcg_out_mov(s, TCG_TYPE_PTR, a2, l->datalo_reg);
> +    switch (s_bits) {
> +    case MO_8:
> +        tcg_out_ext8u(s, a2, a2);
> +        break;
> +    case MO_16:
> +        tcg_out_ext16u(s, a2, a2);
> +        break;
> +    default:
> +        break;
> +    }

Do you have a pointer to the LoongArch ABI?  Do 32-bit values need to be sign- or 
zero-extended in the call arguments?

Anyway, merge the move and extend.

> +    tcg_out_movi(s, TCG_TYPE_PTR, a4, (tcg_target_long)l->raddr);

Oh, just FYI, this is another case where movi wants to handle pc-relative addresses.

> +    if (guest_base == 0) {
> +        tcg_out_opc_add_d(s, base, addr_regl, TCG_REG_ZERO);

Don't add zero.  RISCV bug that's been fixed recently.

> +static void tcg_out_qemu_st_direct(TCGContext *s, TCGReg lo,
> +                                   TCGReg base, MemOp opc)
> +{
> +    /* Byte swapping is left to middle-end expansion.  */
> +    tcg_debug_assert((opc & MO_BSWAP) == 0);
> +
> +    switch (opc & (MO_SSIZE)) {

MO_SIZE here.

> +static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is_64)

Shouldn't need is_64 argument for store.  It's only relevant to load so that TCG_TYPE_I32 
values are always sign-extended in the host register.


r~

