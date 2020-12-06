Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE622D0857
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 00:57:47 +0100 (CET)
Received: from localhost ([::1]:54020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1km3uU-0006iW-5U
	for lists+qemu-devel@lfdr.de; Sun, 06 Dec 2020 18:57:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1km3eg-0006Nv-TM
 for qemu-devel@nongnu.org; Sun, 06 Dec 2020 18:41:26 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:40616)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1km3ef-00084k-GN
 for qemu-devel@nongnu.org; Sun, 06 Dec 2020 18:41:26 -0500
Received: by mail-wm1-x341.google.com with SMTP id a3so12054173wmb.5
 for <qemu-devel@nongnu.org>; Sun, 06 Dec 2020 15:41:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=n+99MQGfH3ws6+hiYTWg+4rrAybzJdIAfbn40ls3kQA=;
 b=VW7WqeZgfbUIfta173CGJdeR7dfKwzewm7EoRtrSTO3x2mRpzvi/abkbHam9G6TPmD
 fOWKGB5uSYlElBasR+JVTRkpCVm/f4pr/gp5FexX/gdYKuhCyg4/YwWL02Y4NIVN9Qvg
 mvAZRAGn7l76CGVBQIjCOWULmL75Jzm7VMVvtBzBZ1kYOqiiEU0U3jdanI7NTWe4+3mh
 1MoBYxSHGJhuoYW4J8XDLyPxiEUMMce3/BUASEjZNDYU0tBwohxoZFZy1ZGoSzAgS2Kd
 ythIuTFf8f+DcYsKh11ijcuxb1Z71ALIS3u/xf/r8xrHnJYBiSwGVX59EedQkDDqfDh1
 xFOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=n+99MQGfH3ws6+hiYTWg+4rrAybzJdIAfbn40ls3kQA=;
 b=LHFwoZhehYtUOm28e/Zd6aPZdDNcsIFIsbOng6sVynuu7rCwK1qa4dDhoIE3ok88iy
 4JQVUG//3FP+i1cvMIl5HsZVSTtx/KnwmW1iZSeUFpxHIcYUPo6cxPTzrYElJ7a72YII
 SLB1vyxlOkW9X9XD4jZis33Yn7IvUmrfjjUPKf78HZiMXFEF7EOKlslq099RY5gaCdDG
 HNTm1a/FqRCONJMDq7fzGAlqMQzW1kpdoD1PvOTJRDMQCpd9r4pWkFJcNUgI7MPu5MeY
 lulwH11iSukywPygUh1GLV+92zcFjPFaG/V4cWDPd+i7CUOElueH+CRIMmgBgVKaqWmZ
 MZAQ==
X-Gm-Message-State: AOAM533VxWFGCorjftR/Z2C3uKy6b/V7yAdXodA1j+GEvRPqFuEV7/wk
 VjfGRLYRbT757JisD8DQ8jit55VvZDg=
X-Google-Smtp-Source: ABdhPJyjns/B798+mFTm2wm7XE4zN7sKqY5G1A3JKvnUaOePKo4NsA6M8H2M1DJdBlQYE86l4bMqfQ==
X-Received: by 2002:a1c:7218:: with SMTP id n24mr15456149wmc.186.1607298084105; 
 Sun, 06 Dec 2020 15:41:24 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id c2sm13819964wrf.68.2020.12.06.15.41.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Dec 2020 15:41:23 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 18/19] target/mips: Restrict some TCG specific CPUClass
 handlers
Date: Mon,  7 Dec 2020 00:39:48 +0100
Message-Id: <20201206233949.3783184-19-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201206233949.3783184-1-f4bug@amsat.org>
References: <20201206233949.3783184-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x341.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, kvm@vger.kernel.org,
 Paul Burton <paulburton@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Restrict the following CPUClass handlers to TCG:
- do_interrupt
- do_transaction_failed
- do_unaligned_access

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Cc: Claudio Fontana <cfontana@suse.de>

 target/mips/cpu.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index 8a4486e3ea1..03bd35b7903 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -483,7 +483,6 @@ static void mips_cpu_class_init(ObjectClass *c, void *data)
 
     cc->class_by_name = mips_cpu_class_by_name;
     cc->has_work = mips_cpu_has_work;
-    cc->do_interrupt = mips_cpu_do_interrupt;
     cc->cpu_exec_interrupt = mips_cpu_exec_interrupt;
     cc->dump_state = mips_cpu_dump_state;
     cc->set_pc = mips_cpu_set_pc;
@@ -491,8 +490,7 @@ static void mips_cpu_class_init(ObjectClass *c, void *data)
     cc->gdb_read_register = mips_cpu_gdb_read_register;
     cc->gdb_write_register = mips_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
-    cc->do_transaction_failed = mips_cpu_do_transaction_failed;
-    cc->do_unaligned_access = mips_cpu_do_unaligned_access;
+    cc->do_interrupt = mips_cpu_do_interrupt;
     cc->get_phys_page_debug = mips_cpu_get_phys_page_debug;
     cc->vmsd = &vmstate_mips_cpu;
 #endif
@@ -500,6 +498,10 @@ static void mips_cpu_class_init(ObjectClass *c, void *data)
 #ifdef CONFIG_TCG
     cc->tcg_initialize = mips_tcg_init;
     cc->tlb_fill = mips_cpu_tlb_fill;
+#if !defined(CONFIG_USER_ONLY)
+    cc->do_unaligned_access = mips_cpu_do_unaligned_access;
+    cc->do_transaction_failed = mips_cpu_do_transaction_failed;
+#endif /* CONFIG_TCG && !CONFIG_USER_ONLY */
 #endif
 
     cc->gdb_num_core_regs = 73;
-- 
2.26.2


