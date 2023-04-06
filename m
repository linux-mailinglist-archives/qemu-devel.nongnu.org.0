Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D3C6D9BD9
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 17:09:04 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkRE5-0000VG-7f; Thu, 06 Apr 2023 11:08:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pkRE0-0000Um-MW
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 11:08:32 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pkRDy-0001LE-VD
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 11:08:32 -0400
Received: by mail-wm1-x32d.google.com with SMTP id s13so22744177wmr.4
 for <qemu-devel@nongnu.org>; Thu, 06 Apr 2023 08:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680793709; x=1683385709;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gh4qcndhDJG95oN4owUI9IOpNnJuYLVio9Sn39/QZ9g=;
 b=PpE3PUi/qdUWaILab6zEnkLgFZ9BK6ibTWqNnR+iUBQYmW6mT0PKgkY4U3ocl2lI/m
 qHheuFqpqe9xA1FwkTqUOOUd4nBSq4bz6z1K0bahsnG0hGubdtyUlclqdhuHBqsqm8Fq
 mxgtQHDc/XRv0DOS77hI5juJ4lV5RptvPyMyn1McFh5iJz7pW8OPbuyzgBAVq/MR7C18
 xTmxF2aOcbK0ZrchxqHdzF3zTWYZGyImB34f278n2ajtX/DQU9ugyGWgKw0Z3OSH4pig
 mfjvCQngyVTHYsznC/CxFQRgXpEHR7y4nJj8+L4RKW2tGekBxIx6KauSPsqLsVAZAkHS
 WrUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680793709; x=1683385709;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gh4qcndhDJG95oN4owUI9IOpNnJuYLVio9Sn39/QZ9g=;
 b=005QuX7E3lDqMPAICbMtxtKyqwp0HkS2/wg4MzL3cm12fsqzHN6Ox0yBCw8S/8OAKf
 nK1JuXb8+MftCyb5bmiEfRojlOkMtTiahVjGZlGRBv4L7NRe+vPmqIEReriOXyMguqdn
 3t3ZtJANHNTG/Q7OTrabCDUncYHQRJaI12dTKkrMM/2dI8Pau2SuRjj8xWSVN7AX/8+I
 aKQotlvMvT0Ar64mCWUwjsR4xz0bb7JLkCiVdQHxQwjHBowTNfLp94F77Qt1tRyyOh/T
 9IfhirAZho/IcR/WdNPcOQu8VgDk9pz99lO7QAuhau92Mp1ciPu2ljLQSeKiX+aNSXKK
 4Etw==
X-Gm-Message-State: AAQBX9fREtxLLfXMoFo1bgsAGbhaxw1h7Pw0A+0oQaSLsE3R1Oqn62M+
 30ktYmvZprhhBcf9S574EPWXYQ==
X-Google-Smtp-Source: AKy350a6gFd5KhzHRdNjwVRMXY6/0avAAdxCPtxaCaI9cIDAdZArHleHp1K6PqquXglReisH8bpqJg==
X-Received: by 2002:a7b:c7d8:0:b0:3ed:5eed:5581 with SMTP id
 z24-20020a7bc7d8000000b003ed5eed5581mr4576146wmk.2.1680793708915; 
 Thu, 06 Apr 2023 08:08:28 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 z12-20020a7bc7cc000000b003edd1c44b57sm1823651wmk.27.2023.04.06.08.08.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 08:08:28 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Luis Machado <luis.machado@arm.com>
Subject: [PATCH] target/arm: Report pauth information to gdb as 'pauth_v2'
Date: Thu,  6 Apr 2023 16:08:27 +0100
Message-Id: <20230406150827.3322670-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
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

So that we can avoid the "older gdb crashes" problem described in
commit 5787d17a42f7af4 and which caused us to disable reporting pauth
information via the gdbstub, newer gdb is going to implement support
for recognizing the pauth information via a new feature name:
 org.gnu.gdb.aarch64.pauth_v2

Older gdb won't recognize this feature name, so we can re-enable the
pauth support under the new name without risking them crashing.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
I think the gdb change isn't quite upstream yet, but this is
for 8.1 so I would expect it to be there by the time we
get around to committing this patch to QEMU.
---
 target/arm/gdbstub.c      | 9 ++++-----
 gdb-xml/aarch64-pauth.xml | 2 +-
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
index 13fbe9b0d7e..03b17c814f6 100644
--- a/target/arm/gdbstub.c
+++ b/target/arm/gdbstub.c
@@ -521,18 +521,17 @@ void arm_cpu_register_gdb_regs_for_features(ARMCPU *cpu)
                                      aarch64_gdb_set_fpu_reg,
                                      34, "aarch64-fpu.xml", 0);
         }
-#if 0
         /*
-         * GDB versions 9 through 12 have a bug which means they will
-         * crash if they see this XML from QEMU; disable it for the 8.0
-         * release, pending a better solution.
+         * Note that we report pauth information via the feature name
+         * org.gnu.gdb.aarch64.pauth_v2, not org.gnu.gdb.aarch64.pauth.
+         * GDB versions 9 through 12 have a bug where they will crash
+         * if they see the latter XML from QEMU.
          */
         if (isar_feature_aa64_pauth(&cpu->isar)) {
             gdb_register_coprocessor(cs, aarch64_gdb_get_pauth_reg,
                                      aarch64_gdb_set_pauth_reg,
                                      4, "aarch64-pauth.xml", 0);
         }
-#endif
 #endif
     } else {
         if (arm_feature(env, ARM_FEATURE_NEON)) {
diff --git a/gdb-xml/aarch64-pauth.xml b/gdb-xml/aarch64-pauth.xml
index 24af5f903c1..0a5c566d668 100644
--- a/gdb-xml/aarch64-pauth.xml
+++ b/gdb-xml/aarch64-pauth.xml
@@ -6,7 +6,7 @@
      notice and this notice are preserved.  -->
 
 <!DOCTYPE feature SYSTEM "gdb-target.dtd">
-<feature name="org.gnu.gdb.aarch64.pauth">
+<feature name="org.gnu.gdb.aarch64.pauth_v2">
   <reg name="pauth_dmask" bitsize="64"/>
   <reg name="pauth_cmask" bitsize="64"/>
   <reg name="pauth_dmask_high" bitsize="64"/>
-- 
2.34.1


