Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E10B756BE25
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 18:28:31 +0200 (CEST)
Received: from localhost ([::1]:54232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9qqF-0001ah-0B
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 12:28:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9qCe-000562-Dj
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 11:47:36 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:44988)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9qCb-0002Rb-IV
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 11:47:35 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 o3-20020a17090a744300b001ef8f7f3dddso2145815pjk.3
 for <qemu-devel@nongnu.org>; Fri, 08 Jul 2022 08:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qhmfc0Bs2SrTe50tDkhCkofVbawYB7l8nD2/4Z7gVmI=;
 b=YwwW7u5uJpkoRDfoxBb61fLnmcvQXo3pRZ/zsLICXNOG1rE6bYHit1n42QaaDpvasQ
 HU8g0JKMC0VjMwZ7UD3dE3tY/zFVnCPoCRbZztdiWsTkcSDSs0qp6a8dGpWyXxIjastl
 nDVdpwKfp1UNn4nBxvf+KeHUIV897DpEh3q4K1pXDJ/G+nwS5HuBCs3fsLjjx7cyBWtb
 O0F9tqo2lMrntmIJ+crr5dtlkf4oNMPY4r6tMUp8qLzPxHYQzvZ6cPTdXfAFR7qeKZOs
 3Q5DVUyg23Tut7KQTxySjaiOR7M+7wZBfI/EtUUXb56QFOXtPomNrWuWPJy9eU5Hz2tP
 kheg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qhmfc0Bs2SrTe50tDkhCkofVbawYB7l8nD2/4Z7gVmI=;
 b=zD/qbk3m5T/S+KBWE9ZiNvambzfmTafPKP1ZCYCp9keDkrEYHvkd4/7iyBHxYQP0Bc
 nBUMWLKRmsMjja2eroJkMJ1w9JCgT52oqWB59FvdGZ9RX6gMP8DZ3syDFS9Trn0LkuPK
 UbnYlNZq7FzgJXb/6EjuXBskvHw3gJwQLyxuHAAaX8xFBwEGtiAUBTBNdhz1D9VqCJGS
 +xrvcUquxCQ8ITuUWlwc/6E3wcHAyHgvVSsooxqRsDQQ2+XAQYdfFQApW9GCeFt9q3fE
 Cj8gJhvweNhF9wd+TDGxBaoiSI+5Hu2hOZD6bDcYs7342DU7UflDAxVtalDYnw52erFO
 T3Yw==
X-Gm-Message-State: AJIora+QPJM+Me1ACCKLImLvuGobJHpl8bCH60zNsfQV6ookAlE+5x67
 bc+juDtqD5h8JIjoE/zr8ZHYzETXGj9si0rj
X-Google-Smtp-Source: AGRyM1sMF2DxGYe9F+0SLjsP9is3MlcA4vhRElFPJ2daDsccVWvB552DcXli7RHD0e5Pc3+ShKE4lQ==
X-Received: by 2002:a17:902:f650:b0:15f:3a10:a020 with SMTP id
 m16-20020a170902f65000b0015f3a10a020mr4182527plg.61.1657295252711; 
 Fri, 08 Jul 2022 08:47:32 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 y3-20020a17090a390300b001ef81bac701sm1782089pjb.42.2022.07.08.08.47.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 08:47:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RISU PATCH v4 08/29] Add enum RisuResult
Date: Fri,  8 Jul 2022 21:16:39 +0530
Message-Id: <20220708154700.18682-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220708154700.18682-1-richard.henderson@linaro.org>
References: <20220708154700.18682-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Formalize the random set of numbers into an enum.  Doing this
makes it easy to see that one of the responses in
recv_and_compare_register_info was inconsistent.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 risu.h    | 25 +++++++++++++++++--------
 reginfo.c | 32 ++++++++++++++++----------------
 risu.c    | 18 +++++++++---------
 3 files changed, 42 insertions(+), 33 deletions(-)

