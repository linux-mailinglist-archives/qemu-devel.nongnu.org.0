Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A47A3418B94
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 00:41:25 +0200 (CEST)
Received: from localhost ([::1]:54560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUcpo-000277-Mt
	for lists+qemu-devel@lfdr.de; Sun, 26 Sep 2021 18:41:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUcem-0005rF-Hb
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 18:30:00 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:36692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUcel-000796-1y
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 18:30:00 -0400
Received: by mail-wr1-x434.google.com with SMTP id g16so46525499wrb.3
 for <qemu-devel@nongnu.org>; Sun, 26 Sep 2021 15:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DvtLk1KDYMk4Ooy/WV4tyGGjURyvQDa7DPky1rRpIYc=;
 b=W/2VdD7UIKsXYPYqkrcazc7rNbJ/mpLgoXLXUg+txlI9WFcz0fACNZAn9yB1/8Y6bB
 6NpgGsj75/iqhtYvYbTDmx5S2K+MXR920Un9v/ybIc//vGmYpRrg2v2vDRT/hb0C4RMH
 XhzOawRYwTBbr4QJzwi0y/TJjtBa+U/AtVc2fLPxMwTL0CfnYP0A9gB68NPuaKRdZWbk
 JOMravckf+9qPzqGulWqE3SX8q+00u7mxnn/043Xv6GGNn39gj7WqtKMATvD/EROnDr0
 LF8/WO8VG+dvxSxKX0Ep2i93CvB1hXPS5gONei3CQJoMZyBPPgGkO/Mv/TuWYYKiyvRn
 sBfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=DvtLk1KDYMk4Ooy/WV4tyGGjURyvQDa7DPky1rRpIYc=;
 b=bCNkgxySs0NFYFZDWUlAuMQJYzN+4FXXbCtEMWY8gwITU8qcFlqDsDWhfMXncOgvj1
 QJ494t1uhrNXhgqQvI2F1OCzF8mrDQcUzBkAY1gdwUmUF+C9eGYbh0uAQt39ia4B1gZW
 CyHHopACUQ+j4hwpkQD67EZQb//SB9dQ9O+t6u2k8ovcLjl3Q0aY5biuLg+LXCSZSAq8
 FV2tQHQbF3t0YImIhQsuT+MCqECZFnLABCQRknAhT1a3hPnLZqoCwNXE+QkxlSewsjoU
 FPAQGS7DdObtS2ebh6o02U8rXsNYHgJq1BoomCmLUV0Y6FyFPrkeUMMn4R0LukFa8dER
 GrnA==
X-Gm-Message-State: AOAM532Mt/P86ggHD80V6YWEzYjvqfdOsgXzuBrz1C31PUBVlplf11SC
 UoXyYYbp6I5s9JadkS+Hhq1e9h3lVKY=
X-Google-Smtp-Source: ABdhPJxej5VdZSnQV2wrEXelcFYizHjQvmtFi1ae1nbeQOCwcYb+gp4a+cBrLXBRS7RM0pb+CH80bg==
X-Received: by 2002:a5d:5142:: with SMTP id u2mr7800603wrt.180.1632695397676; 
 Sun, 26 Sep 2021 15:29:57 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 s10sm15014717wrg.42.2021.09.26.15.29.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Sep 2021 15:29:57 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 34/40] target/sh4: Restrict has_work() handler to sysemu
Date: Mon, 27 Sep 2021 00:27:10 +0200
Message-Id: <20210926222716.1732932-35-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210926222716.1732932-1-f4bug@amsat.org>
References: <20210926222716.1732932-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
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


