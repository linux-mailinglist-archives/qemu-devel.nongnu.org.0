Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 369815802FA
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jul 2022 18:41:01 +0200 (CEST)
Received: from localhost ([::1]:38330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oG18e-0004BA-0N
	for lists+qemu-devel@lfdr.de; Mon, 25 Jul 2022 12:41:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raimue@zebra.codingfarm.de>)
 id 1oG137-00016P-Bv
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 12:35:18 -0400
Received: from donkey.codingfarm.de ([2a01:4f8:190:12cf::d:1]:60942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raimue@zebra.codingfarm.de>)
 id 1oG133-0007mU-EX
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 12:35:15 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by donkey.codingfarm.de (Postfix) with ESMTPSA id 6D5AB802E3;
 Mon, 25 Jul 2022 18:28:11 +0200 (CEST)
Received: by zebra.codingfarm.de (Postfix, from userid 1000)
 id 25CF540CC0; Mon, 25 Jul 2022 18:28:11 +0200 (CEST)
From: =?UTF-8?q?Rainer=20M=C3=BCller?= <raimue@codingfarm.de>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Rainer=20M=C3=BCller?= <raimue@codingfarm.de>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH] linux-user: Use memfd for open syscall emulation
Date: Mon, 25 Jul 2022 18:28:11 +0200
Message-Id: <20220725162811.87985-1-raimue@codingfarm.de>
X-Mailer: git-send-email 2.25.1
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
 linux-user/syscall.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 991b85e6b4..3e4af930ad 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -8265,9 +8265,11 @@ static int do_openat(CPUArchState *cpu_env, int dirfd, const char *pathname, int
     }
 
     if (fake_open->filename) {
+        int fd, r;
+
+#ifndef CONFIG_MEMFD
         const char *tmpdir;
         char filename[PATH_MAX];
-        int fd, r;
 
         /* create temporary file to map stat to */
         tmpdir = getenv("TMPDIR");
@@ -8279,6 +8281,12 @@ static int do_openat(CPUArchState *cpu_env, int dirfd, const char *pathname, int
             return fd;
         }
         unlink(filename);
+#else
+        fd = memfd_create("qemu-open", 0);
+        if (fd < 0) {
+            return fd;
+        }
+#endif
 
         if ((r = fake_open->fill(cpu_env, fd))) {
             int e = errno;
-- 
2.25.1


