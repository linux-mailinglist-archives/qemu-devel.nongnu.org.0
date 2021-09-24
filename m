Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB6F416FC6
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 11:58:56 +0200 (CEST)
Received: from localhost ([::1]:45312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mThyp-0004wv-PA
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 05:58:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mThiL-0007h6-8y
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 05:41:53 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:35567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mThiJ-0008N3-KA
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 05:41:52 -0400
Received: by mail-wr1-x42d.google.com with SMTP id i23so25606782wrb.2
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 02:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=F6iT0mYKdizTZwY+Alp0nWU9C8rVfDyZdw7MbXpCAAA=;
 b=dBDB86fZ4I+6YhlSnKFCUyV+E5I6CESO2Yhb3VsTCnU7ynWh2R3KYq00/dZswqNkc4
 M0AZw7/0xpkuU32voGkSc++8bRVap7yzKqbCYzXPcIKQHYddwxN+aWPqPex8Rc+7e29R
 XTH0PTbzai2JRmUclzWVFHtf183LuB5MneiTvtzLhLRjyPL6jubA+1NhK4UD05KRzqO6
 1qSZ2m8iEYbyMUO7NNypGAIdMOJ9miAV6BwSNVTxECplIa4KIf2MFp2ijy57g8vbYi3U
 Y+tb90dGbeYblJphJkfFPmzyUYdSGAJzXDVoHoLFxhefsll+ssqWWhMSxUjrXMQ3+UMn
 D7lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=F6iT0mYKdizTZwY+Alp0nWU9C8rVfDyZdw7MbXpCAAA=;
 b=iKvT0EJLXPOGS2Rw2FHNeFvITOwPi3avNpDTogOpj14YAdsoqsgY8x8UmXd2eE6L/D
 FqNPVUwUbmD416BXZJY2IsuByz2AUX0pjunNIpJZs3xPh4nHo3gB3MLw0sOOazaAXW04
 7z/1w3tZFUKI0BVBIU5GY7pe7+pkRTwvlNsPezXKNvSEy5oRzqFUILkyej0haFKoeYmG
 rjdVSMUAroMxJnKBhJ2fDyA1HbW4h9TMPqcUwHXNeTeCceP/j5dt/SlPxoNzmUq6q51A
 SAhgwqsxD18TKhHVe2TvUrZc0OM/aF3oz0RAfj+ad7+AvV1k4sLJ8qHYldTF/8Cw2G9b
 k5xQ==
X-Gm-Message-State: AOAM531tRIGXqIVJJGKFP1QI9FtDSTrFJ7UgabI4jQ5ejFWlAAHeDVDg
 tZt7lsjzPMHcU9Nq4blODx2W/70VocM=
X-Google-Smtp-Source: ABdhPJwnkTVr3Q5tfhwJAThC97GfrX/zgjVO/4WH4iNbP6APdWExLamuKJQNfVdce6hy6ShO5G9pOQ==
X-Received: by 2002:a1c:e915:: with SMTP id q21mr1062231wmc.180.1632476509956; 
 Fri, 24 Sep 2021 02:41:49 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 n11sm5838101wmq.19.2021.09.24.02.41.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 02:41:49 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 38/40] target/xtensa: Restrict has_work() handler to sysemu
Date: Fri, 24 Sep 2021 11:38:45 +0200
Message-Id: <20210924093847.1014331-39-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210924093847.1014331-1-f4bug@amsat.org>
References: <20210924093847.1014331-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: Max Filippov <jcmvbkbc@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Restrict has_work() to sysemu.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/xtensa/cpu.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/target/xtensa/cpu.c b/target/xtensa/cpu.c
index c1cbd03595e..5cb19a88819 100644
--- a/target/xtensa/cpu.c
+++ b/target/xtensa/cpu.c
@@ -43,18 +43,17 @@ static void xtensa_cpu_set_pc(CPUState *cs, vaddr value)
     cpu->env.pc = value;
 }
 
+#ifndef CONFIG_USER_ONLY
+
 static bool xtensa_cpu_has_work(CPUState *cs)
 {
-#ifndef CONFIG_USER_ONLY
     XtensaCPU *cpu = XTENSA_CPU(cs);
 
     return !cpu->env.runstall && cpu->env.pending_irq_level;
-#else
-    return true;
-#endif
 }
 
-#ifdef CONFIG_USER_ONLY
+#else /* CONFIG_USER_ONLY*/
+
 static bool abi_call0;
 
 void xtensa_set_abi_call0(void)
@@ -66,7 +65,8 @@ bool xtensa_abi_call0(void)
 {
     return abi_call0;
 }
-#endif
+
+#endif /* CONFIG_USER_ONLY */
 
 static void xtensa_cpu_reset(DeviceState *dev)
 {
@@ -196,6 +196,7 @@ static const struct TCGCPUOps xtensa_tcg_ops = {
     .debug_excp_handler = xtensa_breakpoint_handler,
 
 #ifndef CONFIG_USER_ONLY
+    .has_work = xtensa_cpu_has_work,
     .cpu_exec_interrupt = xtensa_cpu_exec_interrupt,
     .do_interrupt = xtensa_cpu_do_interrupt,
     .do_transaction_failed = xtensa_cpu_do_transaction_failed,
@@ -215,7 +216,6 @@ static void xtensa_cpu_class_init(ObjectClass *oc, void *data)
     device_class_set_parent_reset(dc, xtensa_cpu_reset, &xcc->parent_reset);
 
     cc->class_by_name = xtensa_cpu_class_by_name;
-    cc->has_work = xtensa_cpu_has_work;
     cc->dump_state = xtensa_cpu_dump_state;
     cc->set_pc = xtensa_cpu_set_pc;
     cc->gdb_read_register = xtensa_cpu_gdb_read_register;
-- 
2.31.1


