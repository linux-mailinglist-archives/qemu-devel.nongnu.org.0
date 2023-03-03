Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E1A86A8F87
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 04:00:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXvcj-0007Sd-E5; Thu, 02 Mar 2023 21:58:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXvcg-0007Qa-1F
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 21:58:18 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXvcd-0001od-VT
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 21:58:17 -0500
Received: by mail-pl1-x62a.google.com with SMTP id a9so1308359plh.11
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 18:58:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677812293;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=afKJl9J8dwmJwl5uT+DP4MXGN3pCqi29VExi2VZVhL8=;
 b=g3/qSbu6whqbjnjm/Zgt8MiU15NnECCLDiJJjMIkCF/VSOc5/dq5RM5u+5/UIStxMn
 KkCuxY3VlewnU8yHIwNFjoAnQwZ8Q0sRtLJterV47Won0Obe8Kv3VqyBi+OmXGJ0icaH
 0DvEHhPHJNVuEeOnwC2I/Ltg6mjyNwmRBiOHiQ1Hu7we8krjsXt39PFvbR3qHC3qXBH6
 122qZvNpKC6686ozVKaqDfQdQOlaptb6NDqF/qUBXJyM20IKnPriOXVoLfrrQbCSw61b
 H6lrf4ZIYfuwzMlFiqL3UYCdZQNFufegKjTuX3JubpqavOvquKpb1PUFhzGA+7zeFMuS
 272A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677812293;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=afKJl9J8dwmJwl5uT+DP4MXGN3pCqi29VExi2VZVhL8=;
 b=btEmpp1CjE60HQmAqc6bt4HnUJ2q5Q9IeEWfvBZwVdTTOY9Lh/LRPLGHzDxB+vfPsK
 XaMr7zHWrZxtrYKBbjOVhgUyyvcZZohQKel5/c9LU/+nRStQ0H2wEQ774mVDCMmaxpM3
 vX+/xsf0mTSOZXrl+2SOc1HEyYinqrRKjus/XzqfiE2SkZEQf3NsK6i0/1ZyKkFGnc/z
 9Dl5nVsTolrMxeonsN4Sd+TKhIXWzmp4hC1I4SgPIGEhp1G2AFvvBsEzy/FZ4WHPViST
 Ut9UF4UNCnOx56WmWGi9YzOHuzUUouGfkgijbh81ceLZVCvag5tVn0ejZ565AFRqhUQN
 E/HA==
X-Gm-Message-State: AO0yUKUiaange7KMK4O30MnpVneW6cDXWyZlTEobkvtsnv296gYzr797
 OMpflfHwpFzrh9LyNREWH25rxkH1LBZs2n8DES4=
X-Google-Smtp-Source: AK7set9B0TK2eEWC5+yZ9wRSHHtR4O1ShI1LI2au9ljSzNy26XKWtNUKJSnUoj/6zzmCdGK2CiyZUw==
X-Received: by 2002:a17:902:db0b:b0:19e:524a:657 with SMTP id
 m11-20020a170902db0b00b0019e524a0657mr457407plx.56.1677812292624; 
 Thu, 02 Mar 2023 18:58:12 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:f3e6:4626:fbc8:b2ce])
 by smtp.gmail.com with ESMTPSA id
 e4-20020a17090301c400b001992e74d055sm372244plh.12.2023.03.02.18.58.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 18:58:12 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org
Subject: [PATCH v4.5 06/29] gdbstub: move GDBState to shared internals header
Date: Thu,  2 Mar 2023 18:57:42 -0800
Message-Id: <20230303025805.625589-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230303025805.625589-1-richard.henderson@linaro.org>
References: <20230303025805.625589-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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

From: Alex Bennée <alex.bennee@linaro.org>

We are about to split softmmu and user mode helpers into different
files. To facilitate this we will need to share access to the GDBState
between those files.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

Message-Id: <20230302190846.2593720-7-alex.bennee@linaro.org>
---
 gdbstub/internals.h | 50 +++++++++++++++++++++++++++++++++++++++++++++
 gdbstub/gdbstub.c   | 42 -------------------------------------
 2 files changed, 50 insertions(+), 42 deletions(-)

diff --git a/gdbstub/internals.h b/gdbstub/internals.h
index 7df0e11c47..32daaf73a3 100644
--- a/gdbstub/internals.h
+++ b/gdbstub/internals.h
@@ -11,6 +11,56 @@
 
 #include "exec/cpu-common.h"
 
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
 int gdb_breakpoint_insert(CPUState *cs, int type, vaddr addr, vaddr len);
 int gdb_breakpoint_remove(CPUState *cs, int type, vaddr addr, vaddr len);
diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index 1e6f8978b5..ef506faa8e 100644
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
@@ -325,23 +323,6 @@ typedef struct GDBRegisterState {
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
 typedef struct {
     int fd;
@@ -357,29 +338,6 @@ typedef struct {
 static GDBSystemState gdbserver_system_state;
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


