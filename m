Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B4A407F13
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Sep 2021 19:53:03 +0200 (CEST)
Received: from localhost ([::1]:35114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPTf5-0007Vr-05
	for lists+qemu-devel@lfdr.de; Sun, 12 Sep 2021 13:53:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mPTIP-0001RG-H6
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 13:29:37 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:53054)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mPTIO-0005Qg-11
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 13:29:37 -0400
Received: by mail-wm1-x32c.google.com with SMTP id e26so4965030wmk.2
 for <qemu-devel@nongnu.org>; Sun, 12 Sep 2021 10:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DvtLk1KDYMk4Ooy/WV4tyGGjURyvQDa7DPky1rRpIYc=;
 b=Xgr4Kj4xDq8y0tjQ3mHVwbthIVzaLk9rYJUw3tmsjHHo72o2SsjqH/C3gT1Uso9dwd
 rp7c/NR1v4i9HYQEBqjdOF9FfO9qTUwDXCl9ximOPNMMYPaBmsGLbpwvo8c+lK53PabK
 VdOy0dE6nTrozHDF1q79FyyKCgIOYHerdG0FX0vcKOU9+EhbvDt1DNVafqpZau5gDM2D
 RmvdVgyiwfH/YZFbsoM+KypEJSJhmXM6AkfhBI/qlXiHJkOSj4Q2IzyCmZIRwms624ye
 Yq7bPLny9ytb74TXO4LWG+Z2x5zw3jhqqokzbF8sg/KBa69kMBtUweA+9gBkOPXuf3UF
 JbZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=DvtLk1KDYMk4Ooy/WV4tyGGjURyvQDa7DPky1rRpIYc=;
 b=VmfHzt+fGNpoFAuQhEaSjWsNePczMbe8aGOBQumAklv08BJ3D0Ks+B07vG1bBp3A/m
 tdg7fisnRbl41wm2ds9A3ZJkc9qx0LATI9OnPW/NRnTpitGRVTlKX09Yrmk+MkHV3CgY
 hx0xYqKNnoVOdGy5XnrJSmym4byfp4Jev9qWeSxrv/ZrYYtafgNXex1+uSRDqVbsDXjJ
 cdTptDOVEAnxpyOgaIuzIIZxHUlYC75fJpTM3oqcWx1jxvaAQtn/IXVDh9S9isBd3ZMf
 f7nyg85gvcAiKCmVT6iID1UvTguMXAecQjLdhweyffEEX1RNy4RNqqufEpGb4sJurWYd
 E7qg==
X-Gm-Message-State: AOAM530uN9BkySwt9emJBkwJZnzidcrIZBbElQ5o+oIlFWiTcKfwzvlL
 +ZustQ6L6THyDKwqA6t8LmETpJwp8nM=
X-Google-Smtp-Source: ABdhPJzvk08I40mRkk3aUdoJAdwPAr/FQNinPP6oTUXh/BRRdLhJ8zuJv1YwEztPPvCjlYLG4dT59Q==
X-Received: by 2002:a1c:ac05:: with SMTP id v5mr7772149wme.13.1631467774543;
 Sun, 12 Sep 2021 10:29:34 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id u8sm4928246wmq.45.2021.09.12.10.29.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 10:29:34 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 25/30] target/sh4: Restrict has_work() handler to sysemu
Date: Sun, 12 Sep 2021 19:27:26 +0200
Message-Id: <20210912172731.789788-26-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210912172731.789788-1-f4bug@amsat.org>
References: <20210912172731.789788-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
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


