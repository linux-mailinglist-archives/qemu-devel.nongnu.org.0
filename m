Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 316D469FABD
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 19:07:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUtVF-0002Ur-O7; Wed, 22 Feb 2023 13:06:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pUtVD-0002SV-Id; Wed, 22 Feb 2023 13:06:03 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pUtVB-0001oQ-U3; Wed, 22 Feb 2023 13:06:03 -0500
Received: by mail-ed1-x534.google.com with SMTP id o12so34369611edb.9;
 Wed, 22 Feb 2023 10:06:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HXN2YWJ8fsoE2fTAGHa2Bnnq5BnNnF691Tsq1xTjnrk=;
 b=d6pwgQRHUNi91/P5JNTW1ewJGs7gEup0VuZp1Qql+EtK2ycX/49je76OHHyA7V9CRl
 lYnpUelOEadp0DbbJ7woeuajf1oIKwGZEE1mprrt6SoGRO7s5b5UQAqc0VRKCnZoDpWR
 DhgT3b+KgHJKvw8kH6/VCYosF4emLN/ukExeeSr8/O3938SWSwAjVFxPtYgf96QhqM6k
 k6EGT5R6T0QuOLGacFUG/mzFBTwUTyt8v8g3vXLh0Brn86V0cO1tQKm7CUmhpGYj7wta
 dE2JLqJKyQmsRQNzqKYZQhpCKfT7+ivPtfsjd+vM8ro6Veb7XymiBdDZSkNbXJRIUhFN
 LaLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HXN2YWJ8fsoE2fTAGHa2Bnnq5BnNnF691Tsq1xTjnrk=;
 b=ViQdk5a3oQvUSzX8hB5RCUiboUGUFMbA4XVYN7oFlSLSYEwbaobL04A9uYJhMN0NRV
 it7Lftfk+OODZ/3EiQzqC/iyI9iV8+FC2QtWgzNXy0lK5OhlM9FYBNJ0INvflDdmnykp
 d2W4x9ss0btO4L0iBT72OV8dhPVIlU3iH5JApDuXxkurUo/rvox0z4Qfm3j5gs1WzgXs
 AYD0CR0hazZVPZfoxFvdj4spmbWHRhrWhyDEq+vnH2C4x6+db3BUNpVvjCPPW4tD5aL4
 mXOlBAeMO4np6hXq/FiZlsq/0Wdqp5Y5lmwoZ4wY5LWPwJsrnMnHLXBbjXJjl2Kb3Ujq
 p2yA==
X-Gm-Message-State: AO0yUKVpm76q7bXxfHHy5YFOOfix2+qffLaLpqMNclxNXtnH4XhXNeEg
 oDEn9nMvuDdqMKlx25TlvDQ=
X-Google-Smtp-Source: AK7set+hVkKI5LwDeVwWDyTsC144EdFv21dhLjOQd8CG9ZF6eZB/1DO0oceqRk2crUuMwlbJ52TrYA==
X-Received: by 2002:a05:6402:329:b0:4ac:bcf9:6d6c with SMTP id
 q9-20020a056402032900b004acbcf96d6cmr8431032edw.36.1677089159932; 
 Wed, 22 Feb 2023 10:05:59 -0800 (PST)
Received: from ?IPv6:::1?
 (p200300faaf06ee00dc7226af23ff2fba.dip0.t-ipconnect.de.
 [2003:fa:af06:ee00:dc72:26af:23ff:2fba])
 by smtp.gmail.com with ESMTPSA id
 i14-20020a50d74e000000b004acbde59e64sm4310567edj.8.2023.02.22.10.05.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Feb 2023 10:05:59 -0800 (PST)
Date: Wed, 22 Feb 2023 18:05:51 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
CC: Paolo Bonzini <pbonzini@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, qemu-trivial@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Juan Quintela <quintela@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Thomas Huth <thuth@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, Ani Sinha <ani@anisinha.ca>,
 Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH v4 1/9] hw/pci-host/i440fx: Inline sysbus_add_io()
In-Reply-To: <f865212d-6a08-8f9e-5ddd-6fe037fc5fa9@linaro.org>
References: <20230213162004.2797-1-shentey@gmail.com>
 <20230213162004.2797-2-shentey@gmail.com>
 <f865212d-6a08-8f9e-5ddd-6fe037fc5fa9@linaro.org>
Message-ID: <3ABCEE15-F73D-498F-8D95-F17B78795E14@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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



Am 22=2E Februar 2023 10:58:08 UTC schrieb "Philippe Mathieu-Daud=C3=A9" <=
philmd@linaro=2Eorg>:
>On 13/2/23 17:19, Bernhard Beschow wrote:
>> sysbus_add_io() just wraps memory_region_add_subregion() while also
>> obscuring where the memory is attached=2E So use
>> memory_region_add_subregion() directly and attach it to the existing
>> memory region s->bus->address_space_io which is set as an alias to
>> get_system_io() by the pc machine=2E
>>=20
>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>> Reviewed-by: Thomas Huth <thuth@redhat=2Ecom>
>> ---
>>   hw/pci-host/i440fx=2Ec | 5 +++--
>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/hw/pci-host/i440fx=2Ec b/hw/pci-host/i440fx=2Ec
>> index 262f82c303=2E=2E9c6882d3fc 100644
>> --- a/hw/pci-host/i440fx=2Ec
>> +++ b/hw/pci-host/i440fx=2Ec
>> @@ -27,6 +27,7 @@
>>   #include "qemu/range=2Eh"
>>   #include "hw/i386/pc=2Eh"
>>   #include "hw/pci/pci=2Eh"
>> +#include "hw/pci/pci_bus=2Eh"
>>   #include "hw/pci/pci_host=2Eh"
>>   #include "hw/pci-host/i440fx=2Eh"
>>   #include "hw/qdev-properties=2Eh"
>> @@ -217,10 +218,10 @@ static void i440fx_pcihost_realize(DeviceState *d=
ev, Error **errp)
>>       PCIHostState *s =3D PCI_HOST_BRIDGE(dev);
>>       SysBusDevice *sbd =3D SYS_BUS_DEVICE(dev);
>>   -    sysbus_add_io(sbd, 0xcf8, &s->conf_mem);
>> +    memory_region_add_subregion(s->bus->address_space_io, 0xcf8, &s->c=
onf_mem);
>
>To avoid accessing internal fields we should stick to the PCI API:
>
>    memory_region_add_subregion(pci_address_space_io(PCI_DEVICE(dev)),
>                                0xcf8, &s->conf_mem);

dev is of type PCIHostState which derives from SysBusDevice, not PCIDevice=
=2E AFAICS there is no getter implemented on PCIBus=2E

>
>>       sysbus_init_ioports(sbd, 0xcf8, 4);
>>   -    sysbus_add_io(sbd, 0xcfc, &s->data_mem);
>> +    memory_region_add_subregion(s->bus->address_space_io, 0xcfc, &s->d=
ata_mem);
>>       sysbus_init_ioports(sbd, 0xcfc, 4);
>
>Now all classes implementing PCI_HOST_BRIDGE register conf/data in I/O
>space, so this could be a pattern justifying reworking a bit the
>PCIHostBridgeClass or adding an helper in "hw/pci/pci_host=2Eh" to do
>that generically=2E

What do you mean exactly? There are PCI hosts spawning two PCI buses and t=
herefore have two such spaces=2E

Best regards,
Bernhard

