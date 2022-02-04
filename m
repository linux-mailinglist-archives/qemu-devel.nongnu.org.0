Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1255C4A9E91
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 19:03:46 +0100 (CET)
Received: from localhost ([::1]:57342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nG2vx-0001xE-6Z
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 13:03:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1nG2gO-0003kj-PZ
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 12:47:40 -0500
Received: from [2a00:1450:4864:20::42f] (port=34737
 helo=mail-wr1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1nG2gM-0003mj-UF
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 12:47:40 -0500
Received: by mail-wr1-x42f.google.com with SMTP id f17so12768402wrx.1
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 09:47:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GfG2907wKZVOQoSZVbPuNn1dBd1Je7BuFOErMfGRWeo=;
 b=6uruJJgsbO241iLTVFZY4LXYAKgxYlBJcilPPf3s8j1jOiIEFto6jjEIFez1du5hWZ
 XK2NN38ernn6RG0byy64046nB//qy3BOfekqFATpo/xYIUfWqhHAznccejdOzxTbFJrA
 0WvOXcvq0P5rU4J/IyGtE7c74mloVrqWVJV1BX16zgy4+8uJhsArIUUkkK67en8zx+JL
 o4FNKG84JJntYd1Qr4F9KNPyZCryb1PQF8TwsoIbVtrTuCSKFvKuGOLKttpjN1ddTbmQ
 TuKyiNfwDlsmiFmoI6dAGY723WercVSxki1mm9BV7nlY86lcGg31GE/5HK6FKzs0z98J
 Lq0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GfG2907wKZVOQoSZVbPuNn1dBd1Je7BuFOErMfGRWeo=;
 b=gQ5KyBSqBjPJWIYZb5+Srh0vUUgckcKK1g0yFRc8wW1JxyYTSUZaPu8PHSBRwWQwXf
 nodX9+j62P2ghr+SZvdhDpBBTtCbc0L6huB085s6+lhQ0qG5y0nyU1CeNGuw4MrM4IrN
 +yvfwtq4Zx+peYcGyqNY4g+Q7yocXR4fKJxfHlNsKSw4j4yFrJNlydqr7q1bnw4Zn0/x
 72NK7zw46ks7iBO/9Hl/LpWbODrWYpJEFsHb/T9mtLpfDwWw7IHOcU/jCRqqLxbwPbbH
 qFPwu9opo3aoREnWFdrQ7VmBXPlz50g3hI2Nta3R/GnornJbTBeLcSJUY5MYEbXFm0o8
 vxLA==
X-Gm-Message-State: AOAM530xI4xHA8/JJgHfPzBY8nBb0dQ7B7FrXuzmhjlX2yqOX8HIyxxu
 it5kUEpDcdD/KwWamjyhrTt+sg==
X-Google-Smtp-Source: ABdhPJy+/mMyU9f9VonX2rQPQvaC8xPjtXZUmF9WWzgcPQsU5zFsT2B9D78v0d4cv/Ee8180NYxlhg==
X-Received: by 2002:adf:d1c9:: with SMTP id b9mr28366wrd.134.1643996857485;
 Fri, 04 Feb 2022 09:47:37 -0800 (PST)
Received: from localhost.localdomain ([122.167.157.188])
 by smtp.gmail.com with ESMTPSA id f13sm11381876wmq.29.2022.02.04.09.47.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 09:47:36 -0800 (PST)
From: Anup Patel <anup@brainfault.org>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Subject: [PATCH v9 05/23] target/riscv: Allow setting CPU feature from
 machine/device emulation
Date: Fri,  4 Feb 2022 23:16:41 +0530
Message-Id: <20220204174700.534953-6-anup@brainfault.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220204174700.534953-1-anup@brainfault.org>
References: <20220204174700.534953-1-anup@brainfault.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42f
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::42f;
 envelope-from=anup@brainfault.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Anup Patel <anup@brainfault.org>, qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Atish Patra <atishp@atishpatra.org>, Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Anup Patel <anup.patel@wdc.com>

The machine or device emulation should be able to force set certain
CPU features because:
1) We can have certain CPU features which are in-general optional
   but implemented by RISC-V CPUs on the machine.
2) We can have devices which require a certain CPU feature. For example,
   AIA IMSIC devices expect AIA CSRs implemented by RISC-V CPUs.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Signed-off-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/cpu.c | 11 +++--------
 target/riscv/cpu.h |  5 +++++
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 3f9e2400bb..bf14d27bd1 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -135,11 +135,6 @@ static void set_vext_version(CPURISCVState *env, int vext_ver)
     env->vext_ver = vext_ver;
 }
 
-static void set_feature(CPURISCVState *env, int feature)
-{
-    env->features |= (1ULL << feature);
-}
-
 static void set_resetvec(CPURISCVState *env, target_ulong resetvec)
 {
 #ifndef CONFIG_USER_ONLY
@@ -508,18 +503,18 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
     }
 
     if (cpu->cfg.mmu) {
-        set_feature(env, RISCV_FEATURE_MMU);
+        riscv_set_feature(env, RISCV_FEATURE_MMU);
     }
 
     if (cpu->cfg.pmp) {
-        set_feature(env, RISCV_FEATURE_PMP);
+        riscv_set_feature(env, RISCV_FEATURE_PMP);
 
         /*
          * Enhanced PMP should only be available
          * on harts with PMP support
          */
         if (cpu->cfg.epmp) {
-            set_feature(env, RISCV_FEATURE_EPMP);
+            riscv_set_feature(env, RISCV_FEATURE_EPMP);
         }
     }
 
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index f030cb58b2..283a3cda4b 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -379,6 +379,11 @@ static inline bool riscv_feature(CPURISCVState *env, int feature)
     return env->features & (1ULL << feature);
 }
 
+static inline void riscv_set_feature(CPURISCVState *env, int feature)
+{
+    env->features |= (1ULL << feature);
+}
+
 #include "cpu_user.h"
 
 extern const char * const riscv_int_regnames[];
-- 
2.25.1


