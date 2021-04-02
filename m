Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0DD3528D0
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Apr 2021 11:32:52 +0200 (CEST)
Received: from localhost ([::1]:51198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lSGAd-000784-8R
	for lists+qemu-devel@lfdr.de; Fri, 02 Apr 2021 05:32:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lSG9e-0006bs-Mt
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 05:31:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lSG9b-0000Je-U4
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 05:31:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617355907;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CF7uno8ahSNseZ+xUbhmZ4sIsrv1D6S10ya0luAnrgY=;
 b=YtTzCOrFEbsvE7rM6Pte/VgbdwTGfGllqC7+cWR5s2gzKmYtBtCmxiuJx8uJW9YPZvKchx
 0GmZGqmTRcJi+lCwKgoUPs5ruWUW0vOlE6asle3iejoqo5GdGCMNwaTFRJTchBhLEXWhCP
 3TUB/6xcFSeVT7No276jw4derxhvrhs=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-223-4a-gmxqbObi8SXWPwmGaSQ-1; Fri, 02 Apr 2021 05:31:45 -0400
X-MC-Unique: 4a-gmxqbObi8SXWPwmGaSQ-1
Received: by mail-wr1-f69.google.com with SMTP id b6so4100298wrq.22
 for <qemu-devel@nongnu.org>; Fri, 02 Apr 2021 02:31:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=CF7uno8ahSNseZ+xUbhmZ4sIsrv1D6S10ya0luAnrgY=;
 b=JGIJc/D+Sw1f/p4KHCdMKTzk7tt7XXwspBabw998plWzJOA+POBvQA9elRPka6lz4F
 gSu6wJ43dBIFBZo5FDf43ZSnyEQFUxv4RksPZJ6BNrj4Cq+g8p1sQAItKoZUH42zgLO8
 LqzecCEShIVXeMbCFm+TAV+E8Orncn8TFU0Hh6vH3x+7V7vCDfZ+kG+R4t6AhlE+LGci
 /iC3fc0e9qNZLGK+7kOAiaerdF+sOi2Sntf/SWVY6O8qmi9e/KcGIHnDPL56CSwDd8J2
 brZVxe3ZA11TugGX5xoo6qtmfwp8DU7KAyq5xSr41YjnsOlQzkOr1phUq9LuvLGmg0vX
 SX4w==
X-Gm-Message-State: AOAM533bHWWIC9ug9M+gHFgi7MB7JLEmcGrMAaQVHY9p4JYwV/1qIgf/
 lUkaO2xOhoSnUsyOdyDjwapm48tq1rWRhpG7VGP3qhEQ+LBvfZkZMHIJxde8ru8L6N+FBaWHCGE
 OWgW9Ejg3n8G8H4c=
X-Received: by 2002:a1c:7e82:: with SMTP id z124mr12072928wmc.51.1617355904617; 
 Fri, 02 Apr 2021 02:31:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy90Ekjtc42lqCbZZUTIJE0moNRT9286DqFRKMUfCMgUKFkBXC2egPqBdeCdLWGEg67ZI8GFA==
X-Received: by 2002:a1c:7e82:: with SMTP id z124mr12072907wmc.51.1617355904425; 
 Fri, 02 Apr 2021 02:31:44 -0700 (PDT)
Received: from redhat.com (bzq-79-183-252-180.red.bezeqint.net.
 [79.183.252.180])
 by smtp.gmail.com with ESMTPSA id w22sm12373273wmi.22.2021.04.02.02.31.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Apr 2021 02:31:43 -0700 (PDT)
Date: Fri, 2 Apr 2021 05:31:40 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH] virtio-pci: compat page aligned ATS
Message-ID: <20210402053122-mutt-send-email-mst@kernel.org>
References: <20210402075520.65871-1-jasowang@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210402075520.65871-1-jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: ehabkost@redhat.com, qemu-devel@nongnu.org, qemu-stable@nongnu.org,
 Peter Xu <peterx@redhat.com>, "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 02, 2021 at 03:55:20PM +0800, Jason Wang wrote:
> Commit 4c70875372b8 ("pci: advertise a page aligned ATS") advertises
> the page aligned via ATS capability (RO) to unbrek recent Linux IOMMU
> drivers since 5.2. But it forgot the compat the capability which
> breaks the migration from old machine type:
> 
> (qemu) qemu-kvm: get_pci_config_device: Bad config data: i=0x104 read:
> 0 device: 20 cmask: ff wmask: 0 w1cmask:0
> 
> This patch introduces a new parameter "ats_page_aligned" for
> virtio-pci device and turn it on for machine type which is newer than
> 5.1.
> 
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Cc: Peter Xu <peterx@redhat.com>
> Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Cc: qemu-stable@nongnu.org
> Fixes: 4c70875372b8 ("pci: advertise a page aligned ATS")
> Signed-off-by: Jason Wang <jasowang@redhat.com>

I think x-ats-page-aligned would be a better name.


