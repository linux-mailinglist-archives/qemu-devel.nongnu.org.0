Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D800530646D
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 20:49:05 +0100 (CET)
Received: from localhost ([::1]:47812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4qoK-0008CS-VL
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 14:49:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l4qmz-0007lx-KO
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 14:47:41 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:46872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l4qmx-0006Xt-IF
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 14:47:40 -0500
Received: by mail-ej1-x62f.google.com with SMTP id rv9so4303072ejb.13
 for <qemu-devel@nongnu.org>; Wed, 27 Jan 2021 11:47:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=n4+sW9wOIKKEUIslbPmY5Q1/sY8gatbXL24XtAvQTMU=;
 b=GpMDUhXKKUiD6fubb3ND/2bLAvHpqpRm2x1Hd8CGb6/EfRFESfYk7xIM4PatiCK+qz
 DfN837QG0a2mgYimhj4sSRDNl5bUkBI+VZLsOlueTwvC9WCZU9N2tARnkfCnCiMEPPmb
 3qvDW/lFMndCDR+JwqEXDgn2NCUWarEG90wrfs2+UHTbNb4viJshvIxE+K9+i1VbF6Z9
 vta5Y+rmRQ9UaVyLtyNnO4pWs1Mj0A6drz5Xp36gbI4bKo5wkPvQbgudJ3JVFGijqvnt
 7osCncCnKrz+7KkLTfPl9d2FBiRCnyYdgIZ/nN0alkqi0PJEi4r9XLbZq/MktqLDUhJ9
 8PBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=n4+sW9wOIKKEUIslbPmY5Q1/sY8gatbXL24XtAvQTMU=;
 b=rYoA2iOcdmAXInv1SVVBDrBIRFEyH2Flx0qcMhdwlFioLNwbfQX5fpFSGiXFIguLHF
 hYCaIKjG7S+XiqBUKSjUfilVWq9LvMnpbx6ALhDhohe6Xz/raQ3d/T9gKd2y0E5HsnN8
 ExSzFYJucC7gh0mWpExzYiqV0CG5xbrpOT6hFqkblQ8zvGKruQLHBLplf8A3SXvjQdZn
 z6KKHSSQS9YedTJGO1oxIYaQxW5anLGgwS9r4orM85svlLjtY+SzpxOEW9xDaIU/0M+x
 84qLRPY50ME1i45sGM1kdHspuOV7Hp9mDxSrxaJPeEdLe7Y98iYXnv8E2w+NWfRLazbS
 oI+g==
X-Gm-Message-State: AOAM533vxJpqi2zso5QUwNncs3a8Hb813aYKoe5jac2bcBafc4aj68tn
 XgN/IFgD9hrampj3K5BBgbw=
X-Google-Smtp-Source: ABdhPJwG/cRtwsTIVRYPRMzGbwAHwwfEwOZtmQ3l7jfo1HHpX2eqXh8Cjemvz3tiBcg/a+mvwQmw3w==
X-Received: by 2002:a17:907:9f9:: with SMTP id
 ce25mr8528506ejc.352.1611776856717; 
 Wed, 27 Jan 2021 11:47:36 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id di28sm1851265edb.71.2021.01.27.11.47.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Jan 2021 11:47:35 -0800 (PST)
Subject: Re: [Qemu-devel] [PULL 22/27] target/tricore: Convert to
 CPUClass::tlb_fill
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20190510151944.22981-1-richard.henderson@linaro.org>
 <20190510151944.22981-23-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <24bafad8-fc8b-64f4-7622-ff59d52c1482@amsat.org>
Date: Wed, 27 Jan 2021 20:47:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20190510151944.22981-23-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Richard,

On 5/10/19 5:19 PM, Richard Henderson wrote:
> Acked-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/tricore/cpu.h       |  6 +++---
>  target/tricore/cpu.c       |  1 +
>  target/tricore/helper.c    | 27 +++++++++++++++++++--------
>  target/tricore/op_helper.c | 26 --------------------------
>  4 files changed, 23 insertions(+), 37 deletions(-)
...

>  #define DEFINE_TRICORE_CPU_TYPE(cpu_model, initfn) \
> diff --git a/target/tricore/helper.c b/target/tricore/helper.c
> index 78ee87c9ea..ed184fee3a 100644
> --- a/target/tricore/helper.c
> +++ b/target/tricore/helper.c
> @@ -50,8 +50,9 @@ static void raise_mmu_exception(CPUTriCoreState *env, target_ulong address,
>  {
>  }
>  
> -int cpu_tricore_handle_mmu_fault(CPUState *cs, target_ulong address,
> -                                 int rw, int mmu_idx)
> +bool tricore_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
> +                          MMUAccessType rw, int mmu_idx,
> +                          bool probe, uintptr_t retaddr)
>  {
>      TriCoreCPU *cpu = TRICORE_CPU(cs);
>      CPUTriCoreState *env = &cpu->env;

Completing the patch:

       hwaddr physical;
       int prot;
       int access_type;
       int ret = 0;

       rw &= 1;

       ^^^^^^^

This became a bit fragile... Having:

typedef enum MMUAccessType {
    MMU_DATA_LOAD  = 0,
    MMU_DATA_STORE = 1,
    MMU_INST_FETCH = 2
} MMUAccessType;

I see this enum has fixed value, but still...

Maybe we could have an helper to explicit the 'rw &= 1' magic?

>      access_type = ACCESS_INT;
>      ret = get_physical_address(env, &physical, &prot,
>                                 address, rw, access_type);
> -    qemu_log_mask(CPU_LOG_MMU, "%s address=" TARGET_FMT_lx " ret %d physical " TARGET_FMT_plx
> -                  " prot %d\n", __func__, address, ret, physical, prot);
> +
> +    qemu_log_mask(CPU_LOG_MMU, "%s address=" TARGET_FMT_lx " ret %d physical "
> +                  TARGET_FMT_plx " prot %d\n",
> +                  __func__, (target_ulong)address, ret, physical, prot);
>  
>      if (ret == TLBRET_MATCH) {
>          tlb_set_page(cs, address & TARGET_PAGE_MASK,
>                       physical & TARGET_PAGE_MASK, prot | PAGE_EXEC,
>                       mmu_idx, TARGET_PAGE_SIZE);
> -        ret = 0;
> -    } else if (ret < 0) {
> +        return true;
> +    } else {
> +        assert(ret < 0);
> +        if (probe) {
> +            return false;
> +        }
>          raise_mmu_exception(env, address, rw, ret);
> -        ret = 1;
> +        cpu_loop_exit_restore(cs, retaddr);
>      }
> +}

