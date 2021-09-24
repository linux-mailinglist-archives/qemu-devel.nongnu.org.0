Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E26041702D
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 12:16:24 +0200 (CEST)
Received: from localhost ([::1]:34330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTiFj-0002iX-D4
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 06:16:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mThht-0006Rs-4O
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 05:41:26 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:37588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mThhq-0007zj-Ok
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 05:41:24 -0400
Received: by mail-wr1-x436.google.com with SMTP id t8so25561848wrq.4
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 02:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=o/vqGSMOnhzvKGrld2aIeHhcVaK006Y9gzP+FF74z+I=;
 b=goNme+ilDkeL3ibbjtqRoaro9BqqE8qFef8w0FI182No1FhVxN71i2lnSQHCbOScHj
 LW2K94puGJzd7/juZXCS1GH1yaMrGZuYR4XzyLSoLjkjJK5N/1sTcLmVzELSWyja/+0C
 WUIAGzhWVuJhFzVQivmywnobh1hRcOA7QKyYzzqai0ufKWLc5wXk06UysAOCg799M0++
 MfMpzcCrR4sp3yoyjq5Qj6Iw1ZZWMvuMqlOnZOokEPodSZCunCJ5MYbe8MacF69k+pmh
 JX9vceFAbVQBgZjVA5xcpZfb1QPQlj7CwRvZGwDKIza5c9CrwT/wjSaLGzS4ylZhG7Em
 NONg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=o/vqGSMOnhzvKGrld2aIeHhcVaK006Y9gzP+FF74z+I=;
 b=w31WPcu6uNgiKfAZSH8YI+8js3rI7TBxxFJjELHP10yqJ1IayJZi+0bPgMYgv7OkZS
 doeNKQ41++ciX7Y7zx0G/otacYjRQVZum10Yjl3n+1nbfCciQSh0Jsp9E/XMeA9BJN12
 ivRIpra5eUDfL/JIMOiDKCprF4/ytmwfk4QEnJh6YFz50JGtMEP675D8siIwIdVxbyWu
 dZ6ruZQ+EfRFbBnOpGD2TsbBW9CW2itAz1PMjSpNF+4DXTwPy1+edgu4+rxIDNL1QMch
 AUl6u7l+i0arM+HTtMKV1Ur2wFzp/23GWF+BH40eQwpty+583xslDrGlYadYe5SXiccN
 YuAA==
X-Gm-Message-State: AOAM531uCmCsT5XT2S2XGRUGsxjYiXXGve8ek/AZQWqZbmjjaD9rSjJe
 58lSM2DkYg7wpuyz06TNLcnFDfz44LE=
X-Google-Smtp-Source: ABdhPJyQ5Tyx8zX9LNARuketEA99kO/96w2sjS8/Po8E7AmaPexyGY+KGhcXjkUaF9qRx5vYYYTNGg==
X-Received: by 2002:a1c:a94a:: with SMTP id s71mr1075179wme.32.1632476481344; 
 Fri, 24 Sep 2021 02:41:21 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 j2sm7682289wrq.35.2021.09.24.02.41.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 02:41:20 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 32/40] target/rx: Restrict has_work() handler to sysemu
Date: Fri, 24 Sep 2021 11:38:39 +0200
Message-Id: <20210924093847.1014331-33-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210924093847.1014331-1-f4bug@amsat.org>
References: <20210924093847.1014331-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Restrict has_work() to sysemu.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/rx/cpu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/rx/cpu.c b/target/rx/cpu.c
index 25a4aa2976d..ac6b40b2716 100644
--- a/target/rx/cpu.c
+++ b/target/rx/cpu.c
@@ -41,11 +41,13 @@ static void rx_cpu_synchronize_from_tb(CPUState *cs,
     cpu->env.pc = tb->pc;
 }
 
+#if !defined(CONFIG_USER_ONLY)
 static bool rx_cpu_has_work(CPUState *cs)
 {
     return cs->interrupt_request &
         (CPU_INTERRUPT_HARD | CPU_INTERRUPT_FIR);
 }
+#endif /* !CONFIG_USER_ONLY */
 
 static void rx_cpu_reset(DeviceState *dev)
 {
@@ -189,6 +191,7 @@ static const struct TCGCPUOps rx_tcg_ops = {
     .tlb_fill = rx_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+    .has_work = rx_cpu_has_work,
     .cpu_exec_interrupt = rx_cpu_exec_interrupt,
     .do_interrupt = rx_cpu_do_interrupt,
 #endif /* !CONFIG_USER_ONLY */
@@ -206,7 +209,6 @@ static void rx_cpu_class_init(ObjectClass *klass, void *data)
                                   &rcc->parent_reset);
 
     cc->class_by_name = rx_cpu_class_by_name;
-    cc->has_work = rx_cpu_has_work;
     cc->dump_state = rx_cpu_dump_state;
     cc->set_pc = rx_cpu_set_pc;
 
-- 
2.31.1


