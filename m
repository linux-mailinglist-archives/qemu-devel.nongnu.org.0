Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 178142F342A
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 16:30:57 +0100 (CET)
Received: from localhost ([::1]:36292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzLdI-00016d-6H
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 10:30:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1kzLbI-00086c-4t; Tue, 12 Jan 2021 10:28:52 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:58632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1kzLbF-0007Qw-KV; Tue, 12 Jan 2021 10:28:51 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10CFDlcO183741;
 Tue, 12 Jan 2021 15:27:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=corp-2020-01-29; bh=vgWn6b3ZubyrYbIwZw5ZQqoTd8MR8q68ANqiP+4jy0E=;
 b=L5BGd5MKBsO3QMaWAnA9T6zqZ/+Jll/oZi7nDTGoldgjqLnjZxoc++kI/x3tV1fqud+4
 d3VuEUXoMz076b547KG37wACtHSPukuR7v60JKModapvgMG640CAXL9mnhZxmGboNdFJ
 UH+osyDiBHOGZshGmflibnucu3zbgszBF1uvU70jmFaxpjr5PTnWGmL6HEzLoUDqUEEY
 OqxyYjQoqjAazFIQV35ciqg0ARRDlhtqM8oeHS6KqqeOvIIk0ixhFn6fnx9boclO2mvY
 EfWde1FWoDptuMcBvp3eofjCZc/ELSlRliKnLQNtlHPIqms3L+VzkcQACy58UJ5HCtSB ZA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2130.oracle.com with ESMTP id 360kg1pvbx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 12 Jan 2021 15:27:34 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10CFFXrw133072;
 Tue, 12 Jan 2021 15:27:34 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3020.oracle.com with ESMTP id 360ke6p83f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 12 Jan 2021 15:27:33 +0000
Received: from abhmp0001.oracle.com (abhmp0001.oracle.com [141.146.116.7])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 10CFRULK032672;
 Tue, 12 Jan 2021 15:27:30 GMT
Received: from disaster-area.hh.sledj.net (/81.187.26.238)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 12 Jan 2021 07:27:29 -0800
Received: from localhost (disaster-area.hh.sledj.net [local])
 by disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id 214e1c0d;
 Tue, 12 Jan 2021 15:27:26 +0000 (UTC)
From: David Edmondson <david.edmondson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4] block: report errno when flock fcntl fails
Date: Tue, 12 Jan 2021 15:27:26 +0000
Message-Id: <20210112152726.2217792-1-david.edmondson@oracle.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9861
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 suspectscore=0 spamscore=0
 mlxlogscore=999 malwarescore=0 bulkscore=0 mlxscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101120089
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9861
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 suspectscore=0
 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 phishscore=0 mlxlogscore=999 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101120089
Received-SPF: pass client-ip=141.146.126.79;
 envelope-from=david.edmondson@oracle.com; helo=aserp2130.oracle.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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

When a call to fcntl(2) for the purpose of manipulating file locks
fails with an error other than EAGAIN or EACCES, report the error
returned by fcntl.

EAGAIN or EACCES are elided as they are considered to be common
failures, indicating that a conflicting lock is held by another
process.

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

 block/file-posix.c | 52 +++++++++++++++++++++++++++++++++++++---------
 1 file changed, 42 insertions(+), 10 deletions(-)

diff --git a/block/file-posix.c b/block/file-posix.c
index 00cdaaa2d4..c5142f7ffa 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -836,7 +836,13 @@ static int raw_apply_lock_bytes(BDRVRawState *s, int fd,
         if ((perm_lock_bits & bit) && !(locked_perm & bit)) {
             ret = qemu_lock_fd(fd, off, 1, false);
             if (ret) {
-                error_setg(errp, "Failed to lock byte %d", off);
+                int err = -ret;
+
+                if (err == EAGAIN || err == EACCES) {
+                    error_setg(errp, "Failed to lock byte %d", off);
+                } else {
+                    error_setg_errno(errp, err, "Failed to lock byte %d", off);
+                }
                 return ret;
             } else if (s) {
                 s->locked_perm |= bit;
@@ -844,7 +850,13 @@ static int raw_apply_lock_bytes(BDRVRawState *s, int fd,
         } else if (unlock && (locked_perm & bit) && !(perm_lock_bits & bit)) {
             ret = qemu_unlock_fd(fd, off, 1);
             if (ret) {
-                error_setg(errp, "Failed to unlock byte %d", off);
+                int err = -ret;
+
+                if (err == EAGAIN || err == EACCES) {
+                    error_setg(errp, "Failed to lock byte %d", off);
+                } else {
+                    error_setg_errno(errp, err, "Failed to lock byte %d", off);
+                }
                 return ret;
             } else if (s) {
                 s->locked_perm &= ~bit;
@@ -857,7 +869,13 @@ static int raw_apply_lock_bytes(BDRVRawState *s, int fd,
         if ((shared_perm_lock_bits & bit) && !(locked_shared_perm & bit)) {
             ret = qemu_lock_fd(fd, off, 1, false);
             if (ret) {
-                error_setg(errp, "Failed to lock byte %d", off);
+                int err = -ret;
+
+                if (err == EAGAIN || err == EACCES) {
+                    error_setg(errp, "Failed to lock byte %d", off);
+                } else {
+                    error_setg_errno(errp, err, "Failed to lock byte %d", off);
+                }
                 return ret;
             } else if (s) {
                 s->locked_shared_perm |= bit;
@@ -866,7 +884,7 @@ static int raw_apply_lock_bytes(BDRVRawState *s, int fd,
                    !(shared_perm_lock_bits & bit)) {
             ret = qemu_unlock_fd(fd, off, 1);
             if (ret) {
-                error_setg(errp, "Failed to unlock byte %d", off);
+                error_setg_errno(errp, -ret, "Failed to unlock byte %d", off);
                 return ret;
             } else if (s) {
                 s->locked_shared_perm &= ~bit;
@@ -890,9 +908,16 @@ static int raw_check_lock_bytes(int fd, uint64_t perm, uint64_t shared_perm,
             ret = qemu_lock_fd_test(fd, off, 1, true);
             if (ret) {
                 char *perm_name = bdrv_perm_names(p);
-                error_setg(errp,
-                           "Failed to get \"%s\" lock",
-                           perm_name);
+                int err = -ret;
+
+                if (err == EAGAIN || err == EACCES) {
+                    error_setg(errp, "Failed to get \"%s\" lock",
+                               perm_name);
+                } else {
+                    error_setg_errno(errp, err,
+                                     "Failed to get \"%s\" lock",
+                                     perm_name);
+                }
                 g_free(perm_name);
                 return ret;
             }
@@ -905,9 +930,16 @@ static int raw_check_lock_bytes(int fd, uint64_t perm, uint64_t shared_perm,
             ret = qemu_lock_fd_test(fd, off, 1, true);
             if (ret) {
                 char *perm_name = bdrv_perm_names(p);
-                error_setg(errp,
-                           "Failed to get shared \"%s\" lock",
-                           perm_name);
+                int err = -ret;
+
+                if (err == EAGAIN || err == EACCES) {
+                    error_setg(errp, "Failed to get shared \"%s\" lock",
+                               perm_name);
+                } else {
+                    error_setg_errno(errp, err,
+                                     "Failed to get shared \"%s\" lock",
+                                     perm_name);
+                }
                 g_free(perm_name);
                 return ret;
             }
-- 
2.29.2


