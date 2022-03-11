Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0E14D6412
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Mar 2022 15:47:30 +0100 (CET)
Received: from localhost ([::1]:59324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSgYD-0002Lm-7v
	for lists+qemu-devel@lfdr.de; Fri, 11 Mar 2022 09:47:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nSgWt-0001Sc-6y; Fri, 11 Mar 2022 09:46:07 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:37744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nSgWo-0005SC-Ez; Fri, 11 Mar 2022 09:46:06 -0500
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22BE9vVa029623; 
 Fri, 11 Mar 2022 14:45:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : content-type :
 mime-version; s=pp1; bh=LdjDx3yONPcNm6p95PySs2FqcxQ6PZJJgmsrZX3Nk+E=;
 b=gT2CGqZSzT6TOQuro2qzkWjY6gIu3Wx+YtusCL3cmu1rbJFm5Q6i95CG2ik25OSK9ijs
 humpRAApifh9MKsO1Ri2qQyfW1HespuPgXfZa3hisPZXc0zmimntRn5BipvCpHn2FB8Q
 C1vHTLspa0+wSG1g9+E0cJdAldf+HeUT244+XhsPPJ/eD422s4OCcY6BhX74KkOYcOek
 adlKutOwSsw3caoc7+CsAMGaU+Wlr0dCWFhYwBL1OoOafqittOts1MvFyRZbX723x1dG
 4Rr0pdHBO+patcRkCqPM0Mo9JO1sysNxgb3eILEPCEADlgvQoe2i/2iZ4m6st4wilb1s jA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3eqnccwwdu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Mar 2022 14:45:49 +0000
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22BEiHif007729;
 Fri, 11 Mar 2022 14:45:48 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3eqnccwwdm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Mar 2022 14:45:48 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22BEjNXw003562;
 Fri, 11 Mar 2022 14:45:47 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma04dal.us.ibm.com with ESMTP id 3epb9d1r7s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Mar 2022 14:45:47 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22BEjk7724772900
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 11 Mar 2022 14:45:46 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 84094BE058;
 Fri, 11 Mar 2022 14:45:46 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E0CE9BE059;
 Fri, 11 Mar 2022 14:45:45 +0000 (GMT)
Received: from localhost (unknown [9.163.19.144])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Fri, 11 Mar 2022 14:45:45 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
Subject: Re: [RFC PATCH 1/2] spapr: Report correct GTSE support via ov5
In-Reply-To: <d9cb6b05-9c06-8081-ee7f-a44f3a85848b@gmail.com>
References: <20220309012400.2527157-1-farosas@linux.ibm.com>
 <d9cb6b05-9c06-8081-ee7f-a44f3a85848b@gmail.com>
Date: Fri, 11 Mar 2022 11:45:44 -0300
Message-ID: <87o82c35uv.fsf@linux.ibm.com>
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: peyFMYTxlrjlno_ATHEQGMhrBMHqcuYR
X-Proofpoint-GUID: 1_8_Z0VxUzyTaEVdHQDm9efqwEzWj72k
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-11_06,2022-03-11_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 lowpriorityscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 spamscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203110071
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
Cc: aneesh.kumar@linux.ibm.com, qemu-ppc@nongnu.org, clg@kaod.org,
 npiggin@gmail.com, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Daniel Henrique Barboza <danielhb413@gmail.com> writes:

> On 3/8/22 22:23, Fabiano Rosas wrote:
>> QEMU reports MMU support to the guest via the ibm,architecture-vec-5
>> property of the /chosen node. Byte number 26 specifies Radix Table
>> Expansions, currently only GTSE (Guest Translation Shootdown
>> Enable). This feature determines whether the tlbie instruction (and
>> others) are HV privileged.
>> 
>> Up until now, we always reported GTSE=1 to guests. Even after the
>> support for GTSE=0 was added. As part of that support, a kernel
>> command line radix_hcall_invalidate=on was introduced that overrides
>> the GTSE value received via CAS. So a guest can run with GTSE=0 and
>> use the H_RPT_INVALIDATE hcall instead of tlbie.
>> 
>> In this scenario, having GTSE always set to 1 by QEMU leads to a crash
>> when running nested KVM guests because KVM does not allow a nested
>> hypervisor to set GTSE support for its nested guests. So a nested
>> guest always uses the same value for LPCR_GTSE as its HV. Since the
>> nested HV disabled GTSE, but the L2 QEMU always reports GTSE=1, we run
>> into a crash when:
>> 
>> L1 LPCR_GTSE=0
>> L2 LPCR_GTSE=0
>> L2 CAS GTSE=1
>> 
>> The nested guest will run 'tlbie' and crash because the HW looks at
>> LPCR_GTSE, which is clear.
>> 
>> Having GTSE disabled in the L1 and enabled in the L2 is not an option
>> because the whole purpose of GTSE is to disallow access to tlbie and
>> we cannot allow L1 to spawn L2s that can access features that L1
>> itself cannot.
>> 
>> We also cannot have the guest check the LPCR bit, because LPCR is
>> HV-privileged.
>> 
>> So this patch goes through the most intuitive route which is to have
>> QEMU ask KVM about GTSE support and advertise the correct value to the
>> guest. A new KVM_CAP_PPC_GTSE capability is being added.
>> 
>> TCG continues to always enable GTSE.
>> 
>> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
>> ---
>
>
> I'm not sure if I fully understood the situation, so let me recap. Once upon a time,
> QEMU advertised GTSE=1 and the host would never advertise other value, and everyone
> was happy.
>
> The host started to support GTSE=0, but QEMU kept advertising GTSE=1 regardless, and no
> KVM GTSE cap was added to reflect the host support. I'll then assume that:
>
>
> - all guests would break if running in a GTSE=0 host prior to rpt_invalidate support (which
> is necessary to allow the guest to run in GTSE=0)
>
> - apparently no one ever tried to run a KVM guest in a GTSE=0 host, so no bugs were opened

There's a slight misconception in the above statements which is the
separation of QEMU vs. the host. GTSE is advertised via CAS, so the
guest on one side and the HV on the other. QEMU is not merely
advertising what the host GTSE value is, QEMU *is* the host.

Now, of course we could have done this in a way that QEMU asked the
kernel what GTSE value to use, but since we always thought of GTSE as
required for Radix, that was would have been useless. No HV ever
reported GTSE=0 via CAS, either PowerVM or QEMU/KVM, so having the value
hardcoded in QEMU and in the kernel was never an issue.

> After commit 82123b756a1a2f1 (target/ppc: Support for H_RPT_INVALIDATE hcall) we added
> cap-rpt-invalidate. I didn't follow the discussions of this cap but it seems like, as with
> almost every other cap we have, there would be a migration problem for a guest that was in
> a rpt_invalidate aware host to migrate to another where this wouldn't be true, and the cap
> solves that.

Yes, cap-rpt-invalidate works just as we would expect. When I mentioned
to you in private about migration I meant the kernel-side change:

https://git.kernel.org/torvalds/c/bf6b7661f41615

What that change does is add a kernel cmdline option to allow the kernel
to disable GTSE even when running along with an HV that allows GTSE.

> What I'm not following is why, even after having cap-rpt-invalidate, we are still "lying"
> about the GTSE=1 regardless of what the host supports. We could've added the GTSE KVM cap
> at the same time rpt_invalidate was introduced, and guests that want to ignore this setting
> can use the cap to bypass it.

We're still reporting GTSE=1 because that is a design decision from
Linux/KVM. The work to support GTSE=0 was just adding the support, not
deciding whether we should disable GTSE. So QEMU/kernel kept hardcoding
the value without issue.

> In the end this patch is a needed fix IMHO. My confusion is why we're doing this just now.

The bug only surfaces when we run an L1 guest that decided to disable
GTSE via kernel cmdline and a nested guest on top of it. The QEMU inside
the L1 continues to force GTSE=1 as always. That is why the capability
now seem so compelling when previously it might have not.

> The patch itself LGTM.

Unfortunately, this patch as it is cannot work. We always ran with
GTSE=1 so any kernel that does not know about CAP_GTSE will report
GTSE=0 and break any guest that is older than the initial H_RPT
enablement. And the trick of checking for cap-rpt-invalidate first does
not always work because there's a window between when that cap was added
and now.

So what I am going to do is to change the kernel side to always report
values different than 0 so that QEMU can use the 0 value to
unequivocally tell older kernels apart from ones that disable the
feature. That way we will continue to send GTSE=1 via CAS when KVM is
too old.

