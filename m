Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5FB59CBA1
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 00:42:30 +0200 (CEST)
Received: from localhost ([::1]:33354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQG7p-0000Mx-Lo
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 18:42:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQG31-000329-CF
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 18:37:31 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:40858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQG2y-0006YA-Ot
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 18:37:31 -0400
Received: by mail-pl1-x634.google.com with SMTP id x23so11207231pll.7
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 15:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc;
 bh=FxBKtNdKCbvnEBi8NC2mirytLCYQG5plUdqkpMMvZXU=;
 b=BJoIhenf+6spGMQNp1eAc1VMAmjwjprGfLbqyetbzetd6+06/9lOoA9oLQ+36Xh7fq
 qSalRs2ef/AKgcymgCYo3cfy8hGDuJ4DRLfV1xXi/OgAlmhRxZV6k4huG6cCnQK6++A8
 z8p5P+QH008DllxjaiSspdOm74rHAw5n0GTop1k1j5XwCHdf3xD4eSH8zBWQYg0Vd7EQ
 A1edkmDThcB8TId7qOwQD9aVL51LV2zfTZpiPvQCrlotbQ0l17l1Kk0j27Y4uZIj0RIv
 975o1Y0LHa+vjurbmdtYzVMw9vNlSsiK9aYQ9M35wBlnVuamSxGdjypq1TsYWw8rgv7v
 WWXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
 bh=FxBKtNdKCbvnEBi8NC2mirytLCYQG5plUdqkpMMvZXU=;
 b=xZXRu5kmvRwCYs7emge6otjxnWV/hhwN7MgPKoukhwpD+4NiRujqaW7gFBMo8odjyz
 2Qz/LMbr3EI4Res4s7WRXvIZqdhy/Z9coQsif6tMubequMuJiQjlj5XZKoAiVXZ979wE
 jSVx8FWrB5wwJYk03qbxV1fEJBwYvjKq2cR6sbm5QxrvxGFSWbGlshAIlIu7wM8gzlpx
 9+shEPY/n73qdIo4iGdZjYMMBu4soeTJ4BHJxvgsljFYYS+K7DNj03yHeOlrRlwqAzj/
 tcgwLLEZhyPxVVGkUerpxL06bGXV1/F6PNWh2cSfcYHwW5wl62NaFZ5taKwXYQjaipAO
 fG5g==
X-Gm-Message-State: ACgBeo0iCIvR6C54PkecAbLkwaw/tc9z7YNyw4q6Kmli23h5cKfvq2Cc
 3JBI9gtYCoo78bMW5kl1MlN+U2LK1qU6NQ==
X-Google-Smtp-Source: AA6agR7e+ogvLMCJtLR+1hDfjZ5zHXqs9fjEWmeXlGoz4YVJKOCgHBr68F/zmxzqCTLq0pDSPmzPbQ==
X-Received: by 2002:a17:902:7845:b0:16e:d647:a66c with SMTP id
 e5-20020a170902784500b0016ed647a66cmr21513613pln.64.1661207847248; 
 Mon, 22 Aug 2022 15:37:27 -0700 (PDT)
Received: from stoup.. ([71.212.157.236]) by smtp.gmail.com with ESMTPSA id
 z6-20020a63e106000000b0042a2777550dsm7017419pgh.47.2022.08.22.15.37.25
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 15:37:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/6] target/i386: Define XMMReg and access macros
Date: Mon, 22 Aug 2022 15:37:17 -0700
Message-Id: <20220822223722.1697758-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822223722.1697758-1-richard.henderson@linaro.org>
References: <20220822223722.1697758-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This will be used for proper endian adjustments of gvec xmm ops.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/cpu.h | 53 +++++++++++++++++++++++++++++++++++++----------
 1 file changed, 42 insertions(+), 11 deletions(-)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 82004b65b9..81e5abed86 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1233,18 +1233,33 @@ typedef struct SegmentCache {
     uint32_t flags;
 } SegmentCache;
 
-#define MMREG_UNION(n, bits)        \
-    union n {                       \
-        uint8_t  _b_##n[(bits)/8];  \
-        uint16_t _w_##n[(bits)/16]; \
-        uint32_t _l_##n[(bits)/32]; \
-        uint64_t _q_##n[(bits)/64]; \
-        float32  _s_##n[(bits)/32]; \
-        float64  _d_##n[(bits)/64]; \
-    }
+typedef union MMXReg {
+    uint8_t  _b_MMXReg[64 / 8];
+    uint16_t _w_MMXReg[64 / 16];
+    uint32_t _l_MMXReg[64 / 32];
+    uint64_t _q_MMXReg[64 / 64];
+    float32  _s_MMXReg[64 / 32];
+    float64  _d_MMXReg[64 / 64];
+} MMXReg;
 
-typedef MMREG_UNION(ZMMReg, 512) ZMMReg;
-typedef MMREG_UNION(MMXReg, 64)  MMXReg;
+typedef union XMMReg {
+    uint8_t  _b_XMMReg[128 / 8];
+    uint16_t _w_XMMReg[128 / 16];
+    uint32_t _l_XMMReg[128 / 32];
+    uint64_t _q_XMMReg[128 / 64];
+    float32  _s_XMMReg[128 / 32];
+    float64  _d_XMMReg[128 / 64];
+} XMMReg;
+
+typedef union ZMMReg {
+    uint8_t  _b_ZMMReg[512 / 8];
+    uint16_t _w_ZMMReg[512 / 16];
+    uint32_t _l_ZMMReg[512 / 32];
+    uint64_t _q_ZMMReg[512 / 64];
+    float32  _s_ZMMReg[512 / 32];
+    float64  _d_ZMMReg[512 / 64];
+    XMMReg   _x_ZMMReg[512 / 128];
+} ZMMReg;
 
 typedef struct BNDReg {
     uint64_t lb;
@@ -1267,6 +1282,14 @@ typedef struct BNDCSReg {
 #define ZMM_S(n) _s_ZMMReg[15 - (n)]
 #define ZMM_Q(n) _q_ZMMReg[7 - (n)]
 #define ZMM_D(n) _d_ZMMReg[7 - (n)]
+#define ZMM_X(n) _x_ZMMReg[3 - (n)]
+
+#define XMM_B(n) _b_XMMReg[15 - (n)]
+#define XMM_W(n) _w_XMMReg[7 - (n)]
+#define XMM_L(n) _l_XMMReg[3 - (n)]
+#define XMM_S(n) _s_XMMReg[3 - (n)]
+#define XMM_Q(n) _q_XMMReg[1 - (n)]
+#define XMM_D(n) _d_XMMReg[1 - (n)]
 
 #define MMX_B(n) _b_MMXReg[7 - (n)]
 #define MMX_W(n) _w_MMXReg[3 - (n)]
@@ -1279,6 +1302,14 @@ typedef struct BNDCSReg {
 #define ZMM_S(n) _s_ZMMReg[n]
 #define ZMM_Q(n) _q_ZMMReg[n]
 #define ZMM_D(n) _d_ZMMReg[n]
+#define ZMM_X(n) _x_ZMMReg[n]
+
+#define XMM_B(n) _b_XMMReg[n]
+#define XMM_W(n) _w_XMMReg[n]
+#define XMM_L(n) _l_XMMReg[n]
+#define XMM_S(n) _s_XMMReg[n]
+#define XMM_Q(n) _q_XMMReg[n]
+#define XMM_D(n) _d_XMMReg[n]
 
 #define MMX_B(n) _b_MMXReg[n]
 #define MMX_W(n) _w_MMXReg[n]
-- 
2.34.1


