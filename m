Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A86D22F746B
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 09:33:09 +0100 (CET)
Received: from localhost ([::1]:55938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0KXc-0002rf-9x
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 03:33:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bharata@linux.ibm.com>)
 id 1l0KWR-0002Kk-Kz; Fri, 15 Jan 2021 03:31:55 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:30766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bharata@linux.ibm.com>)
 id 1l0KWP-00060C-E4; Fri, 15 Jan 2021 03:31:55 -0500
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10F8S5gh143255; Fri, 15 Jan 2021 03:31:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=KfbbqPdg7gQmCozlnI03ClAl6va6SCyRc2FYeT+vf6s=;
 b=tonYX3Hr/tqYKKTyvzcyrr9Q6zbI8P7Pa2yuUGSfnfh+60IsxPpuDxSGlmYlgQ6kbirL
 2ZfZiPWHw5OjGnukXCGQkj3o9slcV0fzqmdXNWrNMRjhm2jNm+o/pq1SRR1qoGhNnBS/
 71i4JAvJocFXgOBBlwk2xvZVwIJ1Csz1uzcb8c4KY3qQU9YJTi92SSfIF+MJA/HRhL0P
 wnDBx7m/g4oka9EpnM53pTWKBSn9u5OEJSYZ2ExE/GyJzOFeoEYMosEZuvulgjbF1HYs
 MSxJHRy4B6JJEFQOjGGQ0uiHp5mSaiIdzlFLhp3EYv+jEb99JvUMGD56WcVUDIQRnX0s Aw== 
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3637jmr33w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Jan 2021 03:31:36 -0500
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10F8Rnk0031857;
 Fri, 15 Jan 2021 08:31:34 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma04fra.de.ibm.com with ESMTP id 3604h9b4n0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Jan 2021 08:31:34 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 10F8VQoE28312002
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 15 Jan 2021 08:31:26 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B5C194C040;
 Fri, 15 Jan 2021 08:31:31 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A5E1B4C04A;
 Fri, 15 Jan 2021 08:31:30 +0000 (GMT)
Received: from in.ibm.com (unknown [9.85.94.204])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Fri, 15 Jan 2021 08:31:30 +0000 (GMT)
Date: Fri, 15 Jan 2021 14:01:28 +0530
From: Bharata B Rao <bharata@linux.ibm.com>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [RFC PATCH v0 1/1] target/ppc: Support for H_RPT_INVALIDATE hcall
Message-ID: <20210115083128.GA2457611@in.ibm.com>
References: <20210106085910.2200795-1-bharata@linux.ibm.com>
 <20210113172256.0d32dc5d@bahia.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210113172256.0d32dc5d@bahia.lan>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-15_03:2021-01-15,
 2021-01-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 spamscore=0
 priorityscore=1501 mlxscore=0 lowpriorityscore=0 adultscore=0
 malwarescore=0 phishscore=0 suspectscore=0 mlxlogscore=999 impostorscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101150043
