Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FFEE39E503
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 19:12:40 +0200 (CEST)
Received: from localhost ([::1]:40450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqInn-0003XY-JG
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 13:12:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIaA-00078W-6G
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 12:58:34 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:44984)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIa6-0007se-Is
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 12:58:33 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 p13-20020a05600c358db029019f44afc845so50655wmq.3
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 09:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=liF1YOsdelJng9PAu4BBSFSGov6zweQvfaGcLTYKw1Y=;
 b=rqamJsXfqBLDaGOlJsBlI7/bL/aogn9k9OG2cM2YzPSHHb789uWaYx1MZdpFHbUl10
 TsuvPmANNmDi4VpmBhAAkE1D2C04PU7MLca87vRCeXkbfeOlu+dNXtplgJxVaDsdZoBu
 N8ZdxqyUid9AXQRC82CmmJimOdXPYNlaWYHh77O/Xho8z8KSfzmaH6Y9ZtpJXGuYJdZn
 HF4uhrxpufBKkkSSjKtUimlu8p+kye7f+BK+spawy86ytf8CjBkaGbNaNV0CBRTbWiWt
 tXN01ZuwLAZN95RRQeFOR9Giq263xZnzOXyti8HpaiZAaItHihKqXAguQYoCJZ0XaCt4
 FLow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=liF1YOsdelJng9PAu4BBSFSGov6zweQvfaGcLTYKw1Y=;
 b=bMJm1x+h0jAtOH03PUPW+1cTI8c9I93CkPV6M1P0RYr0iP5ys8A+gI1CuCswowHgJG
 s+Tyx7tbrxQ0RXgP/PaFPjfz0q6zOU1zoqwFvrzd6eVdTFg7MM09yysYJTN5yaev1P8g
 p9jWvNS+Bh6Vud4vxx8qfaZw5bbV4bkUwJ7EGXq9hhmUKCjoQNzEoy41TXW0oiJvaM5m
 I84ORkcvJtLDIxgGtU6Pwe0ajSK9zHRpzAxI0TxPWPLaSHYJM2QP3urae+Ndcj8OnFYb
 sa/twW//KuVLuhTXx00DxK5Y5zgoX+4IZXaevYPPb6bNvHmfk0hf0kFG/lrBzd97OKRy
 uPgA==
X-Gm-Message-State: AOAM532ntrcwMC1vH/gETgb4JBEh2W8Lnh47Xg+6H540ShQxTUonApEZ
 1ve35LmI/fme9PhhgKvCNvdE7g==
X-Google-Smtp-Source: ABdhPJydk7mjZD3GAuTkX4ZF80gSyutQ/AQ+s2AFDU7R2rTWIlb5pzk1QvW1VKfUtGOUJsn5EZl5Sw==
X-Received: by 2002:a05:600c:190c:: with SMTP id
 j12mr18269843wmq.42.1623085109209; 
 Mon, 07 Jun 2021 09:58:29 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n10sm18891677wre.95.2021.06.07.09.58.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 09:58:28 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 06/55] target/arm: Implement MVE LCTP
Date: Mon,  7 Jun 2021 17:57:32 +0100
Message-Id: <20210607165821.9892-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210607165821.9892-1-peter.maydell@linaro.org>
References: <20210607165821.9892-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement the MVE LCTP instruction.

We put its decode and implementation with the other
low-overhead-branch insns because although it is only present if MVE
is implemented it is logically in the same group as the other LOB
insns.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/t32.decode  |  2 ++
 target/arm/translate.c | 24 ++++++++++++++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/target/arm/t32.decode b/target/arm/t32.decode
index 8b2c487fa7a..087e514e0ac 100644
--- a/target/arm/t32.decode
+++ b/target/arm/t32.decode
@@ -674,5 +674,7 @@ BL               1111 0. .......... 11.1 ............         @branch24
     DLS          1111 0 0000 100     rn:4 1110 0000 0000 0001
     WLS          1111 0 0000 100     rn:4 1100 . .......... 1 imm=%lob_imm
     LE           1111 0 0000 0 f:1 0 1111 1100 . .......... 1 imm=%lob_imm
+
+    LCTP         1111 0 0000 000     1111 1110 0000 0000 0001
   ]
 }
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 1a7a32c1be4..2f6c012f672 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -8192,6 +8192,30 @@ static bool trans_LE(DisasContext *s, arg_LE *a)
     return true;
 }
 
+static bool trans_LCTP(DisasContext *s, arg_LCTP *a)
+{
+    /*
+     * M-profile Loop Clear with Tail Predication. Since our implementation
+     * doesn't cache branch information, all we need to do is reset
+     * FPSCR.LTPSIZE to 4.
+     */
+    TCGv_i32 ltpsize;
+
+    if (!dc_isar_feature(aa32_lob, s) ||
+        !dc_isar_feature(aa32_mve, s)) {
+        return false;
+    }
+
+    if (!vfp_access_check(s)) {
+        return true;
+    }
+
+    ltpsize = tcg_const_i32(4);
+    store_cpu_field(ltpsize, v7m.ltpsize);
+    return true;
+}
+
+
 static bool op_tbranch(DisasContext *s, arg_tbranch *a, bool half)
 {
     TCGv_i32 addr, tmp;
-- 
2.20.1


