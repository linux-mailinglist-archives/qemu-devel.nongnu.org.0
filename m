Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CAED62F1EA
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 10:55:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovxzi-0007v7-Sb; Fri, 18 Nov 2022 04:49:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ovxzE-0007bb-RD
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 04:48:40 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ovxzD-000273-7S
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 04:48:40 -0500
Received: by mail-pj1-x1036.google.com with SMTP id o7so4062929pjj.1
 for <qemu-devel@nongnu.org>; Fri, 18 Nov 2022 01:48:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=B0xOCtQZQe59jgjNlZHBf8IwoOD6gwjokoZIbeqtl8U=;
 b=mmBzMdnptpoklzC/1rwuPYaZiGJd2CxR2djw+00kqEoWfAZexCIM5R+I1CbebySydq
 z5lruA6s/O/2hnJN7eDz90CEcAHnnCsLdQp6JutTwGdA/+L+bvEv70Ew/6agJQSLkI9m
 UxLfuQOg32WUA7H7sfel3EUKnUOwjk0/Nyy6OzReR1qWL+Cnkz22wsJ7HEXNoR7xs5UI
 um66N4Qvi/bpouvPA2XhGkRTT83v0NmnAtx2TKdLlcvi78DRyAFK/2Epb+j2JoXD3DQ4
 8k9F0Gm1o/u8pfR2kCTCnw6jiDpQPjNhyPdU++bkK1qojXJaIfL2sAuXMiKbQk4EK8AX
 VAqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B0xOCtQZQe59jgjNlZHBf8IwoOD6gwjokoZIbeqtl8U=;
 b=Pp5zAdHnyYUwUsFhpmq43YOkKht5CQ0d/7h+eUeTRbTjW9A/0uL3X+5H+srnHNl0Xs
 DwQTsfrXKceR1u2c9hN9J6d2Idety1t0W/FRt611i1lQbPHnR4rwR3fmPEEcBIw8AIdc
 hh8HgjY67WnmkD3wlWby+dE0dteBMxU7pGCK+0L7UrgZICTBZjXm/4UziqnjP4Ujnjgc
 7LAEtczcfCh4lep7frmYTmI80JdN2zW6VieHHMCl6fs2EdH575T/vLBqCb0ulnQ9v251
 P2i5I6fK/YIB0S/s/6RNSaPCsKqkJd4covQzxtRe4k9iBT46B2xqk7s5l1alWNyH9pV6
 M0QQ==
X-Gm-Message-State: ANoB5pnTSdi9ro0gFajeqqnfXve7nBtdy2LUOn58yrggAoQ4mz29vyI+
 qKKBArABt+desqc5V5cA0Eu2kLxYhE53yQ==
X-Google-Smtp-Source: AA0mqf6e+wg7shrSLbIAqZEkWvTR3uo/EpbWI3vqXOLKoeuMBOAOoCVCH/P4zZinjRiKtAhQlPhg/w==
X-Received: by 2002:a17:903:1015:b0:186:f256:91d1 with SMTP id
 a21-20020a170903101500b00186f25691d1mr6750651plb.151.1668764917818; 
 Fri, 18 Nov 2022 01:48:37 -0800 (PST)
Received: from stoup.. ([2602:47:d48a:1201:90b2:345f:bf0a:c412])
 by smtp.gmail.com with ESMTPSA id
 n12-20020a170902e54c00b0018862bb3976sm3115421plf.308.2022.11.18.01.48.36
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Nov 2022 01:48:36 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-8.0 22/29] tcg/i386: Introduce tcg_out_testi
Date: Fri, 18 Nov 2022 01:47:47 -0800
Message-Id: <20221118094754.242910-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221118094754.242910-1-richard.henderson@linaro.org>
References: <20221118094754.242910-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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

Split out a helper for choosing testb vs testl.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.c.inc | 30 ++++++++++++++++++------------
 1 file changed, 18 insertions(+), 12 deletions(-)

diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 79568a3981..5ddbbbaf18 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -1729,6 +1729,23 @@ static void tcg_out_nopn(TCGContext *s, int n)
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
 #if defined(CONFIG_SOFTMMU)
 /*
  * helper signature: helper_ld*_mmu(CPUState *env, target_ulong addr,
@@ -2056,18 +2073,7 @@ static void tcg_out_test_alignment(TCGContext *s, bool is_ld, TCGReg addrlo,
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


