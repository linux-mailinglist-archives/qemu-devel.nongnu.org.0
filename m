Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6254A58531E
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jul 2022 17:54:16 +0200 (CEST)
Received: from localhost ([::1]:57276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHSJb-0000Oo-2L
	for lists+qemu-devel@lfdr.de; Fri, 29 Jul 2022 11:54:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raimue@zebra.codingfarm.de>)
 id 1oHSFR-0007BD-Qn
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 11:49:57 -0400
Received: from donkey.codingfarm.de ([2a01:4f8:190:12cf::d:1]:36502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raimue@zebra.codingfarm.de>)
 id 1oHSFQ-0007pt-0R
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 11:49:57 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by donkey.codingfarm.de (Postfix) with ESMTPSA id 93EBC8F551;
 Fri, 29 Jul 2022 17:49:51 +0200 (CEST)
Received: by zebra.codingfarm.de (Postfix, from userid 1000)
 id 45F6940A5A; Fri, 29 Jul 2022 17:49:51 +0200 (CEST)
From: =?UTF-8?q?Rainer=20M=C3=BCller?= <raimue@codingfarm.de>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Rainer=20M=C3=BCller?= <raimue@codingfarm.de>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH v2] linux-user: Use memfd for open syscall emulation
Date: Fri, 29 Jul 2022 17:49:51 +0200
Message-Id: <20220729154951.76268-1-raimue@codingfarm.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220725162811.87985-1-raimue@codingfarm.de>
References: <20220725162811.87985-1-raimue@codingfarm.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a01:4f8:190:12cf::d:1;
 envelope-from=raimue@zebra.codingfarm.de; helo=donkey.codingfarm.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NO_DNS_FOR_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

For certain paths in /proc, the open syscall is intercepted and the
returned file descriptor points to a temporary file with emulated
contents.

If TMPDIR is not accessible or writable for the current user (for
example in a read-only mounted chroot or container) tools such as ps
from procps may fail unexpectedly. Trying to read one of these paths
such as /proc/self/stat would return an error such as ENOENT or EROFS.

To relax the requirement on a writable TMPDIR, use memfd_create()
instead to create an anonymous file and return its file descriptor.

Signed-off-by: Rainer Müller <raimue@codingfarm.de>
---
v2: no more #ifdefs, use stub from util/memfd.c with ENOSYS fallback,
    tested with 'strace -e fault=memfd_create'
---
 linux-user/syscall.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 991b85e6b4..7b55726f25 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -8269,16 +8269,22 @@ static int do_openat(CPUArchState *cpu_env, int dirfd, const char *pathname, int
         char filename[PATH_MAX];
         int fd, r;
 
-        /* create temporary file to map stat to */
-        tmpdir = getenv("TMPDIR");
-        if (!tmpdir)
-            tmpdir = "/tmp";
-        snprintf(filename, sizeof(filename), "%s/qemu-open.XXXXXX", tmpdir);
-        fd = mkstemp(filename);
+        fd = memfd_create("qemu-open", 0);
         if (fd < 0) {
-            return fd;
+            if (errno != ENOSYS) {
+                return fd;
+            }
+            /* create temporary file to map stat to */
+            tmpdir = getenv("TMPDIR");
+            if (!tmpdir)
+                tmpdir = "/tmp";
+            snprintf(filename, sizeof(filename), "%s/qemu-open.XXXXXX", tmpdir);
+            fd = mkstemp(filename);
+            if (fd < 0) {
+                return fd;
+            }
+            unlink(filename);
         }
-        unlink(filename);
 
         if ((r = fake_open->fill(cpu_env, fd))) {
             int e = errno;
-- 
2.25.1


