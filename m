Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4056647341
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Dec 2022 16:37:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3Iw9-0003MD-Cq; Thu, 08 Dec 2022 10:35:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3Iw7-0003Ky-J1
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 10:35:47 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3Iw5-0006Hh-LF
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 10:35:47 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 f13-20020a1cc90d000000b003d08c4cf679so1295507wmb.5
 for <qemu-devel@nongnu.org>; Thu, 08 Dec 2022 07:35:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=95bE8x/teeNSfVWODs9hXIcMYWYrin/ZvMeXjp0588I=;
 b=FV4libTgSRAyEFq5Rcf7SgtXnsjGO+MuKWh6usOXAMeakrMSY0jubB0HPdlK43TlTk
 ChU5F2WAAAotEnb0MzjwpM9Kkv9eQc5zkFn1aPY9tm52lFS3tIqQHz+/N8kOk9hedUxF
 WxaM2wm3lCF3EB1d8w1tsOy1b/ExeitagmoezoLIIME5TP4cPaHv+lrmc83JnSFKjHPf
 4DRgrJhcoNOu9klvQpWLP6Y4YxCWuWWfG0EIm11zqWaBU4y7BRnrSmE+bSi1dmsRc3cY
 5lDGkibfhYhz9Pt4bqlRrYV50jnQvhW2odgBSpSpss+ixlPla0j28uTC6Hbp94q8HupO
 +HuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=95bE8x/teeNSfVWODs9hXIcMYWYrin/ZvMeXjp0588I=;
 b=j9JZ764DjsgiRdFqSHhDNnYjl84twliWIrPN+l3KVFgDKG4AEMb+A7yntf+2w+9L1P
 r3F4/hSgYp4VBgv54dnTq+49PnSFPEmqPIpj7H68lqnx1614bdd3YvxfFdNGCrQFlq3i
 /hA7UK0o8rX/CPrPmD9CtEH4kpBGssZbIxhjHrsVhwxwpVxXv4Xfp2DeFZINIVpOTpBv
 hyDe4Iljp965dm8cbKV+MLGCf/i349zA+IU/Fk2AoPJ7k0BffF76RCbJdbh6sOqn0VDG
 tG1KBlJphwjPqJXMiMk+UP/Go7d6jita8ZXRK/dPDKVJALXtqz5bUfkLZSK9THtTizpe
 J65Q==
X-Gm-Message-State: ANoB5pn8h+pVLU6C2KP7ouovDGQKJyPbMeYWLOXC9hRkAJTfC2FFX1Pa
 Xb7O53pRKPJKBWBK0T9t6mtws8XJC0RafeoJRI0=
X-Google-Smtp-Source: AA0mqf53N8sl4xU/kSuL6JcudDZFzJTghUYEdFZkAtJt+ErnWadY+658T57/NW3q5h7ltVHwELEvHw==
X-Received: by 2002:a05:600c:4f16:b0:3c6:e62e:2e67 with SMTP id
 l22-20020a05600c4f1600b003c6e62e2e67mr2265941wmq.2.1670513744109; 
 Thu, 08 Dec 2022 07:35:44 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 k32-20020a05600c1ca000b003b4ff30e566sm12225493wms.3.2022.12.08.07.35.42
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 08 Dec 2022 07:35:43 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>, Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, kvm@vger.kernel.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stafford Horne <shorne@gmail.com>, Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>, Chris Wulff <crwulff@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Fabiano Rosas <farosas@linux.ibm.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Marek Vasut <marex@denx.de>, Max Filippov <jcmvbkbc@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Laurent Vivier <laurent@vivier.eu>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Subject: [PATCH-for-8.0 v2 2/4] gdbstub: Use vaddr type for generic
 insert/remove_breakpoint() API
Date: Thu,  8 Dec 2022 16:35:26 +0100
Message-Id: <20221208153528.27238-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221208153528.27238-1-philmd@linaro.org>
References: <20221208153528.27238-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
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

Both insert/remove_breakpoint() handlers are used in system and
user emulation. We can not use the 'hwaddr' type on user emulation,
we have to use 'vaddr' which is defined as "wide enough to contain
any #target_ulong virtual address".

