Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1365380D77
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 17:40:15 +0200 (CEST)
Received: from localhost ([::1]:58804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhZvC-0004bM-Uz
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 11:40:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhZWA-00064H-3s
 for qemu-devel@nongnu.org; Fri, 14 May 2021 11:14:22 -0400
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e]:44921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhZVz-00075x-LU
 for qemu-devel@nongnu.org; Fri, 14 May 2021 11:14:21 -0400
Received: by mail-qv1-xf2e.google.com with SMTP id u1so15587950qvg.11
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 08:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VTpy/Og8hbUEtKjJH+7V9MTBsQkYzyPwOl+JughmbMQ=;
 b=N9GPbYB8ZDRqCwl5rlMfEumeeadBFzGcA8eC8uuQwyfNl9tsFKrjDtPLnAy+4GoCCS
 jUds6j7j0YpQHmZ1aJaYTZuhsPXzJapyFaT4kMEJBK2e1j8Ayt6hnNzcwNGXI/7c45SN
 LoqO7dJ58Kq9Chl1BcM1FVJtbxCwmCrvQtmUOq/WKdSVyiTi4Nr5+kshCiiaMNBxIlSX
 2QxEzJwitFSM8YJ0SYGF0lHBSvgaJRQYPLroGYAOWznwqsAGKgCcp4W0dLd23Bu8d434
 l6R+l3jO+gLMohxsYwhFSxd3SuVaCtc6FrYY4jpr/V3LCUHB8lcNds9xXpaSmtnQi20J
 qj8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VTpy/Og8hbUEtKjJH+7V9MTBsQkYzyPwOl+JughmbMQ=;
 b=SfhPF4WKi/rezNPE/wYM/ivGUmwijD3RdWYVDXoBbvkcpjjYbv8vGCa4VIuC/HfHHp
 l0/rjV9H5xtu6SUwY/sqTUOsjRCWffOY4BKD6b9QaT3pblsUoCKw2mSSKycxJ0PIq6UJ
 aDH1ws1Vx2hyNwTAyrrdCYcCWs1gVneiXWFMZF6Ee+pxPtNd9hs56/7W1R37lxdUzWzU
 Bem2svX9VQram02nWTAPSX5JduoNn6pG5JMhlf+DZ5kvNZnVcPE4e0XOBCyZIWTm1CCb
 yIhQpu1HBjCELbYMfjZKHqb7S4T/3S2e7nhUERfc0fUd6H5EprcCHaTFyTyOfc7Q48OV
 LO3Q==
X-Gm-Message-State: AOAM533AToVfPwQus59bsNBTc6iHK4LdlR3lEHqmcbb/8XwYaS5NRbLJ
 W4j5hUMD4QEo1gLuP/3b4TgPnv5L2Thlcf8U/tw=
X-Google-Smtp-Source: ABdhPJwronTb8uKp/K9nuvnM5K5q7YC1spE/7aZ20K/fULJNXiwlOiKbdtNbNQf8MxRaBAlWHJ9Yhw==
X-Received: by 2002:a0c:f685:: with SMTP id p5mr4581502qvn.61.1621005250906;
 Fri, 14 May 2021 08:14:10 -0700 (PDT)
Received: from localhost.localdomain (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id u6sm4778966qkj.117.2021.05.14.08.14.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 08:14:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 29/50] target/i386: Add stub generator for helper_set_dr
Date: Fri, 14 May 2021 10:13:21 -0500
Message-Id: <20210514151342.384376-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210514151342.384376-1-richard.henderson@linaro.org>
References: <20210514151342.384376-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2e;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2e.google.com
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
Cc: pbonzini@redhat.com, f4bug@amsat.org, ehabkost@redhat.com, cfontana@suse.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This removes an ifdef from the middle of disas_insn,
and ensures that the branch is not reachable.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 18f1c0342f..a510dd10b1 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -179,6 +179,19 @@ typedef struct DisasContext {
 #define REX_B(S)       0
 #endif
 
+/*
+ * Many sysemu-only helpers are not reachable for user-only.
+ * Define stub generators here, so that we need not either sprinkle
+ * ifdefs through the translator, nor provide the helper function.
+ */
+#define STUB_HELPER(NAME, ...) \
+    static inline void gen_helper_##NAME(__VA_ARGS__) \
+    { qemu_build_not_reached(); }
+
+#ifdef CONFIG_USER_ONLY
+STUB_HELPER(set_dr, TCGv_env env, TCGv_i32 reg, TCGv val)
+#endif
+
 static void gen_eob(DisasContext *s);
 static void gen_jr(DisasContext *s, TCGv dest);
 static void gen_jmp(DisasContext *s, target_ulong eip);
@@ -8075,7 +8088,6 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
     case 0x121: /* mov reg, drN */
     case 0x123: /* mov drN, reg */
         if (check_cpl0(s)) {
-#ifndef CONFIG_USER_ONLY
             modrm = x86_ldub_code(env, s);
             /* Ignore the mod bits (assume (modrm&0xc0)==0xc0).
              * AMD documentation (24594.pdf) and testing of
@@ -8104,7 +8116,6 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
                 gen_helper_get_dr(s->T0, cpu_env, s->tmp2_i32);
                 gen_op_mov_reg_v(s, ot, rm, s->T0);
             }
-#endif /* !CONFIG_USER_ONLY */
         }
         break;
     case 0x106: /* clts */
-- 
2.25.1


