Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B006B60719D
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 10:03:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oln0D-0005kM-VY
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 04:03:39 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olmVK-0004XT-5O
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 03:31:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olmUo-00045B-VC
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 03:31:12 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olmUa-0007vk-OD
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 03:31:07 -0400
Received: by mail-pg1-x52c.google.com with SMTP id 128so1851160pga.1
 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022 00:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/rok+6KDRpXT7JmHw7TCPUnVpNhZz1E6dInc4GSpPSY=;
 b=EDpdwYnp6tsVYoD7bsectTFQHrPgtYDPV1a13lT3U9U5r4OS7yl2t2Ro+9fbJs2gYG
 INHJMxdvsbcxZk49oIByKRyLjeOtsMWpn3qCnops2hxDD/mxpcAFIUGX+LqZA3R6dBYj
 s2zqpPS/qlxG+WVOcLMl0d7OIBnuL1G1TDovIG/JLcFeV8asu4+Lik+3jhlrTRLiqAmP
 NcaD16T/Xg//MEEdKBVIctsfFVna7YZbDdiQhwginM3b9ITdH3oH6XZeiRVF5wET15tK
 bsiPrla+Y/71cd3CnR3AV0Poy9nim7eWXhTKSS9QEJKlk2AfQpx4Q8ARlU+7HAmCglak
 X+NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/rok+6KDRpXT7JmHw7TCPUnVpNhZz1E6dInc4GSpPSY=;
 b=633U1N3OpAcRFTanHCVUqmkDFOS2sWOta6Lk0VuLwP2VgBd6ZjfWrAmGdWZU/XREEV
 SUvZ5v8BO2cdRZDPQD5+VJukyJQez5tC/9wYudX+h46kpdPA+8h8zFLtEKzKlWs+G3ZV
 aQPMzypJqQ87T1GLOEgpGaq7sv/UJ0XL7Q6Ht1Xg3apdmi/A7ya5up+m1CHgusgwjyHb
 yrEM23EBvCdAdxT2wsVevDiNk2A3HEaEcvHhUFxLdVEtQ/wcpz/VaQlLK/llE8uH1jON
 aGkKoLr5ZPKTWDJ0NDD9Blnl5a36MWp2mG3+iIA84ei5nRDgYRMxBXAoBAmA38cVQ2Cl
 7ZEg==
X-Gm-Message-State: ACrzQf15DUe/y9W6NO7VrBoXBwbYoA6trIe7tA/LYL6qcuxVIfW3eUsT
 ibWF+g22bbonwdA2jhRxh/RXglKf9K6AUFzW
X-Google-Smtp-Source: AMsMyM5zM3feodSNpYnocGiQ7qc7wnBrsLoqHrwZTG4RFW+tOcAxUN+QCvA1V73WkmVJ1sBqViBkQw==
X-Received: by 2002:aa7:8893:0:b0:563:89e0:2d43 with SMTP id
 z19-20020aa78893000000b0056389e02d43mr17385331pfe.25.1666337455287; 
 Fri, 21 Oct 2022 00:30:55 -0700 (PDT)
Received: from localhost.localdomain ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 a9-20020a17090a6d8900b002008d0e5cb5sm1042721pjk.47.2022.10.21.00.30.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 00:30:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org
Subject: [PATCH 4/9] target/s390x: Use Int128 for return from CKSM
Date: Fri, 21 Oct 2022 17:30:01 +1000
Message-Id: <20221021073006.2398819-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221021073006.2398819-1-richard.henderson@linaro.org>
References: <20221021073006.2398819-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/helper.h         | 2 +-
 target/s390x/tcg/mem_helper.c | 7 +++----
 target/s390x/tcg/translate.c  | 6 ++++--
 3 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/target/s390x/helper.h b/target/s390x/helper.h
index ba9ed11896..16045b6dbe 100644
--- a/target/s390x/helper.h
+++ b/target/s390x/helper.h
@@ -103,7 +103,7 @@ DEF_HELPER_4(tre, i64, env, i64, i64, i64)
 DEF_HELPER_4(trt, i32, env, i32, i64, i64)
 DEF_HELPER_4(trtr, i32, env, i32, i64, i64)
 DEF_HELPER_5(trXX, i32, env, i32, i32, i32, i32)
-DEF_HELPER_4(cksm, i64, env, i64, i64, i64)
+DEF_HELPER_4(cksm, i128, env, i64, i64, i64)
 DEF_HELPER_FLAGS_5(calc_cc, TCG_CALL_NO_RWG_SE, i32, env, i32, i64, i64, i64)
 DEF_HELPER_FLAGS_2(sfpc, TCG_CALL_NO_WG, void, env, i64)
 DEF_HELPER_FLAGS_2(sfas, TCG_CALL_NO_WG, void, env, i64)
diff --git a/target/s390x/tcg/mem_helper.c b/target/s390x/tcg/mem_helper.c
index 5a299ca9a2..bb6714aee4 100644
--- a/target/s390x/tcg/mem_helper.c
+++ b/target/s390x/tcg/mem_helper.c
@@ -1350,8 +1350,8 @@ uint32_t HELPER(clclu)(CPUS390XState *env, uint32_t r1, uint64_t a2,
 }
 
 /* checksum */
-uint64_t HELPER(cksm)(CPUS390XState *env, uint64_t r1,
-                      uint64_t src, uint64_t src_len)
+Int128 HELPER(cksm)(CPUS390XState *env, uint64_t r1,
+                    uint64_t src, uint64_t src_len)
 {
     uintptr_t ra = GETPC();
     uint64_t max_len, len;
@@ -1392,8 +1392,7 @@ uint64_t HELPER(cksm)(CPUS390XState *env, uint64_t r1,
     env->cc_op = (len == src_len ? 0 : 3);
 
     /* Return both cksm and processed length.  */
-    env->retxl = cksm;
-    return len;
+    return int128_make128(cksm, len);
 }
 
 void HELPER(pack)(CPUS390XState *env, uint32_t len, uint64_t dest, uint64_t src)
diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index 63ce131cbf..224046551f 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -2041,11 +2041,13 @@ static DisasJumpType op_cxlgb(DisasContext *s, DisasOps *o)
 static DisasJumpType op_cksm(DisasContext *s, DisasOps *o)
 {
     int r2 = get_field(s, r2);
+    TCGv_i128 pair = tcg_temp_new_i128();
     TCGv_i64 len = tcg_temp_new_i64();
 
-    gen_helper_cksm(len, cpu_env, o->in1, o->in2, regs[r2 + 1]);
+    gen_helper_cksm(pair, cpu_env, o->in1, o->in2, regs[r2 + 1]);
     set_cc_static(s);
-    return_low128(o->out);
+    tcg_gen_extr_i128_i64(o->out, len, pair);
+    tcg_temp_free_i128(pair);
 
     tcg_gen_add_i64(regs[r2], regs[r2], len);
     tcg_gen_sub_i64(regs[r2 + 1], regs[r2 + 1], len);
-- 
2.34.1


