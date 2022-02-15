Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 652114B6BF8
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 13:24:12 +0100 (CET)
Received: from localhost ([::1]:53500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJwsN-00032r-1D
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 07:24:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nJwpn-0001Qg-0h; Tue, 15 Feb 2022 07:21:31 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:10018)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nJwpj-0003s6-BJ; Tue, 15 Feb 2022 07:21:30 -0500
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21FC715C014689; 
 Tue, 15 Feb 2022 12:21:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=A00XXJ8HcQ0ef2MwNYyKDH8n+qMjDBSNgQ+KVpVlhDs=;
 b=o0Oyew165KN5lLUJIV+0x2upVMluJEfg7r9ZtN2beWpqzsrlyiOHX9Lz+JYpcynzOqu1
 b0M2d5AMebNWZxj0qLeILbHX2cn/OJmdqsoRLoiL6FW1JwV+yAPrIKrXheiOnxQ9V5x+
 HyxIec/KsHZUzVKc5WgZNfAIRg8gJTaD2w6d8wAaT5FzwqRQ9aonQm0UukN/S2/2JMoM
 /0j3S1fzgNr95f4s4LMBexV7bSesOcqH1TYg9HWaFWzW+SN35U4tuqLlP2mDO/58u16e
 zo3Ce4hZD9XZ9aGRESLao9yltjTyBYD5fSmMayvqAS21OdLa6P6af4gldTJwskLSXpVU rw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e89uaukv5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Feb 2022 12:21:18 +0000
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21FC9qBd023123;
 Tue, 15 Feb 2022 12:21:17 GMT
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e89uaukuq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Feb 2022 12:21:17 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21FCCFWH026756;
 Tue, 15 Feb 2022 12:21:16 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma03wdc.us.ibm.com with ESMTP id 3e64haqc7a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Feb 2022 12:21:16 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21FCLFN729229506
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 15 Feb 2022 12:21:15 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 33DBDBE054;
 Tue, 15 Feb 2022 12:21:15 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 64C35BE061;
 Tue, 15 Feb 2022 12:21:14 +0000 (GMT)
Received: from localhost (unknown [9.211.143.123])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Tue, 15 Feb 2022 12:21:14 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, qemu-ppc@nongnu.org
Subject: Re: [PATCH 2/2] target/ppc/kvm: Use KVM_CAP_PPC_AIL_MODE_3 to
 determine cap-ail-mode-3 support
In-Reply-To: <1644878889.dc8nyl60bz.astroid@bobo.none>
References: <20220214111749.1542196-1-npiggin@gmail.com>
 <20220214111749.1542196-2-npiggin@gmail.com>
 <87sfsllhez.fsf@linux.ibm.com> <1644878889.dc8nyl60bz.astroid@bobo.none>
Date: Tue, 15 Feb 2022 09:21:12 -0300
Message-ID: <87tud0xqvb.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: oCE__iUU06HiXFQ4ULTykNkha4U3FfhC
X-Proofpoint-ORIG-GUID: 9AyicTggfcpi0dC9LY0hEKgvYQcVevDA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-15_04,2022-02-14_04,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 suspectscore=0 spamscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 impostorscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202150069
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Nicholas Piggin <npiggin@gmail.com> writes:

> Excerpts from Fabiano Rosas's message of February 14, 2022 11:13 pm:
>> Nicholas Piggin <npiggin@gmail.com> writes:
>> 
>>> Use KVM_CAP_PPC_AIL_MODE_3 to determine cap-ail-mode-3 support for KVM
>>> guests. Keep the fallback heuristic for KVM hosts that pre-date this
>>> CAP.
>>>
>>> This is only proposed the KVM CAP has not yet been allocated. I will
>>> ask to merge the new KVM cap when there are no objections on the QEMU
>>> side.
>>>
>>> not-yet-Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>>> ---
>>>  hw/ppc/spapr_caps.c       |  2 +-
>>>  linux-headers/linux/kvm.h |  1 +
>>>  target/ppc/kvm.c          | 18 +++++++++++++++++-
>>>  target/ppc/kvm_ppc.h      |  4 ++--
>>>  4 files changed, 21 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/hw/ppc/spapr_caps.c b/hw/ppc/spapr_caps.c
>>> index 5fd4a53c33..5cc80776d0 100644
>>> --- a/hw/ppc/spapr_caps.c
>>> +++ b/hw/ppc/spapr_caps.c
>>> @@ -619,7 +619,7 @@ static void cap_ail_mode_3_apply(SpaprMachineState *spapr,
>>>      ERRP_GUARD();
>>>  
>>>      if (kvm_enabled()) {
>>> -        if (!kvmppc_supports_ail_3()) {
>>> +        if (!kvmppc_has_cap_ail_3()) {
>>>              error_setg(errp, "KVM implementation does not support cap-ail-mode-3");
>>>              error_append_hint(errp, "Try appending -machine cap-ail-mode-3=off\n");
>>>              return;
>>> diff --git a/linux-headers/linux/kvm.h b/linux-headers/linux/kvm.h
>>> index 02c5e7b7bb..d91f578200 100644
>>> --- a/linux-headers/linux/kvm.h
>>> +++ b/linux-headers/linux/kvm.h
>>> @@ -1130,6 +1130,7 @@ struct kvm_ppc_resize_hpt {
>>>  #define KVM_CAP_BINARY_STATS_FD 203
>>>  #define KVM_CAP_EXIT_ON_EMULATION_FAILURE 204
>>>  #define KVM_CAP_ARM_MTE 205
>>> +#define KVM_CAP_PPC_AIL_MODE_3 210
>>>  
>>>  #ifdef KVM_CAP_IRQ_ROUTING
>>>  
>>> diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
>>> index 128bc530d4..d0d0bdaac4 100644
>>> --- a/target/ppc/kvm.c
>>> +++ b/target/ppc/kvm.c
>>> @@ -90,6 +90,7 @@ static int cap_ppc_nested_kvm_hv;
>>>  static int cap_large_decr;
>>>  static int cap_fwnmi;
>>>  static int cap_rpt_invalidate;
>>> +static int cap_ail_mode_3;
>>>  
>>>  static uint32_t debug_inst_opcode;
>>>  
>>> @@ -154,6 +155,7 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
>>>      }
>>>  
>>>      cap_rpt_invalidate = kvm_vm_check_extension(s, KVM_CAP_PPC_RPT_INVALIDATE);
>>> +    cap_ail_mode_3 = kvm_vm_check_extension(s, KVM_CAP_PPC_AIL_MODE_3);
>>>      kvm_ppc_register_host_cpu_type();
>>>  
>>>      return 0;
>>> @@ -2563,10 +2565,24 @@ int kvmppc_has_cap_rpt_invalidate(void)
>>>      return cap_rpt_invalidate;
>>>  }
>>>  
>>> -int kvmppc_supports_ail_3(void)
>>> +int kvmppc_has_cap_ail_3(void)
>>>  {
>>>      PowerPCCPUClass *pcc = kvm_ppc_get_host_cpu_class();
>>>  
>>> +    if (cap_ail_mode_3) {
>>> +        return 1;
>>> +    }
>>> +
>>> +    if (kvm_ioctl(kvm_state, KVM_CHECK_EXTENSION, KVM_CAP_PPC_AIL_MODE_3) == 0) {
>>> +        return 0;
>>> +    }
>> 
>> This is not needed here it seems.
>
> This is to test whether the capability is recognised by the HV. 
> kvm_vm_check_extension() treats ioctl error as 0 capability but we want 
> to do this extra heuristic.

Do you intend to make the KVM capability return < 0 in case AIL_3 is not
supported? AFAICS the unknown capability won't result in an ioctl error
as kvm_vm_ioctl_check_extension always returns >= 0.

>
> I'm not sure if there's a better standard way to do this.
>
> Thanks,
> Nick

