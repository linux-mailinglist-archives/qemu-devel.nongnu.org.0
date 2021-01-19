Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84ECC2FAF97
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 05:49:42 +0100 (CET)
Received: from localhost ([::1]:50808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1ixZ-0004W7-L8
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 23:49:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bharata@linux.ibm.com>)
 id 1l1itG-0001IO-MD; Mon, 18 Jan 2021 23:45:14 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:18524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bharata@linux.ibm.com>)
 id 1l1itE-0002z7-5B; Mon, 18 Jan 2021 23:45:14 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10J4VwNo069455; Mon, 18 Jan 2021 23:45:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=MM6FCmwe4sGDJysPtEhA1E4ZMIxsFfQPSFiGCqAA2bI=;
 b=XZtwr8dCzfSOF3UvTP0A1MRuDa1umZaFsqUUZ7d3RI7BUbxnj1Ppcl0sk2Fx5wic+rEZ
 8nCAnjTcSvEK3U6Bk5wrdZIB1PoeiQuXTnRFLmFuWHICTjo4nKcW1mFzj6efMPJj/hZ1
 bn1lc2+Fo5X/glFX57qBeKEDvrTZ4PZajS0scE2V7jv++zJuELfujmyHSpLQ9wqwWOgS
 likNIsiOQeJsH321EKJnnnPkutOIGyHxcqfQa5SwVl+RUvk/RmMTzSytnArOMOyQlDtq
 CBI6tMLftrt5oRzLT4lbkIvbbXEqFIEVKJS+QR79P8rI9Idmcah5yiqMhsO2tz2OexhO PQ== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 365pegag98-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Jan 2021 23:45:03 -0500
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10J4cpkT015823;
 Tue, 19 Jan 2021 04:45:01 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03fra.de.ibm.com with ESMTP id 363qs89cq4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Jan 2021 04:45:01 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10J4ixCJ42139962
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Jan 2021 04:44:59 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E2AE1AE051;
 Tue, 19 Jan 2021 04:44:58 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CF030AE04D;
 Tue, 19 Jan 2021 04:44:57 +0000 (GMT)
Received: from in.ibm.com (unknown [9.199.46.252])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Tue, 19 Jan 2021 04:44:57 +0000 (GMT)
Date: Tue, 19 Jan 2021 10:14:55 +0530
From: Bharata B Rao <bharata@linux.ibm.com>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [RFC PATCH v0 1/1] target/ppc: Support for H_RPT_INVALIDATE hcall
Message-ID: <20210119044455.GA2587010@in.ibm.com>
References: <20210106085910.2200795-1-bharata@linux.ibm.com>
 <20210113172256.0d32dc5d@bahia.lan>
 <20210115083128.GA2457611@in.ibm.com>
 <20210115183005.2337dae4@bahia.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210115183005.2337dae4@bahia.lan>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-18_15:2021-01-18,
 2021-01-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0
 phishscore=0 adultscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 mlxlogscore=999 impostorscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101190022
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

