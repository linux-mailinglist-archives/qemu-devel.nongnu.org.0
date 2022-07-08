Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B239D56BD1E
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 18:02:15 +0200 (CEST)
Received: from localhost ([::1]:54486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9qQo-0003yz-Fg
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 12:02:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9qCy-0005hs-HP
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 11:47:57 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:33592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9qCv-0002VG-JW
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 11:47:56 -0400
Received: by mail-pg1-x531.google.com with SMTP id 72so1177528pge.0
 for <qemu-devel@nongnu.org>; Fri, 08 Jul 2022 08:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Wwg5T7n5d4hEzm3DL2nMuno/i3EhmUsngOLpxo3zUx0=;
 b=YedpQGh97aaq2xTLJzikAZNr+edJLKplkc7dv2TTfR2VfCxO5ghAEFVny5JGu8UDVJ
 JEI6iL/Hy+w53gkBGIw3nSLnw0eqanltg4X3YW704In310Ss3TS4RCyBxQU9h5Pgk8Xu
 QR9wgapEkRN6l6LckDG0F1uBTumAqV4Nc+WcJiqbPVmRtmWD9ok6Baa7XKnrqvPFDpj6
 EQnTIj9uwYyOlMYVRVFcu1uiiXP8h8FQZQv35Rwet1zA3duKnv7Hae7QQtQBTpxliBzM
 a9xB03GbpzwCEl146BPw8njZbKp65dtXvgDb6MDhKO/+BGu1biGqMmN1gcz6Ks/+ksGR
 eomQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Wwg5T7n5d4hEzm3DL2nMuno/i3EhmUsngOLpxo3zUx0=;
 b=dJcYL/Rsdd/s2QMlqIQ/tUNseXnzoPjbrhYVONncYX941oO5gyENMJYpRL5+GcfuGD
 4dk9fF1nt4JohSRv5SsENk7pO6jiaismV/w8u2JK6r4nyVjVxQNQgcBmFj0WFBJD/Elc
 7dOcb1/yxuf96fs8HAstn6iwwCnynH9qemtClweRDGGzYiZvXOcDeDQpFiGjQyEA9+/x
 M0HwpZNS2f0KYwxRsh4CAU5RZn5Ffr2x9QAyjyK+gWY7Zc8XI+svwyJktmyJ2AsDfe0k
 COAxXB8o3GFEEJK82X8GVkow2oWt2GJQTL77T+Y3M+2iUCFnk95Cx9C+xrDnuIQQfbl3
 5sCw==
X-Gm-Message-State: AJIora8ZLpm/Ns5l6sF9hwMeaxUOKfpoJIrsTzeLl2YTlV8wKRXb8WIp
 GoL/dyXURG2iQmX7MpzVkSFaiKU6aSernAHy
X-Google-Smtp-Source: AGRyM1te3He79lySUh4Sk53VnBxc4hrnz2SYUFvSSsX8VSYWuc/z+7WGOgSjR0e57hO+SRrKgWr5TA==
X-Received: by 2002:a05:6a00:22d6:b0:525:74b3:d020 with SMTP id
 f22-20020a056a0022d600b0052574b3d020mr4543389pfj.80.1657295272144; 
 Fri, 08 Jul 2022 08:47:52 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 y3-20020a17090a390300b001ef81bac701sm1782089pjb.42.2022.07.08.08.47.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 08:47:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [RISU PATCH v4 14/29] Merge reginfo.c into risu.c
Date: Fri,  8 Jul 2022 21:16:45 +0530
Message-Id: <20220708154700.18682-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220708154700.18682-1-richard.henderson@linaro.org>
References: <20220708154700.18682-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

The distinction between the two is artificial.  Following
patches will rearrange the functions involved to make it
easier for dumping of the trace file.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 Makefile  |   2 +-
 risu.h    |  28 +---------
 reginfo.c | 151 ------------------------------------------------------
 risu.c    | 129 ++++++++++++++++++++++++++++++++++++++++++++--
 4 files changed, 126 insertions(+), 184 deletions(-)
 delete mode 100644 reginfo.c

diff --git a/Makefile b/Makefile
index 6ab014a..ad7f879 100644
--- a/Makefile
+++ b/Makefile
@@ -20,7 +20,7 @@ CFLAGS ?= -g
 ALL_CFLAGS = -Wall -D_GNU_SOURCE -DARCH=$(ARCH) -U$(ARCH) $(BUILD_INC) $(CFLAGS) $(EXTRA_CFLAGS)
 
 PROG=risu
-SRCS=risu.c comms.c reginfo.c risu_$(ARCH).c risu_reginfo_$(ARCH).c
+SRCS=risu.c comms.c risu_$(ARCH).c risu_reginfo_$(ARCH).c
 HDRS=risu.h risu_reginfo_$(ARCH).h
 BINS=test_$(ARCH).bin
 
diff --git a/risu.h b/risu.h
index 77d6128..dd9fda5 100644
--- a/risu.h
+++ b/risu.h
@@ -35,7 +35,6 @@ void process_arch_opt(int opt, const char *arg);
 #include REGINFO_HEADER(ARCH)
 
 extern uintptr_t image_start_address;
-extern void *memblock;
 
 /* Ops code under test can request from risu: */
 typedef enum {
@@ -83,34 +82,9 @@ void send_response_byte(int sock, int resp);
 
 /* Functions operating on reginfo */
 
-/* Function prototypes for read/write helper functions. */
-RisuResult write_buffer(void *ptr, size_t bytes);
-RisuResult read_buffer(void *ptr, size_t bytes);
-void respond(RisuResult response);
-
-/*
- * Send the register information from the struct ucontext down the socket.
- * NB: called from a signal handler.
- */
-RisuResult send_register_info(void *uc);
-
-/*
- * Read register info from the socket and compare it with that from the
- * ucontext.
- * NB: called from a signal handler.
- */
-RisuResult recv_and_compare_register_info(void *uc);
-
-/*
- * Print a useful report on the status of the last reg comparison
- * done in recv_and_compare_register_info().
- */
-void report_mismatch_reg(void);
-
 /* Interface provided by CPU-specific code: */
 
-/* Move the PC past this faulting insn by adjusting ucontext
- */
+/* Move the PC past this faulting insn by adjusting ucontext. */
 void advance_pc(void *uc);
 
 /* Set the parameter register in a ucontext_t to the specified value.
diff --git a/reginfo.c b/reginfo.c
deleted file mode 100644
index a007f16..0000000
--- a/reginfo.c
+++ /dev/null
@@ -1,151 +0,0 @@
-/******************************************************************************
- * Copyright (c) 2017 Linaro Limited
- * All rights reserved. This program and the accompanying materials
- * are made available under the terms of the Eclipse Public License v1.0
- * which accompanies this distribution, and is available at
- * http://www.eclipse.org/legal/epl-v10.html
- *
- * Contributors:
- *     Peter Maydell (Linaro) - initial implementation
- *****************************************************************************/
-
-#include <stdio.h>
-#include <string.h>
-#include <stdlib.h>
-#include "risu.h"
-
-static struct reginfo master_ri, apprentice_ri;
-static uint8_t master_memblock[MEMBLOCKLEN];
-
-RisuResult send_register_info(void *uc)
-{
-    struct reginfo ri;
-    trace_header_t header;
-    RisuResult res;
-    RisuOp op;
-
-    reginfo_init(&ri, uc);
-    op = get_risuop(&ri);
-
-    /* Write a header with PC/op to keep in sync */
-    header.pc = get_pc(&ri);
-    header.risu_op = op;
-    res = write_buffer(&header, sizeof(header));
-    if (res != RES_OK) {
-        return res;
-    }
-
-    switch (op) {
-    case OP_COMPARE:
-    case OP_TESTEND:
-    case OP_SIGILL:
-        /*
-         * Do a simple register compare on (a) explicit request
-         * (b) end of test (c) a non-risuop UNDEF
-         */
-        res = write_buffer(&ri, reginfo_size());
-        /* For OP_TEST_END, force exit. */
-        if (res == RES_OK && op == OP_TESTEND) {
-            res = RES_END;
-        }
-        break;
-    case OP_SETMEMBLOCK:
-        memblock = (void *)(uintptr_t)get_reginfo_paramreg(&ri);
-        break;
-    case OP_GETMEMBLOCK:
-        set_ucontext_paramreg(uc,
-                              get_reginfo_paramreg(&ri) + (uintptr_t)memblock);
-        break;
-    case OP_COMPAREMEM:
-        return write_buffer(memblock, MEMBLOCKLEN);
-    default:
-        abort();
-    }
-    return res;
-}
-
-/* Read register info from the socket and compare it with that from the
- * ucontext. Return 0 for match, 1 for end-of-test, 2 for mismatch.
- * NB: called from a signal handler.
- *
- * We don't have any kind of identifying info in the incoming data
- * that says whether it is register or memory data, so if the two
- * sides get out of sync then we will fail obscurely.
- */
-RisuResult recv_and_compare_register_info(void *uc)
-{
-    RisuResult res;
-    trace_header_t header;
-    RisuOp op;
-
-    reginfo_init(&apprentice_ri, uc);
-    op = get_risuop(&apprentice_ri);
-
-    res = read_buffer(&header, sizeof(header));
-    if (res != RES_OK) {
-        return res;
-    }
-
-    if (header.risu_op != op) {
-        /* We are out of sync.  Tell master to exit. */
-        respond(RES_END);
-        return RES_BAD_IO;
-    }
-
-    /* send OK for the header */
-    respond(RES_OK);
-
-    switch (op) {
-    case OP_COMPARE:
-    case OP_TESTEND:
-    case OP_SIGILL:
-        /* Do a simple register compare on (a) explicit request
-         * (b) end of test (c) a non-risuop UNDEF
-         */
-        res = read_buffer(&master_ri, reginfo_size());
-        if (res != RES_OK) {
-            /* fail */
-        } else if (!reginfo_is_eq(&master_ri, &apprentice_ri)) {
-            /* register mismatch */
-            res = RES_MISMATCH_REG;
-        } else if (op == OP_TESTEND) {
-            res = RES_END;
-        }
-        respond(res == RES_OK ? RES_OK : RES_END);
-        break;
-    case OP_SETMEMBLOCK:
-        memblock = (void *)(uintptr_t)get_reginfo_paramreg(&apprentice_ri);
-        break;
-    case OP_GETMEMBLOCK:
-        set_ucontext_paramreg(uc, get_reginfo_paramreg(&apprentice_ri) +
-                              (uintptr_t)memblock);
-        break;
-    case OP_COMPAREMEM:
-        res = read_buffer(master_memblock, MEMBLOCKLEN);
-        if (res != RES_OK) {
-            /* fail */
-        } else if (memcmp(memblock, master_memblock, MEMBLOCKLEN) != 0) {
-            /* memory mismatch */
-            res = RES_MISMATCH_MEM;
-        }
-        respond(res == RES_OK ? RES_OK : RES_END);
-        break;
-    default:
-        abort();
-    }
-
-    return res;
-}
-
-/*
- * Print a useful report on the status of the last reg comparison
- * done in recv_and_compare_register_info().
- */
-void report_mismatch_reg(void)
-{
-    fprintf(stderr, "master reginfo:\n");
-    reginfo_dump(&master_ri, stderr);
-    fprintf(stderr, "apprentice reginfo:\n");
-    reginfo_dump(&apprentice_ri, stderr);
-    reginfo_dump_mismatch(&master_ri, &apprentice_ri, stderr);
-}
diff --git a/risu.c b/risu.c
index d6c2deb..a0e20d5 100644
--- a/risu.c
+++ b/risu.c
@@ -28,7 +28,10 @@
 #include "config.h"
 #include "risu.h"
 
-void *memblock;
+static void *memblock;
+static struct reginfo master_ri, apprentice_ri;
+static uint8_t master_memblock[MEMBLOCKLEN];
+
 
 static int comm_fd;
 static bool trace;
@@ -48,7 +51,7 @@ static sigjmp_buf jmpbuf;
 
 /* I/O functions */
 
-RisuResult read_buffer(void *ptr, size_t bytes)
+static RisuResult read_buffer(void *ptr, size_t bytes)
 {
     size_t res;
 
@@ -69,7 +72,7 @@ RisuResult read_buffer(void *ptr, size_t bytes)
     return res == bytes ? RES_OK : RES_BAD_IO;
 }
 
-RisuResult write_buffer(void *ptr, size_t bytes)
+static RisuResult write_buffer(void *ptr, size_t bytes)
 {
     size_t res;
 
@@ -90,13 +93,60 @@ RisuResult write_buffer(void *ptr, size_t bytes)
     return res == bytes ? RES_OK : RES_BAD_IO;
 }
 
-void respond(RisuResult r)
+static void respond(RisuResult r)
 {
     if (!trace) {
         send_response_byte(comm_fd, r);
     }
 }
 
+static RisuResult send_register_info(void *uc)
+{
+    struct reginfo ri;
+    trace_header_t header;
+    RisuResult res;
+    RisuOp op;
+
+    reginfo_init(&ri, uc);
+    op = get_risuop(&ri);
+
+    /* Write a header with PC/op to keep in sync */
+    header.pc = get_pc(&ri);
+    header.risu_op = op;
+    res = write_buffer(&header, sizeof(header));
+    if (res != RES_OK) {
+        return res;
+    }
+
+    switch (op) {
+    case OP_COMPARE:
+    case OP_TESTEND:
+    case OP_SIGILL:
+        /*
+         * Do a simple register compare on (a) explicit request
+         * (b) end of test (c) a non-risuop UNDEF
+         */
+        res = write_buffer(&ri, reginfo_size());
+        /* For OP_TEST_END, force exit. */
+        if (res == RES_OK && op == OP_TESTEND) {
+            res = RES_END;
+        }
+        break;
+    case OP_SETMEMBLOCK:
+        memblock = (void *)(uintptr_t)get_reginfo_paramreg(&ri);
+        break;
+    case OP_GETMEMBLOCK:
+        set_ucontext_paramreg(uc,
+                              get_reginfo_paramreg(&ri) + (uintptr_t)memblock);
+        break;
+    case OP_COMPAREMEM:
+        return write_buffer(memblock, MEMBLOCKLEN);
+    default:
+        abort();
+    }
+    return res;
+}
+
 static void master_sigill(int sig, siginfo_t *si, void *uc)
 {
     RisuResult r;
@@ -110,6 +160,71 @@ static void master_sigill(int sig, siginfo_t *si, void *uc)
     }
 }
 
+static RisuResult recv_and_compare_register_info(void *uc)
+{
+    RisuResult res;
+    trace_header_t header;
+    RisuOp op;
+
+    reginfo_init(&apprentice_ri, uc);
+    op = get_risuop(&apprentice_ri);
+
+    res = read_buffer(&header, sizeof(header));
+    if (res != RES_OK) {
+        return res;
+    }
+
+    if (header.risu_op != op) {
+        /* We are out of sync.  Tell master to exit. */
+        respond(RES_END);
+        return RES_BAD_IO;
+    }
+
+    /* send OK for the header */
+    respond(RES_OK);
+
+    switch (op) {
+    case OP_COMPARE:
+    case OP_TESTEND:
+    case OP_SIGILL:
+        /* Do a simple register compare on (a) explicit request
+         * (b) end of test (c) a non-risuop UNDEF
+         */
+        res = read_buffer(&master_ri, reginfo_size());
+        if (res != RES_OK) {
+            /* fail */
+        } else if (!reginfo_is_eq(&master_ri, &apprentice_ri)) {
+            /* register mismatch */
+            res = RES_MISMATCH_REG;
+        } else if (op == OP_TESTEND) {
+            res = RES_END;
+        }
+        respond(res == RES_OK ? RES_OK : RES_END);
+        break;
+    case OP_SETMEMBLOCK:
+        memblock = (void *)(uintptr_t)get_reginfo_paramreg(&apprentice_ri);
+        break;
+    case OP_GETMEMBLOCK:
+        set_ucontext_paramreg(uc, get_reginfo_paramreg(&apprentice_ri) +
+                              (uintptr_t)memblock);
+        break;
+    case OP_COMPAREMEM:
+        res = read_buffer(master_memblock, MEMBLOCKLEN);
+        if (res != RES_OK) {
+            /* fail */
+        } else if (memcmp(memblock, master_memblock, MEMBLOCKLEN) != 0) {
+            /* memory mismatch */
+            res = RES_MISMATCH_MEM;
+        }
+        respond(res == RES_OK ? RES_OK : RES_END);
+        break;
+    default:
+        abort();
+    }
+
+    return res;
+}
+
 static void apprentice_sigill(int sig, siginfo_t *si, void *uc)
 {
     RisuResult r;
@@ -226,7 +341,11 @@ static int apprentice(void)
 
     case RES_MISMATCH_REG:
         fprintf(stderr, "mismatch reg after %zd checkpoints\n", signal_count);
-        report_mismatch_reg();
+        fprintf(stderr, "master reginfo:\n");
+        reginfo_dump(&master_ri, stderr);
+        fprintf(stderr, "apprentice reginfo:\n");
+        reginfo_dump(&apprentice_ri, stderr);
+        reginfo_dump_mismatch(&master_ri, &apprentice_ri, stderr);
         return EXIT_FAILURE;
 
     case RES_MISMATCH_MEM:
-- 
2.34.1


