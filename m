Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4120339DFD
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 13:07:37 +0100 (CET)
Received: from localhost ([::1]:55328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lL33Q-0005uu-NS
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 07:07:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lL31j-0004zK-Em; Sat, 13 Mar 2021 07:05:51 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:46452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lL31i-00076z-0J; Sat, 13 Mar 2021 07:05:51 -0500
Received: by mail-wr1-x42b.google.com with SMTP id a18so6192411wrc.13;
 Sat, 13 Mar 2021 04:05:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=d2nGmJdMKrwUglykE9F7Do6A+XD+fVg3xp8oTIR6Q9Q=;
 b=Mh1s5doP1loOJYQQsNZd/+YjyYk9/5MvRFI5/TqCgnLTQVKWaVl4+OGNHatEn3EzTW
 WTYrQiWujBNO3A7lns0EYdB1a1yBmMI8sZa8vdQz9iOVfL1gGAdHYLdgbnZ5/MQWY0Z3
 aoT4sTnczyIQ0djBig3ERs6XyHJxdQQcEbTlL+3Ud64Mn9sD9M5NMwcyWA/SWeJveOJW
 OLU2zl+Tn5gG+Mu/7C3tXuSGIvIQAoZR4fecILgaXIh1n5S2rU0GoHvHZwtzyKV1r+mP
 /GqKpb56WhgUZKhBmaBZgkeg/o0ZKDXVM4Fzm0h6lMJ5X2bV0ePT/zWq+i+BOkjjtAPH
 SUpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=d2nGmJdMKrwUglykE9F7Do6A+XD+fVg3xp8oTIR6Q9Q=;
 b=gc7xoYbQfADynjjyGFzAYjRtQ9xpCaBIaj6mFPKVbl/qNoxwcCKCsGYt/OMCCSuRF+
 qUxtkn0YyT08ctv5LGSxGDTPsiW6DYSZbe2OKS1AgbMjZplCN4opDN2FGr6AfOtsV5k8
 pNTBpGtmwYpgfLZ8hp+hruoqjnw3/bnHyzyajnp5RAJkt6Utm9qWRVngNCxmkfEcdSdk
 FwHJNcqU1ywxb1JD4p3SlKJxun4xsLor4v2siNa0iOv4oX3wtLdose1pOkRju6/AQ/Aq
 0COEChYwDlEHf7twBb/OsaZfE6V5Fm5Bdsz6EFQbhqgm2Y2nuxK1CyErPKkpK4meE61u
 ZkGw==
X-Gm-Message-State: AOAM532rnHKfGyGRrQxRkzvxuyD5ClYEMYZlapND7ZgzkqQmOMNVCB4K
 iXKMiqgenTle//aB8Dy2NIBnBXGJYrK/UQ==
X-Google-Smtp-Source: ABdhPJxpBrpUHAF0Key4lcw7x1ddxx1RAXmeCEVjPjqmPmUqbnNGNG2UZIM1IQIc/d+Y9e61IQnBKA==
X-Received: by 2002:adf:f78f:: with SMTP id q15mr18297691wrp.383.1615637147878; 
 Sat, 13 Mar 2021 04:05:47 -0800 (PST)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id o13sm14420327wro.15.2021.03.13.04.05.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 Mar 2021 04:05:47 -0800 (PST)
Subject: Re: [PATCH 2/5] hw/arm/aspeed: Do not sysbus-map mmio flash region
 directly, use alias
To: qemu-devel@nongnu.org
References: <20210312182851.1922972-1-f4bug@amsat.org>
 <20210312182851.1922972-3-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <4a812dc9-b448-0b8f-6a66-95cb96acdc17@amsat.org>
Date: Sat, 13 Mar 2021 13:05:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210312182851.1922972-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Alistair Francis <alistair@alistair23.me>, Greg Kurz <groug@kaod.org>,
 Peter Xu <peterx@redhat.com>, Joel Stanley <joel@jms.id.au>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Incorrect subject prefix, should be "hw/ssi/aspeed_smc"

On 3/12/21 7:28 PM, Philippe Mathieu-Daudé wrote:
> The flash mmio region is exposed as an AddressSpace.
> AddressSpaces must not be sysbus-mapped, therefore map
> the region using an alias.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  include/hw/ssi/aspeed_smc.h | 1 +
>  hw/ssi/aspeed_smc.c         | 4 +++-
>  2 files changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/include/hw/ssi/aspeed_smc.h b/include/hw/ssi/aspeed_smc.h
> index 16c03fe64f3..e3c96cecbd8 100644
> --- a/include/hw/ssi/aspeed_smc.h
> +++ b/include/hw/ssi/aspeed_smc.h
> @@ -84,6 +84,7 @@ struct AspeedSMCState {
>  
>      MemoryRegion mmio;
>      MemoryRegion mmio_flash;
> +    MemoryRegion mmio_flash_alias;
>  
>      qemu_irq irq;
>      int irqline;
> diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
> index 16addee4dc8..aa26578bdac 100644
> --- a/hw/ssi/aspeed_smc.c
> +++ b/hw/ssi/aspeed_smc.c
> @@ -1386,7 +1386,9 @@ static void aspeed_smc_realize(DeviceState *dev, Error **errp)
>      memory_region_init_io(&s->mmio_flash, OBJECT(s),
>                            &aspeed_smc_flash_default_ops, s, name,
>                            s->ctrl->flash_window_size);
> -    sysbus_init_mmio(sbd, &s->mmio_flash);
> +    memory_region_init_alias(&s->mmio_flash_alias, OBJECT(s), name,
> +                             &s->mmio_flash, 0, s->ctrl->flash_window_size);
> +    sysbus_init_mmio(sbd, &s->mmio_flash_alias);
>  
>      s->flashes = g_new0(AspeedSMCFlash, s->ctrl->max_peripherals);

