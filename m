Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5316C6ADD
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 15:25:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfLrZ-0005kT-SK; Thu, 23 Mar 2023 10:24:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <siddhi.katage@oracle.com>)
 id 1pfLrX-0005kK-MT
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 10:24:19 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <siddhi.katage@oracle.com>)
 id 1pfLrV-0007oS-OF
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 10:24:19 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32ND02Vg017288; Thu, 23 Mar 2023 14:24:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=corp-2022-7-12;
 bh=ECVIizhs1gDJHAeV5WBzrP1LFsefvbQazhNs9LFo7Ds=;
 b=mhZBgFCRmNkeEhPbjaLFyc9nH+jammdBaydZTF+UMTyA75I8BKMETkVz5lSno2GEEOU3
 orxNNQ6cGRvQS05mNymzaeJ0o7KP3fpDRP/9xrX0KxdzPAY3YZkwg2gS7IjqiCkFkIA7
 yN1cKtyIAVyi5ckaWE3IPHfcO+6/Q7TJA90DeuIfln7vPy6wGmJzUfTdxZ5PAte+EXKV
 dijNLFquraNIFsXCHXoQpO9Z8ChIphOP+CgWkJ6DnFpmsByeZKwpEi8aBFOVGqObASfM
 2xO1gU/Hosc12pwJalk4TRckYZZnvayykJ1XatavR53Lrjb6CVkKLSk+uvvn2m1/6blt rQ== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3pd5uukwfh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 23 Mar 2023 14:24:05 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 32NDw8qW016288; Thu, 23 Mar 2023 14:24:04 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3pgr4a1df4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 23 Mar 2023 14:24:03 +0000
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32NEE3k0023267;
 Thu, 23 Mar 2023 14:24:03 GMT
Received: from siddhi-vm1.osdevelopmeniad.oraclevcn.com
 (siddhi-vm1.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.254.70])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id
 3pgr4a1dej-1; Thu, 23 Mar 2023 14:24:03 +0000
From: Siddhi Katage <siddhi.katage@oracle.com>
To: qemu-devel@nongnu.org
Cc: joe.jin@oracle.com, dongli.zhang@oracle.com,
 christian.ehrhardt@canonical.com, berrange@redhat.com,
 pbonzini@redhat.com, philmd@linaro.org
Subject: [PATCH for-8.0 v2 1/1] modules: load modules from
 /var/run/qemu/<version> directory firstly
Date: Thu, 23 Mar 2023 14:24:03 +0000
Message-Id: <1679581443-6713-1-git-send-email-siddhi.katage@oracle.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-22_21,2023-03-23_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 adultscore=0 mlxlogscore=999
 bulkscore=0 phishscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303150002
 definitions=main-2303230109
X-Proofpoint-GUID: xE6D_79w4hmpVb5U4HTKNKoKCln1Eku9
X-Proofpoint-ORIG-GUID: xE6D_79w4hmpVb5U4HTKNKoKCln1Eku9
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
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
v2: Added reviewed-by tag
 
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


