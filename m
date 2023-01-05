Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EDA065EE0C
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 14:58:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDQjl-0007Jk-UV; Thu, 05 Jan 2023 08:56:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1pDQjk-0007Hj-5m; Thu, 05 Jan 2023 08:56:52 -0500
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1pDQji-0001Sz-GL; Thu, 05 Jan 2023 08:56:51 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.111])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 337E015120467;
 Thu,  5 Jan 2023 14:56:45 +0100 (CET)
Received: from kaod.org (37.59.142.99) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Thu, 5 Jan
 2023 14:56:44 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-99G003bfccef8e-a3a7-47f9-9dfc-989897af528b,
 38A898BAFC987BCB81F2B5AC485E5C68320ADD45) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <fb2813a1-db81-a695-5cc2-3c48e4f3c8de@kaod.org>
Date: Thu, 5 Jan 2023 14:56:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 1/5] confidential guest support: Introduce a 'check' class
 handler
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, <qemu-s390x@nongnu.org>
CC: <qemu-devel@nongnu.org>, Halil Pasic <pasic@linux.ibm.com>, Christian
 Borntraeger <borntraeger@linux.ibm.com>, Richard Henderson
 <richard.henderson@linaro.org>, David Hildenbrand <david@redhat.com>, Ilya
 Leoshkevich <iii@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>, Eduardo Habkost
 <eduardo@habkost.net>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>, Yanan Wang
 <wangyanan55@huawei.com>
References: <20230104115111.3240594-1-clg@kaod.org>
 <20230104115111.3240594-2-clg@kaod.org>
 <fa7b4a10-0fd5-7435-53e0-89779f0f526f@redhat.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <fa7b4a10-0fd5-7435-53e0-89779f0f526f@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.99]
X-ClientProxiedBy: DAG4EX1.mxp5.local (172.16.2.31) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: e0e50634-ffb6-4b3e-9a34-8d3d1f8ac773
X-Ovh-Tracer-Id: 15500545494037269310
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrjeekgdehlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepffdufeeliedujeeffffhjeffiefghffhhfdvkeeijeehledvueffhfejtdehgeegnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrdelleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegtlhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepthhhuhhthhesrhgvughhrghtrdgtohhmpdhqvghmuhdqshefledtgiesnhhonhhgnhhurdhorhhgpdhqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdhprghsihgtsehlihhnuhigrdhisghmrdgtohhmpdgsohhrnhhtrhgrvghgvghrsehlihhnuhigrdhisghmrdgtohhmpdhrihgthhgrrhgurdhhvghnuggvrhhsohhnsehlihhnrghrohdrohhrghdpuggrvhhiugesrhgvughhrghtrdgtohhmpdhiihhisehlihhnuhigrdhisghmrdgtohhmpdhfrghrmhgrnheslhhinhhugi
 drihgsmhdrtghomhdptghlghesrhgvughhrghtrdgtohhmpdgvughurghrughosehhrggskhhoshhtrdhnvghtpdhmrghrtggvlhdrrghpfhgvlhgsrghumhesghhmrghilhdrtghomhdpphhhihhlmhgusehlihhnrghrohdrohhrghdpfigrnhhghigrnhgrnhehheeshhhurgifvghirdgtohhmpdfovfetjfhoshhtpehmohehvdelpdhmohguvgepshhmthhpohhuth
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.939,
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

On 1/5/23 09:46, Thomas Huth wrote:
> On 04/01/2023 12.51, Cédric Le Goater wrote:
>> From: Cédric Le Goater <clg@redhat.com>
>>
>> Some machines have specific requirements to activate confidential
>> guest support. Add a class handler to the confidential guest support
>> interface to let the arch implementation perform extra checks.
>>
>> Cc: Eduardo Habkost <eduardo@habkost.net>
>> Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
>> Cc: "Philippe Mathieu-Daudé" <philmd@linaro.org>
>> Cc: Yanan Wang <wangyanan55@huawei.com>
>> Signed-off-by: Cédric Le Goater <clg@redhat.com>
>> ---
>>   include/exec/confidential-guest-support.h |  4 +++-
>>   hw/core/machine.c                         | 11 ++++++-----
>>   2 files changed, 9 insertions(+), 6 deletions(-)
>>
>> diff --git a/include/exec/confidential-guest-support.h b/include/exec/confidential-guest-support.h
>> index ba2dd4b5df..9e6d362b26 100644
>> --- a/include/exec/confidential-guest-support.h
>> +++ b/include/exec/confidential-guest-support.h
>> @@ -23,7 +23,8 @@
>>   #include "qom/object.h"
>>   #define TYPE_CONFIDENTIAL_GUEST_SUPPORT "confidential-guest-support"
>> -OBJECT_DECLARE_SIMPLE_TYPE(ConfidentialGuestSupport, CONFIDENTIAL_GUEST_SUPPORT)
>> +OBJECT_DECLARE_TYPE(ConfidentialGuestSupport, ConfidentialGuestSupportClass,
>> +                    CONFIDENTIAL_GUEST_SUPPORT)
>>   struct ConfidentialGuestSupport {
>>       Object parent;
>> @@ -55,6 +56,7 @@ struct ConfidentialGuestSupport {
>>   typedef struct ConfidentialGuestSupportClass {
>>       ObjectClass parent;
>> +    bool (*check)(const Object *obj, Error **errp);
>>   } ConfidentialGuestSupportClass;
>>   #endif /* !CONFIG_USER_ONLY */
>> diff --git a/hw/core/machine.c b/hw/core/machine.c
>> index f589b92909..bab43cd675 100644
>> --- a/hw/core/machine.c
>> +++ b/hw/core/machine.c
>> @@ -502,11 +502,12 @@ static void machine_check_confidential_guest_support(const Object *obj,
>>                                                        Object *new_target,
>>                                                        Error **errp)
>>   {
>> -    /*
>> -     * So far the only constraint is that the target has the
>> -     * TYPE_CONFIDENTIAL_GUEST_SUPPORT interface, and that's checked
>> -     * by the QOM core
>> -     */
>> +    ConfidentialGuestSupportClass *cgsc =
>> +        CONFIDENTIAL_GUEST_SUPPORT_GET_CLASS(new_target);
>> +
>> +    if (cgsc->check) {
>> +        cgsc->check(obj, errp);
> 
> I assume the caller is checking *errp, so it's ok to ignore the return value of the check function here?

yes. routine machine_check_confidential_guest_support() is a direct parameter
of object_class_property_add_link() call, which checks *errp. See routine
object_set_link_property().

Thanks,

C.

> 
>> +    }
>>   }
>>   static bool machine_get_nvdimm(Object *obj, Error **errp)
> 
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> 


