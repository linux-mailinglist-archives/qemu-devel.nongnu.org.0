Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 409936A8F8E
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 04:01:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXvco-0007VV-Es; Thu, 02 Mar 2023 21:58:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXvcg-0007RS-T1
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 21:58:18 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXvce-0001ou-BT
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 21:58:18 -0500
Received: by mail-pj1-x1031.google.com with SMTP id x34so1209780pjj.0
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 18:58:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677812293;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B9W3wFs03k7dis/zJ2ZqM32MFlhRl5WhqJ+IbJHjQRQ=;
 b=AhMuzVjn+9fvkhe/m4AycOCKTsYEm/L1A0zDs4Mv5SC3NaUjvuZZ2v3LZetGiVumoR
 Ik4td76+JYrIqbDfz8I17oTdosHRo64Ztja+PdiyltSRE/d/JQh+mugpaRaaGqGRqKb/
 9HyH9ptuxonKCE9OWrCw7TSe+M0JJbmt8tKjSzlE1YkznTh807MgMYtUDTziSrrvdJ8k
 D9YjCjXGoFF9omZE9gPS13zdqPO9JE8wJ1rxQFAyimLRFbZUPgCQXz4n0elMW1YxuMqJ
 rcEaXvGRw6yW66+rac7NKHxKpHuibzhkHf8jb2HYxPTDY1Eg0hEbDFXIs6LvZyfalve4
 ifHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677812293;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B9W3wFs03k7dis/zJ2ZqM32MFlhRl5WhqJ+IbJHjQRQ=;
 b=bo/qBw1y/LyLhq1Tsw2fMADS0YHp1hqA3X//hkQYstJJVFBGY/RKsRWoaBk+d1EUSd
 jEM9a4uh7KuG/3mrX1MsgDQYSlIb7JlJMI8tSXCdCDzQOD2cXVnN3H7sTnEV6TIhOBBH
 u86qGsOYT3oNsvtDF6GKNNXjvYu4Qn4Vns6Z/kZXkUG5ppe89XUzDF0wLfH45UHcjxHx
 Nu8w+Lk5sBjU4919iaCQBAVQ8LEhHtxMi6D2SaHnUwLipck3ahXnqXBRwuKollhVbkJ4
 oN/AEv2CCclL3P+chfF7E8m+NztVVIra8tFIrHg4dtam7rHF4yUfUOXjviOopQDfapjn
 WyrA==
X-Gm-Message-State: AO0yUKVhRaUKhxTExfR4xLnoUTsbraMk0ugRRGRx7Aq2D+rJB4yuUuAF
 IZGNRKH6tjPlCPKKBE/t2lzgsnO3SbLFjb4SVGE=
X-Google-Smtp-Source: AK7set9HuFDAbdfGpP/EWbMg9cb7e0Yzsd15lT+O9mG7uMfIi8Eg7K+ThDmd6/yFTEUhfyjzRTtqGQ==
X-Received: by 2002:a17:902:740a:b0:19c:bcb1:d75c with SMTP id
 g10-20020a170902740a00b0019cbcb1d75cmr425836pll.30.1677812293548; 
 Thu, 02 Mar 2023 18:58:13 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:f3e6:4626:fbc8:b2ce])
 by smtp.gmail.com with ESMTPSA id
 e4-20020a17090301c400b001992e74d055sm372244plh.12.2023.03.02.18.58.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 18:58:13 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org
Subject: [PATCH v4.5 07/29] includes: move tb_flush into its own header
Date: Thu,  2 Mar 2023 18:57:43 -0800
Message-Id: <20230303025805.625589-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230303025805.625589-1-richard.henderson@linaro.org>
References: <20230303025805.625589-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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

From: Alex Bennée <alex.bennee@linaro.org>

This aids subsystems (like gdbstub) that want to trigger a flush
without pulling target specific headers.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

