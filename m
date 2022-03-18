Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2694DDB19
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 14:58:57 +0100 (CET)
Received: from localhost ([::1]:53068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVD84-0008Ib-Mu
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 09:58:56 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nVCrG-00058i-PY; Fri, 18 Mar 2022 09:41:35 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:35466
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nVCrE-00053I-TP; Fri, 18 Mar 2022 09:41:34 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22ICnukm023789; 
 Fri, 18 Mar 2022 13:41:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=Q2DGujMWG/hR1zYZiWstyYDPD5VoXDpGYexV+XmphWc=;
 b=UyzYkTF0ceACGENdF4Njx4hKDDWPIRSSt9XIgCeDwlVIh7FhlCJbn9iBXsUr6qPw6HBG
 QAM7fg8XWsBxtOi3Xqkv5vKmh1QlFpyhr4A+H1J4eJAnI+lbBuaLNrX8e0apEHX5zWyz
 +3VkgRUQufR02lOYUYRpJZqjAQODmSLNYDpE36+0b7pqjsuaTuVhmkAGqSw9VQzz+QXh
 F95w2HwFeWnSj0XXPE2BcgkK6il4+WHzH0XmpPkRIFQyjAN34ReeRuWa6wIEtszX+gPa
 c09UzmgW53LPACfsf5CXjWMDKI+8QK8rnqnEFuiml5d4FJ47vXAnc6ar6LQQ+5fPLOEc FQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ev10debhb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Mar 2022 13:41:26 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22ICnwXt024062;
 Fri, 18 Mar 2022 13:41:25 GMT
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ev10debh4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Mar 2022 13:41:25 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22IDOwo0021445;
 Fri, 18 Mar 2022 13:41:25 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma03wdc.us.ibm.com with ESMTP id 3eug4u5twh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Mar 2022 13:41:25 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22IDfNvY25559364
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Mar 2022 13:41:23 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C1423AC059;
 Fri, 18 Mar 2022 13:41:23 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 89447AC05F;
 Fri, 18 Mar 2022 13:41:22 +0000 (GMT)
Received: from localhost (unknown [9.211.109.27])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTPS;
 Fri, 18 Mar 2022 13:41:22 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH 1/3] spapr: Ignore nested KVM hypercalls when not
 running TCG
In-Reply-To: <YjP8iOgtvoLI3e/z@yekko>
References: <20220317172049.2681740-1-farosas@linux.ibm.com>
 <20220317172049.2681740-2-farosas@linux.ibm.com> <YjP8iOgtvoLI3e/z@yekko>
Date: Fri, 18 Mar 2022 10:41:19 -0300
Message-ID: <87lex7l6o0.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: msQ8wmqtp_IuY_FXyRuydF22QQTmEgpv
X-Proofpoint-GUID: wNxBQC0ntgrGp6BcYTeEwWJH2Jw2VCli
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-18_09,2022-03-15_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 mlxlogscore=994 suspectscore=0 phishscore=0
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

> On Thu, Mar 17, 2022 at 02:20:47PM -0300, Fabiano Rosas wrote:
>> It is possible that nested KVM hypercalls reach QEMU while we're
>> running KVM. The spapr virtual hypervisor implementation of the nested
>> KVM API only works when the L1 is running under TCG. So return
>> H_FUNCTION if we are under KVM.
>> 
>> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
>> ---
>>  hw/ppc/spapr_hcall.c | 10 +++++++++-
>>  1 file changed, 9 insertions(+), 1 deletion(-)
>> 
>> diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
>> index f008290787..119baa1d2d 100644
>> --- a/hw/ppc/spapr_hcall.c
>> +++ b/hw/ppc/spapr_hcall.c
>> @@ -1508,7 +1508,7 @@ static target_ulong h_set_ptbl(PowerPCCPU *cpu,
>>  {
>>      target_ulong ptcr = args[0];
>>  
>> -    if (!spapr_get_cap(spapr, SPAPR_CAP_NESTED_KVM_HV)) {
>> +    if (!spapr_get_cap(spapr, SPAPR_CAP_NESTED_KVM_HV) || !tcg_enabled()) {
>
> I was about to nack this on the grounds that it changes guest visible
> behaviour based on host properties.  Then I realized that's not the
> case, because in the KVM + SPAPR_CAP_NESTED_KVM_HV case the hypercall
> should be caught by KVM first and never reach here.
>
> So at the very least I think this needs a comment explaining that.

Ok.

> However, I'm still kind of confused how we would get here in the first
> place.  If SPAPR_CAP_NESTED_KVM_HV is set, but KVM doesn't support it,
> we should fail outright in cap_nested_kvm_hv_apply().  So how *do* we
> get here?  Is the kernel not doing what we expect of it?  If so, we
> should probably abort, rather than just returning H_FUNCTION.

Indeed, If all parts are functioning this should never happen. I was
hacking in L0 and accidentally let some hcalls through. So I'm just
being overly cautions with this patch. If that will end up causing too
much confusion, we could drop this one.

>>          return H_FUNCTION;
>>      }
>>  
>> @@ -1532,6 +1532,10 @@ static target_ulong h_tlb_invalidate(PowerPCCPU *cpu,
>>       * across L1<->L2 transitions, so nothing is required here.
>>       */
>>  
>> +    if (!tcg_enabled()) {
>> +        return H_FUNCTION;
>> +    }
>> +
>>      return H_SUCCESS;
>>  }
>>  
>> @@ -1572,6 +1576,10 @@ static target_ulong h_enter_nested(PowerPCCPU *cpu,
>>      uint64_t cr;
>>      int i;
>>  
>> +    if (!tcg_enabled()) {
>> +        return H_FUNCTION;
>> +    }
>> +
>>      if (spapr->nested_ptcr == 0) {
>>          return H_NOT_AVAILABLE;
>>      }

