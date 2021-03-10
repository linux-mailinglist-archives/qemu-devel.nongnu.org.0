Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF54334839
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 20:43:52 +0100 (CET)
Received: from localhost ([::1]:56836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK4kJ-000809-5x
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 14:43:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1lK4gX-00043r-QY
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 14:39:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1lK4gU-00018S-IB
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 14:39:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615405193;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ma0GVA3L5abIs16kOEH3rKT0K6YVxREDih76P1sZlBw=;
 b=R1732zSuyp3mRMaUQJjOJOuX+q3/j9HAOEUCeXVMiShqmAyexcOcCpRJ2Ja+yKB62r4EOc
 r2JinJS2nuI6QBje9p/Rb0RJ+RySkzKm0WKtI6r7vvDLW0+VMkjVgNGM9lOHNF0ErGbPGS
 Y5tXimD8RpEUeu8TKHics1AFEJqcM/w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-577-LmpQYS3sNm-cIVuGx6KgIA-1; Wed, 10 Mar 2021 14:39:50 -0500
X-MC-Unique: LmpQYS3sNm-cIVuGx6KgIA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0C88B108BD0B;
 Wed, 10 Mar 2021 19:39:49 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-115-138.ams2.redhat.com
 [10.36.115.138])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 99E5719C48;
 Wed, 10 Mar 2021 19:39:39 +0000 (UTC)
Subject: Re: [RFC] hw/display: add virtio-ramfb device
To: Joelle van Dyne <j@getutm.app>
References: <20210309213513.12925-1-j@getutm.app>
 <20210310095126.fqxigwoczqkckosp@sirius.home.kraxel.org>
 <5b8a28d1-5a66-9634-f6fb-5b2bdfcf96f8@redhat.com>
 <CA+E+eSDoUWh+U9vENzbB0NCZPWwkBHWmy0grdpUPkZTGZjZfUA@mail.gmail.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <77dfe8fa-f747-57dd-5e8c-4ad9baa6ca39@redhat.com>
Date: Wed, 10 Mar 2021 20:39:38 +0100
MIME-Version: 1.0
In-Reply-To: <CA+E+eSDoUWh+U9vENzbB0NCZPWwkBHWmy0grdpUPkZTGZjZfUA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lersek@redhat.com;
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03/10/21 17:42, Joelle van Dyne wrote:
> On Wed, Mar 10, 2021 at 4:45 AM Laszlo Ersek <lersek@redhat.com> wrote:
>>
>> On 03/10/21 10:51, Gerd Hoffmann wrote:
>>> On Tue, Mar 09, 2021 at 01:35:13PM -0800, Joelle van Dyne wrote:
>>>> Like virtio-vga, but using ramfb instead of legacy vga.
>>>> Useful for booting from OVMF (with updated drivers) into Windows
>>>> ARM which expects a linear FB that the virtio-gpu driver in OVMF
>>>> does not provide.
>>>
>>> What is wrong with "-device ramfb" for that use case?
>>>
>>>> This code was originally written by Gerd Hoffmann and was
>>>> updated to contain later changes to the display driver tree.
>>>
>>> Well, the tricky part with that is OVMF driver binding.  We don't
>>> want two drivers bind to the same device.
>>>
>>> We have QemuRamfbDxe + QemuVideoDxe + VirtioGpuDxe.
>>>
>>>  - QemuRamfbDxe handles ramfb.
>>>  - QemuVideoDxe handles all vga devices (including virtio-vga)
>>>    plus bochs-display.
>>>  - VirtioGpuDxe handles all virtio-gpu devices (except virtio-vga).
>>>
>>> VirtioGpuDxe could easily handle virtio-vga too but doesn't to avoid
>>> the conflict with QemuVideoDxe.  It detects that by looking at the pci
>>> class code.  virtio-vga is tagged as display/vga whereas virtio-gpu-pci
>>> is display/other.
>>>
>>> Problem of the virtio-ramfb device is that the guest can't figure
>>> whenever the virtio-gpu device comes with ramfb support or not.
>>> Merging this is a non-starter unless we have a solution for that
>>> problem.
>>>
>>> A use case which actually needs that would be helpful to drive that
>>> effort.  I don't see one.  If your guest comes with virtio-gpu drivers
>>> you don't need ramfb support.  The VirtioGpuDxe driver covers the boot
>>> loader, and the guest driver everything else.  If your guest has no
>>> virtio-gpu drivers the virtio-ramfb combo device is useless, you can
>>> simply use standalone ramfb instead.
>>
>> Thanks for the CC and the summary, and I agree.
>>
>>
>> Two (tangential) additions:
>>
>> - The arbitration between VirtioGpuDxe and QemuVideoDxe, on a virtio-vga
>> device, happens actually in Virtio10Dxe (the virtio-1.0 transport
>> driver). When Virtio10Dxe recognizes virtio-vga, it does not expose it
>> as a virtio device at all.
>>
>> The reason for this is that VirtioGpuDxe consumes VIRTIO_DEVICE_PROTOCOL
>> (does not deal with PCI [*]), and QemuVideoDxe consumes
>> EFI_PCI_IO_PROTOCOL (does not deal with virtio). Therefore, the
>> arbitration needs to happen in a layer that deals with both of those
>> abstractions at the same time; and that's the virtio transport driver,
>> which produces VIRTIO_DEVICE_PROTOCOL on top of EFI_PCI_IO_PROTOCOL.
>>
>> [*] I'm lying a bit here; it does consume PciIo momentarily. But, for
>> nothing relevant to the UEFI driver model. VirtioGpuDxe *attempts* using
>> PciIo for formatting the human-readable device name, with the B/D/F in
>> it; but even if that fails, the driver works just fine (with a less
>> detailed human-readable device name).
>>
>> - QemuRamfbDxe is a platform DXE driver, not a UEFI driver that follows
>> the UEFI driver model. The reason is that the fw_cfg stuff underlying
>> ramfb is a "platform device" (a singleton one at that), not an
>> enumerable device.
>>
>>
>> So, if you combined ramfb with any other (enumerable) display device
>> into a single device, that would allow the QemuRamfbDxe platform driver
>> and the other (UEFI) driver to bind the *same display hardware* via
>> different interfaces at the same time.
>>
>> And arbitrating between such drivers is practically impossible without
>> violating the UEFI driver model: first, the QemuRamfbDxe platform driver
>> has no way of knowing whether the same display hardware qualifies for
>> the other (UEFI) driver though PCI (or another enumerable interface);
>> second, the other (UEFI) driver would have to check for a platform
>> device (fw_cfg in this case), which is *wrong*. (Consider e.g. what
>> happens if we have multiple (separate) PCI-based display devices, plus
>> one ramfb device -- if ramfb were allowed to share the underlying
>> hardware with one of the PCI ones, how would we tell which PCI device
>> the ramfb device belonged to?)
>>
>> (... In fact, the second argument is akin to why I keep rejecting
>> various manifestations of a GVT-g driver for OVMF -- refer to
>> <https://bugzilla.tianocore.org/show_bug.cgi?id=935>. Due to the
>> opregion being based on fw_cfg, the hardware itself is a fusion of a PCI
>> device and a platform device -- and that's wrong for both a platform DXE
>> driver, and a UEFI driver that follows the UEFI driver model. It's not
>> that the driver is impossible to implement (three variants have been
>> written already, mutually independently of each other), but that any
>> such driver involves a layering / driver model violation one way or
>> another. But, I digress.)
>>
>> Thanks
>> Laszlo
>>
> 
> Thanks for the feedback, Laszlo and Gerd. To avoid the XY problem
> here, what I am trying to solve is that currently there is no good way
> to boot into Windows ARM with virtio-gpu without using ramfb first to
> install the drivers. The only solutions I can think of is:
> 
> * Implement a linear FB in virtio-gpu
> * Hack in ramfb in virtio-gpu
> 
> And the second one seems easier. But perhaps I'm missing some other solutions?

