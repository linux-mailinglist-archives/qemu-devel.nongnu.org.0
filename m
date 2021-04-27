Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 021D236C718
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 15:36:10 +0200 (CEST)
Received: from localhost ([::1]:56750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbNsm-0004aA-Qi
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 09:36:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lbNqb-0003qP-I7
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 09:33:55 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:52219)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lbNqX-0004hF-1u
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 09:33:52 -0400
Received: by mail-wm1-x32b.google.com with SMTP id m5so5066497wmf.1
 for <qemu-devel@nongnu.org>; Tue, 27 Apr 2021 06:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oSlBoECRExsxDqWI4UCvlPSNPlCXk3V2bOqJ4paotxk=;
 b=cowiXHZeSWZMG92re9qorO3hwq66qT2+cy2U3wjx2mcC9vVMFfPivuebmuUhpL+e/i
 lJvtM26iQUADptpEtPu0pJ9orR7B3Ya8KUovwixKKJ+pcuxRwecxTk4IfOeP+0Mtmcwu
 lZ5Ei5bmeLTYo0yoNSaa4oI2zUUT0R1upvUdOjDR5/nw203sxKpmaAigHuqszf36Zj6K
 SwoQSAaFl0vxRo+11XtsdtdjAWRRRCmff5pPBq2QodYXmO/dGSm+QdbqQzSXhzi5mMjv
 q4/CiC0S+M9Yzbood52qfrP1FWkYwcfEzG8t/lQlFyh0x4CI5XKMXnSsj+wfewMyi7VO
 8gOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=oSlBoECRExsxDqWI4UCvlPSNPlCXk3V2bOqJ4paotxk=;
 b=Gl8htUZ5jbjQxzIuNUl7x0iQLs06YLN9VM7lrkoYA/4nQw8rbcsrlbqi1rpmAflXwP
 3Lp0vvCTnyCtT08yP/EfjLoPygkaZBadeIeRZmJWXs/3N9IDimRToRbirDAeN4Tnauhj
 rKGZH2l4XFoSUKjluJnHdvDjpXJf9kxRjT0GJafW1RDfVt3IZXSzaFmIfovxJ7N1S08N
 KjLDqr6H+BXSEQCwu9U1dLfLJ6i4CnDuNe/wmeqf3IpysE6MPK5SI4Vvlrmb+K+vmUAS
 BsM4duafbVAi1w12suyZhXxnyI52J9jAXDETiUf+WeCMGG9E2ebNuNpcINIaaRFCNqVM
 NnJg==
X-Gm-Message-State: AOAM531/44aZVFMiGGeJOoV0BKyk2bFxknVrw6oDvm83zNZ9KzQBtonD
 MoMN0h0Tn7+WLzSVIe0iHi+kUL1whRBcbQ==
X-Google-Smtp-Source: ABdhPJxaNGgxJmhQyzWDECrYWnBC+TOnVbQCVfuiT3idnMd/VxlYPRXZcLdyfYSYja0o0Bvb4UAI0Q==
X-Received: by 2002:a1c:2941:: with SMTP id p62mr25185166wmp.120.1619530425520; 
 Tue, 27 Apr 2021 06:33:45 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id y11sm1762066wmi.41.2021.04.27.06.33.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Apr 2021 06:33:44 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] target/mips: Only update MVPControl.EVP bit if executed by
 master VPE
Date: Tue, 27 Apr 2021 15:33:37 +0200
Message-Id: <20210427133343.159718-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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

Modify the DVPE/EVPE opcodes to only update the MVPControl.EVP bit
if executed on a master VPE.

Reported-by: Hansni Bu <https://launchpad.net/%7Ehansni/+contactuser>
Buglink: https://bugs.launchpad.net/qemu/+bug/1926277
Fixes: f249412c749 ("mips: Add MT halting and waking of VPEs")
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Supersedes: <20210427103555.112652-1-f4bug@amsat.org>
v2: Check VPEConf0.MVP bit (hansni)
---
 target/mips/cp0_helper.c | 32 ++++++++++++++++++--------------
 1 file changed, 18 insertions(+), 14 deletions(-)

diff --git a/target/mips/cp0_helper.c b/target/mips/cp0_helper.c
index aae2af6eccc..d5f274f5cdf 100644
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
+    if (env->CP0_VPEConf0 & (1 << CP0VPEC0_MVP)) {
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
+    if (env->CP0_VPEConf0 & (1 << CP0VPEC0_MVP)) {
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


