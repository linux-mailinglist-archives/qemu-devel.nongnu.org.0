Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BED1D1259D1
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Dec 2019 04:16:29 +0100 (CET)
Received: from localhost ([::1]:35280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihmIe-0004Cp-6p
	for lists+qemu-devel@lfdr.de; Wed, 18 Dec 2019 22:16:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59607)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bharata@linux.ibm.com>) id 1ihmHH-00035I-Gr
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 22:15:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bharata@linux.ibm.com>) id 1ihmHG-0006M5-AS
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 22:15:03 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:62208)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <bharata@linux.ibm.com>)
 id 1ihmHG-0006JQ-0T
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 22:15:02 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBJ36gkV116005
 for <qemu-devel@nongnu.org>; Wed, 18 Dec 2019 22:15:00 -0500
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2x00shgnb2-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Wed, 18 Dec 2019 22:14:59 -0500
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <qemu-devel@nongnu.org> from <bharata@linux.ibm.com>;
 Thu, 19 Dec 2019 03:14:57 -0000
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 19 Dec 2019 03:14:54 -0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xBJ3Er4e38863088
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 19 Dec 2019 03:14:53 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A0A87A4054;
 Thu, 19 Dec 2019 03:14:53 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6C4ECA405B;
 Thu, 19 Dec 2019 03:14:52 +0000 (GMT)
Received: from bharata.ibmuc.com (unknown [9.85.82.30])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 19 Dec 2019 03:14:52 +0000 (GMT)
From: Bharata B Rao <bharata@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 ppc-for-5.0 0/2] ppc/spapr: Support reboot of secure
 pseries guest
Date: Thu, 19 Dec 2019 08:44:43 +0530
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19121903-0016-0000-0000-000002D66052
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19121903-0017-0000-0000-00003338A1D5
Message-Id: <20191219031445.8949-1-bharata@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-18_08:2019-12-17,2019-12-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 impostorscore=0 mlxlogscore=939 adultscore=0 priorityscore=1501 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-1910280000
 definitions=main-1912190025
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
Cc: paulus@ozlabs.org, linuxram@us.ibm.com,
 Bharata B Rao <bharata@linux.ibm.com>, qemu-ppc@nongnu.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patchset adds KVM_PPC_SVM_OFF ioctl which is required to support
reset of secure guest. This includes linux-headers update so that we get
the newly introduced ioctl.

v3: https://lists.gnu.org/archive/html/qemu-devel/2019-12/msg03685.html

Changes in v4:
-------------
- s/error_setg/error_setg_errno (Greg Kurz)

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
 target/ppc/kvm.c                              | 15 ++++
 target/ppc/kvm_ppc.h                          |  6 ++
 10 files changed, 154 insertions(+), 4 deletions(-)

-- 
2.21.0


