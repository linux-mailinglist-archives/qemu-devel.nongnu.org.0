Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC076D573F
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 05:36:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjXS0-000137-Ag; Mon, 03 Apr 2023 23:35:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pjXRy-00012z-Nv
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 23:35:14 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pjXRx-0005VX-46
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 23:35:14 -0400
Received: by mail-pg1-x530.google.com with SMTP id 185so7645646pgc.10
 for <qemu-devel@nongnu.org>; Mon, 03 Apr 2023 20:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680579311;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KC9H7ogW2N1VCdAuStszNFe7Pv5SR6th8+mmySk/YGg=;
 b=kKGfNngmyCAlbpZgdG3gRKRWAKbFYOmStEnMeEbpLqbFV0szOH6A4XsjiGsF9Vq45U
 GMsRGz60L8jfam4s+Wip3vnNg2KhbO97dF7Gwo0ewMIANE7SzY5MOIu68yfas/5KBMur
 lVjdN3o5HpCHPbLvJeNmZPxKOoZXKcOJxCZHnzh/7uZdbOoH4KL40+3P/FQFuE+oZ0kx
 jS1mqwtOsswfBQ36MaWS9vHlO4gEvDXnu6aOQaJtGcFNHEF6aEsOzsncsfVAWirAgb5b
 rJv8pjUKXnZJKGQLInTmUvztj1oaFI1mxcJ/Vii29MGbfq7y3a0JTuw5RM+OAJPosaKM
 d3cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680579311;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KC9H7ogW2N1VCdAuStszNFe7Pv5SR6th8+mmySk/YGg=;
 b=N23AJFSVlS4EebMOTj75JMRDOzrgriqWHxwKvzhcFDUcZKZkBtABRClqop1fLY/18Q
 5y78dnw2hnyhBTrxeTab85OlSxw5bASyL3Y5VW68T18KkDZtc3+sS/VKPz7Niqblvb+w
 MJ6p/wwJh2hCbVKfIXeybTl1JlnT/MLaJ3tzzbmSKvrGL1O2Is9c3iS1LNzTGusdL8bU
 UTP1zPN+G4JJfMPyw6UaCW9B5Zja91zj8YE66PET3doLTkzgOW/+ZXghKzDXdwxCgu5e
 srgVWWf+8P+3VFxBInMuPnsoFlyYFhdHvE6ZsCkuC3eTWtfRkyY7dXNm+nR3uB2DWOKw
 Jsyw==
X-Gm-Message-State: AAQBX9fGe9NQAOs6aezoIucxm0l27H/K4+TLPvzfLlGw7ZzJTHZOPAdb
 hAOn/BIOAxy9tV89ubd1+fEpcw==
X-Google-Smtp-Source: AKy350aGilAQZQlLuXNN+pBCpxOXI0+orb5YxNDZ4FUhcPMi45RRxMu0UPGXQUBECDG2ORzmzUBQWA==
X-Received: by 2002:aa7:9702:0:b0:625:7c97:2c6e with SMTP id
 a2-20020aa79702000000b006257c972c6emr685812pfg.16.1680579311140; 
 Mon, 03 Apr 2023 20:35:11 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:c7ce:2c40:3ee4:21c4?
 ([2602:ae:1541:f901:c7ce:2c40:3ee4:21c4])
 by smtp.gmail.com with ESMTPSA id
 9-20020aa79149000000b0062dd28aaca6sm7581615pfi.212.2023.04.03.20.35.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Apr 2023 20:35:10 -0700 (PDT)
Message-ID: <f55d9c37-b693-caa3-94be-8fb345aa54ac@linaro.org>
Date: Mon, 3 Apr 2023 20:35:08 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [RFC PATCH v2 42/44] target/loongarch: Implement vld vst
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20230328030631.3117129-1-gaosong@loongson.cn>
 <20230328030631.3117129-43-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230328030631.3117129-43-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.349,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 3/27/23 20:06, Song Gao wrote:
> +void HELPER(vld_b)(CPULoongArchState *env, uint32_t vd, target_ulong addr)
> +{
> +    int i;
> +    VReg *Vd = &(env->fpr[vd].vreg);
> +#if !defined(CONFIG_USER_ONLY)
> +    MemOpIdx oi = make_memop_idx(MO_TE | MO_UNALN, cpu_mmu_index(env, false));
> +
> +    for (i = 0; i < LSX_LEN/8; i++) {
> +        Vd->B(i) = helper_ret_ldub_mmu(env, addr + i, oi, GETPC());
> +    }
> +#else
> +    for (i = 0; i < LSX_LEN/8; i++) {
> +        Vd->B(i) = cpu_ldub_data(env, addr + i);
> +    }
> +#endif
> +}