Message-Id: <20230302190846.2593720-8-alex.bennee@linaro.org>
---
 MAINTAINERS                 |  1 +
 include/exec/exec-all.h     |  1 -
 include/exec/tb-flush.h     | 26 ++++++++++++++++++++++++++
 linux-user/user-internals.h |  1 +
 accel/stubs/tcg-stub.c      |  1 +
 accel/tcg/tb-maint.c        |  1 +
 accel/tcg/translate-all.c   |  1 +
 cpu.c                       |  1 +
 gdbstub/gdbstub.c           |  2 ++
 hw/ppc/spapr_hcall.c        |  1 +
 plugins/core.c              |  1 +
 plugins/loader.c            |  2 +-
 target/alpha/sys_helper.c   |  1 +
 target/riscv/csr.c          |  1 +
 14 files changed, 39 insertions(+), 2 deletions(-)
 create mode 100644 include/exec/tb-flush.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 76662969d7..234800e3dc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -136,6 +136,7 @@ F: docs/devel/decodetree.rst
 F: docs/devel/tcg*
 F: include/exec/cpu*.h
 F: include/exec/exec-all.h
+F: include/exec/tb-flush.h
 F: include/exec/helper*.h
 F: include/sysemu/cpus.h
 F: include/sysemu/tcg.h
diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index e09254333d..ad9eb6067b 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -677,7 +677,6 @@ void tb_invalidate_phys_addr(target_ulong addr);
 #else
 void tb_invalidate_phys_addr(AddressSpace *as, hwaddr addr, MemTxAttrs attrs);
 #endif
-void tb_flush(CPUState *cpu);
 void tb_phys_invalidate(TranslationBlock *tb, tb_page_addr_t page_addr);
 void tb_invalidate_phys_range(tb_page_addr_t start, tb_page_addr_t end);
 void tb_set_jmp_target(TranslationBlock *tb, int n, uintptr_t addr);
diff --git a/include/exec/tb-flush.h b/include/exec/tb-flush.h
new file mode 100644
index 0000000000..d92d06565b
--- /dev/null
+++ b/include/exec/tb-flush.h
@@ -0,0 +1,26 @@
+/*
+ * tb-flush prototype for use by the rest of the system.
+ *
+ * Copyright (c) 2022 Linaro Ltd
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+#ifndef _TB_FLUSH_H_
+#define _TB_FLUSH_H_
+
+/**
+ * tb_flush() - flush all translation blocks
+ * @cs: CPUState (must be valid, but treated as anonymous pointer)
+ *
+ * Used to flush all the translation blocks in the system. Sometimes
+ * it is simpler to flush everything than work out which individual
+ * translations are now invalid and ensure they are not called
+ * anymore.
+ *
+ * tb_flush() takes care of running the flush in an exclusive context
+ * if it is not already running in one. This means no guest code will
+ * run until this complete.
+ */
+void tb_flush(CPUState *cs);
+
+#endif /* _TB_FLUSH_H_ */
diff --git a/linux-user/user-internals.h b/linux-user/user-internals.h
index 3576da413f..9333db4f51 100644
--- a/linux-user/user-internals.h
+++ b/linux-user/user-internals.h
@@ -20,6 +20,7 @@
 
 #include "exec/user/thunk.h"
 #include "exec/exec-all.h"
+#include "exec/tb-flush.h"
 #include "qemu/log.h"
 
 extern char *exec_path;
diff --git a/accel/stubs/tcg-stub.c b/accel/stubs/tcg-stub.c
index 96af23dc5d..813695b402 100644
--- a/accel/stubs/tcg-stub.c
+++ b/accel/stubs/tcg-stub.c
@@ -11,6 +11,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "exec/tb-flush.h"
 #include "exec/exec-all.h"
 
 void tb_flush(CPUState *cpu)
