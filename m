Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49FB05F3D81
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 09:54:57 +0200 (CEST)
Received: from localhost ([::1]:35074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofclT-0007fx-TD
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 03:54:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1ofcPS-0006Qn-7a
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 03:32:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59352)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1ofcPK-0002Zt-Ik
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 03:32:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664868720;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=T/xtdbWZ1e9LRotxrs+E6aJ7kYEFbIFz/8CVzp8HEA0=;
 b=aUz61dicIRNGZkoLy8CxY/wuEGfDfZ6j44FG2wetXCxL9adTxd7pB4kUyOIXbnf+QMvp6/
 mmimn5FOKv/kleiF8ByGllqC6qmKicoON/wfACYX//OCglw8W0K/QfR1/QvQ/wayefJJiw
 HkXW4dHHuFRHceD/3z6J2bNOm3m3qos=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-402-qStxum8LMTq7GFArRPL-KQ-1; Tue, 04 Oct 2022 03:30:37 -0400
X-MC-Unique: qStxum8LMTq7GFArRPL-KQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 ay21-20020a05600c1e1500b003b45fd14b53so218281wmb.1
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 00:30:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=T/xtdbWZ1e9LRotxrs+E6aJ7kYEFbIFz/8CVzp8HEA0=;
 b=GRzyuAk/IXzwFHmGHMMZ4gbdgu1ZndPZfEBzp143N66YAI2GbQZd/KODlvOYXcX5Pb
 jY8OmKWNelibI4jloRnB2Ph+IEVOY2l2BB1qKOr7bQyUywbvun2Ce8tsrF0Fb9Mv1TPs
 n2i6ntfaYn06cMSJCA0tCIY4lvJ/sry0xP53Qeoc9XwtWalfpRauhFO19wLszcsmjxWB
 tp9Uu4z32MyrLwWZXgdV8wlFtrV06djLXRJ42nMa/QixQMglfYxJIlwHsoQmu+uwg7vU
 VceF56P3YkhcjfABE5rta/FXkw/x4J7gSURCnvxVnkp+JCDf/ztN8iJ0ppmVuIw1rewX
 rKZg==
X-Gm-Message-State: ACrzQf1yWd3bvkDGIxA8Zo8AJI1Pkoa7d7IZA+nZ6N38r1xo2BFu03mu
 Rfz66YkMSnGzAQHdeyxF6OgzQEyqo7qNiMA9cEnV1U2PjrsqV7o+/h1jj2xF7qnibT2NKXP9wws
 pIyTSm2UBJ982+F0=
X-Received: by 2002:a1c:44d5:0:b0:3b4:9c41:439f with SMTP id
 r204-20020a1c44d5000000b003b49c41439fmr9155755wma.13.1664868635662; 
 Tue, 04 Oct 2022 00:30:35 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4U31B/Onr4jmeeAp3cDhTUeLjCVRMrtbVyfzlUkglWQidoFwswSxjrgWQwxpmoFFEVLlz12A==
X-Received: by 2002:a1c:44d5:0:b0:3b4:9c41:439f with SMTP id
 r204-20020a1c44d5000000b003b49c41439fmr9155739wma.13.1664868635406; 
 Tue, 04 Oct 2022 00:30:35 -0700 (PDT)
Received: from sgarzare-redhat (host-79-46-200-222.retail.telecomitalia.it.
 [79.46.200.222]) by smtp.gmail.com with ESMTPSA id
 f14-20020a1c6a0e000000b003a5fa79007fsm13586455wmc.7.2022.10.04.00.30.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 00:30:34 -0700 (PDT)
Date: Tue, 4 Oct 2022 09:30:30 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org, Eric Auger <eric.auger@redhat.com>,
 David Hildenbrand <david@redhat.com>, peter.maydell@linaro.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v2 4/5] pci-ids: drop PCI_DEVICE_ID_VIRTIO_VSOCK
