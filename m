Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D066A56ED
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 11:41:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWxPg-0000pE-2y; Tue, 28 Feb 2023 05:40:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pWxPb-0000gp-D1
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 05:40:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pWxPZ-0002Bl-Ij
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 05:40:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677580845;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rzrowUv/ZngLipz3SxIuROR69yrw50WqPBFbWvu+YCM=;
 b=deMJkugu7dF73Rw37ZzbOy9DaVQ1gXXxnolNmLJkKHHejvUKByayoqp4Imw1mJglBufQxu
 CfhkFEF/7VpyUcAOsBKvgZK/HnE19t2QyVy2pkO0/oFruJNWZVy/7zQj7zFDG/Db2QVL/F
 uxTVjrnsfxYXeRhQ7b0MebHWyTsscYU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-590-w8ILleGBOeG6Q0Ya2CvOZw-1; Tue, 28 Feb 2023 05:40:40 -0500
X-MC-Unique: w8ILleGBOeG6Q0Ya2CvOZw-1
Received: by mail-wm1-f72.google.com with SMTP id
 az39-20020a05600c602700b003e97eb80524so6723337wmb.4
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 02:40:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677580838;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rzrowUv/ZngLipz3SxIuROR69yrw50WqPBFbWvu+YCM=;
 b=t0oIAJ/o8WiYmF3bAknqMY/NrEBQvwOwxG68NFaAPUIiZhUJMOavG/Rlo5sSgyDvxy
 rXo0sjXkBA2h5eHFZYkRBcOpN6NUm5CA3nj9j977KMGngObrCBeG6DoCoIVUYfRBz316
 F37hT9ymV7/lSKRj1LL4Uc5b4xQNLwYct0OXOlrN7XHP10DaVJTviYlUmiTiiTYOz7D9
 zkC8n52WwRLufgxtbjj0KSZtP1+Eje0D93gZV0WOeflilPSPQe5HupReujKSYymKZ5k0
 mQQopcviDCC7xs8DT+A4JLexLqWDaFnlnTn47rV6MeFpUqlzbttJ+Ppntro/INq1/9Xv
 c1fQ==
X-Gm-Message-State: AO0yUKXQ7e9pmgHJ2v3F4XJqprTyvOrFh1thCdEPlmES4rPTQeU3oqEX
 xKAv9pyHbqu0f165Dui6ly8jnOeP8OoLB7WZkbrcx/CqyhF2/VPOfMDobcHmzUXglN0kD21EUUg
 LmxsQLfxlqRoA++g=
X-Received: by 2002:a5d:400d:0:b0:2c7:6cd3:638a with SMTP id
 n13-20020a5d400d000000b002c76cd3638amr1618030wrp.65.1677580838267; 
 Tue, 28 Feb 2023 02:40:38 -0800 (PST)
X-Google-Smtp-Source: AK7set/KI4zAjATmpKpGu1myN3tsm9P5fK2oPzYX/UP9x5koQ4HKzaA2Rypsf2nzlPdkP0O6ZMBEKQ==
X-Received: by 2002:a5d:400d:0:b0:2c7:6cd3:638a with SMTP id
 n13-20020a5d400d000000b002c76cd3638amr1618018wrp.65.1677580837947; 
 Tue, 28 Feb 2023 02:40:37 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 d16-20020adff850000000b002c55306f6edsm9419441wrq.54.2023.02.28.02.40.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 02:40:37 -0800 (PST)
Date: Tue, 28 Feb 2023 05:40:33 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Longpeng(Mike)" <longpeng2@huawei.com>
Cc: jasowang@redhat.com, pbonzini@redhat.com, arei.gonglei@huawei.com,
 yechuan@huawei.com, eperezma@redhat.com, alex.williamson@redhat.com,
 mtosatti@redhat.com, clg@redhat.com, qemu-devel@nongnu.org
Subject: Re: [PATCH v1 3/3] virtio-pci: defer to commit kvm irq routing when
 enable msi/msix
Message-ID: <20230228051830-mutt-send-email-mst@kernel.org>
References: <20230228093937.2515-1-longpeng2@huawei.com>
 <20230228093937.2515-4-longpeng2@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230228093937.2515-4-longpeng2@huawei.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On Tue, Feb 28, 2023 at 05:39:37PM +0800, Longpeng(Mike) wrote:
