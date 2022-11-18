Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DEBC62F1D6
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 10:51:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovxzh-0007r1-4Z; Fri, 18 Nov 2022 04:49:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ovxzD-0007W5-5Y
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 04:48:39 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ovxzA-000234-Ur
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 04:48:38 -0500
Received: by mail-pj1-x102d.google.com with SMTP id t17so3369227pjo.3
 for <qemu-devel@nongnu.org>; Fri, 18 Nov 2022 01:48:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=HnYcvv8AF0ntFzLUX2nU1QtQidjBThAeYSZTUH5cntU=;
 b=zUZKQnrm+cpGAXvQ7IV2vxTPXZuCpByyYQe42CDDyWuvYlKwUpcD5Vfp4LslEIJFvX
 nTn8frQNYODlkabHCOVdjUvdSexYNNpDJuk/Muo/FfIji38jqrjIRQUKRzVqf5qj+aB0
 BtDtzrSkpC/N80Pch9r+SFZQ6tSGtCKoCbywRoLog5fH9Oa86ultIYfRTkb2hgJMkZvn
 jxOkTIvStrQn55fluFNzGpD0Z7vm2vLj+0vN0UsT28ioEydyu+pbAV1F2RsYYUCDufLV
 Mo4z/bvjwxY1Bv1rfOV/L+OxIKZ5LQa/hkt1RwX2tsdyMxwvgu+i5fzISgOUcvtY+VpB
 OlNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HnYcvv8AF0ntFzLUX2nU1QtQidjBThAeYSZTUH5cntU=;
 b=C0QeTdL9bOtvo3ljce/Af5J+02uA5J1B8QqCjEaT5wSN+iI8q8zggrnSZZ8+FF+/Tl
 fyY21i4N7TlrH3OQ4E9++T97mweurM7e9e3V/lZGPZ7Yqbufi6wjsEOYEU2dHOP1ChCX
 dBVkYbaROJ4Ksyxo8UxIBCL9HfYcCVYs2YDih4SL4QCCsI2Negu40aFXsT2TivCeUcVF
 /8W3KMK7Y0WcWiwGMyhXgbdsj+2jnAtdX81Zbl9o3gTo6R2j1TAER5Asx7hUutNLaevz
 OzpIU8BQalEN1knEh2Mr9F2ckCUZ//RAmM5aXI5DfEzXnHB5Hl/RQ71GR0hmNodUvrUw
 T9dg==
X-Gm-Message-State: ANoB5pmYTkKnwQURerS4iHzZglBZ3NVJ1tNWht/tqF0bEpjLqSpKz23o
 9WMcqfUTgTHkHxewiMH2JocSzHxk5maNRg==
X-Google-Smtp-Source: AA0mqf5ZVJsjPB5eS9oOemHSnG95JGRGEO/ZNvuyIFDyB//h+PsE8b6p1iuzSHb8x7HVDSbdzQ1ArQ==
X-Received: by 2002:a17:90a:710b:b0:218:725:c820 with SMTP id
 h11-20020a17090a710b00b002180725c820mr7022499pjk.170.1668764916001; 
 Fri, 18 Nov 2022 01:48:36 -0800 (PST)
Received: from stoup.. ([2602:47:d48a:1201:90b2:345f:bf0a:c412])
 by smtp.gmail.com with ESMTPSA id
 n12-20020a170902e54c00b0018862bb3976sm3115421plf.308.2022.11.18.01.48.34
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Nov 2022 01:48:35 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-8.0 21/29] tcg/i386: Introduce tcg_out_mov2
Date: Fri, 18 Nov 2022 01:47:46 -0800
Message-Id: <20221118094754.242910-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221118094754.242910-1-richard.henderson@linaro.org>
References: <20221118094754.242910-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Create a helper for data movement minding register overlap.
Use the more general xchg instruction, which consumes one
extra byte, but simplifies the more general function.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.c.inc | 27 +++++++++++++++++++++------
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index f4c0c7b8a2..79568a3981 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -461,6 +461,7 @@ static bool tcg_target_const_match(int64_t val, TCGType type, int ct)
 #define OPC_VPTERNLOGQ  (0x25 | P_EXT3A | P_DATA16 | P_VEXW | P_EVEX)
 #define OPC_VZEROUPPER  (0x77 | P_EXT)
 #define OPC_XCHG_ax_r32	(0x90)
+#define OPC_XCHG_EvGv   (0x87)
 
 #define OPC_GRP3_Eb     (0xf6)
 #define OPC_GRP3_Ev     (0xf7)
@@ -1880,6 +1881,24 @@ static void add_qemu_ldst_label(TCGContext *s, bool is_ld, bool is_64,
     }
 }
 
+/* Move src1 to dst1 and src2 to dst2, minding possible overlap. */
+static void tcg_out_mov2(TCGContext *s,
+                         TCGType type1, TCGReg dst1, TCGReg src1,
+                         TCGType type2, TCGReg dst2, TCGReg src2)
+{
+    if (dst1 != src2) {
+        tcg_out_mov(s, type1, dst1, src1);
+        tcg_out_mov(s, type2, dst2, src2);
+    } else if (dst2 != src1) {
+        tcg_out_mov(s, type2, dst2, src2);
+        tcg_out_mov(s, type1, dst1, src1);
+    } else {
+        /* dst1 == src2 && dst2 == src1 -> xchg. */
+        int w = (type1 == TCG_TYPE_I32 && type2 == TCG_TYPE_I32 ? 0 : P_REXW);
+        tcg_out_modrm(s, OPC_XCHG_EvGv + w, dst1, dst2);
+    }
+}
+
 /*
  * Generate code for the slow path for a load at the end of block
  */
@@ -1947,13 +1966,9 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
     case MO_UQ:
         if (TCG_TARGET_REG_BITS == 64) {
             tcg_out_mov(s, TCG_TYPE_I64, data_reg, TCG_REG_RAX);
-        } else if (data_reg == TCG_REG_EDX) {
-            /* xchg %edx, %eax */
-            tcg_out_opc(s, OPC_XCHG_ax_r32 + TCG_REG_EDX, 0, 0, 0);
-            tcg_out_mov(s, TCG_TYPE_I32, l->datahi_reg, TCG_REG_EAX);
         } else {
-            tcg_out_mov(s, TCG_TYPE_I32, data_reg, TCG_REG_EAX);
-            tcg_out_mov(s, TCG_TYPE_I32, l->datahi_reg, TCG_REG_EDX);
+            tcg_out_mov2(s, TCG_TYPE_I32, data_reg, TCG_REG_EAX,
+                         TCG_TYPE_I32, l->datahi_reg, TCG_REG_EDX);
         }
         break;
     default:
-- 
2.34.1


