Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 500C76A5933
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 13:39:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWynw-0000fu-IW; Tue, 28 Feb 2023 07:10:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pWynu-0000fm-B1
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 07:09:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pWyns-0005EU-NO
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 07:09:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677586196;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3aFkVMdyBuSyvFSReIa3LLQoeVBSpryGNvKpo49/yTE=;
 b=Vp9CHkdO8jDsKb0BwHaBTSNhWpQn4BvyEUvmaN73FiG7el0XM0A+XXHezvNRmIrgJ75cx3
 fFQFp0XbUw9Mmtcnm3LrM3Q24KLiW9SQ/Cp2AzYKPWBYpzNPuq0/CUnMhKPSJHCEvBpUFn
 Z6JtVM2sLK/dAqrWdZEnFwo9LtmhRbk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-426-7ySKP7PEMoyD8fVYeR2ktQ-1; Tue, 28 Feb 2023 07:09:55 -0500
X-MC-Unique: 7ySKP7PEMoyD8fVYeR2ktQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 s18-20020a7bc392000000b003deaf780ab6so4170780wmj.4
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 04:09:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677586194;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3aFkVMdyBuSyvFSReIa3LLQoeVBSpryGNvKpo49/yTE=;
 b=igxfSL/P02O6uhgwmi2JRj+vdCSQvRzwpvAZHW2nhZPuMm/n+Y6pt6Rj9j9eCQ28XK
 5HkD1dpmKgASFSPyxyz7aK0pFR/q1bzvYYEbvkFuha6IdzBVTTvnmqJPqDOmnK67cnpU
 PRjhhnl8OeYLxTULEyEGlh1MHnF9jvDJJyZC8+2Bw2U1rCRkCNflq0pUcbOzRrEnO5qn
 VviZcMChfOwmPsK5CpQxFxuhJW5ubsNpyxNdQ7lQPLEuEzY2TlBdckxUgtN2gUY/QyAM
 9JqFOBbGQGTJ52lyFd6XHiKAmDM/btJbo9OF84E93dJfmekii5dI3AS/JDPLY0lQb9+m
 Gz1g==
X-Gm-Message-State: AO0yUKV8Mtrxo1r8xnJpLCgSNwdPxcJ6u9cSc7PXONROErkRrfkmTS2Z
 fZHVrK2Jwvo4+7c+FTB+cLYUtglx3Q5PwZvp5I5GoazhCj8LuCL0JHiyN/B7Fu6emXn0cr6KZSA
 6pnn2bu5stDtu64Y=
X-Received: by 2002:a05:600c:538b:b0:3eb:2b88:8682 with SMTP id
 hg11-20020a05600c538b00b003eb2b888682mr2244274wmb.17.1677586193924; 
 Tue, 28 Feb 2023 04:09:53 -0800 (PST)
X-Google-Smtp-Source: AK7set/DtVwiE8KJpz3o2cWzY4zJBJRiG2oVIX2c4drXHjgxUJelqVmEtkcGWw6p1F97M24mjpYTOw==
X-Received: by 2002:a05:600c:538b:b0:3eb:2b88:8682 with SMTP id
 hg11-20020a05600c538b00b003eb2b888682mr2244254wmb.17.1677586193636; 
 Tue, 28 Feb 2023 04:09:53 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 y2-20020a1c4b02000000b003e203681b26sm11931866wma.29.2023.02.28.04.09.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 04:09:53 -0800 (PST)
Date: Tue, 28 Feb 2023 07:09:49 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Longpeng (Mike,
 Cloud Infrastructure Service Product Dept.)" <longpeng2@huawei.com>
Cc: jasowang@redhat.com, pbonzini@redhat.com, arei.gonglei@huawei.com,
 yechuan@huawei.com, eperezma@redhat.com, alex.williamson@redhat.com,
 mtosatti@redhat.com, clg@redhat.com, qemu-devel@nongnu.org
Subject: Re: [PATCH v1 1/3] virtio-pci: submit msi route changes in batch
Message-ID: <20230228070930-mutt-send-email-mst@kernel.org>
References: <20230228093937.2515-1-longpeng2@huawei.com>
 <20230228093937.2515-2-longpeng2@huawei.com>
 <20230228051619-mutt-send-email-mst@kernel.org>
 <d21264c2-12d9-a0d3-b4e5-fb4b39cca920@huawei.com>
 <aa1a5b0d-0657-5950-f940-0e6d930d5475@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aa1a5b0d-0657-5950-f940-0e6d930d5475@huawei.com>
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

