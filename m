Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D68BE60BAFD
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 22:43:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1on3tt-0001sg-E2; Mon, 24 Oct 2022 16:18:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1on3tr-0001sX-9a
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 16:18:19 -0400
Received: from mout.gmx.net ([212.227.15.18])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1on3tp-0001bv-8t
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 16:18:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1666642691;
 bh=FSKgC+VaLRTALd5vJx7/mACbya/ttkJonQ9WwUN+L0Y=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject;
 b=dmtFZmKTySGYcibFduJiyNKpUI8Hb7Pds7BxWWGaDu9O2kogg4FAtJ7rZuwCNPpgl
 NAsWJ3B+2ZbrUhsDaD8NLEyMQ2HN/TAN3jyzQThVrbMy/fTdgTkW91NZBDEfZMl/r7
 4SoktsaPZrhsxBbXhtKGAdQE7KVLk9JA5rQYM1Mo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100 ([92.116.136.30]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MD9X9-1ow6K20fIX-0096V6; Mon, 24
 Oct 2022 22:18:11 +0200
Date: Mon, 24 Oct 2022 22:18:09 +0200
From: Helge Deller <deller@gmx.de>
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org,
 Philippe =?iso-8859-15?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Cc: Helge Deller <deller@gmx.de>
Subject: [PATCH v3] linux-user: Add guest memory layout to exception dump
Message-ID: <Y1bzAWbw07WBKPxw@p100>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:9UWRn0X38Bea6zl5fgioKCfnBXqRpwZUPCjHIDwbGOsmaHNHnDI
 RM8y0gZ9N/0Qgcq9CwrCxPh8ZYJmJEmWhgETUC29Aj103Xx9HLCa1ekRolGr/G+86tVRwYM
 ytttXQB00TSr99rsFKiQfqdEYENs8l8kOHMlNNA1dFfEX31MVq78Jhh65zxIMNmtWOlf87K
 on8i1R1Up6i5SN386neCQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ysYP2VEgQgE=:Wl9hvo5l5cijHNz8ulsI2t
 yz7bVfv9/f12X2g/yNLYLs6WI8RYOKeOibRGwk61Np3wDDOa65V9M6PGpfPLYB5BQnDw9Kd7+
 s2zZzkM+ghLbRLhBOnS1vEVgF4doM7djjNnRUmZbaWWuFtebQ9HM0XNy7ZIBQ1gjJRgcl0KC0
 KSV9o9wfwJxqWGSiBpkWSBRfYXSfchsIgyOhZY3BqjMJ9WgmLFtwoxo28lf93NI8rXZxPaAiv
 W46vD8f0+U8X/KhEzJK19vZVy70V3Nhku1FNTVnxWKWt+CWF/zzQriNWhlxOUTyEpHO0+9mc8
 qNlPJG/BKuScQSe+O4ciPTcTn0hiIT0sngFdrnZpeREDIRadeAEXMNyOSToJR6fdHYydkac4+
 rxDrS2Toay8rFpYi3ELBsXietXMlSiaOJuusC8UVUMFjzoJIp8UXfVMVGDtuKw176FZmpTg0q
 b+YG8XB66DRG5y/MvVlAzWocnfHef4NTklaK2X5CSoZQdVvXivYWYs5n77GM0LtGs2MRgQIND
 bA/JuWC1nZuGdp0GCInmQko5LxB9PgcFVh48/p/lMc4p1EZYd6X2dWL/bTza7VdK7c7MfXYCs
 nyqx56kSoW0cnvCBBpmIeRKHtih0patAEsfqcySxRrNMbe2Zn+9yTrY+MYp2VTNIwETALmIFU
 uSB/bt9zJ1usgTCy/rJwifoGHJU7g8k9jOYEVs7apFMbwd4Oo7pdzvKeno+ZmXFumuRCklARe
 uiJTiG4Qr3cdIjIkOiFG4OLBNDijr0XRb/bOT416f4BtmzgDxIJGLYUp3q8LJjtRk74C1Te/t
 pikLuqxvkjrgJEHMJpeND5SJh+B+b2WArsMO1fYP5Kg2wFhxbgWN3l5FW4Z4h5zYw223sXIzD
 mWz//Y1/phbdkel5R6MXKxkXQGBS7fVZSZNMqxipbmW1Uk2000GYsTDdGxM0GqOZaq2fwzo/c
 /ib/IC3qqIR9FZpcNkvAK6WwfMyqLtcsG4GQM09FCIL/IQye6bDceM20yO+XTMeLnT+720Eq6
 IyYS0RBbMw4dldMCWEharMAVhQie1FkziT5MdA2oOcO+uqHJZKbilypKvCwdLV/HXv9VYHOHZ
 ZlASKItEexP4jnBmody6sM1Bt3+WEaV8SkSBjOOmRox1DSTkLWA+TVM3KRT3zfYzwm8BxyLbT
 dLRsAe0nvzLQMiTkXTwA7YOnqt1cfHKBD0aKl2IA+XqyTMWSRM2OS04F52TbVufM5fdNJpS0X
 D6zsTh86EmquzF6+5IdNygoj3IGr9BV44nvEKMcIGJLc6Ni6enj6F3m5PFgqLF2oWNbs+XcNw
 waAEYqihSO2AFidJl/Ej/Q38aiUeHWNVM7ijndKU8DKLdDpptNFB6KJs+JuGYVVg0vKaOkwgp
 Mq+k0rRPy7Youiurn5VrqaI7GUCNBWbXlA9B3++prx2UE+bkMbWABU/ZdgrenEP1wofqtRFfU
 pzTQUXH4TViH8dwkH9/5iH9paU1rH5w5RmvLKLTgEgWPyLBKAH8BpBlEBXU4xLU+0TdJiLUbW
 zm9S4khRgP5zPYUuEs54zZPjdHc0fSA6znGkWocj3DMXN
Received-SPF: pass client-ip=212.227.15.18; envelope-from=deller@gmx.de;
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

When the emulation stops with a hard exception it's very useful for
debugging purposes to dump the current guest memory layout (for an
example see /proc/self/maps) beside the CPU registers.

The open_self_maps() function provides such a memory dump, but since
it's located in the syscall.c file, various changes (add #includes, make
this function externally visible, ...) are needed to be able to call it
from the existing EXCP_DUMP() macro.

