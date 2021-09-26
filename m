Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B9F418CE3
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 00:51:36 +0200 (CEST)
Received: from localhost ([::1]:53420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUczf-0003kp-If
	for lists+qemu-devel@lfdr.de; Sun, 26 Sep 2021 18:51:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUcdv-0003tV-VV
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 18:29:07 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:45010)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUcdr-0006PS-6z
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 18:29:07 -0400
Received: by mail-wr1-x429.google.com with SMTP id d6so46340490wrc.11
 for <qemu-devel@nongnu.org>; Sun, 26 Sep 2021 15:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HfPpeCahj5vQJxNuN5USHRZi30oEK/WxNT5N2Z+0tUI=;
 b=QMR6BWfkihxvHRKdBtjI/ktUWs4pukBuCgN6YRwtdpFPziTXlG6wZgFSFP3B1F0S/6
 2LtUO8tPaLUaQ7bzzG66Efp12x3mntlluXz8XCoplSxbXBD8CL3U6rBFFZk54Ufj+RSv
 2QX2dE82T+te2YFmYz1Yi9AWvZDWjfwGGsfiByd6JpHIPvQ4lxX3fsrhLd3V3cOnqNGQ
 Rp6KNVnYH5QW0APlvFl5cDY9Y1qQ3sRLhDKE6TA9frr2sYW0e/ROE59nQdaONSYzlukK
 uc3WLuBq0M0vu13TTeQ6YF4f/vPpeVTlQqVotK/LqQovYnVGFBcZFvKruc7MAbSCnkcG
 mB8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=HfPpeCahj5vQJxNuN5USHRZi30oEK/WxNT5N2Z+0tUI=;
 b=ttThF01UL437KIMBtrMUDiVg2v6UeGwCkhdN+h9rB/1Y20Wwi+m2R/2Tf4tn+tTXNs
 Zch0AsjNbMbjX4+uGuFZV8UUVLaq3htVJ/nY0v4ef5gzsy10xIZIRzjtZ892Wb3cLC/z
 b52oOgK9fD4YanjbXWQfyAJDNzXFeL04PP+Mp9fu+7Q7N6XH0Xjjfgh+4fLTkBvZy9mk
 tB/PuyfrFAXkNLyZOkCpjTNnHEMSYlWzPpUs7clJBXlXuYaB+nBax8uXmQCbf89b6R7z
 Qyo3om/Z2UJevV8tAtn2/e0TiLNwpTepUY86I3WWWbKj5QNQGV6x7kDMyrJtxWM/A1fg
 dCQg==
X-Gm-Message-State: AOAM532IBy581d+yiJrueTOdnAO/TZ5Nlm0b638i1VH07d2MVY3PvfH/
 2lJVfddB2xN5TzTOMaKutu4KNS+l78k=
X-Google-Smtp-Source: ABdhPJynnOI0gVkf7pZg7+klBFZPE1PiOFQTEKnf7j27nU8YMVbzm/NGCCsScpfjaD/IMsDi4E2uTA==
X-Received: by 2002:a1c:ed0a:: with SMTP id l10mr13455109wmh.140.1632695341638; 
 Sun, 26 Sep 2021 15:29:01 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 s2sm6831181wru.3.2021.09.26.15.29.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Sep 2021 15:29:01 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 22/40] target/hppa: Restrict has_work() handler to sysemu
Date: Mon, 27 Sep 2021 00:26:58 +0200
Message-Id: <20210926222716.1732932-23-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210926222716.1732932-1-f4bug@amsat.org>
References: <20210926222716.1732932-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=no autolearn_force=no
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


