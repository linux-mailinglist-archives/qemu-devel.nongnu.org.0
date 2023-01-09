Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1731B662876
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 15:29:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEt8l-0001zu-3a; Mon, 09 Jan 2023 09:28:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1pEt8i-0001vT-2K; Mon, 09 Jan 2023 09:28:41 -0500
Received: from 3.mo548.mail-out.ovh.net ([188.165.32.156])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1pEt8g-0000hN-0a; Mon, 09 Jan 2023 09:28:39 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.54])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 967502161C;
 Mon,  9 Jan 2023 14:28:33 +0000 (UTC)
Received: from kaod.org (37.59.142.101) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Mon, 9 Jan
 2023 15:28:32 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G0046024e1a8-a0df-4ea3-98ab-13b3660087e6,
 1F76CF3ACB56F17C32A409AA235EFAF7B7A61927) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <cbb2f628-dbf9-bce7-dd70-1280e2ce6515@kaod.org>
Date: Mon, 9 Jan 2023 15:28:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 1/4] s390x/pv: Implement a CGS check helper
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@redhat.com>, <qemu-s390x@nongnu.org>
CC: <qemu-devel@nongnu.org>, Halil Pasic <pasic@linux.ibm.com>, Christian
 Borntraeger <borntraeger@linux.ibm.com>, Claudio Imbrenda
 <imbrenda@linux.ibm.com>, <frankja@linux.ibm.com>, David Hildenbrand
 <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>, Eric Farman
 <farman@linux.ibm.com>
References: <20230106075330.3662549-1-clg@kaod.org>
 <20230106075330.3662549-2-clg@kaod.org>
 <db93e8a0-1591-1646-e920-e25842d76ec9@redhat.com>
 <cd41a799-3f5b-7503-66d7-c5a8c99611f9@redhat.com>
 <7f5de5f7-2bf1-869d-7b9b-ef44cbf78116@redhat.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <7f5de5f7-2bf1-869d-7b9b-ef44cbf78116@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG6EX2.mxp5.local (172.16.2.52) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 9efe4ca7-e0d3-4154-8e09-7961ee2be297
X-Ovh-Tracer-Id: 2634887259773832181
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrkeeigdeitdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepffdufeeliedujeeffffhjeffiefghffhhfdvkeeijeehledvueffhfejtdehgeegnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrddutddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeotghlgheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehthhhuthhhsehrvgguhhgrthdrtghomhdptghlghesrhgvughhrghtrdgtohhmpdhqvghmuhdqshefledtgiesnhhonhhgnhhurdhorhhgpdhqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdhprghsihgtsehlihhnuhigrdhisghmrdgtohhmpdgsohhrnhhtrhgrvghgvghrsehlihhnuhigrdhisghmrdgtohhmpdhimhgsrhgvnhgurgeslhhinhhugidrihgsmhdrtghomhdpfhhrrghnkhhjrgeslhhinhhugidrihgsmhdrtghomhdpuggrvhhiugesrhgvughhrghtrdgtoh
 hmpdhiihhisehlihhnuhigrdhisghmrdgtohhmpdhfrghrmhgrnheslhhinhhugidrihgsmhdrtghomhdpoffvtefjohhsthepmhhoheegkedpmhhouggvpehsmhhtphhouhht
Received-SPF: pass client-ip=188.165.32.156; envelope-from=clg@kaod.org;
 helo=3.mo548.mail-out.ovh.net
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

