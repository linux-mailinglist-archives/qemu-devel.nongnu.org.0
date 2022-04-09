Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 410184FAA79
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Apr 2022 21:21:48 +0200 (CEST)
Received: from localhost ([::1]:35108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndGeX-0002K8-Ve
	for lists+qemu-devel@lfdr.de; Sat, 09 Apr 2022 15:21:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndGdP-0001S3-VI
 for qemu-devel@nongnu.org; Sat, 09 Apr 2022 15:20:35 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:42609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndGdO-0000jo-AP
 for qemu-devel@nongnu.org; Sat, 09 Apr 2022 15:20:35 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 n6-20020a17090a670600b001caa71a9c4aso12812770pjj.1
 for <qemu-devel@nongnu.org>; Sat, 09 Apr 2022 12:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=is6yeiSacSKhf9W+7glsLtTAKVzs4aaTXeLOlqtIRb0=;
 b=QP9y7PrCzIyC6vAH1VfNn7jPjgWVuzOKcKreWdeKXxr0R8vVveU7bGQWAQ4tHG0XhX
 5TYY2G2nzULWQ0Li5YL+fQt5xfsTd1AqfodGoKXa9R7mx77l/8V7GABRHuUYWQl7nwmZ
 3LzXLPddjtPovRpLfJfrxab9UwC+pxu51k51QozcN+RTJU0yNi+N9l33q0b+3ZH5i57D
 OJ5y8ybOwffT+r5exrDn8VJVGDvXqiNWKLWSq2yN4K0zjiItPPNpzNHYKaitVvT6wxhh
 H8J7vwR2BXJMyZqWVFsXPzR5xiq8jBZb3n+VvIX1Z1+m3bJveYAzHAG1MDG0GJ7DfJZM
 Qy6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=is6yeiSacSKhf9W+7glsLtTAKVzs4aaTXeLOlqtIRb0=;
 b=pNfVNyX3ixckIg+styltBHflrRtJFn/Upjb+7WuLlCkUOPzT229/V+2tnYe7Fb+tAY
 QMYvnALuMVe/KRkt6t34snm27lhfxZaNdvszbQLLXwXXkBfS25ioD5YnUGIe/bdU1KZj
 dywrTjng64O8xQ3xCv8s1ty+jXAwlgklQGJ6u4inRZHwGVomKYVCovEnlHWZL4TAoWD4
 wGAiV8zUhipHT5bIT9gmD78qcnppKYuvTqpFCPB7jkNb4bX1m3e3gTBbbzXZiLdS1Yig
 LsSpXp1mQHxCvY9dXDC3sywrjg1cm09vQ0Rh5AMSLKz4cCis2GU8mTHJ9ac81K53F9cV
 dxKg==
X-Gm-Message-State: AOAM533x559udMaXKG2UpUwVFMfeveQkrdYuGL2YYObIan78FLXsvHzC
 POprrDWUqp96A7vvXjgkXt0hHQ==
X-Google-Smtp-Source: ABdhPJzOMQi2hRsbYOSduVeyhmyNF5bIBafC3u1NXOFpzqIK8aFJKHMRYok84qdSP7fIdMNIDtx7Rw==
X-Received: by 2002:a17:90a:14f:b0:1cb:55d9:42d9 with SMTP id
 z15-20020a17090a014f00b001cb55d942d9mr8173653pje.196.1649532032692; 
 Sat, 09 Apr 2022 12:20:32 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 q10-20020a056a00088a00b004f7ceff389esm31471726pfj.152.2022.04.09.12.20.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Apr 2022 12:20:32 -0700 (PDT)
Message-ID: <3a9e2d33-8174-d480-50e4-4da0985bc486@linaro.org>
Date: Sat, 9 Apr 2022 12:20:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 25/41] hw/intc/arm_gicv3_cpuif: Support vLPIs
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
 <20220408141550.1271295-26-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220408141550.1271295-26-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Marc Zyngier <maz@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/8/22 07:15, Peter Maydell wrote:
> The CPU interface changes to support vLPIs are fairly minor:
> in the parts of the code that currently look at the list registers
> to determine the highest priority pending virtual interrupt, we
> must also look at the highest priority pending vLPI. To do this
> we change hppvi_index() to check the vLPI and return a special-case
> value if that is the right virtual interrupt to take. The callsites
> (which handle HPPIR and IAR registers and the "raise vIRQ and vFIQ
> lines" code) then have to handle this special-case value.
> 
> This commit includes two interfaces with the as-yet-unwritten
> redistributor code:
>   * the new GICv3CPUState::hppvlpi will be set by the redistributor
>     (in the same way as the existing hpplpi does for physical LPIs)
>   * when the CPU interface acknowledges a vLPI it needs to set it
>     to non-pending; the new gicv3_redist_vlpi_pending() function
>     (which matches the existing gicv3_redist_lpi_pending() used
>     for physical LPIs) is a stub that will be filled in later
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


> @@ -2632,6 +2735,12 @@ static void gicv3_cpuif_el_change_hook(ARMCPU *cpu, void *opaque)
>       GICv3CPUState *cs = opaque;
>   
>       gicv3_cpuif_update(cs);
> +    /*
> +     * Because vLPIs are only pending in NonSecure state,
> +     * an EL change can change the VIRQ/VFIQ status (but
> +     * cannot affect the maintenance interrupt state)
> +     */
> +    gicv3_cpuif_virt_irq_fiq_update(cs);

I'm a little bit surprised this is here, and not in arm_cpu_exec_interrupt (or a 
subroutine).  Is this because if a virq has highest priority, we have to find the highest 
prio physical interrupt?


r~