diff --git a/risu.h b/risu.h
index a7aa929..e6d07eb 100644
--- a/risu.h
+++ b/risu.h
@@ -57,6 +57,14 @@ typedef enum {
     OP_COMPAREMEM = 4,
 } RisuOp;
 
+/* Result of operation */
+typedef enum {
+    RES_OK = 0,
+    RES_END,
+    RES_MISMATCH,
+    RES_BAD_IO,
+} RisuResult;
+
 /* The memory block should be this long */
 #define MEMBLOCKLEN 8192
 
@@ -82,20 +90,21 @@ typedef struct {
  */
 typedef int (*write_fn) (void *ptr, size_t bytes);
 typedef int (*read_fn) (void *ptr, size_t bytes);
-typedef void (*respond_fn) (int response);
+typedef void (*respond_fn) (RisuResult response);
 
-/* Send the register information from the struct ucontext down the socket.
- * Return the response code from the master.
+/*
+ * Send the register information from the struct ucontext down the socket.
  * NB: called from a signal handler.
  */
-int send_register_info(write_fn write_fn, void *uc);
+RisuResult send_register_info(write_fn write_fn, void *uc);
 
-/* Read register info from the socket and compare it with that from the
- * ucontext. Return 0 for match, 1 for end-of-test, 2 for mismatch.
+/*
+ * Read register info from the socket and compare it with that from the
+ * ucontext.
  * NB: called from a signal handler.
  */
-int recv_and_compare_register_info(read_fn read_fn,
-                                   respond_fn respond, void *uc);
+RisuResult recv_and_compare_register_info(read_fn read_fn,
+                                          respond_fn respond, void *uc);
 
 /* Print a useful report on the status of the last comparison
  * done in recv_and_compare_register_info(). This is called on
diff --git a/reginfo.c b/reginfo.c
index 2d67c93..b909a1f 100644
--- a/reginfo.c
+++ b/reginfo.c
@@ -21,7 +21,7 @@ uint8_t apprentice_memblock[MEMBLOCKLEN];
 static int mem_used;
 static int packet_mismatch;
 
-int send_register_info(write_fn write_fn, void *uc)
+RisuResult send_register_info(write_fn write_fn, void *uc)
 {
     struct reginfo ri;
     trace_header_t header;
@@ -34,7 +34,7 @@ int send_register_info(write_fn write_fn, void *uc)
     header.pc = get_pc(&ri);
     header.risu_op = op;
     if (write_fn(&header, sizeof(header)) != 0) {
-        return -1;
+        return RES_BAD_IO;
     }
 
     switch (op) {
@@ -46,10 +46,10 @@ int send_register_info(write_fn write_fn, void *uc)
          * (b) end of test (c) a non-risuop UNDEF
          */
         if (write_fn(&ri, reginfo_size()) != 0) {
-            return -1;
+            return RES_BAD_IO;
         }
         /* For OP_TEST_END, force return 1 to exit. */
-        return op == OP_TESTEND;
+        return op == OP_TESTEND ? RES_END : RES_OK;
     case OP_SETMEMBLOCK:
         memblock = (void *)(uintptr_t)get_reginfo_paramreg(&ri);
         break;
@@ -63,7 +63,7 @@ int send_register_info(write_fn write_fn, void *uc)
     default:
         abort();
     }
-    return 0;
+    return RES_OK;
 }
 
 /* Read register info from the socket and compare it with that from the
@@ -74,10 +74,10 @@ int send_register_info(write_fn write_fn, void *uc)
  * that says whether it is register or memory data, so if the two
  * sides get out of sync then we will fail obscurely.
  */
