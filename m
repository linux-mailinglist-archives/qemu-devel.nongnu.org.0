Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81BFD55239C
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 20:12:23 +0200 (CEST)
Received: from localhost ([::1]:38198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3Lss-0007tI-I3
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 14:12:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3La7-0006EY-8E
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 13:52:59 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:40688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3La3-0001Tc-GF
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 13:52:58 -0400
Received: by mail-pg1-x531.google.com with SMTP id f65so10887133pgc.7
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 10:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=c109Es5tf7FZ7Zk87xoSi6rDiyT6PB2W1qJeG91J8xg=;
 b=y8rYxKG0+wsmbLRicl8xdpXZoZv13BQycwUfbZWudO2X4p4C72Rq3TU/FmqoBh0y0R
 nhdGqWsse/WDNG54bbpgiY4W0WmvWVwX7RupTf8pbN7O6es6T3aQbVWH62jhgGjPacv+
 3/0zjJNkT7f+7XqfLPwVU79kaHp2aMWx24QCdHfZpBSIkHM0CU2ssSXcTJ+qx+gUs2Bx
 +9MjKhIEkH3BostaLansn7jRbm6Z3H6y2A+L+pY9/YWw0I0W6eU9hWyNy1pCY9FyTOba
 E58VWQTbw0Sy8HO0HqPNUSl+e/8No5OLfWH758e7ZkOdYBNZyYcEb+6SKwIeMnhyBrq4
 CzUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c109Es5tf7FZ7Zk87xoSi6rDiyT6PB2W1qJeG91J8xg=;
 b=Hubyt+4x0cBPwyJXKxuSDDDrDpDptFnHumBKG29uZfGQRBtow70c3JfbPaVJjgRBIE
 ozDv8DJTekPT3vTYhEXm8Wbjh+wkIy+rMMQQPRu0LdFm53HjJInWX7TYOBjEWtyILb7Z
 1caLYPa4aSOsQCTt0UVt2czfc2PV5GgVWGhE4hzTlh7j1IzYcSCZtiwBWFpzmaQwnA1K
 z5CKpc2ATFZ6wvFmqMBNT6mkaCf6aGi5sEqPtMNBph0nNY/1YN/xStzlTj7KKm3y45J6
 xPsSl56mziP2NBuj2xQHzGuNLIoNtdjQvMjndogIftq7EtxZMyvvQeGey4Aow4o9uA8K
 Z/wQ==
X-Gm-Message-State: AJIora9u0p7qzgxWhcJixx46IfhFDPKhYcpqPHFF2zzXGCV2mzIsLRx3
 SJ0dKB33C6cWZ8VFFap4wpm/ZeMWuco3pA==
X-Google-Smtp-Source: AGRyM1sAvU/dFqWFF/xaYWiaGbFjqjbFAazMzxMCnmz4UNNcuEKT70NL7RQIaoY0cr/yWO6gNh1RTA==
X-Received: by 2002:a63:9752:0:b0:3c6:5a7a:5bd6 with SMTP id
 d18-20020a639752000000b003c65a7a5bd6mr23012273pgo.390.1655747574203; 
 Mon, 20 Jun 2022 10:52:54 -0700 (PDT)
Received: from stoup.. ([2602:47:d49e:3c01:a3e0:8a80:7b85:aea6])
 by smtp.gmail.com with ESMTPSA id
 j14-20020aa7928e000000b00525133f98adsm5138138pfa.146.2022.06.20.10.52.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 10:52:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 20/51] target/arm: Move pred_{full, gvec}_reg_{offset,
 size} to translate-a64.h
Date: Mon, 20 Jun 2022 10:52:04 -0700
Message-Id: <20220620175235.60881-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220620175235.60881-1-richard.henderson@linaro.org>
References: <20220620175235.60881-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

We will need these functions in translate-sme.c.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.h | 38 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-sve.c | 36 ------------------------------------
 2 files changed, 38 insertions(+), 36 deletions(-)

diff --git a/target/arm/translate-a64.h b/target/arm/translate-a64.h
index dbc917ee65..f0970c6b8c 100644
--- a/target/arm/translate-a64.h
+++ b/target/arm/translate-a64.h
@@ -107,6 +107,44 @@ static inline int vec_full_reg_size(DisasContext *s)
     return s->vl;
 }
 
+/*
+ * Return the offset info CPUARMState of the predicate vector register Pn.
+ * Note for this purpose, FFR is P16.
+ */
+static inline int pred_full_reg_offset(DisasContext *s, int regno)
+{
+    return offsetof(CPUARMState, vfp.pregs[regno]);
+}
+
+/* Return the byte size of the whole predicate register, VL / 64.  */
+static inline int pred_full_reg_size(DisasContext *s)
+{
+    return s->vl >> 3;
+}
+
+/*
+ * Round up the size of a register to a size allowed by
+ * the tcg vector infrastructure.  Any operation which uses this
+ * size may assume that the bits above pred_full_reg_size are zero,
+ * and must leave them the same way.
+ *
+ * Note that this is not needed for the vector registers as they
+ * are always properly sized for tcg vectors.
+ */
+static inline int size_for_gvec(int size)
+{
+    if (size <= 8) {
+        return 8;
+    } else {
+        return QEMU_ALIGN_UP(size, 16);
+    }
+}
+
+static inline int pred_gvec_reg_size(DisasContext *s)
+{
+    return size_for_gvec(pred_full_reg_size(s));
+}
+
 bool disas_sve(DisasContext *, uint32_t);
 
 void gen_gvec_rax1(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 67761bf2cc..62b5f3040c 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -100,42 +100,6 @@ static inline int msz_dtype(DisasContext *s, int msz)
  * Implement all of the translator functions referenced by the decoder.
  */
 
-/* Return the offset info CPUARMState of the predicate vector register Pn.
- * Note for this purpose, FFR is P16.
- */
-static inline int pred_full_reg_offset(DisasContext *s, int regno)
-{
-    return offsetof(CPUARMState, vfp.pregs[regno]);
-}
-
-/* Return the byte size of the whole predicate register, VL / 64.  */
-static inline int pred_full_reg_size(DisasContext *s)
-{
-    return s->vl >> 3;
-}
-
-/* Round up the size of a register to a size allowed by
- * the tcg vector infrastructure.  Any operation which uses this
- * size may assume that the bits above pred_full_reg_size are zero,
- * and must leave them the same way.
- *
- * Note that this is not needed for the vector registers as they
- * are always properly sized for tcg vectors.
- */
-static int size_for_gvec(int size)
-{
-    if (size <= 8) {
-        return 8;
-    } else {
-        return QEMU_ALIGN_UP(size, 16);
-    }
-}
-
-static int pred_gvec_reg_size(DisasContext *s)
-{
-    return size_for_gvec(pred_full_reg_size(s));
-}
-
 /* Invoke an out-of-line helper on 2 Zregs. */
 static bool gen_gvec_ool_zz(DisasContext *s, gen_helper_gvec_2 *fn,
                             int rd, int rn, int data)
-- 
2.34.1


