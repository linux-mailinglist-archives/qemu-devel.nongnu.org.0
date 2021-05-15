Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C86381774
	for <lists+qemu-devel@lfdr.de>; Sat, 15 May 2021 12:07:38 +0200 (CEST)
Received: from localhost ([::1]:51854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhrCr-0000NG-Dy
	for lists+qemu-devel@lfdr.de; Sat, 15 May 2021 06:07:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lhr9C-0005oD-44; Sat, 15 May 2021 06:03:50 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:50901)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lhr99-0006Nw-7j; Sat, 15 May 2021 06:03:49 -0400
Received: from quad ([82.142.31.78]) by mrelayeu.kundenserver.de (mreue109
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1M42fG-1lhr903840-0001SD; Sat, 15
 May 2021 12:03:38 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 01/16] backends/tpm: Replace qemu_mutex_lock calls with
 QEMU_LOCK_GUARD
Date: Sat, 15 May 2021 12:03:20 +0200
Message-Id: <20210515100335.1245468-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210515100335.1245468-1-laurent@vivier.eu>
References: <20210515100335.1245468-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:l0n4loWCAAMXlr7VKXdQWB32zgzCxYvXFgoMRq/QgR6ex8kRq1m
 HAfW4SnT8BtHSH9VQekWX0B3i26c8HgZ0YzGI2VBE+aVXRYkYCXGJxcXB5iUetvoZ7bHwES
 W2e8AHhq1z07goRCOZUcCKjJR05hi0s69KogGzGdJvOJvFBBXFVP1o8kpLOz4lcXLABNO5L
 DLfOM1r1g9oHChYZB7A8g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:lS0tVXeWw+U=:3kPY5v+tfNtSFw9nnEq42U
 JprwrXJ+5c3ZZArrGN8YORTcVJZH9SXQ4CEYzKG3XiMzdoisGshh5bfDh3YeF+P3uKPo/dQuW
 0j/G05ox0miNYcwrMT1WcFdWH6h1aMU0K9ldJiBHL7LZRXw5Kd67RH2Nt0IEJYSpomxBiOhry
 pFSxr1zawT4p+gBOnd8W9VYnMrWWv7Dc4Yzwmi9PgC0t3Jy73dQkA0QM99+g4DuFQRUXJyIl5
 BiRqaJg+Bu1OENG/YCnVkW+YnnhvfxIPt4j2U6KoJBGqYRSkVXYnjvWrx32lJeSQImQBYzbkO
 /PnLWL98mkhOR7wLA3R/ZzuZAqHf9xNP+ZExgJhgc4OStdbu3krWUfuUOxoVhr2zlFzXbEznO
 mtYh70R6VjVsEXMmGrzoujYDFhQo3S3Cy/RSxJHLwtNnEABAepTK3kXuZZ0sZLJLIwNr4aJyM
 oiy3DxyxRPPUJsaAezGkJM9BE1h3bpbU5yzF0cFVp/IA5OIxrBQdKxl/COXODgXdr5MnK8lc4
 I+qwd2j/p6ve/XnJ4A53fs=
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>,
 Christophe de Dinechin <dinechin@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Simplify the tpm_emulator_ctrlcmd() handler by replacing a pair of
qemu_mutex_lock/qemu_mutex_unlock calls by the WITH_QEMU_LOCK_GUARD
macro.

Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
Reviewed-by: Christophe de Dinechin <dinechin@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210512070713.3286188-1-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 backends/tpm/tpm_emulator.c | 34 +++++++++++++++-------------------
 1 file changed, 15 insertions(+), 19 deletions(-)

diff --git a/backends/tpm/tpm_emulator.c b/backends/tpm/tpm_emulator.c
index a012adc19341..e5f1063ab6c3 100644
--- a/backends/tpm/tpm_emulator.c
+++ b/backends/tpm/tpm_emulator.c
@@ -30,6 +30,7 @@
 #include "qemu/error-report.h"
 #include "qemu/module.h"
 #include "qemu/sockets.h"
+#include "qemu/lockable.h"
 #include "io/channel-socket.h"
 #include "sysemu/tpm_backend.h"
 #include "sysemu/tpm_util.h"
@@ -124,31 +125,26 @@ static int tpm_emulator_ctrlcmd(TPMEmulator *tpm, unsigned long cmd, void *msg,
     uint32_t cmd_no = cpu_to_be32(cmd);
     ssize_t n = sizeof(uint32_t) + msg_len_in;
     uint8_t *buf = NULL;
-    int ret = -1;
 
-    qemu_mutex_lock(&tpm->mutex);
+    WITH_QEMU_LOCK_GUARD(&tpm->mutex) {
+        buf = g_alloca(n);
+        memcpy(buf, &cmd_no, sizeof(cmd_no));
+        memcpy(buf + sizeof(cmd_no), msg, msg_len_in);
 
-    buf = g_alloca(n);
-    memcpy(buf, &cmd_no, sizeof(cmd_no));
-    memcpy(buf + sizeof(cmd_no), msg, msg_len_in);
-
-    n = qemu_chr_fe_write_all(dev, buf, n);
-    if (n <= 0) {
-        goto end;
-    }
-
-    if (msg_len_out != 0) {
-        n = qemu_chr_fe_read_all(dev, msg, msg_len_out);
+        n = qemu_chr_fe_write_all(dev, buf, n);
         if (n <= 0) {
-            goto end;
+            return -1;
         }
-    }
 
-    ret = 0;
+        if (msg_len_out != 0) {
+            n = qemu_chr_fe_read_all(dev, msg, msg_len_out);
+            if (n <= 0) {
+                return -1;
+            }
+        }
+    }
 
-end:
-    qemu_mutex_unlock(&tpm->mutex);
-    return ret;
+    return 0;
 }
 
 static int tpm_emulator_unix_tx_bufs(TPMEmulator *tpm_emu,
-- 
2.31.1


