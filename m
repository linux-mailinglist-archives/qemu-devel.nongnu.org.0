Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B466621F3
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 10:45:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEohf-0001e6-OW; Mon, 09 Jan 2023 04:44:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pEohd-0001da-1d
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 04:44:25 -0500
Received: from 1.mo548.mail-out.ovh.net ([178.32.121.110])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pEoha-0006mZ-TL
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 04:44:24 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.123])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 68032225FC;
 Mon,  9 Jan 2023 09:44:17 +0000 (UTC)
Received: from kaod.org (37.59.142.95) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Mon, 9 Jan
 2023 10:44:16 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G00119efc241-f879-4220-ab0b-949411256de6,
 1F76CF3ACB56F17C32A409AA235EFAF7B7A61927) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <6f591414-a65e-345b-f194-840e2a160b2b@kaod.org>
Date: Mon, 9 Jan 2023 10:44:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 2/4] s390x/pv: Check for support on the host
Content-Language: en-US
To: Janosch Frank <frankja@linux.ibm.com>, <qemu-s390x@nongnu.org>
CC: <qemu-devel@nongnu.org>, Thomas Huth <thuth@redhat.com>, Halil Pasic
 <pasic@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>, David Hildenbrand
 <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>, Eric Farman
 <farman@linux.ibm.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>
References: <20230106075330.3662549-1-clg@kaod.org>
 <20230106075330.3662549-3-clg@kaod.org>
 <2b69a682-692b-7151-caec-132182fa2e08@linux.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <2b69a682-692b-7151-caec-132182fa2e08@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG9EX2.mxp5.local (172.16.2.82) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 7db9aedd-6e3b-46b5-8d5b-c8bdd3333bc3
X-Ovh-Tracer-Id: 16280794130116479989
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrkeeigddtvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepffdufeeliedujeeffffhjeffiefghffhhfdvkeeijeehledvueffhfejtdehgeegnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrdelheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegtlhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepfhhrrghnkhhjrgeslhhinhhugidrihgsmhdrtghomhdpqhgvmhhuqdhsfeeltdigsehnohhnghhnuhdrohhrghdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpthhhuhhthhesrhgvughhrghtrdgtohhmpdhprghsihgtsehlihhnuhigrdhisghmrdgtohhmpdgsohhrnhhtrhgrvghgvghrsehlihhnuhigrdhisghmrdgtohhmpdhimhgsrhgvnhgurgeslhhinhhugidrihgsmhdrtghomhdpuggrvhhiugesrhgvughhrghtrdgtohhmpdhiihhisehlihhnuhigrdhisghmrd
 gtohhmpdhfrghrmhgrnheslhhinhhugidrihgsmhdrtghomhdptghlghesrhgvughhrghtrdgtohhmpdfovfetjfhoshhtpehmohehgeekpdhmohguvgepshhmthhpohhuth
Received-SPF: pass client-ip=178.32.121.110; envelope-from=clg@kaod.org;
 helo=1.mo548.mail-out.ovh.net
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

On 1/9/23 09:45, Janosch Frank wrote:
> On 1/6/23 08:53, Cédric Le Goater wrote:
>> From: Cédric Le Goater <clg@redhat.com>
>>
>> Support for protected VMs should have been enabled on the host with
>> the kernel parameter 'prot_virt=1'. If the hardware supports the
>> feature, it is reflected under sysfs.
>>
>> Reviewed-by: Thomas Huth <thuth@redhat.com>
>> Signed-off-by: Cédric Le Goater <clg@redhat.com>
> 
> Any reason why you didn't use KVM_CAP_S390_PROTECTED?

I think my setup was incorrect when I did the patch. I just verified and QEMU
indeed reports :

  qemu-system-s390x: CPU model does not support Protected Virtualization

which means S390_FEAT_UNPACK was not set.


> The sysfs interface isn't meant to be parsed by programs, it's been introduced for humans. Most of the interface's data has therefore been made available via the UV info API.

Well, QEMU is user space and does peek around in sysfs to collect some info.
Unneeded in that case.

Thanks,

C.



>> ---
>>   hw/s390x/pv.c | 23 ++++++++++++++++++++++-
>>   1 file changed, 22 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/s390x/pv.c b/hw/s390x/pv.c
>> index 8a1c71436b..d53ef8fd38 100644
>> --- a/hw/s390x/pv.c
>> +++ b/hw/s390x/pv.c
>> @@ -14,6 +14,7 @@
>>   #include <linux/kvm.h>
>>   #include "qapi/error.h"
>> +#include "qemu/cutils.h"
>>   #include "qemu/error-report.h"
>>   #include "sysemu/kvm.h"
>>   #include "qom/object_interfaces.h"
>> @@ -280,9 +281,29 @@ static bool s390_pv_check_cpus(Error **errp)
>>       return true;
>>   }
>> +#define S390_PV_HOST "/sys/firmware/uv/prot_virt_host"
>> +
>> +static bool s390_pv_check_host(Error **errp)
>> +{
>> +    gchar *s = NULL;
>> +    uint64_t pv_host = 0;
>> +
>> +    if (g_file_get_contents(S390_PV_HOST, &s, NULL, NULL)) {
>> +        pv_host = g_ascii_strtoull(s, NULL, 10);
>> +    }
>> +    g_free(s);
>> +
>> +    if (pv_host != 1) {
>> +        error_setg(errp, "Host does not support protected VMs");
>> +        return false;
>> +    }
>> +
>> +    return true;
>> +}
>> +
>>   static bool s390_pv_guest_check(ConfidentialGuestSupport *cgs, Error **errp)
>>   {
>> -    return s390_pv_check_cpus(errp);
>> +    return s390_pv_check_cpus(errp) && s390_pv_check_host(errp);
>>   }
>>   int s390_pv_kvm_init(ConfidentialGuestSupport *cgs, Error **errp)
> 


