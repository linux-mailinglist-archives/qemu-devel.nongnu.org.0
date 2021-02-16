Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72BA931C48D
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 01:20:44 +0100 (CET)
Received: from localhost ([::1]:55704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBo6d-0007el-GQ
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 19:20:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lBo5O-00070t-Kk
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 19:19:26 -0500
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:44542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lBo5M-0008KP-ID
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 19:19:26 -0500
Received: by mail-pf1-x42a.google.com with SMTP id t29so5094600pfg.11
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 16:19:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=sJS81q6FaiDnXy/WNv7DiZYjDDLJO5pUW1sgH/dlk4o=;
 b=zRHqTV+ZefPnr6+2bGh8Iq7QmgtaEBe0IO69+27dgoUvNmsKrDsJkfMu9aF+KsoSTT
 j1dpFBIojJuKU5pIqecuc0SURINCU0sGDxOR8p2YS6IJo/5nzTD02FPBvGmRsDLUijzj
 Sg6kpvzzmEZoBd5Dgy9XIOunNb7AVFQV0RbRNYNZUjygc2V9Os5N+enG3PGjnamhoh46
 DVfyiykgzUkiNWhz0abJaPU6Uamm1quJeUF/ZOm8eWqKl76A73Fvn0dpaoEP9bm9RBaX
 GwUm/SJZkjSrWw8FonaQ1kRvBkimm78eCh3uPGaJaaRqqzWe/0leSCnbl9/RUaiZ4neO
 TFAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sJS81q6FaiDnXy/WNv7DiZYjDDLJO5pUW1sgH/dlk4o=;
 b=uZ3fPhCiRSoVr6qNWlHfK7JJi5KutIbxOON3c4SeINNpGPAGbu7rLdhHhEzphnGqwc
 rnrDXciyRSOSoRRD7D18qgA4o06CFZOjWc/O9rAvtHkx8Ea7QGVBvI3IN4h8CnsUOq3X
 53HvY6njf2O+NG7dAbRHpXt7/GsWEq9/C3XGkZ7fhK6y6H+pf6XjKycgZSk7fv8dE9I/
 DngRtvtDIdj+wquXX3koCM3aohaEMAOeZaSuiduHN63QWnMU+fIFNW7K6S+zj4Q74UOL
 Lu66XjgZ5pLSeMQ29ve0dHp1hqRhNws5V7HkeG+At+Wm5nmZuz+HlHF9PmVXlV37rbDK
 z86g==
X-Gm-Message-State: AOAM530uvA+eHSx6+pq1etmAO0h5Crh2TAgXa7zQuczBTJNPqZzIeoDP
 c+en6PC38vbiXMJNmJ0V6QcDSz42tR6tbA==
X-Google-Smtp-Source: ABdhPJzNCP3Ix9jB0bUhmri2g2aJRLoM8Ty9p+MMBK7gcJE132OWyNXsRv9VvdfbIXHKUJOmzcMj6w==
X-Received: by 2002:a63:1561:: with SMTP id 33mr17013265pgv.13.1613434762899; 
 Mon, 15 Feb 2021 16:19:22 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id k5sm19476000pfi.31.2021.02.15.16.19.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Feb 2021 16:19:22 -0800 (PST)
Subject: Re: [PATCH 1/3] target/arm: Add support for FEAT_SSBS, Speculative
 Store Bypass Safe
To: Rebecca Cran <rebecca@nuviainc.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210215215819.1142-1-rebecca@nuviainc.com>
 <20210215215819.1142-2-rebecca@nuviainc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e4233ca8-72a2-5213-1832-b326db071b49@linaro.org>
Date: Mon, 15 Feb 2021 16:19:19 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210215215819.1142-2-rebecca@nuviainc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/15/21 1:58 PM, Rebecca Cran wrote:
> @@ -960,6 +960,12 @@ static void cpsr_write_from_spsr_elx(CPUARMState *env,
>          val |= CPSR_DIT;
>      }
>  
> +    /* Move SSBS to the correct location for CPSR */
> +    if (val & PSTATE_SSBS) {
> +        val &= ~PSTATE_SSBS;
> +        val |= CPSR_SSBS;
> +    }

Incorrect.  SPSR_ELx leaves this at the same position as CPSR: bit 23.

>          }
> +
> +        if (cpu_isar_feature(aa32_ssbs, env_archcpu(env))) {
> +            if (env->cp15.sctlr_el[new_el] & SCTLR_DSSBS_32) {
> +                env->uncached_cpsr |= CPSR_SSBS;
> +            } else {
> +                env->uncached_cpsr &= ~CPSR_SSBS;
> +            }
> +        }

Hoist this so that it can be shared with the HYP branch (hsctlr is mapped to
sctlr_el[2] and HYP maps to el=2).

> @@ -9809,6 +9846,13 @@ static uint32_t cpsr_read_for_spsr_elx(CPUARMState *env)
>          ret &= ~CPSR_DIT;
>          ret |= PSTATE_DIT;
>      }
> +
> +    /* Move SSBS to the correct location for SPSR_ELx */
> +    if (ret & CPSR_SSBS) {
> +        ret &= ~CPSR_SSBS;
> +        ret |= PSTATE_SSBS;
> +    }

Incorrect, like in cpsr_write_from_spsr_elx.

> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
> index 1c4b8d02f3b8..2372d55ea18b 100644
> --- a/target/arm/translate-a64.c
> +++ b/target/arm/translate-a64.c
> @@ -1712,6 +1712,18 @@ static void handle_msr_i(DisasContext *s, uint32_t insn,
>          /* There's no need to rebuild hflags because DIT is a nop */
>          break;
>  
> +    case 0x19: /* SSBS */
> +        if (!dc_isar_feature(aa64_ssbs, s)) {
> +            goto do_unallocated;
> +        }
> +        if (crm & 1) {
> +            set_pstate_bits(PSTATE_SSBS);
> +        } else {
> +            clear_pstate_bits(PSTATE_SSBS);
> +        }
> +        /* Don't need to rebuild hflags since SSBS is a nop */
> +        break;

Put this above DIT (0x1a) to keep the numbers in order.


r~

