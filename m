Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB71438996B
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 00:41:57 +0200 (CEST)
Received: from localhost ([::1]:34580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljUt2-00018M-QU
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 18:41:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1ljUqR-0007bk-Ar
 for qemu-devel@nongnu.org; Wed, 19 May 2021 18:39:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1ljUqO-00058u-5x
 for qemu-devel@nongnu.org; Wed, 19 May 2021 18:39:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621463950;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GAafUN6YfIpBF+cE7Hhtlz4Inl3/zmgqur+Gf87+wbU=;
 b=WrI82KMqF0xfow84mjPgSqItQCOCR6pxTSfHoZqo0qVALPT11aFig/bfQHuDZBFNAMUg4w
 cV7Htkhe3fY5+ES7Q4q+tjJc1JvKgzJsBgl1ETUlPsPjVwYzR0ihWjUMvcBiKY36m9c+Yg
 YlED61IHiBXF7zhOA6JzcZnNtZhO718=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-501-7wiUIzYWNO2_uZ1F4D6zGA-1; Wed, 19 May 2021 18:39:08 -0400
X-MC-Unique: 7wiUIzYWNO2_uZ1F4D6zGA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6642B801B13;
 Wed, 19 May 2021 22:39:07 +0000 (UTC)
Received: from redhat.com (ovpn-113-225.phx2.redhat.com [10.3.113.225])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9CFDB1B480;
 Wed, 19 May 2021 22:38:52 +0000 (UTC)
Date: Wed, 19 May 2021 16:38:52 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Steve Sistare <steven.sistare@oracle.com>
Subject: Re: [PATCH V3 11/22] vfio-pci: refactor for cpr
Message-ID: <20210519163852.016aa9dc.alex.williamson@redhat.com>
In-Reply-To: <1620390320-301716-12-git-send-email-steven.sistare@oracle.com>
References: <1620390320-301716-1-git-send-email-steven.sistare@oracle.com>
 <1620390320-301716-12-git-send-email-steven.sistare@oracle.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 Alex =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri,  7 May 2021 05:25:09 -0700
Steve Sistare <steven.sistare@oracle.com> wrote:

> Export vfio_address_spaces and vfio_listener_skipped_section.
> Add optional eventfd arg to vfio_add_kvm_msi_virq.
> Refactor vector use into a helper vfio_vector_init.
> All for use by cpr in a subsequent patch.  No functional change.
> 
> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
> ---
>  hw/vfio/common.c              |  4 ++--
>  hw/vfio/pci.c                 | 36 +++++++++++++++++++++++++-----------
>  include/hw/vfio/vfio-common.h |  3 +++
>  3 files changed, 30 insertions(+), 13 deletions(-)
> 
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index ae5654f..9220e64 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -42,7 +42,7 @@
>  
>  VFIOGroupList vfio_group_list =
>      QLIST_HEAD_INITIALIZER(vfio_group_list);
> -static QLIST_HEAD(, VFIOAddressSpace) vfio_address_spaces =
> +VFIOAddressSpaceList vfio_address_spaces =
>      QLIST_HEAD_INITIALIZER(vfio_address_spaces);
>  
>  #ifdef CONFIG_KVM
> @@ -534,7 +534,7 @@ static int vfio_host_win_del(VFIOContainer *container, hwaddr min_iova,
>      return -1;
>  }
>  
> -static bool vfio_listener_skipped_section(MemoryRegionSection *section)
> +bool vfio_listener_skipped_section(MemoryRegionSection *section)
>  {
>      return (!memory_region_is_ram(section->mr) &&
>              !memory_region_is_iommu(section->mr)) ||
> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> index 5c65aa0..7a4fb6c 100644
> --- a/hw/vfio/pci.c
> +++ b/hw/vfio/pci.c
> @@ -411,7 +411,7 @@ static int vfio_enable_vectors(VFIOPCIDevice *vdev, bool msix)
>  }
>  
>  static void vfio_add_kvm_msi_virq(VFIOPCIDevice *vdev, VFIOMSIVector *vector,
> -                                  int vector_n, bool msix)
> +                                  int vector_n, bool msix, int eventfd)
>  {
>      int virq;
>  
> @@ -419,7 +419,9 @@ static void vfio_add_kvm_msi_virq(VFIOPCIDevice *vdev, VFIOMSIVector *vector,
>          return;
>      }
>  
> -    if (event_notifier_init(&vector->kvm_interrupt, 0)) {
> +    if (eventfd >= 0) {
> +        event_notifier_init_fd(&vector->kvm_interrupt, eventfd);
> +    } else if (event_notifier_init(&vector->kvm_interrupt, 0)) {
>          return;
>      }

This seems very obfuscated.  The "active" arg of event_notifier_init()
just seems to preload the eventfd with a signal.  What does that have
to do with an eventfd arg to this function?  What if the first branch
returns failure?

>  
> @@ -455,6 +457,22 @@ static void vfio_update_kvm_msi_virq(VFIOMSIVector *vector, MSIMessage msg,
>      kvm_irqchip_commit_routes(kvm_state);
>  }
>  
> +static void vfio_vector_init(VFIOPCIDevice *vdev, int nr, int eventfd)
> +{
> +    VFIOMSIVector *vector = &vdev->msi_vectors[nr];
> +    PCIDevice *pdev = &vdev->pdev;
> +
> +    vector->vdev = vdev;
> +    vector->virq = -1;
> +    if (eventfd >= 0) {
> +        event_notifier_init_fd(&vector->interrupt, eventfd);
> +    } else if (event_notifier_init(&vector->interrupt, 0)) {
> +        error_report("vfio: Error: event_notifier_init failed");
> +    }

Gak, here's that same pattern.

> +    vector->use = true;
> +    msix_vector_use(pdev, nr);
> +}
> +
>  static int vfio_msix_vector_do_use(PCIDevice *pdev, unsigned int nr,
>                                     MSIMessage *msg, IOHandler *handler)
>  {
> @@ -466,14 +484,10 @@ static int vfio_msix_vector_do_use(PCIDevice *pdev, unsigned int nr,
>  
>      vector = &vdev->msi_vectors[nr];
>  
> +    vfio_vector_init(vdev, nr, -1);
> +
>      if (!vector->use) {
> -        vector->vdev = vdev;
> -        vector->virq = -1;
> -        if (event_notifier_init(&vector->interrupt, 0)) {
> -            error_report("vfio: Error: event_notifier_init failed");
> -        }
> -        vector->use = true;
> -        msix_vector_use(pdev, nr);
> +        vfio_vector_init(vdev, nr, -1);
>      }

Huh?  That's not at all "no functional change".  Also the branch is
entirely dead code now.

>  
>      qemu_set_fd_handler(event_notifier_get_fd(&vector->interrupt),
> @@ -491,7 +505,7 @@ static int vfio_msix_vector_do_use(PCIDevice *pdev, unsigned int nr,
>          }
>      } else {
>          if (msg) {
> -            vfio_add_kvm_msi_virq(vdev, vector, nr, true);
> +            vfio_add_kvm_msi_virq(vdev, vector, nr, true, -1);
>          }
>      }
>  
> @@ -641,7 +655,7 @@ retry:
>           * Attempt to enable route through KVM irqchip,
>           * default to userspace handling if unavailable.
>           */
> -        vfio_add_kvm_msi_virq(vdev, vector, i, false);
> +        vfio_add_kvm_msi_virq(vdev, vector, i, false, -1);
>      }

And then we're not really passing an eventfd anyway :-\  I'm so
confused...

Thanks,
Alex

>  
>      /* Set interrupt type prior to possible interrupts */
> diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
> index 6141162..00acb85 100644
> --- a/include/hw/vfio/vfio-common.h
> +++ b/include/hw/vfio/vfio-common.h
> @@ -204,6 +204,8 @@ int vfio_get_device(VFIOGroup *group, const char *name,
>  extern const MemoryRegionOps vfio_region_ops;
>  typedef QLIST_HEAD(VFIOGroupList, VFIOGroup) VFIOGroupList;
>  extern VFIOGroupList vfio_group_list;
> +typedef QLIST_HEAD(, VFIOAddressSpace) VFIOAddressSpaceList;
> +extern VFIOAddressSpaceList vfio_address_spaces;
>  
>  bool vfio_mig_active(void);
>  int64_t vfio_mig_bytes_transferred(void);
> @@ -222,6 +224,7 @@ struct vfio_info_cap_header *
>  vfio_get_device_info_cap(struct vfio_device_info *info, uint16_t id);
>  #endif
>  extern const MemoryListener vfio_prereg_listener;
> +bool vfio_listener_skipped_section(MemoryRegionSection *section);
>  
>  int vfio_spapr_create_window(VFIOContainer *container,
>                               MemoryRegionSection *section,


