Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1644649686
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Dec 2022 22:33:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4Tv3-0003Je-DR; Sun, 11 Dec 2022 16:31:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <harshpb@linux.ibm.com>)
 id 1p4TbD-0001Wb-Fu; Sun, 11 Dec 2022 16:11:03 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <harshpb@linux.ibm.com>)
 id 1p4Tb7-000804-Cr; Sun, 11 Dec 2022 16:10:59 -0500
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BBKK0LC014086; Sun, 11 Dec 2022 21:10:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=jFgBonsqtw1ziADZ98lf6A00F6zapHWp4q939gO7CC4=;
 b=QMayklmury+3F+HVGrL01vmSrtjsI13UtWb0jHoDFGkwDydze7PeBzO6Z65gKqPpMIFF
 nrtJFRRKk5nYdLRfEoj0Taxhj7OkqsznOiU9t0hb2jTK1UTgTe9juNz+J3f3RfVzDOeu
 2l8PgGhTrft56RGCcBqJQeZYOnhHVoRaJXFBb9UOPsnGKB+pjTweams28kisQCxDWCMs
 yoq8H/2/nctM232fNL5APJaWF4sdFNeXwYpXXTRlbIT30r9iR1/s1PHAfrxpSI9oIvOj
 YxGiW06FOPnXoA7ZFDO4rwx0YmnIqeR9K9i7h9sW9jKdwEMDkWVv7lqO/Or5ghzErOdF 1w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3md468qn1v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 11 Dec 2022 21:10:35 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2BBL6bOx019496;
 Sun, 11 Dec 2022 21:10:34 GMT
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3md468qn1e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 11 Dec 2022 21:10:34 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.17.1.19/8.16.1.2) with ESMTP id 2BBKTEmV004395;
 Sun, 11 Dec 2022 21:10:33 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([9.208.129.118])
 by ppma03wdc.us.ibm.com (PPS) with ESMTPS id 3mchr695rw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 11 Dec 2022 21:10:33 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com
 [10.241.53.105])
 by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2BBLAVhY53870866
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 11 Dec 2022 21:10:32 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B90705805E;
 Sun, 11 Dec 2022 21:10:31 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 308FE5805D;
 Sun, 11 Dec 2022 21:10:27 +0000 (GMT)
Received: from [9.43.60.209] (unknown [9.43.60.209])
 by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Sun, 11 Dec 2022 21:10:26 +0000 (GMT)
Message-ID: <8f3c2487-4403-2f87-4e43-336d8cea472b@linux.ibm.com>
Date: Mon, 12 Dec 2022 02:40:25 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 2/2] target/ppc: Check DEXCR on hash{st, chk}
 instructions
Content-Language: en-US
From: Harsh Prateek Bora <harshpb@linux.ibm.com>
To: Nicholas Miehlbradt <nicholas@linux.ibm.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, clg@kaod.org,
 david@gibson.dropbear.id.au, groug@kaod.org,
 victor.colombo@eldorado.org.br, mikey@neuling.org
References: <20221209061308.1735802-1-nicholas@linux.ibm.com>
 <20221209061308.1735802-3-nicholas@linux.ibm.com>
 <1f5179fd-9bee-c62c-e15c-8633a5b021aa@linux.ibm.com>
In-Reply-To: <1f5179fd-9bee-c62c-e15c-8633a5b021aa@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: A5vWWDycgsYqgtU0shW4KofUJ6nq27LD
X-Proofpoint-ORIG-GUID: 5k5AYzey5CsLQKY0xo0gkG9R2AtZJJH9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-10_10,2022-12-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0
 adultscore=0 malwarescore=0 mlxlogscore=942 phishscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212110196
Received-SPF: pass client-ip=148.163.156.1; envelope-from=harshpb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 11 Dec 2022 16:31:31 -0500
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



