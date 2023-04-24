Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D3CE6ED098
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 16:48:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqxTi-0006d5-4r; Mon, 24 Apr 2023 10:47:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <harshpb@linux.ibm.com>)
 id 1pqxTf-0006cX-6r; Mon, 24 Apr 2023 10:47:39 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <harshpb@linux.ibm.com>)
 id 1pqxTd-0008ST-Ap; Mon, 24 Apr 2023 10:47:38 -0400
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33OEeuNV028567; Mon, 24 Apr 2023 14:47:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=psCb4yaHMeUGmwUTN2mLOxU8MXOTNr88J/iQWBrrUtM=;
 b=liVIG82JXTPzK9OFSVlq+7z3bzC9zQxZRTBh5jpQg7jCPEgkcexobbpZWnpD3wCChGdJ
 d9IT7LFWkJcTjidh77kV4xyf8o79MgN8n1hTFhv+qddTG368XOcL/HdWK5jupwjICAtn
 qUe60pxIq29mFJk4o5r1O0ydiJtnvYMaMmifu2AlcXa6tt7/TCXsN43pAegFdXKNy+vJ
 VOQGbE6L6ExfKKd+AaIjl1BnMHRatElkCa7kQ0/VRTYWY7Q/JpM4X0DoEt0ak9eCbFPt
 f5tvgc834JuN6cARwAX4ZOU9OMshUITw9IgGjt6TsXqKglrmxvAbJwq5f2EZVMd1MRgG 7g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q44sh9k5h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Apr 2023 14:47:35 +0000
Received: from m0353724.ppops.net (m0353724.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33OEffMl032544;
 Mon, 24 Apr 2023 14:47:34 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q44sh9k1y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Apr 2023 14:47:34 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 33ODv5wo005712;
 Mon, 24 Apr 2023 14:47:31 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
 by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3q46ug1683-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Apr 2023 14:47:31 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com
 [10.20.54.101])
 by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 33OElTsE852582
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Apr 2023 14:47:29 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 41F8C20040;
 Mon, 24 Apr 2023 14:47:29 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4446920043;
 Mon, 24 Apr 2023 14:47:27 +0000 (GMT)
Received: from li-1901474c-32f3-11b2-a85c-fc5ff2c001f3.ibm.com.com (unknown
 [9.43.92.123]) by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Mon, 24 Apr 2023 14:47:26 +0000 (GMT)
From: Harsh Prateek Bora <harshpb@linux.ibm.com>
To: qemu-ppc@nongnu.org
Cc: qemu-devel@nongnu.org, farosas@suse.de, npiggin@gmail.com,
 danielhb413@gmail.com
Subject: [PATCH v2 0/4] Cleanup [h_enter|spapr_exit]_nested routines
Date: Mon, 24 Apr 2023 20:17:08 +0530
Message-Id: <20230424144712.1985425-1-harshpb@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: N8d8T8s2SikTlKWHZUMqwsp9v1rhcZwr
X-Proofpoint-ORIG-GUID: wkwzgOZQ7bihJaL8SfuxTVzJWtVbGcIl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-24_09,2023-04-21_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 bulkscore=0 adultscore=0
 mlxscore=0 malwarescore=0 impostorscore=0 mlxlogscore=356
 priorityscore=1501 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2303200000 definitions=main-2304240131
Received-SPF: pass client-ip=148.163.158.5; envelope-from=harshpb@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This patchset introduces helper routines to enable (and does) cleaning
up of h_enter_nested() and spapr_exit_nested() routines in existing api
for nested virtualization on Power/SPAPR for better code readability /
maintenance. No functional changes intended with this patchset.

Changelog:

changes from v1:
 - addressed Fabiano's review comments
 - folding Reviewed-by tags in patch 1/4, 4/4

Harsh Prateek Bora (4):
  ppc: spapr: cleanup cr get/store in [h_enter|spapr_exit]_nested with
    helpers.
  ppc: spapr: cleanup h_enter_nested() with helper routines.
  ppc: spapr: cleanup spapr_exit_nested() with helper routines.
  MAINTAINERS: Adding myself in the list for ppc/spapr

 MAINTAINERS          |   1 +
 hw/ppc/spapr_hcall.c | 251 ++++++++++++++++++++++++++-----------------
 target/ppc/cpu.c     |  17 +++
 target/ppc/cpu.h     |   2 +
 4 files changed, 170 insertions(+), 101 deletions(-)

-- 
2.31.1


