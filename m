Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA502DB430
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 20:03:48 +0100 (CET)
Received: from localhost ([::1]:38776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpFbs-0006Rr-UZ
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 14:03:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1kpFZu-0005Q7-Kb; Tue, 15 Dec 2020 14:01:42 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:39664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1kpFZp-00020h-Qe; Tue, 15 Dec 2020 14:01:41 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BFJ042I077853;
 Tue, 15 Dec 2020 19:01:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=corp-2020-01-29; bh=o3AjzJV8aCvSUDylAq1sWhq1b7opUEu0FHaI3EIGY9w=;
 b=WsZlrmp2ykzasVuweogYBah7vZKQ1axpU0KUM3PJJYiiM2WC0yHpEr9JWDO2GBGjVS0A
 0SLcaUw6KQS4hp6pOKW8jnChPNcBt7Qha2HHDL2HY0UIgYlROiHOGbVlI8QKnv82kwl6
 WdZPKklCTb578U6ah7HpR0MHZux9yIFurT6TCw4FCtOMxRsCKcYbpHOtyyOKrkmNt3n1
 Vo8b80IR1UrFQLoV1nRunkNTL6e3gaTn9MqnUmcJPT5+XX893pIszkn86hO0MqrnMKuS
 neNzRrsw9auuiAjkgKRl6yFnQr5YPiSzwpCAJEL8+VcPLJbITyLVOZ8X9bjQtAvzbKVU /A== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2120.oracle.com with ESMTP id 35cntm495d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 15 Dec 2020 19:01:31 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BFJ0AOi138997;
 Tue, 15 Dec 2020 19:01:30 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3030.oracle.com with ESMTP id 35d7swpffn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 15 Dec 2020 19:01:30 +0000
Received: from abhmp0010.oracle.com (abhmp0010.oracle.com [141.146.116.16])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0BFJ1TUs005131;
 Tue, 15 Dec 2020 19:01:30 GMT
Received: from disaster-area.hh.sledj.net (/81.187.26.238)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 15 Dec 2020 11:01:29 -0800
Received: from localhost (disaster-area.hh.sledj.net [local])
 by disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id 675c7a7d;
 Tue, 15 Dec 2020 19:01:27 +0000 (UTC)
From: David Edmondson <david.edmondson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] block: report errno when flock fcntl fails
Date: Tue, 15 Dec 2020 19:01:27 +0000
Message-Id: <20201215190127.1765595-1-david.edmondson@oracle.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9836
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0
 mlxlogscore=999 spamscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012150126
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9836
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 phishscore=0 mlxscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0 suspectscore=0
 mlxlogscore=999 impostorscore=0 priorityscore=1501 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012150126
Received-SPF: pass client-ip=141.146.126.78;
 envelope-from=david.edmondson@oracle.com; helo=aserp2120.oracle.com
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
Cc: qemu-trivial@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 David Edmondson <david.edmondson@oracle.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When a call to fcntl(2) for the purpose of manipulating file locks
fails, report the error returned by fcntl.

Signed-off-by: David Edmondson <david.edmondson@oracle.com>
---
 block/file-posix.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

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
-- 
2.29.2


