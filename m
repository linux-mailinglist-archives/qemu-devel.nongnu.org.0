Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E1A56BE2E
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 18:34:27 +0200 (CEST)
Received: from localhost ([::1]:39792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9qvy-0003Tj-Tr
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 12:34:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9qCv-0005TF-0z
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 11:47:53 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:37643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9qCs-0002Ux-M8
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 11:47:52 -0400
Received: by mail-pl1-x630.google.com with SMTP id f11so4115099plr.4
 for <qemu-devel@nongnu.org>; Fri, 08 Jul 2022 08:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Pvi9qlovHhKpDCenz2S7UQUGmj2q8e/6gUB6XkPNY2s=;
 b=XQ7ca/YeFeNHGK2uvPtpJUOFlHRPUvGDHCiH6WRQaz6VsRUZePHP1ruXD6QrLs5JHM
 S48cFs0MWP0iMA3t7F+PbL9elu9Pl2TTgIFwbnOx0jC7s4QxkloARw67cwhek8/CWETg
 9Wy/6jlhnVr86TdIKAdqyZ1AuXjh2tYYc1ETtuKKH6tncAIe3msmrGJpWzpa2wCaKp0z
 BqlkNhoX4IQHirJOIp5AlvGWKOLLvP8ux8MfkylCyYfkthoM7FLimHXt0ztv1CYZ9TVf
 iNEt/OEbrc3bNU91wSWjWPSc1VFMR31N2fGeDh0kmj+dJN/kbtz/86hLyGbnAbitIJ+q
 xvZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Pvi9qlovHhKpDCenz2S7UQUGmj2q8e/6gUB6XkPNY2s=;
 b=yBc99TFJHLw7vWPHbFt9SJCl1NjWgIsbcmT+UA03wcGWVn6hF461Ww3JzGswzrc13O
 mTZfm3PKraz6UxOF7oK/6Vd9t8+FSPESm5hyKIPTh6x6okV6eP66/PNoEbPiP3NpvTYO
 hcRptWrO+a7kQZVykZJIkDoaUSS9SsXdNTMWY/KjHMHL6PuowXr5wqhkDOJf0ha665lb
 cTJQpGfsuv8uftuTCUVi1C14S1qJMFILHnmdVR9cHg/8vYm1TYl+zjUToJD7l6IWHDoW
 vKelQJjc8b+DdRJCvEWj8nfbgd23/76mcYoTq7j2wKgNCIZza1Ta3yErmyufWKVT631U
 6Mow==
X-Gm-Message-State: AJIora/PxX5sHNCgVpnc75ZOPpr18ug/fCNL5tBzQowXx/2NYOUeaFPe
 CsbDgVcG+dSQrwwNLcCB9PBZvVG6jzTik0v8
X-Google-Smtp-Source: AGRyM1tcBdpQagT8fLLEO7KbkE3OvkhwHpTvIaNE1kH8Uq7bDlV2scDsbgEUA8LA+6VpgaGsJwVZEg==
X-Received: by 2002:a17:902:a502:b0:15e:c251:b769 with SMTP id
 s2-20020a170902a50200b0015ec251b769mr4384608plq.115.1657295269405; 
 Fri, 08 Jul 2022 08:47:49 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 y3-20020a17090a390300b001ef81bac701sm1782089pjb.42.2022.07.08.08.47.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 08:47:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RISU PATCH v4 13/29] Split RES_MISMATCH for registers and memory
Date: Fri,  8 Jul 2022 21:16:44 +0530
Message-Id: <20220708154700.18682-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220708154700.18682-1-richard.henderson@linaro.org>
References: <20220708154700.18682-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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

By remembering the specific comparison that failed, we do not
have to try again when it comes time to report.  This makes
the mem_used flag redundant.  Also, packet_mismatch is now
redundant with RES_BAD_IO.

This means that the only thing that report_match_status does
is to report on register status, so rename to report_mismatch_reg.
Also, we know there is a failure, so don't return a status from
the report.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 risu.h    | 13 ++++++-------
 reginfo.c | 45 ++++++++-------------------------------------
 risu.c    | 10 +++++++---
 3 files changed, 21 insertions(+), 47 deletions(-)

