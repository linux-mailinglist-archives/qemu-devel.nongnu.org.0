Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2768E2D0827
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 00:43:35 +0100 (CET)
Received: from localhost ([::1]:44168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1km3gk-0007Wk-3t
	for lists+qemu-devel@lfdr.de; Sun, 06 Dec 2020 18:43:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1km3dL-00058M-Vi
 for qemu-devel@nongnu.org; Sun, 06 Dec 2020 18:40:04 -0500
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:35590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1km3dH-0007Pf-6q
 for qemu-devel@nongnu.org; Sun, 06 Dec 2020 18:40:01 -0500
Received: by mail-wm1-x344.google.com with SMTP id e25so12105439wme.0
 for <qemu-devel@nongnu.org>; Sun, 06 Dec 2020 15:39:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=k2eeYOSwnhkGWaF7Gqxwyv5DCY5GnWH/sPRKUd7DVSw=;
 b=lCV2tVlTBuYcB4tKKpyVcUZy/dLgDw+fUlNSeB8cvB+ESWGUKwbBTmkJ9hSkZxaaLj
 gzZNP95EGEBFqJtamjQICHTD7pQe6Brz85Df8Miuns1r2Qmua1gMgWA7Dxfn8LAHXzwI
 7SkpOkiwubtSKtkoqhR4BBr5TSsCjl5kPaq7g7M7wyQ8UjYtS1uw3SsWfMr/AhL+FrlG
 YA49GUPLOV2H3wYgykcJcK28LQcDJhoItqoP2Wi2HiAgfvpUjw7EFMpZ6/B46cxfQE0W
 629C1e2wy/sm6XEp9hrkrAv3qTp7Ye5JCxZUxOwTRL869MEaf/eeiJPwjSVcl840NXGm
 zwew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=k2eeYOSwnhkGWaF7Gqxwyv5DCY5GnWH/sPRKUd7DVSw=;
 b=JbApbFN+KTalFrz+DwTDJHJdbliEy4wiNyzOXNDzbZ7aAxtJdfoh1VxbB2iAFjHJup
 pEru6k/v5sYHwvp6LcwTP55P+LI36y/FDvEo30Wvrp45PKEIwRJ524vL6N+ypjlFQ9HF
 rcwtyuotSkebw03j2yvaOHUW0w8KLUymNOuH4DZZijfm7p9zlsML6XJ1VNiUH1k+lADG
 Dak2eR1Bpl/5VoUb9wpQRPayxTvfDJ9IZvlVC6hBtkdQkrcfQt4aDYlp6GlHgnY4fAuu
 H8Yq5CeAJGVE36ry5txrZdNs+S88XN8fG+YfgyQXUMYl+J2mICIuuRHGMD3gMiZHmWHv
 yBNQ==
X-Gm-Message-State: AOAM530tSwYtEfLob8wfsopRvTjdDuTGv1agmn5S0Qzy19vEFeydXyWE
 JIAeim6UIrrMEMjBzfTKqxNttu7h5QE=
X-Google-Smtp-Source: ABdhPJy3xT0vKlHKdf2n/udhIrOm526CJP1KpDJx6fJG7TXfFZ2bHXieBHHTpA97RbYwzkbqLswFEQ==
X-Received: by 2002:a1c:2b05:: with SMTP id r5mr15395706wmr.179.1607297997495; 
 Sun, 06 Dec 2020 15:39:57 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id n17sm3479198wmc.33.2020.12.06.15.39.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Dec 2020 15:39:56 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/19] hw/mips: Move address translation helpers to
 target/mips/
Date: Mon,  7 Dec 2020 00:39:31 +0100
Message-Id: <20201206233949.3783184-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201206233949.3783184-1-f4bug@amsat.org>
References: <20201206233949.3783184-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x344.google.com
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
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Address translation is an architectural thing (not hardware
related). Move the helpers from hw/ to target/.

As physical address and KVM are specific to system mode
emulation, restrict this file to softmmu, so it doesn't
get compiled for user-mode emulation.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/mips/cpudevs.h  | 7 -------
 target/mips/cpu.h          | 8 ++++++++
 hw/mips/boston.c           | 1 -
 {hw => target}/mips/addr.c | 2 +-
 target/mips/translate.c    | 2 --
 hw/mips/meson.build        | 2 +-
 target/mips/meson.build    | 1 +
 7 files changed, 11 insertions(+), 12 deletions(-)
 rename {hw => target}/mips/addr.c (98%)

