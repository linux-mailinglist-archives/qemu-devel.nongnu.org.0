Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF9906E8EE0
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 12:05:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppRAM-0000l5-0U; Thu, 20 Apr 2023 06:05:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ppRAC-0000bC-En
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 06:05:16 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ppRA6-0003sK-Cf
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 06:05:15 -0400
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-2f833bda191so284017f8f.1
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 03:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681985108; x=1684577108;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=QXIl1fa++9Ow0aVWNLQPOb6RkM7apUVyviw4bR4/41c=;
 b=cySqbOwsypi2Hry+secQVtW/l/aadWE0Zn1uuGHURn166gCllnUKyAJORBsN1SSFSe
 QCfo1nOWr67c/sEY25b+0Tm2xXffpRlgjzHi06gEjrFoHznHzktkdxWM/DLkqoLPQvG+
 nffCLphGQnrE2wkMUE0b14M+ZG/LZXpCMu9bvYbkSHoMrhsvivJJOeCeOmR9CCqDOF1o
 3oMc5GugQLLkOebNUvXUWhcdlWx3WHiOD0vJCt/84aJ3+Rfdh1/20IQAZa5Dmth1dZAQ
 P8YJakp/N3jmE+uXZqW+BamyZzC4MGno9qGgthvh1LaR6zj2GcGIzGUaAE+wRZJymWJO
 yihw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681985108; x=1684577108;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QXIl1fa++9Ow0aVWNLQPOb6RkM7apUVyviw4bR4/41c=;
 b=SGYRhJopSs3SOo6XLvDoibzh0DZcJhMx87NR0zlzz9WorXOyDVaCfjFja6jCdXsqJ4
 bLFmOpwQPiyH+XmnNPPMigLuZYSyXXlUCDbT3Ry3UxpjVrhPApS9B5T6wbhgHEsCS65y
 yzobUsLbqhQZeF5scZSlTJgZpB8fQBVXPwE9I2Q4+RDaVD2hXE05k90dv+QRQQ3bypV8
 9hhAbDYSjhZjCf5yEVHYQ7mveOsPTbrNRZvDRfGMFUo4K9euRsDggmKRI4VsoxYvwNSb
 936G5csiiJac2we6JQYkQOHGD73iVBaSMY44kn6kdzuKOBXBPaZWgMFShY+vupp575Lf
 fJ/w==
X-Gm-Message-State: AAQBX9dTYEZtmygGW44pi1/9bt4amuhoAtd0CNfgD8M1QuXe9MJmPbsY
 0CxGWykIZnL6mp6qSqlAYJ1lEEG0EjqpL2MpkPE=
X-Google-Smtp-Source: AKy350ZcFDxiHpw6FaZS+Y65PbKz6a17iOUPrDjqqsNAOclFSGGfOLZ/EKmyHlqqMurXR/GR3k17ZQ==
X-Received: by 2002:a05:6000:12:b0:2f8:5d92:aa12 with SMTP id
 h18-20020a056000001200b002f85d92aa12mr916730wrx.66.1681985107918; 
 Thu, 20 Apr 2023 03:05:07 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 o2-20020a5d58c2000000b002fe522117fdsm1556388wrf.36.2023.04.20.03.05.07
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 03:05:07 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 16/21] target/arm: Report pauth information to gdb as 'pauth_v2'
Date: Thu, 20 Apr 2023 11:04:51 +0100
Message-Id: <20230420100456.944969-17-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230420100456.944969-1-peter.maydell@linaro.org>
References: <20230420100456.944969-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

So that we can avoid the "older gdb crashes" problem described in
commit 5787d17a42f7af4 and which caused us to disable reporting pauth
information via the gdbstub, newer gdb is going to implement support
for recognizing the pauth information via a new feature name:
 org.gnu.gdb.aarch64.pauth_v2

Older gdb won't recognize this feature name, so we can re-enable the
pauth support under the new name without risking them crashing.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20230406150827.3322670-1-peter.maydell@linaro.org
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


