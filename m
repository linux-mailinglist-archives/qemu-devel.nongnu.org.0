Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC1F65B578
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Jan 2023 18:04:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCODu-0006Jx-Uz; Mon, 02 Jan 2023 12:03:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pCODr-0006J5-A8
 for qemu-devel@nongnu.org; Mon, 02 Jan 2023 12:03:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pCODp-0006Uw-Bo
 for qemu-devel@nongnu.org; Mon, 02 Jan 2023 12:03:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672679016;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NObRvpX9NeG5nkEVyPOJ2chhEkZsmvR3Dq6Og5D6rSg=;
 b=eo+MHQwppFHIdRwdDiZbNYZdDWn1WG2i7XXwWYR6Xs20/ubjDL0xWOOwGuKBKJQ4XblyXX
 6b3Nq/lQt0+8HEccQhbUsdrzCWsTc1YOfuePsq6bGj1Psrlq8hDmIbJC5Wf72HNJmmEgrR
 c0qjNSVbPsD0nNt8tYLq/suxpMGAaKU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-657-an6vUIAKNRSrEuSHYU1E2A-1; Mon, 02 Jan 2023 12:03:35 -0500
X-MC-Unique: an6vUIAKNRSrEuSHYU1E2A-1
Received: by mail-wm1-f71.google.com with SMTP id
 m8-20020a05600c3b0800b003d96bdce12fso13623001wms.9
 for <qemu-devel@nongnu.org>; Mon, 02 Jan 2023 09:03:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NObRvpX9NeG5nkEVyPOJ2chhEkZsmvR3Dq6Og5D6rSg=;
 b=SY75hM32iPyAi3H1Rxp21+6+Q9iEj3iiv0ftYDFC1fvo9biRRkSngwTMcJ1D5B+PQN
 92sXVgicX7TQuvk5dwMgHOWRBKm/AJGre/OguxU6/9VDX3jONPpD3ZLpn6SQs3pkE/hC
 Hh/T51clQc6eSVFsx3mQlr1Jnn/rQSjHi4gQXaznbI+H+vulo2cU/xqmeAyLAM1UJNz9
 EEd3GbZGMraqqNUjHiYuCLlEL7lJinwG7IeUK1Ww6gK66+bnesvrRYxgM16HqMWEGft+
 gx2TZ8ZYDAI4cdB+Fetcnet8Qp68P0pDoKwpW7fJuF9kTas2uvXFE0jL5kL7I000Dn3V
 92hA==
X-Gm-Message-State: AFqh2kpAlm7+S6L3BIax1latxFaqlfW4OkfMxMDO5jPbtXOH4XBB3WUH
 hj+uX6K6NwcEZNOLlUqsCnbs3HwyvzPpZsy2pakq2guOwD0yQHwQ4EWPzvSyLXTmXN90yYR7dRv
 /4YANqH1xGyUvJuM=
X-Received: by 2002:a05:600c:1c06:b0:3d0:a768:a702 with SMTP id
 j6-20020a05600c1c0600b003d0a768a702mr32894769wms.19.1672679014240; 
 Mon, 02 Jan 2023 09:03:34 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsKj1nyk5k40AhT2L9h2vfvUK0gWe4S0CWpIS+vR1+2la3dGejik/20DEfGQ+oX0+1GY5JXrw==
X-Received: by 2002:a05:600c:1c06:b0:3d0:a768:a702 with SMTP id
 j6-20020a05600c1c0600b003d0a768a702mr32894753wms.19.1672679014053; 
 Mon, 02 Jan 2023 09:03:34 -0800 (PST)
Received: from [192.168.0.5] (ip-109-43-176-126.web.vodafone.de.
 [109.43.176.126]) by smtp.gmail.com with ESMTPSA id
 l42-20020a05600c1d2a00b003cfbbd54178sm65293514wms.2.2023.01.02.09.03.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Jan 2023 09:03:31 -0800 (PST)
Message-ID: <4ab5e721-6a05-1f91-64f0-f4e80ca3957d@redhat.com>
Date: Mon, 2 Jan 2023 18:03:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v4 08/30] hw/i386/pc: Create RTC controllers in south
 bridges
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ani Sinha <ani@anisinha.ca>,
 John Snow <jsnow@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Eduardo Habkost
 <eduardo@habkost.net>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20221221170003.2929-1-shentey@gmail.com>
 <20221221170003.2929-9-shentey@gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20221221170003.2929-9-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.142, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 21/12/2022 17.59, Bernhard Beschow wrote:
> Just like in the real hardware (and in PIIX4), create the RTC
> controllers in the south bridges.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> Message-Id: <20221022150508.26830-11-shentey@gmail.com>
> ---
>   hw/i386/pc.c                  | 12 +++++++++++-
>   hw/i386/pc_piix.c             |  8 ++++++++
>   hw/i386/pc_q35.c              |  1 +
>   hw/isa/Kconfig                |  2 ++
>   hw/isa/lpc_ich9.c             |  8 ++++++++
>   hw/isa/piix3.c                | 15 +++++++++++++++
>   include/hw/i386/ich9.h        |  2 ++
>   include/hw/southbridge/piix.h |  3 +++
>   8 files changed, 50 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index fa69b6f43e..d154eedcb3 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -1299,7 +1299,17 @@ void pc_basic_device_init(struct PCMachineState *pcms,
>           pit_alt_irq = qdev_get_gpio_in(hpet, HPET_LEGACY_PIT_INT);
>           rtc_irq = qdev_get_gpio_in(hpet, HPET_LEGACY_RTC_INT);
>       }
> -    *rtc_state = mc146818_rtc_init(isa_bus, 2000, rtc_irq);
> +
> +    if (rtc_irq) {
> +        qdev_connect_gpio_out(DEVICE(*rtc_state), 0, rtc_irq);
> +    } else {
> +        uint32_t irq = object_property_get_uint(OBJECT(*rtc_state),
> +                                                "irq",
> +                                                &error_fatal);
> +        isa_connect_gpio_out(*rtc_state, 0, irq);
> +    }
> +    object_property_add_alias(OBJECT(pcms), "rtc-time", OBJECT(*rtc_state),
> +                              "date");
I think you could turn now the "ISADevice **rtc_state" parameter of this 
function into a normal "ISADevice *rtc_state" since the pointer is not a 
return value anymore.

  Thomas