On 12/12/22 00:06, Harsh Prateek Bora wrote:
> 
> 
> On 12/9/22 11:43, Nicholas Miehlbradt wrote:
>> Adds checks to the hashst and hashchk instructions to only execute if
>> enabled by the relevant aspect in the DEXCR and HDEXCR.
>>
>> This behaviour is guarded behind TARGET_PPC64 since Power10 is
>> currently the only implementation which has the DEXCR.
>>
>> Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>> Signed-off-by: Nicholas Miehlbradt <nicholas@linux.ibm.com>
>> ---
>>   target/ppc/excp_helper.c | 58 +++++++++++++++++++++++++++++-----------
>>   1 file changed, 43 insertions(+), 15 deletions(-)
>>
>> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
>> index 94adcb766b..add4d54ae7 100644
>> --- a/target/ppc/excp_helper.c
>> +++ b/target/ppc/excp_helper.c
>> @@ -2902,29 +2902,57 @@ static uint64_t hash_digest(uint64_t ra, 
>> uint64_t rb, uint64_t key)
>>       return stage1_h ^ stage1_l;
>>   }
>> +static void do_hash(CPUPPCState *env, target_ulong ea, target_ulong ra,
>> +                    target_ulong rb, uint64_t key, bool store)
>> +{
>> +    uint64_t calculated_hash = hash_digest(ra, rb, key), loaded_hash;
>> +
>> +    if (store) {
>> +        cpu_stq_data_ra(env, ea, calculated_hash, GETPC());
>> +    } else {
>> +        loaded_hash = cpu_ldq_data_ra(env, ea, GETPC());
>> +        if (loaded_hash != calculated_hash) {
>> +            raise_exception_err_ra(env, POWERPC_EXCP_PROGRAM,
>> +                POWERPC_EXCP_TRAP, GETPC());
>> +        }
>> +    }
>> +}
>> +
>>   #include "qemu/guest-random.h"
>> -#define HELPER_HASH(op, key, 
>> store)                                           \
>> +#ifdef TARGET_PPC64
>> +#define HELPER_HASH(op, key, store, 
>> dexcr_aspect)                             \
>>   void helper_##op(CPUPPCState *env, target_ulong ea, target_ulong 
>> ra,          \
>>                    target_ulong 
>> rb)                                             \
>>   { 
> 
> Conditional compilation could be contained within function, so that 
> duplicate lines of code in each macro block could be avoided and would 
> look simpler.
Ok, I see that's not feasible within macro expansion. Please ignore.

> 
>     \
>> -    uint64_t calculated_hash = hash_digest(ra, rb, key), 
>> loaded_hash;         \
>> -                                                                              \
>> -    if (store) 
>> {                                                              \
>> -        cpu_stq_data_ra(env, ea, calculated_hash, 
>> GETPC());                   \
>> -    } else 
>> {                                                                  \
>> -        loaded_hash = cpu_ldq_data_ra(env, ea, 
>> GETPC());                      \
>> -        if (loaded_hash != calculated_hash) 
>> {                                 \
>> -            raise_exception_err_ra(env, 
>> POWERPC_EXCP_PROGRAM,                 \
>> -                POWERPC_EXCP_TRAP, 
>> GETPC());                                  \
>> -        
>> }                                                                     \
>> +    if (env->msr & R_MSR_PR_MASK) 
>> {                                           \
>> +        if (!(env->spr[SPR_DEXCR] & R_DEXCR_PRO_##dexcr_aspect##_MASK 
>> ||      \
>> +            env->spr[SPR_HDEXCR] & 
>> R_HDEXCR_ENF_##dexcr_aspect##_MASK))       \
>> +            
>> return;                                                           \
>> +    } else if (!(env->msr & R_MSR_HV_MASK)) 
>> {                                 \
>> +        if (!(env->spr[SPR_DEXCR] & R_DEXCR_PNH_##dexcr_aspect##_MASK 
>> ||      \
>> +            env->spr[SPR_HDEXCR] & 
>> R_HDEXCR_ENF_##dexcr_aspect##_MASK))       \
>> +            
>> return;                                                           \
>> +    } else if (!(env->msr & R_MSR_S_MASK)) 
>> {                                  \
>> +        if (!(env->spr[SPR_HDEXCR] & 
>> R_HDEXCR_HNU_##dexcr_aspect##_MASK))     \
>> +            
>> return;                                                           \
>>       
>> }                                                                         \
>> +                                                                              \
>> +    do_hash(env, ea, ra, rb, key, 
>> store);                                     \
>> +}
>> +#else
>> +#define HELPER_HASH(op, key, store, 
>> dexcr_aspect)                             \
>> +void helper_##op(CPUPPCState *env, target_ulong ea, target_ulong 
>> ra,          \
>> +                 target_ulong 
>> rb)                                             \
>> +{                                                                             \
>> +    do_hash(env, ea, ra, rb, key, 
>> store);                                     \
>>   }
>> +#endif /* TARGET_PPC64 */
>> -HELPER_HASH(HASHST, env->spr[SPR_HASHKEYR], true)
>> -HELPER_HASH(HASHCHK, env->spr[SPR_HASHKEYR], false)
>> -HELPER_HASH(HASHSTP, env->spr[SPR_HASHPKEYR], true)
>> -HELPER_HASH(HASHCHKP, env->spr[SPR_HASHPKEYR], false)
>> +HELPER_HASH(HASHST, env->spr[SPR_HASHKEYR], true, NPHIE)
>> +HELPER_HASH(HASHCHK, env->spr[SPR_HASHKEYR], false, NPHIE)
>> +HELPER_HASH(HASHSTP, env->spr[SPR_HASHPKEYR], true, PHIE)
>> +HELPER_HASH(HASHCHKP, env->spr[SPR_HASHPKEYR], false, PHIE)
>>   #endif /* CONFIG_TCG */
>>   #if !defined(CONFIG_USER_ONLY)
> 
> Otherwise, looks good to me!
> 
> regards,
> Harsh Prateek Bora

