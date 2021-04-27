Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C005E36C446
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 12:37:37 +0200 (CEST)
Received: from localhost ([::1]:44376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbL60-0006nJ-RF
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 06:37:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lbL4U-0006DY-6X
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 06:36:02 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:34740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lbL4S-0001xH-8G
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 06:36:01 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 n3-20020a05600c4f83b02901425630b2c2so812219wmq.1
 for <qemu-devel@nongnu.org>; Tue, 27 Apr 2021 03:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HU/4yCgl1rj3i5y1lhl7YgDAybnUSgnMfeYGKSw62FU=;
 b=cH82a4Mzxf7eAQt0esKPyI3zm+AmlSbW/+I17AT91JDrVgJaUNHK5GcLjMKUbpASGB
 oUg335RNeWbzzK+mbatALd91hRJKZjkZPv2mpjPjfNhJymwC2O5G88IT4Sxh7hyz7NLX
 8W1PM8cLC9MbSfj01Bcnox04KdhuFaN5qN2n7Wtjg+5muDGMxSv3HepQSX9t8/D3zowM
 RxSv1g8LeHFZuXI+ElpLA64EWTN5Dk65Azh3Qja4KcrE3OVYeA8vJWlly3w23wE6hETn
 IYs3ZGeY0juzViiMHitM6rUboQRt3RZqV83gm6jFEEtfVmHTP0sKzT4t1VEBUf4j+17P
 hSNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=HU/4yCgl1rj3i5y1lhl7YgDAybnUSgnMfeYGKSw62FU=;
 b=fZE3QJaOQGvZFaNIq8ugUUpYjK44/nE5as9+TiQxxbZBkMhY+Phxs80LuxzUikEfmz
 B3fbJVBMZQaczXTuJb4DR5m07ytdn3TUOSLxTrrBE2ygNtrwCyzmvaDJbPDkBHcvg802
 /KAAnvczw9Kiw4YsnQOieyRYdrYM2ZXDDcaQNS4s3/BR/y34+rRWTbjrMdBpq5auceCj
 omSXEutszWFScfZMlbVzPHe6dka2yfu/DOA6jNRmcpAqHEROp5hgIvtn5LrdvF+gsBIN
 XGh1oTJLqpjq9occpdv1pOfcH3u5u0sIZ59WQaxmnKiKnGqrOL1csrXtVf0Z5BG2Gf4C
 dk6Q==
X-Gm-Message-State: AOAM533ZbwXtGzhPjrjm/XTiv8KGTMCI4pfoo9DXDTwRzJLnps2Hy8Bz
 spmuGC679fJWuTsxOtsz4BeCT67y2/APdw==
X-Google-Smtp-Source: ABdhPJxiSIkD37z/sQ+ck+DqeDhPEa72eZBp2wyv8XM3JxiEVBQdo2qel7aZQtM0+fWKtwVVtVlAzA==
X-Received: by 2002:a05:600c:4f13:: with SMTP id
 l19mr3703516wmq.47.1619519757865; 
 Tue, 27 Apr 2021 03:35:57 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id d13sm1552982wrx.29.2021.04.27.03.35.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Apr 2021 03:35:57 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/mips: Only update MVPControl.EVP bit if executed on a
 master VPE
Date: Tue, 27 Apr 2021 12:35:55 +0200
Message-Id: <20210427103555.112652-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 1926277@bugs.launchpad.net,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

According to the 'MIPS MT Application-Speciﬁc Extension' manual:

  If the VPE executing the instruction is not a Master VPE,
  with the MVP bit of the VPEConf0 register set, the EVP bit
  is unchanged by the instruction.

Add the VPEConf0.MVP bit and modify the DVPE/EVPE opcodes to only
update the MVPControl.EVP bit if executed on a master VPE.

Reported-by: Hansni Bu
Buglink: https://bugs.launchpad.net/qemu/+bug/1926277
Fixes: f249412c749 ("mips: Add MT halting and waking of VPEs")
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/cpu.h        |  1 +
 target/mips/cp0_helper.c | 32 ++++++++++++++++++--------------
 2 files changed, 19 insertions(+), 14 deletions(-)

diff --git a/target/mips/cpu.h b/target/mips/cpu.h
index 075c24abdad..bd22fac6959 100644
--- a/target/mips/cpu.h
+++ b/target/mips/cpu.h
@@ -114,6 +114,7 @@ struct CPUMIPSMVPContext {
 #define CP0MVPC0_PTLBE  16
 #define CP0MVPC0_TCA    15
 #define CP0MVPC0_PVPE   10
+#define CP0MVPC0_MVP    1
 #define CP0MVPC0_PTC    0
     int32_t CP0_MVPConf1;
 #define CP0MVPC1_CIM    31
diff --git a/target/mips/cp0_helper.c b/target/mips/cp0_helper.c
index aae2af6eccc..1e39e28808a 100644
--- a/target/mips/cp0_helper.c
+++ b/target/mips/cp0_helper.c
@@ -1635,12 +1635,14 @@ target_ulong helper_dvpe(CPUMIPSState *env)
     CPUState *other_cs = first_cpu;
     target_ulong prev = env->mvp->CP0_MVPControl;
 
-    CPU_FOREACH(other_cs) {
-        MIPSCPU *other_cpu = MIPS_CPU(other_cs);
-        /* Turn off all VPEs except the one executing the dvpe.  */
-        if (&other_cpu->env != env) {
-            other_cpu->env.mvp->CP0_MVPControl &= ~(1 << CP0MVPCo_EVP);
-            mips_vpe_sleep(other_cpu);
+    if (env->mvp->CP0_MVPConf0 & (1 << CP0MVPC0_MVP)) {
+        CPU_FOREACH(other_cs) {
+            MIPSCPU *other_cpu = MIPS_CPU(other_cs);
+            /* Turn off all VPEs except the one executing the dvpe.  */
+            if (&other_cpu->env != env) {
+                other_cpu->env.mvp->CP0_MVPControl &= ~(1 << CP0MVPCo_EVP);
+                mips_vpe_sleep(other_cpu);
+            }
         }
     }
     return prev;
@@ -1651,15 +1653,17 @@ target_ulong helper_evpe(CPUMIPSState *env)
     CPUState *other_cs = first_cpu;
     target_ulong prev = env->mvp->CP0_MVPControl;
 
-    CPU_FOREACH(other_cs) {
-        MIPSCPU *other_cpu = MIPS_CPU(other_cs);
+    if (env->mvp->CP0_MVPConf0 & (1 << CP0MVPC0_MVP)) {
+        CPU_FOREACH(other_cs) {
+            MIPSCPU *other_cpu = MIPS_CPU(other_cs);
 
-        if (&other_cpu->env != env
-            /* If the VPE is WFI, don't disturb its sleep.  */
-            && !mips_vpe_is_wfi(other_cpu)) {
-            /* Enable the VPE.  */
-            other_cpu->env.mvp->CP0_MVPControl |= (1 << CP0MVPCo_EVP);
-            mips_vpe_wake(other_cpu); /* And wake it up.  */
+            if (&other_cpu->env != env
+                /* If the VPE is WFI, don't disturb its sleep.  */
+                && !mips_vpe_is_wfi(other_cpu)) {
+                /* Enable the VPE.  */
+                other_cpu->env.mvp->CP0_MVPControl |= (1 << CP0MVPCo_EVP);
+                mips_vpe_wake(other_cpu); /* And wake it up.  */
+            }
         }
     }
     return prev;
-- 
2.26.3


