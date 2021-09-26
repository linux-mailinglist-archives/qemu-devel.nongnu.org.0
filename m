Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43BF1418C45
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 00:43:57 +0200 (CEST)
Received: from localhost ([::1]:34846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUcsG-0007w8-4B
	for lists+qemu-devel@lfdr.de; Sun, 26 Sep 2021 18:43:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUcf0-0006QG-AD
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 18:30:14 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:34456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUceu-0007HJ-Gm
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 18:30:14 -0400
Received: by mail-wr1-x42a.google.com with SMTP id t8so46621007wri.1
 for <qemu-devel@nongnu.org>; Sun, 26 Sep 2021 15:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7nxEt9EN1rfUcFm1gYLqiVpIjc8wwfbzfO8vsuUKuDU=;
 b=pMi81WMXuOJ3c0XLut1jrtULIRFuuA1n7UZn6OTU67Y/mqd94OA646JhXy8/Hkknvb
 SFOBui1hd4GFWkMGYVQVIadS208DrKaDoFood/usqkwVLuy3iMG8DdsrbodsDmVVT4hN
 BE+YNiHIf66rm3Ii81/+mgUTuB+3IJY8kIBdQaFldJJJtyX5YSt4fYEaQdnmKzYmyuzv
 n1TwtuyRXeTW3IPlPeoJOe90TVl5K9i7KrHlmyl2uIwsdKx0oz5uUXbdG2/GQWYkqoK8
 GZ8hpX427Em0lklqf/EACVnTAPP96rwMMdEBj4oOcwLHyjbWbrEkjEBrwuRDjvERk1uy
 m5nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=7nxEt9EN1rfUcFm1gYLqiVpIjc8wwfbzfO8vsuUKuDU=;
 b=VcDfEhWj/9EpBOzyzQqnK0GMyviYSABjvzbfsBTOOZ3G3xIfCGnbG+zrN/7U1/d1Og
 A3nK/mcaDKG8BrWVkyo4vkbx0CzR0q9vNE9vqoD8vgcbXYEkULSkNIaeflGHu6CKBXQP
 EVpPjPO96eIgve/SQpoQiE1+3eEj6gAEp0W4cHGRSMmHJgUg/d+5Wc2vaXEEo2SnRM1B
 FDrFcPfVUgoEV6ZOEtE/pgRrvN/5uaWW3l1LBsr32NccoChjPTdBcnBg3+awsMJTy8lS
 elw9z30F37Qa5lbIb34Z4GaCSdPXJN0fETb9GnRQQYrrX6F1F0hfZraxtYTJRlKZk33b
 zGFQ==
X-Gm-Message-State: AOAM53313uMDZKi3zhuUbk/Eh1UHuk4ganuLpheXYwoV0j9Jc/4B97EA
 IjJp+VJsUVKyEq6T4N0x8DsvTUonp7E=
X-Google-Smtp-Source: ABdhPJzHlRzczQIktgVmo/fNCX8UBVOM1527eKH1eyvjPtRTcl+15duLXSt2f3gA+qSqhiBfssSRaQ==
X-Received: by 2002:adf:eb12:: with SMTP id s18mr1156680wrn.97.1632695407044; 
 Sun, 26 Sep 2021 15:30:07 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 o17sm11538359wrs.25.2021.09.26.15.30.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Sep 2021 15:30:06 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 36/40] target/sparc: Restrict has_work() handler to sysemu
Date: Mon, 27 Sep 2021 00:27:12 +0200
Message-Id: <20210926222716.1732932-37-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210926222716.1732932-1-f4bug@amsat.org>
References: <20210926222716.1732932-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_PASS=-0.001, T_SPF_HELO_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
 target/sparc/cpu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
index 0d252cb5bdc..8d61bf15f6c 100644
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


