Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B496FF9C3
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 21:08:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxBde-0004UE-Cq; Thu, 11 May 2023 15:07:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pxBdb-0004Th-Gk
 for qemu-devel@nongnu.org; Thu, 11 May 2023 15:07:39 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pxBdZ-0002VT-7J
 for qemu-devel@nongnu.org; Thu, 11 May 2023 15:07:39 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3f42d937d2eso22686985e9.2
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 12:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683832055; x=1686424055;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=b1UDSMddng2cBm/tdkQbEUu2Eaicrtf1sbYY/olUT10=;
 b=tdqERcPjQ6ReHN62sSZU6j1DfV3naGSJd01qbQ7FcfDOFksFSNw1KM713D2MmZxiYg
 yErVqrWu7s9kwZ6U7TXtb8uPpppuipmYCtrHQPS12rCucFpeIgSr+SZUp5H9l2D7qk2X
 FKUrwNYtudJGzRbahkllLytNpoH+1vDPaRJnkZGQgbEV2tY5BzxzhnCAJuAx8R8R1Izz
 2n3Zf0/x0v6A+fE3S2tfakNsBa4xIkCm5m6yR3a8sDWU4/Eji9KfUYMLQcLrMUJ3juiJ
 HyCcxU/E+t+wgD03W2QUsH9KuczzPxf+Mj88vMeLQ03XgO354AwpmWTMbMUYG1I2blce
 ayMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683832055; x=1686424055;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=b1UDSMddng2cBm/tdkQbEUu2Eaicrtf1sbYY/olUT10=;
 b=ZlcDMpq+dqtVHTGYnrHVeVh0wSzRPL9vclB0kL2dTYd5ubJ8IUFu4QobnTfLnHq/QY
 ac1I81Y3eLH8TTpw2seQ/XoBOeRACmz7iez9QubPt6ngRqr+2xOcC0+9UTPZA+C+NU5H
 UvaRWbKgo8nD+nFuhm2RiN3RRUSUndzl5cGtghEhq3b2A8na7G2Bkl/cJcZE3gRoCeJM
 J+0o/ZDHtBHXBhLOcSv5O7Yj5PsgZh7rucWf+7mMm4aFIaog2yei7uGJ+8Zw8ez90m/b
 FaEvr78Qe/QCTpkpq3mzWLzkWj+3/V66aXDh/SdTT1AwetouResd7RISToLxNiFrCe2C
 mgcA==
X-Gm-Message-State: AC+VfDxNnsUVmuj495EIo3iKOzmveOYADZz8u+VlzhoxkhvyXKeHyT2c
 hH08uosfdkYk37tYccaedqbHdg==
X-Google-Smtp-Source: ACHHUZ4ExgGordNJJH/fNuTT2NFG3/l1QJ47jO+85vbfGeDa87y5h9SF7n4NxKUg7hyajPgh1/y65A==
X-Received: by 2002:a5d:56c6:0:b0:307:87ee:5c4f with SMTP id
 m6-20020a5d56c6000000b0030787ee5c4fmr14167532wrw.46.1683832055349; 
 Thu, 11 May 2023 12:07:35 -0700 (PDT)
Received: from [192.168.69.115] ([176.176.152.186])
 by smtp.gmail.com with ESMTPSA id
 c22-20020a7bc016000000b003f4e3ed9912sm4494137wmb.46.2023.05.11.12.07.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 May 2023 12:07:34 -0700 (PDT)
Message-ID: <25022b82-e42e-8201-afa8-69251dcb575b@linaro.org>
Date: Thu, 11 May 2023 21:07:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.1
Subject: Re: [PATCH 3/3] hw/loongarch/virt: Set max 256 cpus support on
 loongarch virt machine
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, maobibo@loongson.cn, yangxiaojuan@loongson.cn
References: <20230406100052.3355632-1-gaosong@loongson.cn>
 <20230406100052.3355632-3-gaosong@loongson.cn>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230406100052.3355632-3-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.124,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 6/4/23 12:00, Song Gao wrote:
> Add separate macro EXTIOI_CPUS for extioi interrupt controller, extioi
> only supports 4 cpu. And set macro LOONGARCH_MAX_CPUS as 256 so that
> loongarch virt machine supports more cpus.
> 
> Interrupts from external devices can only be routed cpu 0-3 because
> of extioi limits, cpu internal interrupt such as timer/ipi can be
> triggered on all cpus.
> 
> Signed-off-by: Song Gao <gaosong@loongson.cn>
> ---
>   hw/intc/loongarch_extioi.c         |  4 ++--
>   hw/loongarch/virt.c                | 21 ++++++++++++++-------
>   include/hw/intc/loongarch_extioi.h | 10 ++++++----
>   include/hw/loongarch/virt.h        |  2 +-
>   4 files changed, 23 insertions(+), 14 deletions(-)


> @@ -618,10 +623,12 @@ static void loongarch_irq_init(LoongArchMachineState *lams)
>        * cpu_pin[9:2] <= intc_pin[7:0]
>        */
>       for (cpu = 0; cpu < ms->smp.cpus; cpu++) {
> -        cpudev = DEVICE(qemu_get_cpu(cpu));
> -        for (pin = 0; pin < LS3A_INTC_IP; pin++) {
> -            qdev_connect_gpio_out(extioi, (cpu * 8 + pin),
> -                                  qdev_get_gpio_in(cpudev, pin + 2));
> +        if (cpu < EXTIOI_CPUS) {

Alternatively:

            for (cpu = 0; cpu < MIN(ms->smp.cpus, EXTIOI_CPUS); cpu++) {

> +            cpudev = DEVICE(qemu_get_cpu(cpu));
> +            for (pin = 0; pin < LS3A_INTC_IP; pin++) {
> +                qdev_connect_gpio_out(extioi, (cpu * 8 + pin),
> +                                      qdev_get_gpio_in(cpudev, pin + 2));
> +	    }
>           }
>       }

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


