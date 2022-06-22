Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D42554F0E
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 17:24:21 +0200 (CEST)
Received: from localhost ([::1]:60586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o42DM-0000Y8-1d
	for lists+qemu-devel@lfdr.de; Wed, 22 Jun 2022 11:24:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1o429o-0006H4-2C; Wed, 22 Jun 2022 11:20:40 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:17092
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1o429m-0005Wp-A0; Wed, 22 Jun 2022 11:20:39 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25MEFw9v006068;
 Wed, 22 Jun 2022 15:20:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=5jMDKdNdVlvLkEE67QMTyiBwO7REBM0YnetzVzjxonU=;
 b=ebfxNaUVTrinrAvaosvWaEX10Sv6zbhFB5XV+m+dq7G/UHjalC8zKb+r0YZyG5X8E57t
 /E1XzXO0mnNjsCcYVDqrvpX7Rocd75u+K/ONXeJ/bXupwCp/3IVDo6iNc+KdX3BqauH9
 ksy2mF0yCbTBqGR73+3pWPCocyRl5CDcavSHd+Eh5MCA9Jn1mYEnFsrXy7fpzhjDh81y
 UccYwf5/PPaKMKDGXDRFCcUEOPCGeAgAzSlRiw6gtUxyVfOjNGO02CkTOTQTERG6K3jD
 j76lSTUzHxeva39+2EAnZQ+3oR6yDBdpAa9nCeui3zIFrlQ9TsCLeG+7M2M5e76Tawhz mg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3gv4pq9qf2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Jun 2022 15:20:35 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 25MF7aiC002454;
 Wed, 22 Jun 2022 15:20:35 GMT
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3gv4pq9qew-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Jun 2022 15:20:35 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25MF5Wcp023144;
 Wed, 22 Jun 2022 15:20:34 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma03wdc.us.ibm.com with ESMTP id 3gs6bakem2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Jun 2022 15:20:34 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 25MFKXiO33554850
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Jun 2022 15:20:33 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 81C1C78067;
 Wed, 22 Jun 2022 15:20:33 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3A6157805E;
 Wed, 22 Jun 2022 15:20:32 +0000 (GMT)
Received: from [9.211.143.38] (unknown [9.211.143.38])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 22 Jun 2022 15:20:32 +0000 (GMT)
Message-ID: <3ac2e525-87b4-b906-9830-5d89f5d006df@linux.ibm.com>
Date: Wed, 22 Jun 2022 11:20:31 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v7 8/8] s390x/s390-virtio-ccw: add zpcii-disable machine
 property
Content-Language: en-US
To: Pierre Morel <pmorel@linux.ibm.com>, qemu-s390x@nongnu.org
Cc: alex.williamson@redhat.com, schnelle@linux.ibm.com, cohuck@redhat.com,
 thuth@redhat.com, farman@linux.ibm.com, richard.henderson@linaro.org,
 david@redhat.com, pasic@linux.ibm.com, borntraeger@linux.ibm.com,
 mst@redhat.com, pbonzini@redhat.com, qemu-devel@nongnu.org,
 kvm@vger.kernel.org
References: <20220606203614.110928-1-mjrosato@linux.ibm.com>
 <20220606203614.110928-9-mjrosato@linux.ibm.com>
 <a39b5023-8db2-fb13-8afd-67c18fbe7d53@linux.ibm.com>
From: Matthew Rosato <mjrosato@linux.ibm.com>
In-Reply-To: <a39b5023-8db2-fb13-8afd-67c18fbe7d53@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: EmX2JcrHFDQgIk14mB3B8uYKYh-ECNr1
X-Proofpoint-GUID: PmPbVVf2hESQXi31nelAkUFKNUA-Uh-b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-22_04,2022-06-22_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 mlxscore=0 mlxlogscore=999 priorityscore=1501 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206220075
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=mjrosato@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/22/22 4:50 AM, Pierre Morel wrote:
> 
> 
> On 6/6/22 22:36, Matthew Rosato wrote:
>> The zpcii-disable machine property can be used to force-disable the use
>> of zPCI interpretation facilities for a VM.  By default, this setting
>> will be off for machine 7.1 and newer.
>>
>> Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
>> ---
>>   hw/s390x/s390-pci-kvm.c            |  4 +++-
>>   hw/s390x/s390-virtio-ccw.c         | 24 ++++++++++++++++++++++++
>>   include/hw/s390x/s390-virtio-ccw.h |  1 +
>>   qemu-options.hx                    |  8 +++++++-
>>   util/qemu-config.c                 |  4 ++++
>>   5 files changed, 39 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/s390x/s390-pci-kvm.c b/hw/s390x/s390-pci-kvm.c
>> index 9134fe185f..5eb7fd12e2 100644
>> --- a/hw/s390x/s390-pci-kvm.c
>> +++ b/hw/s390x/s390-pci-kvm.c
>> @@ -22,7 +22,9 @@
>>   bool s390_pci_kvm_interp_allowed(void)
>>   {
>> -    return kvm_s390_get_zpci_op() && !s390_is_pv();
>> +    return (kvm_s390_get_zpci_op() && !s390_is_pv() &&
>> +            !object_property_get_bool(OBJECT(qdev_get_machine()),
>> +                                      "zpcii-disable", NULL));
>>   }
> 
> Isn't it a duplication of machine_get_zpcii_disable?
> 

No, this will actually trigger machine_get_zpcii_disable -- it was setup 
as the 'getter' routine in s390_machine_initfn() -- see below:

> Wouldn't it better go to hw/s390x/kvm/ ?
> 
> There get the MachineState *ms = MACHINE(qdev_get_machine()) and return 
> the ms->zpcii_disable
> 
> ?
> 
>>   int s390_pci_kvm_aif_enable(S390PCIBusDevice *pbdev, ZpciFib *fib, 
>> bool assist)
>> diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
>> index cc3097bfee..70229b102b 100644
>> --- a/hw/s390x/s390-virtio-ccw.c
>> +++ b/hw/s390x/s390-virtio-ccw.c
>> @@ -645,6 +645,21 @@ static inline void 
>> machine_set_dea_key_wrap(Object *obj, bool value,
>>       ms->dea_key_wrap = value;
>>   }
>> +static inline bool machine_get_zpcii_disable(Object *obj, Error **errp)
>> +{
>> +    S390CcwMachineState *ms = S390_CCW_MACHINE(obj);
>> +
>> +    return ms->zpcii_disable;
>> +}
>> +
>> +static inline void machine_set_zpcii_disable(Object *obj, bool value,
>> +                                             Error **errp)
>> +{
>> +    S390CcwMachineState *ms = S390_CCW_MACHINE(obj);
>> +
>> +    ms->zpcii_disable = value;
>> +}
>> +
>>   static S390CcwMachineClass *current_mc;
>>   /*
>> @@ -740,6 +755,13 @@ static inline void s390_machine_initfn(Object *obj)
>>               "Up to 8 chars in set of [A-Za-z0-9. ] (lower case chars 
>> converted"
>>               " to upper case) to pass to machine loader, boot manager,"
>>               " and guest kernel");
>> +
>> +    object_property_add_bool(obj, "zpcii-disable",
>> +                             machine_get_zpcii_disable,

^^ Here.

