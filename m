Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9EA588F0B
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Aug 2022 17:02:00 +0200 (CEST)
Received: from localhost ([::1]:38240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJFsl-0003NX-Ic
	for lists+qemu-devel@lfdr.de; Wed, 03 Aug 2022 11:01:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oJFnK-0001n0-RR
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 10:56:22 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:37489)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oJFnI-0005r9-Lx
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 10:56:22 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue109
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MFK8N-1oCyPB33gP-00Flqs; Wed, 03
 Aug 2022 16:56:16 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Rainer=20M=C3=BCller?= <raimue@codingfarm.de>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 3/3] linux-user: Use memfd for open syscall emulation
Date: Wed,  3 Aug 2022 16:56:13 +0200
Message-Id: <20220803145613.428167-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220803145613.428167-1-laurent@vivier.eu>
References: <20220803145613.428167-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:1XaqOx/Ra5846rlYKRVPZ3XCIYSDhdEzCZUlj4e1zxsgn3Tc5uQ
 B399tGi/RUEVTU5t9h7Yt4PFEPNX1QtsKWzx+oGd1cQQeNu8BDFTagY3MiwKY605Vi8L5/X
 2ram1+WipYLnSWgRKAuF/IdCMRzeOJfd++IYp66v1vor8dlGjwppV14UOL+5/2b6P1RlPAa
 XMj/OCeIMJ/SNjYpAXV1w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:HLa3KNtnIH0=:9cra+kyuaql8GsyCRPogDK
 hc15j/Lj2S/6md8gahAe7ohNIAk7sJ605eBruiQZYbDZup1PyvillPa4F/gGROXCLOiAmJdoU
 GFeE4ot+FYgQaWR82pjnapfLq0SmqmM6MeB1DP70CtchcRXPJiNOkEGMxq8jnUBzYVjrO0WRP
 s//zF3c4Qp8nr7ytNKdvpiON7837TYbKnbF26Qn4s/3Qu8Fz9xInCmKK76mDuWEfInq5A4Z2s
 8DRcCGXb6qN4WwJR/mhNEwI/pB04e6kOpRAF9x0H2z7h8SlZy6+BV0FtvdaaSfesSLi99nhFC
 /7JAqzbiZ8gyVhKfWSWbjY4HDqr1LVeP+PhyI4LTYYbp3bc+KDH3kfGWOZAdQIFEl/AfYRmJ0
 Yi6JneCZ4yDiKqWRG8kw/0Tsl2ZOOQAadzcN0NsjS7iJTa13FowBLqETjx5VQrVy3RSqbuZFy
 p9ISOUmQry/TJY0UFikDfPIeAyYbX0Dnc2fEHx3LbiiqTPuPKbEF3PxoKbqT32Lt7w0c5Lslg
 7CyNv4q9nbP1PJgUGlVMN8Io4bPVdCCFMx/nzFvq0zFxiqfgkF6nC/Bdeun3RBl12DbxfEtzU
 1gb+1i35FkUE1a09HXEATYxOD5EPZf3NKXKBiek7T3eQBTDnN8sWsC29NsjZL4lZbZHn1IURD
 4Gvg3S/FMrFnrkFQ4b7AF/Ti5MOSz+XhLBMlSFA2XTGoB0VIUnzogm6duZTsdDvzmP/TQjMB+
 2Q2qTRYo6JrccPBPPmON2O3MKLkUeXcV/ky56w==
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Rainer Müller <raimue@codingfarm.de>

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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220729154951.76268-1-raimue@codingfarm.de>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/syscall.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index b27a6552aa34..ef53feb5ab45 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -8260,16 +8260,22 @@ static int do_openat(CPUArchState *cpu_env, int dirfd, const char *pathname, int
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
2.37.1


