Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 103DE116748
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Dec 2019 08:03:08 +0100 (CET)
Received: from localhost ([::1]:36672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ieD4U-00060G-JV
	for lists+qemu-devel@lfdr.de; Mon, 09 Dec 2019 02:03:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40152)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bharata@linux.ibm.com>) id 1ieD22-0004Bt-V1
 for qemu-devel@nongnu.org; Mon, 09 Dec 2019 02:00:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bharata@linux.ibm.com>) id 1ieD1y-0008Mr-Tz
 for qemu-devel@nongnu.org; Mon, 09 Dec 2019 02:00:33 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:29672
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <bharata@linux.ibm.com>)
 id 1ieD1y-0008MN-Nl
 for qemu-devel@nongnu.org; Mon, 09 Dec 2019 02:00:30 -0500
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xB96vKSl137022
 for <qemu-devel@nongnu.org>; Mon, 9 Dec 2019 02:00:28 -0500
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2wrt9en4tx-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Mon, 09 Dec 2019 02:00:28 -0500
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <qemu-devel@nongnu.org> from <bharata@linux.ibm.com>;
 Mon, 9 Dec 2019 07:00:27 -0000
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 9 Dec 2019 07:00:23 -0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xB970MrE13893690
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 9 Dec 2019 07:00:23 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D121B52059;
 Mon,  9 Dec 2019 07:00:21 +0000 (GMT)
Received: from bharata.in.ibm.com (unknown [9.109.247.23])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 5D26552077;
 Mon,  9 Dec 2019 07:00:18 +0000 (GMT)
From: Bharata B Rao <bharata@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 ppc-for-5.0 0/2] ppc/spapr: Support reboot of secure
 pseries guest
Date: Mon,  9 Dec 2019 12:30:10 +0530
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19120907-0020-0000-0000-00000395B8DC
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19120907-0021-0000-0000-000021ECF1E2
Message-Id: <20191209070012.14766-1-bharata@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-09_01:2019-12-09,2019-12-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1011 malwarescore=0 mlxlogscore=891
 priorityscore=1501 adultscore=0 spamscore=0 bulkscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1912090059
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
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
Cc: linuxram@us.ibm.com, Bharata B Rao <bharata@linux.ibm.com>,
 qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patchset adds KVM_PPC_SVM_OFF ioctl which is required to support
reset of secure guest. This includes linux-headers update so that we get
the newly introduced ioctl.

v0: https://lists.gnu.org/archive/html/qemu-devel/2019-07/msg02408.html

Bharata B Rao (2):
  linux-headers: Update
  ppc/spapr: Support reboot of secure pseries guest

 hw/ppc/spapr.c                                |  1 +
 include/standard-headers/asm-x86/bootparam.h  |  7 +-
 .../infiniband/hw/vmw_pvrdma/pvrdma_dev_api.h | 15 +++-
 include/standard-headers/drm/drm_fourcc.h     | 28 ++++++-
 .../linux/input-event-codes.h                 | 77 +++++++++++++++++++
 include/standard-headers/linux/pci_regs.h     |  3 +
 .../standard-headers/rdma/vmw_pvrdma-abi.h    |  5 ++
 linux-headers/linux/kvm.h                     |  1 +
 target/ppc/kvm.c                              |  7 ++
 target/ppc/kvm_ppc.h                          |  6 ++
 10 files changed, 146 insertions(+), 4 deletions(-)

-- 
2.21.0


