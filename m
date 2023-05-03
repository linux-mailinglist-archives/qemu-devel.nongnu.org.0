Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F7B6F5119
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 09:19:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6Qr-0007VS-9I; Wed, 03 May 2023 02:57:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6Qn-0007SZ-SM
 for qemu-devel@nongnu.org; Wed, 03 May 2023 02:57:41 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6Qh-0001gI-51
 for qemu-devel@nongnu.org; Wed, 03 May 2023 02:57:41 -0400
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-2f58125b957so4721688f8f.3
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 23:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097054; x=1685689054;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l0A/LgUi4z6B1lwW4uNcjXdWAYm4PmHLzeyxMeuQV08=;
 b=zYH75eiNuH+AiV7xV48mbTHPZV7JvMjteYsyM2Q2x5IasI+DeWTxwbWXoa+/sNbkJ2
 ySOX+AjGqEmZwY7penQ9Cl+KZIxL9CmzRNj5nSJJL2q/SrV2PIPxu/0srq89Iod9y4T4
 EaQMWv71+0KuBYjHMlCJVSopMO+awE+wm66t4GdyWOft+tR9L3sAPPlVaNFQXITnwwft
 A5ykygpevGcHtZXiz2rCsGiyRJUAHuOQOwAq3WtUUPUMGC04YxzXQYUPbvFm/QSSa7Se
 nwFEcOF5E7e7AfkaUr81E9g2g0HFcmQJxxNH7B4r82NSoh7PO18rBpyTBB493nuu6aI8
 eSCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097054; x=1685689054;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=l0A/LgUi4z6B1lwW4uNcjXdWAYm4PmHLzeyxMeuQV08=;
 b=NAEmyNhDEupHSM9A3w5H141qLu2dLvZY5EW6a8dYP0M5yut5L315NDc1KuIn+W8DgA
 Zh4b5BAf3H8bIjI+9b4Coqp73bgiaMKKkBuCUfcI2ui+u10DRTZ7HdWwmhcXx1nswCyT
 8ABuiITn8+Ntp47DuAmkg2/vnB38OCXQs1FuSc5GPnIQJGHEovRLzwNf2DPax66fl1kH
 1tXkn7v1RSvx3a79tMZz0vbkzoWE7iAM5xf+3hsyMH3w0bn2auJL6V83sF1xibw639K1
 4b7ISBRNXWVxW/c84MIA7PAFTCu6fUvjwDvXnjZKMUKURri1uvoabHV09BoZ+ba1pgr7
 taqA==
X-Gm-Message-State: AC+VfDxYMAvsmHy2TyWdBGVW+8zJqjFMTkawf9vhMyQEH6TEtJdOrDJe
 8Nr/LKRU8ehWQnjBJDtVm9W6Y50KFwAyJiPdClkwjA==
X-Google-Smtp-Source: ACHHUZ6xR6osH13PirE5A7CfiqcmFdZfmNwYANx+3Bk3DCBryNSOsFfLdEIQhp0uPlbSDGYs0iEtJQ==
X-Received: by 2002:adf:fbca:0:b0:306:43a4:86b with SMTP id
 d10-20020adffbca000000b0030643a4086bmr507000wrs.4.1683097053812; 
 Tue, 02 May 2023 23:57:33 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 f6-20020a5d6646000000b002f6dafef040sm32796617wrw.12.2023.05.02.23.57.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 23:57:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, philmd@linaro.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v4 05/54] tcg/i386: Introduce tcg_out_testi
Date: Wed,  3 May 2023 07:56:40 +0100
Message-Id: <20230503065729.1745843-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503065729.1745843-1-richard.henderson@linaro.org>
References: <20230503065729.1745843-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x434.google.com
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
index 78160f453b..aae698121a 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -1751,6 +1751,23 @@ static void tcg_out_nopn(TCGContext *s, int n)
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
@@ -2051,18 +2068,7 @@ static void tcg_out_test_alignment(TCGContext *s, bool is_ld, TCGReg addrlo,
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


