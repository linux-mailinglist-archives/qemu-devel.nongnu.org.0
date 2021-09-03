Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C2AB4004C2
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 20:19:27 +0200 (CEST)
Received: from localhost ([::1]:54406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMDmg-0001kW-Lj
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 14:19:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mMDgp-0003m2-5n
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 14:13:24 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:45662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mMDgk-0006MP-Po
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 14:13:22 -0400
Received: by mail-wr1-x42f.google.com with SMTP id n5so9333170wro.12
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 11:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EppPF9gmmCMdwhMekRrzsNNd3QO8wwh2BBbQlYX2/OI=;
 b=VY+D4WAB0QhC+HtcsPuM5O4HHQg9qkrEd8fSw0MNPDnG0K5QQKTmWC3OJKIj4BkEKn
 dwgBIlPEubC4Mj9unZqr+IV2j+F8dKizVt7TOd68NoHD/1pdVnnvDidFkccrFr1+EyzQ
 3taxJsjeXceKmqBZ+gE8cI7STAHaLf19zaXLa/uv9UQNiEZsWh2qID19qA7OwTZKgX4N
 PmAIuaBPMcvYJxgUXCRjEmTzGmoEA7WjueS8IiLmLcrGAiClBWZoNtfKdyU0CgBIKPgG
 U1ci+026GhpuiEUBAdzLR+bJwjZAMeMYRjdhFb30JP1YbkeSdSU4pgSJFTc493mSxBci
 ynjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=EppPF9gmmCMdwhMekRrzsNNd3QO8wwh2BBbQlYX2/OI=;
 b=KFqdpCx66A9IUnSlmZ7+yax0+cYOY4fJp1McM4OpztL5aJH3VdQJPNgN74YiapVS4w
 nHRxqkvkvEWqTR1iG7soHCcqqLtvBKhZ8BHGk5d+nbqaAjbC6KuT7EFpF5C/UDUkwd5y
 heX34nxBElWndl/14zKY3ltSi2zJgnhwmcIEx+IIF3irdHL/1wOK9S7uox/UDz50l4s0
 LwqwPvYrabCDL+AtLYwP78R/PWp2mUUPfC1y0cDPSDkEJxpGZlZ/iVO03zMtVM9/3Jaw
 acUW2e34ztKPW8E6WS7ocAx1POI1qzR3SFj4BHHuL0ZL5AjbGGhVNW43wbyM82tDz5dT
 6ZzA==
X-Gm-Message-State: AOAM532pljWNCJthzxDJiJZ3AU84XxZyX2j7nckGfgnJYIP86p7yjMxb
 32Cm6aNCdpD94PyV5B5/Er09mazlK+o=
X-Google-Smtp-Source: ABdhPJzlVM+THlpDFjgdZY5rKXkxMWei6+VacROkxhuOqFlZq/oyafnXs/DhZdAEJlEkqWZ7dSzsnQ==
X-Received: by 2002:a05:6000:128d:: with SMTP id
 f13mr401940wrx.244.1630692796480; 
 Fri, 03 Sep 2021 11:13:16 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id f23sm124597wmc.3.2021.09.03.11.13.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 11:13:16 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 26/30] target/sh4: Restrict has_work() handler to sysemu
 and TCG
Date: Fri,  3 Sep 2021 20:13:08 +0200
Message-Id: <20210903181308.761050-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210902161543.417092-1-f4bug@amsat.org>
References: <20210902161543.417092-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Restrict has_work() to TCG sysemu.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/sh4/cpu.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/target/sh4/cpu.c b/target/sh4/cpu.c
index 2047742d03c..6c47d28631c 100644
--- a/target/sh4/cpu.c
+++ b/target/sh4/cpu.c
@@ -58,12 +58,15 @@ static bool superh_io_recompile_replay_branch(CPUState *cs,
     }
     return false;
 }
-#endif
 
+#if defined(CONFIG_TCG)
 static bool superh_cpu_has_work(CPUState *cs)
 {
     return cs->interrupt_request & CPU_INTERRUPT_HARD;
 }
+#endif /* CONFIG_TCG */
+
+#endif /* !CONFIG_USER_ONLY */
 
 static void superh_cpu_reset(DeviceState *dev)
 {
@@ -239,6 +242,7 @@ static const struct TCGCPUOps superh_tcg_ops = {
     .tlb_fill = superh_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+    .has_work = superh_cpu_has_work,
     .cpu_exec_interrupt = superh_cpu_exec_interrupt,
     .do_interrupt = superh_cpu_do_interrupt,
     .do_unaligned_access = superh_cpu_do_unaligned_access,
@@ -258,7 +262,6 @@ static void superh_cpu_class_init(ObjectClass *oc, void *data)
     device_class_set_parent_reset(dc, superh_cpu_reset, &scc->parent_reset);
 
     cc->class_by_name = superh_cpu_class_by_name;
-    cc->has_work = superh_cpu_has_work;
     cc->dump_state = superh_cpu_dump_state;
     cc->set_pc = superh_cpu_set_pc;
     cc->gdb_read_register = superh_cpu_gdb_read_register;
-- 
2.31.1