gdbstub.c doesn't require to include "exec/hwaddr.h" anymore.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 accel/kvm/kvm-all.c        | 4 ++--
 accel/kvm/kvm-cpus.h       | 4 ++--
 accel/tcg/tcg-accel-ops.c  | 4 ++--
 gdbstub/gdbstub.c          | 1 -
 gdbstub/internals.h        | 6 ++++--
 gdbstub/softmmu.c          | 5 ++---
 gdbstub/user.c             | 5 ++---
 include/sysemu/accel-ops.h | 6 +++---
 8 files changed, 17 insertions(+), 18 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index f99b0becd8..f3b434c717 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -3219,7 +3219,7 @@ bool kvm_supports_guest_debug(void)
     return kvm_has_guest_debug;
 }
 
-int kvm_insert_breakpoint(CPUState *cpu, int type, hwaddr addr, hwaddr len)
+int kvm_insert_breakpoint(CPUState *cpu, int type, vaddr addr, vaddr len)
 {
     struct kvm_sw_breakpoint *bp;
     int err;
@@ -3257,7 +3257,7 @@ int kvm_insert_breakpoint(CPUState *cpu, int type, hwaddr addr, hwaddr len)
     return 0;
 }
 
-int kvm_remove_breakpoint(CPUState *cpu, int type, hwaddr addr, hwaddr len)
+int kvm_remove_breakpoint(CPUState *cpu, int type, vaddr addr, vaddr len)
 {
     struct kvm_sw_breakpoint *bp;
     int err;
diff --git a/accel/kvm/kvm-cpus.h b/accel/kvm/kvm-cpus.h
index fd63fe6a59..ca40add32c 100644
--- a/accel/kvm/kvm-cpus.h
+++ b/accel/kvm/kvm-cpus.h
@@ -19,8 +19,8 @@ void kvm_cpu_synchronize_post_reset(CPUState *cpu);
 void kvm_cpu_synchronize_post_init(CPUState *cpu);
 void kvm_cpu_synchronize_pre_loadvm(CPUState *cpu);
 bool kvm_supports_guest_debug(void);
-int kvm_insert_breakpoint(CPUState *cpu, int type, hwaddr addr, hwaddr len);
-int kvm_remove_breakpoint(CPUState *cpu, int type, hwaddr addr, hwaddr len);
+int kvm_insert_breakpoint(CPUState *cpu, int type, vaddr addr, vaddr len);
+int kvm_remove_breakpoint(CPUState *cpu, int type, vaddr addr, vaddr len);
 void kvm_remove_all_breakpoints(CPUState *cpu);
 
 #endif /* KVM_CPUS_H */
diff --git a/accel/tcg/tcg-accel-ops.c b/accel/tcg/tcg-accel-ops.c
index 19cbf1db3a..d9228fd403 100644
--- a/accel/tcg/tcg-accel-ops.c
+++ b/accel/tcg/tcg-accel-ops.c
@@ -116,7 +116,7 @@ static inline int xlat_gdb_type(CPUState *cpu, int gdbtype)
     return cputype;
 }
 
-static int tcg_insert_breakpoint(CPUState *cs, int type, hwaddr addr, hwaddr len)
+static int tcg_insert_breakpoint(CPUState *cs, int type, vaddr addr, vaddr len)
 {
     CPUState *cpu;
     int err = 0;
@@ -147,7 +147,7 @@ static int tcg_insert_breakpoint(CPUState *cs, int type, hwaddr addr, hwaddr len
     }
 }
 
