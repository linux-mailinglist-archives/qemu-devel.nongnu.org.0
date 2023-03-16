Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2AFB6BD21E
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 15:14:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcoLr-00019T-3m; Thu, 16 Mar 2023 10:13:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1pcoLl-00018N-C1; Thu, 16 Mar 2023 10:13:02 -0400
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1pcoLi-0000CH-3m; Thu, 16 Mar 2023 10:13:00 -0400
Received: by mail-il1-x12d.google.com with SMTP id j6so1050186ilr.7;
 Thu, 16 Mar 2023 07:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678975976;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id:sender
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/40C8gU8IUWJ5FN6czOFgWR+bxVkhM0PpGvwv826cEM=;
 b=d5lqyHAMeWaIORptgC9lKXOStCz/5j4G4y3Xp/VUOZ7VWVV5FcUSoS5XkRalfRWE1z
 CVSLSpw0/5gBr7nvXo6M9X17Pz2OuHTm5fW9nicWMEiGz2MUubCv9LQWJ+SyBMypECun
 30XBP+eMP647Y6Zhuu9u6eHjD/1zxpVa1cTLeEJyn18JzDSjlCNHGGlQYa9HUC0Zb7n7
 GXHmJo3mG+2H51caBsFWOUneptILLiQlYZNEcDCTM5zATqkU6U5serWTiBIilyzxQIRM
 UlmTgU1Bu0k/rlUBGi052TeceN/ZVsF2gIPkG6gI0qrhZag99oMpw3I13BGBbXcSdChn
 K3Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678975976;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id:sender
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/40C8gU8IUWJ5FN6czOFgWR+bxVkhM0PpGvwv826cEM=;
 b=Fzqk/z11C/C+2q/s478D0Rz1lNA3jsHH2s2uL8tHVoZ7SDsh0noRm4Eg+OMuH459Nh
 qAeg1HoO/iOT5pRUSat/9viLYI9rVwMKQtOSHH1WZRR8sTZEtMPgFeKrOwWFZSq5DvUK
 X7hqBkzJaAQz9fB6x1C61/f9yjIbBsxjLejdfAupgjZyIrPCI/JldxtKmFZmsYtB949D
 rTPi5ob4i/5IvX6E625cQP2USWtPLGoZ5V2iD+9sne53Sr9QXpmUQCjoCyMwmd15j5Pb
 1eh4WOWDmJpXl4fpUkdwSzsKWz4XnD5FzFU1VjCM7+jePUH+iip54NAOWgtMdRpgorDk
 1n3g==
X-Gm-Message-State: AO0yUKWH3R3ktn+6574ke5wbaP7GmVVb9QvzEr65rRxiNfe+TcuHcjdM
 l+sgLqGFAyiULHD26GXW8PI=
X-Google-Smtp-Source: AK7set+vJxDrAxNARA46HkYFqcKIXOZEWRquweLW2LKjJK8VooYh34QrAImskht1yIpsgifbNTRf+w==
X-Received: by 2002:a05:6e02:1545:b0:322:ea3c:676f with SMTP id
 j5-20020a056e02154500b00322ea3c676fmr9750496ilu.26.1678975975877; 
 Thu, 16 Mar 2023 07:12:55 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 b1-20020a92c141000000b00316e54a8287sm2446467ilh.14.2023.03.16.07.12.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Mar 2023 07:12:55 -0700 (PDT)
Message-ID: <590fdf77-5478-1d94-162b-b543873b0299@roeck-us.net>
Date: Thu, 16 Mar 2023 07:12:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Jean-Christophe Dubois <jcd@tribudubois.net>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20200313014551.12554-1-linux@roeck-us.net>
 <20200313014551.12554-2-linux@roeck-us.net>
 <CAFEAcA_PT9kD1WCn9RWVem3uEY4AvmyA5T=-ouVsq9sbvDymKg@mail.gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v3 1/5] hw/usb: Add basic i.MX USB Phy support
In-Reply-To: <CAFEAcA_PT9kD1WCn9RWVem3uEY4AvmyA5T=-ouVsq9sbvDymKg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::12d;
 envelope-from=groeck7@gmail.com; helo=mail-il1-x12d.google.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Hi Peter,

