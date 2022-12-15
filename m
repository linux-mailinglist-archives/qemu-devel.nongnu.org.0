Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEDC664DCBA
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Dec 2022 15:10:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5ovl-0006iE-69; Thu, 15 Dec 2022 09:09:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p5ovi-0006hX-Eo
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 09:09:46 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p5ovf-0003Uh-Qc
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 09:09:45 -0500
Received: by mail-wr1-x42f.google.com with SMTP id w15so3145800wrl.9
 for <qemu-devel@nongnu.org>; Thu, 15 Dec 2022 06:09:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IMZ+stV1uoJH3nAH2hSpXARzGeX/0OMRzUJ3+eHvyM4=;
 b=Omh9Ys/ssf9EGO1E8ewR9xCAab+VLq9Fmad3719VY2+PYWc1CXM3QFp9KDVpRbHtix
 ePW1DZFg2mH5GYR6DKFsb+H/ce6jcuzSinBGK0TEIJ/yceI/G7ryXFsWiDtvsbBYh+Kz
 5EkGFzDpZgXJLCSycEBF3B0bmmAC8pr64gGZ3zfLO4iS9c+IEJgHI6j/xMOntqqqiW3l
 OJGzhXQFql4h1SstbW2wxfZI3pZ3HBqjmZhixQiyeuWTUN1ZwbZ/k4E/3pRe1seMkwZT
 VjCraZWOkh6VcJ0k87ERq/oCt98gXUAyunvEKuleDZC66FOGgOSCdCzVHjY5s3kMjYJJ
 pp9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IMZ+stV1uoJH3nAH2hSpXARzGeX/0OMRzUJ3+eHvyM4=;
 b=UoHiEhg8PBWVIV7ts9jY2yCxiqEmz57TItjDix38DOCYyofhSgcHYAz0MZ/CgZQm4A
 6t/DtwgCa69bxN+of4ZEf5wrEw5MhSiZrNNSwwmbPzaa6659dS0+SEKcz6XVCHDY0yDW
 i+8EMZZw5a+Z9NYyudQ+zEQSZ7HiecIK5yXG6yuIyCO2qsileOF+hBwhqjsb5DpCHV4g
 ZjxzpAtmtXK7Ha9IDR1uvJZi6km3fqAx9FYbJQV7dIHljlRKa4pXzhO6enDdaQSCJJJ7
 I7Ybws/feihmdFvNYaPWkLFixiCfGcrv5Za76HtcnblEqUorhEPvmVOispETndluAeeB
 gm6w==
X-Gm-Message-State: AFqh2krKVPsu+7J1MbyG1SkJugCjRRnMSQ397wOB5okB9S7cZN7bmTHt
 1pFCRIqJen2oTi7RC+nn6fxh6w==
X-Google-Smtp-Source: AMrXdXsFcodOJb3caHPq9GNm0VMGS+3qCBokPj7BMk3veoymO2Hmeel42jL0ypqafNdvq1KTmXoJ5Q==
X-Received: by 2002:adf:e991:0:b0:24a:acbe:4105 with SMTP id
 h17-20020adfe991000000b0024aacbe4105mr47770wrm.53.1671113381969; 
 Thu, 15 Dec 2022 06:09:41 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 m15-20020adfe94f000000b002365b759b65sm6128063wrn.86.2022.12.15.06.09.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Dec 2022 06:09:41 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id EFECF1FFB7;
 Thu, 15 Dec 2022 14:09:40 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Laurent Vivier <laurent@vivier.eu>, Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 qemu-ppc@nongnu.org (open list:sPAPR (pseries)),
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs)
Subject: [RFC PATCH] includes: move tb_flush into its own header
Date: Thu, 15 Dec 2022 14:09:33 +0000
Message-Id: <20221215140933.2337853-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This aids subsystems (like gdbstub) that want to trigger a flush
without pulling target specific headers.

[AJB: RFC because this is part of a larger gdbstub series but I wanted
to post for feedback in case anyone wants to suggest better naming].

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/exec/exec-all.h     | 1 -
 linux-user/user-internals.h | 1 +
 accel/tcg/tb-maint.c        | 1 +
 accel/tcg/translate-all.c   | 1 +
 cpu.c                       | 1 +
 gdbstub/gdbstub.c           | 1 +
 hw/ppc/spapr_hcall.c        | 1 +
 plugins/core.c              | 1 +
 plugins/loader.c            | 2 +-
 target/alpha/sys_helper.c   | 1 +
 target/riscv/csr.c          | 1 +
 11 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 9b7bfbf09a..6be541a85f 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -648,7 +648,6 @@ void tb_invalidate_phys_addr(target_ulong addr);
 #else
 void tb_invalidate_phys_addr(AddressSpace *as, hwaddr addr, MemTxAttrs attrs);
 #endif
