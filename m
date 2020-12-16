Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA97B2DC1C4
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 15:03:49 +0100 (CET)
Received: from localhost ([::1]:47700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpXP9-0002rd-IG
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 09:03:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kpXHF-0004xr-Ij
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 08:55:37 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:44984)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kpXHD-0000sX-06
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 08:55:37 -0500
Received: by mail-ej1-x62f.google.com with SMTP id w1so28155781ejf.11
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 05:55:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8qmwRQikb74xjNAftiZxC6fU3xdmkl7yKEzgeqPvSMw=;
 b=aaIU3yLdGAiPa5nL2yscO0wr47gzrfrrtE4sjBvsPd+li8V2BVd68uKQ1eUCB4xW8a
 Vj3Ab0aVoq1IMl/XnrxDooVxOYbLAwsdkVQGN1QSquadlyLX9+EEk6g94im0a2R9OhzY
 AWWt/FZNDe0Atkf4eQgGV0qqA9Sa0AV7TpoPcTXFXrZzzTigR75MdwZM8hog0hjUVV4T
 djgG7mx02MicagWbnWr78w/p3SlB4nLuYIXT4THDOKWKv85CYR2qI5qFDLix04aiZJ3l
 voZXEE7WrnaumgQcuunYyysdBTmpKstzh2i4tyg+UdGzQBVj0yIUQ+wUwKDsjXyvJYXF
 cktA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=8qmwRQikb74xjNAftiZxC6fU3xdmkl7yKEzgeqPvSMw=;
 b=m9LRxjtjpMEPyaDR73nA9NC/KrvLmD/rHgWp+FnTo3Zmosn+VlNiGMUrMDNJs1VswS
 ++zOkMPaj+5STNJ4cIrC0z6yl48UXKf1Mm80P9FnKFt66uyaHXqGeg8cLUw19Buj6gpv
 SsBKxKP4Ba7A9u3RwkXPeyX2SAqZ8IE/0qlhv8/EJQatxNMcsaX28KGzWNWNkapKlH2B
 uR/YZ36xjGbzOlnBKrJe0hhOepnAEh6HsSrLDSyrNPKJvF25vygOfa+x0QWtUDYDGePh
 sTvuYXnu1FeF0/Q/oO2ZPffyd2QiEHMLM45pwKy9fURoKw2iS6QFz26Qhm5DwcHm2Oob
 RlyQ==
X-Gm-Message-State: AOAM5317e7eIlRvcFJj11dcB6A2NBXL0X7iDZ4wjTL7476lM9ZP9WjeR
 OGJ/rlMk3bhQ9XFr1WD/5JS1JDYpxYM=
X-Google-Smtp-Source: ABdhPJz8CS7CDV2ogbrTuy68qSpfmb72mA1nvMHV8pCDGP+KzAPmsTi7BHcHW6w4WQUYR3xC/IJBFA==
X-Received: by 2002:a17:906:710b:: with SMTP id
 x11mr32134364ejj.433.1608126933466; 
 Wed, 16 Dec 2020 05:55:33 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id k16sm1423216ejd.78.2020.12.16.05.55.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Dec 2020 05:55:32 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] remove TCG includes from common code
Date: Wed, 16 Dec 2020 14:55:27 +0100
Message-Id: <20201216135529.265165-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201216135529.265165-1-pbonzini@redhat.com>
References: <20201216135529.265165-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: philmd@redhat.com, richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Enable removing tcg/$tcg_arch from the include path when TCG is disabled.
Move translate-all.h to include/exec, since stubs exist for the functions
defined therein.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 accel/stubs/tcg-stub.c                      | 1 -
 accel/tcg/cputlb.c                          | 2 +-
 accel/tcg/translate-all.c                   | 2 +-
 accel/tcg/user-exec.c                       | 2 +-
 cpu.c                                       | 2 +-
 hw/i386/kvmvapic.c                          | 1 -
 {accel/tcg => include/exec}/translate-all.h | 0
 monitor/misc.c                              | 1 -
 softmmu/physmem.c                           | 3 +--
 9 files changed, 5 insertions(+), 9 deletions(-)
 rename {accel/tcg => include/exec}/translate-all.h (100%)

