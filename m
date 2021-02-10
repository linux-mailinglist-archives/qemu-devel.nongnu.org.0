Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C5DB315F99
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 07:44:02 +0100 (CET)
Received: from localhost ([::1]:38052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9jEH-0001r2-Ez
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 01:44:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1l9jBP-0000Nv-1Q
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 01:41:03 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:53165)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1l9jBE-0004YJ-5u
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 01:40:58 -0500
Received: by mail-pj1-x102c.google.com with SMTP id q72so564770pjq.2
 for <qemu-devel@nongnu.org>; Tue, 09 Feb 2021 22:40:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=IB4TRMRJ6mg1FXbP7eNRjVAur/K8U+9BLGh3jnbLx+o=;
 b=aCCNOyEH8lPpuVZid3ET3PumMg8GMtnclVoDpysmwgioLNNYnAUVVIiSQ82zqmWuvE
 D4cuK2ebrxAqFHsRywRbAS+D7/YusPJ/bjvsfsX6fhgdLC0zu58vNVvysLobeUekp6Mq
 ch4YmVbgX5SshvgTGpb9MIvODSHDw2y+zRC5nh578NcvLCVAgUG6hVcALPi8pCjvTrVP
 qgTf5qp1k73wz5+YXb7ubcbcQ/kwU4pvoCCLIMplaIwrQMQcuZLv9vaTEiBzwYQ+L1H/
 G9PTEbXeqrrhmwqO3tRgRJVB8SHtWfsnpQvUv7FRI94tmdnTx5YyhqXb6yTcAJiHF1v4
 ytbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IB4TRMRJ6mg1FXbP7eNRjVAur/K8U+9BLGh3jnbLx+o=;
 b=EWxomEAEHnjWk1O6bQM6WQXL3Q7+hoNO4x9hJxrIZOhKe2x6GO6j3Nj4wkRIhoy6BL
 j0YGwvPOGc7nkP14hxjo2NbzvGxQcrxBB/eGDGnfmju8/WzdFesi6nEYFS+PLEODetS3
 FKK2rfKSwQTS9GOTge7vg7IfsRvJ0oE2ocd8uhBiHu2GP+kKIcgM2A0iD6aSN63YTpuB
 7zpRaQECSO16KjUTscpyCWF6kf3ebwoLKG9pOXA552eZ0c8sHxH/1MKkmlS3l48N7tGh
 PSJtn7PYAqwXndTe0gp4WBnE750KnKCyoStK4Xa5I8w3o+IjdlarGnjgP06WF+aCDtGz
 /UGw==
X-Gm-Message-State: AOAM532roWx4EEz8i/inUvmaqC2L1FDmnqHWnsUXHawwodCePWHkRMq7
 fIJAN05XVGSV8BUerZ1y9a+BgA==
X-Google-Smtp-Source: ABdhPJzQhZ/dz223lGvcF/r9d6ma386iiGunVr301H6Du1JqLdXKpH8NVGP9ixXUUtgiPw38lIBIgg==
X-Received: by 2002:a17:902:c40d:b029:e2:c0c3:75c9 with SMTP id
 k13-20020a170902c40db02900e2c0c375c9mr1658720plk.46.1612939249451; 
 Tue, 09 Feb 2021 22:40:49 -0800 (PST)
Received: from [192.168.10.23] (124-171-107-241.dyn.iinet.net.au.
 [124.171.107.241])
 by smtp.gmail.com with UTF8SMTPSA id t77sm950292pfc.119.2021.02.09.22.40.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Feb 2021 22:40:48 -0800 (PST)
Subject: Re: [PATCH] spapr: Adjust firmware path of PCI devices
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: Greg Kurz <groug@kaod.org>
References: <20210122170157.246374-1-groug@kaod.org>
 <4294d3b5-abf3-fd43-660b-d82caf791d4f@ozlabs.ru>
 <20210125112311.254ba960@bahia.lan>
 <d647f198-4f47-692e-8a6e-8312044edfa8@ozlabs.ru>
Message-ID: <752c0b15-032f-017c-eecf-204f9d62fd5a@ozlabs.ru>
Date: Wed, 10 Feb 2021 17:40:43 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:85.0) Gecko/20100101
 Thunderbird/85.0
