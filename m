Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4849764E662
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 04:35:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p61UC-0001yT-38; Thu, 15 Dec 2022 22:34:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1p61U7-0001u3-Jz
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 22:34:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1p61U5-0000d8-4b
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 22:34:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671161643;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/VxpVSZ1ytCX2VzQ1A8ILvuCAwf+6OAJluhG/cFES8A=;
 b=HLqBxMMvAAyeOm7S5sbhPDgj0VMaD+OdPhggFhmwXOX474C1mdQzoR4I6n7mrhAO2Lcm3d
 Bade6bZGYgwT4lP9u9lvv8+aQUyR0ysau5Y9eH+cQnGhZrR/LzhCFtfzn/YNjeJggbf0sd
 brO7afTKuTRTR+PNBBO8TmLe5XuwB+Y=
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com
 [209.85.160.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-596-meS3KfXINSm_ocFJfgo9lw-1; Thu, 15 Dec 2022 22:34:01 -0500
X-MC-Unique: meS3KfXINSm_ocFJfgo9lw-1
Received: by mail-oa1-f70.google.com with SMTP id
 586e51a60fabf-144ea535efbso686561fac.16
 for <qemu-devel@nongnu.org>; Thu, 15 Dec 2022 19:34:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/VxpVSZ1ytCX2VzQ1A8ILvuCAwf+6OAJluhG/cFES8A=;
 b=5QETWIVcTbxKGacRdKcRvxvO7oyzm1ZMKVB3x16ntkz9hEVqB8yqKlo0mvCLg2XrB+
 zs3qgJ2694FmzApXH+VpV1I5EpLD3d5a8/cyfMjkulMed8AqgrdmK+dofr+NCfdVm9vh
 tMpGcG2QAHUcX+ONWflAXmJ0i4n+P+URWfluYqb3lqC9Rk/nIKAlhl4L6k43sU1KoLdx
 6GqsJo39BWcpw9ISvEl0froyq7nGCM1cCWQmyzQPOO2wNrhgEZwcQ0yeXsZwwaCTVlfm
 rdh39oHoGef+lfUJAfU7956bfMyvhTtRRejjrrpWIbhuy+W++u5uvpUAaQB0xSvqErov
 USwg==
X-Gm-Message-State: ANoB5pn0cjqdFmg31fmuuN7n28HoS7knYXGF1Pk5HFp20R+ObFKow25o
 GzKQVmeNhHSqzIWNw7ppkVc3A8OH4fnoch1lErvBg3gCrIuVDdzJXWiaMDrHIQ4lsoLGG4/oGxK
 HG169Z+qI00hql8hHVEZOW7bTMbW2txA=
X-Received: by 2002:a9d:80a:0:b0:670:8334:ccf2 with SMTP id
 10-20020a9d080a000000b006708334ccf2mr1428334oty.201.1671161640986; 
 Thu, 15 Dec 2022 19:34:00 -0800 (PST)
X-Google-Smtp-Source: AA0mqf59gHtjT7xtwT6fv6RNuCOVroYMImPfipWk6uDLiJAVkp6VhVZ7axY2FSU/zKcFIfcSHDpprpTCtEioJtYovIE=
X-Received: by 2002:a9d:80a:0:b0:670:8334:ccf2 with SMTP id
 10-20020a9d080a000000b006708334ccf2mr1428327oty.201.1671161640752; Thu, 15
 Dec 2022 19:34:00 -0800 (PST)
MIME-Version: 1.0
References: <20221215134944.2809-1-longpeng2@huawei.com>
 <20221215134944.2809-6-longpeng2@huawei.com>
In-Reply-To: <20221215134944.2809-6-longpeng2@huawei.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 16 Dec 2022 11:33:49 +0800
Message-ID: <CACGkMEt65Nr_M6aTU1NwS3t=S6CaMROt7C+Hb0HqszzO7gJKMw@mail.gmail.com>
Subject: Re: [PATCH v11 5/5] docs: Add generic vhost-vdpa device documentation
To: "Longpeng(Mike)" <longpeng2@huawei.com>
Cc: stefanha@redhat.com, mst@redhat.com, sgarzare@redhat.com, 
 cohuck@redhat.com, pbonzini@redhat.com, arei.gonglei@huawei.com, 
 yechuan@huawei.com, huangzhichao@huawei.com, qemu-devel@nongnu.org
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

On Thu, Dec 15, 2022 at 9:50 PM Longpeng(Mike) <longpeng2@huawei.com> wrote:
>
> From: Longpeng <longpeng2@huawei.com>
>
> Signed-off-by: Longpeng <longpeng2@huawei.com>
> ---
>  .../devices/vhost-vdpa-generic-device.rst     | 68 +++++++++++++++++++
>  1 file changed, 68 insertions(+)
>  create mode 100644 docs/system/devices/vhost-vdpa-generic-device.rst
>
> diff --git a/docs/system/devices/vhost-vdpa-generic-device.rst b/docs/system/devices/vhost-vdpa-generic-device.rst
> new file mode 100644
> index 0000000000..24c825ef1a
> --- /dev/null
> +++ b/docs/system/devices/vhost-vdpa-generic-device.rst
> @@ -0,0 +1,68 @@
> +
> +=========================
> +vhost-vDPA generic device
> +=========================
> +
> +This document explains the usage of the vhost-vDPA generic device.
> +
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
> +
> +Requirements
> +------------
> +Linux 5.18+
> +iproute2/vdpa 5.12.0+
> +
> +
> +Examples
> +--------
> +
> +1. Prepare the vhost-vDPA backends, here is an example using vdpa_sim_blk
> +   device:
> +
> +::
> +  host# modprobe vhost_vdpa
> +  host# modprobe vdpa_sim_blk

Nit: it's probably better to add driver binding steps here.

> +  host# vdpa dev add mgmtdev vdpasim_blk name blk0
> +  (...you can see the vhost-vDPA device under /dev directory now...)

And then the vhost char dev name could be fetch via

ls /sys/bus/vdpa/device/blk0/vhost-vdpa*

With the above changes.

Acked-by: Jason Wang <jasowang@redhat.com>

Thanks

> +  host# ls -l /dev/vhost-vdpa-*
> +  crw------- 1 root root 236, 0 Nov  2 00:49 /dev/vhost-vdpa-0
> +
> +Note:
> +It needs some vendor-specific steps to provision the vDPA device if you're
> +using real HW devices, such as loading the vendor-specific vDPA driver and
> +binding the device to the driver.
> +
> +
> +2. Start the virtual machine:
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
>


