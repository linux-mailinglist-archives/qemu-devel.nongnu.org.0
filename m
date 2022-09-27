Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D865EBF40
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 12:09:24 +0200 (CEST)
Received: from localhost ([::1]:41434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od7Wl-00036p-L3
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 06:09:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1od7Nd-0008Sp-9q
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 05:59:58 -0400
Received: from mout.gmx.net ([212.227.17.20]:33675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1od7NZ-00007E-CN
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 05:59:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1664272790;
 bh=DTb7hZL7p3PaKrsxU9JPh/3YDkManuvypWYjuiwB3+k=;
 h=X-UI-Sender-Class:Date:From:To:Subject;
 b=GB3QfXPtODCLxkYaHOwH+6Q41y1xkjfzzadtesN543KxJcEhj87EqqjzBf+lT0Uuq
 15JbgnI7LffE+s9DguLMO6fzvC7kJPlxFqOEcqQ5wn6PhYLLZ4gqkiooJINSLEX4S1
 lbcskbeRe81zYDiWG+Ia/nTVh3pAro1Z+MfLxaew=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100 ([92.116.138.255]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MO9z7-1osjNv1c7N-00ObB7; Tue, 27
 Sep 2022 11:59:50 +0200
Date: Tue, 27 Sep 2022 11:59:48 +0200
From: Helge Deller <deller@gmx.de>
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
Subject: [PATCH] linux-user: Add guest memory layout to exception dump
Message-ID: <YzLJlENCtqx87DIs@p100>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:wVf8JzjvBHty6mXIRI6lPy9/UJ/A++wmiKIPSUqE80moV3z17Qa
 z8VRRkh2AU6aB5Tmuks8pHYPB9lw3wQUnUm4LXP6XdJAyW1jLQMS9J72eoFFHwbh0nXT4w2
 Swe78Zh15Fo0W9qaiL8ttsHNrtv5ta0SqWoIUom0ggLxVB5vWzG/79ptRiBXiLHXts0BbUh
 UCMqNHB3yC522SVTa84Zw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:sADRP4QZLho=:cnl80o816M7oXSB2349A+5
 Yfo/MZewq8tcb4cdq9Q8ZzX22JOqZrPV05d7d5SREgIc+pVsKW6bYwyBpsfafnaDUts4SNnrm
 wynrfywY0ZTMvw0JQGDLc2bc7gccccA8sbNOn31TKWOv6nLqRZ7+P81CAj0g09dOaNMhLXmbr
 McTUGQ5D9LfksHy37F3keYY2uoOmCy1WU73aZeMiJ+lNqaXLTy1mZilmWLwoZXf2PDNyGde2V
 XcoYGPR6T9ItZ2QaoI1+l2WhIjFLMuIrg0mYG8bRXmbZDxfvoAZIYhl7Jhm+B+43E22Lz0eIK
 dbApZxvC06p+m+Jy4XNauaJ+4OG/iFsBYHAZLwt6NCGM6GhbA1KKYLHp9LaHRaSaNbHDBLJ7k
 sSILbFeLobMCcgq+ZWIle0vnvSb742I1tDybhlt7uuOxYlXMUT2pl0iNSgbpsqT/8ehntgnmI
 ThidD4M4A9WpS1+0D7H3MvTlU9/0FOf0fs9PqD1nhSZg0B4ZOZjhkfKzJtwjmCI0V7d3UWYLs
 spYlaLPKJv2gjVA0jMyQekerY5WGCljiZ7/9JdzliGydV/X17IOhIdlrYL4GijxUATVhtF0CM
 hapIo512OlMtk3FbNK12MdTcPnt767Q1wu8VcOx1n2KoIf5bg0ttEbAmYmOU3uZCnn3lOXDap
 nVHZOGQhhmx0w578Q3gJD0NGFOIPHQws2+LCBTU/6209g1+BA7zZV9A9aBsDkN6R2HRoKvVEL
 Qxsfx3+zOOGDv3RKCv7NI9acJm/u9NTshgCFuA4jZz2QOpSSyBHReTug+cadORrDhsqB4Fq9S
 w8dIXU7KWHexCoJhRMcM+dqoU1aPHAi7TQfDxtT6+ba2VgQ+eqALGkl/JHLgx57U/b7isj97g
 xYDfEGPg1RP3NqPMybgMA4FoTlrp+MSnQJPNIGAAGcFfIHhhg0eENuSsSdbsoCbF0zXYkl6Xi
 ReKFOBycYNt6HoANOD0r8VGXa+nOtpH1MfQM8ct3kpV1Avy6xs3rjpBtA5RI/qXAxoSFUVv9s
 CrChjulFvhdLB0gqQaiGZMQZmAyVA1MMcNeDZ/HkbIhKtPZKaV7v045GVaDSKPcd0g3dR/0Bw
 D47iVqJuKzrL2+fOwtpmki/D3yx+xIxEX+miydUKJh6/kstMeBPkKmNmbIxdo/kxuBWgSUaL4
 DMxJXMBa8BMlyVpKk8KbW984zJ
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=212.227.17.20; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

When the emulation stops with a hard exception it's very useful for
debugging purposes to dump the current guest memory layout (for an
example see /proc/self/maps) beside the CPU registers.

The open_self_maps() function provides such a memory dump, but since
it's located in the syscall.c file, various changes (add #includes, make
this function externally visible, ...) are needed to be able to call it
from the existing EXCP_DUMP() macro.

This patch takes another approach by un-macronizing EXCP_DUMP() and turn
it into a function located in syscall.c.
Beside a reduced code footprint, this approach allows to add the memory
dump and simplify the code to print to console and log file.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/linux-user/cpu_loop-common.h b/linux-user/cpu_loop-common.h
index 36ff5b14f2..0b26b56915 100644
=2D-- a/linux-user/cpu_loop-common.h
+++ b/linux-user/cpu_loop-common.h
@@ -23,18 +23,7 @@
 #include "exec/log.h"
 #include "special-errno.h"

-#define EXCP_DUMP(env, fmt, ...)                                        \
-do {                                                                    \
-    CPUState *cs =3D env_cpu(env);                                       =
 \
-    fprintf(stderr, fmt , ## __VA_ARGS__);                              \
-    fprintf(stderr, "Failing executable: %s\n", exec_path);             \
-    cpu_dump_state(cs, stderr, 0);                                      \
-    if (qemu_log_separate()) {                                          \
-        qemu_log(fmt, ## __VA_ARGS__);                                  \
-        qemu_log("Failing executable: %s\n", exec_path);                \
-        log_cpu_state(cs, 0);                                           \
-    }                                                                   \
-} while (0)
+void EXCP_DUMP(CPUArchState *env, const char *fmt, int code);

 void target_cpu_copy_regs(CPUArchState *env, struct target_pt_regs *regs)=
;
 #endif
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index d17f5d1c66..00861e9351 100644
=2D-- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -158,6 +158,7 @@
 #include "qapi/error.h"
 #include "fd-trans.h"
 #include "tcg/tcg.h"
+#include "cpu_loop-common.h"

 #ifndef CLONE_IO
 #define CLONE_IO                0x80000000      /* Clone io context */
@@ -8177,6 +8178,33 @@ static int is_proc_myself(const char *filename, con=
st char *entry)
     return 0;
 }

+static void excp_dump(FILE *logfile, CPUArchState *env,
+                      const char *fmt, int code)
+{
+    if (logfile) {
+        CPUState *cs =3D env_cpu(env);
+
+        fprintf(logfile, fmt, code);
+        fprintf(logfile, "Failing executable: %s\n", exec_path);
+        cpu_dump_state(cs, logfile, 0);
+        open_self_maps(env, fileno(logfile));
+    }
+}
+
+void EXCP_DUMP(CPUArchState *env, const char *fmt, int code)
+{
+    /* dump to console */
+    excp_dump(stderr, env, fmt, code);
+
+    /* dump to log file */
+    if (qemu_log_separate()) {
+        FILE *logfile =3D qemu_log_trylock();
+
+        excp_dump(logfile, env, fmt, code);
+        qemu_log_unlock(logfile);
+    }
+}
+
 #if HOST_BIG_ENDIAN !=3D TARGET_BIG_ENDIAN || \
     defined(TARGET_SPARC) || defined(TARGET_M68K) || defined(TARGET_HPPA)
 static int is_proc(const char *filename, const char *entry)

