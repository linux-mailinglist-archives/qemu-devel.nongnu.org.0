Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D033732DAC1
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 21:03:07 +0100 (CET)
Received: from localhost ([::1]:36030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHuBe-0003Q6-Tp
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 15:03:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lHu7S-00010M-4i; Thu, 04 Mar 2021 14:58:46 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:34960)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lHu7Q-00068A-9y; Thu, 04 Mar 2021 14:58:45 -0500
Received: by mail-wm1-x336.google.com with SMTP id m7so2538893wmq.0;
 Thu, 04 Mar 2021 11:58:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=G9NMZdfJ/iV5k/pehaanlj6Qf3jyzE18VQT2iGIC/1s=;
 b=AjdTyr9LrwziPRpkK5zIVLg/HejhonVCAbInHGXI/xQC4q+hevwhbgGz85sbieidLP
 rymRdPY3sADGgOx1yrHXMnYhhQ4YW+JwVkmaE6cwMbrENN45gzrRFyEK6+5Fuzdjbh9M
 IYhG8VElZfaIaICY6nwmIvrMI6L1mWCOR8Zl7XAAKD4J9MLRwlIfVyX4wkyTIABoCMXo
 rhStszF6qjF/O0oq4w4S7qsRyskPdkUhInaoiJ7Zw3dG5GwnHvXpk/IdWE46myTbyolp
 2a73v5z2SlZEBZmZk8Nd/N83Miw+KFmo/4/WqdiGCZcCnscNp41eTWxEiUeR/lU/uhGf
 fSPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=G9NMZdfJ/iV5k/pehaanlj6Qf3jyzE18VQT2iGIC/1s=;
 b=Lyp8DszfzS5zoFXEkiz7htEbaOiAxT/vjQICVPxmf3KKlg4Pvtr0Haq1mq7DcOASrT
 l7y9moRlnorzddz+0E+hY5p1OoytOJcYlyHglU7ra6IEl56kOdUcxhdUOseBYw8yW4FE
 yFDYRm9zl3Gu2lIw6RCDjqp13a/UC51oa4rWhJaIcWS8bEY+8ClMVs0um/uCNWmYAFQH
 xjoO+xlPVorzo9ii7sQ5FWpYlHiPD1qhu0ge8++ihFo3jYnVcgaVltqaKyfEuMA+ptWJ
 koGiFwo2FV6tQCbzGU2bIED07JU46xevxp1EkfhUC+UOI2Xrs63RUbRI9s/XaitVJOL7
 mV0g==
X-Gm-Message-State: AOAM5325iVVWYjj0fE1RrQJLL8TprkgADqJncyp6Y5uGm6JUt1b+6h6C
 Jwu5whp9vTWyNjVWau5V7A0=
X-Google-Smtp-Source: ABdhPJwk1/hww57HyZ1zONbbkEfCyTTiLy2Gga5g9xENtT3dojOEAh8VtVK1OUKp6w/bbg5VvwB/XQ==
X-Received: by 2002:a1c:650a:: with SMTP id z10mr5663156wmb.154.1614887922346; 
 Thu, 04 Mar 2021 11:58:42 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id p16sm559801wrt.54.2021.03.04.11.58.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Mar 2021 11:58:41 -0800 (PST)
Subject: Re: [PATCH v5 4/8] vt82c686: Introduce abstract TYPE_VIA_ISA and base
 vt82c686b_isa on it
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <cover.1614719482.git.balaton@eik.bme.hu>
 <07df96112b78673ca191f9a4ffa17bf3a11160f3.1614719482.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <da48a752-9b2d-6cd8-9603-4cc528fea628@amsat.org>
