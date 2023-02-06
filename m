Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 640D068BDDD
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 14:20:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP1PH-00089W-4i; Mon, 06 Feb 2023 08:19:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1pP1PC-000892-EM; Mon, 06 Feb 2023 08:19:34 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1pP1PA-0001JI-1m; Mon, 06 Feb 2023 08:19:33 -0500
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 316D0iDE023178; Mon, 6 Feb 2023 13:19:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=7TysIHuiAS7u9S4H3D3syb5td7SVQ48KPfWVAjxwN3E=;
 b=ZwkTN7fC61yGaUe8LWWsqLreLtb6no2zVaoc414ZQ13JHRFlsTW6SsSGAxl9kEzs7w9d
 bzO5YBtdb5NRokkGkH7N4au9i9wtn5jC9HX+c69bmHwjSTAvuKyhGuiEO4qKe1GoXGmK
 di/uTKOympxaPaPz+CAUFFNGX1+AoU51KF3MhXvXdNpa4DxGFPsjoLk2H2NiO//zKhSK
 cNXRj1e0467yGJ2uG90teGkHJTWXTOYzOuzG0yIqes3d8bQJfJTLO7dZtxXshyzOXDgD
 yGB8yKGgaEkvXpbhhbR/IuZw4Ez7XjPVWrjvier8e01KjhI/C3c0AJZrVIeRcOzrMprB rA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3nk2268mfu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Feb 2023 13:19:23 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 316D6NJA028058;
 Mon, 6 Feb 2023 13:19:23 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3nk2268mex-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Feb 2023 13:19:22 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3160HbYH023711;
 Mon, 6 Feb 2023 13:19:21 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
 by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3nhf06terr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Feb 2023 13:19:20 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com
 [10.20.54.105])
 by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 316DJHHY17826442
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 6 Feb 2023 13:19:17 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4A89020040;
 Mon,  6 Feb 2023 13:19:17 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F29342004B;
 Mon,  6 Feb 2023 13:19:15 +0000 (GMT)
Received: from [9.171.30.242] (unknown [9.171.30.242])
 by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Mon,  6 Feb 2023 13:19:15 +0000 (GMT)
Message-ID: <48fc8db0-0e5c-0097-afba-f21a2110f34c@linux.ibm.com>
Date: Mon, 6 Feb 2023 14:19:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v15 07/11] target/s390x/cpu topology: activating CPU
 topology
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, cohuck@redhat.com,
 mst@redhat.com, pbonzini@redhat.com, kvm@vger.kernel.org,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, eblake@redhat.com,
 armbru@redhat.com, seiden@linux.ibm.com, nrb@linux.ibm.com,
 nsg@linux.ibm.com, frankja@linux.ibm.com, berrange@redhat.com, clg@kaod.org
References: <20230201132051.126868-1-pmorel@linux.ibm.com>
 <20230201132051.126868-8-pmorel@linux.ibm.com>
 <b74543e8-5646-49da-2fab-8c5c69169d97@redhat.com>
From: Pierre Morel <pmorel@linux.ibm.com>
In-Reply-To: <b74543e8-5646-49da-2fab-8c5c69169d97@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: FFnGWNq1JbIGbWJA8QtK3h9dxdUvwzTj
X-Proofpoint-ORIG-GUID: kBQ_BUjwPFz3iVe19Fo2Z4czeuREvOYw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-06_06,2023-02-06_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 adultscore=0
 spamscore=0 mlxlogscore=999 clxscore=1015 mlxscore=0 bulkscore=0
 phishscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2302060111
Received-SPF: pass client-ip=148.163.158.5; envelope-from=pmorel@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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



On 2/6/23 12:57, Thomas Huth wrote:
> On 01/02/2023 14.20, Pierre Morel wrote:
>> The KVM capability KVM_CAP_S390_CPU_TOPOLOGY is used to
>> activate the S390_FEAT_CONFIGURATION_TOPOLOGY feature and
>> the topology facility in the host CPU model for the guest
>> in the case the topology is available in QEMU and in KVM.
>>
>> The feature is disabled by default and fenced for SE
>> (secure execution).
>>
>> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
>> ---
>>   hw/s390x/cpu-topology.c   |  2 +-
>>   target/s390x/cpu_models.c |  1 +
>>   target/s390x/kvm/kvm.c    | 12 ++++++++++++
>>   3 files changed, 14 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/s390x/cpu-topology.c b/hw/s390x/cpu-topology.c
>> index 1028bf4476..c33378577b 100644
>> --- a/hw/s390x/cpu-topology.c
>> +++ b/hw/s390x/cpu-topology.c
>> @@ -55,7 +55,7 @@ int s390_socket_nb(S390CPU *cpu)
>>    */
>>   bool s390_has_topology(void)
>>   {
>> -    return false;
>> +    return s390_has_feat(S390_FEAT_CONFIGURATION_TOPOLOGY);
>>   }
>>   /**
>> diff --git a/target/s390x/cpu_models.c b/target/s390x/cpu_models.c
>> index 065ec6d66c..aca2c5c96b 100644
>> --- a/target/s390x/cpu_models.c
>> +++ b/target/s390x/cpu_models.c
>> @@ -254,6 +254,7 @@ bool s390_has_feat(S390Feat feat)
>>           case S390_FEAT_SIE_CMMA:
>>           case S390_FEAT_SIE_PFMFI:
>>           case S390_FEAT_SIE_IBS:
>> +        case S390_FEAT_CONFIGURATION_TOPOLOGY:
>>               return false;
>>               break;
>>           default:
>> diff --git a/target/s390x/kvm/kvm.c b/target/s390x/kvm/kvm.c
>> index fb63be41b7..808e35a7bd 100644
>> --- a/target/s390x/kvm/kvm.c
>> +++ b/target/s390x/kvm/kvm.c
>> @@ -2470,6 +2470,18 @@ void kvm_s390_get_host_cpu_model(S390CPUModel 
>> *model, Error **errp)
>>           set_bit(S390_FEAT_UNPACK, model->features);
>>       }
>> +    /*
>> +     * If we have kernel support for CPU Topology indicate the
>> +     * configuration-topology facility.
>> +     */
>> +    if (kvm_check_extension(kvm_state, KVM_CAP_S390_CPU_TOPOLOGY)) {
>> +        if (kvm_vm_enable_cap(kvm_state, KVM_CAP_S390_CPU_TOPOLOGY, 
>> 0) < 0) {
>> +            error_setg(errp, "KVM: Error enabling 
>> KVM_CAP_S390_CPU_TOPOLOGY");
>> +            return;
>> +        }
>> +        set_bit(S390_FEAT_CONFIGURATION_TOPOLOGY, model->features);
>> +    }
> 
> Not sure, but for the other capabilities, the kvm_vm_enable_cap() is 
> rather done in kvm_arch_init() instead ... likely that it is properly 
> available in case you don't run with the "host" cpu model? So should the 
> kvm_vm_enable_cap(KVM_CAP_S390_CPU_TOPOLOGY) also be moved there (but of 
> course keep the set_bit() here in kvm_s390_get_host_cpu_model())?

I think you are right, I do this.
Thanks.

regards,
PIerre

> 
>   Thomas
> 

-- 
Pierre Morel
IBM Lab Boeblingen

