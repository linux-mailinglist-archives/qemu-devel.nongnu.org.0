Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FAF838F7F9
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 04:14:32 +0200 (CEST)
Received: from localhost ([::1]:53654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llMaV-0003L5-4v
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 22:14:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLbB-0006XM-Fz
 for qemu-devel@nongnu.org; Mon, 24 May 2021 21:11:09 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:43956)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLaz-0005uV-Ax
 for qemu-devel@nongnu.org; Mon, 24 May 2021 21:11:09 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 ep16-20020a17090ae650b029015d00f578a8so12192255pjb.2
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 18:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Uee7s+qdhdMQ6Jii7QCfRZaZt20ac2r4W/zjmra8qs4=;
 b=c/pTUl6Mq2nxwiOXhtIVXpgFn6bEz5yNnvG/KGxRWOqF1M1+iiBhmFX6xCy3GeY6Gi
 CKW+GGm3/3cWozkHL5XqyteehWGU0KK6jIppgetGul4vRpchvkqnSUTRrqWhZnhk4nmN
 R3H5FAcCcLdkSC/SX1ZBlYTzo3K8KJPkqbqe+ocRt/r94RCNRVWoPO/rMqd5RfDWd42i
 IoWOKcRaFgKTMiQ/naCXtcGWSqJSPjGfWSKXvlikzSWIzNX1vJKYnStjO0/ij6pGhlxs
 Xdo1dyGs/qOkifgzUFQWW4dB1ubianm5M/nI59QVittxYvAiTaj46bGYFNUVSRBLe4FX
 yP5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Uee7s+qdhdMQ6Jii7QCfRZaZt20ac2r4W/zjmra8qs4=;
 b=G10aIugL554ibJ66RddjKhj78bxcTgw6MNyyEdz9QMRAFHj7UIZdytz0V7oVwUcPkQ
 p3U1ZNFmNsmqb7g2FYQQ0c8F/QScOmPFEscKlxwNmtkuOU4a11CeJgzGkiwXo0hm+n0Z
 9EpJVhY0IGYsWrhRyKqGfHeLD+3nWqaE2/AX6qdZwtdCMAgAAok+13TPJOGvupSXl2Zp
 xP4j5ZxI3ipN5Qu5fxkBl5GbAPVY+Pl4k3EWkSYPKufovmXvz/5wp7Yv97vvMQydgbPU
 n3U6fR9rhiKJfZzOZprPtsV5ca7jrurYHmDE3SP1HH2VLeAkkubQ58OjDuaTkc5REUit
 ACpA==
X-Gm-Message-State: AOAM532kEYMdToF8nPVoxibkrdxQXT0QgyeP5xrxWdyZQmJwofkZuYLU
 +fZ+gX9E2wpeM4sUAnhEcLU7ACIgWjoF7g==
X-Google-Smtp-Source: ABdhPJyge3jUbWSa/GGPsmTf0xupLvMEMQ6WqY3c6RrWFKjMLrUXnY5atm1RUJhuLQKOK+h42LRMow==
X-Received: by 2002:a17:90b:687:: with SMTP id
 m7mr26993536pjz.133.1621905055098; 
 Mon, 24 May 2021 18:10:55 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id i8sm10614839pjs.54.2021.05.24.18.10.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 18:10:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 89/92] target/arm: Implement aarch32 VSUDOT, VUSDOT
Date: Mon, 24 May 2021 18:03:55 -0700
Message-Id: <20210525010358.152808-90-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525010358.152808-1-richard.henderson@linaro.org>
References: <20210525010358.152808-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h              |  5 +++++
 target/arm/neon-shared.decode |  6 ++++++
 target/arm/translate-neon.c   | 27 +++++++++++++++++++++++++++
 3 files changed, 38 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index b2b684df55..5850db90f3 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3783,6 +3783,11 @@ static inline bool isar_feature_aa32_predinv(const ARMISARegisters *id)
     return FIELD_EX32(id->id_isar6, ID_ISAR6, SPECRES) != 0;
 }
 