On 1/9/23 15:12, Thomas Huth wrote:
> On 09/01/2023 14.57, Cédric Le Goater wrote:
>> On 1/9/23 14:34, Thomas Huth wrote:
>>> On 06/01/2023 08.53, Cédric Le Goater wrote:
>>>> From: Cédric Le Goater <clg@redhat.com>
>>>>
>>>> When a protected VM is started with the maximum number of CPUs (248),
>>>> the service call providing information on the CPUs requires more
>>>> buffer space than allocated and QEMU disgracefully aborts :
>>>>
>>>>      LOADPARM=[........]
>>>>      Using virtio-blk.
>>>>      Using SCSI scheme.
>>>> ...................................................................................
>>>>      qemu-system-s390x: KVM_S390_MEM_OP failed: Argument list too long
>>>>
>>>> When protected virtualization is initialized, compute the maximum
>>>> number of vCPUs supported by the machine and return useful information
>>>> to the user before the machine starts in case of error.
>>>>
>>>> Suggested-by: Thomas Huth <thuth@redhat.com>
>>>> Signed-off-by: Cédric Le Goater <clg@redhat.com>
>>>> ---
>>>>   hw/s390x/pv.c | 40 ++++++++++++++++++++++++++++++++++++++++
>>>>   1 file changed, 40 insertions(+)
>>>>
>>>> diff --git a/hw/s390x/pv.c b/hw/s390x/pv.c
>>>> index 8dfe92d8df..8a1c71436b 100644
>>>> --- a/hw/s390x/pv.c
>>>> +++ b/hw/s390x/pv.c
>>>> @@ -20,6 +20,7 @@
>>>>   #include "exec/confidential-guest-support.h"
>>>>   #include "hw/s390x/ipl.h"
>>>>   #include "hw/s390x/pv.h"
>>>> +#include "hw/s390x/sclp.h"
>>>>   #include "target/s390x/kvm/kvm_s390x.h"
>>>>   static bool info_valid;
>>>> @@ -249,6 +250,41 @@ struct S390PVGuestClass {
>>>>       ConfidentialGuestSupportClass parent_class;
>>>>   };
>>>> +/*
>>>> + * If protected virtualization is enabled, the amount of data that the
>>>> + * Read SCP Info Service Call can use is limited to one page. The
>>>> + * available space also depends on the Extended-Length SCCB (ELS)
>>>> + * feature which can take more buffer space to store feature
>>>> + * information. This impacts the maximum number of CPUs supported in
>>>> + * the machine.
>>>> + */
>>>> +static uint32_t s390_pv_get_max_cpus(void)
>>>> +{
>>>> +    int offset_cpu = s390_has_feat(S390_FEAT_EXTENDED_LENGTH_SCCB) ?
>>>> +        offsetof(ReadInfo, entries) : SCLP_READ_SCP_INFO_FIXED_CPU_OFFSET;
>>>> +
>>>> +    return (TARGET_PAGE_SIZE - offset_cpu) / sizeof(CPUEntry);
>>>> +}
>>>> +
>>>> +static bool s390_pv_check_cpus(Error **errp)
>>>> +{
>>>> +    MachineState *ms = MACHINE(qdev_get_machine());
>>>> +    uint32_t pv_max_cpus = s390_pv_get_max_cpus();
>>>> +
>>>> +    if (ms->smp.max_cpus > pv_max_cpus) {
>>>> +        error_setg(errp, "Protected VMs support a maximum of %d CPUs",
>>>> +                   pv_max_cpus);
>>>> +        return false;
>>>> +    }
>>>> +
>>>> +    return true;
>>>> +}
>>>> +
>>>> +static bool s390_pv_guest_check(ConfidentialGuestSupport *cgs, Error **errp)
>>>> +{
>>>> +    return s390_pv_check_cpus(errp);
>>>> +}
>>>> +
>>>>   int s390_pv_kvm_init(ConfidentialGuestSupport *cgs, Error **errp)
>>>>   {
>>>>       if (!object_dynamic_cast(OBJECT(cgs), TYPE_S390_PV_GUEST)) {
>>>> @@ -261,6 +297,10 @@ int s390_pv_kvm_init(ConfidentialGuestSupport *cgs, Error **errp)
>>>>           return -1;
>>>>       }
>>>> +    if (!s390_pv_guest_check(cgs, errp)) {
>>>> +        return -1;
>>>> +    }
>>>> +
>>>>       cgs->ready = true;
>>>>       return 0;
>>>
>>> Looks good to me now.
>>>
>>> Reviewed-by: Thomas Huth <thuth@redhat.com>
>>
>> I think we could move the huge page test in s390_pv_guest_check() also.
>> We are finishing a discussion with Janosch on the runtime test and I will
>> send a v3.
> 
> Core question is likely: What if the hypervisor admin does not know whether the guest will run in protected mode or not, and thus always wants to enable the feature (so that the owner of the guest can decide)? 

If we take this direction, then, on a protected host, libvirt (or QEMU ?)
would need to set the VM as protected always : machine option and CGS
object passed on the command line.

> So we cannot know right from the start whether we have a confidential 
> guest or not? ... 

AFAIUI, it only depends on the kernel of the guest OS. A non secure
kernel runs fine in a protected VM. The PV switch is not performed
in diag308.

C.


> should we then really check the condition at the beginning, 
> or is it better to check when the guest tries to switch to protected mode?


