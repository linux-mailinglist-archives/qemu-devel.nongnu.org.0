Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A0B46EC506
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 07:47:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqoxQ-0005Wd-Tw; Mon, 24 Apr 2023 01:41:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqox6-0005MH-E1
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 01:41:29 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqowt-0004Gs-1c
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 01:41:28 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-2f4c431f69cso2315045f8f.0
 for <qemu-devel@nongnu.org>; Sun, 23 Apr 2023 22:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682314871; x=1684906871;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IJnzORJY4nHB2qHgbe1wyr1FPPmEsXDzn2QzLUICVbI=;
 b=wsrYLo/zEiJ1a2FC+B4pAjorUgO1McKdllwK3A6Rrxz5alsIwaKMGSVQxjZPbSxlrc
 1GcnzLeWh2wXA1WCBterba4Bz5K/9jeBG6R0wy+aaegGwV/f/I1Kxz3y53vsBVyY0ZOd
 YYPJw/urf3rwLn81rTLuO340cBPCkaEXLOoWblgnccdaAOZPvDlnN1S1yc7HHEXpnSvM
 df6JCt/SYGTueFDS9IMWUmNe/UaXhE6DZwZXhrJ3FW/6f9dUeH3u3nNMoSf+LQUW5Xvc
 A4hCBcwfpIjKI7/1MCoiUy7QQLN58UX1L+0WquD8vkuk6ppUv/UPh/aTxsOv58vREtZQ
 99lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682314871; x=1684906871;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IJnzORJY4nHB2qHgbe1wyr1FPPmEsXDzn2QzLUICVbI=;
 b=LNjuRBa8v5Q1eEZsUFxuTL/XEnKRK6LnajQHaHUlz2DLswg4iU5B45O6yEcEZZy1ai
 P77MpZBy/caLQDydPzwBrOnBHTcwOhXX/f87Xf0XL28JklEZta70rvBpx7d9ywUZscB0
 h2TT0H4X6XGMytTtY3fMRl7g+w2C7DaYRC6VzRfS3yGyjZrjfZYJp2Z5+nN1MC4rKqn6
 2ZG9lQFtVdV0NTaP2Kr3RPrblZ8qXCyW7uAoBHinUTQqmyfAAa4iUXiovxssrBxrNovu
 hKTOFX9QGojEjoBIQ5/WkE095GEK5ASJF8KdJLW+Lpq0Mi+1FpNMPsDv742BQ+H9VBsq
 H0EQ==
X-Gm-Message-State: AAQBX9dp837jXOYl/91jqbavJe0Rwz7KA4uHzVKZTFoV9Pynx/c7skEM
 DNop8lOnGak+y24zbgPVi2JmQj9y/L2QtqCyxL0YyA==
X-Google-Smtp-Source: AKy350buJEKr5Eebv4vwR1RO40mHBA1DTr3gNjE7iOknmahnJH4s4QirOxIuWNGuc4C+jPmuVqxs4A==
X-Received: by 2002:adf:fa85:0:b0:2fa:6929:eb81 with SMTP id
 h5-20020adffa85000000b002fa6929eb81mr7889175wrr.31.1682314871540; 
 Sun, 23 Apr 2023 22:41:11 -0700 (PDT)
Received: from stoup.c.hoisthospitality.com
 (cust-west-loneq8-46-193-226-34.wb.wifirst.net. [46.193.226.34])
 by smtp.gmail.com with ESMTPSA id
 j22-20020a5d6e56000000b002fbb285b01fsm9997852wrz.25.2023.04.23.22.41.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Apr 2023 22:41:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 09/57] tcg/i386: Introduce tcg_out_testi
Date: Mon, 24 Apr 2023 06:40:17 +0100
Message-Id: <20230424054105.1579315-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230424054105.1579315-1-richard.henderson@linaro.org>
References: <20230424054105.1579315-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42a.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Split out a helper for choosing testb vs testl.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.c.inc | 30 ++++++++++++++++++------------
 1 file changed, 18 insertions(+), 12 deletions(-)

diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 7a02f79f1b..19625a7c75 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -1753,6 +1753,23 @@ static void tcg_out_nopn(TCGContext *s, int n)
     tcg_out8(s, 0x90);
 }
 
+/* Test register R vs immediate bits I, setting Z flag for EQ/NE. */
+static void __attribute__((unused))
+tcg_out_testi(TCGContext *s, TCGReg r, uint32_t i)
+{
+    /*
+     * This is used for testing alignment, so we can usually use testb.
+     * For i686, we have to use testl for %esi/%edi.
+     */
+    if (i <= 0xff && (TCG_TARGET_REG_BITS == 64 || r < 4)) {
+        tcg_out_modrm(s, OPC_GRP3_Eb | P_REXB_RM, EXT3_TESTi, r);
+        tcg_out8(s, i);
+    } else {
+        tcg_out_modrm(s, OPC_GRP3_Ev, EXT3_TESTi, r);
+        tcg_out32(s, i);
+    }
+}
+
 typedef struct {
     TCGReg base;
     int index;
@@ -2053,18 +2070,7 @@ static void tcg_out_test_alignment(TCGContext *s, bool is_ld, TCGReg addrlo,
     unsigned a_mask = (1 << a_bits) - 1;
     TCGLabelQemuLdst *label;
 
-    /*
-     * We are expecting a_bits to max out at 7, so we can usually use testb.
-     * For i686, we have to use testl for %esi/%edi.
-     */
-    if (a_mask <= 0xff && (TCG_TARGET_REG_BITS == 64 || addrlo < 4)) {
-        tcg_out_modrm(s, OPC_GRP3_Eb | P_REXB_RM, EXT3_TESTi, addrlo);
-        tcg_out8(s, a_mask);
-    } else {
-        tcg_out_modrm(s, OPC_GRP3_Ev, EXT3_TESTi, addrlo);
-        tcg_out32(s, a_mask);
-    }
-
+    tcg_out_testi(s, addrlo, a_mask);
     /* jne slow_path */
     tcg_out_opc(s, OPC_JCC_long + JCC_JNE, 0, 0, 0);
 
-- 
2.34.1


