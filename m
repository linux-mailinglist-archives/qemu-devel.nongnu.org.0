Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E7A61DC1F
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Nov 2022 17:45:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orMGl-0003xt-C7; Sat, 05 Nov 2022 12:43:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orMGj-0003xc-O3
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 12:43:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orMGh-0002kz-OX
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 12:43:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667666618;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mZfqK9t1aPn2FYlaLvOCZZS2miUbp3Crlth9yXF2eSA=;
 b=GebjrA2QgAef6RTbhv+Ez5pVEgmiwkrpPBOV6fJPdM/vDFJ+fnzbPCNpfrdrI6e/K3ddd+
 EaVoR0CAZNwOxiOlV/giiugEbKIGogjh7CGx8t94rs4SySv9XGX68+5BqKxZoFZAXzWyiw
 ROUhTJN2jurzyloi2Z0U9IVmOuZUU60=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-642-N6Oi9RXQNeGaNZ0sTXKtXg-1; Sat, 05 Nov 2022 12:43:36 -0400
X-MC-Unique: N6Oi9RXQNeGaNZ0sTXKtXg-1
Received: by mail-wm1-f69.google.com with SMTP id
 c130-20020a1c3588000000b003b56be513e1so3828789wma.0
 for <qemu-devel@nongnu.org>; Sat, 05 Nov 2022 09:43:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mZfqK9t1aPn2FYlaLvOCZZS2miUbp3Crlth9yXF2eSA=;
 b=EYtZP7QVvbo0cwizRRWJ8Ualh5bmHi547DNlCqtbORbreOdXxZ8eI+8jHNvBlJKhUg
 et4BC9Fqfad5nfAteVsFc6aOfPSqqJDiTEOlUax1MfI+H7xm6x/CLTcuo59lAQNYK9lN
 2bIQsx+HwdCS//nT0Jm1SYPTuHhpi7dEF1qK7HmycjOhUL6EpqHOl/g4mjnE9dKkT0Bl
 F1pUAXn3Hl4xhmElDnhQ/TaS84gIphgrwJZJh5uIL6lBPmX51P+hhxDexxPUam4PHqSq
 OvsiXO9+tjHAG23XISz+kmK0bI9KN7eX6B3Azn9etIzvhrmGchpF0jj93eVAtg1oaYjS
 keIg==
X-Gm-Message-State: ACrzQf0N20uHnhQCBj+oPODqvNFSREVPnqE+9lQ9uM4m8YQ1ud8y1QzR
 oZ46hfJFwGF69mcM/5O1Qu05o1vdcsffogYKQHiRx3+dm2WoUhFmbNFw1Ynor/Fc0MQMTebAGW5
 xPwzDFUN4KMLNPhA=
X-Received: by 2002:a05:600c:654f:b0:3c3:b5b7:43a9 with SMTP id
 dn15-20020a05600c654f00b003c3b5b743a9mr38247696wmb.201.1667666615714; 
 Sat, 05 Nov 2022 09:43:35 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4udWlukMppuubnUB4b4YHmtu589q7EligQIOqBFfcCPBtWzma3uSFAAsy4CNqfZWczsCeLMg==
X-Received: by 2002:a05:600c:654f:b0:3c3:b5b7:43a9 with SMTP id
 dn15-20020a05600c654f00b003c3b5b743a9mr38247684wmb.201.1667666615510; 
 Sat, 05 Nov 2022 09:43:35 -0700 (PDT)
Received: from redhat.com ([2.52.152.137]) by smtp.gmail.com with ESMTPSA id
 s1-20020a7bc381000000b003c6b874a0dfsm3426424wmj.14.2022.11.05.09.43.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Nov 2022 09:43:35 -0700 (PDT)
Date: Sat, 5 Nov 2022 12:43:29 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Longpeng(Mike)" <longpeng2@huawei.com>
Cc: stefanha@redhat.com, jasowang@redhat.com, sgarzare@redhat.com,
 cohuck@redhat.com, pbonzini@redhat.com, arei.gonglei@huawei.com,
 yechuan@huawei.com, huangzhichao@huawei.com, qemu-devel@nongnu.org,
 xiehong@huawei.com
Subject: Re: [PATCH v7 resend 0/4] add generic vDPA device support
Message-ID: <20221105103601-mutt-send-email-mst@kernel.org>
References: <20221105083629.1058-1-longpeng2@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221105083629.1058-1-longpeng2@huawei.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.045,
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