Date: Thu, 4 Mar 2021 20:58:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <07df96112b78673ca191f9a4ffa17bf3a11160f3.1614719482.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/2/21 10:11 PM, BALATON Zoltan wrote:
> To allow reusing ISA bridge emulation for vt8231_isa move the device
> state of vt82c686b_isa emulation in an abstract via_isa class.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>  hw/isa/vt82c686.c        | 70 ++++++++++++++++++++++------------------
>  include/hw/pci/pci_ids.h |  2 +-
>  2 files changed, 40 insertions(+), 32 deletions(-)
> 
> diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
> index 72234bc4d1..5137f97f37 100644
> --- a/hw/isa/vt82c686.c
> +++ b/hw/isa/vt82c686.c
> @@ -609,24 +609,48 @@ static const TypeInfo vt8231_superio_info = {
>  };
>  
>  
> -OBJECT_DECLARE_SIMPLE_TYPE(VT82C686BISAState, VT82C686B_ISA)
> +#define TYPE_VIA_ISA "via-isa"
> +OBJECT_DECLARE_SIMPLE_TYPE(ViaISAState, VIA_ISA)
>  
> -struct VT82C686BISAState {
> +struct ViaISAState {
>      PCIDevice dev;
>      qemu_irq cpu_intr;
>      ViaSuperIOState *via_sio;
>  };
>  
> +static const VMStateDescription vmstate_via = {
> +    .name = "via-isa",

You changed the migration stream name, so I think we have
a problem with migration... No clue how to do that properly.

Otherwise the rest LGTM.

> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_PCI_DEVICE(dev, ViaISAState),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
> +static const TypeInfo via_isa_info = {
> +    .name          = TYPE_VIA_ISA,
> +    .parent        = TYPE_PCI_DEVICE,
> +    .instance_size = sizeof(ViaISAState),
> +    .abstract      = true,
> +    .interfaces    = (InterfaceInfo[]) {
> +        { INTERFACE_CONVENTIONAL_PCI_DEVICE },
> +        { },
> +    },
> +};
> +
>  static void via_isa_request_i8259_irq(void *opaque, int irq, int level)
>  {
> -    VT82C686BISAState *s = opaque;
> +    ViaISAState *s = opaque;
>      qemu_set_irq(s->cpu_intr, level);
>  }
>  
> +/* TYPE_VT82C686B_ISA */
> +
>  static void vt82c686b_write_config(PCIDevice *d, uint32_t addr,
>                                     uint32_t val, int len)
>  {
> -    VT82C686BISAState *s = VT82C686B_ISA(d);
> +    ViaISAState *s = VIA_ISA(d);
>  
>      trace_via_isa_write(addr, val, len);
>      pci_default_write_config(d, addr, val, len);
> @@ -636,19 +660,9 @@ static void vt82c686b_write_config(PCIDevice *d, uint32_t addr,
>      }
>  }
>  
> -static const VMStateDescription vmstate_via = {
> -    .name = "vt82c686b",
> -    .version_id = 1,
> -    .minimum_version_id = 1,
> -    .fields = (VMStateField[]) {
> -        VMSTATE_PCI_DEVICE(dev, VT82C686BISAState),
> -        VMSTATE_END_OF_LIST()
> -    }
> -};
> -
>  static void vt82c686b_isa_reset(DeviceState *dev)
>  {
> -    VT82C686BISAState *s = VT82C686B_ISA(dev);
> +    ViaISAState *s = VIA_ISA(dev);
>      uint8_t *pci_conf = s->dev.config;
>  
>      pci_set_long(pci_conf + PCI_CAPABILITY_LIST, 0x000000c0);
> @@ -668,7 +682,7 @@ static void vt82c686b_isa_reset(DeviceState *dev)
>  
>  static void vt82c686b_realize(PCIDevice *d, Error **errp)
>  {
> -    VT82C686BISAState *s = VT82C686B_ISA(d);
> +    ViaISAState *s = VIA_ISA(d);
>      DeviceState *dev = DEVICE(d);
>      ISABus *isa_bus;
>      qemu_irq *isa_irq;
> @@ -692,7 +706,7 @@ static void vt82c686b_realize(PCIDevice *d, Error **errp)
>      }
>  }
>  
> -static void via_class_init(ObjectClass *klass, void *data)
> +static void vt82c686b_class_init(ObjectClass *klass, void *data)
>  {
>      DeviceClass *dc = DEVICE_CLASS(klass);
>      PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
> @@ -700,28 +714,21 @@ static void via_class_init(ObjectClass *klass, void *data)
>      k->realize = vt82c686b_realize;
>      k->config_write = vt82c686b_write_config;
>      k->vendor_id = PCI_VENDOR_ID_VIA;
> -    k->device_id = PCI_DEVICE_ID_VIA_ISA_BRIDGE;
> +    k->device_id = PCI_DEVICE_ID_VIA_82C686B_ISA;
>      k->class_id = PCI_CLASS_BRIDGE_ISA;
>      k->revision = 0x40;
>      dc->reset = vt82c686b_isa_reset;
>      dc->desc = "ISA bridge";
>      dc->vmsd = &vmstate_via;
> -    /*
> -     * Reason: part of VIA VT82C686 southbridge, needs to be wired up,
> -     * e.g. by mips_fuloong2e_init()
> -     */
> +    /* Reason: part of VIA VT82C686 southbridge, needs to be wired up */
>      dc->user_creatable = false;
>  }
>  
> -static const TypeInfo via_info = {
> +static const TypeInfo vt82c686b_isa_info = {
>      .name          = TYPE_VT82C686B_ISA,
> -    .parent        = TYPE_PCI_DEVICE,
> -    .instance_size = sizeof(VT82C686BISAState),
> -    .class_init    = via_class_init,
> -    .interfaces = (InterfaceInfo[]) {
> -        { INTERFACE_CONVENTIONAL_PCI_DEVICE },
> -        { },
> -    },
> +    .parent        = TYPE_VIA_ISA,
> +    .instance_size = sizeof(ViaISAState),
> +    .class_init    = vt82c686b_class_init,
>  };
>  
>  
> @@ -733,7 +740,8 @@ static void vt82c686b_register_types(void)
>      type_register_static(&via_superio_info);
>      type_register_static(&vt82c686b_superio_info);
>      type_register_static(&vt8231_superio_info);
> -    type_register_static(&via_info);
> +    type_register_static(&via_isa_info);
> +    type_register_static(&vt82c686b_isa_info);
>  }
>  
>  type_init(vt82c686b_register_types)
> diff --git a/include/hw/pci/pci_ids.h b/include/hw/pci/pci_ids.h
> index ea28dcc850..aa3f67eaa4 100644
> --- a/include/hw/pci/pci_ids.h
> +++ b/include/hw/pci/pci_ids.h
> @@ -204,7 +204,7 @@
>  #define PCI_VENDOR_ID_XILINX             0x10ee
>  
>  #define PCI_VENDOR_ID_VIA                0x1106
> -#define PCI_DEVICE_ID_VIA_ISA_BRIDGE     0x0686
> +#define PCI_DEVICE_ID_VIA_82C686B_ISA    0x0686
>  #define PCI_DEVICE_ID_VIA_IDE            0x0571
>  #define PCI_DEVICE_ID_VIA_UHCI           0x3038
>  #define PCI_DEVICE_ID_VIA_82C686B_PM     0x3057
> 

