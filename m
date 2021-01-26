Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2484304126
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 15:59:00 +0100 (CET)
Received: from localhost ([::1]:54622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4Po3-0003ch-TJ
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 09:58:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l4PEe-0001P2-Q6
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 09:22:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28245)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l4PEW-0006cO-TD
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 09:22:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611670936;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KZRfBktnbaKLE47a3PZ/VXGzUJPXUuVMgjZDtq2YaQc=;
 b=SmujXOLva5vnkmlsmWtNk/vwu5nriejJTaXVkJImCplWpvyU1TWptYU9GL6adqjh6ZRvf9
 epLKT1Cqps+MAGOIK5emdBeLrHF3vnOmul0NCtdraOJTSeUyXNstnLjGcBo5GY7eX+fumh
 ZLwhHJZU+erdPvjYxJmI/b7c/5SzAls=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-362-AfFnsTYlOKOoJlR0NeLtoQ-1; Tue, 26 Jan 2021 09:22:14 -0500
X-MC-Unique: AfFnsTYlOKOoJlR0NeLtoQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0A4D1801AB3;
 Tue, 26 Jan 2021 14:22:13 +0000 (UTC)
Received: from localhost (ovpn-114-175.ams2.redhat.com [10.36.114.175])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9D6135D768;
 Tue, 26 Jan 2021 14:22:12 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 50/53] block: report errno when flock fcntl fails
Date: Tue, 26 Jan 2021 15:20:13 +0100
Message-Id: <20210126142016.806073-51-mreitz@redhat.com>
In-Reply-To: <20210126142016.806073-1-mreitz@redhat.com>
References: <20210126142016.806073-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Edmondson <david.edmondson@oracle.com>

When a call to fcntl(2) for the purpose of adding file locks fails
with an error other than EAGAIN or EACCES, report the error returned
by fcntl.

EAGAIN or EACCES are elided as they are considered to be common
failures, indicating that a conflicting lock is held by another
process.

No errors are elided when removing file locks.

Signed-off-by: David Edmondson <david.edmondson@oracle.com>
Message-Id: <20210113164447.2545785-1-david.edmondson@oracle.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
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


