Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80FAA5F6004
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 06:21:58 +0200 (CEST)
Received: from localhost ([::1]:34544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogIOT-0000Qd-K6
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 00:21:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogHoZ-0004Ml-Ed
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 23:44:52 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:33498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogHoU-0003yu-Qm
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 23:44:49 -0400
Received: by mail-pl1-x62c.google.com with SMTP id 10so654053pli.0
 for <qemu-devel@nongnu.org>; Wed, 05 Oct 2022 20:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=msqK3kGUwRR1FwwwLv+55zHEqiPImyBWT8EbA4E7iuA=;
 b=l/ZMQvOZkdIWZoetYLtaLDi3NFYAzel0fUTlLgeRzyPIJuhRzM+3VNKpwY/48C4lbb
 dPVi+0bvTexk0l4mOR7Tr+hjKJZj91TzzjBe7SCHLk65PMrxYhRX8OZO5JDtxL1+l2eG
 eOYWazOhhTGhXIDTwvPy6DcxGc/Q9UXCQEu5Wal+McZ+MrGqh240QLU3kqn8Q05eFdT5
 veesXqXvU2kGsWlcEvyv7YazTNPykZASeMF3jCl7BOcAoCOPGMFr3OygAsI1ogDDO5Sp
 TjtAUXcnecqpzs9jxfRP8TbxMTaATW7vdo0ggdUkmQ9nVVTMMN+1PodF30cC7P3Vf1CY
 mDpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=msqK3kGUwRR1FwwwLv+55zHEqiPImyBWT8EbA4E7iuA=;
 b=DOgIFWHXuMmXVkp/Upw1+Trj+RgRkXkq6Q2iv+FUHil8hi8eQesQ6rTWNO3plfuH2l
 35B1HoQcAUi/BhDSUajCZ90dBoI8aExMExyI+Zti2QGyC5KdOOpIZcQtF424YNabQTi7
 +jLydenHUyz4ZM+5rDxubZP/NQmhsny+pKVkaC+Ema2YN28w1cYAtgXSVfbtg/F2yp3K
 YgpwwrohPKBpFHJ9n5DBcL/yGLeGvmkt3ersUuR19KJ3HqnPHqPQLDOmD0NqRMqssmWa
 3ILxaeFUvE+zUZbbpf0XO7fScaRmpPEAQr4YY9+3MfzGZaKYY+NOO7IehtnmbwpN9l3I
 13ng==
X-Gm-Message-State: ACrzQf2i3/w0cgxdMPVPPqSIgWkJqBMyvLANaHD7PfZskKXj2iLqR+wW
 xDPZjruOCgIyCLIW7Oji8+zFrWpj2y0VEg==
X-Google-Smtp-Source: AMsMyM5i9KplsMH/yf1eDCBSnybR8xE99DZGKFCR5b66Rwi2XTf4YEbKHwvgTcIqoWuoKCLqOlE+2g==
X-Received: by 2002:a17:902:c94b:b0:17f:5817:35e3 with SMTP id
 i11-20020a170902c94b00b0017f581735e3mr2449802pla.160.1665027884051; 
 Wed, 05 Oct 2022 20:44:44 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:9ad0:4307:7d39:bb61])
 by smtp.gmail.com with ESMTPSA id
 y6-20020a17090ad0c600b00205f4f7a3b3sm1905086pjw.21.2022.10.05.20.44.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Oct 2022 20:44:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org
Subject: [PATCH 22/26] target/s390x: Pass original r2 register to BCR
Date: Wed,  5 Oct 2022 20:44:17 -0700
Message-Id: <20221006034421.1179141-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221006034421.1179141-1-richard.henderson@linaro.org>
References: <20221006034421.1179141-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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
index 6382ceabfc..79f9202ab2 100644
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


