Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 492176D4A8C
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 16:48:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjLSV-0003tj-3c; Mon, 03 Apr 2023 10:46:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pjLSL-0003qE-NL
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 10:46:49 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pjLSI-0001AB-Am
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 10:46:49 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 o24-20020a05600c511800b003ef59905f26so18250631wms.2
 for <qemu-devel@nongnu.org>; Mon, 03 Apr 2023 07:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680533201;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6Ioe7i1XhPEIgWa/90riLiQcGkz8VafNKw9E/yIfRNU=;
 b=pKB4oH7XnUK/z5pDpSRl7d0CU7mi8qRjxsVkhD6Z96hh5Bq3DnzBZkFMDLsxFMwXA7
 FuE0yFP5DOTVxmKBGiyrPFWBwCsJOLf8dmhLgI0k/Lh8dQDDrf7CY9vLLAcfND6yRoDM
 z9RAhLM8ZFM2lVyaa6RiWDFaSackqxlKuW+NjCwf974sXpYtoQnw+1ICsrQXby1/EuZc
 1RRz1OZtwYtdiVtCi4g+lNrmBocWEbXmsEP8lNWM7tQQDK1upOO9OjFfFa7GnXFsgw8N
 xzTNk/4EtDGzyeKaAhlhrnoD2PGPPMpxFhWVeK725PChYk624WY4DzBosFSuNr3sPx58
 n6jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680533201;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6Ioe7i1XhPEIgWa/90riLiQcGkz8VafNKw9E/yIfRNU=;
 b=xmdwyH9MnLydPIOXTnaRSvj1fqzczQUWSUwQrtHiC02NKLSSsViUMtm/DGxWOL+L7U
 lHKzSLoHE9R2wrQ9hr0G6xQPyeuduQXyUuu4dwe1VvMkOATHCoulpE/rUVUGFYQvxTBk
 WlYw9MUAwnFxdEuKxsSDyn2PnPAxHGMmipk2n9ZDwysSpF/LGDwGS7+AdxO2lbiSn/nF
 KhLID4VFuLmXIWQtCXi3KcxYzrFGslGuyRd1Yo1oikrAsshlfZXMe8SUbIaxyGb9psfH
 etviCFoPO3mw8Iqpcw54gPqQMmd3FHY5VjcClkGHMxD/vC8SveN5LDQwgiy3/gTgNrMU
 8LPg==
X-Gm-Message-State: AO0yUKViHzX981UV0Ufxz6nte00r9YNMN73ZJOcUicemYIiDi0qx2jvV
 XdkWtIMpgHq14ZSEi7+8IjnCVt5MZuAQbghXgcM=
X-Google-Smtp-Source: AK7set8lbwcmzo5JVhpCyds7XlWC/sJf+6pLXR2d3wPBtfrOmynZ7kfdBioNbKU487+oazhJz7oA1w==
X-Received: by 2002:a7b:c8c4:0:b0:3ed:b590:96e6 with SMTP id
 f4-20020a7bc8c4000000b003edb59096e6mr26557827wml.4.1680533201188; 
 Mon, 03 Apr 2023 07:46:41 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 p4-20020a056000018400b002c56013c07fsm9786747wrx.109.2023.04.03.07.46.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Apr 2023 07:46:40 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>,
 libvir-list@redhat.com, Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Eric Blake <eblake@redhat.com>
Subject: [PATCH v2 03/10] tcg: Use one-insn-per-tb accelerator property in
 curr_cflags()
Date: Mon,  3 Apr 2023 15:46:30 +0100
Message-Id: <20230403144637.2949366-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230403144637.2949366-1-peter.maydell@linaro.org>
References: <20230403144637.2949366-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
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

Change curr_cflags() to look at the one-insn-per-tb accelerator
property instead of the old singlestep global variable.

Since this is the final remaining use of the global, we can
delete it entirely.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
This is the "clean" way of doing it. I dunno how much of
a hot path curr_cflags is; if it's really critical we could
have a global that's private to accel/tcg/internals.h I guess.
---
 accel/tcg/internal.h      | 16 ++++++++++++++++
 include/exec/cpu-common.h |  3 ---
 accel/tcg/cpu-exec.c      |  5 +++--
 accel/tcg/tcg-all.c       | 17 -----------------
 bsd-user/main.c           |  1 -
 linux-user/main.c         |  1 -
 softmmu/globals.c         |  1 -
 7 files changed, 19 insertions(+), 25 deletions(-)

diff --git a/accel/tcg/internal.h b/accel/tcg/internal.h
index 96f198b28b4..6ea5f7a295f 100644
--- a/accel/tcg/internal.h
+++ b/accel/tcg/internal.h
@@ -10,6 +10,22 @@
 #define ACCEL_TCG_INTERNAL_H
 
 #include "exec/exec-all.h"
