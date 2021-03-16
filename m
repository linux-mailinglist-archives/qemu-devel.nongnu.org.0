Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D9033E15D
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 23:26:22 +0100 (CET)
Received: from localhost ([::1]:33778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMI8s-0001ft-1E
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 18:26:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMHqr-0005iI-18
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 18:07:45 -0400
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f]:45912)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMHqp-0002ci-5N
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 18:07:44 -0400
Received: by mail-qv1-xf2f.google.com with SMTP id t16so437270qvr.12
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 15:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4FGwbzRDCgp0mZG0M4BZazahJWTIBClTRPajuLNeTjw=;
 b=ei+lY0aNHb0IWHow2heU0NaDcfUjf9QNC63RaaAvxMnd6gygFxtINgSZv/G3yuckJF
 mCf/roSAAUhBaNjzP2MGUTceqR55E0O5mM8G3bWD6/FCg2cHNR/ZGfAoE6EsfmS62Qea
 lVUJQmZig1/1F6eTS5LsV81cCFl+Pjr/2XFhGZCt7HUKWciN07LMQRdbpFwU0oQEFfeO
 oqIxKNBYpi1I514spr/gGn950Q/bEh4TDXavWtMbD32eMjhhAO9Zyq7fRHBrFR3pivqo
 bs8zWEOSDO62y1q3u3KlYj/9DSTmgcGqqCpq8tWzYbScxG1QtpcPh+3yzHmCfEfG+TSU
 OCYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4FGwbzRDCgp0mZG0M4BZazahJWTIBClTRPajuLNeTjw=;
 b=j/KUrYTPAWKJGpHsDv4tDYBSBBNBhkqYRMOF9w8wg2893F8CKSsDIDRY99Y0mIpnuH
 UUVN+0YR7gqWhhhDtBmI1c/CG4Ex3S8/9FwciniHKhhWmxSTKEPDmHZM/HpM6RUDaR6T
 ob/c1SjnaPXLGaizpdvo5jamizJoXItNceZTNdNDp5VF2BdigOoVE8A9j+PjGt9PdfC9
 4UnbvciyWwIkgm313Yn0qC5y8eGwmhWRTq3fPQbdzx3jjVmT/mkteRH25X6tRlhUpePi
 +oklJMcPn3INzUhjRcx4VAsfQIw++tvI3Ud1f2LusSJO9/obHvd0gL6JA+Zoc4TOXkm+
 ps+Q==
X-Gm-Message-State: AOAM530VMIkEObSkYQYoTX869NKPOlYbKr7i0ULJO2qRrk8LtnS9K0hu
 6JMfklievCQ2tzs0revyirb9YHngmO+D1VAg
X-Google-Smtp-Source: ABdhPJw38uSCxnIOaXro6fzPEtjOfKifFsPPieCE/Uq5U2bXwozTze3d0acMLCJlzrsXhZKrxUG9OQ==
X-Received: by 2002:a05:6214:2623:: with SMTP id
 gv3mr1692246qvb.35.1615932462237; 
 Tue, 16 Mar 2021 15:07:42 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id n77sm16546918qkn.128.2021.03.16.15.07.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 15:07:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/5] tcg: Create tcg_req_mo
Date: Tue, 16 Mar 2021 16:07:34 -0600
Message-Id: <20210316220735.2048137-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210316220735.2048137-1-richard.henderson@linaro.org>
References: <20210316220735.2048137-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2f;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2f.google.com
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Split out the logic to emit a host memory barrier in response to
a guest memory operation.  Do not provide a true default for
TCG_GUEST_DEFAULT_MO because the defined() check will still be
useful for determining if a guest has been updated for MTTCG.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg.h   | 20 ++++++++++++++++++++
 accel/tcg/tcg-all.c |  6 +-----
 tcg/tcg-op.c        |  8 +-------
 3 files changed, 22 insertions(+), 12 deletions(-)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 0f0695e90d..395b3b6964 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -1245,6 +1245,26 @@ static inline unsigned get_mmuidx(TCGMemOpIdx oi)
     return oi & 15;
 }
 
+/**
+ * tcg_req_mo:
+ * @type: TCGBar
+ *
+ * Filter @type to the barrier that is required for the guest
+ * memory ordering vs the host memory ordering.  A non-zero
+ * result indicates that some barrier is required.
+ *
+ * If TCG_GUEST_DEFAULT_MO is not defined, assume that the
+ * guest requires strict alignment.
+ *
+ * This is a macro so that it's constant even without optimization.
+ */
+#ifdef TCG_GUEST_DEFAULT_MO
+# define tcg_req_mo(type) \
+    ((type) & TCG_GUEST_DEFAULT_MO & ~TCG_TARGET_DEFAULT_MO)
+#else
+# define tcg_req_mo(type) ((type) & ~TCG_TARGET_DEFAULT_MO)
+#endif
+
 /**
  * tcg_qemu_tb_exec:
  * @env: pointer to CPUArchState for the CPU
diff --git a/accel/tcg/tcg-all.c b/accel/tcg/tcg-all.c
index e378c2db73..6ae51e3476 100644
--- a/accel/tcg/tcg-all.c
+++ b/accel/tcg/tcg-all.c
@@ -69,11 +69,7 @@ DECLARE_INSTANCE_CHECKER(TCGState, TCG_STATE,
 
 static bool check_tcg_memory_orders_compatible(void)
 {
-#if defined(TCG_GUEST_DEFAULT_MO) && defined(TCG_TARGET_DEFAULT_MO)
-    return (TCG_GUEST_DEFAULT_MO & ~TCG_TARGET_DEFAULT_MO) == 0;
-#else
-    return false;
-#endif
+    return tcg_req_mo(TCG_MO_ALL) == 0;
 }
 
 static bool default_mttcg_enabled(void)
diff --git a/tcg/tcg-op.c b/tcg/tcg-op.c
index c8501508c2..12fc8a1b17 100644
--- a/tcg/tcg-op.c
+++ b/tcg/tcg-op.c
@@ -2796,13 +2796,7 @@ static void gen_ldst_i64(TCGOpcode opc, TCGv_i64 val, TCGv addr,
 
 static void tcg_gen_req_mo(TCGBar type)
 {
-#ifdef TCG_GUEST_DEFAULT_MO
-    type &= TCG_GUEST_DEFAULT_MO;
-#endif
-    type &= ~TCG_TARGET_DEFAULT_MO;
-    if (type) {
-        tcg_gen_mb(type | TCG_BAR_SC);
-    }
+    tcg_gen_mb(tcg_req_mo(type) | TCG_BAR_SC);
 }
 
 static inline TCGv plugin_prep_mem_callbacks(TCGv vaddr)
-- 
2.25.1