diff --git a/accel/stubs/tcg-stub.c b/accel/stubs/tcg-stub.c
index e4bbf997aa..8c18d3eabd 100644
--- a/accel/stubs/tcg-stub.c
+++ b/accel/stubs/tcg-stub.c
@@ -12,7 +12,6 @@
 
 #include "qemu/osdep.h"
 #include "cpu.h"
-#include "tcg/tcg.h"
 #include "exec/exec-all.h"
 
 void tb_flush(CPUState *cpu)
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 42ab79c1a5..ced3dc077e 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -33,7 +33,7 @@
 #include "exec/helper-proto.h"
 #include "qemu/atomic.h"
 #include "qemu/atomic128.h"
-#include "translate-all.h"
+#include "exec/translate-all.h"
 #include "trace/trace-root.h"
 #include "trace/mem.h"
 #ifdef CONFIG_PLUGIN
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index b7d50a73d4..a1803a1026 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -49,7 +49,7 @@
 
 #include "exec/cputlb.h"
 #include "exec/tb-hash.h"
-#include "translate-all.h"
+#include "exec/translate-all.h"
 #include "qemu/bitmap.h"
 #include "qemu/error-report.h"
 #include "qemu/qemu-print.h"
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index 4ebe25461a..abb9555201 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -23,7 +23,7 @@
 #include "tcg/tcg.h"
 #include "qemu/bitops.h"
 #include "exec/cpu_ldst.h"
-#include "translate-all.h"
+#include "exec/translate-all.h"
 #include "exec/helper-proto.h"
 #include "qemu/atomic128.h"
 #include "trace/trace-root.h"
diff --git a/cpu.c b/cpu.c
index 0c485cdf2d..0b245cda2e 100644
--- a/cpu.c
+++ b/cpu.c
@@ -34,7 +34,7 @@
 #include "sysemu/tcg.h"
 #include "sysemu/kvm.h"
 #include "sysemu/replay.h"
-#include "translate-all.h"
+#include "exec/translate-all.h"
 #include "exec/log.h"
 
 uintptr_t qemu_host_page_size;
diff --git a/hw/i386/kvmvapic.c b/hw/i386/kvmvapic.c
index 077c3f4866..2c1898032e 100644
--- a/hw/i386/kvmvapic.c
+++ b/hw/i386/kvmvapic.c
@@ -21,7 +21,6 @@
 #include "hw/sysbus.h"
 #include "hw/boards.h"
 #include "migration/vmstate.h"
-#include "tcg/tcg.h"
 #include "qom/object.h"
 
 #define VAPIC_IO_PORT           0x7e
diff --git a/accel/tcg/translate-all.h b/include/exec/translate-all.h
similarity index 100%
rename from accel/tcg/translate-all.h
rename to include/exec/translate-all.h
diff --git a/monitor/misc.c b/monitor/misc.c
index fde6e36a0b..9a132f73d1 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -77,7 +77,6 @@
 #include "qapi/qmp-event.h"
 #include "sysemu/cpus.h"
 #include "qemu/cutils.h"
-#include "tcg/tcg.h"
 
 #if defined(TARGET_S390X)
 #include "hw/s390x/storage-keys.h"
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 2cd1de4a2c..67b53d39e4 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -25,7 +25,6 @@
 #include "cpu.h"
 #include "exec/exec-all.h"
 #include "exec/target_page.h"
-#include "tcg/tcg.h"
 #include "hw/qdev-core.h"
 #include "hw/qdev-properties.h"
 #include "hw/boards.h"
@@ -53,7 +52,7 @@
 
 #include "qemu/rcu_queue.h"
 #include "qemu/main-loop.h"
-#include "translate-all.h"
+#include "exec/translate-all.h"
 #include "sysemu/replay.h"
 
 #include "exec/memory-internal.h"
-- 
2.28.0



