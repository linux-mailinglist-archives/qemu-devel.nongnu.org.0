Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07F4D11C59C
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Dec 2019 06:52:54 +0100 (CET)
Received: from localhost ([::1]:54848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ifHPA-00015P-TJ
	for lists+qemu-devel@lfdr.de; Thu, 12 Dec 2019 00:52:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34059)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bharata@linux.ibm.com>) id 1ifHNZ-0008HX-At
 for qemu-devel@nongnu.org; Thu, 12 Dec 2019 00:51:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bharata@linux.ibm.com>) id 1ifHNY-0005q7-5l
 for qemu-devel@nongnu.org; Thu, 12 Dec 2019 00:51:13 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:32250
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <bharata@linux.ibm.com>)
 id 1ifHNX-0005p5-WE
 for qemu-devel@nongnu.org; Thu, 12 Dec 2019 00:51:12 -0500
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBC5gqWC031883
 for <qemu-devel@nongnu.org>; Thu, 12 Dec 2019 00:51:11 -0500
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2wu4t6t0ve-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Thu, 12 Dec 2019 00:51:11 -0500
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <qemu-devel@nongnu.org> from <bharata@linux.ibm.com>;
 Thu, 12 Dec 2019 05:51:09 -0000
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 12 Dec 2019 05:51:06 -0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id xBC5p6tt27525604
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 12 Dec 2019 05:51:06 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F1FFA4C04E;
 Thu, 12 Dec 2019 05:51:05 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B77864C062;
 Thu, 12 Dec 2019 05:51:04 +0000 (GMT)
Received: from bharata.in.ibm.com (unknown [9.124.35.198])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 12 Dec 2019 05:51:04 +0000 (GMT)
From: Bharata B Rao <bharata@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 ppc-for-5.0 0/2] ppc/spapr: Support reboot of secure
 pseries guest
Date: Thu, 12 Dec 2019 11:20:57 +0530
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19121205-0008-0000-0000-00000340032F
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19121205-0009-0000-0000-00004A600339
Message-Id: <20191212055059.9399-1-bharata@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-12_01:2019-12-12,2019-12-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 impostorscore=0 spamscore=0 clxscore=1015 suspectscore=0
 mlxscore=0 mlxlogscore=886 malwarescore=0 adultscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1912120036
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
Cc: paulus@ozlabs.org, linuxram@us.ibm.com,
 Bharata B Rao <bharata@linux.ibm.com>, qemu-ppc@nongnu.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patchset adds KVM_PPC_SVM_OFF ioctl which is required to support
reset of secure guest. This includes linux-headers update so that we get
the newly introduced ioctl.

v1: https://lists.gnu.org/archive/html/qemu-devel/2019-12/msg01489.html 

Bharata B Rao (2):
  linux-headers: Update
  ppc/spapr: Support reboot of secure pseries guest

 hw/ppc/spapr.c                                | 15 ++++
 include/standard-headers/asm-x86/bootparam.h  |  7 +-
 .../infiniband/hw/vmw_pvrdma/pvrdma_dev_api.h | 15 +++-
 include/standard-headers/drm/drm_fourcc.h     | 28 ++++++-
 .../linux/input-event-codes.h                 | 77 +++++++++++++++++++
 include/standard-headers/linux/pci_regs.h     |  3 +
 .../standard-headers/rdma/vmw_pvrdma-abi.h    |  5 ++
 linux-headers/linux/kvm.h                     |  1 +
 target/ppc/kvm.c                              |  7 ++
 target/ppc/kvm_ppc.h                          |  6 ++
 10 files changed, 160 insertions(+), 4 deletions(-)

-- 
2.21.0


