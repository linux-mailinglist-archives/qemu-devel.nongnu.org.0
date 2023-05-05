Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4D916F7A77
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 03:14:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pujx7-0003Cj-88; Thu, 04 May 2023 21:09:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujvr-0001nO-Hg
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:08:31 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujvp-0008Bu-Da
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:08:23 -0400
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-1ab05018381so10726245ad.2
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 18:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683248899; x=1685840899;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Jux+pPZw9jHjtOgyIueCriqpmKTHI9+buEKuL9Hw4r4=;
 b=EhTqNku/2G6FS97roeLBmC54akODI9/uirbhfVSivXVVUt6VLFqQSv9bxibSN/5tBb
 /eeM4yusxzP2se40baAe+aqBTEoErDj99vOJWNsO577mz9gZ/Scc9KnbwL6lYDH63uqv
 o+nGWm20ulCFtgC7tZRX3NIm50JoHCGX8jMZhAeTAdTTG4hult74Tj6J5+0pP6q+DpJI
 PtHIkN2LYYpL4Z+9TO6SoPJDMDuOS+esar/GM3eMhfcd2h0TQSLu2O2KMky3ktVd6h6z
 5e7uD17mmzoEmGoAjYilNgkxln6t7wfEucwVbtIdGphl+GnmPl5sB+XZYGED8GnXcZXZ
 MvNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683248899; x=1685840899;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Jux+pPZw9jHjtOgyIueCriqpmKTHI9+buEKuL9Hw4r4=;
 b=joBfUm709S9mWPoRIxBP/wAHNQnyWTWmdnqzxWBJ5Vkf4Rt3VtbHzplahyiMtSr4Os
 dTiKjdJF3LBn6YuqOxF7ogEN2wD+NtOXyPHogjLgeb1Fz0PCJrzRD5eqsayCoRMqDMMS
 wfmlu8jvg2/qeTuZnNglvuq8BEAQ/se6nfFF5PrDa/GhXP1xgFBix13YCg657+iBsnUW
 zFIsQd+qqLk1V2tvlRsq3SXd6ceJxA8YJ3ej4+mfX3eYD26MSzCEjlPyXweKbj2fGigi
 kAovdcKlCcBqFZET6pdJhs1RUOBSvnrOtIgsZSBuhWX9JW0SW1dBQAOiKWsu0zgvUfxA
 k2Bw==
X-Gm-Message-State: AC+VfDyKy3H/3YqnISWmDcLjED4fnVwv4X/hNTL2IBP9oS1nygwyuyUn
 4oucPEjxhHZvnNL70IDZ/BTpBonW7gWIzQ==
X-Google-Smtp-Source: ACHHUZ4wuVtC1Zv2rOyYUfVT6cY6SlFHYseWpJHbHtNQT3eV6cfFmNtWJhXUmPIVSL47X+BT8JrHqg==
X-Received: by 2002:a17:902:e5cf:b0:1a9:8ba4:d0e3 with SMTP id
 u15-20020a170902e5cf00b001a98ba4d0e3mr5864858plf.59.1683248899585; 
 Thu, 04 May 2023 18:08:19 -0700 (PDT)
Received: from toolbox.alistair23.me
 (2403-580b-97e8-0-321-6fb2-58f1-a1b1.ip6.aussiebb.net.
 [2403:580b:97e8:0:321:6fb2:58f1:a1b1])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a170902d35300b0019309be03e7sm218762plk.66.2023.05.04.18.08.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 18:08:19 -0700 (PDT)
From: Alistair Francis <alistair23@gmail.com>
X-Google-Original-From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Irina Ryapolova <irina.ryapolova@syntacore.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 87/89] target/riscv: Fix Guest Physical Address Translation
Date: Fri,  5 May 2023 11:02:39 +1000
Message-Id: <20230505010241.21812-88-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230505010241.21812-1-alistair.francis@wdc.com>
References: <20230505010241.21812-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=alistair23@gmail.com; helo=mail-pl1-x630.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Irina Ryapolova <irina.ryapolova@syntacore.com>

Before changing the flow check for sv39/48/57.

According to specification (for Supervisor mode):
Sv39 implementations support a 39-bit virtual address space, divided into 4 KiB
pages.
Instruction fetch addresses and load and store effective addresses, which are
64 bits,
must have bits 63–39 all equal to bit 38, or else a page-fault exception will
occur.
Likewise for Sv48 and Sv57.

So the high bits are equal to bit 38 for sv39.

According to specification (for Hypervisor mode):
For Sv39x4, address bits of the guest physical address 63:41 must all be zeros,
or else a
guest-page-fault exception occurs.

Likewise for Sv48x4 and Sv57x4.
For Sv48x4 address bits 63:50 must all be zeros, or else a guest-page-fault
exception occurs.
For Sv57x4 address bits 63:59 must all be zeros, or else a guest-page-fault
exception occurs.

For example we are trying to access address 0xffff_ffff_ff01_0000 with only
G-translation enabled.
So expected behavior is to generate exception. But qemu doesn't generate such
exception.

For the old check, we get
va_bits == 41, mask == (1 << 24) - 1, masked_msbs == (0xffff_ffff_ff01_0000 >>
40) & mask == mask.
Accordingly, the condition masked_msbs != 0 && masked_msbs != mask is not
fulfilled
and the check passes.

Signed-off-by: Irina Ryapolova <irina.ryapolova@syntacore.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20230418075423.26217-1-irina.ryapolova@syntacore.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_helper.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 32a65f8007..b68dcfe7b6 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -837,17 +837,24 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
 
     CPUState *cs = env_cpu(env);
     int va_bits = PGSHIFT + levels * ptidxbits + widened;
-    target_ulong mask, masked_msbs;
 
-    if (TARGET_LONG_BITS > (va_bits - 1)) {
-        mask = (1L << (TARGET_LONG_BITS - (va_bits - 1))) - 1;
-    } else {
-        mask = 0;
-    }
-    masked_msbs = (addr >> (va_bits - 1)) & mask;
+    if (first_stage == true) {
+        target_ulong mask, masked_msbs;
 
-    if (masked_msbs != 0 && masked_msbs != mask) {
-        return TRANSLATE_FAIL;
+        if (TARGET_LONG_BITS > (va_bits - 1)) {
+            mask = (1L << (TARGET_LONG_BITS - (va_bits - 1))) - 1;
+        } else {
+            mask = 0;
+        }
+        masked_msbs = (addr >> (va_bits - 1)) & mask;
+
+        if (masked_msbs != 0 && masked_msbs != mask) {
+            return TRANSLATE_FAIL;
+        }
+    } else {
+        if (vm != VM_1_10_SV32 && addr >> va_bits != 0) {
+            return TRANSLATE_FAIL;
+        }
     }
 
     bool pbmte = env->menvcfg & MENVCFG_PBMTE;
-- 
2.40.0


