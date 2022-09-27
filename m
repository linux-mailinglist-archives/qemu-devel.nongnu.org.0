Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A95CE5ECB67
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 19:41:48 +0200 (CEST)
Received: from localhost ([::1]:55318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odEaZ-0006Lu-Ew
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 13:41:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1odDv0-0003cs-4Z
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 12:58:53 -0400
Received: from mout.gmx.net ([212.227.17.22]:60283)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1odDus-00046i-Et
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 12:58:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1664297917;
 bh=IeoKusoEzytKlszwB6zEaGGAt+GVGNyVdHhNI4Oiv2Y=;
 h=X-UI-Sender-Class:Date:From:To:Subject;
 b=BH1C+8kOF0r8GYs4dfPEOppnWoHtgs6n1jlBJHt6a7pc+PHux5mkqdj6qWADHocej
 DZoGbdzwqQqTSBYzNiTuCgq5h+4nimAop/NCOjY3KoES7cqVbFmuh+B5ZX7SN7urz0
 O+oGBTBpzSEpqDyg8mANx6SE5gjcoA5WMAgQJXYI=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100 ([92.116.138.255]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M7b6b-1obrOb3jdF-0081M9; Tue, 27
 Sep 2022 18:58:36 +0200
Date: Tue, 27 Sep 2022 18:58:35 +0200
From: Helge Deller <deller@gmx.de>
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org,
 Philippe =?iso-8859-15?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: [PATCH v2] linux-user: Add guest memory layout to exception dump
Message-ID: <YzMru6y+v5bbsTRn@p100>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:SJx2geeWlxPkCu4a/P7JfyewxBpO/CnQnAZ/82MHWE2b/PTomKy
 vKan6+WBBCYgKOPJAQHWFXQGPIYhcsGDfhHBC1zE3c0lK//zfcpV9/+3+UA0K4XDq51yTaX
 bDn4vJbjaVsS6WoJOzaIsx0/r3tUPoCLLWQyhuS3x93H7xWpQDJlPtNNWMotsUvOfsJl27j
 MqKE9BpYhLqQaZhYcEF9w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:R0s9KLaJzb4=:WZGK0dN6QxCWGMHOrCaWX4
 zWSlAvixBgbl4r+w63qnUKPMtCormTh7Z+gknVmR25d+I58IumP4RKIrxxFdXU/EqC+cpj0iw
 DFBCSKcXvHjpsHWgYxaPDjsB/V9Ry1LN43ONvhcXZMMaO6Kabf2PMwycAETeyVarPXSgCegvb
 icEsp1O6QMSgc7OLroZl52j76y84cWHFFi2mqy+VDaw6G0b/1ymBbhmXwrG3TkTri0vVEqeRm
 tCiaTlQd5tAW+4kXEps1blhLCXbtlXnoya8StKhgYC2SPnHGUbBNT1W/PCbr8RbZWUKx8ByRj
 KFDIBuQ9B4i0vSUhOBn0kYdOIGWwTt2YHTr4MuHawaKonAOswvZ0/dif6jhYtyoA6uqiDbMbn
 QnmgegCRN16O2tKYj7Wco+pvMCme+XokRqvYFHbf1BbJMq5HNqRbS00nRgjuh4MtypXbM3FEa
 bsvZ5M8oJ28qLOSHBgXup/l2G9N6EVDS1fXfpL45G7z2SItT6CU5eog3x6o06tdulReHYe2wl
 pOO+mDncQUsRRPRtjWfASIXdBDEwya9m1FaznyrN4D0Gt7Y8go6psrnBsaBMvKo1H9Z5oycS1
 Tzo4Z/bBEiD0Ky3r/H/tF2RSCmqCTcfdetoUzriPwqTDXE/Wmk7AxVH1XGSO3STvIPz1D6Le4
 Hh/2BrZ9J43vcpTmC8Z7SeJwhLClXJkQ5JYL+GowYy6euQcT11Jkdk8X/KjVj9rDD04z4W8gr
 fEDLEmuV7pPov6G8S6W6FduLFRdcagl3WJFhcVqQSztonjmWd3H/zElu5r3b3J4qhtgOGLq07
 990ZiQLk87cDfnzu9RwRG6V0NfKW1l93UJRq54RD2msqgiwLzRfPQIVT86IcyET61HRpCwoEP
 cMMpGOSKDWyxXHwRsJMopBQWPnbX7Fvr+dUJ8UTWidkyE84WY6Wbdtst5m7yhqs4zaSrx/Ved
 HvFc5MMyKxbGfxyCnB+2BWa7D6ns3vKZeH8VxB1AzTJ/Q4H/ddn8xSmPdFE+GFvcHEQal1eXH
 90HmVYPZliUNxN/3r06CqnBSXRnGYXiECHASt4ubc3St2k8D4ePiXK1pyvPtR3Bq41OexWMGf
 GZRpdUDM0NGi8olBxs8ex2wZ3/gU0Rs33or7gsOIgTzhP5ColDNkTERFfB6BG+G/RvznMgbTA
 VOmjTnnoEEsud8FtLYSFrOXawD
Received-SPF: pass client-ip=212.227.17.22; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_BL=0.001, RCVD_IN_MSPIKE_ZBI=0.001, SPF_HELO_NONE=0.001,
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

This patch takes another approach by re-defining EXCP_DUMP() to call
target_exception_dump(), which is in syscall.c, consolidates the log
print functions and allows to add the call to dump the memory layout.

Beside a reduced code footprint, this approach keeps the changes across
the various callers minimal, and keeps EXCP_DUMP() highlighted as
important macro/function.

Signed-off-by: Helge Deller <deller@gmx.de>

=2D--

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