-static int tcg_remove_breakpoint(CPUState *cs, int type, hwaddr addr, hwaddr len)
+static int tcg_remove_breakpoint(CPUState *cs, int type, vaddr addr, vaddr len)
 {
     CPUState *cpu;
     int err = 0;
diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index be88ca0d71..c3fbc31123 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -48,7 +48,6 @@
 #include "sysemu/runstate.h"
 #include "semihosting/semihost.h"
 #include "exec/exec-all.h"
-#include "exec/hwaddr.h"
 #include "sysemu/replay.h"
 
 #include "internals.h"
diff --git a/gdbstub/internals.h b/gdbstub/internals.h
index eabb0341d1..b23999f951 100644
--- a/gdbstub/internals.h
+++ b/gdbstub/internals.h
@@ -9,9 +9,11 @@
 #ifndef _INTERNALS_H_
 #define _INTERNALS_H_
 
+#include "exec/cpu-common.h"
+
 bool gdb_supports_guest_debug(void);
-int gdb_breakpoint_insert(CPUState *cs, int type, hwaddr addr, hwaddr len);
-int gdb_breakpoint_remove(CPUState *cs, int type, hwaddr addr, hwaddr len);
+int gdb_breakpoint_insert(CPUState *cs, int type, vaddr addr, vaddr len);
+int gdb_breakpoint_remove(CPUState *cs, int type, vaddr addr, vaddr len);
 void gdb_breakpoint_remove_all(CPUState *cs);
 
 #endif /* _INTERNALS_H_ */
diff --git a/gdbstub/softmmu.c b/gdbstub/softmmu.c
index f208c6cf15..129575e510 100644
--- a/gdbstub/softmmu.c
+++ b/gdbstub/softmmu.c
@@ -11,7 +11,6 @@
 
 #include "qemu/osdep.h"
 #include "exec/gdbstub.h"
-#include "exec/hwaddr.h"
 #include "sysemu/cpus.h"
 #include "internals.h"
 
@@ -24,7 +23,7 @@ bool gdb_supports_guest_debug(void)
     return false;
 }
 
-int gdb_breakpoint_insert(CPUState *cs, int type, hwaddr addr, hwaddr len)
+int gdb_breakpoint_insert(CPUState *cs, int type, vaddr addr, vaddr len)
 {
     const AccelOpsClass *ops = cpus_get_accel();
     if (ops->insert_breakpoint) {
@@ -33,7 +32,7 @@ int gdb_breakpoint_insert(CPUState *cs, int type, hwaddr addr, hwaddr len)
     return -ENOSYS;
 }
 
-int gdb_breakpoint_remove(CPUState *cs, int type, hwaddr addr, hwaddr len)
+int gdb_breakpoint_remove(CPUState *cs, int type, vaddr addr, vaddr len)
 {
     const AccelOpsClass *ops = cpus_get_accel();
     if (ops->remove_breakpoint) {
diff --git a/gdbstub/user.c b/gdbstub/user.c
index 033e5fdd71..484bd8f461 100644
--- a/gdbstub/user.c
+++ b/gdbstub/user.c
@@ -9,7 +9,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "exec/hwaddr.h"
 #include "exec/gdbstub.h"
 #include "hw/core/cpu.h"
 #include "internals.h"
@@ -20,7 +19,7 @@ bool gdb_supports_guest_debug(void)
     return true;
 }
 
-int gdb_breakpoint_insert(CPUState *cs, int type, hwaddr addr, hwaddr len)
+int gdb_breakpoint_insert(CPUState *cs, int type, vaddr addr, vaddr len)
 {
     CPUState *cpu;
     int err = 0;
@@ -41,7 +40,7 @@ int gdb_breakpoint_insert(CPUState *cs, int type, hwaddr addr, hwaddr len)
     }
 }
 
-int gdb_breakpoint_remove(CPUState *cs, int type, hwaddr addr, hwaddr len)
+int gdb_breakpoint_remove(CPUState *cs, int type, vaddr addr, vaddr len)
 {
     CPUState *cpu;
     int err = 0;
diff --git a/include/sysemu/accel-ops.h b/include/sysemu/accel-ops.h
index 8cc7996def..30690c71bd 100644
--- a/include/sysemu/accel-ops.h
+++ b/include/sysemu/accel-ops.h
@@ -10,7 +10,7 @@
 #ifndef ACCEL_OPS_H
 #define ACCEL_OPS_H
 
-#include "exec/hwaddr.h"
+#include "exec/cpu-common.h"
 #include "qom/object.h"
 
 #define ACCEL_OPS_SUFFIX "-ops"
@@ -48,8 +48,8 @@ struct AccelOpsClass {
 
     /* gdbstub hooks */
     bool (*supports_guest_debug)(void);
-    int (*insert_breakpoint)(CPUState *cpu, int type, hwaddr addr, hwaddr len);
-    int (*remove_breakpoint)(CPUState *cpu, int type, hwaddr addr, hwaddr len);
+    int (*insert_breakpoint)(CPUState *cpu, int type, vaddr addr, vaddr len);
+    int (*remove_breakpoint)(CPUState *cpu, int type, vaddr addr, vaddr len);
     void (*remove_all_breakpoints)(CPUState *cpu);
 };
 
-- 
2.38.1


