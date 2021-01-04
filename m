Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 567712E9C6E
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jan 2021 18:58:11 +0100 (CET)
Received: from localhost ([::1]:50534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwU7N-00025b-Ky
	for lists+qemu-devel@lfdr.de; Mon, 04 Jan 2021 12:58:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1kwU5A-0000dP-QH
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 12:55:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1kwU58-0001BE-Fo
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 12:55:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609782949;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9mXoFCDp0RtdkSAn4ZlTFmxvZ9+o4RD78/6RtEUDLiA=;
 b=RRO3H7Qdgb0yLPKsh+AZKyScUBx0ymF4sDc9MaF9HXhyLFp2x9x7z/qkW1dIrPmoUCfjHI
 dotx6+t/5Wp4syp8UyA+aJO5jvBwi8AxXCNBVnz1t7KjDXtOwhEd35nDnaETUG26lTsWer
 Du9xMQDKNGckIzZlwdvDEudA05rHIVQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-359-RN1fdrzdOeWZV4pHf-QCAw-1; Mon, 04 Jan 2021 12:55:45 -0500
X-MC-Unique: RN1fdrzdOeWZV4pHf-QCAw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3E4CA800D53;
 Mon,  4 Jan 2021 17:55:44 +0000 (UTC)
Received: from omen.home (ovpn-112-183.phx2.redhat.com [10.3.112.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E47CE614F5;
 Mon,  4 Jan 2021 17:55:43 +0000 (UTC)
Date: Mon, 4 Jan 2021 10:55:43 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [Question] SR-IOV VF 'surprise removal' and vfio_reset behavior
 in pSeries
Message-ID: <20210104105543.2d679afb@omen.home>
In-Reply-To: <6fd0ed1a-0ac8-af97-88ad-ffaba34e92e6@gmail.com>
References: <6fd0ed1a-0ac8-af97-88ad-ffaba34e92e6@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 4 Jan 2021 10:35:45 -0300
Daniel Henrique Barboza <danielhb413@gmail.com> wrote:

> Hi,
> 
> This question came up while I was investigating a Libvirt bug [1], where an user is removing
> VFs from the host while Libvirt domains was using them, causing Libvirt to remain in
> an inconsistent state. I'm trying to alleviate the effects of this in Libvirt (see [2] if curious),
> but QEMU is throwing some messages in the terminal that, although it appears to be benign,
> I'm not sure if it's a symptom of something that should be fixed.
> 
> In a Power 9 server running a Mellanox MT28800 SR-IOV netcard I have the following IOMMU
> settings, where the physical card is at Group 0 and all the VFs are allocated from Group 12 and
> onwards:
> 
> IOMMU Group 0 0000:01:00.0 Infiniband controller [0207]: Mellanox Technologies MT28800 Family [ConnectX-5 Ex] [15b3:1019]
> (...)
> IOMMU Group 12 0000:01:00.2 Infiniband controller [0207]: Mellanox Technologies MT27800 Family [ConnectX-5 Virtual Function] [15b3:1018]
> IOMMU Group 13 0000:01:00.3 Infiniband controller [0207]: Mellanox Technologies MT27800 Family [ConnectX-5 Virtual Function] [15b3:1018]
> (...)
> 
> 
> Creating a guest with the Group 12 VF and trying to remove the VF from the host via
> 
> echo 0 > /sys/bus/pci/devices/0000\:01\:00.0/sriov_numvfs


FWIW, "surprise" removal is when the device is essentially already
removed, for example a hotplug NVMe drive that is simply yanked out of
the slot.  What you're describing in the above is a coordinated
removal where the PF driver will issue removal callbacks for each VF
device to ask the driver to unbind.

> Makes the guest remove the VF card, but throwing a warning/error message in QEMU log:
> 
> "qemu-system-ppc64: vfio: Cannot reset device 0000:01:00.2, depends on group 0 which is not owned."

This looks like QEMU has hit the but reset code, where a bus reset of a
VF would necessarily require owning the PF, but VFs should always
support FLR.  I note that QEMU will try a bus reset if the
VFIO_DEVICE_RESET ioctl fails, which is where we'd try the FLR.  I
wonder if we're taking this path simply because locking issues in the
kernel prevent us from performing an FLR in this code path (ie. when
userspace is releasing the device from the driver remove callback).

> I found this message confusing because the VF was occupying IOMMU group 12, but the message is
> claiming that the reset wasn't possible because Group 0 wasn't owned by the process.

A bus reset would affect all the devices in the slot and therefore
requires ownership of all devices in the slot, but QEMU doesn't own the
PF.

> Digging it a bit, the hotunplug is fired up via the poweroff state of the card triggering pSeries internals,
> and then reaching spapr_pci_unplug() in hw/ppc/spapr_pci.c. The body of the function reads:
> 
> -------
>      /* some version guests do not wait for completion of a device
>       * cleanup (generally done asynchronously by the kernel) before
>       * signaling to QEMU that the device is safe, but instead sleep
>       * for some 'safe' period of time. unfortunately on a busy host
>       * this sleep isn't guaranteed to be long enough, resulting in
>       * bad things like IRQ lines being left asserted during final
>       * device removal. to deal with this we call reset just prior
>       * to finalizing the device, which will put the device back into
>       * an 'idle' state, as the device cleanup code expects.
>       */
>      pci_device_reset(PCI_DEVICE(plugged_dev));
> -------
> 
> My first question is right at this point: do we need PCI reset for a VF removal?  I am not sure about
> handling IRQ lines asserted for a device that the kernel is going to remove.

I can't speak to this specific code, but it's not uncommon to reset a
device in order to quiesce it.  For a VF, it should be sufficient to
disable bus master to quiesce any interrupts since it would only
support MSI/X based interrupts.
 
> Going on further to the origin on the warning message we get to hw/vfio/pci.c, vfio_pci_hot_reset().
> The VFIO_DEVICE_GET_PCI_HOT_RESET_INFO ioctl() is returning all VFs of the card, including
> the physical function, in the vfio_pci_hot_reset_info struct. Then, down where it verifies if all
> IOMMU groups required for reset belongs to the process, it fails to reset the VF because QEMU
> does not have Group 0 ownership:
> 
> -------
>      ret = ioctl(vdev->vbasedev.fd, VFIO_DEVICE_GET_PCI_HOT_RESET_INFO, info);
>      if (ret) {
>          ret = -errno;
>          error_report("vfio: hot reset info failed: %m");
>          goto out_single;
>      }
> 
> (...)
> 
>          QLIST_FOREACH(group, &vfio_group_list, next) {
>              if (group->groupid == devices[i].group_id) {
>                  break;
>              }
>          }
> 
>          if (!group) {
>              if (!vdev->has_pm_reset) {
>                  error_report("vfio: Cannot reset device %s, "
>                               "depends on group %d which is not owned.",
>                               vdev->vbasedev.name, devices[i].group_id);
>              }
>              ret = -EPERM;
>              goto out;
>          }
> -------
> 
> This message is not clear to me because I'm aware that the VF was in Group 12, but apparently the
> code is demanding ownership of all IOMMU Groups related to the card to allow the reset.

Yup, we're in a failure path, this is never going to work for a VF, see:

static void vfio_pci_reset(DeviceState *dev)
{
    ...
    if (vdev->vbasedev.reset_works &&
        (vdev->has_flr || !vdev->has_pm_reset) &&
        !ioctl(vdev->vbasedev.fd, VFIO_DEVICE_RESET)) {

// This would work in the normal case, but in the kernel the try-locks are
// probably failing due to the device lock held by the remove callback path
// causing us to call into the bus reset path below.

        trace_vfio_pci_reset_flr(vdev->vbasedev.name);
        goto post_reset;
    }

    /* See if we can do our own bus reset */
    if (!vfio_pci_hot_reset_one(vdev)) {
        goto post_reset;
    }

AFAICT, this is undesirable, but harmless.  Ideally we could rework
some of the device lock code in the kernel to allow this to work, but
for now we just use try-locks to avoid deadlock and report failure if
we can't acquire the locks.  Potentially QEMU could look at the -EAGAIN
return value of the ioctl() and assume that it should skip the bus
reset attempt, which might just have a different warning, but
essentially leaving the device in the same state as it is now.

> The second question: is this intended?  If not, then someone is behaving badly (perhaps the card driver,
> mlx5_core) and reporting wrong info to that VFIO ioctl(). If this reset behavior is intended, then I
> might insert a code in spapr_pci_unplug() to skip resetting the VF in this particular case to avoid the
> error message (assuming that we really can live without a reset in this case).

It's not intended, it's a side-effect of the device lock in the kernel
being difficult to workaround in this code path resulting in the
VFIO_DEVICE_RESET ioctl failing.  It's not unique to VFs either.  The
only thing I can suggest, barring tackling the device lock issues in
the kernel, would be to set a flag on the VFIOPCIDevice in
vfio_req_notifier_handler() that suppresses warnings in the reset path.
Thanks,

Alex


