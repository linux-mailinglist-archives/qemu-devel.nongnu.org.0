Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 133002ED63E
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 19:01:13 +0100 (CET)
Received: from localhost ([::1]:44124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxZax-00070b-NI
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 13:01:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1kxZYT-0005dL-QK; Thu, 07 Jan 2021 12:58:37 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:59518)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1kxZYP-00037y-UB; Thu, 07 Jan 2021 12:58:36 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 107HtRqI148162;
 Thu, 7 Jan 2021 17:58:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=corp-2020-01-29; bh=FLZaIYJ1q4mjgLVTgvrKIvmyDkyl2kANwLnc0+diaZo=;
 b=NgS3xLUiP/gcu4wyCKWZPLC92BmopX518LmOPbIRhp2YbQSGlQ8nedo0tmAQypjxF3aW
 6IAiJ23C0oagdTK5kOD9pcd204EvhBcEQYafo4W0nIqx7pJvzHR2axA6bLeoBTBw9uTk
 P3txsdNL73lsrA8jpQVngpFcNtsoYQoHI6Ll+k6n+ieiUNlVx6JnGA8G+K17Ldh4u/2m
 Hfq9uvJCiVMz1n8WP6eum1Dam+h0SgLaubo3NROjaf0OZ3lSAswsAwQOPkbGqj5Dt2Tl
 adeA8ivwsghi20ZIn3TmhWkmCxAMFZLJlOwDFDJJuDiRzdD0Oi4x9aDNhlyZt0sUmvVm uA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2120.oracle.com with ESMTP id 35wepmdk84-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 07 Jan 2021 17:58:19 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 107HsxPs096664;
 Thu, 7 Jan 2021 17:56:18 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3020.oracle.com with ESMTP id 35v1fbhnep-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 07 Jan 2021 17:56:18 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 107HuEDZ013150;
 Thu, 7 Jan 2021 17:56:15 GMT
Received: from disaster-area.hh.sledj.net (/81.187.26.238)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 07 Jan 2021 09:55:40 -0800
Received: from localhost (disaster-area.hh.sledj.net [local])
 by disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id 8da2db61;
 Thu, 7 Jan 2021 17:55:38 +0000 (UTC)
From: David Edmondson <david.edmondson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3] block: report errno when flock fcntl fails
Date: Thu,  7 Jan 2021 17:55:38 +0000
Message-Id: <20210107175538.381304-1-david.edmondson@oracle.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9857
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 phishscore=0
 suspectscore=0 spamscore=0 bulkscore=0 adultscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101070105
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9857
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 bulkscore=0 spamscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 mlxscore=0 malwarescore=0 clxscore=1011 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101070105
Received-SPF: pass client-ip=141.146.126.78;
 envelope-from=david.edmondson@oracle.com; helo=aserp2120.oracle.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.246,
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

 block/file-posix.c         | 52 +++++++++++++++++++++-----
 tests/qemu-iotests/153.out | 76 +++++++++++++++++++-------------------
 tests/qemu-iotests/182.out |  2 +-
 3 files changed, 81 insertions(+), 49 deletions(-)

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
diff --git a/tests/qemu-iotests/153.out b/tests/qemu-iotests/153.out
index ff8e55864a..14da13a1a5 100644
--- a/tests/qemu-iotests/153.out
+++ b/tests/qemu-iotests/153.out
@@ -11,11 +11,11 @@ Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=33554432 backing_file=TEST_DIR/t
 == Launching QEMU, opts: '' ==
 
 == Launching another QEMU, opts: '' ==
-QEMU_PROG: -drive file=TEST_DIR/t.qcow2,if=none,: Failed to get "write" lock
+QEMU_PROG: -drive file=TEST_DIR/t.qcow2,if=none,: Failed to get "write" lock: Resource temporarily unavailable
 Is another process using the image [TEST_DIR/t.qcow2]?
 
 == Launching another QEMU, opts: 'read-only=on' ==
-QEMU_PROG: -drive file=TEST_DIR/t.qcow2,if=none,read-only=on: Failed to get shared "write" lock
+QEMU_PROG: -drive file=TEST_DIR/t.qcow2,if=none,read-only=on: Failed to get shared "write" lock: Resource temporarily unavailable
 Is another process using the image [TEST_DIR/t.qcow2]?
 
 == Launching another QEMU, opts: 'read-only=on,force-share=on' ==
