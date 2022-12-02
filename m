Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE6464000C
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Dec 2022 06:54:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0ymW-0002bP-IN; Fri, 02 Dec 2022 00:40:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p0ymV-0002Zh-3E
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 00:40:15 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p0ymT-0003Li-IV
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 00:40:14 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 e7-20020a17090a77c700b00216928a3917so7316631pjs.4
 for <qemu-devel@nongnu.org>; Thu, 01 Dec 2022 21:40:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RqkUbgBv122Thnf546PHquT7r6o6Y94wYiKV+lBMbFo=;
 b=mZggTsgrSBNlSNevdAGpQuS9M2Vf879Gme59HB3KVXZ/CU0MS8GXUu9JeiPf2fOjwY
 aQ5GKEZ9NeyANoFL8XZW3AB9Ls1Q0w/WW7VQbbLLTgsDNiIkP01iwH23JwV3Ds/p8vmS
 N1hy5vWGSMBPrCR5H5sxOdzWW+fNp1oJOdhOx2bMqz+FrPawh5QBdIo8k9vVouUZGt4M
 uNIlZuUoNjasgFLxvzHCmf0IC82iOqu5nhKWFFvmB23CsZdw7PS2LDXV+sk5OPJSXJUm
 Uvx3ye3XvL2te0P3g9/0DrTnrvtDafhxPBpPw1STYeihg/P4Bt0bmS9VeYBztxfsup12
 Xhsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RqkUbgBv122Thnf546PHquT7r6o6Y94wYiKV+lBMbFo=;
 b=0ZYNut3eoRFkQnYonuOx66zI3spBB6oi5B6XoBtJ1da8UnHekCA6m9FbW2+oUZ3svW
 4N7fU1LWG1rLNzO3DoJ3G0tmXIyNvXDm+sdPS9Tpibxpdw9ZFga1jbNGVjbrgi+AVGdI
 I+nWBgBM5c44XNSlfgPQ6GiPRrP2iwtWbJYvN6wUQVwXp5cxEr/fU/H5wA2OfBmKMMlt
 k6VkOwVnijqAzBOc/RMZ5Sut79rra6DKRigbsXsAolDAyYjK1tKW4HhVPLXF5GzjnNLW
 L/mZSqvOwd5aw8nHidCI7+BrYQhBVch7OlJKAXbfaoI8hIdMvf6XFMwvSs3qaK/8U6fH
 Zp+A==
X-Gm-Message-State: ANoB5plYAOlfyvi30MqTSCj1DaWQj+Lxq4xYyXC6+wSYl71XMuBKjTrB
 TDMgKhsAOQvB5Fw8sahs0eOxaR2XO7RMmLOE
X-Google-Smtp-Source: AA0mqf4KshIeTJjZP7H9m7A7aJprj8/qP0lWHCgyq0GAuiR/uuTXKlsaXK535QYht+UgR5qcY1/pjw==
X-Received: by 2002:a17:902:7b84:b0:189:6623:61c9 with SMTP id
 w4-20020a1709027b8400b00189662361c9mr36451072pll.121.1669959612331; 
 Thu, 01 Dec 2022 21:40:12 -0800 (PST)
Received: from stoup.. ([2602:47:d48a:1201:e3cc:2e37:17d4:f1d5])
 by smtp.gmail.com with ESMTPSA id
 d12-20020a170903230c00b00186f0f59c85sm4637075plh.235.2022.12.01.21.40.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Dec 2022 21:40:11 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: [PATCH v3 12/34] target/sparc: Avoid TCGV_{LOW,HIGH}
Date: Thu,  1 Dec 2022 21:39:36 -0800
Message-Id: <20221202053958.223890-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221202053958.223890-1-richard.henderson@linaro.org>
References: <20221202053958.223890-1-richard.henderson@linaro.org>
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