Received-SPF: pass client-ip=148.163.156.1; envelope-from=bharata@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: paulus@ozlabs.org, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 13, 2021 at 05:22:56PM +0100, Greg Kurz wrote:
> Hi Bharata,
> 
> On Wed,  6 Jan 2021 14:29:10 +0530
> Bharata B Rao <bharata@linux.ibm.com> wrote:
> 
> > If KVM_CAP_RPT_INVALIDATE KVM capability is enabled, then
> > 
> > - indicate the availability of H_RPT_INVALIDATE hcall to the guest via
> >   ibm,hypertas-functions property.
> > - Enable the hcall
> > 
> > Both the above are done only if the new sPAPR machine capability
> > cap-rpt-invalidate is set.
> > 
> > Note: The KVM implementation of the hcall has been posted for upstream
> > review here:
> > https://lore.kernel.org/linuxppc-dev/20210105090557.2150104-1-bharata@linux.ibm.com/T/#t
> > 
> > Update to linux-headers/linux/kvm.h here is temporary, will be
> > done via header updates once the kernel change is accepted upstream.
> > 
> > Signed-off-by: Bharata B Rao <bharata@linux.ibm.com>
> > ---
> 
> Patch looks mostly fine. A few remarks below.
> 
> >  hw/ppc/spapr.c            |  7 ++++++
> >  hw/ppc/spapr_caps.c       | 49 +++++++++++++++++++++++++++++++++++++++
> >  include/hw/ppc/spapr.h    |  8 +++++--
> >  linux-headers/linux/kvm.h |  1 +
> >  target/ppc/kvm.c          | 12 ++++++++++
> >  target/ppc/kvm_ppc.h      | 11 +++++++++
> >  6 files changed, 86 insertions(+), 2 deletions(-)
> > 
> > diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> > index 489cefcb81..0228083800 100644
> > --- a/hw/ppc/spapr.c
> > +++ b/hw/ppc/spapr.c
> > @@ -890,6 +890,11 @@ static void spapr_dt_rtas(SpaprMachineState *spapr, void *fdt)
> >      add_str(hypertas, "hcall-copy");
> >      add_str(hypertas, "hcall-debug");
> >      add_str(hypertas, "hcall-vphn");
> > +    if (kvm_enabled() &&
> 
> You shouldn't check KVM here. The capability is enough to decide if we
> should expose "hcall-rpt-invalidate" or not. FWIW we won't even reach
> this code when running with anything but KVM.

Correct, the capability itself can be only for KVM case.

> 
> > +        (spapr_get_cap(spapr, SPAPR_CAP_RPT_INVALIDATE) == SPAPR_CAP_ON)) {
> > +        add_str(hypertas, "hcall-rpt-invalidate");
> > +    }
> > +
> >      add_str(qemu_hypertas, "hcall-memop1");
> >  
> >      if (!kvm_enabled() || kvmppc_spapr_use_multitce()) {
> > @@ -2021,6 +2026,7 @@ static const VMStateDescription vmstate_spapr = {
> >          &vmstate_spapr_cap_ccf_assist,
> >          &vmstate_spapr_cap_fwnmi,
> >          &vmstate_spapr_fwnmi,
> > +        &vmstate_spapr_cap_rpt_invalidate,
> >          NULL
> >      }
> >  };
> > @@ -4478,6 +4484,7 @@ static void spapr_machine_class_init(ObjectClass *oc, void *data)
> >      smc->default_caps.caps[SPAPR_CAP_LARGE_DECREMENTER] = SPAPR_CAP_ON;
> >      smc->default_caps.caps[SPAPR_CAP_CCF_ASSIST] = SPAPR_CAP_ON;
> >      smc->default_caps.caps[SPAPR_CAP_FWNMI] = SPAPR_CAP_ON;
> > +    smc->default_caps.caps[SPAPR_CAP_RPT_INVALIDATE] = SPAPR_CAP_OFF;
> 
> Any reason for not enabling this for the default machine type and
> disabling it for existing machine types only ?

If this capability is enabled, then

1. First level guest (L1) can off-load the TLB invalidations to the
new hcall if the platform has disabled LPCR[GTSE].

2. Nested guest (L2) will switch to this new hcall rather than using
the old H_TLB_INVALIDATE hcall.

Case 2 is optional and case 1 makes sense only if LPCR[GTSE]=off.
Hence I thought keeping it off by default and expecting the
user to turn it on only if required would be correct.

Please note that turning this capability ON will result in the
new hcall being exposed to the guest. I hope this is the right
usage of spapr-caps?

> > diff --git a/target/ppc/kvm_ppc.h b/target/ppc/kvm_ppc.h
> > index 73ce2bc951..8e27f8421f 100644
> > --- a/target/ppc/kvm_ppc.h
> > +++ b/target/ppc/kvm_ppc.h
> > @@ -24,6 +24,7 @@ void kvmppc_enable_logical_ci_hcalls(void);
> >  void kvmppc_enable_set_mode_hcall(void);
> >  void kvmppc_enable_clear_ref_mod_hcalls(void);
> >  void kvmppc_enable_h_page_init(void);
> > +void kvmppc_enable_h_rpt_invalidate(void);
> >  void kvmppc_set_papr(PowerPCCPU *cpu);
> >  int kvmppc_set_compat(PowerPCCPU *cpu, uint32_t compat_pvr);
> >  void kvmppc_set_mpic_proxy(PowerPCCPU *cpu, int mpic_proxy);
> > @@ -72,6 +73,7 @@ bool kvmppc_has_cap_nested_kvm_hv(void);
> >  int kvmppc_set_cap_nested_kvm_hv(int enable);
> >  int kvmppc_get_cap_large_decr(void);
> >  int kvmppc_enable_cap_large_decr(PowerPCCPU *cpu, int enable);
> > +int kvmppc_has_cap_rpt_invalidate(void);
> >  int kvmppc_enable_hwrng(void);
> >  int kvmppc_put_books_sregs(PowerPCCPU *cpu);
> >  PowerPCCPUClass *kvm_ppc_get_host_cpu_class(void);
> > @@ -151,6 +153,10 @@ static inline void kvmppc_enable_h_page_init(void)
> >  {
> >  }
> >  
> > +static inline void kvmppc_enable_h_rpt_invalidate(void)
> > +{
> 
> g_assert_not_reached() ?

Don't see many others doing that, is that a new preferred
way?

Regards,
Bharata.

