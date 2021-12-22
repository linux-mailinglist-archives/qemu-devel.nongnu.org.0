Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 560E947D983
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 00:09:28 +0100 (CET)
Received: from localhost ([::1]:48076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0Aje-0005ti-UQ
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 18:09:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n0AiJ-00058m-Pi
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 18:08:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n0AiF-0003tJ-9U
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 18:08:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640214476;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VL5bSZPwtddRIRLiNiDNMHPhSIYjXwrKI30KwVEUAlc=;
 b=N9IjtNq0HGxNl042NXfdynY0YJVgKkbRFiLY/5Xkp+my+5bxG69sxHHfDGjavIlXfCU+6D
 9vMDZwHvr4RArnhh034pqQlvVLqhsvTJHGPjDylMk1VNWJs9tQTa55EOBdhUwPNXV72fpH
 p4QLkkduNGxsYKu3dZ7u1jGnJG1MlGE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-538-ysYzit9SPhykY2dGVMbl8A-1; Wed, 22 Dec 2021 18:07:55 -0500
X-MC-Unique: ysYzit9SPhykY2dGVMbl8A-1
Received: by mail-wm1-f69.google.com with SMTP id
 v190-20020a1cacc7000000b003456d598510so3709919wme.6
 for <qemu-devel@nongnu.org>; Wed, 22 Dec 2021 15:07:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=VL5bSZPwtddRIRLiNiDNMHPhSIYjXwrKI30KwVEUAlc=;
 b=CCLXf+d1YMovjPUJIMh6TAJZP4oo9TBljkQQRqEmdKWHTUSF13u40Xea52RNkH7Dz9
 th9vyKxJKyhwI8GCSMwVeUQWpeIjaw90Th5omxTlEmMfHzqbSG160J1PrrQOjBequ2Xe
 b3WufMzRynA5tCQDHuanytvjXXHSeYMo9ALrpw5fSce/tPxs4rd/UbAf51fWUSwVZMOW
 5VfOwVx4CE7hTSURHn61cVpjyDgms+qH6hHY0ZyAxhU4KDTZNVl6kWZ/MT3bzzL40VZm
 2A+ZeALGvJZOxHc7eCDcCFeGjupPZ40HjJvdou7b5huQZz/VwlYrSra3wmfdMMZS1p4i
 GFBQ==
X-Gm-Message-State: AOAM531e+p5XY3YOUHDxtvwJG5z8driaRal79siW6XFgeKT14anwCpU8
 GgMXQ7O0D1ua6v+eK2tY5MKJxjGtBlKoGVYg0TYw1U4ypP4VKd0DgHxau2/oYTxz97xuRBFh5ri
 5PpFc/lOvod1P0Jk=
X-Received: by 2002:a05:600c:4e4a:: with SMTP id e10mr5628wmq.15.1640214474133; 
 Wed, 22 Dec 2021 15:07:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwb7/IgrRl/qU056JkkI2BlArDu2G+mCkkqgYyVF/rEZDKbsQQFuJ3qffqP5khsySsxCKGfrw==
X-Received: by 2002:a05:600c:4e4a:: with SMTP id e10mr5611wmq.15.1640214473822; 
 Wed, 22 Dec 2021 15:07:53 -0800 (PST)
Received: from redhat.com ([2.55.1.37])
 by smtp.gmail.com with ESMTPSA id f16sm7924295wmg.27.2021.12.22.15.07.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 15:07:53 -0800 (PST)
Date: Wed, 22 Dec 2021 18:07:48 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Steve Sistare <steven.sistare@oracle.com>
Subject: Re: [PATCH V7 17/29] pci: export functions for cpr
Message-ID: <20211222180611-mutt-send-email-mst@kernel.org>
References: <1640199934-455149-1-git-send-email-steven.sistare@oracle.com>
 <1640199934-455149-18-git-send-email-steven.sistare@oracle.com>
MIME-Version: 1.0
In-Reply-To: <1640199934-455149-18-git-send-email-steven.sistare@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Eric Blake <eblake@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Zheng Chuan <zhengchuan@huawei.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Dec 22, 2021 at 11:05:22AM -0800, Steve Sistare wrote:
> Export msix_is_pending, msix_init_vector_notifiers, and pci_update_mappings
> for use by cpr.  No functional change.
> 
> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>

With things like that, I prefer when the API is exported
together with the patch that uses it.
This was I can see why we are exporting these APIs.
Esp wrt pci_update_mappings, it's designed as an
internal API.

> ---
>  hw/pci/msix.c         | 20 ++++++++++++++------
>  hw/pci/pci.c          |  3 +--
>  include/hw/pci/msix.h |  5 +++++
>  include/hw/pci/pci.h  |  1 +
>  4 files changed, 21 insertions(+), 8 deletions(-)
> 
> diff --git a/hw/pci/msix.c b/hw/pci/msix.c
> index ae9331c..73f4259 100644
> --- a/hw/pci/msix.c
> +++ b/hw/pci/msix.c
> @@ -64,7 +64,7 @@ static uint8_t *msix_pending_byte(PCIDevice *dev, int vector)
>      return dev->msix_pba + vector / 8;
>  }
>  
> -static int msix_is_pending(PCIDevice *dev, int vector)
> +int msix_is_pending(PCIDevice *dev, unsigned int vector)
>  {
>      return *msix_pending_byte(dev, vector) & msix_pending_mask(vector);
>  }
> @@ -579,6 +579,17 @@ static void msix_unset_notifier_for_vector(PCIDevice *dev, unsigned int vector)
>      dev->msix_vector_release_notifier(dev, vector);
>  }
>  
> +void msix_init_vector_notifiers(PCIDevice *dev,
> +                                MSIVectorUseNotifier use_notifier,
> +                                MSIVectorReleaseNotifier release_notifier,
> +                                MSIVectorPollNotifier poll_notifier)
> +{
> +    assert(use_notifier && release_notifier);
> +    dev->msix_vector_use_notifier = use_notifier;
> +    dev->msix_vector_release_notifier = release_notifier;
> +    dev->msix_vector_poll_notifier = poll_notifier;
> +}
> +
>  int msix_set_vector_notifiers(PCIDevice *dev,
>                                MSIVectorUseNotifier use_notifier,
>                                MSIVectorReleaseNotifier release_notifier,
> @@ -586,11 +597,8 @@ int msix_set_vector_notifiers(PCIDevice *dev,
>  {
>      int vector, ret;
>  
> -    assert(use_notifier && release_notifier);
> -
> -    dev->msix_vector_use_notifier = use_notifier;
> -    dev->msix_vector_release_notifier = release_notifier;
> -    dev->msix_vector_poll_notifier = poll_notifier;
> +    msix_init_vector_notifiers(dev, use_notifier, release_notifier,
> +                               poll_notifier);
>  
>      if ((dev->config[dev->msix_cap + MSIX_CONTROL_OFFSET] &
>          (MSIX_ENABLE_MASK | MSIX_MASKALL_MASK)) == MSIX_ENABLE_MASK) {
> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> index e5993c1..0fd21e1 100644
> --- a/hw/pci/pci.c
> +++ b/hw/pci/pci.c
> @@ -225,7 +225,6 @@ static const TypeInfo pcie_bus_info = {
>  };
>  
>  static PCIBus *pci_find_bus_nr(PCIBus *bus, int bus_num);
> -static void pci_update_mappings(PCIDevice *d);
>  static void pci_irq_handler(void *opaque, int irq_num, int level);
>  static void pci_add_option_rom(PCIDevice *pdev, bool is_default_rom, Error **);
>  static void pci_del_option_rom(PCIDevice *pdev);
> @@ -1366,7 +1365,7 @@ static pcibus_t pci_bar_address(PCIDevice *d,
>      return new_addr;
>  }
>  
> -static void pci_update_mappings(PCIDevice *d)
> +void pci_update_mappings(PCIDevice *d)
>  {
>      PCIIORegion *r;
>      int i;
> diff --git a/include/hw/pci/msix.h b/include/hw/pci/msix.h
> index 4c4a60c..46606cf 100644
> --- a/include/hw/pci/msix.h
> +++ b/include/hw/pci/msix.h
> @@ -32,6 +32,7 @@ int msix_present(PCIDevice *dev);
>  bool msix_is_masked(PCIDevice *dev, unsigned vector);
>  void msix_set_pending(PCIDevice *dev, unsigned vector);
>  void msix_clr_pending(PCIDevice *dev, int vector);
> +int msix_is_pending(PCIDevice *dev, unsigned vector);
>  
>  int msix_vector_use(PCIDevice *dev, unsigned vector);
>  void msix_vector_unuse(PCIDevice *dev, unsigned vector);
> @@ -41,6 +42,10 @@ void msix_notify(PCIDevice *dev, unsigned vector);
>  
>  void msix_reset(PCIDevice *dev);
>  
> +void msix_init_vector_notifiers(PCIDevice *dev,
> +                                MSIVectorUseNotifier use_notifier,
> +                                MSIVectorReleaseNotifier release_notifier,
> +                                MSIVectorPollNotifier poll_notifier);
>  int msix_set_vector_notifiers(PCIDevice *dev,
>                                MSIVectorUseNotifier use_notifier,
>                                MSIVectorReleaseNotifier release_notifier,
> diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> index e7cdf2d..cc63dd4 100644
> --- a/include/hw/pci/pci.h
> +++ b/include/hw/pci/pci.h
> @@ -910,5 +910,6 @@ extern const VMStateDescription vmstate_pci_device;
>  
>  MSIMessage pci_get_msi_message(PCIDevice *dev, int vector);
>  void pci_set_power(PCIDevice *pci_dev, bool state);
> +void pci_update_mappings(PCIDevice *d);
>  
>  #endif
> -- 
> 1.8.3.1


