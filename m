Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3AE65F2E7
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 18:38:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDTL6-00071q-DH; Thu, 05 Jan 2023 11:43:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pDTL4-0006zv-89
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 11:43:34 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pDTKv-0006yF-Pk
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 11:43:33 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 g25-20020a7bc4d9000000b003d97c8d4941so1728691wmk.4
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 08:43:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TLd5g4iuKDGI8GqVRVcMJw8OLSB9d+X+S79K8IqAr5U=;
 b=JZlF4xVL0DZbE6YHARHBXTfNzEGQ9egipQL7UtCEXYMOJy3s3cypJ4/+X1vQF6VFsf
 uvSGF/knRwbiqqrONbLExgxItcYrF5J9exNorp2I+zPJVKqPGVPnW5YaStlaSkYTH0qZ
 tqpRmZClp1dFVgzaxyZoAsLJC+hI4O92GEkH/LLpIDpvj1k95lRltJlCkDS+3akluKXA
 Ln6Tae1r49pgl5pNYADVbdkPBqBfpREogEKiiLew7AOOVGGHB/f/M5vltJiIPZYN+O5n
 aWVX7bdc0VrQ0O5lcRec/6aCwalY7bPF9NKMm1AcEcuPgRxYaxNCCRnr3AUPc/uZiv6+
 roBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TLd5g4iuKDGI8GqVRVcMJw8OLSB9d+X+S79K8IqAr5U=;
 b=sTMouvOcZovMY3Pb5L/rFT1DPLtryZj1j/2R2nEHl3p9+r31AgCS0HLb9li2kDI2k3
 3LYLKOiHHGAOZt/RS7E7OV4hpWKojUYIcRXSXpmkNG8CRhBFChC4jDwraJDG0bjREu3Q
 cKfJnCYx2piIzDwkI5lFyJDWOpKFbXlHNK8/QWSEE3p8MWOGpOW/TuHdHPoxDOSy4orl
 i7JeXUWvjZjPtknd54VBR/OEpn3GIQnWK5YVcBPgM9WIQS9uQDqbjloo+7YHyyHOBL2n
 y/EbQaJGiGxKkhFKWCvEKRQnAlBcldgnaguTrFUhYwjJJX7gnv9oBI4w3L/FtmBcnyrC
 O9qg==
X-Gm-Message-State: AFqh2koajHJGwFP5uOtUI8+PD/5hyS76XHUOLDH8wdH+XvaBpH5cgd6a
 i9x3eJg9AqUZSWiQjIXLtTmCjw==
X-Google-Smtp-Source: AMrXdXsTlU/bRGIynypzbXG7MH8Y1EOYPrWGduxJOPuPlM3Ms+abtx+J2VQ8kmewlIbIu21/QV70Rg==
X-Received: by 2002:a05:600c:3b87:b0:3d2:813:138a with SMTP id
 n7-20020a05600c3b8700b003d20813138amr40251224wms.35.1672937004490; 
 Thu, 05 Jan 2023 08:43:24 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 p12-20020a05600c358c00b003d237d60318sm3423082wmq.2.2023.01.05.08.43.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 08:43:22 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B93A31FFBE;
 Thu,  5 Jan 2023 16:43:20 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org,
	alex.bennee@gmail.com
Cc: David Hildenbrand <david@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Michael Rolnik <mrolnik@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Greg Kurz <groug@kaod.org>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, qemu-ppc@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Max Filippov <jcmvbkbc@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Marek Vasut <marex@denx.de>,
 Stafford Horne <shorne@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Taylor Simpson <tsimpson@quicinc.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Chris Wulff <crwulff@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Song Gao <gaosong@loongson.cn>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bin Meng <bin.meng@windriver.com>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-arm@nongnu.org
Subject: [PATCH v2 06/21] gdbstub: move GDBState to shared internals header
Date: Thu,  5 Jan 2023 16:43:05 +0000
Message-Id: <20230105164320.2164095-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230105164320.2164095-1-alex.bennee@linaro.org>
References: <20230105164320.2164095-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

We are about to split softmmu and user mode helpers into different
files. To facilitate this we will need to share access to the GDBState
between those files.

To keep building we have to temporarily define CONFIG_USER_ONLY just
before we include internals.h for the user-mode side of things. This
will get removed once the state is fully moved.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 gdbstub/internals.h | 69 +++++++++++++++++++++++++++++++++++++++++++++
 gdbstub/gdbstub.c   | 60 ---------------------------------------
 gdbstub/softmmu.c   |  2 ++
 gdbstub/user.c      |  2 ++
 4 files changed, 73 insertions(+), 60 deletions(-)

diff --git a/gdbstub/internals.h b/gdbstub/internals.h
index b444f24ef5..9784db2dc5 100644
--- a/gdbstub/internals.h
+++ b/gdbstub/internals.h
@@ -9,6 +9,75 @@
 #ifndef GDBSTUB_INTERNALS_H
 #define GDBSTUB_INTERNALS_H
 
