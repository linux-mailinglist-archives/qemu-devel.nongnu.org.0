Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A241156BE19
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 18:21:43 +0200 (CEST)
Received: from localhost ([::1]:38180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9qje-0006qx-Lj
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 12:21:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9qCN-00049N-7a
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 11:47:19 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:33516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9qCL-0002P4-Hi
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 11:47:18 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 j1-20020a17090aeb0100b001ef777a7befso1886999pjz.0
 for <qemu-devel@nongnu.org>; Fri, 08 Jul 2022 08:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X3HkBOy76gPUx/AerMnT/Pi7Lr8ImXW6FCDVZLVLx8A=;
 b=SxdaRVYRJDPH3zg3QYyQIu17dr/IVBcHr5XUHILGbaLIQeYPWWgY+954kvq/VXxQiN
 Jw/KmgOemd78xk8dMQSinK5JUeBmDvrtLd3N3LOo1Vwhm0gqkdKRvaaFspYV1/5LilqS
 9MTTRuLtyCmJdgPIwtNvjy8ca8Hwf0tydMm1zVPJq/EAJVPbf4FM5OTdb3HDhp1fA5Pp
 IQjZNzJVOm2u92lYvJe3YF+/hgYEqP9+NID9iI8ItveucyWvXTbBzHeBDP6Jr+kMNcqI
 Y/gJovEEwgzDZbsKoeRKzz73ZtfMcQ38u6QbVkw0g/Y0x3nxNFvsIRoRbD9LTpZ+qxRB
 iNfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X3HkBOy76gPUx/AerMnT/Pi7Lr8ImXW6FCDVZLVLx8A=;
 b=E+YS8uf/uVG9bovpZK08NODums+not2tIjm4kW5n/0GzV021399pgOscrW/XAUZZ/B
 EH8q5gUD4NE1pSDUY9yZA5b8v1kw6Nes/qoUVAHj7KdFyxk5DSAB5Aaan6wBHl6enCfz
 tdD/lyY2aDUEy/IUNA/uBq4WmNbxmIdGQLUdKRNb+UOmHwyn3aClPJOtCV/r8jLtDbfH
 591/9Pvt+/m4Cr3HzUgQtYf3MqpWJfaogj6KGuRZj2rjI3cUVVocygR5MM5K7GqcAuN/
 7vgDTzb/UdOc8Ag+Y8Ufmk70YwknyPn4jK8usZKfPyOyjPtFAKTz4N1ZDYJMFN2+J0cx
 Heeg==
X-Gm-Message-State: AJIora+uGF+uNrsag5DqmGD9UzT0eugZKAZvLYxMIdyND5wMfPd35uru
 XWqXAfIKVC0RopjGlk9rW4ocnd7mby6rFBtM
X-Google-Smtp-Source: AGRyM1stgki4yW3XROy9RMdCOwp9zcPIontz0Fu43DMTFhuvoAkmHnBu/kffjye3WYG+WezWa5i8Gg==
X-Received: by 2002:a17:90a:3e09:b0:1ef:8399:398b with SMTP id
 j9-20020a17090a3e0900b001ef8399398bmr482263pjc.39.1657295236189; 
 Fri, 08 Jul 2022 08:47:16 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 y3-20020a17090a390300b001ef81bac701sm1782089pjb.42.2022.07.08.08.47.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 08:47:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [RISU PATCH v4 03/29] Hoist trace file and socket opening
Date: Fri,  8 Jul 2022 21:16:34 +0530
Message-Id: <20220708154700.18682-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220708154700.18682-1-richard.henderson@linaro.org>
References: <20220708154700.18682-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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

We will want to share this code with --dump.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v3: Hoist socket connecting as well as trace file opening.
---
 risu.c | 49 +++++++++++++++++++++++--------------------------
 1 file changed, 23 insertions(+), 26 deletions(-)

diff --git a/risu.c b/risu.c
index 059348f..2f6a677 100644
--- a/risu.c
+++ b/risu.c
@@ -363,6 +363,29 @@ int main(int argc, char **argv)
         }
     }
 
+    if (trace) {
+        if (strcmp(trace_fn, "-") == 0) {
+            comm_fd = ismaster ? STDOUT_FILENO : STDIN_FILENO;
+        } else {
+            if (ismaster) {
+                comm_fd = open(trace_fn, O_WRONLY | O_CREAT, S_IRWXU);
+            } else {
+                comm_fd = open(trace_fn, O_RDONLY);
+            }
+#ifdef HAVE_ZLIB
+            gz_trace_file = gzdopen(comm_fd, ismaster ? "wb9" : "rb");
+#endif
+        }
+    } else {
+        if (ismaster) {
+            fprintf(stderr, "master port %d\n", port);
+            comm_fd = master_connect(port);
+        } else {
+            fprintf(stderr, "apprentice host %s port %d\n", hostname, port);
+            comm_fd = apprentice_connect(hostname, port);
+        }
+    }
+
     imgfile = argv[optind];
     if (!imgfile) {
         fprintf(stderr, "Error: must specify image file name\n\n");
@@ -373,34 +396,8 @@ int main(int argc, char **argv)
     load_image(imgfile);
 
     if (ismaster) {
-        if (trace) {
-            if (strcmp(trace_fn, "-") == 0) {
-                comm_fd = STDOUT_FILENO;
-            } else {
-                comm_fd = open(trace_fn, O_WRONLY | O_CREAT, S_IRWXU);
-#ifdef HAVE_ZLIB
-                gz_trace_file = gzdopen(comm_fd, "wb9");
-#endif
-            }
-        } else {
-            fprintf(stderr, "master port %d\n", port);
-            comm_fd = master_connect(port);
-        }
         return master();
     } else {
-        if (trace) {
-            if (strcmp(trace_fn, "-") == 0) {
-                comm_fd = STDIN_FILENO;
-            } else {
-                comm_fd = open(trace_fn, O_RDONLY);
-#ifdef HAVE_ZLIB
-                gz_trace_file = gzdopen(comm_fd, "rb");
-#endif
-            }
-        } else {
-            fprintf(stderr, "apprentice host %s port %d\n", hostname, port);
-            comm_fd = apprentice_connect(hostname, port);
-        }
         return apprentice();
     }
 }
-- 
2.34.1