-int recv_and_compare_register_info(read_fn read_fn,
-                                   respond_fn resp_fn, void *uc)
+RisuResult recv_and_compare_register_info(read_fn read_fn,
+                                          respond_fn resp_fn, void *uc)
 {
-    int resp = 0;
+    RisuResult resp = RES_OK;
     trace_header_t header;
     RisuOp op;
 
@@ -85,18 +85,18 @@ int recv_and_compare_register_info(read_fn read_fn,
     op = get_risuop(&master_ri);
 
     if (read_fn(&header, sizeof(header)) != 0) {
-        return -1;
+        return RES_BAD_IO;
     }
 
     if (header.risu_op != op) {
         /* We are out of sync */
-        resp = 2;
+        resp = RES_BAD_IO;
         resp_fn(resp);
         return resp;
     }
 
     /* send OK for the header */
-    resp_fn(0);
+    resp_fn(RES_OK);
 
     switch (op) {
     case OP_COMPARE:
@@ -107,12 +107,12 @@ int recv_and_compare_register_info(read_fn read_fn,
          */
         if (read_fn(&apprentice_ri, reginfo_size())) {
             packet_mismatch = 1;
-            resp = 2;
+            resp = RES_BAD_IO;
         } else if (!reginfo_is_eq(&master_ri, &apprentice_ri)) {
             /* register mismatch */
-            resp = 2;
+            resp = RES_MISMATCH;
         } else if (op == OP_TESTEND) {
-            resp = 1;
+            resp = RES_END;
         }
         resp_fn(resp);
         break;
@@ -127,10 +127,10 @@ int recv_and_compare_register_info(read_fn read_fn,
         mem_used = 1;
         if (read_fn(apprentice_memblock, MEMBLOCKLEN)) {
             packet_mismatch = 1;
-            resp = 2;
+            resp = RES_BAD_IO;
         } else if (memcmp(memblock, apprentice_memblock, MEMBLOCKLEN) != 0) {
             /* memory mismatch */
-            resp = 2;
+            resp = RES_MISMATCH;
         }
         resp_fn(resp);
         break;
diff --git a/risu.c b/risu.c
index ab17c71..7b14f72 100644
--- a/risu.c
+++ b/risu.c
@@ -69,7 +69,7 @@ int write_trace(void *ptr, size_t bytes)
     return (res == bytes) ? 0 : 1;
 }
 
-void respond_sock(int r)
+void respond_sock(RisuResult r)
 {
     send_response_byte(comm_fd, r);
 }
@@ -98,11 +98,11 @@ int read_trace(void *ptr, size_t bytes)
     return (res == bytes) ? 0 : 1;
 }
 
-void respond_trace(int r)
+void respond_trace(RisuResult r)
 {
     switch (r) {
-    case 0: /* test ok */
-    case 1: /* end of test */
+    case RES_OK:
+    case RES_END:
         break;
     default:
         /* mismatch - if tracing we need to report, otherwise barf */
@@ -115,7 +115,7 @@ void respond_trace(int r)
 
 static void master_sigill(int sig, siginfo_t *si, void *uc)
 {
-    int r;
+    RisuResult r;
     signal_count++;
 
     if (trace) {
@@ -125,7 +125,7 @@ static void master_sigill(int sig, siginfo_t *si, void *uc)
     }
 
     switch (r) {
-    case 0:
+    case RES_OK:
         /* match OK */
         advance_pc(uc);
         return;
@@ -137,7 +137,7 @@ static void master_sigill(int sig, siginfo_t *si, void *uc)
 
 static void apprentice_sigill(int sig, siginfo_t *si, void *uc)
 {
-    int r;
+    RisuResult r;
     signal_count++;
 
     if (trace) {
@@ -147,11 +147,11 @@ static void apprentice_sigill(int sig, siginfo_t *si, void *uc)
     }
 
     switch (r) {
-    case 0:
+    case RES_OK:
         /* match OK */
         advance_pc(uc);
         return;
-    case 1:
+    case RES_END:
         /* end of test */
         exit(EXIT_SUCCESS);
     default:
-- 
2.34.1