This patch takes another approach by re-defining EXCP_DUMP() to call
target_exception_dump(), which is in syscall.c, consolidates the log
print functions and allows to add the call to dump the memory layout.

Beside a reduced code footprint, this approach keeps the changes across
the various callers minimal, and keeps EXCP_DUMP() highlighted as
important macro/function.

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--

v3:
Fix build error in i386/cpu_loop.c

v2:
Based on feedback by Philippe Mathieu-Daud=E9, renamed the two functions
to excp_dump_file() and target_exception_dump(), and #define'ed
EXCP_DUMP() to target_exception_dump().
I intentionally did not replace all occurences of EXCP_DUMP() by
target_exception_dump() as I think it's unneccesary and not beneficial.
If this is really wished, I will send a v3.


diff --git a/linux-user/cpu_loop-common.h b/linux-user/cpu_loop-common.h
index 36ff5b14f2..e644d2ef90 100644
=2D-- a/linux-user/cpu_loop-common.h
+++ b/linux-user/cpu_loop-common.h
@@ -23,18 +23,9 @@
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
+void target_exception_dump(CPUArchState *env, const char *fmt, int code);
+#define EXCP_DUMP(env, fmt, code) \
+    target_exception_dump(env, fmt, code)

 void target_cpu_copy_regs(CPUArchState *env, struct target_pt_regs *regs)=
;
 #endif
diff --git a/linux-user/i386/cpu_loop.c b/linux-user/i386/cpu_loop.c
index 42837399bc..404f6d6634 100644
=2D-- a/linux-user/i386/cpu_loop.c
+++ b/linux-user/i386/cpu_loop.c
@@ -308,8 +308,8 @@ void cpu_loop(CPUX86State *env)
             break;
         default:
             pc =3D env->segs[R_CS].base + env->eip;
-            EXCP_DUMP(env, "qemu: 0x%08lx: unhandled CPU exception 0x%x -=
 aborting\n",
-                      (long)pc, trapnr);
+            EXCP_DUMP(env, "qemu: unhandled CPU exception 0x%x - aborting=
\n",
+                      trapnr);
             abort();
         }
         process_pending_signals(env);
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 2e954d8dbd..7d29c4c396 100644
=2D-- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -158,6 +158,7 @@
 #include "qapi/error.h"
 #include "fd-trans.h"
 #include "tcg/tcg.h"
+#include "cpu_loop-common.h"

 #ifndef CLONE_IO
 #define CLONE_IO                0x80000000      /* Clone io context */
@@ -8144,6 +8145,33 @@ static int is_proc_myself(const char *filename, con=
st char *entry)
     return 0;
 }

+static void excp_dump_file(FILE *logfile, CPUArchState *env,
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
+void target_exception_dump(CPUArchState *env, const char *fmt, int code)
+{
+    /* dump to console */
+    excp_dump_file(stderr, env, fmt, code);
+
+    /* dump to log file */
+    if (qemu_log_separate()) {
+        FILE *logfile =3D qemu_log_trylock();
+
+        excp_dump_file(logfile, env, fmt, code);
+        qemu_log_unlock(logfile);
+    }
+}
+
 #if HOST_BIG_ENDIAN !=3D TARGET_BIG_ENDIAN || \
     defined(TARGET_SPARC) || defined(TARGET_M68K) || defined(TARGET_HPPA)
 static int is_proc(const char *filename, const char *entry)

