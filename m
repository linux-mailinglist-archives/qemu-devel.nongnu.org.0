Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2A9656BE31
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 18:36:07 +0200 (CEST)
Received: from localhost ([::1]:44954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9qxa-0007Ql-UD
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 12:36:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9qD0-0005m9-6A
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 11:47:58 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:38442)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9qCm-0002Tp-W7
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 11:47:57 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 89-20020a17090a09e200b001ef7638e536so2311625pjo.3
 for <qemu-devel@nongnu.org>; Fri, 08 Jul 2022 08:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JF+lOPliqQPvdxG0ISzOEougk8wObZ8ufYNLrAEw48c=;
 b=J1T1cDM1E86OfZ4vUIrR0CWJwSqtz1cezRr9rDc+GpVcAwjuKqQdTxZPk16tn8HIfH
 y+/5IW2TJXMUdn2eDTraPAhy1Se1iW23x9VdAdlO7t/VfVZ3IDGpyzAs/HZkY68ldMzb
 9Vvn69gi3O04jjL+PpRf7EzYbRBxyRf99DuG8DwnUBKiHMpCGCcYLQD8xldCUeGkhlUo
 r6amPaS1TeFb8NmBfVnLn3yGfSATLMBYp5NzDwc/q6eslel6u2VnDAABu16KVmBIboS1
 NZ9PV1Ai427DfeSIrajBLH8p4aWaX+6L2Zpv1m1D/gzKst6Xf8jNvElZ3f/6XptnUheX
 odEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JF+lOPliqQPvdxG0ISzOEougk8wObZ8ufYNLrAEw48c=;
 b=aKBPqHqO/SSZ2GdsA8CvUf694KrIa4XXqafArYwKQGZdNn427GpmM8s4WtuK+v0WHk
 DqHXBOaJ32pKkFvadyiCoKzJ5KkQdfKtJGRqX083J/wFbz28PVUm2hH3WwB7Q7rdawOj
 GKe3PaPCcEeaggAkimDhYzVyQKwQjIfgMi7esXEBBWAInCEr9IZntwIGQbZlx267eTNj
 AGg5RscDMaWKYTd3nLaz6HWSLN9t7amc2H3HGv41Ako8xfJX7TL6akuq5/y7gTNoLH4T
 tAMkgiOdyATxS0Jem+iCJW9azWClCkGLFP9sqFDK7gH3EZTQWWgpV6vEsb/ACXocRCoK
 Rf7A==
X-Gm-Message-State: AJIora+Oon/uTY4BAlLY7fzZj68YX2pNeeOyMuuExOrNsG1DD1LWdXkV
 7qvwYygqJVpCqmnvcWDempGnsHsvkDfCZ+gu
X-Google-Smtp-Source: AGRyM1tirCEK1kpxUhzi3RrJTBucLE8IApvxB1yUittas9VgbKipajqkhufALzJJmgcb9ongpHWULg==
X-Received: by 2002:a17:902:e751:b0:16c:19fd:5428 with SMTP id
 p17-20020a170902e75100b0016c19fd5428mr4388026plf.48.1657295263520; 
 Fri, 08 Jul 2022 08:47:43 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 y3-20020a17090a390300b001ef81bac701sm1782089pjb.42.2022.07.08.08.47.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 08:47:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RISU PATCH v4 11/29] Always write for --master
Date: Fri,  8 Jul 2022 21:16:42 +0530
Message-Id: <20220708154700.18682-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220708154700.18682-1-richard.henderson@linaro.org>
References: <20220708154700.18682-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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

For trace, master of course must write to the file we create.

For sockets, we can report mismatches from either end.  At present,
we are reporting mismatches from master.  Reverse that so that we
report mismatches from the apprentice, just as we do for trace.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 risu.h    |  2 +-
 reginfo.c | 38 ++++++++--------------
 risu.c    | 96 ++++++++++++++++++++++++++-----------------------------
 3 files changed, 61 insertions(+), 75 deletions(-)

diff --git a/risu.h b/risu.h
index c83b803..f383b64 100644
--- a/risu.h
+++ b/risu.h
@@ -106,7 +106,7 @@ RisuResult recv_and_compare_register_info(void *uc);
  * Should return 0 if it was a good match (ie end of test)
  * and 1 for a mismatch.
  */
-int report_match_status(bool trace);
+int report_match_status(void);
 
 /* Interface provided by CPU-specific code: */
 
diff --git a/reginfo.c b/reginfo.c
index fee025e..c37c5df 100644
--- a/reginfo.c
+++ b/reginfo.c
@@ -14,9 +14,8 @@
 #include <stdlib.h>
 #include "risu.h"
 
