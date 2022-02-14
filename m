Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5E14B5284
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 14:59:00 +0100 (CET)
Received: from localhost ([::1]:56290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJbsY-0002fu-MY
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 08:58:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nJbBf-00044l-PQ; Mon, 14 Feb 2022 08:14:39 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:16582
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nJbBP-0002NK-Qy; Mon, 14 Feb 2022 08:14:36 -0500
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21EBlTJW008081; 
 Mon, 14 Feb 2022 13:14:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=tpH+4kA8ExNiqYaES5bqHAN4DrOVA8peMg82J9RHxBk=;
 b=PmAamj6XFzTYqNLaM2dcjeJGxj+LYWf2z0jHox0t8pXcaFr0eN0r1bbBfgFpLFQzjfd2
 vmVWamq8f0IUDbXXKh2XZULxpe4PrhU/YIqjtgjZnaKVRU4F23c6Jorl5fnAAtbdvf4G
 0Keq6kEi7ng2IPCHK4PPJfc8WXPWfEakLlorlKNlpwilQG9Rf1bIayBDBL0J51HsCYER
 lPGUDHEKjyWEsbXwtbdWL3Ruvii6ki7HzL7QESby8pzOch3YhhE8E3ehQ7+S5wjZ2Hbq
 BXa0ZPDvniK8/ZMy8sFOxd8cpp88G9+Hrw+kGO4KKrIwaL6pN2GCIP4HJwiy7wDBq7Yr ZQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3e7d0jnm6t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Feb 2022 13:14:03 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21ECNUAt001404;
 Mon, 14 Feb 2022 13:14:03 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3e7d0jnm6h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Feb 2022 13:14:03 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21EDDj7Z022891;
 Mon, 14 Feb 2022 13:14:02 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma01dal.us.ibm.com with ESMTP id 3e64haybxc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Feb 2022 13:14:02 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21EDDxuo31785238
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Feb 2022 13:13:59 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8291778068;
 Mon, 14 Feb 2022 13:13:59 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B7A2E78060;
 Mon, 14 Feb 2022 13:13:58 +0000 (GMT)
Received: from localhost (unknown [9.211.47.159])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Mon, 14 Feb 2022 13:13:58 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, qemu-ppc@nongnu.org
Subject: Re: [PATCH 2/2] target/ppc/kvm: Use KVM_CAP_PPC_AIL_MODE_3 to
 determine cap-ail-mode-3 support
In-Reply-To: <20220214111749.1542196-2-npiggin@gmail.com>
References: <20220214111749.1542196-1-npiggin@gmail.com>
 <20220214111749.1542196-2-npiggin@gmail.com>
Date: Mon, 14 Feb 2022 10:13:56 -0300
Message-ID: <87sfsllhez.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: UdCywbvQ2dj_PcL6WO_A6fEnNtq_5Q6E
X-Proofpoint-GUID: _kOCLnNDPEZm3RKvQlfmj3AIKB1FFEYe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-14_06,2022-02-14_03,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 mlxlogscore=999
 adultscore=0 spamscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 mlxscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202140074
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
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
Cc: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Nicholas Piggin <npiggin@gmail.com> writes:

> Use KVM_CAP_PPC_AIL_MODE_3 to determine cap-ail-mode-3 support for KVM
> guests. Keep the fallback heuristic for KVM hosts that pre-date this
> CAP.
>
> This is only proposed the KVM CAP has not yet been allocated. I will
> ask to merge the new KVM cap when there are no objections on the QEMU
> side.
>
> not-yet-Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  hw/ppc/spapr_caps.c       |  2 +-
>  linux-headers/linux/kvm.h |  1 +
>  target/ppc/kvm.c          | 18 +++++++++++++++++-
>  target/ppc/kvm_ppc.h      |  4 ++--
>  4 files changed, 21 insertions(+), 4 deletions(-)
>
> diff --git a/hw/ppc/spapr_caps.c b/hw/ppc/spapr_caps.c
> index 5fd4a53c33..5cc80776d0 100644
> --- a/hw/ppc/spapr_caps.c
> +++ b/hw/ppc/spapr_caps.c
> @@ -619,7 +619,7 @@ static void cap_ail_mode_3_apply(SpaprMachineState *spapr,
>      ERRP_GUARD();
>  
>      if (kvm_enabled()) {
> -        if (!kvmppc_supports_ail_3()) {
> +        if (!kvmppc_has_cap_ail_3()) {
>              error_setg(errp, "KVM implementation does not support cap-ail-mode-3");
>              error_append_hint(errp, "Try appending -machine cap-ail-mode-3=off\n");
>              return;
> diff --git a/linux-headers/linux/kvm.h b/linux-headers/linux/kvm.h
> index 02c5e7b7bb..d91f578200 100644
> --- a/linux-headers/linux/kvm.h
> +++ b/linux-headers/linux/kvm.h
> @@ -1130,6 +1130,7 @@ struct kvm_ppc_resize_hpt {
>  #define KVM_CAP_BINARY_STATS_FD 203
>  #define KVM_CAP_EXIT_ON_EMULATION_FAILURE 204
>  #define KVM_CAP_ARM_MTE 205
> +#define KVM_CAP_PPC_AIL_MODE_3 210
>  
>  #ifdef KVM_CAP_IRQ_ROUTING
>  
> diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
> index 128bc530d4..d0d0bdaac4 100644
> --- a/target/ppc/kvm.c
> +++ b/target/ppc/kvm.c
> @@ -90,6 +90,7 @@ static int cap_ppc_nested_kvm_hv;
>  static int cap_large_decr;
>  static int cap_fwnmi;
>  static int cap_rpt_invalidate;
> +static int cap_ail_mode_3;
>  
>  static uint32_t debug_inst_opcode;
>  
> @@ -154,6 +155,7 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
>      }
>  
>      cap_rpt_invalidate = kvm_vm_check_extension(s, KVM_CAP_PPC_RPT_INVALIDATE);
> +    cap_ail_mode_3 = kvm_vm_check_extension(s, KVM_CAP_PPC_AIL_MODE_3);
>      kvm_ppc_register_host_cpu_type();
>  
>      return 0;
> @@ -2563,10 +2565,24 @@ int kvmppc_has_cap_rpt_invalidate(void)
>      return cap_rpt_invalidate;
>  }
>  
> -int kvmppc_supports_ail_3(void)
> +int kvmppc_has_cap_ail_3(void)
>  {
>      PowerPCCPUClass *pcc = kvm_ppc_get_host_cpu_class();
>  
> +    if (cap_ail_mode_3) {
> +        return 1;
> +    }
> +
> +    if (kvm_ioctl(kvm_state, KVM_CHECK_EXTENSION, KVM_CAP_PPC_AIL_MODE_3) == 0) {
> +        return 0;
> +    }

This is not needed here it seems.

> +
> +    /*
> +     * For KVM hosts that pre-date this cap, special-case the test because
> +     * the performance cost for disabling the feature unconditionally is
> +     * prohibitive.
> +     */
> +
>      /*
>       * KVM PR only supports AIL-0
>       */
> diff --git a/target/ppc/kvm_ppc.h b/target/ppc/kvm_ppc.h
> index d9d1c54955..efafa67b83 100644
> --- a/target/ppc/kvm_ppc.h
> +++ b/target/ppc/kvm_ppc.h
> @@ -73,7 +73,7 @@ int kvmppc_set_cap_nested_kvm_hv(int enable);
>  int kvmppc_get_cap_large_decr(void);
>  int kvmppc_enable_cap_large_decr(PowerPCCPU *cpu, int enable);
>  int kvmppc_has_cap_rpt_invalidate(void);
> -int kvmppc_supports_ail_3(void);
> +int kvmppc_has_cap_ail_3(void);
>  int kvmppc_enable_hwrng(void);
>  int kvmppc_put_books_sregs(PowerPCCPU *cpu);
>  PowerPCCPUClass *kvm_ppc_get_host_cpu_class(void);
> @@ -394,7 +394,7 @@ static inline int kvmppc_has_cap_rpt_invalidate(void)
>      return false;
>  }
>  
> -static inline int kvmppc_supports_ail_3(void)
> +static inline int kvmppc_has_cap_ail_3(void)
>  {
>      return false;
>  }

