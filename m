Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F566579511
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 10:15:01 +0200 (CEST)
Received: from localhost ([::1]:58402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDiNg-0002fa-2D
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 04:15:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oDiFa-0007xS-OB
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 04:06:40 -0400
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d]:44557)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oDiFX-0004B2-AK
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 04:06:38 -0400
Received: by mail-qt1-x82d.google.com with SMTP id r21so9775959qtn.11
 for <qemu-devel@nongnu.org>; Tue, 19 Jul 2022 01:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=LrtSMZp+82RfRxux6eS0DLOALhcNMaUrMTtzK+7YHwo=;
 b=AX5tIdRkIKLQV9UVrAt/Y1upUdpdIhpkY2v69IL4fde1RAJ8wmzunsX8g+DyQkAIFV
 OPmDuu1O/m2uGHReecDHDX+z02ZXQx8IQ3rOdS2A5xhfE3Qv6wbHJBFbc2AhJ8ZRZ0qv
 jLKt5TjiW21NiZTod9vIPdPrTKNhZTSueQylaqt8ha/THOBHxjWfYV7wHlx9po7tZXFp
 1JdnYWkaJIad+Ov3U40R4Hv7vcUfohNPsAmeG4ilMPz4LI75qM3qmF1FH1QzegyexUzg
 Wf30pj2XHqKLXRoPywj8AULjasjM2OHY4ffEHSWYn2fi63v90jt7DT4uTXdI/0/jXZNR
 CxuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=LrtSMZp+82RfRxux6eS0DLOALhcNMaUrMTtzK+7YHwo=;
 b=efyRb6MZuSctGNsT4raRp59jxqm1Od0Z+m+FjE1GyMdJCv1ozEowFF7Ug5Igd2KEZk
 CsQp8h9zC7R1FxXbhHxWKs7JTCTDc29JCf6BLCCVQx+ZbHnLNX2aqtkGfA9lR/SiDxrD
 tcN4E97L2JWaiL2QJlMvvqJli1vwot8VLJN2lz+a6v0IbaaLSItlX+ebqcWFgnBOOzlR
 CoGmZ0gjnFux8vOGYEiuFTTwbJjBVBnMJtSnsIB+XRAYXqjB0jB0Zq/sSY1ONp4VeCjq
 HWN4CPn1Z7Vf9RbM19Ayr6ynIkszJ3ik38UKxmnkPSWMNP4sUFnoTBnE7wDjuSDvpQQk
 0Jlg==
X-Gm-Message-State: AJIora9YEbZDKp2uMpu0cU449gR4iRQp1f50lYXJx3R4XbkdYI/nC2ds
 flFNjqagxMpVugG4WSlmFIekhFK9sMt829F8
X-Google-Smtp-Source: AGRyM1t8lvF9ou1NU+OLMCNaInJqknZKXz/Jhh3WwAsjLuY5O35IDVeU6lcwm1wDIALdvVF0waZfNw==
X-Received: by 2002:a05:622a:4d0:b0:31e:e89f:f4ae with SMTP id
 q16-20020a05622a04d000b0031ee89ff4aemr9814836qtx.626.1658217994000; 
 Tue, 19 Jul 2022 01:06:34 -0700 (PDT)
Received: from [192.168.113.227] ([172.58.139.163])
 by smtp.gmail.com with ESMTPSA id
 l1-20020a05620a28c100b006b5e6dac3b0sm5500148qkp.128.2022.07.19.01.06.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Jul 2022 01:06:30 -0700 (PDT)
Message-ID: <cbb053d5-3c2e-7f0f-1079-e926f4bb09e7@linaro.org>
Date: Tue, 19 Jul 2022 13:36:18 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 5/6] hw/loongarch: Add acpi ged support
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
Cc: gaosong@loongson.cn, maobibo@loongson.cn, mark.cave-ayland@ilande.co.uk,
 mst@redhat.com, imammedo@redhat.com, ani@anisinha.ca, f4bug@amsat.org,
 peter.maydell@linaro.org
References: <20220712083206.4187715-1-yangxiaojuan@loongson.cn>
 <20220712083206.4187715-6-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220712083206.4187715-6-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82d;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82d.google.com
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

On 7/12/22 14:02, Xiaojuan Yang wrote:
> Loongarch virt machine uses general hardware reduces acpi method, rather
> than LS7A acpi device. Now only power management function is used in
> acpi ged device, memory hotplug will be added later. Also acpi tables
> such as RSDP/RSDT/FADT etc.
> 
> The acpi table has submited to acpi spec, and will release soon.
> 
> Signed-off-by: Xiaojuan Yang<yangxiaojuan@loongson.cn>
> ---
>   hw/loongarch/Kconfig        |   2 +
>   hw/loongarch/acpi-build.c   | 609 ++++++++++++++++++++++++++++++++++++
>   hw/loongarch/loongson3.c    |  78 ++++-
>   hw/loongarch/meson.build    |   1 +
>   include/hw/loongarch/virt.h |  13 +
>   include/hw/pci-host/ls7a.h  |   4 +
>   6 files changed, 704 insertions(+), 3 deletions(-)
>   create mode 100644 hw/loongarch/acpi-build.c

I'm not familiar with this at all, but it looks plausible.

Acked-by: Richard Henderson <richard.henderson@linaro.org>


r~