On Tue, Feb 28, 2023 at 07:39:06PM +0800, Longpeng (Mike, Cloud Infrastructure Service Product Dept.) wrote:
> 
> 
> 在 2023/2/28 19:20, Longpeng (Mike, Cloud Infrastructure Service Product
> Dept.) 写道:
> > 
> > 
> > 在 2023/2/28 18:17, Michael S. Tsirkin 写道:
> > > On Tue, Feb 28, 2023 at 05:39:35PM +0800, Longpeng(Mike) wrote:
> > > > From: Longpeng <longpeng2@huawei.com>
> > > > 
> > > > The kvm_irqchip_commit_routes() is a time-intensive operation, it needs
> > > > scan and update all irqfds that are already assigned during each
> > > > invocation,
> > > > so more vectors means need more time to process them.
> > > 
> > > I think the real reason is it's the write side of RCU.
> > > 
> > 
> > Yes, so we can reduce the invocation of it in this way.
> > 
> > I'll send other optimizations in the next step, including irqbypass,
> > kvm_irqfd, etc.
> > 
> 
> Iterates the irqfds list is also time-consuming, it would iterate all
> existing irqfds when we commit, so the time complexity is O(n^2) without
> this patch.

Sounds good, pls include this in the commit log.

> > > > For virtio-pci, we
> > > > can just submit once when enabling vectors of a virtio-pci device.
> > > > 
> > > > This can reduce the downtime when migrating a VM with vhost-vdpa
> > > > devices.
> > > > 
> > > > Signed-off-by: Longpeng <longpeng2@huawei.com>
> > > > ---
> > > >   hw/virtio/virtio-pci.c | 24 +++++++++++++++++++++---
> > > >   1 file changed, 21 insertions(+), 3 deletions(-)
> > > > 
> > > > diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
> > > > index 247325c193..22e76e3902 100644
> > > > --- a/hw/virtio/virtio-pci.c
> > > > +++ b/hw/virtio/virtio-pci.c
> > > > @@ -49,6 +49,19 @@
> > > >    * configuration space */
> > > >   #define VIRTIO_PCI_CONFIG_SIZE(dev)
> > > > VIRTIO_PCI_CONFIG_OFF(msix_enabled(dev))
> > > > +/* Protected by the BQL */
> > > > +static KVMRouteChange virtio_pci_route_change;
> > > > +
> > > > +static inline void virtio_pci_begin_route_changes(void)
> > > > +{
> > > > +    virtio_pci_route_change =
> > > > kvm_irqchip_begin_route_changes(kvm_state);
> > > > +}
> > > > +
> > > > +static inline void virtio_pci_commit_route_changes(void)
> > > > +{
> > > > +    kvm_irqchip_commit_route_changes(&virtio_pci_route_change);
> > > > +}
> > > > +
> > > >   static void virtio_pci_bus_new(VirtioBusState *bus, size_t bus_size,
> > > >                                  VirtIOPCIProxy *dev);
> > > >   static void virtio_pci_reset(DeviceState *qdev);
> > > > @@ -790,12 +803,11 @@ static int
> > > > kvm_virtio_pci_vq_vector_use(VirtIOPCIProxy *proxy,
> > > >       int ret;
> > > >       if (irqfd->users == 0) {
> > > > -        KVMRouteChange c = kvm_irqchip_begin_route_changes(kvm_state);
> > > > -        ret = kvm_irqchip_add_msi_route(&c, vector, &proxy->pci_dev);
> > > > +        ret =
> > > > kvm_irqchip_add_msi_route(&virtio_pci_route_change, vector,
> > > > +                                        &proxy->pci_dev);
> > > >           if (ret < 0) {
> > > >               return ret;
> > > >           }
> > > > -        kvm_irqchip_commit_route_changes(&c);
> > > >           irqfd->virq = ret;
> > > >       }
> > > >       irqfd->users++;
> > > > @@ -903,12 +915,18 @@ static int
> > > > kvm_virtio_pci_vector_vq_use(VirtIOPCIProxy *proxy, int nvqs)
> > > >       int ret = 0;
> > > >       VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
> > > > +    virtio_pci_begin_route_changes();
> > > > +
> > > >       for (queue_no = 0; queue_no < nvqs; queue_no++) {
> > > >           if (!virtio_queue_get_num(vdev, queue_no)) {
> > > > +            virtio_pci_commit_route_changes();
> > > >               return -1;
> > > >           }
> > > >           ret = kvm_virtio_pci_vector_use_one(proxy, queue_no);
> > > >       }
> > > > +
> > > > +    virtio_pci_commit_route_changes();
> > > > +
> > > >       return ret;
> > > >   }
> > > > -- 
> > > > 2.23.0
> > > 
> > > .


