Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F6F60AE57
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 16:57:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omxTL-0003fe-Bs; Mon, 24 Oct 2022 09:26:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1omxT8-0003W4-RD
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 09:26:20 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1omxSr-00045N-VJ
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 09:26:12 -0400
Received: by mail-pj1-x102c.google.com with SMTP id h14so8118824pjv.4
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 06:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=cY7FAyxwYmVho+YuvFv5lJrrcsTnuKViFvoEAlMwTHQ=;
 b=WtdgWSa0X+ZiploRgY4FHlVLXa8v7k4soMXLDJQP0Zqy11Pv9OjPA9swlUbXaJOlYF
 q8paM8dX2wjEpkEKmWltgh7sLmD7pZ31W8pU6fi7bnNehv/lwueNwXxyiMpW6qLQR/2o
 LfKnNXk2rrsYhJu9R0rGpx/t7IXqsGP71l0eEHtzGl+kx5bh+5GsJntb1HyKZn29bt/0
 Go9ZfxpXJzGnqYRu2HMbpY1K0QnKNKLstjaPaScWaPNelV//LNLZsFIMuKTXnf0ejAOg
 MtEEFXNQHFHTXeG9BUmsL1wHr0+63ATposECGyAD6uoi6jDB54c6tDK0GJyLOcAW2zl/
 TkuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cY7FAyxwYmVho+YuvFv5lJrrcsTnuKViFvoEAlMwTHQ=;
 b=P0XlWGijIeNCUMl94MI1fWqAcgzS0xUsqFmbBBz63+8AP/K32+I6KP7fyw3hc7NkB2
 Z3ExJOBjM1+609UTVENPi3zZNqOtP9RQJbXFF0Yob1U6+5mp83rqgCQgsLtbTnwatUtu
 x1ma0qTiM9IB5EmZRCuNqr350WxktZwpzD5rNPRwkaQexBhtZjs0j7gE28Y3JVY0qzJU
 K+3S5hNcB2R73AfLvF+J1il7u4i2kdMNMZb9Lc0OeNqL33KXukOpPDI6O2hFR3FcJNGh
 +GM4S5flJ60X51TSMUlx3w8fWHq41JerYeQ5fQ04XMj1cu7xxwvHSZIQ+b2Zc1wgcrfx
 yTRg==
X-Gm-Message-State: ACrzQf2n8lS7kAh42/0jdI5jeyC7n0JBT29vPjdxQX4W/t8xdZaxiO1+
 qYimE7stPo+eJYF3ii4UTSOCv40siC8ZUw==
X-Google-Smtp-Source: AMsMyM4qQww3Fsk+HsXRNz1tG7x0f+kiTDNNkRpKRxXQk0lJazrmP0FRUCDmLirOBfidiIAaxOY3lg==
X-Received: by 2002:a17:903:2c9:b0:182:c500:d93d with SMTP id
 s9-20020a17090302c900b00182c500d93dmr34346726plk.44.1666617960254; 
 Mon, 24 Oct 2022 06:26:00 -0700 (PDT)
Received: from stoup.. ([103.100.225.182]) by smtp.gmail.com with ESMTPSA id
 b12-20020a1709027e0c00b00178ab008364sm17009216plm.37.2022.10.24.06.25.58
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Oct 2022 06:25:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 20/29] target/sparc: Convert to tcg_ops restore_state_to_opc
Date: Mon, 24 Oct 2022 23:24:50 +1000
Message-Id: <20221024132459.3229709-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221024132459.3229709-1-richard.henderson@linaro.org>
References: <20221024132459.3229709-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/sparc/cpu.h       | 3 +++
 target/sparc/cpu.c       | 1 +
 target/sparc/translate.c | 7 +++++--
 3 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/target/sparc/cpu.h b/target/sparc/cpu.h
index f80ea2e8cf..e478c5eb16 100644
--- a/target/sparc/cpu.h
+++ b/target/sparc/cpu.h
@@ -600,6 +600,9 @@ int sparc_cpu_memory_rw_debug(CPUState *cpu, vaddr addr,
 
 /* translate.c */
 void sparc_tcg_init(void);
+void sparc_restore_state_to_opc(CPUState *cs,
+                                const TranslationBlock *tb,
+                                const uint64_t *data);
 
 /* cpu-exec.c */
 
diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
index 1f9ef7afd8..4c3d08a875 100644
--- a/target/sparc/cpu.c
+++ b/target/sparc/cpu.c
@@ -872,6 +872,7 @@ static const struct SysemuCPUOps sparc_sysemu_ops = {
 static const struct TCGCPUOps sparc_tcg_ops = {
     .initialize = sparc_tcg_init,
     .synchronize_from_tb = sparc_cpu_synchronize_from_tb,
+    .restore_state_to_opc = sparc_restore_state_to_opc,
 
 #ifndef CONFIG_USER_ONLY
     .tlb_fill = sparc_cpu_tlb_fill,
diff --git a/target/sparc/translate.c b/target/sparc/translate.c
index 2cbbe2396a..34858eb95f 100644
--- a/target/sparc/translate.c
+++ b/target/sparc/translate.c
@@ -6011,9 +6011,12 @@ void sparc_tcg_init(void)
     }
 }
 
-void restore_state_to_opc(CPUSPARCState *env, TranslationBlock *tb,
-                          target_ulong *data)
+void sparc_restore_state_to_opc(CPUState *cs,
+                                const TranslationBlock *tb,
+                                const uint64_t *data)
 {
+    SPARCCPU *cpu = SPARC_CPU(cs);
+    CPUSPARCState *env = &cpu->env;
     target_ulong pc = data[0];
     target_ulong npc = data[1];
 
-- 
2.34.1