Message-ID: <20221004073030.nbi632tchiokqfv5@sgarzare-redhat>
References: <20220930135810.1892149-1-kraxel@redhat.com>
 <20220930135810.1892149-5-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20220930135810.1892149-5-kraxel@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Gerd,

On Fri, Sep 30, 2022 at 03:58:09PM +0200, Gerd Hoffmann wrote:
>Not needed for a virtio 1.0 device.
>
>Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
>---
> include/hw/pci/pci.h             | 1 -
> hw/virtio/vhost-user-vsock-pci.c | 2 --
> hw/virtio/vhost-vsock-pci.c      | 2 --
> 3 files changed, 5 deletions(-)
>
>diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
>index 42c83cb5ed00..fe103f35d9d6 100644
>--- a/include/hw/pci/pci.h
>+++ b/include/hw/pci/pci.h
>@@ -83,7 +83,6 @@ extern bool pci_available;
> #define PCI_DEVICE_ID_VIRTIO_SCSI        0x1004
> #define PCI_DEVICE_ID_VIRTIO_RNG         0x1005
> #define PCI_DEVICE_ID_VIRTIO_9P          0x1009
>-#define PCI_DEVICE_ID_VIRTIO_VSOCK       0x1012
>
> #define PCI_VENDOR_ID_REDHAT             0x1b36
> #define PCI_DEVICE_ID_REDHAT_BRIDGE      0x0001
>diff --git a/hw/virtio/vhost-user-vsock-pci.c b/hw/virtio/vhost-user-vsock-pci.c
>index e5a86e801362..8499b6871f50 100644
>--- a/hw/virtio/vhost-user-vsock-pci.c
>+++ b/hw/virtio/vhost-user-vsock-pci.c
>@@ -55,8 +55,6 @@ static void vhost_user_vsock_pci_class_init(ObjectClass *klass, void *data)
>     k->realize = vhost_user_vsock_pci_realize;
>     set_bit(DEVICE_CATEGORY_MISC, dc->categories);
>     device_class_set_props(dc, vhost_user_vsock_pci_properties);
>-    pcidev_k->vendor_id = PCI_VENDOR_ID_REDHAT_QUMRANET;
>-    pcidev_k->device_id = PCI_DEVICE_ID_VIRTIO_VSOCK;
>     pcidev_k->revision = 0x00;
>     pcidev_k->class_id = PCI_CLASS_COMMUNICATION_OTHER;
> }
>diff --git a/hw/virtio/vhost-vsock-pci.c b/hw/virtio/vhost-vsock-pci.c
>index 9f34414d3814..170a806b6765 100644
>--- a/hw/virtio/vhost-vsock-pci.c
>+++ b/hw/virtio/vhost-vsock-pci.c
>@@ -65,8 +65,6 @@ static void vhost_vsock_pci_class_init(ObjectClass *klass, void *data)
>     k->realize = vhost_vsock_pci_realize;
>     set_bit(DEVICE_CATEGORY_MISC, dc->categories);
>     device_class_set_props(dc, vhost_vsock_pci_properties);
>-    pcidev_k->vendor_id = PCI_VENDOR_ID_REDHAT_QUMRANET;
>-    pcidev_k->device_id = PCI_DEVICE_ID_VIRTIO_VSOCK;
>     pcidev_k->revision = 0x00;
>     pcidev_k->class_id = PCI_CLASS_COMMUNICATION_OTHER;
> }

Could we have migration issues with this change?

This reminded me that we've had issues already with vsock being 
incorrectly exported as legacy, that we discovered when we added commit 
9b3a35ec82 ("virtio: verify that legacy support is not accidentally 
on").

Then we needed commit d55f518248 ("virtio: skip legacy support check on 
machine types less than 5.1") to avoid migration issues.

And we merged the following commits to force 1.0 in virtio-vsock devices 
for machine types >= 5.1 :
- 6209070503 ("vhost-vsock-pci: force virtio version 1")
- 27eda699f5 ("vhost-user-vsock-pci: force virtio version 1")

Thanks,
Stefano