+#include "qemu/accel.h"
+
+struct TCGState {
+    AccelState parent_obj;
+
+    bool mttcg_enabled;
+    bool one_insn_per_tb;
+    int splitwx_enabled;
+    unsigned long tb_size;
+};
+typedef struct TCGState TCGState;
+
+#define TYPE_TCG_ACCEL ACCEL_CLASS_NAME("tcg")
+
+DECLARE_INSTANCE_CHECKER(TCGState, TCG_STATE,
+                         TYPE_TCG_ACCEL)
 
 /*
  * Access to the various translations structures need to be serialised
diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
index 6feaa40ca7b..609a29a5dc2 100644
--- a/include/exec/cpu-common.h
+++ b/include/exec/cpu-common.h
@@ -162,9 +162,6 @@ int ram_block_discard_range(RAMBlock *rb, uint64_t start, size_t length);
 int cpu_memory_rw_debug(CPUState *cpu, vaddr addr,
                         void *ptr, size_t len, bool is_write);
 
-/* vl.c */
-extern int singlestep;
-
 void list_cpus(const char *optarg);
 
 #endif /* CPU_COMMON_H */
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index c815f2dbfdf..1ed3878b6b7 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -149,17 +149,18 @@ static void init_delay_params(SyncClocks *sc, const CPUState *cpu)
 uint32_t curr_cflags(CPUState *cpu)
 {
     uint32_t cflags = cpu->tcg_cflags;
+    TCGState *tcgstate = TCG_STATE(current_accel());
 
     /*
      * Record gdb single-step.  We should be exiting the TB by raising
      * EXCP_DEBUG, but to simplify other tests, disable chaining too.
      *
-     * For singlestep and -d nochain, suppress goto_tb so that
+     * For one-insn-per-tb and -d nochain, suppress goto_tb so that
      * we can log -d cpu,exec after every TB.
      */
     if (unlikely(cpu->singlestep_enabled)) {
         cflags |= CF_NO_GOTO_TB | CF_NO_GOTO_PTR | CF_SINGLE_STEP | 1;
-    } else if (singlestep) {
+    } else if (tcgstate->one_insn_per_tb) {
         cflags |= CF_NO_GOTO_TB | 1;
     } else if (qemu_loglevel_mask(CPU_LOG_TB_NOCHAIN)) {
         cflags |= CF_NO_GOTO_TB;
diff --git a/accel/tcg/tcg-all.c b/accel/tcg/tcg-all.c
index fcf361c8db6..7c4f9f34d39 100644
--- a/accel/tcg/tcg-all.c
+++ b/accel/tcg/tcg-all.c
@@ -38,21 +38,6 @@
 #endif
 #include "internal.h"
 
-struct TCGState {
-    AccelState parent_obj;
-
-    bool mttcg_enabled;
-    bool one_insn_per_tb;
-    int splitwx_enabled;
-    unsigned long tb_size;
-};
-typedef struct TCGState TCGState;
-
-#define TYPE_TCG_ACCEL ACCEL_CLASS_NAME("tcg")
-
-DECLARE_INSTANCE_CHECKER(TCGState, TCG_STATE,
-                         TYPE_TCG_ACCEL)
-
 /*
  * We default to false if we know other options have been enabled
  * which are currently incompatible with MTTCG. Otherwise when each
@@ -219,8 +204,6 @@ static void tcg_set_one_insn_per_tb(Object *obj, bool value, Error **errp)
 {
     TCGState *s = TCG_STATE(obj);
     s->one_insn_per_tb = value;
-    /* For the moment, set the global also: this changes the behaviour */
-    singlestep = value;
 }
 
 static int tcg_gdbstub_supported_sstep_flags(void)
diff --git a/bsd-user/main.c b/bsd-user/main.c
index 09b84da190c..a9e5a127d38 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -49,7 +49,6 @@
 #include "host-os.h"
 #include "target_arch_cpu.h"
 
-int singlestep;
 static bool opt_one_insn_per_tb;
 uintptr_t guest_base;
 bool have_guest_base;
diff --git a/linux-user/main.c b/linux-user/main.c
index 489694ad654..c7020b413bc 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -68,7 +68,6 @@
 char *exec_path;
 char real_exec_path[PATH_MAX];
 
-int singlestep;
 static bool opt_one_insn_per_tb;
 static const char *argv0;
 static const char *gdbstub;
diff --git a/softmmu/globals.c b/softmmu/globals.c
index 39678aa8c58..e83b5428d12 100644
--- a/softmmu/globals.c
+++ b/softmmu/globals.c
@@ -43,7 +43,6 @@ int vga_interface_type = VGA_NONE;
 bool vga_interface_created;
 Chardev *parallel_hds[MAX_PARALLEL_PORTS];
 int win2k_install_hack;
-int singlestep;
 int fd_bootchk = 1;
 int graphic_rotate;
 QEMUOptionRom option_rom[MAX_OPTION_ROMS];
-- 
2.34.1


