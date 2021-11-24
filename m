Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A6445CF8C
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 23:03:42 +0100 (CET)
Received: from localhost ([::1]:36154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mq0Mf-0003Ti-0G
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 17:03:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1mq0Jv-0002Aw-Q6; Wed, 24 Nov 2021 17:00:53 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:26548
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1mq0Jt-0006Wn-Ej; Wed, 24 Nov 2021 17:00:51 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AOLkVkW005345; 
 Wed, 24 Nov 2021 22:00:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : content-type :
 mime-version; s=pp1; bh=+70NVwMwCWBiYLUgyen4rlA+w9HYUoQF5Lf2CEOD5nw=;
 b=WKro+6yvqGAIhPxzJnI3Qjn/+AUp2Deqao2XCyRxgJuC4yUj0Xs2BvC+JPUdv3BIFkq9
 5UTSSb0JI0U9kg8ZQj2878wOsvpYcFsoF9jl5x/VO701XmugUF4ifuuquudy1xFkdl1W
 QkHYLT0HlieTFRopMXDwoj/DxQU6xRpcFpkYw1XgdvKrzMByAPa8iEzro77bA8LfIPPD
 6LCNPgT0ZVUdhU12qACrwcK0vnjCqNS8OJv95E51daSIe2zNzY0b1LS1rtNasrMxDDpE
 BCnYPiBOBteuzIwk90R2FaanuiQhIz9teBkpmPDEHWQaqYCZqUYcVpPSIpEgeXx7BH8z 3A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3chwkw0676-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Nov 2021 22:00:17 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1AOM0H5S023953;
 Wed, 24 Nov 2021 22:00:17 GMT
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3chwkw066u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Nov 2021 22:00:17 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1AOLvDoP004365;
 Wed, 24 Nov 2021 22:00:16 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma03wdc.us.ibm.com with ESMTP id 3cernbjd6r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Nov 2021 22:00:16 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1AOM0FGE50725210
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 24 Nov 2021 22:00:15 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 67129BE059;
 Wed, 24 Nov 2021 22:00:15 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D0CE9BE056;
 Wed, 24 Nov 2021 22:00:14 +0000 (GMT)
Received: from localhost (unknown [9.211.75.162])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Wed, 24 Nov 2021 22:00:14 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: Re: [RFC PATCH 0/2] QEMU/openbios: PPC Software TLB support in the
 G4 family
In-Reply-To: <20211119134431.406753-1-farosas@linux.ibm.com>
References: <20211119134431.406753-1-farosas@linux.ibm.com>
Date: Wed, 24 Nov 2021 19:00:12 -0300
Message-ID: <87pmqpqknn.fsf@linux.ibm.com>
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 5icYFCGtIgvMvPfHCZcmB6lHK0022HdN
X-Proofpoint-ORIG-GUID: je-0bdlEmbb9Hp13NliZ4vI3qGf_3SB2
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-24_06,2021-11-24_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015
 spamscore=0 mlxscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 bulkscore=0 mlxlogscore=999 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111240106
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
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
Cc: danielhb413@gmail.com, mark.cave-ayland@ilande.co.uk, qemu-ppc@nongnu.org,
 clg@kaod.org, openbios@openbios.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fabiano Rosas <farosas@linux.ibm.com> writes:

> Hi all,
>
> We have this bug in QEMU which indicates that we haven't been able to
> run openbios on a 7450 cpu for quite a long time:
>
> https://gitlab.com/qemu-project/qemu/-/issues/86
>
> OK:
>   $ ./qemu-system-ppc -serial mon:stdio -nographic -cpu 7410
>
>   >> =============================================================
>   >> OpenBIOS 1.1 [Nov 1 2021 20:36]
>   ...
>
> NOK:
>   $ ./qemu-system-ppc -serial mon:stdio -nographic -cpu 7450 -d int
>   Raise exception at fff08cc4 => 0000004e (00)
>   QEMU: Terminated
>
> The actual issue is straightforward. There is a non-architected
> feature that QEMU has enabled by default that openbios doesn't know
> about. From the user manual:
>
> "The MPC7540 has a set of implementation-specific registers,
> exceptions, and instructions that facilitate very efficient software
> searching of the page tables in memory for when software table
> searching is enabled (HID0[STEN] = 1). This section describes those
> resources and provides three example code sequences that can be used
> in a MPC7540 system for an efficient search of the translation tables
> in software. These three code sequences can be used as handlers for
> the three exceptions requiring access to the PTEs in the page tables
> in memory in this case-instruction TLB miss, data TLB miss on load,
> and data TLB miss on store exceptions."
>
> The current state:
>
> 1) QEMU does not check HID0[STEN] and makes the feature always enabled
> by setting these cpus with the POWERPC_MMU_SOFT_74xx MMU model,
> instead of the generic POWERPC_MMU_32B.
>
> 2) openbios does not recognize the PVRs for those cpus and also does
> not have any handlers for the software TLB exceptions (vectors 0x1000,
> 0x1100, 0x1200).
>
> Some assumptions (correct me if I'm wrong please):
>
> - openbios is the only firmware we use for the following cpus: 7441,
> 7445, 7450, 7451, 7455, 7457, 7447, 7447a, 7448.
> - without openbios, we cannot have a guest running on these cpus.
>
> So to bring 7450 back to life we would need to either:
>
> a) find another firmware/guest OS code that supports the feature;
>
> b) implement the switching of the feature in QEMU and have the guest
> code enable it only when supported. That would take some fiddling with
> the MMU code to: merge POWERPC_MMU_SOFT_74xx into POWERPC_MMU_32B,
> check the HID0[STEN] bit, figure out how to switch from HW TLB miss to
> SW TLB miss on demand, block access to the TLBMISS register (and
> others) when the feature is off, and so on;
>
> c) leave the feature enabled in QEMU and implement the software TLB
> miss handlers in openbios. The UM provides sample code, so this is
> easy;
>
> d) remove support for software TLB search for the 7450 family and
> switch the cpus to the POWERPC_MMU_32B model. This is by far the
> easiest solution, but could cause problems for any (which?) guest OS
> code that actually uses the feature. All of the existing code for the
> POWERPC_MMU_SOFT_74xx MMU model would probably be removed since it
> would be dead code then;
>
> Option (c) seemed to me like a good compromise so this is a patch
> series for openbios doing that and also adding the necessary PVRs so
> we can get a working guest with these cpus without too much effort.
>
> I have also a patch for QEMU adding basic sanity check tests for the
> 7400 and 7450 families. I'll send that separately to the QEMU ml.
>
> Fabiano Rosas (2):
>   ppc: Add support for MPC7450 software TLB miss interrupts
>   ppc: Add PVRs for the MPC7450 family
>
>  arch/ppc/qemu/init.c  |  52 ++++++++++
>  arch/ppc/qemu/start.S | 236 +++++++++++++++++++++++++++++++++++++++++-
>  2 files changed, 285 insertions(+), 3 deletions(-)

(Adding Mark because his email got somehow dropped from the original
message)

So with these patches in OpenBIOS we could get a bit further and call
into the Linux kernel using the same image as the one used for the
7400. However there seems to be no support for the 7450 software TLB in
the kernel. There are only handlers for the 4xx, 8xx and 603 which are
different code altogether. There's no mention of the TLBMISS and
PTEHI/LO registers in the code as well.

Do we know of any guest OS that implements the 7450 software TLB at
vectors 0x1000, 0x1100 and 0x1200? Otherwise replacing the
POWERPC_MMU_SOFT_74xx model with POWERPC_MMU_32B might be the only way
of getting an OS to run in the 7450 family.

