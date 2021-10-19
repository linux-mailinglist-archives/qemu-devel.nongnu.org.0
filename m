Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80DF2432EAA
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 08:53:49 +0200 (CEST)
Received: from localhost ([::1]:48410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcj0O-00045w-If
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 02:53:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mcimi-0004XM-0k
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 02:39:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mcimg-0004ok-3e
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 02:39:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634625577;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fpbmYJmFzRBE8608nv1xvrDVaBUdyZL5J/A55KRAdK4=;
 b=CMyDy4Di2abk43i1fYHkrBRbGKQk624MgRvoGuTyxuq2e1QIMjZPcP5j0ZLqaRy6CN6iHf
 OXGcS042blc/nDE4vtdjmZpaokIlTCE1LtgbO9B7PSlSSIbFCr4kM3rtirVT0T7MQp666H
 bOsMaAMHmL5DioBCBUK5bg7hVr71HmM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-328-c0XPbSk5NduPE4lkqJmAlA-1; Tue, 19 Oct 2021 02:39:36 -0400
X-MC-Unique: c0XPbSk5NduPE4lkqJmAlA-1
Received: by mail-wr1-f70.google.com with SMTP id
 75-20020adf82d1000000b00160cbb0f800so9728178wrc.22
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 23:39:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fpbmYJmFzRBE8608nv1xvrDVaBUdyZL5J/A55KRAdK4=;
 b=eoogPAEesWBI+SCxjcQja7IyCZMwtxjKfJsnFIWjvN5csrvRyNzoHYgG0Je0kBLawj
 um0SLO3Bz8LdvVzLWYrona4/Kd0HmLam7Te33Sg+hN3hZh+yaCX8DhxolFhP4pI7SgLC
 GoEx6d5y0yn2zy7r6KUhByDcHZUOt5Rz7/PW5BSxPML6qP5/5qgVIR1s4C3urbmSOXtB
 w8Wvs7uz/SW3of3ciJwkzDhjK096ppnDwOodAGgwtey5nYhrLkDdTUK0Ixe8OIKiMZAo
 mMLnvn4RimbMkBmtfLxy1gsXDnuN1gm70QdbLsKbbQuREhcm8LfZIrT60i189n9DaHdX
 CB5g==
X-Gm-Message-State: AOAM532nPtViC8b3nd1eYqvvx8CWGb4WRtzHOHyou6OZ+oVoXqB8vtjL
 Q0m8Dec+LNLwQgXFdlfNgh6xAuaRTT3PjWm2lZ2qZ79vc7KT+srmZUiwpcZmx6fOntPWyYRO1x/
 a2HlkJ5isYZMGAlo=
X-Received: by 2002:a1c:3b44:: with SMTP id i65mr4025261wma.161.1634625574929; 
 Mon, 18 Oct 2021 23:39:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzGam/bTtOzzkt6izSIg8OeY9geAVD4Nu5SQSYeSE58BLm9PGvmMNoFPnnq9Q29jhU2Ekge9g==
X-Received: by 2002:a1c:3b44:: with SMTP id i65mr4025245wma.161.1634625574735; 
 Mon, 18 Oct 2021 23:39:34 -0700 (PDT)
Received: from redhat.com ([2.55.24.172])
 by smtp.gmail.com with ESMTPSA id o6sm1712414wms.3.2021.10.18.23.39.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 23:39:32 -0700 (PDT)
Date: Tue, 19 Oct 2021 02:39:29 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Cindy Lu <lulu@redhat.com>
Subject: Re: [PATCH v9 10/10] virtio-pci: add support for configure interrupt
Message-ID: <20211019023844-mutt-send-email-mst@kernel.org>
References: <20210930023348.17770-1-lulu@redhat.com>
 <20210930023348.17770-11-lulu@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210930023348.17770-11-lulu@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
Cc: jasowang@redhat.com, dgilbert@redhat.com, qemu-devel@nongnu.org,
 arei.gonglei@huawei.com, kraxel@redhat.com, stefanha@redhat.com,
 marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 30, 2021 at 10:33:48AM +0800, Cindy Lu wrote:
> Add support for configure interrupt, The process is used kvm_irqfd_assign
> to set the gsi to kernel. When the configure notifier was signal by
> host, qemu will inject a msix interrupt to guest
> 
> Signed-off-by: Cindy Lu <lulu@redhat.com>

This one makes make check hang on my machine.

Just make, then:
QTEST_QEMU_STORAGE_DAEMON_BINARY=./build/storage-daemon/qemu-storage-daemon \
QTEST_QEMU_BINARY=build/x86_64-softmmu/qemu-system-x86_64 \
./build/tests/qtest/qos-test

and observe it hang.


> ---
>  hw/virtio/virtio-pci.c | 88 +++++++++++++++++++++++++++++++++---------
>  hw/virtio/virtio-pci.h |  4 +-
>  2 files changed, 72 insertions(+), 20 deletions(-)
> 
> diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
> index d0a2c2fb81..50179c2ba1 100644
> --- a/hw/virtio/virtio-pci.c
> +++ b/hw/virtio/virtio-pci.c
> @@ -728,7 +728,8 @@ static int virtio_pci_get_notifier(VirtIOPCIProxy *proxy, int queue_no,
>      VirtQueue *vq;
>  
>      if (queue_no == VIRTIO_CONFIG_IRQ_IDX) {
> -        return -1;
> +        *n = virtio_config_get_guest_notifier(vdev);
> +        *vector = vdev->config_vector;
>      } else {
>          if (!virtio_queue_get_num(vdev, queue_no)) {
>              return -1;
> @@ -806,6 +807,10 @@ static int kvm_virtio_pci_vector_use(VirtIOPCIProxy *proxy, int nvqs)
>      return ret;
>  }
>  
> +static int kvm_virtio_pci_vector_config_use(VirtIOPCIProxy *proxy)
> +{
> +    return kvm_virtio_pci_vector_use_one(proxy, VIRTIO_CONFIG_IRQ_IDX);
> +}
>  
>  static void kvm_virtio_pci_vector_release_one(VirtIOPCIProxy *proxy,
>                                                int queue_no)
> @@ -829,6 +834,7 @@ static void kvm_virtio_pci_vector_release_one(VirtIOPCIProxy *proxy,
>      }
>      kvm_virtio_pci_vq_vector_release(proxy, vector);
>  }
> +
>  static void kvm_virtio_pci_vector_release(VirtIOPCIProxy *proxy, int nvqs)
>  {
>      int queue_no;
> @@ -842,6 +848,11 @@ static void kvm_virtio_pci_vector_release(VirtIOPCIProxy *proxy, int nvqs)
>      }
>  }
>  
> +static void kvm_virtio_pci_vector_config_release(VirtIOPCIProxy *proxy)
> +{
> +    kvm_virtio_pci_vector_release_one(proxy, VIRTIO_CONFIG_IRQ_IDX);
> +}
> +
>  static int virtio_pci_one_vector_unmask(VirtIOPCIProxy *proxy,
>                                         unsigned int queue_no,
>                                         unsigned int vector,
> @@ -923,9 +934,17 @@ static int virtio_pci_vector_unmask(PCIDevice *dev, unsigned vector,
>          }
>          vq = virtio_vector_next_queue(vq);
>      }
> -
> +    /* unmask config intr */
> +    n = virtio_config_get_guest_notifier(vdev);
> +    ret = virtio_pci_one_vector_unmask(proxy, VIRTIO_CONFIG_IRQ_IDX, vector,
> +                                       msg, n);
> +    if (ret < 0) {
> +        goto undo_config;
> +    }
>      return 0;
> -
> +undo_config:
> +    n = virtio_config_get_guest_notifier(vdev);
> +    virtio_pci_one_vector_mask(proxy, VIRTIO_CONFIG_IRQ_IDX, vector, n);
>  undo:
>      vq = virtio_vector_first_queue(vdev, vector);
>      while (vq && unmasked >= 0) {
> @@ -959,6 +978,8 @@ static void virtio_pci_vector_mask(PCIDevice *dev, unsigned vector)
>          }
>          vq = virtio_vector_next_queue(vq);
>      }
> +    n = virtio_config_get_guest_notifier(vdev);
> +    virtio_pci_one_vector_mask(proxy, VIRTIO_CONFIG_IRQ_IDX, vector, n);
>  }
>  
>  static void virtio_pci_vector_poll(PCIDevice *dev,
> @@ -971,19 +992,17 @@ static void virtio_pci_vector_poll(PCIDevice *dev,
>      int queue_no;
>      unsigned int vector;
>      EventNotifier *notifier;
> -    VirtQueue *vq;
> -
> -    for (queue_no = 0; queue_no < proxy->nvqs_with_notifiers; queue_no++) {
> -        if (!virtio_queue_get_num(vdev, queue_no)) {
> +    int ret;
> +    for (queue_no = VIRTIO_CONFIG_IRQ_IDX;
> +         queue_no < proxy->nvqs_with_notifiers; queue_no++) {
> +        ret = virtio_pci_get_notifier(proxy, queue_no, &notifier, &vector);
> +        if (ret < 0) {
>              break;
>          }
> -        vector = virtio_queue_vector(vdev, queue_no);
>          if (vector < vector_start || vector >= vector_end ||
>              !msix_is_masked(dev, vector)) {
>              continue;
>          }
> -        vq = virtio_get_queue(vdev, queue_no);
> -        notifier = virtio_queue_get_guest_notifier(vq);
>          if (k->guest_notifier_pending) {
>              if (k->guest_notifier_pending(vdev, queue_no)) {
>                  msix_set_pending(dev, vector);
> @@ -994,23 +1013,42 @@ static void virtio_pci_vector_poll(PCIDevice *dev,
>      }
>  }
>  
> +void virtio_pci_set_guest_notifier_fd_handler(VirtIODevice *vdev, VirtQueue *vq,
> +                                              int n, bool assign,
> +                                              bool with_irqfd)
> +{
> +    if (n == VIRTIO_CONFIG_IRQ_IDX) {
> +        virtio_config_set_guest_notifier_fd_handler(vdev, assign, with_irqfd);
> +    } else {
> +        virtio_queue_set_guest_notifier_fd_handler(vq, assign, with_irqfd);
> +    }
> +}
> +
>  static int virtio_pci_set_guest_notifier(DeviceState *d, int n, bool assign,
>                                           bool with_irqfd)
>  {
>      VirtIOPCIProxy *proxy = to_virtio_pci_proxy(d);
>      VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
>      VirtioDeviceClass *vdc = VIRTIO_DEVICE_GET_CLASS(vdev);
> -    VirtQueue *vq = virtio_get_queue(vdev, n);
> -    EventNotifier *notifier = virtio_queue_get_guest_notifier(vq);
> +    VirtQueue *vq = NULL;
> +    EventNotifier *notifier = NULL;
> +
> +    if (n == VIRTIO_CONFIG_IRQ_IDX) {
> +        notifier = virtio_config_get_guest_notifier(vdev);
> +    } else {
> +        vq = virtio_get_queue(vdev, n);
> +        notifier = virtio_queue_get_guest_notifier(vq);
> +    }
>  
>      if (assign) {
>          int r = event_notifier_init(notifier, 0);
>          if (r < 0) {
>              return r;
>          }
> -        virtio_queue_set_guest_notifier_fd_handler(vq, true, with_irqfd);
> +        virtio_pci_set_guest_notifier_fd_handler(vdev, vq, n, true, with_irqfd);
>      } else {
> -        virtio_queue_set_guest_notifier_fd_handler(vq, false, with_irqfd);
> +        virtio_pci_set_guest_notifier_fd_handler(vdev, vq, n, false,
> +                                                 with_irqfd);
>          event_notifier_cleanup(notifier);
>      }
>  
> @@ -1052,6 +1090,7 @@ static int virtio_pci_set_guest_notifiers(DeviceState *d, int nvqs, bool assign)
>          msix_unset_vector_notifiers(&proxy->pci_dev);
>          if (proxy->vector_irqfd) {
>              kvm_virtio_pci_vector_release(proxy, nvqs);
> +            kvm_virtio_pci_vector_config_release(proxy);
>              g_free(proxy->vector_irqfd);
>              proxy->vector_irqfd = NULL;
>          }
> @@ -1067,7 +1106,11 @@ static int virtio_pci_set_guest_notifiers(DeviceState *d, int nvqs, bool assign)
>              goto assign_error;
>          }
>      }
> -
> +    r = virtio_pci_set_guest_notifier(d, VIRTIO_CONFIG_IRQ_IDX, assign,
> +                                      with_irqfd);
> +    if (r < 0) {
> +        goto config_assign_error;
> +    }
>      /* Must set vector notifier after guest notifier has been assigned */
>      if ((with_irqfd || k->guest_notifier_mask) && assign) {
>          if (with_irqfd) {
> @@ -1076,11 +1119,14 @@ static int virtio_pci_set_guest_notifiers(DeviceState *d, int nvqs, bool assign)
>                            msix_nr_vectors_allocated(&proxy->pci_dev));
>              r = kvm_virtio_pci_vector_use(proxy, nvqs);
>              if (r < 0) {
> -                goto assign_error;
> +                goto config_assign_error;
>              }
>          }
> -        r = msix_set_vector_notifiers(&proxy->pci_dev,
> -                                      virtio_pci_vector_unmask,
> +        r = kvm_virtio_pci_vector_config_use(proxy);
> +        if (r < 0) {
> +            goto config_error;
> +        }
> +        r = msix_set_vector_notifiers(&proxy->pci_dev, virtio_pci_vector_unmask,
>                                        virtio_pci_vector_mask,
>                                        virtio_pci_vector_poll);
>          if (r < 0) {
> @@ -1095,7 +1141,11 @@ notifiers_error:
>          assert(assign);
>          kvm_virtio_pci_vector_release(proxy, nvqs);
>      }
> -
> +config_error:
> +    kvm_virtio_pci_vector_config_release(proxy);
> +config_assign_error:
> +    virtio_pci_set_guest_notifier(d, VIRTIO_CONFIG_IRQ_IDX, !assign,
> +                                  with_irqfd);
>  assign_error:
>      /* We get here on assignment failure. Recover by undoing for VQs 0 .. n. */
>      assert(assign);
> diff --git a/hw/virtio/virtio-pci.h b/hw/virtio/virtio-pci.h
> index 2446dcd9ae..b704acc5a8 100644
> --- a/hw/virtio/virtio-pci.h
> +++ b/hw/virtio/virtio-pci.h
> @@ -251,5 +251,7 @@ void virtio_pci_types_register(const VirtioPCIDeviceTypeInfo *t);
>   * @fixed_queues.
>   */
>  unsigned virtio_pci_optimal_num_queues(unsigned fixed_queues);
> -
> +void virtio_pci_set_guest_notifier_fd_handler(VirtIODevice *vdev, VirtQueue *vq,
> +                                              int n, bool assign,
> +                                              bool with_irqfd);
>  #endif
> -- 
> 2.21.3


