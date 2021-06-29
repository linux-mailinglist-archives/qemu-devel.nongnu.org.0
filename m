Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C74343B78E5
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 21:53:11 +0200 (CEST)
Received: from localhost ([::1]:39838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyJnC-0001nR-Qo
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 15:53:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyIwO-00041d-Si
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:58:38 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:46061)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyIwE-0002yc-3j
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:58:36 -0400
Received: by mail-pl1-x634.google.com with SMTP id i4so24508plt.12
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 11:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7msiHj3qRqDXmXMBT7iQkL/E88P+bjdwsV5vRLWQzo8=;
 b=nI2tZx+ioZFycQqVGcyE8pgy2N7DHk0YH45MXKU3YlVGFPzcMm4InWi4aoRUTTHxCt
 2KFigbT/90RGi6z/lakIy7Zq+CZD2niJxFonV3kgPyZ4+yGfaLJkUE9ZXgtCC5O9HhGQ
 +x+5lx0zyyE/BkHc2veE52SNErYLuZGkDGfWgSeFfngIcNivItWNNuuXKjDYOW0FXC+Z
 4pBr4rZBV7dSOrFIlytYIfO1gnKVapW5+xBdCF03c1ViZNRuZJALfHd698r3Yk/7SZyt
 YpUYrYtDvvlLeS4QjvIRK1REnoY4ZxQ2lechmYJ4PX/t9dLYBDMEBenf9O8bwIy3DOtL
 oHFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7msiHj3qRqDXmXMBT7iQkL/E88P+bjdwsV5vRLWQzo8=;
 b=dbYoY/JiiOKkDE1e8NC0O2lbVOfpnHs8Al6l5+ZSezKilZvnL2BiO1i5QG2d7gO0uS
 f34TYLW9wE1DTo2kwoWPFWBBDNrizjEDUkx3WZ3YYz7u/ZsqbEUlewDEcJZa8yRCDKYm
 UJXyDIT4ChQmkzddhCGV359zF7iJUq9+CqFSBflSTvVK4+pHEU+hv/IbvIUGYPVYuSgl
 ZJUdskGgNGQtCtqG03gx1LoS2GmCILfTFoKK0PfSPLoZbjU68Jy9pqPG6FvUGtoIzc9Q
 sRLDnYruJ0MOiENWNnZAvM4lfGL3NSABo64VYuPs+D36I9/6Tz35fWf7YKSGWRqpp7lK
 OjzA==
X-Gm-Message-State: AOAM533Ac0rG4fKaMab7oW/c/vCz/z+mSMmVG4JP62e6oWZtDbJEy883
 5VzGZFFrRImtITEoARnO4H1WBA1R3uISnQ==
X-Google-Smtp-Source: ABdhPJws9Ewhq7SA6pEr+w5ZFuIhpRB4vWvdg7vrkoV5EQCz7OeSh0Pq5VmIzifN4GOvgfEKQju2Kw==
X-Received: by 2002:a17:902:e850:b029:127:a2ed:9924 with SMTP id
 t16-20020a170902e850b0290127a2ed9924mr25259103plg.57.1624993104866; 
 Tue, 29 Jun 2021 11:58:24 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id 21sm18002849pfh.103.2021.06.29.11.58.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 11:58:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 45/63] tcg/ppc: Support bswap flags
Date: Tue, 29 Jun 2021 11:54:37 -0700
Message-Id: <20210629185455.3131172-46-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210629185455.3131172-1-richard.henderson@linaro.org>
References: <20210629185455.3131172-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For INDEX_op_bswap32_i32, pass 0 for flags: input not zero-extended,
output does not need extension within the host 64-bit register.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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


