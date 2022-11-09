Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1ED622600
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 09:59:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osgub-0007ul-Nd; Wed, 09 Nov 2022 03:58:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1osguL-0007pn-1m
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 03:58:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1osguI-0002hE-1l
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 03:58:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667984280;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jx0TX8vqgQdLWLkB/PW4yJqiZESgZnLWExqfi8vJoAU=;
 b=O0Oyc01e25V6KhmEPR0Dl8X1TANI24D1n5rH1i6r0jgOqZ8g07h7J+uKCBnKudEO69vHAJ
 Vrbxmey4RaG/fnZuIKeJEuuxYUU6pKYBQgRNpaH7lwpC8LTGSV8cOGdEZbUZ/TsVVRuoLP
 Sn/IWJ0bhHMckJ7yUa4cVCbEQCE959Y=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-18-iVOW_23bMeeKrqW_yL-O_A-1; Wed, 09 Nov 2022 03:56:43 -0500
X-MC-Unique: iVOW_23bMeeKrqW_yL-O_A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6E3451C05131;
 Wed,  9 Nov 2022 08:56:43 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (unknown [10.39.192.117])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 88AD4C16922;
 Wed,  9 Nov 2022 08:56:41 +0000 (UTC)
Subject: Re: [PULL v4 29/83] virtio: introduce virtio_queue_enable()
To: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>
Cc: Stefan Hajnoczi <stefanha@gmail.com>,
 Kangjie Xu <kangjie.xu@linux.alibaba.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Gerd Hoffmann <kraxel@redhat.com>
References: <20221107224600.934080-1-mst@redhat.com>
 <20221107224600.934080-30-mst@redhat.com>
 <CAJSP0QX7Q9K5fmxQuHNY9uKtuRGitc5d6jhnk1s+MdykVBkr6Q@mail.gmail.com>
 <CACGkMEva+AEybODA4aWZj1My=P8ZJMZLn9=MLo0ZFJuqdmooTg@mail.gmail.com>
 <20221109014751-mutt-send-email-mst@kernel.org>
 <20221109015532-mutt-send-email-mst@kernel.org>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <ad04a8b3-b07d-a259-0b33-261f5784e48d@redhat.com>
Date: Wed, 9 Nov 2022 09:56:40 +0100
MIME-Version: 1.0
In-Reply-To: <20221109015532-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lersek@redhat.com;
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

