Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96BA13F51A8
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 22:03:51 +0200 (CEST)
Received: from localhost ([::1]:41560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIGAg-00079h-E0
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 16:03:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mIG2z-0006WV-KV
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 15:55:53 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:35454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mIG2p-0003Ae-Sp
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 15:55:53 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 mw10-20020a17090b4d0a00b0017b59213831so252133pjb.0
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 12:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EhRoz6fDTgou8i0y2EDLKe/oSBMrCIVBe4MhM6xpgpk=;
 b=wvHOffyqOEJJ3rSbqJJv1OJXc+GjEJylJjy7pWDGrVGyn8m1T3JOkytWlFBh8yfSL7
 mH9XFyT/WcQXrtdk5c1BlbkvJ+He5EUZGv5f+oz7vRvFbM4pLXZM4PfrVJSe70nJ4Iil
 JKh/O7xniWA+lze7JTa1hoE3kcuxmfO418RZDqak1/UNCI6XoUkEQDW0r1ZYDKlDiSmh
 vShaMRUV+vDPk/5eDl6Yl4Gc2RCKEOZFHEaqeXYR+TY6J3UqwEkb/sEvQcduVAg+Fw76
 G26O2PUPJ+90Df65wc9Cc8PKnvsnh+0lcqenYpo/i86ikwOoieXPMzKOLCvwXwI8n6n+
 Xazw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EhRoz6fDTgou8i0y2EDLKe/oSBMrCIVBe4MhM6xpgpk=;
 b=B3H6qvAwbGcE3JjSXCIGxK0qcmPQuGUaV0iu04kEHmJ43CCUSMS7SviJobMFCno1SK
 2XEcSIAkbjzgaTUZ9vPR/nCwel9CzOCKh72P9fILpu6fpA2m+n4Tp/wnHr+cr0Cmtx8r
 CQckWqE2FcOw8IvS9n5qbizguqwnkIjy1zMEr9/q4QiyvPMvSrbE2jnqAlr7M1FGx9Pz
 qM139NT+GLVXd1/QtRrr18Hqtmp1ETitnDyb6CWp6t7qztDsCMYmqIjTGRd7idnOV2PN
 47AExtYerGvNhD/AHOL5Fmyjr6GaZIiH5f0QIBUZ79FzwdaGk+Lm9NprDMhl7xzokdAx
 /cqA==
X-Gm-Message-State: AOAM532jl+AOOkBc0akwqvWTnw44UE7YNobAhrKZ18G/9iO+HpKrRaZB
 OdPkrVmDH+zX1S+gxZQ5xihhRSi4YAVZdQ==
X-Google-Smtp-Source: ABdhPJxiBq70AvJ46UPaVw1aKm7X244qMeojZ10OhUocU4j+2Bs04LkpJN7G1L/9658EwlKJF5BG9g==
X-Received: by 2002:a17:90a:5b0f:: with SMTP id
 o15mr228963pji.97.1629748542532; 
 Mon, 23 Aug 2021 12:55:42 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id v15sm16685078pff.105.2021.08.23.12.55.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 12:55:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 16/24] target/riscv: Fix rmw_sip, rmw_vsip,
 rmw_hsip vs write-only operation
Date: Mon, 23 Aug 2021 12:55:21 -0700
Message-Id: <20210823195529.560295-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210823195529.560295-1-richard.henderson@linaro.org>
References: <20210823195529.560295-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We distinguish write-only by passing ret_value as NULL.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/csr.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 9a4ed18ac5..d900f96dc1 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -937,9 +937,12 @@ static RISCVException rmw_vsip(CPURISCVState *env, int csrno,
     /* Shift the S bits to their VS bit location in mip */
     int ret = rmw_mip(env, 0, ret_value, new_value << 1,
                       (write_mask << 1) & vsip_writable_mask & env->hideleg);
-    *ret_value &= VS_MODE_INTERRUPTS;
-    /* Shift the VS bits to their S bit location in vsip */
-    *ret_value >>= 1;
+
+    if (ret_value) {
+        *ret_value &= VS_MODE_INTERRUPTS;
+        /* Shift the VS bits to their S bit location in vsip */
+        *ret_value >>= 1;
+    }
     return ret;
 }
 
@@ -956,7 +959,9 @@ static RISCVException rmw_sip(CPURISCVState *env, int csrno,
                       write_mask & env->mideleg & sip_writable_mask);
     }
 
-    *ret_value &= env->mideleg;
+    if (ret_value) {
+        *ret_value &= env->mideleg;
+    }
     return ret;
 }
 
@@ -1072,8 +1077,9 @@ static RISCVException rmw_hvip(CPURISCVState *env, int csrno,
     int ret = rmw_mip(env, 0, ret_value, new_value,
                       write_mask & hvip_writable_mask);
 
-    *ret_value &= hvip_writable_mask;
-
+    if (ret_value) {
+        *ret_value &= hvip_writable_mask;
+    }
     return ret;
 }
 
@@ -1084,8 +1090,9 @@ static RISCVException rmw_hip(CPURISCVState *env, int csrno,
     int ret = rmw_mip(env, 0, ret_value, new_value,
                       write_mask & hip_writable_mask);
 
-    *ret_value &= hip_writable_mask;
-
+    if (ret_value) {
+        *ret_value &= hip_writable_mask;
+    }
     return ret;
 }
 
-- 
2.25.1


