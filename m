Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF41E416FDB
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 12:02:53 +0200 (CEST)
Received: from localhost ([::1]:56750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTi2e-0004D4-NF
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 06:02:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mThhT-00064y-0J
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 05:40:59 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:38856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mThhR-0007fY-Ky
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 05:40:58 -0400
Received: by mail-wr1-x42d.google.com with SMTP id u18so25557309wrg.5
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 02:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=acgjCaHCdDvDEO6aQNdNA165wsQFWfR3HbCbuPW+vnw=;
 b=JklFsp/JCJxsM2SvH0dD32pLumT+1IDSWSWwJRMl3mAQbiHB305xm+u/juOH6YJTi7
 Agf9Oq2L0ViuHACojTR7AXdF9ot246eJtDkfoaM++eh1M3OyaV3zZXOfkL8y9wABezrE
 MjxDqYpwx8yCaV1OykjdVvldcjf5PvUsAnB+a71yGVRK20AeSOsr68PHTZ0ILJN5THGD
 rarInE0OB+BbL+oDj3MZMabqJothzUZSb37xjty+xYfy/F6YEn54S0a3H3xq/W+PWGQg
 fB5gNRiDDlBz4QUyVYp2Vbl5usFB+rX7RFssC1/PH0IuxiBh3DQoJbnj/W5hwi9QdGys
 JkSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=acgjCaHCdDvDEO6aQNdNA165wsQFWfR3HbCbuPW+vnw=;
 b=ZcduTBKh4NSpMPQE9BMY+I5PjYyCu8s/z+s6rZ2SH0kIW7wp7ufPxgXHIke+oLkmr/
 70zQgAXSNBtGug+ducIytVbNHp2VL1bRNnDmNsnJIfavQMufayA3TQE/ADMsJE89kti+
 IEwB2rkDTQ8oZCN1SrdM+NTARkMDy9h9b1WXEYnUA0iuZcvuEot+O3lNPNx4boEVPTEc
 khPnyM/h6R4JZ9Z7UesxslYSbdHbxMLkLRadlhkEtMgSZR4GAY9z2xkaJeaQVDiCngNo
 itI6kiqaF4TRfp/CQuVL46ELbdv3l7jqF+b7XXLeV8X4OEqZNqZoWvzlVbD5SNSHODA3
 M8dA==
X-Gm-Message-State: AOAM533O/MJB6EKSjF2oI9KmQTuDZwy5ZZj3FBthyEui0FBR6jSSA4Jw
 6U23XNvXO2e5rAjgN4Dqll+X7doLgwA=
X-Google-Smtp-Source: ABdhPJwrZ6cwL9qLE44d/Idg2E1YkVLY8nqSTXzOzkCYF2RW3k8J+F8+C2gHJTzigunGTsXzExu7cQ==
X-Received: by 2002:a7b:cde8:: with SMTP id p8mr1065093wmj.178.1632476456123; 
 Fri, 24 Sep 2021 02:40:56 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 v17sm5870485wro.62.2021.09.24.02.40.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 02:40:55 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 27/40] target/nios2: Restrict has_work() handler to sysemu
Date: Fri, 24 Sep 2021 11:38:34 +0200
Message-Id: <20210924093847.1014331-28-f4bug@amsat.org>
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


