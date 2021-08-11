Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06CF83E8D3D
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Aug 2021 11:28:57 +0200 (CEST)
Received: from localhost ([::1]:51302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDkXg-0007Rk-0p
	for lists+qemu-devel@lfdr.de; Wed, 11 Aug 2021 05:28:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bharata@linux.ibm.com>)
 id 1mDkVR-0005dY-Ue; Wed, 11 Aug 2021 05:26:38 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:65112)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bharata@linux.ibm.com>)
 id 1mDkVK-0004wr-CH; Wed, 11 Aug 2021 05:26:37 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17B94UKk063972; Wed, 11 Aug 2021 05:26:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=FlvpPRxgpL2eNmDq49ndOmib8+U58HQRyUGOu3cuzt4=;
 b=a4sXHhA9/wn/D/neogWR6MO1IpTbBBXBX4xZSI8CWdT94rVk9VtEv/es/3E8PIuXiUCf
 lbI36DvKCgs5FxWUDuJrObzuS2VAmE8z0H3diCY8QZ7GNtEldnas5i4Jf/aAOy0rxCg1
 UeVqOqkFfVNBgEU1TBdKSlHJcODXi2ehFee3ARGn+jskvPtMYHroy6zkHsjfMhF7epqb
 1t3lMgF+Z1YKri3uixY+JJjs0+GS2tk0wVeriB1qdiv2d4wT1I6RLTxcIz7RKWwoPCVC
 TkU6Y7CDzlLqFpg3QWmgr+Ud1TTZr/jp1tpLLTknVMgoijUvB8864A+EwmhoGjzuGTcR iQ== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3abruy4tkw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Aug 2021 05:26:24 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17B9DDnx017279;
 Wed, 11 Aug 2021 09:26:22 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03ams.nl.ibm.com with ESMTP id 3a9ht8yscg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Aug 2021 09:26:22 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 17B9QJbD44368132
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 Aug 2021 09:26:19 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E6D1F420AB;
 Wed, 11 Aug 2021 09:26:18 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4748B42115;
 Wed, 11 Aug 2021 09:26:17 +0000 (GMT)
Received: from in.ibm.com (unknown [9.199.40.218])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Wed, 11 Aug 2021 09:26:16 +0000 (GMT)
Date: Wed, 11 Aug 2021 14:56:13 +0530
From: Bharata B Rao <bharata@linux.ibm.com>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [RFC PATCH v0 1/2] spapr: Add H_REG_SNS hcall
Message-ID: <YROXtRfSAf2Gi0Yn@in.ibm.com>
References: <20210805073228.502292-1-bharata@linux.ibm.com>
 <20210805073228.502292-2-bharata@linux.ibm.com>
 <YRCl4n25l8szLQVC@yekko>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YRCl4n25l8szLQVC@yekko>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 2D9hNfSlbnmA4DCVA-atabzd91cScZtS
X-Proofpoint-ORIG-GUID: 2D9hNfSlbnmA4DCVA-atabzd91cScZtS
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-11_03:2021-08-10,
 2021-08-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 adultscore=0 mlxlogscore=999 mlxscore=0 spamscore=0 clxscore=1011
 impostorscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108110058