@@ -23,77 +23,77 @@ Is another process using the image [TEST_DIR/t.qcow2]?
 == Running utility commands  ==
 
 _qemu_io_wrapper -c read 0 512 TEST_DIR/t.qcow2
-qemu-io: can't open device TEST_DIR/t.qcow2: Failed to get "write" lock
+qemu-io: can't open device TEST_DIR/t.qcow2: Failed to get "write" lock: Resource temporarily unavailable
 Is another process using the image [TEST_DIR/t.qcow2]?
 
 _qemu_io_wrapper -r -c read 0 512 TEST_DIR/t.qcow2
-qemu-io: can't open device TEST_DIR/t.qcow2: Failed to get shared "write" lock
+qemu-io: can't open device TEST_DIR/t.qcow2: Failed to get shared "write" lock: Resource temporarily unavailable
 Is another process using the image [TEST_DIR/t.qcow2]?
 
 _qemu_io_wrapper -c open  TEST_DIR/t.qcow2 -c read 0 512
-qemu-io: can't open device TEST_DIR/t.qcow2: Failed to get "write" lock
+qemu-io: can't open device TEST_DIR/t.qcow2: Failed to get "write" lock: Resource temporarily unavailable
 Is another process using the image [TEST_DIR/t.qcow2]?
 no file open, try 'help open'
 
 _qemu_io_wrapper -c open -r  TEST_DIR/t.qcow2 -c read 0 512
-qemu-io: can't open device TEST_DIR/t.qcow2: Failed to get shared "write" lock
+qemu-io: can't open device TEST_DIR/t.qcow2: Failed to get shared "write" lock: Resource temporarily unavailable
 Is another process using the image [TEST_DIR/t.qcow2]?
 no file open, try 'help open'
 
 _qemu_img_wrapper info TEST_DIR/t.qcow2
-qemu-img: Could not open 'TEST_DIR/t.qcow2': Failed to get shared "write" lock
+qemu-img: Could not open 'TEST_DIR/t.qcow2': Failed to get shared "write" lock: Resource temporarily unavailable
 Is another process using the image [TEST_DIR/t.qcow2]?
 
 _qemu_img_wrapper check TEST_DIR/t.qcow2
-qemu-img: Could not open 'TEST_DIR/t.qcow2': Failed to get shared "write" lock
+qemu-img: Could not open 'TEST_DIR/t.qcow2': Failed to get shared "write" lock: Resource temporarily unavailable
 Is another process using the image [TEST_DIR/t.qcow2]?
 
 _qemu_img_wrapper compare TEST_DIR/t.qcow2 TEST_DIR/t.qcow2
-qemu-img: Could not open 'TEST_DIR/t.qcow2': Failed to get shared "write" lock
+qemu-img: Could not open 'TEST_DIR/t.qcow2': Failed to get shared "write" lock: Resource temporarily unavailable
 Is another process using the image [TEST_DIR/t.qcow2]?
 
 _qemu_img_wrapper map TEST_DIR/t.qcow2
-qemu-img: Could not open 'TEST_DIR/t.qcow2': Failed to get shared "write" lock
+qemu-img: Could not open 'TEST_DIR/t.qcow2': Failed to get shared "write" lock: Resource temporarily unavailable
 Is another process using the image [TEST_DIR/t.qcow2]?
 
 _qemu_img_wrapper amend -o size=32M TEST_DIR/t.qcow2
-qemu-img: Could not open 'TEST_DIR/t.qcow2': Failed to get "write" lock
+qemu-img: Could not open 'TEST_DIR/t.qcow2': Failed to get "write" lock: Resource temporarily unavailable
 Is another process using the image [TEST_DIR/t.qcow2]?
 
 _qemu_img_wrapper commit TEST_DIR/t.qcow2
-qemu-img: Could not open 'TEST_DIR/t.qcow2': Failed to get "write" lock
+qemu-img: Could not open 'TEST_DIR/t.qcow2': Failed to get "write" lock: Resource temporarily unavailable
 Is another process using the image [TEST_DIR/t.qcow2]?
 
 _qemu_img_wrapper resize TEST_DIR/t.qcow2 32M
-qemu-img: Could not open 'TEST_DIR/t.qcow2': Failed to get "write" lock
+qemu-img: Could not open 'TEST_DIR/t.qcow2': Failed to get "write" lock: Resource temporarily unavailable
 Is another process using the image [TEST_DIR/t.qcow2]?
 
 _qemu_img_wrapper rebase TEST_DIR/t.qcow2 -b TEST_DIR/t.qcow2.base -F qcow2
