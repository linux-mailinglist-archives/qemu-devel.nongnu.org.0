Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 035F943E469
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 16:58:14 +0200 (CEST)
Received: from localhost ([::1]:46522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mg6r6-0000U4-SF
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 10:58:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1mg6lv-0003qJ-9Z
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 10:52:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22611)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1mg6ls-0004BM-AL
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 10:52:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635432767;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XGq7bgPx6RZfq8HZXTDPSdFaVddiJ7QNS5TaXlXuAM4=;
 b=bu1aLCjkXHv2cj5bwyAILqDGfTz9qkvFFI6R6/MoGMzoYBNF8d72YfzMdHrMEuXEMUX6uG
 3SampLPB6J1OM7V8f9/KxEp2fu87bX8F+gyLzxK7l84ZnZitGB0vTycqJqE8KsO17p0xwQ
 QhniRSmXjNAzYM2BVJou4eYtMLwWn/k=
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-288-gW_iWO5BOsWTPiN1TsEWxg-1; Thu, 28 Oct 2021 10:52:46 -0400
X-MC-Unique: gW_iWO5BOsWTPiN1TsEWxg-1
Received: by mail-oo1-f70.google.com with SMTP id
 g11-20020a4a924b000000b002b76277c71bso2775778ooh.22
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 07:52:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XGq7bgPx6RZfq8HZXTDPSdFaVddiJ7QNS5TaXlXuAM4=;
 b=GvESoaDtRvPQbi0acN9WjXkODn6Eovj+5YJyW3lwsu9x14tSoQSVbpvo0NJaldDtIH
 LaNc8HYpdYL4b5QzOkZz8DB5X72+uJX34oXAsYlTmg7l/DO7I1UF0pXaUKrCF9AqPC+Q
 p4Dg1Y76gC9HHb8mEo/gV7VsWJBtQDOB1d13w3i4pMMZ7JM11clvO8uL8p4lAmk0G+GC
 zDGWs5fQOGAyPTBNJ5rrFBS1z6DZzFBKKolehx/OsQJ3nDpMx94hoxVb3ZQ8IF2cp62M
 8mLI+mnXWMfNfX67AzSZYvi3YDWa8n6tP1HCo7exyFxVqwVw6x90HfJDrQbb5qspywWT
 zMCw==
X-Gm-Message-State: AOAM532eWRLc4jIVKxOr3ce73UO6amwDapE0XBfkWTrjU4jfQi22Yrse
 R5Y64eXx3rX8DCJICy34/LsTd1iI2f8U6HpcXnzk/QHP5+vzP8q4CnpgUtn1YX/FXx1/6FWKIwM
 iEf3bS3iI4kHgVRY=
X-Received: by 2002:a9d:ea9:: with SMTP id 38mr3845715otj.144.1635432765418;
 Thu, 28 Oct 2021 07:52:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxA1ha8tdH29GPjd7XUykHk7m56laQQ8xadsdoGKHUzKLDtqkH7jLikNZH8rVUZHeR63QHzZg==
X-Received: by 2002:a9d:ea9:: with SMTP id 38mr3845648otj.144.1635432764795;
 Thu, 28 Oct 2021 07:52:44 -0700 (PDT)
Received: from redhat.com ([38.15.36.239])
 by smtp.gmail.com with ESMTPSA id l5sm378362otq.64.2021.10.28.07.52.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 07:52:44 -0700 (PDT)
Date: Thu, 28 Oct 2021 08:52:42 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v2 5/5] pc/q35: Add pre-plug hook for x86-iommu
Message-ID: <20211028085242.770a9dde.alex.williamson@redhat.com>
In-Reply-To: <20211028043129.38871-6-peterx@redhat.com>
References: <20211028043129.38871-1-peterx@redhat.com>
 <20211028043129.38871-6-peterx@redhat.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Eduardo Habkost <ehabkost@redhat.com>, David Hildenbrand <david@redhat.com>,
 Jason Wang <jasowang@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Eric Auger <eric.auger@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 28 Oct 2021 12:31:29 +0800
Peter Xu <peterx@redhat.com> wrote:

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

I still really don't buy the argument that vfio-pci is the only driver
that does "this thing", therefore we can just look for vfio-pci devices
by name rather than try to generically detect devices that have this
dependency.  That seems short sighted.

I've already suggested that pci-core could record on the PCIDevice
structure if the device address space has been accessed.  We could also
do something like create a TYPE_PCI_AS_DEVICE class derived from
TYPE_PCI_DEVICE and any PCI drivers that make use of the device address
space before machine-init-done would be of this class.  That could even
be enforced by pci_device_iommu_address_space() and would allow the
same sort of object resolution as used here.  Thanks,

Alex

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
> +void x86_iommu_pre_plug(X86IOMMUState *iommu, Error **errp);
> +
>  #endif


