Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE19584E7C
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jul 2022 12:04:52 +0200 (CEST)
Received: from localhost ([::1]:44996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHMrT-0007lp-1o
	for lists+qemu-devel@lfdr.de; Fri, 29 Jul 2022 06:04:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1oHMZQ-000471-86
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 05:46:12 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:35536)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1oHMZN-0004bQ-EX
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 05:46:11 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 07F5920BDF;
 Fri, 29 Jul 2022 09:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1659087966; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1J+ClhPmPhJ87wNAEgo8LpH/pVqG5qsqJHbfbpb85qA=;
 b=E+Epwq0Qqb+OZ/AgV17IQRZBoVkXxV6duZC17E5ulM2SwSNfVAP1dKXReYdZ2TUIXVnRGp
 9lKJhy3pHRWYbkH9/7KP6GV0ChH8K+m+uC8AF291mbSFL4zuU20Z5O1JAD4/U/n4wRJ4wN
 RDQ6DQOQaKX5e/iUZN/7As4l9Hgzb04=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1659087966;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1J+ClhPmPhJ87wNAEgo8LpH/pVqG5qsqJHbfbpb85qA=;
 b=CwwnfMsSrZ9UiT9S3syKdTqVjVTyOoQ4ohrR8mc/JWz+wv6GcNpHV6RrSuiMcUu7yHOLXl
 Z47tc4kxp26XlXBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C3CFB13A1B;
 Fri, 29 Jul 2022 09:46:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ECwILl2s42KvawAAMHmgww
 (envelope-from <cfontana@suse.de>); Fri, 29 Jul 2022 09:46:05 +0000
Message-ID: <be4dc741-4153-1620-223f-852ff5aa34a7@suse.de>
Date: Fri, 29 Jul 2022 11:46:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: virtio: why no full reset on virtio_set_status 0 ?
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Marcel Apfelbaum <marcel@redhat.com>
References: <8350fff5-f8d7-11a4-9f3a-aac8b7f5a964@suse.de>
 <20220727112737-mutt-send-email-mst@kernel.org>
 <CACGkMEt768mxHkcfEBK3EgA3sk979gckuQ-tWz1edX2HzVo73g@mail.gmail.com>
 <cde2074c-67bc-373f-c218-d9deaf84e5f0@suse.de>
 <8a8475c7-c720-1aef-02bb-ca4cb3c1ff68@suse.de>
 <20220728093501-mutt-send-email-mst@kernel.org>
From: Claudio Fontana <cfontana@suse.de>
In-Reply-To: <20220728093501-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

