Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 841D060716D
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 09:50:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olmna-0002PM-UZ
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 03:50:35 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olmVP-0004eM-Fo
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 03:31:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olmUq-00045h-LG
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 03:31:16 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olmUX-0007vO-P6
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 03:31:12 -0400
Received: by mail-pg1-x52b.google.com with SMTP id u71so1849657pgd.2
 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022 00:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hLRrIVuBZjjDNeiWycMrRFTB0ofq8rCekDwEI69XsFA=;
 b=jpxqPx4ZVIuC6IeJK1iNJYFDG5qoKnS1SEmgc/2uxhx0iNlz2AvIFEA7FaFQs/Ewk9
 2Z33XVw/S8OU64JID6R7BmQVv8CiLeBfL2gYfECpJr07dadgSJD4WVDUkomVeLl8MZVE
 NTNC7BrmJT9OhmGdtZNAscy1zK2f6hSzpLHwKcd9tl1vfRjmMPpsbMXfOdkoXwPKjWt/
 58mYwJUASr3osXByPGvDqlEZsGdXb9O+MsoW4+XR7TqEQUocewelc4RC6EeEUUm3eYEk
 69bUZ31tyZw4DqYg+R5wlu1Xsi5r7uT5cQBPae68Qu17GV/0ZmDeyZFaucOKk9XCFgnD
 lfTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hLRrIVuBZjjDNeiWycMrRFTB0ofq8rCekDwEI69XsFA=;
 b=n+kJUKPSifcZ3qMNO53ppVHDqQW5SWImz4UPenPRCpDDya02EIeS2eq2yve0F5A0E3
 e6AZ0DZENb9Ga9VZUPAvgvlu1/zFYMIy3ADVkRhHmfBzeL7IqlmehGqnJigkP/2IbOOO
 WKGooPQple/5+XxqkbiU1Yc28Wu4FkcbkK8HnPPYJ1AWQBQ13U6t71aoQrYGcJTBne4f
 gkOURpAY6M7csoAmvLBPc2zp+tG2ubeUn2v598tFMYpMvUkq5aW1HDs/LdyTe0kvKsE8
 1hjADfoEpsrOZfsxLb9VbLezVak/gaFdjR1JkxeWyXK+8Ol5Tef2qeqHhlsUAy31VOpK
 MUaw==
X-Gm-Message-State: ACrzQf1g4OcBIg+hozehj4p7xIxgK0seoE+mzhVQ3oLHA8EhhKCWERm4
 YX5oHK4Zpev3H6OnuYhXI6ZRv4nLprU//FyY
X-Google-Smtp-Source: AMsMyM49Z1UjBusXflUz9w9iNmUc7d3wfOANnyKkMNZJxsrU5c45ZLWgdxP4o8jPFkZpMU4CcN5jpA==
X-Received: by 2002:a62:1a97:0:b0:562:5587:12d6 with SMTP id
 a145-20020a621a97000000b00562558712d6mr17707676pfa.37.1666337452404; 
 Fri, 21 Oct 2022 00:30:52 -0700 (PDT)
Received: from localhost.localdomain ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 a9-20020a17090a6d8900b002008d0e5cb5sm1042721pjk.47.2022.10.21.00.30.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 00:30:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org
Subject: [PATCH 3/9] target/s390x: Use Int128 for return from CLST
Date: Fri, 21 Oct 2022 17:30:00 +1000
Message-Id: <20221021073006.2398819-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221021073006.2398819-1-richard.henderson@linaro.org>
References: <20221021073006.2398819-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 target/s390x/helper.h         |  2 +-
 target/s390x/tcg/mem_helper.c | 11 ++++-------
 target/s390x/tcg/translate.c  |  8 ++++++--
 3 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/target/s390x/helper.h b/target/s390x/helper.h
index 29986557ed..ba9ed11896 100644
--- a/target/s390x/helper.h
+++ b/target/s390x/helper.h
@@ -16,7 +16,7 @@ DEF_HELPER_FLAGS_3(divs64, TCG_CALL_NO_WG, i128, env, s64, s64)
 DEF_HELPER_FLAGS_4(divu64, TCG_CALL_NO_WG, i128, env, i64, i64, i64)
 DEF_HELPER_3(srst, void, env, i32, i32)
 DEF_HELPER_3(srstu, void, env, i32, i32)
-DEF_HELPER_4(clst, i64, env, i64, i64, i64)
+DEF_HELPER_4(clst, i128, env, i64, i64, i64)
 DEF_HELPER_FLAGS_4(mvn, TCG_CALL_NO_WG, void, env, i32, i64, i64)
 DEF_HELPER_FLAGS_4(mvo, TCG_CALL_NO_WG, void, env, i32, i64, i64)
 DEF_HELPER_FLAGS_4(mvpg, TCG_CALL_NO_WG, i32, env, i64, i32, i32)
diff --git a/target/s390x/tcg/mem_helper.c b/target/s390x/tcg/mem_helper.c
index 3758b9e688..5a299ca9a2 100644
--- a/target/s390x/tcg/mem_helper.c
+++ b/target/s390x/tcg/mem_helper.c
@@ -886,7 +886,7 @@ void HELPER(srstu)(CPUS390XState *env, uint32_t r1, uint32_t r2)
 }
 
 /* unsigned string compare (c is string terminator) */
-uint64_t HELPER(clst)(CPUS390XState *env, uint64_t c, uint64_t s1, uint64_t s2)
+Int128 HELPER(clst)(CPUS390XState *env, uint64_t c, uint64_t s1, uint64_t s2)
 {
     uintptr_t ra = GETPC();
     uint32_t len;
@@ -904,23 +904,20 @@ uint64_t HELPER(clst)(CPUS390XState *env, uint64_t c, uint64_t s1, uint64_t s2)
             if (v1 == c) {
                 /* Equal.  CC=0, and don't advance the registers.  */
                 env->cc_op = 0;
-                env->retxl = s2;
-                return s1;
+                return int128_make128(s2, s1);
             }
         } else {
             /* Unequal.  CC={1,2}, and advance the registers.  Note that
                the terminator need not be zero, but the string that contains
                the terminator is by definition "low".  */
             env->cc_op = (v1 == c ? 1 : v2 == c ? 2 : v1 < v2 ? 1 : 2);
-            env->retxl = s2 + len;
-            return s1 + len;
+            return int128_make128(s2 + len, s1 + len);
         }
     }
 
     /* CPU-determined bytes equal; advance the registers.  */
     env->cc_op = 3;
-    env->retxl = s2 + len;
-    return s1 + len;
+    return int128_make128(s2 + len, s1 + len);
 }
 
 /* move page */
diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index a3f5a55891..63ce131cbf 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -2164,9 +2164,13 @@ static DisasJumpType op_clm(DisasContext *s, DisasOps *o)
 
 static DisasJumpType op_clst(DisasContext *s, DisasOps *o)
 {
-    gen_helper_clst(o->in1, cpu_env, regs[0], o->in1, o->in2);
+    TCGv_i128 pair = tcg_temp_new_i128();
+
+    gen_helper_clst(pair, cpu_env, regs[0], o->in1, o->in2);
+    tcg_gen_extr_i128_i64(o->in2, o->in1, pair);
+    tcg_temp_free_i128(pair);
+
     set_cc_static(s);
-    return_low128(o->in2);
     return DISAS_NEXT;
 }
 
-- 
2.34.1


