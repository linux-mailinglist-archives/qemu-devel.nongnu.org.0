Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96EC02F50C3
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 18:15:51 +0100 (CET)
Received: from localhost ([::1]:42596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzjkM-0006VE-HX
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 12:15:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1kzjGc-0008Og-Lv; Wed, 13 Jan 2021 11:45:06 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:49806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1kzjGa-0000By-N0; Wed, 13 Jan 2021 11:45:06 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10DGhsSr156771;
 Wed, 13 Jan 2021 16:44:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=corp-2020-01-29; bh=KbtC8f5PY+I/rTUmEiceGRK9oZzDlH0zW7ANW/Etp98=;
 b=IXKSpsnwGS15pgaZeEE/qG4mlMGPC367cDyqgGGYPj83k0HpbBe3cqdxmNoT/9A2C6if
 ad+9KmOBsqLlAsLfDRyktmpumYxE4ZeRhI+4Zo+pkGOAGmAX0uMbc1wy/PJfKHBywvP+
 55EZIdPOsMDrb7e0TOz7pILhTJbfCnt0266lmuiV84dXFzS6p2l+O3Qf/2DV3PGLKFjG
 8qcZ7CFCEd/q+w8Zfo9WIcyhRMIirsgpdKGcEVdasuIldULQCpoWPviwyIHO3TU477ej
 IhpqGmc3K3tEj9Res9XS3NmhkD63C8k+Xkt7rpoGXvk2REZwcjt4y7n+kd8vGiXBpAZt og== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2120.oracle.com with ESMTP id 360kcyve28-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 13 Jan 2021 16:44:53 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10DGdi7M036997;
 Wed, 13 Jan 2021 16:44:52 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3020.oracle.com with ESMTP id 360ke8p1vm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 13 Jan 2021 16:44:52 +0000
Received: from abhmp0013.oracle.com (abhmp0013.oracle.com [141.146.116.19])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 10DGioq5024657;
 Wed, 13 Jan 2021 16:44:50 GMT
Received: from disaster-area.hh.sledj.net (/81.187.26.238)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 13 Jan 2021 08:44:50 -0800
Received: from localhost (disaster-area.hh.sledj.net [local])
 by disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id 8f7a05ab;
 Wed, 13 Jan 2021 16:44:47 +0000 (UTC)
From: David Edmondson <david.edmondson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5] block: report errno when flock fcntl fails
Date: Wed, 13 Jan 2021 16:44:47 +0000
Message-Id: <20210113164447.2545785-1-david.edmondson@oracle.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9863
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 suspectscore=0 spamscore=0
 mlxlogscore=999 malwarescore=0 bulkscore=0 mlxscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101130101
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9863
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0
 impostorscore=0 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 mlxlogscore=999 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101130101
Received-SPF: pass client-ip=141.146.126.78;
 envelope-from=david.edmondson@oracle.com; helo=aserp2120.oracle.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Max Reitz <mreitz@redhat.com>, David Edmondson <david.edmondson@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When a call to fcntl(2) for the purpose of adding file locks fails
with an error other than EAGAIN or EACCES, report the error returned
by fcntl.

EAGAIN or EACCES are elided as they are considered to be common
failures, indicating that a conflicting lock is held by another
process.

No errors are elided when removing file locks.

Signed-off-by: David Edmondson <david.edmondson@oracle.com>
---
v3:
- Remove the now unnecessary updates to the test framework (Max).
- Elide the error detail for EAGAIN or EACCES when locking (Kevin,
   sort-of Max).
- Philippe and Vladimir sent Reviewed-by, but things have changed
   noticeably, so I didn't add them (dme).

v4:
- Really, really remove the unnecessary updates to the test framework.

v5:
- Use a macro to avoid duplicating the EAGAIN/EACCES suppression
  (Vladimir).
- Fix "lock" -> "unlock" (Vladimir).
- Comment on not eliding errors for the unlock case (Vladimir).

 block/file-posix.c | 38 ++++++++++++++++++++++++++++----------
 1 file changed, 28 insertions(+), 10 deletions(-)

