Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6743E60D936
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 04:21:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onVyD-0007bu-EB; Tue, 25 Oct 2022 22:16:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onVxx-0007b2-N2
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 22:16:25 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onVxw-0001sV-4w
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 22:16:25 -0400
Received: by mail-pl1-x62b.google.com with SMTP id 4so6797537pli.0
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 19:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VKbB7K0HwBJ/XftUm9+xrFi2M3poh8MvJJd+df6GbYo=;
 b=ghebxw3aMF/Vj2Mx5yKpFoADo/5jee7aQT9s68CWW2rWxjzbFGUc/1YnIfc083aGiV
 7DUVnyR+q5lPoBW9VIYDVynNmEGnot9qQaHabcKz+fnQCeBGgSGv0oWwbdqK0eTLXYUq
 FlbdYBWEzL8mwZLEas232TFwvNbrBx/rbc5y27ZVZbQCH8eLg6N2BHgJ0J40A2yulE52
 gdgMqrRKJJlNvtsc7xbjKfauV54bZLjupYcXHrtSCCDOTKaIq60yKgC5V1YmKizskyvY
 AwOB7pbkhLb6QDWAtJ3hFvwq1oMbD+IBsA39dSIKoTnrN26bDqjnqqQ0nGa71BjyX3ww
 Q84g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VKbB7K0HwBJ/XftUm9+xrFi2M3poh8MvJJd+df6GbYo=;
 b=KZP0nCxRBSqq+1y/8DL5z3w8vBd/LeiOwSTgcp+O5UcW2M2aYPnYMIwMk1pheWs6tx
 sSTJQ4e6+sl2MFYh3cmRswzZK9jR39vZAGxwLXt+Wk5NomQoJqiVd7WMcf7uu2NN5e/2
 lZ8DHydVqjPodZC1QMrJ5D7gFebiqBCmgeskR8YeWB4IkuAM48o4GFU2+1uj2CXu1Lgb
 FQF+YrK+Jjxu+nJs/Dg3suE+GgNVYCVnE8fm2I+O2BiDbROqLvQqt4G2j8QB9ZzPpqee
 pApqDF8J062U4o8KxdCpYFoIokk0w0As75bxGo6uf7zzVeAAPX7kSvzY/JDcO0ElzC8U
 9/sA==
X-Gm-Message-State: ACrzQf2KwNgJod2/wdnTKbBxsnQGU/9hlkzSPXmo7baMuaQwvyQF6ab7
 72BBsNGgO+ak/JKGF9BDvM6vFnPIYF3QGZfK
X-Google-Smtp-Source: AMsMyM7lOx3tKCRdT/p1PDVK0NHmEp2uV3F8PwMZyoOp1VpyZjhgZnohk0ws2tRp5bt/jvByauLBVg==
X-Received: by 2002:a17:90a:e7c4:b0:20d:451f:a988 with SMTP id
 kb4-20020a17090ae7c400b0020d451fa988mr1477442pjb.57.1666750582718; 
 Tue, 25 Oct 2022 19:16:22 -0700 (PDT)
Received: from stoup.hotspotlogin.services ([103.100.225.182])
 by smtp.gmail.com with ESMTPSA id
 q18-20020a17090311d200b0018123556931sm1819732plh.204.2022.10.25.19.16.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 19:16:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 42/47] target/s390x: Convert to tcg_ops restore_state_to_opc
Date: Wed, 26 Oct 2022 12:11:11 +1000
Message-Id: <20221026021116.1988449-43-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221026021116.1988449-1-richard.henderson@linaro.org>
References: <20221026021116.1988449-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/s390x-internal.h | 4 +++-
 target/s390x/cpu.c            | 1 +
 target/s390x/tcg/translate.c  | 7 +++++--
 3 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/target/s390x/s390x-internal.h b/target/s390x/s390x-internal.h
index b5ae0ae364..5d4361d35b 100644
--- a/target/s390x/s390x-internal.h
+++ b/target/s390x/s390x-internal.h
@@ -398,7 +398,9 @@ void handle_diag_308(CPUS390XState *env, uint64_t r1, uint64_t r3,
 
 /* translate.c */
 void s390x_translate_init(void);
-
+void s390x_restore_state_to_opc(CPUState *cs,
+                                const TranslationBlock *tb,
+                                const uint64_t *data);
 
 /* sigp.c */
 int handle_sigp(CPUS390XState *env, uint8_t order, uint64_t r1, uint64_t r3);
diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index df00040e95..96562c516d 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -272,6 +272,7 @@ static void s390_cpu_reset_full(DeviceState *dev)
 
 static const struct TCGCPUOps s390_tcg_ops = {
     .initialize = s390x_translate_init,
+    .restore_state_to_opc = s390x_restore_state_to_opc,
 
 #ifdef CONFIG_USER_ONLY
     .record_sigsegv = s390_cpu_record_sigsegv,
diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index 1d2dddab1c..5798928473 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -6691,9 +6691,12 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns,
     translator_loop(cs, tb, max_insns, pc, host_pc, &s390x_tr_ops, &dc.base);
 }
 
-void restore_state_to_opc(CPUS390XState *env, TranslationBlock *tb,
-                          target_ulong *data)
+void s390x_restore_state_to_opc(CPUState *cs,
+                                const TranslationBlock *tb,
+                                const uint64_t *data)
 {
+    S390CPU *cpu = S390_CPU(cs);
+    CPUS390XState *env = &cpu->env;
     int cc_op = data[1];
 
     env->psw.addr = data[0];
-- 
2.34.1


