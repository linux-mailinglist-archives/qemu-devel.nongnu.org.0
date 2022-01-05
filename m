Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A858485A6B
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 22:08:11 +0100 (CET)
Received: from localhost ([::1]:38292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5DVx-0000Fi-MO
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 16:08:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5DTo-0007B3-8o
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 16:05:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38130)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5DTl-0000U6-7E
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 16:05:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641416752;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Gt9QfIZN5rnZhKo0ZrWiiBh13c8FjXxFg5EJQO/Iz/Y=;
 b=OC7Qj2EaQy7xnYh+Adg+dsiqoYhn9OFxVZe8TnGrZM5IaqDN52nITHFwl2ZdPAhrPGDZU4
 HBsPjdv4PVXig9u6DdP59u9bmLBR7nM8mNMgWbjf4O3K647S56fYBUI55SdATwYd/NHEi2
 Ixc19D3w7y8oqrkPSGhpPfkLQ3mB4qI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-551-CoKWPDFZNiyi3zuZRgKRsw-1; Wed, 05 Jan 2022 16:05:50 -0500
X-MC-Unique: CoKWPDFZNiyi3zuZRgKRsw-1
Received: by mail-wm1-f71.google.com with SMTP id
 l17-20020a05600c1d1100b00345e7624489so14788wms.9
 for <qemu-devel@nongnu.org>; Wed, 05 Jan 2022 13:05:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Gt9QfIZN5rnZhKo0ZrWiiBh13c8FjXxFg5EJQO/Iz/Y=;
 b=AvItTsxscS3578awrs3npLvypp4kxZQKgsdmPMuws5fuWO4hwTgnOMRJqkFKzBESQ2
 5/L4b0jggegqw9jcyg9UUClkE5flWtcCH2hwSw7MUlf8fKags/QwYgliXqcK4E8H/tQ5
 K2GzJK8myCUDsCGYZCaF44baYik6KphiD4aYY0JsIUA0QYNc+/9rrdgSUgXdL45PUpNZ
 yvzZVDVLYXMewQYw87hWQJWpBiTTA3X035gOAEaEIraOmEu9hQcQZQNdMi3WyotPaVv1
 jNRdCUaE1XNVtULyoJ6LIi2IfOVV147/tIXRc/B0fTh15/S1N662/b9oMTT4/Cn/Q7Vs
 tgFQ==
X-Gm-Message-State: AOAM533jS7cocIxW6eLul2AlsHgJK6q3/tHC69i71UL0njM8MDxm45MC
 HO0gtWcEkrUJ3TMlOx7BxKGbjLIXD3gmajQpXQTserlq24wWTXC348cmY8wkxpzlN2nmK+nTLzf
 g5A48R9ZwlyqZfb0=
X-Received: by 2002:adf:fc02:: with SMTP id i2mr3469022wrr.330.1641416749394; 
 Wed, 05 Jan 2022 13:05:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz6q/CLYIv9kUu063pj8Lyrqt0vPW3gMa1BKQOqKPlsF/ttGKF9choe2PXTxFRT+wdirIla6A==
X-Received: by 2002:adf:fc02:: with SMTP id i2mr3469009wrr.330.1641416749156; 
 Wed, 05 Jan 2022 13:05:49 -0800 (PST)
Received: from redhat.com ([2a03:c5c0:207e:991b:6857:5652:b903:a63b])
 by smtp.gmail.com with ESMTPSA id u10sm81749wrs.28.2022.01.05.13.05.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jan 2022 13:05:48 -0800 (PST)
Date: Wed, 5 Jan 2022 16:05:45 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH] vfio/pci: Generate more relevant log messages for reset
 failures
