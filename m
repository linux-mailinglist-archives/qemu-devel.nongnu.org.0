Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB2D418312
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Sep 2021 17:13:11 +0200 (CEST)
Received: from localhost ([::1]:58626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mU9MU-0001ay-FF
	for lists+qemu-devel@lfdr.de; Sat, 25 Sep 2021 11:13:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU93V-0002B1-92
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 10:53:34 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:40539)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU93R-0006dG-4e
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 10:53:32 -0400
Received: by mail-wr1-x42b.google.com with SMTP id t28so23089756wra.7
 for <qemu-devel@nongnu.org>; Sat, 25 Sep 2021 07:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=acgjCaHCdDvDEO6aQNdNA165wsQFWfR3HbCbuPW+vnw=;
 b=RNIa0bGaEJmEjGxl2dcNE/eVPbU3L76Uljp1NtWy2tc8CVcv79owBmiDLaFArNy+IT
 oaWjnr+mR3GkoG4qVkP7x0WnCLPTAM2gf1aiB1ngS4B40L4yAvV5GDYv5ud/z8subW7q
 E97atOnU4c1/ZzBXOXJ/x5O2pDqlPg2S5FrLWt8N+RXIVf5eXlBwO6UT7VnFOZIy5kq+
 Ad+iM1zi7gKATutqN9p0KmyyKSDasqC5yddVz7ZAwC9dp6k4pVi3IEKLpPZZazHKTXFU
 UA7hwMtHfkZEItuDuzJ5mGYdv1QItPRHzZdHHqjOIvLoOPlcGO01vG6SeSeMwhdPw7UA
 MFuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=acgjCaHCdDvDEO6aQNdNA165wsQFWfR3HbCbuPW+vnw=;
 b=tLL35tLeSVsDa8/i6Rzho5RVPVNKORweKB3AoLzL8YN5hZSFp2ZvtuLYFe9JFbq68t
 Z3p4UqceHLVaIIU59FoDF9rTsvw02yCrlHitIuvOc3Yoy8ExxKZcXKbhqm0G849dMb+Y
 LzaFcQaxMIoZBLSlUp9X7FGdILpYG/w4PiAAuVCJK9dF7yqHovP/RmQNHzT9i6Tv8A3d
 uK1DLP/YaU2Ln5j+MdiH/aC2qqnqQaJoGGHKZho4rFl0hVRjwzsooglewWZ7tB9/lXO+
 V4DwplJjXOspqtagSDKkSelAzCqo1QUUd5lejkYvagwLbsv4IFh3ECW+VqC0xD4eDmfw
 UcJQ==
X-Gm-Message-State: AOAM531G2daeUzJLHEHS556IqRPJtBpyUbUlKiOzkmaf6r9gQPDyO0Mi
 PuUbyKi3cv+6d91H2Yd2AAhXmzWH0pc=
X-Google-Smtp-Source: ABdhPJz+So68TfvwENaaWg/o7/POth9+1B31X/38kUY4LqXICEmW58Gw0apG4INgAKcu96JMDcy4EA==
X-Received: by 2002:adf:e643:: with SMTP id b3mr17427521wrn.299.1632581607691; 
 Sat, 25 Sep 2021 07:53:27 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 k18sm11115199wrh.68.2021.09.25.07.53.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Sep 2021 07:53:27 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 27/40] target/nios2: Restrict has_work() handler to sysemu
Date: Sat, 25 Sep 2021 16:51:05 +0200
Message-Id: <20210925145118.1361230-28-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210925145118.1361230-1-f4bug@amsat.org>
References: <20210925145118.1361230-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
Cc: Marek Vasut <marex@denx.de>, Chris Wulff <crwulff@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Restrict has_work() to sysemu.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/nios2/cpu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/nios2/cpu.c b/target/nios2/cpu.c
index 947bb09bc1e..9938d7c2919 100644
--- a/target/nios2/cpu.c
+++ b/target/nios2/cpu.c
@@ -34,10 +34,12 @@ static void nios2_cpu_set_pc(CPUState *cs, vaddr value)
     env->regs[R_PC] = value;
 }
 
+#if !defined(CONFIG_USER_ONLY)
 static bool nios2_cpu_has_work(CPUState *cs)
 {
     return cs->interrupt_request & (CPU_INTERRUPT_HARD | CPU_INTERRUPT_NMI);
 }
+#endif /* !CONFIG_USER_ONLY */
 
 static void nios2_cpu_reset(DeviceState *dev)
 {
@@ -223,6 +225,7 @@ static const struct TCGCPUOps nios2_tcg_ops = {
     .tlb_fill = nios2_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+    .has_work = nios2_cpu_has_work,
     .cpu_exec_interrupt = nios2_cpu_exec_interrupt,
     .do_interrupt = nios2_cpu_do_interrupt,
     .do_unaligned_access = nios2_cpu_do_unaligned_access,
@@ -241,7 +244,6 @@ static void nios2_cpu_class_init(ObjectClass *oc, void *data)
     device_class_set_parent_reset(dc, nios2_cpu_reset, &ncc->parent_reset);
 
     cc->class_by_name = nios2_cpu_class_by_name;
-    cc->has_work = nios2_cpu_has_work;
     cc->dump_state = nios2_cpu_dump_state;
     cc->set_pc = nios2_cpu_set_pc;
     cc->disas_set_info = nios2_cpu_disas_set_info;
-- 
2.31.1


