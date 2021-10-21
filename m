Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01CF9435FEA
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 13:04:38 +0200 (CEST)
Received: from localhost ([::1]:47402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdVsD-0003eY-21
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 07:04:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mdVoC-0001OU-Kr
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 07:00:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29406)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mdVoA-0001K6-62
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 07:00:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634814025;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mQxuZ+qru9uwAMqCGWwthd2ckwQfVKKkCEP2GWRT1J0=;
 b=LBAW4D3lU1mvT4+IH4QHma0MuZ4OEHrKrDFoxVqlVj17J6GoapRlh8QvyHsrhIEAuo5wnq
 /xs+y3Wea9J8ft5vgOdfnY/FhZAGqIKSal+4+Gh1U8T1qpMBerh6vwQMHWSY9jqLeSqmRO
 8hMxMlJWJt83yBQIeky6gmfJb8JQVbY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-561-IxSCBlo0PE-O1BPzlBZ7bQ-1; Thu, 21 Oct 2021 07:00:22 -0400
X-MC-Unique: IxSCBlo0PE-O1BPzlBZ7bQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 a15-20020a056000188f00b00161068d8461so62424wri.11
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 04:00:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=mQxuZ+qru9uwAMqCGWwthd2ckwQfVKKkCEP2GWRT1J0=;
 b=5ykHpfU0aDkH4eRqWzVrS3+lOacP0wkvY4mnzjCRls3UxzfnWZEPBjsNdk5Zd/dXGl
 cbg1mIvF4yNRFSNyI9PrQ5DfB9UmcxsNOkGznxUswepjUzqrZppHQT/Sqwnriem2Z098
 jvmBb7WANnDmL93X3azgnnqKAoZZUIHMKaJnWDO1TVjmcXL286xqDYLmDILHGjSpbPri
 gc7qEWvZFlmyqVbEMbywsBAb1VqBTH4E9EP+0LkdYHc7QlqnxQ7U2OoW4QRSbDkVAd6z
 UHXybPlZC6WixHz1hokv7AGLxcXcE/csu8Vd6vsGm73YZpGnXdexmReMmKqANEoY1djd
 xJSw==
X-Gm-Message-State: AOAM533npOTXKZhX95FjugK0WoE7Go6zSzrvKQWDPiJmMELCwlqZgt0/
 u62n/4Y/6ha/cIYX7wCFbujMyu8S/W0MZ4WGo3tYkaW+XnCwLqtLXcl14Crokz94sZep/73IzEn
 53az7r6Y2dF8eOdA=
X-Received: by 2002:adf:9bc4:: with SMTP id e4mr6387273wrc.257.1634814020911; 
 Thu, 21 Oct 2021 04:00:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxg+aKSPc534+aaHjvP7OSwUD1Op+sA6nX6+r3M76J2GMasvX1XMpHThcZN6YL89ay2EcJ9JQ==
X-Received: by 2002:adf:9bc4:: with SMTP id e4mr6387236wrc.257.1634814020708; 
 Thu, 21 Oct 2021 04:00:20 -0700 (PDT)
Received: from [192.168.3.132] (p4ff23aba.dip0.t-ipconnect.de. [79.242.58.186])
 by smtp.gmail.com with ESMTPSA id t21sm4380631wmi.19.2021.10.21.04.00.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Oct 2021 04:00:20 -0700 (PDT)
Message-ID: <e4da17e2-8244-a6a8-54de-be21b21d9040@redhat.com>
Date: Thu, 21 Oct 2021 13:00:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 5/8] pci: Add pci_for_each_root_bus()
To: Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org
References: <20211021104259.57754-1-peterx@redhat.com>
 <20211021104259.57754-6-peterx@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20211021104259.57754-6-peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.267, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Eric Auger <eric.auger@redhat.com>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21.10.21 12:42, Peter Xu wrote:
> Add a helper to loop over each root bus of the system, either the default root
> bus or extended buses like pxb-pcie.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  hw/pci/pci.c         | 26 ++++++++++++++++++++++++++
>  include/hw/pci/pci.h |  2 ++
>  2 files changed, 28 insertions(+)
> 
> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> index 4a84e478ce..1623bc9099 100644
> --- a/hw/pci/pci.c
> +++ b/hw/pci/pci.c
> @@ -2097,6 +2097,32 @@ void pci_for_each_bus_depth_first(PCIBus *bus, pci_bus_ret_fn begin,
>      }
>  }
>  
> +typedef struct {
> +    pci_bus_fn fn;
> +    void *opaque;
> +} pci_root_bus_args;
> +

PCIRootBusArgs ?

Or maybe

PCIForEachRootBusInfo

... but it gets lengthy .. ;)

> +static int pci_find_root_bus(Object *obj, void *opaque)
> +{
> +    pci_root_bus_args *args = opaque;
> +
> +    if (object_dynamic_cast(obj, TYPE_PCI_HOST_BRIDGE)) {
> +        PCIBus *bus = PCI_HOST_BRIDGE(obj)->bus;
> +
> +        if (bus) {
> +            args->fn(bus, args->opaque);
> +        }
> +    }
> +
> +    return 0;
> +}
> +
> +void pci_for_each_root_bus(pci_bus_fn fn, void *opaque)
> +{
> +    pci_root_bus_args args = { .fn = fn, .opaque = opaque };
> +
> +    object_child_foreach_recursive(object_get_root(), pci_find_root_bus, &args);
> +}
>  
>  PCIDevice *pci_find_device(PCIBus *bus, int bus_num, uint8_t devfn)
>  {
> diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> index a7e81f04d3..9e490d8969 100644
> --- a/include/hw/pci/pci.h
> +++ b/include/hw/pci/pci.h
> @@ -474,6 +474,8 @@ void pci_for_each_device_under_bus_reverse(PCIBus *bus,
>                                             void *opaque);
>  void pci_for_each_bus_depth_first(PCIBus *bus, pci_bus_ret_fn begin,
>                                    pci_bus_fn end, void *parent_state);
> +/* Call `fn' for each pci root bus on the system */
> +void pci_for_each_root_bus(pci_bus_fn fn, void *opaque);
>  PCIDevice *pci_get_function_0(PCIDevice *pci_dev);
>  
>  /* Use this wrapper when specific scan order is not required. */
> 

Apart from that LGTM, but not a PCI expert.

-- 
Thanks,

David / dhildenb


