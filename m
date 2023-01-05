Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29FC865EF21
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 15:47:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDRWZ-0001jk-87; Thu, 05 Jan 2023 09:47:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pDRWQ-0001fe-4t
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 09:47:10 -0500
Received: from 6.mo548.mail-out.ovh.net ([188.165.58.48])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pDRWO-0006qX-8c
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 09:47:09 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.236])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 6271D20236;
 Thu,  5 Jan 2023 14:47:04 +0000 (UTC)
Received: from kaod.org (37.59.142.106) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Thu, 5 Jan
 2023 15:47:03 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R0060ed8c244-58d9-415e-9c56-16e144f7f135,
 38A898BAFC987BCB81F2B5AC485E5C68320ADD45) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <41e8c81a-ac90-3b57-c34b-c4e461323391@kaod.org>
Date: Thu, 5 Jan 2023 15:47:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 2/5] s390x/pv: Implement CGS check handler
Content-Language: en-US
To: Claudio Imbrenda <imbrenda@linux.ibm.com>, Thomas Huth <thuth@redhat.com>
CC: <qemu-s390x@nongnu.org>, <qemu-devel@nongnu.org>, Halil Pasic
 <pasic@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>, David Hildenbrand
 <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>, Eric Farman
 <farman@linux.ibm.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>
References: <20230104115111.3240594-1-clg@kaod.org>
 <20230104115111.3240594-3-clg@kaod.org>
 <61d70e15-770b-7f62-54aa-3cc0ac3b3a35@redhat.com>
 <20230105145823.6a7345e6@p-imbrenda>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20230105145823.6a7345e6@p-imbrenda>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG2EX1.mxp5.local (172.16.2.11) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 5314fbbc-113c-403b-9eb7-d48c72ebd1b2
X-Ovh-Tracer-Id: 16350318448438774773
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrjeekgdejtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepffdufeeliedujeeffffhjeffiefghffhhfdvkeeijeehledvueffhfejtdehgeegnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrddutdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeotghlgheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehimhgsrhgvnhgurgeslhhinhhugidrihgsmhdrtghomhdpthhhuhhthhesrhgvughhrghtrdgtohhmpdhqvghmuhdqshefledtgiesnhhonhhgnhhurdhorhhgpdhqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdhprghsihgtsehlihhnuhigrdhisghmrdgtohhmpdgsohhrnhhtrhgrvghgvghrsehlihhnuhigrdhisghmrdgtohhmpdhrihgthhgrrhgurdhhvghnuggvrhhsohhnsehlihhnrghrohdrohhrghdpuggrvhhiugesrhgvughhrghtrdgtohhmpdhiihhisehlih
 hnuhigrdhisghmrdgtohhmpdhfrghrmhgrnheslhhinhhugidrihgsmhdrtghomhdptghlghesrhgvughhrghtrdgtohhmpdfovfetjfhoshhtpehmohehgeekpdhmohguvgepshhmthhpohhuth
Received-SPF: pass client-ip=188.165.58.48; envelope-from=clg@kaod.org;
 helo=6.mo548.mail-out.ovh.net
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.939,
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

On 1/5/23 14:58, Claudio Imbrenda wrote:
> On Thu, 5 Jan 2023 12:42:54 +0100
> Thomas Huth <thuth@redhat.com> wrote:
> 
>> On 04/01/2023 12.51, Cédric Le Goater wrote:
>>> From: Cédric Le Goater <clg@redhat.com>
>>>
>>> When a protected VM is started with the maximum number of CPUs (248),
>>> the service call providing information on the CPUs requires more
>>> buffer space than allocated and QEMU disgracefully aborts :
>>>
>>>       LOADPARM=[........]
>>>       Using virtio-blk.
>>>       Using SCSI scheme.
>>>       ...................................................................................
>>>       qemu-system-s390x: KVM_S390_MEM_OP failed: Argument list too long
>>>
>>> Implement a test for this limitation in the ConfidentialGuestSupportClass
>>> check handler and provide some valid information to the user before the
>>> machine starts.
>>>
>>> Signed-off-by: Cédric Le Goater <clg@redhat.com>
>>> ---
>>>    hw/s390x/pv.c | 23 +++++++++++++++++++++++
>>>    1 file changed, 23 insertions(+)
>>>
>>> diff --git a/hw/s390x/pv.c b/hw/s390x/pv.c
>>> index 8dfe92d8df..3a7ec70634 100644
>>> --- a/hw/s390x/pv.c
>>> +++ b/hw/s390x/pv.c
>>> @@ -266,6 +266,26 @@ int s390_pv_kvm_init(ConfidentialGuestSupport *cgs, Error **errp)
>>>        return 0;
>>>    }
>>>    
>>> +static bool s390_pv_check_cpus(Error **errp)
>>> +{
>>> +    MachineState *ms = MACHINE(qdev_get_machine());
>>> +    MachineClass *mc = MACHINE_GET_CLASS(ms);
>>> +    uint32_t pv_max_cpus = mc->max_cpus - 1;
>>
>> Not sure whether "mc->max_cpus - 1" is the right approach here. I think it
>> would be better to calculate the amount of CPUs that we can support.
>>
>> So AFAIK the problem is that SCLP information that is gathered during
>> read_SCP_info() in hw/s390x/sclp.c. If protected virtualization is enabled,
>> everything has to fit in one page (i.e. 4096 bytes) there.
>>
>> So we have space for
>>
>>    (TARGET_PAGE_SIZE - offset_cpu) / sizeof(CPUEntry)
>>
>> CPUs.
>>
>> With S390_FEAT_EXTENDED_LENGTH_SCCB enabled, offset_cpu is 144 (see struct
>> ReadInfo in sclp.h), otherwise it is 128.
>>
>> That means, with S390_FEAT_EXTENDED_LENGTH_SCCB we can have a maximum of:
>>
>>    (4096 - 144) / 16 = 247 CPUs
>>
>> which is what you were trying to check with the mc->max_cpus - 1 here.

yes. That's much better.

>> But with "-cpu els=off", it sounds like we could fit all 248 also with
>> protected VMs? Could you please give it a try?

It runs. Unfortunately, QEMU also complains with :

   qemu-system-s390x: warning: 'diag318' requires 'els'.
   qemu-system-s390x: warning: 'diag318' requires 'els'.
   qemu-system-s390x: warning: 'diag318' requires 'els'.

when els is off.


>> Anyway, instead of using "pv_max_cpus = mc->max_cpus - 1" I'd suggest to use
>> something like this instead:
>>
>>    int offset_cpu = s390_has_feat(S390_FEAT_EXTENDED_LENGTH_SCCB) ?
>>                        offsetof(ReadInfo, entries) :
>>                        SCLP_READ_SCP_INFO_FIXED_CPU_OFFSET;
>>    pv_max_cpus = (TARGET_PAGE_SIZE - offset_cpu) /sizeof(CPUEntry);
> 
> I agree with Thomas here


The problem is that QEMU doesn't know about the S390_FEAT_EXTENDED_LENGTH_SCCB
feature when the PV object link is first checked. So #248 CPUs is considered
valid, but when DIAG308_PV_START is called, it fails.

Let's simplify and use :

     int offset_cpu = offsetof(ReadInfo, entries);
     pv_max_cpus = (TARGET_PAGE_SIZE - offset_cpu) /sizeof(CPUEntry);

?

Thanks,

C.


