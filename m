Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76EA36F3CD4
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 07:02:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pti8P-0003Zj-KR; Tue, 02 May 2023 01:01:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <harshpb@linux.ibm.com>)
 id 1pti8K-0003Yz-IL; Tue, 02 May 2023 01:01:02 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <harshpb@linux.ibm.com>)
 id 1pti8G-00065G-Gh; Tue, 02 May 2023 01:00:59 -0400
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3424ulRg013853; Tue, 2 May 2023 05:00:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=rikjqwOHd3Gr6O0CoNxGGKXf+4lfUxzB/Js4gOmDsm0=;
 b=D7UqtTGeTDju91V2/FL1wMN+JV0Ig0/e6Irf3cjvNlTnrM0CO0Z/m52d4HTNMXdf5qv9
 qT+HmNVS30YOgHdqGMrUWrYfWByMjxlDs0BS/9So2N4wy55tw3MEwWH18ED/59ZT6EWR
 qUE0hwictmWMVtnHZaPaPXD6aQrBkCPogibp0CNg/D80PB7yBKfWaGnK7KnW6NTs7U4W
 MlPKCWq89aDA0rils/1P7Jo50SjL1qw+fEEDkbWjloudMdhoGQl1dI3Isy+hiyTaiAh6
 3xJYRq/ShgBCBKaJyAOv0guzQ66pbdngZyAMIbpTYZv8JvPK/UwKbZu6LBS9F83Y2YIF ow== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qat7d9u87-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 May 2023 05:00:52 +0000
Received: from m0353722.ppops.net (m0353722.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3424xFFH021673;
 Tue, 2 May 2023 05:00:51 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qat7d9u7r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 May 2023 05:00:51 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3421ixJI002611;
 Tue, 2 May 2023 05:00:51 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([9.208.129.120])
 by ppma02wdc.us.ibm.com (PPS) with ESMTPS id 3q8tv85rss-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 May 2023 05:00:50 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com
 [10.241.53.104])
 by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 34250nbn30605680
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 2 May 2023 05:00:49 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 845A158052;
 Tue,  2 May 2023 05:00:49 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4658E58065;
 Tue,  2 May 2023 05:00:47 +0000 (GMT)
Received: from [9.43.49.207] (unknown [9.43.49.207])
 by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Tue,  2 May 2023 05:00:46 +0000 (GMT)
Message-ID: <f4810103-78ce-eb5b-4d43-b9268b9aa745@linux.ibm.com>
Date: Tue, 2 May 2023 10:30:45 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 1/4] ppc: spapr: cleanup cr get/store in
 [h_enter|spapr_exit]_nested with helpers.
Content-Language: en-US
To: Nicholas Piggin <npiggin@gmail.com>, qemu-ppc@nongnu.org
Cc: qemu-devel@nongnu.org, farosas@suse.de, danielhb413@gmail.com
References: <20230424144712.1985425-1-harshpb@linux.ibm.com>
 <20230424144712.1985425-2-harshpb@linux.ibm.com>
 <CSBII1VGPEQB.3Q8OP9FELWTC3@wheely>
From: Harsh Prateek Bora <harshpb@linux.ibm.com>
In-Reply-To: <CSBII1VGPEQB.3Q8OP9FELWTC3@wheely>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 5VCBaX3HoxDtrLHfn4vT454ervkIOkgR
X-Proofpoint-GUID: ECfC1Ao86qn8gvKj35UqG1Pft2RvBebM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-02_02,2023-04-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0
 clxscore=1015 priorityscore=1501 phishscore=0 malwarescore=0
 lowpriorityscore=0 mlxscore=0 impostorscore=0 bulkscore=0 mlxlogscore=999
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2305020038
Received-SPF: pass client-ip=148.163.158.5; envelope-from=harshpb@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



On 5/2/23 10:07, Nicholas Piggin wrote:
> On Tue Apr 25, 2023 at 12:47 AM AEST, Harsh Prateek Bora wrote:
>> The bits in cr reg are grouped into eight 4-bit fields represented
>> by env->crf[8] and the related calculations should be abstracted to
>> keep the calling routines simpler to read. This is a step towards
>> cleaning up the [h_enter|spapr_exit]_nested calls for better readability.
>>
>> Signed-off-by: Harsh Prateek Bora <harshpb@linux.ibm.com>
>> Reviewed-by: Fabiano Rosas <farosas@suse.de>
>> ---
>>   hw/ppc/spapr_hcall.c | 18 ++----------------
> 
> Could you either convert all callers, or do implementation and
> conversion as separate patches. Preference for former if you can
> be bothered.
> 
> save_user_regs(), restore_user_regs(), gdb read/write register * 2,
> kvm_arch_get/put_registers, monitor_get_ccr, at a quick glance.

Sure, I can include other consumers as well in the patches.
I usually prefer separate patches for implementation/conversion but 
since the implementation is a small change, I hope either approach is fine.

> 
>>   target/ppc/cpu.c     | 17 +++++++++++++++++
>>   target/ppc/cpu.h     |  2 ++
>>   3 files changed, 21 insertions(+), 16 deletions(-)
>>
>> diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
>> index ec4def62f8..124cee5e53 100644
>> --- a/hw/ppc/spapr_hcall.c
>> +++ b/hw/ppc/spapr_hcall.c
> 
> [snip]
> 
>> diff --git a/target/ppc/cpu.c b/target/ppc/cpu.c
>> index 1a97b41c6b..3b444e58b5 100644
>> --- a/target/ppc/cpu.c
>> +++ b/target/ppc/cpu.c
>> @@ -67,6 +67,23 @@ uint32_t ppc_get_vscr(CPUPPCState *env)
>>       return env->vscr | (sat << VSCR_SAT);
>>   }
>>   
>> +void ppc_store_cr(CPUPPCState *env, uint64_t cr)
> 
> Set is normal counterpart to get. Or load and store, but
> I think set and get is probably better.
> 
Sure, make sense.

> Good refactoring though, it shouldn't be open-coded everywhere.
> 
Thanks,
Harsh

> Thanks,
> Nick
> 
>> +{
>> +    for (int i = 7; i >= 0; i--) {
>> +        env->crf[i] = cr & 15;
>> +        cr >>= 4;
>> +    }
>> +}
>> +
>> +uint64_t ppc_get_cr(CPUPPCState *env)
>> +{
>> +    uint64_t cr = 0;
>> +    for (int i = 0; i < 8; i++) {
>> +        cr |= (env->crf[i] & 15) << (4 * (7 - i));
>> +    }
>> +    return cr;
>> +}
>> +
>>   /* GDBstub can read and write MSR... */
>>   void ppc_store_msr(CPUPPCState *env, target_ulong value)
>>   {
>> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
>> index 557d736dab..b4c21459f1 100644
>> --- a/target/ppc/cpu.h
>> +++ b/target/ppc/cpu.h
>> @@ -2773,6 +2773,8 @@ void dump_mmu(CPUPPCState *env);
>>   void ppc_maybe_bswap_register(CPUPPCState *env, uint8_t *mem_buf, int len);
>>   void ppc_store_vscr(CPUPPCState *env, uint32_t vscr);
>>   uint32_t ppc_get_vscr(CPUPPCState *env);
>> +void ppc_store_cr(CPUPPCState *env, uint64_t cr);
>> +uint64_t ppc_get_cr(CPUPPCState *env);
>>   
>>   /*****************************************************************************/
>>   /* Power management enable checks                                            */
>> -- 
>> 2.31.1
> 

