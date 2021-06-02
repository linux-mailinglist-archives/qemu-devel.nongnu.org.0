Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52FF2398E0A
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 17:13:19 +0200 (CEST)
Received: from localhost ([::1]:35866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loSYY-0003mB-Eg
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 11:13:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1loSXf-0002x4-IE; Wed, 02 Jun 2021 11:12:23 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:41316)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1loSXc-0004sE-QZ; Wed, 02 Jun 2021 11:12:23 -0400
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 152F5aL9139939; Wed, 2 Jun 2021 11:12:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=zi8IPafqyAXAFoNX0ZdbCeeBuvuKnC1pPHklubti0jQ=;
 b=pL0O1tXYIBuKbVls6oyQa4NXG1GrF7A484nNbYl+s2e0aVTxBAxkr7viKzi4jvJhFZmP
 LayXiOSTgk59ZcO5GXKMgArPa0FamHWd9GVU5uizqWh2gF3zb6U6w3nvWXWUmDFk69ZB
 kIXsOolj0DL3BifcGGCZ2P+11tv+o2ueBMyNqNnTmtVqme5KtHAezMnq3lfiqeSosqT+
 PJfu2U+59L/zLtzSwQW0fd/xejtWV9l9cMitTOIro0bOytOie5Q+pkCWisxuEMVja+rD
 Fc705b5+XpRi0TW9sQQ6PPzJ8W6GhniyBp7KHA8jrPt9XmnnX+rYun//b4Mf2QjKrEWr Ow== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38xc1y0t06-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Jun 2021 11:12:01 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 152F2ktA031652;
 Wed, 2 Jun 2021 15:12:01 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma02wdc.us.ibm.com with ESMTP id 38ud89re11-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Jun 2021 15:12:01 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 152FC0tE29163968
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Jun 2021 15:12:00 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4AA57C6057;
 Wed,  2 Jun 2021 15:12:00 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 908C2C605A;
 Wed,  2 Jun 2021 15:11:59 +0000 (GMT)
Received: from localhost (unknown [9.211.44.140])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Wed,  2 Jun 2021 15:11:59 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>, qemu-devel@nongnu.org
Subject: Re: [RFC PATCH 5/5] target/ppc: powerpc_excp: Move interrupt
 raising code to QOM
In-Reply-To: <3f551efa-33ce-427c-6f1f-8f21a5e59728@eldorado.org.br>
References: <20210601214649.785647-1-farosas@linux.ibm.com>
 <20210601214649.785647-6-farosas@linux.ibm.com>
 <3f551efa-33ce-427c-6f1f-8f21a5e59728@eldorado.org.br>
Date: Wed, 02 Jun 2021 12:11:57 -0300
Message-ID: <878s3swbb6.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: yZADzHFd9gAJ8rbrqk-2zsfa55qeGe3x
X-Proofpoint-GUID: yZADzHFd9gAJ8rbrqk-2zsfa55qeGe3x
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-02_08:2021-06-02,
 2021-06-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 suspectscore=0 adultscore=0 phishscore=0 mlxscore=0 bulkscore=0
 malwarescore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104190000 definitions=main-2106020097
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: qemu-ppc@nongnu.org, groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Bruno Piazera Larsen <bruno.larsen@eldorado.org.br> writes:

> On 01/06/2021 18:46, Fabiano Rosas wrote:

<snip>

>> +struct ppc_intr_args {
>> +    target_ulong nip;
>> +    target_ulong msr;
>> +    target_ulong new_nip;
>> +    target_ulong new_msr;
>> +    int sprn_srr0;
>> +    int sprn_srr1;
>> +    int sprn_asrr0;
>> +    int sprn_asrr1;
>> +    int lev;
>> +};
>> +
> This part also has me a bit confused. Why define it first in 
> excp_helper.c in the last patch just to move it to here now?

Because back then it wasn't used outside of excp_helper.c. People would
probably ask: "why put this in a common header if it is not used
anywhere else?" =)