On Sat, Nov 05, 2022 at 04:36:25PM +0800, Longpeng(Mike) wrote:
> From: Longpeng <longpeng2@huawei.com>
> 
> Hi guys,
> 
> With the generic vDPA device, QEMU won't need to touch the device
> types any more, such like vfio.

With this kind of passthrough migration is completely MIA right?
Better add a blocker...
And given this is there an advantage over VFIO?

> We can use the generic vDPA device as follow:
>   -device vhost-vdpa-device-pci,vhostdev=/dev/vhost-vdpa-X
>   Or
>   -M microvm -m 512m -smp 2 -kernel ... -initrd ... -device \
>   vhost-vdpa-device,vhostdev=/dev/vhost-vdpa-x

> Changes v6 -> v7:
>     (v6: https://mail.gnu.org/archive/html/qemu-devel/2022-05/msg02821.html)
>     - rebase. [Jason]
>     - add documentation . [Stefan]
> 
> Changes v5 -> v6:
>   Patch 2:
>     - Turn to the original approach in the RFC to initialize the
>       virtio_pci_id_info array. [Michael]
> 	  https://lore.kernel.org/all/20220105005900.860-2-longpeng2@huawei.com/
>   Patch 3:
>     - Fix logical error of exception handler around the post_init.
>       [Stefano]
>     - Fix some coding style warnings. [Stefano]
>   Patch 4:
>     - Fix some coding style warnings. [Stefano]
> 
> Changes v4 -> v5:
>   Patch 3:
>     - remove vhostfd [Jason]
>     - support virtio-mmio [Jason]
> 
> Changes v3 -> v4:
>   v3: https://www.mail-archive.com/qemu-devel@nongnu.org/msg877015.html
>   - reorganize the series [Stefano]
>   - fix some typos [Stefano]
>   - fix logical error in vhost_vdpa_device_realize [Stefano]
> 
> Changes v2 -> v3
>   Patch 4 & 5:
>     - only call vdpa ioctls in vdpa-dev.c [Stefano, Longpeng]
>     - s/VQS_NUM/VQS_COUNT  [Stefano]
>     - check both vdpa_dev_fd and vdpa_dev [Stefano]
>   Patch 6:
>     - move all steps into vhost_vdpa_device_unrealize. [Stefano]
> 
> Changes RFC -> v2
>   Patch 1:
>     - rename 'pdev_id' to 'trans_devid'  [Michael]
>     - only use transitional device id for the devices
>       listed in the spec  [Michael]
>     - use macros to make the id_info table clearer  [Longpeng]
>     - add some modern devices in the id_info table  [Longpeng]
>   Patch 2:
>     - remove the GET_VECTORS_NUM command  [Jason]
>   Patch 4:
>     - expose vdpa_dev_fd as a QOM preperty  [Stefan]
>     - introduce vhost_vdpa_device_get_u32 as a common
>       function to make the code clearer  [Stefan]
>     - fix the misleading description of 'dc->desc'  [Stefano]
>   Patch 5:
>     - check returned number of virtqueues  [Stefan]
>   Patch 6:
>     - init s->num_queues  [Stefano]
>     - free s->dev.vqs  [Stefano]
> 
> 
> Longpeng (Mike) (4):
>   virtio: get class_id and pci device id by the virtio id
>   vdpa: add vdpa-dev support
>   vdpa: add vdpa-dev-pci support
>   docs: Add generic vhost-vdpa device documentation
> 
>  docs/system/devices/vhost-vdpa-device.rst |  43 +++
>  hw/virtio/Kconfig                         |   5 +
>  hw/virtio/meson.build                     |   2 +
>  hw/virtio/vdpa-dev-pci.c                  | 102 ++++++
>  hw/virtio/vdpa-dev.c                      | 377 ++++++++++++++++++++++
>  hw/virtio/virtio-pci.c                    |  88 +++++
>  include/hw/virtio/vdpa-dev.h              |  43 +++
>  include/hw/virtio/virtio-pci.h            |   5 +
>  8 files changed, 665 insertions(+)
>  create mode 100644 docs/system/devices/vhost-vdpa-device.rst
>  create mode 100644 hw/virtio/vdpa-dev-pci.c
>  create mode 100644 hw/virtio/vdpa-dev.c
>  create mode 100644 include/hw/virtio/vdpa-dev.h
> 
> -- 
> 2.23.0