On 3/16/23 06:41, Peter Maydell wrote:
> On Fri, 13 Mar 2020 at 01:45, Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> Add basic USB PHY support as implemented in i.MX23, i.MX28, i.MX6,
>> and i.MX7 SoCs.
>>
>> The only support really needed - at least to boot Linux - is support
>> for soft reset, which needs to reset various registers to their initial
>> value. Otherwise, just record register values.
>>
>> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> 
> Hi Guenter; we've had a fuzzer report that this device model
> accesses off the end of the usbphy[] array:
> https://gitlab.com/qemu-project/qemu/-/issues/1408
> 

Good catch. And an obvious bug, sorry.

>> +static uint64_t imx_usbphy_read(void *opaque, hwaddr offset, unsigned size)
>> +{
>> +    IMXUSBPHYState *s = (IMXUSBPHYState *)opaque;
>> +    uint32_t index = offset >> 2;
>> +    uint32_t value;
> 
> 
>> +    default:
>> +        value = s->usbphy[index];
> 
> No bounds check in the default case (or ditto in the write function)...
> 
>> +        break;
>> +    }
>> +    return (uint64_t)value;
>> +}
> 
>> +static void imx_usbphy_realize(DeviceState *dev, Error **errp)
>> +{
>> +    IMXUSBPHYState *s = IMX_USBPHY(dev);
>> +
>> +    memory_region_init_io(&s->iomem, OBJECT(s), &imx_usbphy_ops, s,
>> +                          "imx-usbphy", 0x1000);
> 
> ...and the memory region is created at size 0x1000 so the read/write
> fns can be called with offsets up to that size...
> 
>> +    sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->iomem);
>> +}
> 
>> +enum IMXUsbPhyRegisters {
>> +    USBPHY_PWD,
>> +    USBPHY_PWD_SET,
>> +    USBPHY_PWD_CLR,
>> +    USBPHY_PWD_TOG,
>> +    USBPHY_TX,
>> +    USBPHY_TX_SET,
>> +    USBPHY_TX_CLR,
>> +    USBPHY_TX_TOG,
>> +    USBPHY_RX,
>> +    USBPHY_RX_SET,
>> +    USBPHY_RX_CLR,
>> +    USBPHY_RX_TOG,
>> +    USBPHY_CTRL,
>> +    USBPHY_CTRL_SET,
>> +    USBPHY_CTRL_CLR,
>> +    USBPHY_CTRL_TOG,
>> +    USBPHY_STATUS,
>> +    USBPHY_DEBUG = 0x14,
>> +    USBPHY_DEBUG_SET,
>> +    USBPHY_DEBUG_CLR,
>> +    USBPHY_DEBUG_TOG,
>> +    USBPHY_DEBUG0_STATUS,
>> +    USBPHY_DEBUG1 = 0x1c,
>> +    USBPHY_DEBUG1_SET,
>> +    USBPHY_DEBUG1_CLR,
>> +    USBPHY_DEBUG1_TOG,
>> +    USBPHY_VERSION,
>> +    USBPHY_MAX
>> +};
>> +
>> +#define USBPHY_CTRL_SFTRST BIT(31)
>> +
>> +#define TYPE_IMX_USBPHY "imx.usbphy"
>> +#define IMX_USBPHY(obj) OBJECT_CHECK(IMXUSBPHYState, (obj), TYPE_IMX_USBPHY)
>> +
>> +typedef struct IMXUSBPHYState {
>> +    /* <private> */
>> +    SysBusDevice parent_obj;
>> +
>> +    /* <public> */
>> +    MemoryRegion iomem;
>> +
>> +    uint32_t usbphy[USBPHY_MAX];
> 
> ...but the array is only created with USBPHY_MAX entries.
> 
> Do you know what the device is supposed to do with these
> off-the-end acceses? We could either reduce the memory region
> size or bounds check and RAZ/WI the out-of-range accesses.
> 

I have no idea what the real hardware would do. The datasheets (at
least the ones I checked) don't say, only that the region size is 4k.
I would suggest a bounds check, ignore out-of-bounds writes (maybe
with a log message), and return 0 for reads (which I think is what
you suggest with RAZ/WI).

Want me to send a patch ?

Thanks,
Guenter

