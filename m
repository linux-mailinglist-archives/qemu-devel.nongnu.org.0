Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 164B22DFC77
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 14:54:08 +0100 (CET)
Received: from localhost ([::1]:42228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krLdX-0007cz-5D
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 08:54:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1krLZL-0002F9-E3; Mon, 21 Dec 2020 08:49:47 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:54332)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1krLZF-00050B-KA; Mon, 21 Dec 2020 08:49:47 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BLDiYpB080274;
 Mon, 21 Dec 2020 13:49:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=corp-2020-01-29;
 bh=DkwI9dCU6NXQr8SjjklzWJqUn1CCicWkPekF5NJhljo=;
 b=b3XdTwoTXH94YSMao6KRzxVLhqrZaLiKUsdX0wTU7Qovdk8matYSnc48dxUEWwRxNPTD
 Q72PSBc/ByR9kMkwTsrakZAosR9BmpESoLJcGzivKVpssXVy8AOWnY6iipdxPge4s9GM
 xAac17RBgf4Khw6SeZHqkv7Ej4abWI3DEJfGcZXh4eGU88ccLAZscINHZK+H5l6L42pK
 Ge/KCOYSC0ujT2IthUrsC4xUp1JIVK/4dkMwkczYj4cmqxBk5zHRQjKqzI700YINSGze
 hSJNEJ8bAOKqj+qA9P0Uk87Wn3zRG5kdjbaYRnCnrP8s/6hNJlKsBOJVV13lDJZAF2k6 EQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2130.oracle.com with ESMTP id 35h8xqwcj4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 21 Dec 2020 13:49:36 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BLDkX6s143436;
 Mon, 21 Dec 2020 13:49:36 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3030.oracle.com with ESMTP id 35huevsagy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 21 Dec 2020 13:49:36 +0000
Received: from abhmp0008.oracle.com (abhmp0008.oracle.com [141.146.116.14])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0BLDnZBD008130;
 Mon, 21 Dec 2020 13:49:35 GMT
Received: from disaster-area.hh.sledj.net (/81.187.26.238)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 21 Dec 2020 05:49:35 -0800
Received: from localhost (disaster-area.hh.sledj.net [local])
 by disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id 3752b0f6;
 Mon, 21 Dec 2020 13:49:31 +0000 (UTC)
From: David Edmondson <david.edmondson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/2] block: report errno when flock fcntl fails
Date: Mon, 21 Dec 2020 13:49:30 +0000
Message-Id: <20201221134931.1194806-2-david.edmondson@oracle.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201221134931.1194806-1-david.edmondson@oracle.com>
References: <20201221134931.1194806-1-david.edmondson@oracle.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9841
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxscore=0 spamscore=0
 mlxlogscore=999 malwarescore=0 phishscore=0 bulkscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012210098
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9841
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 clxscore=1015
 priorityscore=1501 mlxscore=0 lowpriorityscore=0 adultscore=0
 mlxlogscore=999 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012210098
Received-SPF: pass client-ip=156.151.31.86;
 envelope-from=david.edmondson@oracle.com; helo=userp2130.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, David Edmondson <david.edmondson@oracle.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When a call to fcntl(2) for the purpose of manipulating file locks
fails, report the error returned by fcntl.

Signed-off-by: David Edmondson <david.edmondson@oracle.com>
---
 block/file-posix.c         | 20 +++++-----
 tests/qemu-iotests/153.out | 76 +++++++++++++++++++-------------------
 tests/qemu-iotests/182.out |  2 +-
 3 files changed, 49 insertions(+), 49 deletions(-)

