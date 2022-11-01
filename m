Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 722E0614E6A
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Nov 2022 16:34:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opsVU-0004aI-4b; Tue, 01 Nov 2022 10:44:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opsVQ-0004Yq-S6
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 10:44:44 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opsVM-0005pj-0v
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 10:44:44 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 l16-20020a05600c4f1000b003c6c0d2a445so10041868wmq.4
 for <qemu-devel@nongnu.org>; Tue, 01 Nov 2022 07:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xKTa0mR5hBmfEmWEqGHAKRiS8BLiQuvkQCe2gZ1TIhQ=;
 b=Dc5CihmrDvslNvvFzWu4gB8J/tQAvk6ddr0Nd+yBrOUUNWUe1J/BZVcW40Guw7c26I
 tfhnMR3gek3ajsX0odKOpOz/KJ5a0+MOZEkDSRz/bP7PBM/RIKAKbejLvMJhcxgArjtc
 UsbEuQPGiNvLJlXIuM6RoRreIzJBb+HSOiCXIjFm3ByoWyVMw3pghrnVTwdz8oMSeE3v
 UqbvivNjd46wueiYEJwiefLhSXLmbPXKEiGlGEXSKCGGuwqwp4cTKJMnVuY64d+yqRdW
 olLZzGmyEwlKpdT0vG6JCzwMCbxpIERYPl70ikgLeUnLRXtPX1uEoZ9tupv4wBsM4FsL
 9TOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xKTa0mR5hBmfEmWEqGHAKRiS8BLiQuvkQCe2gZ1TIhQ=;
 b=fblRzEgVBVe6C21/WbmHPCsECGJJHJDJ8lrevx4lqZcdYhZ5hqcwzCsvihM6kYwiGM
 iQe4Dzy++w5QQ0CVAyTXkCFlsCX5sxaidRydtuey5VsV4dobJMkGpSOs0SWlC+F2JlrO
 ZFfJlvnoRnzzZ4sug8PM9+KVk08qG9idnGJegUJN3kubbo4bwTVNcpi76Q71JzmuY4+q
 zy71PunRiqHLYR8aj0qaS6ydmL8eoQaRJsXtKBgekewPms0JANHIYdtVI1YZ8DxKrw+9
 3qDeXYvh6Pgp3+ISDPfRkiPUfByuW+Zf2mH0drgLFcSVnjsF3/6kR0oRw2VNSXnmIf+O
 NIYQ==
X-Gm-Message-State: ACrzQf17ltN4jOcRp02eXqEISdTp7XuY1tRtkWM5XhDVwux1nPExmlYH
 nbf8fDhl+iv/PeRdcNsfYz2+hQ==
X-Google-Smtp-Source: AMsMyM4ADSTTtojV5zbgLhSAS1DqCXffssZZfF4hWWlMUXzKctC8CQb7ZnCjchpcqoMPJAbAEHXaqQ==
X-Received: by 2002:a05:600c:1906:b0:3c6:f83e:d15f with SMTP id
 j6-20020a05600c190600b003c6f83ed15fmr22323659wmq.205.1667313877041; 
 Tue, 01 Nov 2022 07:44:37 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 t6-20020a5d6906000000b002322bff5b3bsm867376wru.54.2022.11.01.07.44.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Nov 2022 07:44:36 -0700 (PDT)
Message-ID: <b96f7ad7-e2b1-28a0-c1cd-5ee402de2ac1@linaro.org>
Date: Tue, 1 Nov 2022 15:44:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [PATCH v8 01/17] hw/vfio/pci: Ensure MSI and MSI-X do not overlap
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
 <20221101135749.4477-2-akihiko.odaki@daynix.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221101135749.4477-2-akihiko.odaki@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

On 1/11/22 14:57, Akihiko Odaki wrote:
> pci_add_capability() checks whether capabilities overlap, and notifies
> its caller so that it can properly handle the case. However, in the
> most cases, the capabilities actually never overlap, and the interface
> incurred extra error handling code, which is often incorrect or
> suboptimal. For such cases, pci_add_capability() can simply abort the
> execution if the capabilities actually overlap since it should be a
> programming error.
> 
> This change handles the other cases: hw/vfio/pci depends on the check to
> decide MSI and MSI-X capabilities overlap with another. As they are
> quite an exceptional and hw/vfio/pci knows much about PCI capabilities,
> adding code specific to the cases to hw/vfio/pci still results in less
> code than having error handling code everywhere in total.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>   hw/pci/pci.c         | 34 ++++++++++++++++++++++------------
>   hw/vfio/pci.c        | 15 ++++++++++++++-
>   include/hw/pci/pci.h |  3 +++
>   3 files changed, 39 insertions(+), 13 deletions(-)

>   /*
>    * On success, pci_add_capability() returns a positive value
>    * that the offset of the pci capability.
> @@ -2523,7 +2542,6 @@ int pci_add_capability(PCIDevice *pdev, uint8_t cap_id,
>                          Error **errp)
>   {
>       uint8_t *config;
> -    int i, overlapping_cap;
>   
>       if (!offset) {
>           offset = pci_find_space(pdev, size);
> @@ -2534,17 +2552,9 @@ int pci_add_capability(PCIDevice *pdev, uint8_t cap_id,
>            * depends on this check to verify that the device is not broken.
>            * Should never trigger for emulated devices, but it's helpful
>            * for debugging these. */
> -        for (i = offset; i < offset + size; i++) {
> -            overlapping_cap = pci_find_capability_at_offset(pdev, i);
> -            if (overlapping_cap) {
> -                error_setg(errp, "%s:%02x:%02x.%x "
> -                           "Attempt to add PCI capability %x at offset "
> -                           "%x overlaps existing capability %x at offset %x",
> -                           pci_root_bus_path(pdev), pci_dev_bus_num(pdev),
> -                           PCI_SLOT(pdev->devfn), PCI_FUNC(pdev->devfn),
> -                           cap_id, offset, overlapping_cap, i);
> -                return -EINVAL;
> -            }
> +        pci_check_capability_overlap(pdev, cap_id, offset, size, errp);
> +        if (errp) {

            if (!pci_check_capability_overlap(...)) {

> +            return -EINVAL;
>           }
>       }