+#define MAX_PACKET_LENGTH 4096
+
+/*
+ * Shared structures and definitions
+ */
+
+typedef struct GDBProcess {
+    uint32_t pid;
+    bool attached;
+
+    char target_xml[1024];
+} GDBProcess;
+
+enum RSState {
+    RS_INACTIVE,
+    RS_IDLE,
+    RS_GETLINE,
+    RS_GETLINE_ESC,
+    RS_GETLINE_RLE,
+    RS_CHKSUM1,
+    RS_CHKSUM2,
+};
+
+/* Temporary home */
+#ifdef CONFIG_USER_ONLY
+typedef struct {
+    int fd;
+    char *socket_path;
+    int running_state;
+} GDBUserState;
+#else
+typedef struct {
+    CharBackend chr;
+    Chardev *mon_chr;
+} GDBSystemState;
+#endif
+
+typedef struct GDBState {
+    bool init;       /* have we been initialised? */
+    CPUState *c_cpu; /* current CPU for step/continue ops */
+    CPUState *g_cpu; /* current CPU for other ops */
+    CPUState *query_cpu; /* for q{f|s}ThreadInfo */
+    enum RSState state; /* parsing state */
+    char line_buf[MAX_PACKET_LENGTH];
+    int line_buf_index;
+    int line_sum; /* running checksum */
+    int line_csum; /* checksum at the end of the packet */
+    GByteArray *last_packet;
+    int signal;
+#ifdef CONFIG_USER_ONLY
+    GDBUserState user;
+#else
+    GDBSystemState system;
+#endif
+    bool multiprocess;
+    GDBProcess *processes;
+    int process_num;
+    char syscall_buf[256];
+    gdb_syscall_complete_cb current_syscall_cb;
+    GString *str_buf;
+    GByteArray *mem_buf;
+    int sstep_flags;
+    int supported_sstep_flags;
+} GDBState;
+
+/*
+ * Break/Watch point support - there is an implementation for softmmu
+ * and user mode.
+ */
 bool gdb_supports_guest_debug(void);
 int gdb_breakpoint_insert(CPUState *cs, int type, hwaddr addr, hwaddr len);
 int gdb_breakpoint_remove(CPUState *cs, int type, hwaddr addr, hwaddr len);
diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index 42ae13b344..505beafad7 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -41,8 +41,6 @@
 #include "hw/boards.h"
 #endif
 
-#define MAX_PACKET_LENGTH 4096
-
 #include "qemu/sockets.h"
 #include "sysemu/hw_accel.h"
 #include "sysemu/runstate.h"
@@ -326,64 +324,6 @@ typedef struct GDBRegisterState {
     struct GDBRegisterState *next;
 } GDBRegisterState;
 
-typedef struct GDBProcess {
-    uint32_t pid;
-    bool attached;
-
-    char target_xml[1024];
-} GDBProcess;
-
-enum RSState {
-    RS_INACTIVE,
-    RS_IDLE,
-    RS_GETLINE,
-    RS_GETLINE_ESC,
-    RS_GETLINE_RLE,
-    RS_CHKSUM1,
-    RS_CHKSUM2,
-};
-
-#ifdef CONFIG_USER_ONLY
-typedef struct {
-    int fd;
-    char *socket_path;
-    int running_state;
-} GDBUserState;
-#else
-typedef struct {
-    CharBackend chr;
-    Chardev *mon_chr;
-} GDBSystemState;
-#endif
-
-typedef struct GDBState {
-    bool init;       /* have we been initialised? */
-    CPUState *c_cpu; /* current CPU for step/continue ops */
-    CPUState *g_cpu; /* current CPU for other ops */
-    CPUState *query_cpu; /* for q{f|s}ThreadInfo */
-    enum RSState state; /* parsing state */
-    char line_buf[MAX_PACKET_LENGTH];
-    int line_buf_index;
-    int line_sum; /* running checksum */
-    int line_csum; /* checksum at the end of the packet */
-    GByteArray *last_packet;
-    int signal;
-#ifdef CONFIG_USER_ONLY
-    GDBUserState user;
-#else
-    GDBSystemState system;
-#endif
-    bool multiprocess;
-    GDBProcess *processes;
-    int process_num;
-    char syscall_buf[256];
-    gdb_syscall_complete_cb current_syscall_cb;
-    GString *str_buf;
-    GByteArray *mem_buf;
-    int sstep_flags;
-    int supported_sstep_flags;
-} GDBState;
-
 static GDBState gdbserver_state;
 
 static void init_gdbserver_state(void)
diff --git a/gdbstub/softmmu.c b/gdbstub/softmmu.c
index 183dfb40e4..696894243b 100644
--- a/gdbstub/softmmu.c
+++ b/gdbstub/softmmu.c
@@ -14,6 +14,8 @@
 #include "exec/gdbstub.h"
 #include "exec/hwaddr.h"
 #include "sysemu/cpus.h"
+#include "chardev/char.h"
+#include "chardev/char-fe.h"
 #include "internals.h"
 
 bool gdb_supports_guest_debug(void)
diff --git a/gdbstub/user.c b/gdbstub/user.c
index a5f370bcf9..4c2b41eefa 100644
--- a/gdbstub/user.c
+++ b/gdbstub/user.c
@@ -13,6 +13,8 @@
 #include "exec/hwaddr.h"
 #include "exec/gdbstub.h"
 #include "hw/core/cpu.h"
+/* temp hack */
+#define CONFIG_USER_ONLY 1
 #include "internals.h"
 
 bool gdb_supports_guest_debug(void)
-- 
2.34.1


