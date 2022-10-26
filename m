Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB9860D951
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 04:30:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onVuj-0005MG-0S; Tue, 25 Oct 2022 22:13:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onVuh-0005Lo-2a
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 22:13:03 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onVuf-0001JA-J1
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 22:13:02 -0400
Received: by mail-pf1-x433.google.com with SMTP id 192so6738920pfx.5
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 19:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DL2U3M4LkCRP8SMH/i6AX3/mkeQ3l2Tn5pl+fLhM1iQ=;
 b=oAtMjCfu47eoM0AGi5pfU3/Y5jIMscbeZl2YBu7u7JYgxJ7M7+6BszusbL86WCeIdb
 qBuL3akL4daogIVzWGbit8YT4wMrtLTe8NJFD0QXm48AEc5qpgsxRRvSNQ5SCfbG/Kn3
 b/nMr36rSwTS+IbHZKbcPb3UNsxIZngor5XXOZL85G6pVhKduyCtVKn8IvCd7TBoVUV1
 sgpi2it6lnP3zQqGHLl16p98ROy4hhpQnvrGDpfVtwQGQ8HxhEOWWRBxCrlV1r0iW8Xd
 8tSEAhzzYc8fj4JZ70nQvHrc5ob/+hFVmGY6QHRDQt0S7YNA96Z7Kcn4QK/1xohcQ7uP
 duqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DL2U3M4LkCRP8SMH/i6AX3/mkeQ3l2Tn5pl+fLhM1iQ=;
 b=0LIrhU3VyhwZI3wsmwpdI1LYA3UNfakKD0yOzaqZIPHrEIAVndOxpfm6gWFdS6tQeJ
 dxC6/Q/PQu2LMgNMuSiN1Qtgq2pOEV8som4q91+VDTs6Uz4lZkmNHFH5NGNWq0qpyTNB
 x6q9fG/oavw5jR4exhBNVG/UNceJMPVeww2Ro/WnZcaO53WwITKgzm+biBGurvPke+Xh
 t8Mx2N+GnYb6tvqESYRaLsbWP/uL5NfN0DJilBqFsB4Afx3ItOmQQ8Z+7lYNq6DVWRRe
 ycCjj4SSkLDZTH5WiGk0bQZcCtGmxu6iycRZ7YtjkMgwSHrqYb7zK2sbS11n/mJr6QJs
 7s+g==
X-Gm-Message-State: ACrzQf2u1heyY2m2Pg98z5aSFUdQ5c+c7/GgyBWDn2WzwOnJpLN7Hq3A
 818z3bS7TlrnHYW3LMcZeWw4lnRTfTSsJ1AB
X-Google-Smtp-Source: AMsMyM6l+SZUlxWebewHburW/LAbezkSwCXF3ETFG98KRz99DesbBF/HUW12HbU2JMgnmpINSqwjaQ==
X-Received: by 2002:a65:5605:0:b0:46f:1e8d:ece9 with SMTP id
 l5-20020a655605000000b0046f1e8dece9mr8615476pgs.249.1666750380282; 
 Tue, 25 Oct 2022 19:13:00 -0700 (PDT)
Received: from stoup.hotspotlogin.services ([103.100.225.182])
 by smtp.gmail.com with ESMTPSA id
 o29-20020a635d5d000000b0043c9da02729sm1897833pgm.6.2022.10.25.19.12.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 19:12:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 35/47] target/microblaze: Convert to tcg_ops
 restore_state_to_opc
Date: Wed, 26 Oct 2022 12:11:04 +1000
Message-Id: <20221026021116.1988449-36-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221026021116.1988449-1-richard.henderson@linaro.org>
References: <20221026021116.1988449-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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
 target/microblaze/cpu.c       | 11 +++++++++++
 target/microblaze/translate.c |  7 -------
 2 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
index c10b8ac029..89e493f3ff 100644
--- a/target/microblaze/cpu.c
+++ b/target/microblaze/cpu.c
@@ -100,6 +100,16 @@ static void mb_cpu_synchronize_from_tb(CPUState *cs,
     cpu->env.iflags = tb->flags & IFLAGS_TB_MASK;
 }
 
+static void mb_restore_state_to_opc(CPUState *cs,
+                                    const TranslationBlock *tb,
+                                    const uint64_t *data)
+{
+    MicroBlazeCPU *cpu = MICROBLAZE_CPU(cs);
+
+    cpu->env.pc = data[0];
+    cpu->env.iflags = data[1];
+}
+
 static bool mb_cpu_has_work(CPUState *cs)
 {
     return cs->interrupt_request & (CPU_INTERRUPT_HARD | CPU_INTERRUPT_NMI);
@@ -373,6 +383,7 @@ static const struct SysemuCPUOps mb_sysemu_ops = {
 static const struct TCGCPUOps mb_tcg_ops = {
     .initialize = mb_tcg_init,
     .synchronize_from_tb = mb_cpu_synchronize_from_tb,
+    .restore_state_to_opc = mb_restore_state_to_opc,
 
 #ifndef CONFIG_USER_ONLY
     .tlb_fill = mb_cpu_tlb_fill,
diff --git a/target/microblaze/translate.c b/target/microblaze/translate.c
index c5546f93aa..974f21eb31 100644
--- a/target/microblaze/translate.c
+++ b/target/microblaze/translate.c
@@ -1946,10 +1946,3 @@ void mb_tcg_init(void)
     cpu_res_addr =
         tcg_global_mem_new(cpu_env, offsetof(CPUMBState, res_addr), "res_addr");
 }
-
-void restore_state_to_opc(CPUMBState *env, TranslationBlock *tb,
-                          target_ulong *data)
-{
-    env->pc = data[0];
-    env->iflags = data[1];
-}
-- 
2.34.1


