Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F783BB747
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 08:44:50 +0200 (CEST)
Received: from localhost ([::1]:41302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0ILZ-0008VC-NM
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 02:44:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kito.cheng@sifive.com>)
 id 1m0IKZ-0007jj-UL
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 02:43:49 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:45783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kito.cheng@sifive.com>)
 id 1m0IKW-0001ev-00
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 02:43:47 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 b8-20020a17090a4888b02901725eedd346so8255481pjh.4
 for <qemu-devel@nongnu.org>; Sun, 04 Jul 2021 23:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TQWo2oZwttV6vBuy8C2L+FSGnVkhpVhO+aqWLQLsITk=;
 b=RaH8YSQMXG6dK6ektMT1zk89ssmvTEMM7GpgJGSLhghXfeNG0Y/MSb8i+0MUXew6OB
 XkTPyGnujH3vF3k7lt+7Oi6e+Ct826HK3jHLcV3EZBrsxcpDWMSsmp6Z/62iB1sPV/lr
 Kdfi/RwoBZ9INQ8KrN0tPZGCB+gxUIgjjKcxKdHN0VfCUauK8N+cqXAVYjd8bQK3bmf/
 2irQPv6x9wt5Am5yWY811fIa3OAz7KMCp7nHuA77nsSxPLd1c82r10C/haPVjZ0KkBml
 L6Y5m+OvzH7/kT16PyAm6f7Ap7cPFGuh+KQgMebZ3QT0XpxVQcts104O3vDW+WPLUvCc
 pWbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TQWo2oZwttV6vBuy8C2L+FSGnVkhpVhO+aqWLQLsITk=;
 b=NjW90Fe+I05qXoTDamZCTsQJDnHFJMJwfqNZbocY3O82m6M2mKTfCY0JDtQXEIu8Iq
 ZK6Bks518YyHdLYufWEH7qraNsDgl1Ot1zLFGwz7i5pw4GPoUlRPu5F51RCNY5W6U/ED
 eo5PbtlZtEbOqkslmVwMPvLyIzsdgS8jXejeQAx1tBLFoAqV5BsbpNDTeRQYbV9jmFso
 /kSuAec4TXyXtY2A7hq8PXWHxBdOFjICqBfnQMOMMA28XujE927MviU8BLeDYgkDM+yL
 k99CfN1Mt8+QWcKSBI91PiD7bJ0o8ZgjhTNt9G6NSVLEiuZx2ZlBc3H7CQ1pg3cKQCdQ
 gnXw==
X-Gm-Message-State: AOAM532blxPs6ADRrK48EBhWYUg6FHdUZEREHXfFRx5QOqss46tW1uBj
 ZLBEkXZn9NSrOEgUyU/7RJjMOg==
X-Google-Smtp-Source: ABdhPJwC02yREwXm366IdDGVvvsB53VqIsjXbb5mSRqoGbyurvzqfIjRoSqCB6leSNwblj6u9m1opQ==
X-Received: by 2002:a17:902:7c91:b029:129:8c0f:853 with SMTP id
 y17-20020a1709027c91b02901298c0f0853mr3574355pll.62.1625467421352; 
 Sun, 04 Jul 2021 23:43:41 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (59-124-168-89.HINET-IP.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id x13sm10310233pjh.30.2021.07.04.23.43.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Jul 2021 23:43:40 -0700 (PDT)
From: Kito Cheng <kito.cheng@sifive.com>
To: alistair.francis@wdc.com, palmer@dabbelt.com, frank.chang@sifive.com,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org, richard.henderson@linaro.org
Subject: [PATCH v2] linux-user/elfload: Implement ELF_HWCAP for RISC-V
Date: Mon,  5 Jul 2021 14:43:26 +0800
Message-Id: <20210705064326.81958-1-kito.cheng@sifive.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=kito.cheng@sifive.com; helo=mail-pj1-x1030.google.com
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
Cc: Kito Cheng <kito.cheng@sifive.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Set I, M, A, F, D and C bit for hwcap if misa is set.

V2 Changes:
- Only set imafdc bits, sync with upstream linux kernel.

Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
---
 linux-user/elfload.c | 30 +++++++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 598ab8aa13..3cdc7d06e1 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -1426,7 +1426,7 @@ static void elf_core_copy_regs(target_elf_gregset_t *regs,
 #ifdef TARGET_RISCV
 
 #define ELF_START_MMAP 0x80000000
-#define ELF_ARCH  EM_RISCV
+#define ELF_ARCH EM_RISCV
 
 #ifdef TARGET_RISCV32
 #define ELF_CLASS ELFCLASS32
@@ -1434,6 +1434,34 @@ static void elf_core_copy_regs(target_elf_gregset_t *regs,
 #define ELF_CLASS ELFCLASS64
 #endif
 
+#define ELF_HWCAP get_elf_hwcap()
+
+static uint32_t get_elf_hwcap(void)
+{
+    RISCVCPU *cpu = RISCV_CPU(thread_cpu);
+    uint32_t hwcap = 0;
+
+#define MISA_BIT(EXT) (1 << (EXT - 'A'))
+#define GET_EXT(EXT)				\
+    do {					\
+        if (cpu->env.misa & MISA_BIT(EXT)) {	\
+            hwcap |= MISA_BIT(EXT);		\
+        }					\
+    } while (0)
+
+    GET_EXT('I');
+    GET_EXT('M');
+    GET_EXT('A');
+    GET_EXT('F');
+    GET_EXT('D');
+    GET_EXT('C');
+
+#undef MISA_BIT
+#undef GET_EXT
+
+    return hwcap;
+}
+
 static inline void init_thread(struct target_pt_regs *regs,
                                struct image_info *infop)
 {
-- 
2.31.1


