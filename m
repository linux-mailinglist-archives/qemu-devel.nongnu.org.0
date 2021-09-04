Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E04400DA2
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Sep 2021 02:05:45 +0200 (CEST)
Received: from localhost ([::1]:47510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMffM-0007eW-2K
	for lists+qemu-devel@lfdr.de; Sat, 04 Sep 2021 20:05:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mMfWO-000681-Ds
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 19:56:28 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:42698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mMfWM-0007kv-O2
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 19:56:28 -0400
Received: by mail-wr1-x433.google.com with SMTP id q11so4047630wrr.9
 for <qemu-devel@nongnu.org>; Sat, 04 Sep 2021 16:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=geqo+TfqXlGgpu7vXFZNKLzFP6S151+7irB5AEU8QIk=;
 b=QvDaWpvNc3QzhsUGsLuMFbO+6Tw6LGzgjstZcNtsVeiD4ewrieRAm1xjn/mF4b0i5w
 4kuiy1yHEAEnGMXuSjVhZt7iGHpY3f3ThAYLUNYlSitRcVPkWGBaFPlf2aJ+M7IAIE5X
 fS6HOhXhgTDYh45XdQHC1/lJ2otniW9N+emEI38llMYINzM68/ucF7ObP/fDa57EwzS+
 XCeCeN7f46PVSEZZgkdrdWTmfeM3H7N8pkO9jZfycTK1NQpdGUZnc2Cfc0VmBYXzbQdX
 RnLyB54TN9yvDVSQ1e/6LBnO4lzoQQnKNLo6fEumXspZ5l3zc7+xmZxJEiiV18QyyQBb
 lOFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=geqo+TfqXlGgpu7vXFZNKLzFP6S151+7irB5AEU8QIk=;
 b=PXnvJNd67VSTaNniK+VbBt0d1v39xEL9cf+G4hAX91pfsv4e210sCnTl+mN+BkGf36
 b8aZYObZaKzlhLOi3fr4FtK5uZffYElJ1C7E8f4T8LsrTSJjnOqoh+pynEmwBepULFAI
 M7jyh5bC1BZcRJKYDd1MRg6HUf0j9eUuPwjF7jG6XABkub2n0ClmHMXi2puIDEoJpIF6
 CpVfmyVexU4v74UNf+pOn+xksMe2r8//5Qfi8IPw31LR3iP58yg/anYj0nWDRwPLert0
 eFWXzUtJu68RDEGUXPgHshS5fzzxbfLvGMUSjG0oA7cq2bBl79GksCNs5OEfC62deL0U
 se7A==
X-Gm-Message-State: AOAM532KqtsiR3AEwMd0lI3KF5ixOqN8mqCxxx91LgVOHRIaysoecFM5
 gr+93vJac80GoYphpNOa62+yKqk/ts4=
X-Google-Smtp-Source: ABdhPJzugCXCLS8qdOYpz+WXQIoUweWOOKeI51q95dTtoWc+yJOqB/h94mYckWNHj4Q93fsZRbuheA==
X-Received: by 2002:a5d:51ca:: with SMTP id n10mr5946015wrv.119.1630799785161; 
 Sat, 04 Sep 2021 16:56:25 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id c2sm3356693wrs.60.2021.09.04.16.56.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Sep 2021 16:56:24 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 08/24] target/cris: Restrict cpu_exec_interrupt() handler
 to sysemu
Date: Sun,  5 Sep 2021 01:55:26 +0200
Message-Id: <20210904235542.1092641-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210904235542.1092641-1-f4bug@amsat.org>
References: <20210904235542.1092641-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
 Laurent Vivier <laurent@vivier.eu>, Warner Losh <imp@bsdimp.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Restrict cpu_exec_interrupt() and its callees to sysemu.

Reviewed-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/cris/cpu.h    |  2 +-
 target/cris/cpu.c    |  4 ++--
 target/cris/helper.c | 17 ++---------------
 3 files changed, 5 insertions(+), 18 deletions(-)

diff --git a/target/cris/cpu.h b/target/cris/cpu.h
index d3b64929096..be021899ae8 100644
--- a/target/cris/cpu.h
+++ b/target/cris/cpu.h
@@ -185,11 +185,11 @@ struct CRISCPU {
 
 #ifndef CONFIG_USER_ONLY
 extern const VMStateDescription vmstate_cris_cpu;
-#endif
 
 void cris_cpu_do_interrupt(CPUState *cpu);
 void crisv10_cpu_do_interrupt(CPUState *cpu);
 bool cris_cpu_exec_interrupt(CPUState *cpu, int int_req);
+#endif
 
 void cris_cpu_dump_state(CPUState *cs, FILE *f, int flags);
 
diff --git a/target/cris/cpu.c b/target/cris/cpu.c
index 70932b1f8c7..c2e7483f5bd 100644
--- a/target/cris/cpu.c
+++ b/target/cris/cpu.c
@@ -205,20 +205,20 @@ static const struct SysemuCPUOps cris_sysemu_ops = {
 
 static const struct TCGCPUOps crisv10_tcg_ops = {
     .initialize = cris_initialize_crisv10_tcg,
-    .cpu_exec_interrupt = cris_cpu_exec_interrupt,
     .tlb_fill = cris_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+    .cpu_exec_interrupt = cris_cpu_exec_interrupt,
     .do_interrupt = crisv10_cpu_do_interrupt,
 #endif /* !CONFIG_USER_ONLY */
 };
 
 static const struct TCGCPUOps crisv32_tcg_ops = {
     .initialize = cris_initialize_tcg,
-    .cpu_exec_interrupt = cris_cpu_exec_interrupt,
     .tlb_fill = cris_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+    .cpu_exec_interrupt = cris_cpu_exec_interrupt,
     .do_interrupt = cris_cpu_do_interrupt,
 #endif /* !CONFIG_USER_ONLY */
 };
diff --git a/target/cris/helper.c b/target/cris/helper.c
index 911867f3b48..36926faf323 100644
--- a/target/cris/helper.c
+++ b/target/cris/helper.c
@@ -41,20 +41,6 @@
 
 #if defined(CONFIG_USER_ONLY)
 
-void cris_cpu_do_interrupt(CPUState *cs)
-{
-    CRISCPU *cpu = CRIS_CPU(cs);
-    CPUCRISState *env = &cpu->env;
-
-    cs->exception_index = -1;
-    env->pregs[PR_ERP] = env->pc;
-}
-
-void crisv10_cpu_do_interrupt(CPUState *cs)
-{
-    cris_cpu_do_interrupt(cs);
-}
-
 bool cris_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                        MMUAccessType access_type, int mmu_idx,
                        bool probe, uintptr_t retaddr)
@@ -287,7 +273,6 @@ hwaddr cris_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
     D(fprintf(stderr, "%s %x -> %x\n", __func__, addr, phy));
     return phy;
 }
-#endif
 
 bool cris_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 {
@@ -319,3 +304,5 @@ bool cris_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 
     return ret;
 }
+
+#endif /* !CONFIG_USER_ONLY */
-- 
2.31.1


