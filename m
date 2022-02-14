Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AFA94B5A47
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 19:58:29 +0100 (CET)
Received: from localhost ([::1]:47874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJgYO-0001yE-44
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 13:58:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJg9v-0000Go-FA
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 13:33:13 -0500
Received: from [2607:f8b0:4864:20::102b] (port=37703
 helo=mail-pj1-x102b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJg9t-0002dp-AH
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 13:33:10 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 v5-20020a17090a4ec500b001b8b702df57so19727984pjl.2
 for <qemu-devel@nongnu.org>; Mon, 14 Feb 2022 10:33:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=e8DQWHfKGeT/pxGHQ+jFVIO6FZ9E+wxAU1QxxX34iiM=;
 b=JRa/93PRH+4QkioDUHXID9HJ+aOolfb7Xxd1W8GU7EtAZ8zLGVQLgCkPvSwRcTHkXH
 zrfRu2Fz6agipxylbS+8LMY6b0cqKCeQM3XC6ufoERwql+MHhBX4K7yLANEF5fVGafbB
 nROCRrtD2Aco8JX339PN0OtTPM/mkLhOH4+We3plNJndTp+XZh/X3PVTcbGehYw+30wP
 jQS9FRJvbchZPbti5c/fhMREbNUimonF/l/up1AM5kRFpMyzO8bS+hpfOK4DnUAYZy9U
 CxvIAAaBy8F2B70Apa9a9ZShwVhe75AqBiTDxaKc1yypupcZmirfDh659QQ8Nie9ks8/
 B4aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=e8DQWHfKGeT/pxGHQ+jFVIO6FZ9E+wxAU1QxxX34iiM=;
 b=sQfiXXZoXEDDC12Et6I1MXfnVgrwc1pQzTX/T7R27QOro3EyAVwvFAy84f2puivMf0
 j4l0i54XE1Et9+DVZ1h3KF8CHvFrgsYKo/Ld5aDfrLAX5aiKnF+8dpi6yPAQjh/pm9rC
 tu0iArlGJrI6Rn3YOIkBSHuUneahwpwJ4EqW0YGDwwgwwLwMT5aT7YMqqXwpai4GcjIy
 HhCTcO+aMo9J43Xb2huPZYs5dIR+yL8VaWZ+0lBLCb7gTCaMdLAAgjjbfPPAnpQO4ov6
 ufmbSFALh+UvcNkLDX3LJzx5dBsiT2kLMwCNa8y7DuZT7uGs9EkCpUCri8HxLplX8Wnh
 HvUg==
X-Gm-Message-State: AOAM533HTHlAGYkRh6tHSE0CKAnu/z4eeG32dQXfL4JrCgW9Ovp97A/k
 hIGwi4XWrm8BLwE5N664j5tM2t5Y7fM=
X-Google-Smtp-Source: ABdhPJwxPdH7x1B82t2jUHAUleQ2Zkr1GPDSxqlI2BlBmRr26Mis3clN1cSVXoVsMhaYS37ZcJ3vow==
X-Received: by 2002:a17:90a:1c4:: with SMTP id 4mr1089715pjd.109.1644863586806; 
 Mon, 14 Feb 2022 10:33:06 -0800 (PST)
Received: from localhost.localdomain (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71])
 by smtp.gmail.com with ESMTPSA id u17sm28431699pfi.163.2022.02.14.10.33.04
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 14 Feb 2022 10:33:06 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v2 09/14] target: Include missing 'cpu.h'
Date: Mon, 14 Feb 2022 19:31:39 +0100
Message-Id: <20220214183144.27402-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220214183144.27402-1-f4bug@amsat.org>
References: <20220214183144.27402-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102b.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 PDS_HP_HELO_NORDNS=0.635, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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

These target-specific files use the target-specific CPU state
but lack to include "cpu.h"; i.e.:

    ../target/riscv/pmp.h:61:23: error: unknown type name 'CPURISCVState'
    void pmpcfg_csr_write(CPURISCVState *env, uint32_t reg_index,
                          ^
    ../target/nios2/mmu.h:43:18: error: unknown type name 'CPUNios2State'
    void mmu_flip_um(CPUNios2State *env, unsigned int um);
                     ^
    ../target/microblaze/mmu.h:88:19: error: unknown type name 'CPUMBState'; did you mean 'CPUState'?
    uint32_t mmu_read(CPUMBState *env, bool ea, uint32_t rn);
                      ^~~~~~~~~~
                      CPUState

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/microblaze/mmu.h | 2 ++
 target/mips/internal.h  | 1 +
 target/nios2/mmu.h      | 2 ++
 target/riscv/pmp.h      | 2 ++
 4 files changed, 7 insertions(+)

diff --git a/target/microblaze/mmu.h b/target/microblaze/mmu.h
index b6b4b9ad60..1068bd2d52 100644
--- a/target/microblaze/mmu.h
+++ b/target/microblaze/mmu.h
@@ -20,6 +20,8 @@
 #ifndef TARGET_MICROBLAZE_MMU_H
 #define TARGET_MICROBLAZE_MMU_H
 
+#include "cpu.h"
+
 #define MMU_R_PID    0
 #define MMU_R_ZPR    1
 #define MMU_R_TLBX   2
diff --git a/target/mips/internal.h b/target/mips/internal.h
index daddb05fd4..f705d6bfa6 100644
--- a/target/mips/internal.h
+++ b/target/mips/internal.h
@@ -12,6 +12,7 @@
 #ifdef CONFIG_TCG
 #include "tcg/tcg-internal.h"
 #endif
+#include "cpu.h"
 
 /*
  * MMU types, the first four entries have the same layout as the
diff --git a/target/nios2/mmu.h b/target/nios2/mmu.h
index 4f46fbb82e..d36b8cc86a 100644
--- a/target/nios2/mmu.h
+++ b/target/nios2/mmu.h
@@ -21,6 +21,8 @@
 #ifndef NIOS2_MMU_H
 #define NIOS2_MMU_H
 
+#include "cpu.h"
+
 typedef struct Nios2TLBEntry {
     target_ulong tag;
     target_ulong data;
diff --git a/target/riscv/pmp.h b/target/riscv/pmp.h
index a9a0b363a7..fcb6b7c467 100644
--- a/target/riscv/pmp.h
+++ b/target/riscv/pmp.h
@@ -22,6 +22,8 @@
 #ifndef RISCV_PMP_H
 #define RISCV_PMP_H
 
+#include "cpu.h"
+
 typedef enum {
     PMP_READ  = 1 << 0,
     PMP_WRITE = 1 << 1,
-- 
2.34.1