On Fri, Jan 15, 2021 at 06:30:05PM +0100, Greg Kurz wrote:
> On Fri, 15 Jan 2021 14:01:28 +0530
> Bharata B Rao <bharata@linux.ibm.com> wrote:
> 
> > On Wed, Jan 13, 2021 at 05:22:56PM +0100, Greg Kurz wrote:
> > > Hi Bharata,
> > > 
> > > On Wed,  6 Jan 2021 14:29:10 +0530
> > > Bharata B Rao <bharata@linux.ibm.com> wrote:
> > > 
> > > > If KVM_CAP_RPT_INVALIDATE KVM capability is enabled, then
> > > > 
> > > > - indicate the availability of H_RPT_INVALIDATE hcall to the guest via
> > > >   ibm,hypertas-functions property.
> > > > - Enable the hcall
> > > > 
> > > > Both the above are done only if the new sPAPR machine capability
> > > > cap-rpt-invalidate is set.
> > > > 
> > > > Note: The KVM implementation of the hcall has been posted for upstream
> > > > review here:
> > > > https://lore.kernel.org/linuxppc-dev/20210105090557.2150104-1-bharata@linux.ibm.com/T/#t
> > > > 
> > > > Update to linux-headers/linux/kvm.h here is temporary, will be
> > > > done via header updates once the kernel change is accepted upstream.
> > > > 
> > > > Signed-off-by: Bharata B Rao <bharata@linux.ibm.com>
> > > > ---
> > > 
> > > Patch looks mostly fine. A few remarks below.
> > > 
> > > >  hw/ppc/spapr.c            |  7 ++++++
> > > >  hw/ppc/spapr_caps.c       | 49 +++++++++++++++++++++++++++++++++++++++
> > > >  include/hw/ppc/spapr.h    |  8 +++++--
> > > >  linux-headers/linux/kvm.h |  1 +
> > > >  target/ppc/kvm.c          | 12 ++++++++++
> > > >  target/ppc/kvm_ppc.h      | 11 +++++++++
> > > >  6 files changed, 86 insertions(+), 2 deletions(-)
> > > > 
> > > > diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> > > > index 489cefcb81..0228083800 100644
> > > > --- a/hw/ppc/spapr.c
> > > > +++ b/hw/ppc/spapr.c
> > > > @@ -890,6 +890,11 @@ static void spapr_dt_rtas(SpaprMachineState *spapr, void *fdt)
> > > >      add_str(hypertas, "hcall-copy");
> > > >      add_str(hypertas, "hcall-debug");
> > > >      add_str(hypertas, "hcall-vphn");
> > > > +    if (kvm_enabled() &&
> > > 
> > > You shouldn't check KVM here. The capability is enough to decide if we
> > > should expose "hcall-rpt-invalidate" or not. FWIW we won't even reach
> > > this code when running with anything but KVM.
> > 
> > Correct, the capability itself can be only for KVM case.
> > 
> > > 
> > > > +        (spapr_get_cap(spapr, SPAPR_CAP_RPT_INVALIDATE) == SPAPR_CAP_ON)) {
> > > > +        add_str(hypertas, "hcall-rpt-invalidate");
> > > > +    }
> > > > +
> > > >      add_str(qemu_hypertas, "hcall-memop1");
> > > >  
> > > >      if (!kvm_enabled() || kvmppc_spapr_use_multitce()) {
> > > > @@ -2021,6 +2026,7 @@ static const VMStateDescription vmstate_spapr = {
> > > >          &vmstate_spapr_cap_ccf_assist,
> > > >          &vmstate_spapr_cap_fwnmi,
> > > >          &vmstate_spapr_fwnmi,
> > > > +        &vmstate_spapr_cap_rpt_invalidate,
> > > >          NULL
> > > >      }
> > > >  };
> > > > @@ -4478,6 +4484,7 @@ static void spapr_machine_class_init(ObjectClass *oc, void *data)
> > > >      smc->default_caps.caps[SPAPR_CAP_LARGE_DECREMENTER] = SPAPR_CAP_ON;
> > > >      smc->default_caps.caps[SPAPR_CAP_CCF_ASSIST] = SPAPR_CAP_ON;
> > > >      smc->default_caps.caps[SPAPR_CAP_FWNMI] = SPAPR_CAP_ON;
> > > > +    smc->default_caps.caps[SPAPR_CAP_RPT_INVALIDATE] = SPAPR_CAP_OFF;
> > > 
> > > Any reason for not enabling this for the default machine type and
> > > disabling it for existing machine types only ?
> > 
> > If this capability is enabled, then
> > 
> > 1. First level guest (L1) can off-load the TLB invalidations to the
> > new hcall if the platform has disabled LPCR[GTSE].
> > 
> > 2. Nested guest (L2) will switch to this new hcall rather than using
> > the old H_TLB_INVALIDATE hcall.
> > 
> > Case 2 is optional and case 1 makes sense only if LPCR[GTSE]=off.
> 
> I don't think this is relevant, as the importance of each case can change,
> e.g. nested is gaining momentum.
> 
> > Hence I thought keeping it off by default and expecting the
> > user to turn it on only if required would be correct.
> > 
> 
> If the feature is an improvement, even for what is considered a corner
> case now, and it doesn't do harm to setups that won't use it, then it
> should be enabled IMHO.
> 
> > Please note that turning this capability ON will result in the
> > new hcall being exposed to the guest. I hope this is the right
> > usage of spapr-caps?
> > 
> 
> That's perfectly fine and this is why we should set it to ON
> for the default machine type only.

The property can be turned ON only when the hypervisor supports
the hcall. So if it set to ON for default machine type, then
it may fail if the host doesn't have this hcall. Hence I thought
it should be OFF by default and turning ON should be left to the
user.

Regards,
Bharata.

