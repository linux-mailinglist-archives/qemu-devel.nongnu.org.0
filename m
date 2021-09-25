Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD13241830A
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Sep 2021 17:06:30 +0200 (CEST)
Received: from localhost ([::1]:42104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mU9G1-0006vP-SF
	for lists+qemu-devel@lfdr.de; Sat, 25 Sep 2021 11:06:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU935-0001Uv-Bh
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 10:53:07 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:37667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU933-0006JW-K8
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 10:53:07 -0400
Received: by mail-wr1-x429.google.com with SMTP id t8so36541613wrq.4
 for <qemu-devel@nongnu.org>; Sat, 25 Sep 2021 07:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HfPpeCahj5vQJxNuN5USHRZi30oEK/WxNT5N2Z+0tUI=;
 b=JxGUQMuetfSaBGKeLlcIL3OZlRzoaJ5FHGBSikdTTBoEephC3U754ToB95sJpG4ruG
 kG0JLXZAr5Fyc5rqrMgNYWbuX4Ws7KX6+RyyTIO1prsNE5RDEK1IReFPf6hiBmbYrmya
 +a54Q4HQf6JIF2RWXXo+VqJGigMde2qiiMZH5tHyAQQ1ECvD+75EIUg5PcfIY3B0nWQQ
 q2qCjEYn9LScruiBYG6nOfu/NP+7mohNzZE2fC2xGixXu2AwJvUqAQFW5Ygc4IhhGL9a
 hTMs8/trR2d6gSUn710JTfdPkM6zin/QVn5J6ehcBKsHM884eUdPERUXzEa+nwAl5qwO
 Pt9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=HfPpeCahj5vQJxNuN5USHRZi30oEK/WxNT5N2Z+0tUI=;
 b=E0ItkMrBR8lSSxumeaWSShriFDhjdCiyPTiH6t6J6Age/tGPCuenj3+tq7sjInH5VM
 GyZ8CEKJ9vNj4dBT9h3cWhung9sM+bdkH4ZbHjMbNqS6x3Z7c7aF9zN7lgwuGsfbqVqo
 vjhc++FSuyaewncDPApJ4CfWkxDW0yiENkh2CL7HnGOlpcz1T0HTySSRxnQKE1QxAvs7
 hEqetJwpkOXXeLaETS0yEQCBKNZ+bVs+JIQTimuWhdZjz6qwGpVxEJ8hhdjZaFyJ21Wq
 J6ul6Zr3yP/O29T0/jOa5aQ5QyF3DcJKE+w79hfPaYdRj77aq1zU6utsmmftfAfKxF/s
 ATdw==
X-Gm-Message-State: AOAM531r+uQVcICupIGa3fgB6OBdegIZOMxieeMoooANYRrsfImG9aM2
 EAuqdQ3x/6uTO5f6YTfvKnullpM5UU4=
X-Google-Smtp-Source: ABdhPJy7FcwzuOUvnrrRfyu1LGONJrvvqjyzB5HU65iDPMQPtEWBk6Vf/T6YdKvAk7Crz8GliXpjYw==
X-Received: by 2002:adf:e783:: with SMTP id n3mr8741836wrm.37.1632581584055;
 Sat, 25 Sep 2021 07:53:04 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 g143sm15704856wme.16.2021.09.25.07.53.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Sep 2021 07:53:03 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 22/40] target/hppa: Restrict has_work() handler to sysemu
Date: Sat, 25 Sep 2021 16:51:00 +0200
Message-Id: <20210925145118.1361230-23-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210925145118.1361230-1-f4bug@amsat.org>
References: <20210925145118.1361230-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Restrict has_work() to sysemu.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/hppa/cpu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/hppa/cpu.c b/target/hppa/cpu.c
index 89cba9d7a2c..000c2e7793a 100644
--- a/target/hppa/cpu.c
+++ b/target/hppa/cpu.c
@@ -60,10 +60,12 @@ static void hppa_cpu_synchronize_from_tb(CPUState *cs,
     cpu->env.psw_n = (tb->flags & PSW_N) != 0;
 }
 
+#if !defined(CONFIG_USER_ONLY)
 static bool hppa_cpu_has_work(CPUState *cs)
 {
     return cs->interrupt_request & CPU_INTERRUPT_HARD;
 }
+#endif /* !CONFIG_USER_ONLY */
 
 static void hppa_cpu_disas_set_info(CPUState *cs, disassemble_info *info)
 {
@@ -148,6 +150,7 @@ static const struct TCGCPUOps hppa_tcg_ops = {
     .tlb_fill = hppa_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+    .has_work = hppa_cpu_has_work,
     .cpu_exec_interrupt = hppa_cpu_exec_interrupt,
     .do_interrupt = hppa_cpu_do_interrupt,
     .do_unaligned_access = hppa_cpu_do_unaligned_access,
@@ -164,7 +167,6 @@ static void hppa_cpu_class_init(ObjectClass *oc, void *data)
                                     &acc->parent_realize);
 
     cc->class_by_name = hppa_cpu_class_by_name;
-    cc->has_work = hppa_cpu_has_work;
     cc->dump_state = hppa_cpu_dump_state;
     cc->set_pc = hppa_cpu_set_pc;
     cc->gdb_read_register = hppa_cpu_gdb_read_register;
-- 
2.31.1


