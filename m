Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0803D46D92E
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Dec 2021 18:04:58 +0100 (CET)
Received: from localhost ([::1]:46710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mv0NE-0003HX-En
	for lists+qemu-devel@lfdr.de; Wed, 08 Dec 2021 12:04:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lagarcia@linux.ibm.com>)
 id 1mv0In-0005p7-K2; Wed, 08 Dec 2021 12:00:26 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:37218
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lagarcia@linux.ibm.com>)
 id 1mv0Ij-0001tw-R9; Wed, 08 Dec 2021 12:00:20 -0500
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B8Gmi5Y025860; 
 Wed, 8 Dec 2021 17:00:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=lSEQVoAAgNUQcdgPgKYVUF9FnPOb97DcpF+O2FxWKuQ=;
 b=tg43lNNGaL/Eryjp3ruTw241MCSzGrSo6tESwXtTFTu9TUXm/tRIjJvbUH+EfMjeNqvH
 WBGO96PfZ5kqcMcHv+ynkmE2DOzCh+cjatZUHDiXIenQo61f2plLm/tH76S02YnkVyrq
 pAeCYZ+6b1LtRHrYwVW4vBbQyhesJsXFQtMvOCWiPNvT9KV5aJ/LWgYweUkwbKpsrekJ
 9VOuwYbDQgPDGx4Vl/1WiCgodA1Gm41mygx9ulejSrXumJYHU5l+o0SFKeCJKmHZAmfZ
 PC4L8tRTwYMbk3A7uSkvfDfAQUR5QB6/kF6Hp1klK3USEh3ID50A84F/OiRZm8aqaVJ8 zw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cu0j1g6sq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Dec 2021 17:00:11 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1B8Gw3YQ027770;
 Wed, 8 Dec 2021 17:00:10 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cu0j1g6s5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Dec 2021 17:00:10 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1B8GZFWU028725;
 Wed, 8 Dec 2021 17:00:10 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma03dal.us.ibm.com with ESMTP id 3cqyybs8gm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Dec 2021 17:00:09 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1B8H08El23265594
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 8 Dec 2021 17:00:09 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D4502C606D;
 Wed,  8 Dec 2021 17:00:08 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1CEDEC6075;
 Wed,  8 Dec 2021 17:00:07 +0000 (GMT)
Received: from lagarcia.br.ibm.com.com (unknown [9.65.76.184])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed,  8 Dec 2021 17:00:06 +0000 (GMT)
From: lagarcia@linux.ibm.com
To: qemu-ppc@nongnu.org
Subject: [PATCH 3/3] Link new ppc-spapr-hcalls.rst file to pseries.rst.
Date: Wed,  8 Dec 2021 13:59:18 -0300
Message-Id: <7d3c8bad1ca76eb13d6ce2b16dd9a821edcdb27b.1638982486.git.lagarcia@br.ibm.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1638982480.git.lagarcia@br.ibm.com>
References: <cover.1638982480.git.lagarcia@br.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 1eDc8OOFc3AT93mls257jeJXSmxutrjA
X-Proofpoint-ORIG-GUID: AlkU6ztI-e2c42_ecz_gUdJrID2zxDYB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-08_07,2021-12-08_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 suspectscore=0 bulkscore=0
 mlxscore=0 clxscore=1015 lowpriorityscore=0 mlxlogscore=725 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112080097
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=lagarcia@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: danielhb413@gmail.com, groug@kaod.org, qemu-devel@nongnu.org, clg@kaod.org,
 Leonardo Garcia <lagarcia@br.ibm.com>, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Leonardo Garcia <lagarcia@br.ibm.com>

Signed-off-by: Leonardo Garcia <lagarcia@br.ibm.com>
---
 docs/system/ppc/pseries.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/system/ppc/pseries.rst b/docs/system/ppc/pseries.rst
index e46f09d4c8..56f5942e13 100644
--- a/docs/system/ppc/pseries.rst
+++ b/docs/system/ppc/pseries.rst
@@ -113,12 +113,12 @@ can  also be found in QEMU documentation:
 .. toctree::
    :maxdepth: 1
 
+   ../../specs/ppc-spapr-hcalls.rst
    ../../specs/ppc-spapr-numa.rst
    ../../specs/ppc-spapr-xive.rst
 
 Other documentation available in QEMU docs directory:
 
-* Hypervisor calls (a.k.a. hcalls) (``docs/specs/ppc-spapr-hcalls.txt``).
 * Hot plug (``/docs/specs/ppc-spapr-hotplug.txt``).
 * Hypervisor calls needed by the Ultravisor
   (``/docs/specs/ppc-spapr-uv-hcalls.txt``).
-- 
2.33.1


