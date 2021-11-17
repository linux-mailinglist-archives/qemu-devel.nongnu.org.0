Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD06E4549DC
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 16:26:01 +0100 (CET)
Received: from localhost ([::1]:33058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnMoy-0002gj-V5
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 10:26:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <walling@linux.ibm.com>)
 id 1mnMn6-0001G7-4K; Wed, 17 Nov 2021 10:24:04 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:42434
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <walling@linux.ibm.com>)
 id 1mnMn2-0005tR-Vm; Wed, 17 Nov 2021 10:24:03 -0500
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AHF4HJh013030; 
 Wed, 17 Nov 2021 15:23:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=cmppNbrrynmNH/C32KOtj9C1KL1ZLH9jj9i9m6n6e74=;
 b=Hjr2s8KmnwKROsh4NRLtu/ocr9S5/bQ3Gh/iRhspPlliUgCsGmLdM6UYkEBhYCja2OuC
 aRPLF1BNvGhiP0xd3AY+8imdriVK7sbnOd3qJbVuC0wUsii/qPa2qsvcTojqLS9rFXKC
 czaWt8osyLUGdzSYM7RJMSN6uGXz+NUPYGG8dtlVkqG/9l5MlYW4AeMwiB44jSvyX+pu
 UJ5ItEyeLOJ6dy518CexI5mzb08Gtq6I5Ri6D7DOuSvBm2rfg00fX66fC6EfryAImNgd
 EMTOLHs1DXIQlDbTyhiKVKi2yVSykgc5Wu8dTt5TSQV7ozSKI9VmIVR06YRyNHZHwtFy Lw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cd3tsgvyr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Nov 2021 15:23:58 +0000
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1AHF4hN6015168;
 Wed, 17 Nov 2021 15:23:58 GMT
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cd3tsgvye-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Nov 2021 15:23:58 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1AHEr0W4010320;
 Wed, 17 Nov 2021 15:23:57 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma03wdc.us.ibm.com with ESMTP id 3ca50bdy59-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Nov 2021 15:23:57 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1AHFNuXl56754500
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 17 Nov 2021 15:23:56 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 84BC8124052;
 Wed, 17 Nov 2021 15:23:56 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 26BB5124066;
 Wed, 17 Nov 2021 15:23:56 +0000 (GMT)
Received: from [9.160.104.209] (unknown [9.160.104.209])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 17 Nov 2021 15:23:56 +0000 (GMT)
Message-ID: <60eb1e73-124b-8ea6-61db-80f89e76b8fd@linux.ibm.com>
Date: Wed, 17 Nov 2021 10:23:55 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3] s390: kvm: adjust diag318 resets to retain data
Content-Language: en-US
To: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
References: <20211109205602.99732-1-walling@linux.ibm.com>
 <f82b3818-1b60-812c-6098-30aa7d434c6b@de.ibm.com>
From: Collin Walling <walling@linux.ibm.com>
In-Reply-To: <f82b3818-1b60-812c-6098-30aa7d434c6b@de.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 7UQ9aycPF5cezv-2xxUqdLBjK3i9YQjw
X-Proofpoint-ORIG-GUID: YOFG_GzWfTev0eggpeIpxF877NRNXPpX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-17_05,2021-11-17_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 clxscore=1011 mlxlogscore=999 phishscore=0 bulkscore=0 mlxscore=0
 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111170074
Received-SPF: pass client-ip=148.163.158.5; envelope-from=walling@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.009,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Michael Roth <michael.roth@amd.com>, thuth@redhat.com, cohuck@redhat.com,
 frankja@linux.ibm.com, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/17/21 02:43, Christian Borntraeger wrote:
> Am 09.11.21 um 21:56 schrieb Collin Walling:
>> The CPNC portion of the diag 318 data is erroneously reset during an
>> initial CPU reset caused by SIGP. Let's go ahead and relocate the
>> diag318_info field within the CPUS390XState struct such that it is
>> only zeroed during a clear reset. This way, the CPNC will be retained
>> for each VCPU in the configuration after the diag 318 instruction
>> has been invoked.
>>
>> Signed-off-by: Collin Walling <walling@linux.ibm.com>
>> Fixes: fabdada9357b ("s390: guest support for diagnose 0x318")
>> Reported-by: Christian Borntraeger <borntraeger@de.ibm.com>
> 
> Reviewed-by: Christian Borntraeger <borntraeger@linux.ibm.com>
> 
> maybe add cc stable just in case there will be one.
> Can you resend with the final patch description and add Thomas as TO
> (not cc)
> as this should probably go via Thomas tree.

Done. Thank you.

>> ---
>>
>> Changelog:
>>
>>      v2
>>      - handler uses run_on_cpu again
>>      - reworded commit message slightly
>>      - added fixes and reported-by tags
>>
>>      v3
>>      - nixed code reduction changes
>>      - added a comment to diag318 handler to briefly describe
>>          when relevent data is zeroed
>>
>> ---
>>   target/s390x/cpu.h     | 4 ++--
>>   target/s390x/kvm/kvm.c | 4 ++++
>>   2 files changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
>> index 3153d053e9..88aace36ff 100644
>> --- a/target/s390x/cpu.h
>> +++ b/target/s390x/cpu.h
>> @@ -63,6 +63,8 @@ struct CPUS390XState {
>>       uint64_t etoken;       /* etoken */
>>       uint64_t etoken_extension; /* etoken extension */
>>   +    uint64_t diag318_info;
>> +
>>       /* Fields up to this point are not cleared by initial CPU reset */
>>       struct {} start_initial_reset_fields;
>>   @@ -118,8 +120,6 @@ struct CPUS390XState {
>>       uint16_t external_call_addr;
>>       DECLARE_BITMAP(emergency_signals, S390_MAX_CPUS);
>>   -    uint64_t diag318_info;
>> -
>>   #if !defined(CONFIG_USER_ONLY)
>>       uint64_t tlb_fill_tec;   /* translation exception code during
>> tlb_fill */
>>       int tlb_fill_exc;        /* exception number seen during
>> tlb_fill */
>> diff --git a/target/s390x/kvm/kvm.c b/target/s390x/kvm/kvm.c
>> index 5b1fdb55c4..6acf14d5ec 100644
>> --- a/target/s390x/kvm/kvm.c
>> +++ b/target/s390x/kvm/kvm.c
>> @@ -1585,6 +1585,10 @@ void kvm_s390_set_diag318(CPUState *cs,
>> uint64_t diag318_info)
>>           env->diag318_info = diag318_info;
>>           cs->kvm_run->s.regs.diag318 = diag318_info;
>>           cs->kvm_run->kvm_dirty_regs |= KVM_SYNC_DIAG318;
>> +        /*
>> +         * diag 318 info is zeroed during a clear reset and
>> +         * diag 308 IPL subcodes.
>> +         */
>>       }
>>   }
>>  
> 


-- 
Regards,
Collin

Stay safe and stay healthy

