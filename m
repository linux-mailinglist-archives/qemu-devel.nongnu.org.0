Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D3861506C
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Nov 2022 18:19:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opsOw-0003vX-S7; Tue, 01 Nov 2022 10:38:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opsOu-0003v8-TT
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 10:38:00 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opsOd-0003qf-0f
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 10:37:53 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 c3-20020a1c3503000000b003bd21e3dd7aso12887914wma.1
 for <qemu-devel@nongnu.org>; Tue, 01 Nov 2022 07:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mfyAck5bY61yO/dbkVAQJ/XFFJQ+IWwoeaGi1cr0ERU=;
 b=wQYoX4MG6qZLfaWlsBOODYhOlv708wQ/cpm0359gGfFM6uXYQCe6k4H4JnApUAzkTj
 jfgbwnu1YM0FiDLf/bAofHyX9HRMF3A2tewpaAhvQ7G6Iz+yct+43aGfrTWas+9PJ45k
 kxRfsz9PDiNRvRYhgVc8Jo2e+9k4nm2RAIR7l8UVWcrpY6YjVGXtjEiOXohOPsvb8J0f
 N4vREbfhU0aazgKdk1p6rWLX5mbLfiQyIp53SlJBLqCBEVdZZaPPF1oEaF1mAd+uNtM5
 2YFJajFdvy334DYy+34NMT46ahv81oJ43SbFdHciCmjDFSvvop2vTwG2Q4e8bPKODxdU
 Hjxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mfyAck5bY61yO/dbkVAQJ/XFFJQ+IWwoeaGi1cr0ERU=;
 b=YUa85RQtqlEDTWtTfvkmNV0yd3wixavsvoCV6gLDJ6a4TVtFWffExrv39PZaTmnsNC
 KoGiUfBhT0ns6Uwswv8IrTLlZW5tSKMhmJWHzuru56m8xo9LPeXPPBA8/mSrD2F/TXJt
 ZvCdGMKYs+f/4M0hRoOb7+IhVDTSIGNHBivIg63l8FBlQ+3mpCrv8XTljHRJtsW7DQdL
 sVSwUaFjK2fM90qZm14PEukVWpUsApgbqQ0X90ttac09LcKiPi4PXhQ8uD2C2W3v5+Zn
 ngJAvvRl4rDxwfRJHv/b4T9KADkAQi8ZRkPkZmbscFxPuOHxEyqM01GQ18EbCWqhi9GQ
 5VPQ==
X-Gm-Message-State: ACrzQf1dbJGi7PxLBFvhi+pltaMZ0CkxYBYyqMSPPLbANGQZC03t6HP7
 kZJ+ovNxJr2PTWGiUFlVhK67tg==
X-Google-Smtp-Source: AMsMyM5n2Oyz2//DN9jsCe7yLNZ3Wvpjylodk9AoHYj8vPS0GkwcjRZ+2+kG/g7HCLCChLXHuyWGjQ==
X-Received: by 2002:a05:600c:a04:b0:3b4:f20e:63f4 with SMTP id
 z4-20020a05600c0a0400b003b4f20e63f4mr12205790wmp.201.1667313461388; 
 Tue, 01 Nov 2022 07:37:41 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 bl19-20020adfe253000000b00236576c8eddsm10235157wrb.12.2022.11.01.07.37.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Nov 2022 07:37:40 -0700 (PDT)
Message-ID: <c891442a-8049-132c-2c3e-f15e1eda946a@linaro.org>
Date: Tue, 1 Nov 2022 15:37:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [PATCH v8 17/17] pci: Remove legacy errp from pci_add_capability
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, qemu-arm@nongnu.org,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, John Snow <jsnow@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, Jason Wang
 <jasowang@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Paul Burton <paulburton@kernel.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Yan Vugenfirer <yan@daynix.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>
References: <20221101135749.4477-1-akihiko.odaki@daynix.com>
 <20221101135749.4477-18-akihiko.odaki@daynix.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221101135749.4477-18-akihiko.odaki@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 1/11/22 14:57, Akihiko Odaki wrote:
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>   hw/pci/pci.c         | 20 +++++---------------
>   include/hw/pci/pci.h | 12 ++----------
>   2 files changed, 7 insertions(+), 25 deletions(-)
> 
> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> index cce57f572c..41de7643af 100644
> --- a/hw/pci/pci.c
> +++ b/hw/pci/pci.c
> @@ -2532,14 +2532,11 @@ bool pci_check_capability_overlap(PCIDevice *pdev, uint8_t cap_id,
>   }
>   
>   /*
> - * On success, pci_add_capability_legacy() returns a positive value
> - * that the offset of the pci capability.
> - * On failure, it sets an error and returns a negative error
> - * code.
> + * pci_add_capability() returns a positive value that the offset of the pci
> + * capability.

Simpler:

"Return: offset of the PCI capability."

>    */
> -int pci_add_capability_legacy(PCIDevice *pdev, uint8_t cap_id,
> -                              uint8_t offset, uint8_t size,
> -                              Error **errp)
> +uint8_t pci_add_capability(PCIDevice *pdev, uint8_t cap_id,
> +                           uint8_t offset, uint8_t size)
>   {
>       uint8_t *config;
>   


