Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCAE6433F55
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 21:37:30 +0200 (CEST)
Received: from localhost ([::1]:58762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcuvR-0008Mp-H5
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 15:37:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mcuu0-0007cT-Ta
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 15:36:00 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:36444)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mcuty-00027w-V7
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 15:36:00 -0400
Received: by mail-pg1-x535.google.com with SMTP id 75so20347293pga.3
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 12:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=braVKJMwfQR5D7Y3y2uNPRT/FwD8TB3tKyBsqUfLSHM=;
 b=hPSklZFXuHBDTprVr8rDQTigii6YlrA+jzqD+/JhdKkPerTbaNWBgsdN1VqEqzrUZb
 D84dHKsXyuTMmcbSl6HL7sVYL8GUvzoLMih6CwGYDHoNhIiu7JoECar1HiOKC7Ps9pl1
 2TzijOOo5dl1VmEKmGj0FSwLYumZpVOQnhoR+xWHpRjVBvqfLqvqOJtWW0HezpJWswea
 axKPBMw4t73J/JrsoiHey4Puuu5oXVkxvS8kuy0cTUdr9gcguU2ED+8VQnV3jkDNYNBf
 rnYB/y076O0JAtI5aOHOighXUQmFg/EnGhKpVI44kTtipC68z9bbtITDuyiIgWiP2WTR
 W9pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=braVKJMwfQR5D7Y3y2uNPRT/FwD8TB3tKyBsqUfLSHM=;
 b=EOYt1C4FaOBZzvST6MNvqL8fPxh7RLWt5x1+gPuFCiY+V+O+YnefH8Rdkll3YDvFxS
 aX122Hpjf6V+XBBhDZFYPPoG7GB3VYpqzAbL1gNxlOcJ4tEm+bCh9wZ7om9TguTC/RBB
 +YHBDnO+ELMUTI+5LgjXV+5dJz60pVV3Cnt8nEGmEGniXjhXRAr8iOdRBCKJ+N4mMmX+
 b+GJpZGSlFT+J/Pswj+1WUby9okUg4r9H+PLvlk+lHo0ziT3EpMPPLvab0FYNk+UVz1K
 IjUI4oFtqLMiXZjAKgr1Hp5Hj4g5JORFokXBeMlaxgK5SHKfts0ZiF0YgDdmQ+TdEQoZ
 nboQ==
X-Gm-Message-State: AOAM5312Ar5PwGig/UMkLG6cDlfCMrqdgFP4EelGhafSIVMS2J7pPjxo
 93CCDK46FXojSmVs718HdkYhHA==
X-Google-Smtp-Source: ABdhPJxpYd/E0OV+oHMZHz/0uQSQPcxx/+KQmjOGqyhlbRx15CuQ58sAO4lKSZiwb5ugrhrrHA3t5Q==
X-Received: by 2002:a05:6a00:cce:b0:44c:af88:eb00 with SMTP id
 b14-20020a056a000cce00b0044caf88eb00mr1780267pfv.45.1634672157344; 
 Tue, 19 Oct 2021 12:35:57 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id nv5sm8797pjb.10.2021.10.19.12.35.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Oct 2021 12:35:56 -0700 (PDT)
Subject: Re: [PATCH 04/31] target/loongarch: Add basic vmstate description of
 CPU.
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
References: <1634628917-10031-1-git-send-email-yangxiaojuan@loongson.cn>
 <1634628917-10031-5-git-send-email-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <53e001d7-2066-6359-535f-ab561d15e482@linaro.org>
Date: Tue, 19 Oct 2021 12:35:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1634628917-10031-5-git-send-email-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.074,
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, chenhuacai@loongson.cn,
 mst@redhat.com, philmd@redhat.com, mark.cave-ayland@ilande.co.uk,
 laurent@vivier.eu, peterx@redhat.com, f4bug@amsat.org,
 alistair.francis@wdc.com, maobibo@loongson.cn, gaosong@loongson.cn,
 pbonzini@redhat.com, bmeng.cn@gmail.com, alex.bennee@linaro.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/19/21 12:34 AM, Xiaojuan Yang wrote:
> +#ifndef CONFIG_USER_ONLY
> +#include "hw/core/sysemu-cpu-ops.h"
> +
> +static const struct SysemuCPUOps loongarch_sysemu_ops = {
> +    .legacy_vmsd = &vmstate_loongarch_cpu,
> +};
> +#endif
The documentation for legacy_vmsd is quite clear:

     Do not use in new targets, use #DeviceClass::vmsd instead.

> +/* LoongArch CPU state */
> +
> +const VMStateDescription vmstate_loongarch_cpu = {
> +    .name = "cpu",
> +    .version_id = 20,
> +    .minimum_version_id = 20,

Version id should start at 0.


r~

