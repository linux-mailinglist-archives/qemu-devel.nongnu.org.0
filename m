Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD7153957E
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 19:35:09 +0200 (CEST)
Received: from localhost ([::1]:46194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nw5lr-0005Nj-UY
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 13:35:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <muriloo@linux.ibm.com>)
 id 1nw5gG-0003Jq-2H; Tue, 31 May 2022 13:29:21 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:47340)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <muriloo@linux.ibm.com>)
 id 1nw5gE-0006lY-51; Tue, 31 May 2022 13:29:19 -0400
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24VHSCvH013587;
 Tue, 31 May 2022 17:28:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=pp1; bh=k2cARuV2bMjthlIdIYn/gsAlWeIYwk+NoiVL32GNocU=;
 b=AvSQzXDmyviA3hGTVQenJb30045W4e2NVEtbTCnIAljq3Gf9mrQavRiotyIo/DK9VCsN
 zm8nx7oXaPGCtY+om6/69gGYNuGi89k3KL7awu0aLwICR8sQ4Xt7f+97eMHWiNepEREL
 GwGJAEY6tJLyhhZNCmC1sQfx8OHcOLiJFhZaSelKDaz3WIzVXh4Uowcg9QBmc3h+dAEJ
 K+uFBg6fjHS1trFSJ1BLDMmOXtqrft9uFXU2dGqgI8mLx47N7qCQCck13VNmmWRVJRFt
 SWHIXrfiHeJDjlt9zqff38gRUHGGaMdGNLezdRLLCUSp75BNtnxFYy5BrN1pyHfA7MtI aA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gdn60k3em-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 31 May 2022 17:28:50 +0000
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 24VHSl7Y017924;
 Tue, 31 May 2022 17:28:50 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gdn60k3ec-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 31 May 2022 17:28:50 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24VHKCYA025199;
 Tue, 31 May 2022 17:28:49 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma04dal.us.ibm.com with ESMTP id 3gd4n5fhbr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 31 May 2022 17:28:49 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 24VHSlGL42140042
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 31 May 2022 17:28:47 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A635EBE053;
 Tue, 31 May 2022 17:28:47 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1831ABE04F;
 Tue, 31 May 2022 17:28:47 +0000 (GMT)
Received: from localhost (unknown [9.65.199.190])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Tue, 31 May 2022 17:28:46 +0000 (GMT)
From: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
To: qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 mopsfelder@gmail.com, Murilo Opsfelder Araujo <muriloo@linux.ibm.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Fabiano Rosas <farosas@linux.ibm.com>
Subject: [PATCH] target/ppc/cpu-models: Update max alias to power10
Date: Tue, 31 May 2022 14:27:11 -0300
Message-Id: <20220531172711.94564-1-muriloo@linux.ibm.com>
X-Mailer: git-send-email 2.36.1
Content-Type: text/plain; charset="utf-8"
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: -nSnNF1Q_JUjFOnQjdA3FkVYS3dTALPb
X-Proofpoint-ORIG-GUID: x3PTdPW8bg6VM-NjbbAY50tgI-BCHyTE
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-05-31_07,2022-05-30_03,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0
 lowpriorityscore=0 mlxscore=0 adultscore=0 bulkscore=0 malwarescore=0
 mlxlogscore=995 clxscore=1011 impostorscore=0 priorityscore=1501
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2205310080
Received-SPF: pass client-ip=148.163.156.1; envelope-from=muriloo@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Update max alias to power10 so users can take advantage of a more
recent CPU model when '-cpu max' is provided.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1038
Cc: Daniel P. Berrangé <berrange@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>
Cc: Cédric Le Goater <clg@kaod.org>
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: Fabiano Rosas <farosas@linux.ibm.com>
Signed-off-by: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
---
 target/ppc/cpu-models.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/ppc/cpu-models.c b/target/ppc/cpu-models.c
index 976be5e0d1..c15fcb43a1 100644
--- a/target/ppc/cpu-models.c
+++ b/target/ppc/cpu-models.c
@@ -879,7 +879,6 @@ PowerPCCPUAlias ppc_cpu_aliases[] = {
     { "755", "755_v2.8" },
     { "goldfinger", "755_v2.8" },
     { "7400", "7400_v2.9" },
-    { "max", "7400_v2.9" },
     { "g4",  "7400_v2.9" },
     { "7410", "7410_v1.4" },
     { "nitro", "7410_v1.4" },
@@ -910,6 +909,8 @@ PowerPCCPUAlias ppc_cpu_aliases[] = {
     { "power8nvl", "power8nvl_v1.0" },
     { "power9", "power9_v2.0" },
     { "power10", "power10_v2.0" },
+    /* Update the 'max' alias to the latest CPU model */
+    { "max", "power10_v2.0" },
 #endif
 
     /* Generic PowerPCs */
-- 
2.36.1