-void tb_flush(CPUState *cpu);
 void tb_phys_invalidate(TranslationBlock *tb, tb_page_addr_t page_addr);
 void tb_invalidate_phys_range(tb_page_addr_t start, tb_page_addr_t end);
 void tb_set_jmp_target(TranslationBlock *tb, int n, uintptr_t addr);
diff --git a/linux-user/user-internals.h b/linux-user/user-internals.h
index 0280e76add..5ae5e47ff1 100644
--- a/linux-user/user-internals.h
+++ b/linux-user/user-internals.h
@@ -20,6 +20,7 @@
 
 #include "exec/user/thunk.h"
 #include "exec/exec-all.h"
+#include "exec/tb-common.h"
 #include "qemu/log.h"
 
 extern char *exec_path;
diff --git a/accel/tcg/tb-maint.c b/accel/tcg/tb-maint.c
index 0cdb35548c..c665626bc5 100644
--- a/accel/tcg/tb-maint.c
+++ b/accel/tcg/tb-maint.c
@@ -21,6 +21,7 @@
 #include "exec/cputlb.h"
 #include "exec/log.h"
 #include "exec/exec-all.h"
+#include "exec/tb-common.h"
 #include "exec/translate-all.h"
 #include "sysemu/tcg.h"
 #include "tcg/tcg.h"
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index ac3ee3740c..081889cc79 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -47,6 +47,7 @@
 #include "exec/cputlb.h"
 #include "exec/translate-all.h"
 #include "exec/translator.h"
+#include "exec/tb-common.h"
 #include "qemu/bitmap.h"
 #include "qemu/qemu-print.h"
 #include "qemu/timer.h"
diff --git a/cpu.c b/cpu.c
index 4a7d865427..66d64cdb79 100644
--- a/cpu.c
+++ b/cpu.c
@@ -36,6 +36,7 @@
 #include "sysemu/replay.h"
 #include "exec/cpu-common.h"
 #include "exec/exec-all.h"
+#include "exec/tb-common.h"
 #include "exec/translate-all.h"
 #include "exec/log.h"
 #include "hw/core/accel-cpu.h"
diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index bc43aaf825..6e65497a74 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -46,6 +46,7 @@
 #include "sysemu/runstate.h"
 #include "semihosting/semihost.h"
 #include "exec/exec-all.h"
+#include "exec/tb-common.h"
 #include "exec/hwaddr.h"
 #include "sysemu/replay.h"
 
diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
index 925ff523cc..7c75660d7b 100644
--- a/hw/ppc/spapr_hcall.c
+++ b/hw/ppc/spapr_hcall.c
@@ -8,6 +8,7 @@
 #include "qemu/module.h"
 #include "qemu/error-report.h"
 #include "exec/exec-all.h"
+#include "exec/tb-common.h"
 #include "helper_regs.h"
 #include "hw/ppc/ppc.h"
 #include "hw/ppc/spapr.h"
diff --git a/plugins/core.c b/plugins/core.c
index ccb770a485..1c4c9bc31e 100644
--- a/plugins/core.c
+++ b/plugins/core.c
@@ -24,6 +24,7 @@
 #include "exec/cpu-common.h"
 
 #include "exec/exec-all.h"
+#include "exec/tb-common.h"
 #include "exec/helper-proto.h"
 #include "tcg/tcg.h"
 #include "tcg/tcg-op.h"
diff --git a/plugins/loader.c b/plugins/loader.c
index 88c30bde2d..86d5bd3b22 100644
--- a/plugins/loader.c
+++ b/plugins/loader.c
@@ -29,7 +29,7 @@
 #include "qemu/plugin.h"
 #include "qemu/memalign.h"
 #include "hw/core/cpu.h"
-#include "exec/exec-all.h"
+#include "exec/tb-common.h"
 #ifndef CONFIG_USER_ONLY
 #include "hw/boards.h"
 #endif
diff --git a/target/alpha/sys_helper.c b/target/alpha/sys_helper.c
index 25f6cb8894..40a5f76c85 100644
--- a/target/alpha/sys_helper.c
+++ b/target/alpha/sys_helper.c
@@ -20,6 +20,7 @@
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "exec/exec-all.h"
+#include "exec/tb-common.h"
 #include "exec/helper-proto.h"
 #include "sysemu/runstate.h"
 #include "sysemu/sysemu.h"
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 5c9a7ee287..b2c1b59689 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -25,6 +25,7 @@
 #include "time_helper.h"
 #include "qemu/main-loop.h"
 #include "exec/exec-all.h"
+#include "exec/tb-common.h"
 #include "sysemu/cpu-timers.h"
 #include "qemu/guest-random.h"
 #include "qapi/error.h"
-- 
2.34.1


