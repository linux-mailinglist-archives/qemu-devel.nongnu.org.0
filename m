Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F0636629D1
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 16:24:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEu0R-0005pS-BW; Mon, 09 Jan 2023 10:24:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pEu0P-0005oS-5i
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 10:24:09 -0500
Received: from smtpout2.mo529.mail-out.ovh.net ([79.137.123.220])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pEu0N-0003Xg-GI
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 10:24:08 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.147])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 2CEFC15224724;
 Mon,  9 Jan 2023 16:24:04 +0100 (CET)
Received: from kaod.org (37.59.142.107) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Mon, 9 Jan
 2023 16:24:02 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-107S0016ee60aa5-bb34-4229-9bfe-682c53a4b0ad,
 1F76CF3ACB56F17C32A409AA235EFAF7B7A61927) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <e5000d6b-f91f-d52a-3b15-a4b1e5127faa@kaod.org>
Date: Mon, 9 Jan 2023 16:24:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 3/4] s390x/pv: Introduce a s390_pv_check() helper for
 runtime
Content-Language: en-US
To: Janosch Frank <frankja@linux.ibm.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@redhat.com>, <qemu-s390x@nongnu.org>
CC: <qemu-devel@nongnu.org>, Thomas Huth <thuth@redhat.com>, Halil Pasic
 <pasic@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>, David Hildenbrand
 <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>, Eric Farman
 <farman@linux.ibm.com>
References: <20230106075330.3662549-1-clg@kaod.org>
 <20230106075330.3662549-4-clg@kaod.org>
 <49bf32c7-4a44-a3c9-29b5-b6580113700c@linux.ibm.com>
 <bc3ec4b4-1c7a-a4a9-01ea-78fca7ad10c6@kaod.org>
 <8e04a10e-8978-494c-5d0f-2507e78134aa@linux.ibm.com>
 <d9194b49-9841-87b5-6355-b7d5f82da6b6@kaod.org>
 <6d121914-9add-88ab-1650-9735e1fada73@linux.ibm.com>
 <c333500f-307b-7521-c768-99e00509dd15@redhat.com>
 <d4ec20fc-5b68-ee04-c387-4e87428d6c7f@linux.ibm.com>
 <a6aa35a8-c3fe-47d8-3a80-38cb8d94fdba@linux.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <a6aa35a8-c3fe-47d8-3a80-38cb8d94fdba@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.107]
X-ClientProxiedBy: DAG3EX2.mxp5.local (172.16.2.22) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: e03efdd5-1547-45ed-a6eb-db245ff9ba7d
X-Ovh-Tracer-Id: 3572198929624566773
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrkeeigdejudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepffdufeeliedujeeffffhjeffiefghffhhfdvkeeijeehledvueffhfejtdehgeegnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrddutdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeotghlgheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehfrhgrnhhkjhgrsehlihhnuhigrdhisghmrdgtohhmpdgtlhhgsehrvgguhhgrthdrtghomhdpqhgvmhhuqdhsfeeltdigsehnohhnghhnuhdrohhrghdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpthhhuhhthhesrhgvughhrghtrdgtohhmpdhprghsihgtsehlihhnuhigrdhisghmrdgtohhmpdgsohhrnhhtrhgrvghgvghrsehlihhnuhigrdhisghmrdgtohhmpdhimhgsrhgvnhgurgeslhhinhhugidrihgsmhdrtghomhdpuggrvhhiugesrhgvughhrghtrdgtoh
 hmpdhiihhisehlihhnuhigrdhisghmrdgtohhmpdhfrghrmhgrnheslhhinhhugidrihgsmhdrtghomhdpoffvtefjohhsthepmhhohedvledpmhhouggvpehsmhhtphhouhht
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout2.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 1/9/23 15:52, Janosch Frank wrote:
> On 1/9/23 15:31, Janosch Frank wrote:
>> On 1/9/23 14:53, Cédric Le Goater wrote:
>>> On 1/9/23 14:45, Janosch Frank wrote:
>>>> On 1/9/23 14:30, Cédric Le Goater wrote:
>>>>> On 1/9/23 10:49, Janosch Frank wrote:
>>>>>> On 1/9/23 10:27, Cédric Le Goater wrote:
>>>>>>> On 1/9/23 10:04, Janosch Frank wrote:
>>>>>>>> On 1/6/23 08:53, Cédric Le Goater wrote:
>>>>>>>>> From: Cédric Le Goater <clg@redhat.com>
>>>>>>>>>
>>>>>>>>> If a secure kernel is started in a non-protected VM, the OS will hang
>>>>>>>>> during boot without giving a proper error message to the user.
>>>>>>>>
>>>>>>>> Most of the time you see nothing in the console because libvirt is too slow. If you start the VM in paused mode, attach a console and then resume it, then you'll see a nice error message.
>>>>>>>
>>>>>>> If you wait long enough, the VM fails to mount / and falls into the dracut
>>>>>>> initrams.
>>>>>>
>>>>>> I have the feeling that we're not talking about the same thing here.>
>>>>>      > A PV VM always starts out as a non-PV VM and is put into PV mode via two diag308 subcodes (8 & 10). ALL PV subcodes (8 - 10) are spec exceptions if the host isn't enabled for PV.
>>>>>
>>>>> The corner case this patch is trying to address is for a PV-enabled host,
>>>>> a secure enabled OS and !PV-enabled QEMU.
>>>>>
>>>>> Please run this command on a secure disk image :
>>>>>
>>>>>       qemu-system-s390x -M s390-ccw-virtio -accel kvm -drive file=<file>,if=virtio,format=qcow2 -nographic -nodefaults -serial mon:stdio
>>>>>
>>>>> and tell me what you get.
>>>>>
>>>>
>>>> qemu-system-s390x -M s390-ccw-virtio -accel kvm -drive file=u2204.qcow2,if=virtio,format=qcow2 -nographic -nodefaults -serial mon:stdio
>>>> LOADPARM=[        ]
>>>> Using virtio-blk.
>>>> Using SCSI scheme.
>>>> .............................................................................................................................
>>>> Secure unpack facility is not available
>>>
>>> Yes. That's with a !PV-enabled host. Correct ?
>>>
>>> Can you try with prot_virt=1 on the host please ?
>>
>> With prot_virt=1 it boots until it doesn't find the file system (at
>> least if you give it a bit more memory than the standard 256MB):
>>
>> qemu-system-s390x -M s390-ccw-virtio -accel kvm -drive
>> file=u2204.qcow2,if=virtio,format=qcow2 -nographic -nodefaults -serial
>> mon:stdio -m 4096
>> [Linux boot stuff]
>> ALERT!  /dev/disk/by-path/ccw-0.0.0000-part1 does not exist.  Dropping
>> to a shell!
>>
> 
> I.e. it boots into secure mode just fine.
> 
> Now if you add iommu_platform=true to the device then it'll even boot from disk.
> 
> So we'd rather need an error message if you attach a device without the iommu being set to true. The whole topic of PV iommu problems has a few windings which I don't fully want to bring to electronic paper right now.
> 
> Either you start a secure guest that has devices with manual iommu entries or you go the launch security route and let libvirt/qemu handle it for you.

aaahh. So "-machine confidential-guest-support=pv0 -object s390-pv-guest,id=pv0"
is equivalent to "-global virtio-device.iommu_platform=true". I should have
looked closer :/

Thanks for the clarification,

C.



