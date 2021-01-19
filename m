Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0482FB410
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 09:30:01 +0100 (CET)
Received: from localhost ([::1]:49746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1mOl-0005uo-LX
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 03:29:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1l1mNd-00053X-57; Tue, 19 Jan 2021 03:28:49 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:2556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1l1mNW-0007rZ-2l; Tue, 19 Jan 2021 03:28:47 -0500
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10J8JeXg029422; Tue, 19 Jan 2021 03:28:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=3oV7RXyfvx1jrTwu1TaQtEtYtMg8xsIwhXB9IYusL9A=;
 b=aL9srgApRNMndgwad+2Smm7rRNt2+Lcbf4Q+hOlWFvD79fUEMJ5zlpNKEYqabwuwNX/Z
 VuoAf2Cxck0JvaYsVSTgCQSLZjVFBcHuVlftKxPbEMTKypQB1Pm0+JKT5k1CuxHK8rZd
 5Ivt8ip/VYt+QnJN4Nk0jwitMgULUfHQ7L5GskrFu+J/jt2ZkOywYGYZWMGputKusp5V
 j7c6sc9oalvNxz7fQr42jr2xqePr/6EIo8t+R+gX906pds+F2WQlw38ttlra0Y6WyHxW
 qjyvc1xY6rEFWF4koEpi8o7D8suwtl6z44rf+TizFYJ88sE51+h0pPukjTRpw0H035G0 5g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 365utp85hs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Jan 2021 03:28:30 -0500
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 10J8K2Vr030558;
 Tue, 19 Jan 2021 03:28:30 -0500
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 365utp85gt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Jan 2021 03:28:29 -0500
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10J8RcmG009687;
 Tue, 19 Jan 2021 08:28:27 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma06fra.de.ibm.com with ESMTP id 363qdh9fru-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Jan 2021 08:28:27 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10J8SOhJ42926358
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Jan 2021 08:28:24 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 014644C04A;
 Tue, 19 Jan 2021 08:28:24 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D780E4C052;
 Tue, 19 Jan 2021 08:28:22 +0000 (GMT)
Received: from oc7455500831.ibm.com (unknown [9.171.35.184])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 19 Jan 2021 08:28:22 +0000 (GMT)
Subject: Re: [for-6.0 v5 11/13] spapr: PEF: prevent migration
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 David Hildenbrand <david@redhat.com>
References: <20201218124111.4957eb50.cohuck@redhat.com>
 <20210104071550.GA22585@ram-ibm-com.ibm.com>
 <20210104134629.49997b53.pasic@linux.ibm.com>
 <20210104184026.GD4102@ram-ibm-com.ibm.com>
 <20210105115614.7daaadd6.pasic@linux.ibm.com>
 <20210105204125.GE4102@ram-ibm-com.ibm.com>
 <20210111175914.13adfa2e.cohuck@redhat.com> <20210113124226.GH2938@work-vm>
 <20210114112517.GE1643043@redhat.com>
 <20210114235125.GO435587@yekko.fritz.box> <20210118173912.GF9899@work-vm>
From: Christian Borntraeger <borntraeger@de.ibm.com>
Message-ID: <2f358741-a9a5-a5d6-715c-c3dba85fbb17@de.ibm.com>
Date: Tue, 19 Jan 2021 09:28:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210118173912.GF9899@work-vm>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-19_01:2021-01-18,
 2021-01-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 mlxscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101190044
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=borntraeger@de.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.194,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Viktor Mihajlovski <mihajlov@linux.ibm.com>, pair@us.ibm.com,
 Marcelo Tosatti <mtosatti@redhat.com>, brijesh.singh@amd.com,
 Janosch Frank <frankja@linux.ibm.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>, Ram Pai <linuxram@us.ibm.com>,
 qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>,
 Halil Pasic <pasic@linux.ibm.com>, qemu-s390x@nongnu.org,
 Boris Fiuczynski <fiuczy@linux.ibm.com>, qemu-ppc@nongnu.org,
 pbonzini@redhat.com, thuth@redhat.com,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>, rth@twiddle.net,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 18.01.21 18:39, Dr. David Alan Gilbert wrote:
> * David Gibson (david@gibson.dropbear.id.au) wrote:
>> On Thu, Jan 14, 2021 at 11:25:17AM +0000, Daniel P. Berrangé wrote:
>>> On Wed, Jan 13, 2021 at 12:42:26PM +0000, Dr. David Alan Gilbert wrote:
>>>> * Cornelia Huck (cohuck@redhat.com) wrote:
>>>>> On Tue, 5 Jan 2021 12:41:25 -0800
>>>>> Ram Pai <linuxram@us.ibm.com> wrote:
>>>>>
>>>>>> On Tue, Jan 05, 2021 at 11:56:14AM +0100, Halil Pasic wrote:
>>>>>>> On Mon, 4 Jan 2021 10:40:26 -0800
>>>>>>> Ram Pai <linuxram@us.ibm.com> wrote:
>>>>>
>>>>>>>> The main difference between my proposal and the other proposal is...
>>>>>>>>
>>>>>>>>   In my proposal the guest makes the compatibility decision and acts
>>>>>>>>   accordingly.  In the other proposal QEMU makes the compatibility
>>>>>>>>   decision and acts accordingly. I argue that QEMU cannot make a good
>>>>>>>>   compatibility decision, because it wont know in advance, if the guest
>>>>>>>>   will or will-not switch-to-secure.
>>>>>>>>   
>>>>>>>
>>>>>>> You have a point there when you say that QEMU does not know in advance,
>>>>>>> if the guest will or will-not switch-to-secure. I made that argument
>>>>>>> regarding VIRTIO_F_ACCESS_PLATFORM (iommu_platform) myself. My idea
>>>>>>> was to flip that property on demand when the conversion occurs. David
>>>>>>> explained to me that this is not possible for ppc, and that having the
>>>>>>> "securable-guest-memory" property (or whatever the name will be)
>>>>>>> specified is a strong indication, that the VM is intended to be used as
>>>>>>> a secure VM (thus it is OK to hurt the case where the guest does not
>>>>>>> try to transition). That argument applies here as well.  
>>>>>>
>>>>>> As suggested by Cornelia Huck, what if QEMU disabled the
>>>>>> "securable-guest-memory" property if 'must-support-migrate' is enabled?
>>>>>> Offcourse; this has to be done with a big fat warning stating
>>>>>> "secure-guest-memory" feature is disabled on the machine.
>>>>>> Doing so, will continue to support guest that do not try to transition.
>>>>>> Guest that try to transition will fail and terminate themselves.
>>>>>
>>>>> Just to recap the s390x situation:
>>>>>
>>>>> - We currently offer a cpu feature that indicates secure execution to
>>>>>   be available to the guest if the host supports it.
>>>>> - When we introduce the secure object, we still need to support
>>>>>   previous configurations and continue to offer the cpu feature, even
>>>>>   if the secure object is not specified.
>>>>> - As migration is currently not supported for secured guests, we add a
>>>>>   blocker once the guest actually transitions. That means that
>>>>>   transition fails if --only-migratable was specified on the command
>>>>>   line. (Guests not transitioning will obviously not notice anything.)
>>>>> - With the secure object, we will already fail starting QEMU if
>>>>>   --only-migratable was specified.
>>>>>
>>>>> My suggestion is now that we don't even offer the cpu feature if
>>>>> --only-migratable has been specified. For a guest that does not want to
>>>>> transition to secure mode, nothing changes; a guest that wants to
>>>>> transition to secure mode will notice that the feature is not available
>>>>> and fail appropriately (or ultimately, when the ultravisor call fails).
>>>>> We'd still fail starting QEMU for the secure object + --only-migratable
>>>>> combination.
>>>>>
>>>>> Does that make sense?
>>>>
>>>> It's a little unusual; I don't think we have any other cases where
>>>> --only-migratable changes the behaviour; I think it normally only stops
>>>> you doing something that would have made it unmigratable or causes
>>>> an operation that would make it unmigratable to fail.
>>>
>>> I agree,  --only-migratable is supposed to be a *behavioural* toggle
>>> for QEMU. It must /not/ have any impact on the guest ABI.
>>>
>>> A management application needs to be able to add/remove --only-migratable
>>> at will without changing the exposing guest ABI.
>>
>> At the qemu level, it sounds like the right thing to do is to fail
>> outright if all of the below are true:
>>  1. --only-migratable is specified
>>  2. -cpu host is specified
>>  3. unpack isn't explicitly disabled
>>  4. the host CPU actually does have the unpack facility
>>
>> That can be changed if & when migration support is added for PV.
> 
> That sounds right to me.

as startup will fail anyway if the guest cpu model enables unpack, but the host
cpu does not support it this can be simplified to forbid startup in qemu if
--only-migratable is combined with unpack being active in the guest cpu model.

This is actually independent from this patch set.  maybe just
something like

diff --git a/target/s390x/cpu_models.c b/target/s390x/cpu_models.c
index 35179f9dc7ba..3b85ff4e31b2 100644
--- a/target/s390x/cpu_models.c
+++ b/target/s390x/cpu_models.c
@@ -26,6 +26,7 @@
 #include "qapi/qmp/qdict.h"
 #ifndef CONFIG_USER_ONLY
 #include "sysemu/arch_init.h"
+#include "sysemu/sysemu.h"
 #include "hw/pci/pci.h"
 #endif
 #include "qapi/qapi-commands-machine-target.h"
@@ -878,6 +879,11 @@ static void check_compatibility(const S390CPUModel *max_model,
         return;
     }
 
+    if (only_migratable && test_bit(S390_FEAT_UNPACK, model->features)) {
+        error_setg(errp, "The unpack facility is not compatible with "
+                  "the --only-migratable option");
+    }
+
     /* detect the missing features to properly report them */
     bitmap_andnot(missing, model->features, max_model->features, S390_FEAT_MAX);
     if (bitmap_empty(missing, S390_FEAT_MAX)) {