> ---
>  hw/core/machine.c      |  1 +
>  hw/pci/pcie.c          | 10 ++++++----
>  hw/virtio/virtio-pci.c |  5 ++++-
>  hw/virtio/virtio-pci.h |  5 +++++
>  include/hw/pci/pcie.h  |  2 +-
>  5 files changed, 17 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 9935c6ddd5..ad4459b0f2 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -53,6 +53,7 @@ GlobalProperty hw_compat_5_1[] = {
>      { "nvme", "use-intel-id", "on"},
>      { "pvpanic", "events", "1"}, /* PVPANIC_PANICKED */
>      { "pl011", "migrate-clk", "off" },
> +    { "virtio-pci", "ats_page_aligned", "off"},
>  };
>  const size_t hw_compat_5_1_len = G_N_ELEMENTS(hw_compat_5_1);
>  
> diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
> index a733e2fb87..fd0fa157e8 100644
> --- a/hw/pci/pcie.c
> +++ b/hw/pci/pcie.c
> @@ -963,16 +963,18 @@ void pcie_dev_ser_num_init(PCIDevice *dev, uint16_t offset, uint64_t ser_num)
>      pci_set_quad(dev->config + offset + pci_dsn_cap, ser_num);
>  }
>  
> -void pcie_ats_init(PCIDevice *dev, uint16_t offset)
> +void pcie_ats_init(PCIDevice *dev, uint16_t offset, bool aligned)
>  {
>      pcie_add_capability(dev, PCI_EXT_CAP_ID_ATS, 0x1,
>                          offset, PCI_EXT_CAP_ATS_SIZEOF);
>  
>      dev->exp.ats_cap = offset;
>  
> -    /* Invalidate Queue Depth 0, Page Aligned Request 1 */
> -    pci_set_word(dev->config + offset + PCI_ATS_CAP,
> -                 PCI_ATS_CAP_PAGE_ALIGNED);
> +    /* Invalidate Queue Depth 0 */
> +    if (aligned) {
> +        pci_set_word(dev->config + offset + PCI_ATS_CAP,
> +                     PCI_ATS_CAP_PAGE_ALIGNED);
> +    }
>      /* STU 0, Disabled by default */
>      pci_set_word(dev->config + offset + PCI_ATS_CTRL, 0);
>  
> diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
> index 883045a223..ebe9716acf 100644
> --- a/hw/virtio/virtio-pci.c
> +++ b/hw/virtio/virtio-pci.c
> @@ -1848,7 +1848,8 @@ static void virtio_pci_realize(PCIDevice *pci_dev, Error **errp)
>          }
>  
>          if (proxy->flags & VIRTIO_PCI_FLAG_ATS) {
> -            pcie_ats_init(pci_dev, last_pcie_cap_offset);
> +            pcie_ats_init(pci_dev, last_pcie_cap_offset,
> +                          proxy->flags & VIRTIO_PCI_FLAG_ATS_PAGE_ALIGNED);
>              last_pcie_cap_offset += PCI_EXT_CAP_ATS_SIZEOF;
>          }
>  
> @@ -1925,6 +1926,8 @@ static Property virtio_pci_properties[] = {
>                       ignore_backend_features, false),
>      DEFINE_PROP_BIT("ats", VirtIOPCIProxy, flags,
>                      VIRTIO_PCI_FLAG_ATS_BIT, false),
> +    DEFINE_PROP_BIT("ats_page_aligned", VirtIOPCIProxy, flags,
> +                    VIRTIO_PCI_FLAG_ATS_PAGE_ALIGNED_BIT, true),
>      DEFINE_PROP_BIT("x-pcie-deverr-init", VirtIOPCIProxy, flags,
>                      VIRTIO_PCI_FLAG_INIT_DEVERR_BIT, true),
>      DEFINE_PROP_BIT("x-pcie-lnkctl-init", VirtIOPCIProxy, flags,
> diff --git a/hw/virtio/virtio-pci.h b/hw/virtio/virtio-pci.h
> index d7d5d403a9..2446dcd9ae 100644
> --- a/hw/virtio/virtio-pci.h
> +++ b/hw/virtio/virtio-pci.h
> @@ -42,6 +42,7 @@ enum {
>      VIRTIO_PCI_FLAG_INIT_PM_BIT,
>      VIRTIO_PCI_FLAG_INIT_FLR_BIT,
>      VIRTIO_PCI_FLAG_AER_BIT,
> +    VIRTIO_PCI_FLAG_ATS_PAGE_ALIGNED_BIT,
>  };
>  
>  /* Need to activate work-arounds for buggy guests at vmstate load. */
> @@ -84,6 +85,10 @@ enum {
>  /* Advanced Error Reporting capability */
>  #define VIRTIO_PCI_FLAG_AER (1 << VIRTIO_PCI_FLAG_AER_BIT)
>  
> +/* Page Aligned Address space Translation Service */
> +#define VIRTIO_PCI_FLAG_ATS_PAGE_ALIGNED \
> +  (1 << VIRTIO_PCI_FLAG_ATS_PAGE_ALIGNED_BIT)
> +
>  typedef struct {
>      MSIMessage msg;
>      int virq;
> diff --git a/include/hw/pci/pcie.h b/include/hw/pci/pcie.h
> index 14c58ebdb6..6063bee0ec 100644
> --- a/include/hw/pci/pcie.h
> +++ b/include/hw/pci/pcie.h
> @@ -137,7 +137,7 @@ void pcie_acs_reset(PCIDevice *dev);
>  
>  void pcie_ari_init(PCIDevice *dev, uint16_t offset, uint16_t nextfn);
>  void pcie_dev_ser_num_init(PCIDevice *dev, uint16_t offset, uint64_t ser_num);
> -void pcie_ats_init(PCIDevice *dev, uint16_t offset);
> +void pcie_ats_init(PCIDevice *dev, uint16_t offset, bool aligned);
>  
>  void pcie_cap_slot_pre_plug_cb(HotplugHandler *hotplug_dev, DeviceState *dev,
>                                 Error **errp);
> -- 
> 2.24.3 (Apple Git-128)