>> +struct PPCInterrupt {
>> +    Object parent;
>> +
>> +    int id;
>> +    const char *name;
>> +    target_ulong addr;
>> +    ppc_intr_fn_t setup_regs;
>> +};
>> +
>>   #define PPC_INPUT(env) ((env)->bus_model)
>>   
>>   /*****************************************************************************/
>> @@ -1115,7 +1142,7 @@ struct CPUPPCState {
>>       uint32_t irq_input_state;
>>       void **irq_inputs;
>>   
>> -    target_ulong excp_vectors[POWERPC_EXCP_NB]; /* Exception vectors */
>> +    PPCInterrupt entry_points[POWERPC_EXCP_NB];
>>       target_ulong excp_prefix;
>>       target_ulong ivor_mask;
>>       target_ulong ivpr_mask;
>> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
>> index d0411e7302..d91183357d 100644
>> --- a/target/ppc/cpu_init.c
>> +++ b/target/ppc/cpu_init.c
>> @@ -46,6 +46,7 @@
>>   #include "helper_regs.h"
>>   #include "internal.h"
>>   #include "spr_tcg.h"
>> +#include "ppc_intr.h"
>>   
>>   /* #define PPC_DEBUG_SPR */
>>   /* #define USE_APPLE_GDB */
>> @@ -2132,16 +2133,16 @@ static void register_8xx_sprs(CPUPPCState *env)
>>   static void init_excp_4xx_real(CPUPPCState *env)
>>   {
>>   #if !defined(CONFIG_USER_ONLY)
>> -    env->excp_vectors[POWERPC_EXCP_CRITICAL] = 0x00000100;
>> -    env->excp_vectors[POWERPC_EXCP_MCHECK]   = 0x00000200;
>> -    env->excp_vectors[POWERPC_EXCP_EXTERNAL] = 0x00000500;
>> -    env->excp_vectors[POWERPC_EXCP_ALIGN]    = 0x00000600;
>> -    env->excp_vectors[POWERPC_EXCP_PROGRAM]  = 0x00000700;
>> -    env->excp_vectors[POWERPC_EXCP_SYSCALL]  = 0x00000C00;
>> -    env->excp_vectors[POWERPC_EXCP_PIT]      = 0x00001000;
>> -    env->excp_vectors[POWERPC_EXCP_FIT]      = 0x00001010;
>> -    env->excp_vectors[POWERPC_EXCP_WDT]      = 0x00001020;
>> -    env->excp_vectors[POWERPC_EXCP_DEBUG]    = 0x00002000;
>> +    ppc_intr_add(env, 0x00000100, POWERPC_EXCP_CRITICAL);
>> +    ppc_intr_add(env, 0x00000200, POWERPC_EXCP_MCHECK);
>> +    ppc_intr_add(env, 0x00000500, POWERPC_EXCP_EXTERNAL);
>> +    ppc_intr_add(env, 0x00000600, POWERPC_EXCP_ALIGN);
>> +    ppc_intr_add(env, 0x00000700, POWERPC_EXCP_PROGRAM);
>> +    ppc_intr_add(env, 0x00000C00, POWERPC_EXCP_SYSCALL);
>> +    ppc_intr_add(env, 0x00001000, POWERPC_EXCP_PIT);
>> +    ppc_intr_add(env, 0x00001010, POWERPC_EXCP_FIT);
>> +    ppc_intr_add(env, 0x00001020, POWERPC_EXCP_WDT);
>> +    ppc_intr_add(env, 0x00002000, POWERPC_EXCP_DEBUG);
>>       env->ivor_mask = 0x0000FFF0UL;
>>       env->ivpr_mask = 0xFFFF0000UL;
>>       /* Hardware reset vector */
> <snip>
>> @@ -2624,8 +2625,8 @@ static void init_excp_POWER9(CPUPPCState *env)
>>       init_excp_POWER8(env);
>>   
>>   #if !defined(CONFIG_USER_ONLY)
>> -    env->excp_vectors[POWERPC_EXCP_HVIRT]    = 0x00000EA0;
>> -    env->excp_vectors[POWERPC_EXCP_SYSCALL_VECTORED] = 0x00017000;
>> +    ppc_intr_add(env, 0x00000EA0, POWERPC_EXCP_HVIRT);
>> +    ppc_intr_add(env, 0x00017000, POWERPC_EXCP_SYSCALL_VECTORED);
>>   #endif
>>   }
> Not sure if this is possible, but if this bit can be done separately as 
> an earlier patch, it would make reviewing a lot easier.

It could, but then it would be a synthetic change with not much purpose
on its own. We probably wouldn't want to merge a change that adds a
function that only writes an array position.

But I agree that this patch is on the verge of being too large. I had
another version split into more patches and it felt that we'd need to
keep going back and forth to understand the real impact of the
change. I'll think some more about it for a v2.

>>   
>> @@ -8375,13 +8376,8 @@ static void init_ppc_proc(PowerPCCPU *cpu)
>>       PowerPCCPUClass *pcc = POWERPC_CPU_GET_CLASS(cpu);
>>       CPUPPCState *env = &cpu->env;
>>   #if !defined(CONFIG_USER_ONLY)
>> -    int i;
>>   
>>       env->irq_inputs = NULL;
>> -    /* Set all exception vectors to an invalid address */
>> -    for (i = 0; i < POWERPC_EXCP_NB; i++) {
>> -        env->excp_vectors[i] = (target_ulong)(-1ULL);
>> -    }
> We don't need to use this to set invalid values?

I'm now using the interrupt callback pointer for this. So if the
processor has not registered the interrupt, the pointer will be NULL.

