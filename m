Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B713A69ED
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 17:19:12 +0200 (CEST)
Received: from localhost ([::1]:59314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsoMp-0000Dd-VL
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 11:19:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsoEP-0000Sj-KL
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 11:10:29 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:35385)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsoED-00008B-W3
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 11:10:29 -0400
Received: by mail-wr1-x42a.google.com with SMTP id m18so14940987wrv.2
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 08:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2dgDTTiMTrmKABkAfBq5w7i1IZyicXfWam0kFYAVX4A=;
 b=wlDee7aQN/MTi47IxqsCWMAEo0nsOZYyDq5k5ADhy3a3nBTM5FN5vgPmgs94S3n1W0
 VNf33fAtj/RrjMd5w4mWBBccmmqzpLawUemYvxqTWVlyWkLxYLWVYZdYLXNGF7sKtYdD
 Fm9AV+beWoqyQE0ZepQZCNfkSoA+bLauZO2dE/mavzRLl9DtF/5ftxNsTvGX6k3M/785
 MAeKdSowqtFrVSFewqcu6+0y2IDjgpV4SnfnNZWvokRFZnzqhcQhmEEjxmi3K0M2H4EZ
 JmLBA0abbuzAQs8BcEbrJdDGgpsHQWZzyaJwy544vrQZKkGNyvFmNupnmUBRg4W3ZCHY
 KuxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2dgDTTiMTrmKABkAfBq5w7i1IZyicXfWam0kFYAVX4A=;
 b=Ry7/YIO5gu0KRt1WfD0lMVxcBeU3rokSzFSMp9T8YhLlU3vGr5BzzgkfS8fUTjs7or
 R0WREImycLdN7bkZA8HUcNHeekcmyf8Fn1JGBjoGZe02QsWqDVnAHHJwpLC2grb4RqO0
 LGyAP2bU6s8dyAgC1ZJ8GJsbVtWDzvyRXAr/as0pR7A6NmfE0ysAjGuiy5mNdk6mYDCE
 1KxE1hUry8/uTeaiflqlB636Dj3OBIGBlwtg4NCRd0dNfdi+rccRR5+OCpOKN9Y7VRvX
 dUDqq22z4HyTwUouYxH2H2jEitl4ZcsxFxNhesCL/oY0NaEMPyq9tRG5goAPE+/UGAaX
 w3hg==
X-Gm-Message-State: AOAM533Paj3HNn2L7OxLiIVB+7rPw4TtYpSj3/FJPJN62/Q9nhNZ7bVe
 qF56oxut3XInyw6smO3s6WquNA==
X-Google-Smtp-Source: ABdhPJzDtdLCLGTlODPUwmMb3/MY6348x4UHVsLbgjvU1qhBa2Nai5FS82MnfvE9UNQJTOGN+Q7wQw==
X-Received: by 2002:a5d:4610:: with SMTP id t16mr18479633wrq.324.1623683415827; 
 Mon, 14 Jun 2021 08:10:15 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b8sm20865639wmd.35.2021.06.14.08.10.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 08:10:15 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 06/57] target/arm: Implement MVE LCTP
Date: Mon, 14 Jun 2021 16:09:16 +0100
Message-Id: <20210614151007.4545-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210614151007.4545-1-peter.maydell@linaro.org>
References: <20210614151007.4545-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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


