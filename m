Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D6B37CB34
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 18:56:33 +0200 (CEST)
Received: from localhost ([::1]:49074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgs9w-0000dy-NN
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 12:56:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lgs8R-0007sS-UQ
 for qemu-devel@nongnu.org; Wed, 12 May 2021 12:54:59 -0400
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832]:42896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lgs8P-00023W-2q
 for qemu-devel@nongnu.org; Wed, 12 May 2021 12:54:59 -0400
Received: by mail-qt1-x832.google.com with SMTP id k10so4157431qtp.9
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 09:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=k2PT7VF9vzxhn0MLlndYvOqibqS4UxlDOSTB14dOk6M=;
 b=PzTjNtupXzUWFkFkLjcVftJBIj7y5JKirPXBkb2FaH/wbhGBIYZ/eBj++/crbn6s9s
 Ij8CEKuEyAZ4iC0daNUI6mGnXfU3FrzlwrCYxdB+Yr6X7kd1GgHyF/4e7TmtHLW1gnmi
 WM5cKdSYSVUGWz/uCUD/Go7ta3RkipBMYGK5zrVEV5p7CZfLN1KbGuoDt4/S8/Y2I9J7
 iIqm21JEVKEtstya3IeuFGMk43ooH2vJ1AjTs0Fsg6U3OgPR6ic7wZ3PM4y4Crd6kS+Y
 BcxVV7Qlhjyzr6ZqJPdg5EwGqxRivXGgNkRIwyfUlAfAKwUCzjMZrtcN1WAf6/rc4+Va
 TaMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=k2PT7VF9vzxhn0MLlndYvOqibqS4UxlDOSTB14dOk6M=;
 b=fB3OUST8MUf0g/VU9fHFWb1dUsmPYuHQhs8ctuVFBP0dZE7GIQanrzQdD+Tk2qVM7/
 EGewsIPtnJyIst8fo1W4o6LuhEAdABAhDTLA8mOVVbdSVULzXFqwbRgfypkyRI7QQqhR
 P7CP3gOy+WCf5NwxlCmgQjAyK37N9ltbBJ7hIWIxpYVFxrqahPp7NgfgvhC4MLdNcsVx
 kShwcKN3Rk/9zvafzHuNOlyivmD3C8GPj9kUT07Rdy/JMsIFEaZ64oTXfcqO+6Q0p1um
 /OUoMaGTSXUlgTKWNInP2FMlAXX5UBw8JZeGfML/47XJmCAeJTWwX6p9K9vX14VOqlNv
 nZ1Q==
X-Gm-Message-State: AOAM531CKCJ7UATBTbask9lzygFqkB/iiNgGbb1e97yXU30l+JnrlNAe
 sFr9frXru/UN8RUnaunLF7ruaA==
X-Google-Smtp-Source: ABdhPJx6frL3q5jE/lPjlyyQNNL6rwzDa+pK80v4l8CL68gEOsX15ljCPj6fj/paDUef8NZ8VPUkmw==
X-Received: by 2002:ac8:1487:: with SMTP id l7mr23087577qtj.60.1620838495953; 
 Wed, 12 May 2021 09:54:55 -0700 (PDT)
Received: from [192.168.180.118] (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id i10sm444804qko.68.2021.05.12.09.54.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 May 2021 09:54:55 -0700 (PDT)
Subject: Re: [PATCH 02/11] target/ppc: moved ppc_store_sdr1 to cpu.c
To: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>,
 qemu-devel@nongnu.org
References: <20210512140813.112884-1-bruno.larsen@eldorado.org.br>
 <20210512140813.112884-3-bruno.larsen@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <44c4f833-e02a-5ecc-3004-9ffcf9861e48@linaro.org>
Date: Wed, 12 May 2021 11:54:52 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210512140813.112884-3-bruno.larsen@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::832;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x832.google.com
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
Cc: farosas@linux.ibm.com, luis.pires@eldorado.org.br,
 lucas.araujo@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, matheus.ferst@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/12/21 9:08 AM, Bruno Larsen (billionai) wrote:
> Moved this function that is required in !TCG cases into a
> common code file
> 
> Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


> +void ppc_store_sdr1(CPUPPCState *env, target_ulong value)
> +{
> +    PowerPCCPU *cpu = env_archcpu(env);
> +    qemu_log_mask(CPU_LOG_MMU, "%s: " TARGET_FMT_lx "\n", __func__, value);
> +    assert(!cpu->vhyp);
> +#if defined(TARGET_PPC64)
> +    if (mmu_is_64bit(env->mmu_model)) {
> +        target_ulong sdr_mask = SDR_64_HTABORG | SDR_64_HTABSIZE;
> +        target_ulong htabsize = value & SDR_64_HTABSIZE;
> +
> +        if (value & ~sdr_mask) {
> +            error_report("Invalid bits 0x"TARGET_FMT_lx" set in SDR1",
> +                         value & ~sdr_mask);

As a separate cleanup patch, this should not use error_report but 
qemu_log(LOG_GUEST_ERROR, ...).


r~

