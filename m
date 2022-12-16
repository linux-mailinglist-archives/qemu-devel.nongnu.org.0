Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E02C64EA45
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 12:24:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p68nA-00023Z-7J; Fri, 16 Dec 2022 06:22:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p68n7-00022H-Jr
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 06:22:13 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p68n5-00067p-Ox
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 06:22:13 -0500
Received: by mail-wr1-x435.google.com with SMTP id h12so2139262wrv.10
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 03:22:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=82WvPkb7AS72H/SR2TFZc7iBeZJJjIKUngbd6FjrBjM=;
 b=MQPzy9zoCX2J08DHzsUEzEXjEzA1n1GqPtNwWhnNN/Bcq8YqlAimwap0vs5ToKnP91
 IrWZUukpkLzoxLs2rIVraKbBMCyJz3AmmLNtwWrePx9t8Rse3pZSmNOX7cwTN8H7S7hm
 0eTzLkyR5feWSjIj6Ctns/CusEECY+WR7JqTjzwFLa6jLCv5N0j9jzaAipRh0RXk9abU
 aGSH1S6zi0CKpE3t/+TaSvnR3Y49seTaLDyEZkmjHLPZd8hQNQwQPyoYRCw3rcG7u9Tf
 8ntGq6SEURQpCvvviK76ilpKIYDCVfBChP94upBr4aMFe04OLPVIkLh4Fpy3OxThB3Qp
 FD5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=82WvPkb7AS72H/SR2TFZc7iBeZJJjIKUngbd6FjrBjM=;
 b=SHraNYatK6Xqz31wUxM4hk5C18ghGtsFHHkVIqB/6RLW1IUwWlaM6WInqqO/BdeukM
 x1Y62wJ54obaYwDCJYD5P7jawQvLhOHjmy41LSvhpkH1avcEg/rWzLqfFzfV76S6jCsY
 Ki7hs03WvMe9vGkd0mjcNcPV4Wl37WRNp+JBCXxyLQf8G9RcBJ8Y/Bloprtj+0+S6082
 FT8qrQqLy1jM5RIPCIt8cMqddlPuE2jPPrNmsVx2aibsuU1Z7F4bF4pGehlmK+TxuFKo
 ooJ3NPfHR7/B5mBqb+bacyI7Igu5j6LwdVQtkB1QFxNCpxIstn+dC3YAf08PDzV8zLOO
 x0Aw==
X-Gm-Message-State: ANoB5plhFOPdiJl5iMXSxpGtTcShhvF6v9HlumuVam6KMCX3FakgbBWi
 0ilvWetlPvlbddVnYViRTGxTng==
X-Google-Smtp-Source: AA0mqf5Rt9r/XOwRAJyvfQrV/nQvzxZqlqwwYWU6RS9dxEQ5olb8JaNSdKOhQJUT+t5h++YoRVzMlQ==
X-Received: by 2002:adf:e708:0:b0:242:728a:fa7 with SMTP id
 c8-20020adfe708000000b00242728a0fa7mr21641873wrm.61.1671189730292; 
 Fri, 16 Dec 2022 03:22:10 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 l9-20020adfa389000000b00241c4bd6c09sm2088552wrb.33.2022.12.16.03.22.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Dec 2022 03:22:09 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 606811FFBD;
 Fri, 16 Dec 2022 11:22:07 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: f4bug@amsat.org, mads@ynddal.dk,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH  v1 05/10] gdbstub: move GDBState to shared internals header
Date: Fri, 16 Dec 2022 11:22:01 +0000
Message-Id: <20221216112206.3171578-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221216112206.3171578-1-alex.bennee@linaro.org>
References: <20221216112206.3171578-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
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

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 gdbstub/internals.h | 53 +++++++++++++++++++++++++++++++++++++++++++++
 gdbstub/gdbstub.c   | 47 ++--------------------------------------
 2 files changed, 55 insertions(+), 45 deletions(-)

diff --git a/gdbstub/internals.h b/gdbstub/internals.h
index b444f24ef5..462a93e41c 100644
--- a/gdbstub/internals.h
+++ b/gdbstub/internals.h
@@ -9,6 +9,59 @@
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
+typedef struct GDBConnection GDBConnection;
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
+    GDBConnection *connection;
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
index 14ce911bf2..bc43aaf825 100644
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
@@ -326,60 +324,19 @@ typedef struct GDBRegisterState {
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
 #ifdef CONFIG_USER_ONLY
-typedef struct {
+typedef struct GDBConnection {
     int fd;
     char *socket_path;
     int running_state;
 } GDBConnection;
 #else
-typedef struct {
+typedef struct GDBConnection {
     CharBackend chr;
     Chardev *mon_chr;
 } GDBConnection;
 #endif
 
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
-    GDBConnection *connection;
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
-- 
2.34.1


