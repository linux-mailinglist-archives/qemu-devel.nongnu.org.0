Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C36D6523A8
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 16:28:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7eWx-0007RR-Tr; Tue, 20 Dec 2022 10:27:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7eWt-0007PW-VW
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 10:27:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7eWs-000208-G4
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 10:27:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671550061;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2Memed1gtxEA/orE0bvrH+aE16y+jup+jzZvFu/EpWA=;
 b=ZXWr7DgJQCKeDqsr9eETCiIWk82uQpWIY8jBk1Z1bS4pT2amc35pphYlxerT8YXYR+Vr73
 Vfu0ziHUMv9iV3wnFQHX8nGXmTd+iC+Hve1r4E4w30eKLcVbiDCWGHujcKxZ68leRhBWnn
 IVgryOug1Jvz5iOpWTBpBPgdhnvC8es=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-107-Q3xEL7LPOUinNFUBeR1vfg-1; Tue, 20 Dec 2022 10:27:40 -0500
X-MC-Unique: Q3xEL7LPOUinNFUBeR1vfg-1
Received: by mail-qt1-f199.google.com with SMTP id
 cm12-20020a05622a250c00b003a521f66e8eso5665235qtb.17
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 07:27:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2Memed1gtxEA/orE0bvrH+aE16y+jup+jzZvFu/EpWA=;
 b=b/PZUh2ZzCSLisDnGSHk8OdzQHsr6vUoLai4yFD72Ty5C3GlV/a9zYW8EFebDgugrY
 ekiRQI3CKTigYA1b/j4XRazE/XOlSshPydyF0/gS5zh/D8/FqX22uY5JtARtVeB5pmmL
 v0bcnbDs1+vsD+8qkR7lI3tzcVNS2gZWuLfWFdcbuxQTfcG2iKtZMW2c/XYR5EcKOaFE
 dkYTir2lDNP7363Qt/5cTuQRSxIwS0iEEfi5PSBIPgiEQNFB/8wkfF1IceXSlAxDWK8H
 3ffSN/jTsPFg/E6WZlPg9Voyze6I0tNStytwpZtg5Icc/VRm5HfHd3Qklq3SuETsUCid
 mq4g==
X-Gm-Message-State: AFqh2kpuAaRL5KxwcJmpRartUsCPo9kvaCZ3Cb8bG5oh46W+CMRK38N9
 Red8zSPXdBx2y4e4BmIFVqWiF3tM6JnB3gosv4u2a9rAea/Afc+w/GHxPogo/0GaGxLa948Khzs
 8KeX4ibdFR5ptZo4=
X-Received: by 2002:ad4:4508:0:b0:4d7:45fb:f5a2 with SMTP id
 k8-20020ad44508000000b004d745fbf5a2mr16086041qvu.13.1671550059823; 
 Tue, 20 Dec 2022 07:27:39 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtZZ95iFBkgM/1sztBZLJew0sU3LHFHSHDrI8ByZK6/fSMSYVJ5t/q/fpFqC1o26nvX3sG1mQ==
X-Received: by 2002:ad4:4508:0:b0:4d7:45fb:f5a2 with SMTP id
 k8-20020ad44508000000b004d745fbf5a2mr16086016qvu.13.1671550059548; 
 Tue, 20 Dec 2022 07:27:39 -0800 (PST)
Received: from redhat.com ([37.19.199.118]) by smtp.gmail.com with ESMTPSA id
 bn1-20020a05620a2ac100b006fafc111b12sm9007047qkb.83.2022.12.20.07.27.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Dec 2022 07:27:39 -0800 (PST)
Date: Tue, 20 Dec 2022 10:27:32 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Longpeng(Mike)" <longpeng2@huawei.com>
Cc: stefanha@redhat.com, jasowang@redhat.com, sgarzare@redhat.com,
 cohuck@redhat.com, pbonzini@redhat.com, arei.gonglei@huawei.com,
 yechuan@huawei.com, huangzhichao@huawei.com, qemu-devel@nongnu.org
Subject: Re: [PATCH v10 5/5] docs: Add generic vhost-vdpa device documentation
Message-ID: <20221220102712-mutt-send-email-mst@kernel.org>
References: <20221205084943.2259-1-longpeng2@huawei.com>
 <20221205084943.2259-6-longpeng2@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221205084943.2259-6-longpeng2@huawei.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

On Mon, Dec 05, 2022 at 04:49:43PM +0800, Longpeng(Mike) wrote:
> From: Longpeng <longpeng2@huawei.com>
> 
> Signed-off-by: Longpeng <longpeng2@huawei.com>

Dropped 5/5 for now due to comments and build errors.

> ---
>  .../devices/vhost-vdpa-generic-device.rst     | 66 +++++++++++++++++++
>  1 file changed, 66 insertions(+)
>  create mode 100644 docs/system/devices/vhost-vdpa-generic-device.rst
> 
> diff --git a/docs/system/devices/vhost-vdpa-generic-device.rst b/docs/system/devices/vhost-vdpa-generic-device.rst
> new file mode 100644
> index 0000000000..7d13359ea1
> --- /dev/null
> +++ b/docs/system/devices/vhost-vdpa-generic-device.rst
> @@ -0,0 +1,66 @@
> +
> +=========================
> +vhost-vDPA generic device
> +=========================
> +
> +This document explains the usage of the vhost-vDPA generic device.
> +
> +Description
> +-----------
> +
> +vDPA(virtio data path acceleration) device is a device that uses a datapath
> +which complies with the virtio specifications with vendor specific control
> +path.
> +
> +QEMU provides two types of vhost-vDPA devices to enable the vDPA device, one
> +is type sensitive which means QEMU needs to know the actual device type
> +(e.g. net, blk, scsi) and another is called "vhost-vDPA generic device" which
> +is type insensitive.
> +
> +The vhost-vDPA generic device builds on the vhost-vdpa subsystem and virtio
> +subsystem. It is quite small, but it can support any type of virtio device.
> +
> +Examples
> +--------
> +
> +1. Please make sure the modules listed bellow are installed:
> +    vhost.ko
> +    vhost_iotlb.ko
> +    vdpa.ko
> +    vhost_vdpa.ko
> +
> +
> +2. Prepare the vhost-vDPA backends, here is an example using vdpa_sim_blk
> +   device:
> +
> +::
> +  host# modprobe vdpa_sim_blk
> +  host# vdpa dev add mgmtdev vdpasim_blk name blk0
> +  (...you can see the vhost-vDPA device under /dev directory now...)
> +  host# ls -l /dev/vhost-vdpa-*
> +  crw------- 1 root root 236, 0 Nov  2 00:49 /dev/vhost-vdpa-0
> +
> +Note:
> +It needs some vendor-specific steps to provision the vDPA device if you're
> +using real HW devices, such as installing the vendor-specific vDPA driver
> +and binding the device to the driver.
> +
> +
> +3. Start the virtual machine:
> +
> +Start QEMU with virtio-mmio bus:
> +
> +::
> +  host# qemu-system                                                  \
> +      -M microvm -m 512 -smp 2 -kernel ... -initrd ...               \
> +      -device vhost-vdpa-device,vhostdev=/dev/vhost-vdpa-0           \
> +      ...
> +
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


