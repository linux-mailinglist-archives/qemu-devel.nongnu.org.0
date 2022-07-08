Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3764556BE29
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 18:30:56 +0200 (CEST)
Received: from localhost ([::1]:60668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9qsZ-0006XQ-4W
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 12:30:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9qCn-0005GZ-2l
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 11:47:45 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:41806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9qCj-0002TW-Mw
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 11:47:44 -0400
Received: by mail-pl1-x636.google.com with SMTP id j12so9874419plj.8
 for <qemu-devel@nongnu.org>; Fri, 08 Jul 2022 08:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZlB23Fd4G5DghSJ6Ko6JaiFeI6h2RDPKt6G6Hp0Fq+M=;
 b=IjxlJlRCDRhD8hxXxc8hPtfWuV+wWnz6N8Z/z74To6ZzYZyUhUjhSoi4NP+eSn/m6Q
 egPgXub7dZuVz/t8hQV8ANRwS5rm2/cGZA4QAza4S1owrv87PNtEgcRrI5BI1023Y+DC
 /SRRnHhHW2pBIt+G8DhIJz0xQPxhtAjvfXGo4Cmd4s66aM84R/dZDKqbrskPUOkBEsVe
 +LAiy/Pr2iYRIvyPtqTrtQMYRzADORex23Oe9CNzUN3zLPP7syKCdiZ3HUiL3c8NbOGl
 W8aAJYE78aAT4zBsXRDMZEhM9+zYfLTKuB23tYOMu8HREynGWJNROHo9EX3H5KWEcrhS
 2qPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZlB23Fd4G5DghSJ6Ko6JaiFeI6h2RDPKt6G6Hp0Fq+M=;
 b=AmqgppjgAm2KSKOpo3vhGSRAn9oPsLRwV68LtEYSaO+ZiD52A/PLQGxrrVYBtJ7oLw
 zgqbZ4GrhGPhXGor1dFwQA2MIwbgqvUkj2v5JpqIqgrmmJWyPqczrb3k1945nN+wZCIC
 hvo0QUjVn3bHdxK7VK49/MXfNwiUImxCzZxnJmmu4cRZniYVRm/aIXewGwzbbnYkRqQu
 KHftEpPzIUP/S/HwPpSsz5rOvaWpQucpJMzQUEbJ4XnXQMTasr3kxrhgwThURBNJaXY7
 4Ym21HlU88Q7kNqivu2gkIgvHYo2bOr6zvsmwASZlYkZ+Eh/Oq2ijI0u52NjF5SNJgc8
 HytA==
X-Gm-Message-State: AJIora/DzIAXPwNlo6PD66dLtKp3LsYJ1Hdgtwmhg3h+37g7JE3uVd3W
 iyfP5WZBA2lDC3XUqHC4JGxwZualO9a4ddJV
X-Google-Smtp-Source: AGRyM1vsCllgMHK6EFpmj1lvJC9YqUZTJowU23N0g6uC4t2EcJIKbrB5p2Q2JHHit/iHXSleVKcuFQ==
X-Received: by 2002:a17:90a:b701:b0:1e8:6d19:bcb with SMTP id
 l1-20020a17090ab70100b001e86d190bcbmr496093pjr.218.1657295260291; 
 Fri, 08 Jul 2022 08:47:40 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 y3-20020a17090a390300b001ef81bac701sm1782089pjb.42.2022.07.08.08.47.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 08:47:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RISU PATCH v4 10/29] Pass non-OK result back through siglongjmp
Date: Fri,  8 Jul 2022 21:16:41 +0530
Message-Id: <20220708154700.18682-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220708154700.18682-1-richard.henderson@linaro.org>
References: <20220708154700.18682-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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

Rather than doing some work in the signal handler and
some work outside, move all of the non-resume work outside.
This works because we arranged for RES_OK to be 0, which
is the normal return from sigsetjmp.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 risu.c | 50 ++++++++++++++++++++++++--------------------------
 1 file changed, 24 insertions(+), 26 deletions(-)

diff --git a/risu.c b/risu.c
index 1917311..f238117 100644
--- a/risu.c
+++ b/risu.c
@@ -107,15 +107,10 @@ static void master_sigill(int sig, siginfo_t *si, void *uc)
     } else {
         r = recv_and_compare_register_info(uc);
     }
-
-    switch (r) {
-    case RES_OK:
-        /* match OK */
+    if (r == RES_OK) {
         advance_pc(uc);
-        return;
-    default:
-        /* mismatch, or end of test */
-        siglongjmp(jmpbuf, 1);
+    } else {
+        siglongjmp(jmpbuf, r);
     }
 }
 
@@ -129,21 +124,10 @@ static void apprentice_sigill(int sig, siginfo_t *si, void *uc)
     } else {
         r = send_register_info(uc);
     }
-
-    switch (r) {
-    case RES_OK:
-        /* match OK */
+    if (r == RES_OK) {
         advance_pc(uc);
-        return;
-    case RES_END:
-        /* end of test */
-        exit(EXIT_SUCCESS);
-    default:
-        /* mismatch */
-        if (trace) {
-            siglongjmp(jmpbuf, 1);
-        }
-        exit(EXIT_FAILURE);
+    } else {
+        siglongjmp(jmpbuf, r);
     }
 }
 
@@ -200,7 +184,9 @@ static void load_image(const char *imgfile)
 
 static int master(void)
 {
-    if (sigsetjmp(jmpbuf, 1)) {
+    RisuResult res = sigsetjmp(jmpbuf, 1);
+
+    if (res != RES_OK) {
 #ifdef HAVE_ZLIB
         if (trace && comm_fd != STDOUT_FILENO) {
             gzclose(gz_trace_file);
@@ -226,15 +212,27 @@ static int master(void)
 
 static int apprentice(void)
 {
-    if (sigsetjmp(jmpbuf, 1)) {
+    RisuResult res = sigsetjmp(jmpbuf, 1);
+
+    if (res != RES_OK) {
 #ifdef HAVE_ZLIB
         if (trace && comm_fd != STDIN_FILENO) {
             gzclose(gz_trace_file);
         }
 #endif
         close(comm_fd);
-        fprintf(stderr, "finished early after %zd checkpoints\n", signal_count);
-        return report_match_status(true);
+
+        switch (res) {
+        case RES_END:
+            return EXIT_SUCCESS;
+        default:
+            if (!trace) {
+                return EXIT_FAILURE;
+            }
+            fprintf(stderr, "finished early after %zd checkpoints\n",
+                    signal_count);
+            return report_match_status(true);
+        }
     }
     set_sigill_handler(&apprentice_sigill);
     fprintf(stderr, "starting apprentice image at 0x%"PRIxPTR"\n",
-- 
2.34.1


