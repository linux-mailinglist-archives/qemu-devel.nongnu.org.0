Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 086CE2ECB60
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 09:04:16 +0100 (CET)
Received: from localhost ([::1]:37328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxQHF-0004uz-BB
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 03:04:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxQFu-00046r-Hd
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 03:02:50 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:33331)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxQFp-00072B-5q
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 03:02:46 -0500
Received: by mail-wm1-x332.google.com with SMTP id n16so4417973wmc.0
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 00:02:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=WMZqloQd42iZSJZ2Lt1jZRsiRnwickTJRSV4yVPb7Us=;
 b=BijxUtEdU7DkjVwJ9nmAUEtVGtF3wV2oqsUAvWQmnirHq5CxmJXT5VQXXMkOf65KYT
 qTdXQn2yIgEIJlfChCDUtXxrsnl3iGxFWA04VkGIUTSxYMoRavAT157ebB/33bztv8ew
 aG1sb2zCRlqdZPLUtQkl/fux05VyIObro//zUv+4UIHjPWaNaiesOmw00MpNjxgtcWJ9
 0sv3uW6HkLX5bZNuUWQMGurYzuMipfMLcopIScG0+zo5YAtF8WB2yU6Z3UTgqmkLYb2j
 zMLk5qLVjSCenQLKnZ2cM3icTp/mEBMFpugoaZ9ZrkgmXo4a6P/6tsbtug4iBf+ArJ2J
 WEWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WMZqloQd42iZSJZ2Lt1jZRsiRnwickTJRSV4yVPb7Us=;
 b=ZD0nCp8Bz/jm9i1DpAjUQ0FTXtRhsaC0XxoLGt9pvAUIcSZcisLXw7Sv7lP3XfiQht
 vbV06HmEtzTyuWZmR73NCEuKXE0zUcpThkqZ88myHKKJGol+wPLeYykPY9uOurNksD4a
 qhDVZrON7IiR+ikaSixL9HNK0eVYvU5mnWWujXxy4VojmZ2CbZBOcAmk/+X0h99hxXPT
 coGasznZrDyg2Oyhrv0wFIEr0E5rFsHEk6c5GFBOCbW8FTeI/R5ocHJwfGKocLInjNLy
 KWGwdPJtuULgGgCMVRJMb260n+izD0/UnS4xaAzvX4m6ftWWdBvL1ioNEPMimLf0r2PP
 wucA==
X-Gm-Message-State: AOAM533GhT8fKHBhTzj1da3Ekoeg8/f/ZMcxheN/xEO5qZMOBaSI8YWx
 JCwa9NjajWsMZPsCnM1JBO4=
X-Google-Smtp-Source: ABdhPJyUuhriXsEbgobf8Vb0lAdqW17SlmtJMdDOUnOiH7Khb+uARmnAWeQbOaMrL/1NXd2MLOOugA==
X-Received: by 2002:a1c:98c7:: with SMTP id a190mr6889583wme.184.1610006563690; 
 Thu, 07 Jan 2021 00:02:43 -0800 (PST)
Received: from [192.168.1.36] (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id v4sm7322997wrw.42.2021.01.07.00.02.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Jan 2021 00:02:42 -0800 (PST)
Subject: Re: [PATCH 05/12] vt82c686: Make vt82c686b-pm an abstract base class
 and add vt8231-pm based on it
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org
References: <cover.1609967638.git.balaton@eik.bme.hu>
 <c8fa8df147473c3ec5f3284b4a5d37fc9741e824.1609967638.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <bb288088-db7b-005d-db5a-5a41fb15f069@amsat.org>
Date: Thu, 7 Jan 2021 09:02:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <c8fa8df147473c3ec5f3284b4a5d37fc9741e824.1609967638.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Igor Mammedov <imammedo@redhat.com>, Huacai Chen <chenhuacai@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Zoltan,

On 1/6/21 10:13 PM, BALATON Zoltan wrote:
> The vt82c686b-pm model can be shared between VT82C686B and VT8231. The
> only difference between the two is the device id in what we emulate so
> make an abstract via-pm model by renaming appropriately and add types
> for vt82c686b-pm and vt8231-pm based on it.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>  hw/isa/vt82c686.c         | 87 ++++++++++++++++++++++++++-------------
>  include/hw/isa/vt82c686.h |  1 +
>  2 files changed, 59 insertions(+), 29 deletions(-)
...

> +typedef struct via_pm_init_info {
> +    uint16_t device_id;
> +} ViaPMInitInfo;
> +
>  static void via_pm_class_init(ObjectClass *klass, void *data)
>  {
>      DeviceClass *dc = DEVICE_CLASS(klass);
>      PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
> +    ViaPMInitInfo *info = data;
>  
> -    k->realize = vt82c686b_pm_realize;
> +    k->realize = via_pm_realize;
>      k->config_write = pm_write_config;
>      k->vendor_id = PCI_VENDOR_ID_VIA;
> -    k->device_id = PCI_DEVICE_ID_VIA_ACPI;
> +    k->device_id = info->device_id;
>      k->class_id = PCI_CLASS_BRIDGE_OTHER;
>      k->revision = 0x40;
> -    dc->reset = vt82c686b_pm_reset;
> -    dc->desc = "PM";
> +    dc->reset = via_pm_reset;

> +    /* Reason: part of VIA south bridge, does not exist stand alone */
> +    dc->user_creatable = false;
>      dc->vmsd = &vmstate_acpi;
> -    set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);

Please do this change in a previous patch.

>  }
>  
>  static const TypeInfo via_pm_info = {
> -    .name          = TYPE_VT82C686B_PM,
> +    .name          = TYPE_VIA_PM,
>      .parent        = TYPE_PCI_DEVICE,
> -    .instance_size = sizeof(VT686PMState),
> -    .class_init    = via_pm_class_init,
> +    .instance_size = sizeof(ViaPMState),
> +    .abstract      = true,
>      .interfaces = (InterfaceInfo[]) {
>          { INTERFACE_CONVENTIONAL_PCI_DEVICE },
>          { },
>      },
>  };
>  
> +static const ViaPMInitInfo vt82c686b_pm_init_info = {
> +    .device_id = PCI_DEVICE_ID_VIA_ACPI,
> +};
> +
> +static const TypeInfo vt82c686b_pm_info = {
> +    .name          = TYPE_VT82C686B_PM,
> +    .parent        = TYPE_VIA_PM,
> +    .class_init    = via_pm_class_init,
> +    .class_data    = (void *)&vt82c686b_pm_init_info,

Igor said new code should avoid using .class_data:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg678305.html
Can you convert to "leaf class"? Then this patch is good to go.

A trivial example of conversion is commit f0eeb4b6154
("hw/arm/raspi: Avoid using TypeInfo::class_data pointer").

> +};
> +
> +static const ViaPMInitInfo vt8231_pm_init_info = {
> +    .device_id = 0x8235,
> +};
> +
> +static const TypeInfo vt8231_pm_info = {
> +    .name          = TYPE_VT8231_PM,
> +    .parent        = TYPE_VIA_PM,
> +    .class_init    = via_pm_class_init,
> +    .class_data    = (void *)&vt8231_pm_init_info,
> +};
>  
> 

