Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4724C4EA123
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 22:08:20 +0200 (CEST)
Received: from localhost ([::1]:34984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYvf0-0006Zw-Us
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 16:08:18 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nYvdV-0005m6-Sy
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 16:06:45 -0400
Received: from [2001:4860:4864:20::33] (port=36151
 helo=mail-oa1-x33.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nYvdQ-0001zQ-Mk
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 16:06:41 -0400
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-df014ca245so4171772fac.3
 for <qemu-devel@nongnu.org>; Mon, 28 Mar 2022 13:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=wmtkGd8UyNUOHflOjAtLDojVk0UfxY+2+20uUsi7KWE=;
 b=iQBKg9XF9jbiVNyDgTLaIR671YihlIrFWgv4CwiIesiHyglxQNL9pVUU+dTp6swhWn
 7lkkntiga/jRApCteyRi32VB1poMewvx1QMjV+iMkJIKT+C7QUOX4SZBWbRZmmmgkUlL
 CH3ayjX0QAcDB2jbqTxyVhadMd+2OLZjTUAOUMoUowO7UQ4zE5xjSnLDeTCiT5XBQwAr
 ymPbK8dUedaXlcq3EbLkU3bWR02kXH/DMQnHYNt8EwRyT/iB+WioLHyhBRLC1iNfncne
 2UvOHnkXT71Ur+NbwyLwrblH8puvcaT6A5CrAoNXJGpsROOCc2T2Hyzp6adVAeR3bM7L
 8H9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=wmtkGd8UyNUOHflOjAtLDojVk0UfxY+2+20uUsi7KWE=;
 b=hy8+7SILNmhIuouHW/P2GX/ZBZWr1DbvsXCC2wiVnvujpzPH3eEaViL/YCape+A/8y
 Py52BCsY94uK4MBYgDJwxq3tSj8Fjcrud+WV0R/cJRl3zxcnP1qKJ/Vik79VUW+9sCnE
 m9vIKK0Jpm2O7JESF0gh5lKoz7ct9UWAAaHHG9tGZCu/DG+SqhKqJGOElQnTSHz+K5uR
 AsREwOkf9G6Rf9y8QEvlAmKUyKl1Xxu4EONhcpprAqu2K2wnIfjfLTnxDq+gnqm8nJY8
 9J08rWjXNV17jK3yA596X+jhCG4sG7ukGctG+DCqCZ8/jSbJ7WETjz7wPRRgP/w+uhmR
 Mrdw==
X-Gm-Message-State: AOAM532rYarV/WxQngONyxrBRvKf7VoMlub3T7FM0tjLdNdY2gsl5VR6
 0t7uNs2/NHjioSh3vkZpYvRQGQ==
X-Google-Smtp-Source: ABdhPJyxZWpkdU7z7HCJdBVL4RHlwHuH5RH1XzHl3UeTI99Q7l/eckubzkLGFQcVzXT4fuv0xYoQOg==
X-Received: by 2002:a05:6871:694:b0:dd:a43e:fc9f with SMTP id
 l20-20020a056871069400b000dda43efc9fmr407831oao.225.1648497999197; 
 Mon, 28 Mar 2022 13:06:39 -0700 (PDT)
Received: from [172.24.1.26] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168]) by smtp.gmail.com with ESMTPSA id
 r3-20020aca4403000000b002ecf4d70c83sm7642346oia.27.2022.03.28.13.06.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Mar 2022 13:06:37 -0700 (PDT)
Message-ID: <1590cdc6-5195-2dad-5e1f-ce6517c945ab@linaro.org>
Date: Mon, 28 Mar 2022 14:06:34 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC PATCH v7 06/29] target/loongarch: Add MMU support for
 LoongArch CPU.
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
References: <20220328125749.2918087-1-yangxiaojuan@loongson.cn>
 <20220328125749.2918087-7-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220328125749.2918087-7-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:4860:4864:20::33
 (failed)
Received-SPF: pass client-ip=2001:4860:4864:20::33;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x33.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: mark.cave-ayland@ilande.co.uk, Song Gao <gaosong@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/28/22 06:57, Xiaojuan Yang wrote:
> +bool loongarch_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
> +                            MMUAccessType access_type, int mmu_idx,
> +                            bool probe, uintptr_t retaddr)
> +{
> +    LoongArchCPU *cpu = LOONGARCH_CPU(cs);
> +    CPULoongArchState *env = &cpu->env;
> +    hwaddr physical;
> +    int prot;
> +    int ret = TLBRET_BADADDR;
> +
> +    /* Data access */
> +    ret = get_physical_address(env, &physical, &prot, address,
> +                               access_type, mmu_idx);
> +
> +    if (ret == TLBRET_MATCH) {
> +        tlb_set_page(cs, address & TARGET_PAGE_MASK,
> +                     physical & TARGET_PAGE_MASK, prot,
> +                     mmu_idx, TARGET_PAGE_SIZE);
> +        qemu_log_mask(CPU_LOG_MMU,
> +                      "%s address=%" VADDR_PRIx " physical " TARGET_FMT_plx
> +                      " prot %d\n", __func__, address, physical, prot);
> +        return true;
> +    } else {
> +        qemu_log_mask(CPU_LOG_MMU,
> +                      "%s address=%" VADDR_PRIx " ret %d\n", __func__, address,
> +                      ret);
> +    }
> +    if (probe) {
> +        return false;
> +    } else {

Drop the else and unindent.

> +        raise_mmu_exception(env, address, access_type, ret);
> +        do_raise_exception(env, cs->exception_index, retaddr);

You do not need do_raise_exception here, as you have already assigned to 
cs->exception_index (obviously).  Just cpu_loop_exit_restore(cs, retaddr).

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