diff --git a/block/file-posix.c b/block/file-posix.c
index 00cdaaa2d4..11aafa9d82 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -216,6 +216,20 @@ typedef struct RawPosixAIOData {
 static int cdrom_reopen(BlockDriverState *bs);
 #endif
 
+/*
+ * Elide EAGAIN and EACCES details when failing to lock, as this
+ * indicates that the specified file region is already locked by
+ * another process, which is considered a common scenario.
+ */
+#define raw_lock_error_setg_errno(errp, err, fmt, ...)                  \
+    do {                                                                \
+        if ((err) == EAGAIN || (err) == EACCES) {                       \
+            error_setg((errp), (fmt), ## __VA_ARGS__);                  \
+        } else {                                                        \
+            error_setg_errno((errp), (err), (fmt), ## __VA_ARGS__);     \
+        }                                                               \
+    } while (0)
+
 #if defined(__NetBSD__)
 static int raw_normalize_devicepath(const char **filename, Error **errp)
 {
@@ -836,7 +850,8 @@ static int raw_apply_lock_bytes(BDRVRawState *s, int fd,
         if ((perm_lock_bits & bit) && !(locked_perm & bit)) {
             ret = qemu_lock_fd(fd, off, 1, false);
             if (ret) {
-                error_setg(errp, "Failed to lock byte %d", off);
+                raw_lock_error_setg_errno(errp, -ret, "Failed to lock byte %d",
+                                          off);
                 return ret;
             } else if (s) {
                 s->locked_perm |= bit;
@@ -844,7 +859,7 @@ static int raw_apply_lock_bytes(BDRVRawState *s, int fd,
         } else if (unlock && (locked_perm & bit) && !(perm_lock_bits & bit)) {
             ret = qemu_unlock_fd(fd, off, 1);
             if (ret) {
-                error_setg(errp, "Failed to unlock byte %d", off);
+                error_setg_errno(errp, -ret, "Failed to unlock byte %d", off);
                 return ret;
             } else if (s) {
                 s->locked_perm &= ~bit;
@@ -857,7 +872,8 @@ static int raw_apply_lock_bytes(BDRVRawState *s, int fd,
         if ((shared_perm_lock_bits & bit) && !(locked_shared_perm & bit)) {
             ret = qemu_lock_fd(fd, off, 1, false);
             if (ret) {
-                error_setg(errp, "Failed to lock byte %d", off);
+                raw_lock_error_setg_errno(errp, -ret, "Failed to lock byte %d",
+                                          off);
                 return ret;
             } else if (s) {
                 s->locked_shared_perm |= bit;
@@ -866,7 +882,7 @@ static int raw_apply_lock_bytes(BDRVRawState *s, int fd,
                    !(shared_perm_lock_bits & bit)) {
             ret = qemu_unlock_fd(fd, off, 1);
             if (ret) {
-                error_setg(errp, "Failed to unlock byte %d", off);
+                error_setg_errno(errp, -ret, "Failed to unlock byte %d", off);
                 return ret;
             } else if (s) {
                 s->locked_shared_perm &= ~bit;
@@ -890,9 +906,10 @@ static int raw_check_lock_bytes(int fd, uint64_t perm, uint64_t shared_perm,
             ret = qemu_lock_fd_test(fd, off, 1, true);
             if (ret) {
                 char *perm_name = bdrv_perm_names(p);
-                error_setg(errp,
-                           "Failed to get \"%s\" lock",
-                           perm_name);
+
+                raw_lock_error_setg_errno(errp, -ret,
+                                          "Failed to get \"%s\" lock",
+                                          perm_name);
                 g_free(perm_name);
                 return ret;
             }
@@ -905,9 +922,10 @@ static int raw_check_lock_bytes(int fd, uint64_t perm, uint64_t shared_perm,
             ret = qemu_lock_fd_test(fd, off, 1, true);
             if (ret) {
                 char *perm_name = bdrv_perm_names(p);
-                error_setg(errp,
-                           "Failed to get shared \"%s\" lock",
-                           perm_name);
+
+                raw_lock_error_setg_errno(errp, -ret,
+                                          "Failed to get shared \"%s\" lock",
+                                          perm_name);
                 g_free(perm_name);
                 return ret;
             }
-- 
2.29.2


