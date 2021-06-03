Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86FE439A581
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 18:13:25 +0200 (CEST)
Received: from localhost ([::1]:33484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lopyG-0002xp-Db
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 12:13:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lopkk-0000L4-Li
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 11:59:26 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:37667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lopke-0006wH-7V
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 11:59:26 -0400
Received: by mail-wr1-x42f.google.com with SMTP id i94so1345973wri.4
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 08:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=0dZUtAFjQWxKrKqvrClsTUtAI33YGQrz6/E16mdLOUw=;
 b=DUT9gH0R/cseY0y1ajDGVODkt2lpPUVjQdIpI+5Bs/g/BoP7yL65Kw/dlnIoCuuetn
 bqLxWNUPtK6kZ3ZfenrIDxY9aW+OLmk1PEo4Bzqa0gwujxkZPOSJ6Q5A6084e7JLJZKg
 3k1Y1mo6hU8yv+irsdQtWGvwM1RGIXNuAbCOjoPaY0KzR06tcIVS/FQ/DA/AVGIVphJn
 JVOBFUeMxbujoaZdghiO92LX0x6rfjy63I3nTFpKXPmt7d0KzNy5l4lbcnf+SXJHJ1tG
 8Mlsw+OreXXeFEI2uviyLlglzXA0IZRnO5s7P/6+5S4NiqeQzCKZn9Ds81OIv6HGpxme
 NpeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0dZUtAFjQWxKrKqvrClsTUtAI33YGQrz6/E16mdLOUw=;
 b=QFNlSNWclfQfY5fQlhX/I88fbhbpe8ptOSCwkhAnNu6gTdDS1S3+ZRzli1RQFMrb9K
 Rer6KswZBhwt39y9GgJQlrA9k3NLVAmarp75+PSDHv7KQTE/joK3Yq6funEm53I6m94w
 kV0PSGImH93uflozoGhvuDRVe+0UFEn0LUipl2tnSuRrAU7fNhiEaae2Rjpvj9s3OsKB
 5wlPnYMzcyxylM0HWIQDayMzG41Vm4+RnUYF/vD4PE3acjxzq9LhipSnmKNbFGZqRrAE
 7mcGKg6Y7RE1hJyT5SCFZSOYx+z453zmSG8l0iSPh2z2zvKmP2vs+mt9if9ybGTImBD1
 ZHYQ==
X-Gm-Message-State: AOAM533mgiVCodrQUNnUQJ7adPYugfUXOMJXpSr8dgSHgvcGIyShZMCw
 393CV2Yzv6EGyg/vDoFwqtoMJ0/MvNuK1nQF
X-Google-Smtp-Source: ABdhPJwwmBIF6/zBcJHbIMIBRuWn1XyD/vcG+mMHYsBJrXDosST+6v3SKO78bk9SYSPXo2V9yGK3zg==
X-Received: by 2002:a5d:4c48:: with SMTP id n8mr601050wrt.327.1622735958929;
 Thu, 03 Jun 2021 08:59:18 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m7sm3856470wrv.35.2021.06.03.08.59.18
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 08:59:18 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 17/45] target/arm: Unify unallocated path in disas_fp_1src
Date: Thu,  3 Jun 2021 16:58:36 +0100
Message-Id: <20210603155904.26021-18-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210603155904.26021-1-peter.maydell@linaro.org>
References: <20210603155904.26021-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

From: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210525225817.400336-3-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-a64.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index d6906d9012c..95c2853f39f 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -6501,8 +6501,7 @@ static void disas_fp_1src(DisasContext *s, uint32_t insn)
     int rd = extract32(insn, 0, 5);
 
     if (mos) {
-        unallocated_encoding(s);
-        return;
+        goto do_unallocated;
     }
 
     switch (opcode) {
@@ -6511,8 +6510,7 @@ static void disas_fp_1src(DisasContext *s, uint32_t insn)
         /* FCVT between half, single and double precision */
         int dtype = extract32(opcode, 0, 2);
         if (type == 2 || dtype == type) {
-            unallocated_encoding(s);
-            return;
+            goto do_unallocated;
         }
         if (!fp_access_check(s)) {
             return;
@@ -6524,8 +6522,7 @@ static void disas_fp_1src(DisasContext *s, uint32_t insn)
 
     case 0x10 ... 0x13: /* FRINT{32,64}{X,Z} */
         if (type > 1 || !dc_isar_feature(aa64_frint, s)) {
-            unallocated_encoding(s);
-            return;
+            goto do_unallocated;
         }
         /* fall through */
     case 0x0 ... 0x3:
@@ -6547,8 +6544,7 @@ static void disas_fp_1src(DisasContext *s, uint32_t insn)
             break;
         case 3:
             if (!dc_isar_feature(aa64_fp16, s)) {
-                unallocated_encoding(s);
-                return;
+                goto do_unallocated;
             }
 
             if (!fp_access_check(s)) {
@@ -6557,11 +6553,12 @@ static void disas_fp_1src(DisasContext *s, uint32_t insn)
             handle_fp_1src_half(s, opcode, rd, rn);
             break;
         default:
-            unallocated_encoding(s);
+            goto do_unallocated;
         }
         break;
 
     default:
+    do_unallocated:
         unallocated_encoding(s);
         break;
     }
-- 
2.20.1


