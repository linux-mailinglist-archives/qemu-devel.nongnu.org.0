Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4189743DBD8
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 09:19:59 +0200 (CEST)
Received: from localhost ([::1]:51482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfzhe-0002OD-3e
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 03:19:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mfzfZ-0001hD-Sv
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 03:17:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50327)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mfzfW-0001HV-09
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 03:17:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635405465;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ch3VbQ41FkzYF5fuQdZ9MMrn2Kb6QeFz5c20di/n9LQ=;
 b=HgLo1LuFiPbZA6Li8bdnxT1bF1piA7oIrMo9DQGTBtt/q6Sv8m6uOzsA9gq9g8Rf0IUWw3
 xtLkaPBTWg6pfI3gw4vp1LsMhpFDV0uafKrBLdrEXSwTdbuvIpef9JzYj4AOFQ3U60B1MG
 AUh5Xo3A+zOCjVRMR98q+DhX8YT/QnY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-186-9cqOV4zWOX2-cDiVe8c_IQ-1; Thu, 28 Oct 2021 03:17:39 -0400
X-MC-Unique: 9cqOV4zWOX2-cDiVe8c_IQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 k126-20020a1ca184000000b003231d0e329bso2339629wme.4
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 00:17:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ch3VbQ41FkzYF5fuQdZ9MMrn2Kb6QeFz5c20di/n9LQ=;
 b=CP+1KRqH4HBDNT8x9k7olCkpxzho6PVduzNDQQolcgmjY0DmIVI7K13/NeF6gemcZs
 +oIQOjrJL+749yJTa/0sh3NhD2UR2lmRyFT65CJTsZnsvSq4Fdaq3GBxyPoyvFKzlisc
 fTWnXkdJk1VkFMtjpu9AO6lieX8W79yJKpHnJkYe0SXhLRd95J1AVZsqJ5x1KaQhjFLb
 OT20HIFHo67+W2rbmWRwEO9bf0U1S2RuGJMVli5CsbG+dx4tPulh6wVTNmGNPv/VdjoK
 wkyDDWkEzkcd27l0i4RcNSIPFIL0rNzcXuaT5pNTooJvtCNCGh92HYXqYecMxUr2NSk4
 /H5Q==
X-Gm-Message-State: AOAM532OqtZD+8NbBeWVRoS9RYDeBlO2X8D7q7jxZFq4/rsDdzK2CQMi
 MR38SqLZXfIVDB9j6rv5y3yYSscNxWmKB8aPsm/cVhXAKlZmYInXm5fHG7fYc7ML/tqb1CSLOi6
 N0VUiaA3fY/o8s/c=
X-Received: by 2002:a5d:6d81:: with SMTP id l1mr3380386wrs.110.1635405458087; 
 Thu, 28 Oct 2021 00:17:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzTFiV80ddynRlOkTl4zMz45IuShOZBH3vo326zdj3r7Kc5emYUbAHYTidbeadZUN2/BBY3Uw==
X-Received: by 2002:a5d:6d81:: with SMTP id l1mr3380263wrs.110.1635405456872; 
 Thu, 28 Oct 2021 00:17:36 -0700 (PDT)
Received: from [192.168.3.132] (p4ff23b52.dip0.t-ipconnect.de. [79.242.59.82])
 by smtp.gmail.com with ESMTPSA id
 k8sm5735945wms.41.2021.10.28.00.17.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Oct 2021 00:17:36 -0700 (PDT)
Message-ID: <191ca1fc-06fa-8114-0620-f3edc4aa95e4@redhat.com>
Date: Thu, 28 Oct 2021 09:17:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 5/5] pc/q35: Add pre-plug hook for x86-iommu
To: Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org
References: <20211028043129.38871-1-peterx@redhat.com>
 <20211028043129.38871-6-peterx@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20211028043129.38871-6-peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.847, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
 Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28.10.21 06:31, Peter Xu wrote:
> Add a pre-plug hook for x86-iommu, so that we can detect vfio-pci devices
> before realizing the vIOMMU device.
> 
> When the guest contains both the x86 vIOMMU and vfio-pci devices, the user
> needs to specify the x86 vIOMMU before the vfio-pci devices.  The reason is,
> vfio_realize() calls pci_device_iommu_address_space() to fetch the correct dma
> address space for the device, while that API can only work right after the
> vIOMMU device initialized first.
> 
> For example, the iommu_fn() that is used in pci_device_iommu_address_space() is
> only setup in realize() of the vIOMMU devices.
> 
> For a long time we have had libvirt making sure that the ordering is correct,
> however from qemu side we never fail a guest from booting even if the ordering
> is specified wrongly.  When the order is wrong, the guest will encounter
> misterious error when operating on the vfio-pci device because in QEMU we'll
> still assume the vfio-pci devices are put into the default DMA domain (which is
> normally the direct GPA mapping), so e.g. the DMAs will never go right.
> 
> This patch fails the guest from booting when we detected such errornous cmdline
> specified, then the guest at least won't encounter weird device behavior after
> booted.  The error message will also help the user to know how to fix the issue.
> 
> Cc: Alex Williamson <alex.williamson@redhat.com>
> Suggested-by: Igor Mammedov <imammedo@redhat.com>
> Signed-off-by: Peter Xu <peterx@redhat.com>

