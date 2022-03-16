Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C8234DB871
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 20:17:58 +0100 (CET)
Received: from localhost ([::1]:53016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUZ9h-0005Qs-6m
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 15:17:57 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nUZ8Y-0004bE-QW
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 15:16:46 -0400
Received: from 8.mo552.mail-out.ovh.net ([46.105.37.156]:57439)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nUZ8W-00047N-BW
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 15:16:46 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.235])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 6E4CE2979B;
 Wed, 16 Mar 2022 19:16:40 +0000 (UTC)
Received: from kaod.org (37.59.142.107) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 16 Mar
 2022 20:16:39 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-107S001b7b8b53b-d952-4edd-b2e8-aa4a08cd81ce,
 C2F6808E47F1CA0F000971F70C7D0E7BD6BD5175) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <6f0a92ca-9f53-b8b8-e85d-43f4da36200d@kaod.org>
Date: Wed, 16 Mar 2022 20:16:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: XIVE VFIO kernel resample failure in INTx mode under heavy load
Content-Language: en-US
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
To: Alex Williamson <alex.williamson@redhat.com>, Timothy Pearson
 <tpearson@raptorengineering.com>
References: <1891893257.448156.1647023745384.JavaMail.zimbra@raptorengineeringinc.com>
 <20220314160952.46d5313a.alex.williamson@redhat.com>
 <9638ec8f-2edf-97df-0c14-95ae2344dc70@kaod.org>
In-Reply-To: <9638ec8f-2edf-97df-0c14-95ae2344dc70@kaod.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.107]
X-ClientProxiedBy: DAG2EX1.mxp5.local (172.16.2.11) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: d5c72a47-c6a1-4cab-bed0-823bfa1a1ec5
X-Ovh-Tracer-Id: 4005951869258337187
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrudefvddguddvtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuhffvfhgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeihfefffffgedtkeegtdekffevudeggfegffethfffhefhhfevhfdtudejhfdvieenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhg
Received-SPF: pass client-ip=46.105.37.156; envelope-from=clg@kaod.org;
 helo=8.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
 "list@suse.de:PowerPC" <qemu-ppc@nongnu.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Timothy,

On 3/16/22 17:29, Cédric Le Goater wrote:
> Hello,
> 
> 
>> I've been struggling for some time with what is looking like a
>> potential bug in QEMU/KVM on the POWER9 platform.  It appears that
>> in XIVE mode, when the in-kernel IRQ chip is enabled, an external
>> device that rapidly asserts IRQs via the legacy INTx level mechanism
>> will only receive one interrupt in the KVM guest.
> 
> Indeed. I could reproduce with a pass-through PCI adapter using
> 'pci=nomsi'. The virtio devices operate correctly but the network
> adapter only receives one event (*):
> 
> 
> $ cat /proc/interrupts
>             CPU0       CPU1       CPU2       CPU3       CPU4       CPU5       CPU6       CPU7
>   16:       2198       1378       1519       1216          0          0          0          0  XIVE-IPI   0 Edge      IPI-0
>   17:          0          0          0          0       2003       1936       1335       1507  XIVE-IPI   1 Edge      IPI-1
>   18:          0       6401          0          0          0          0          0          0  XIVE-IRQ 4609 Level     virtio3, virtio0, virtio2
>   19:          0          0          0          0          0        204          0          0  XIVE-IRQ 4610 Level     virtio1
>   20:          0          0          0          0          0          0          0          0  XIVE-IRQ 4608 Level     xhci-hcd:usb1
>   21:          0          1          0          0          0          0          0          0  XIVE-IRQ 4612 Level     eth1 (*)
>   23:          0          0          0          0          0          0          0          0  XIVE-IRQ 4096 Edge      RAS_EPOW
>   24:          0          0          0          0          0          0          0          0  XIVE-IRQ 4592 Edge      hvc_console
>   26:          0          0          0          0          0          0          0          0  XIVE-IRQ 4097 Edge      RAS_HOTPLUG
> 
>> Changing any one of those items appears to avoid the glitch, e.g. XICS
> 
> XICS is very different from XIVE. The driver implements the previous
> interrupt controller architecture (P5-P8) and the hypervisor mediates
> the delivery to the guest. With XIVE, vCPUs are directly signaled by
> the IC. When under KVM, we use different KVM devices for each mode :
> 
> * KVM XIVE is a XICS-on-XIVE implementation (P9/P10 hosts) for guests
>    not using the XIVE native interface. RHEL7 for instance.
> * KVM XIVE native is a XIVE implementation (P9/P10 hosts) for guests
>    using the XIVE native interface. Linux > 4.14.
> * KVM XICS is for P8 hosts (no XIVE HW)
> 
> VFIO adds some complexity with the source events. I think the problem
> comes from the assertion state. I will talk about it later.
> 
>> mode with the in-kernel IRQ chip works (all interrupts are passed
>> through),
> 
> All interrupts are passed through using XIVE also. Run 'info pic' in
> the monitor. On the host, check the IRQ mapping in the debugfs file :
> 
>    /sys/kernel/debug/powerpc/kvm-xive-*
> 
>> and XIVE mode with the in-kernel IRQ chip disabled also works. 
> 
> In that case, no KVM device backs the QEMU device and all state
> is in one place.
> 
>> We
>> are also not seeing any problems in XIVE mode with the in-kernel
>> chip from MSI/MSI-X devices.
> 
> Yes. pass-through devices are expected to operate correctly :)
> 
>> The device in question is a real time card that needs to raise an
>> interrupt every 1ms.  It works perfectly on the host, but fails in
>> the guest -- with the in-kernel IRQ chip and XIVE enabled, it
>> receives exactly one interrupt, at which point the host continues to
>> see INTx+ but the guest sees INTX-, and the IRQ handler in the guest
>> kernel is never reentered.
> 
> ok. Same symptom as the scenario above.
> 
>> We have also seen some very rare glitches where, over a long period
>> of time, we can enter a similar deadlock in XICS mode.
> 
> with the in-kernel XICS IRQ chip ?
> 
>> Disabling
>> the in-kernel IRQ chip in XIVE mode will also lead to the lockup
>> with this device, since the userspace IRQ emulation cannot keep up
>> with the rapid interrupt firing (measurements show around 100ms
>> required for processing each interrupt in the user mode).
> 
> MSI emulation in QEMU is slower indeed (35%). LSI is very slow because
> it is handled as a special case in the device/driver. To maintain the
> assertion state, all LSI handling is done with a special HCALL :
> H_INT_ESB which is implemented in QEMU. This generates a lot of back
> and forth in the KVM stack.
> 
>> My understanding is the resample mechanism does some clever tricks
>> with level IRQs, but that QEMU needs to check if the IRQ is still
>> asserted by the device on guest EOI.
> 
> Yes. the problem is in that area.
> 
>> Since a failure here would
>> explain these symptoms I'm wondering if there is a bug in either
>> QEMU or KVM for POWER / pSeries (SPAPr) where the IRQ is not
>> resampled and therefore not re-fired in the guest?
> 
> KVM I would say. The assertion state is maintained in KVM for the KVM
> XICS-on-XIVE implementation and in QEMU for the KVM XIVE native
> device. These are good candidates. I will take a look.

All works fine with KVM_CAP_IRQFD_RESAMPLE=false in QEMU. Can you please
try this workaround for now ? I could reach 934 Mbits/sec on the passthru
device.

I clearly overlooked that part and it has been 3 years.

Thanks,

C.