-qemu-img: Could not open 'TEST_DIR/t.qcow2': Failed to get "write" lock
+qemu-img: Could not open 'TEST_DIR/t.qcow2': Failed to get "write" lock: Resource temporarily unavailable
 Is another process using the image [TEST_DIR/t.qcow2]?
 
 _qemu_img_wrapper snapshot -l TEST_DIR/t.qcow2
-qemu-img: Could not open 'TEST_DIR/t.qcow2': Failed to get shared "write" lock
+qemu-img: Could not open 'TEST_DIR/t.qcow2': Failed to get shared "write" lock: Resource temporarily unavailable
 Is another process using the image [TEST_DIR/t.qcow2]?
 
 _qemu_img_wrapper convert TEST_DIR/t.qcow2 TEST_DIR/t.qcow2.convert
-qemu-img: Could not open 'TEST_DIR/t.qcow2': Failed to get shared "write" lock
+qemu-img: Could not open 'TEST_DIR/t.qcow2': Failed to get shared "write" lock: Resource temporarily unavailable
 Is another process using the image [TEST_DIR/t.qcow2]?
 
 _qemu_img_wrapper dd if=TEST_DIR/t.qcow2 of=TEST_DIR/t.qcow2.convert bs=512 count=1
-qemu-img: Could not open 'TEST_DIR/t.qcow2': Failed to get shared "write" lock
+qemu-img: Could not open 'TEST_DIR/t.qcow2': Failed to get shared "write" lock: Resource temporarily unavailable
 Is another process using the image [TEST_DIR/t.qcow2]?
 
 _qemu_img_wrapper bench -c 1 TEST_DIR/t.qcow2
-qemu-img: Could not open 'TEST_DIR/t.qcow2': Failed to get shared "write" lock
+qemu-img: Could not open 'TEST_DIR/t.qcow2': Failed to get shared "write" lock: Resource temporarily unavailable
 Is another process using the image [TEST_DIR/t.qcow2]?
 
 _qemu_img_wrapper bench -w -c 1 TEST_DIR/t.qcow2
-qemu-img: Could not open 'TEST_DIR/t.qcow2': Failed to get "write" lock
+qemu-img: Could not open 'TEST_DIR/t.qcow2': Failed to get "write" lock: Resource temporarily unavailable
 Is another process using the image [TEST_DIR/t.qcow2]?
 
 _qemu_img_wrapper create -f qcow2 TEST_DIR/t.qcow2 -b TEST_DIR/t.qcow2.base -F qcow2
-qemu-img: TEST_DIR/t.qcow2: Failed to get "write" lock
+qemu-img: TEST_DIR/t.qcow2: Failed to get "write" lock: Resource temporarily unavailable
 Is another process using the image [TEST_DIR/t.qcow2]?
 file format: IMGFMT
 backing file format: IMGFMT
@@ -132,7 +132,7 @@ qemu-img: unrecognized option '-U'
 Try 'qemu-img --help' for more information
 
 _qemu_img_wrapper rebase -U TEST_DIR/t.qcow2 -b TEST_DIR/t.qcow2.base -F qcow2
-qemu-img: Could not open 'TEST_DIR/t.qcow2': Failed to get "write" lock
+qemu-img: Could not open 'TEST_DIR/t.qcow2': Failed to get "write" lock: Resource temporarily unavailable
 Is another process using the image [TEST_DIR/t.qcow2]?
 
 _qemu_img_wrapper snapshot -l -U TEST_DIR/t.qcow2
@@ -158,7 +158,7 @@ Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=33554432 backing_file=TEST_DIR/t
 == Launching QEMU, opts: 'read-only=on' ==
 
 == Launching another QEMU, opts: '' ==
-QEMU_PROG: -drive file=TEST_DIR/t.qcow2,if=none,: Failed to get "write" lock
+QEMU_PROG: -drive file=TEST_DIR/t.qcow2,if=none,: Failed to get "write" lock: Resource temporarily unavailable
 Is another process using the image [TEST_DIR/t.qcow2]?
 
 == Launching another QEMU, opts: 'read-only=on' ==
@@ -168,13 +168,13 @@ Is another process using the image [TEST_DIR/t.qcow2]?
 == Running utility commands  ==
 
 _qemu_io_wrapper -c read 0 512 TEST_DIR/t.qcow2
