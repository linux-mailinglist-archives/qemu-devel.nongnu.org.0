Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B6D583974
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 09:25:14 +0200 (CEST)
Received: from localhost ([::1]:58202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGxtP-0003SW-9Z
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 03:25:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1oGxlS-0007eq-M1
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 03:16:58 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:40532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1oGxlQ-0005UQ-DZ
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 03:16:58 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8AD1D344BE;
 Thu, 28 Jul 2022 07:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1658992614; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vsL7M0eb1nzPn/Te/RCx6JcbKT2HyASE/DhDR1Dtvnw=;
 b=PUW/bmSfbWZ1Hzia1xxEQF2pLVzMQdAC3EhlAAPkBp60QR5fjOfOXWLnQVOXQ4quNtMUVT
 Ttu0U2jqagtTsxXC0Qpyo4ajVJLxCjaSWrdUWAqN7FRVHP+cTpg5mfq9xQKDXGJJyaah+O
 1UigieXhJyvA3aGLu46Qo2/AuTohyGQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1658992614;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vsL7M0eb1nzPn/Te/RCx6JcbKT2HyASE/DhDR1Dtvnw=;
 b=i+owir9dPKHFYQ8Vnl2DdSDhwngVPaJA1B9MzOBxlIhszudmOakE5277/0SF2U7nsLo7mI
 PvnI2FCqk/DiUJCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 51AB413A7E;
 Thu, 28 Jul 2022 07:16:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id CpjWEeY34mKTDAAAMHmgww
 (envelope-from <cfontana@suse.de>); Thu, 28 Jul 2022 07:16:54 +0000
Message-ID: <bf9ca190-37e0-c679-fa5a-4fd16f285ad4@suse.de>
Date: Thu, 28 Jul 2022 09:16:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: virtio: why no full reset on virtio_set_status 0 ?
Content-Language: en-US
To: Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Marcel Apfelbaum <marcel@redhat.com>
References: <8350fff5-f8d7-11a4-9f3a-aac8b7f5a964@suse.de>
 <20220727112737-mutt-send-email-mst@kernel.org>
 <CACGkMEt768mxHkcfEBK3EgA3sk979gckuQ-tWz1edX2HzVo73g@mail.gmail.com>
From: Claudio Fontana <cfontana@suse.de>
In-Reply-To: <CACGkMEt768mxHkcfEBK3EgA3sk979gckuQ-tWz1edX2HzVo73g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=cfontana@suse.de;
 helo=smtp-out1.suse.de
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

On 7/28/22 03:27, Jason Wang wrote:
> On Wed, Jul 27, 2022 at 11:32 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>>
>> On Wed, Jul 27, 2022 at 12:51:31PM +0200, Claudio Fontana wrote:
>>> Hi Michael and all,
>>>
>>> I have started researching a qemu / ovs / dpdk bug:
>>>
>>> https://inbox.dpdk.org/dev/322122fb-619d-96f6-5c3e-9eabdbf3819a@redhat.com/T/
>>>
>>> that seems to be affecting multiple parties in the telco space,
>>>
>>> and during this process I noticed that qemu/hw/virtio/virtio.c does not do a full virtio reset
>>> in virtio_set_status, when receiving a status value of 0.
>>>
>>> It seems it has always been this way, so I am clearly missing / forgetting something basic,
>>>
>>> I checked the virtio spec at https://docs.oasis-open.org/
>>>
>>> and from:
>>>
>>> "
>>> 4.1.4.3 Common configuration structure layout
>>>
>>> device_status
>>> The driver writes the device status here (see 2.1). Writing 0 into this field resets the device.
>>>
>>> "
>>>
>>> and
>>>
>>> "
>>> 2.4.1 Device Requirements: Device Reset
>>> A device MUST reinitialize device status to 0 after receiving a reset.
>>> "
>>>
>>> I would conclude that in virtio.c::virtio_set_status we should unconditionally do a full virtio_reset.
>>>
>>> Instead, we have just the check:
>>>
>>>     if ((vdev->status & VIRTIO_CONFIG_S_DRIVER_OK) !=
>>>         (val & VIRTIO_CONFIG_S_DRIVER_OK)) {
>>>         virtio_set_started(vdev, val & VIRTIO_CONFIG_S_DRIVER_OK);
>>>     }
>>>
>>> which just sets the started field,
>>>
>>> and then we have the call to the virtio device class set_status (virtio_net...),
>>> but the VirtioDevice is not fully reset, as per the virtio_reset() call we are missing:
>>>
>>> "
>>>     vdev->start_on_kick = false;
>>>     vdev->started = false;
>>>     vdev->broken = false;
>>>     vdev->guest_features = 0;
>>>     vdev->queue_sel = 0;
>>>     vdev->status = 0;
>>>     vdev->disabled = false;
>>>     qatomic_set(&vdev->isr, 0);
>>>     vdev->config_vector = VIRTIO_NO_VECTOR;
>>>     virtio_notify_vector(vdev, vdev->config_vector);
>>>
>>>     for(i = 0; i < VIRTIO_QUEUE_MAX; i++) {
>>>         ... initialize vdev->vq[i] ...
>>>     }
>>> "
>>>
>>> Doing a full reset seems to fix the problem for me, so I can send tentative patches if necessary,
>>> but what am I missing here?
>>>
>>> Thanks,
>>>
>>> Claudio
>>>
>>> --
>>> Claudio Fontana
>>> Engineering Manager Virtualization, SUSE Labs Core
>>>
>>> SUSE Software Solutions Italy Srl
>>
>>
>> So for example for pci:
>>
>>     case VIRTIO_PCI_STATUS:
>>
>>
>>         ....
>>
>>         if (vdev->status == 0) {
>>             virtio_pci_reset(DEVICE(proxy));
>>         }
>>
>> which I suspect is a bug because:
>>
>> static void virtio_pci_reset(DeviceState *qdev)
>> {
>>     VirtIOPCIProxy *proxy = VIRTIO_PCI(qdev);
>>     VirtioBusState *bus = VIRTIO_BUS(&proxy->bus);
>>     PCIDevice *dev = PCI_DEVICE(qdev);
>>     int i;
>>
>>     virtio_bus_reset(bus);
> 
> Note that we do virtio_reset() here.


Indeed, thanks I completely overlooked it.

However we end up with multiple calls to k->set_status,
one from the virtio_set_status call, and one from the virtio_reset() call, from a single 0 write.

Also I wonder about the ordering. Starting from the guest driver writing 0,
we end up (for virtio-net), calling virtio_net_set_status() first,
which lands us in virtio_net_vhost_status(),
which in the case of an already started vhost lands us in vhost_net_stop().

If we do virtio_reset immediately on seeing the guest writing 0,
we instead land first in virtio_net_reset().

Which one is the right behavior? I am having more success with the second ordering currently.
I can describe the scenario in more detail if needed in this context.

All in all, I think that the meaning of virtio_set_status as a function is unclear;
if is it supposed to match the virtio standard meaning of be virtio status field, then I'd expect we should do the virtio reset right there,
like we process the other bits of the status field, and not do it again from virtio_pci...

I wonder also about all the callers of virtio_set_status, what the assumptions of each caller are...

Thanks!

Claudio


> 
>>     msix_unuse_all_vectors(&proxy->pci_dev);
>>
>>     for (i = 0; i < VIRTIO_QUEUE_MAX; i++) {
>>         proxy->vqs[i].enabled = 0;
>>         proxy->vqs[i].num = 0;
>>         proxy->vqs[i].desc[0] = proxy->vqs[i].desc[1] = 0;
>>         proxy->vqs[i].avail[0] = proxy->vqs[i].avail[1] = 0;
>>         proxy->vqs[i].used[0] = proxy->vqs[i].used[1] = 0;
>>     }
>>
>>
>> so far so good
>>
>>     if (pci_is_express(dev)) {
>>         pcie_cap_deverr_reset(dev);
>>         pcie_cap_lnkctl_reset(dev);
>>
>>         pci_set_word(dev->config + dev->exp.pm_cap + PCI_PM_CTRL, 0);
>>     }
>>
>> this part is wrong I think, it got here by mistake since the same
>> function is used for bus level reset.
>>
>> Jason, Marcel, any input?
> 
> Yes, I think we don't need PCI stuff here. We do virtio reset not pci.
> 
> Thanks
> 
>>
>> --
>> MST
>>
> 
> 