On 7/28/22 15:39, Michael S. Tsirkin wrote:
> On Thu, Jul 28, 2022 at 11:09:15AM +0200, Claudio Fontana wrote:
>> On 7/28/22 09:43, Claudio Fontana wrote:
>>> On 7/28/22 03:27, Jason Wang wrote:
>>>> On Wed, Jul 27, 2022 at 11:32 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>>>>>
>>>>> On Wed, Jul 27, 2022 at 12:51:31PM +0200, Claudio Fontana wrote:
>>>>>> Hi Michael and all,
>>>>>>
>>>>>> I have started researching a qemu / ovs / dpdk bug:
>>>>>>
>>>>>> https://inbox.dpdk.org/dev/322122fb-619d-96f6-5c3e-9eabdbf3819a@redhat.com/T/
>>>>>>
>>>>>> that seems to be affecting multiple parties in the telco space,
>>>>>>
>>>>>> and during this process I noticed that qemu/hw/virtio/virtio.c does not do a full virtio reset
>>>>>> in virtio_set_status, when receiving a status value of 0.
>>>>>>
>>>>>> It seems it has always been this way, so I am clearly missing / forgetting something basic,
>>>>>>
>>>>>> I checked the virtio spec at https://docs.oasis-open.org/
>>>>>>
>>>>>> and from:
>>>>>>
>>>>>> "
>>>>>> 4.1.4.3 Common configuration structure layout
>>>>>>
>>>>>> device_status
>>>>>> The driver writes the device status here (see 2.1). Writing 0 into this field resets the device.
>>>>>>
>>>>>> "
>>>>>>
>>>>>> and
>>>>>>
>>>>>> "
>>>>>> 2.4.1 Device Requirements: Device Reset
>>>>>> A device MUST reinitialize device status to 0 after receiving a reset.
>>>>>> "
>>>>>>
>>>>>> I would conclude that in virtio.c::virtio_set_status we should unconditionally do a full virtio_reset.
>>>>>>
>>>>>> Instead, we have just the check:
>>>>>>
>>>>>>     if ((vdev->status & VIRTIO_CONFIG_S_DRIVER_OK) !=
>>>>>>         (val & VIRTIO_CONFIG_S_DRIVER_OK)) {
>>>>>>         virtio_set_started(vdev, val & VIRTIO_CONFIG_S_DRIVER_OK);
>>>>>>     }
>>>>>>
>>>>>> which just sets the started field,
>>>>>>
>>>>>> and then we have the call to the virtio device class set_status (virtio_net...),
>>>>>> but the VirtioDevice is not fully reset, as per the virtio_reset() call we are missing:
>>>>>>
>>>>>> "
>>>>>>     vdev->start_on_kick = false;
>>>>>>     vdev->started = false;
>>>>>>     vdev->broken = false;
>>>>>>     vdev->guest_features = 0;
>>>>>>     vdev->queue_sel = 0;
>>>>>>     vdev->status = 0;
>>>>>>     vdev->disabled = false;
>>>>>>     qatomic_set(&vdev->isr, 0);
>>>>>>     vdev->config_vector = VIRTIO_NO_VECTOR;
>>>>>>     virtio_notify_vector(vdev, vdev->config_vector);
>>>>>>
>>>>>>     for(i = 0; i < VIRTIO_QUEUE_MAX; i++) {
>>>>>>         ... initialize vdev->vq[i] ...
>>>>>>     }
>>>>>> "
>>>>>>
>>>>>> Doing a full reset seems to fix the problem for me, so I can send tentative patches if necessary,
>>>>>> but what am I missing here?
>>>>>>
>>>>>> Thanks,
>>>>>>
>>>>>> Claudio
>>>>>>
>>>>>> --
>>>>>> Claudio Fontana
>>>>>> Engineering Manager Virtualization, SUSE Labs Core
>>>>>>
>>>>>> SUSE Software Solutions Italy Srl
>>>>>
>>>>>
>>>>> So for example for pci:
>>>>>
>>>>>     case VIRTIO_PCI_STATUS:
>>>>>
>>>>>
>>>>>         ....
>>>>>
>>>>>         if (vdev->status == 0) {
>>>>>             virtio_pci_reset(DEVICE(proxy));
>>>>>         }
>>>>>
>>>>> which I suspect is a bug because:
>>>>>
>>>>> static void virtio_pci_reset(DeviceState *qdev)
>>>>> {
>>>>>     VirtIOPCIProxy *proxy = VIRTIO_PCI(qdev);
>>>>>     VirtioBusState *bus = VIRTIO_BUS(&proxy->bus);
>>>>>     PCIDevice *dev = PCI_DEVICE(qdev);
>>>>>     int i;
>>>>>
>>>>>     virtio_bus_reset(bus);
>>>>
>>>> Note that we do virtio_reset() here.
>>>
>>>
>>> Yes, thank you, I completely overlooked it, I noticed this in Michael's response as well.
>>>
>>> However we end up with multiple calls to k->set_status, one from the virtio_set_status call,
>>> and one from the virtio_bus_reset(), which is probably something we don't want.
>>>
>>> All in all it is not clear what the meaning of virtio_set_status is supposed to be I think,
>>> and I wonder what the assumptions are among all the callers.
>>> If it is supposed to be an implementation of the virtio standard field as described, I think we should do the reset right then and there,
>>> but maybe the true meaning of the function is another one I couldn't understand, since _some_ of the cases are processes there.
>>>
>>> And there is a question about ordering:
>>>
>>> in virtio_pci we end up calling virtio_set_status(0), which gets us k->set_status(vdev, 0), which lands in virtio_net_set_status(0) and virtio_net_vhost_status,
>>> which causes a vhost_net_stop().
>>>
>>> Should we instead land in virtio_net_reset() first, by doing a virtio reset earlier when detecting a 0 value from the driver?
>>>
>>> in the scenario I am looking at (with vhost-user, ovs/dpdk, and a guest testpmd application),
>>> the guest application goes away without any chance to signal (kill -9), then gets immediately restarted and does a write of 0 to status, while qemu and ovs still hold the state for the device.
>>>
>>> As QEMU lands in vhost_net_stop(), it seems to cause a chain of events that crash ovs which is trying to read an rx burst from the queue,
>>> while QEMU is left hanging waiting forever for a response to VHOST_USER_GET_VRING_BASE issued as a result of vhost_net_stop.
>>>
>>> Just saying, I am having more success with the second ordering, but I am still studying, don't have the full picture yet.
>>
>>
>> Currently I'm doing (on top of Michael's patch) the following which seems to be working
>> (but of course this does not even being to look at the other transports, architectures etc),
>> just an idea to share:
>>
>> ---
>>  hw/virtio/virtio-pci.c | 7 ++++---
>>  hw/virtio/virtio.c     | 7 ++++++-
>>  2 files changed, 10 insertions(+), 4 deletions(-)
>>
>> diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
>> index 3189ec014d..3cbfa3ce3a 100644
>> --- a/hw/virtio/virtio-pci.c
>> +++ b/hw/virtio/virtio-pci.c
>> @@ -312,6 +312,7 @@ static void virtio_ioport_write(void *opaque, uint32_t addr, uint32_t val)
>>      case VIRTIO_PCI_QUEUE_PFN:
>>          pa = (hwaddr)val << VIRTIO_PCI_QUEUE_ADDR_SHIFT;
>>          if (pa == 0) {
>> +            virtio_bus_reset(&proxy->bus);
>>              virtio_pci_reset(DEVICE(proxy));
>>          }
>>          else
>> @@ -1941,11 +1942,8 @@ static void virtio_pci_exit(PCIDevice *pci_dev)
>>  static void virtio_pci_reset(DeviceState *qdev)
>>  {
>>      VirtIOPCIProxy *proxy = VIRTIO_PCI(qdev);
>> -    VirtioBusState *bus = VIRTIO_BUS(&proxy->bus);
>> -    PCIDevice *dev = PCI_DEVICE(qdev);
>>      int i;
>>  
>> -    virtio_bus_reset(bus);
>>      msix_unuse_all_vectors(&proxy->pci_dev);
>>  
>>      for (i = 0; i < VIRTIO_QUEUE_MAX; i++) {
>> @@ -1960,7 +1958,10 @@ static void virtio_pci_reset(DeviceState *qdev)
>>  static void virtio_pci_bus_reset(DeviceState *qdev)
>>  {
>>      PCIDevice *dev = PCI_DEVICE(qdev);
>> +    VirtIOPCIProxy *proxy = VIRTIO_PCI(qdev);
>> +    VirtioBusState *bus = VIRTIO_BUS(&proxy->bus);
>>  
>> +    virtio_bus_reset(bus);
>>      virtio_pci_reset(qdev);
>>  
>>      if (pci_is_express(dev)) {
>> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
>> index 5d607aeaa0..da58ca6f86 100644
>> --- a/hw/virtio/virtio.c
>> +++ b/hw/virtio/virtio.c
>> @@ -1977,6 +1977,12 @@ int virtio_set_status(VirtIODevice *vdev, uint8_t val)
>>      VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
>>      trace_virtio_set_status(vdev, val);
>>  
>> +    if (val == 0) {
>> +        VirtioBusState *bus = VIRTIO_BUS(qdev_get_parent_bus(DEVICE(vdev)));
>> +        virtio_bus_reset(bus);
>> +        return 0;
>> +    }
>> +
>>      if (virtio_vdev_has_feature(vdev, VIRTIO_F_VERSION_1)) {
>>          if (!(vdev->status & VIRTIO_CONFIG_S_FEATURES_OK) &&
>>              val & VIRTIO_CONFIG_S_FEATURES_OK) {
>> @@ -2025,7 +2031,6 @@ void virtio_reset(void *opaque)
>>      VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
>>      int i;
>>  
>> -    virtio_set_status(vdev, 0);
>>      if (current_cpu) {
>>          /* Guest initiated reset */
>>          vdev->device_endian = virtio_current_cpu_endian();
>> -- 
>> 2.26.2
> 
> As you say this is incomplete ... bout could you share a bit more
> of what issue does this address?
> 

Hi, the problem I am trying to address is a segfault in OVS/dpdk that looks like this:

Thread 153 "pmd-c88/id:150" received signal SIGSEGV, Segmentation fault.
[Switching to Thread 0x7f64e5e6b700 (LWP 141373)]
rte_mov128blocks (n=2048, src=0xc <error: Cannot access memory at address 0xc>, dst=0x150da4480 "h\005\312❇\377\377\377\377\377\377\b") at ../lib/eal/x86/include/rte_memcpy.h:384
384	../lib/eal/x86/include/rte_memcpy.h: No such file or directory.
(gdb) bt
#0  rte_mov128blocks (n=2048, src=0xc <error: Cannot access memory at address 0xc>, 
    dst=0x150da4480 "h\005\312❇\377\377\377\377\377\377\b") at ../lib/eal/x86/include/rte_memcpy.h:384
#1  rte_memcpy_generic (n=2048, src=0xc, dst=0x150da4480) at ../lib/eal/x86/include/rte_memcpy.h:484
#2  rte_memcpy (n=2048, src=0xc, dst=<optimized out>) at ../lib/eal/x86/include/rte_memcpy.h:851
#3  sync_fill_seg (to_desc=false, cpy_len=2048, buf_iova=<optimized out>, buf_addr=12, mbuf_offset=0, m=0x150da4140, 
    vq=0x2200400680, dev=0x2200d3d740) at ../lib/vhost/virtio_net.c:1119
#4  desc_to_mbuf (is_async=false, slot_idx=0, legacy_ol_flags=true, mbuf_pool=0x17fe7df00, m=0x150da4140, nr_vec=<optimized out>, 
    buf_vec=0x7f64e5e67ca0, vq=0x2200400680, dev=0x2200d3d740) at ../lib/vhost/virtio_net.c:2747
#5  virtio_dev_tx_split (legacy_ol_flags=true, count=<optimized out>, count@entry=0, pkts=pkts@entry=0x0, 
    mbuf_pool=mbuf_pool@entry=0x150da4140, vq=vq@entry=0xe5e67d34, dev=dev@entry=0x7f64e5e694d0) at ../lib/vhost/virtio_net.c:2943
#6  virtio_dev_tx_split_legacy (dev=dev@entry=0x2200d3d740, vq=vq@entry=0x2200400680, mbuf_pool=mbuf_pool@entry=0x17fe7df00, 
    pkts=pkts@entry=0x7f64e5e69600, count=count@entry=32) at ../lib/vhost/virtio_net.c:2979
#7  0x00007f676fea0fef in rte_vhost_dequeue_burst (vid=vid@entry=0, queue_id=queue_id@entry=1, mbuf_pool=0x17fe7df00, 
    pkts=pkts@entry=0x7f64e5e69600, count=count@entry=32) at ../lib/vhost/virtio_net.c:3331
#8  0x00007f6772005a62 in netdev_dpdk_vhost_rxq_recv (rxq=<optimized out>, batch=0x7f64e5e695f0, qfill=0x0)
    at ../lib/netdev-dpdk.c:2393
#9  0x00007f6771f38116 in netdev_rxq_recv (rx=<optimized out>, batch=batch@entry=0x7f64e5e695f0, qfill=<optimized out>)
    at ../lib/netdev.c:727
#10 0x00007f6771f03d96 in dp_netdev_process_rxq_port (pmd=pmd@entry=0x7f64e5e6c010, rxq=0x254d730, port_no=2)
    at ../lib/dpif-netdev.c:5317
#11 0x00007f6771f04239 in pmd_thread_main (f_=<optimized out>) at ../lib/dpif-netdev.c:6945
#12 0x00007f6771f92aff in ovsthread_wrapper (aux_=<optimized out>) at ../lib/ovs-thread.c:422
#13 0x00007f6771c1b6ea in start_thread () from /lib64/libpthread.so.0
#14 0x00007f6771933a8f in clone () from /lib64/libc.so.6

---

Where as you can see ovs/dpdk is trying to access rx memory at an invalid src address.

The setup includes the latest dpdk library, the latest openvswitch (ovs-vswitchd), the latest qemu on the host,
and old dpdk and test-pmd dpdk app in the guest (tested with 16- and 19-).  The guest should work even with older versions without crashing the host processes.

The setup is the most basic qemu, vhost-user, ovs, dpdk setup, with a traffic generator sending stuff to forward for ovs.

It is sufficient in the guest to bind the device,

modprobe uio_pci_generic
dpdk-stable-16.11.11/tools/dpdk-devbind.py -b uio_pci_generic 0000:07:00.0

Then start the testpmd application in a loop:

while true ; do 
    /home/zhl/dpdk-stable-16.11.11/x86_64-native-linuxapp-gcc/build/app/test-pmd/testpmd --log-level=8 -c 0x1e -n 4 --socket-mem 512 -- -i --nb-cores=3 --port-topology=chained --disable-hw-vlan --forward-mode=macswap --auto-start --rxq=4 --txq=4 --rxd=512 --txd=512 --burst=32
done

and in parallel from another shell in the guest f.e. kill -9 the testpmd application as such:

while true ; do
    sleep 11
    kill -9 `pgrep -x testpmd`
done

What ends up happening is that at the time of reinitialization of testpmd after it was SIGKILLed,
the reset causes havok as ovs tries to read from the queues. May take anything from a few seconds to a few minutes to reproduce.

Still investigating, I noticed the strange qemu behavior on reset, however likely there is much more to study.

If anyone is trying to reproduce this, let me know if anything is needed to help reproduce.

I can share more logs if needed, the challenge with logging is,
if we log too much things slow down, and the issue becomes harder and harder to reproduce.
Optimization -O1 is still ok, -O0 also makes it much harder to hit.

Thanks,

Claudio

