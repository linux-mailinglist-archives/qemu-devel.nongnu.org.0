Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E44A861E272
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Nov 2022 14:49:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1org0T-0002Me-8u; Sun, 06 Nov 2022 08:48:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1org0P-0002LT-O8
 for qemu-devel@nongnu.org; Sun, 06 Nov 2022 08:48:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1org0K-0002NE-K0
 for qemu-devel@nongnu.org; Sun, 06 Nov 2022 08:48:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667742480;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WctkZ3fhJGprjicbm4ZKSh1RQnvaTxdOa/UXxHKiOMU=;
 b=EH+CkFP2ZRcwwrcESsSVFmYs28XeeJaqRBaHPYavJQ5n70DLpLiyFkkh8ctpWSgfZMJyoG
 ue8THciPuj5RfXA3qxn7y7+4RDj09Ca4BkYWbTO65Lrxzn9mcPWXlt/6VXs9H9smJZvG2t
 /DP9lYVWp9nS/xOhq1SqCZUfY3ZMShk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-610-FzdaJ6yvP82kut0zG4EDcA-1; Sun, 06 Nov 2022 08:47:59 -0500
X-MC-Unique: FzdaJ6yvP82kut0zG4EDcA-1
Received: by mail-wm1-f69.google.com with SMTP id
 187-20020a1c02c4000000b003cfab28cbe0so24342wmc.9
 for <qemu-devel@nongnu.org>; Sun, 06 Nov 2022 05:47:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WctkZ3fhJGprjicbm4ZKSh1RQnvaTxdOa/UXxHKiOMU=;
 b=R5yAS3cyiE1eX66/4fvUUpQuznSVNsElynlP/jmKP0atR8AUMo9z/GeXJ0/vgTInfG
 dPqYXGTBaDCOIvMC1VxDeB7L6XoDGgYkGBQM5fyk18f/ZRAW56Q6u/K/+kEEiM2bpxiH
 ieIm1M9C+JY5ehvz1FgqF+idLkho/NGC8LO5D0+N0XarWJInHaViiRH/ZxdsQuX4U6Z4
 mCcT8AAeOvuTgb7X3fxH+nciRbUiAXbhuA2auETRLS/O4eyLVbOP7zxIOQdL47JhjECO
 k9lAAqT3XdcUbKiXLmaDOWElylAoWHIfJ/qlk9ymprXnJABl+k/ABAlD5CfnVJ4D144A
 ROIQ==
X-Gm-Message-State: ACrzQf2w5lA2XmKcCYb9gu18Twhj/wLDuO+0jMgTQNRn8ByWqSB55K8J
 Kq7akuA/QjA7UN10Mq4M+SIfshBDXWqvwsaD+QX4LgAChWyrMfXS2FdCBUby5Xdn3lEULRwpp6B
 tSoIChWLupA1m+IE=
X-Received: by 2002:a5d:674c:0:b0:236:9d0d:8de7 with SMTP id
 l12-20020a5d674c000000b002369d0d8de7mr28489000wrw.411.1667742478205; 
 Sun, 06 Nov 2022 05:47:58 -0800 (PST)
X-Google-Smtp-Source: AMsMyM6A6ORdRnipWPJD6xYqTLpFUyU1AkGowrd/un+MPxgKgnWow/gPT4c/ehnvmjUBGPD/0O9E+Q==
X-Received: by 2002:a5d:674c:0:b0:236:9d0d:8de7 with SMTP id
 l12-20020a5d674c000000b002369d0d8de7mr28488980wrw.411.1667742477934; 
 Sun, 06 Nov 2022 05:47:57 -0800 (PST)
Received: from redhat.com ([169.150.226.216]) by smtp.gmail.com with ESMTPSA id
 l21-20020a05600c4f1500b003b4fdbb6319sm9532585wmq.21.2022.11.06.05.47.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Nov 2022 05:47:56 -0800 (PST)
