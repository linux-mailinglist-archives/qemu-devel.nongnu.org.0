Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 109E7533394
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 00:34:45 +0200 (CEST)
Received: from localhost ([::1]:34890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntd6x-0003uD-Vp
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 18:34:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ntd5M-0003Ae-Qb
 for qemu-devel@nongnu.org; Tue, 24 May 2022 18:33:04 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:39672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ntd5K-0000rv-KZ
 for qemu-devel@nongnu.org; Tue, 24 May 2022 18:33:04 -0400
Received: by mail-pf1-x42a.google.com with SMTP id y1so1632058pfr.6
 for <qemu-devel@nongnu.org>; Tue, 24 May 2022 15:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=G+g0ebDx717jSTD3RNGa5oZHwKpOWnIeNF4+ZcKUaOU=;
 b=AviggVTsOkbsBHmNYUD3PL02Yk1Q7Xu+o1mbJmTKzeqCvtZaFIF1a83uaj/fMdDzAb
 D4xrY5rjP+CqPJRUCPBvW6r/NvhCw5x+TG0EBTn00nJhQMC+Tpg8mamRFSJ0MEsQeX79
 OvTFlGwUdBAVdWzfPV2C+DI/KfzOHpQYh32/wdLNLIFmkt7Yio/aTLnJ2L3EpBGz+jkx
 uI7D/cPKcgWNyQmMKGKjUsoAdIYqMN8RsF7q/pc3W+Wabx9XRCvyTUZXdeS7VR+XhtuW
 Egr8uKuEN0waJioGTXu/QJU4mNpcX8jDBk4ijOYm828gsfNH5LyOsXsA3QIKe1tKIkPS
 rfng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=G+g0ebDx717jSTD3RNGa5oZHwKpOWnIeNF4+ZcKUaOU=;
 b=ZFnUw4OscxL2UBFsZvzluxZ9343iy77elXzalm4VjY0UtSg1sNTNJ5R62HV0GevYfE
 /v6NdGs0wS/syucVxvOaZNw803MQUBPi14w+Xza22lPXoAyiCSJ66yPGwECQtUrPNaa/
 f5DfOcQyXMRT9eXbbC7itSHijhN9zls05PQOcdeqLQ4qVTXGXQcd+M5p8GMxShLsD5b4
 N2rTES//o/S+YBd1ciur4cIvGgypZF51YLo0L26ErxSUkRlTOMsZLZmNH60VmOv8dZVq
 TzzvHDK9o6G7RQfXheDCH4k+Nh7ed5yLCgu6nyf1t3X8HrxIBJTNX2b0mU8q6UVsky6Z
 t1vA==
X-Gm-Message-State: AOAM530hqqMJczTPZmk0EdNyxCzzH36/WyLEGYOHMY2NpwDXQs+6M4Yj
 ay42MOLbGivGJGXZSYqLPX7wMQ==
X-Google-Smtp-Source: ABdhPJyhNgVc6QK2aQKm5pK7rG8CGWiyxFmADgH76QQxk81drslM2iTwYBPXasOmpsHuQyxWKcZryQ==
X-Received: by 2002:a63:fa50:0:b0:3fa:c20d:3f01 with SMTP id
 g16-20020a63fa50000000b003fac20d3f01mr2635982pgk.419.1653431577072; 
 Tue, 24 May 2022 15:32:57 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 m13-20020a170902f64d00b0015e9f45c1f4sm7606878plg.186.2022.05.24.15.32.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 May 2022 15:32:56 -0700 (PDT)
Message-ID: <3fce1517-2d55-0bce-eb7b-1bfbdcc7af22@linaro.org>
Date: Tue, 24 May 2022 15:32:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v5 00/43] Add LoongArch softmmu support
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
Cc: gaosong@loongson.cn, mark.cave-ayland@ilande.co.uk, mst@redhat.com,
 imammedo@redhat.com, ani@anisinha.ca
References: <20220524081804.3608101-1-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220524081804.3608101-1-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/24/22 01:17, Xiaojuan Yang wrote:
> Hi All,
> 
> As this series only supports running binary files in ELF format, and
> does not depend on BIOS and kernel file. so this series are changed from RFC to patch vX.
> 
> 
> The manual:
>    - https://github.com/loongson/LoongArch-Documentation/releases/tag/2022.03.17
> 
> Old series:
>    - https://patchew.org/QEMU/20220328125749.2918087-1-yangxiaojuan@loongson.cn/
>    - https://patchew.org/QEMU/20220106094200.1801206-1-gaosong@loongson.cn/
> 
> Need review patches:
>    - 0034-hw-intc-Add-LoongArch-extioi-interrupt-controller-EI.patch
>    - 0038-hw-loongarch-Add-LoongArch-ls7a-rtc-device-support.patch
> 
> This patch need ACPI maintainers review:
>    - 0040-hw-loongarch-Add-LoongArch-ls7a-acpi-device-support.patch
>      
> 
> Thanks.
> Xiaojuan
> 
> -----
> v5:
>    - Fixed loongarch extioi device emulation.
>    - Fixed loongarch rtc device emulation.
>    - Fixed 'make docker-test-build' error.

I had been tempted to accept the patch set as is, and let subsequent development happen on 
mainline, but this patch set does not compile, with obvious syntax errors.

When the syntax errors are fixed, it does not pass "make check".

How can you have tested this?


r~

