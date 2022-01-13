Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 718DC48DCE0
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 18:24:45 +0100 (CET)
Received: from localhost ([::1]:43782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n83q8-0000E3-JF
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 12:24:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n83df-0002eE-L8
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 12:11:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59984)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n83dd-0007U3-Tx
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 12:11:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642093909;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=j+0GlX981z865qmd9DHXIDngAbImz0o6sfqczzyltVo=;
 b=ZSQtQBfvYVAX4mlpMaeh3gdPfb1+Z4+BMvb+T8MGlccuKdKx4yfDuQ6BypeUDGhnQUU5em
 dmd89B6LnkbQGdZeLU0omifyo4vgcFSfyzJj8xvOeyDzVLHJ3O5ODggCAqxLsLdewD9LhR
 R6y/l1u4BgYsNtnGnm9TitYrrAzwyLM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-570-6vmDf9nIMPeiB3jlvZfTaw-1; Thu, 13 Jan 2022 12:11:48 -0500
X-MC-Unique: 6vmDf9nIMPeiB3jlvZfTaw-1
Received: by mail-wm1-f70.google.com with SMTP id
 r82-20020a1c4455000000b0034afc66f1fbso10838wma.9
 for <qemu-devel@nongnu.org>; Thu, 13 Jan 2022 09:11:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=j+0GlX981z865qmd9DHXIDngAbImz0o6sfqczzyltVo=;
 b=G6JTqYmZzLb73guU6+hM2vqBnMBJIWwmheIrP4ak1d2Kp/aXmXXAIhEYmYVczs1Q8B
 7vPbFAxy327dW0NHYqzptNYncRL52oLmqNf1xkgKF/CRLTLnGA0YoLhPEv9m8Ct0UPfJ
 Vuykw7rnljNT6DkLmEIS8Rdus9f/yha90eHzCcVnlTcCXe6HAuRMwu2xgxPV1Wen/WB9
 ONEFEs7YsCFI2J+hsIAM4dyibAAr/FBi4UAOpHQ61HXhAeZHMPwT1c1Q1xY9tUJXdcwS
 4Ph+m0vQyrWED/Qq0HtsoHe4jLheqPgaDI2QjVZbv0VIuC3b+N86Z/Xa3q2xiQ2w6o2m
 dvlw==
X-Gm-Message-State: AOAM531aFYawQJP5nhiKEfxbHAkzxlBVfu6Gy/VLhArSV51HfHHy1qDF
 eVXNbeEKAkw6tWD4lnKdQfJFyOE7cwLyWYn8Fnc2Wsc9ACG948gEGNw+q1i8KsnzQ8mIsR4WWEE
 m3V+X1ONcsT7pvNQ=
X-Received: by 2002:a05:600c:1491:: with SMTP id
 c17mr11904490wmh.163.1642093906789; 
 Thu, 13 Jan 2022 09:11:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxzFe2rQ5HeUeZqF/Iac1ydFwwHBL1Nk7v2h37iXtv6F8xIILvDyMiYbhZeZ1seaXNQLxn8Rw==
X-Received: by 2002:a05:600c:1491:: with SMTP id
 c17mr11904452wmh.163.1642093906368; 
 Thu, 13 Jan 2022 09:11:46 -0800 (PST)
Received: from redhat.com ([2.55.154.210])
 by smtp.gmail.com with ESMTPSA id l9sm3037424wro.16.2022.01.13.09.11.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jan 2022 09:11:45 -0800 (PST)
Date: Thu, 13 Jan 2022 12:11:42 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Halil Pasic <pasic@linux.ibm.com>
Subject: Re: [PATCH 1/1] virtio: fix the condition for iommu_platform not
 supported
Message-ID: <20220113115617-mutt-send-email-mst@kernel.org>
References: <20220113165131.1057714-1-pasic@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <20220113165131.1057714-1-pasic@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.594,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-stable@nongnu.org,
 qemu-devel@nongnu.org, Jakob Naucke <Jakob.Naucke@ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 13, 2022 at 05:51:31PM +0100, Halil Pasic wrote:
> The commit 04ceb61a40 ("virtio: Fail if iommu_platform is requested, but
> unsupported") claims to fail the device hotplug when iommu_platform
> is requested, but not supported by the (vhost) device. On the first
> glance the condition for detecting that situation looks perfect, but
> because a certain peculiarity of virtio_platform it ain't.
> 
> In fact the aforementioned commit introduces a regression. It breaks
> virtio-fs support for Secure Execution, and most likely also for AMD SEV
> or any other confidential guest scenario that relies encrypted guest
> memory.  The same also applies to any other vhost device that does not
> negotiate _F_ACCESS_PLATFORM.
> 
> The peculiarity is that iommu_platform and _F_ACCESS_PLATFORM collates
> "device can not access all of the guest ram" and "iova != gpa, thus
> device needs to translate iova".
> 
> Confidential guest technologies currently rely on the device/hypervisor
> offering _F_ACCESS_PLATFORM to grant access to whatever the device needs
> to see, because of the first. But, generally, they don't care for the
> second.
> 
> This is the very reason for which commit 7ef7e6e3b ("vhost: correctly
> turn on VIRTIO_F_IOMMU_PLATFORM") for, which fences _F_ACCESS_PLATFORM
> form the vhost device that does not need it, because on the vhost
> interface it only means "I/O address translation is needed".
> 
> This patch takes inspiration from 7ef7e6e3b ("vhost: correctly turn on
> VIRTIO_F_IOMMU_PLATFORM"),

Strange, I could not find this commit. Did you mean f7ef7e6e3b?


> and uses the same condition for detecting the
> situation when _F_ACCESS_PLATFORM is requested, but no I/O translation
> by the device, and thus no device capability is needed.
>
> In this
> situation claiming that the device does not support iommu_plattform=on
> is counter-productive. So let us stop doing that!
> 
> Signed-off-by: Halil Pasic <pasic@linux.ibm.com>
> Reported-by: Jakob Naucke <Jakob.Naucke@ibm.com>
> Fixes: 04ceb61a40 ("virtio: Fail if iommu_platform is requested, but
> unsupported")
> Cc: Kevin Wolf <kwolf@redhat.com>
> Cc: qemu-stable@nongnu.org
> 
> ---
> 
> @Kevin: Can you please verify, that I don't break your fix?

So which configurations did you test for this?

> ---
>  hw/virtio/virtio-bus.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/virtio/virtio-bus.c b/hw/virtio/virtio-bus.c
> index d23db98c56..c1578f3de2 100644
> --- a/hw/virtio/virtio-bus.c
> +++ b/hw/virtio/virtio-bus.c
> @@ -69,11 +69,6 @@ void virtio_bus_device_plugged(VirtIODevice *vdev, Error **errp)
>          return;
>      }
>  
> -    if (has_iommu && !virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM)) {
> -        error_setg(errp, "iommu_platform=true is not supported by the device");
> -        return;
> -    }
> -
>      if (klass->device_plugged != NULL) {
>          klass->device_plugged(qbus->parent, &local_err);
>      }
> @@ -88,6 +83,12 @@ void virtio_bus_device_plugged(VirtIODevice *vdev, Error **errp)
>      } else {
>          vdev->dma_as = &address_space_memory;
>      }
> +
> +    if (has_iommu && vdev->dma_as != &address_space_memory
> +                  && !virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM)) {
> +        error_setg(errp, "iommu_platform=true is not supported by the device");
> +        return;
> +    }
>  }
>  /* Reset the virtio_bus */
> 
> base-commit: f8d75e10d3e0033a0a29a7a7e4777a4fbc17a016
> -- 
> 2.32.0


