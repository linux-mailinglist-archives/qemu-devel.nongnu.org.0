Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C3631294F
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 04:25:49 +0100 (CET)
Received: from localhost ([::1]:41850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8xBM-0005ly-RJ
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 22:25:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wSS-0002Tl-5S
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:39:24 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:36484)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wSQ-00067h-77
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:39:23 -0500
Received: by mail-pj1-x1035.google.com with SMTP id gx20so7943040pjb.1
 for <qemu-devel@nongnu.org>; Sun, 07 Feb 2021 18:39:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Kpfe6JZmwXM15Cw7O9Ulgnnkm0DVoqv1s4+DGCwKajc=;
 b=CHCg94PKYsAHOhHjvVNKvl9AEgIOuie4U17Vx2j1Q0mXW+daJtzBHL870wV52I/1Jk
 wP7qGCipx7ORUnIfFMz01mJAX7qTqWSRcAHYFSauUxUyyMWXm8+BGOOLoVjCtKcNs3W1
 y1rMhh/Z/tYpsdV3cbfeXG/hB8jynlm79B0gXRfIzatk/VSUjbPCbZRljz7JrhenC4ja
 v8TNSyAEez60lpQVyUfQ4kIT7zFhzOEt0Xnr5o5Mb+gL2yWSIJBYPTbUX0qI3MU//9EY
 PUCtKq3AWsGmP5UF+LsD68eN0BEWayRy0MMt0TGtxr/qe2eJ+dU07dxdhn3kHQZI7jVU
 /lVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Kpfe6JZmwXM15Cw7O9Ulgnnkm0DVoqv1s4+DGCwKajc=;
 b=A9Q7OAl6JPzTNIrnY8FKHCfEVYnbx+E/AfQKNN/P3roYg9DSIQohcT6RMfLKwYr1kM
 XdxpBL/Ku3rYNQ4aA6bAHrs2T6QfayI/5wamXUUpWfHfXQrb8uIfVxPMHgZF3+dsGJGY
 5WedijyAlDU09gUOdXe+zFWOxpRHGIktQY0WarxP8J0SNqAfR/QmBeHMPaloQpZoAf1K
 2DxvR2lqiqAoADiiPJLWZB6G8f/B3OQA/hKQSnUC4nosC6BkAKqAF9U8evBsoI4DoN87
 x81ZposmJwlzVZDMgBo7Wz5YGHos1XCM1k0zBZiBcgej3G+fDdvtufR0rEZhMjNYNUzE
 P2uQ==
X-Gm-Message-State: AOAM530SpMsepchMUp8Y/6rYt1BZ2unb0T20pNP87OuleXVu1KR6cnSD
 SdSHTcsKuWGK+u/lKXtgpeJSOHxLPNGRUg==
X-Google-Smtp-Source: ABdhPJz9cDuFtiE6ZXqnrSLEys6PC6HYJ/TOA4IO6T8bSxr9lRGQ0cprfXhcFEH2n1LzWqBrcmMOtQ==
X-Received: by 2002:a17:902:724c:b029:e2:d560:30b6 with SMTP id
 c12-20020a170902724cb02900e2d56030b6mr3497583pll.60.1612751959257; 
 Sun, 07 Feb 2021 18:39:19 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id 74sm650954pfw.53.2021.02.07.18.39.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 18:39:18 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 45/70] tcg/tci: Split out tcg_out_op_rr
Date: Sun,  7 Feb 2021 18:37:27 -0800
Message-Id: <20210208023752.270606-46-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210208023752.270606-1-richard.henderson@linaro.org>
References: <20210208023752.270606-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
Cc: sw@weilnetz.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

At the same time, validate the type argument in tcg_out_mov.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci/tcg-target.c.inc | 36 +++++++++++++++++++++++-------------
 1 file changed, 23 insertions(+), 13 deletions(-)

diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index cb0cbbb8da..272e3ca70b 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -303,6 +303,17 @@ static void tcg_out_op_p(TCGContext *s, TCGOpcode op, void *p0)
     old_code_ptr[1] = s->code_ptr - old_code_ptr;
 }
 
+static void tcg_out_op_rr(TCGContext *s, TCGOpcode op, TCGReg r0, TCGReg r1)
+{
+    uint8_t *old_code_ptr = s->code_ptr;
+
+    tcg_out_op_t(s, op);
+    tcg_out_r(s, r0);
+    tcg_out_r(s, r1);
+
+    old_code_ptr[1] = s->code_ptr - old_code_ptr;
+}
+
 static void tcg_out_op_rrs(TCGContext *s, TCGOpcode op,
                            TCGReg r0, TCGReg r1, intptr_t i2)
 {
@@ -337,16 +348,18 @@ static void tcg_out_ld(TCGContext *s, TCGType type, TCGReg val, TCGReg base,
 
 static bool tcg_out_mov(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg)
 {
-    uint8_t *old_code_ptr = s->code_ptr;
-    tcg_debug_assert(ret != arg);
-#if TCG_TARGET_REG_BITS == 32
-    tcg_out_op_t(s, INDEX_op_mov_i32);
-#else
-    tcg_out_op_t(s, INDEX_op_mov_i64);
+    switch (type) {
+    case TCG_TYPE_I32:
+        tcg_out_op_rr(s, INDEX_op_mov_i32, ret, arg);
+        break;
+#if TCG_TARGET_REG_BITS == 64
+    case TCG_TYPE_I64:
+        tcg_out_op_rr(s, INDEX_op_mov_i64, ret, arg);
+        break;
 #endif
-    tcg_out_r(s, ret);
-    tcg_out_r(s, arg);
-    old_code_ptr[1] = s->code_ptr - old_code_ptr;
+    default:
+        g_assert_not_reached();
+    }
     return true;
 }
 
@@ -534,10 +547,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
     CASE_32_64(bswap16)  /* Optional (TCG_TARGET_HAS_bswap16_*). */
     CASE_32_64(bswap32)  /* Optional (TCG_TARGET_HAS_bswap32_*). */
     CASE_64(bswap64)     /* Optional (TCG_TARGET_HAS_bswap64_i64). */
-        tcg_out_op_t(s, opc);
-        tcg_out_r(s, args[0]);
-        tcg_out_r(s, args[1]);
-        old_code_ptr[1] = s->code_ptr - old_code_ptr;
+        tcg_out_op_rr(s, opc, args[0], args[1]);
         break;
 
 #if TCG_TARGET_REG_BITS == 32
-- 
2.25.1


