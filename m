Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8D84128C7
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 00:21:42 +0200 (CEST)
Received: from localhost ([::1]:38130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSRfR-0004QA-UL
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 18:21:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mSR7j-0005pS-6F
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 17:46:51 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:37699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mSR7h-0003A2-NU
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 17:46:50 -0400
Received: by mail-wr1-x432.google.com with SMTP id t8so33596106wrq.4
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 14:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DvtLk1KDYMk4Ooy/WV4tyGGjURyvQDa7DPky1rRpIYc=;
 b=lQnBqwiTCY2KfbyVpLeTEqTwjkokqRx5kAf9B9NL9GmWhKEcV++GipJvKU8CRue4US
 /DEmIyb23hVYmcUx4dk8GabzUSfKF/Eday46HQfKfbNP8Hm/AFqCRkDioheLsn2wlk9S
 qYF6H31wN4lOWNYwtib0INajwu8BugTFZeA7ywWp9Xn9vgPLPkq5HyKoyXd8p9Yks4pG
 4BtII1yBAvksneLKX3ZkOiYBzG5fpCM0xvV68Xi7oklm9uWw65lxnd+utZf+gcjnpLIc
 o0DtChvRpKQY2vhVgJj2sQ2XuoFIWWR/u/PWjJzjo+GMnOXsroaS4qy3oLnnmYgQDIX3
 tSxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=DvtLk1KDYMk4Ooy/WV4tyGGjURyvQDa7DPky1rRpIYc=;
 b=W1bJRRwQHD3Lzm8L7JlJiNm/eL0cY6T3McO/JV0BsQNpheG0OH0s9gDmJ1zwlPYSvl
 veseLGm1mRjgywqvtPXFP+YhtqPVM7kQCm9Z6yoLcaVz8S5Fcx4qcfKRpglQ10NAkHBu
 ewBCKFzXlxKijN4MqnSWR04s0X7Z1VEfSLprIZ0yzLA7wsmbznViSTmWCvMhpj+IYJJA
 HbRQW0oMZYIX4smKxHhbqKvGzqUfU76pvM4hK9we4zlZm0WtmX7W1WJFI6l0pKHGoJL2
 ixDhukZKmJ21zc3sFWstO7clhyUM95tooxllZmFkP9kCAB0ypVAaJpapScDdPMcoLHyF
 fCxw==
X-Gm-Message-State: AOAM533r8bdM2/ItJ/AcuyWwwlgzXj1JfklqZbfCeWGiqv5I6nSZRL+c
 fDk6gMmO04q4dsd94l2QJnUxxZjjvH4=
X-Google-Smtp-Source: ABdhPJwTJ60R5RSVmdT+IH9R4KZEQaHuTI+qvKyX0zaDce+B+YJHtTA9oHD0DtQ4vLTUEnF3gQpCxA==
X-Received: by 2002:a05:600c:1c26:: with SMTP id
 j38mr1212888wms.12.1632174407535; 
 Mon, 20 Sep 2021 14:46:47 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 z5sm738782wmp.26.2021.09.20.14.46.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 14:46:47 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 26/31] target/sh4: Restrict has_work() handler to sysemu
Date: Mon, 20 Sep 2021 23:44:42 +0200
Message-Id: <20210920214447.2998623-27-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210920214447.2998623-1-f4bug@amsat.org>
References: <20210920214447.2998623-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
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
 target/sh4/cpu.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/sh4/cpu.c b/target/sh4/cpu.c
index 2047742d03c..fb2116dc52e 100644
--- a/target/sh4/cpu.c
+++ b/target/sh4/cpu.c
@@ -58,13 +58,14 @@ static bool superh_io_recompile_replay_branch(CPUState *cs,
     }
     return false;
 }
-#endif
 
 static bool superh_cpu_has_work(CPUState *cs)
 {
     return cs->interrupt_request & CPU_INTERRUPT_HARD;
 }
 
+#endif /* !CONFIG_USER_ONLY */
+
 static void superh_cpu_reset(DeviceState *dev)
 {
     CPUState *s = CPU(dev);
@@ -239,6 +240,7 @@ static const struct TCGCPUOps superh_tcg_ops = {
     .tlb_fill = superh_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+    .has_work = superh_cpu_has_work,
     .cpu_exec_interrupt = superh_cpu_exec_interrupt,
     .do_interrupt = superh_cpu_do_interrupt,
     .do_unaligned_access = superh_cpu_do_unaligned_access,
@@ -258,7 +260,6 @@ static void superh_cpu_class_init(ObjectClass *oc, void *data)
     device_class_set_parent_reset(dc, superh_cpu_reset, &scc->parent_reset);
 
     cc->class_by_name = superh_cpu_class_by_name;
-    cc->has_work = superh_cpu_has_work;
     cc->dump_state = superh_cpu_dump_state;
     cc->set_pc = superh_cpu_set_pc;
     cc->gdb_read_register = superh_cpu_gdb_read_register;
-- 
2.31.1


