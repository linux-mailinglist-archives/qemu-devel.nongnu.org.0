Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C85D518DDE
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 22:07:01 +0200 (CEST)
Received: from localhost ([::1]:50960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlynU-0007ia-9W
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 16:07:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyWA-0001dV-Vy
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:49:07 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:37572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyW9-0003Zj-Bu
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:49:06 -0400
Received: by mail-pf1-x434.google.com with SMTP id bo5so15577626pfb.4
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 12:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=bMzSVxcdvq+IuYW0Vc/jOyPOv06xtgKXvctJnUGtedE=;
 b=j+An7W31FxhL8mLTNcnB4u/q60PmhwVB8D9LrThK+Bf+ZIcpe6tCSB5JgIhtbsTr8a
 mNXm2OzzNZU+FFAwTHcLD8RbBVxhuXuIKupap8f6PqfDGe2eE4T7/4rr3wbuF+fXlnqd
 EU2nzl1DWGY9Z7jPn/h+hqw0n4hmkNDDasYjvp9kmb0Qjdgy23TqOQJ1VU29qScE4rAJ
 VBNJ0QpaL8ifwo85+hEBZMhLYiYVSnwm2eCeaAKSoggH1V1bXMb8lHgi2AIN4XfWnqdO
 QuipIkFwAIftnGt0aanVuqgg9ZD8u2uwFvrG17zebqhe8Nn7JK+CNOTDzN1ZXavqVfI3
 CPkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bMzSVxcdvq+IuYW0Vc/jOyPOv06xtgKXvctJnUGtedE=;
 b=zJ6EnuLwh7z3qfD532/Si/pbhBLgUestHQrL52N73ggHyiL0Go+tJmhgGlotsJGzrP
 r1XZgHlVlVp/uDiFKw/jZFBKnhAZabONnF//itduA6i17biZn0isoi4y0aP7R4+wtbrQ
 MLEsrD+KWLDmYg5r8dkyHl8je09A57ED/QMiM06cR7L1RfZ40c5ikip2ysowzxXIgMv6
 aZQPW0vRIAEC5b8NFd4JeIIOepiENauFcNGxZRErxHZVMAEGtvLBjU/Picc7wbPD2zgS
 1p2CNhnKKYZKQmCu1FSFCqJ6JWhrlmJf6hCX5XFaA78x11APx6ZO1Hbhz1v3/IlF/jHS
 NgZA==
X-Gm-Message-State: AOAM530WG6bLUFpDLk0XIPJVjfrNZVFNnPYqtgShwhrf/vfmNiwIgnVU
 jtx+cfjOnkUo+u74EglzU99OJurr08zg+g==
X-Google-Smtp-Source: ABdhPJyp6mVdrGmxH4KUgIMMcGFkn9flH9HnjM9jIUFzEoLkENoxn13gzyB0wt00hm1yab9dQHAffw==
X-Received: by 2002:a63:8548:0:b0:3aa:fc6b:a36c with SMTP id
 u69-20020a638548000000b003aafc6ba36cmr14974925pgd.267.1651607343868; 
 Tue, 03 May 2022 12:49:03 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 p11-20020a17090ad30b00b001cd4989fed3sm1712383pju.31.2022.05.03.12.49.03
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 12:49:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 18/74] semihosting: Split out common_semi_has_synccache
Date: Tue,  3 May 2022 12:47:47 -0700
Message-Id: <20220503194843.1379101-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220503194843.1379101-1-richard.henderson@linaro.org>
References: <20220503194843.1379101-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

We already have some larger ifdef blocks for ARM and RISCV;
split out a boolean test for SYS_SYNCCACHE.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 semihosting/arm-compat-semi.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index b2816e9f66..6149be404f 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -224,6 +224,12 @@ static inline target_ulong common_semi_stack_bottom(CPUState *cs)
     CPUARMState *env = &cpu->env;
     return is_a64(env) ? env->xregs[31] : env->regs[13];
 }
+
+static inline bool common_semi_has_synccache(CPUArchState *env)
+{
+    /* Invalid for A32/T32. */
+    return !is_a64(env);
+}
 #endif /* TARGET_ARM */
 
 #ifdef TARGET_RISCV
@@ -260,6 +266,11 @@ static inline target_ulong common_semi_stack_bottom(CPUState *cs)
     CPURISCVState *env = &cpu->env;
     return env->gpr[xSP];
 }
+
+static inline bool common_semi_has_synccache(CPUArchState *env)
+{
+    return true;
+}
 #endif
 
 /*
@@ -1103,16 +1114,11 @@ void do_common_semihosting(CPUState *cs)
          * virtual address range. This is a nop for us since we don't
          * implement caches. This is only present on A64.
          */
-#ifdef TARGET_ARM
-        if (is_a64(cs->env_ptr)) {
+        if (common_semi_has_synccache(env)) {
             common_semi_set_ret(cs, 0);
             break;
         }
-#endif
-#ifdef TARGET_RISCV
-        common_semi_set_ret(cs, 0);
-#endif
-        /* fall through -- invalid for A32/T32 */
+        /* fall through */
     default:
         fprintf(stderr, "qemu: Unsupported SemiHosting SWI 0x%02x\n", nr);
         cpu_dump_state(cs, stderr, 0);
-- 
2.34.1


