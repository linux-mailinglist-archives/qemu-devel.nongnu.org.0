Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CACA2D908B
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Dec 2020 21:31:49 +0100 (CET)
Received: from localhost ([::1]:58704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koY20-0002SZ-8q
	for lists+qemu-devel@lfdr.de; Sun, 13 Dec 2020 15:31:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1koXrU-00024n-Sr
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 15:20:56 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:33663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1koXrT-0005Sy-CD
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 15:20:56 -0500
Received: by mail-wm1-x330.google.com with SMTP id w206so7881212wma.0
 for <qemu-devel@nongnu.org>; Sun, 13 Dec 2020 12:20:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uJl+/EeXqBxB7hfG+/ZfbRL30Nmwpy+BSYnXX9dfemM=;
 b=u0ko4PweyxhLkeeWo3yjo1wYFhxgNEC5xrZTR5djqgHZbI8mv4MheQT0hAFOCezq1y
 +t+3hg7NcxRhx5zGvUWyOQD/p4xngcgSYKQMqZfOpdvwVne724d8k7enBYPR8EEBO+Ox
 WQJBbfGqH/t/swYfHhLzKf58Gnqqduou53TdAER3Rs4MeTNB483JcdU4MHLKZRSr7Mz9
 05sglCyISn7H2VfrielSp9BMFJIzKeB03RoLFBZEbTEZ/pdDM11S49XzFQe9uadwbl88
 nZkR0X5hG4lVOf0s6Up0ZgAaMPZ7phLTFTweLuF9xF706SfIDnJYl1HfY6PkSueSwrCx
 7JAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=uJl+/EeXqBxB7hfG+/ZfbRL30Nmwpy+BSYnXX9dfemM=;
 b=TbKrw2FeGPWTXMlYNCnVuuDuAgoJ1Csj8VwKmIhsViOURM0E6SM59YYF4SFOedrv5W
 NiPfTyQoelVgpX4+8jzNp9ZA7evua0pQXsvhr2mEP8YxPu1FHSCLZlnc9Y/GJjtrCiEs
 vH5/3Dala7g8qCaeCDZwIFIpirzDzzWZhcvh44rolY4xqNqD+veDL7Vi7y/+dGKkQhy8
 8Itkf/jhmrin3KVAAkA03HjaYw7i/D7CUE6NwJQGEKkF2Zre63OsEor82atfpnR4S0Nf
 4xC7O6uWXYYfPjuYq4kFwJ5EWm7DEBL86WVDQ85cntg5XIIuof3UruOkH404AnVOP6FF
 p5EA==
X-Gm-Message-State: AOAM530uL1rOjpVXAsM4j4ROHcQeDncIf8HOrQZHwO+Ypl9aVsabE6YO
 iRTtBlUBXO7EHn9PxI67kEtebOoKhmg=
X-Google-Smtp-Source: ABdhPJwyr3Bcz0npqHp1+rzM78Aj/bFoHAUN+iHfi/EMO7r5KVcn6S69kfPOW50IF7acg/ABH6c7cA==
X-Received: by 2002:a1c:b78a:: with SMTP id
 h132mr24042122wmf.141.1607890853818; 
 Sun, 13 Dec 2020 12:20:53 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id s1sm31441773wrv.97.2020.12.13.12.20.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Dec 2020 12:20:53 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 13/26] hw/mips: Move address translation helpers to target/mips/
Date: Sun, 13 Dec 2020 21:19:33 +0100
Message-Id: <20201213201946.236123-14-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201213201946.236123-1-f4bug@amsat.org>
References: <20201213201946.236123-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paul Burton <paulburton@kernel.org>, kvm@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Address translation is an architectural thing (not hardware
related). Move the helpers from hw/ to target/.

As physical address and KVM are specific to system mode
emulation, restrict this file to softmmu, so it doesn't
get compiled for user-mode emulation.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20201206233949.3783184-2-f4bug@amsat.org>
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
index e8bca75f237..5d3b2a01c01 100644
--- a/target/mips/cpu.h
+++ b/target/mips/cpu.h
@@ -1291,6 +1291,14 @@ bool cpu_supports_isa(const CPUMIPSState *env, uint64_t isa_mask);
 bool cpu_type_supports_isa(const char *cpu_type, uint64_t isa);
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
index 16467ea4752..c3b94c68e1b 100644
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
index b8ed16bb779..4a1ae73f9d0 100644
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
index 681a5524c0e..4179395a8ea 100644
--- a/target/mips/meson.build
+++ b/target/mips/meson.build
@@ -14,6 +14,7 @@
 
 mips_softmmu_ss = ss.source_set()
 mips_softmmu_ss.add(files(
+  'addr.c',
   'cp0_helper.c',
   'cp0_timer.c',
   'machine.c',
-- 
2.26.2