diff --git a/block/file-posix.c b/block/file-posix.c
index 9804681d5c..f866fc9742 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -836,7 +836,7 @@ static int raw_apply_lock_bytes(BDRVRawState *s, int fd,
         if ((perm_lock_bits & bit) && !(locked_perm & bit)) {
             ret = qemu_lock_fd(fd, off, 1, false);
             if (ret) {
-                error_setg(errp, "Failed to lock byte %d", off);
+                error_setg_errno(errp, -ret, "Failed to lock byte %d", off);
                 return ret;
             } else if (s) {
                 s->locked_perm |= bit;
@@ -844,7 +844,7 @@ static int raw_apply_lock_bytes(BDRVRawState *s, int fd,
         } else if (unlock && (locked_perm & bit) && !(perm_lock_bits & bit)) {
             ret = qemu_unlock_fd(fd, off, 1);
             if (ret) {
-                error_setg(errp, "Failed to unlock byte %d", off);
+                error_setg_errno(errp, -ret, "Failed to unlock byte %d", off);
                 return ret;
             } else if (s) {
                 s->locked_perm &= ~bit;
@@ -857,7 +857,7 @@ static int raw_apply_lock_bytes(BDRVRawState *s, int fd,
         if ((shared_perm_lock_bits & bit) && !(locked_shared_perm & bit)) {
             ret = qemu_lock_fd(fd, off, 1, false);
             if (ret) {
-                error_setg(errp, "Failed to lock byte %d", off);
+                error_setg_errno(errp, -ret, "Failed to lock byte %d", off);
                 return ret;
             } else if (s) {
                 s->locked_shared_perm |= bit;
@@ -866,7 +866,7 @@ static int raw_apply_lock_bytes(BDRVRawState *s, int fd,
                    !(shared_perm_lock_bits & bit)) {
             ret = qemu_unlock_fd(fd, off, 1);
             if (ret) {
-                error_setg(errp, "Failed to unlock byte %d", off);
+                error_setg_errno(errp, -ret, "Failed to unlock byte %d", off);
                 return ret;
             } else if (s) {
                 s->locked_shared_perm &= ~bit;
@@ -890,9 +890,9 @@ static int raw_check_lock_bytes(int fd, uint64_t perm, uint64_t shared_perm,
             ret = qemu_lock_fd_test(fd, off, 1, true);
             if (ret) {
                 char *perm_name = bdrv_perm_names(p);
-                error_setg(errp,
-                           "Failed to get \"%s\" lock",
-                           perm_name);
+                error_setg_errno(errp, -ret,
+                                 "Failed to get \"%s\" lock",
+                                 perm_name);
                 g_free(perm_name);
                 return ret;
             }
@@ -905,9 +905,9 @@ static int raw_check_lock_bytes(int fd, uint64_t perm, uint64_t shared_perm,
             ret = qemu_lock_fd_test(fd, off, 1, true);
             if (ret) {
                 char *perm_name = bdrv_perm_names(p);
-                error_setg(errp,
-                           "Failed to get shared \"%s\" lock",
-                           perm_name);
+                error_setg_errno(errp, -ret,
+                                 "Failed to get shared \"%s\" lock",
+                                 perm_name);
                 g_free(perm_name);
                 return ret;
             }
diff --git a/tests/qemu-iotests/153.out b/tests/qemu-iotests/153.out
index fcaa71aeee..c1f8494a63 100644
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
@@ -429,7 +429,7 @@ Adding drive
 {"return": "OKrn"}
 
 _qemu_io_wrapper TEST_DIR/t.qcow2 -c write 0 512
-qemu-io: can't open device TEST_DIR/t.qcow2: Failed to get "write" lock
+qemu-io: can't open device TEST_DIR/t.qcow2: Failed to get "write" lock: Resource temporarily unavailable
 Is another process using the image [TEST_DIR/t.qcow2]?
 Creating overlay with qemu-img when the guest is running should be allowed
 
@@ -450,7 +450,7 @@ _qemu_img_wrapper info TEST_DIR/t.qcow2
 {"return": ""}
 
 _qemu_io_wrapper TEST_DIR/t.qcow2 -c write 0 512
-qemu-io: can't open device TEST_DIR/t.qcow2: Failed to get "write" lock
+qemu-io: can't open device TEST_DIR/t.qcow2: Failed to get "write" lock: Resource temporarily unavailable
 Is another process using the image [TEST_DIR/t.qcow2]?
 Closing the other
 { 'execute': 'human-monitor-command', 'arguments': { 'command-line': 'drive_del d1' } }
diff --git a/tests/qemu-iotests/182.out b/tests/qemu-iotests/182.out
index ce23340670..63b7ecb325 100644
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


