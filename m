Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7144F583B83
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 11:50:18 +0200 (CEST)
Received: from localhost ([::1]:59946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oH09n-0002wJ-Im
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 05:50:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1oGzWC-0002oK-L6
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 05:09:27 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:45190)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1oGzWA-00069Q-4h
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 05:09:20 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7E8585C0F5;
 Thu, 28 Jul 2022 09:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1658999356; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LENLZc2rDo4fL7gSt/oUH1P+gE7clSy4Bmnj7Gv8aE4=;
 b=ZrN7F4d+an0M3+Im+WK64HmkXZLEGbDS8kzzQzfVb8mgF9lqlgHeJWypMU3lwVqr3uRyuD
 puYUZXBuyU8XfUVYvjsaw1iTkFbk1l8NiLS6vyQfJe/SgVp90R+dA7JnNPekWy8h7G4UxV
 ytPF2xRrV5xW9IeuF8q74IiAxztIa2E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1658999356;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LENLZc2rDo4fL7gSt/oUH1P+gE7clSy4Bmnj7Gv8aE4=;
 b=atqWUjedd8AYKE7eQ3FG+NQPd3bPGARN1lml/mEcza7k4a01Ep0Mqqdvwgi6eM0jU0bgjA
 z83om4BIgayrjKBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4BB6D13427;
 Thu, 28 Jul 2022 09:09:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id CmKjEDxS4mLTRAAAMHmgww
 (envelope-from <cfontana@suse.de>); Thu, 28 Jul 2022 09:09:16 +0000
Message-ID: <8a8475c7-c720-1aef-02bb-ca4cb3c1ff68@suse.de>
Date: Thu, 28 Jul 2022 11:09:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: virtio: why no full reset on virtio_set_status 0 ?
Content-Language: en-US
From: Claudio Fontana <cfontana@suse.de>
To: Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Marcel Apfelbaum <marcel@redhat.com>
References: <8350fff5-f8d7-11a4-9f3a-aac8b7f5a964@suse.de>
 <20220727112737-mutt-send-email-mst@kernel.org>
 <CACGkMEt768mxHkcfEBK3EgA3sk979gckuQ-tWz1edX2HzVo73g@mail.gmail.com>
 <cde2074c-67bc-373f-c218-d9deaf84e5f0@suse.de>
