Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D8B17FF0E
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Mar 2020 14:44:28 +0100 (CET)
Received: from localhost ([::1]:33332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jBfBL-0004jp-Rm
	for lists+qemu-devel@lfdr.de; Tue, 10 Mar 2020 09:44:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43134)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <frankja@linux.ibm.com>) id 1jBfA7-00031y-37
 for qemu-devel@nongnu.org; Tue, 10 Mar 2020 09:43:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <frankja@linux.ibm.com>) id 1jBfA5-0000JD-S8
 for qemu-devel@nongnu.org; Tue, 10 Mar 2020 09:43:11 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:24356
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <frankja@linux.ibm.com>)
 id 1jBfA5-0007XA-Le
 for qemu-devel@nongnu.org; Tue, 10 Mar 2020 09:43:09 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02ADgKGp074573
 for <qemu-devel@nongnu.org>; Tue, 10 Mar 2020 09:42:20 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2ym649xm9f-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Tue, 10 Mar 2020 09:42:19 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <qemu-devel@nongnu.org> from <frankja@linux.ibm.com>;
 Tue, 10 Mar 2020 13:42:02 -0000
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 10 Mar 2020 13:41:58 -0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02ADfvD152691032
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 10 Mar 2020 13:41:57 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 843B911C052;
 Tue, 10 Mar 2020 13:41:57 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 51CEB11C04A;
 Tue, 10 Mar 2020 13:41:56 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.145.23.214])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 10 Mar 2020 13:41:56 +0000 (GMT)
From: Janosch Frank <frankja@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 00/15] s390x: Protected Virtualization support
Date: Tue, 10 Mar 2020 09:39:53 -0400
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20031013-0020-0000-0000-000003B25543
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20031013-0021-0000-0000-0000220AA13F
Message-Id: <20200310134008.130038-1-frankja@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-10_07:2020-03-10,
 2020-03-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 priorityscore=1501 mlxscore=0 suspectscore=1 bulkscore=0 spamscore=0
 clxscore=1015 phishscore=0 malwarescore=0 impostorscore=0 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003100091
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 148.163.158.5
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
Cc: borntraeger@de.ibm.com, qemu-s390x@nongnu.org, cohuck@redhat.com,
 david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Most of the QEMU changes for PV are related to the new IPL type with
subcodes 8 - 10 and the execution of the necessary Ultravisor calls to
IPL secure guests. Note that we can only boot into secure mode from
normal mode, i.e. stfle 161 is not active in secure mode.

The other changes related to data gathering for emulation and
disabling addressing checks in secure mode, as well as CPU resets.

v8:
	* Removed the iplb_valid changes as they are picked
	* Checkpatch fixes
	* Review fixes
	* Replaced env/ms->pv with s390_is_pv()
v7:
	* Merged the diag 308 subcode patches and the unpack
	* Moved the SIDA memops into the sync patch
	* Bailout for the none machien and fencing of CONFIG_USER_ONLY
	* Changes due to review

v6:
	* diag308 rc numbers were changed by architecture
	* IPL pv block received one more reserved field by architecture
	* Officially added the bios patch to the series
	* Dropped picked constant rename patch

v5:
	* Moved docs into docs/system
	* Some more enable/disable changes
	* Moved enablement/disablement of pv in separate functions
	* Some review fixes

v4:
	* Sync with KVM changes
	* Review changes

V3:
	* Use dedicated functions to access SIDA
	* Smaller cleanups and segfault fixes
	* Error reporting for Ultravisor calls
	* Inject of RC of diag308 subcode 10 fails

V2:
	* Split out cleanups
	* Internal PV state tracking
	* Review feedback


Christian Borntraeger (1):
  s390x: Add unpack facility feature to GA1

Janosch Frank (14):
  Sync pv
  s390x: protvirt: Support unpack facility
  s390x: protvirt: Add migration blocker
  s390x: protvirt: Inhibit balloon when switching to protected mode
  s390x: protvirt: KVM intercept changes
  s390x: Add SIDA memory ops
  s390x: protvirt: Move STSI data over SIDAD
  s390x: protvirt: SCLP interpretation
  s390x: protvirt: Set guest IPL PSW
  s390x: protvirt: Move diag 308 data over SIDA
  s390x: protvirt: Disable address checks for PV guest IO emulation
  s390x: protvirt: Move IO control structures over SIDA
  s390x: protvirt: Handle SIGP store status correctly
  docs: Add protvirt docs

 docs/system/index.rst               |   1 +
 docs/system/protvirt.rst            |  56 +++++++++++
 hw/s390x/Makefile.objs              |   1 +
 hw/s390x/ipl.c                      |  56 ++++++++++-
 hw/s390x/ipl.h                      |  79 ++++++++++++++++
 hw/s390x/pv.c                       | 104 +++++++++++++++++++++
 hw/s390x/pv.h                       |  33 +++++++
 hw/s390x/s390-virtio-ccw.c          | 140 +++++++++++++++++++++++++++-
 hw/s390x/sclp.c                     |  30 ++++++
 include/hw/s390x/s390-virtio-ccw.h  |   1 +
 include/hw/s390x/sclp.h             |   2 +
 linux-headers/linux/kvm.h           |  45 ++++++++-
 target/s390x/cpu.c                  |  45 +++++++--
 target/s390x/cpu.h                  |   8 +-
 target/s390x/cpu_features_def.inc.h |   1 +
 target/s390x/diag.c                 |  57 +++++++++--
 target/s390x/gen-features.c         |   1 +
 target/s390x/helper.c               |   5 +
 target/s390x/ioinst.c               | 119 ++++++++++++++++-------
 target/s390x/kvm.c                  |  68 ++++++++++++--
 target/s390x/kvm_s390x.h            |   2 +
 target/s390x/mmu_helper.c           |  14 +++
 22 files changed, 804 insertions(+), 64 deletions(-)
 create mode 100644 docs/system/protvirt.rst
 create mode 100644 hw/s390x/pv.c
 create mode 100644 hw/s390x/pv.h

-- 
2.20.1