+static inline bool isar_feature_aa32_i8mm(const ARMISARegisters *id)
+{
+    return FIELD_EX32(id->id_isar6, ID_ISAR6, I8MM) != 0;
+}
+
 static inline bool isar_feature_aa32_ras(const ARMISARegisters *id)
 {
     return FIELD_EX32(id->id_pfr0, ID_PFR0, RAS) != 0;
diff --git a/target/arm/neon-shared.decode b/target/arm/neon-shared.decode
index 2d94369750..5befaec87b 100644
--- a/target/arm/neon-shared.decode
+++ b/target/arm/neon-shared.decode
@@ -50,6 +50,8 @@ VSDOT          1111 110 00 . 10 .... .... 1101 . q:1 . 0 .... \
                vm=%vm_dp vn=%vn_dp vd=%vd_dp
 VUDOT          1111 110 00 . 10 .... .... 1101 . q:1 . 1 .... \
                vm=%vm_dp vn=%vn_dp vd=%vd_dp
+VUSDOT         1111 110 01 . 10 .... .... 1101 . q:1 . 0 .... \
+               vm=%vm_dp vn=%vn_dp vd=%vd_dp
 
 # VFM[AS]L
 VFML           1111 110 0 s:1 . 10 .... .... 1000 . 0 . 1 .... \
@@ -66,6 +68,10 @@ VSDOT_scalar   1111 1110 0 . 10 .... .... 1101 . q:1 index:1 0 vm:4 \
                vn=%vn_dp vd=%vd_dp
 VUDOT_scalar   1111 1110 0 . 10 .... .... 1101 . q:1 index:1 1 vm:4 \
                vn=%vn_dp vd=%vd_dp
+VUSDOT_scalar  1111 1110 1 . 00 .... .... 1101 . q:1 index:1 0 vm:4 \
+               vn=%vn_dp vd=%vd_dp
+VSUDOT_scalar  1111 1110 1 . 00 .... .... 1101 . q:1 index:1 1 vm:4 \
+               vn=%vn_dp vd=%vd_dp
 
 %vfml_scalar_q0_rm 0:3 5:1
 %vfml_scalar_q1_index 5:1 3:1
diff --git a/target/arm/translate-neon.c b/target/arm/translate-neon.c
index 386b42fe4b..b6ca29c25c 100644
--- a/target/arm/translate-neon.c
+++ b/target/arm/translate-neon.c
@@ -287,6 +287,15 @@ static bool trans_VUDOT(DisasContext *s, arg_VUDOT *a)
                         gen_helper_gvec_udot_b);
 }
 
+static bool trans_VUSDOT(DisasContext *s, arg_VUSDOT *a)
+{
+    if (!dc_isar_feature(aa32_i8mm, s)) {
+        return false;
+    }
+    return do_neon_ddda(s, a->q * 7, a->vd, a->vn, a->vm, 0,
+                        gen_helper_gvec_usdot_b);
+}
+
 static bool trans_VFML(DisasContext *s, arg_VFML *a)
 {
     int opr_sz;
@@ -354,6 +363,24 @@ static bool trans_VUDOT_scalar(DisasContext *s, arg_VUDOT_scalar *a)
                         gen_helper_gvec_udot_idx_b);
 }
 
+static bool trans_VUSDOT_scalar(DisasContext *s, arg_VUSDOT_scalar *a)
+{
+    if (!dc_isar_feature(aa32_i8mm, s)) {
+        return false;
+    }
+    return do_neon_ddda(s, a->q * 6, a->vd, a->vn, a->vm, a->index,
+                        gen_helper_gvec_usdot_idx_b);
+}
+
+static bool trans_VSUDOT_scalar(DisasContext *s, arg_VSUDOT_scalar *a)
+{
+    if (!dc_isar_feature(aa32_i8mm, s)) {
+        return false;
+    }
+    return do_neon_ddda(s, a->q * 6, a->vd, a->vn, a->vm, a->index,
+                        gen_helper_gvec_sudot_idx_b);
+}
+
 static bool trans_VFML_scalar(DisasContext *s, arg_VFML_scalar *a)
 {
     int opr_sz;
-- 
2.25.1


