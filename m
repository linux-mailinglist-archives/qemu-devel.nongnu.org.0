Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 271AB3210AC
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 07:05:34 +0100 (CET)
Received: from localhost ([::1]:55666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lE4Ld-0005Vo-7m
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 01:05:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lE4Ih-0002Xg-TB
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 01:02:31 -0500
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:45652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lE4If-00070K-Qj
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 01:02:31 -0500
Received: by mail-pg1-x535.google.com with SMTP id p21so9567176pgl.12
 for <qemu-devel@nongnu.org>; Sun, 21 Feb 2021 22:02:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rpWt/t4pR44tixSSJxsHGr6Tlfz8Ou9hCD61Ow0jV2I=;
 b=jix+53FR8sEZzRKgiRrZlNr3Cb0yKQ1NtSB9/beTpqhqE+B26hCh10WBk23vQIRrSh
 /8nzb9LPx5iDfE9tcFjeF8ioO/eKvBX02rjiY0IugC/EvESjR8J9FfeTHsfshPQxr9nz
 sW2DyujajKinhKlrg+YTWRBxM4BCRsGSfxnb7gjyX1aXm+Iw7DRwOQ9O0rywrxBPt+wJ
 i2LeN/johWpfKyZcxC/naLQjIxyjsATE/vPEm+L39fMj/JsVVaC10QXmrjkaQ8fKRJgP
 vhBbHNx0ROkMcZtmgD856loT6MKGYWQlII7ET0ucFNqBtRXMBxws/RLEzjDt542UlxR7
 T2Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rpWt/t4pR44tixSSJxsHGr6Tlfz8Ou9hCD61Ow0jV2I=;
 b=ZNqglgd2DtAMo/uqerjCEUhzcY5gEBi+cJrwBIA/ADDNAlR/dSX7m14hL7bTJH6qMi
 sz75pGe2yUxeCgOfR5IbZHJSOWHA/lxnQFYb2ixyLwjpG01fQRZZK0HMG72ETsIWZIl0
 1Fcs29wrELalteihiJiKqczrAcKmggjS/Fu52BZG5Q3P8E3TL+OK8rHEvVxkKT6AeuzN
 a9wrv2ET/dhiEcfmtDi4q0k94vGFTtGyWGtD8t18i2i2aFfALLwhW2W5P/yJ8rSZYz9+
 dpIkJCtwyzwfZPaCdQhcdsh6y5Fx/trcz7mib5t0lDHcSgc79fM62WTWH9JsmO4IfqcV
 iPaA==
X-Gm-Message-State: AOAM53099m0HW6haV6LoQ4Sn6nDhoxx1zFbX3A/ao+0iyUgrwubBWdz9
 oPlYVzCWlyLzWDpJC/p/ddW2VnoKiYGkpw==
X-Google-Smtp-Source: ABdhPJx8w5rk5FSfP5G+vrZvb4ipQnjgoyU/7FBM6bi2fjJNb3O4czgiMUFeGDEx8xiyRvC6uYSr/g==
X-Received: by 2002:a62:e817:0:b029:1ec:b9e2:aaf with SMTP id
 c23-20020a62e8170000b02901ecb9e20aafmr20702872pfi.59.1613973746588; 
 Sun, 21 Feb 2021 22:02:26 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id 125sm17027109pfu.7.2021.02.21.22.02.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 21 Feb 2021 22:02:26 -0800 (PST)
Subject: Re: [RFC v1 24/38] target/arm: move aa64_va_parameter_tbi,tbid,tcma
 and arm_rebuild_hflags
To: Claudio Fontana <cfontana@suse.de>
References: <20210221092449.7545-1-cfontana@suse.de>
 <20210221092449.7545-25-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d7bca535-d6eb-780b-7248-d6810652c76d@linaro.org>
Date: Sun, 21 Feb 2021 22:02:24 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210221092449.7545-25-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/21/21 1:24 AM, Claudio Fontana wrote:
> From: Claudio Fontana <cfontana@centriq4.arch.suse.de>
> 
> they are needed for KVM too, move them out of TCG helpers.
> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> ---
>  target/arm/internals.h      |  37 +++++
>  target/arm/tcg/helper-tcg.h |  32 -----
>  target/arm/cpu-common.c     | 252 ++++++++++++++++++++++++++++++++++
>  target/arm/tcg/helper.c     | 264 +-----------------------------------
>  4 files changed, 293 insertions(+), 292 deletions(-)
> 
> diff --git a/target/arm/internals.h b/target/arm/internals.h
> index 6589b63ebc..9eb5d7fd79 100644
> --- a/target/arm/internals.h
> +++ b/target/arm/internals.h
> @@ -1196,6 +1196,43 @@ static inline uint64_t useronly_maybe_clean_ptr(uint32_t desc, uint64_t ptr)
>      return ptr;
>  }
>  
> +/*
> + * Convert a possible stage1+2 MMU index into the appropriate
> + * stage 1 MMU index
> + */
> +static inline ARMMMUIdx stage_1_mmu_idx(ARMMMUIdx mmu_idx)
> +{
> +    switch (mmu_idx) {
> +    case ARMMMUIdx_SE10_0:
> +        return ARMMMUIdx_Stage1_SE0;
> +    case ARMMMUIdx_SE10_1:
> +        return ARMMMUIdx_Stage1_SE1;
> +    case ARMMMUIdx_SE10_1_PAN:
> +        return ARMMMUIdx_Stage1_SE1_PAN;
> +    case ARMMMUIdx_E10_0:
> +        return ARMMMUIdx_Stage1_E0;
> +    case ARMMMUIdx_E10_1:
> +        return ARMMMUIdx_Stage1_E1;
> +    case ARMMMUIdx_E10_1_PAN:
> +        return ARMMMUIdx_Stage1_E1_PAN;
> +    default:
> +        return mmu_idx;
> +    }
> +}
> +
> +int aa64_va_parameter_tbi(uint64_t tcr, ARMMMUIdx mmu_idx);
> +int aa64_va_parameter_tbid(uint64_t tcr, ARMMMUIdx mmu_idx);

I can see these being needed for get-phys-addr -- and that probably answers my
arm_mmu_idx_el question earlier too.


> +uint32_t rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
> +                            ARMMMUIdx mmu_idx);
> +uint32_t rebuild_hflags_a32(CPUARMState *env, int fp_el, ARMMMUIdx mmu_idx);
> +uint32_t rebuild_hflags_m32(CPUARMState *env, int fp_el, ARMMMUIdx mmu_idx);

However these really really shouldn't be used for !tcg.  I would even wrap
CPUARMState::hflags in #ifdef CONFIG_TCG to enforce that.

I think maybe the best option is

    if (tcg_enabled()) {
        rebuild_hflags();
    }

so that we don't spend the time on the rebuild for a regular build that has
both tcg and kvm enabled, and the symbol gets
compiled out when tcg is disabled.


r~