diff --git a/risu.h b/risu.h
index f383b64..77d6128 100644
--- a/risu.h
+++ b/risu.h
@@ -54,7 +54,8 @@ typedef enum {
 typedef enum {
     RES_OK = 0,
     RES_END,
-    RES_MISMATCH,
+    RES_MISMATCH_REG,
+    RES_MISMATCH_MEM,
     RES_BAD_IO,
 } RisuResult;
 
@@ -100,13 +101,11 @@ RisuResult send_register_info(void *uc);
  */
 RisuResult recv_and_compare_register_info(void *uc);
 
-/* Print a useful report on the status of the last comparison
- * done in recv_and_compare_register_info(). This is called on
- * exit, so need not restrict itself to signal-safe functions.
- * Should return 0 if it was a good match (ie end of test)
- * and 1 for a mismatch.
+/*
+ * Print a useful report on the status of the last reg comparison
+ * done in recv_and_compare_register_info().
  */
-int report_match_status(void);
+void report_mismatch_reg(void);
 
 /* Interface provided by CPU-specific code: */
 
diff --git a/reginfo.c b/reginfo.c
index 31bc699..a007f16 100644
--- a/reginfo.c
+++ b/reginfo.c
@@ -17,9 +17,6 @@
 static struct reginfo master_ri, apprentice_ri;
 static uint8_t master_memblock[MEMBLOCKLEN];
 
-static int mem_used;
-static int packet_mismatch;
-
 RisuResult send_register_info(void *uc)
 {
     struct reginfo ri;
@@ -107,10 +104,10 @@ RisuResult recv_and_compare_register_info(void *uc)
          */
         res = read_buffer(&master_ri, reginfo_size());
         if (res != RES_OK) {
-            packet_mismatch = 1;
+            /* fail */
         } else if (!reginfo_is_eq(&master_ri, &apprentice_ri)) {
             /* register mismatch */
-            res = RES_MISMATCH;
+            res = RES_MISMATCH_REG;
         } else if (op == OP_TESTEND) {
             res = RES_END;
         }
@@ -124,13 +121,12 @@ RisuResult recv_and_compare_register_info(void *uc)
                               (uintptr_t)memblock);
         break;
     case OP_COMPAREMEM:
-        mem_used = 1;
         res = read_buffer(master_memblock, MEMBLOCKLEN);
         if (res != RES_OK) {
-            packet_mismatch = 1;
+            /* fail */
         } else if (memcmp(memblock, master_memblock, MEMBLOCKLEN) != 0) {
             /* memory mismatch */
-            res = RES_MISMATCH;
+            res = RES_MISMATCH_MEM;
         }
         respond(res == RES_OK ? RES_OK : RES_END);
         break;
@@ -141,40 +137,15 @@ RisuResult recv_and_compare_register_info(void *uc)
     return res;
 }
 
-/* Print a useful report on the status of the last comparison
- * done in recv_and_compare_register_info(). This is called on
- * exit, so need not restrict itself to signal-safe functions.
- * Should return 0 if it was a good match (ie end of test)
- * and 1 for a mismatch.
+/*
+ * Print a useful report on the status of the last reg comparison
+ * done in recv_and_compare_register_info().
  */
-int report_match_status(void)
+void report_mismatch_reg(void)
 {
-    int resp = 0;
-    fprintf(stderr, "match status...\n");
-    if (packet_mismatch) {
-        fprintf(stderr, "packet mismatch (probably disagreement "
-                "about UNDEF on load/store)\n");
-        return 1;
-    }
-    if (!reginfo_is_eq(&master_ri, &apprentice_ri)) {
-        fprintf(stderr, "mismatch on regs!\n");
-        resp = 1;
-    }
-    if (mem_used
-        && memcmp(memblock, &master_memblock, MEMBLOCKLEN) != 0) {
-        fprintf(stderr, "mismatch on memory!\n");
-        resp = 1;
-    }
-    if (!resp) {
-        fprintf(stderr, "match!\n");
-        return 0;
-    }
-
     fprintf(stderr, "master reginfo:\n");
     reginfo_dump(&master_ri, stderr);
     fprintf(stderr, "apprentice reginfo:\n");
     reginfo_dump(&apprentice_ri, stderr);
-
     reginfo_dump_mismatch(&master_ri, &apprentice_ri, stderr);
-    return resp;
 }
diff --git a/risu.c b/risu.c
index 199f697..d6c2deb 100644
--- a/risu.c
+++ b/risu.c
@@ -224,9 +224,13 @@ static int apprentice(void)
     case RES_END:
         return EXIT_SUCCESS;
 
-    case RES_MISMATCH:
-        fprintf(stderr, "mismatch after %zd checkpoints\n", signal_count);
-        report_match_status();
+    case RES_MISMATCH_REG:
+        fprintf(stderr, "mismatch reg after %zd checkpoints\n", signal_count);
+        report_mismatch_reg();
+        return EXIT_FAILURE;
+
+    case RES_MISMATCH_MEM:
+        fprintf(stderr, "mismatch mem after %zd checkpoints\n", signal_count);
         return EXIT_FAILURE;
 
     case RES_BAD_IO:
-- 
2.34.1


