Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 055834DDB52
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 15:12:20 +0100 (CET)
Received: from localhost ([::1]:56448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVDL0-0004nr-TC
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 10:12:18 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nVCwL-0005nJ-Cw; Fri, 18 Mar 2022 09:46:49 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:33336
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nVCwJ-00062g-J1; Fri, 18 Mar 2022 09:46:49 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22ICnuoU023776; 
 Fri, 18 Mar 2022 13:46:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=xm4DAeos+OjbzAxfb3TRfTpLDxE5LJ2bTzC7M07Ev4A=;
 b=jvNZERn0OasE5MZzhVEpM5tFfe7Pm8nNoaHdAJyrCGBA0OWvs1FFHceDB7vgWMFxfyhp
 I/H+9/EPfB4bID6u5AVpSqtHsNcTaLtf6HQm0PBP/cVLMsscjWWqYoBDCovhgBsfBTfB
 tdyjEgLWtCXt0IMrEz63AsE/1dINfF0RM/7i277eGuCuw/S1W/9lznMrSYMz2Pzp559c
 ZSSzNYb02qsVZM5TSHl6MJ/H15P1TO9XOF2bBoG77DtPm9b8R8HOSgSsNRtJWIEv4JJm
 XqFklGLplyNyK1pa57Jvuze7fxlZkZA+muky8SLV5+0lUWTKwjeMcPNvKrzJ/3dGv4ij Rw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ev10deea4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Mar 2022 13:46:41 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22ICs2fg005949;
 Fri, 18 Mar 2022 13:46:40 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ev10dee9v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Mar 2022 13:46:40 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22IDi6g0002005;
 Fri, 18 Mar 2022 13:46:40 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma03dal.us.ibm.com with ESMTP id 3erk5a4yyp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Mar 2022 13:46:40 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22IDkc5i18350382
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Mar 2022 13:46:38 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 627B6AC05F;
 Fri, 18 Mar 2022 13:46:38 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 39C16AC059;
 Fri, 18 Mar 2022 13:46:37 +0000 (GMT)
Received: from localhost (unknown [9.211.109.27])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTPS;
 Fri, 18 Mar 2022 13:46:36 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH 3/3] spapr: Move nested KVM hypercalls under a TCG only
 config.
In-Reply-To: <YjP/cHK+TQt5Rzpo@yekko>
References: <20220317172049.2681740-1-farosas@linux.ibm.com>
 <20220317172049.2681740-4-farosas@linux.ibm.com> <YjP/cHK+TQt5Rzpo@yekko>
Date: Fri, 18 Mar 2022 10:46:34 -0300
Message-ID: <87ilsbl6f9.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: tnp18FY9mDt-rNaN9AcVNVdj6t5QlKV-
X-Proofpoint-GUID: UtGpi5SiLhf5R0m82ObL3IuK4NfKhWjq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-18_09,2022-03-15_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 mlxlogscore=999 suspectscore=0 phishscore=0
 adultscore=0 spamscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 malwarescore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203180075
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 npiggin@gmail.com, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

David Gibson <david@gibson.dropbear.id.au> writes:

> On Thu, Mar 17, 2022 at 02:20:49PM -0300, Fabiano Rosas wrote:
>> These are the spapr virtual hypervisor implementation of the nested
>> KVM API. They only make sense when running with TCG.
>> 
>> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
>> ---
>>  hw/ppc/spapr_hcall.c | 20 +++++++++++++-------
>>  1 file changed, 13 insertions(+), 7 deletions(-)
>> 
>> diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
>> index c0bfc4bc9c..f2c802c155 100644
>> --- a/hw/ppc/spapr_hcall.c
>> +++ b/hw/ppc/spapr_hcall.c
>> @@ -2,6 +2,7 @@
>>  #include "qemu/cutils.h"
>>  #include "qapi/error.h"
>>  #include "sysemu/hw_accel.h"
>> +#include "sysemu/tcg.h"
>>  #include "sysemu/runstate.h"
>>  #include "qemu/log.h"
>>  #include "qemu/main-loop.h"
>> @@ -1473,7 +1474,8 @@ target_ulong spapr_hypercall(PowerPCCPU *cpu, target_ulong opcode,
>>      return H_FUNCTION;
>>  }
>>  
>> -/* TCG only */
>> +#ifdef CONFIG_TCG
>> +
>>  #define PRTS_MASK      0x1f
>>  
>>  static target_ulong h_set_ptbl(PowerPCCPU *cpu,
>> @@ -1807,6 +1809,12 @@ out_restore_l1:
>>      g_free(spapr_cpu->nested_host_state);
>>      spapr_cpu->nested_host_state = NULL;
>>  }
>> +#else
>> +void spapr_exit_nested(PowerPCCPU *cpu, int excp)
>> +{
>> +    g_assert_not_reached();
>> +}
>> +#endif
>>  
>>  #ifndef CONFIG_TCG
>>  static target_ulong h_softmmu(PowerPCCPU *cpu, SpaprMachineState *spapr,
>> @@ -1829,7 +1837,10 @@ static void hypercall_register_softmmu(void)
>>  #else
>>  static void hypercall_register_softmmu(void)
>>  {
>> -    /* DO NOTHING */
>> +    spapr_register_hypercall(KVMPPC_H_SET_PARTITION_TABLE, h_set_ptbl);
>> +    spapr_register_hypercall(KVMPPC_H_ENTER_NESTED, h_enter_nested);
>> +    spapr_register_hypercall(KVMPPC_H_TLB_INVALIDATE, h_tlb_invalidate);
>> +    spapr_register_hypercall(KVMPPC_H_COPY_TOFROM_GUEST, h_copy_tofrom_guest);
>
> This doesn't fit.  This is specifically about the MMU hypercalls - if
> you want to put other things in there it needs a name change at least.

Thanks, I really overlooked that. I'll put this somewhere else.

>>  }
>>  #endif
>>  
>> @@ -1888,11 +1899,6 @@ static void hypercall_register_types(void)
>>      spapr_register_hypercall(KVMPPC_H_CAS, h_client_architecture_support);
>>  
>>      spapr_register_hypercall(KVMPPC_H_UPDATE_DT, h_update_dt);
>> -
>> -    spapr_register_hypercall(KVMPPC_H_SET_PARTITION_TABLE, h_set_ptbl);
>> -    spapr_register_hypercall(KVMPPC_H_ENTER_NESTED, h_enter_nested);
>> -    spapr_register_hypercall(KVMPPC_H_TLB_INVALIDATE, h_tlb_invalidate);
>> -    spapr_register_hypercall(KVMPPC_H_COPY_TOFROM_GUEST, h_copy_tofrom_guest);
>>  }
>>  
>>  type_init(hypercall_register_types)

