Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C10323B78BA
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 21:34:03 +0200 (CEST)
Received: from localhost ([::1]:34380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyJUg-00017D-RL
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 15:34:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyItE-00089f-Li
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:55:20 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:38611)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyItA-0000uL-2A
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:55:20 -0400
Received: by mail-pg1-x531.google.com with SMTP id h4so19372828pgp.5
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 11:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=z6UwI1RxNTo4T8wHnycHVVtlEB9fHtDjgwur3ezSLaU=;
 b=y7k6+5WABYdLN4xRMZtCkO2/rWJsLPwGTf4liJL3rslzUVMJNzqbxRNEvStgim+TaJ
 ieuWlx3rdfRpOFoVeAMCJ+DuGrNBT/TfJAMj4fAOLH5preEK7pC3jNqyn/iCbQfjy/bx
 w8B5fiWJKnMBIDW5b8qkNMtUHw5dz5WR/Hhit8BJWaq+Jq2v9itMYCrNTboSWj+7TpaX
 GKGFsgIqi6Sd/3yX0bBSOZoCzm3XR3ADDWXJ4ZwT7L9Iz7YaxUmb6lYZvK1fNKYv9Qe0
 QCf4Nv/L+mQ60TsMH6muyp4Zsapd2f7CUG7XLSCGVxbb+chqt3/Ixjt6QSnHeR8e88Hm
 Oz2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=z6UwI1RxNTo4T8wHnycHVVtlEB9fHtDjgwur3ezSLaU=;
 b=PqWngVKcrKFA0VPXFJB9Tx5SNZTgfNdcUoAop+apmrR+viV01kMvqhtFiyTZuhMrbV
 rzZ1qedSTyyoFPydv9tIMkTTY0IFBPFkORUT5Agst6+BVOyQzXQqGBeXKs+ZeB8WIXU+
 AeSw859W7K8pfLyL0kL02x62yaL+vy0CfSpFe6+LvFclKryI8WPVqQGY0qAo/u3Zs2Pl
 /e8jVywJdYkSUz3xkc8X+mMkGmramKvxrGqppi/wBtEozTeQtmEQvAUFldz9hZjihWvF
 Tzg3g2vZCFHhW1PLHLWS9MV4qo2AG/LPJNV/lt+hr9ptwg7hws7GW/xh/0uKEddBZ/4b
 FyHQ==
X-Gm-Message-State: AOAM533RIU1av8QgfPiLL8sLK3qz/M3pQsJ/i5K41ZoiJ8EeB5oyHZfa
 JFrnJMIntUejgMcbf1Jl5j9vX+dAJE9n+w==
X-Google-Smtp-Source: ABdhPJzNHgsyMmdSummstG0FDGVDzroiIJa31U/kElcTF5Ym5X4F1t3P1zrs0ti4yTX/dOGQd5133A==
X-Received: by 2002:a65:5c4a:: with SMTP id v10mr29482050pgr.142.1624992912902; 
 Tue, 29 Jun 2021 11:55:12 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id j2sm18811253pfb.53.2021.06.29.11.55.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 11:55:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 29/63] tcg: Add tcg_gen_vec_add{sub}16_i32
Date: Tue, 29 Jun 2021 11:54:21 -0700
Message-Id: <20210629185455.3131172-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210629185455.3131172-1-richard.henderson@linaro.org>
References: <20210629185455.3131172-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
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
Cc: LIU Zhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: LIU Zhiwei <zhiwei_liu@c-sky.com>

Implement tcg_gen_vec_add{sub}16_tl by adding corresponding i32 OP.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-Id: <20210624105023.3852-2-zhiwei_liu@c-sky.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg-op-gvec.h | 13 +++++++++++++
 tcg/tcg-op-gvec.c         | 28 ++++++++++++++++++++++++++++
 2 files changed, 41 insertions(+)

diff --git a/include/tcg/tcg-op-gvec.h b/include/tcg/tcg-op-gvec.h
index c69a7de984..9b67822f54 100644
--- a/include/tcg/tcg-op-gvec.h
+++ b/include/tcg/tcg-op-gvec.h
@@ -401,4 +401,17 @@ void tcg_gen_vec_sar16i_i64(TCGv_i64 d, TCGv_i64 a, int64_t);
 void tcg_gen_vec_rotl8i_i64(TCGv_i64 d, TCGv_i64 a, int64_t c);
 void tcg_gen_vec_rotl16i_i64(TCGv_i64 d, TCGv_i64 a, int64_t c);
 
+/* 32-bit vector operations. */
+void tcg_gen_vec_add16_i32(TCGv_i32 d, TCGv_i32 a, TCGv_i32 b);
+
+void tcg_gen_vec_sub16_i32(TCGv_i32 d, TCGv_i32 a, TCGv_i32 b);
+
+#if TARGET_LONG_BITS == 64
+#define tcg_gen_vec_add16_tl tcg_gen_vec_add16_i64
+#define tcg_gen_vec_sub16_tl tcg_gen_vec_sub16_i64
+#else
+#define tcg_gen_vec_add16_tl tcg_gen_vec_add16_i32
+#define tcg_gen_vec_sub16_tl tcg_gen_vec_sub16_i32
+#endif
+
 #endif
diff --git a/tcg/tcg-op-gvec.c b/tcg/tcg-op-gvec.c
index 515db120cc..7ddd56c0e6 100644
--- a/tcg/tcg-op-gvec.c
+++ b/tcg/tcg-op-gvec.c
@@ -1742,6 +1742,20 @@ void tcg_gen_vec_add16_i64(TCGv_i64 d, TCGv_i64 a, TCGv_i64 b)
     gen_addv_mask(d, a, b, m);
 }
 
+void tcg_gen_vec_add16_i32(TCGv_i32 d, TCGv_i32 a, TCGv_i32 b)
+{
+    TCGv_i32 t1 = tcg_temp_new_i32();
+    TCGv_i32 t2 = tcg_temp_new_i32();
+
+    tcg_gen_andi_i32(t1, a, ~0xffff);
+    tcg_gen_add_i32(t2, a, b);
+    tcg_gen_add_i32(t1, t1, b);
+    tcg_gen_deposit_i32(d, t1, t2, 0, 16);
+
+    tcg_temp_free_i32(t1);
+    tcg_temp_free_i32(t2);
+}
+
 void tcg_gen_vec_add32_i64(TCGv_i64 d, TCGv_i64 a, TCGv_i64 b)
 {
     TCGv_i64 t1 = tcg_temp_new_i64();
@@ -1892,6 +1906,20 @@ void tcg_gen_vec_sub16_i64(TCGv_i64 d, TCGv_i64 a, TCGv_i64 b)
     gen_subv_mask(d, a, b, m);
 }
 
+void tcg_gen_vec_sub16_i32(TCGv_i32 d, TCGv_i32 a, TCGv_i32 b)
+{
+    TCGv_i32 t1 = tcg_temp_new_i32();
+    TCGv_i32 t2 = tcg_temp_new_i32();
+
+    tcg_gen_andi_i32(t1, b, ~0xffff);
+    tcg_gen_sub_i32(t2, a, b);
+    tcg_gen_sub_i32(t1, a, t1);
+    tcg_gen_deposit_i32(d, t1, t2, 0, 16);
+
+    tcg_temp_free_i32(t1);
+    tcg_temp_free_i32(t2);
+}
+
 void tcg_gen_vec_sub32_i64(TCGv_i64 d, TCGv_i64 a, TCGv_i64 b)
 {
     TCGv_i64 t1 = tcg_temp_new_i64();
-- 
2.25.1


