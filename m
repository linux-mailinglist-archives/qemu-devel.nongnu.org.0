Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24FF7333CD5
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 13:46:44 +0100 (CET)
Received: from localhost ([::1]:34526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJyEd-0006kX-6m
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 07:46:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1lJyDg-0006EY-7H
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 07:45:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40492)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1lJyDd-0007G2-OV
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 07:45:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615380340;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pkMwztTyWX1LCGDuYNx4cXhPBuzJk2iIyVOkqhBAjAM=;
 b=YqPThWVnvrhZRR8u5BYhA+YA9W/LsrcA7aVFLqJTAfjiHan9Bvz/P1jAfq/OeWgIaph3xP
 cHtBwY/2sJ9cQSbs+j48/EJo6RfA3kksdZJQohYlfGa8oTD0AcTTJBRfay2hesqpAxyY9n
 +idh6sS1y/saN5d4tD7ZXLDGE5tJdzc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-92-8uHU_L6uMX-SXYFx8wOVHw-1; Wed, 10 Mar 2021 07:45:37 -0500
X-MC-Unique: 8uHU_L6uMX-SXYFx8wOVHw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 43724801817;
 Wed, 10 Mar 2021 12:45:36 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-115-138.ams2.redhat.com
 [10.36.115.138])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9A84F6062F;
 Wed, 10 Mar 2021 12:45:28 +0000 (UTC)
Subject: Re: [RFC] hw/display: add virtio-ramfb device
To: Gerd Hoffmann <kraxel@redhat.com>, Joelle van Dyne <j@getutm.app>
References: <20210309213513.12925-1-j@getutm.app>
 <20210310095126.fqxigwoczqkckosp@sirius.home.kraxel.org>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <5b8a28d1-5a66-9634-f6fb-5b2bdfcf96f8@redhat.com>
Date: Wed, 10 Mar 2021 13:45:27 +0100
MIME-Version: 1.0
In-Reply-To: <20210310095126.fqxigwoczqkckosp@sirius.home.kraxel.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03/10/21 10:51, Gerd Hoffmann wrote:
> On Tue, Mar 09, 2021 at 01:35:13PM -0800, Joelle van Dyne wrote:
>> Like virtio-vga, but using ramfb instead of legacy vga.
>> Useful for booting from OVMF (with updated drivers) into Windows
>> ARM which expects a linear FB that the virtio-gpu driver in OVMF
>> does not provide.
> 
> What is wrong with "-device ramfb" for that use case?
> 
>> This code was originally written by Gerd Hoffmann and was
>> updated to contain later changes to the display driver tree.
> 
> Well, the tricky part with that is OVMF driver binding.  We don't
> want two drivers bind to the same device.
> 
> We have QemuRamfbDxe + QemuVideoDxe + VirtioGpuDxe.
> 
>  - QemuRamfbDxe handles ramfb.
>  - QemuVideoDxe handles all vga devices (including virtio-vga)
>    plus bochs-display.
>  - VirtioGpuDxe handles all virtio-gpu devices (except virtio-vga).
> 
> VirtioGpuDxe could easily handle virtio-vga too but doesn't to avoid
> the conflict with QemuVideoDxe.  It detects that by looking at the pci
> class code.  virtio-vga is tagged as display/vga whereas virtio-gpu-pci
> is display/other.
> 
> Problem of the virtio-ramfb device is that the guest can't figure
> whenever the virtio-gpu device comes with ramfb support or not.
> Merging this is a non-starter unless we have a solution for that
> problem.
> 
> A use case which actually needs that would be helpful to drive that
> effort.  I don't see one.  If your guest comes with virtio-gpu drivers
> you don't need ramfb support.  The VirtioGpuDxe driver covers the boot
> loader, and the guest driver everything else.  If your guest has no
> virtio-gpu drivers the virtio-ramfb combo device is useless, you can
> simply use standalone ramfb instead.

Thanks for the CC and the summary, and I agree.


Two (tangential) additions:

- The arbitration between VirtioGpuDxe and QemuVideoDxe, on a virtio-vga
device, happens actually in Virtio10Dxe (the virtio-1.0 transport
driver). When Virtio10Dxe recognizes virtio-vga, it does not expose it
as a virtio device at all.

The reason for this is that VirtioGpuDxe consumes VIRTIO_DEVICE_PROTOCOL
(does not deal with PCI [*]), and QemuVideoDxe consumes
EFI_PCI_IO_PROTOCOL (does not deal with virtio). Therefore, the
arbitration needs to happen in a layer that deals with both of those
abstractions at the same time; and that's the virtio transport driver,
which produces VIRTIO_DEVICE_PROTOCOL on top of EFI_PCI_IO_PROTOCOL.

[*] I'm lying a bit here; it does consume PciIo momentarily. But, for
nothing relevant to the UEFI driver model. VirtioGpuDxe *attempts* using
PciIo for formatting the human-readable device name, with the B/D/F in
it; but even if that fails, the driver works just fine (with a less
detailed human-readable device name).

- QemuRamfbDxe is a platform DXE driver, not a UEFI driver that follows
the UEFI driver model. The reason is that the fw_cfg stuff underlying
ramfb is a "platform device" (a singleton one at that), not an
enumerable device.


So, if you combined ramfb with any other (enumerable) display device
into a single device, that would allow the QemuRamfbDxe platform driver
and the other (UEFI) driver to bind the *same display hardware* via
different interfaces at the same time.

And arbitrating between such drivers is practically impossible without
violating the UEFI driver model: first, the QemuRamfbDxe platform driver
has no way of knowing whether the same display hardware qualifies for
the other (UEFI) driver though PCI (or another enumerable interface);
second, the other (UEFI) driver would have to check for a platform
device (fw_cfg in this case), which is *wrong*. (Consider e.g. what
happens if we have multiple (separate) PCI-based display devices, plus
one ramfb device -- if ramfb were allowed to share the underlying
hardware with one of the PCI ones, how would we tell which PCI device
the ramfb device belonged to?)

(... In fact, the second argument is akin to why I keep rejecting
various manifestations of a GVT-g driver for OVMF -- refer to
<https://bugzilla.tianocore.org/show_bug.cgi?id=935>. Due to the
opregion being based on fw_cfg, the hardware itself is a fusion of a PCI
device and a platform device -- and that's wrong for both a platform DXE
driver, and a UEFI driver that follows the UEFI driver model. It's not
that the driver is impossible to implement (three variants have been
written already, mutually independently of each other), but that any
such driver involves a layering / driver model violation one way or
another. But, I digress.)

Thanks
Laszlo


