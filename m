Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DED3352F6D3
	for <lists+qemu-devel@lfdr.de>; Sat, 21 May 2022 02:32:42 +0200 (CEST)
Received: from localhost ([::1]:60038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nsD2w-0001Kl-08
	for lists+qemu-devel@lfdr.de; Fri, 20 May 2022 20:32:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nsCbv-0008BZ-Mb
 for qemu-devel@nongnu.org; Fri, 20 May 2022 20:04:56 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:46944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nsCbb-00040Y-J9
 for qemu-devel@nongnu.org; Fri, 20 May 2022 20:04:42 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 v5-20020a17090a7c0500b001df84fa82f8so9030201pjf.5
 for <qemu-devel@nongnu.org>; Fri, 20 May 2022 17:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WQ9CMUu8S8KNltjSwi0JIKZ7rxutJhSFkeyYpNk7QeY=;
 b=LG2D176y156pfG/9ukFMhFrZHI8qLyIwh5/SC7axsY/fRpcZtYLXUGPHjZKscW/Hxm
 xlLICNZTMTYwjwNbb3RzgAX2g9dkhkU7aQRh9JXxgPoXF4O/HpJCWfyfDe+RDSK+8KQY
 cHp4sO1tvIW376dZcG7I62nSJbdqsbe9YpfVaP4E9/xuJzhUQPpbbEdjoqQ7YRox4Avq
 tJTyOT8yoeLkVNCVaDXKqIvdqk2CGIRvrHeWoSxtjFFwKSGzGPa2Kmbg7jKSM87RPow0
 I82suR5WnNwWNWXP0/IPdaaHLQYWsC1ZPHd999k0Q1nJuVq2dKqXetyF0e436Qw2FfbA
 pG8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WQ9CMUu8S8KNltjSwi0JIKZ7rxutJhSFkeyYpNk7QeY=;
 b=SmKq8deTH/AKq7Q+ZFOHuSOOa83aTpVWNzTywJ9vAFsBeLPwvW5d3rz5ATeyvXTMHF
 o0kKrNmlIi+vpBj6vyGY+17G1J+NknMKYLt1EvQ5qIpIKFEF1QSGthAj71mZChCVhdqX
 P7EFjPSXfq9JCZJ4tDPX2E9rBvTo8EPW6R6Uv+Cnpt+GGaSqd1EkG1c6xNXvfJreLqob
 G5hp12BPDY0Jgw4Tu9rCGuGoM7LlWn5e3uHfdVJHzB5zQmbEvB+DqG8B8ttCupmq3H/Z
 nbwI6LppJU/t4psAsnc4CLHDyFYzDOKozryQjZMLXZXB+qpvOY2putSIGQnWBOyXgD5l
 6o4A==
X-Gm-Message-State: AOAM53290s5sFb6yWjbZ9X23g1ZgckrlaHTK2XyzJXi2j8ujpTVUQKeq
 wr6IGF71dXqWTjxgQZ8IcoHkOhBJZMOPNQ==
X-Google-Smtp-Source: ABdhPJzbrKdwBYzJ5xmtemZAMIzJbpdWPUjZ9JEYfVPdc2aESBur5+w8xoru4YlTb4tSNqYJbP+auw==
X-Received: by 2002:a17:902:7597:b0:15e:b5d3:267d with SMTP id
 j23-20020a170902759700b0015eb5d3267dmr12209017pll.55.1653091465614; 
 Fri, 20 May 2022 17:04:25 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 h8-20020a654808000000b003f9d1c020cbsm306369pgs.51.2022.05.20.17.04.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 May 2022 17:04:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, alex.bennee@linaro.org,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v3 20/49] semihosting: Split out common_semi_has_synccache
Date: Fri, 20 May 2022 17:03:31 -0700
Message-Id: <20220521000400.454525-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220521000400.454525-1-richard.henderson@linaro.org>
References: <20220521000400.454525-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 semihosting/arm-compat-semi.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index 9ea985beee..c53cb1891f 100644
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
@@ -1102,16 +1113,11 @@ void do_common_semihosting(CPUState *cs)
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