-struct reginfo master_ri, apprentice_ri;
-
-uint8_t apprentice_memblock[MEMBLOCKLEN];
+static struct reginfo master_ri, apprentice_ri;
+static uint8_t master_memblock[MEMBLOCKLEN];
 
 static int mem_used;
 static int packet_mismatch;
@@ -82,8 +81,8 @@ RisuResult recv_and_compare_register_info(void *uc)
     trace_header_t header;
     RisuOp op;
 
-    reginfo_init(&master_ri, uc);
-    op = get_risuop(&master_ri);
+    reginfo_init(&apprentice_ri, uc);
+    op = get_risuop(&apprentice_ri);
 
     res = read_buffer(&header, sizeof(header));
     if (res != RES_OK) {
@@ -107,7 +106,7 @@ RisuResult recv_and_compare_register_info(void *uc)
         /* Do a simple register compare on (a) explicit request
          * (b) end of test (c) a non-risuop UNDEF
          */
-        res = read_buffer(&apprentice_ri, reginfo_size());
+        res = read_buffer(&master_ri, reginfo_size());
         if (res != RES_OK) {
             packet_mismatch = 1;
         } else if (!reginfo_is_eq(&master_ri, &apprentice_ri)) {
@@ -119,18 +118,18 @@ RisuResult recv_and_compare_register_info(void *uc)
         respond(res);
         break;
     case OP_SETMEMBLOCK:
-        memblock = (void *)(uintptr_t)get_reginfo_paramreg(&master_ri);
+        memblock = (void *)(uintptr_t)get_reginfo_paramreg(&apprentice_ri);
         break;
     case OP_GETMEMBLOCK:
-        set_ucontext_paramreg(uc, get_reginfo_paramreg(&master_ri) +
+        set_ucontext_paramreg(uc, get_reginfo_paramreg(&apprentice_ri) +
                               (uintptr_t)memblock);
         break;
     case OP_COMPAREMEM:
         mem_used = 1;
-        res = read_buffer(apprentice_memblock, MEMBLOCKLEN);
+        res = read_buffer(master_memblock, MEMBLOCKLEN);
         if (res != RES_OK) {
             packet_mismatch = 1;
-        } else if (memcmp(memblock, apprentice_memblock, MEMBLOCKLEN) != 0) {
+        } else if (memcmp(memblock, master_memblock, MEMBLOCKLEN) != 0) {
             /* memory mismatch */
             res = RES_MISMATCH;
         }
@@ -149,18 +148,13 @@ RisuResult recv_and_compare_register_info(void *uc)
  * Should return 0 if it was a good match (ie end of test)
  * and 1 for a mismatch.
  */
-int report_match_status(bool trace)
+int report_match_status(void)
 {
     int resp = 0;
     fprintf(stderr, "match status...\n");
     if (packet_mismatch) {
         fprintf(stderr, "packet mismatch (probably disagreement "
                 "about UNDEF on load/store)\n");
-        /* We don't have valid reginfo from the apprentice side
-         * so stop now rather than printing anything about it.
-         */
-        fprintf(stderr, "%s reginfo:\n", trace ? "this" : "master");
-        reginfo_dump(&master_ri, stderr);
         return 1;
     }
     if (!reginfo_is_eq(&master_ri, &apprentice_ri)) {
@@ -168,7 +162,7 @@ int report_match_status(bool trace)
         resp = 1;
     }
     if (mem_used
-        && memcmp(memblock, &apprentice_memblock, MEMBLOCKLEN) != 0) {
+        && memcmp(memblock, &master_memblock, MEMBLOCKLEN) != 0) {
         fprintf(stderr, "mismatch on memory!\n");
         resp = 1;
     }
@@ -177,15 +171,11 @@ int report_match_status(bool trace)
         return 0;
     }
 
-    fprintf(stderr, "%s reginfo:\n", trace ? "this" : "master");
+    fprintf(stderr, "master reginfo:\n");
     reginfo_dump(&master_ri, stderr);
-    fprintf(stderr, "%s reginfo:\n", trace ? "trace" : "apprentice");
+    fprintf(stderr, "apprentice reginfo:\n");
     reginfo_dump(&apprentice_ri, stderr);
 
-    if (trace) {
-        reginfo_dump_mismatch(&apprentice_ri, &master_ri, stderr);
-    } else {
-        reginfo_dump_mismatch(&master_ri, &apprentice_ri, stderr);
-    }
+    reginfo_dump_mismatch(&master_ri, &apprentice_ri, stderr);
     return resp;
 }
diff --git a/risu.c b/risu.c
index f238117..199f697 100644
--- a/risu.c
+++ b/risu.c
@@ -102,11 +102,7 @@ static void master_sigill(int sig, siginfo_t *si, void *uc)
     RisuResult r;
     signal_count++;
 
-    if (trace) {
-        r = send_register_info(uc);
-    } else {
-        r = recv_and_compare_register_info(uc);
-    }
+    r = send_register_info(uc);
     if (r == RES_OK) {
         advance_pc(uc);
     } else {
@@ -119,11 +115,7 @@ static void apprentice_sigill(int sig, siginfo_t *si, void *uc)
     RisuResult r;
     signal_count++;
 
-    if (trace) {
-        r = recv_and_compare_register_info(uc);
-    } else {
-        r = send_register_info(uc);
-    }
+    r = recv_and_compare_register_info(uc);
     if (r == RES_OK) {
         advance_pc(uc);
     } else {
@@ -186,61 +178,65 @@ static int master(void)
 {
     RisuResult res = sigsetjmp(jmpbuf, 1);
 
-    if (res != RES_OK) {
+    switch (res) {
+    case RES_OK:
+        set_sigill_handler(&master_sigill);
+        fprintf(stderr, "starting master image at 0x%"PRIxPTR"\n",
+                image_start_address);
+        fprintf(stderr, "starting image\n");
+        image_start();
+        fprintf(stderr, "image returned unexpectedly\n");
+        return EXIT_FAILURE;
+
+    case RES_END:
 #ifdef HAVE_ZLIB
         if (trace && comm_fd != STDOUT_FILENO) {
             gzclose(gz_trace_file);
         }
 #endif
         close(comm_fd);
-        if (trace) {
-            fprintf(stderr, "trace complete after %zd checkpoints\n",
-                    signal_count);
-            return EXIT_SUCCESS;
-        } else {
-            return report_match_status(false);
-        }
+        return EXIT_SUCCESS;
+
+    case RES_BAD_IO:
+        fprintf(stderr, "i/o error after %zd checkpoints\n", signal_count);
+        return EXIT_FAILURE;
+
+    default:
+        fprintf(stderr, "unexpected result %d\n", res);
+        return EXIT_FAILURE;
     }
-    set_sigill_handler(&master_sigill);
-    fprintf(stderr, "starting master image at 0x%"PRIxPTR"\n",
-            image_start_address);
-    fprintf(stderr, "starting image\n");
-    image_start();
-    fprintf(stderr, "image returned unexpectedly\n");
-    return EXIT_FAILURE;
 }
 
 static int apprentice(void)
 {
     RisuResult res = sigsetjmp(jmpbuf, 1);
 
-    if (res != RES_OK) {
-#ifdef HAVE_ZLIB
-        if (trace && comm_fd != STDIN_FILENO) {
-            gzclose(gz_trace_file);
-        }
-#endif
-        close(comm_fd);
+    switch (res) {
+    case RES_OK:
+        set_sigill_handler(&apprentice_sigill);
+        fprintf(stderr, "starting apprentice image at 0x%"PRIxPTR"\n",
+                image_start_address);
+        fprintf(stderr, "starting image\n");
+        image_start();
+        fprintf(stderr, "image returned unexpectedly\n");
+        return EXIT_FAILURE;
 
-        switch (res) {
-        case RES_END:
-            return EXIT_SUCCESS;
-        default:
-            if (!trace) {
-                return EXIT_FAILURE;
-            }
-            fprintf(stderr, "finished early after %zd checkpoints\n",
-                    signal_count);
-            return report_match_status(true);
-        }
+    case RES_END:
+        return EXIT_SUCCESS;
+
+    case RES_MISMATCH:
+        fprintf(stderr, "mismatch after %zd checkpoints\n", signal_count);
+        report_match_status();
+        return EXIT_FAILURE;
+
+    case RES_BAD_IO:
+        fprintf(stderr, "i/o error after %zd checkpoints\n", signal_count);
+        return EXIT_FAILURE;
+
+    default:
+        fprintf(stderr, "unexpected result %d\n", res);
+        return EXIT_FAILURE;
     }
-    set_sigill_handler(&apprentice_sigill);
-    fprintf(stderr, "starting apprentice image at 0x%"PRIxPTR"\n",
-            image_start_address);
-    fprintf(stderr, "starting image\n");
-    image_start();
-    fprintf(stderr, "image returned unexpectedly\n");
-    return EXIT_FAILURE;
 }
 
 static int ismaster;
-- 
2.34.1


