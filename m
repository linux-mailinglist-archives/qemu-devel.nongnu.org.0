Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8251265FEAA
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 11:22:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDjpt-0002rb-Ul; Fri, 06 Jan 2023 05:20:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eiakovlev@linux.microsoft.com>)
 id 1pDjpr-0002rN-7V
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 05:20:27 -0500
Received: from linux.microsoft.com ([13.77.154.182])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eiakovlev@linux.microsoft.com>) id 1pDjpp-0000lo-NC
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 05:20:27 -0500
Received: from localhost.localdomain (unknown [77.64.253.186])
 by linux.microsoft.com (Postfix) with ESMTPSA id B67A020938B3;
 Fri,  6 Jan 2023 02:20:22 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com B67A020938B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1673000423;
 bh=/EXDx7CMsqKm1SyLFDe9NBDaja7iFaTGJBcR3uOFMT8=;
 h=From:To:Cc:Subject:Date:From;
 b=X+0qyPUJXX1o4jijIGlzuL3QWGbE6Cgk5Pm9N+sSavEkP2QaaGD6vvzWsh4xmcFvp
 q94dWOidNq8pbWYKLhH3Av8VAKh/wduVCq7UDZdMi2h7uuyIfQvVZZmgEUtMlimku3
 W5j1PcB6+5Mv13CL+O4g3IIBhsDL0iEoDGMoVaYA=
From: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
To: qemu-devel@nongnu.org
Cc: bmeng.cn@gmail.com,
	philmd@linaro.org,
	alex.bennee@linaro.org
Subject: [PATCH v2] semihosting: add O_BINARY flag in host_open for NT
 compatibility
Date: Fri,  6 Jan 2023 11:20:18 +0100
Message-Id: <20230106102018.20520-1-eiakovlev@linux.microsoft.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=13.77.154.182;
 envelope-from=eiakovlev@linux.microsoft.com; helo=linux.microsoft.com
X-Spam_score_int: -197
X-Spam_score: -19.8
X-Spam_bar: -------------------
X-Spam_report: (-19.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, ENV_AND_HDR_SPF_MATCH=-0.5,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Windows open(2) implementation opens files in text mode by default and
needs a Windows-only O_BINARY flag to open files as binary. QEMU already
knows about that flag in osdep and it is defined to 0 on non-Windows,
so we can just add it to the host_flags for better compatibility.

Signed-off-by: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
---
 semihosting/syscalls.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/semihosting/syscalls.c b/semihosting/syscalls.c
index 508a0ad88c..b621d78c2d 100644
--- a/semihosting/syscalls.c
+++ b/semihosting/syscalls.c
@@ -253,7 +253,7 @@ static void host_open(CPUState *cs, gdb_syscall_complete_cb complete,
 {
     CPUArchState *env G_GNUC_UNUSED = cs->env_ptr;
     char *p;
-    int ret, host_flags;
+    int ret, host_flags = O_BINARY;
 
     ret = validate_lock_user_string(&p, cs, fname, fname_len);
     if (ret < 0) {
@@ -262,11 +262,11 @@ static void host_open(CPUState *cs, gdb_syscall_complete_cb complete,
     }
 
     if (gdb_flags & GDB_O_WRONLY) {
-        host_flags = O_WRONLY;
+        host_flags |= O_WRONLY;
     } else if (gdb_flags & GDB_O_RDWR) {
-        host_flags = O_RDWR;
+        host_flags |= O_RDWR;
     } else {
-        host_flags = O_RDONLY;
+        host_flags |= O_RDONLY;
     }
     if (gdb_flags & GDB_O_CREAT) {
         host_flags |= O_CREAT;
-- 
2.34.1