On 11/09/22 07:59, Michael S. Tsirkin wrote:
> On Wed, Nov 09, 2022 at 01:52:01AM -0500, Michael S. Tsirkin wrote:
>> On Wed, Nov 09, 2022 at 11:31:23AM +0800, Jason Wang wrote:
>>> On Wed, Nov 9, 2022 at 3:43 AM Stefan Hajnoczi <stefanha@gmail.com> wrote:
>>>>
>>>> On Mon, 7 Nov 2022 at 18:10, Michael S. Tsirkin <mst@redhat.com> wrote:
>>>>>
>>>>> From: Kangjie Xu <kangjie.xu@linux.alibaba.com>
>>>>>
>>>>> Introduce the interface queue_enable() in VirtioDeviceClass and the
>>>>> fucntion virtio_queue_enable() in virtio, it can be called when
>>>>> VIRTIO_PCI_COMMON_Q_ENABLE is written and related virtqueue can be
>>>>> started. It only supports the devices of virtio 1 or later. The
>>>>> not-supported devices can only start the virtqueue when DRIVER_OK.
>>>>>
>>>>> Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
>>>>> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
>>>>> Acked-by: Jason Wang <jasowang@redhat.com>
>>>>> Message-Id: <20221017092558.111082-4-xuanzhuo@linux.alibaba.com>
>>>>> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
>>>>> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
>>>>> ---
>>>>>  include/hw/virtio/virtio.h |  2 ++
>>>>>  hw/virtio/virtio.c         | 14 ++++++++++++++
>>>>>  2 files changed, 16 insertions(+)
>>>>>
>>>>> diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
>>>>> index 74d76c1dbc..b00b3fcf31 100644
>>>>> --- a/include/hw/virtio/virtio.h
>>>>> +++ b/include/hw/virtio/virtio.h
>>>>> @@ -149,6 +149,7 @@ struct VirtioDeviceClass {
>>>>>      void (*reset)(VirtIODevice *vdev);
>>>>>      void (*set_status)(VirtIODevice *vdev, uint8_t val);
>>>>>      void (*queue_reset)(VirtIODevice *vdev, uint32_t queue_index);
>>>>> +    void (*queue_enable)(VirtIODevice *vdev, uint32_t queue_index);
>>>>>      /* For transitional devices, this is a bitmap of features
>>>>>       * that are only exposed on the legacy interface but not
>>>>>       * the modern one.
>>>>> @@ -288,6 +289,7 @@ int virtio_queue_set_host_notifier_mr(VirtIODevice *vdev, int n,
>>>>>  int virtio_set_status(VirtIODevice *vdev, uint8_t val);
>>>>>  void virtio_reset(void *opaque);
>>>>>  void virtio_queue_reset(VirtIODevice *vdev, uint32_t queue_index);
>>>>> +void virtio_queue_enable(VirtIODevice *vdev, uint32_t queue_index);
>>>>>  void virtio_update_irq(VirtIODevice *vdev);
>>>>>  int virtio_set_features(VirtIODevice *vdev, uint64_t val);
>>>>>
>>>>> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
>>>>> index cf5f9ca387..9683b2e158 100644
>>>>> --- a/hw/virtio/virtio.c
>>>>> +++ b/hw/virtio/virtio.c
>>>>> @@ -2495,6 +2495,20 @@ void virtio_queue_reset(VirtIODevice *vdev, uint32_t queue_index)
>>>>>      __virtio_queue_reset(vdev, queue_index);
>>>>>  }
>>>>>
>>>>> +void virtio_queue_enable(VirtIODevice *vdev, uint32_t queue_index)
>>>>> +{
>>>>> +    VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
>>>>> +
>>>>> +    if (!virtio_vdev_has_feature(vdev, VIRTIO_F_VERSION_1)) {
>>>>> +        error_report("queue_enable is only suppported in devices of virtio "
>>>>> +                     "1.0 or later.");
>>>>
>>>> Why is this triggering here? Maybe virtio_queue_enable() is called too
>>>> early. I have verified that the Linux guest driver sets VERSION_1. I
>>>> didn't check what SeaBIOS does.
>>>
>>> Looks like a bug, we should check device features here at least and it
>>> should be guest errors instead of error_report() here.
>>>
>>> Thanks
>>
>> But it's weird, queue enable is written before guest features?
>> How come?
>
> It's a bios bug:
>
>
>
>     vp_init_simple(&vdrive->vp, pci);
>     if (vp_find_vq(&vdrive->vp, 0, &vdrive->vq) < 0 ) {
>         dprintf(1, "fail to find vq for virtio-blk %pP\n", pci);
>         goto fail;
>     }
>
>     if (vdrive->vp.use_modern) {
>         struct vp_device *vp = &vdrive->vp;
>         u64 features = vp_get_features(vp);
>         u64 version1 = 1ull << VIRTIO_F_VERSION_1;
>         u64 iommu_platform = 1ull << VIRTIO_F_IOMMU_PLATFORM;
>         u64 blk_size = 1ull << VIRTIO_BLK_F_BLK_SIZE;
>         if (!(features & version1)) {
>             dprintf(1, "modern device without virtio_1 feature bit: %pP\n", pci);
>             goto fail;
>         }
>
>         features = features & (version1 | iommu_platform | blk_size);
>         vp_set_features(vp, features);
>         status |= VIRTIO_CONFIG_S_FEATURES_OK;
>         vp_set_status(vp, status);
>
>
>
> Not good - does not match the spec. Here's what the spec says:
>
>
> The driver MUST follow this sequence to initialize a device:
> 1. Reset the device.
> 2. Set the ACKNOWLEDGE status bit: the guest OS has noticed the device.
> 3. Set the DRIVER status bit: the guest OS knows how to drive the device.
> 4. Read device feature bits, and write the subset of feature bits understood by the OS and driver to the
> device. During this step the driver MAY read (but MUST NOT write) the device-specific configuration
> fields to check that it can support the device before accepting it.
> 5. Set the FEATURES_OK status bit. The driver MUST NOT accept new feature bits after this step.
> 6. Re-read device status to ensure the FEATURES_OK bit is still set: otherwise, the device does not
> support our subset of features and the device is unusable.
> 7. Perform device-specific setup, including discovery of virtqueues for the device, optional per-bus setup,
> reading and possibly writing the device’s virtio configuration space, and population of virtqueues.
> 8. Set the DRIVER_OK status bit. At this point the device is “live”.

Thanks for the Cc.

This should work properly in the edk2 (OVMF) guest drivers. When I
started work on the virtio-1.0 implementation, I noticed that the device
initialization sequence that guest drivers needed to follow had
*changed* from spec version 0.9.5 to spec version 1.0.

For example, in the virtio-rng driver, I addressed that with commit
0a781bdc7f87 ("OvmfPkg: VirtioRngDxe: adapt feature negotiation to
virtio-1.0", 2016-04-06):

  https://github.com/tianocore/edk2/commit/0a781bdc7f87

Therefore we have a larger context like this in edk2 (again the excerpt
is from the virtio-rng driver, but all drivers follow this pattern whose
devices can be either legacy or modern):

>   //
>   // Execute virtio-0.9.5, 2.2.1 Device Initialization Sequence.
>   //
>   NextDevStat = 0;             // step 1 -- reset device
>   Status      = Dev->VirtIo->SetDeviceStatus (Dev->VirtIo, NextDevStat);
>   if (EFI_ERROR (Status)) {
>     goto Failed;
>   }

matches v1.0 spec step 1.

>
>   NextDevStat |= VSTAT_ACK;    // step 2 -- acknowledge device presence
>   Status       = Dev->VirtIo->SetDeviceStatus (Dev->VirtIo, NextDevStat);
>   if (EFI_ERROR (Status)) {
>     goto Failed;
>   }

matches v1.0 spec step 2.

>
>   NextDevStat |= VSTAT_DRIVER; // step 3 -- we know how to drive it
>   Status       = Dev->VirtIo->SetDeviceStatus (Dev->VirtIo, NextDevStat);
>   if (EFI_ERROR (Status)) {
>     goto Failed;
>   }

matches v1.0 spec step 3.

>
>   //
>   // Set Page Size - MMIO VirtIo Specific
>   //
>   Status = Dev->VirtIo->SetPageSize (Dev->VirtIo, EFI_PAGE_SIZE);
>   if (EFI_ERROR (Status)) {
>     goto Failed;
>   }
>
>   //
>   // step 4a -- retrieve and validate features
>   //
>   Status = Dev->VirtIo->GetDeviceFeatures (Dev->VirtIo, &Features);
>   if (EFI_ERROR (Status)) {
>     goto Failed;
>   }

matches v1.0 spec step 4, the "read" part

>
>   Features &= VIRTIO_F_VERSION_1 | VIRTIO_F_IOMMU_PLATFORM;
>
>   //
>   // In virtio-1.0, feature negotiation is expected to complete before queue
>   // discovery, and the device can also reject the selected set of features.
>   //
>   if (Dev->VirtIo->Revision >= VIRTIO_SPEC_REVISION (1, 0, 0)) {
>     Status = Virtio10WriteFeatures (Dev->VirtIo, Features, &NextDevStat);
>     if (EFI_ERROR (Status)) {
>       goto Failed;
>     }
>   }

This is skipped for virtio-0.9.5. For virtio-1.0,
Virtio10WriteFeatures() does the following:

>   Status = VirtIo->SetGuestFeatures (VirtIo, Features);
>   if (EFI_ERROR (Status)) {
>     return Status;
>   }

Covers v1.0 spec step 4, the rest of it.

>
>   *DeviceStatus |= VSTAT_FEATURES_OK;
>   Status         = VirtIo->SetDeviceStatus (VirtIo, *DeviceStatus);
>   if (EFI_ERROR (Status)) {
>     return Status;
>   }

Covers v1.0 spec step 5.

>
>   Status = VirtIo->GetDeviceStatus (VirtIo, DeviceStatus);
>   if (EFI_ERROR (Status)) {
>     return Status;
>   }
>
>   if ((*DeviceStatus & VSTAT_FEATURES_OK) == 0) {
>     Status = EFI_UNSUPPORTED;
>   }

Covers v1.0 spec step 6.

OK, return to the previous call frame:

>
>   //
>   // step 4b -- allocate request virtqueue, just use #0
>   //
>   Status = Dev->VirtIo->SetQueueSel (Dev->VirtIo, 0);
>   if (EFI_ERROR (Status)) {
>     goto Failed;
>   }
>
>   Status = Dev->VirtIo->GetQueueNumMax (Dev->VirtIo, &QueueSize);
>   if (EFI_ERROR (Status)) {
>     goto Failed;
>   }
>
>   //
>   // VirtioRngGetRNG() uses one descriptor
>   //
>   if (QueueSize < 1) {
>     Status = EFI_UNSUPPORTED;
>     goto Failed;
>   }
>
>   Status = VirtioRingInit (Dev->VirtIo, QueueSize, &Dev->Ring);
>   if (EFI_ERROR (Status)) {
>     goto Failed;
>   }
>
>   //
>   // If anything fails from here on, we must release the ring resources.
>   //
>   Status = VirtioRingMap (
>              Dev->VirtIo,
>              &Dev->Ring,
>              &RingBaseShift,
>              &Dev->RingMap
>              );
>   if (EFI_ERROR (Status)) {
>     goto ReleaseQueue;
>   }
>
>   //
>   // Additional steps for MMIO: align the queue appropriately, and set the
>   // size. If anything fails from here on, we must unmap the ring resources.
>   //
>   Status = Dev->VirtIo->SetQueueNum (Dev->VirtIo, QueueSize);
>   if (EFI_ERROR (Status)) {
>     goto UnmapQueue;
>   }
>
>   Status = Dev->VirtIo->SetQueueAlign (Dev->VirtIo, EFI_PAGE_SIZE);
>   if (EFI_ERROR (Status)) {
>     goto UnmapQueue;
>   }
>
>   //
>   // step 4c -- Report GPFN (guest-physical frame number) of queue.
>   //
>   Status = Dev->VirtIo->SetQueueAddress (
>                           Dev->VirtIo,
>                           &Dev->Ring,
>                           RingBaseShift
>                           );
>   if (EFI_ERROR (Status)) {
>     goto UnmapQueue;
>   }

These cover v1.0 spec step 7.

>
>   //
>   // step 5 -- Report understood features and guest-tuneables.
>   //
>   if (Dev->VirtIo->Revision < VIRTIO_SPEC_REVISION (1, 0, 0)) {
>     Features &= ~(UINT64)(VIRTIO_F_VERSION_1 | VIRTIO_F_IOMMU_PLATFORM);
>     Status    = Dev->VirtIo->SetGuestFeatures (Dev->VirtIo, Features);
>     if (EFI_ERROR (Status)) {
>       goto UnmapQueue;
>     }
>   }

This is exclusive to virtio-0.9.5; the "step 5" reference in the comment
pertains to that spec version. In virtio-0.9.5, this is the location
(just before setting DRIVER_OK) where the guest driver has to report its
desired features (and the device has no means to reject any feature set
that is otherwise a subset of the host feature set).

>
>   //
>   // step 6 -- initialization complete
>   //
>   NextDevStat |= VSTAT_DRIVER_OK;
>   Status       = Dev->VirtIo->SetDeviceStatus (Dev->VirtIo, NextDevStat);
>   if (EFI_ERROR (Status)) {
>     goto UnmapQueue;
>   }

This covers v1.0 spec step 8 (and v0.9.5 spec step 6, as the comment
shows).

Now, in drivers whose devices are virtio-1.0-only, such as
virtio-gpu-pci, vhost-user-fs-pci, this "selectivity" is not there. The
virtio-0.9.5 branch is simply eliminated, and the virtio-1.0 logic is
unconditional. Additionally, in those drivers, the "step" references in
the code comments match the v1.0 bullet list. For example, in the
virtio-fs driver:

> EFI_STATUS
> VirtioFsInit (
>   IN OUT VIRTIO_FS  *VirtioFs
>   )
> {
>   UINT8             NextDevStat;
>   EFI_STATUS        Status;
>   UINT64            Features;
>   VIRTIO_FS_CONFIG  Config;
>   UINTN             Idx;
>   UINT64            RingBaseShift;
>
>   //
>   // Execute virtio-v1.1-cs01-87fa6b5d8155, 3.1.1 Driver Requirements: Device
>   // Initialization.
>   //
>   // 1. Reset the device.
>   //
>   NextDevStat = 0;
>   Status      = VirtioFs->Virtio->SetDeviceStatus (VirtioFs->Virtio, NextDevStat);
>   if (EFI_ERROR (Status)) {
>     goto Failed;
>   }
>
>   //
>   // 2. Set the ACKNOWLEDGE status bit [...]
>   //
>   NextDevStat |= VSTAT_ACK;
>   Status       = VirtioFs->Virtio->SetDeviceStatus (VirtioFs->Virtio, NextDevStat);
>   if (EFI_ERROR (Status)) {
>     goto Failed;
>   }
>
>   //
>   // 3. Set the DRIVER status bit [...]
>   //
>   NextDevStat |= VSTAT_DRIVER;
>   Status       = VirtioFs->Virtio->SetDeviceStatus (VirtioFs->Virtio, NextDevStat);
>   if (EFI_ERROR (Status)) {
>     goto Failed;
>   }
>
>   //
>   // 4. Read device feature bits...
>   //
>   Status = VirtioFs->Virtio->GetDeviceFeatures (VirtioFs->Virtio, &Features);
>   if (EFI_ERROR (Status)) {
>     goto Failed;
>   }
>
>   if ((Features & VIRTIO_F_VERSION_1) == 0) {
>     Status = EFI_UNSUPPORTED;
>     goto Failed;
>   }
>
>   //
>   // No device-specific feature bits have been defined in file "virtio-fs.tex"
>   // of the virtio spec at <https://github.com/oasis-tcs/virtio-spec.git>, as
>   // of commit 87fa6b5d8155.
>   //
>   Features &= VIRTIO_F_VERSION_1 | VIRTIO_F_IOMMU_PLATFORM;
>
>   //
>   // ... and write the subset of feature bits understood by the [...] driver to
>   // the device. [...]
>   // 5. Set the FEATURES_OK status bit.
>   // 6. Re-read device status to ensure the FEATURES_OK bit is still set [...]
>   //
>   Status = Virtio10WriteFeatures (VirtioFs->Virtio, Features, &NextDevStat);
>   if (EFI_ERROR (Status)) {
>     goto Failed;
>   }
>
>   //
>   // 7. Perform device-specific setup, including discovery of virtqueues for
>   // the device, [...] reading [...] the device's virtio configuration space
>   //
>   Status = VirtioFsReadConfig (VirtioFs->Virtio, &Config);
>   if (EFI_ERROR (Status)) {
>     goto Failed;
>   }
>
>   //
>   // 7.a. Convert the filesystem label from UTF-8 to UCS-2. Only labels with
>   // printable ASCII code points (U+0020 through U+007E) are supported.
>   // NUL-terminate at either the terminator we find, or right after the
>   // original label.
>   //
>   for (Idx = 0; Idx < VIRTIO_FS_TAG_BYTES && Config.Tag[Idx] != '\0'; Idx++) {
>     if ((Config.Tag[Idx] < 0x20) || (Config.Tag[Idx] > 0x7E)) {
>       Status = EFI_UNSUPPORTED;
>       goto Failed;
>     }
>
>     VirtioFs->Label[Idx] = Config.Tag[Idx];
>   }
>
>   VirtioFs->Label[Idx] = L'\0';
>
>   //
>   // 7.b. We need one queue for sending normal priority requests.
>   //
>   if (Config.NumReqQueues < 1) {
>     Status = EFI_UNSUPPORTED;
>     goto Failed;
>   }
>
>   //
>   // 7.c. Fetch and remember the number of descriptors we can place on the
>   // queue at once. We'll need two descriptors per request, as a minimum --
>   // request header, response header.
>   //
>   Status = VirtioFs->Virtio->SetQueueSel (
>                                VirtioFs->Virtio,
>                                VIRTIO_FS_REQUEST_QUEUE
>                                );
>   if (EFI_ERROR (Status)) {
>     goto Failed;
>   }
>
>   Status = VirtioFs->Virtio->GetQueueNumMax (
>                                VirtioFs->Virtio,
>                                &VirtioFs->QueueSize
>                                );
>   if (EFI_ERROR (Status)) {
>     goto Failed;
>   }
>
>   if (VirtioFs->QueueSize < 2) {
>     Status = EFI_UNSUPPORTED;
>     goto Failed;
>   }
>
>   //
>   // 7.d. [...] population of virtqueues [...]
>   //
>   Status = VirtioRingInit (
>              VirtioFs->Virtio,
>              VirtioFs->QueueSize,
>              &VirtioFs->Ring
>              );
>   if (EFI_ERROR (Status)) {
>     goto Failed;
>   }
>
>   Status = VirtioRingMap (
>              VirtioFs->Virtio,
>              &VirtioFs->Ring,
>              &RingBaseShift,
>              &VirtioFs->RingMap
>              );
>   if (EFI_ERROR (Status)) {
>     goto ReleaseQueue;
>   }
>
>   Status = VirtioFs->Virtio->SetQueueAddress (
>                                VirtioFs->Virtio,
>                                &VirtioFs->Ring,
>                                RingBaseShift
>                                );
>   if (EFI_ERROR (Status)) {
>     goto UnmapQueue;
>   }
>
>   //
>   // 8. Set the DRIVER_OK status bit.
>   //
>   NextDevStat |= VSTAT_DRIVER_OK;
>   Status       = VirtioFs->Virtio->SetDeviceStatus (VirtioFs->Virtio, NextDevStat);
>   if (EFI_ERROR (Status)) {
>     goto UnmapQueue;
>   }
>
>   return EFI_SUCCESS;
>
> UnmapQueue:
>   VirtioFs->Virtio->UnmapSharedBuffer (VirtioFs->Virtio, VirtioFs->RingMap);
>
> ReleaseQueue:
>   VirtioRingUninit (VirtioFs->Virtio, &VirtioFs->Ring);
>
> Failed:
>   //
>   // If any of these steps go irrecoverably wrong, the driver SHOULD set the
>   // FAILED status bit to indicate that it has given up on the device (it can
>   // reset the device later to restart if desired). [...]
>   //
>   // Virtio access failure here should not mask the original error.
>   //
>   NextDevStat |= VSTAT_FAILED;
>   VirtioFs->Virtio->SetDeviceStatus (VirtioFs->Virtio, NextDevStat);
>
>   return Status;
> }

In the virtio-gpu driver:

> EFI_STATUS
> VirtioGpuInit (
>   IN OUT VGPU_DEV  *VgpuDev
>   )
> {
>   UINT8       NextDevStat;
>   EFI_STATUS  Status;
>   UINT64      Features;
>   UINT16      QueueSize;
>   UINT64      RingBaseShift;
>
>   //
>   // Execute virtio-v1.0-cs04, 3.1.1 Driver Requirements: Device
>   // Initialization.
>   //
>   // 1. Reset the device.
>   //
>   NextDevStat = 0;
>   Status      = VgpuDev->VirtIo->SetDeviceStatus (VgpuDev->VirtIo, NextDevStat);
>   if (EFI_ERROR (Status)) {
>     goto Failed;
>   }
>
>   //
>   // 2. Set the ACKNOWLEDGE status bit [...]
>   //
>   NextDevStat |= VSTAT_ACK;
>   Status       = VgpuDev->VirtIo->SetDeviceStatus (VgpuDev->VirtIo, NextDevStat);
>   if (EFI_ERROR (Status)) {
>     goto Failed;
>   }
>
>   //
>   // 3. Set the DRIVER status bit [...]
>   //
>   NextDevStat |= VSTAT_DRIVER;
>   Status       = VgpuDev->VirtIo->SetDeviceStatus (VgpuDev->VirtIo, NextDevStat);
>   if (EFI_ERROR (Status)) {
>     goto Failed;
>   }
>
>   //
>   // 4. Read device feature bits...
>   //
>   Status = VgpuDev->VirtIo->GetDeviceFeatures (VgpuDev->VirtIo, &Features);
>   if (EFI_ERROR (Status)) {
>     goto Failed;
>   }
>
>   if ((Features & VIRTIO_F_VERSION_1) == 0) {
>     Status = EFI_UNSUPPORTED;
>     goto Failed;
>   }
>
>   //
>   // We only want the most basic 2D features.
>   //
>   Features &= VIRTIO_F_VERSION_1 | VIRTIO_F_IOMMU_PLATFORM;
>
>   //
>   // ... and write the subset of feature bits understood by the [...] driver to
>   // the device. [...]
>   // 5. Set the FEATURES_OK status bit.
>   // 6. Re-read device status to ensure the FEATURES_OK bit is still set [...]
>   //
>   Status = Virtio10WriteFeatures (VgpuDev->VirtIo, Features, &NextDevStat);
>   if (EFI_ERROR (Status)) {
>     goto Failed;
>   }
>
>   //
>   // 7. Perform device-specific setup, including discovery of virtqueues for
>   // the device [...]
>   //
>   Status = VgpuDev->VirtIo->SetQueueSel (
>                               VgpuDev->VirtIo,
>                               VIRTIO_GPU_CONTROL_QUEUE
>                               );
>   if (EFI_ERROR (Status)) {
>     goto Failed;
>   }
>
>   Status = VgpuDev->VirtIo->GetQueueNumMax (VgpuDev->VirtIo, &QueueSize);
>   if (EFI_ERROR (Status)) {
>     goto Failed;
>   }
>
>   //
>   // We implement each VirtIo GPU command that we use with two descriptors:
>   // request, response.
>   //
>   if (QueueSize < 2) {
>     Status = EFI_UNSUPPORTED;
>     goto Failed;
>   }
>
>   //
>   // [...] population of virtqueues [...]
>   //
>   Status = VirtioRingInit (VgpuDev->VirtIo, QueueSize, &VgpuDev->Ring);
>   if (EFI_ERROR (Status)) {
>     goto Failed;
>   }
>
>   //
>   // If anything fails from here on, we have to release the ring.
>   //
>   Status = VirtioRingMap (
>              VgpuDev->VirtIo,
>              &VgpuDev->Ring,
>              &RingBaseShift,
>              &VgpuDev->RingMap
>              );
>   if (EFI_ERROR (Status)) {
>     goto ReleaseQueue;
>   }
>
>   //
>   // If anything fails from here on, we have to unmap the ring.
>   //
>   Status = VgpuDev->VirtIo->SetQueueAddress (
>                               VgpuDev->VirtIo,
>                               &VgpuDev->Ring,
>                               RingBaseShift
>                               );
>   if (EFI_ERROR (Status)) {
>     goto UnmapQueue;
>   }
>
>   //
>   // 8. Set the DRIVER_OK status bit.
>   //
>   NextDevStat |= VSTAT_DRIVER_OK;
>   Status       = VgpuDev->VirtIo->SetDeviceStatus (VgpuDev->VirtIo, NextDevStat);
>   if (EFI_ERROR (Status)) {
>     goto UnmapQueue;
>   }
>
>   return EFI_SUCCESS;
>
> UnmapQueue:
>   VgpuDev->VirtIo->UnmapSharedBuffer (VgpuDev->VirtIo, VgpuDev->RingMap);
>
> ReleaseQueue:
>   VirtioRingUninit (VgpuDev->VirtIo, &VgpuDev->Ring);
>
> Failed:
>   //
>   // If any of these steps go irrecoverably wrong, the driver SHOULD set the
>   // FAILED status bit to indicate that it has given up on the device (it can
>   // reset the device later to restart if desired). [...]
>   //
>   // VirtIo access failure here should not mask the original error.
>   //
>   NextDevStat |= VSTAT_FAILED;
>   VgpuDev->VirtIo->SetDeviceStatus (VgpuDev->VirtIo, NextDevStat);
>
>   return Status;
> }

Laszlo