Date: Sun, 6 Nov 2022 08:47:51 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Longpeng (Mike,
 Cloud Infrastructure Service Product Dept.)" <longpeng2@huawei.com>
Cc: stefanha@redhat.com, jasowang@redhat.com, sgarzare@redhat.com,
 cohuck@redhat.com, pbonzini@redhat.com, arei.gonglei@huawei.com,
 yechuan@huawei.com, huangzhichao@huawei.com, qemu-devel@nongnu.org,
 xiehong@huawei.com
Subject: Re: [PATCH v7 resend 0/4] add generic vDPA device support
Message-ID: <20221106083701-mutt-send-email-mst@kernel.org>
References: <20221105083629.1058-1-longpeng2@huawei.com>
 <20221105103601-mutt-send-email-mst@kernel.org>
 <5387e1e7-b741-b6a1-f091-f15d5f136e38@huawei.com>
 <20221106011943-mutt-send-email-mst@kernel.org>
 <2b3d77fc-ece4-32b4-964a-c939613f1ca3@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2b3d77fc-ece4-32b4-964a-c939613f1ca3@huawei.com>
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Sun, Nov 06, 2022 at 09:11:39PM +0800, Longpeng (Mike, Cloud Infrastructure Service Product Dept.) wrote:
> 
> 
> 在 2022/11/6 13:22, Michael S. Tsirkin 写道:
> > On Sun, Nov 06, 2022 at 08:17:07AM +0800, Longpeng (Mike, Cloud Infrastructure Service Product Dept.) wrote:
> > > 
> > > 
> > > 在 2022/11/6 0:43, Michael S. Tsirkin 写道:
> > > > On Sat, Nov 05, 2022 at 04:36:25PM +0800, Longpeng(Mike) wrote:
> > > > > From: Longpeng <longpeng2@huawei.com>
> > > > > 
> > > > > Hi guys,
> > > > > 
> > > > > With the generic vDPA device, QEMU won't need to touch the device
> > > > > types any more, such like vfio.
> > > > 
> > > > With this kind of passthrough migration is completely MIA right?
> > > > Better add a blocker...
> > > 
> > > Oh, I missed the "vdpa-dev: mark the device as unmigratable" since v4 and
> > > I'll add it in the next version.
> > > 
> > > We'll support passthrough migration in the next step. We have already
> > > written a demo that can migrate between some offloading cards.
> > 
> > Hmm ok. Backend disconnect can't work though, can it? State
> > is by necessity lost when backend crashes.
> > Yes, it can't.
> 
> > > > And given this is there an advantage over VFIO?
> > > 
> > > I think the answer is the same as "why we need vDPA" if we compare it with
> > > VFIO.
> > 
> > The answer is mostly because you can migrate and support backend
> > disconnect, no?
> > 
> Migrating between different hardware is the first consideration in our
> requirement, supporting backend disconnect is a low priority.

I dislike non-orthogonal features though ...
And the advantage of keeping it out of process with qemu is
I presume security?

