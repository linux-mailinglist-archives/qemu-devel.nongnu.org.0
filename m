Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D935457349
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 17:42:09 +0100 (CET)
Received: from localhost ([::1]:36136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo6xk-0005S0-6G
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 11:42:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mo6qJ-00043Q-9o
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 11:34:27 -0500
Received: from [2a00:1450:4864:20::42e] (port=34337
 helo=mail-wr1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mo6qG-00078d-W9
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 11:34:26 -0500
Received: by mail-wr1-x42e.google.com with SMTP id d5so19171176wrc.1
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 08:34:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=S+X3+xwfX1qzDsaDbBMl0W4CfvHI15E3kFkRdo44CBU=;
 b=n+9viAUICGG1SQme46xhO6nXg0kTB8qOx7vVgwEKbzEttO38XhL/W1tc/uJEWpDV6l
 f4pkP+9wySZlnOnhN0F/q+lv9AZQB8Om9tiBiE1Ag1lZGfFERvZ2bgEqmmTMADaS/f/0
 lB9jg/xOZIG2/Cnfrp617Wr0JIjNhIDVNft5EOmkYXfDuGt/RsHJxnnZa/3g3I2rw7gg
 MNTYBxHTyNRiBwojceZfvrYmXBGnEl2mjB9c05aiRNiCgtB5tOu4z+IwpOblYUS5974B
 dfq9mjRFd5cwlqWjETzC+ImU6wHVrEbW/9jbezac/FJa/eZKiy5opzaHAE5ksccBmS59
 3+Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=S+X3+xwfX1qzDsaDbBMl0W4CfvHI15E3kFkRdo44CBU=;
 b=PRHxVSI9sJy7hhocIj+BuGdz8zehS5sR5FfrgzxUljv/WbBm4Dc4MDkon42J++K1ml
 QU0xxrCuwL7oWWRbBsDa+H6ZNBUJ6j8EbdZmSf7dUQNNPoQfSwr0uX0xwd1vMYLvBwd4
 JjOJgJprSwzgfCLQ8rlKcqHOlJKJXFyNkXnPPNcIuCx61fvdS3Oq2J/4M4o0IsBabY4q
 hwT9DkHVM3XG4LNYxD9TEwd49TZXKgQSM9EkuS7HHU/4VJv8GYgTHzDQrJUvturBFV1S
 rqhBnv3pJT2cumiVzdZN1fcBuxXAlDzykaVH/CrWal3aooKxkR1VAd3Oao9XH8xe0TEv
 f+TQ==
X-Gm-Message-State: AOAM532aScq6DkXM8s3mSGWh0gCuk2+hy33kvN9LNrf7iLxTpC1QC0ld
 zPpbV4+w9Z7zEVlLz/R4iNQw8Q==
X-Google-Smtp-Source: ABdhPJyNrnuntj8ZnUhdj3RrG7nG/CGdsYTvqRoO6SwTVs508D6FyYee+hQ7oj/C2c5OddBzVJHUJA==
X-Received: by 2002:adf:d1e2:: with SMTP id g2mr9002586wrd.362.1637339663148; 
 Fri, 19 Nov 2021 08:34:23 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id b11sm12491830wmj.35.2021.11.19.08.34.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 08:34:22 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2] Revert "arm: tcg: Adhere to SMCCC 1.3 section 5.2"
Date: Fri, 19 Nov 2021 16:34:19 +0000
Message-Id: <20211119163419.557623-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Alexander Graf <agraf@csgraf.de>,
 Jean-Christophe DUBOIS <jcd@tribudubois.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This reverts commit 9fcd15b9193e819b6cc2fd0a45e3506148812bb4.

This change turns out to cause regressions, for instance on the
imx6ul boards as described here:
https://lore.kernel.org/qemu-devel/c8b89685-7490-328b-51a3-48711c140a84@tribudubois.net/

The primary cause of that regression is that the guest code running
at EL3 expects SMCs (not related to PSCI) to do what they would if
our PSCI emulation was not present at all, but after this change
they instead set a value in R0/X0 and continue.

We could fix that by a refactoring that allowed us to only turn on
the PSCI emulation if we weren't booting the guest at EL3, but there
is a more tangled problem with the highbank board, which:
 (1) wants to enable PSCI emulation
 (2) has a bit of guest code that it wants to run at EL3 and
     to perform SMC calls that trap to the monitor vector table:
     this is the boot stub code that is written to memory by
     arm_write_secure_board_setup_dummy_smc() and which the
     highbank board enables by setting bootinfo->secure_board_setup

We can't satisfy both of those and also have the PSCI emulation
handle all SMC instruction executions regardless of function
identifier value.

This is too tricky to try to sort out before 6.2 is released;
revert this commit so we can take the time to get it right in
the 7.0 release.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Jean-Christophe: could you confirm that reverting this fixes the
regressions you had on the imx boards ?

 target/arm/psci.c | 35 +++++++++++++++++++++++++++++------
 1 file changed, 29 insertions(+), 6 deletions(-)

diff --git a/target/arm/psci.c b/target/arm/psci.c
index b279c0b9a45..6709e280133 100644
--- a/target/arm/psci.c
+++ b/target/arm/psci.c
@@ -27,13 +27,15 @@
 
 bool arm_is_psci_call(ARMCPU *cpu, int excp_type)
 {
-    /*
-     * Return true if the exception type matches the configured PSCI conduit.
-     * This is called before the SMC/HVC instruction is executed, to decide
-     * whether we should treat it as a PSCI call or with the architecturally
+    /* Return true if the r0/x0 value indicates a PSCI call and
+     * the exception type matches the configured PSCI conduit. This is
+     * called before the SMC/HVC instruction is executed, to decide whether
+     * we should treat it as a PSCI call or with the architecturally
      * defined behaviour for an SMC or HVC (which might be UNDEF or trap
      * to EL2 or to EL3).
      */
+    CPUARMState *env = &cpu->env;
+    uint64_t param = is_a64(env) ? env->xregs[0] : env->regs[0];
 
     switch (excp_type) {
     case EXCP_HVC:
@@ -50,7 +52,27 @@ bool arm_is_psci_call(ARMCPU *cpu, int excp_type)
         return false;
     }
 
-    return true;
+    switch (param) {
+    case QEMU_PSCI_0_2_FN_PSCI_VERSION:
+    case QEMU_PSCI_0_2_FN_MIGRATE_INFO_TYPE:
+    case QEMU_PSCI_0_2_FN_AFFINITY_INFO:
+    case QEMU_PSCI_0_2_FN64_AFFINITY_INFO:
+    case QEMU_PSCI_0_2_FN_SYSTEM_RESET:
+    case QEMU_PSCI_0_2_FN_SYSTEM_OFF:
+    case QEMU_PSCI_0_1_FN_CPU_ON:
+    case QEMU_PSCI_0_2_FN_CPU_ON:
+    case QEMU_PSCI_0_2_FN64_CPU_ON:
+    case QEMU_PSCI_0_1_FN_CPU_OFF:
+    case QEMU_PSCI_0_2_FN_CPU_OFF:
+    case QEMU_PSCI_0_1_FN_CPU_SUSPEND:
+    case QEMU_PSCI_0_2_FN_CPU_SUSPEND:
+    case QEMU_PSCI_0_2_FN64_CPU_SUSPEND:
+    case QEMU_PSCI_0_1_FN_MIGRATE:
+    case QEMU_PSCI_0_2_FN_MIGRATE:
+        return true;
+    default:
+        return false;
+    }
 }
 
 void arm_handle_psci_call(ARMCPU *cpu)
@@ -172,9 +194,10 @@ void arm_handle_psci_call(ARMCPU *cpu)
         break;
     case QEMU_PSCI_0_1_FN_MIGRATE:
     case QEMU_PSCI_0_2_FN_MIGRATE:
-    default:
         ret = QEMU_PSCI_RET_NOT_SUPPORTED;
         break;
+    default:
+        g_assert_not_reached();
     }
 
 err:
-- 
2.25.1


