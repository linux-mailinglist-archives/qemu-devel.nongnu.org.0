Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9559A6627DD
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 14:58:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEsYh-0005sX-IA; Mon, 09 Jan 2023 08:51:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEsYZ-0005r0-Vi
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 08:51:20 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEsYW-0008N1-CL
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 08:51:19 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 g19-20020a05600c4ed300b003d9eb1dbc0aso3840717wmq.3
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 05:51:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=160qlsH2y54lCGhYV0tmMrjpkyiV0q2Dwtp4PxdW2/8=;
 b=X4udkAlQQIUoaF4UMddBqpp3rKZkLrMfjDEGGHfpcvTepCqRbzni2MVQy+9sV/vsgZ
 3/7Q2O1VsMqUuQJ3MKqMugfe6gwqNhnOg4RqvCH0BsZfMTNz/wHe0tP0yLib0oLdY6LZ
 pMQKJWkanNnKx3uI0VhUoJ2dhxEk+uoehKT3KekNuIEbxhid3ynTSDMp1nrqGOgQ09Hb
 /hUVENKHDGUYsEh/7q4lWnPyyMBL7K0zcFdr/GVr6S2CbxF/ZsjHCM1D5rhN3EXJqlmE
 8v/kdW5ni9Am53K4jz4vNBZHHUTQLvtlkCgmw+KEaTow+8WZRYTTgaDX+5AnZz5ycPA2
 hR9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=160qlsH2y54lCGhYV0tmMrjpkyiV0q2Dwtp4PxdW2/8=;
 b=GlkERl4ixlIfYOVeHg8eIHf2+P3mrQu5+7C19HOghJUsaqEEN1g2dzdzZhOsa82HmP
 UDMWEHjP/gA3NBGpLt2waZR5GmDklayYRE66wp4MdUo5n5s1+WyDKfMShD/yoHhleOCb
 N/GTvVQklLjC9uJ/kLOtJ3mwEbfNhhk7/aTFKE5D/Y9QOLIoq/nKpRHI02e4TFXtFNSs
 r/wD9C4WKebKZLI+GsPT4FSuu65TvAUbCLmhVnruja5qO6jwE5uFNOOYI5nLaiK2VG5T
 3O5k4Rgnf7xq4wRskPRFX4Vc8bO/y6WLrM+iHrKe+eo4pdtOz6iLerzeZuyoHVSsg7g4
 pPUQ==
X-Gm-Message-State: AFqh2kpK+w78Z7B4mq9jf2z68PP70TpjH5YUuYI7AMjdnH/KmuCM8NwW
 m3uE4fOm7a/PcvYYFkqCphw9IA==
X-Google-Smtp-Source: AMrXdXsiPFdlGEPZB2v5jYYRO1gp94BpoUxl6wlPdHW2N3e+1nEb4TLlNN2Ywu3AfB51J+lF0D4k0w==
X-Received: by 2002:a7b:c3d6:0:b0:3d3:5ccc:4442 with SMTP id
 t22-20020a7bc3d6000000b003d35ccc4442mr46666580wmj.26.1673272273555; 
 Mon, 09 Jan 2023 05:51:13 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 j30-20020a05600c1c1e00b003cfa80443a0sm12853808wms.35.2023.01.09.05.51.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Jan 2023 05:51:13 -0800 (PST)
Message-ID: <aea40df1-3467-ba52-20b4-0a3620e34329@linaro.org>
Date: Mon, 9 Jan 2023 14:51:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 10/21] hw/sh4: Open-code pflash_cfi02_register()
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: qemu-devel@nongnu.org
References: <20230109120833.3330-1-philmd@linaro.org>
 <20230109120833.3330-11-philmd@linaro.org>
 <088bef9e-b1e9-aef4-bb40-87b3b03172dd@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <088bef9e-b1e9-aef4-bb40-87b3b03172dd@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 9/1/23 14:40, BALATON Zoltan wrote:
> On Mon, 9 Jan 2023, Philippe Mathieu-Daudé wrote:
>> pflash_cfi02_register() hides an implicit sysbus mapping of
>> MMIO region #0. This is not practical in a heterogeneous world
>> where multiple cores use different address spaces. In order to
>> remove pflash_cfi02_register() from the pflash API, open-code it
>> as a qdev creation call followed by an explicit sysbus mapping.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>> hw/sh4/r2d.c | 21 +++++++++++++++++----
>> 1 file changed, 17 insertions(+), 4 deletions(-)
>>
>> diff --git a/hw/sh4/r2d.c b/hw/sh4/r2d.c
>> index 6e0c65124a..9d31fad807 100644
>> --- a/hw/sh4/r2d.c
>> +++ b/hw/sh4/r2d.c
>> @@ -303,10 +303,23 @@ static void r2d_init(MachineState *machine)
>>      * addressable in words of 16bit.
>>      */
>>     dinfo = drive_get(IF_PFLASH, 0, 0);
>> -    pflash_cfi02_register(0x0, "r2d.flash", FLASH_SIZE,
>> -                          dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
>> -                          FLASH_SECTOR_SIZE, 1, 2,
>> -                          0x0001, 0x227e, 0x2220, 0x2200, 0x555, 
>> 0x2aa, 0);
>> +    dev = qdev_new(TYPE_PFLASH_CFI02);
>> +    qdev_prop_set_string(dev, "name", "r2d.flash");
>> +    qdev_prop_set_drive(dev, "drive",
>> +                        dinfo ? blk_by_legacy_dinfo(dinfo) : NULL);
>> +    qdev_prop_set_uint32(dev, "num-blocks", FLASH_SIZE / 
>> FLASH_SECTOR_SIZE);
>> +    qdev_prop_set_uint32(dev, "sector-length", FLASH_SECTOR_SIZE);
>> +    qdev_prop_set_uint8(dev, "device-width", 2);
>> +    qdev_prop_set_uint8(dev, "mappings", 1);
>> +    qdev_prop_set_uint8(dev, "big-endian", false);
>> +    qdev_prop_set_uint16(dev, "id0", 0x0001);
>> +    qdev_prop_set_uint16(dev, "id1", 0x227e);
>> +    qdev_prop_set_uint16(dev, "id2", 0x2220);
>> +    qdev_prop_set_uint16(dev, "id3", 0x2200);
>> +    qdev_prop_set_uint16(dev, "unlock-addr0", 0x555);
>> +    qdev_prop_set_uint16(dev, "unlock-addr1", 0x2aa);
>> +    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
>> +    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, 0x00000000);
> 
> Instead of 0x00000000 can you just write 0 or if you really want then 
> maybe 0x0? With the lot of zeros it's hard to tell it's not 0x00008000 
> or something so it's best to keep is simple if there's no good reason to 
> obfuscate it.

OK, maybe 0x0 to differentiate between the MMIO index and the base address.


