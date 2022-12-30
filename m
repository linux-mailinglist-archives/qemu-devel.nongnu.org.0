Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C6326593BC
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Dec 2022 01:16:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pB2rA-00031u-QK; Thu, 29 Dec 2022 19:02:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pB2r4-0002xu-64
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 19:02:34 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pB2r1-0002fp-WC
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 19:02:33 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 hd14-20020a17090b458e00b0021909875bccso19548950pjb.1
 for <qemu-devel@nongnu.org>; Thu, 29 Dec 2022 16:02:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=plDIoOrc/jMHxHch1a/joN0jkJOzT26vJ1hDyyzmh0Q=;
 b=p4u5hdCMy8oC0Ynk7f8yKar/cGWI+6wyXmZZCVKoNxQAZR4p56FhZYFnFb2Wu9GLLl
 3d/vxWSrml9v+3jOSaw3RkLSkzf4g7rQIC8NqenaLDVaJmtQBuU0jj8GPUXgtv4+k6Dz
 eF3iN2b3iJZrOeMxd3HBX7XuRHjWF2UITh4YAMhikbQSKKS3coAUiaQjYv/0UzVqOJE9
 LS/8bukLbzziUvXl17Bhg2DnpwQGbPRn8LncmtlieW7hKDaGcpa2GzFsVMZ3PRBgOSsT
 yD29g4qZcg2ODAU1yJi6u9Y8F8hT5n4oNbJIUJn8TRJPnzX4pRMsZJGriOcdpBbTRDlS
 ev6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=plDIoOrc/jMHxHch1a/joN0jkJOzT26vJ1hDyyzmh0Q=;
 b=tR/fZx5lgouzRzlFuktN7I5GsS3Foz7KN4swJ3xSQRo7LYz0aXc6dmWtIvSuDeZ4Cp
 35y/wEH+U9dkei5cMPMoizsAuweAAw7zf2tQMx6eFNlMsa+Tt9oON7jZg58ldzI3xJKZ
 qrl6ROsWe2+aa4FH5MFTJhaiU1lpYid5rMG76EVZnq2zSmDOjFLjJ1Qn1qlj4o0scHtH
 DmGQ2uiIwzGXLEPGMyabUdAghwNQlmfX4p0kXDl45OXDJJhpdsz4NPvY9/yYN0+Ghpny
 2H9AV3QddNbKLCCRYcXbzN8k/BOCIQFJ6hbvyotwwtwQxrVCVeKQhfC7JCpR2YjampMg
 kKQA==
X-Gm-Message-State: AFqh2ko6iPUFHrazszkEHR3sca+EvnSbJBrj0gf7Ee0AMi1uT6IajSkC
 NZdgpmHHJkv/MST4oQCkALISswfO1NuroHxQ
X-Google-Smtp-Source: AMrXdXvvzuTozUOrZBpAmpX8U/xmRDsvMLhR6nWnrPBhAOfqi5EtEGAh08IWFxoNbgV7FiAa5v0Vmg==
X-Received: by 2002:a17:902:aa85:b0:189:894c:6b48 with SMTP id
 d5-20020a170902aa8500b00189894c6b48mr33155026plr.59.1672358550462; 
 Thu, 29 Dec 2022 16:02:30 -0800 (PST)
Received: from stoup.. (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id
 j14-20020a170903028e00b00192849e1d0asm7343953plr.116.2022.12.29.16.02.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Dec 2022 16:02:29 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL 08/47] target/ppc: Use QEMU_IOTHREAD_LOCK_GUARD in
 cpu_interrupt_exittb
Date: Thu, 29 Dec 2022 16:01:42 -0800
Message-Id: <20221230000221.2764875-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221230000221.2764875-1-richard.henderson@linaro.org>
References: <20221230000221.2764875-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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

In addition, use tcg_enabled instead of !kvm_enabled.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/helper_regs.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/target/ppc/helper_regs.c b/target/ppc/helper_regs.c
index c0aee5855b..779e7db513 100644
--- a/target/ppc/helper_regs.c
+++ b/target/ppc/helper_regs.c
@@ -22,6 +22,7 @@
 #include "qemu/main-loop.h"
 #include "exec/exec-all.h"
 #include "sysemu/kvm.h"
+#include "sysemu/tcg.h"
 #include "helper_regs.h"
 #include "power8-pmu.h"
 #include "cpu-models.h"
@@ -203,17 +204,10 @@ void cpu_interrupt_exittb(CPUState *cs)
 {
     /*
      * We don't need to worry about translation blocks
-     * when running with KVM.
+     * unless running with TCG.
      */
-    if (kvm_enabled()) {
-        return;
-    }
-
-    if (!qemu_mutex_iothread_locked()) {
-        qemu_mutex_lock_iothread();
-        cpu_interrupt(cs, CPU_INTERRUPT_EXITTB);
-        qemu_mutex_unlock_iothread();
-    } else {
+    if (tcg_enabled()) {
+        QEMU_IOTHREAD_LOCK_GUARD();
         cpu_interrupt(cs, CPU_INTERRUPT_EXITTB);
     }
 }
-- 
2.34.1


