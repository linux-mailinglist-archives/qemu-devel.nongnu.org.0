Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC02A4007B1
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 23:58:36 +0200 (CEST)
Received: from localhost ([::1]:39932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMHCl-0004JH-VT
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 17:58:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1mMHBe-0002Bt-LH
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 17:57:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1mMHBc-0006R0-OV
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 17:57:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630706243;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+ZiPNkLP4AxNprlGp0ONu7ka2XY8qGQABOo8MXR+3tk=;
 b=UKpSo2LPD2P8dXr71NG+6At8FGemwzQHXWwJNNmg+Rvd2xWD4Zkk7imo5QhftsC7flspYG
 6DydxtWkhvV/2qlt+USKPVShQRq3kAwbW5keKj8q+to39i1s/ismKvBhty00nXKScFu5Hy
 fn+rnhplTC4whDHR4XssOg+9rOtn/zY=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-131-vmqZGs5BOJWecoOGk2b4VQ-1; Fri, 03 Sep 2021 17:57:22 -0400
X-MC-Unique: vmqZGs5BOJWecoOGk2b4VQ-1
Received: by mail-oi1-f199.google.com with SMTP id
 n26-20020a05680803ba00b002695053b627so369779oie.3
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 14:57:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=+ZiPNkLP4AxNprlGp0ONu7ka2XY8qGQABOo8MXR+3tk=;
 b=g7WoWmDInUm11fIlkjWtEBoqywMQNl6/oIykrbZpKX0df4z3JYyRTVz/uaJtuajNiA
 3d35vl7F5Fp6OwMB1BAiN30RXOg7RGOb1RYt2npvW1bkUeh8krlXKfrXqv8P3YM5bWJZ
 lLzFyJZsXssEiOcHIBPUHJvbrUXo+0JHY0qM14zJ43wIqAcRulGJsAitLo1Pgy5QKcJ2
 5hYfR3Sp5J0XnfGWzemkZqaEpjSsnkIBxhK0+x5dsrjxLU9dL89SevY6LsPndDMRhSJR
 reCTLyefDyEYUP6/+x5fwdokqlxvuZMUm9blHs8XOeHZFrT5JhMKqLYv3ycu8g+bwGWt
 3DSA==
X-Gm-Message-State: AOAM531fHc6SJZzSzEhA4uE4omvPpAqgJqDi06JrBrf0DHQBUZotgs+A
 DLb4hX4lzqfV6JPvj4SLXOmCl8pWK+ieOKIwr5ydkeKRGr34NcTL8hrics3hlDV49aniuOzt0Bc
 HFPjj37A/Fan+Uu8=
X-Received: by 2002:a05:6830:1395:: with SMTP id
 d21mr1017276otq.166.1630706241514; 
 Fri, 03 Sep 2021 14:57:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy8Y7WGuKZTgisi20CkKw+CnuIeANQjgRt3rIOIkxhYD6JKBQFVD0Taw3XbQjr7ai+z+pOMVA==
X-Received: by 2002:a05:6830:1395:: with SMTP id
 d21mr1017265otq.166.1630706241248; 
 Fri, 03 Sep 2021 14:57:21 -0700 (PDT)
Received: from redhat.com ([198.99.80.109])
 by smtp.gmail.com with ESMTPSA id 21sm136672oij.39.2021.09.03.14.57.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 14:57:21 -0700 (PDT)
Date: Fri, 3 Sep 2021 15:57:19 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: "Longpeng(Mike)" <longpeng2@huawei.com>
Subject: Re: [PATCH 4/5] kvm: irqchip: support defer to commit the route
Message-ID: <20210903155719.7a95d8be.alex.williamson@redhat.com>
In-Reply-To: <20210825075620.2607-5-longpeng2@huawei.com>
References: <20210825075620.2607-1-longpeng2@huawei.com>
 <20210825075620.2607-5-longpeng2@huawei.com>
Organization: Red Hat
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
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
Cc: mst@redhat.com, qemu-devel@nongnu.org, arei.gonglei@huawei.com,
 huangzhichao@huawei.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 25 Aug 2021 15:56:19 +0800
"Longpeng(Mike)" <longpeng2@huawei.com> wrote:

> The kvm_irqchip_commit_routes() is relatively expensive, so
> provide the users a choice to commit the route immediately
> or not when they add msi/msix route.
> 
> Signed-off-by: Longpeng(Mike) <longpeng2@huawei.com>
> ---
>  accel/kvm/kvm-all.c    | 10 +++++++---
>  accel/stubs/kvm-stub.c |  3 ++-
>  hw/misc/ivshmem.c      |  2 +-
>  hw/vfio/pci.c          |  2 +-
>  hw/virtio/virtio-pci.c |  2 +-
>  include/sysemu/kvm.h   |  4 +++-
>  target/i386/kvm/kvm.c  |  2 +-
>  7 files changed, 16 insertions(+), 9 deletions(-)
> 
> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> index 0125c17..1f788a2 100644
> --- a/accel/kvm/kvm-all.c
> +++ b/accel/kvm/kvm-all.c
> @@ -1950,7 +1950,8 @@ int kvm_irqchip_send_msi(KVMState *s, MSIMessage msg)
>      return kvm_set_irq(s, route->kroute.gsi, 1);
>  }
>  
> -int kvm_irqchip_add_msi_route(KVMState *s, int vector, PCIDevice *dev)
> +int kvm_irqchip_add_msi_route(KVMState *s, int vector, PCIDevice *dev,
> +                              bool defer_commit)
>  {
>      struct kvm_irq_routing_entry kroute = {};
>      int virq;
> @@ -1993,7 +1994,9 @@ int kvm_irqchip_add_msi_route(KVMState *s, int vector, PCIDevice *dev)
>  
>      kvm_add_routing_entry(s, &kroute);
>      kvm_arch_add_msi_route_post(&kroute, vector, dev);
> -    kvm_irqchip_commit_routes(s);
> +    if (!defer_commit) {
> +        kvm_irqchip_commit_routes(s);
> +    }


Personally I'd rather rename the function to
kvm_irqchip_add_deferred_msi_route() and kvm_irqchip_add_msi_route()
becomes a wrapper appending kvm_irqchip_commit_routes() to that.
Thanks,

Alex

>  
>      return virq;
>  }
> @@ -2151,7 +2154,8 @@ int kvm_irqchip_send_msi(KVMState *s, MSIMessage msg)
>      abort();
>  }
>  
> -int kvm_irqchip_add_msi_route(KVMState *s, int vector, PCIDevice *dev)
> +int kvm_irqchip_add_msi_route(KVMState *s, int vector, PCIDevice *dev,
> +                              bool defer_commit)
>  {
>      return -ENOSYS;
>  }
> diff --git a/accel/stubs/kvm-stub.c b/accel/stubs/kvm-stub.c
> index 5b1d00a..d5caaca 100644
> --- a/accel/stubs/kvm-stub.c
> +++ b/accel/stubs/kvm-stub.c
> @@ -81,7 +81,8 @@ int kvm_on_sigbus(int code, void *addr)
>  }
>  
>  #ifndef CONFIG_USER_ONLY
> -int kvm_irqchip_add_msi_route(KVMState *s, int vector, PCIDevice *dev)
> +int kvm_irqchip_add_msi_route(KVMState *s, int vector, PCIDevice *dev,
> +                              bool defer_commit)
>  {
>      return -ENOSYS;
>  }
> diff --git a/hw/misc/ivshmem.c b/hw/misc/ivshmem.c
> index 1ba4a98..98b14cc 100644
> --- a/hw/misc/ivshmem.c
> +++ b/hw/misc/ivshmem.c
> @@ -429,7 +429,7 @@ static void ivshmem_add_kvm_msi_virq(IVShmemState *s, int vector,
>      IVSHMEM_DPRINTF("ivshmem_add_kvm_msi_virq vector:%d\n", vector);
>      assert(!s->msi_vectors[vector].pdev);
>  
> -    ret = kvm_irqchip_add_msi_route(kvm_state, vector, pdev);
> +    ret = kvm_irqchip_add_msi_route(kvm_state, vector, pdev, false);
>      if (ret < 0) {
>          error_setg(errp, "kvm_irqchip_add_msi_route failed");
>          return;
> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> index ca37fb7..3ab67d6 100644
> --- a/hw/vfio/pci.c
> +++ b/hw/vfio/pci.c
> @@ -427,7 +427,7 @@ static void vfio_add_kvm_msi_virq(VFIOPCIDevice *vdev, VFIOMSIVector *vector,
>          return;
>      }
>  
> -    virq = kvm_irqchip_add_msi_route(kvm_state, vector_n, &vdev->pdev);
> +    virq = kvm_irqchip_add_msi_route(kvm_state, vector_n, &vdev->pdev, false);
>      if (virq < 0) {
>          event_notifier_cleanup(&vector->kvm_interrupt);
>          return;
> diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
> index 433060a..7e2d021 100644
> --- a/hw/virtio/virtio-pci.c
> +++ b/hw/virtio/virtio-pci.c
> @@ -684,7 +684,7 @@ static int kvm_virtio_pci_vq_vector_use(VirtIOPCIProxy *proxy,
>      int ret;
>  
>      if (irqfd->users == 0) {
> -        ret = kvm_irqchip_add_msi_route(kvm_state, vector, &proxy->pci_dev);
> +        ret = kvm_irqchip_add_msi_route(kvm_state, vector, &proxy->pci_dev, false);
>          if (ret < 0) {
>              return ret;
>          }
> diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
> index a1ab1ee..1932dc0 100644
> --- a/include/sysemu/kvm.h
> +++ b/include/sysemu/kvm.h
> @@ -473,9 +473,11 @@ void kvm_init_cpu_signals(CPUState *cpu);
>   *          message.
>   * @dev:    Owner PCI device to add the route. If @dev is specified
>   *          as @NULL, an empty MSI message will be inited.
> + * @defer_commit:   Defer to commit new route to the KVM core.
>   * @return: virq (>=0) when success, errno (<0) when failed.
>   */
> -int kvm_irqchip_add_msi_route(KVMState *s, int vector, PCIDevice *dev);
> +int kvm_irqchip_add_msi_route(KVMState *s, int vector, PCIDevice *dev,
> +                              bool defer_commit);
>  int kvm_irqchip_update_msi_route(KVMState *s, int virq, MSIMessage msg,
>                                   PCIDevice *dev);
>  void kvm_irqchip_commit_routes(KVMState *s);
> diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
> index e69abe4..896406b 100644
> --- a/target/i386/kvm/kvm.c
> +++ b/target/i386/kvm/kvm.c
> @@ -4724,7 +4724,7 @@ void kvm_arch_init_irq_routing(KVMState *s)
>          /* If the ioapic is in QEMU and the lapics are in KVM, reserve
>             MSI routes for signaling interrupts to the local apics. */
>          for (i = 0; i < IOAPIC_NUM_PINS; i++) {
> -            if (kvm_irqchip_add_msi_route(s, 0, NULL) < 0) {
> +            if (kvm_irqchip_add_msi_route(s, 0, NULL, false) < 0) {
>                  error_report("Could not enable split IRQ mode.");
>                  exit(1);
>              }


