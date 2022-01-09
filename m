Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D01B488A5A
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Jan 2022 16:56:33 +0100 (CET)
Received: from localhost ([::1]:36668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6aYZ-0001mP-Q3
	for lists+qemu-devel@lfdr.de; Sun, 09 Jan 2022 10:56:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n6aX5-00015R-Sc
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 10:54:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n6aX2-0003bW-S3
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 10:54:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641743695;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ob+RzuLa1Hz3Q7pHH4T36egUa7T3diP9dylmQT73ZSY=;
 b=ICNefLzHMw9ABsqDQF9vdCgaUwIhYvixTiukPCelyiJavUgfFc12ej3AXF/tqulxpQ32wA
 dyqeU0DMGyxUPfpjisJQ43Mko6z/PB39lksPA3mk4/crPBH9iT0KgJLc+mYXeDI1xozMNp
 gQDOsZrGbZkj7WXLFZhJrOQgH75SEIY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-371-xHkPlBunNh2hgGrHUh2CWQ-1; Sun, 09 Jan 2022 10:54:54 -0500
X-MC-Unique: xHkPlBunNh2hgGrHUh2CWQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 n4-20020adf8b04000000b001a49cff5283so3556721wra.14
 for <qemu-devel@nongnu.org>; Sun, 09 Jan 2022 07:54:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Ob+RzuLa1Hz3Q7pHH4T36egUa7T3diP9dylmQT73ZSY=;
 b=NHiUWuIkx8+L6rEszrAuVJT1fYLugdcASRWP7U3Y4ZEJIXYK3WXPF5tYf8D4Li0mqL
 ZNIyKocYKytVG1nkjYg1I6kufkyu4GreMFFHWPafs6ZEzF0Rl/bmqgyBtJgj2JcL1MU7
 SO6yaNDBJ8VrC639AVk91SFwLXWIl5toqTZECTrE3UeDqPvZDFzSTTd08Fw++pafBOrP
 22BMOgtRffsLzaaSVZDWTcoNW0Cwir4zTupA7XvafhKJk8VVDbolV53ciuVmOQPwaO7o
 ns4s7wOWYb/lO8rE83Xg75apFOJ3C73fJErJsOBd1l6IZ8N+zORUWbwhFXipRIbvuECA
 cTtQ==
X-Gm-Message-State: AOAM53287HyX1C/Lj70dbTQychvvjfwDIB849EApfXSMtjsEwshgyXaF
 l14Uh4vK1GBnfYM2GA8rja2FKkvIZyPGVgsAn2AMo1oLbVnSznlhlAo/4v6yAXjz5Z9jLK1mRYB
 ldYuEH1dfHg6hR9w=
X-Received: by 2002:a05:600c:2f97:: with SMTP id
 t23mr17761622wmn.85.1641743691862; 
 Sun, 09 Jan 2022 07:54:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzTRdxYM3sF0iadkvdEJWgdqDnUAMRSAs8ZEVw7Sb45GszVI6IjXfntHKtotS1Wo9am621RYw==
X-Received: by 2002:a05:600c:2f97:: with SMTP id
 t23mr17761604wmn.85.1641743691538; 
 Sun, 09 Jan 2022 07:54:51 -0800 (PST)
Received: from redhat.com ([2a03:c5c0:107e:c07a:cd29:1c16:894b:6b07])
 by smtp.gmail.com with ESMTPSA id az25sm4296952wmb.26.2022.01.09.07.54.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jan 2022 07:54:50 -0800 (PST)
Date: Sun, 9 Jan 2022 10:54:46 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PULL v3 12/55] virtio-pci: add support for configure interrupt
Message-ID: <20220109105407-mutt-send-email-mst@kernel.org>
References: <20220108003423.15830-1-mst@redhat.com>
 <20220108003423.15830-13-mst@redhat.com>
 <16b8037c-a4bc-6440-4293-cd7262f8ac8a@kaod.org>
