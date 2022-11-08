Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21DD96206DD
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 03:43:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osEZS-0000Mt-Ha; Mon, 07 Nov 2022 21:42:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1osEZP-0000Mb-Nq
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 21:42:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1osEZN-0007jP-WF
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 21:42:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667875353;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/wGE3kq0P7OIa+pRBrawwxEC7NzoqH3060iV86e0s48=;
 b=JqaKypeCiSkhAXV5ZVjOUZtnDuuYFI1QXNWUg3sMvB2va/e1r96ST+coGAYNqe9cNTNnEr
 Z77HPD0EMj1CVzwmzdI4VR9ZRSe4x8L9zA/vSWZtJbSFr8LowM5OZFWhI58VgYXorm7tLH
 4PA58hkPtEktdnZeMz95ZS5g76txuxQ=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-184-zYI-5JnxOKKlUk2kVku3Kg-1; Mon, 07 Nov 2022 21:42:32 -0500
X-MC-Unique: zYI-5JnxOKKlUk2kVku3Kg-1
Received: by mail-ot1-f69.google.com with SMTP id
 64-20020a9d0846000000b0066cba79be7aso3157511oty.6
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 18:42:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/wGE3kq0P7OIa+pRBrawwxEC7NzoqH3060iV86e0s48=;
 b=QVIoEs7NUXw6LPOaDrbDLx14/YvS6p75tI6PtEFNgTl9EQdrXzNYcva419fMN+VMs8
 cvmsBaWZ+JRDOP+AXHknIAz3P+lAXBAyPMfiAJYhPB0aLX4OofQkJyLxtYXUQE3xo3It
 Rr3WSHj0nDyUypLJqzAKbeT7mbB/3DOOULc4OSf5Bfyei5ximSmeHc45BxnrRRLvvawm
 o58jpjHyDL6bLxUKtHwmp/miUVSdaaXJvBFx9svVDlO9/2rSdMiqbWJNaZr9kV+J5Ybu
 B9iPWSDF+Fl+PIWeiG8RTDKsUcx1BCVfYi0B5sL5Oh67aOk3JjlUA5TEQt+1K94AL750
 oVxQ==
X-Gm-Message-State: ACrzQf3UI5Rd0HiasUnaop3Y6TFWP7M52tArsgIzXFPovBR+SzyKEvs+
 mJ9ns+znRBv9vZrZBrOIlqVRwu5RmCEkorimBbWM2aZKwC5T7zyeNFAKA7wMgKqu9iY/DRlIbsp
 82RMlPo61MNKt69uBAO4o/ZlbCu5MxtQ=
X-Received: by 2002:a9d:604f:0:b0:66c:64d6:1bb4 with SMTP id
 v15-20020a9d604f000000b0066c64d61bb4mr629140otj.201.1667875350563; 
 Mon, 07 Nov 2022 18:42:30 -0800 (PST)
X-Google-Smtp-Source: AMsMyM7C2MuV/jT1pBZ2pqkoDcuiFxPQZEK2h3Qr0HtxvXBx3hZcPE7Us9jIo8uzHH8eDtr00DubyLDF2hQ2gOZdnwI=
X-Received: by 2002:a9d:604f:0:b0:66c:64d6:1bb4 with SMTP id
 v15-20020a9d604f000000b0066c64d61bb4mr629137otj.201.1667875350342; Mon, 07
 Nov 2022 18:42:30 -0800 (PST)
MIME-Version: 1.0
References: <20221108004157.1112-1-longpeng2@huawei.com>
 <20221108004157.1112-6-longpeng2@huawei.com>
In-Reply-To: <20221108004157.1112-6-longpeng2@huawei.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 8 Nov 2022 10:42:18 +0800
Message-ID: <CACGkMEtPpegJ+GbUseq4Y4=Y6De+trDZ5Ks8UqnTcsyVVPvnaw@mail.gmail.com>
Subject: Re: [PATCH v8 5/5] docs: Add generic vhost-vdpa device documentation
To: "Longpeng(Mike)" <longpeng2@huawei.com>
Cc: stefanha@redhat.com, mst@redhat.com, sgarzare@redhat.com, 
 cohuck@redhat.com, pbonzini@redhat.com, arei.gonglei@huawei.com, 
 yechuan@huawei.com, huangzhichao@huawei.com, qemu-devel@nongnu.org, 
 xiehong@huawei.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
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

On Tue, Nov 8, 2022 at 8:42 AM Longpeng(Mike) <longpeng2@huawei.com> wrote:
>
> From: Longpeng <longpeng2@huawei.com>
>
> Signed-off-by: Longpeng <longpeng2@huawei.com>
> ---
>  docs/system/devices/vhost-vdpa-device.rst | 43 +++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
>  create mode 100644 docs/system/devices/vhost-vdpa-device.rst
>
> diff --git a/docs/system/devices/vhost-vdpa-device.rst b/docs/system/devices/vhost-vdpa-device.rst
> new file mode 100644
> index 0000000000..b758c4fce6
> --- /dev/null
> +++ b/docs/system/devices/vhost-vdpa-device.rst

If the doc is for a general vhost-vDPA device, we'd better have a better name?

> @@ -0,0 +1,43 @@
> +
> +=========================
> +generic vhost-vdpa device
> +=========================
> +
> +This document explains the usage of the generic vhost vdpa device.
> +
> +Description
> +-----------
> +
> +vDPA(virtio data path acceleration) device is a device that uses a datapath
> +which complies with the virtio specifications with vendor specific control
> +path.
> +
> +QEMU provides two types of vhost-vdpa devices to enable the vDPA device, one
> +is type sensitive which means QEMU needs to know the actual device type
> +(e.g. net, blk, scsi) and another is called "generic vdpa device" which is
> +type insensitive (likes vfio-pci).

Same as above, if this document is focused on the general vhost-vDPA
device, we'd better emphasize it. And I don't think mention vfio-pci
is good idea here since those two are different from a lot of places,
(e.g the general vhost-vdpa is not transport specific, as demonstrated
below).

Thanks

> +
> +Examples
> +--------
> +
> +Prepare the vhost-vdpa backends first:
> +
> +::
> +  host# ls -l /dev/vhost-vdpa-*
> +  crw------- 1 root root 236, 0 Nov  2 00:49 /dev/vhost-vdpa-0
> +
> +Start QEMU with virtio-mmio bus:
> +
> +::
> +  host# qemu-system                                                  \
> +      -M microvm -m 512 -smp 2 -kernel ... -initrd ...               \
> +      -device vhost-vdpa-device,vhostdev=/dev/vhost-vdpa-0           \
> +      ...
> +
> +Start QEMU with virtio-pci bus:
> +
> +::
> +  host# qemu-system                                                  \
> +      -M pc -m 512 -smp 2                                            \
> +      -device vhost-vdpa-device-pci,vhostdev=/dev/vhost-vdpa-0       \
> +      ...
> --
> 2.23.0
>


