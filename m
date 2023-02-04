Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BDA268AB5E
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Feb 2023 17:38:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOLUL-0005F9-EC; Sat, 04 Feb 2023 11:34:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pOLUJ-0005Em-Ag
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 11:34:03 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pOLUH-0002af-NK
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 11:34:03 -0500
Received: by mail-pj1-x102b.google.com with SMTP id bx22so4935162pjb.3
 for <qemu-devel@nongnu.org>; Sat, 04 Feb 2023 08:34:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eH8QC2IFkRWe6pofdb+MHZgnEhO+cdUQERbeKdouJGM=;
 b=i/iCm68JfG2Zszai6dW+CUI2RMyLorOzHGra/bW53Nfs8WlmSPGFjP0D/VhWvsMyB1
 gj5jBK/HyPmhrSo6oBOY4WKnTE1EEFFefpm9Hv7U2H6kd2btMk9d06v2UvD5lVhdYKmj
 IYoKu4ECgARBZ9BgIIGcA/OT6P/Y90c8vIAkNsjdWeTujTJ3hFFGr53OYRU3trys0qmP
 Ph7Abt3GtMkgBmAXtAlzaNOzceHY/YRkBqrhGQ0LGotlnXJauDFi+upoz1+ukxzpiVz+
 ZznOTLlMIgbIkgh9S1jHkpRKfvCI4Q1nUKTfsvYYqujw2lD2c5vxBk1CqnEXbN5qxBKz
 oWvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eH8QC2IFkRWe6pofdb+MHZgnEhO+cdUQERbeKdouJGM=;
 b=VnczIzHzTYRTtULuT9n2EeP3DpGlO3HFg1BOlEnqYJWQF+BjfNLRuOUocQ6ESXZDZa
 OqPYF/UsGBuHRw0jmYVA21oRR1P4iaaL7PvnxcEzoN2pgrMx+eqY0rExQD12gQsFXOAa
 dgarAHI/pfYumTe8bbFEB2MhOdcwzWUmHyZwXYH0BlEng/qxnwFQDZTFCNvX7DOh7Vah
 PLigrx1Sep590VF0ShqKomZqwevH2iyvD245M8baMEpNXB9TI8jmQl2s3OU0GMlL6TdS
 Dy0d2rRC537ysrxe3I/SMa2JDPD5k0Z+9ZotKazYsNK5XeFkg/NUHl8C1Ybuzr/lJYti
 qY4A==
X-Gm-Message-State: AO0yUKWT0u8WoM4ZHqwr8FJIa3mCaKyFVeWLyHhCH95A8E5edD9E88yY
 ve2iV7+eeHcexGHHPA6BrKraO9uxKl5BqJS1
X-Google-Smtp-Source: AK7set/avD2+Sm5UoC2zk5NJrOIGr04jwBRV5oNSEi+eVGEsabY6THArSLRnY9bNmECr3y+h9lWRTw==
X-Received: by 2002:a05:6a20:a001:b0:b8:c5b3:bfc with SMTP id
 p1-20020a056a20a00100b000b8c5b30bfcmr16333870pzj.39.1675528440373; 
 Sat, 04 Feb 2023 08:34:00 -0800 (PST)
Received: from stoup.. (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
 by smtp.gmail.com with ESMTPSA id
 w19-20020a1709029a9300b00186b69157ecsm3660859plp.202.2023.02.04.08.33.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Feb 2023 08:33:59 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Ilya Leoshkevich <iii@linux.ibm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 30/40] target/s390x: Use Int128 for return from CKSM
Date: Sat,  4 Feb 2023 06:33:00 -1000
Message-Id: <20230204163310.815536-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230204163310.815536-1-richard.henderson@linaro.org>
References: <20230204163310.815536-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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

Acked-by: Ilya Leoshkevich <iii@linux.ibm.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/helper.h         | 2 +-
 target/s390x/tcg/mem_helper.c | 7 +++----
 target/s390x/tcg/translate.c  | 6 ++++--
 3 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/target/s390x/helper.h b/target/s390x/helper.h
index 25c2dd0b3c..03b29efa3e 100644
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
index 9be42851d8..b0b403e23a 100644
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
index 8397fe2bd8..1a7aa9e4ae 100644
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


