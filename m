Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F39CA6630F6
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 21:09:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEyRy-0003NW-Um; Mon, 09 Jan 2023 15:08:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEyRw-0003MX-Uo
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 15:08:52 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEyRv-0007fP-El
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 15:08:52 -0500
Received: by mail-pj1-x102c.google.com with SMTP id v23so9937082pju.3
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 12:08:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hj+kl1Rsv/DprYRzUBEWVOIFytk4nYZYRE9FcH6D9mQ=;
 b=RmfEhc/66yF/ZbUvH7CiltLFfFe6sij8sHIMJO6FfeH7lfGqIAPrEorMS3qytaPUqB
 d7/bD9T43ps/mIysn4feKmc6KdJMRhjFVwjmM6cVXCscex8w2TY/eCfu0hDju/u9fxEe
 XrTgjsfNmTevDOhyCvPgOYSO0K04+9gpD9324hnTzVsLt1/Ia2KMXsbMNeBKsU4G517/
 mZ7Jab3DeK42rhEdhbfblNNlpBHZtM0n8Ch7sfgfi7iYb/voUTCN7bDGKVSzgU7oJb7S
 KfgyRkgQAnFOnsLvNzt7GXtH28P1hF1LBabFPdd7apNlbJHw5X95VFsWl2NfPBdKLtYA
 G9xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hj+kl1Rsv/DprYRzUBEWVOIFytk4nYZYRE9FcH6D9mQ=;
 b=ev0MQB8tp13z5dBWxnyXUpFZZMFKUHFM2auXib423DmmqoVWKHU6unn8c4/XCZ5+IE
 i7KMFD0GybtSseajmIJZnhpLnzcRJRq2a378H6Sfex7iegQICCjqHRMeeoiM0T2ByXZ/
 jfnAy3QKK3MsUMO1mwP9NhRTZqeVpPwIvY0OudQ0nXNC55yBy+wK2RYzM9zNwo56/1vu
 U1YIdBfA0ZZX5ZSdN4Y3PLIa/7cn1VeKIYPdC3dE+aJZ0BYb7EfOEtx+uAAx47NHqjWd
 lBitFdAznq+w8bMOTsZdRLH6yjqhAnwVYlLB2XWgZ2x2f1f90i4jwSjKXRpPTON+YuIC
 zcIQ==
X-Gm-Message-State: AFqh2kppLR8hPeqHHu0EM4oow0+jv9sGh5QhI2CzwVlGsgRNrmf8c4fU
 dCPZ49gh9q3oDUmZIzyJJa8S251cLWuZG4/A
X-Google-Smtp-Source: AMrXdXtjuD4GDu8IBrKSh8bSEirRW9qO7lUb8e1ptl7SQMWx+gKLwfJVBeBiJCdSl11eRb+j7/5pLw==
X-Received: by 2002:a17:90b:2747:b0:21a:1b9b:139e with SMTP id
 qi7-20020a17090b274700b0021a1b9b139emr68702342pjb.8.1673294929907; 
 Mon, 09 Jan 2023 12:08:49 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:158e:facf:7a46:ba9f])
 by smtp.gmail.com with ESMTPSA id
 l2-20020a17090a384200b0022727d4af8dsm577574pjf.48.2023.01.09.12.08.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 12:08:49 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org,
	Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v3 26/27] target/s390x: Pass original r2 register to BCR
Date: Mon,  9 Jan 2023 12:08:18 -0800
Message-Id: <20230109200819.3916395-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230109200819.3916395-1-richard.henderson@linaro.org>
References: <20230109200819.3916395-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
index 79c6ab509a..a03a19e9b9 100644
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
index 3d9a79af42..afed4e2981 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -5706,6 +5706,16 @@ static void in2_r2_nz(DisasContext *s, DisasOps *o)
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


