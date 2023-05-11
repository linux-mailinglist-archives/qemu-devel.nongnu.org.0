Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 789746FF9F2
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 21:13:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxBhi-0006Ox-Kx; Thu, 11 May 2023 15:11:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pxBhg-0006Oa-Pr
 for qemu-devel@nongnu.org; Thu, 11 May 2023 15:11:52 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pxBhf-0003JK-7m
 for qemu-devel@nongnu.org; Thu, 11 May 2023 15:11:52 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-3f315735514so297070805e9.1
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 12:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683832309; x=1686424309;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kmTMdwY4sCJyAMN3I+z13fwUjt3hJ9Eo0ntFWDayFTE=;
 b=MJnMUy/Wjqc18tI5TRmWPVHDObW7ow+Om7Zx/lcLTKZl1QA190YgxCEkqef7PadCJj
 QwaT0ZOOBxAisuwnDL7G58au7I0eAGb7uCgvYTIWwNZqlYoatRRpO85J3o8HxPLAnPSW
 hKNcH4zPIPVhyQ/EWAqXknT9Pzr8bQ3B1FkafLEEMdSBDrhEbpfqsPCjsrl86Bk3nOjg
 gyUZ83kTbdfqeoPDJSLv5Jlwhr6AYYeT/xzsG9bu0rpkTDeJVGap0c7shSIToaeigJPc
 8k3lkn9TPFm8y2TqZteyV/RlwNRifPx7PVQhmdyJQLgbKsivSBr97G7iHRhwrMJztg9D
 F4Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683832309; x=1686424309;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kmTMdwY4sCJyAMN3I+z13fwUjt3hJ9Eo0ntFWDayFTE=;
 b=K4v+fYW5q3vaEFl9l4VM81PrscVWR4v2+uUTxoM6XPr1eVGOpgF1uBmLtMFQIapFCp
 9jYxmFbKqx8MWiOamox/vft+XhWhAQbL/Cp2fumJ01vuLw7AdXx2AZJyfQ7DJs/+Jzhx
 K6JpaBGLwDVa/dKvGMH/PY4tnutUgvY5TCxqRinfmSnHZ+8Awl4udaQ2MXfS7/YdGsVx
 nSFjbLwObLcZIO5mKKixUST7U5NsEzN7vGaIbJMCRGV8X5gVGQcrKaFOiiP92s7yIY4s
 NMyxBVPu4Wm8IG+CylV6anp37Uifnq85niIUIT+HpR5nr1AXOBdn2LyLON/quy3zX8Ct
 s5lg==
X-Gm-Message-State: AC+VfDyDiak2uKKSKX2VC/SuQADDFoMORkXhZZKVor5XPFKOm5oJdFOw
 rfxrDC7CMjN/Yti8MS/G2yhQBQ==
X-Google-Smtp-Source: ACHHUZ7YhMUzzkVBThe2FMtiRJJodeWWP1JfMex8Ems+SXL0Czw6e4a+ClDlU1zdZf721OKJYWJhOA==
X-Received: by 2002:a05:600c:3b04:b0:3f4:2736:b5e6 with SMTP id
 m4-20020a05600c3b0400b003f42736b5e6mr8994464wms.14.1683832309264; 
 Thu, 11 May 2023 12:11:49 -0700 (PDT)
Received: from [192.168.69.115] ([176.176.152.186])
 by smtp.gmail.com with ESMTPSA id
 o10-20020a1c750a000000b003f42bb3a5adsm8675659wmc.4.2023.05.11.12.11.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 May 2023 12:11:48 -0700 (PDT)
Message-ID: <7694e099-684b-8259-eb0d-bd3b17b6b97b@linaro.org>
Date: Thu, 11 May 2023 21:11:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.1
Subject: Re: [PATCH 1/3] hw/loongarch/virt: Modify ipi as percpu device
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, maobibo@loongson.cn, yangxiaojuan@loongson.cn
References: <20230406100052.3355632-1-gaosong@loongson.cn>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230406100052.3355632-1-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
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
> ipi is used to communicate between cpus, this patch modified
> loongarch ipi device as percpu deivce, so that there are
> 2 MemoryRegions with ipi device, rather than 2*cpus
> MemoryRegions, which may be large than QDEV_MAX_MMIO if
> more cpus are added on loongarch virt machine.
> 
> Signed-off-by: Song Gao <gaosong@loongson.cn>
> ---
>   hw/intc/loongarch_ipi.c         | 32 ++++++++++----------------------
>   hw/loongarch/virt.c             | 12 ++++++------
>   include/hw/intc/loongarch_ipi.h | 10 ++++------
>   include/hw/loongarch/virt.h     |  1 -
>   4 files changed, 20 insertions(+), 35 deletions(-)


>   static const VMStateDescription vmstate_ipi_core = {
> @@ -233,7 +223,7 @@ static const VMStateDescription vmstate_ipi_core = {
>           VMSTATE_UINT32(en, IPICore),
>           VMSTATE_UINT32(set, IPICore),
>           VMSTATE_UINT32(clear, IPICore),
> -        VMSTATE_UINT32_ARRAY(buf, IPICore, MAX_IPI_MBX_NUM * 2),
> +        VMSTATE_UINT32_ARRAY(buf, IPICore, 2),

Since this break the migration stream, you should update the version_id.

>           VMSTATE_END_OF_LIST()
>       }
>   };
> @@ -243,9 +233,7 @@ static const VMStateDescription vmstate_loongarch_ipi = {
>       .version_id = 0,

Ditto.

>       .minimum_version_id = 0,
>       .fields = (VMStateField[]) {
> -        VMSTATE_STRUCT_ARRAY(ipi_core, LoongArchMachineState,
> -                             MAX_IPI_CORE_NUM, 0,
> -                             vmstate_ipi_core, IPICore),
> +        VMSTATE_STRUCT(ipi_core, LoongArchIPI, 0, vmstate_ipi_core, IPICore),
>           VMSTATE_END_OF_LIST()
>       }
>   };

The rest LGTM.

