Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EDE3506C8F
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 14:34:45 +0200 (CEST)
Received: from localhost ([::1]:35548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngn48-0003SU-FN
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 08:34:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <c32aafaa3f29424fc13ae86b369c9baf1ceb0ec6@lizzy.crudebyte.com>)
 id 1ngmqf-0003CI-Rm; Tue, 19 Apr 2022 08:20:49 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:48401)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <c32aafaa3f29424fc13ae86b369c9baf1ceb0ec6@lizzy.crudebyte.com>)
 id 1ngmqe-0004jM-6G; Tue, 19 Apr 2022 08:20:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=Tx6/QrIYQER4SdvAHvid97QHCi42Ac1AewU43DS53hQ=; b=DZnYs
 m0dZ0B9e0a2dfxFTnTecUuMsWeJvBq+ZjDWuZ6o3cYw7SSC6wWB4VFkv/mlmuoGyQq1NkzkiyTDu+
 tAJMkwNHoqzwCGFMCnw6HV0/RRkLF5jKx06/Uc4P2jDkT3Wu0mBhLWG1ohcY4IrqhgJtcI03tC5jV
 73zsMSt3jlixBcLRhwlQhkmht1DN3ioPghC6UBTQVzjT8gX0WBJcsmj+Rt/dVNIoWWZ8UkAlP9j4C
 H3QLOJu+6ddEIMDz/xwHU6MND96oFSW/dvNtF729nAg5XL4Dnh+kKN3equG+eyzVLFhO+blEV0nhA
 7QR29NbB4kTWJnUZxqx+bgmMFkJYQ==;
Message-Id: <c32aafaa3f29424fc13ae86b369c9baf1ceb0ec6.1650370027.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1650370026.git.qemu_oss@crudebyte.com>
References: <cover.1650370026.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Tue, 19 Apr 2022 13:41:59 +0200
Subject: [PATCH 4/5] 9pfs: fix wrong errno being sent to Linux client on macOS
 host
To: qemu-devel@nongnu.org
Cc: Will Cohen <wwcohen@gmail.com>, Greg Kurz <groug@kaod.org>,
 Michael Roitzsch <reactorcontrol@icloud.com>,
 Keno Fischer <keno@juliacomputing.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, qemu-stable@nongnu.org
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=c32aafaa3f29424fc13ae86b369c9baf1ceb0ec6@lizzy.crudebyte.com;
 helo=lizzy.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Linux and macOS only share some errno definitions with equal macro
name and value. In fact most mappings for errno are completely
different on the two systems.

This patch converts some important errno values from macOS host to
corresponding Linux errno values before eventually sending such error
codes along with Tlerror replies (if 9p2000.L is used that is), which
fixes a bunch of misbehaviours when running a Linux client on macOS
host.

For instance this patch fixes:

  mount -t 9p -o posixacl ...

on Linux guest if security_mode=mapped was used for 9p server, which
refused to mount successfully, because macOS returned ENOATTR==93
when client tried to retrieve POSIX ACL xattrs, because errno 93
is defined as EPROTONOSUPPORT==93 on Linux, so Linux client believed
that xattrs were not supported by filesystem on host in general.

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 hw/9pfs/9p.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
index d953035e1c..becc41cbfd 100644
--- a/hw/9pfs/9p.c
+++ b/hw/9pfs/9p.c
@@ -57,6 +57,31 @@ enum {
 
 P9ARRAY_DEFINE_TYPE(V9fsPath, v9fs_path_free);
 
+/* Translates errno from host -> Linux if needed */
+static int errno_to_dotl(int err) {
+#if defined(CONFIG_LINUX)
+    /* nothing to translate (Linux -> Linux) */
+#elif defined(CONFIG_DARWIN)
+    /* translation mandatory for macOS hosts */
+    if (err == ENAMETOOLONG) {
+        err = 36; /* ==ENAMETOOLONG on Linux */
+    } else if (err == ENOTEMPTY) {
+        err = 39; /* ==ENOTEMPTY on Linux */
+    } else if (err == ELOOP) {
+        err = 40; /* ==ELOOP on Linux */
+    } else if (err == ENOATTR) {
+        err = 61; /* ==ENODATA on Linux */
+    } else if (err == ENOTSUP) {
+        err = 95; /* ==EOPNOTSUPP on Linux */
+    } else if (err == EOPNOTSUPP) {
+        err = 95; /* ==EOPNOTSUPP on Linux */
+    }
+#else
+#error Missing errno translation to Linux for this host system
+#endif
+    return err;
+}
+
 static ssize_t pdu_marshal(V9fsPDU *pdu, size_t offset, const char *fmt, ...)
 {
     ssize_t ret;
@@ -1054,6 +1079,8 @@ static void coroutine_fn pdu_complete(V9fsPDU *pdu, ssize_t len)
             }
             len += ret;
             id = P9_RERROR;
+        } else {
+            err = errno_to_dotl(err);
         }
 
         ret = pdu_marshal(pdu, len, "d", err);
-- 
2.32.0 (Apple Git-132)