Received-SPF: pass client-ip=148.163.156.1; envelope-from=bharata@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Reply-To: bharata@linux.ibm.com
Cc: aneesh.kumar@linux.ibm.com, qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Aug 09, 2021 at 01:49:54PM +1000, David Gibson wrote:
> On Thu, Aug 05, 2021 at 01:02:27PM +0530, Bharata B Rao wrote:
> > Add support for H_REG_SNS hcall so that asynchronous page
> > fault mechanism can be supported on PowerKVM guests.
> > 
> > This hcall essentially issues KVM_PPC_SET_SNS to let the
> > host map and pin the memory containing the Subvention
> > Notification Structure. It also claims SPAPR_IRQ_SNS to
> > be used as subvention notification interrupt.
> > 
> > Note: Updates to linux-headers/linux/kvm.h are temporary
> > pending headers update.
> > 
> > Signed-off-by: Bharata B Rao <bharata@linux.ibm.com>
> > ---
> >  hw/ppc/spapr.c                  |  3 ++
> >  hw/ppc/spapr_hcall.c            | 56 +++++++++++++++++++++++++++++++++
> >  include/hw/ppc/spapr.h          |  3 ++
> >  include/hw/ppc/spapr_irq.h      |  1 +
> >  linux-headers/asm-powerpc/kvm.h |  6 ++++
> >  linux-headers/linux/kvm.h       |  1 +
> >  target/ppc/kvm.c                | 14 +++++++++
> >  target/ppc/kvm_ppc.h            | 10 ++++++
> >  8 files changed, 94 insertions(+)
> > 
> > diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> > index 81699d4f8b..5f1f75826d 100644
> > --- a/hw/ppc/spapr.c
> > +++ b/hw/ppc/spapr.c
> > @@ -2830,6 +2830,9 @@ static void spapr_machine_init(MachineState *machine)
> >  
> >          /* Enable H_PAGE_INIT */
> >          kvmppc_enable_h_page_init();
> > +
> > +        /* Enable H_REG_SNS */
> > +        kvmppc_enable_h_reg_sns();
> >      }
> >  
> >      /* map RAM */
> > diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
> > index 0e9a5b2e40..957edecb13 100644
> > --- a/hw/ppc/spapr_hcall.c
> > +++ b/hw/ppc/spapr_hcall.c
> > @@ -1405,6 +1405,59 @@ static target_ulong h_update_dt(PowerPCCPU *cpu, SpaprMachineState *spapr,
> >      return H_SUCCESS;
> >  }
> >  
> > +static target_ulong deregister_sns(PowerPCCPU *cpu, SpaprMachineState *spapr)
> > +{
> > +    spapr->sns_addr = -1;
> > +    spapr->sns_len = 0;
> > +    spapr_irq_free(spapr, SPAPR_IRQ_SNS, 1);
> > +
> > +    return H_SUCCESS;
> > +}
> > +
> > +static target_ulong h_reg_sns(PowerPCCPU *cpu, SpaprMachineState *spapr,
> > +                              target_ulong opcode, target_ulong *args)
> > +{
> > +    target_ulong addr = args[0];
> > +    target_ulong len = args[1];
> > +
> > +    if (addr == -1) {
> > +        return deregister_sns(cpu, spapr);
> > +    }
> > +
> > +    /*
> > +     * If SNS area is already registered, can't register again before
> > +     * deregistering it first.
> > +     */
> > +    if (spapr->sns_addr == -1) {
> 
> As Fabiano says, it looks like the logic is reversed here.

Correct.

> 
> > +        return H_PARAMETER;
> 
> Also, H_PARAMETER doesn't seem like the right error for this case.
> H_BUSY, maybe?

Yes we may return H_BUSY.

> 
> > +    }
> > +
> > +    if (!QEMU_IS_ALIGNED(addr, 4096)) {
> 
> What's the significance of 4096 here?  Should this be one of the page
> size defines instead?

PAPR specifies this alignment.
"If the Address parameter is not 4K aligned in the valid logical address
space of the caller, then return H_Parameter."

> 
> > +        return H_PARAMETER;
> > +    }
> > +
> > +    if (len < 256) {
> 
> A defined constant (SPAPR_MIN_SNS_SIZE?) would be worthwhile here, I think.

Yes.

> 
> > +        return H_P2;
> > +    }
> > +
> > +    /* TODO: SNS area is not allowed to cross a page boundary */
> > +
> > +    /* KVM_PPC_SET_SNS ioctl */
> > +    if (kvmppc_set_sns_reg(addr, len)) {
> 
> What will happen if you attempt this on a TCG system?

We should have a variant of kvmppc_set_sns_reg() for TCG that
returns error, so that this hcall can fail.

> 
> > +        return H_PARAMETER;
> > +    }
> > +
> > +    /* Record SNS addr and len */
> > +    spapr->sns_addr = addr;
> > +    spapr->sns_len = len;
> > +
> > +    /* Register irq source for sending ESN notification */
> > +    spapr_irq_claim(spapr, SPAPR_IRQ_SNS, false, &error_fatal);
> 
> I don't think &error_fatal can be right here.  AFAICT this must be one
> of two cases:
>    1) This should never fail, no matter what the guest does.  If it
>       does fail, that indicates a qemu bug.  In that case &error_abort is
>       more appropriate
>    2) This could fail for certain sequences of guest actions.  If
>       that's the case, we shouldn't kill qemu, but should return
>       H_HARDWARE (or something) instead.

I think we could just check for error and return failure so that
the guest wouldn't go ahead and enable async-pf feature.