I think that's a big improvement. I ran into this issue myself and found
the documentation at https://wiki.qemu.org/Features/VT-d at one time
("Meanwhile, the intel-iommu device must be specified as the first
device in the parameter list (before all the rest of the devices). ").

So feel free to add my

Acked-by: David Hildenbrand <david@redhat.com>

> ---
>  hw/i386/pc.c                |  4 ++++
>  hw/i386/x86-iommu.c         | 14 ++++++++++++++
>  include/hw/i386/x86-iommu.h |  8 ++++++++
>  3 files changed, 26 insertions(+)
> 
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 86223acfd3..b70a04011e 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -81,6 +81,7 @@
>  #include "hw/core/cpu.h"
>  #include "hw/usb.h"
>  #include "hw/i386/intel_iommu.h"
> +#include "hw/i386/x86-iommu.h"
>  #include "hw/net/ne2000-isa.h"
>  #include "standard-headers/asm-x86/bootparam.h"
>  #include "hw/virtio/virtio-pmem-pci.h"
> @@ -1327,6 +1328,8 @@ static void pc_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
>          pc_memory_pre_plug(hotplug_dev, dev, errp);
>      } else if (object_dynamic_cast(OBJECT(dev), TYPE_CPU)) {
>          x86_cpu_pre_plug(hotplug_dev, dev, errp);
> +    } else if (object_dynamic_cast(OBJECT(dev), TYPE_X86_IOMMU_DEVICE)) {
> +        x86_iommu_pre_plug(X86_IOMMU_DEVICE(dev), errp);
>      } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_PMEM_PCI) ||
>                 object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MEM_PCI)) {
>          pc_virtio_md_pci_pre_plug(hotplug_dev, dev, errp);
> @@ -1383,6 +1386,7 @@ static HotplugHandler *pc_get_hotplug_handler(MachineState *machine,
>  {
>      if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM) ||
>          object_dynamic_cast(OBJECT(dev), TYPE_CPU) ||
> +        object_dynamic_cast(OBJECT(dev), TYPE_X86_IOMMU_DEVICE) ||
>          object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_PMEM_PCI) ||
>          object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MEM_PCI)) {
>          return HOTPLUG_HANDLER(machine);
> diff --git a/hw/i386/x86-iommu.c b/hw/i386/x86-iommu.c
> index 86ad03972e..c9ee9041a3 100644
> --- a/hw/i386/x86-iommu.c
> +++ b/hw/i386/x86-iommu.c
> @@ -22,6 +22,7 @@
>  #include "hw/i386/x86-iommu.h"
>  #include "hw/qdev-properties.h"
>  #include "hw/i386/pc.h"
> +#include "hw/vfio/pci.h"
>  #include "qapi/error.h"
>  #include "qemu/error-report.h"
>  #include "trace.h"
> @@ -103,6 +104,19 @@ IommuType x86_iommu_get_type(void)
>      return x86_iommu_default->type;
>  }
>  
> +void x86_iommu_pre_plug(X86IOMMUState *iommu, Error **errp)
> +{
> +    bool ambiguous = false;
> +    Object *object;
> +
> +    object = object_resolve_path_type("", TYPE_VFIO_PCI, &ambiguous);
> +    if (object || ambiguous) {
> +        /* There're one or more vfio-pci devices detected */
> +        error_setg(errp, "Please specify all the vfio-pci devices to be after "
> +                   "the vIOMMU device");
> +    }
> +}
> +
>  static void x86_iommu_realize(DeviceState *dev, Error **errp)
>  {
>      X86IOMMUState *x86_iommu = X86_IOMMU_DEVICE(dev);
> diff --git a/include/hw/i386/x86-iommu.h b/include/hw/i386/x86-iommu.h
> index 9de92d33a1..e8b6c293e0 100644
> --- a/include/hw/i386/x86-iommu.h
> +++ b/include/hw/i386/x86-iommu.h
> @@ -172,4 +172,12 @@ void x86_iommu_iec_notify_all(X86IOMMUState *iommu, bool global,
>   * @out: Output MSI message
>   */
>  void x86_iommu_irq_to_msi_message(X86IOMMUIrq *irq, MSIMessage *out);
> +
> +/**
> + * x86_iommu_pre_plug: called before plugging the iommu device
> + * @X86IOMMUState: the pointer to x86 iommu state
> + * @errp: the double pointer to Error, set if we want to fail the plug
> + */

I'd drop that documentation because it's essentially just how any other
pre_plug handlers works. But maybe it's just me that knows how the whole
hotplug machinery works, so ...

> +void x86_iommu_pre_plug(X86IOMMUState *iommu, Error **errp);
> +
>  #endif
> 


-- 
Thanks,

David / dhildenb


