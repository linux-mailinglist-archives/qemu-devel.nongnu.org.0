Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB63B364CE8
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 23:13:05 +0200 (CEST)
Received: from localhost ([::1]:33472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYbCa-0007po-VJ
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 17:13:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYaQa-0007OW-Vb
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 16:23:28 -0400
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35]:42919)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYaQW-0002Yo-7j
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 16:23:28 -0400
Received: by mail-qv1-xf35.google.com with SMTP id 30so17525624qva.9
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 13:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=d4KAjGOIOOmhRwAXEkZoKVidF8e2kIGAWXOFwPXfIFY=;
 b=i8fkmY44VK+xNbBUJaeXrzVfxX/ZC2H4osW6AVj+Y2h8sOjdWoAolL3iCQ12HZYiaM
 zgfqfminHVDxHTYPBM7uWnIkz1DIhTVmCL8cNwZisK8nnIoys9GPGpSi4LV9WR2kLxwH
 XT3hoW4pe8K3tJCDxhUx2C2D4wtljc/63Wp3M+uC6nGDAOjYCOg4cVyLlzbTNynNA5+0
 wVkuXmKzecxEM0Huz6IxZgHiYGB6w2RvHDdLnDQEGpLhtk39McHzS0fYIH06wsuWL+L2
 TBf+qzCyrV+brXkuz4lTs8VJSCgkx4fT/d70i3sStZYP52fRsfXUcQ4euUO6YWroHKAN
 M4fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=d4KAjGOIOOmhRwAXEkZoKVidF8e2kIGAWXOFwPXfIFY=;
 b=qgquG39QrhvOxucPQkqH8t2BvnAKFRS/Ao7YGu7qRKDhP8VfwvqlfadAevZzp7aUJ4
 Bhwc+1Bfua+0GOYwIBqmFe7Nn1zfyd0vSD/PdeSlhGcyae18B6AXsZU+zqtlQV/b8BHA
 n1LFJPi7kv0apzIb+5VCL+eSkhi+0Bf4fLGCeFIjP80DOXssO8VON5fG/2HIFbXRieDO
 hfatw+hpalENkEIh6SvYa8v9YzciTseGae+odkthisINdwA2fnhvwBvr/VwLxz1E9QcA
 V9ZlxnkGgQZvZ7pIEk4zDsu8ItHcO69jAaKRNfcIxUlYhqxLtcUoQv9CKUHoEQcgtwsj
 /LbQ==
X-Gm-Message-State: AOAM5337H2cqFePvcnULDJXj/NocvwoXZkE9ykaMsiWhvhzdZbV5IM6D
 s4faDwHwEc/YdZML0sAVtmt5zPjS/p9H+IDT
X-Google-Smtp-Source: ABdhPJyyT+ik9Oc5r1Araf5PpyIgm3Pcm8GiqEYaqhWPKp/UOEczWX5hmr3DzHqHcJi6bJtIKUvcyA==
X-Received: by 2002:a05:6214:88d:: with SMTP id
 cz13mr23183596qvb.13.1618863803347; 
 Mon, 19 Apr 2021 13:23:23 -0700 (PDT)
Received: from localhost.localdomain ([2607:fb90:80c7:aba4:3594:91a:8889:c77a])
 by smtp.gmail.com with ESMTPSA id c23sm10007835qtm.46.2021.04.19.13.23.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 13:23:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 12/31] target/arm: Merge gen_aa32_frob64 into
 gen_aa32_ld_i64
Date: Mon, 19 Apr 2021 13:22:38 -0700
Message-Id: <20210419202257.161730-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210419202257.161730-1-richard.henderson@linaro.org>
References: <20210419202257.161730-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f35;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf35.google.com
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

This is the only caller.  Adjust some commentary to talk
about SCTLR_B instead of the vanishing function.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 37 ++++++++++++++++---------------------
 1 file changed, 16 insertions(+), 21 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index d46030248a..b47a58ee9a 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -975,20 +975,17 @@ static void gen_aa32_st_i32(DisasContext *s, TCGv_i32 val, TCGv_i32 a32,
         gen_aa32_st_i32(s, val, a32, index, OPC);                       \
     }
 
-static inline void gen_aa32_frob64(DisasContext *s, TCGv_i64 val)
-{
-    /* Not needed for user-mode BE32, where we use MO_BE instead.  */
-    if (!IS_USER_ONLY && s->sctlr_b) {
-        tcg_gen_rotri_i64(val, val, 32);
-    }
-}
-
 static void gen_aa32_ld_i64(DisasContext *s, TCGv_i64 val, TCGv_i32 a32,
                             int index, MemOp opc)
 {
     TCGv addr = gen_aa32_addr(s, a32, opc);
     tcg_gen_qemu_ld_i64(val, addr, index, opc);
-    gen_aa32_frob64(s, val);
+
+    /* Not needed for user-mode BE32, where we use MO_BE instead.  */
+    if (!IS_USER_ONLY && s->sctlr_b) {
+        tcg_gen_rotri_i64(val, val, 32);
+    }
+
     tcg_temp_free(addr);
 }
 
@@ -4987,16 +4984,13 @@ static void gen_load_exclusive(DisasContext *s, int rt, int rt2,
         TCGv_i32 tmp2 = tcg_temp_new_i32();
         TCGv_i64 t64 = tcg_temp_new_i64();
 
-        /* For AArch32, architecturally the 32-bit word at the lowest
+        /*
+         * For AArch32, architecturally the 32-bit word at the lowest
          * address is always Rt and the one at addr+4 is Rt2, even if
          * the CPU is big-endian. That means we don't want to do a
-         * gen_aa32_ld_i64(), which invokes gen_aa32_frob64() as if
-         * for an architecturally 64-bit access, but instead do a
-         * 64-bit access using MO_BE if appropriate and then split
-         * the two halves.
-         * This only makes a difference for BE32 user-mode, where
-         * frob64() must not flip the two halves of the 64-bit data
-         * but this code must treat BE32 user-mode like BE32 system.
+         * gen_aa32_ld_i64(), which checks SCTLR_B as if for an
+         * architecturally 64-bit access, but instead do a 64-bit access
+         * using MO_BE if appropriate and then split the two halves.
          */
         TCGv taddr = gen_aa32_addr(s, addr, opc);
 
@@ -5056,14 +5050,15 @@ static void gen_store_exclusive(DisasContext *s, int rd, int rt, int rt2,
         TCGv_i64 n64 = tcg_temp_new_i64();
 
         t2 = load_reg(s, rt2);
-        /* For AArch32, architecturally the 32-bit word at the lowest
+
+        /*
+         * For AArch32, architecturally the 32-bit word at the lowest
          * address is always Rt and the one at addr+4 is Rt2, even if
          * the CPU is big-endian. Since we're going to treat this as a
          * single 64-bit BE store, we need to put the two halves in the
          * opposite order for BE to LE, so that they end up in the right
-         * places.
-         * We don't want gen_aa32_frob64() because that does the wrong
-         * thing for BE32 usermode.
+         * places.  We don't want gen_aa32_st_i64, because that checks
+         * SCTLR_B as if for an architectural 64-bit access.
          */
         if (s->be_data == MO_BE) {
             tcg_gen_concat_i32_i64(n64, t2, t1);
-- 
2.25.1