MIME-Version: 1.0
In-Reply-To: <d647f198-4f47-692e-8a6e-8312044edfa8@ozlabs.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=aik@ozlabs.ru; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.265, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 27/01/2021 12:28, Alexey Kardashevskiy wrote:
> 
> 
> On 25/01/2021 21:23, Greg Kurz wrote:
>> On Sat, 23 Jan 2021 13:36:34 +1100
>> Alexey Kardashevskiy <aik@ozlabs.ru> wrote:
>>
>>>
>>>
>>> On 23/01/2021 04:01, Greg Kurz wrote:
>>>> It is currently not possible to perform a strict boot from USB storage:
>>>>
>>>> $ qemu-system-ppc64 -accel kvm -nodefaults -nographic -serial stdio \
>>>>     -boot strict=on \
>>>>     -device qemu-xhci \
>>>>     -device usb-storage,drive=disk,bootindex=0 \
>>>>     -blockdev driver=file,node-name=disk,filename=fedora-ppc64le.qcow2
>>>>
>>>>
>>>> SLOF 
>>>> **********************************************************************
>>>> QEMU Starting
>>>>    Build Date = Jul 17 2020 11:15:24
>>>>    FW Version = git-e18ddad8516ff2cf
>>>>    Press "s" to enter Open Firmware.
>>>>
>>>> Populating /vdevice methods
>>>> Populating /vdevice/vty@71000000
>>>> Populating /vdevice/nvram@71000001
>>>> Populating /pci@800000020000000
>>>>                        00 0000 (D) : 1b36 000d    serial bus [ 
>>>> usb-xhci ]
>>>> No NVRAM common partition, re-initializing...
>>>> Scanning USB
>>>>     XHCI: Initializing
>>>>       USB Storage
>>>>          SCSI: Looking for devices
>>>>             101000000000000 DISK     : "QEMU     QEMU HARDDISK    2.5+"
>>>> Using default console: /vdevice/vty@71000000
>>>>
>>>>     Welcome to Open Firmware
>>>>
>>>>     Copyright (c) 2004, 2017 IBM Corporation All rights reserved.
>>>>     This program and the accompanying materials are made available
>>>>     under the terms of the BSD License available at
>>>>     http://www.opensource.org/licenses/bsd-license.php
>>>>
>>>>
>>>> Trying to load:  from: 
>>>> /pci@800000020000000/usb@0/storage@1/disk@101000000000000 ...
>>>> E3405: No such device
>>>>
>>>> E3407: Load failed
>>>>
>>>>     Type 'boot' and press return to continue booting the system.
>>>>     Type 'reset-all' and press return to reboot the system.
>>>>
>>>>
>>>> Ready!
>>>> 0 >
>>>>
>>>> The device tree handed over by QEMU to SLOF indeed contains:
>>>>
>>>> qemu,boot-list =
>>>>     "/pci@800000020000000/usb@0/storage@1/disk@101000000000000 HALT";
>>>>
>>>> but the device node is named usb-xhci@0, not usb@0.
>>>
>>>
>>> I'd expect it to be a return of qdev_fw_name() so in this case something
>>> like "nec-usb-xhci" (which would still be broken) but seeing a plain
>>> "usb" is a bit strange.
>>>
>>
>> The logic under get_boot_devices_list() is a bit hard to follow
>> because of the multiple indirections, but AFAICT it doesn't seem
>> to rely on qdev_fw_name() to get the names.
>>
>> None of the XHCI devices seem to be setting DeviceClass::fw_name anyway:
>>
>> $ git grep fw_name hw/usb/
>> hw/usb/bus.c:                     qdev_fw_name(qdev), nr);
>> hw/usb/dev-hub.c:    dc->fw_name = "hub";
>> hw/usb/dev-mtp.c:    dc->fw_name = "mtp";
>> hw/usb/dev-network.c:    dc->fw_name = "network";
>> hw/usb/dev-storage.c:    dc->fw_name = "storage";
>> hw/usb/dev-uas.c:    dc->fw_name = "storage";
>>
>> The plain "usb" naming comes from PCI, which has its own naming
>> logic for PCI devices (which qemu-xhci happens to be) :
> 
> 
> Right, this was the confusing bit for me. I thought that by just setting 
> dc->fw_name to what we put in the DT should be enough but it is not.
> 
> 
>>
>> #0  0x0000000100319474 in pci_dev_fw_name (len=33, buf=0x7fffffffd4c8 
>> "\020", dev=0x7fffc3320010) at ../../hw/pci/pci.c:2533
>> #1  0x0000000100319474 in pcibus_get_fw_dev_path (dev=0x7fffc3320010) 
>> at ../../hw/pci/pci.c:2550
>> #2  0x000000010053118c in bus_get_fw_dev_path (dev=0x7fffc3320010, 
>> bus=<optimized out>) at ../../hw/core/qdev-fw.c:38
>> #3  0x000000010053118c in qdev_get_fw_dev_path_helper 
>> (dev=0x7fffc3320010, p=0x7fffffffd728 "/pci@800000020000000/", 
>> size=128) at ../../hw/core/qdev-fw.c:72
>> #4  0x0000000100531064 in qdev_get_fw_dev_path_helper 
>> (dev=0x101c864a0, p=0x7fffffffd728 "/pci@800000020000000/", size=128) 
>> at ../../hw/core/qdev-fw.c:69
>> #5  0x0000000100531064 in qdev_get_fw_dev_path_helper 
>> (dev=0x1019f3560, p=0x7fffffffd728 "/pci@800000020000000/", size=128) 
>> at ../../hw/core/qdev-fw.c:69
>> #6  0x00000001005312f0 in qdev_get_fw_dev_path (dev=<optimized out>) 
>> at ../../hw/core/qdev-fw.c:91
>> #7  0x0000000100588a68 in get_boot_device_path (dev=<optimized out>, 
>> ignore_suffixes=<optimized out>, ignore_suffixes@entry=true, 
>> suffix=<optimized out>) at ../../softmmu/bootdevice.c:211
>> #8  0x0000000100589540 in get_boot_devices_list (size=0x7fffffffd990) 
>> at ../../softmmu/bootdevice.c:257
>> #9  0x0000000100606764 in spapr_dt_chosen (reset=true, 
>> fdt=0x7fffc26f0010, spapr=0x10149aef0) at ../../hw/ppc/spapr.c:1019
>>
>>
>>> While your patch works, I wonder if we should assign fw_name to all pci
>>> nodes to avoid similar problems in the future? Thanks,
>>>
>>
>> Not sure to understand "assign fw_name to all pci nodes" ...
> 
> 
> Basically this:
> 
> =====
> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> index de0fae10ab9c..8a286419aaf8 100644
> --- a/hw/pci/pci.c
> +++ b/hw/pci/pci.c
> @@ -2508,7 +2508,12 @@ static char *pci_dev_fw_name(DeviceState *dev, 
> char *buf, int len)
>       const char *name = NULL;
>       const pci_class_desc *desc =  pci_class_descriptions;
>       int class = pci_get_word(d->config + PCI_CLASS_DEVICE);
> +    DeviceClass *dc = DEVICE_GET_CLASS(dev);
> 
> +    if (dc->fw_name) {
> +        pstrcpy(buf, len, dc->fw_name);
> +        return buf;
> +    }
>       while (desc->desc &&
>             (class & ~desc->fw_ign_bits) !=
>             (desc->class & ~desc->fw_ign_bits)) {
> diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
> index 0a418f1e6711..057dd384ada7 100644
> --- a/hw/ppc/spapr_pci.c
> +++ b/hw/ppc/spapr_pci.c
> @@ -1467,8 +1467,14 @@ int spapr_pci_dt_populate(SpaprDrc *drc, 
> SpaprMachineState *spapr,
>       HotplugHandler *plug_handler = qdev_get_hotplug_handler(drc->dev);
>       SpaprPhbState *sphb = SPAPR_PCI_HOST_BRIDGE(plug_handler);
>       PCIDevice *pdev = PCI_DEVICE(drc->dev);
> +    DeviceState *dev = DEVICE(pdev);
> +    uint32_t ccode = pci_default_read_config(pdev, PCI_CLASS_PROG, 3);
> +    DeviceClass *dc = DEVICE_GET_CLASS(dev);
> 
>       *fdt_start_offset = spapr_dt_pci_device(sphb, pdev, fdt, 0);
> +
> +    dc->fw_name = g_strdup(dt_name_from_class((ccode >> 16) & 0xff, 
> (ccode >> 8) & 0xff,
> +                                  ccode & 0xff));
>       return 0;
>   }
> =====
> 
> Note this is just to demonstrate the idea (this works though) :)
> (changing the device class is way too late, would need to dig QOM a bit, 
> also need to do the same for hotplugged devices).
> 
> But the point is that pci_dev_fw_name() (has "_fw_name"!) should not 
> ignore dc->fw_name. Thanks,

Ping? Too stupid proposal? :)



-- 
Alexey

