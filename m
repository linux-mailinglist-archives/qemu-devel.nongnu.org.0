Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E378418347
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Sep 2021 17:37:15 +0200 (CEST)
Received: from localhost ([::1]:40880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mU9jm-0005BT-DP
	for lists+qemu-devel@lfdr.de; Sat, 25 Sep 2021 11:37:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU940-0003Pj-Ob
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 10:54:04 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:42934)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU93z-00073n-8B
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 10:54:04 -0400
Received: by mail-wr1-x434.google.com with SMTP id i24so20541724wrc.9
 for <qemu-devel@nongnu.org>; Sat, 25 Sep 2021 07:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DvtLk1KDYMk4Ooy/WV4tyGGjURyvQDa7DPky1rRpIYc=;
 b=WTi905FpEEnUQcX06Ip2tGfdx6sVAeY9HE/khlNtUjaQKEDDAK5xzfNe5G+hy+wn2A
 hIxpf3e4bHJ8L9/MJmElJtEi5vR0iVva6n3Gbb96v8SsWzvGagNO8RXzJTLZmtm5kb+k
 VndcziOT8ZU3/viei6IbkXRDu4Jk28s+E5Q1jcw8NFXhtgOAeVdRX+MVt0F/ZVGwrrYK
 V0/tI57JxW/a7pvLORlrIVeKQcOUqzV0HYMDZ3FIJ9dTzXzFEtFd44E9ATmT0yCY5kN7
 goahmA8WfxSA2/CD/2KB9n2yg2BDSyuxKkvxzOpP3xV7ikGxzq1T8CKq4j0bM2ErXCUz
 zhxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=DvtLk1KDYMk4Ooy/WV4tyGGjURyvQDa7DPky1rRpIYc=;
 b=II9WccopvKzzjpgH564+EDGDkHwS2bW28nSNtTCOo219OeC+3LdGkfagbsDMvErsyA
 Z/aS6p7mecrXiN9LzpMSpaxkTEYkb6rDhzgAIcnC63osCnxoDyjYU9FsGDYDzYv7Fp9O
 CGLfXuX7YawRzu1IqAHRCWAZVY1FJFhtmhhWQPQnqdRH9Ndwo5Gqk9J9Rn9JHQcbXL3S
 6roqHdbHYWHi2KNM/LrXXdQaq21zUysVtx3uJxxqWLlwNZhuV4716npZRapJzlo3e/9Q
 GGUBLqPht81wjILTeCwsTaOxz7/YT244ujDdUPAZ+zpMVkNQS204wy0FILsDQzYvuGPJ
 iXOQ==
X-Gm-Message-State: AOAM531QK6ttRMRBzYiTenFed09TJs4O3jVPX7IyI0Eert4tE5pQqnTK
 dsTLlMi53oVzugAvf0IMlkCh4Eb7ezE=
X-Google-Smtp-Source: ABdhPJz5XHzAMYoT32gRDCI021c8L/UcZiPR82gZZ/bxBgvXUiPTwUgz93zGxW44yxkILqCsz7wqkA==
X-Received: by 2002:a05:6000:1a85:: with SMTP id
 f5mr18011282wry.25.1632581641853; 
 Sat, 25 Sep 2021 07:54:01 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 i18sm11441097wrn.64.2021.09.25.07.54.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Sep 2021 07:54:01 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 34/40] target/sh4: Restrict has_work() handler to sysemu
Date: Sat, 25 Sep 2021 16:51:12 +0200
Message-Id: <20210925145118.1361230-35-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210925145118.1361230-1-f4bug@amsat.org>
References: <20210925145118.1361230-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
 Yoshinori Sato <ysato@users.sourceforge.jp>
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


