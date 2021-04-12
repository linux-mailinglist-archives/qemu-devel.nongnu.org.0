Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0815735D251
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Apr 2021 23:02:48 +0200 (CEST)
Received: from localhost ([::1]:50120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lW3hm-0005oB-3k
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 17:02:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1lW3g4-0005Gr-GE
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 17:01:02 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:15486
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1lW3g1-00066v-0W
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 17:00:59 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13CKXbHN022108; Mon, 12 Apr 2021 17:00:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=YRVnzDEANonx1B+gEq5CGY7czuruilBJFQSAe+gJfgg=;
 b=MsVAcMHlT1EcjhBiF1G7NAl6RwY0gYqP6DpskL1UJOj0h47gGKYXr+Lq8VAU8BtOroLs
 HHw7OUTI9FjPsCrCwTHEJLlf1JnBsKF4ePBcxdvIq+gi1k/+W/hMsu8S785M8W6UAk7s
 uo7Z6xCH43Q4nKxdJIJlHG017sCT8G8YLk1pDjjsW4j4hq5LfN7jot4v+84lCcHafkmz
 dLHZ7h+L+ll500DfavIlYKokSu1BgorY5XE2ehxkTMBj0ZYKdc2LTM2bGlz3476DYg5e
 CuHuHfkNRK00bNAkVbDuxL7lc6H+DIfaMlt6u/2TUo+Pr3AiG4Rxj38MKoVQ0P377V0J tQ== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37vkd5gcm0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Apr 2021 17:00:45 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13CKvIJJ007341;
 Mon, 12 Apr 2021 21:00:44 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma01wdc.us.ibm.com with ESMTP id 37u3n9391t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Apr 2021 21:00:44 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13CL0imU36438354
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Apr 2021 21:00:44 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1BD55112066;
 Mon, 12 Apr 2021 21:00:44 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 38936112062;
 Mon, 12 Apr 2021 21:00:41 +0000 (GMT)
Received: from localhost (unknown [9.211.82.34])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTPS;
 Mon, 12 Apr 2021 21:00:41 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH] target/ppc: code motion from translate_init.c.inc to
 gdbstub.c
In-Reply-To: <20210412190442.114467-1-bruno.larsen@eldorado.org.br>
References: <20210412190442.114467-1-bruno.larsen@eldorado.org.br>
Date: Mon, 12 Apr 2021 18:00:39 -0300
Message-ID: <874kgb5ibs.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: T4U71PKDMaNrIXS6SpUY1kaGvjFkIIUn
X-Proofpoint-ORIG-GUID: T4U71PKDMaNrIXS6SpUY1kaGvjFkIIUn
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-12_11:2021-04-12,
 2021-04-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 phishscore=0
 spamscore=0 impostorscore=0 adultscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104120132
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: luis.pires@eldorado.org.br, lucas.araujo@eldorado.org.br,
 fernando.valle@eldorado.org.br,
 "Bruno Larsen \(billionai\)" <bruno.larsen@eldorado.org.br>,
 matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br> writes:

Please send ppc patches to both qemu-devel and qemu-ppc.

> As suggested by Fabiano Rosas,

In these situations you can just add along with your signed-off-by:

Suggested-by: Fabiano Rosas <farosas@linux.ibm.com>

> all the code related to gdb has been moved
> from translate_init.c.inc file to the gdbstub.c file, where it makes more
> sense
>
> Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
> ---
>  target/ppc/cpu.h                |  11 ++
>  target/ppc/gdbstub.c            | 261 ++++++++++++++++++++++++++++++++
>  target/ppc/translate_init.c.inc | 224 ---------------------------
>  3 files changed, 272 insertions(+), 224 deletions(-)
>
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index e73416da68..795b121e04 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -2612,4 +2612,15 @@ static inline ppc_avr_t *cpu_avr_ptr(CPUPPCState *env, int i)
>  void dump_mmu(CPUPPCState *env);
>  
>  void ppc_maybe_bswap_register(CPUPPCState *env, uint8_t *mem_buf, int len);
> +
> +/*
> + * functions used by cpu_ppc_realize, but that dont necessarily make sense
> + * to be added to cpu.c, because they seem very related to TCG or gdb
> + */

This comment has served its purpose for the RFC I think. You can drop it.

> +
> +/* gdbstub.c */
> +void ppc_cpu_gdb_init(CPUState *cs, PowerPCCPUClass *ppc);

I don't think "cpu" adds much here. ppc_gdb_init gets the meaning across
just fine.

> +gchar *ppc_gdb_arch_name(CPUState *cs);
> +
> +
>  #endif /* PPC_CPU_H */
> diff --git a/target/ppc/gdbstub.c b/target/ppc/gdbstub.c
> index c28319fb97..0c016b8483 100644
> --- a/target/ppc/gdbstub.c
> +++ b/target/ppc/gdbstub.c
> @@ -20,6 +20,10 @@
>  #include "qemu/osdep.h"
>  #include "cpu.h"
>  #include "exec/gdbstub.h"
> +#ifdef CONFIG_TCG
> +#include "exec/helper-proto.h"
> +#endif

We still need to figure out where to move the vscr helpers so that both
TCG and !TCG code can see them. But we cannot build without TCG
currently anyway so I guess it's ok to leave the ifdef.

> +#include "kvm_ppc.h"

This one is not being used.

>  
>  static int ppc_gdb_register_len_apple(int n)
>  {
> @@ -387,3 +391,260 @@ const char *ppc_gdb_get_dynamic_xml(CPUState *cs, const char *xml_name)
>      return NULL;
>  }
>  #endif

<snip>

> +gchar *ppc_gdb_arch_name(CPUState *cs)
> +{
> +#if defined(TARGET_PPC64)
> +    return g_strdup("powerpc:common64");
> +#else
> +    return g_strdup("powerpc:common");
> +#endif
> +}

Where is the removal of this from translate_init.inc.c? You must have
left it unstaged in your tree.

> +
> +void ppc_cpu_gdb_init(CPUState *cs, PowerPCCPUClass *pcc)
> +{
> +
> +    if (pcc->insns_flags & PPC_FLOAT) {
> +        gdb_register_coprocessor(cs, gdb_get_float_reg, gdb_set_float_reg,
> +                                 33, "power-fpu.xml", 0);
> +    }
> +    if (pcc->insns_flags & PPC_ALTIVEC) {
> +        gdb_register_coprocessor(cs, gdb_get_avr_reg, gdb_set_avr_reg,
> +                                 34, "power-altivec.xml", 0);
> +    }
> +    if (pcc->insns_flags & PPC_SPE) {
> +        gdb_register_coprocessor(cs, gdb_get_spe_reg, gdb_set_spe_reg,
> +                                 34, "power-spe.xml", 0);
> +    }
> +    if (pcc->insns_flags2 & PPC2_VSX) {
> +        gdb_register_coprocessor(cs, gdb_get_vsx_reg, gdb_set_vsx_reg,
> +                                 32, "power-vsx.xml", 0);
> +    }
> +#ifndef CONFIG_USER_ONLY
> +    gdb_register_coprocessor(cs, gdb_get_spr_reg, gdb_set_spr_reg,
> +                             pcc->gdb_num_sprs, "power-spr.xml", 0);
> +#endif
> +}

Same here.

