Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 828A538E7A7
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 15:30:34 +0200 (CEST)
Received: from localhost ([::1]:42770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llAfA-0005Fz-TO
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 09:30:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamie@nuviainc.com>)
 id 1ll6A8-0001OF-4n
 for qemu-devel@nongnu.org; Mon, 24 May 2021 04:42:12 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:44897)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jamie@nuviainc.com>)
 id 1ll6A5-0003Ic-EC
 for qemu-devel@nongnu.org; Mon, 24 May 2021 04:42:11 -0400
Received: by mail-wr1-x42b.google.com with SMTP id i17so27625942wrq.11
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 01:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=J9DK0Dbta1o4so8aXK5OOwR7RIp1mZfpNmlASzwGyvw=;
 b=rucD0xV0Y3209kjBK4gIa3Hgg4CSa7F2DyY4QOUMtZrniYnBx575w4lj/eLQOmZuh1
 Vet3m/sgi8ZI9Pl+1QuzYsBqSzbz+pqZqoIc5DVPg7Qb/rRPLDGrsKd54PTnXQXRmdQ0
 s5Jj4qAnU6D7+zOs8YqG9A2AfZ4tb9kq84P1U2Vk7KLiVrcxMiypTaaTQTrMXYEyZ9O+
 XlbKka3NuUz85mgeLc9VEEqKJyKqUkiaPUe0Ku59vc1Qwvr8qak+Vkk1zU4SN6DkCcxe
 26BVBNAZON81c/i6av+fZP71EHGRfUYH/OkucDJDxIQbhkvsfLr8wM9ZLO6rDSG/C7EZ
 lvUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=J9DK0Dbta1o4so8aXK5OOwR7RIp1mZfpNmlASzwGyvw=;
 b=Cht10rfRpnYq5y1T8DI3Ls0zVBa++UluUonJiTK16ziV/iXIeNBz8v5g+QQJMdSKHn
 KhKJ8eD0p4cLmZ8etDdIf/ph2TkQwoNfBx/HSTS6tNYMhwvkCLiLYyEdLtj0UbgpyQDC
 s9YWWXby+IeO4HUn0u9YPrDLsXq2+lu7imc3dGpVShLSDrYg8eVcjHZsO+PzsBm4yqIz
 dFilWS3Et57ftaL2oIrNHONbm3L7b70ANHyQEASzD+CZ5Sxdy/AhchFfgTGn42QnoMlD
 irxlWVNsbrptKZCwkngwYhZIqWLAw3z2Ch/ZjAa/+PbAKBngWYXm06Q7HMsyfYvhanu2
 w88Q==
X-Gm-Message-State: AOAM531OOgzk2MlsmZ8zo19ctIvGJctxAlyBchV5CagkVu7R+1b5OCkD
 xnTBXjGoLABFLjrlwOUQoITOPA==
X-Google-Smtp-Source: ABdhPJzFapF6IDYh64b7xhRyxJu8tjsNzvcfyuEOtXc5WoXYZr0h/HjW8Cb2eaH3PZJQ6AjZAxfn2A==
X-Received: by 2002:adf:fe49:: with SMTP id m9mr21290175wrs.125.1621845724468; 
 Mon, 24 May 2021 01:42:04 -0700 (PDT)
Received: from localhost ([82.44.17.50])
 by smtp.gmail.com with ESMTPSA id m9sm13749052wrs.36.2021.05.24.01.42.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 01:42:03 -0700 (PDT)
From: Jamie Iles <jamie@nuviainc.com>
To: qemu-arm@nongnu.org
Subject: [PATCH] target/arm: fix missing exception class
Date: Mon, 24 May 2021 09:42:01 +0100
Message-Id: <20210524084201.1665973-1-jamie@nuviainc.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=jamie@nuviainc.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 24 May 2021 09:27:40 -0400
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jamie Iles <jamie@nuviainc.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The DAIF and PAC checks used raise_exception_ra to raise an exception
and unwind CPU state but raise_exception_ra is currently designed for
handling data aborts as the syndrome is partially precomputed and
encoded in the TB and then merged in merge_syn_data_abort when handling
the data abort.  Using raise_exception_ra for DAIF and PAC checks
results in an empty syndrome being retrieved from data[2] in
restore_state_to_opc and setting ESR to 0.  This manifested as:

  kvm [571]: Unknown exception class: esr: 0x000000 –
  Unknown/Uncategorized

when launching a KVM guest when the host qemu used a CPU supporting
EL2+pointer authentication and enabling pointer authentication in the
guest.

As the syndrome and exception class is not encoded in the TB, use
cpu_restore_state and raise_exception to restore the CPU state and raise
the exception with the correct syndrome.

Fixes: 0d43e1a2d29a ("target/arm: Add PAuth helpers")
Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Jamie Iles <jamie@nuviainc.com>
---
 target/arm/helper-a64.c   | 12 +++++++-----
 target/arm/pauth_helper.c |  4 +++-
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/target/arm/helper-a64.c b/target/arm/helper-a64.c
index 9cc3b066e28b..83991d783fc1 100644
--- a/target/arm/helper-a64.c
+++ b/target/arm/helper-a64.c
@@ -72,11 +72,13 @@ static void daif_check(CPUARMState *env, uint32_t op,
 {
     /* DAIF update to PSTATE. This is OK from EL0 only if UMA is set.  */
     if (arm_current_el(env) == 0 && !(arm_sctlr(env, 0) & SCTLR_UMA)) {
-        raise_exception_ra(env, EXCP_UDEF,
-                           syn_aa64_sysregtrap(0, extract32(op, 0, 3),
-                                               extract32(op, 3, 3), 4,
-                                               imm, 0x1f, 0),
-                           exception_target_el(env), ra);
+        CPUState *cs = env_cpu(env);
+        cpu_restore_state(cs, ra, true);
+        raise_exception(env, EXCP_UDEF,
+                        syn_aa64_sysregtrap(0, extract32(op, 0, 3),
+                                            extract32(op, 3, 3), 4,
+                                            imm, 0x1f, 0),
+                        exception_target_el(env));
     }
 }
 
diff --git a/target/arm/pauth_helper.c b/target/arm/pauth_helper.c
index cd6df18150bf..c90a3f765b9c 100644
--- a/target/arm/pauth_helper.c
+++ b/target/arm/pauth_helper.c
@@ -385,7 +385,9 @@ static uint64_t pauth_strip(CPUARMState *env, uint64_t ptr, bool data)
 static void QEMU_NORETURN pauth_trap(CPUARMState *env, int target_el,
                                      uintptr_t ra)
 {
-    raise_exception_ra(env, EXCP_UDEF, syn_pactrap(), target_el, ra);
+    CPUState *cs = env_cpu(env);
+    cpu_restore_state(cs, ra, true);
+    raise_exception(env, EXCP_UDEF, syn_pactrap(), target_el);
 }
 
 static void pauth_check_trap(CPUARMState *env, int el, uintptr_t ra)
-- 
2.30.2