diff --git a/accel/tcg/tb-maint.c b/accel/tcg/tb-maint.c
index efefa08ee1..7246c1c46b 100644
--- a/accel/tcg/tb-maint.c
+++ b/accel/tcg/tb-maint.c
@@ -22,6 +22,7 @@
 #include "exec/cputlb.h"
 #include "exec/log.h"
 #include "exec/exec-all.h"
+#include "exec/tb-flush.h"
 #include "exec/translate-all.h"
 #include "sysemu/tcg.h"
 #include "tcg/tcg.h"
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 4b5abc0f44..7096e68406 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -47,6 +47,7 @@
 #include "exec/cputlb.h"
 #include "exec/translate-all.h"
 #include "exec/translator.h"
+#include "exec/tb-flush.h"
 #include "qemu/bitmap.h"
 #include "qemu/qemu-print.h"
 #include "qemu/main-loop.h"
diff --git a/cpu.c b/cpu.c
index 2e9f931249..e6abc6c76c 100644
--- a/cpu.c
+++ b/cpu.c
@@ -36,6 +36,7 @@
 #include "exec/replay-core.h"
 #include "exec/cpu-common.h"
 #include "exec/exec-all.h"
+#include "exec/tb-flush.h"
 #include "exec/translate-all.h"
 #include "exec/log.h"
 #include "hw/core/accel-cpu.h"
diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index ef506faa8e..abb1777e73 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -47,6 +47,8 @@
 #include "semihosting/semihost.h"
 #include "exec/exec-all.h"
 #include "exec/replay-core.h"
+#include "exec/tb-flush.h"
+#include "exec/hwaddr.h"
 
 #include "internals.h"
 
diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
index 925ff523cc..ec4def62f8 100644
--- a/hw/ppc/spapr_hcall.c
+++ b/hw/ppc/spapr_hcall.c
@@ -8,6 +8,7 @@
 #include "qemu/module.h"
 #include "qemu/error-report.h"
 #include "exec/exec-all.h"
+#include "exec/tb-flush.h"
 #include "helper_regs.h"
 #include "hw/ppc/ppc.h"
 #include "hw/ppc/spapr.h"
diff --git a/plugins/core.c b/plugins/core.c
index e04ffa1ba4..04632886b9 100644
--- a/plugins/core.c
+++ b/plugins/core.c
@@ -24,6 +24,7 @@
 #include "exec/cpu-common.h"
 
 #include "exec/exec-all.h"
+#include "exec/tb-flush.h"
 #include "exec/helper-proto.h"
 #include "tcg/tcg.h"
 #include "tcg/tcg-op.h"
diff --git a/plugins/loader.c b/plugins/loader.c
index 88c30bde2d..809f3f9b13 100644
--- a/plugins/loader.c
+++ b/plugins/loader.c
@@ -29,7 +29,7 @@
 #include "qemu/plugin.h"
 #include "qemu/memalign.h"
 #include "hw/core/cpu.h"
-#include "exec/exec-all.h"
+#include "exec/tb-flush.h"
 #ifndef CONFIG_USER_ONLY
 #include "hw/boards.h"
 #endif
diff --git a/target/alpha/sys_helper.c b/target/alpha/sys_helper.c
index 25f6cb8894..c83c92dd4c 100644
--- a/target/alpha/sys_helper.c
+++ b/target/alpha/sys_helper.c
@@ -20,6 +20,7 @@
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "exec/exec-all.h"
+#include "exec/tb-flush.h"
 #include "exec/helper-proto.h"
 #include "sysemu/runstate.h"
 #include "sysemu/sysemu.h"
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 1b0a0c1693..74c64d4902 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -25,6 +25,7 @@
 #include "time_helper.h"
 #include "qemu/main-loop.h"
 #include "exec/exec-all.h"
+#include "exec/tb-flush.h"
 #include "sysemu/cpu-timers.h"
 #include "qemu/guest-random.h"
 #include "qapi/error.h"
-- 
2.34.1


