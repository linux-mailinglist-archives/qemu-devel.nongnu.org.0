Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12CA96494D1
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Dec 2022 16:29:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4OGG-0006wI-EL; Sun, 11 Dec 2022 10:29:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p4OG2-0006Xa-CJ
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 10:28:51 -0500
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p4OFo-0007BV-Em
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 10:28:40 -0500
Received: by mail-oi1-x229.google.com with SMTP id n205so9090631oib.1
 for <qemu-devel@nongnu.org>; Sun, 11 Dec 2022 07:28:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mAse/p7xIH0qBnFFrf5T3qVh7iOKaqKi4Tlx5tF25Wc=;
 b=lnf/biUopobVOI7oHKVp7xyj4T6jzJEV7n5M5QSF6P9UhlEl/YuOxKFeuqYO8/o90r
 VaOpNLt1OdANxbBqbZVcOClVMVC6hP860Mbv8UBQjSSMkn0eKcXw5G+fbOo/Ztny5gB8
 UMsRZ9XZLkmiTpjsTpAP1HWYrBf6YOm1Mgwakf2gJQGpR7timr6XAkWgoKl5tJu6Ch2+
 lqZeoEeyobN5BkVaVcY4pNf28lsoUZAC6mZTWrs+d4O6Y2f6XlNACyqR4TT/XxfbDkqO
 zvhFY4lciNUEt5Wx29/bJYMN1pBQBLQtfvTSTszgzrZQaEXnAJiJM5yBHOa2M/9/TVOL
 XNrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mAse/p7xIH0qBnFFrf5T3qVh7iOKaqKi4Tlx5tF25Wc=;
 b=n12ugSphicSFhGALvpTy2BVZN0Cb6L2+YjUilxu6HdK/ENaJJbTC0uMApszx2EzONJ
 jtqx/KRTs2+sgv3T0OPjTPr7nCGJYHd4E0jWcJWZAHFp9FE8GW93Rd5a5F/ZSGOkkkrt
 5lxIkaRZNK3MPlzYw1KfQnTBToAt3orTnG8ZHbIPu3INuGlfYiQrezaXUd4L5TxWy4EC
 y+P2KLSX+yE/a+nh2LCvYZE3tc41qZmsIukwX2Ci95Hvb7RDiZCV2Mbp5FeaDaUXs39G
 UN7MZmhrTbPGnquFgr04YQNseoeff5r/5Pdv7VLxrFrrJHgwG4gyIgu20I92a4WS8BfP
 77Mw==
X-Gm-Message-State: ANoB5pnezxlZ+XJqHwUDb6Wc417KzIPgaf6Hm9GmzSqA7ju7yKUGZi/V
 jPrnoE4Qi+cRPrrHTnpZq8zPGl9SGHSJLzcRovg=
X-Google-Smtp-Source: AA0mqf7R0RLNJiX5/QSuFgPr/QVCI48LsYVypfyVke+ElTBZEhezZ9ilGQrinaatca3ivZMIxkXQuw==
X-Received: by 2002:a05:6808:1451:b0:35a:54d8:f11c with SMTP id
 x17-20020a056808145100b0035a54d8f11cmr8137740oiv.48.1670772515611; 
 Sun, 11 Dec 2022 07:28:35 -0800 (PST)
Received: from stoup.. ([2806:102e:18:2efc:7b4f:f28b:eca6:b583])
 by smtp.gmail.com with ESMTPSA id
 q24-20020a056830233800b006708d2cd8bcsm938140otg.65.2022.12.11.07.28.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Dec 2022 07:28:35 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org,
	Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v2 26/27] target/s390x: Pass original r2 register to BCR
Date: Sun, 11 Dec 2022 09:28:01 -0600
Message-Id: <20221211152802.923900-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221211152802.923900-1-richard.henderson@linaro.org>
References: <20221211152802.923900-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::229;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x229.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

We do not modify any general-purpose registers in BCR,
which means that we may be able to avoid saving the
value across a branch.

Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/insn-data.h.inc |  2 +-
 target/s390x/tcg/translate.c     | 10 ++++++++++
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/target/s390x/tcg/insn-data.h.inc b/target/s390x/tcg/insn-data.h.inc
index 54d4250c9f..0e5a1062ae 100644
--- a/target/s390x/tcg/insn-data.h.inc
+++ b/target/s390x/tcg/insn-data.h.inc
@@ -121,7 +121,7 @@
 /* BRANCH INDIRECT ON CONDITION */
     C(0xe347, BIC,     RXY_b, MIE2,0, m2_64w, 0, 0, bc, 0)
 /* BRANCH ON CONDITION */
-    C(0x0700, BCR,     RR_b,  Z,   0, r2_nz, 0, 0, bc, 0)
+    C(0x0700, BCR,     RR_b,  Z,   0, r2_o_nz, 0, 0, bc, 0)
     C(0x4700, BC,      RX_b,  Z,   0, a2, 0, 0, bc, 0)
 /* BRANCH RELATIVE ON CONDITION */
     C(0xa704, BRC,     RI_c,  Z,   0, 0, 0, 0, bc, 0)
diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index 268de1359b..7280498290 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -5704,6 +5704,16 @@ static void in2_r2_nz(DisasContext *s, DisasOps *o)
 }
 #define SPEC_in2_r2_nz 0
 
+static void in2_r2_o_nz(DisasContext *s, DisasOps *o)
+{
+    int r2 = get_field(s, r2);
+    if (r2 != 0) {
+        o->in2 = regs[r2];
+        o->g_in2 = true;
+    }
+}
+#define SPEC_in2_r2_o_nz 0
+
 static void in2_r2_8s(DisasContext *s, DisasOps *o)
 {
     o->in2 = tcg_temp_new_i64();
-- 
2.34.1