tcg_gen_qemu_ld_i128.

> +static inline void ensure_writable_pages(CPULoongArchState *env,
> +                                         target_ulong addr,
> +                                         int mmu_idx,
> +                                         uintptr_t retaddr)
> +{
> +#ifndef CONFIG_USER_ONLY
> +    /* FIXME: Probe the actual accesses (pass and use a size) */
> +    if (unlikely(LSX_PAGESPAN(addr))) {
> +        /* first page */
> +        probe_write(env, addr, 0, mmu_idx, retaddr);
> +        /* second page */
> +        addr = (addr & TARGET_PAGE_MASK) + TARGET_PAGE_SIZE;
> +        probe_write(env, addr, 0, mmu_idx, retaddr);
> +    }
> +#endif
> +}

Won't be needed with...

> +void HELPER(vst_b)(CPULoongArchState *env, uint32_t vd, target_ulong addr)
> +{
> +    int i;
> +    VReg *Vd = &(env->fpr[vd].vreg);
> +    int mmu_idx = cpu_mmu_index(env, false);
> +
> +    ensure_writable_pages(env, addr, mmu_idx, GETPC());
> +#if !defined(CONFIG_USER_ONLY)
> +    MemOpIdx oi = make_memop_idx(MO_TE | MO_UNALN, mmu_idx);
> +    for (i = 0; i < LSX_LEN/8; i++) {
> +        helper_ret_stb_mmu(env, addr + i, Vd->B(i),  oi, GETPC());
> +    }
> +#else
> +    for (i = 0; i < LSX_LEN/8; i++) {
> +        cpu_stb_data(env, addr + i, Vd->B(i));
> +    }
> +#endif
> +}

... tcg_gen_qemu_st_i128.

> +void HELPER(vldrepl_b)(CPULoongArchState *env, uint32_t vd, target_ulong addr)
> +{
> +    VReg *Vd = &(env->fpr[vd].vreg);
> +    uint8_t data;
> +#if !defined(CONFIG_USER_ONLY)
> +    MemOpIdx oi = make_memop_idx(MO_TE | MO_8 | MO_UNALN,
> +                                 cpu_mmu_index(env, false));
> +    data = helper_ret_ldub_mmu(env, addr, oi, GETPC());
> +#else
> +    data = cpu_ldub_data(env, addr);
> +#endif
> +    int i;
> +    for (i = 0; i < 16; i++) {
> +        Vd->B(i) = data;
> +    }
> +}

tcg_gen_qemu_ld_i64 + tcg_gen_gvec_dup_i64.

> +#define B_PAGESPAN(x) \
> +        ((((x) & ~TARGET_PAGE_MASK) + 8/8 - 1) >= TARGET_PAGE_SIZE)
> +
> +static inline void ensure_b_writable_pages(CPULoongArchState *env,
> +                                           target_ulong addr,
> +                                           int mmu_idx,
> +                                           uintptr_t retaddr)
> +{
> +#ifndef CONFIG_USER_ONLY
> +    /* FIXME: Probe the actual accesses (pass and use a size) */
> +    if (unlikely(B_PAGESPAN(addr))) {
> +        /* first page */
> +        probe_write(env, addr, 0, mmu_idx, retaddr);
> +        /* second page */
> +        addr = (addr & TARGET_PAGE_MASK) + TARGET_PAGE_SIZE;
> +        probe_write(env, addr, 0, mmu_idx, retaddr);
> +    }
> +#endif
> +}
> +
> +void HELPER(vstelm_b)(CPULoongArchState *env,
> +                      uint32_t vd, target_ulong addr, uint32_t sel)
> +{
> +    VReg *Vd = &(env->fpr[vd].vreg);
> +    int mmu_idx = cpu_mmu_index(env, false);
> +
> +    ensure_b_writable_pages(env, addr, mmu_idx, GETPC());
> +#if !defined(CONFIG_USER_ONLY)
> +    MemOpIdx oi = make_memop_idx(MO_TE | MO_8 | MO_UNALN,
> +                                 cpu_mmu_index(env, false));
> +    helper_ret_stb_mmu(env, addr, Vd->B(sel), oi, GETPC());
> +#else
> +    cpu_stb_data(env, addr, Vd->B(sel));
> +#endif
> +}

What are you doing here?
This is a plain integer store.


r~

