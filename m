Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B92A581FFE
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 08:19:20 +0200 (CEST)
Received: from localhost ([::1]:44138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGaO6-0008A9-No
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 02:19:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@linux.ibm.com>)
 id 1oGaIw-0006LZ-K5; Wed, 27 Jul 2022 02:13:59 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:11420
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@linux.ibm.com>)
 id 1oGaIu-0004Y3-C7; Wed, 27 Jul 2022 02:13:58 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26R5lYHd004389;
 Wed, 27 Jul 2022 06:13:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=/55CuUwGZ8oSs8y5RHPX54DbjpjXAa763bY36kB1dxU=;
 b=CUaxf7ow/mXtz7CAdLMO1EcNy3jh4MbTob+AUFRNtUK9iQrhffZVtojt+xFkHvolwWrO
 RYmhjFo8mRstGT3XIKn5RteDDOa5kLCRGgil0YRhjDGPGvKa2I2/1wetsWTo4Ynf2BEA
 8U2s5lHoRPrzc1m3yY/qpBukSqMhachWALdXhIP3Mizmvr24Rd/qvfhD73x/Kp7YbY2j
 1FpRNlQ9LsFmQ6VXTsTQFF3lkxhNy3bZRiy6o2YU6p3jOHK9KbzFveWyH+YucEocVsh2
 /bYYGXmLTp3Jx8FWdYONhBTAeug/wzYNYb9DSloTss4O3PwZYvCoDkRcD3L/PZ/FBPAu dw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3hjyh08np0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Jul 2022 06:13:53 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26R5w4Zj014878;
 Wed, 27 Jul 2022 06:13:53 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3hjyh08nn5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Jul 2022 06:13:53 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26R65BkI026539;
 Wed, 27 Jul 2022 06:13:51 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma03ams.nl.ibm.com with ESMTP id 3hh6eukbbk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Jul 2022 06:13:51 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 26R6Dmv119988956
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Jul 2022 06:13:48 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 03E2B42045;
 Wed, 27 Jul 2022 06:13:48 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ABBBC4204B;
 Wed, 27 Jul 2022 06:13:47 +0000 (GMT)
Received: from [9.171.41.21] (unknown [9.171.41.21])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 27 Jul 2022 06:13:47 +0000 (GMT)
Message-ID: <6e034c2e-25c3-3416-e0c4-993c4222d8ae@linux.ibm.com>
Date: Wed, 27 Jul 2022 08:13:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] s390x/cpumodel: add stfl197
 processor-activity-instrumentation extension 1
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>, Thomas Huth <thuth@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, qemu-s390x <qemu-s390x@nongnu.org>,
 Cornelia Huck <cohuck@redhat.com>, Janosch Frank <frankja@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20220726194852.171039-1-borntraeger@linux.ibm.com>
 <acee8628-7bfa-2f62-6ccb-e58f78bd56c2@redhat.com>
From: Christian Borntraeger <borntraeger@linux.ibm.com>
In-Reply-To: <acee8628-7bfa-2f62-6ccb-e58f78bd56c2@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: cCbD-3fhl4Hv8BEaaWLBRNdjrCT0YEe7
X-Proofpoint-ORIG-GUID: v8lpEPAneBziztZU8Aqh_iX1BrGeuFVR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-26_07,2022-07-26_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 mlxscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 phishscore=0 adultscore=0 suspectscore=0 bulkscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207270021
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=borntraeger@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
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



Am 26.07.22 um 22:00 schrieb David Hildenbrand:
> On 26.07.22 21:48, Christian Borntraeger wrote:
>> Add stfle 197 (processor-activity-instrumentation extension 1) to the
>> gen16 default model and fence it off for 7.0 and older.
> 
> QEMU is already in soft-freeze. I assume you want to get this still into
> 7.1. (decision not in my hands :) )

Right, 7.1 and 7.2 are both valid options.


> Anyhow, if a re-target to the next release is required or not
> 
> Reviewed-by: David Hildenbrand <david@redhat.com>
> 
>>
>> Signed-off-by: Christian Borntraeger <borntraeger@linux.ibm.com>
>> ---
>>   hw/s390x/s390-virtio-ccw.c          | 1 +
>>   target/s390x/cpu_features_def.h.inc | 1 +
>>   target/s390x/gen-features.c         | 2 ++
>>   3 files changed, 4 insertions(+)
>>
>> diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
>> index cc3097bfee80..6268aa5d0888 100644
>> --- a/hw/s390x/s390-virtio-ccw.c
>> +++ b/hw/s390x/s390-virtio-ccw.c
>> @@ -806,6 +806,7 @@ static void ccw_machine_7_0_instance_options(MachineState *machine)
>>       static const S390FeatInit qemu_cpu_feat = { S390_FEAT_LIST_QEMU_V7_0 };
>>   
>>       ccw_machine_7_1_instance_options(machine);
>> +    s390_cpudef_featoff_greater(16, 1, S390_FEAT_PAIE);
>>       s390_set_qemu_cpu_model(0x8561, 15, 1, qemu_cpu_feat);
>>   }
>>   
>> diff --git a/target/s390x/cpu_features_def.h.inc b/target/s390x/cpu_features_def.h.inc
>> index 3603e5fb12c6..e3cfe637354b 100644
>> --- a/target/s390x/cpu_features_def.h.inc
>> +++ b/target/s390x/cpu_features_def.h.inc
>> @@ -114,6 +114,7 @@ DEF_FEAT(VECTOR_PACKED_DECIMAL_ENH2, "vxpdeh2", STFL, 192, "Vector-Packed-Decima
>>   DEF_FEAT(BEAR_ENH, "beareh", STFL, 193, "BEAR-enhancement facility")
>>   DEF_FEAT(RDP, "rdp", STFL, 194, "Reset-DAT-protection facility")
>>   DEF_FEAT(PAI, "pai", STFL, 196, "Processor-Activity-Instrumentation facility")
>> +DEF_FEAT(PAIE, "paie", STFL, 197, "Processor-Activity-Instrumentation extension-1")
>>   
>>   /* Features exposed via SCLP SCCB Byte 80 - 98  (bit numbers relative to byte-80) */
>>   DEF_FEAT(SIE_GSLS, "gsls", SCLP_CONF_CHAR, 40, "SIE: Guest-storage-limit-suppression facility")
>> diff --git a/target/s390x/gen-features.c b/target/s390x/gen-features.c
>> index ad140184b903..1558c5262616 100644
>> --- a/target/s390x/gen-features.c
>> +++ b/target/s390x/gen-features.c
>> @@ -575,6 +575,7 @@ static uint16_t full_GEN16_GA1[] = {
>>       S390_FEAT_BEAR_ENH,
>>       S390_FEAT_RDP,
>>       S390_FEAT_PAI,
>> +    S390_FEAT_PAIE,
>>   };
>>   
>>   
>> @@ -669,6 +670,7 @@ static uint16_t default_GEN16_GA1[] = {
>>       S390_FEAT_BEAR_ENH,
>>       S390_FEAT_RDP,
>>       S390_FEAT_PAI,
>> +    S390_FEAT_PAIE,
>>   };
>>   
>>   /* QEMU (CPU model) features */
> 
> 