> 
> > +    args[1] = SPAPR_IRQ_SNS; /* irq no in R5 */
> > +
> > +    return H_SUCCESS;
> > +}
> > +
> >  static spapr_hcall_fn papr_hypercall_table[(MAX_HCALL_OPCODE / 4) + 1];
> >  static spapr_hcall_fn kvmppc_hypercall_table[KVMPPC_HCALL_MAX - KVMPPC_HCALL_BASE + 1];
> >  static spapr_hcall_fn svm_hypercall_table[(SVM_HCALL_MAX - SVM_HCALL_BASE) / 4 + 1];
> > @@ -1545,6 +1598,9 @@ static void hypercall_register_types(void)
> >      spapr_register_hypercall(KVMPPC_H_CAS, h_client_architecture_support);
> >  
> >      spapr_register_hypercall(KVMPPC_H_UPDATE_DT, h_update_dt);
> > +
> > +    /* SNS memory area registration */
> > +    spapr_register_hypercall(H_REG_SNS, h_reg_sns);
> 
> You definitely need a machine parameter to enable this, and you should
> only enable it by default for newer machine types.  Otherwise you will
> cause migration breakages.

Sure.

> 
> >  }
> >  
> >  type_init(hypercall_register_types)
> > diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
> > index 637652ad16..934f9e066e 100644
> > --- a/include/hw/ppc/spapr.h
> > +++ b/include/hw/ppc/spapr.h
> > @@ -252,6 +252,8 @@ struct SpaprMachineState {
> >      uint32_t numa_assoc_array[MAX_NODES + NVGPU_MAX_NUM][NUMA_ASSOC_SIZE];
> >  
> >      Error *fwnmi_migration_blocker;
> > +    uint64_t sns_addr;
> > +    uint64_t sns_len;
> >  };
> >  
> >  #define H_SUCCESS         0
> > @@ -549,6 +551,7 @@ struct SpaprMachineState {
> >  #define H_SCM_UNBIND_MEM        0x3F0
> >  #define H_SCM_UNBIND_ALL        0x3FC
> >  #define H_SCM_HEALTH            0x400
> > +#define H_REG_SNS               0x41C
> >  #define H_RPT_INVALIDATE        0x448
> >  
> >  #define MAX_HCALL_OPCODE        H_RPT_INVALIDATE
> > diff --git a/include/hw/ppc/spapr_irq.h b/include/hw/ppc/spapr_irq.h
> > index c22a72c9e2..26c680f065 100644
> > --- a/include/hw/ppc/spapr_irq.h
> > +++ b/include/hw/ppc/spapr_irq.h
> > @@ -21,6 +21,7 @@
> >  #define SPAPR_XIRQ_BASE      XICS_IRQ_BASE /* 0x1000 */
> >  #define SPAPR_IRQ_EPOW       (SPAPR_XIRQ_BASE + 0x0000)
> >  #define SPAPR_IRQ_HOTPLUG    (SPAPR_XIRQ_BASE + 0x0001)
> > +#define SPAPR_IRQ_SNS        (SPAPR_XIRQ_BASE + 0x0002)
> >  #define SPAPR_IRQ_VIO        (SPAPR_XIRQ_BASE + 0x0100)  /* 256 VIO devices */
> >  #define SPAPR_IRQ_PCI_LSI    (SPAPR_XIRQ_BASE + 0x0200)  /* 32+ PHBs devices */
> >  
> > diff --git a/linux-headers/asm-powerpc/kvm.h b/linux-headers/asm-powerpc/kvm.h
> > index 9f18fa090f..d72739126a 100644
> > --- a/linux-headers/asm-powerpc/kvm.h
> > +++ b/linux-headers/asm-powerpc/kvm.h
> > @@ -470,6 +470,12 @@ struct kvm_ppc_cpu_char {
> >  #define KVM_PPC_CPU_BEHAV_BNDS_CHK_SPEC_BAR	(1ULL << 61)
> >  #define KVM_PPC_CPU_BEHAV_FLUSH_COUNT_CACHE	(1ull << 58)
> >  
> > +/* For KVM_PPC_SET_SNS */
> > +struct kvm_ppc_sns_reg {
> > +	__u64 addr;
> > +	__u64 len;
> > +};
> > +
> 
> Updates to linux-headers/ should be done as a separate preliminary
> patch, listing the specific kernel commit that you're updating too.

Yes, I am aware of it. Since the kernel patches are still in RFC
state, I noted this as a TODO in patch description :-)

Thanks for your review.

Regards,
Bharata.