MIME-Version: 1.0
In-Reply-To: <16b8037c-a4bc-6440-4293-cd7262f8ac8a@kaod.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Cindy Lu <lulu@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Jan 09, 2022 at 02:33:43PM +0100, Cédric Le Goater wrote:
> Hello Cindy,
> 
> On 1/8/22 02:04, Michael S. Tsirkin wrote:
> > From: Cindy Lu <lulu@redhat.com>
> > 
> > Add support for configure interrupt, The process is used kvm_irqfd_assign
> > to set the gsi to kernel. When the configure notifier was signal by
> > host, qemu will inject a msix interrupt to guest
> > 
> > Signed-off-by: Cindy Lu <lulu@redhat.com>
> > Message-Id: <20211104164827.21911-11-lulu@redhat.com>
> > Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > ---
> >   hw/virtio/virtio-pci.h |  4 +-
> >   hw/virtio/virtio-pci.c | 92 ++++++++++++++++++++++++++++++++++++------
> >   2 files changed, 83 insertions(+), 13 deletions(-)
> > 
> > diff --git a/hw/virtio/virtio-pci.h b/hw/virtio/virtio-pci.h
> > index 2446dcd9ae..b704acc5a8 100644
> > --- a/hw/virtio/virtio-pci.h
> > +++ b/hw/virtio/virtio-pci.h
> > @@ -251,5 +251,7 @@ void virtio_pci_types_register(const VirtioPCIDeviceTypeInfo *t);
> >    * @fixed_queues.
> >    */
> >   unsigned virtio_pci_optimal_num_queues(unsigned fixed_queues);
> > -
> > +void virtio_pci_set_guest_notifier_fd_handler(VirtIODevice *vdev, VirtQueue *vq,
> > +                                              int n, bool assign,
> > +                                              bool with_irqfd);
> >   #endif
> > diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
> > index 7201cf3dc1..98fb5493ae 100644
> > --- a/hw/virtio/virtio-pci.c
> > +++ b/hw/virtio/virtio-pci.c
> > @@ -727,7 +727,8 @@ static int virtio_pci_get_notifier(VirtIOPCIProxy *proxy, int queue_no,
> >       VirtQueue *vq;
> >       if (queue_no == VIRTIO_CONFIG_IRQ_IDX) {
> > -        return -1;
> > +        *n = virtio_config_get_guest_notifier(vdev);
> > +        *vector = vdev->config_vector;
> >       } else {
> >           if (!virtio_queue_get_num(vdev, queue_no)) {
> >               return -1;
> > @@ -802,6 +803,10 @@ static int kvm_virtio_pci_vector_use(VirtIOPCIProxy *proxy, int nvqs)
> >       return ret;
> >   }
> > +static int kvm_virtio_pci_vector_config_use(VirtIOPCIProxy *proxy)
> > +{
> > +    return kvm_virtio_pci_vector_use_one(proxy, VIRTIO_CONFIG_IRQ_IDX);
> > +}
> >   static void kvm_virtio_pci_vector_release_one(VirtIOPCIProxy *proxy,
> >                                                 int queue_no)
> > @@ -839,6 +844,11 @@ static void kvm_virtio_pci_vector_release(VirtIOPCIProxy *proxy, int nvqs)
> >       }
> >   }
> > +static void kvm_virtio_pci_vector_config_release(VirtIOPCIProxy *proxy)
> > +{
> > +    kvm_virtio_pci_vector_release_one(proxy, VIRTIO_CONFIG_IRQ_IDX);
> > +}
> > +
> >   static int virtio_pci_one_vector_unmask(VirtIOPCIProxy *proxy,
> >                                          unsigned int queue_no,
> >                                          unsigned int vector,
> > @@ -920,9 +930,17 @@ static int virtio_pci_vector_unmask(PCIDevice *dev, unsigned vector,
> >           }
> >           vq = virtio_vector_next_queue(vq);
> >       }
> > -
> > +    /* unmask config intr */
> > +    n = virtio_config_get_guest_notifier(vdev);
> > +    ret = virtio_pci_one_vector_unmask(proxy, VIRTIO_CONFIG_IRQ_IDX, vector,
> > +                                       msg, n);
> > +    if (ret < 0) {
> > +        goto undo_config;
> > +    }
> >       return 0;
> > -
> > +undo_config:
> > +    n = virtio_config_get_guest_notifier(vdev);
> > +    virtio_pci_one_vector_mask(proxy, VIRTIO_CONFIG_IRQ_IDX, vector, n);
> >   undo:
> >       vq = virtio_vector_first_queue(vdev, vector);
> >       while (vq && unmasked >= 0) {
> > @@ -956,6 +974,8 @@ static void virtio_pci_vector_mask(PCIDevice *dev, unsigned vector)
> >           }
> >           vq = virtio_vector_next_queue(vq);
> >       }
> > +    n = virtio_config_get_guest_notifier(vdev);
> > +    virtio_pci_one_vector_mask(proxy, VIRTIO_CONFIG_IRQ_IDX, vector, n);
> >   }
> >   static void virtio_pci_vector_poll(PCIDevice *dev,
> > @@ -987,6 +1007,34 @@ static void virtio_pci_vector_poll(PCIDevice *dev,
> >               msix_set_pending(dev, vector);
> >           }
> >       }
> > +    /* poll the config intr */
> > +    ret = virtio_pci_get_notifier(proxy, VIRTIO_CONFIG_IRQ_IDX, &notifier,
> > +                                  &vector);
> > +    if (ret < 0) {
> > +        return;
> > +    }
> > +    if (vector < vector_start || vector >= vector_end ||
> > +        !msix_is_masked(dev, vector)) {
> > +        return;
> > +    }
> > +    if (k->guest_notifier_pending) {
> > +        if (k->guest_notifier_pending(vdev, VIRTIO_CONFIG_IRQ_IDX)) {
> > +            msix_set_pending(dev, vector);
> > +        }
> > +    } else if (event_notifier_test_and_clear(notifier)) {
> > +        msix_set_pending(dev, vector);
> > +    }
> > +}
> > +
> > +void virtio_pci_set_guest_notifier_fd_handler(VirtIODevice *vdev, VirtQueue *vq,
> > +                                              int n, bool assign,
> > +                                              bool with_irqfd)
> > +{
> > +    if (n == VIRTIO_CONFIG_IRQ_IDX) {
> > +        virtio_config_set_guest_notifier_fd_handler(vdev, assign, with_irqfd);
> > +    } else {
> > +        virtio_queue_set_guest_notifier_fd_handler(vq, assign, with_irqfd);
> > +    }
> >   }
> >   static int virtio_pci_set_guest_notifier(DeviceState *d, int n, bool assign,
> > @@ -995,17 +1043,25 @@ static int virtio_pci_set_guest_notifier(DeviceState *d, int n, bool assign,
> >       VirtIOPCIProxy *proxy = to_virtio_pci_proxy(d);
> >       VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
> >       VirtioDeviceClass *vdc = VIRTIO_DEVICE_GET_CLASS(vdev);
> > -    VirtQueue *vq = virtio_get_queue(vdev, n);
> > -    EventNotifier *notifier = virtio_queue_get_guest_notifier(vq);
> > +    VirtQueue *vq = NULL;
> > +    EventNotifier *notifier = NULL;
> > +
> > +    if (n == VIRTIO_CONFIG_IRQ_IDX) {
> > +        notifier = virtio_config_get_guest_notifier(vdev);
> > +    } else {
> > +        vq = virtio_get_queue(vdev, n);
> > +        notifier = virtio_queue_get_guest_notifier(vq);
> > +    }
> >       if (assign) {
> >           int r = event_notifier_init(notifier, 0);
> >           if (r < 0) {
> >               return r;
> >           }
> > -        virtio_queue_set_guest_notifier_fd_handler(vq, true, with_irqfd);
> > +        virtio_pci_set_guest_notifier_fd_handler(vdev, vq, n, true, with_irqfd);
> >       } else {
> > -        virtio_queue_set_guest_notifier_fd_handler(vq, false, with_irqfd);
> > +        virtio_pci_set_guest_notifier_fd_handler(vdev, vq, n, false,
> > +                                                 with_irqfd);
> >           event_notifier_cleanup(notifier);
> >       }
> > @@ -1047,6 +1103,7 @@ static int virtio_pci_set_guest_notifiers(DeviceState *d, int nvqs, bool assign)
> >           msix_unset_vector_notifiers(&proxy->pci_dev);
> >           if (proxy->vector_irqfd) {
> >               kvm_virtio_pci_vector_release(proxy, nvqs);
> > +            kvm_virtio_pci_vector_config_release(proxy);
> >               g_free(proxy->vector_irqfd);
> >               proxy->vector_irqfd = NULL;
> >           }
> > @@ -1062,7 +1119,11 @@ static int virtio_pci_set_guest_notifiers(DeviceState *d, int nvqs, bool assign)
> >               goto assign_error;
> >           }
> >       }
> > -
> > +    r = virtio_pci_set_guest_notifier(d, VIRTIO_CONFIG_IRQ_IDX, assign,
> > +                                      with_irqfd);
> > +    if (r < 0) {
> > +        goto config_assign_error;
> > +    }
> >       /* Must set vector notifier after guest notifier has been assigned */
> >       if ((with_irqfd || k->guest_notifier_mask) && assign) {
> >           if (with_irqfd) {
> > @@ -1071,11 +1132,14 @@ static int virtio_pci_set_guest_notifiers(DeviceState *d, int nvqs, bool assign)
> >                             msix_nr_vectors_allocated(&proxy->pci_dev));
> >               r = kvm_virtio_pci_vector_use(proxy, nvqs);
> >               if (r < 0) {
> > -                goto assign_error;
> > +                goto config_assign_error;
> >               }
> >           }
> > -        r = msix_set_vector_notifiers(&proxy->pci_dev,
> > -                                      virtio_pci_vector_unmask,
> > +        r = kvm_virtio_pci_vector_config_use(proxy);
> > +        if (r < 0) {
> > +            goto config_error;
> > +        }
> 
> 
> This is crashing a QEMU TCG machine using vhost (no irqfd). Below is a fix
> but I doubt it is complete.
> 
> Thanks,
> 
> C.
> 
> 
> From dde4d7b21c851a33d2d03bddd18464ae4e777a3f Mon Sep 17 00:00:00 2001
> From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
> Date: Sun, 9 Jan 2022 10:40:47 +0100
> Subject: [PATCH] vhost: Fix support for configure interrupt
> MIME-Version: 1.0
> Content-Type: text/plain; charset=UTF-8
> Content-Transfer-Encoding: 8bit
> 
> irqfd is not necessarily  in use (TCG using vhost).
> 
> Cc: Cindy Lu <lulu@redhat.com>
> Fixes: d5d24d859c39 ("virtio-pci: add support for configure interrupt")
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>  hw/virtio/virtio-pci.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
> index 98fb5493ae06..39ebb042860d 100644
> --- a/hw/virtio/virtio-pci.c
> +++ b/hw/virtio/virtio-pci.c
> @@ -1134,10 +1134,12 @@ static int virtio_pci_set_guest_notifiers(DeviceState *d, int nvqs, bool assign)
>              if (r < 0) {
>                  goto config_assign_error;
>              }
> -        }
> -        r = kvm_virtio_pci_vector_config_use(proxy);
> -        if (r < 0) {
> -            goto config_error;
> +
> +            r = kvm_virtio_pci_vector_config_use(proxy);
> +            if (r < 0) {
> +                abort();
> +                goto config_error;
> +            }
>          }
>          r = msix_set_vector_notifiers(&proxy->pci_dev, virtio_pci_vector_unmask,
>                                        virtio_pci_vector_mask,
> -- 
> 2.31.1


Yes, we need to fix up cleanup too, but besides that it seems good,
right?

So like this then? Cindy?

diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index 98fb5493ae..722ce12b45 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -1134,10 +1134,10 @@ static int virtio_pci_set_guest_notifiers(DeviceState *d, int nvqs, bool assign)
             if (r < 0) {
                 goto config_assign_error;
             }
-        }
-        r = kvm_virtio_pci_vector_config_use(proxy);
-        if (r < 0) {
-            goto config_error;
+            r = kvm_virtio_pci_vector_config_use(proxy);
+            if (r < 0) {
+                goto config_error;
+            }
         }
         r = msix_set_vector_notifiers(&proxy->pci_dev, virtio_pci_vector_unmask,
                                       virtio_pci_vector_mask,
@@ -1155,7 +1155,9 @@ notifiers_error:
         kvm_virtio_pci_vector_release(proxy, nvqs);
     }
 config_error:
-    kvm_virtio_pci_vector_config_release(proxy);
+    if (with_irqfd) {
+        kvm_virtio_pci_vector_config_release(proxy);
+    }
 config_assign_error:
     virtio_pci_set_guest_notifier(d, VIRTIO_CONFIG_IRQ_IDX, !assign,
                                   with_irqfd);


