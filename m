Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 620976A5681
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 11:19:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWx49-00074z-3E; Tue, 28 Feb 2023 05:18:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pWx46-0006zR-6b
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 05:18:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pWx44-0004mj-Il
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 05:18:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677579509;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zgWtmVcMwy2hJRNSKnooGDaMZuAS1/P/XEE3NFbyhDg=;
 b=SQE++uMrr/LbzFOFMpLyi90u0OQNrl71QwjA4c1orrqbHHkrThStko+1UZ1upaH/aEiF1s
 elaFYmLXFE+AhTn5LoX3778J3l7ZXvc+NB2cLjBd9YIR3+/ppgLJNqsrcADG+k/7ept1Oi
 4sMCSyxfSYe6Go7fzxgu3jH0SzU/Cr8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-552-lC6wrIeLP_qyXBc9v2JtPQ-1; Tue, 28 Feb 2023 05:18:27 -0500
X-MC-Unique: lC6wrIeLP_qyXBc9v2JtPQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 e17-20020a05600c219100b003e21fa60ec1so4079809wme.2
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 02:18:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677579506;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zgWtmVcMwy2hJRNSKnooGDaMZuAS1/P/XEE3NFbyhDg=;
 b=WZSU7hM60djxRSCYSTg5PrP1uu0itrZjD2GyyElgp1ljKO5AkglsnIyF+Mqavze36i
 VuRAnS5XNxpDlkVj9EUcqhi/nzJHU3zXHCQXl11S4kyWuMGy7pZHNpSY2TcANHYOOSE4
 jYjwckjteEwWJ3ynDzuAEUqOzlbuljOegdIKI6F3WEvx2L/rqP+UeY7yynkm3Ti2DKqu
 LR1PPGcBl/JNTQG/cJqSN+YqP0DjzhQu2L+bF0blLPss5oFPWI2PH/GtmwX5oWadU8tP
 zCbnA6YAVHeOmCogs/OFFLkoy1/GRSleAJMzh2pOQROo55t81pz0fx7dFcn5Orwxj+QO
 l3ag==
X-Gm-Message-State: AO0yUKUNiVv4NbDjao01gr8rRceBJ3LasG30jQg90o279NY710lRMRU3
 O1seun1M+uMpTrqZwN4yecAxWCZaXiZdbq++iNjUFZ/RIaolrlAGKcjlnJ44beiCQbdkjLnFsn0
 Z5sSfWXvz7wkmKOc=
X-Received: by 2002:a05:600c:458f:b0:3eb:399d:ab28 with SMTP id
 r15-20020a05600c458f00b003eb399dab28mr1615693wmo.37.1677579506680; 
 Tue, 28 Feb 2023 02:18:26 -0800 (PST)
X-Google-Smtp-Source: AK7set89f059YYh4vuGCxLeHvVUmuLp8QHVrgxrefNwsEhuAJ3GsbeOXU0igw8Ed2lBWqrnIHRU0Xg==
X-Received: by 2002:a05:600c:458f:b0:3eb:399d:ab28 with SMTP id
 r15-20020a05600c458f00b003eb399dab28mr1615673wmo.37.1677579506403; 
 Tue, 28 Feb 2023 02:18:26 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 p15-20020a7bcdef000000b003e200d3b2d1sm11989043wmj.38.2023.02.28.02.18.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 02:18:25 -0800 (PST)
Date: Tue, 28 Feb 2023 05:18:22 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Longpeng(Mike)" <longpeng2@huawei.com>
Cc: jasowang@redhat.com, pbonzini@redhat.com, arei.gonglei@huawei.com,
 yechuan@huawei.com, eperezma@redhat.com, alex.williamson@redhat.com,
 mtosatti@redhat.com, clg@redhat.com, qemu-devel@nongnu.org
Subject: Re: [PATCH v1 1/3] virtio-pci: submit msi route changes in batch
Message-ID: <20230228051802-mutt-send-email-mst@kernel.org>
References: <20230228093937.2515-1-longpeng2@huawei.com>
 <20230228093937.2515-2-longpeng2@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230228093937.2515-2-longpeng2@huawei.com>
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

On Tue, Feb 28, 2023 at 05:39:35PM +0800, Longpeng(Mike) wrote:
> From: Longpeng <longpeng2@huawei.com>
> 
> The kvm_irqchip_commit_routes() is a time-intensive operation, it needs
> scan and update all irqfds that are already assigned during each invocation,
> so more vectors means need more time to process them. For virtio-pci, we
> can just submit once when enabling vectors of a virtio-pci device.
> 
> This can reduce the downtime when migrating a VM with vhost-vdpa devices.

can in what sense?  does it or does it not? by how much?

> Signed-off-by: Longpeng <longpeng2@huawei.com>
> ---
>  hw/virtio/virtio-pci.c | 24 +++++++++++++++++++++---
>  1 file changed, 21 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
> index 247325c193..22e76e3902 100644
> --- a/hw/virtio/virtio-pci.c
> +++ b/hw/virtio/virtio-pci.c
> @@ -49,6 +49,19 @@
>   * configuration space */
>  #define VIRTIO_PCI_CONFIG_SIZE(dev)     VIRTIO_PCI_CONFIG_OFF(msix_enabled(dev))
>  
> +/* Protected by the BQL */
> +static KVMRouteChange virtio_pci_route_change;
> +
> +static inline void virtio_pci_begin_route_changes(void)
> +{
> +    virtio_pci_route_change = kvm_irqchip_begin_route_changes(kvm_state);
> +}
> +
> +static inline void virtio_pci_commit_route_changes(void)
> +{
> +    kvm_irqchip_commit_route_changes(&virtio_pci_route_change);
> +}
> +
>  static void virtio_pci_bus_new(VirtioBusState *bus, size_t bus_size,
>                                 VirtIOPCIProxy *dev);
>  static void virtio_pci_reset(DeviceState *qdev);
> @@ -790,12 +803,11 @@ static int kvm_virtio_pci_vq_vector_use(VirtIOPCIProxy *proxy,
>      int ret;
>  
>      if (irqfd->users == 0) {
> -        KVMRouteChange c = kvm_irqchip_begin_route_changes(kvm_state);
> -        ret = kvm_irqchip_add_msi_route(&c, vector, &proxy->pci_dev);
> +        ret = kvm_irqchip_add_msi_route(&virtio_pci_route_change, vector,
> +                                        &proxy->pci_dev);
>          if (ret < 0) {
>              return ret;
>          }
> -        kvm_irqchip_commit_route_changes(&c);
>          irqfd->virq = ret;
>      }
>      irqfd->users++;
> @@ -903,12 +915,18 @@ static int kvm_virtio_pci_vector_vq_use(VirtIOPCIProxy *proxy, int nvqs)
>      int ret = 0;
>      VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
>  
> +    virtio_pci_begin_route_changes();
> +
>      for (queue_no = 0; queue_no < nvqs; queue_no++) {
>          if (!virtio_queue_get_num(vdev, queue_no)) {
> +            virtio_pci_commit_route_changes();
>              return -1;
>          }
>          ret = kvm_virtio_pci_vector_use_one(proxy, queue_no);
>      }
> +
> +    virtio_pci_commit_route_changes();
> +
>      return ret;
>  }
>  
> -- 
> 2.23.0


