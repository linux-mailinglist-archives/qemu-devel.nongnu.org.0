Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5826D66D8E2
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 09:56:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHhlY-0005xs-8T; Tue, 17 Jan 2023 03:56:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pHhlT-0005xb-Ke
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 03:56:20 -0500
Received: from 4.mo548.mail-out.ovh.net ([188.165.42.229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pHhlQ-0000xN-Vp
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 03:56:19 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.123])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 356DB22E4F;
 Tue, 17 Jan 2023 08:56:11 +0000 (UTC)
Received: from kaod.org (37.59.142.98) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Tue, 17 Jan
 2023 09:56:10 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R0024c9caa45-7113-4612-a8c3-85f23c1dd52c,
 80E99EE0A2DD913C679298F6DB2E78D5E583611C) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <55422c35-79da-4695-f2bb-715ad5f4d936@kaod.org>
Date: Tue, 17 Jan 2023 09:56:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v3 2/3] s390x/pv: Introduce a s390_pv_check() helper for
 runtime
Content-Language: en-US
To: Janosch Frank <frankja@linux.ibm.com>, <qemu-s390x@nongnu.org>
CC: <qemu-devel@nongnu.org>, Thomas Huth <thuth@redhat.com>, Halil Pasic
 <pasic@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>, David Hildenbrand
 <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>, Eric Farman
 <farman@linux.ibm.com>, Sebastian Mitterle <smitterl@redhat.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>
References: <20230116174607.2459498-1-clg@kaod.org>
 <20230116174607.2459498-3-clg@kaod.org>
 <a386bb49-72de-6edc-9873-70ec59e475ab@linux.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <a386bb49-72de-6edc-9873-70ec59e475ab@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG2EX1.mxp5.local (172.16.2.11) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 9d02cecd-6306-4e11-abd2-ce3068fd553b
X-Ovh-Tracer-Id: 7109776438570028024
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedruddthedguddvkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepffdufeeliedujeeffffhjeffiefghffhhfdvkeeijeehledvueffhfejtdehgeegnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrdelkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegtlhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepfhhrrghnkhhjrgeslhhinhhugidrihgsmhdrtghomhdpqhgvmhhuqdhsfeeltdigsehnohhnghhnuhdrohhrghdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpthhhuhhthhesrhgvughhrghtrdgtohhmpdhprghsihgtsehlihhnuhigrdhisghmrdgtohhmpdgsohhrnhhtrhgrvghgvghrsehlihhnuhigrdhisghmrdgtohhmpdhimhgsrhgvnhgurgeslhhinhhugidrihgsmhdrtghomhdpuggrvhhiugesrhgvughhrghtrdgtohhmpdhiihhisehlihhnuhigrdhisg
 hmrdgtohhmpdhfrghrmhgrnheslhhinhhugidrihgsmhdrtghomhdpshhmihhtthgvrhhlsehrvgguhhgrthdrtghomhdptghlghesrhgvughhrghtrdgtohhmpdfovfetjfhoshhtpehmohehgeekpdhmohguvgepshhmthhpohhuth
Received-SPF: pass client-ip=188.165.42.229; envelope-from=clg@kaod.org;
 helo=4.mo548.mail-out.ovh.net
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.097,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 1/17/23 09:40, Janosch Frank wrote:
> On 1/16/23 18:46, Cédric Le Goater wrote:
>> From: Cédric Le Goater <clg@redhat.com>
>>
>> If a secure kernel is started in a non-protected VM, the OS will hang
>> during boot without giving a proper error message to the user.
> 
> Didn't we establish that you were missing the IOMMU flag so this statement isn't correct anymore?

yes. Which means it is pointless to run the machine because it will fail
to boot with no means to understand why.
  
> I haven't yet fully ingested my coffee, but from what I understand you would block a switch into PV mode if cgs is not set. Which would mean that PV KVM unit tests wouldn't start anymore as well as any VMs that have the unpack feature but not cgs.
>
> 
> And that's not something that we want.
> 
> You can start a PV VM without cgs if unpack is in the CPU model. The ONLY requirement that we should fail on is unpack.

ok.

> Have a look at what David Gibson put in the commit message when he introduced that in 651615d9:
> 
> """
> To integrate this with the option used by other platforms, we
> implement the following compromise:
> 
>   - When the confidential-guest-support option is set, s390 will
>     recognize it, verify that the CPU can support PV (failing if not)
>     and set virtio default options necessary for encrypted or protected
>     guests, as on other platforms.  i.e. if confidential-guest-support
>     is set, we will either create a guest capable of entering PV mode,
>     or fail outright.
> 
>   - If confidential-guest-support is not set, guests might still be
>     able to enter PV mode, if the CPU has the right model.  This may be
>     a little surprising, but shouldn't actually be harmful.
> """

yes and it is not that clear how a s390 PV machine should be started, even
for a developer.

Thanks for looking,

C.
  


