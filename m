Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 067554128D4
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 00:25:00 +0200 (CEST)
Received: from localhost ([::1]:47066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSRic-0001tt-V9
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 18:24:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mSR7r-0006DN-Kk
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 17:46:59 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:45894)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mSR7q-0003H0-6b
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 17:46:59 -0400
Received: by mail-wr1-x434.google.com with SMTP id d21so33524498wra.12
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 14:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sD6WSo2YHvghifkbZDHrEPR9Egwbzuw6eNNdtPTmG0c=;
 b=qHKz+TOZDCC8j4hS95QHm2xkezOoHw6gO2UtTxwypEUXDgmpjI/S+FHiLS7eUzC0Gg
 edicqSAzRiQ+zeoPsm8HJ8R7pOZAj6Qw8z7wasrYxcjL76KRR6Ay8dAvvQnrXiWCjvd9
 gKSVEK0WevTS24bnUa3OiM3qMHqc5FQ3I1kOKFlpWV8LZsNWGCgx6+tW5aFhAiZ543pZ
 Ubfr3n+b/rBBOAa25u2g6R6kZb3HaijqYasiwXL4/Dlk8DZpfYfcrh2QOYy6KGIreEp+
 8HbDYOmRGK/O7dLK3P+Xr7hlXEjWJ8W6oCIP+l+5xroocnGGCAMFCYOiMfP0oROH9Sp/
 yfaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=sD6WSo2YHvghifkbZDHrEPR9Egwbzuw6eNNdtPTmG0c=;
 b=KYgtj3zqqXKlXsVDxDPGUMa1n5PfIpZ0y3l50AnG9F0mSKORfAYrGkvx5h9CQKGUOK
 s0U9r4S7E4xYQulPvGe6hf/8cqReE1JgXJmj9SqyCAeVZJiQOdNBsnAl3pImyiwBCiXx
 CRrhFagGzx/vcInWsxg0HVORpQuSoG0InInQFQnP/e6ue5Nm8u40QRDKZsjX2kotFsoV
 jhwzm9LfP279Re2qiU0c9HYzX6be5c7SKknDUZrySFcMChfzhIVlgG8shtNwPgrmGsTn
 Ro0eGaWzpuxlrHwnXmw+66tJAqDWwDbMT7Jf7ypnVdvv/B1imfqUB0A9Gzl0/SfTbSuY
 j3uA==
X-Gm-Message-State: AOAM531zwL8p8VcyIsu6HIQka1br1ZuVzW+/WKlo1inuLBdMn1/eNcez
 giBd0c6IE1IDKPN9YlKC/QgNszfpgVI=
X-Google-Smtp-Source: ABdhPJxfH3fL0wFvEYOJgzynrrgtoibixJEl4Ny+U5biHL50rB6KT2ggRdlgSQhZrMXW87rwr0zrtw==
X-Received: by 2002:a1c:cc16:: with SMTP id h22mr1141992wmb.117.1632174416684; 
 Mon, 20 Sep 2021 14:46:56 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 t6sm662929wmj.12.2021.09.20.14.46.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 14:46:56 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 28/31] target/sparc: Restrict has_work() handler to sysemu
Date: Mon, 20 Sep 2021 23:44:44 +0200
Message-Id: <20210920214447.2998623-29-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210920214447.2998623-1-f4bug@amsat.org>
References: <20210920214447.2998623-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
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