In-Reply-To: <cde2074c-67bc-373f-c218-d9deaf84e5f0@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.29; envelope-from=cfontana@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 7/28/22 09:43, Claudio Fontana wrote:
> On 7/28/22 03:27, Jason Wang wrote:
>> On Wed, Jul 27, 2022 at 11:32 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>>>
>>> On Wed, Jul 27, 2022 at 12:51:31PM +0200, Claudio Fontana wrote:
>>>> Hi Michael and all,
>>>>
>>>> I have started researching a qemu / ovs / dpdk bug:
>>>>
>>>> https://inbox.dpdk.org/dev/322122fb-619d-96f6-5c3e-9eabdbf3819a@redhat.com/T/
>>>>
>>>> that seems to be affecting multiple parties in the telco space,
>>>>
>>>> and during this process I noticed that qemu/hw/virtio/virtio.c does not do a full virtio reset
>>>> in virtio_set_status, when receiving a status value of 0.
>>>>
>>>> It seems it has always been this way, so I am clearly missing / forgetting something basic,
>>>>
>>>> I checked the virtio spec at https://docs.oasis-open.org/
>>>>
>>>> and from:
>>>>
>>>> "
>>>> 4.1.4.3 Common configuration structure layout
>>>>
>>>> device_status
>>>> The driver writes the device status here (see 2.1). Writing 0 into this field resets the device.
>>>>
>>>> "
>>>>
>>>> and
>>>>
>>>> "
>>>> 2.4.1 Device Requirements: Device Reset
>>>> A device MUST reinitialize device status to 0 after receiving a reset.
>>>> "
>>>>
>>>> I would conclude that in virtio.c::virtio_set_status we should unconditionally do a full virtio_reset.
>>>>
>>>> Instead, we have just the check:
>>>>
>>>>     if ((vdev->status & VIRTIO_CONFIG_S_DRIVER_OK) !=
>>>>         (val & VIRTIO_CONFIG_S_DRIVER_OK)) {
>>>>         virtio_set_started(vdev, val & VIRTIO_CONFIG_S_DRIVER_OK);
>>>>     }
>>>>
>>>> which just sets the started field,
>>>>
>>>> and then we have the call to the virtio device class set_status (virtio_net...),
>>>> but the VirtioDevice is not fully reset, as per the virtio_reset() call we are missing:
>>>>
>>>> "
>>>>     vdev->start_on_kick = false;
>>>>     vdev->started = false;
>>>>     vdev->broken = false;
>>>>     vdev->guest_features = 0;
>>>>     vdev->queue_sel = 0;
>>>>     vdev->status = 0;
>>>>     vdev->disabled = false;
>>>>     qatomic_set(&vdev->isr, 0);
>>>>     vdev->config_vector = VIRTIO_NO_VECTOR;
>>>>     virtio_notify_vector(vdev, vdev->config_vector);
>>>>
>>>>     for(i = 0; i < VIRTIO_QUEUE_MAX; i++) {
>>>>         ... initialize vdev->vq[i] ...
>>>>     }
>>>> "
>>>>
>>>> Doing a full reset seems to fix the problem for me, so I can send tentative patches if necessary,
>>>> but what am I missing here?
>>>>
>>>> Thanks,
>>>>
>>>> Claudio
>>>>
>>>> --
>>>> Claudio Fontana
>>>> Engineering Manager Virtualization, SUSE Labs Core
>>>>
>>>> SUSE Software Solutions Italy Srl
>>>
>>>
>>> So for example for pci:
>>>
>>>     case VIRTIO_PCI_STATUS:
>>>
>>>
>>>         ....
>>>
>>>         if (vdev->status == 0) {
>>>             virtio_pci_reset(DEVICE(proxy));
>>>         }
>>>
>>> which I suspect is a bug because:
>>>
>>> static void virtio_pci_reset(DeviceState *qdev)
>>> {
>>>     VirtIOPCIProxy *proxy = VIRTIO_PCI(qdev);
>>>     VirtioBusState *bus = VIRTIO_BUS(&proxy->bus);
>>>     PCIDevice *dev = PCI_DEVICE(qdev);
>>>     int i;
>>>
>>>     virtio_bus_reset(bus);
>>
>> Note that we do virtio_reset() here.
> 
> 
> Yes, thank you, I completely overlooked it, I noticed this in Michael's response as well.
> 
> However we end up with multiple calls to k->set_status, one from the virtio_set_status call,
> and one from the virtio_bus_reset(), which is probably something we don't want.
> 
> All in all it is not clear what the meaning of virtio_set_status is supposed to be I think,
> and I wonder what the assumptions are among all the callers.
> If it is supposed to be an implementation of the virtio standard field as described, I think we should do the reset right then and there,
> but maybe the true meaning of the function is another one I couldn't understand, since _some_ of the cases are processes there.
> 
> And there is a question about ordering:
> 
> in virtio_pci we end up calling virtio_set_status(0), which gets us k->set_status(vdev, 0), which lands in virtio_net_set_status(0) and virtio_net_vhost_status,
> which causes a vhost_net_stop().
> 
> Should we instead land in virtio_net_reset() first, by doing a virtio reset earlier when detecting a 0 value from the driver?
> 
> in the scenario I am looking at (with vhost-user, ovs/dpdk, and a guest testpmd application),
> the guest application goes away without any chance to signal (kill -9), then gets immediately restarted and does a write of 0 to status, while qemu and ovs still hold the state for the device.
> 
> As QEMU lands in vhost_net_stop(), it seems to cause a chain of events that crash ovs which is trying to read an rx burst from the queue,
> while QEMU is left hanging waiting forever for a response to VHOST_USER_GET_VRING_BASE issued as a result of vhost_net_stop.
> 
> Just saying, I am having more success with the second ordering, but I am still studying, don't have the full picture yet.


Currently I'm doing (on top of Michael's patch) the following which seems to be working
(but of course this does not even being to look at the other transports, architectures etc),
just an idea to share:

