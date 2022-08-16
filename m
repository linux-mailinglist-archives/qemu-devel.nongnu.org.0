Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B23596627
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 01:49:14 +0200 (CEST)
Received: from localhost ([::1]:55612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oO6J7-0003gO-Br
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 19:49:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1oO6HL-00024X-DG
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 19:47:23 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:18662
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1oO6HJ-0007Tc-Bl
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 19:47:23 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27GNhOu4006422;
 Tue, 16 Aug 2022 23:47:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : in-reply-to : references : content-type : mime-version :
 date : content-transfer-encoding; s=pp1;
 bh=6cI4RfN39yoIjPshn0Khj0OTa9tIN1o8iG98tJCvkfw=;
 b=j9cby/UpeNchlaDhJz5AJYHIb1juuZRfb2L2gJ//MgCAN7tutRIRdSzYIA1jhnQEgEmz
 mjLvsQX2jXrrFrnAqYI2NZGx9sIPUwGpLA9pn0+hiyY+0mnADr0HKkIdKf8B9nAoUgd4
 i4vsGlkHfyIg9OBWi8fBDTjM1sULuIEz7un5IGUjcY4a74ICrNr6IHdkcIQe5ECgHc93
 5Oka7VLW3RiI91rjHUg/Z0pSyFwR7Kvv0tBCOQ3nuagglKwinZcSmZR1wrcKW8kqOLSV
 nyBw+ng4nvDsKjVDw9EB3pjtIv5YuatksyRwAnz4CT7rikLC/JSqjLJniUa6tgC8dMHO 7A== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3j0n5f025b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Aug 2022 23:47:19 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27GNKXNE007756;
 Tue, 16 Aug 2022 23:47:17 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06ams.nl.ibm.com with ESMTP id 3hx37jbsc4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Aug 2022 23:47:17 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 27GNlX3f21430616
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 16 Aug 2022 23:47:33 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DFA4E11C04C;
 Tue, 16 Aug 2022 23:47:14 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 961A011C04A;
 Tue, 16 Aug 2022 23:47:14 +0000 (GMT)
Received: from [9.171.44.44] (unknown [9.171.44.44])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 16 Aug 2022 23:47:14 +0000 (GMT)
Message-ID: <15f8efa3aae897569383305155315d03ee5b70e3.camel@linux.ibm.com>
Subject: Re: [PATCH for-7.2 14/21] accel/tcg: Hoist get_page_addr_code out
 of tb_lookup
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: laurent@vivier.eu, alex.bennee@linaro.org
In-Reply-To: <20220812180806.2128593-15-richard.henderson@linaro.org>
References: <20220812180806.2128593-1-richard.henderson@linaro.org>
 <20220812180806.2128593-15-richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Date: Wed, 17 Aug 2022 01:43:07 +0200
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35) 
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: aymtOAA6mPFpI9RIE5NRzaXLNYzFTFg_
X-Proofpoint-GUID: aymtOAA6mPFpI9RIE5NRzaXLNYzFTFg_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-16_08,2022-08-16_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 mlxlogscore=999 suspectscore=0 malwarescore=0 mlxscore=0 impostorscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208160084
Received-SPF: pass client-ip=148.163.158.5; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Fri, 2022-08-12 at 11:07 -0700, Richard Henderson wrote:
> We will want to re-use the result of get_page_addr_code
> beyond the scope of tb_lookup.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  accel/tcg/cpu-exec.c | 34 ++++++++++++++++++++++++----------
>  1 file changed, 24 insertions(+), 10 deletions(-)
> 
> diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
> index a9b7053274..889355b341 100644
> --- a/accel/tcg/cpu-exec.c
> +++ b/accel/tcg/cpu-exec.c
> @@ -209,13 +209,12 @@ static bool tb_lookup_cmp(const void *p, const
> void *d)
>  }
>  
>  /* Might cause an exception, so have a longjmp destination ready */
> -static TranslationBlock *tb_lookup(CPUState *cpu, target_ulong pc,
> -                                   target_ulong cs_base,
> +static TranslationBlock *tb_lookup(CPUState *cpu, tb_page_addr_t
> phys_pc,
> +                                   target_ulong pc, target_ulong
> cs_base,
>                                     uint32_t flags, uint32_t cflags)
>  {
>      CPUArchState *env = cpu->env_ptr;
>      TranslationBlock *tb;
> -    tb_page_addr_t phys_pc;
>      struct tb_desc desc;
>      uint32_t jmp_hash, tb_hash;
>  
> @@ -240,11 +239,8 @@ static TranslationBlock *tb_lookup(CPUState
> *cpu, target_ulong pc,
>      desc.cflags = cflags;
>      desc.trace_vcpu_dstate = *cpu->trace_dstate;
>      desc.pc = pc;
> -    phys_pc = get_page_addr_code(desc.env, pc);
> -    if (phys_pc == -1) {
> -        return NULL;
> -    }
>      desc.phys_page1 = phys_pc & TARGET_PAGE_MASK;
> +
>      tb_hash = tb_hash_func(phys_pc, pc, flags, cflags, *cpu-
> >trace_dstate);
>      tb = qht_lookup_custom(&tb_ctx.htable, &desc, tb_hash,
> tb_lookup_cmp);
>      if (tb == NULL) {
> @@ -371,6 +367,7 @@ const void *HELPER(lookup_tb_ptr)(CPUArchState
> *env)
>      TranslationBlock *tb;
>      target_ulong cs_base, pc;
>      uint32_t flags, cflags;
> +    tb_page_addr_t phys_pc;
>  
>      cpu_get_tb_cpu_state(env, &pc, &cs_base, &flags);
>  
> @@ -379,7 +376,12 @@ const void *HELPER(lookup_tb_ptr)(CPUArchState
> *env)
>          cpu_loop_exit(cpu);
>      }
>  
> -    tb = tb_lookup(cpu, pc, cs_base, flags, cflags);
> +    phys_pc = get_page_addr_code(env, pc);
> +    if (phys_pc == -1) {
> +        return tcg_code_gen_epilogue;
> +    }
> +
> +    tb = tb_lookup(cpu, phys_pc, pc, cs_base, flags, cflags);
>      if (tb == NULL) {
>          return tcg_code_gen_epilogue;
>      }
> @@ -482,6 +484,7 @@ void cpu_exec_step_atomic(CPUState *cpu)
>      TranslationBlock *tb;
>      target_ulong cs_base, pc;
>      uint32_t flags, cflags;
> +    tb_page_addr_t phys_pc;
>      int tb_exit;
>  
>      if (sigsetjmp(cpu->jmp_env, 0) == 0) {
> @@ -504,7 +507,12 @@ void cpu_exec_step_atomic(CPUState *cpu)
>           * Any breakpoint for this insn will have been recognized
> earlier.
>           */
>  
> -        tb = tb_lookup(cpu, pc, cs_base, flags, cflags);
> +        phys_pc = get_page_addr_code(env, pc);
> +        if (phys_pc == -1) {
> +            tb = NULL;
> +        } else {
> +            tb = tb_lookup(cpu, phys_pc, pc, cs_base, flags,
> cflags);
> +        }
>          if (tb == NULL) {
>              mmap_lock();
>              tb = tb_gen_code(cpu, pc, cs_base, flags, cflags);
> @@ -949,6 +957,7 @@ int cpu_exec(CPUState *cpu)
>              TranslationBlock *tb;
>              target_ulong cs_base, pc;
>              uint32_t flags, cflags;
> +            tb_page_addr_t phys_pc;
>  
>              cpu_get_tb_cpu_state(cpu->env_ptr, &pc, &cs_base,
> &flags);
>  
> @@ -970,7 +979,12 @@ int cpu_exec(CPUState *cpu)
>                  break;
>              }
>  
> -            tb = tb_lookup(cpu, pc, cs_base, flags, cflags);
> +            phys_pc = get_page_addr_code(cpu->env_ptr, pc);
> +            if (phys_pc == -1) {
> +                tb = NULL;
> +            } else {
> +                tb = tb_lookup(cpu, phys_pc, pc, cs_base, flags,
> cflags);
> +            }
>              if (tb == NULL) {
>                  mmap_lock();
>                  tb = tb_gen_code(cpu, pc, cs_base, flags, cflags);

This patch did not make it into v2, but having get_page_addr_code()
before tb_lookup() in helper_lookup_tb_ptr() helped raise the exception
when trying to execute a no-longer-executable TB.

Was it dropped for performance reasons?

