Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 612E94AFFEA
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 23:12:07 +0100 (CET)
Received: from localhost ([::1]:37920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHvC2-0004kt-By
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 17:12:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nHuwa-0005w3-W3
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 16:56:09 -0500
Received: from [2607:f8b0:4864:20::1030] (port=33622
 helo=mail-pj1-x1030.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nHuwW-0008Cz-3b
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 16:56:08 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 k60-20020a17090a4cc200b001b932781f3eso420548pjh.0
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 13:55:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=e8DQWHfKGeT/pxGHQ+jFVIO6FZ9E+wxAU1QxxX34iiM=;
 b=YC9tagVwMNzFg2egX2AdenX7iDmbjMiR1zPP6NB0gTm3Ndou855tSP9RituCzTD5LI
 bpTs9rjyjk11N5yNryN6Ga6GzoXTuCo9c406kwNOkryPYZMr/c0ATUHku05GNaykNVdW
 YTxsE/4Y2+gWtK7BLLN7R6yZAx6feoPgV1sYnlkjsSvxZEJ7oxMxDsWHf8P5CUQj6bu/
 +W1ZO/Ds2tE4c6KK+XG3buYhbQ7HvyxnAxcqBrLyeInLEK3tYr3EamgQwFEBdla3cJDA
 hMLu1uR2Prr0UJUGbt+PWWpb9mRqLN32C0eG9MpCHUXf+5xrPQucJwYpiLjBKXceC/kz
 rmoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=e8DQWHfKGeT/pxGHQ+jFVIO6FZ9E+wxAU1QxxX34iiM=;
 b=hhixMSassE7WM+KmlefNjQqN4Sx8zyufwJ47VNYQsfRe3TSnRTYUp1rUgeZVzhzUyN
 2egr4UVoI4FpxS/O2oEM7dXUBgTp6f4kz/O8LMF20jQyvZSXaza/ReQ5GJmBJvyH+Xnc
 WQcWxjTfpoMtvSno21MBdcp24Hiw7f0hvvofRXogK8Mv1sHxP3JV1W01TpMaOp49Pttl
 Yp4+eTduLa/Md1lLSleI3cl2EBLPMcZSu70V0p76yM0QWNW6Rxbu06I06ZWSou8NIr3g
 1Sjo+wPOPSgbd62+9npnbaMj8ghUfSgCVY90V9b9ns+x2etob8Ouz1DoDQ7j9vqErCT6
 RzUQ==
X-Gm-Message-State: AOAM531AyRMViKnZADJrKn9dyVObit0HzT5/J+nyUiQjSe24R7Pd9D0b
 TS15k90uEYVNkOYmrwPa7i0cZVEjj3A=
X-Google-Smtp-Source: ABdhPJzoHMaOiDAC4rwTDoX41BZ7HWj2xDFM+B8+B4HFBqZJGJP5cBqiOk26dQeAU9irR5sM8X2oMg==
X-Received: by 2002:a17:902:ab43:: with SMTP id
 ij3mr4591636plb.25.1644443757069; 
 Wed, 09 Feb 2022 13:55:57 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id lp17sm7613636pjb.25.2022.02.09.13.55.55
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 09 Feb 2022 13:55:56 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH 08/15] target: Include missing 'cpu.h'
Date: Wed,  9 Feb 2022 22:54:39 +0100
Message-Id: <20220209215446.58402-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220209215446.58402-1-f4bug@amsat.org>
References: <20220209215446.58402-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1030
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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


