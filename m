Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4D7553BF3
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 22:52:55 +0200 (CEST)
Received: from localhost ([::1]:56652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3krm-0004a2-Kp
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 16:52:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3kly-0006bx-Va
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 16:46:57 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:43697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3klv-00015c-N9
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 16:46:54 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 y13-20020a17090a154d00b001eaaa3b9b8dso14646474pja.2
 for <qemu-devel@nongnu.org>; Tue, 21 Jun 2022 13:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Kk89pZiIJkjmY1JlrO1lZHXZp9wpAsiGbUykO8SGZ9s=;
 b=NbMDupjoMKt3KOfb55M1c82xs2jU04MP8t0TUqU4INlrhXysp3kDXPOFVkOeyIxMjv
 Y8bdiuXwzgVsSZWW01rV6Pt0ql6hRT8uztI2K6e7vG2y8fBW6Pivdlp56Jyep9865oBe
 SGviWWqpONTvWSumsqHFmK9mg60jexnwjexo+K3suxu+bMBXcz4+lzsMQFkFTteOv0tz
 riXwhvdJnHNYVodj+ssvzdXqJSAjOr7uVCjtVs63r0Xa3gin75R6sX2bA51mpKdCUc/H
 yHNhHthL+Wola5zQfMtRiuO7MCXErAijUj1VlHW4fhocUVzXPzkvvZtT6lZIGefX36yX
 BDiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Kk89pZiIJkjmY1JlrO1lZHXZp9wpAsiGbUykO8SGZ9s=;
 b=7VO1wYTxOM2WQm946MFli0xvaV9C4aGb+NWfOINCXymmuuuLCcwgmFh1dssNTAW/uu
 j8liXUpsPFpZib8nEbX0RR3HBBA8L8oPrFhKERQP8RaS3FpaOiDBVEgXHRLpW0DSTL4H
 4frZNgesJhHBIbz8oQTENGhhutsbNIS6+AMskEhhT4F+JqcIxmF3gF+EAflgkKhCE7Xt
 Fhq/01fiJanQUq1dg5KzNAa6dftfyxXoJKUSeQmN02eIp1SJXFq9oc4OGshRp9k7WkWY
 XqRNBH2sI2ioOaZot0zjLqkSPGFX+EnNsBurawXVy3yNjTdiXi9ehtgMSEB04qcObY8u
 j1rA==
X-Gm-Message-State: AJIora9hJO+iV2xEaw/1p9o4Xjnkjb3zh3DGo5vG6K9c+Cnbr1Oq7I/M
 rT2jpv0Q95vt6ZoR+zre5XKx2lwiZAfJEg==
X-Google-Smtp-Source: AGRyM1t/eck57pK+6FB6POB3ScUIFIv6uLj1L80RQB6AFswkQZxl+DAS3+IV1mOeY+Q83nFwrYQABg==
X-Received: by 2002:a17:902:7005:b0:163:ffe7:32eb with SMTP id
 y5-20020a170902700500b00163ffe732ebmr30714459plk.18.1655844407035; 
 Tue, 21 Jun 2022 13:46:47 -0700 (PDT)
Received: from stoup.. ([2602:47:d49e:3c01:8adc:a144:6ec2:4d71])
 by smtp.gmail.com with ESMTPSA id
 p66-20020a625b45000000b005252defb016sm3649674pfb.122.2022.06.21.13.46.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jun 2022 13:46:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 3/9] accel/tcg: Init TCG cflags in vCPU thread handler
Date: Tue, 21 Jun 2022 13:46:37 -0700
Message-Id: <20220621204643.371397-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220621204643.371397-1-richard.henderson@linaro.org>
References: <20220621204643.371397-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Move TCG cflags initialization to thread handler.
Remove the duplicated assert checks.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220323171751.78612-6-philippe.mathieu.daude@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/tcg-accel-ops-mttcg.c | 5 ++---
 accel/tcg/tcg-accel-ops-rr.c    | 7 +++----
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/accel/tcg/tcg-accel-ops-mttcg.c b/accel/tcg/tcg-accel-ops-mttcg.c
index d50239e0e2..ba997f6cfe 100644
--- a/accel/tcg/tcg-accel-ops-mttcg.c
+++ b/accel/tcg/tcg-accel-ops-mttcg.c
@@ -70,6 +70,8 @@ static void *mttcg_cpu_thread_fn(void *arg)
     assert(tcg_enabled());
     g_assert(!icount_enabled());
 
+    tcg_cpu_init_cflags(cpu, current_machine->smp.max_cpus > 1);
+
     rcu_register_thread();
     force_rcu.notifier.notify = mttcg_force_rcu;
     force_rcu.cpu = cpu;
@@ -139,9 +141,6 @@ void mttcg_start_vcpu_thread(CPUState *cpu)
 {
     char thread_name[VCPU_THREAD_NAME_SIZE];
 
-    g_assert(tcg_enabled());
-    tcg_cpu_init_cflags(cpu, current_machine->smp.max_cpus > 1);
-
     cpu->thread = g_new0(QemuThread, 1);
     cpu->halt_cond = g_malloc0(sizeof(QemuCond));
     qemu_cond_init(cpu->halt_cond);
diff --git a/accel/tcg/tcg-accel-ops-rr.c b/accel/tcg/tcg-accel-ops-rr.c
index 1a72149f0e..cc8adc2380 100644
--- a/accel/tcg/tcg-accel-ops-rr.c
+++ b/accel/tcg/tcg-accel-ops-rr.c
@@ -152,7 +152,9 @@ static void *rr_cpu_thread_fn(void *arg)
     Notifier force_rcu;
     CPUState *cpu = arg;
 
-    assert(tcg_enabled());
+    g_assert(tcg_enabled());
+    tcg_cpu_init_cflags(cpu, false);
+
     rcu_register_thread();
     force_rcu.notify = rr_force_rcu;
     rcu_add_force_rcu_notifier(&force_rcu);
@@ -275,9 +277,6 @@ void rr_start_vcpu_thread(CPUState *cpu)
     static QemuCond *single_tcg_halt_cond;
     static QemuThread *single_tcg_cpu_thread;
 
-    g_assert(tcg_enabled());
-    tcg_cpu_init_cflags(cpu, false);
-
     if (!single_tcg_cpu_thread) {
         cpu->thread = g_new0(QemuThread, 1);
         cpu->halt_cond = g_new0(QemuCond, 1);
-- 
2.34.1