-qemu-io: can't open device TEST_DIR/t.qcow2: Failed to get "write" lock
+qemu-io: can't open device TEST_DIR/t.qcow2: Failed to get "write" lock: Resource temporarily unavailable
 Is another process using the image [TEST_DIR/t.qcow2]?
 
 _qemu_io_wrapper -r -c read 0 512 TEST_DIR/t.qcow2
 
 _qemu_io_wrapper -c open  TEST_DIR/t.qcow2 -c read 0 512
-qemu-io: can't open device TEST_DIR/t.qcow2: Failed to get "write" lock
+qemu-io: can't open device TEST_DIR/t.qcow2: Failed to get "write" lock: Resource temporarily unavailable
 Is another process using the image [TEST_DIR/t.qcow2]?
 no file open, try 'help open'
 
@@ -189,19 +189,19 @@ _qemu_img_wrapper compare TEST_DIR/t.qcow2 TEST_DIR/t.qcow2
 _qemu_img_wrapper map TEST_DIR/t.qcow2
 
 _qemu_img_wrapper amend -o size=32M TEST_DIR/t.qcow2
-qemu-img: Could not open 'TEST_DIR/t.qcow2': Failed to get "write" lock
+qemu-img: Could not open 'TEST_DIR/t.qcow2': Failed to get "write" lock: Resource temporarily unavailable
 Is another process using the image [TEST_DIR/t.qcow2]?
 
 _qemu_img_wrapper commit TEST_DIR/t.qcow2
-qemu-img: Could not open 'TEST_DIR/t.qcow2': Failed to get "write" lock
+qemu-img: Could not open 'TEST_DIR/t.qcow2': Failed to get "write" lock: Resource temporarily unavailable
 Is another process using the image [TEST_DIR/t.qcow2]?
 
 _qemu_img_wrapper resize TEST_DIR/t.qcow2 32M
-qemu-img: Could not open 'TEST_DIR/t.qcow2': Failed to get "write" lock
+qemu-img: Could not open 'TEST_DIR/t.qcow2': Failed to get "write" lock: Resource temporarily unavailable
 Is another process using the image [TEST_DIR/t.qcow2]?
 
 _qemu_img_wrapper rebase TEST_DIR/t.qcow2 -b TEST_DIR/t.qcow2.base -F qcow2
-qemu-img: Could not open 'TEST_DIR/t.qcow2': Failed to get "write" lock
+qemu-img: Could not open 'TEST_DIR/t.qcow2': Failed to get "write" lock: Resource temporarily unavailable
 Is another process using the image [TEST_DIR/t.qcow2]?
 
 _qemu_img_wrapper snapshot -l TEST_DIR/t.qcow2
@@ -213,11 +213,11 @@ _qemu_img_wrapper dd if=TEST_DIR/t.qcow2 of=TEST_DIR/t.qcow2.convert bs=512 coun
 _qemu_img_wrapper bench -c 1 TEST_DIR/t.qcow2
 
 _qemu_img_wrapper bench -w -c 1 TEST_DIR/t.qcow2
-qemu-img: Could not open 'TEST_DIR/t.qcow2': Failed to get "write" lock
+qemu-img: Could not open 'TEST_DIR/t.qcow2': Failed to get "write" lock: Resource temporarily unavailable
 Is another process using the image [TEST_DIR/t.qcow2]?
 
 _qemu_img_wrapper create -f qcow2 TEST_DIR/t.qcow2 -b TEST_DIR/t.qcow2.base -F qcow2
-qemu-img: TEST_DIR/t.qcow2: Failed to get "write" lock
+qemu-img: TEST_DIR/t.qcow2: Failed to get "write" lock: Resource temporarily unavailable
 Is another process using the image [TEST_DIR/t.qcow2]?
 file format: IMGFMT
 backing file format: IMGFMT
@@ -256,7 +256,7 @@ qemu-img: unrecognized option '-U'
 Try 'qemu-img --help' for more information
 
 _qemu_img_wrapper rebase -U TEST_DIR/t.qcow2 -b TEST_DIR/t.qcow2.base -F qcow2
-qemu-img: Could not open 'TEST_DIR/t.qcow2': Failed to get "write" lock
+qemu-img: Could not open 'TEST_DIR/t.qcow2': Failed to get "write" lock: Resource temporarily unavailable
 Is another process using the image [TEST_DIR/t.qcow2]?
 
 _qemu_img_wrapper snapshot -l -U TEST_DIR/t.qcow2
