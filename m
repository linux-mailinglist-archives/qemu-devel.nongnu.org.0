Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D984A8F5D
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 21:48:13 +0100 (CET)
Received: from localhost ([::1]:59320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFj1Y-0005Ch-7R
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 15:48:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nFhx7-0004iI-Bw
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 14:39:34 -0500
Received: from [2607:f8b0:4864:20::634] (port=46781
 helo=mail-pl1-x634.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nFhx4-00068T-2h
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 14:39:33 -0500
Received: by mail-pl1-x634.google.com with SMTP id t9so867785plg.13
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 11:39:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=140Zx2PTc7IjmZMsxlQ0xh8PVeXybFCQMTlI38ITxCE=;
 b=FiOgDxfl5Emy6G7SfabLxVoGCeLV63ivVvDJP/CDpxGPZutYosSJhiXpgMlhTM6tGi
 0R15Pua3ePUOlERnvvMGphexlo/CrWbvz45UO7tPsiKx7ykpNbxdm4Ip2Z8fx/XPXpWP
 e3zYnj3xB58oDdNOyBPOdIsMhvrMq+4LTn1uFbczk7zBN26hkxje6vwP5IpvtVyS9WUP
 gEjzPeXpiO66f5DXpDPDGUdu9ZQVaVUC50QSDztH6kk8DqJtqR6btrgJ8MJMUj8ATIAq
 RZmr+RLTa95e8M096FeQara+e7Ow9TJ2UsXFOhGvlXR/xNn1IxlHmx0lncHXLW2xRZN3
 hDvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=140Zx2PTc7IjmZMsxlQ0xh8PVeXybFCQMTlI38ITxCE=;
 b=3bnalu5kkIVcaxDd/qYJTvQPZFXLAM0wt27ryCGFDr3LSvqCbrsWmZLrdZnjTfkLrg
 DU3c782LwqYqW+ZbPoXRosfw/fl7LJIBgQapt2VIZa8KjHZjEfo+oOKpDZPWYVNaJKUY
 wlmCgZoF/AvDsJ1+vWPDlqAgkDr8Jbc6MZx0LuW4tZE43EyiXxCRoau83K4lP6ednDxZ
 wimQGWGUA+tTRvzZrWk4D7eBC1giaWNt76jrqZ+GPcTTMyZnfyHUnhMBx+6/LML+UdIs
 imulPhygk64uWxSvC5pf5HMQRcTdxZSxUNBjRGVaDcMK6Mp3RADRu/6P+KrSmGLsmeby
 pHmA==
X-Gm-Message-State: AOAM531+qzb9urQjxk4UmkaVM4jlUWkLuVaHV+vyYmiCj7A8lgdBkMaj
 ocisc31BoRz1XTZILJ+FDJk2RikUMM8=
X-Google-Smtp-Source: ABdhPJxeAfdeJOAG26QTCaHS1SjEimJJ9EvjpPdfvv8trPISJkvBGeH8r0Wx+i9gx+uwwB0+JbTqOw==
X-Received: by 2002:a17:90b:1bc3:: with SMTP id
 oa3mr15465285pjb.172.1643917168448; 
 Thu, 03 Feb 2022 11:39:28 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id d10sm27027684pfl.16.2022.02.03.11.39.26
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 03 Feb 2022 11:39:28 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH 10/10] exec/exec-all: Move 'qemu/log.h' include in units
 requiring it
Date: Thu,  3 Feb 2022 20:38:03 +0100
Message-Id: <20220203193803.45671-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220203193803.45671-1-f4bug@amsat.org>
References: <20220203193803.45671-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::634
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x634.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

Many files use "qemu/log.h" declarations but neglect to include
it (they inherit it via "exec/exec-all.h"). "exec/exec-all.h" is
a core component and shouldn't be used that way. Move the
"qemu/log.h" inclusion locally to each unit requiring it.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 bsd-user/signal.c                       | 1 +
 hw/arm/omap1.c                          | 1 +
 hw/display/omap_dss.c                   | 1 +
 hw/gpio/omap_gpio.c                     | 1 +
 hw/input/tsc210x.c                      | 1 +
 include/exec/exec-all.h                 | 2 --
 monitor/misc.c                          | 1 +
 plugins/api.c                           | 1 +
 softmmu/runstate.c                      | 1 +
 target/alpha/helper.c                   | 2 +-
 target/arm/helper.c                     | 1 +
 target/arm/m_helper.c                   | 1 +
 target/arm/mte_helper.c                 | 1 +
 target/avr/helper.c                     | 1 +
 target/cris/helper.c                    | 1 +
 target/hexagon/internal.h               | 2 ++
 target/hppa/helper.c                    | 2 +-
 target/hppa/mem_helper.c                | 1 +
 target/hppa/op_helper.c                 | 1 +
 target/i386/helper.c                    | 1 +
 target/i386/tcg/int_helper.c            | 1 +
 target/i386/tcg/misc_helper.c           | 1 +
 target/i386/tcg/sysemu/seg_helper.c     | 1 +
 target/i386/tcg/sysemu/svm_helper.c     | 1 +
 target/m68k/op_helper.c                 | 1 +
 target/microblaze/cpu.c                 | 1 +
 target/microblaze/mmu.c                 | 1 +
 target/microblaze/op_helper.c           | 1 +
 target/mips/tcg/exception.c             | 1 +
 target/mips/tcg/sysemu/special_helper.c | 1 +
 target/mips/tcg/translate.h             | 1 +
 target/openrisc/interrupt.c             | 1 +
 target/openrisc/mmu.c                   | 1 +
 target/ppc/excp_helper.c                | 1 +
 target/ppc/misc_helper.c                | 1 +
 target/s390x/tcg/excp_helper.c          | 1 +
 target/s390x/tcg/mem_helper.c           | 1 +
 target/sparc/ldst_helper.c              | 1 +
 target/sparc/mmu_helper.c               | 1 +
 target/tricore/helper.c                 | 2 +-
 target/xtensa/dbg_helper.c              | 1 +
 target/xtensa/exc_helper.c              | 1 +
 target/xtensa/fpu_helper.c              | 1 +
 target/xtensa/helper.c                  | 1 +
 target/xtensa/mmu_helper.c              | 1 +
 target/xtensa/win_helper.c              | 1 +
 46 files changed, 46 insertions(+), 5 deletions(-)

diff --git a/bsd-user/signal.c b/bsd-user/signal.c
index 0bc6d2edbd..8a36b696d8 100644
--- a/bsd-user/signal.c
+++ b/bsd-user/signal.c
@@ -19,6 +19,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/log.h"
 #include "qemu.h"
 #include "signal-common.h"
 #include "trace.h"
diff --git a/hw/arm/omap1.c b/hw/arm/omap1.c
index 9852c2a07e..f693faa43e 100644
--- a/hw/arm/omap1.c
+++ b/hw/arm/omap1.c
@@ -18,6 +18,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/log.h"
 #include "qemu/error-report.h"
 #include "qemu/main-loop.h"
 #include "qapi/error.h"
diff --git a/hw/display/omap_dss.c b/hw/display/omap_dss.c
index 21fde58a26..8c0e9ee700 100644
--- a/hw/display/omap_dss.c
+++ b/hw/display/omap_dss.c
@@ -19,6 +19,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/log.h"
 #include "hw/hw.h"
 #include "hw/irq.h"
 #include "ui/console.h"
diff --git a/hw/gpio/omap_gpio.c b/hw/gpio/omap_gpio.c
index e25084b40c..bd0841d57f 100644
--- a/hw/gpio/omap_gpio.c
+++ b/hw/gpio/omap_gpio.c
@@ -19,6 +19,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/log.h"
 #include "hw/irq.h"
 #include "hw/qdev-properties.h"
 #include "hw/arm/omap.h"
diff --git a/hw/input/tsc210x.c b/hw/input/tsc210x.c
index 182d3725fc..b0d5c2dd74 100644
--- a/hw/input/tsc210x.c
+++ b/hw/input/tsc210x.c
@@ -20,6 +20,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/log.h"
 #include "hw/hw.h"
 #include "audio/audio.h"
 #include "qemu/timer.h"
diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 199fd49e5d..d2cb0981f4 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -39,8 +39,6 @@ typedef ram_addr_t tb_page_addr_t;
 #define TB_PAGE_ADDR_FMT RAM_ADDR_FMT
 #endif
 
-#include "qemu/log.h"
-
 void gen_intermediate_code(CPUState *cpu, TranslationBlock *tb, int max_insns);
 void restore_state_to_opc(CPUArchState *env, TranslationBlock *tb,
                           target_ulong *data);
diff --git a/monitor/misc.c b/monitor/misc.c
index a3a6e47844..b1839cb8ee 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -41,6 +41,7 @@
 #include "disas/disas.h"
 #include "sysemu/balloon.h"
 #include "qemu/timer.h"
+#include "qemu/log.h"
 #include "sysemu/hw_accel.h"
 #include "sysemu/runstate.h"
 #include "authz/list.h"
diff --git a/plugins/api.c b/plugins/api.c
index b143b09ce9..19595460fb 100644
--- a/plugins/api.c
+++ b/plugins/api.c
@@ -36,6 +36,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu/plugin.h"
+#include "qemu/log.h"
 #include "tcg/tcg.h"
 #include "exec/exec-all.h"
 #include "exec/ram_addr.h"
diff --git a/softmmu/runstate.c b/softmmu/runstate.c
index 3cb2758b33..e0d869b21a 100644
--- a/softmmu/runstate.c
+++ b/softmmu/runstate.c
@@ -42,6 +42,7 @@
 #include "qapi/qapi-events-run-state.h"
 #include "qemu-common.h"
 #include "qemu/error-report.h"
+#include "qemu/log.h"
 #include "qemu/job.h"
 #include "qemu/log.h"
 #include "qemu/module.h"
diff --git a/target/alpha/helper.c b/target/alpha/helper.c
index b7e7f73b15..dcaa2d03ad 100644
--- a/target/alpha/helper.c
+++ b/target/alpha/helper.c
@@ -18,7 +18,7 @@
  */
 
 #include "qemu/osdep.h"
-
+#include "qemu/log.h"
 #include "cpu.h"
 #include "exec/exec-all.h"
 #include "fpu/softfloat-types.h"
diff --git a/target/arm/helper.c b/target/arm/helper.c
index e39faa2a98..883ea3a4e1 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -8,6 +8,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu/units.h"
+#include "qemu/log.h"
 #include "target/arm/idau.h"
 #include "trace.h"
 #include "cpu.h"
diff --git a/target/arm/m_helper.c b/target/arm/m_helper.c
index b11e927df1..648a3b3fc1 100644
--- a/target/arm/m_helper.c
+++ b/target/arm/m_helper.c
@@ -19,6 +19,7 @@
 #include "qemu/bitops.h"
 #include "qemu/crc32c.h"
 #include "qemu/qemu-print.h"
+#include "qemu/log.h"
 #include "exec/exec-all.h"
 #include <zlib.h> /* For crc32 */
 #include "semihosting/semihost.h"
diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
index e09b7e46a2..d11a8c70d0 100644
--- a/target/arm/mte_helper.c
+++ b/target/arm/mte_helper.c
@@ -18,6 +18,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/log.h"
 #include "cpu.h"
 #include "internals.h"
 #include "exec/exec-all.h"
diff --git a/target/avr/helper.c b/target/avr/helper.c
index 981c29da45..c27f702901 100644
--- a/target/avr/helper.c
+++ b/target/avr/helper.c
@@ -19,6 +19,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/log.h"
 #include "cpu.h"
 #include "hw/core/tcg-cpu-ops.h"
 #include "exec/exec-all.h"
diff --git a/target/cris/helper.c b/target/cris/helper.c
index a0d6ecdcd3..91e4aeb178 100644
--- a/target/cris/helper.c
+++ b/target/cris/helper.c
@@ -19,6 +19,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/log.h"
 #include "cpu.h"
 #include "hw/core/tcg-cpu-ops.h"
 #include "mmu.h"
diff --git a/target/hexagon/internal.h b/target/hexagon/internal.h
index 82ac3042ab..b1bfadc3f5 100644
--- a/target/hexagon/internal.h
+++ b/target/hexagon/internal.h
@@ -18,6 +18,8 @@
 #ifndef HEXAGON_INTERNAL_H
 #define HEXAGON_INTERNAL_H
 
+#include "qemu/log.h"
+
 /*
  * Change HEX_DEBUG to 1 to turn on debugging output
  */
diff --git a/target/hppa/helper.c b/target/hppa/helper.c
index 1ccff5765a..e2758d8df3 100644
--- a/target/hppa/helper.c
+++ b/target/hppa/helper.c
@@ -18,7 +18,7 @@
  */
 
 #include "qemu/osdep.h"
-
+#include "qemu/log.h"
 #include "cpu.h"
 #include "fpu/softfloat.h"
 #include "exec/exec-all.h"
diff --git a/target/hppa/mem_helper.c b/target/hppa/mem_helper.c
index bf07445cd1..5046cc8f9d 100644
--- a/target/hppa/mem_helper.c
+++ b/target/hppa/mem_helper.c
@@ -18,6 +18,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/log.h"
 #include "cpu.h"
 #include "exec/exec-all.h"
 #include "exec/helper-proto.h"
diff --git a/target/hppa/op_helper.c b/target/hppa/op_helper.c
index b0dec4ebf4..2810361be0 100644
--- a/target/hppa/op_helper.c
+++ b/target/hppa/op_helper.c
@@ -18,6 +18,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/log.h"
 #include "cpu.h"
 #include "exec/exec-all.h"
 #include "exec/helper-proto.h"
diff --git a/target/i386/helper.c b/target/i386/helper.c
index 533b29cb91..0639aea11b 100644
--- a/target/i386/helper.c
+++ b/target/i386/helper.c
@@ -27,6 +27,7 @@
 #include "sysemu/hw_accel.h"
 #include "monitor/monitor.h"
 #endif
+#include "qemu/log.h"
 
 void cpu_sync_bndcs_hflags(CPUX86State *env)
 {
diff --git a/target/i386/tcg/int_helper.c b/target/i386/tcg/int_helper.c
index 87fa7280ee..599ac968b0 100644
--- a/target/i386/tcg/int_helper.c
+++ b/target/i386/tcg/int_helper.c
@@ -18,6 +18,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/log.h"
 #include "cpu.h"
 #include "exec/exec-all.h"
 #include "qemu/host-utils.h"
diff --git a/target/i386/tcg/misc_helper.c b/target/i386/tcg/misc_helper.c
index 5769db5ace..24a0eaa3d5 100644
--- a/target/i386/tcg/misc_helper.c
+++ b/target/i386/tcg/misc_helper.c
@@ -18,6 +18,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/log.h"
 #include "cpu.h"
 #include "exec/helper-proto.h"
 #include "exec/exec-all.h"
diff --git a/target/i386/tcg/sysemu/seg_helper.c b/target/i386/tcg/sysemu/seg_helper.c
index bf3444c26b..83aa229acd 100644
--- a/target/i386/tcg/sysemu/seg_helper.c
+++ b/target/i386/tcg/sysemu/seg_helper.c
@@ -19,6 +19,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/log.h"
 #include "cpu.h"
 #include "exec/helper-proto.h"
 #include "exec/cpu_ldst.h"
diff --git a/target/i386/tcg/sysemu/svm_helper.c b/target/i386/tcg/sysemu/svm_helper.c
index 6d39611eb6..2b6f450af9 100644
--- a/target/i386/tcg/sysemu/svm_helper.c
+++ b/target/i386/tcg/sysemu/svm_helper.c
@@ -18,6 +18,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/log.h"
 #include "cpu.h"
 #include "exec/helper-proto.h"
 #include "exec/exec-all.h"
diff --git a/target/m68k/op_helper.c b/target/m68k/op_helper.c
index acbd473515..8decc61240 100644
--- a/target/m68k/op_helper.c
+++ b/target/m68k/op_helper.c
@@ -17,6 +17,7 @@
  * License along with this library; if not, see <http://www.gnu.org/licenses/>.
  */
 #include "qemu/osdep.h"
+#include "qemu/log.h"
 #include "cpu.h"
 #include "exec/helper-proto.h"
 #include "exec/exec-all.h"
diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
index b9c888b87e..aed200dcff 100644
--- a/target/microblaze/cpu.c
+++ b/target/microblaze/cpu.c
@@ -22,6 +22,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/log.h"
 #include "qapi/error.h"
 #include "cpu.h"
 #include "qemu/module.h"
diff --git a/target/microblaze/mmu.c b/target/microblaze/mmu.c
index cc40f275ea..75651979a9 100644
--- a/target/microblaze/mmu.c
+++ b/target/microblaze/mmu.c
@@ -19,6 +19,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/log.h"
 #include "cpu.h"
 #include "exec/exec-all.h"
 
diff --git a/target/microblaze/op_helper.c b/target/microblaze/op_helper.c
index 58d633584d..5b745d0928 100644
--- a/target/microblaze/op_helper.c
+++ b/target/microblaze/op_helper.c
@@ -19,6 +19,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/log.h"
 #include "cpu.h"
 #include "exec/helper-proto.h"
 #include "qemu/host-utils.h"
diff --git a/target/mips/tcg/exception.c b/target/mips/tcg/exception.c
index 7b3026b105..0b21e0872b 100644
--- a/target/mips/tcg/exception.c
+++ b/target/mips/tcg/exception.c
@@ -19,6 +19,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/log.h"
 #include "cpu.h"
 #include "internal.h"
 #include "exec/helper-proto.h"
diff --git a/target/mips/tcg/sysemu/special_helper.c b/target/mips/tcg/sysemu/special_helper.c
index 2a2afb49e8..f4f8fe8afc 100644
--- a/target/mips/tcg/sysemu/special_helper.c
+++ b/target/mips/tcg/sysemu/special_helper.c
@@ -19,6 +19,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/log.h"
 #include "cpu.h"
 #include "exec/helper-proto.h"
 #include "exec/exec-all.h"
diff --git a/target/mips/tcg/translate.h b/target/mips/tcg/translate.h
index ae01515efe..9997fe2f3c 100644
--- a/target/mips/tcg/translate.h
+++ b/target/mips/tcg/translate.h
@@ -8,6 +8,7 @@
 #ifndef TARGET_MIPS_TRANSLATE_H
 #define TARGET_MIPS_TRANSLATE_H
 
+#include "qemu/log.h"
 #include "exec/translator.h"
 
 #define MIPS_DEBUG_DISAS 0
diff --git a/target/openrisc/interrupt.c b/target/openrisc/interrupt.c
index 19223e3f25..e5724f5371 100644
--- a/target/openrisc/interrupt.c
+++ b/target/openrisc/interrupt.c
@@ -18,6 +18,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/log.h"
 #include "cpu.h"
 #include "exec/exec-all.h"
 #include "exec/gdbstub.h"
diff --git a/target/openrisc/mmu.c b/target/openrisc/mmu.c
index e561ef245b..d7e1320998 100644
--- a/target/openrisc/mmu.c
+++ b/target/openrisc/mmu.c
@@ -19,6 +19,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/log.h"
 #include "cpu.h"
 #include "exec/exec-all.h"
 #include "exec/gdbstub.h"
diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index c107953dec..cbac63d53c 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -18,6 +18,7 @@
  */
 #include "qemu/osdep.h"
 #include "qemu/main-loop.h"
+#include "qemu/log.h"
 #include "cpu.h"
 #include "exec/exec-all.h"
 #include "internal.h"
diff --git a/target/ppc/misc_helper.c b/target/ppc/misc_helper.c
index 1bcefa7c84..129432be01 100644
--- a/target/ppc/misc_helper.c
+++ b/target/ppc/misc_helper.c
@@ -18,6 +18,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/log.h"
 #include "cpu.h"
 #include "exec/exec-all.h"
 #include "exec/helper-proto.h"
diff --git a/target/s390x/tcg/excp_helper.c b/target/s390x/tcg/excp_helper.c
index 4e7648f301..be6c966cfa 100644
--- a/target/s390x/tcg/excp_helper.c
+++ b/target/s390x/tcg/excp_helper.c
@@ -19,6 +19,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/log.h"
 #include "cpu.h"
 #include "s390x-internal.h"
 #include "exec/helper-proto.h"
diff --git a/target/s390x/tcg/mem_helper.c b/target/s390x/tcg/mem_helper.c
index 406578d105..b5523ef3c7 100644
--- a/target/s390x/tcg/mem_helper.c
+++ b/target/s390x/tcg/mem_helper.c
@@ -19,6 +19,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/log.h"
 #include "cpu.h"
 #include "s390x-internal.h"
 #include "tcg_s390x.h"
diff --git a/target/sparc/ldst_helper.c b/target/sparc/ldst_helper.c
index a3e1cf9b6e..ec4fae78c3 100644
--- a/target/sparc/ldst_helper.c
+++ b/target/sparc/ldst_helper.c
@@ -18,6 +18,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/log.h"
 #include "cpu.h"
 #include "tcg/tcg.h"
 #include "exec/helper-proto.h"
diff --git a/target/sparc/mmu_helper.c b/target/sparc/mmu_helper.c
index f2668389b0..346a6dfa35 100644
--- a/target/sparc/mmu_helper.c
+++ b/target/sparc/mmu_helper.c
@@ -18,6 +18,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/log.h"
 #include "cpu.h"
 #include "exec/exec-all.h"
 #include "qemu/qemu-print.h"
diff --git a/target/tricore/helper.c b/target/tricore/helper.c
index c5e997f321..1db32808e8 100644
--- a/target/tricore/helper.c
+++ b/target/tricore/helper.c
@@ -16,7 +16,7 @@
  */
 
 #include "qemu/osdep.h"
-
+#include "qemu/log.h"
 #include "cpu.h"
 #include "exec/exec-all.h"
 #include "fpu/softfloat-helpers.h"
diff --git a/target/xtensa/dbg_helper.c b/target/xtensa/dbg_helper.c
index be1f81107b..ce2a820c60 100644
--- a/target/xtensa/dbg_helper.c
+++ b/target/xtensa/dbg_helper.c
@@ -26,6 +26,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/log.h"
 #include "qemu/main-loop.h"
 #include "cpu.h"
 #include "exec/helper-proto.h"
diff --git a/target/xtensa/exc_helper.c b/target/xtensa/exc_helper.c
index 9bc7f50d35..d4823a65cd 100644
--- a/target/xtensa/exc_helper.c
+++ b/target/xtensa/exc_helper.c
@@ -26,6 +26,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/log.h"
 #include "qemu/main-loop.h"
 #include "cpu.h"
 #include "exec/helper-proto.h"
diff --git a/target/xtensa/fpu_helper.c b/target/xtensa/fpu_helper.c
index ba3c29d19d..d2a10cc797 100644
--- a/target/xtensa/fpu_helper.c
+++ b/target/xtensa/fpu_helper.c
@@ -26,6 +26,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/log.h"
 #include "qemu/main-loop.h"
 #include "cpu.h"
 #include "exec/helper-proto.h"
diff --git a/target/xtensa/helper.c b/target/xtensa/helper.c
index 29d216ec1b..e0a9caab4b 100644
--- a/target/xtensa/helper.c
+++ b/target/xtensa/helper.c
@@ -26,6 +26,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/log.h"
 #include "cpu.h"
 #include "exec/exec-all.h"
 #include "exec/gdbstub.h"
diff --git a/target/xtensa/mmu_helper.c b/target/xtensa/mmu_helper.c
index 57e319a1af..fa66e8e867 100644
--- a/target/xtensa/mmu_helper.c
+++ b/target/xtensa/mmu_helper.c
@@ -26,6 +26,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/log.h"
 #include "qemu/main-loop.h"
 #include "qemu/qemu-print.h"
 #include "qemu/units.h"
diff --git a/target/xtensa/win_helper.c b/target/xtensa/win_helper.c
index f6f96a64c3..5a1555360a 100644
--- a/target/xtensa/win_helper.c
+++ b/target/xtensa/win_helper.c
@@ -26,6 +26,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/log.h"
 #include "qemu/main-loop.h"
 #include "cpu.h"
 #include "exec/helper-proto.h"
-- 
2.34.1


