Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC056AB6BA
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 07:58:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZ4nH-0003Uw-Pd; Mon, 06 Mar 2023 01:57:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pZ4nE-0003H1-7q; Mon, 06 Mar 2023 01:57:56 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pZ4nB-0001Xp-55; Mon, 06 Mar 2023 01:57:55 -0500
Received: by mail-wm1-x32c.google.com with SMTP id j3so4955771wms.2;
 Sun, 05 Mar 2023 22:57:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678085871;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ROFUnSEnxl2TBbaUggpz+pLim4EObH1XxtmbpnXyJeg=;
 b=Gbf8w6PRqq708WiAvYvwlPfs5m8rsncJHY9mRJRFaxhWeDWuefsu+1pOF1jXGvIATD
 XIZZSyRIAJj9HMutgd4aFmCKB/RIopiUGts/ahdTQbxn9fWvkC5wgn2+vzTzXmlmqgEP
 REmePisHCwZDNofp8eLyqWczEjD6EHLAaVK2C4Gsecj3CVKwR5HkeBHjbXAyFpmfX3iE
 psyFdJWThPqwxQbQXWZAU4wL8npiCd8KES5Or5rCGMxD72lkFzMcqxfF+Rm6VBirH8BN
 mngwZv9tIyUHlIalgi/rhEl3JLnXW76ZfHL/GqdoJ82MtSJTv+NLSTXfjdEP0wzNLf+i
 xhGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678085871;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ROFUnSEnxl2TBbaUggpz+pLim4EObH1XxtmbpnXyJeg=;
 b=NNFbpq7pUYdwpCaHqdEwvD1BzFXwriAToLRkjaIjcncNLZEGYt7nqNxFlBSqT3F7/2
 D5JMxuOllSGVIDaGABWcVZkqD57+VL/KhRvR+DZA0kUnx+hA+K8FVYc/Q30oxIWLrDDI
 FpCdFmpduzPfJRi35C9hhE84qDmuemu6/IO+rxqDjZi4q/ZTFOLXQrrf1oYFvetG8ZnS
 0TZ4+8eu3ze3PrzgxECkypZjl2yzhQEczbgeIZz9dkWS+AdSVXtrb7KpPqM9xpDTVxJm
 ApnRUJfRlT+0T4t+PreFG8lzDFIYL5XA0CcqfVytU8DBuFoRRRTthZAe5kGYo75T8OJ8
 Va3Q==
X-Gm-Message-State: AO0yUKX6AgT6YynEErKtaAnezqcm1WmRLjKIx+4583Namrl22Jj8BHIt
 0cfJ/h7ENXLkbsHSAN7IKLE=
X-Google-Smtp-Source: AK7set/ewuiHEzHh0iNpNycKs2yqLUJROAcfJdLlFmRBzPoo1sqPEaflKKKVkeHTFCDfSgScIPDHiA==
X-Received: by 2002:a05:600c:4f15:b0:3eb:3998:36fa with SMTP id
 l21-20020a05600c4f1500b003eb399836famr8243613wmq.29.1678085871042; 
 Sun, 05 Mar 2023 22:57:51 -0800 (PST)
Received: from [127.0.0.1] (dynamic-077-183-189-218.77.183.pool.telefonica.de.
 [77.183.189.218]) by smtp.gmail.com with ESMTPSA id
 p16-20020a05600c359000b003e209b45f6bsm14294231wmq.29.2023.03.05.22.57.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Mar 2023 22:57:50 -0800 (PST)
Date: Mon, 06 Mar 2023 06:57:41 +0000
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
In-Reply-To: <3ABCEE15-F73D-498F-8D95-F17B78795E14@gmail.com>
References: <20230213162004.2797-1-shentey@gmail.com>
 <20230213162004.2797-2-shentey@gmail.com>
 <f865212d-6a08-8f9e-5ddd-6fe037fc5fa9@linaro.org>
 <3ABCEE15-F73D-498F-8D95-F17B78795E14@gmail.com>
Message-ID: <EA2E3787-179C-4A50-9305-969404D09702@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=shentey@gmail.com; helo=mail-wm1-x32c.google.com
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



Am 22=2E Februar 2023 18:05:51 UTC schrieb Bernhard Beschow <shentey@gmail=
=2Ecom>:
>
>
>Am 22=2E Februar 2023 10:58:08 UTC schrieb "Philippe Mathieu-Daud=C3=A9" =
<philmd@linaro=2Eorg>:
>>On 13/2/23 17:19, Bernhard Beschow wrote:
>>> sysbus_add_io() just wraps memory_region_add_subregion() while also
>>> obscuring where the memory is attached=2E So use
>>> memory_region_add_subregion() directly and attach it to the existing
>>> memory region s->bus->address_space_io which is set as an alias to
>>> get_system_io() by the pc machine=2E
>>>=20
>>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>>> Reviewed-by: Thomas Huth <thuth@redhat=2Ecom>
>>> ---
>>>   hw/pci-host/i440fx=2Ec | 5 +++--
>>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>>=20
>>> diff --git a/hw/pci-host/i440fx=2Ec b/hw/pci-host/i440fx=2Ec
>>> index 262f82c303=2E=2E9c6882d3fc 100644
>>> --- a/hw/pci-host/i440fx=2Ec
>>> +++ b/hw/pci-host/i440fx=2Ec
>>> @@ -27,6 +27,7 @@
>>>   #include "qemu/range=2Eh"
>>>   #include "hw/i386/pc=2Eh"
>>>   #include "hw/pci/pci=2Eh"
>>> +#include "hw/pci/pci_bus=2Eh"
>>>   #include "hw/pci/pci_host=2Eh"
>>>   #include "hw/pci-host/i440fx=2Eh"
>>>   #include "hw/qdev-properties=2Eh"
>>> @@ -217,10 +218,10 @@ static void i440fx_pcihost_realize(DeviceState *=
dev, Error **errp)
>>>       PCIHostState *s =3D PCI_HOST_BRIDGE(dev);
>>>       SysBusDevice *sbd =3D SYS_BUS_DEVICE(dev);
>>>   -    sysbus_add_io(sbd, 0xcf8, &s->conf_mem);
>>> +    memory_region_add_subregion(s->bus->address_space_io, 0xcf8, &s->=
conf_mem);
>>
>>To avoid accessing internal fields we should stick to the PCI API:
>>
>>    memory_region_add_subregion(pci_address_space_io(PCI_DEVICE(dev)),
>>                                0xcf8, &s->conf_mem);
>
>dev is of type PCIHostState which derives from SysBusDevice, not PCIDevic=
e=2E AFAICS there is no getter implemented on PCIBus=2E

Ping

>
>>
>>>       sysbus_init_ioports(sbd, 0xcf8, 4);
>>>   -    sysbus_add_io(sbd, 0xcfc, &s->data_mem);
>>> +    memory_region_add_subregion(s->bus->address_space_io, 0xcfc, &s->=
data_mem);
>>>       sysbus_init_ioports(sbd, 0xcfc, 4);
>>
>>Now all classes implementing PCI_HOST_BRIDGE register conf/data in I/O
>>space, so this could be a pattern justifying reworking a bit the
>>PCIHostBridgeClass or adding an helper in "hw/pci/pci_host=2Eh" to do
>>that generically=2E
>
>What do you mean exactly? There are PCI hosts spawning two PCI buses and =
therefore have two such spaces=2E
>
>Best regards,
>Bernhard

