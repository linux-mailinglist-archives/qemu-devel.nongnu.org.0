Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A8B046B56A
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 09:11:04 +0100 (CET)
Received: from localhost ([::1]:48240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muVZ1-0001Av-At
	for lists+qemu-devel@lfdr.de; Tue, 07 Dec 2021 03:11:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1muVXF-0000UO-CE
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 03:09:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29090)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1muVXC-0004KU-Na
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 03:09:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638864549;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=98xTGR6CtBuO4FauoCA3yQRVhpSCcFvOtfL0iGP4V6U=;
 b=C1l1FeJM5kOyelUOpVv1cQEe0egqm3RLPUreBLec13EeEU6HBBteIKpe1t2d8yJvYPQOH1
 LGMB3nmOBkf2ksq90kGU4xXlLuj6MacikrKjJuV+Cz861nXf8QL4ZaTR8V9Z6f9WEwp518
 twW2SZ56FjacMS3+Jit+Bcwlh0Hw6yY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-388-gFBQdcVhP-etmUeruG-VeA-1; Tue, 07 Dec 2021 03:09:08 -0500
X-MC-Unique: gFBQdcVhP-etmUeruG-VeA-1
Received: by mail-wm1-f72.google.com with SMTP id
 145-20020a1c0197000000b0032efc3eb9bcso899551wmb.0
 for <qemu-devel@nongnu.org>; Tue, 07 Dec 2021 00:09:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=98xTGR6CtBuO4FauoCA3yQRVhpSCcFvOtfL0iGP4V6U=;
 b=AjEAsu1NBAfvRYZMgH4kWr0UuFekpPtiAnXS8foPUPWVfNyeVO2eTKO+cyz2nROaRa
 gVA5RdgwKxoI8Gcbovqt/5AlAXWWIdjlyyNd0OkLa7snsrBCr3Ee5XfmuaWM2WVomk80
 JEtbWLNOMRyrml96xlviijGKNo7op6vM6LsdpsXrZmXcaC6uVOuPPYdoWdt/Kl68JnKp
 mL4ytBkXF2urI5Z3MXu5MRH+XQeh2QljMMsfqDOyEHgzyF469y3fhyKFV+2i31HegOFK
 GBNUDbbhz3GoECqDU0zGMvKAtTB9Pt347eWfDbxALUxcFQmEbDqfwvYv1PsLQOqJdyaa
 mYpQ==
X-Gm-Message-State: AOAM530rw0H+0gRBVTvQVShS/isR5alSwGe80l9yKWPcrdczkC5Te0Ru
 ApBleNZToxSD5HjrdiQjAh8zY4KSkzygXI8anFjn9XUrJSLfTjqAR1y1ngT+yuVdEd6YcMUSzoX
 kU59dii+3FE/ijc4=
X-Received: by 2002:a1c:1c1:: with SMTP id 184mr4995320wmb.1.1638864547150;
 Tue, 07 Dec 2021 00:09:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwiBnlnJaN9tv0eWzGjSTsWIARR3MvsImDGVzun1DN8tfxtptmTKtTKe+RYNvwfPX87JeCu/A==
X-Received: by 2002:a1c:1c1:: with SMTP id 184mr4995295wmb.1.1638864546853;
 Tue, 07 Dec 2021 00:09:06 -0800 (PST)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id h16sm14698096wrm.27.2021.12.07.00.09.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Dec 2021 00:09:06 -0800 (PST)
Message-ID: <d754cc02-c4a7-17df-83c5-9120ba44a85d@redhat.com>
Date: Tue, 7 Dec 2021 09:09:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v6 1/6] qtest/libqos: add a function to initialize
 secondary PCI buses
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org
References: <20211206222040.3872253-1-lvivier@redhat.com>
 <20211206222040.3872253-2-lvivier@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20211206222040.3872253-2-lvivier@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.44, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jens Freimann <jfreimann@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06/12/2021 23.20, Laurent Vivier wrote:
> Scan the PCI devices to find bridge and set PCI_SECONDARY_BUS and
> PCI_SUBORDINATE_BUS (algorithm from seabios)
> 
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> ---
>   include/hw/pci/pci_bridge.h |   8 +++
>   tests/qtest/libqos/pci.c    | 118 ++++++++++++++++++++++++++++++++++++
>   tests/qtest/libqos/pci.h    |   1 +
>   3 files changed, 127 insertions(+)
> 
> diff --git a/include/hw/pci/pci_bridge.h b/include/hw/pci/pci_bridge.h
> index a94d350034bf..30691a6e5728 100644
> --- a/include/hw/pci/pci_bridge.h
> +++ b/include/hw/pci/pci_bridge.h
> @@ -138,6 +138,7 @@ typedef struct PCIBridgeQemuCap {
>       uint64_t mem_pref_64; /* Prefetchable memory to reserve (64-bit MMIO) */
>   } PCIBridgeQemuCap;
>   
> +#define REDHAT_PCI_CAP_TYPE_OFFSET      3
>   #define REDHAT_PCI_CAP_RESOURCE_RESERVE 1
>   
>   /*
> @@ -152,6 +153,13 @@ typedef struct PCIResReserve {
>       uint64_t mem_pref_64;
>   } PCIResReserve;
>   
> +#define REDHAT_PCI_CAP_RES_RESERVE_BUS_RES     4
> +#define REDHAT_PCI_CAP_RES_RESERVE_IO          8
> +#define REDHAT_PCI_CAP_RES_RESERVE_MEM         16
> +#define REDHAT_PCI_CAP_RES_RESERVE_PREF_MEM_32 20
> +#define REDHAT_PCI_CAP_RES_RESERVE_PREF_MEM_64 24
> +#define REDHAT_PCI_CAP_RES_RESERVE_CAP_SIZE    32
> +
>   int pci_bridge_qemu_reserve_cap_init(PCIDevice *dev, int cap_offset,
>                                  PCIResReserve res_reserve, Error **errp);
>   
> diff --git a/tests/qtest/libqos/pci.c b/tests/qtest/libqos/pci.c
> index e1e96189c821..3f0b18f4750b 100644
> --- a/tests/qtest/libqos/pci.c
> +++ b/tests/qtest/libqos/pci.c
> @@ -13,6 +13,8 @@
>   #include "qemu/osdep.h"
>   #include "pci.h"
>   
> +#include "hw/pci/pci.h"
> +#include "hw/pci/pci_bridge.h"
>   #include "hw/pci/pci_regs.h"
>   #include "qemu/host-utils.h"
>   #include "qgraph.h"
> @@ -99,6 +101,122 @@ void qpci_device_init(QPCIDevice *dev, QPCIBus *bus, QPCIAddress *addr)
>       g_assert(!addr->device_id || device_id == addr->device_id);
>   }
>   
> +static uint8_t qpci_find_resource_reserve_capability(QPCIDevice *dev)
> +{
> +    uint16_t device_id;
> +    uint8_t cap = 0;
> +
> +    if (qpci_config_readw(dev, PCI_VENDOR_ID) != PCI_VENDOR_ID_REDHAT) {
> +        return 0;
> +    }
> +
> +    device_id = qpci_config_readw(dev, PCI_DEVICE_ID);
> +
> +    if (device_id != PCI_DEVICE_ID_REDHAT_PCIE_RP &&
> +        device_id != PCI_DEVICE_ID_REDHAT_BRIDGE) {
> +        return 0;
> +    }
> +
> +    do {
> +        cap = qpci_find_capability(dev, PCI_CAP_ID_VNDR, cap);
> +    } while (cap &&
> +             qpci_config_readb(dev, cap + REDHAT_PCI_CAP_TYPE_OFFSET) !=
> +             REDHAT_PCI_CAP_RESOURCE_RESERVE);
> +    if (cap) {
> +        uint8_t cap_len = qpci_config_readb(dev, cap + PCI_CAP_FLAGS);
> +        if (cap_len < REDHAT_PCI_CAP_RES_RESERVE_CAP_SIZE) {
> +            return 0;
> +        }
> +    }
> +    return cap;
> +}
> +
> +static void qpci_secondary_buses_rec(QPCIBus *qbus, int bus, int *pci_bus)
> +{
> +    QPCIDevice *dev;
> +    uint16_t class;
> +    uint8_t pribus, secbus, subbus;
> +    int i;

<nit>I'd maybe use a better name instead of "i" here.</nit>

> +    for (i = 0; i < 32; i++) {
> +        dev = qpci_device_find(qbus, QPCI_DEVFN(bus + i, 0));
> +        if (dev == NULL) {
> +            continue;
> +        }
> +        class = qpci_config_readw(dev, PCI_CLASS_DEVICE);
> +        if (class == PCI_CLASS_BRIDGE_PCI) {
> +            qpci_config_writeb(dev, PCI_SECONDARY_BUS, 255);
> +            qpci_config_writeb(dev, PCI_SUBORDINATE_BUS, 0);
> +        }
> +        g_free(dev);
> +    }
> +
> +    for (i = 0; i < 32; i++) {
> +        dev = qpci_device_find(qbus, QPCI_DEVFN(bus + i, 0));
> +        if (dev == NULL) {
> +            continue;
> +        }
> +        class = qpci_config_readw(dev, PCI_CLASS_DEVICE);
> +        if (class != PCI_CLASS_BRIDGE_PCI) {
> +            continue;
> +        }
> +
> +        pribus = qpci_config_readb(dev, PCI_PRIMARY_BUS);
> +        if (pribus != bus) {
> +            qpci_config_writeb(dev, PCI_PRIMARY_BUS, bus);
> +        }
> +
> +        secbus = qpci_config_readb(dev, PCI_SECONDARY_BUS);
> +        (*pci_bus)++;
> +        if (*pci_bus != secbus) {
> +            secbus = *pci_bus;
> +            qpci_config_writeb(dev, PCI_SECONDARY_BUS, secbus);
> +        }
> +
> +        subbus = qpci_config_readb(dev, PCI_SUBORDINATE_BUS);
> +        qpci_config_writeb(dev, PCI_SUBORDINATE_BUS, 255);
> +
> +        qpci_secondary_buses_rec(qbus, secbus << 5, pci_bus);
> +
> +        if (subbus != *pci_bus) {
> +            uint8_t res_bus = *pci_bus;
> +            uint8_t cap = qpci_find_resource_reserve_capability(dev);
> +
> +            if (cap) {
> +                uint32_t tmp_res_bus;
> +
> +                tmp_res_bus = qpci_config_readl(dev, cap +
> +                                            REDHAT_PCI_CAP_RES_RESERVE_BUS_RES);
> +                if (tmp_res_bus != (uint32_t)-1) {
> +                    res_bus = tmp_res_bus & 0xFF;
> +                    if ((uint8_t)(res_bus + secbus) < secbus ||
> +                        (uint8_t)(res_bus + secbus) < res_bus) {
> +                        res_bus = 0;
> +                    }
> +                    if (secbus + res_bus > *pci_bus) {
> +                        res_bus = secbus + res_bus;
> +                    }
> +                }
> +            }
> +            subbus = res_bus;
> +            *pci_bus = res_bus;
> +        }
> +
> +        qpci_config_writeb(dev, PCI_SUBORDINATE_BUS, subbus);
> +        g_free(dev);
> +    }
> +}
> +
> +int qpci_secondary_buses_init(QPCIBus *bus)
> +{
> +    int last_bus = 0;
> +
> +    qpci_secondary_buses_rec(bus, 0, &last_bus);
> +
> +    return last_bus;
> +}
> +
> +
>   void qpci_device_enable(QPCIDevice *dev)
>   {
>       uint16_t cmd;
> diff --git a/tests/qtest/libqos/pci.h b/tests/qtest/libqos/pci.h
> index ee64fdecbda8..becb800f9e6a 100644
> --- a/tests/qtest/libqos/pci.h
> +++ b/tests/qtest/libqos/pci.h
> @@ -81,6 +81,7 @@ void qpci_device_foreach(QPCIBus *bus, int vendor_id, int device_id,
>                            void *data);
>   QPCIDevice *qpci_device_find(QPCIBus *bus, int devfn);
>   void qpci_device_init(QPCIDevice *dev, QPCIBus *bus, QPCIAddress *addr);
> +int qpci_secondary_buses_init(QPCIBus *bus);
>   
>   bool qpci_has_buggy_msi(QPCIDevice *dev);
>   bool qpci_check_buggy_msi(QPCIDevice *dev);
> 

Acked-by: Thomas Huth <thuth@redhat.com>


