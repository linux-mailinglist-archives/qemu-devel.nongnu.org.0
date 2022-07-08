Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACEC356BE37
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 18:36:43 +0200 (CEST)
Received: from localhost ([::1]:46274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9qyA-0008Ja-N6
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 12:36:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9qD1-0005qn-Bs
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 11:47:59 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:37643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9qCz-0002Ux-PM
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 11:47:59 -0400
Received: by mail-pl1-x630.google.com with SMTP id f11so4115351plr.4
 for <qemu-devel@nongnu.org>; Fri, 08 Jul 2022 08:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=n2pj04eKwIIwfWxKRy+OpUcFUnQWI9QGoADis3HM7QI=;
 b=bDdTgLPqjoJsQLTGlQpoH2VllST0upphtnER5sE74xLt8M0k8GiIbBk6DoQReqsOxh
 D8fWlxZRYBzi+YAW66mq1XnNRURgbE9uts8JuApSsVlPb6B5Qb9YaSJljEfjC5kuHQ/n
 MD4F8OL9qOKbBAxPq/X0P5yJFQeCcN6JngRk1VIFMXQJNWc/SIkQhjq5jlXZView9o0H
 3jGofyxe3IcHDuKf+seMGFMB1VLIAdKkVB8DcfXexBPwqZb0YX7DpxIEJa2hH35vGWiI
 +LKx+WjWPf7LLRIFneW9E/3h/5rFW2S9i1saERHLoKAaIAeI24eQsUIIMxOS5ZrUenCl
 nxWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=n2pj04eKwIIwfWxKRy+OpUcFUnQWI9QGoADis3HM7QI=;
 b=KUcFRKlH9QyCitfGdJq9Mk6bZvP1PzLur3aAzgV2TNfv/CemeBdBQVTSrJrPrPR9UQ
 o9nGFjTCdYQ4P48IV03JHYERAT04T1tC0nEEwYiXL3PlTFNWyEZG1kCQqI0EnaTL8eA5
 Hdgi2jHweeiveGEFEOYfOv9cdp4aZG1Vr9ytGvqS9tl9ROJhV3jaFFz7pl3FPkJ+3kvh
 vD5ZmAuX/x12nkGC40kInceh1e6ZzJNGb67od4JC/6oDW8ah3pFtc29uNrCzd8m0b5Dz
 58ld97pQxgc8XisYsQA47oqCzjKCVHgvawGyhXP4WehWVUx5OeNyKWXcTZutze7iWz4q
 ZYGg==
X-Gm-Message-State: AJIora8LPFj/C7y2og71wDnZGzl0xlX3JUSBXAV2XQ3Tgspd7UMrx2wf
 hxEg2H17dKOT0hGjfP+x1C7q3iLB8QJvhflM
X-Google-Smtp-Source: AGRyM1tybHOxl25kNf7QBOLn3IhF81no9VlEF5/Gy2BFo8v+fdRXGKJEcJSFlGMG4jqXWcUqd+JvOw==
X-Received: by 2002:a17:90a:e391:b0:1ef:83c2:2527 with SMTP id
 b17-20020a17090ae39100b001ef83c22527mr541978pjz.94.1657295276984; 
 Fri, 08 Jul 2022 08:47:56 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 y3-20020a17090a390300b001ef81bac701sm1782089pjb.42.2022.07.08.08.47.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 08:47:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [RISU PATCH v4 16/29] Split out recv_register_info
Date: Fri,  8 Jul 2022 21:16:47 +0530
Message-Id: <20220708154700.18682-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220708154700.18682-1-richard.henderson@linaro.org>
References: <20220708154700.18682-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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

We will want to share this code when dumping.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 risu.c | 50 ++++++++++++++++++++++++++++++++++----------------
 1 file changed, 34 insertions(+), 16 deletions(-)

diff --git a/risu.c b/risu.c
index b91ad38..80bc3b1 100644
--- a/risu.c
+++ b/risu.c
@@ -166,6 +166,34 @@ static void master_sigill(int sig, siginfo_t *si, void *uc)
     }
 }
 
+static RisuResult recv_register_info(struct reginfo *ri)
+{
+    RisuResult res;
+
+    res = read_buffer(&header, sizeof(header));
+    if (res != RES_OK) {
+        return res;
+    }
+
+    /* send OK for the header */
+    respond(RES_OK);
+
+    switch (header.risu_op) {
+    case OP_COMPARE:
+    case OP_TESTEND:
+    case OP_SIGILL:
+        return read_buffer(ri, reginfo_size());
+    case OP_COMPAREMEM:
+        return read_buffer(other_memblock, MEMBLOCKLEN);
+    case OP_SETMEMBLOCK:
+    case OP_GETMEMBLOCK:
+        return RES_OK;
+    default:
+        /* TODO: Create a better error message. */
+        return RES_BAD_IO;
+    }
+}
+
 static RisuResult recv_and_compare_register_info(void *uc)
 {
     uint64_t paramreg;
@@ -173,33 +201,26 @@ static RisuResult recv_and_compare_register_info(void *uc)
     RisuOp op;
 
     reginfo_init(&ri[APPRENTICE], uc);
-    op = get_risuop(&ri[APPRENTICE]);
 
-    res = read_buffer(&header, sizeof(header));
+    res = recv_register_info(&ri[MASTER]);
     if (res != RES_OK) {
+        /* I/O error.  Tell master to exit. */
+        respond(RES_END);
         return res;
     }
 
+    op = get_risuop(&ri[APPRENTICE]);
     if (header.risu_op != op) {
         /* We are out of sync.  Tell master to exit. */
         respond(RES_END);
         return RES_BAD_IO;
     }
 
-    /* send OK for the header */
-    respond(RES_OK);
-
     switch (op) {
     case OP_COMPARE:
     case OP_TESTEND:
     case OP_SIGILL:
-        /* Do a simple register compare on (a) explicit request
-         * (b) end of test (c) a non-risuop UNDEF
-         */
-        res = read_buffer(&ri[MASTER], reginfo_size());
-        if (res != RES_OK) {
-            /* fail */
-        } else if (!reginfo_is_eq(&ri[MASTER], &ri[APPRENTICE])) {
+        if (!reginfo_is_eq(&ri[MASTER], &ri[APPRENTICE])) {
             /* register mismatch */
             res = RES_MISMATCH_REG;
         } else if (op == OP_TESTEND) {
@@ -216,10 +237,7 @@ static RisuResult recv_and_compare_register_info(void *uc)
         set_ucontext_paramreg(uc, paramreg + (uintptr_t)memblock);
         break;
     case OP_COMPAREMEM:
-        res = read_buffer(other_memblock, MEMBLOCKLEN);
-        if (res != RES_OK) {
-            /* fail */
-        } else if (memcmp(memblock, other_memblock, MEMBLOCKLEN) != 0) {
+        if (memcmp(memblock, other_memblock, MEMBLOCKLEN) != 0) {
             /* memory mismatch */
             res = RES_MISMATCH_MEM;
         }
-- 
2.34.1


