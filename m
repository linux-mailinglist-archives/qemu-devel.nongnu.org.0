Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C28457028
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 14:58:33 +0100 (CET)
Received: from localhost ([::1]:38526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo4PL-00067K-5N
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 08:58:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1mo4CL-0007AE-Vz; Fri, 19 Nov 2021 08:45:02 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:9722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1mo4CJ-00073v-Tk; Fri, 19 Nov 2021 08:45:01 -0500
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AJDgTxt001063; 
 Fri, 19 Nov 2021 13:44:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=lUkmNSAe3FILBAPjs19BmeOr1BlZlYjl8V6LipICvsE=;
 b=dYpqsqSExPq5XNVEE/vry1LcjF3ekOLP0Vg9jvQvQplaIhQvG52LOopWSTjkU/dbs++F
 S1EtILWE/CWR8CjMuFmp0zhp6Jw2ikCvvlmXCtfTxIxnapgiIZ72PwHd4ikrITmOWkin
 FYdBzsCx8SAwL7RHs7l0UGMQsUlkn2bSpObT5NYNDgDCMCGgW5OvCUjadxGYYrB1KFGX
 RletOB8NrYDzVCDW5rO4jkP74OBQiAl2IHYIBra6rn5EusFZRfprqbv7nEaePetWMEsj
 blSRbZ7Li6dpY79RYGmhybIujV1/b1MvlLkmwyOUeNvl60SSmOVHDNPOZ/w0bY8ucyh5 OQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ced2081c1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Nov 2021 13:44:40 +0000
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1AJDhe1X010633;
 Fri, 19 Nov 2021 13:44:39 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ced2081bs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Nov 2021 13:44:39 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1AJDcsef031819;
 Fri, 19 Nov 2021 13:44:38 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma03dal.us.ibm.com with ESMTP id 3ca50e2chu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Nov 2021 13:44:38 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1AJDibMK983774
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 19 Nov 2021 13:44:37 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BC9CCC6061;
 Fri, 19 Nov 2021 13:44:37 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DF6E4C606D;
 Fri, 19 Nov 2021 13:44:35 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.163.29.60])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 19 Nov 2021 13:44:35 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 0/2] QEMU/openbios: PPC Software TLB support in the G4
 family
Date: Fri, 19 Nov 2021 10:44:29 -0300
Message-Id: <20211119134431.406753-1-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.29.2
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: sbpi9POUFfsLjXdghnxKhU1lH9KAXABC
X-Proofpoint-ORIG-GUID: B107M_t1w_1mdSsPOqNYiDpX5R1t5ICi
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-19_09,2021-11-17_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011
 lowpriorityscore=0 adultscore=0 mlxlogscore=994 suspectscore=0
 malwarescore=0 mlxscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 bulkscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111190075
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Hi all,

We have this bug in QEMU which indicates that we haven't been able to
run openbios on a 7450 cpu for quite a long time:

https://gitlab.com/qemu-project/qemu/-/issues/86

OK:
  $ ./qemu-system-ppc -serial mon:stdio -nographic -cpu 7410

  >> =============================================================
  >> OpenBIOS 1.1 [Nov 1 2021 20:36]
  ...

NOK:
  $ ./qemu-system-ppc -serial mon:stdio -nographic -cpu 7450 -d int
  Raise exception at fff08cc4 => 0000004e (00)
  QEMU: Terminated

The actual issue is straightforward. There is a non-architected
feature that QEMU has enabled by default that openbios doesn't know
about. From the user manual:

"The MPC7540 has a set of implementation-specific registers,
exceptions, and instructions that facilitate very efficient software
searching of the page tables in memory for when software table
searching is enabled (HID0[STEN] = 1). This section describes those
resources and provides three example code sequences that can be used
in a MPC7540 system for an efficient search of the translation tables
in software. These three code sequences can be used as handlers for
the three exceptions requiring access to the PTEs in the page tables
in memory in this case-instruction TLB miss, data TLB miss on load,
and data TLB miss on store exceptions."

The current state:

1) QEMU does not check HID0[STEN] and makes the feature always enabled
by setting these cpus with the POWERPC_MMU_SOFT_74xx MMU model,
instead of the generic POWERPC_MMU_32B.

2) openbios does not recognize the PVRs for those cpus and also does
not have any handlers for the software TLB exceptions (vectors 0x1000,
0x1100, 0x1200).

Some assumptions (correct me if I'm wrong please):

- openbios is the only firmware we use for the following cpus: 7441,
7445, 7450, 7451, 7455, 7457, 7447, 7447a, 7448.
- without openbios, we cannot have a guest running on these cpus.

So to bring 7450 back to life we would need to either:

a) find another firmware/guest OS code that supports the feature;

b) implement the switching of the feature in QEMU and have the guest
code enable it only when supported. That would take some fiddling with
the MMU code to: merge POWERPC_MMU_SOFT_74xx into POWERPC_MMU_32B,
check the HID0[STEN] bit, figure out how to switch from HW TLB miss to
SW TLB miss on demand, block access to the TLBMISS register (and
others) when the feature is off, and so on;

c) leave the feature enabled in QEMU and implement the software TLB
miss handlers in openbios. The UM provides sample code, so this is
easy;

d) remove support for software TLB search for the 7450 family and
switch the cpus to the POWERPC_MMU_32B model. This is by far the
easiest solution, but could cause problems for any (which?) guest OS
code that actually uses the feature. All of the existing code for the
POWERPC_MMU_SOFT_74xx MMU model would probably be removed since it
would be dead code then;

Option (c) seemed to me like a good compromise so this is a patch
series for openbios doing that and also adding the necessary PVRs so
we can get a working guest with these cpus without too much effort.

I have also a patch for QEMU adding basic sanity check tests for the
7400 and 7450 families. I'll send that separately to the QEMU ml.

Fabiano Rosas (2):
  ppc: Add support for MPC7450 software TLB miss interrupts
  ppc: Add PVRs for the MPC7450 family

 arch/ppc/qemu/init.c  |  52 ++++++++++
 arch/ppc/qemu/start.S | 236 +++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 285 insertions(+), 3 deletions(-)

-- 
2.29.2


