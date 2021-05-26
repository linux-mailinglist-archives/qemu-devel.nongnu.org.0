Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C03733923AC
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 02:17:05 +0200 (CEST)
Received: from localhost ([::1]:59932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm3hw-0005Sd-RD
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 20:17:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lm3FO-0005kq-KO
 for qemu-devel@nongnu.org; Wed, 26 May 2021 19:47:34 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:38899)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lm3FI-0004Vz-Kd
 for qemu-devel@nongnu.org; Wed, 26 May 2021 19:47:34 -0400
Received: by mail-pl1-x62b.google.com with SMTP id 69so1422329plc.5
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 16:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=e6BEiCbeKFz5loqZtzxI2JeaF9i9lMWYWU5RWY4z+jo=;
 b=s0ePgidFtxmL/mVzo3BVldMMiwsrS76yEBmP2pYhvhZ5B6b1RbTeN3cx2Xyhu7c3Je
 MGzid/cWrutbXFCDzXDfu0xhnp6vBioRA0t9CHVMkywaBEAPlujNKNUdMIGgydN2ZOxm
 yRjdsMPCp+mEf5YFLdoJuev0bQvZDN7YrslHKATtCtJMoFIE2dFBN4lUT5LPkXl4WgwA
 /vyfF8IEnroT2IXi4vjEqo3eLQibcq8cXINQNErmzTIdKEQeZn5RvSIPB9SNmCDI86Ei
 7b3mYh97+/UnPgFdvXHqWdb0CfQAvKpPw4BWPGF0s34sD+wigFxyG9CQB/OYeTfdwprs
 TUHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=e6BEiCbeKFz5loqZtzxI2JeaF9i9lMWYWU5RWY4z+jo=;
 b=giKPYGV61S/qcJWburHxYD0FsU0YjgyQk5LEFTTiADc6CDMLk4flw5jJOIYtXLBqUh
 hxhMvcMu/YQqQzwhi2rT0kLNGaHewghAPfXN3KhVLdNm22CFsoiC69oD4BXGmaybvZr0
 /AFHYje4L9h98+r9AACwo3Yjgfbe+5hord4rbwC5KiEHEYUkaRmH9SP20nomZlMFda/c
 8HcIPYRkubZqZqgHl3/ZdYUlzqEkTp1TuLxxaww+NrzdpNprCiEP0o+dKQ8ITj97lBCj
 a82AeYDPyeTKXXX1DeEUZuK4sF6840/pEUuVfttZPrfwNs3qRXNRSWMk9aSOxtVcBHqD
 e1VQ==
X-Gm-Message-State: AOAM531xigTNOI08S7Eq6dsnR6fYSTThcS6rMXDH2jEeAL9Jj0/DCFkz
 BYKtwjSUYBpklxfOFWFwPVIOaWBxOtks4A==
X-Google-Smtp-Source: ABdhPJz1HCylq/hbxU+63TjDhzK+E54IWm+/QxmRPQXn6nrzPsVxgRZ8n9qF7HkeXIRuBPf6whIEFQ==
X-Received: by 2002:a17:90a:fa6:: with SMTP id 35mr685681pjz.186.1622072847280; 
 Wed, 26 May 2021 16:47:27 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id g13sm285355pfi.18.2021.05.26.16.47.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 16:47:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 18/31] cpu: Assert DeviceClass::vmsd is NULL on user emulation
Date: Wed, 26 May 2021 16:46:57 -0700
Message-Id: <20210526234710.125396-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210526234710.125396-1-richard.henderson@linaro.org>
References: <20210526234710.125396-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Migration is specific to system emulation.

Restrict current DeviceClass::vmsd to sysemu using #ifdef'ry,
and assert in cpu_exec_realizefn() that dc->vmsd not set under
user emulation.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210517105140.1062037-12-f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 cpu.c               | 2 ++
 target/sh4/cpu.c    | 5 +++--
 target/xtensa/cpu.c | 4 +++-
 3 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/cpu.c b/cpu.c
index 34a0484bf4..6fe4af2797 100644
--- a/cpu.c
+++ b/cpu.c
@@ -141,6 +141,8 @@ void cpu_exec_realizefn(CPUState *cpu, Error **errp)
 #endif /* CONFIG_TCG */
 
 #ifdef CONFIG_USER_ONLY
+    assert(qdev_get_vmsd(DEVICE(cpu)) == NULL ||
+           qdev_get_vmsd(DEVICE(cpu))->unmigratable);
     assert(cc->vmsd == NULL);
 #else
     if (qdev_get_vmsd(DEVICE(cpu)) == NULL) {
diff --git a/target/sh4/cpu.c b/target/sh4/cpu.c
index ac65c88f1f..35d4251aaf 100644
--- a/target/sh4/cpu.c
+++ b/target/sh4/cpu.c
@@ -218,10 +218,12 @@ static void superh_cpu_initfn(Object *obj)
     env->movcal_backup_tail = &(env->movcal_backup);
 }
 
+#ifndef CONFIG_USER_ONLY
 static const VMStateDescription vmstate_sh_cpu = {
     .name = "cpu",
     .unmigratable = 1,
 };
+#endif
 
 #include "hw/core/tcg-cpu-ops.h"
 
@@ -257,12 +259,11 @@ static void superh_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_write_register = superh_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_debug = superh_cpu_get_phys_page_debug;
+    dc->vmsd = &vmstate_sh_cpu;
 #endif
     cc->disas_set_info = superh_cpu_disas_set_info;
 
     cc->gdb_num_core_regs = 59;
-
-    dc->vmsd = &vmstate_sh_cpu;
     cc->tcg_ops = &superh_tcg_ops;
 }
 
diff --git a/target/xtensa/cpu.c b/target/xtensa/cpu.c
index 210ef80092..0267571fbd 100644
--- a/target/xtensa/cpu.c
+++ b/target/xtensa/cpu.c
@@ -175,10 +175,12 @@ static void xtensa_cpu_initfn(Object *obj)
 #endif
 }
 
+#ifndef CONFIG_USER_ONLY
 static const VMStateDescription vmstate_xtensa_cpu = {
     .name = "cpu",
     .unmigratable = 1,
 };
+#endif
 
 #include "hw/core/tcg-cpu-ops.h"
 
@@ -215,9 +217,9 @@ static void xtensa_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_stop_before_watchpoint = true;
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_debug = xtensa_cpu_get_phys_page_debug;
+    dc->vmsd = &vmstate_xtensa_cpu;
 #endif
     cc->disas_set_info = xtensa_cpu_disas_set_info;
-    dc->vmsd = &vmstate_xtensa_cpu;
     cc->tcg_ops = &xtensa_tcg_ops;
 }
 
-- 
2.25.1


