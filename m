Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6F93DEA39
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 12:02:45 +0200 (CEST)
Received: from localhost ([::1]:59600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mArG0-0004Kh-8t
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 06:02:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mArEx-0003Bk-CC
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 06:01:39 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:38778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mArEv-0003GY-H3
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 06:01:38 -0400
Received: by mail-wr1-x42c.google.com with SMTP id l18so24648216wrv.5
 for <qemu-devel@nongnu.org>; Tue, 03 Aug 2021 03:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YGWQuHX9Uw7UYAKZa5yTm0SzNrdl1u6arGZRKyxjEHo=;
 b=cW9aOzayUG52nKa+u0iN85QUtS/7AHWXGcwwhVCQ1EKRQ+qcifWZa+ruzlaCxHzKRb
 eqPbMkJRo3J3RSX/OC9PQlWHYAdMVxcxAUYghh0Zft4AmauJeJM+3RataLFOmWI1y2Oj
 wSNZdl4Sn0hskstLj29fJufby7ZMF9clh9JSqxd709H5LX+M0dvLYfI3RWkryL95qZGZ
 qB69brgQJfceQ3IOj4mSNxeMbfQds/WSqA3VQjyt3+HXFcgsmtoNbHwJatMYrN+peiTT
 9f/h0lbb0bTTXEyZ9TwDKwjZGIWF2zdQjb62SC8SNYl1NjQrk5+HfdrVGAKBiJR6L9lY
 JD2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YGWQuHX9Uw7UYAKZa5yTm0SzNrdl1u6arGZRKyxjEHo=;
 b=DV8qAfp28CsAtnXWbz9mpsuFeCnvvckhIQu62HzKsk5AcMve6bAEwCoLhRoQ6ffJuX
 +9ulh4USsuAXJpg11Gr5dByFiaWw8BIbJg6rPWCQGXDDy+11w/lzCg9Qbfha5tOOckPA
 WJS8xobV/dPDHcUxPSarDEfx2lQW4f3idCmP/Tmvw3Py+PhU97IQ4ASD4syo2TBvJ5z6
 Z1Y95At1XvF8KfmCe+LC5ljpY4OydrfRC0C//9UxTTElkleDNIj4s0+D1eSEnSYHX3pi
 zuoggOvD6StUkkjIIJjQF9COxMzFME8k8y8khH2xa7IxCEhK5EXhFuBEAEpIYZyXfb77
 q8jg==
X-Gm-Message-State: AOAM532uxfYV+IhtMsoy++nnELgSBUNbRcZYafqIw2xPR1eg09oC1Xe6
 RyehjkhXraVUQ0N71GzIgxZFqliFcdeQIA==
X-Google-Smtp-Source: ABdhPJw+Qjw+EbcRq4OhRIQPf+jxFgvfG+z9cVl+q+rI2wfuvvUyzFEGqZCX9W3C08s/8Hl4l/OElQ==
X-Received: by 2002:adf:ed51:: with SMTP id u17mr21785802wro.416.1627984895545; 
 Tue, 03 Aug 2021 03:01:35 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id p3sm1998042wmp.25.2021.08.03.03.01.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Aug 2021 03:01:35 -0700 (PDT)
Subject: Re: [PATCH v2 01/55] hw/core: Make do_unaligned_access noreturn
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210803041443.55452-1-richard.henderson@linaro.org>
 <20210803041443.55452-2-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <44c12946-e1a9-55d4-3fa3-fb61b2644b8f@amsat.org>
Date: Tue, 3 Aug 2021 12:01:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210803041443.55452-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 8/3/21 6:13 AM, Richard Henderson wrote:
> While we may have had some thought of allowing system-mode
> to return from this hook, we have no guests that require this.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/hw/core/tcg-cpu-ops.h  | 3 ++-
>  target/alpha/cpu.h             | 4 ++--
>  target/arm/internals.h         | 3 ++-
>  target/microblaze/cpu.h        | 2 +-
>  target/mips/tcg/tcg-internal.h | 4 ++--
>  target/nios2/cpu.h             | 4 ++--
>  target/ppc/internal.h          | 4 ++--
>  target/riscv/cpu.h             | 2 +-
>  target/s390x/s390x-internal.h  | 4 ++--
>  target/sh4/cpu.h               | 4 ++--
>  target/xtensa/cpu.h            | 4 ++--
>  target/hppa/cpu.c              | 7 ++++---
>  12 files changed, 24 insertions(+), 21 deletions(-)

> diff --git a/target/alpha/cpu.h b/target/alpha/cpu.h
> index 82df108967..6eb3fcc63e 100644
> --- a/target/alpha/cpu.h
> +++ b/target/alpha/cpu.h
> @@ -283,8 +283,8 @@ hwaddr alpha_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
>  int alpha_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
>  int alpha_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
>  void alpha_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,
> -                                   MMUAccessType access_type,
> -                                   int mmu_idx, uintptr_t retaddr);
> +                                   MMUAccessType access_type, int mmu_idx,
> +                                   uintptr_t retaddr) QEMU_NORETURN;
>  
>  #define cpu_list alpha_cpu_list
>  #define cpu_signal_handler cpu_alpha_signal_handler
> diff --git a/target/arm/internals.h b/target/arm/internals.h
> index cd2ea8a388..3da9b1c61e 100644
> --- a/target/arm/internals.h
> +++ b/target/arm/internals.h
> @@ -594,7 +594,8 @@ bool arm_s1_regime_using_lpae_format(CPUARMState *env, ARMMMUIdx mmu_idx);
>  /* Raise a data fault alignment exception for the specified virtual address */
>  void arm_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
>                                   MMUAccessType access_type,
> -                                 int mmu_idx, uintptr_t retaddr);
> +                                 int mmu_idx, uintptr_t retaddr)
> +    QEMU_NORETURN;

This one ended misaligned, I'd align as:

                                    QEMU_NORETURN;

Otherwise:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

