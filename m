Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E964910A7
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 20:30:49 +0100 (CET)
Received: from localhost ([::1]:48980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9XiK-0002Dq-UW
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 14:30:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lagarcia@linux.ibm.com>)
 id 1n9XXY-0003LB-Me; Mon, 17 Jan 2022 14:19:40 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:56958
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lagarcia@linux.ibm.com>)
 id 1n9XXX-0002AC-5Z; Mon, 17 Jan 2022 14:19:40 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20HIusf7029418; 
 Mon, 17 Jan 2022 19:19:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=JMG9RjUB4rJG18GfUz4hHATT5eOE2idY+NPaz/Yia5c=;
 b=VIX+j+adLKlNxFYKsTudKCVzHFvlzfnU11qDRmdAw1SjvvGk8GBOlDxbeAMaejEuVMTL
 PT1+LFi5eERTBYGBP1XtXaXL/IFrYlG7nKXw5JSnjazjsQKsxuKMDCQeVrWPDYo8PJRQ
 isNGytAkDaMavLTT2BE31ujXbGXyEhl/mlU+1hS+Ub2+I52j0eU43XLaTiEsAiw0SNZU
 y3ufUTBLlCauzWfJO6rsHf/ojZws0MB5P7I8xOkPrUXbcUVgytH4pPxYrATtgxtgVtdJ
 rtDUZJQKN5QxpZA4ev/BDYsGx5aAMEYPDjwyZBX4J9kFdBq0X0qN3+QClhJAeNuswwFU BQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dne6c8atr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Jan 2022 19:19:36 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20HJJa7m029498;
 Mon, 17 Jan 2022 19:19:36 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dne6c8atn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Jan 2022 19:19:36 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20HJDElb032412;
 Mon, 17 Jan 2022 19:19:35 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma04wdc.us.ibm.com with ESMTP id 3dknwa3afj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Jan 2022 19:19:35 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20HJJYs626476942
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 Jan 2022 19:19:34 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 988C978063;
 Mon, 17 Jan 2022 19:19:34 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 39F887805E;
 Mon, 17 Jan 2022 19:19:33 +0000 (GMT)
Received: from lagarcia.br.ibm.com.com (unknown [9.65.75.63])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 17 Jan 2022 19:19:33 +0000 (GMT)
From: lagarcia@linux.ibm.com
To: qemu-ppc@nongnu.org
Subject: [PATCH 3/3] Link new ppc-spapr-uv-hcalls.rst to pseries.rst.
Date: Mon, 17 Jan 2022 16:19:19 -0300
Message-Id: <a24d2c260442e44aa99d4c18b1717f2f4a73529a.1642446876.git.lagarcia@br.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1642446868.git.lagarcia@br.ibm.com>
References: <cover.1642446868.git.lagarcia@br.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: oEQXDe72UlNJFkSeplR8gCyx0bivw2yo
X-Proofpoint-ORIG-GUID: rD-zKZJFIee7i8jHlP-hRMOFO2D7tsSB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-17_07,2022-01-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0
 mlxscore=0 mlxlogscore=886 clxscore=1015 phishscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201170119
Received-SPF: pass client-ip=148.163.158.5;
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
 docs/system/ppc/pseries.rst | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/docs/system/ppc/pseries.rst b/docs/system/ppc/pseries.rst
index d0aade3a31..569237dc0c 100644
--- a/docs/system/ppc/pseries.rst
+++ b/docs/system/ppc/pseries.rst
@@ -113,13 +113,9 @@ can  also be found in QEMU documentation:
    ../../specs/ppc-spapr-hotplug.rst
    ../../specs/ppc-spapr-hcalls.rst
    ../../specs/ppc-spapr-numa.rst
+   ../../specs/ppc-spapr-uv-hcalls.rst
    ../../specs/ppc-spapr-xive.rst
 
-Other documentation available in QEMU docs directory:
-
-* Hypervisor calls needed by the Ultravisor
-  (``/docs/specs/ppc-spapr-uv-hcalls.txt``).
-
 Switching between the KVM-PR and KVM-HV kernel module
 =====================================================
 
-- 
2.34.1


