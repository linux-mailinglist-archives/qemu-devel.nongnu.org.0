Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D633E1073
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 10:38:33 +0200 (CEST)
Received: from localhost ([::1]:59504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBYtc-00014D-Co
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 04:38:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bharata@linux.ibm.com>)
 id 1mBYsi-0000D5-Hh; Thu, 05 Aug 2021 04:37:36 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:57606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bharata@linux.ibm.com>)
 id 1mBYsg-0002ce-Nx; Thu, 05 Aug 2021 04:37:36 -0400
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1758YF7V030082; Thu, 5 Aug 2021 04:37:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=fQ8/COeoKGoE45HvLzJ8NkCQvRpQDUHXTnq/LlbTkaI=;
 b=BV/2INGbOpEVXKcW1SIf2h9tpB03X35dp87+fM0kLmvSzo/7wD5AI5sUBZPeHdfRqNOJ
 V5JaskU43qKYXUdA3E5gD3wt17GvPxoJaDcBpzi8xnRilSIFYQMM/hE9s8B+eQr1dVZZ
 Wgo+KcttYm1YWEkgpM9Z0bY3QfuSyKwLtlOlwM6+NKUwTo0OP+J1utIfx/1dMQStYBda
 zxfi3f03bk8uXkqp49VJnS/rU5mOUicAn0xIQI1TAr2C/i3Czj6gVgbfRp2HRtZQ0zg+
 4957FHlNgjZxsfLCme4czYlM/QLzx4zs3+oAYamqSm2PMoW+tbltz9SYL9td0NQLqjJz VA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3a84mv2wpd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Aug 2021 04:37:28 -0400
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1758YNL9030560;
 Thu, 5 Aug 2021 04:37:28 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3a84mv2wnk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Aug 2021 04:37:28 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1758aSSr027112;
 Thu, 5 Aug 2021 08:37:26 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03ams.nl.ibm.com with ESMTP id 3a4x592v6w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Aug 2021 08:37:25 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1758bNWg26345768
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 5 Aug 2021 08:37:23 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 39F844204D;
 Thu,  5 Aug 2021 08:37:23 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0993842042;
 Thu,  5 Aug 2021 08:37:22 +0000 (GMT)
Received: from in.ibm.com (unknown [9.102.2.73])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Thu,  5 Aug 2021 08:37:21 +0000 (GMT)
Date: Thu, 5 Aug 2021 14:07:19 +0530
From: Bharata B Rao <bharata@linux.ibm.com>
To: Laurent Vivier <lvivier@redhat.com>
Subject: Re: [RFC PATCH v0 2/2] ppc,spapr: Handle KVM_EXIT_ESN
Message-ID: <YQujP6E5dtfHHFNV@in.ibm.com>
References: <20210805073228.502292-1-bharata@linux.ibm.com>
 <20210805073228.502292-3-bharata@linux.ibm.com>
 <a7703577-9c69-cab7-6919-93c95d474a0f@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a7703577-9c69-cab7-6919-93c95d474a0f@redhat.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: hHlUi0w1gZqIbsGk6xJY1SdOGu1n_1_1
X-Proofpoint-ORIG-GUID: fPiMmBwzrihwbJnDhTTRnu2VxRaBba38
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-05_02:2021-08-04,
 2021-08-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=989
 priorityscore=1501 clxscore=1015 impostorscore=0 malwarescore=0
 adultscore=0 spamscore=0 phishscore=0 suspectscore=0 bulkscore=0
 mlxscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2107140000 definitions=main-2108050050
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
Cc: aneesh.kumar@linux.ibm.com, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Aug 05, 2021 at 09:48:04AM +0200, Laurent Vivier wrote:
> On 05/08/2021 09:32, Bharata B Rao wrote:
> > Handle KVM_EXIT_ESN exit by issuing subvention notification
> > interrupt to the guest. Guests supporting async-pf feature
> > will need this interrupt to wake up tasks that are waiting
> > for the expropriated pages to be available.
> > 
> > Note: Updates to linux-headers/linux/kvm.h are temporary
> > pending headers update.
> > 
> > Signed-off-by: Bharata B Rao <bharata@linux.ibm.com>
> > ---
> >  linux-headers/linux/kvm.h |  1 +
> >  target/ppc/kvm.c          | 16 ++++++++++++++++
> >  2 files changed, 17 insertions(+)
> ...
> > diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
> > index 330985c8a0..6bf3f06b88 100644
> > --- a/target/ppc/kvm.c
> > +++ b/target/ppc/kvm.c
> ...
> > @@ -1657,6 +1658,16 @@ static int kvm_handle_debug(PowerPCCPU *cpu, struct kvm_run *run)
> >      return DEBUG_RETURN_GUEST;
> >  }
> >  
> > +#if defined(TARGET_PPC64)
> > +static void kvmppc_handle_esn(PowerPCCPU *cpu)
> > +{
> > +    SpaprMachineState *spapr = SPAPR_MACHINE(qdev_get_machine());
> > +
> > +    fprintf(stderr, "%s: ESN exit\n", __func__);
> 
> Do you keep this fprintf() on purpose?

Not really, just that it survived the pre-post cleanup :-(

Regards,
Bharata.