---
 hw/virtio/virtio-pci.c | 7 ++++---
 hw/virtio/virtio.c     | 7 ++++++-
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index 3189ec014d..3cbfa3ce3a 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -312,6 +312,7 @@ static void virtio_ioport_write(void *opaque, uint32_t addr, uint32_t val)
     case VIRTIO_PCI_QUEUE_PFN:
         pa = (hwaddr)val << VIRTIO_PCI_QUEUE_ADDR_SHIFT;
         if (pa == 0) {
+            virtio_bus_reset(&proxy->bus);
             virtio_pci_reset(DEVICE(proxy));
         }
         else
@@ -1941,11 +1942,8 @@ static void virtio_pci_exit(PCIDevice *pci_dev)
 static void virtio_pci_reset(DeviceState *qdev)
 {
     VirtIOPCIProxy *proxy = VIRTIO_PCI(qdev);
-    VirtioBusState *bus = VIRTIO_BUS(&proxy->bus);
-    PCIDevice *dev = PCI_DEVICE(qdev);
     int i;
 
-    virtio_bus_reset(bus);
     msix_unuse_all_vectors(&proxy->pci_dev);
 
     for (i = 0; i < VIRTIO_QUEUE_MAX; i++) {
@@ -1960,7 +1958,10 @@ static void virtio_pci_reset(DeviceState *qdev)
 static void virtio_pci_bus_reset(DeviceState *qdev)
 {
     PCIDevice *dev = PCI_DEVICE(qdev);
+    VirtIOPCIProxy *proxy = VIRTIO_PCI(qdev);
+    VirtioBusState *bus = VIRTIO_BUS(&proxy->bus);
 
+    virtio_bus_reset(bus);
     virtio_pci_reset(qdev);
 
     if (pci_is_express(dev)) {
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 5d607aeaa0..da58ca6f86 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -1977,6 +1977,12 @@ int virtio_set_status(VirtIODevice *vdev, uint8_t val)
     VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
     trace_virtio_set_status(vdev, val);
 
+    if (val == 0) {
+        VirtioBusState *bus = VIRTIO_BUS(qdev_get_parent_bus(DEVICE(vdev)));
+        virtio_bus_reset(bus);
+        return 0;
+    }
+
     if (virtio_vdev_has_feature(vdev, VIRTIO_F_VERSION_1)) {
         if (!(vdev->status & VIRTIO_CONFIG_S_FEATURES_OK) &&
             val & VIRTIO_CONFIG_S_FEATURES_OK) {
@@ -2025,7 +2031,6 @@ void virtio_reset(void *opaque)
     VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
     int i;
 
-    virtio_set_status(vdev, 0);
     if (current_cpu) {
         /* Guest initiated reset */
         vdev->device_endian = virtio_current_cpu_endian();
-- 
2.26.2






> 
> Thanks,
> 
> Claudio
> 
>>
>>>     msix_unuse_all_vectors(&proxy->pci_dev);
>>>
>>>     for (i = 0; i < VIRTIO_QUEUE_MAX; i++) {
>>>         proxy->vqs[i].enabled = 0;
>>>         proxy->vqs[i].num = 0;
>>>         proxy->vqs[i].desc[0] = proxy->vqs[i].desc[1] = 0;
>>>         proxy->vqs[i].avail[0] = proxy->vqs[i].avail[1] = 0;
>>>         proxy->vqs[i].used[0] = proxy->vqs[i].used[1] = 0;
>>>     }
>>>
>>>
>>> so far so good
>>>
>>>     if (pci_is_express(dev)) {
>>>         pcie_cap_deverr_reset(dev);
>>>         pcie_cap_lnkctl_reset(dev);
>>>
>>>         pci_set_word(dev->config + dev->exp.pm_cap + PCI_PM_CTRL, 0);
>>>     }
>>>
>>> this part is wrong I think, it got here by mistake since the same
>>> function is used for bus level reset.
>>>
>>> Jason, Marcel, any input?
>>
>> Yes, I think we don't need PCI stuff here. We do virtio reset not pci.
>>
>> Thanks
>>
>>>
>>> --
>>> MST
>>>
>>
>>
> 
> 


