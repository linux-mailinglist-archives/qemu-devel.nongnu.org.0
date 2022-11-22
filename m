Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E23A06348D3
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 21:59:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxaL1-0007LC-PJ; Tue, 22 Nov 2022 15:57:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oxaL0-0007KJ-3b
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 15:57:50 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oxaKy-0003V1-Kd
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 15:57:49 -0500
Received: by mail-pl1-x631.google.com with SMTP id g10so14801151plo.11
 for <qemu-devel@nongnu.org>; Tue, 22 Nov 2022 12:57:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BWyV9wO7d+wf3OUu1IWrLDrLspSA8LDsjEbJNoFpi/U=;
 b=Kh9BSZ/nOPwShdtPBfjRSd7EL4UYExRIUZDBMFBLu6BVTcFYi/RoQCGSTxEDKYKisN
 wCou2k1EQMhU4RkSLkNjqMiyx/S1c4QwJjWfskoGSrVW0ZJPgQSkpKChVSRAEJWf2Zcs
 lEbMWaTpe68m9TId+JYjRAJY1AsRCZAifu//2G167oYGVn+6qKqp0R6k8N+jmZL8LW//
 dfv3IU50R6YYoJeLb7TwS+GRbiJilDacos5QUbHr2cRlDAwgRTXePlFIOD9oVbUo19sr
 RpSVuJlYUQZFGaCestirWZq5hgCy5fr8iEoBNkrZHJ7wX2BoudgJNyAMq+RVIQoz1DZW
 s2vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BWyV9wO7d+wf3OUu1IWrLDrLspSA8LDsjEbJNoFpi/U=;
 b=PmpP4P4mbU1lcrfBw4qaq1LZqRr5MdQHoXGEedf60/5Vf6qjAcyOlntgnqR5Z3+JwH
 HIOiJuyo0lK190rgOjiyMRg9CVaSZTIS/1HB8yHG7jP/T5CqhleUD+LYI7Jz2Yg7w4F+
 npxpoOCWmEZDYpLGcTm2vtNU/GZB+FKeOLFS1hTiiCNm+zcM6waf//rYe8ynyVQxsKH3
 8+7VIk3b4jCAKMPJleIH79Yy0cZ3PNlRpBAAf3jWdc9rBDveU/qzXkKN9olGF57G2nqm
 vLdivrivzqfGw6D2rYmjnlQnmDRM9Asc+tPTd7D7xVCKmOBc/rmkHnl2jZ/29ZihWknx
 WeBw==
X-Gm-Message-State: ANoB5pkGLSbaS2aqaBMOSjglMdI+KZpg6+yvCKiXYAKSGyf3hNUHEX90
 tISVc2MNUpVkhL4HYJZ+6pwK6NUL4yfD9Q==
X-Google-Smtp-Source: AA0mqf4HIbfviopW44p2JjpxrGAqhGb/PvEKbyqWgGw52jrSIj6REhkILTm5lA1OulHSqLyKC3HIvQ==
X-Received: by 2002:a17:902:cacb:b0:186:9fc8:6688 with SMTP id
 y11-20020a170902cacb00b001869fc86688mr6033219pld.22.1669150667199; 
 Tue, 22 Nov 2022 12:57:47 -0800 (PST)
Received: from stoup.. ([2602:47:d48a:1201:90f5:6f8b:e78a:4a0])
 by smtp.gmail.com with ESMTPSA id
 d19-20020a170903209300b00186fa988a13sm12383807plc.166.2022.11.22.12.57.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Nov 2022 12:57:46 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, philmd@linaro.org, alex.bennee@linaro.org,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v2 6/7] target/riscv: Use QEMU_IOTHREAD_LOCK_GUARD in
 riscv_cpu_update_mip
Date: Tue, 22 Nov 2022 12:57:38 -0800
Message-Id: <20221122205739.603510-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221122205739.603510-1-richard.henderson@linaro.org>
References: <20221122205739.603510-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/cpu_helper.c | 22 +++++++---------------
 1 file changed, 7 insertions(+), 15 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 278d163803..4c4b404dad 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -610,7 +610,6 @@ uint64_t riscv_cpu_update_mip(RISCVCPU *cpu, uint64_t mask, uint64_t value)
     CPURISCVState *env = &cpu->env;
     CPUState *cs = CPU(cpu);
     uint64_t gein, vsgein = 0, vstip = 0, old = env->mip;
-    bool locked = false;
 
     if (riscv_cpu_virt_enabled(env)) {
         gein = get_field(env->hstatus, HSTATUS_VGEIN);
@@ -621,21 +620,14 @@ uint64_t riscv_cpu_update_mip(RISCVCPU *cpu, uint64_t mask, uint64_t value)
     mask = ((mask == MIP_VSTIP) && env->vstime_irq) ? 0 : mask;
     vstip = env->vstime_irq ? MIP_VSTIP : 0;
 
-    if (!qemu_mutex_iothread_locked()) {
-        locked = true;
-        qemu_mutex_lock_iothread();
-    }
+    WITH_QEMU_IOTHREAD_LOCK() {
+        env->mip = (env->mip & ~mask) | (value & mask);
 
-    env->mip = (env->mip & ~mask) | (value & mask);
-
-    if (env->mip | vsgein | vstip) {
-        cpu_interrupt(cs, CPU_INTERRUPT_HARD);
-    } else {
-        cpu_reset_interrupt(cs, CPU_INTERRUPT_HARD);
-    }
-
-    if (locked) {
-        qemu_mutex_unlock_iothread();
+        if (env->mip | vsgein | vstip) {
+            cpu_interrupt(cs, CPU_INTERRUPT_HARD);
+        } else {
+            cpu_reset_interrupt(cs, CPU_INTERRUPT_HARD);
+        }
     }
 
     return old;
-- 
2.34.1


