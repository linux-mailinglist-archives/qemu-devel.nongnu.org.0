Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C21C681D50
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 22:52:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMc1z-0002Sq-HY; Mon, 30 Jan 2023 16:49:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pMc1w-0002IR-2r
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 16:49:36 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pMc1s-0005cc-Ul
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 16:49:34 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 rm7-20020a17090b3ec700b0022c05558d22so12468533pjb.5
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 13:49:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eH8QC2IFkRWe6pofdb+MHZgnEhO+cdUQERbeKdouJGM=;
 b=U+RYInGRnKhiGrwmwkzKYvFXOZoLAXm0yBpx42FZY1xEh8/9H5B8h1kyX5HOWlLy3W
 6+Z/hdEpofVXyln/TuAQRhmtc2C+/xoMBbvpPneLiYPxIp8qMzJ0RBznFvSk1FqZEq1c
 1BQj1HTytFI6MQjRI8VUe4ykR3bUMzDzfzUPs8UYNEKFJ2baQ80IeQE0+c7cmepqLYmI
 x90SbZ2Feg39zwPIiJ3eIAPOj4pSRZM6fVkwl/iONjI5PH6muVs+9YCtEsoX3Ya550a1
 KA8gncqPFgCyeFCZ+fqdLGUEhfaOGvZZ3LMcECmBu0gU2Gmbw5hQDSiz6vcSCP70imZI
 4n5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eH8QC2IFkRWe6pofdb+MHZgnEhO+cdUQERbeKdouJGM=;
 b=ztSspTeM6IpX5y1lJcpux5CjlzbVgEIh+HAPPIyp7nOJjod0e4aHkbzzUNsyWeSB9P
 SE0i73pQ0GUhZiX7lkPQWevRKj9pPFOrEe1iPPaNJPuBA+6noSH8etqF/gB/cXPFYbuH
 tPdS5mEZ18Kush3Qh9acAG52aB8itqMWikkCBFiwdjyT5kZbxqwFDuWCia/Zatihe4pA
 Fi/d5UxAlZAORVRoDZASGJmpwjgHrLn6Xy0xtxxHjolWw6ErY6OorSbHLIEtx9dqoByh
 /XZePcDDqdqfsunLa6o6rHp1B7B8TjpMENO86LqVlRwTUPrEZ/QyEXAnBk00OOcPQ2PR
 zGRw==
X-Gm-Message-State: AO0yUKUBLhrTWtyg8JF3rVfYe8MxvWuMCs0tEoZvbXz9YEY9r/Iuip1W
 zD+uN2ArYXpSu7naryF/Io0h+NSN3IDqYKYb
X-Google-Smtp-Source: AK7set+7VvJWzEUZwfgIIQM1e6DpZaMIX/meA46nuHe6zzCdjcSnDlkRW7QEn3IPsWNoCZWZjv7j9w==
X-Received: by 2002:a17:90b:1b4f:b0:22c:28c6:74fb with SMTP id
 nv15-20020a17090b1b4f00b0022c28c674fbmr17700259pjb.19.1675115372169; 
 Mon, 30 Jan 2023 13:49:32 -0800 (PST)
Received: from stoup.. (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a17090ad14400b00219220edf0dsm7451215pjw.48.2023.01.30.13.49.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 13:49:31 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, philmd@linaro.org,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v6 27/36] target/s390x: Use Int128 for return from CKSM
Date: Mon, 30 Jan 2023 11:48:35 -1000
Message-Id: <20230130214844.1158612-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230130214844.1158612-1-richard.henderson@linaro.org>
References: <20230130214844.1158612-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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


