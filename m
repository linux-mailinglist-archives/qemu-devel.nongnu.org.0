Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B67FC46CBCD
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Dec 2021 04:55:15 +0100 (CET)
Received: from localhost ([::1]:33922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muo30-0006ny-8E
	for lists+qemu-devel@lfdr.de; Tue, 07 Dec 2021 22:55:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lagarcia@linux.ibm.com>)
 id 1muo0y-0005yP-En; Tue, 07 Dec 2021 22:53:08 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:60312)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lagarcia@linux.ibm.com>)
 id 1muo0w-0004pe-L6; Tue, 07 Dec 2021 22:53:08 -0500
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B81mUZf023113; 
 Wed, 8 Dec 2021 03:52:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=pp1; bh=qarhbAo/fUPwb9BRb0qvbrvXrPC2IU4QdTyDi7a4W9M=;
 b=j4FOegQkvizXAeeVLYwLI16YTmEbz/HTuvkWHaoj4HfQaQ+x29bqmkl0D3P4b1ps6bbS
 ARIW488skIGbThRI3iFaep9ciAmrIQgV3uMz16O27/OgcqLfHM3Vim+3oZvKmoHi+xYy
 EneK0NwuTj2tPRNAdoAOBFg6VbrrS6yAu+Eh2ztw2WNwYr8x38sDhkXR9Zb+FA/FVDv3
 mid3QpCIGQk9aQm1QUpJ2A2XiQ/FcPmqbPQmZhU3w90/cHVQltjG+xXqKYgehhKoI7I+
 1xd4FfVv7vv7p8MKn0sbppyEyhkdpKqyffSWXfitjjJ9nigZu7dh1K9vo8Il3JDjzm60 yQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ctkc71nna-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Dec 2021 03:52:57 +0000
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1B83quHP017481;
 Wed, 8 Dec 2021 03:52:56 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ctkc71nn3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Dec 2021 03:52:56 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1B83psP8010690;
 Wed, 8 Dec 2021 03:52:55 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma03dal.us.ibm.com with ESMTP id 3cqyyb9s1g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Dec 2021 03:52:55 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1B83qsKa11928032
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 8 Dec 2021 03:52:54 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B2E05AE063;
 Wed,  8 Dec 2021 03:52:54 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DB11DAE06B;
 Wed,  8 Dec 2021 03:52:52 +0000 (GMT)
Received: from lagarcia.br.ibm.com (unknown [9.160.64.156])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed,  8 Dec 2021 03:52:52 +0000 (GMT)
From: lagarcia@linux.ibm.com
To: qemu-ppc@nongnu.org
Subject: [PATCH] =?UTF-8?q?Adding=20C=C3=A9dric's=20repos=20in=20MAINTAINE?=
 =?UTF-8?q?RS=20file.?=
Date: Wed,  8 Dec 2021 00:52:49 -0300
Message-Id: <6387872fe9d16d32be0ec311e310d250e47fa97c.1638935436.git.lagarcia@br.ibm.com>
X-Mailer: git-send-email 2.33.1
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: SxkbXI_3OTNLimsnCMhOTLlSyYIZXV2w
X-Proofpoint-ORIG-GUID: 79acxqMsudbuVn4VDRVu_mv_z3n_Dsv4
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-08_01,2021-12-06_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 mlxlogscore=999 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 mlxscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112080024
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=lagarcia@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
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
Cc: Leonardo Garcia <lagarcia@br.ibm.com>, danielhb413@gmail.com,
 qemu-devel@nongnu.org, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Leonardo Garcia <lagarcia@br.ibm.com>

Signed-off-by: Leonardo Garcia <lagarcia@br.ibm.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7543eb4d59..52c6b99763 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -273,6 +273,7 @@ F: hw/ppc/ppc.c
 F: hw/ppc/ppc_booke.c
 F: include/hw/ppc/ppc.h
 F: disas/ppc.c
+T: git https://gitlab.com/legoater/qemu.git
 
 RISC-V TCG CPUs
 M: Palmer Dabbelt <palmer@dabbelt.com>
@@ -390,6 +391,7 @@ R: David Gibson <david@gibson.dropbear.id.au>
 R: Greg Kurz <groug@kaod.org>
 S: Maintained
 F: target/ppc/kvm.c
+T: git https://gitlab.com/legoater/qemu.git
 
 S390 KVM CPUs
 M: Halil Pasic <pasic@linux.ibm.com>
@@ -1343,6 +1345,7 @@ F: tests/qtest/libqos/*spapr*
 F: tests/qtest/rtas*
 F: tests/qtest/libqos/rtas*
 F: tests/avocado/ppc_pseries.py
+T: git https://gitlab.com/legoater/qemu.git
 
 PowerNV (Non-Virtualized)
 M: Cédric Le Goater <clg@kaod.org>
@@ -1356,6 +1359,7 @@ F: include/hw/ppc/pnv*
 F: include/hw/pci-host/pnv*
 F: pc-bios/skiboot.lid
 F: tests/qtest/pnv*
+T: git https://gitlab.com/legoater/qemu.git powernv-next
 
 virtex_ml507
 M: Edgar E. Iglesias <edgar.iglesias@gmail.com>
@@ -1399,6 +1403,7 @@ F: hw/ppc/vof*
 F: include/hw/ppc/vof*
 F: pc-bios/vof/*
 F: pc-bios/vof*
+T: git https://gitlab.com/legoater/qemu.git
 
 RISC-V Machines
 ---------------
@@ -2244,6 +2249,7 @@ S: Supported
 F: hw/*/*xive*
 F: include/hw/*/*xive*
 F: docs/*/*xive*
+T: git https://gitlab.com/legoater/qemu.git
 
 Renesas peripherals
 R: Yoshinori Sato <ysato@users.sourceforge.jp>
-- 
2.33.1


