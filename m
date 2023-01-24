Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69AF267A17F
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 19:41:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKODS-0004n9-Rg; Tue, 24 Jan 2023 13:40:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <siddhi.katage@oracle.com>)
 id 1pKODB-0004if-Jp
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 13:40:02 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <siddhi.katage@oracle.com>)
 id 1pKOD9-00079Z-Ft
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 13:40:01 -0500
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30OGOIhm031376; Tue, 24 Jan 2023 18:39:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id; s=corp-2022-7-12;
 bh=hs19veO+RBYTY/eKLU+q6T37HdoBeeC5MBS8KyTNRgk=;
 b=Fsge4sdt5CPEOEqfruF/odhWfdUmWscoRdV0K9IWzVozLoSOhf8ADYTjB0NiEAD3A7wQ
 YRu8cm4w44SNlyKUhrGh5XSzjKBiSLX+nA4+NpqOlnUXakIg6KNoZNjFp4cBiicsrgQC
 m4MwG1bqy0e5xsSOTZJRx5k69ksDOejM78fetl9BTC6nsr/01NHCM6f/+Xk7yTQVJFM4
 FbH++TsuF1jUg+3g1T7U/xyqSXwpM4rNH8wAKZZFywfc/x3MKlRg4N8KZ1EH9OBW9/Xl
 qSux8i607pC2vWVzyaRqOw0N0NJGJm1UGYoqYNnY5/Q2Yf5Aw5bOKTj7rWsTSOI9M9Ul 8A== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3n86ybe4re-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 24 Jan 2023 18:39:53 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 30OH35Qq030200; Tue, 24 Jan 2023 18:39:52 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3n86g5n118-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 24 Jan 2023 18:39:51 +0000
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30OIckFj008683;
 Tue, 24 Jan 2023 18:39:51 GMT
Received: from siddhi-vm1.osdevelopmeniad.oraclevcn.com
 (siddhi-vm1.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.254.70])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id
 3n86g5n10t-1; Tue, 24 Jan 2023 18:39:51 +0000
From: Siddhi Katage <siddhi.katage@oracle.com>
To: qemu-devel@nongnu.org
Cc: joe.jin@oracle.com, dongli.zhang@oracle.com, siddhi.katage@oracle.com,
 christian.ehrhardt@canonical.com, berrange@redhat.com,
 pbonzini@redhat.com, philmd@linaro.org
Subject: [PATCH 1/1] modules: load modules from /var/run/qemu/<version>
 directory firstly
Date: Tue, 24 Jan 2023 18:39:50 +0000
Message-Id: <1674585590-13888-1-git-send-email-siddhi.katage@oracle.com>
X-Mailer: git-send-email 1.8.3.1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-24_13,2023-01-24_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 spamscore=0 phishscore=0
 suspectscore=0 malwarescore=0 adultscore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301240170
X-Proofpoint-GUID: W1VVQhXm57UIVlNwD0Om0UqdbNQID8dW
X-Proofpoint-ORIG-GUID: W1VVQhXm57UIVlNwD0Om0UqdbNQID8dW
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

An old running QEMU will try to load modules with new build-id first, this
will fail as expected, then QEMU will fallback to load the old modules that
matches its build-id from /var/run/qemu/<version> directory.
Make /var/run/qemu/<version> directory as first search path to load modules.

Fixes: bd83c861c0 ("modules: load modules from versioned /var/run dir")
Signed-off-by: Siddhi Katage <siddhi.katage@oracle.com>
---
 util/module.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/util/module.c b/util/module.c
index 32e2631..b723d65 100644
--- a/util/module.c
+++ b/util/module.c
@@ -233,17 +233,17 @@ int module_load(const char *prefix, const char *name, Error **errp)
     g_hash_table_add(loaded_modules, module_name);
 
     search_dir = getenv("QEMU_MODULE_DIR");
-    if (search_dir != NULL) {
-        dirs[n_dirs++] = g_strdup_printf("%s", search_dir);
-    }
-    dirs[n_dirs++] = get_relocated_path(CONFIG_QEMU_MODDIR);
-
 #ifdef CONFIG_MODULE_UPGRADES
     version_dir = g_strcanon(g_strdup(QEMU_PKGVERSION),
                              G_CSET_A_2_Z G_CSET_a_2_z G_CSET_DIGITS "+-.~",
                              '_');
     dirs[n_dirs++] = g_strdup_printf("/var/run/qemu/%s", version_dir);
 #endif
+    if (search_dir != NULL) {
+        dirs[n_dirs++] = g_strdup_printf("%s", search_dir);
+    }
+    dirs[n_dirs++] = get_relocated_path(CONFIG_QEMU_MODDIR);
+
     assert(n_dirs <= ARRAY_SIZE(dirs));
 
     /* end of resources managed by the out: label */
-- 
1.8.3.1


