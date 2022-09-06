Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E1A5AE721
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 14:02:44 +0200 (CEST)
Received: from localhost ([::1]:37240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVXHv-0002Y5-Cf
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 08:02:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVVet-0003Sv-L2
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:18:19 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:38857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVVeq-0005Hx-CH
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:18:19 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 n23-20020a7bc5d7000000b003a62f19b453so9280238wmk.3
 for <qemu-devel@nongnu.org>; Tue, 06 Sep 2022 03:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=rPJg4mEU9SLLKDl0FCUQ1+PhBCFKs+m7Onca/fb/wNE=;
 b=Ob3ZBunbKHXjHsyfzCCalhQG6t4U83x21ElzV4v+i2/l+X20+ji9wxAoj3+sIXvQuL
 JbSzz66XiGd19cnUGQqEYCiPYo1VFRqj7q8MUfT/NXyrAvLu7euJgWrQoLoQ26UXtPgR
 QVminGr8vPqHRQGPGX4hvHnRB3KhZJyAZzSXBVmhUvsjT0VmkTvgB7ebDoRVjz2hGRmk
 BRC+Kp98VLD1rX7EsLakYOuSexf9WYbfEpddi/xdUlOb099zJSr6P9VVB718yda5QZ1x
 gTaDkyM/iZwwJoFDRqQITXozL427+fosjI30zvuAkalyVjpYDBmGQ//H0dHaySgvLJMB
 msIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=rPJg4mEU9SLLKDl0FCUQ1+PhBCFKs+m7Onca/fb/wNE=;
 b=aB9f30IWI4OwilqKWHjAhajyd+unhl9FttyXGHVGgxmy2ZsVexUGfs5aj8KfEHfGXf
 pnuRXcDGuSM6UtmYntAhcZu4w+iXRiqL1w9XHnxkTJAgWOxoagDi8HoLm/7IDqg6UpAO
 0Pl5Fs9gN7zgjy69zrmSL7j3FSh5jNfD15ZCw2Aq+11NBeVmbGOPZonvMaJHLxF0G1of
 3U0pqtB/OJBS3k4Hyz3o1FHcny5O/GMKMw79n5bwxkTnqZ4/0XwAdMG4C+rC60N665vU
 FHY1vx43WdMBInuxqdKeEkKQ2MFNEtuS12qU38Q9ATBm7R2RpAu3Ed7QxwNvW2a9RXb2
 QcLQ==
X-Gm-Message-State: ACgBeo1LkeACUU2QmSjdO8lOpOembkiuX6j72m7S+ehlpmPbROwfyEkM
 6RzvaLHEpTB6se8Bd1whEqaSJOV4RRc7NiTk
X-Google-Smtp-Source: AA6agR5UTpnSzUPOA6wqK9zzqQcW8iwRP3RKNWMjKqH7GKT8jp7X4Ws3dZo83bPZ5y8ZzFMaGaXBeA==
X-Received: by 2002:a05:600c:4e52:b0:3a6:d89:4d1b with SMTP id
 e18-20020a05600c4e5200b003a60d894d1bmr13621981wmq.150.1662459492221; 
 Tue, 06 Sep 2022 03:18:12 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:8084:a5c0:5a80:ba98:3a71:8524:e0b1])
 by smtp.gmail.com with ESMTPSA id
 y16-20020a05600c365000b003a62bc1735asm14094361wmq.9.2022.09.06.03.18.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 03:18:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org
Subject: [PATCH v1 22/26] target/s390x: Pass original r2 register to BCR
Date: Tue,  6 Sep 2022 11:17:43 +0100
Message-Id: <20220906101747.344559-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220906101747.344559-1-richard.henderson@linaro.org>
References: <20220906101747.344559-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x333.google.com
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

We do not modify any general-purpose registers in BCR,
which means that we may be able to avoid saving the
value across a branch.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/translate.c   | 10 ++++++++++
 target/s390x/tcg/insn-data.def |  2 +-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index e6c7c2a6ae..b27e34f712 100644
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
diff --git a/target/s390x/tcg/insn-data.def b/target/s390x/tcg/insn-data.def
index 6d2cfe5fa2..682d1d292d 100644
--- a/target/s390x/tcg/insn-data.def
+++ b/target/s390x/tcg/insn-data.def
@@ -121,7 +121,7 @@
 /* BRANCH INDIRECT ON CONDITION */
     C(0xe347, BIC,     RXY_b, MIE2,0, m2_64w, 0, 0, bc, 0)
 /* BRANCH ON CONDITION */
-    C(0x0700, BCR,     RR_b,  Z,   0, r2_nz, 0, 0, bc, 0)
+    C(0x0700, BCR,     RR_b,  Z,   0, r2_o_nz, 0, 0, bc, 0)
     C(0x4700, BC,      RX_b,  Z,   0, a2, 0, 0, bc, 0)
 /* BRANCH RELATIVE ON CONDITION */
     C(0xa704, BRC,     RI_c,  Z,   0, 0, 0, 0, bc, 0)
-- 
2.34.1


