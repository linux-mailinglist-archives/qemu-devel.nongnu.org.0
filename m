Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD3C1CF899
	for <lists+qemu-devel@lfdr.de>; Tue, 12 May 2020 17:08:59 +0200 (CEST)
Received: from localhost ([::1]:49668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jYWWg-0007g0-OB
	for lists+qemu-devel@lfdr.de; Tue, 12 May 2020 11:08:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <walling@linux.ibm.com>)
 id 1jYWKF-0001zM-N2; Tue, 12 May 2020 10:56:09 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:6208)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <walling@linux.ibm.com>)
 id 1jYWKC-0006qJ-RO; Tue, 12 May 2020 10:56:07 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04CEmIqp195434; Tue, 12 May 2020 10:56:00 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30ws5f5kck-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 May 2020 10:56:00 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 04CEmV80196537;
 Tue, 12 May 2020 10:55:59 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30ws5f5kbx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 May 2020 10:55:59 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 04CEoVrf013367;
 Tue, 12 May 2020 14:55:58 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma01wdc.us.ibm.com with ESMTP id 30wm56j3r8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 May 2020 14:55:58 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 04CEtw8g54722894
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 12 May 2020 14:55:58 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F07D6AC059;
 Tue, 12 May 2020 14:55:57 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 55F50AC05B;
 Tue, 12 May 2020 14:55:57 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.85.150.178])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTPS;
 Tue, 12 May 2020 14:55:57 +0000 (GMT)
Subject: Re: [PATCH v1 3/8] s390/sclp: rework sclp boundary and length checks
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org
References: <20200508230823.22956-1-walling@linux.ibm.com>
 <20200508230823.22956-4-walling@linux.ibm.com>
 <d894a835-d0ea-2d61-0416-c4804a755dca@redhat.com>
From: Collin Walling <walling@linux.ibm.com>
Message-ID: <75157d93-2f4d-db25-4a0d-fdb4a7781135@linux.ibm.com>
Date: Tue, 12 May 2020 10:55:56 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <d894a835-d0ea-2d61-0416-c4804a755dca@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-12_04:2020-05-11,
 2020-05-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0
 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0 mlxlogscore=999
 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2005120110
Received-SPF: pass client-ip=148.163.156.1; envelope-from=walling@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/12 10:56:00
X-ACL-Warn: Detected OS   = Linux 3.x [generic]
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, KHOP_DYNAMIC=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: frankja@linux.ibm.com, mst@redhat.com, cohuck@redhat.com,
 pasic@linux.ibm.com, borntraeger@de.ibm.com, svens@linux.ibm.com,
 pbonzini@redhat.com, mihajlov@linux.ibm.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/12/20 3:21 AM, David Hildenbrand wrote:
> On 09.05.20 01:08, Collin Walling wrote:
>> Let's factor out the SCLP boundary and length checks
>> into separate functions.
>>
>> Signed-off-by: Collin Walling <walling@linux.ibm.com>
>> ---
>>   hw/s390x/sclp.c | 41 +++++++++++++++++++++++++++++++++++------
>>   1 file changed, 35 insertions(+), 6 deletions(-)
>>
>> diff --git a/hw/s390x/sclp.c b/hw/s390x/sclp.c
>> index d08a291e40..470d5da7a2 100644
>> --- a/hw/s390x/sclp.c
>> +++ b/hw/s390x/sclp.c
>> @@ -49,6 +49,34 @@ static inline bool sclp_command_code_valid(uint32_t code)
>>       return false;
>>   }
>>   
>> +static bool check_sccb_boundary_valid(uint64_t sccb_addr, uint32_t code,
>> +                                      SCCB *sccb)
> 
> I suggest naming this
> 
> "has_valid_sccb_boundary", then the true/false response is clearer.
> 
>> +{
>> +    uint64_t current_len = sccb_addr + be16_to_cpu(sccb->h.length);
>> +    uint64_t allowed_len = (sccb_addr & PAGE_MASK) + PAGE_SIZE;
>> +
>> +    switch (code & SCLP_CMD_CODE_MASK) {
>> +    default:
>> +        if (current_len <= allowed_len) {
>> +            return true;
>> +        }
>> +    }
>> +    sccb->h.response_code = cpu_to_be16(SCLP_RC_SCCB_BOUNDARY_VIOLATION);
>> +    return false;
>> +}
>> +
>> +static bool check_sufficient_sccb_len(SCCB *sccb, int size)
> 
> "has_sufficient_sccb_len" ?
> 
>> +{
>> +    MachineState *ms = MACHINE(qdev_get_machine());
>> +    int required_len = size + ms->possible_cpus->len * sizeof(CPUEntry);
> 
> Rather pass in the number of cpus instead. Looking up the machine again
> in here is ugly.

prepare_cpu_entries also looks up the machine again. Should I squeeze
in a cleanup where we pass the machine to that function too (perhaps
in the "remove SCLPDevice" patch)?

> 
>> +
>> +    if (be16_to_cpu(sccb->h.length) < required_len) {
>> +        sccb->h.response_code = cpu_to_be16(SCLP_RC_INSUFFICIENT_SCCB_LENGTH);
>> +        return false;
>> +    }
>> +    return true;
>> +}
>> +
>>   static void prepare_cpu_entries(CPUEntry *entry, int *count)
>>   {
>>       MachineState *ms = MACHINE(qdev_get_machine());
>> @@ -76,8 +104,7 @@ static void read_SCP_info(SCLPDevice *sclp, SCCB *sccb)
>>       int rnsize, rnmax;
>>       IplParameterBlock *ipib = s390_ipl_get_iplb();
>>   
>> -    if (be16_to_cpu(sccb->h.length) < (sizeof(ReadInfo) + cpu_count * sizeof(CPUEntry))) {
>> -        sccb->h.response_code = cpu_to_be16(SCLP_RC_INSUFFICIENT_SCCB_LENGTH);
>> +    if (!check_sufficient_sccb_len(sccb, sizeof(ReadInfo))) {
>>           return;
>>       }
>>   
>> @@ -134,8 +161,7 @@ static void sclp_read_cpu_info(SCLPDevice *sclp, SCCB *sccb)
>>       ReadCpuInfo *cpu_info = (ReadCpuInfo *) sccb;
>>       int cpu_count;
>>   
>> -    if (be16_to_cpu(sccb->h.length) < (sizeof(ReadCpuInfo) + cpu_count * sizeof(CPUEntry))) {
>> -        sccb->h.response_code = cpu_to_be16(SCLP_RC_INSUFFICIENT_SCCB_LENGTH);
>> +    if (!check_sufficient_sccb_len(sccb, sizeof(ReadCpuInfo))) {
>>           return;
>>       }
>>   
>> @@ -227,6 +253,10 @@ int sclp_service_call_protected(CPUS390XState *env, uint64_t sccb,
>>           goto out_write;
>>       }
>>   
>> +    if (!check_sccb_boundary_valid(sccb, code, &work_sccb)) {
>> +        goto out_write;
>> +    }
> 
> This is not a "factor out". You're adding new code, this needs
> justification in the patch description.

True. I'll fix up the message.

> 
>> +
>>       sclp_c->execute(sclp, &work_sccb, code);
>>   out_write:
>>       s390_cpu_pv_mem_write(env_archcpu(env), 0, &work_sccb,
>> @@ -272,8 +302,7 @@ int sclp_service_call(CPUS390XState *env, uint64_t sccb, uint32_t code)
>>           goto out_write;
>>       }
>>   
>> -    if ((sccb + be16_to_cpu(work_sccb.h.length)) > ((sccb & PAGE_MASK) + PAGE_SIZE)) {
>> -        work_sccb.h.response_code = cpu_to_be16(SCLP_RC_SCCB_BOUNDARY_VIOLATION);
>> +    if (!check_sccb_boundary_valid(sccb, code, &work_sccb)) {
>>           goto out_write;
>>       }
>>   
>>
> 
> 

Renamed functions. Thanks for the review!

-- 
--
Regards,
Collin

Stay safe and stay healthy

