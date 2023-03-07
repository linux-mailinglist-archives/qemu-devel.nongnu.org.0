Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC6B6AE42D
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 16:13:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZYyl-0000lN-9y; Tue, 07 Mar 2023 10:11:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZYyh-0000hC-K5
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 10:11:47 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZYyc-0007pN-AF
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 10:11:43 -0500
Received: by mail-wr1-x42c.google.com with SMTP id bw19so12431316wrb.13
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 07:11:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678201900;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=T+8ApNJHQCJ5qmUY8gnCiqecvRdjSkKjvVVArvJOI2E=;
 b=DT6mUfYk6lsR0LgzohQ8u+maeyy0fEMfwWZi2WxJKVgOB/Jf86uBhtb91LyNdL+HDO
 ktkOjYTVJr/dv6+aJkciOXobvCbDmR6mlAqZtsz5X7lteJj9VxBy5FKeDcvEnxHIUl7t
 SHoC0bJEbJCig8fKjHlAWxR7S8Op5g0Azxz2R50d0evyhhKGm83FFQHot9eJYKpRmaVC
 gMzpXWV5L0YvcREX2Ce9N8Rl9OSH5Hn9dcc/1oSCoPJrUHtqvdRKOCU1RZ3TsYhbtBrP
 mdrIGBCS68yo6o19c6AtvHnB0DyC2R3sO9AyYhI5fKAGN/QRZaZ8lBxjtBosxrvUAZmh
 OcGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678201900;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=T+8ApNJHQCJ5qmUY8gnCiqecvRdjSkKjvVVArvJOI2E=;
 b=yZRn783gOXHguebe7O50CoMcbygPqEP5TUwionW0DQ3fFLGj82qnGq6zUgj8e72nJQ
 q/Q7wF3LnDu7ArROf4z5I7i3H5PrWq3q6Va+rTLnUqSZ41sOd//COxIMsgXcUZqejwdO
 ZkrjZFp8D0GirCveP/2G7UoL1zLjjXI3kjJv+jEzAL/YlCQUI3tczqjxiM5VKulQpQ2T
 2oKCWDviGm/Xv9f39bsBiNYPP23FLUwVeHCQa5cs0PV8m3It/Qn5oUEFA5YdAqdjG471
 XnLGdvgjAsnyJJnxNsBmNGRqoS2IlH1Q+DgCHEI104Q6wBxzNQAQNpgs2qoVS+bVOIXc
 2Iyg==
X-Gm-Message-State: AO0yUKWjmXDiuI/JmIOqqv1uILpfagexTCVRr+GCK3Sl6BpZ9Q2h/O6c
 wA0ubngBTXHHPFWLkY2u/aEB+g==
X-Google-Smtp-Source: AK7set+w4vXGl8XR7XQ/vn0y4/l5dl1Iu4EL+H7rNOD8VRogeG84qOQKMBjoGX8+QLZr/Iih5BmK2Q==
X-Received: by 2002:adf:f583:0:b0:2c7:daa:1c56 with SMTP id
 f3-20020adff583000000b002c70daa1c56mr10844910wro.4.1678201900500; 
 Tue, 07 Mar 2023 07:11:40 -0800 (PST)
Received: from [192.168.248.175] (131.red-95-127-34.staticip.rima-tde.net.
 [95.127.34.131]) by smtp.gmail.com with ESMTPSA id
 k5-20020adfe8c5000000b002c56179d39esm12882208wrn.44.2023.03.07.07.11.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 07:11:39 -0800 (PST)
Message-ID: <58f899e1-71f6-1ec9-e990-047511e2a84e@linaro.org>
Date: Tue, 7 Mar 2023 16:11:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v9 1/7] hw/display/sm501: Add debug property to control
 pixman usage
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, ReneEngel80@emailn.de
References: <cover.1678188711.git.balaton@eik.bme.hu>
 <61768ffaefa71b65a657d1365823bd43c7ee9354.1678188711.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <61768ffaefa71b65a657d1365823bd43c7ee9354.1678188711.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 7/3/23 12:42, BALATON Zoltan wrote:
> Add a property to allow disabling pixman and always use the fallbacks
> for different operations which is useful for testing different drawing
> methods or debugging pixman related issues.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> Tested-by: Rene Engel <ReneEngel80@emailn.de>
> ---
>   hw/display/sm501.c | 18 +++++++++++++++---
>   1 file changed, 15 insertions(+), 3 deletions(-)


>   static Property sm501_sysbus_properties[] = {
>       DEFINE_PROP_UINT32("vram-size", SM501SysBusState, vram_size, 0),
> +    DEFINE_PROP_UINT8("x-pixman", SM501SysBusState, state.use_pixman, 7),
>       DEFINE_PROP_END_OF_LIST(),
>   };
>   
> @@ -2122,6 +2126,7 @@ static void sm501_realize_pci(PCIDevice *dev, Error **errp)
>   
>   static Property sm501_pci_properties[] = {
>       DEFINE_PROP_UINT32("vram-size", SM501PCIState, vram_size, 64 * MiB),
> +    DEFINE_PROP_UINT8("x-pixman", SM501PCIState, state.use_pixman, 7),

FYI, alternatively:

DEFINE_PROP_BIT("x-pixman-fill", SM501PCIState, state.use_pixman, 0, 1),
DEFINE_PROP_BIT("x-pixman-blit", SM501PCIState, state.use_pixman, 1, 1),
DEFINE_PROP_BIT("x-pixman-overlap-blit", SM501PCIState,
                 state.use_pixman, 2, 1),

>       DEFINE_PROP_END_OF_LIST(),
>   };
>   
> @@ -2162,11 +2167,18 @@ static void sm501_pci_class_init(ObjectClass *klass, void *data)
>       dc->vmsd = &vmstate_sm501_pci;
>   }
>   
> +static void sm501_pci_init(Object *o)
> +{
> +    object_property_set_description(o, "x-pixman", "Use pixman for: "
> +                                    "1: fill, 2: blit, 4: overlap blit");
> +}


