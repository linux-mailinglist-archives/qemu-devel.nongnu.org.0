Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14EF34128A2
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 00:04:53 +0200 (CEST)
Received: from localhost ([::1]:53330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSRPA-00019u-3L
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 18:04:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mSR73-0004fO-R4
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 17:46:09 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:39556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mSR72-0002ZP-2d
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 17:46:09 -0400
Received: by mail-wr1-x431.google.com with SMTP id u15so33595853wru.6
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 14:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TotqMEN5DrXYEF17ne4DDCu2zSM8Bp20jLCGhp9+svs=;
 b=RW9OMyPnfZHjKr8QVrqMfR+B1DHPz/CqNm2/7q3J3IDtNQ089rvkVEpsvdrJusIpHB
 VgJTR8KnMUcBWwSWmhCgSLnCs9+LWpJRNn12dlZd0cxbQ1xOanVvVHBtlJXfOM8iA26M
 xLEB9WhcGLeewoexUTODykYjCZamC20orfqVJ3OsWghwytw7JoarzrtrMHTNf3fGTbp1
 msrxDOtoZ6gtLj+QauXzVjMB9LpgFaEDCcXKY2QyeWTo1h805RSF3db+9xcqRczYn3Sb
 axjtRTbUS25s8Y6W1np0Rx1cuq8CGkCZLYq9AXZdl1RXUZAwbDfxVypWDkKQSNXMJVng
 xRnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=TotqMEN5DrXYEF17ne4DDCu2zSM8Bp20jLCGhp9+svs=;
 b=dvVJxOswyFKYmw457rObCbo6hbaZHtEOiIii1cxLkDd0MmjhtUbarwmFflBLbSqZZq
 BNyqPQtzeD/90tmKHHsS7PuQZGW/hhW2X0JQpYMvnhLmAE7qZMcI0M2NzdTwm78om/xW
 wekGh5PS7kzhK0K08lgmX3Ht6nnL+l1vAlqdfbKbCTtJtWus4JUKdeP8R89G08xoi6g7
 WH1nfjM8hK259Enjnr3mKvvxfU9rqR+Od/jgk4zap9c6wuuxPC9P2o6spq1FV5EzlqfO
 9COtuKxfIHkrdcuSmjcc12jUaOem/iX0AAB832G0L4VLBPdh8lL4/wT5d1aVlsLcm8WC
 FxwQ==
X-Gm-Message-State: AOAM531lPXs/FGLweDRehrkjXGve/5aSNZ1uW6AAuf0OVv3sZK9KhzIK
 IBbsXc6pwMNTH4joDaw8OrNmyyRc+mk=
X-Google-Smtp-Source: ABdhPJx/6xikLl9YXorAg2QqaB0ejqFhyTJouHkUlavvT4Lz9qnjNalmvUXW+Z6q+RvP/SnCM84YtA==
X-Received: by 2002:a1c:2904:: with SMTP id p4mr1129679wmp.49.1632174366518;
 Mon, 20 Sep 2021 14:46:06 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 o13sm19723379wri.53.2021.09.20.14.46.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 14:46:06 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 17/31] target/microblaze: Restrict has_work() handler to
 sysemu
Date: Mon, 20 Sep 2021 23:44:33 +0200
Message-Id: <20210920214447.2998623-18-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210920214447.2998623-1-f4bug@amsat.org>
References: <20210920214447.2998623-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Restrict has_work() to sysemu.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/microblaze/cpu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
index 15db277925f..36e6e540483 100644
--- a/target/microblaze/cpu.c
+++ b/target/microblaze/cpu.c
@@ -92,12 +92,13 @@ static void mb_cpu_synchronize_from_tb(CPUState *cs,
     cpu->env.iflags = tb->flags & IFLAGS_TB_MASK;
 }
 
+#ifndef CONFIG_USER_ONLY
+
 static bool mb_cpu_has_work(CPUState *cs)
 {
     return cs->interrupt_request & (CPU_INTERRUPT_HARD | CPU_INTERRUPT_NMI);
 }
 
-#ifndef CONFIG_USER_ONLY
 static void mb_cpu_ns_axi_dp(void *opaque, int irq, int level)
 {
     MicroBlazeCPU *cpu = opaque;
@@ -142,7 +143,7 @@ static void microblaze_cpu_set_irq(void *opaque, int irq, int level)
         cpu_reset_interrupt(cs, type);
     }
 }
-#endif
+#endif /* !CONFIG_USER_ONLY */
 
 static void mb_cpu_reset(DeviceState *dev)
 {
@@ -368,6 +369,7 @@ static const struct TCGCPUOps mb_tcg_ops = {
     .tlb_fill = mb_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+    .has_work = mb_cpu_has_work,
     .cpu_exec_interrupt = mb_cpu_exec_interrupt,
     .do_interrupt = mb_cpu_do_interrupt,
     .do_transaction_failed = mb_cpu_transaction_failed,
@@ -386,8 +388,6 @@ static void mb_cpu_class_init(ObjectClass *oc, void *data)
     device_class_set_parent_reset(dc, mb_cpu_reset, &mcc->parent_reset);
 
     cc->class_by_name = mb_cpu_class_by_name;
-    cc->has_work = mb_cpu_has_work;
-
     cc->dump_state = mb_cpu_dump_state;
     cc->set_pc = mb_cpu_set_pc;
     cc->gdb_read_register = mb_cpu_gdb_read_register;
-- 
2.31.1


