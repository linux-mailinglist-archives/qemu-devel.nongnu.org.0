Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3C16CBF00
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 14:27:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ph8PS-00077N-SN; Tue, 28 Mar 2023 08:26:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ph8PQ-00076p-4I
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 08:26:40 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ph8PO-0004g1-Db
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 08:26:39 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 l15-20020a05600c4f0f00b003ef6d684102so3992415wmq.3
 for <qemu-devel@nongnu.org>; Tue, 28 Mar 2023 05:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680006397;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=kg5Dvw5prHKKRU2ljQI9Ayrsxu4xuY3RkI/AjCPe4UI=;
 b=FD/hT6YE2RwKCFKGNkMpCqvemSe6klINbwek4QuGXvuUFM+kvMdHoLOiPBQdlXvnR7
 rF0P+o5gveLm3mbT7r518cRZdem2iUZ2NAf6zIrRYe9/0oLwQjGaddYuAVVH/19kNXyV
 NKIxVrlwsg0j4U6uO/BgHC8RcT344kbTZ+ho+DNyEn3hqH8VQFRAurX7eL2hql61xfJi
 lb24AtXiYko/2+NbgTEkbV3FI8FdDbuk+uzCGytK+vPjRdPQnY5RQWIZ8+2IaFaGitIW
 Rxx5doOyXmBz546p/eonzU2D3QtwSET9z1bvHr9PK0ZIpqbE5UrhBv8P+Jhrb0M1rq8B
 +pVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680006397;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kg5Dvw5prHKKRU2ljQI9Ayrsxu4xuY3RkI/AjCPe4UI=;
 b=FBJfOnYs+g9uqRUikV681rCc8vJqhfTLqr8Y1PPi/ZU06iBmgdjj//f8DyFOjIB0Qt
 R0E7G8NIHeagy/gCTHQqK1dvifTzDCu8YzjJEIiRcWKFdYRWzd+cjsbJiACeVLx3nBpP
 6sL8QUM54KoYI4PbyNx1TlJvzS3MIZF7pXA6oEjvP4g9oAb9TVnSZfjdRTVqFVnq5ybZ
 XzWBSO272NiXawRLxqriiPWTmjv5S7kTmSwFQDgAdOQLy4zsihY0XaUO31BjQI9osR/k
 /SfI0A/qwPmKgNibfX0VkftJSZB1y6TLXoGzaiFt5E3Plu/3Ypx0d7r1o/Xvtk0SLuWD
 em9g==
X-Gm-Message-State: AO0yUKUF9lWxfMV53DmvuYJODjOdCh2i9RlrO/YCHisRGZRvpes6E+Df
 m3fX/5w53JbxRX06vzywbL4oD6DaWJYjvRvFApY=
X-Google-Smtp-Source: AK7set8Xk0vV3WohI0sQBveooPsmlpnQ/Trm2rA6QxJphDkRS+N//2kX6z9eKYOZvvwijB8SjHZVSQ==
X-Received: by 2002:a05:600c:1d10:b0:3ee:f807:bcf2 with SMTP id
 l16-20020a05600c1d1000b003eef807bcf2mr11465507wms.3.1680006396856; 
 Tue, 28 Mar 2023 05:26:36 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 m21-20020a7bcb95000000b003eeb1d6a470sm14993414wmi.13.2023.03.28.05.26.36
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Mar 2023 05:26:36 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 1/1] target/arm/gdbstub: Only advertise M-profile features if
 TCG available
Date: Tue, 28 Mar 2023 13:26:34 +0100
Message-Id: <20230328122634.2154949-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230328122634.2154949-1-peter.maydell@linaro.org>
References: <20230328122634.2154949-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
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

From: Philippe Mathieu-Daudé <philmd@linaro.org>

Cortex-M profile is only emulable from TCG accelerator. Restrict
the GDBstub features to its availability in order to avoid a link
error when TCG is not enabled:

  Undefined symbols for architecture arm64:
    "_arm_v7m_get_sp_ptr", referenced from:
        _m_sysreg_get in target_arm_gdbstub.c.o
    "_arm_v7m_mrs_control", referenced from:
        _arm_gdb_get_m_systemreg in target_arm_gdbstub.c.o
  ld: symbol(s) not found for architecture arm64
  clang: error: linker command failed with exit code 1 (use -v to see invocation)

Fixes: 7d8b28b8b5 ("target/arm: Implement gdbstub m-profile systemreg and secext")
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-id: 20230322142902.69511-3-philmd@linaro.org
[PMM: add #include since I cherry-picked this patch from the series]
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/gdbstub.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
index 3bd86cee979..13fbe9b0d7e 100644
--- a/target/arm/gdbstub.c
+++ b/target/arm/gdbstub.c
@@ -21,6 +21,7 @@
 #include "cpu.h"
 #include "exec/gdbstub.h"
 #include "gdbstub/helpers.h"
+#include "sysemu/tcg.h"
 #include "internals.h"
 #include "cpregs.h"
 
@@ -553,7 +554,7 @@ void arm_cpu_register_gdb_regs_for_features(ARMCPU *cpu)
                                      2, "arm-vfp-sysregs.xml", 0);
         }
     }
-    if (cpu_isar_feature(aa32_mve, cpu)) {
+    if (cpu_isar_feature(aa32_mve, cpu) && tcg_enabled()) {
         gdb_register_coprocessor(cs, mve_gdb_get_reg, mve_gdb_set_reg,
                                  1, "arm-m-profile-mve.xml", 0);
     }
@@ -561,7 +562,7 @@ void arm_cpu_register_gdb_regs_for_features(ARMCPU *cpu)
                              arm_gen_dynamic_sysreg_xml(cs, cs->gdb_num_regs),
                              "system-registers.xml", 0);
 
-    if (arm_feature(env, ARM_FEATURE_M)) {
+    if (arm_feature(env, ARM_FEATURE_M) && tcg_enabled()) {
         gdb_register_coprocessor(cs,
             arm_gdb_get_m_systemreg, arm_gdb_set_m_systemreg,
             arm_gen_dynamic_m_systemreg_xml(cs, cs->gdb_num_regs),
-- 
2.34.1


