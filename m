Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9334F13E056
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jan 2020 17:42:27 +0100 (CET)
Received: from localhost ([::1]:44826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1is8Dy-0001Ew-0y
	for lists+qemu-devel@lfdr.de; Thu, 16 Jan 2020 11:42:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42851)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ganeshgr@linux.ibm.com>) id 1is8CE-0008HO-GK
 for qemu-devel@nongnu.org; Thu, 16 Jan 2020 11:40:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ganeshgr@linux.ibm.com>) id 1is8CA-0005EH-FN
 for qemu-devel@nongnu.org; Thu, 16 Jan 2020 11:40:38 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:41134)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ganeshgr@linux.ibm.com>)
 id 1is8CA-0005Df-6p
 for qemu-devel@nongnu.org; Thu, 16 Jan 2020 11:40:34 -0500
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00GGcXYM055451
 for <qemu-devel@nongnu.org>; Thu, 16 Jan 2020 11:40:33 -0500
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2xhff0sedg-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Thu, 16 Jan 2020 11:40:32 -0500
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <qemu-devel@nongnu.org> from <ganeshgr@linux.ibm.com>;
 Thu, 16 Jan 2020 16:40:30 -0000
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 16 Jan 2020 16:40:28 -0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 00GGeRoV36634902
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Jan 2020 16:40:27 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 54023A405D;
 Thu, 16 Jan 2020 16:40:27 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2F34AA4065;
 Thu, 16 Jan 2020 16:40:25 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.199.49.154])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 16 Jan 2020 16:40:24 +0000 (GMT)
From: Ganesh Goudar <ganeshgr@linux.ibm.com>
To: aik@ozlabs.ru, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 david@gibson.dropbear.id.au
Subject: [PATCH v19 0/7]target-ppc/spapr: Add FWNMI support in QEMU for
 PowerKM guests 
Date: Thu, 16 Jan 2020 22:09:45 +0530
X-Mailer: git-send-email 2.17.2
X-TM-AS-GCONF: 00
x-cbid: 20011616-0016-0000-0000-000002DDEED7
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20011616-0017-0000-0000-0000334087A6
Message-Id: <20200116163952.11090-1-ganeshgr@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-16_05:2020-01-16,
 2020-01-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 mlxlogscore=999 clxscore=1015
 suspectscore=0 malwarescore=0 mlxscore=0 priorityscore=1501 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-1910280000
 definitions=main-2001160136
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 148.163.156.1
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
Cc: paulus@ozlabs.org, Ganesh Goudar <ganeshgr@linux.ibm.com>, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch set adds support for FWNMI in PowerKVM guests.

System errors such as SLB multihit and memory errors
that cannot be corrected by hardware is passed on to
the kernel for handling by raising machine check
exception (an NMI). Upon such machine check exceptions,
if the address in error belongs to guest then KVM
invokes guests' 0x200 interrupt vector if the guest
is not FWNMI capable. For FWNMI capable guest
KVM passes the control to QEMU by exiting the guest.

This patch series adds functionality to QEMU to pass
on such machine check exceptions to the FWNMI capable
guest kernel by building an error log and invoking
the guest registered machine check handling routine.

The KVM changes are now part of the upstream kernel
(commit e20bbd3d). This series contain QEMU changes.

Change Log v19:
  - Create error object for migration blocker in machine_init().
  - Remove the check to see fwnmi calls are already registered,
    which is no longer needed.
  - Register fwnmi RTAS calls in core_rtas_register_types() where
    other RTAS calls are registered.
  - Bail out from interlock call if the cap is not set.
  - Reorder and add missing S-O-Bs.

Change Log v18:
  - Dynamically create the Error object before adding it as blocker
  - In apply hook check if the fwnmi calls are already registered and
    if kvm supports fwnmi before registering the fwnmi calls.
  - In rtas_ibm_nmi_register() test the feature flag before attempting
    to get the RTAS address
  - Introduce a bool member "fwnmi_calls_registered" to check if the
    fwnmi calls are registered and use the same in needed hook to save
    the state during migration. 

Change Log v17:
  - Add fwnmi cap to migration state
  - Reprhase the commit message in patch 2/7

Change Log v16:
  - Fixed coding style problems

Change Log v15:
  - Removed cap_ppc_fwnmi
  - Moved fwnmi registeration to .apply hook
  - Assume SLOF has allocated enough room for rtas error log
  - Using ARRAY_SIZE to end the loop
  - Do not set FWNMI cap in post_load, now its done in .apply hook

Change Log v14:
  - Feature activation moved to a separate patch
  - Fixed issues with migration blocker

Change Log v13:
  - Minor fixes (mostly nits)
  - Moved FWNMI guest registration check from patch 4 to 3.

Change Log v12:
  - Rebased to latest ppc-for-4.2 (SHA b1e8156743)

Change Log v11:
  - Moved FWNMI SPAPR cap defaults to 4.2 class option
  - Fixed issues with handling fwnmi KVM capability

---

Aravinda Prasad (7):
  Wrapper function to wait on condition for the main loop mutex
  ppc: spapr: Introduce FWNMI capability
  target/ppc: Handle NMI guest exit
  target/ppc: Build rtas error log upon an MCE
  ppc: spapr: Handle "ibm,nmi-register" and "ibm,nmi-interlock" RTAS
    calls
  migration: Include migration support for machine check handling
  ppc: spapr: Activate the FWNMI functionality

 cpus.c                   |   5 +
 hw/ppc/spapr.c           |  58 +++++++++
 hw/ppc/spapr_caps.c      |  25 ++++
 hw/ppc/spapr_events.c    | 269 +++++++++++++++++++++++++++++++++++++++
 hw/ppc/spapr_rtas.c      |  89 +++++++++++++
 include/hw/ppc/spapr.h   |  26 +++-
 include/qemu/main-loop.h |   8 ++
 target/ppc/kvm.c         |  24 ++++
 target/ppc/kvm_ppc.h     |   8 ++
 target/ppc/trace-events  |   1 +
 10 files changed, 511 insertions(+), 2 deletions(-)

-- 
2.17.2


