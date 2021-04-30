Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC3236F8A7
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 12:46:13 +0200 (CEST)
Received: from localhost ([::1]:57030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcQey-00049I-7C
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 06:46:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcQU0-0007QS-0W
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:34:52 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:39740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcQTx-0001FF-Vu
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:34:51 -0400
Received: by mail-wr1-x436.google.com with SMTP id q9so15850934wrs.6
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 03:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=QwgC2LRCCGx4j46qUDfFTi9+GYO+7HwI5AJVYUxUdkI=;
 b=Kb1tfQgUJkmafQdaNRy2ziTzPQPv9kf1oQj+kJqpBHLNrKfnh0mfdOkgRRP6AkFCMB
 fOF8lH+63LpLmYh30P9TD3o70eW0Etwe9dybEL2tMk3+/tNzsc0zsU9aiaZxE6QD6FoB
 O8uB0Zs0OvtYldkCOel1POaWSA5oDXkMeMjhYSFRnyCF5ghqkOScf+NOm5eY5a/w3cls
 UvSjKjD4wpsoXAg3zlpDslLy/lBZehFZRzo3Y6xXlx2FlvVxpGfV5SzA4jP8lU/ZY/KO
 yw0YvpZMPDFPyYjt+VAMxY0xP0wDtM48BFORamBzigFIMRR8meGlUxyy4sBagvMPhKuK
 ea8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QwgC2LRCCGx4j46qUDfFTi9+GYO+7HwI5AJVYUxUdkI=;
 b=s/LsmhWz6FNVD/b6fQ8xEBdaE01KBQi5qEdLjM3aFCv5C2aWgYKWKLueFrpvnfThTa
 mRaPYAesy/+agO70dyUWPuv9yKYMFFYYQXBWv/RNamNN/Z9Vgtx8sOyk+yqO8iLO03Oi
 0zxHMY5FM5Ub9YXcOuUb9lYhCosPGMAtsX9qP+0kDXNrbktyBxluGYMB6Dweea0nun/N
 FC5WJcjscqwLzRT2h1etNO010PgwNW7mxrx5hx0tBAOoUGszYJFaZzqUyEV4Ej+4uWXu
 9YoJEKtgZktR8NWdGdc9YxvcIvOxWGEBFZXxI42aAgDqFn3+RRVeO5UZXL7XVmZpg6sb
 bYnQ==
X-Gm-Message-State: AOAM530MtCL00Gw0xshdf4cP2jni0uR8X3Pmq062CjIROAlb/gqk/v9a
 Ags/BdANN5BpcjJ9ng1CmJIGdnq08plhd9Ix
X-Google-Smtp-Source: ABdhPJzQ0s+5TyAnSAbj5BoYJKbY7e8eRIWhdSpcib0RF53jUxTXxJim2z6G0hnD7EdCbw9g/SjtHQ==
X-Received: by 2002:adf:dd52:: with SMTP id u18mr5880160wrm.32.1619778888675; 
 Fri, 30 Apr 2021 03:34:48 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id 18sm12997817wmo.47.2021.04.30.03.34.47
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 03:34:48 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 12/43] target/arm: Fix decode of align in VLDST_single
Date: Fri, 30 Apr 2021 11:34:06 +0100
Message-Id: <20210430103437.4140-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210430103437.4140-1-peter.maydell@linaro.org>
References: <20210430103437.4140-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

The encoding of size = 2 and size = 3 had the incorrect decode
for align, overlapping the stride field.  This error was hidden
by what should have been unnecessary masking in translate.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210419202257.161730-2-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/neon-ls.decode       | 4 ++--
 target/arm/translate-neon.c.inc | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/arm/neon-ls.decode b/target/arm/neon-ls.decode
index c17f5019e31..0a2a0e15db5 100644
--- a/target/arm/neon-ls.decode
+++ b/target/arm/neon-ls.decode
@@ -46,7 +46,7 @@ VLD_all_lanes  1111 0100 1 . 1 0 rn:4 .... 11 n:2 size:2 t:1 a:1 rm:4 \
 
 VLDST_single   1111 0100 1 . l:1 0 rn:4 .... 00 n:2 reg_idx:3 align:1 rm:4 \
                vd=%vd_dp size=0 stride=1
-VLDST_single   1111 0100 1 . l:1 0 rn:4 .... 01 n:2 reg_idx:2 align:2 rm:4 \
+VLDST_single   1111 0100 1 . l:1 0 rn:4 .... 01 n:2 reg_idx:2 . align:1 rm:4 \
                vd=%vd_dp size=1 stride=%imm1_5_p1
-VLDST_single   1111 0100 1 . l:1 0 rn:4 .... 10 n:2 reg_idx:1 align:3 rm:4 \
+VLDST_single   1111 0100 1 . l:1 0 rn:4 .... 10 n:2 reg_idx:1 . align:2 rm:4 \
                vd=%vd_dp size=2 stride=%imm1_6_p1
diff --git a/target/arm/translate-neon.c.inc b/target/arm/translate-neon.c.inc
index f6c68e30ab2..0e5828744bb 100644
--- a/target/arm/translate-neon.c.inc
+++ b/target/arm/translate-neon.c.inc
@@ -606,7 +606,7 @@ static bool trans_VLDST_single(DisasContext *s, arg_VLDST_single *a)
     switch (nregs) {
     case 1:
         if (((a->align & (1 << a->size)) != 0) ||
-            (a->size == 2 && ((a->align & 3) == 1 || (a->align & 3) == 2))) {
+            (a->size == 2 && (a->align == 1 || a->align == 2))) {
             return false;
         }
         break;
@@ -621,7 +621,7 @@ static bool trans_VLDST_single(DisasContext *s, arg_VLDST_single *a)
         }
         break;
     case 4:
-        if ((a->size == 2) && ((a->align & 3) == 3)) {
+        if (a->size == 2 && a->align == 3) {
             return false;
         }
         break;
-- 
2.20.1


