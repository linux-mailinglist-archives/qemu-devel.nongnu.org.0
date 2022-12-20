Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 937CA6523A7
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 16:27:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7eVn-000750-HV; Tue, 20 Dec 2022 10:26:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7eVh-00074M-SZ
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 10:26:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7eVg-0001te-2G
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 10:26:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671549986;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PX5pwCwYyXxFqleem0fMLrq406y9ibh0UXE4SdGvLqc=;
 b=jJ/2R4ULzpRMDTOPjrpVm1GQ2SyjO6ANVq4ruE6rcn/20ZAhJ26iomFrfcMTpe9usW1q7F
 vYEXxilNCoRbJ4gQKSjjJCF/oq5MUbxATD6rmblBgXCDO55DWLcYJ910FPhce86v5HDO+A
 vbh8DM6z7kfFheEsRQZ8e70fuxirciQ=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-592-0IPJncvtOj2FK-x1U-kzhw-1; Tue, 20 Dec 2022 10:26:25 -0500
X-MC-Unique: 0IPJncvtOj2FK-x1U-kzhw-1
Received: by mail-yb1-f199.google.com with SMTP id
 s6-20020a259006000000b00706c8bfd130so14551389ybl.11
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 07:26:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PX5pwCwYyXxFqleem0fMLrq406y9ibh0UXE4SdGvLqc=;
 b=QvIbXuuI8/A7FV/2lznnfJgNgrk5HM3BMFe/gpS848gOqUxXi2/NfvLDYpfjaE41Uw
 gRLcqBHNBaFYMMg+cyvyFb6b51aE7quRu5xQLPJ7BZy6jrQbKI1OMqKBHyLqncWE5ZNT
 g3ohhFfNw9PWwF2f2COUVjjdZXKv76Ooj0eo8QzufTKXsYBscTx4+FFuXF5VgjjuPXrQ
 Gp96XFqo9RO9FffOP0gyBVTqAKLg+kC8Q64Z/o0wHNdPr/do9xJVqBVQP422XBybwodI
 UXpDLOr5wcxRBxI5AD5jS1hKuHlHK6fLgmVQpfKfXDohY3/6NfgQMgGx8tGTyBGnwbBj
 2Qhg==
X-Gm-Message-State: ANoB5plMN6VuHWGibYhi5BcJW4nL/kApZohjmQmEy+SxIub97x3N1cC7
 gwy49JQXD6PAj2moiEHfpbjq607LqEja4scfX069eH3v/hfS7CtNh3H98WaChMlTxiTwDmqCH3g
 pq0EP8+aWc3O21Fc=
X-Received: by 2002:a81:5d57:0:b0:3c9:265:1ea4 with SMTP id
 r84-20020a815d57000000b003c902651ea4mr26565169ywb.37.1671549985078; 
 Tue, 20 Dec 2022 07:26:25 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4tMmbi+ILbVQyQwr3XWZkLwtSa+d79Q4WE80mFOCMBtcvmdXKPgAWcUipkMC6yX+nNwET/4Q==
X-Received: by 2002:a81:5d57:0:b0:3c9:265:1ea4 with SMTP id
 r84-20020a815d57000000b003c902651ea4mr26565145ywb.37.1671549984736; 
 Tue, 20 Dec 2022 07:26:24 -0800 (PST)
Received: from redhat.com ([37.19.199.118]) by smtp.gmail.com with ESMTPSA id
 v5-20020a372f05000000b0070383f1b6f1sm1534703qkh.31.2022.12.20.07.26.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Dec 2022 07:26:23 -0800 (PST)
Date: Tue, 20 Dec 2022 10:26:17 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Longpeng(Mike)" <longpeng2@huawei.com>
Cc: stefanha@redhat.com, jasowang@redhat.com, sgarzare@redhat.com,
 cohuck@redhat.com, pbonzini@redhat.com, arei.gonglei@huawei.com,
 yechuan@huawei.com, huangzhichao@huawei.com, qemu-devel@nongnu.org
Subject: Re: [PATCH v10 0/5] add generic vDPA device support
Message-ID: <20221220102554-mutt-send-email-mst@kernel.org>
References: <20221205084943.2259-1-longpeng2@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221205084943.2259-1-longpeng2@huawei.com>
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

On Mon, Dec 05, 2022 at 04:49:38PM +0800, Longpeng(Mike) wrote:
> From: Longpeng <longpeng2@huawei.com>
> 
> Hi guys,
> 
> With the generic vDPA device, QEMU won't need to touch the device
> types any more, such like vfio.

Fails build:
Warning, treated as error:
/scm/qemu/docs/system/devices/vhost-vdpa-generic-device.rst:document isn't included in any toctree




> We can use the generic vDPA device as follow:
>   -device vhost-vdpa-device-pci,vhostdev=/dev/vhost-vdpa-X
>   Or
>   -M microvm -m 512m -smp 2 -kernel ... -initrd ... -device \
>   vhost-vdpa-device,vhostdev=/dev/vhost-vdpa-x
> 
> Changes v10 -> v9:
>     - optimize the doc [Jason]
> 
> Changes v9 -> v8:
>     - rename vhost-vdpa-device.rst to vhost-vdpa-generic-device.rst [Jason, Stefano]
>     - emphasize the vhost-vDPA generic device in doc [Jason]
> 
> Changes v8 -> v7:
>     - add migration blocker. [Michael]
> 
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
> Longpeng (Mike) (5):
>   virtio: get class_id and pci device id by the virtio id
>   vdpa: add vdpa-dev support
>   vdpa: add vdpa-dev-pci support
>   vdpa-dev: mark the device as unmigratable
>   docs: Add generic vhost-vdpa device documentation
> 
>  .../devices/vhost-vdpa-generic-device.rst     |  66 +++
>  hw/virtio/Kconfig                             |   5 +
>  hw/virtio/meson.build                         |   2 +
>  hw/virtio/vdpa-dev-pci.c                      | 102 +++++
>  hw/virtio/vdpa-dev.c                          | 377 ++++++++++++++++++
>  hw/virtio/virtio-pci.c                        |  88 ++++
>  include/hw/virtio/vdpa-dev.h                  |  43 ++
>  include/hw/virtio/virtio-pci.h                |   5 +
>  8 files changed, 688 insertions(+)
>  create mode 100644 docs/system/devices/vhost-vdpa-generic-device.rst
>  create mode 100644 hw/virtio/vdpa-dev-pci.c
>  create mode 100644 hw/virtio/vdpa-dev.c
>  create mode 100644 include/hw/virtio/vdpa-dev.h
> 
> -- 
> 2.23.0