Message-ID: <20220105160400-mutt-send-email-mst@kernel.org>
References: <164141259622.4193261.8252690438434562107.stgit@omen>
MIME-Version: 1.0
In-Reply-To: <164141259622.4193261.8252690438434562107.stgit@omen>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
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
Cc: qemu-devel@nongnu.org, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 05, 2022 at 12:56:42PM -0700, Alex Williamson wrote:
> The VFIO_DEVICE_RESET ioctl might be backed by several different reset
> methods, including a device specific reset (ie. custom reset code in
> kernel), an ACPI reset (ie. custom reset code in firmware), FLR, PM,
> and bus resets.  This listing is also the default priority order used
> by the kernel for trying reset methods.  Traditionally we've had some
> FUD regarding the PM reset as the extent of a "Soft Reset" is not well
> defined in the PCI specification.  Therefore we try to guess what type
> of reset a device might use for the VFIO_DEVICE_RESET and insert a bus
> reset via the vfio hot reset interface if we think it could be a PM
> reset.
> 
> This results in a couple odd tests for PM reset in our hot reset code,
> as we assume if we don't detect has_pm_reset support that we can't
> reset the device otherwise.  Starting with kernel v5.15, the kernel
> exposes a sysfs attribute for devices that can tell us the priority
> order for device resets, so long term (not implemented here) we no
> longer need to play this guessing game, and if permissions allow we
> could manipulate the order ourselves so that we don't need to inject
> our own hot reset.
> 
> In the shorter term, implemented here, let's not assume we're out of
> reset methods if we can't perform a hot reset and the device doesn't
> support PM reset.  We can use reset_works as the authority, which
> allows us to generate more comprehensible error messages for the case
> when it actually doesn't work.
> 
> The impetus for this change is a result of commit d5daff7d3126 ("pcie:
> implement slot power control for pcie root ports"), where powering off
> a slot now results in a device reset.  If the slot is powered off as a
> result of qdev_unplug() via the device request event, that device
> request is potentially the result of an unbind operation in the host.
> That unbind operation holds the kernel device lock, which causes the
> VFIO_DEVICE_RESET ioctl to fail (or in the case of some kernels, has
> cleared the flag indicating support of a device reset function).  We
> can then end up with an SR-IOV VF device trying to trigger a hot reset,
> which finds that it needs ownership of the PF group to perform such a
> reset, resulting in confusing log messages.
> 
> Ultimately the above commit still introduces a log message that we
> didn't have prior on such an unplug, but it's not unjustified to
> perform such a reset, though it might be considered unnecessary.
> Arguably failure to reset the device should always generate some sort
> of meaningful log message.
> 
> Signed-off-by: Alex Williamson <alex.williamson@redhat.com>

Looks reasonable. Just an extra idea: do we want to maybe validate the
return code from the ioctl? I assume it's something like EBUSY right?
In any case better than what we have now:

Acked-by: Michael S. Tsirkin <mst@redhat.com>



> ---
>  hw/vfio/pci.c |   44 ++++++++++++++++++++++++++++++++------------
>  1 file changed, 32 insertions(+), 12 deletions(-)
> 
> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> index 7b45353ce27f..ea697951556e 100644
> --- a/hw/vfio/pci.c
> +++ b/hw/vfio/pci.c
> @@ -2224,7 +2224,7 @@ static int vfio_pci_hot_reset(VFIOPCIDevice *vdev, bool single)
>      ret = ioctl(vdev->vbasedev.fd, VFIO_DEVICE_GET_PCI_HOT_RESET_INFO, info);
>      if (ret && errno != ENOSPC) {
>          ret = -errno;
> -        if (!vdev->has_pm_reset) {
> +        if (!vdev->vbasedev.reset_works) {
>              error_report("vfio: Cannot reset device %s, "
>                           "no available reset mechanism.", vdev->vbasedev.name);
>          }
> @@ -2270,7 +2270,7 @@ static int vfio_pci_hot_reset(VFIOPCIDevice *vdev, bool single)
>          }
>  
>          if (!group) {
> -            if (!vdev->has_pm_reset) {
> +            if (!vdev->vbasedev.reset_works) {
>                  error_report("vfio: Cannot reset device %s, "
>                               "depends on group %d which is not owned.",
>                               vdev->vbasedev.name, devices[i].group_id);
> @@ -3162,6 +3162,8 @@ static void vfio_exitfn(PCIDevice *pdev)
>  static void vfio_pci_reset(DeviceState *dev)
>  {
>      VFIOPCIDevice *vdev = VFIO_PCI(dev);
> +    Error *err = NULL;
> +    int ret;
>  
>      trace_vfio_pci_reset(vdev->vbasedev.name);
>  
> @@ -3175,26 +3177,44 @@ static void vfio_pci_reset(DeviceState *dev)
>          goto post_reset;
>      }
>  
> -    if (vdev->vbasedev.reset_works &&
> -        (vdev->has_flr || !vdev->has_pm_reset) &&
> -        !ioctl(vdev->vbasedev.fd, VFIO_DEVICE_RESET)) {
> -        trace_vfio_pci_reset_flr(vdev->vbasedev.name);
> -        goto post_reset;
> +    if (vdev->vbasedev.reset_works && (vdev->has_flr || !vdev->has_pm_reset)) {
> +        if (!ioctl(vdev->vbasedev.fd, VFIO_DEVICE_RESET)) {
> +            trace_vfio_pci_reset_flr(vdev->vbasedev.name);
> +            goto post_reset;
> +        }
> +
> +        error_setg_errno(&err, errno, "Unable to reset device");
>      }
>  
>      /* See if we can do our own bus reset */
> -    if (!vfio_pci_hot_reset_one(vdev)) {
> +    ret = vfio_pci_hot_reset_one(vdev);
> +    if (!ret) {
>          goto post_reset;
>      }
>  
> +    if (!err) {
> +        error_setg_errno(&err, -ret, "Unable to perform bus reset");
> +    }
> +
>      /* If nothing else works and the device supports PM reset, use it */
> -    if (vdev->vbasedev.reset_works && vdev->has_pm_reset &&
> -        !ioctl(vdev->vbasedev.fd, VFIO_DEVICE_RESET)) {
> -        trace_vfio_pci_reset_pm(vdev->vbasedev.name);
> -        goto post_reset;
> +    if (vdev->vbasedev.reset_works && vdev->has_pm_reset) {
> +        /* Prefer to report the ioctl failure mode */
> +        error_free(err);
> +        err = NULL;
> +
> +        if (!ioctl(vdev->vbasedev.fd, VFIO_DEVICE_RESET)) {
> +            trace_vfio_pci_reset_pm(vdev->vbasedev.name);
> +            goto post_reset;
> +        }
> +
> +        error_setg_errno(&err, errno, "Unable to reset device");
>      }
>  
> +    warn_reportf_err(err, VFIO_MSG_PREFIX, vdev->vbasedev.name);
> +    err = NULL;
> +
>  post_reset:
> +    error_free(err);
>      vfio_pci_post_reset(vdev);
>  }
>  
> 


