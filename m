Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B351D3C1908
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 20:12:44 +0200 (CEST)
Received: from localhost ([::1]:52744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1YVv-0005Bn-O9
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 14:12:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1YSy-0001Sy-L4
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 14:09:40 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:41610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1YSw-0002EJ-Qj
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 14:09:40 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 oj10-20020a17090b4d8ab0290172f77377ebso4458898pjb.0
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 11:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Jq2KGlgs5F8T4Nwiv5zEbpSnFsEms0kE8KyEXy42xgQ=;
 b=WQKb9ZjoUHZ/g29C8GEa0gM5wQ4/IABXv4gxwA6HrQueq9Bpe9rzsiCjEwDCUnzOnv
 iIHXbeVHdIJTSgXyqysPBIaSHuDuWGgUdmo4VQmU4NMf3acso/EqAo6fhahsQI/WxNvo
 jVb07CTQ9FQrIlgC5G3ZrzeRSsLPb4PBpOyUQRRqtwKSjSGdwI/Tw7ijvSACNtS7JZaP
 veZAXAnM8vYZ8aPy6Yl144XYT3pW358lR5MrZboz5y9381XZ5HPRX+xR2eaOh9A59Rbh
 yY3IYOJOJ/qKP+xT8iffUq+vkMvsGIvJ1qK3cb0uQBnmTInGogCo3mS7ocVNbcXdQZVx
 O4Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Jq2KGlgs5F8T4Nwiv5zEbpSnFsEms0kE8KyEXy42xgQ=;
 b=g0jFxNH8fjH+277iuKSgOgGLUbH/aj1G6La0ergx6ZTx76w4DCcVYcnrtXnWOfoWVa
 Za8OPHHHBkQ5lzl6WGI6o3nDiQlwWXdgnK/JftrVEXZUgyndRLxy9O/1x8NLFNe4cxbs
 uFrVaVFDAtDYlJSEJxyfh2c/YfZ2ectOb3nDXdxAiHa876pIww3G19CraLsUgk2Qrk59
 9bicjt2E4EZ8n2/pQXI3mtRrNjaVUpRPLLH5/HVr1cfXEGKQqxoVd3nfXdwTJlkqWtft
 B0nJr7XTXOnEINEXvAgYg8nfc2KY4qA6xQLOe8VD3ucg7jlWJ0FfhJCwlp+/t54QP6tH
 PkEQ==
X-Gm-Message-State: AOAM531V3r6PkOlPVTWA+b5JBHxKnk8lt2VcBPIgfUlyCu5STtDM7Y2x
 8Zbh/oD3D0gcr6dvJlHPtzu0Sg==
X-Google-Smtp-Source: ABdhPJy6/wypz9GGnayzAG1GJONIJRFxBKPyVQlMdLJS7wj7UjUBA4jhsr/DJY+fj0P2+/qlykrBTA==
X-Received: by 2002:a17:90a:4208:: with SMTP id
 o8mr33145230pjg.216.1625767777356; 
 Thu, 08 Jul 2021 11:09:37 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id x23sm1769888pgk.90.2021.07.08.11.09.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jul 2021 11:09:37 -0700 (PDT)
Subject: Re: [PATCH v3 2/4] target/ppc: divided mmu_helper.c in 2 files
To: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20210708164957.28096-1-lucas.araujo@eldorado.org.br>
 <20210708164957.28096-3-lucas.araujo@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0f225dcb-5d25-a672-9da3-dc39dca70d8c@linaro.org>
Date: Thu, 8 Jul 2021 11:09:35 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210708164957.28096-3-lucas.araujo@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
Cc: luis.pires@eldorado.org.br, fernando.valle@eldorado.org.br,
 matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/8/21 9:49 AM, Lucas Mateus Castro (alqotel) wrote:
> +++ b/target/ppc/cpu.h
> @@ -1327,6 +1327,26 @@ void store_40x_dbcr0(CPUPPCState *env, uint32_t val);
>   void store_40x_sler(CPUPPCState *env, uint32_t val);
>   void store_booke_tcr(CPUPPCState *env, target_ulong val);
>   void store_booke_tsr(CPUPPCState *env, target_ulong val);
> +typedef struct mmu_ctx_t mmu_ctx_t;
> +bool ppc_xlate(PowerPCCPU *cpu, vaddr eaddr, MMUAccessType access_type,
> +                      hwaddr *raddrp, int *psizep, int *protp,
> +                      int mmu_idx, bool guest_visible);
> +int ppcmas_tlb_check(CPUPPCState *env, ppcmas_tlb_t *tlb,
> +                            hwaddr *raddrp, target_ulong address,
> +                            uint32_t pid);
> +int ppcemb_tlb_check(CPUPPCState *env, ppcemb_tlb_t *tlb,
> +                            hwaddr *raddrp,
> +                            target_ulong address, uint32_t pid, int ext,
> +                            int i);
> +int get_physical_address_wtlb(CPUPPCState *env, mmu_ctx_t *ctx,
> +                                     target_ulong eaddr,
> +                                     MMUAccessType access_type, int type,
> +                                     int mmu_idx);
> +hwaddr booke206_tlb_to_page_size(CPUPPCState *env,
> +                                        ppcmas_tlb_t *tlb);
> +/* Software driven TLB helpers */
> +int ppc6xx_tlb_getnum(CPUPPCState *env, target_ulong eaddr,
> +                                    int way, int is_code);

Why are any of these going into cpu.h?
Surely they are not used outside of target/ppc/.


r~

