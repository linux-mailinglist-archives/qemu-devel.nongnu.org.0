Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D47A44DB3A
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 18:45:02 +0100 (CET)
Received: from localhost ([::1]:49186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlE8C-0000qH-Ue
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 12:45:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mlE74-0008VN-57
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 12:43:50 -0500
Received: from [2a00:1450:4864:20::429] (port=34536
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mlE72-000137-9s
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 12:43:49 -0500
Received: by mail-wr1-x429.google.com with SMTP id d5so11142937wrc.1
 for <qemu-devel@nongnu.org>; Thu, 11 Nov 2021 09:43:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=NOmxvWPrb4yAa+Yk9YdjBvay1QHaPc9HYShBGeOF95k=;
 b=HO+OfAK44kdHEK++/MBtfj3ASUAxbk8L+d5sKlFx+M4fFEkvVXU0tGCN/1c5xpzWts
 86xeRG5X4th/b1JRM+BEZfSexU84uSSfWzvzPJPnVIZOXBORKBlNTycy431SLd6KCStB
 wGL6AoINN7VuFG86wbn8VBRV80TdUfz70oIgJFV75/sggoVjZODSAYr/noVxof0c9iJV
 QmvqHgAUTQsILxz8aEQMm+By/Uord9JYzKSzpP2g9F04W3OTs7aKSSb2iXl93pUswqhG
 cLmjrfSlS0Oywo9cTGejMvOTQHcOZL4eBinwq7kaI+AS5U2ECRZd7Ong9plp+T8pTRDQ
 4xXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NOmxvWPrb4yAa+Yk9YdjBvay1QHaPc9HYShBGeOF95k=;
 b=gR6+u1OqQt5EfGSM8ZrbutqcZhHlO8Pk6zNXtQDFjnNGkPCQ3uWPTwKEnAcpTSZPhm
 X6l3hq7zh58Elji5zNSAZnSMJHe8TssfBNMMGZxbsPtUNbcaBpUILZ92aQLfqW0nOnP6
 x4ErTg+W41X5eNjoqWIFx63yPgkAIaz9oK5q8f9vzL0sG2ZnMX2sefQwISs3BSD18HL9
 EC5t+8TFutYMJiVZ32GY4lDlbclFhJpxIWW9Iw7DLMi62LAvnOqt6aE2TTS1x8pSPVo2
 noClgcHkH+SDwaqLOLnAL1pT8sJGKDv/mng0nPfpeknoqSWVlsQeJsiu5Ml1xy5CJG04
 0LwA==
X-Gm-Message-State: AOAM531dhxRyHNKxTA+i7qaD3EA8ws2wmXp0yMsFOAUXvfUILjeTF0xQ
 LVt6DmZCms1RZU7favpz9YjdOQ==
X-Google-Smtp-Source: ABdhPJx8ZA7WF0Ip+w2+Gkb5mZqhqynUdq5Ce2vVUzIzrOxY1GrAKURk0LPklWJnd0OGXjIDr+jNhg==
X-Received: by 2002:a5d:4582:: with SMTP id p2mr10889380wrq.364.1636652625429; 
 Thu, 11 Nov 2021 09:43:45 -0800 (PST)
Received: from [192.168.8.106] (10.red-95-125-227.dynamicip.rima-tde.net.
 [95.125.227.10])
 by smtp.gmail.com with ESMTPSA id t11sm3492195wrz.97.2021.11.11.09.43.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Nov 2021 09:43:44 -0800 (PST)
Subject: Re: [RFC PATCH v2 08/30] target/loongarch: Add LoongArch CSR/IOCSR
 instruction
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
References: <1636594528-8175-1-git-send-email-yangxiaojuan@loongson.cn>
 <1636594528-8175-9-git-send-email-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f8e9fc82-ee40-fd40-3a8c-733c315b726e@linaro.org>
Date: Thu, 11 Nov 2021 18:43:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1636594528-8175-9-git-send-email-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.999,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Song Gao <gaosong@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/11/21 2:35 AM, Xiaojuan Yang wrote:
> This includes:
> - CSRRD
> - CSRWR
> - CSRXCHG
> - IOCSR{RD/WR}.{B/H/W/D}

I think IOCSR should be in a separate patch.
It's completely unrelated to the other CSRs.

> +target_ulong helper_csr_rdq(CPULoongArchState *env, uint64_t csr)
> +{
> +    int64_t v;
> +
> +    switch (csr) {
> +    case LOONGARCH_CSR_PGD:
> +        if (env->CSR_TLBRERA & 0x1) {
> +            v = env->CSR_TLBRBADV;
> +        } else {
> +            v = env->CSR_BADV;
> +        }
> +
> +        if ((v >> 63) & 0x1) {
> +            v = env->CSR_PGDH;
> +        } else {
> +            v = env->CSR_PGDL;
> +        }
> +        v = v & TARGET_PHYS_MASK;

This csr is defined to be GRLEN bits; I this mask looks wrong.

> +    default:
> +        assert(0);

g_assert_not_reached.

> +    switch (csr) {
> +    case LOONGARCH_CSR_ASID:
> +        old_v = env->CSR_ASID;
> +        env->CSR_ASID = val;

Mask the write to the field; you don't want to corrupt ASIDBITS, or the other read-only bits.

> +    case LOONGARCH_CSR_TCFG:
> +        old_v = env->CSR_TCFG;
> +        cpu_loongarch_store_stable_timer_config(env, val);
> +        break;
> +    case LOONGARCH_CSR_TINTCLR:
> +        old_v = 0;
> +        qemu_irq_lower(env->irq[IRQ_TIMER]);

The interrupt is not documented to clear on any write; only writes of 1 to bit 0.

> +    default:
> +        assert(0);

g_assert_not_reached.

> +    }
> +
> +    return old_v;
> +}
> +
> +target_ulong helper_csr_xchgq(CPULoongArchState *env, target_ulong val,
> +                              target_ulong mask, uint64_t csr)
> +{
> +    target_ulong tmp;
> +    target_ulong v = val & mask;

I think it would be less confusing to name the input parameter new_val, and the local 
temporary old_val.

> +#define CASE_CSR_XCHGQ(csr)                                 \
> +    case LOONGARCH_CSR_ ## csr:                             \
> +    {                                                       \
> +        val = env->CSR_ ## csr;                             \
> +        env->CSR_ ## csr = (env->CSR_ ## csr) & (~mask);    \
> +        env->CSR_ ## csr = (env->CSR_ ## csr) | v;          \

   old_val = env->CSR_##csr;
   env->CSR_##csr = (old_val & ~mask) | (new_val & mask);


> +    switch (csr) {
> +    CASE_CSR_XCHGQ(CRMD)

I wonder if all of this would be better with a table of offsets, which could be shared 
with the translator.

#define CSR_OFF(X)  [LOONGARCH_CSR_##X] = offsetof(CPUArchState, CSR_##X)

static const int csr_offsets[] = {
     CSR_OFF(CRMD),
     ...
};

int cpu_csr_offset(unsigned csr_num)
{
     if (csr_num < ARRAY_SIZE(csr_offsets)) {
         return csr_offsets[csr_num];
     }
     return 0;
}

Which reduces this function to

     unsigned csr_offset = cpu_csr_offset(csr_num);
     if (csr_offset == 0) {
         /* CSR is undefined: read as 0, write ignored. */
         return 0;
     }

     uint64_t *csr = (void *)env + csr_offset;
     uint64_t old_val = *csr;

     new_val = (new_val & mask) | (old_val & ~mask);

     *csr = (old_val & ~mask) | (new_val & mask);

     if (csr_num == LOONGARCH_CSR_TCFG) {
         cpu_loongarch_store_stable_timer_config(env, new_val);
     } else {
         *csr = new_val;
     }
     return old_val;

> +uint64_t helper_iocsr_read(CPULoongArchState *env, target_ulong r_addr,
> +                           uint32_t size)
> +{
> +    LoongArchMachineState *lams = LOONGARCH_MACHINE(qdev_get_machine());
> +    int cpuid = env_cpu(env)->cpu_index;
> +
> +    if (((r_addr & 0xff00) == 0x1000) || ((r_addr & 0xff00) == 0x1800)) {
> +        r_addr = r_addr + ((target_ulong)(cpuid & 0x3) << 8);
> +    }

This looks to be something that should be controlled by the address space assigned to each 
cpu.

   But it's hard to tell.

Where is the documentation for this?  I didn't immediately find it in 3A5000 Technical 
Reference Manual, Chapter 10.

> +void helper_iocsr_write(CPULoongArchState *env, target_ulong w_addr,
> +                        target_ulong val, uint32_t size)
> +{
> +    LoongArchMachineState *lams = LOONGARCH_MACHINE(qdev_get_machine());
> +    int cpuid = env_cpu(env)->cpu_index;
> +    int mask, i;
> +
> +    /*
> +     * For IPI send, Mail send, ANY send adjust addr and val
> +     * according to their real meaning
> +     */
> +    if (w_addr == 0x1040) { /* IPI send */
> +        cpuid = (val >> 16) & 0x3ff;
> +        val = 1UL << (val & 0x1f);
> +        w_addr = 0x1008;

I don't see any interrupts actually being raised?

> +static bool trans_csrrd(DisasContext *ctx, arg_csrrd *a)
> +{
> +    TCGv dest = gpr_dst(ctx, a->rd, EXT_NONE);
> +
> +    gen_helper_check_plv(cpu_env);

You don't need an external call.  PLV should be part of TB_FLAGS, so you can check this 
during translation.

> +    case LOONGARCH_CSR_TVAL:
> +        gen_helper_csr_rdq(dest, cpu_env, tcg_constant_i64(a->csr));
> +        break;
> +    default:
> +        assert(0);

The assert was definitely wrong, as it allows incorrect programs to crash qemu.  In 
addition, unknown csr read as 0.

> +    CASE_CSR_WRQ(MISC)

You don't actually support any of the MISC bits yet.
You should make this register read-only until you do.

How many more registers are read-only, or have read-only fields that you are not checking?


r~

