Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B78CA3E0F59
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 09:36:04 +0200 (CEST)
Received: from localhost ([::1]:34632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBXv9-0004s4-QT
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 03:36:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bharata@linux.ibm.com>)
 id 1mBXs3-0008Aa-BW; Thu, 05 Aug 2021 03:32:54 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:7640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bharata@linux.ibm.com>)
 id 1mBXrz-0005bD-DG; Thu, 05 Aug 2021 03:32:51 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17573pb0044691; Thu, 5 Aug 2021 03:32:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=Q1QGooRZIcVEA8YUuTkvWy+V9qj90P/Z/T/04Fi9PhM=;
 b=TqSFbmwYqw/QYgqROtudYD9iLLT+P8xn204eI8PGpS0A8tQJmLSEZfZeRZWBVE650idD
 9B81hvCTLH+yXcFw9tMsnRC9nWJCwWQyoifAiJbYmpxfLHg5H8DSZZ95TQK0qCMNVU0r
 PafuFRuSJxeOPcozBMATs13EV4kIqPN1nW/COf0gbPQbILnYJ1NglFE3NfsaGrFPuK1z
 4EhXNGBm0llhtZMIAErxZ6l56tSk2TloK4mMbLZ8SpKjxFAA9Fi8L4X3Dt2e6TQBc1wx
 N53UEdJTTTRen6SwOtLYq6b2TwsMUNL6Hp1RBIMr3MwFM4w+W9+wz1nOHVSBN6OSc23q Dw== 
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3a897nbjf2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Aug 2021 03:32:38 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1757SgDM028616;
 Thu, 5 Aug 2021 07:32:36 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06fra.de.ibm.com with ESMTP id 3a4wsj1nys-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Aug 2021 07:32:36 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1757WX1555247182
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 5 Aug 2021 07:32:33 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 09EB752074;
 Thu,  5 Aug 2021 07:32:33 +0000 (GMT)
Received: from bharata.ibmuc.com (unknown [9.102.2.73])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id B4EA252078;
 Thu,  5 Aug 2021 07:32:31 +0000 (GMT)
From: Bharata B Rao <bharata@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v0 0/2] Support for H_REG_SNS hcall
Date: Thu,  5 Aug 2021 13:02:26 +0530
Message-Id: <20210805073228.502292-1-bharata@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: GP8dh8-lKXhfefcjEkJFjLiH7uR7VCkk
X-Proofpoint-GUID: GP8dh8-lKXhfefcjEkJFjLiH7uR7VCkk
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-05_02:2021-08-04,
 2021-08-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 mlxscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 mlxlogscore=699 phishscore=0 suspectscore=0 bulkscore=0
 adultscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108050041
Received-SPF: pass client-ip=148.163.156.1; envelope-from=bharata@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: aneesh.kumar@linux.ibm.com, Bharata B Rao <bharata@linux.ibm.com>,
 qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add support for H_REG_SNS hcall which will be used by the guest
to make use of Expropriation/Subvention Notification option aka
asynchronous page fault support.

The kernel enablement patches are posted here:
https://lore.kernel.org/linuxppc-dev/20210805072439.501481-1-bharata@linux.ibm.com/T/#t

Bharata B Rao (2):
  spapr: Add H_REG_SNS hcall
  ppc,spapr: Handle KVM_EXIT_ESN

 hw/ppc/spapr.c                  |  3 ++
 hw/ppc/spapr_hcall.c            | 56 +++++++++++++++++++++++++++++++++
 include/hw/ppc/spapr.h          |  3 ++
 include/hw/ppc/spapr_irq.h      |  1 +
 linux-headers/asm-powerpc/kvm.h |  6 ++++
 linux-headers/linux/kvm.h       |  2 ++
 target/ppc/kvm.c                | 30 ++++++++++++++++++
 target/ppc/kvm_ppc.h            | 10 ++++++
 8 files changed, 111 insertions(+)

-- 
2.31.1