The situation is similar to setting up an x86 Windows guest with an
assigned (discrete) PCIe GPU. At first, one installs the guest with VGA
or QXL (the assigned GPU may or may not be present in the domain config
already). Then the native GPU drivers are installed (usually from
separate media, such as an ISO image). Finally, the in-guest displays
are reconfigured to make the assigned GPU the primary one, and/or the
domain config is modified to remove the VGA (or QXL) device altogether.
(This assumes that the assigned GPU comes with an x86 UEFI GOP driver in
its option ROM.)

In other words, it's fine to have two *separate* pieces of display
hardware (such as two graphics windows), temporarily, until the guest
setup is complete. Similarly to how, in the above GPU assignment
scenario, there is a short time when the x86 Windows guest runs in a
kind of "multi-head" setup (a VGA or QXL display window, and a separate,
dedicated physical monitor output).

So it should be fine to specify both "-device ramfb" and "-device
virtio-gpu-pci" on the QEMU command line. Each firmware driver will bind
each matching device, the firmware graphics console will be multiplexed
to both. When Windows starts, only ramfb will be useful (the Basic
Display Adapter driver should drive it), until virtio-gpu drivers are
manually installed.

If that's inconvenient, then the virtio-gpu driver has to be integrated
into the Windows install media. I vaguely recall that tweaking
"boot.wim" or whatever is (allegedly) possible.

(I saw the hacker news thread on "getutm.app"; I must admit I'm not at
all a fan of the approach highlighted on the website, "QEMU without the
headache", and "UTM was created for macOS and *only* for Apple
platforms", emphasis yours. I disagree that Apple user comfort justifies
contorting the QEMU device model and/or the UEFI driver model. That's
not to say that my opinion necessarily *matters* with regard to QEMU
patches, of course.)

With regard to adding a linear FB to virtio-gpu-pci -- that won't work;
if it worked, we'd just use (a variant of) virtio-vga. The problem is
that, with the framebuffer in a PCI MMIO BAR in the guest, the address
range is marked / mapped as "device memory" (uncacheable) from the guest
side, while it is still mapped as RAM from the host side. The way
aarch64 combines the stage1 and stage2 mappings differs from the x86
combination: on aarch64 (at least without using a special architecture
extension whose name I forget), the strictest mapping takes effect,
while on x86, the host-side mapping takes effect. So in the aarch64
case, framebuffer accesses in the guest go straight to host RAM
(avoiding CPU caches), but in QEMU, framebuffer accesses go through the
CPU caches. You get display corruption as a result. Ramfb avoids this
because the framebuffer in the guest is not mapped from a PCI MMIO BAR,
but from normal guest RAM. IOW, ramfb is a workaround for aarch64
"knowing better" how to combine stage1 and stage2 mappings than x86.

(Disclaimer: I can never remember how stage1 and stage2 map to "host"
vs. "guest"; sorry about that.)

In summary, I recommend using a multi-head setup temporarily (ramfb +
virtio-gpu-pci added as separate devices on the QEMU command line, with
matching separate display *backends*). Once virtio-gpu-pci is working
fine in the Windows guest, ramfb may be removed from the domain config
altogether.

Thanks,
Laszlo


