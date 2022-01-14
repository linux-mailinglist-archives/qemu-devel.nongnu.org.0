Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2565748F21D
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 22:49:56 +0100 (CET)
Received: from localhost ([::1]:39112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8USI-0004sN-On
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 16:49:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1n8UP7-0002tH-Dj; Fri, 14 Jan 2022 16:46:38 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:51486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1n8UP5-0006QC-BO; Fri, 14 Jan 2022 16:46:36 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20EL8jxM004801; 
 Fri, 14 Jan 2022 21:46:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=+EDiKQYJcUizRlE/gHxV6yiVfLZQydI2ffBCWZto/N0=;
 b=S8uPiwW2tE2LFshAlPH0hqLM86y+aRyI9HUPd/R0kbHg5ugrTB5C9nS6msW7tsaV7zoI
 +5twgv5ORwk037aUYqZ64bKCM6FyZS/PjhbPUMkSODYjCtg3GkF8fhmfw6PLiEichPT9
 APAE/7zrQXSyd0tH+jYuNxHvdwdbynwuhGA9gVMyqsOWceNBGprLLlOyk5VQ4sbx8iwT
 6nNG1jkaefjhJOaAcHh1TfGgy1mtIiJPdvmDmcQWCaNQ6SqrtYo3VIzYiP2KMeufwbBW
 UVT7mjb+09QMi+gdO/Bq7syzlkswEekqaHxxovFGNhIRo8Dmp/2wVp06Ykp0j59RbDW2 UA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dkdnccc28-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Jan 2022 21:46:18 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20ELgA3m014227;
 Fri, 14 Jan 2022 21:46:17 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dkdnccc1r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Jan 2022 21:46:17 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20ELhrHf000516;
 Fri, 14 Jan 2022 21:46:16 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma05wdc.us.ibm.com with ESMTP id 3df28d0rxf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Jan 2022 21:46:16 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20ELkFIT35651900
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 14 Jan 2022 21:46:15 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DA69C112067;
 Fri, 14 Jan 2022 21:46:14 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CD7D0112062;
 Fri, 14 Jan 2022 21:46:13 +0000 (GMT)
Received: from localhost (unknown [9.211.74.33])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTPS;
 Fri, 14 Jan 2022 21:46:13 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH 2/8] target/ppc: 405: Add missing exception handlers
In-Reply-To: <YdznIKAOxcLRSPDl@yekko>
References: <20220110181546.4131853-1-farosas@linux.ibm.com>
 <20220110181546.4131853-3-farosas@linux.ibm.com> <YdznIKAOxcLRSPDl@yekko>
Date: Fri, 14 Jan 2022 18:46:10 -0300
Message-ID: <87tue6vvml.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: VtIHSEByvzhaUKv-UjDtVDl9e1OjxIQh
X-Proofpoint-GUID: 1P_PlG00_wbb-inf1M9shn09Nd-FJU5L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-14_06,2022-01-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=979
 impostorscore=0 malwarescore=0 bulkscore=0 suspectscore=0 adultscore=0
 clxscore=1015 phishscore=0 spamscore=0 lowpriorityscore=0 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201140122
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

David Gibson <david@gibson.dropbear.id.au> writes:

> On Mon, Jan 10, 2022 at 03:15:40PM -0300, Fabiano Rosas wrote:
>> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
>> ---
>>  target/ppc/cpu_init.c | 2 ++
>>  1 file changed, 2 insertions(+)
>> 
>> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
>> index a50ddaeaae..9097948e67 100644
>> --- a/target/ppc/cpu_init.c
>> +++ b/target/ppc/cpu_init.c
>> @@ -1951,7 +1951,9 @@ static void init_excp_4xx_softmmu(CPUPPCState *env)
>>      env->excp_vectors[POWERPC_EXCP_EXTERNAL] = 0x00000500;
>>      env->excp_vectors[POWERPC_EXCP_ALIGN]    = 0x00000600;
>>      env->excp_vectors[POWERPC_EXCP_PROGRAM]  = 0x00000700;
>> +    env->excp_vectors[POWERPC_EXCP_FPU]      = 0x00000800;
>
> I have a vague recollection from my days of working on 405 that there
> may have been something funky with FP emulation on there: e.g. FP
> instructions causing 0x700 program interrupts instead of FP unavailble
> interrupts or something.

Maybe this (from the manual):

  Program - causing conditions:
  
  Attempted execution of illegal instructions, TRAP instruction,
  privileged instruction in problem state, or auxiliary processor (APU)
  instruction, or unimplemented FPU instruction, or unimplemented APU
  instruction, or APU interrupt, or FPU interrupt
  
  FPU Unavailable - causing conditions:
  
  Attempted execution of an FPU instruction when MSR[FP]=0.

There's also this bit:

  Attempted execution of an APU instruction while the APUc405exception
  signal is asserted) results in a program interrupt. Similarly, attempted
  execution of an FPU instruction whilethe FPUc405exception signal is
  asserted) also results in a program interrupt. The following also result
  in program interrupts: attempted execution of an APU instruction while
  APUc405DcdAPUOp is asserted but APUC405DcdValidOp is deasserted; and
  attempted execution of an FPU instruction while APUc405DcdFpuOp but
  APUC405DcdValidOp is deasserted.

> I might be remembering incorrectly - the manual does seem to imply
> that 0x800 FP unavailable is there as normal, but it might be worth
> double checking this (against real hardware, if possible).

The Linux kernel has the vectors that I'm adding disabled:

  EXCEPTION(0x0800, Trap_08, unknown_exception) <-- FPU
  EXCEPTION(0x0900, Trap_09, unknown_exception)
  EXCEPTION(0x0A00, Trap_0A, unknown_exception) 
  EXCEPTION(0x0B00, Trap_0B, unknown_exception)
  ...
  EXCEPTION(0x0F00, Trap_0F, unknown_exception) <-- APU

(0xf20 would probably cause a crash as we'd jump to the middle of the
exception prologue)

Maybe I should drop this patch then? That way future developers won't
feel tempted to raise one of these.

It seems mostly inconsequential either way, what do you think?

