Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CDB760D942
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 04:27:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onVz7-0008LJ-NX; Tue, 25 Oct 2022 22:17:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onVy9-0007q7-V6
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 22:16:39 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onVy7-0001ul-H8
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 22:16:36 -0400
Received: by mail-pg1-x52b.google.com with SMTP id 20so13465586pgc.5
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 19:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WY+A++lzDPuTw27rLB3LnIK22fG4kGVR5q1RFvEyx/k=;
 b=zVuNQJWbBQyzVwn8jNobr3vINp3RzAIN/vCrPRxyqMqYSJw+wp3XHEUb8WDJNjvyCe
 gYVGwY0CuAwJh++yKLCHspj/EBeYTAAoeRbYxlKSnP8gw3tTlLMoxS4tgerDENWQJ3BI
 bT8XX4Y3rzpaFR2RHU2hFGHVornXjUG88UW4MCle0C8t+rnKe/rWj38HSXTB//XJ2ArQ
 q00nfpaj4NqIYkjQcVuziD5m1+1cq+7jOqFsnhCTNZLZP3jJWhZTvr3bfEzKRZxPuNu4
 aw1CCkSxfY1sf+fvp2j+PaT1sjhfZZLld3I/xz6rU59jkxdjXDuti/Ui4rkSuYjawwEw
 gQpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WY+A++lzDPuTw27rLB3LnIK22fG4kGVR5q1RFvEyx/k=;
 b=ev0XCFpfXJSX4XtUMGKdluAwmOiFfQRKvQtFzuCrEqMHZWKqqFxsSN+FNCr9PR7dtI
 NIJS28o2SXyF8WG3ZOX/CP5OLbZp3vDHOap4ILS7z1ac4Nvai0Nqf4fb4CDD3a3LkjiT
 U64x7/vPURd14SotCWgC8j6hBI1M6CN8aBl7nMKEvwbGGSlU9kUMDESTPQWuJhY5QW+Q
 hEQYHFJzznFkEm7KG/kHzsmYxwJCJz+HD69OFBMqiMUisUiqhhwOm2RIth9jmhPtu1ed
 0XMY/2f3iXC5oVb8lMnEaEHVXXHc+Q8OJgPJtTDokJinb1UL5VUMhSKHOncKuuEg2cM3
 ByTw==
X-Gm-Message-State: ACrzQf3tVbLqhws6dYEl7Vj/ac/CLfbyzeupQi92xCEbXHHsDnpDAmuJ
 CAtpJGcgOYl89TM9YrSk/fz1LLYhL5X13MgM
X-Google-Smtp-Source: AMsMyM72HnIXeDGad6DAPvg9kDVt6PtaUSkj81g4Jo8nOwbBsgfeM80bZTOmBx9gY9mNwmOpnCL1iA==
X-Received: by 2002:a63:6a48:0:b0:43a:18ce:4e08 with SMTP id
 f69-20020a636a48000000b0043a18ce4e08mr36180789pgc.432.1666750593595; 
 Tue, 25 Oct 2022 19:16:33 -0700 (PDT)
Received: from stoup.hotspotlogin.services ([103.100.225.182])
 by smtp.gmail.com with ESMTPSA id
 q18-20020a17090311d200b0018123556931sm1819732plh.204.2022.10.25.19.16.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 19:16:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 46/47] target/xtensa: Convert to tcg_ops restore_state_to_opc
Date: Wed, 26 Oct 2022 12:11:15 +1000
Message-Id: <20221026021116.1988449-47-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221026021116.1988449-1-richard.henderson@linaro.org>
References: <20221026021116.1988449-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/xtensa/cpu.c       | 10 ++++++++++
 target/xtensa/translate.c |  6 ------
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/target/xtensa/cpu.c b/target/xtensa/cpu.c
index cbbe0e84a2..09923301c4 100644
--- a/target/xtensa/cpu.c
+++ b/target/xtensa/cpu.c
@@ -51,6 +51,15 @@ static vaddr xtensa_cpu_get_pc(CPUState *cs)
     return cpu->env.pc;
 }
 
+static void xtensa_restore_state_to_opc(CPUState *cs,
+                                        const TranslationBlock *tb,
+                                        const uint64_t *data)
+{
+    XtensaCPU *cpu = XTENSA_CPU(cs);
+
+    cpu->env.pc = data[0];
+}
+
 static bool xtensa_cpu_has_work(CPUState *cs)
 {
 #ifndef CONFIG_USER_ONLY
@@ -215,6 +224,7 @@ static const struct SysemuCPUOps xtensa_sysemu_ops = {
 static const struct TCGCPUOps xtensa_tcg_ops = {
     .initialize = xtensa_translate_init,
     .debug_excp_handler = xtensa_breakpoint_handler,
+    .restore_state_to_opc = xtensa_restore_state_to_opc,
 
 #ifndef CONFIG_USER_ONLY
     .tlb_fill = xtensa_cpu_tlb_fill,
diff --git a/target/xtensa/translate.c b/target/xtensa/translate.c
index bdd4690a5c..77bcd71030 100644
--- a/target/xtensa/translate.c
+++ b/target/xtensa/translate.c
@@ -1355,12 +1355,6 @@ void xtensa_cpu_dump_state(CPUState *cs, FILE *f, int flags)
     }
 }
 
-void restore_state_to_opc(CPUXtensaState *env, TranslationBlock *tb,
-                          target_ulong *data)
-{
-    env->pc = data[0];
-}
-
 static void translate_abs(DisasContext *dc, const OpcodeArg arg[],
                           const uint32_t par[])
 {
-- 
2.34.1


