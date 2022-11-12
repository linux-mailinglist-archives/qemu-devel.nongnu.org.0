Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC5536267E1
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Nov 2022 08:58:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otlNt-0006AA-PV; Sat, 12 Nov 2022 02:57:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otlNp-00069i-HJ
 for qemu-devel@nongnu.org; Sat, 12 Nov 2022 02:56:57 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otlNn-0008Bg-OX
 for qemu-devel@nongnu.org; Sat, 12 Nov 2022 02:56:57 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 d13-20020a17090a3b0d00b00213519dfe4aso6501779pjc.2
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 23:56:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qw1tQpgpqGjwOWEsHHDVfFOA6fud/wYsdJ0Bljtybvo=;
 b=yPdh0JqbVJqLF4ge0ZEF8z/Mvj46uHEhEmBxWuT7G3YCb4yrBVHy+qaiBsM9kxxWmR
 vvW1zbCvumKq6ZHeKe02yHDAUP9r+3nOs8+gPFMvV+wtZblCBaE/x6YVpap8w4zwIVYx
 Iyhu/qk/pfWd2WRk+2voqE2cP4e4FEqpNteMVVCbQsiMGIHnEEK9RB9JYzkNIa1pX+5v
 065PlYokLlA7R6a5ZILy13hRX80zhtQETGryjwywrF10VsU3ComkbPY/1Dinnmx5STxb
 Qt+r8lhIxmit7FZ7qkW7GJmCsjr9pBcOhd1y/xvPdfsluIFT/uvPSugHyxNXcrqjqXb+
 Yaig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qw1tQpgpqGjwOWEsHHDVfFOA6fud/wYsdJ0Bljtybvo=;
 b=tyc6FvSVdKJW7lPnbBQQ1zpnnys3pIvodZ8F4p/bgog+bWF80ZuH0/4CNIQqCpr92A
 cStd3mih29ZP7nzJ1I9Ey1hI7Q8fLqqTrlSRSub+6lnAAKnG9N1g5ATyV4upAoqz99A0
 ct4vY3+xqMdGcHIU4IAUqfgGo8JYyVz3N+YefsQCIQbhw05TUouYrDy9VcRKspvpCc+V
 UPlUgDFoLaS4yyJghgRtgUn2VOyzvbKxhnCQkHdWTKP3ZXsW6FM9gU4aiAzqCGYAaIZu
 2qd/HyfnxXjlBZV8iRNFyi4N0JNpKPZTztOoxEbOxPJB6ULhEpc1fFKw2ETI8aJlYZLA
 DqIw==
X-Gm-Message-State: ANoB5pkL+PpMUqbtjBqpJqANoZd0kjQnLOdRzelZkg9OQ3vu0sUiUcYb
 DUseMVa9AWqNnAszQSuuYox1nNsVzDjeohAj
X-Google-Smtp-Source: AA0mqf42P/jUU9BYUrsRoRlDrLsgppFLDEG5JKeGFNyZtVfjqtFE3PIEqOhgV1xYCNn0YMqh28r40Q==
X-Received: by 2002:a17:902:d64f:b0:186:6381:f180 with SMTP id
 y15-20020a170902d64f00b001866381f180mr5726125plh.100.1668239814279; 
 Fri, 11 Nov 2022 23:56:54 -0800 (PST)
Received: from stoup.lan
 (2001-44b8-2176-c800-8228-b676-fb42-ee07.static.ipv6.internode.on.net.
 [2001:44b8:2176:c800:8228:b676:fb42:ee07])
 by smtp.gmail.com with ESMTPSA id
 m8-20020a17090a71c800b00213d08fa459sm2743062pjs.17.2022.11.11.23.56.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Nov 2022 23:56:53 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com,
	eduardo@habkost.net
Subject: [PATCH for-8.0 1/3] target/i386: Split out gen_cmpxchg8b,
 gen_cmpxchg16b
Date: Sat, 12 Nov 2022 17:56:43 +1000
Message-Id: <20221112075645.2850679-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221112075645.2850679-1-richard.henderson@linaro.org>
References: <20221112075645.2850679-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 48 ++++++++++++++++++++++++-------------
 1 file changed, 31 insertions(+), 17 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 28a4e6dc1d..1175540a2c 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -2974,6 +2974,34 @@ static void gen_sty_env_A0(DisasContext *s, int offset, bool align)
 #include "emit.c.inc"
 #include "decode-new.c.inc"
 
+static void gen_cmpxchg8b(DisasContext *s, CPUX86State *env, int modrm)
+{
+    gen_lea_modrm(env, s, modrm);
+
+    if ((s->prefix & PREFIX_LOCK) &&
+        (tb_cflags(s->base.tb) & CF_PARALLEL)) {
+        gen_helper_cmpxchg8b(cpu_env, s->A0);
+    } else {
+        gen_helper_cmpxchg8b_unlocked(cpu_env, s->A0);
+    }
+    set_cc_op(s, CC_OP_EFLAGS);
+}
+
+#ifdef TARGET_X86_64
+static void gen_cmpxchg16b(DisasContext *s, CPUX86State *env, int modrm)
+{
+    gen_lea_modrm(env, s, modrm);
+
+    if ((s->prefix & PREFIX_LOCK) &&
+        (tb_cflags(s->base.tb) & CF_PARALLEL)) {
+        gen_helper_cmpxchg16b(cpu_env, s->A0);
+    } else {
+        gen_helper_cmpxchg16b_unlocked(cpu_env, s->A0);
+    }
+    set_cc_op(s, CC_OP_EFLAGS);
+}
+#endif
+
 /* convert one instruction. s->base.is_jmp is set if the translation must
    be stopped. Return the next pc value */
 static bool disas_insn(DisasContext *s, CPUState *cpu)
@@ -3814,28 +3842,14 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                 if (!(s->cpuid_ext_features & CPUID_EXT_CX16)) {
                     goto illegal_op;
                 }
-                gen_lea_modrm(env, s, modrm);
-                if ((s->prefix & PREFIX_LOCK) &&
-                    (tb_cflags(s->base.tb) & CF_PARALLEL)) {
-                    gen_helper_cmpxchg16b(cpu_env, s->A0);
-                } else {
-                    gen_helper_cmpxchg16b_unlocked(cpu_env, s->A0);
-                }
-                set_cc_op(s, CC_OP_EFLAGS);
+                gen_cmpxchg16b(s, env, modrm);
                 break;
             }
-#endif        
+#endif
             if (!(s->cpuid_features & CPUID_CX8)) {
                 goto illegal_op;
             }
-            gen_lea_modrm(env, s, modrm);
-            if ((s->prefix & PREFIX_LOCK) &&
-                (tb_cflags(s->base.tb) & CF_PARALLEL)) {
-                gen_helper_cmpxchg8b(cpu_env, s->A0);
-            } else {
-                gen_helper_cmpxchg8b_unlocked(cpu_env, s->A0);
-            }
-            set_cc_op(s, CC_OP_EFLAGS);
+            gen_cmpxchg8b(s, env, modrm);
             break;
 
         case 7: /* RDSEED */
-- 
2.34.1


