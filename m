Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B73A662757
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 14:40:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEsFN-00019m-SB; Mon, 09 Jan 2023 08:31:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1pEsEp-00016r-3l; Mon, 09 Jan 2023 08:31:00 -0500
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1pEsEn-00016P-Fx; Mon, 09 Jan 2023 08:30:54 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.7])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id C2411152198B2;
 Mon,  9 Jan 2023 14:30:48 +0100 (CET)
Received: from kaod.org (37.59.142.105) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Mon, 9 Jan
 2023 14:30:47 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G006c54f7ce2-ba88-47c0-9296-6db91aa9c8f0,
 1F76CF3ACB56F17C32A409AA235EFAF7B7A61927) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <d9194b49-9841-87b5-6355-b7d5f82da6b6@kaod.org>
Date: Mon, 9 Jan 2023 14:30:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 3/4] s390x/pv: Introduce a s390_pv_check() helper for
 runtime
Content-Language: en-US
To: Janosch Frank <frankja@linux.ibm.com>, <qemu-s390x@nongnu.org>
CC: <qemu-devel@nongnu.org>, Thomas Huth <thuth@redhat.com>, Halil Pasic
 <pasic@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>, David Hildenbrand
 <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>, Eric Farman
 <farman@linux.ibm.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>
References: <20230106075330.3662549-1-clg@kaod.org>
 <20230106075330.3662549-4-clg@kaod.org>
 <49bf32c7-4a44-a3c9-29b5-b6580113700c@linux.ibm.com>
 <bc3ec4b4-1c7a-a4a9-01ea-78fca7ad10c6@kaod.org>
 <8e04a10e-8978-494c-5d0f-2507e78134aa@linux.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <8e04a10e-8978-494c-5d0f-2507e78134aa@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG3EX2.mxp5.local (172.16.2.22) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 630045bd-16f7-4b19-b969-3bf305591ba9
X-Ovh-Tracer-Id: 1659576466123557877
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrkeeigdegkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepffdufeeliedujeeffffhjeffiefghffhhfdvkeeijeehledvueffhfejtdehgeegnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrddutdehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeotghlgheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehfrhgrnhhkjhgrsehlihhnuhigrdhisghmrdgtohhmpdhqvghmuhdqshefledtgiesnhhonhhgnhhurdhorhhgpdhqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdhthhhuthhhsehrvgguhhgrthdrtghomhdpphgrshhitgeslhhinhhugidrihgsmhdrtghomhdpsghorhhnthhrrggvghgvrheslhhinhhugidrihgsmhdrtghomhdpihhmsghrvghnuggrsehlihhnuhigrdhisghmrdgtohhmpdgurghvihgusehrvgguhhgrthdrtghomhdpihhiiheslhhinhhugidrihgsmh
 drtghomhdpfhgrrhhmrghnsehlihhnuhigrdhisghmrdgtohhmpdgtlhhgsehrvgguhhgrthdrtghomhdpoffvtefjohhsthepmhhohedvledpmhhouggvpehsmhhtphhouhht
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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

On 1/9/23 10:49, Janosch Frank wrote:
> On 1/9/23 10:27, Cédric Le Goater wrote:
>> On 1/9/23 10:04, Janosch Frank wrote:
>>> On 1/6/23 08:53, Cédric Le Goater wrote:
>>>> From: Cédric Le Goater <clg@redhat.com>
>>>>
>>>> If a secure kernel is started in a non-protected VM, the OS will hang
>>>> during boot without giving a proper error message to the user.
>>>
>>> Most of the time you see nothing in the console because libvirt is too slow. If you start the VM in paused mode, attach a console and then resume it, then you'll see a nice error message.
>>
>> If you wait long enough, the VM fails to mount / and falls into the dracut
>> initrams.
> 
> I have the feeling that we're not talking about the same thing here.>
  > A PV VM always starts out as a non-PV VM and is put into PV mode via two diag308 subcodes (8 & 10). ALL PV subcodes (8 - 10) are spec exceptions if the host isn't enabled for PV.

The corner case this patch is trying to address is for a PV-enabled host,
a secure enabled OS and !PV-enabled QEMU.

Please run this command on a secure disk image :

   qemu-system-s390x -M s390-ccw-virtio -accel kvm -drive file=<file>,if=virtio,format=qcow2 -nographic -nodefaults -serial mon:stdio

and tell me what you get.

Thanks,

C.

