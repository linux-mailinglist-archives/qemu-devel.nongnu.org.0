Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B700C625484
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 08:42:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otOfU-00068s-1a; Fri, 11 Nov 2022 02:41:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otOfP-00067M-23
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 02:41:35 -0500
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otOfL-0007iI-Mh
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 02:41:34 -0500
Received: by mail-pg1-x536.google.com with SMTP id 130so3803552pgc.5
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 23:41:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RqkUbgBv122Thnf546PHquT7r6o6Y94wYiKV+lBMbFo=;
 b=PpHNoMGglIE6l35a26vO6QEFLrS9huY/qGMMGsQn11cHX2LrJFi7XUVXXKwLbFUWTK
 iNMhXn/uc4sUkCsyImnML4TJkRDiLZt266I+soJLvTsV4CULxglWdYcrEicaZm/3vOxD
 0NJ8ucYKHREDry6Xshcke+xTPMOASW7G8W/wXBijgbeI8ZHjt8+AC73GahijqpIgxxRX
 zUvq+7JsFqWC8pRDOPWALgQn3sbo3vrHdaneP2YhcDgQiPg6RH3kjOqOI52xJblonXwr
 OyupodQuaapDOKr7Q9cruVcUQ7WpYFvLv9Yt3lysS0lP/4ib2tdys1g0JeHTOm7K7sm6
 cmog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RqkUbgBv122Thnf546PHquT7r6o6Y94wYiKV+lBMbFo=;
 b=rMvJfMzAivGX2Cm/ed1QNxv+yQFrnsIRLvXfZ+vscgdXsWuz2dt6zSreuahJEbTTq1
 fFfejfXCuyen9XtNfLzHUdjQ8heTnfKV8Y84IBNTibhBBIKVq+T747pb75Y4SFJrIuOt
 icGLUa3VfX+y3orU8/+qJ18YZk7f0f4u4E2LiqusSCtPU7bjvhdhJOrDHYqIXm3wz8kQ
 f4Q66Y0ZD4WRqrYv7V7w043ba5aUCAeMmELgP83PYIfE/6W53fjG3Z5v3JcpWlVC5s6q
 ptJk6BkKBAmtaJ35oBXL40MmmPaueFt53Q6bwlUBdZ6aIuM24XBkh5LYwu7jFvj7NIJG
 m2vQ==
X-Gm-Message-State: ANoB5pnS0m1mtWJyU+Is6BKtbIzK0UGj4Vik0k+aM6YdxYL+aPSuI4lO
 dPysuXzMob8IAH6KDDfWq2vkNwn9zqJRH1Zo
X-Google-Smtp-Source: AA0mqf6+PydmS+s1UnhHQnDpzGvSC/h5F0znMlCPy39kuemyubQifAlU/s8KNPtxmapu4FUC8DVbpA==
X-Received: by 2002:a63:1b17:0:b0:457:dced:8ba9 with SMTP id
 b23-20020a631b17000000b00457dced8ba9mr653117pgb.221.1668152486597; 
 Thu, 10 Nov 2022 23:41:26 -0800 (PST)
Received: from stoup.lan
 (2001-44b8-2176-c800-0aef-59aa-1faf-7e61.static.ipv6.internode.on.net.
 [2001:44b8:2176:c800:aef:59aa:1faf:7e61])
 by smtp.gmail.com with ESMTPSA id
 o15-20020a170902d4cf00b001754fa42065sm976069plg.143.2022.11.10.23.41.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Nov 2022 23:41:26 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: [PATCH for-8.0 v3 08/45] target/sparc: Avoid TCGV_{LOW,HIGH}
Date: Fri, 11 Nov 2022 17:40:24 +1000
Message-Id: <20221111074101.2069454-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221111074101.2069454-1-richard.henderson@linaro.org>
References: <20221111074101.2069454-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Use the official extend/extract functions instead of routines
that will shortly be internal to tcg.

Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/sparc/translate.c | 21 ++++-----------------
 1 file changed, 4 insertions(+), 17 deletions(-)

diff --git a/target/sparc/translate.c b/target/sparc/translate.c
index 34858eb95f..150aeecd14 100644
--- a/target/sparc/translate.c
+++ b/target/sparc/translate.c
@@ -163,13 +163,6 @@ static inline void gen_update_fprs_dirty(DisasContext *dc, int rd)
 /* floating point registers moves */
 static TCGv_i32 gen_load_fpr_F(DisasContext *dc, unsigned int src)
 {
-#if TCG_TARGET_REG_BITS == 32
-    if (src & 1) {
-        return TCGV_LOW(cpu_fpr[src / 2]);
-    } else {
-        return TCGV_HIGH(cpu_fpr[src / 2]);
-    }
-#else
     TCGv_i32 ret = get_temp_i32(dc);
     if (src & 1) {
         tcg_gen_extrl_i64_i32(ret, cpu_fpr[src / 2]);
@@ -177,22 +170,16 @@ static TCGv_i32 gen_load_fpr_F(DisasContext *dc, unsigned int src)
         tcg_gen_extrh_i64_i32(ret, cpu_fpr[src / 2]);
     }
     return ret;
-#endif
 }
 
 static void gen_store_fpr_F(DisasContext *dc, unsigned int dst, TCGv_i32 v)
 {
-#if TCG_TARGET_REG_BITS == 32
-    if (dst & 1) {
-        tcg_gen_mov_i32(TCGV_LOW(cpu_fpr[dst / 2]), v);
-    } else {
-        tcg_gen_mov_i32(TCGV_HIGH(cpu_fpr[dst / 2]), v);
-    }
-#else
-    TCGv_i64 t = (TCGv_i64)v;
+    TCGv_i64 t = tcg_temp_new_i64();
+
+    tcg_gen_extu_i32_i64(t, v);
     tcg_gen_deposit_i64(cpu_fpr[dst / 2], cpu_fpr[dst / 2], t,
                         (dst & 1 ? 0 : 32), 32);
-#endif
+    tcg_temp_free_i64(t);
     gen_update_fprs_dirty(dc, dst);
 }
 
-- 
2.34.1