diff --git a/include/hw/mips/cpudevs.h b/include/hw/mips/cpudevs.h
index 291f59281a0..f7c9728fa9f 100644
--- a/include/hw/mips/cpudevs.h
+++ b/include/hw/mips/cpudevs.h
@@ -5,13 +5,6 @@
 
 /* Definitions for MIPS CPU internal devices.  */
 
-/* addr.c */
-uint64_t cpu_mips_kseg0_to_phys(void *opaque, uint64_t addr);
-uint64_t cpu_mips_phys_to_kseg0(void *opaque, uint64_t addr);
-uint64_t cpu_mips_kvm_um_phys_to_kseg0(void *opaque, uint64_t addr);
-bool mips_um_ksegs_enabled(void);
-void mips_um_ksegs_enable(void);
-
 /* mips_int.c */
 void cpu_mips_irq_init_cpu(MIPSCPU *cpu);
 
diff --git a/target/mips/cpu.h b/target/mips/cpu.h
index 23f8c6f96cd..313e3252cbb 100644
--- a/target/mips/cpu.h
+++ b/target/mips/cpu.h
@@ -1290,6 +1290,14 @@ bool cpu_supports_cps_smp(const char *cpu_type);
 bool cpu_supports_isa(const char *cpu_type, uint64_t isa);
 void cpu_set_exception_base(int vp_index, target_ulong address);
 
+/* addr.c */
+uint64_t cpu_mips_kseg0_to_phys(void *opaque, uint64_t addr);
+uint64_t cpu_mips_phys_to_kseg0(void *opaque, uint64_t addr);
+
+uint64_t cpu_mips_kvm_um_phys_to_kseg0(void *opaque, uint64_t addr);
+bool mips_um_ksegs_enabled(void);
+void mips_um_ksegs_enable(void);
+
 /* mips_int.c */
 void cpu_mips_soft_irq(CPUMIPSState *env, int irq, int level);
 
diff --git a/hw/mips/boston.c b/hw/mips/boston.c
index 3d40867dc4c..91183363ff3 100644
--- a/hw/mips/boston.c
+++ b/hw/mips/boston.c
@@ -28,7 +28,6 @@
 #include "hw/loader.h"
 #include "hw/loader-fit.h"
 #include "hw/mips/cps.h"
-#include "hw/mips/cpudevs.h"
 #include "hw/pci-host/xilinx-pcie.h"
 #include "hw/qdev-clock.h"
 #include "hw/qdev-properties.h"
diff --git a/hw/mips/addr.c b/target/mips/addr.c
similarity index 98%
rename from hw/mips/addr.c
rename to target/mips/addr.c
index 2f138fe1ea8..27a6036c451 100644
--- a/hw/mips/addr.c
+++ b/target/mips/addr.c
@@ -21,7 +21,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "hw/mips/cpudevs.h"
+#include "cpu.h"
 
 static int mips_um_ksegs;
 
diff --git a/target/mips/translate.c b/target/mips/translate.c
index c64a1bc42e1..87dc38c0683 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -28,8 +28,6 @@
 #include "exec/exec-all.h"
 #include "tcg/tcg-op.h"
 #include "exec/cpu_ldst.h"
-#include "hw/mips/cpudevs.h"
-
 #include "exec/helper-proto.h"
 #include "exec/helper-gen.h"
 #include "hw/semihosting/semihost.h"
diff --git a/hw/mips/meson.build b/hw/mips/meson.build
index bcdf96be69f..77b4d8f365e 100644
--- a/hw/mips/meson.build
+++ b/hw/mips/meson.build
@@ -1,5 +1,5 @@
 mips_ss = ss.source_set()
-mips_ss.add(files('addr.c', 'mips_int.c'))
+mips_ss.add(files('mips_int.c'))
 mips_ss.add(when: 'CONFIG_FULOONG', if_true: files('fuloong2e.c'))
 mips_ss.add(when: 'CONFIG_JAZZ', if_true: files('jazz.c'))
 mips_ss.add(when: 'CONFIG_MALTA', if_true: files('gt64xxx_pci.c', 'malta.c'))
diff --git a/target/mips/meson.build b/target/mips/meson.build
index fa1f024e782..d980240f9e3 100644
--- a/target/mips/meson.build
+++ b/target/mips/meson.build
@@ -15,6 +15,7 @@
 
 mips_softmmu_ss = ss.source_set()
 mips_softmmu_ss.add(files(
+  'addr.c',
   'cp0_timer.c',
   'machine.c',
   'mips-semi.c',
-- 
2.26.2


