Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 256002C37F6
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Nov 2020 05:18:08 +0100 (CET)
Received: from localhost ([::1]:46886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khmFr-0000tn-7R
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 23:18:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1khm57-00059F-Qs
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 23:07:01 -0500
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:38578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1khm56-00066s-9R
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 23:07:01 -0500
Received: by mail-pl1-x641.google.com with SMTP id l1so456075pld.5
 for <qemu-devel@nongnu.org>; Tue, 24 Nov 2020 20:06:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bswwFH6M3LzgrGioTuBuBml8sz+8WXNnbRNFMSINy5c=;
 b=cPfStF8QWfXHzmeHyUAwYMr95YL+SgbOyg+t/I7RgWFMOjg6Mnj/Uj/PkrlTspdXrr
 vaweJ4fHkxzT7rTzGDD+8QXxlri67W1A9ePAECiLTQRSHdIGEY9rBnjU+ei7Ox8vkgnH
 5qhBHXcknXBh7ZJAeWPJWNdEbX7xwPFR+GrDAbROduL4G2QIhSXa+iovkxal2xkkCYss
 W1qoV1fle1pV88fz9UM08pzFmw6ezytjI5jR5dgGqB/JSoAOOBvcBJ7Dz6jbhXPR8ZNh
 iOnOmVG8dCeYATKrSPhHqCCf6TKwEEVuHmTrGZWNJBpFX4PbYHplCduEjR9u41vydADU
 RFvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bswwFH6M3LzgrGioTuBuBml8sz+8WXNnbRNFMSINy5c=;
 b=UYLtHvCktYnPprFKHTZAGuSMraD9Ou9pBdiftRVAA7ouaztVHG+pyYLpGg3BAhNLz8
 X5bs839kUEkzNWfrgIbQYieKcWPcBb934zPz7lWTcpWRFzQjWKxr43Qtabe5v5WJ5xAX
 Y6WyW259DkQ7joeQgULdkW3XNiQPIHjDlhZT/kUwvcCX+koh07OrPMQ9HzyAIUVNMWbq
 mWagmxJYbl6suYdjgqAmAh4RwZjxsvZw2AICZUzmYbN8xDgPvZ0AM3/RLXvbrS+vuX1V
 WbHCBhZYNt76KO0HtttIubodfP2S7EnqlzU2/zxjDEKryM+ca8rb47D0piGTykNUKEw1
 pFEA==
X-Gm-Message-State: AOAM5308OCKShWtJsgtgsC5qST2+OKWPeDqdXjcvb/q+rzzKXUKucqwP
 YyWM4C3zrMB3BYoLoWOJLDr67tUiGvqlnw==
X-Google-Smtp-Source: ABdhPJzc3GuKmI6Y9PNbGdFU7ZNgInk/1fblltE9ZDG2nZmcQpd/9evaVqDrttzglWTjMmkVg1PjRQ==
X-Received: by 2002:a17:902:ff07:b029:d8:eea2:afae with SMTP id
 f7-20020a170902ff07b02900d8eea2afaemr1604511plj.18.1606277218752; 
 Tue, 24 Nov 2020 20:06:58 -0800 (PST)
Received: from localhost.localdomain ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id f7sm447806pfe.30.2020.11.24.20.06.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2020 20:06:58 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 11/11] target/arm: Enforce alignment for VLDn/VSTn (single)
Date: Tue, 24 Nov 2020 20:06:42 -0800
Message-Id: <20201125040642.2339476-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201125040642.2339476-1-richard.henderson@linaro.org>
References: <20201125040642.2339476-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::641;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x641.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-neon.c.inc | 39 ++++++++++++++++++++++++++-------
 1 file changed, 31 insertions(+), 8 deletions(-)

diff --git a/target/arm/translate-neon.c.inc b/target/arm/translate-neon.c.inc
index 330b5fc7b0..160dc3d755 100644
--- a/target/arm/translate-neon.c.inc
+++ b/target/arm/translate-neon.c.inc
@@ -602,6 +602,7 @@ static bool trans_VLDST_single(DisasContext *s, arg_VLDST_single *a)
     int nregs = a->n + 1;
     int vd = a->vd;
     TCGv_i32 addr, tmp;
+    MemOp mop;
 
     if (!arm_dc_feature(s, ARM_FEATURE_NEON)) {
         return false;
@@ -651,25 +652,47 @@ static bool trans_VLDST_single(DisasContext *s, arg_VLDST_single *a)
         return true;
     }
 
+    mop = s->be_data | a->size;
+    if (a->align) {
+        static const MemOp mop_align[] = {
+            MO_ALIGN_2, MO_ALIGN_4, MO_ALIGN_8, MO_ALIGN_16
+        };
+
+        switch (nregs) {
+        case 1:
+            mop |= MO_ALIGN;
+            break;
+        case 2:
+            mop |= mop_align[a->size];
+            break;
+        case 3:
+            /* the align field is repurposed for VLD3 */
+            break;
+        case 4:
+            mop |= mop_align[a->size + a->align];
+            break;
+        default:
+            g_assert_not_reached();
+        }
+    }
+
     tmp = tcg_temp_new_i32();
     addr = tcg_temp_new_i32();
     load_reg_var(s, addr, a->rn);
-    /*
-     * TODO: if we implemented alignment exceptions, we should check
-     * addr against the alignment encoded in a->align here.
-     */
+
     for (reg = 0; reg < nregs; reg++) {
         if (a->l) {
-            gen_aa32_ld_i32(s, tmp, addr, get_mem_index(s),
-                            s->be_data | a->size);
+            gen_aa32_ld_i32(s, tmp, addr, get_mem_index(s), mop);
             neon_store_element(vd, a->reg_idx, a->size, tmp);
         } else { /* Store */
             neon_load_element(tmp, vd, a->reg_idx, a->size);
-            gen_aa32_st_i32(s, tmp, addr, get_mem_index(s),
-                            s->be_data | a->size);
+            gen_aa32_st_i32(s, tmp, addr, get_mem_index(s), mop);
         }
         vd += a->stride;
         tcg_gen_addi_i32(addr, addr, 1 << a->size);
+
+        /* Subsequent memory operations inherit alignment */
+        mop &= ~MO_AMASK;
     }
     tcg_temp_free_i32(addr);
     tcg_temp_free_i32(tmp);
-- 
2.25.1


