Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60064418CE7
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 00:54:36 +0200 (CEST)
Received: from localhost ([::1]:59190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUd2Z-0007ic-Fj
	for lists+qemu-devel@lfdr.de; Sun, 26 Sep 2021 18:54:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUce7-0004SQ-6o
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 18:29:19 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:45025)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUce5-0006aT-Nv
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 18:29:18 -0400
Received: by mail-wr1-x436.google.com with SMTP id d6so46341787wrc.11
 for <qemu-devel@nongnu.org>; Sun, 26 Sep 2021 15:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TotqMEN5DrXYEF17ne4DDCu2zSM8Bp20jLCGhp9+svs=;
 b=i0xNDxM2lC5uNHDingK/wwkKU1ZA3obK+2STrM6tW5jUqZ0loQqr35nCDSNdLGdEEK
 ojgVswKjFW/LFEqQP3JcbyvoOCnb5l2MlVW1BgFEXp6xezanPCa+XerY/aK4A41zHRdn
 G4Mq6A9Gb0wcBZ4BwOvIN5YFiVrLpY+xPsggJoQaRre0Y0PAc26RpE99j8msSuvq6hTD
 PTgb096vIoV5gjAXb+6D3vQQdtesTOwOdQ8ZkM1RePdaXdH/R1OhrvW8PzhZ+1WZXc2z
 0kXlnMA5W7H6IKWZzWnADAAb0kBr7shl3oKHH7G5Ovc6GY/vZX7HgzNZzjLh2uZKgzNF
 jt4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=TotqMEN5DrXYEF17ne4DDCu2zSM8Bp20jLCGhp9+svs=;
 b=uS0Tkw+gvrAADYtJmIYRt0UlZx70XeS95RmLOmHPfyIxtMvNahfoJmUpKp/Gb5L1GQ
 DHvgJ9AXZgZYkf8JVDydcLJnwSl1TUpxYt1w63ESGoiwHeVMjGGFuKkozmeMuNqdU0DR
 9YDsy6j/dgWFESRKFHhvKFkkXElTOlbWZsegjs4kFWulrg7vmHnOUCyyw5EKCHM4dXGg
 6SIlIVpHgQEuM7ywvRr1Gq3iRs7IrcgENKbfDJGb7EsIA/54TJkkv+KxUDh0i2MtjJNp
 IluerN3GVtKRH7SwMNy3ZCS6vPQQKiiHhkKm+PiE5Lz4qa4pHm+lUXIAbidqs5x4dYX0
 VjnA==
X-Gm-Message-State: AOAM530+xeCuDSy3mzHzjC6lrHPBoh63K/9pUx9z8OgXqEGNrbt2ofNl
 HUdFs2VdZB4FR2O7/KcO879Y2mzVRyc=
X-Google-Smtp-Source: ABdhPJyBmmhiYFymFJw/Q8uoeYHQ/zOPKphK5MnVhp7gsbYg990d4f3XCBBCt3b7agoQm8HdTq4o1g==
X-Received: by 2002:a05:600c:1c1d:: with SMTP id
 j29mr7913851wms.49.1632695356306; 
 Sun, 26 Sep 2021 15:29:16 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 l15sm18920117wme.42.2021.09.26.15.29.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Sep 2021 15:29:15 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 25/40] target/microblaze: Restrict has_work() handler to
 sysemu
Date: Mon, 27 Sep 2021 00:27:01 +0200
Message-Id: <20210926222716.1732932-26-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210926222716.1732932-1-f4bug@amsat.org>
References: <20210926222716.1732932-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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


