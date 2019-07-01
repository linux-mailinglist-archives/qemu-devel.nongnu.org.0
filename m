Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3295713A07
	for <lists+qemu-devel@lfdr.de>; Sat,  4 May 2019 15:23:10 +0200 (CEST)
Received: from localhost ([127.0.0.1]:56596 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hMudB-0004Bh-8i
	for lists+qemu-devel@lfdr.de; Sat, 04 May 2019 09:23:09 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44329)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <S.E.Harris@kent.ac.uk>) id 1hMqDO-0007WP-7G
	for qemu-devel@nongnu.org; Sat, 04 May 2019 04:40:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <S.E.Harris@kent.ac.uk>) id 1hMqDM-0002w5-SZ
	for qemu-devel@nongnu.org; Sat, 04 May 2019 04:40:14 -0400
Received: from mx0.kent.ac.uk ([129.12.21.32]:43191)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <S.E.Harris@kent.ac.uk>)
	id 1hMqDM-0002uV-M0
	for qemu-devel@nongnu.org; Sat, 04 May 2019 04:40:12 -0400
Received: from banach.kent.ac.uk ([129.12.41.70])
	by mx0.kent.ac.uk with esmtpsa
	(TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.91)
	(envelope-from <S.E.Harris@kent.ac.uk>)
	id 1hMqDJ-000Jin-A6; Sat, 04 May 2019 09:40:09 +0100
From: Sarah Harris <S.E.Harris@kent.ac.uk>
To: qemu-devel@nongnu.org
Date: Sat,  4 May 2019 09:36:32 +0100
Message-Id: <20190504083638.13380-3-S.E.Harris@kent.ac.uk>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190504083638.13380-1-S.E.Harris@kent.ac.uk>
References: <20190504083638.13380-1-S.E.Harris@kent.ac.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 129.12.21.32
X-Mailman-Approved-At: Sat, 04 May 2019 09:20:01 -0400
Subject: [Qemu-devel] [PATCH v1 2/8] target/avr: Add mechanism to check for
 active debugger connection
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: S.E.Harris@kent.ac.uk, mrolnik@gmail.com, A.M.King@kent.ac.uk,
	E.J.C.Robbins@kent.ac.uk
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

AVR CPUs have a BREAK instruction which behaves differently depending on whether debugging is enabled.
Since the hardware fuses that normally control this are difficult to emulate, and the BREAK instruction is useful for testing, the BREAK instruction is instead enabled/disabled depending on whether a GDB session is attached.

Signed-off-by: Sarah Harris <S.E.Harris@kent.ac.uk>
---
 gdbstub.c              | 5 +++++
 include/exec/gdbstub.h | 4 ++++
 2 files changed, 9 insertions(+)

diff --git a/gdbstub.c b/gdbstub.c
index d54abd17cc..a254a364e6 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -1793,6 +1793,11 @@ static int gdb_handle_packet(GDBState *s, const char *line_buf)
     return RS_IDLE;
 }
 
+bool gdb_is_active(void)
+{
+    return gdbserver_state != NULL;
+}
+
 void gdb_set_stop_cpu(CPUState *cpu)
 {
     GDBProcess *p = gdb_get_cpu_process(gdbserver_state, cpu);
diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
index 08363969c1..d059bf5339 100644
--- a/include/exec/gdbstub.h
+++ b/include/exec/gdbstub.h
@@ -45,6 +45,10 @@ void gdb_do_syscall(gdb_syscall_complete_cb cb, const char *fmt, ...);
  */
 void gdb_do_syscallv(gdb_syscall_complete_cb cb, const char *fmt, va_list va);
 int use_gdb_syscalls(void);
+/**
+ * gdb_is_active: return true if debugging in progress
+ */
+bool gdb_is_active(void);
 void gdb_set_stop_cpu(CPUState *cpu);
 void gdb_exit(CPUArchState *, int);
 #ifdef CONFIG_USER_ONLY
-- 
2.21.0