> From: Longpeng <longpeng2@huawei.com>
> 
> All unmasked vectors will be setup in msix_set_vector_notifiers(), which
> is a time-consuming operation because each vector need to be submit to
> KVM once. It's even worse if the VM has several devices and each devices
> has dozens of vectors.
> 
> We can defer and commit the vectors in batch, just like the commit dc580d51f7
> ("vfio: defer to commit kvm irq routing when enable msi/msix"),
> 
> The can reduce 80% of the time spending on virtio_pci_set_guest_notifiers().

cover letter also refers to 80%. what about patch 1 then? does it 
contribute some of this gain?

> Signed-off-by: Longpeng <longpeng2@huawei.com>

In the age of language models there's no longer any excuse to post
agrammatical commit messages. Please just give your text to one of these
to correct.

I prompted: "please correct grammar in the following text"
and got back:

	All unmasked vectors will be set up in
	msix_set_vector_notifiers(), which is a time-consuming operation because
	each vector needs to be submitted to KVM once. It's even worse if the VM
	has several devices and each device has dozens of vectors.

	We can defer and commit the vectors in batches, just like the
	commit dc580d51f7 ("vfio: defer to commit kvm irq routing when enabling
	msi/msix").

	This can reduce the time spent on virtio_pci_set_guest_notifiers() by 80%.




> ---
>  hw/virtio/virtio-pci.c     | 113 ++++++++++++++++++++++++++++++++-----
>  include/hw/virtio/virtio.h |   1 +
>  2 files changed, 99 insertions(+), 15 deletions(-)
> 
> diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
> index 5fd02b7cb8..13f9c31009 100644
> --- a/hw/virtio/virtio-pci.c
> +++ b/hw/virtio/virtio-pci.c
> @@ -51,15 +51,22 @@
>  
>  /* Protected by the BQL */
>  static KVMRouteChange virtio_pci_route_change;
> +static unsigned virtio_pci_route_change_depth;
>  
>  static inline void virtio_pci_begin_route_changes(void)
>  {
> -    virtio_pci_route_change = kvm_irqchip_begin_route_changes(kvm_state);
> +    if (!virtio_pci_route_change_depth) {
> +        virtio_pci_route_change = kvm_irqchip_begin_route_changes(kvm_state);
> +    }
> +    virtio_pci_route_change_depth++;
>  }
>  
>  static inline void virtio_pci_commit_route_changes(void)
>  {
> -    kvm_irqchip_commit_route_changes(&virtio_pci_route_change);
> +    virtio_pci_route_change_depth--;
> +    if (!virtio_pci_route_change_depth) {
> +        kvm_irqchip_commit_route_changes(&virtio_pci_route_change);
> +    }
>  }
>  
>  static void virtio_pci_bus_new(VirtioBusState *bus, size_t bus_size,
> @@ -976,6 +983,88 @@ static void kvm_virtio_pci_vector_config_release(VirtIOPCIProxy *proxy)
>      kvm_virtio_pci_vector_release_one(proxy, VIRTIO_CONFIG_IRQ_IDX);
>  }
>  
> +static int virtio_pci_vector_do_unmask(VirtIOPCIProxy *proxy,
> +                                       unsigned int queue_no,
> +                                       unsigned int vector,
> +                                       EventNotifier *n)
> +{
> +    VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
> +    VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
> +    int ret = 0;
> +
> +    /*
> +     * If guest supports masking, irqfd is already setup, unmask it.
> +     * Otherwise, set it up now.
> +     */
> +    if (vdev->use_guest_notifier_mask && k->guest_notifier_mask) {
> +        k->guest_notifier_mask(vdev, queue_no, false);
> +        /* Test after unmasking to avoid losing events. */
> +        if (k->guest_notifier_pending &&
> +            k->guest_notifier_pending(vdev, queue_no)) {
> +            event_notifier_set(n);
> +        }
> +    } else {
> +        ret = kvm_virtio_pci_irqfd_use(proxy, n, vector);
> +    }
> +
> +    return ret;
> +}
> +
> +static void virtio_pci_prepare_kvm_msi_virq_batch(VirtIOPCIProxy *proxy)
> +{
> +    VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
> +
> +    assert(!vdev->defer_kvm_irq_routing);
> +    vdev->defer_kvm_irq_routing = true;
> +    virtio_pci_begin_route_changes();

move this out of here please - otherwise it's not clear each begin
is matched by commit.  in fact just open code this function.

> +}
> +
> +static void virtio_pci_commit_kvm_msi_virq_batch(VirtIOPCIProxy *proxy)
> +{
> +    VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
> +    PCIDevice *dev = &proxy->pci_dev;
> +    VirtQueue *vq;
> +    EventNotifier *n;
> +    int vector, index;
> +    int ret;
> +
> +    assert(vdev->defer_kvm_irq_routing);
> +    virtio_pci_commit_route_changes();
> +    vdev->defer_kvm_irq_routing = false;
> +
> +    if (!msix_enabled(dev)) {
> +        return;
> +    }
> +
> +    /* Unmask all unmasked vectors */
> +    for (vector = 0; vector < dev->msix_entries_nr; vector++) {
> +        if (msix_is_masked(dev, vector)) {
> +            continue;
> +        }
> +
> +        vq = virtio_vector_first_queue(vdev, vector);
> +        while (vq) {
> +            index = virtio_get_queue_index(vq);
> +            if (!virtio_queue_get_num(vdev, index)) {
> +                break;
> +            }
> +            if (index < proxy->nvqs_with_notifiers) {
> +                n = virtio_queue_get_guest_notifier(vq);
> +                ret = virtio_pci_vector_do_unmask(proxy, index, vector, n);
> +                assert(ret >= 0);
> +            }
> +            vq = virtio_vector_next_queue(vq);
> +        }
> +
> +        if (vector == vdev->config_vector) {
> +            n = virtio_config_get_guest_notifier(vdev);
> +            ret = virtio_pci_vector_do_unmask(proxy, VIRTIO_CONFIG_IRQ_IDX,
> +                                              vector, n);
> +            assert(ret >= 0);
> +        }
> +    }
> +}
> +
>  static int virtio_pci_one_vector_unmask(VirtIOPCIProxy *proxy,
>                                         unsigned int queue_no,
>                                         unsigned int vector,
> @@ -983,7 +1072,6 @@ static int virtio_pci_one_vector_unmask(VirtIOPCIProxy *proxy,
>                                         EventNotifier *n)
>  {
>      VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
> -    VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
>      VirtIOIRQFD *irqfd;
>      int ret = 0;
>  
> @@ -1002,19 +1090,10 @@ static int virtio_pci_one_vector_unmask(VirtIOPCIProxy *proxy,
>          }
>      }
>  
> -    /* If guest supports masking, irqfd is already setup, unmask it.
> -     * Otherwise, set it up now.
> -     */
> -    if (vdev->use_guest_notifier_mask && k->guest_notifier_mask) {
> -        k->guest_notifier_mask(vdev, queue_no, false);
> -        /* Test after unmasking to avoid losing events. */
> -        if (k->guest_notifier_pending &&
> -            k->guest_notifier_pending(vdev, queue_no)) {
> -            event_notifier_set(n);
> -        }
> -    } else {
> -        ret = kvm_virtio_pci_irqfd_use(proxy, n, vector);
> +    if (!vdev->defer_kvm_irq_routing) {
> +        ret = virtio_pci_vector_do_unmask(proxy, queue_no, vector, n);
>      }
> +
>      return ret;
>  }
>  
> @@ -1284,12 +1363,16 @@ static int virtio_pci_set_guest_notifiers(DeviceState *d, int nvqs, bool assign)
>              }
>          }
>  
> +        virtio_pci_prepare_kvm_msi_virq_batch(proxy);
> +
>          r = msix_set_vector_notifiers(&proxy->pci_dev, virtio_pci_vector_unmask,
>                                        virtio_pci_vector_mask,
>                                        virtio_pci_vector_poll);
>          if (r < 0) {
>              goto notifiers_error;
>          }
> +
> +        virtio_pci_commit_kvm_msi_virq_batch(proxy);
>      }
>  
>      return 0;
> diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
> index 77c6c55929..9d82831350 100644
> --- a/include/hw/virtio/virtio.h
> +++ b/include/hw/virtio/virtio.h
> @@ -147,6 +147,7 @@ struct VirtIODevice
>      bool start_on_kick; /* when virtio 1.0 feature has not been negotiated */
>      bool disable_legacy_check;
>      bool vhost_started;
> +    bool defer_kvm_irq_routing;

Can't we avoid leaking kvm things all over the place?
What does this flag even mean?

>      VMChangeStateEntry *vmstate;
>      char *bus_name;
>      uint8_t device_endian;
> -- 
> 2.23.0


