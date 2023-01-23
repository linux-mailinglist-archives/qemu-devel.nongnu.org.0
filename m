Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF65E6788A5
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 21:49:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pK3jh-0007Rd-R2; Mon, 23 Jan 2023 15:48:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <siddhi.katage@oracle.com>)
 id 1pK1rm-0004U4-Rq
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 13:48:26 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <siddhi.katage@oracle.com>)
 id 1pK1rk-0002N3-VS
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 13:48:26 -0500
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30NIO7V7031491; Mon, 23 Jan 2023 18:48:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id; s=corp-2022-7-12;
 bh=HkQnFRueSwZABowW8UVa5z0ZAp9tOAeSwszq79cyLJs=;
 b=Fsrzduuxf8Xu+QOJrrf2vNXPDwomxRVIqaUpWHiTDKrJVN4Q/b2uX2qgXskkpCmFN8+u
 lU4iEZbitpwGwiYc8adKonuUA+8ElxxSrqCK3CK9VG7YTI+G3Ld68wgaBdofvOM3aJ9B
 b8h3SMQdvm/XfWZI3gK50w8HhkqsLjNuWhKKIAsBlULS0ZBxG4O3jQg2EcBOkyZMs0ER
 ds/Z2/WWwkYz1+OWNoBkjNhqTFiGVVivBG467HkZyXn1a53+T9AqU001G7OWAysMgxyq
 fZDbEg0NrQDXC7Bdm/y66pLbgLJnQo7l10qEZSl/CbAtLLuw6GhXUS1wzxWx38gGiigO 6g== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3n87xa3je9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 23 Jan 2023 18:48:16 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 30NHjN8E001298; Mon, 23 Jan 2023 18:48:15 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3n86ga6pjk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 23 Jan 2023 18:48:14 +0000
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30NImERY007833;
 Mon, 23 Jan 2023 18:48:14 GMT
Received: from siddhi-vm1.osdevelopmeniad.oraclevcn.com
 (siddhi-vm1.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.254.70])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id
 3n86ga6phw-1; Mon, 23 Jan 2023 18:48:14 +0000
From: Siddhi Katage <siddhi.katage@oracle.com>
To: qemu-devel@nongnu.org
Cc: joe.jin@oracle.com, dongli.zhang@oracle.com, siddhi.katage@oracle.com,
 christian.ehrhardt@canonical.com, berrange@redhat.com, pbonzini@redhat.com
Subject: [PATCH 1/1] modules: load modules from /var/run/qemu/<version>
 directory firstly
Date: Mon, 23 Jan 2023 18:48:13 +0000
Message-Id: <1674499693-9863-1-git-send-email-siddhi.katage@oracle.com>
X-Mailer: git-send-email 1.8.3.1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-23_12,2023-01-23_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 phishscore=0
 mlxlogscore=999 adultscore=0 mlxscore=0 suspectscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301230181
X-Proofpoint-GUID: wn4JQvk87JLWHamXXmypg4iBgvgiprW1
X-Proofpoint-ORIG-GUID: wn4JQvk87JLWHamXXmypg4iBgvgiprW1
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=siddhi.katage@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 23 Jan 2023 15:48:10 -0500
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

From: Siddhi Katage <siddhi.katage@oracle.com>

An old running QEMU will try to load modules with new build-id first,this
will fail as expected ,then QEMU will fallback to load the old modules that
matches its build-id from /var/run/qemu/<version> directory .
Make /var/run/qemu/<version> directory as first search path to load modules.

Fixes: bd83c861c0 ("modules: load modules from versioned /var/run dir")
Signed-off-by: Siddhi Katage <siddhi.katage@oracle.com>
---
 util/module.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/util/module.c b/util/module.c
index 620412e..c4f6c57 100644
--- a/util/module.c
+++ b/util/module.c
@@ -194,6 +194,12 @@ bool module_load_one(const char *prefix, const char *lib_name)
 
     exec_dir = qemu_get_exec_dir();
     search_dir = getenv("QEMU_MODULE_DIR");
+#ifdef CONFIG_MODULE_UPGRADES
+    version_dir = g_strcanon(g_strdup(QEMU_PKGVERSION),
+                             G_CSET_A_2_Z G_CSET_a_2_z G_CSET_DIGITS "+-.~",
+                             '_');
+    dirs[n_dirs++] = g_strdup_printf("/var/run/qemu/%s", version_dir);
+#endif
     if (search_dir != NULL) {
         dirs[n_dirs++] = g_strdup_printf("%s", search_dir);
     }
@@ -201,12 +207,6 @@ bool module_load_one(const char *prefix, const char *lib_name)
     dirs[n_dirs++] = g_strdup_printf("%s/..", exec_dir ? : "");
     dirs[n_dirs++] = g_strdup_printf("%s", exec_dir ? : "");
 
-#ifdef CONFIG_MODULE_UPGRADES
-    version_dir = g_strcanon(g_strdup(QEMU_PKGVERSION),
-                             G_CSET_A_2_Z G_CSET_a_2_z G_CSET_DIGITS "+-.~",
-                             '_');
-    dirs[n_dirs++] = g_strdup_printf("/var/run/qemu/%s", version_dir);
-#endif
 
     assert(n_dirs <= ARRAY_SIZE(dirs));
 
-- 
1.8.3.1


