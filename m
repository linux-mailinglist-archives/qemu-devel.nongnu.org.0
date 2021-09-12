Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C347D407F16
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Sep 2021 19:56:00 +0200 (CEST)
Received: from localhost ([::1]:40280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPThv-0002eV-Sg
	for lists+qemu-devel@lfdr.de; Sun, 12 Sep 2021 13:55:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mPTIa-0001jF-NY
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 13:29:48 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:36507)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mPTIX-0005WW-Is
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 13:29:47 -0400
Received: by mail-wr1-x433.google.com with SMTP id g16so10967130wrb.3
 for <qemu-devel@nongnu.org>; Sun, 12 Sep 2021 10:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sD6WSo2YHvghifkbZDHrEPR9Egwbzuw6eNNdtPTmG0c=;
 b=BsBTxQcU/49pj9VTjjCAkLGlBgg2zSeoa+hy7wZ2XehsqlHD9qThuik1ib/zDpjPqd
 Wm8GKQPetX0UPvUvK0M57LdAD+d2gZVGiy4QldY++oRcKyKVfq3S1DrdWUH7/CFF3Q0n
 s7Oyd1l/FFPWabOj6WskFhaQJh7YfUxlcuqGbh+ph2QLjzPsU7CZloIp7lEGw7odJCYe
 MQUIhl5TwRgQ95cqrVat5soLKA6OkEfCk8T9oK+HKIulVf9h46WZOMHXKQjoukTR2d7H
 eiBy41DmUMLM5JoXGKnBJ0q52vTc15iJHYw/1yPWNjK9OWydkGRJu4kNK3izE+LC24lQ
 uJvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=sD6WSo2YHvghifkbZDHrEPR9Egwbzuw6eNNdtPTmG0c=;
 b=JgvzKH0bakRUOBSb9q5CcPO1zWbBlCBgfYv6DLtujFpr1d0669HBMcn+VQ8tQBZwA/
 mtdW9BPCp87EaafO31+qZLjTuK4awQUDwOaJ62BZ0lb6XQ9onVzDCrU99UGQ6rcqigXd
 7jtNXma1GWtIB1qE0LbT0q95nx/iqjuSa/M4l7IAqrgfyyB3NdKo4197/JYXHoOseufz
 ZwbQGQREyCDht7ZCC/Dz+hhZ5NofTQD4IPUUoI5mxVaVYV9dXIxV9bMfQWwLSGSki7qN
 4kRzSTAkxlV2xH0sjPrL5i9x/hR0pMPOwYBk3YJcvu3bim+LhX5YE9o6kM5NVJptVdYz
 aNoA==
X-Gm-Message-State: AOAM531+Bd1aGz7sGtEsfXEqIxRLDPpaF5yJZ6jsq4sJKWVj+2POwiqf
 ZyaKoF65QFZ6fGr4Qc3II9MX+wcGyYQ=
X-Google-Smtp-Source: ABdhPJzD7EF/pbpnTmFuc6lAJyG8ZqCRj17AnyCQ7pN/0o80IpCruOiHN4Ayyia5/Um2+qgxi6ML6Q==
X-Received: by 2002:a05:6000:18c8:: with SMTP id
 w8mr8360770wrq.90.1631467784056; 
 Sun, 12 Sep 2021 10:29:44 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id o17sm4983461wrj.96.2021.09.12.10.29.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 10:29:43 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 27/30] target/sparc: Restrict has_work() handler to sysemu
Date: Sun, 12 Sep 2021 19:27:28 +0200
Message-Id: <20210912172731.789788-28-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210912172731.789788-1-f4bug@amsat.org>
References: <20210912172731.789788-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Restrict has_work() to sysemu.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/sparc/cpu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
index e83e305aa9d..4a63ed12644 100644
--- a/target/sparc/cpu.c
+++ b/target/sparc/cpu.c
@@ -702,6 +702,7 @@ static void sparc_cpu_synchronize_from_tb(CPUState *cs,
     cpu->env.npc = tb->cs_base;
 }
 
+#if !defined(CONFIG_USER_ONLY)
 static bool sparc_cpu_has_work(CPUState *cs)
 {
     SPARCCPU *cpu = SPARC_CPU(cs);
@@ -710,6 +711,7 @@ static bool sparc_cpu_has_work(CPUState *cs)
     return (cs->interrupt_request & CPU_INTERRUPT_HARD) &&
            cpu_interrupts_enabled(env);
 }
+#endif /* !CONFIG_USER_ONLY */
 
 static char *sparc_cpu_type_name(const char *cpu_model)
 {
@@ -867,6 +869,7 @@ static const struct TCGCPUOps sparc_tcg_ops = {
     .tlb_fill = sparc_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+    .has_work = sparc_cpu_has_work,
     .cpu_exec_interrupt = sparc_cpu_exec_interrupt,
     .do_interrupt = sparc_cpu_do_interrupt,
     .do_transaction_failed = sparc_cpu_do_transaction_failed,
@@ -888,7 +891,6 @@ static void sparc_cpu_class_init(ObjectClass *oc, void *data)
 
     cc->class_by_name = sparc_cpu_class_by_name;
     cc->parse_features = sparc_cpu_parse_features;
-    cc->has_work = sparc_cpu_has_work;
     cc->dump_state = sparc_cpu_dump_state;
 #if !defined(TARGET_SPARC64) && !defined(CONFIG_USER_ONLY)
     cc->memory_rw_debug = sparc_cpu_memory_rw_debug;
-- 
2.31.1


