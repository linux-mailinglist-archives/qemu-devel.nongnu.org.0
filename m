Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6219E6BD11F
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 14:42:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcnrx-0000KV-7k; Thu, 16 Mar 2023 09:42:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pcnrv-0000FJ-8m
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 09:42:11 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pcnrt-0002UF-1B
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 09:42:10 -0400
Received: by mail-pg1-x532.google.com with SMTP id y19so942302pgk.5
 for <qemu-devel@nongnu.org>; Thu, 16 Mar 2023 06:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678974127;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Apye2Rbn9g02f7KVerpT1+IoZIGGJf4C6uxn1AtIaAc=;
 b=zHKE0rEokKaIe5c79NfBv/i3ArooFzMRfKzt5cSQXJ/DN6GxYPE/DaPFQH6QejafCo
 d5cxXwfAqmPYi5EMrq+Smwz+vvG4lnDfXivKpOMvA0hjMJjrhnyD3IlHAuAqHxGUq5/l
 PRprYhvp4rDdLego9VI1DLzu19GYLvrth4uAn1rkcOnbyC0mXJjzXbNoTAK4xex+9vjT
 0fpbvFsZ8uK6OzV1a7mW89S/9oXFBOR4pdrkOXCwh2GqEk7ZEXFRtxqT7Iy82oFJiBYn
 9gJY4MNGT15nWd4psfc5N2MqNFSzDsiGacCIUioaIVkUK2G+9O4xgJsX7HooHmeD8LiB
 50wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678974127;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Apye2Rbn9g02f7KVerpT1+IoZIGGJf4C6uxn1AtIaAc=;
 b=De5RWvs7T9BTdvx1nmk+Wz03qDJPgA7a+tSQN7Pj+Rgp3d7YyJLCflhI4llQzo3cxu
 0XXvxmXn2RTyh8YrxyBfINFnvRxFnvdXzlR1GQdTVKvLkRqoPivFtAz6+feHDAPMf7Ec
 icH+fEeUis3nG8fGS9VMMfG/Q1gIHNAYW/7PN/MwZo5cpA9bYVG1DZOEf6M7aLKVsXhQ
 1c/PE++a6w48UMqkFrQeW6WIw+EvWS5ZSM0J4grdQBnf86PHhvObvK9VOeLHcORwMvQM
 Sp77zvYERMQ6F5rEOhuFb8n7LIMiJITUB9hRUx1yLV/VC2RWgMyeAzZ6/oMRLmWLi63P
 0Drw==
X-Gm-Message-State: AO0yUKXD0bBo4lvx4p8ZLPDT+H0l3LKMlCjUPZToPSogOGDvAIRu8BmD
 3+GLQYduc2Wbq3YebFUjwsrRaU8AFy9Tb6pssU1XVg==
X-Google-Smtp-Source: AK7set/TBcKC7DP/gArkBQqL2o5hGVwG5dP9O36ZOkNXIwOnA5RNSuMAA8rUllciyvLybeV1xCDUnKptWjtPGbJRO6w=
X-Received: by 2002:a65:5087:0:b0:503:a26a:2e7a with SMTP id
 r7-20020a655087000000b00503a26a2e7amr903666pgp.6.1678974127409; Thu, 16 Mar
 2023 06:42:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200313014551.12554-1-linux@roeck-us.net>
 <20200313014551.12554-2-linux@roeck-us.net>
In-Reply-To: <20200313014551.12554-2-linux@roeck-us.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Mar 2023 13:41:56 +0000
Message-ID: <CAFEAcA_PT9kD1WCn9RWVem3uEY4AvmyA5T=-ouVsq9sbvDymKg@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] hw/usb: Add basic i.MX USB Phy support
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jean-Christophe Dubois <jcd@tribudubois.net>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Fri, 13 Mar 2020 at 01:45, Guenter Roeck <linux@roeck-us.net> wrote:
>
> Add basic USB PHY support as implemented in i.MX23, i.MX28, i.MX6,
> and i.MX7 SoCs.
>
> The only support really needed - at least to boot Linux - is support
> for soft reset, which needs to reset various registers to their initial
> value. Otherwise, just record register values.
>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Hi Guenter; we've had a fuzzer report that this device model
accesses off the end of the usbphy[] array:
https://gitlab.com/qemu-project/qemu/-/issues/1408

> +static uint64_t imx_usbphy_read(void *opaque, hwaddr offset, unsigned size)
> +{
> +    IMXUSBPHYState *s = (IMXUSBPHYState *)opaque;
> +    uint32_t index = offset >> 2;
> +    uint32_t value;


> +    default:
> +        value = s->usbphy[index];

No bounds check in the default case (or ditto in the write function)...

> +        break;
> +    }
> +    return (uint64_t)value;
> +}

> +static void imx_usbphy_realize(DeviceState *dev, Error **errp)
> +{
> +    IMXUSBPHYState *s = IMX_USBPHY(dev);
> +
> +    memory_region_init_io(&s->iomem, OBJECT(s), &imx_usbphy_ops, s,
> +                          "imx-usbphy", 0x1000);

...and the memory region is created at size 0x1000 so the read/write
fns can be called with offsets up to that size...

> +    sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->iomem);
> +}

> +enum IMXUsbPhyRegisters {
> +    USBPHY_PWD,
> +    USBPHY_PWD_SET,
> +    USBPHY_PWD_CLR,
> +    USBPHY_PWD_TOG,
> +    USBPHY_TX,
> +    USBPHY_TX_SET,
> +    USBPHY_TX_CLR,
> +    USBPHY_TX_TOG,
> +    USBPHY_RX,
> +    USBPHY_RX_SET,
> +    USBPHY_RX_CLR,
> +    USBPHY_RX_TOG,
> +    USBPHY_CTRL,
> +    USBPHY_CTRL_SET,
> +    USBPHY_CTRL_CLR,
> +    USBPHY_CTRL_TOG,
> +    USBPHY_STATUS,
> +    USBPHY_DEBUG = 0x14,
> +    USBPHY_DEBUG_SET,
> +    USBPHY_DEBUG_CLR,
> +    USBPHY_DEBUG_TOG,
> +    USBPHY_DEBUG0_STATUS,
> +    USBPHY_DEBUG1 = 0x1c,
> +    USBPHY_DEBUG1_SET,
> +    USBPHY_DEBUG1_CLR,
> +    USBPHY_DEBUG1_TOG,
> +    USBPHY_VERSION,
> +    USBPHY_MAX
> +};
> +
> +#define USBPHY_CTRL_SFTRST BIT(31)
> +
> +#define TYPE_IMX_USBPHY "imx.usbphy"
> +#define IMX_USBPHY(obj) OBJECT_CHECK(IMXUSBPHYState, (obj), TYPE_IMX_USBPHY)
> +
> +typedef struct IMXUSBPHYState {
> +    /* <private> */
> +    SysBusDevice parent_obj;
> +
> +    /* <public> */
> +    MemoryRegion iomem;
> +
> +    uint32_t usbphy[USBPHY_MAX];

...but the array is only created with USBPHY_MAX entries.

Do you know what the device is supposed to do with these
off-the-end acceses? We could either reduce the memory region
size or bounds check and RAZ/WI the out-of-range accesses.

thanks
-- PMM

