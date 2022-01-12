Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A611148C643
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 15:43:11 +0100 (CET)
Received: from localhost ([::1]:47480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7eqE-000053-LD
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 09:43:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lagarcia@linux.ibm.com>)
 id 1n7e3n-00089E-8z; Wed, 12 Jan 2022 08:53:07 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:55746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lagarcia@linux.ibm.com>)
 id 1n7e3l-0001c5-Hx; Wed, 12 Jan 2022 08:53:06 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20CDp8at026545; 
 Wed, 12 Jan 2022 13:52:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=04tHjVgJ4qvfsFv1RYDobJz0eAKzrc80VquLXlGOaj4=;
 b=IATSkr1VaVyfAjn7y8VU+y6rvw6XZ7gw2emc8WLA5UzLKPhSXroPzENKNWeQm6sPy9Jx
 +wt4eIF4gw7+Tga/Xl6PHWzOtCOVGLBCZyCYYQJlnxKQbgsbvJUm+1syv8LASWC+9od3
 s+Ttk5AmR4s3luG2mDygZapJqqJL3haBPTk+/3/bEWTx78yf2DddQl6LQpBUskkJ8cTt
 fcQMM6MmBqEfpDQ/eailcfHVdwbUVr9G3Wfw6x1loo71ExKScDid07ubK8rIQyR9G4au
 w8tvlTcFDhGyYPjzszCyuGL7Rdgc+JQ68LCAkTXNhQ+9UHhNRuHQn1qcV3yeVtZT5BVE EQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dhyvvgcqt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 13:52:42 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20CDqgwU008932;
 Wed, 12 Jan 2022 13:52:42 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dhyvvgcqh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 13:52:42 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20CDjqiG015660;
 Wed, 12 Jan 2022 13:52:41 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma02dal.us.ibm.com with ESMTP id 3df28bede1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 13:52:41 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20CDqdaK15925820
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 Jan 2022 13:52:40 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B0624C605D;
 Wed, 12 Jan 2022 13:52:39 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 13FA7C6059;
 Wed, 12 Jan 2022 13:52:38 +0000 (GMT)
Received: from lagarcia.br.ibm.com.com (unknown [9.65.79.38])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 12 Jan 2022 13:52:37 +0000 (GMT)
From: lagarcia@linux.ibm.com
To: qemu-ppc@nongnu.org
Subject: [PATCH 3/3] Link new ppc-spapr-hotplug.rst file to pseries.rst.
Date: Wed, 12 Jan 2022 10:52:16 -0300
Message-Id: <e54aad58e3cfbd96647430d33cdb59fd87d199b0.1641995058.git.lagarcia@br.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1641995057.git.lagarcia@br.ibm.com>
References: <cover.1641995057.git.lagarcia@br.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: voRnyr6A4Rnq_PYmZwgSRNwDJ_5fBeKg
X-Proofpoint-GUID: 5rfFFI-VftmwQhIZ66riHxNaN-EvuqBg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-12_04,2022-01-11_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0
 lowpriorityscore=0 mlxscore=0 phishscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 clxscore=1015 mlxlogscore=796 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201120088
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=lagarcia@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: Leonardo Garcia <lagarcia@br.ibm.com>, danielhb413@gmail.com,
 qemu-devel@nongnu.org, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Leonardo Garcia <lagarcia@br.ibm.com>

Signed-off-by: Leonardo Garcia <lagarcia@br.ibm.com>
---
 docs/system/ppc/pseries.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/system/ppc/pseries.rst b/docs/system/ppc/pseries.rst
index ead33e6764..1120b21d95 100644
--- a/docs/system/ppc/pseries.rst
+++ b/docs/system/ppc/pseries.rst
@@ -110,13 +110,13 @@ can  also be found in QEMU documentation:
 .. toctree::
    :maxdepth: 1
 
+   ../../specs/ppc-spapr-hotplug.rst
    ../../specs/ppc-spapr-hcalls.rst
    ../../specs/ppc-spapr-numa.rst
    ../../specs/ppc-spapr-xive.rst
 
 Other documentation available in QEMU docs directory:
 
-* Hot plug (``/docs/specs/ppc-spapr-hotplug.txt``).
 * Hypervisor calls needed by the Ultravisor
   (``/docs/specs/ppc-spapr-uv-hcalls.txt``).
 
-- 
2.34.1