> > > > 
> > > > > We can use the generic vDPA device as follow:
> > > > >     -device vhost-vdpa-device-pci,vhostdev=/dev/vhost-vdpa-X
> > > > >     Or
> > > > >     -M microvm -m 512m -smp 2 -kernel ... -initrd ... -device \
> > > > >     vhost-vdpa-device,vhostdev=/dev/vhost-vdpa-x
> > > > 
> > > > > Changes v6 -> v7:
> > > > >       (v6: https://mail.gnu.org/archive/html/qemu-devel/2022-05/msg02821.html)
> > > > >       - rebase. [Jason]
> > > > >       - add documentation . [Stefan]
> > > > > 
> > > > > Changes v5 -> v6:
> > > > >     Patch 2:
> > > > >       - Turn to the original approach in the RFC to initialize the
> > > > >         virtio_pci_id_info array. [Michael]
> > > > > 	  https://lore.kernel.org/all/20220105005900.860-2-longpeng2@huawei.com/
> > > > >     Patch 3:
> > > > >       - Fix logical error of exception handler around the post_init.
> > > > >         [Stefano]
> > > > >       - Fix some coding style warnings. [Stefano]
> > > > >     Patch 4:
> > > > >       - Fix some coding style warnings. [Stefano]
> > > > > 
> > > > > Changes v4 -> v5:
> > > > >     Patch 3:
> > > > >       - remove vhostfd [Jason]
> > > > >       - support virtio-mmio [Jason]
> > > > > 
> > > > > Changes v3 -> v4:
> > > > >     v3: https://www.mail-archive.com/qemu-devel@nongnu.org/msg877015.html
> > > > >     - reorganize the series [Stefano]
> > > > >     - fix some typos [Stefano]
> > > > >     - fix logical error in vhost_vdpa_device_realize [Stefano]
> > > > > 
> > > > > Changes v2 -> v3
> > > > >     Patch 4 & 5:
> > > > >       - only call vdpa ioctls in vdpa-dev.c [Stefano, Longpeng]
> > > > >       - s/VQS_NUM/VQS_COUNT  [Stefano]
> > > > >       - check both vdpa_dev_fd and vdpa_dev [Stefano]
> > > > >     Patch 6:
> > > > >       - move all steps into vhost_vdpa_device_unrealize. [Stefano]
> > > > > 
> > > > > Changes RFC -> v2
> > > > >     Patch 1:
> > > > >       - rename 'pdev_id' to 'trans_devid'  [Michael]
> > > > >       - only use transitional device id for the devices
> > > > >         listed in the spec  [Michael]
> > > > >       - use macros to make the id_info table clearer  [Longpeng]
> > > > >       - add some modern devices in the id_info table  [Longpeng]
> > > > >     Patch 2:
> > > > >       - remove the GET_VECTORS_NUM command  [Jason]
> > > > >     Patch 4:
> > > > >       - expose vdpa_dev_fd as a QOM preperty  [Stefan]
> > > > >       - introduce vhost_vdpa_device_get_u32 as a common
> > > > >         function to make the code clearer  [Stefan]
> > > > >       - fix the misleading description of 'dc->desc'  [Stefano]
> > > > >     Patch 5:
> > > > >       - check returned number of virtqueues  [Stefan]
> > > > >     Patch 6:
> > > > >       - init s->num_queues  [Stefano]
> > > > >       - free s->dev.vqs  [Stefano]
> > > > > 
> > > > > 
> > > > > Longpeng (Mike) (4):
> > > > >     virtio: get class_id and pci device id by the virtio id
> > > > >     vdpa: add vdpa-dev support
> > > > >     vdpa: add vdpa-dev-pci support
> > > > >     docs: Add generic vhost-vdpa device documentation
> > > > > 
> > > > >    docs/system/devices/vhost-vdpa-device.rst |  43 +++
> > > > >    hw/virtio/Kconfig                         |   5 +
> > > > >    hw/virtio/meson.build                     |   2 +
> > > > >    hw/virtio/vdpa-dev-pci.c                  | 102 ++++++
> > > > >    hw/virtio/vdpa-dev.c                      | 377 ++++++++++++++++++++++
> > > > >    hw/virtio/virtio-pci.c                    |  88 +++++
> > > > >    include/hw/virtio/vdpa-dev.h              |  43 +++
> > > > >    include/hw/virtio/virtio-pci.h            |   5 +
> > > > >    8 files changed, 665 insertions(+)
> > > > >    create mode 100644 docs/system/devices/vhost-vdpa-device.rst
> > > > >    create mode 100644 hw/virtio/vdpa-dev-pci.c
> > > > >    create mode 100644 hw/virtio/vdpa-dev.c
> > > > >    create mode 100644 include/hw/virtio/vdpa-dev.h
> > > > > 
> > > > > -- 
> > > > > 2.23.0
> > > > 
> > > > .
> > 
> > 
> > .


