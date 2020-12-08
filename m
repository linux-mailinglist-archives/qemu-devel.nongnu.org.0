Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31BE72D3205
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 19:21:56 +0100 (CET)
Received: from localhost ([::1]:43984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmhcZ-0000Xh-4x
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 13:21:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmhJK-0008D1-Rb
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 13:02:02 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:40901)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmhJI-0006Qa-LM
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 13:02:02 -0500
Received: by mail-ot1-x341.google.com with SMTP id j12so16590884ota.7
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 10:02:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mHiA1C5Y7pkklfwKOXVU5WKjHSgV8PTwFN03Z8NX718=;
 b=W9L2BtUwbPBh+M7M4z9vPNjQJEHsvsMiTRbfMW6ZMCjt8z2gkA+NWuvWo99VScU7ZZ
 QBGFNfFZwnnclx2nxa/s8mUXb6xIwuVzWdWCuowozjWHBa4NGZ1VeVLR2htv/h2XzPCs
 E2EpEPSb5jxhMuhUhLcRmb8Hfqer+q6SmZI9yS5EJk2zu5mM87+3FfDLbpwuyqUehk16
 VTR8rCnhtAxx5yod47lN96JNgfStlSRXuQ10GmJaR3faLccF1SFlYMVfjU7YN7x32scN
 IzGNoSF79oxpY+br5hLdd7EQhEhomMf20VLljvk9gmX8QeUeoqYNpw9tIqSEzdEvXt+l
 2Ebg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mHiA1C5Y7pkklfwKOXVU5WKjHSgV8PTwFN03Z8NX718=;
 b=S2NeDHfbTydEroxfCh4seceM+uTUihI2SmSqNAg26Sbau3dGOnIrq0EOLodgPGl5pp
 cL8f1kx/X1fEethkB407ESvoWxYWocQsTjEuJAcOHBdO+9+DbV94UYZCrARpDoDuXgWY
 Uis58KnOmje/FxQS4Ub+oymgoJYNsPNX7mkfTmomMz8/Y7W9WVlEQ6JiXHAUGF1PX5zF
 8trjmsRTPjch4jSqsZpjls7mDR/9n6thcyteIbnX4ltdD4MuX4AJkUoHjTkAgsMZlXEh
 ps9XpxPJ47XncBX595DESQtCAOW6ypFY9wZayFp3Kp1RkIn7K28ZPhpR6x/tXS26xAJ5
 N8IA==
X-Gm-Message-State: AOAM531IGdM9VnqWQVRLhF2nm0V0ZrHrp/A9Gh6fkGVcWFUkAYe6QmuQ
 y8OuhyBwNwCRHtNqN+uTrlIbGV70+0iZgnRP
X-Google-Smtp-Source: ABdhPJx3lmScJOYgYdeGHzVgGBornCJNQOHop5r89HOoWPGdPVGWMRhgRVjSdbWbkY53P9M6TIDG+Q==
X-Received: by 2002:a05:6830:1610:: with SMTP id
 g16mr8739416otr.345.1607450519413; 
 Tue, 08 Dec 2020 10:01:59 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id k20sm3886805oig.35.2020.12.08.10.01.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 10:01:58 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 21/24] target/arm: Enforce alignment for aa64 vector
 LDn/STn (multiple)
Date: Tue,  8 Dec 2020 12:01:15 -0600
Message-Id: <20201208180118.157911-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201208180118.157911-1-richard.henderson@linaro.org>
References: <20201208180118.157911-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::341;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x341.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 4395721446..93065242cc 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -3606,7 +3606,7 @@ static void disas_ldst_multiple_struct(DisasContext *s, uint32_t insn)
     bool is_postidx = extract32(insn, 23, 1);
     bool is_q = extract32(insn, 30, 1);
     TCGv_i64 clean_addr, tcg_rn, tcg_ebytes;
-    MemOp endian = s->be_data;
+    MemOp endian, align, mop;
 
     int total;    /* total bytes */
     int elements; /* elements per vector */
@@ -3674,6 +3674,7 @@ static void disas_ldst_multiple_struct(DisasContext *s, uint32_t insn)
     }
 
     /* For our purposes, bytes are always little-endian.  */
+    endian = s->be_data;
     if (size == 0) {
         endian = MO_LE;
     }
@@ -3692,11 +3693,17 @@ static void disas_ldst_multiple_struct(DisasContext *s, uint32_t insn)
      * Consecutive little-endian elements from a single register
      * can be promoted to a larger little-endian operation.
      */
+    align = MO_ALIGN;
     if (selem == 1 && endian == MO_LE) {
+        align = pow2_align(size);
         size = 3;
     }
-    elements = (is_q ? 16 : 8) >> size;
+    if (!s->align_mem) {
+        align = 0;
+    }
+    mop = endian | size | align;
 
+    elements = (is_q ? 16 : 8) >> size;
     tcg_ebytes = tcg_const_i64(1 << size);
     for (r = 0; r < rpt; r++) {
         int e;
@@ -3705,9 +3712,9 @@ static void disas_ldst_multiple_struct(DisasContext *s, uint32_t insn)
             for (xs = 0; xs < selem; xs++) {
                 int tt = (rt + r + xs) % 32;
                 if (is_store) {
-                    do_vec_st(s, tt, e, clean_addr, size | endian);
+                    do_vec_st(s, tt, e, clean_addr, mop);
                 } else {
-                    do_vec_ld(s, tt, e, clean_addr, size | endian);
+                    do_vec_ld(s, tt, e, clean_addr, mop);
                 }
                 tcg_gen_add_i64(clean_addr, clean_addr, tcg_ebytes);
             }
-- 
2.25.1


