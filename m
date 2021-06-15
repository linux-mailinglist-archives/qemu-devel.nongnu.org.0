Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB2193A85FA
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 18:03:20 +0200 (CEST)
Received: from localhost ([::1]:37234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltBX5-0007xp-UE
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 12:03:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltBFL-0006Zu-2o
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 11:44:59 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:43538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltBEn-0000zq-8R
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 11:44:58 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 3-20020a05600c0243b029019f2f9b2b8aso2304411wmj.2
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 08:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=8QKmbmV6XEUKXJYuU9zzx7R9/w2OYAkbxEJxTOUJAys=;
 b=QjTUu+Z3uHOzCJTjJZYxZaifD9mbPSX960A9lbSFjOtypnCnTJgQJzhr0PFgCD8ZN0
 EY8WglN8VYtX8K8TdsgDU8wQurKbdwoHxQiEhmbziyMvuJWpL4Diht1roeXgR2UqO0D5
 wQD0FtgGWHbNAEqCwcTnDOEyWdYT2e04z2e1JTrTEpW4H94+OpXQz0l0ZQjVagYDLUcr
 9MtC67+nOUzLfJ1gQgzE+WQvnzdkjbckNvxmLmOGW6tYvi5Rt3yawx6JTehC9GYlnsdX
 UR3IOubfv9CZCce24GouLyN/qysxVVncftc+KnN5uqkcw7mZ6uZYBNyQrAEjw3mudH/s
 LHQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8QKmbmV6XEUKXJYuU9zzx7R9/w2OYAkbxEJxTOUJAys=;
 b=k76ih8ZtQtQMilD3yiQUtYbC2CP5+jGGJQ2T6vlczyHU3euFW48HlsTAScESQFwwNW
 xtMh+ugruSXaLo+SI8iWrW58EuDIEALnXhbTGLVaKRJO/5z6IHsVKqPhQQZ22jVuG1AZ
 wFdHnbZc0/a901RNPbh2pp7by+kKDYH2OYwiXwXsLsFWr7+4e6BTIVJ2eYMrWi5LIdly
 F7Q+Pc2WYwT0/clhv2pfXm9Ghgw6eZ1roYUWYKvkeLnbqmmO3IyoYsKbhwETnvBPgAQb
 3dW7QxfO+9orr7/qZ5aJmnsCJBWbjLWaNEy10ja4PUUWhbDF8Dan9J++qic3y4PWhNku
 ctWw==
X-Gm-Message-State: AOAM5321u0NkX89A5qTUrGlvFTIz1IuT8GqEKDo7p5tv7XOZViP5vIc3
 pfVLBtdsRiqVULrKkPmclBLJVXgPvqcbpQ==
X-Google-Smtp-Source: ABdhPJyTHFVF+cC714n4ozz9dknqo6p0RmZl93kMo69UE21wwTSy/SijIxZQM1vZGFGpty4fXD7QHQ==
X-Received: by 2002:a05:600c:35c3:: with SMTP id
 r3mr5970735wmq.169.1623771863289; 
 Tue, 15 Jun 2021 08:44:23 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d15sm18985662wri.58.2021.06.15.08.44.22
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 08:44:23 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 21/28] target/arm: Implement MVE LCTP
Date: Tue, 15 Jun 2021 16:43:58 +0100
Message-Id: <20210615154405.21399-22-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210615154405.21399-1-peter.maydell@linaro.org>
References: <20210615154405.21399-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
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

Implement the MVE LCTP instruction.

We put its decode and implementation with the other
low-overhead-branch insns because although it is only present if MVE
is implemented it is logically in the same group as the other LOB
insns.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210614151007.4545-7-peter.maydell@linaro.org
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
index f1c2074fa4a..c49561590c9 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -8191,6 +8191,30 @@ static bool trans_LE(DisasContext *s, arg_LE *a)
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


