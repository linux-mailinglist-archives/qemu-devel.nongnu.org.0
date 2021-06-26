Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B483B4D2B
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Jun 2021 08:42:32 +0200 (CEST)
Received: from localhost ([::1]:36314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lx21P-000891-Ra
	for lists+qemu-devel@lfdr.de; Sat, 26 Jun 2021 02:42:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lx1vn-00021k-To
 for qemu-devel@nongnu.org; Sat, 26 Jun 2021 02:36:44 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:37774)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lx1vk-0000KF-My
 for qemu-devel@nongnu.org; Sat, 26 Jun 2021 02:36:43 -0400
Received: by mail-pg1-x534.google.com with SMTP id t9so10126488pgn.4
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 23:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+Z2F/wuQLEHyVLnC+li6X93xcsERI6QFaBhmSqRbVh0=;
 b=ER1udB867Dxe4QshKJb5P3mTWtXxLgaVQ7kDnNfoPF24Ohhv5nmNEHIFkUg5x1qoTO
 jWzqRV3+YwI5y/FrpQM71YL0PXwy1uTGWsMW3s8cw2Fyy7lRnQAqvLSUE+PAhuT6x86e
 dTDONKqqFIXMm2R4Ar96hpBuJ1S6w7AsF8ydnhRsgeYob6rppar8+eqhZWYB98+9Te1G
 i+GMaIM0cLqZIy3rw9CTH3XORiHUzzOtwSMzwYdwFwskJE9dBzvZZRvenVk30qbuJvyQ
 mug7rpfa9ytwEoUIIK0SmT4DEbkMmecq+dtzMzRjvEIAjI4WgOn6LBuAtN47fJGRRCvD
 dhaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+Z2F/wuQLEHyVLnC+li6X93xcsERI6QFaBhmSqRbVh0=;
 b=um108EKwcFl0h4PYxhfTkgmpmwEnCWfz6nijeNBOAyXc64FXyhsGucm4yrDxyoV334
 Z05XZ6FI7nLlc5Pur0Pdj4wKCbtydhMSWnRmefwmu5PNUa7IRFhSI9S+6IlADgTKgVYP
 BPzpGvzjpwMTEHtMWSb6zlqrGEp2TZCFvq1yKZQQvDJZ8ftq/2ji5nLOpMMDiOvf3MMi
 wFgurOxPZocEXnue3NyJ+UCEHUmNc+bmsyiooe6LmjJ/P0mg0XRtnUrnRUHJaHu8YZLd
 V6xaAVQYr7dvTCT2AbShedQfFetrB1o/L/D5IjrV7Ugq64agr8fbory0890etS9RGn+N
 ILhw==
X-Gm-Message-State: AOAM531N0TNWEVnDot2JXO7vao1oeUHGsKTDYS4VidMG4Iych0EDO1DJ
 negXYmZXWpzvtikd84FeOyzX3dTpbzkyjQ==
X-Google-Smtp-Source: ABdhPJzaVJDf+XwqwKaBCclds5JpPXDO/1c0ZlPvMF3MJgMFkUYo22sBb6CzMnTYXrsMI9JArVfsDg==
X-Received: by 2002:a63:1913:: with SMTP id z19mr572119pgl.294.1624689399377; 
 Fri, 25 Jun 2021 23:36:39 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id v9sm7724201pgq.54.2021.06.25.23.36.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jun 2021 23:36:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 11/29] tcg/ppc: Support bswap flags
Date: Fri, 25 Jun 2021 23:36:13 -0700
Message-Id: <20210626063631.2411938-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210626063631.2411938-1-richard.henderson@linaro.org>
References: <20210626063631.2411938-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
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
Cc: qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For INDEX_op_bswap32_i32, pass 0 for flags: input not zero-extended,
output does not need extension within the host 64-bit register.

Cc: qemu-ppc@nongnu.org
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/ppc/tcg-target.c.inc | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index da6d10722e..33f0139519 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -789,7 +789,7 @@ static inline void tcg_out_sari64(TCGContext *s, TCGReg dst, TCGReg src, int c)
     tcg_out32(s, SRADI | RA(dst) | RS(src) | SH(c & 0x1f) | ((c >> 4) & 2));
 }
 
-static void tcg_out_bswap16(TCGContext *s, TCGReg dst, TCGReg src)
+static void tcg_out_bswap16(TCGContext *s, TCGReg dst, TCGReg src, int flags)
 {
     TCGReg tmp = dst == src ? TCG_REG_R0 : dst;
 
@@ -804,10 +804,14 @@ static void tcg_out_bswap16(TCGContext *s, TCGReg dst, TCGReg src)
     /* tmp = dep(tmp, rol32(src, 8), 0x0000ff00)    = 000000dc */
     tcg_out_rlw(s, RLWIMI, tmp, src, 8, 16, 23);
 
-    tcg_out_mov(s, TCG_TYPE_REG, dst, tmp);
+    if (flags & TCG_BSWAP_OS) {
+        tcg_out_ext16s(s, dst, tmp);
+    } else {
+        tcg_out_mov(s, TCG_TYPE_REG, dst, tmp);
+    }
 }
 
-static void tcg_out_bswap32(TCGContext *s, TCGReg dst, TCGReg src)
+static void tcg_out_bswap32(TCGContext *s, TCGReg dst, TCGReg src, int flags)
 {
     TCGReg tmp = dst == src ? TCG_REG_R0 : dst;
 
@@ -825,7 +829,11 @@ static void tcg_out_bswap32(TCGContext *s, TCGReg dst, TCGReg src)
     /* tmp = dep(tmp, rol32(src, 24), 0x0000ff00)   = 0000dcba */
     tcg_out_rlw(s, RLWIMI, tmp, src, 24, 16, 23);
 
-    tcg_out_mov(s, TCG_TYPE_REG, dst, tmp);
+    if (flags & TCG_BSWAP_OS) {
+        tcg_out_ext32s(s, dst, tmp);
+    } else {
+        tcg_out_mov(s, TCG_TYPE_REG, dst, tmp);
+    }
 }
 
 static void tcg_out_bswap64(TCGContext *s, TCGReg dst, TCGReg src)
@@ -2851,11 +2859,13 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
 
     case INDEX_op_bswap16_i32:
     case INDEX_op_bswap16_i64:
-        tcg_out_bswap16(s, args[0], args[1]);
+        tcg_out_bswap16(s, args[0], args[1], args[2]);
         break;
     case INDEX_op_bswap32_i32:
+        tcg_out_bswap32(s, args[0], args[1], 0);
+        break;
     case INDEX_op_bswap32_i64:
-        tcg_out_bswap32(s, args[0], args[1]);
+        tcg_out_bswap32(s, args[0], args[1], args[2]);
         break;
     case INDEX_op_bswap64_i64:
         tcg_out_bswap64(s, args[0], args[1]);
-- 
2.25.1