@@ -377,17 +377,17 @@ qemu-img: Could not open 'TEST_DIR/t.qcow2': force-share=on can only be used wit
 Round done
 
 == Two devices with the same image (read-only=off - read-only=off) ==
-QEMU_PROG: -drive if=none,file=TEST_DIR/t.qcow2,read-only=off: Failed to get "write" lock
+QEMU_PROG: -drive if=none,file=TEST_DIR/t.qcow2,read-only=off: Failed to get "write" lock: Resource temporarily unavailable
 Is another process using the image [TEST_DIR/t.qcow2]?
 
 == Two devices with the same image (read-only=off - read-only=on) ==
-QEMU_PROG: -drive if=none,file=TEST_DIR/t.qcow2,read-only=on: Failed to get shared "write" lock
+QEMU_PROG: -drive if=none,file=TEST_DIR/t.qcow2,read-only=on: Failed to get shared "write" lock: Resource temporarily unavailable
 Is another process using the image [TEST_DIR/t.qcow2]?
 
 == Two devices with the same image (read-only=off - read-only=on,force-share=on) ==
 
 == Two devices with the same image (read-only=on - read-only=off) ==
-QEMU_PROG: -drive if=none,file=TEST_DIR/t.qcow2,read-only=off: Failed to get "write" lock
+QEMU_PROG: -drive if=none,file=TEST_DIR/t.qcow2,read-only=off: Failed to get "write" lock: Resource temporarily unavailable
 Is another process using the image [TEST_DIR/t.qcow2]?
 
 == Two devices with the same image (read-only=on - read-only=on) ==
@@ -408,13 +408,13 @@ Formatting 'TEST_DIR/t.IMGFMT.c', fmt=IMGFMT size=33554432 backing_file=TEST_DIR
 == Two devices sharing the same file in backing chain ==
 
 == Backing image also as an active device ==
-QEMU_PROG: -drive if=none,file=TEST_DIR/t.qcow2: Failed to get "write" lock
+QEMU_PROG: -drive if=none,file=TEST_DIR/t.qcow2: Failed to get "write" lock: Resource temporarily unavailable
 Is another process using the image [TEST_DIR/t.qcow2]?
 
 == Backing image also as an active device (ro) ==
 
 == Symbolic link ==
-QEMU_PROG: -drive if=none,file=TEST_DIR/t.qcow2: Failed to get "write" lock
+QEMU_PROG: -drive if=none,file=TEST_DIR/t.qcow2: Failed to get "write" lock: Resource temporarily unavailable
 Is another process using the image [TEST_DIR/t.qcow2]?
 
 == Active commit to intermediate layer should work when base in use ==
@@ -430,7 +430,7 @@ Adding drive
 {"return": "OKrn"}
 
 _qemu_io_wrapper TEST_DIR/t.qcow2 -c write 0 512
-qemu-io: can't open device TEST_DIR/t.qcow2: Failed to get "write" lock
+qemu-io: can't open device TEST_DIR/t.qcow2: Failed to get "write" lock: Resource temporarily unavailable
 Is another process using the image [TEST_DIR/t.qcow2]?
 Creating overlay with qemu-img when the guest is running should be allowed
 
@@ -455,7 +455,7 @@ _qemu_img_wrapper info TEST_DIR/t.qcow2
 {"return": ""}
 
 _qemu_io_wrapper TEST_DIR/t.qcow2 -c write 0 512
-qemu-io: can't open device TEST_DIR/t.qcow2: Failed to get "write" lock
+qemu-io: can't open device TEST_DIR/t.qcow2: Failed to get "write" lock: Resource temporarily unavailable
 Is another process using the image [TEST_DIR/t.qcow2]?
 Closing the other
 { 'execute': 'human-monitor-command',
diff --git a/tests/qemu-iotests/182.out b/tests/qemu-iotests/182.out
index 57f7265458..0e23f30f84 100644
--- a/tests/qemu-iotests/182.out
+++ b/tests/qemu-iotests/182.out
@@ -3,7 +3,7 @@ Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=33554432
 Starting QEMU
 
 Starting a second QEMU using the same image should fail
-QEMU_PROG: -drive file=TEST_DIR/t.qcow2,if=none,id=drive0,file.locking=on: Failed to get "write" lock
+QEMU_PROG: -drive file=TEST_DIR/t.qcow2,if=none,id=drive0,file.locking=on: Failed to get "write" lock: Resource temporarily unavailable
 Is another process using the image [TEST_DIR/t.qcow2]?
 
 === Testing reopen ===
-- 
2.29.2


