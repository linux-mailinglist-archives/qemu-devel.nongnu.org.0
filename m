Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3047C58B0A0
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 21:59:46 +0200 (CEST)
Received: from localhost ([::1]:47796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oK3U1-0006jE-AN
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 15:59:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oK3Pt-0006gc-2M
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 15:55:29 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:46850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oK3Pq-0004Ve-28
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 15:55:28 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 q7-20020a17090a7a8700b001f300db8677so3811091pjf.5
 for <qemu-devel@nongnu.org>; Fri, 05 Aug 2022 12:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oZUb/U1CrEMY4E4q2fV4JdxPwe4neVYstLVzHAJ5JHM=;
 b=mX9uQ+L35vVf9OC+8vUO17Y1DYJi8uWqJf1UD/OaDCwlbLdQMPbpndMaQ/sSM3kg8a
 FU6QgOpA+MVAkkobDnagHKDIXL8tkQhC8hWlWSSRnfgS57narJAxb+Mos3BYK3MzQFHN
 xFp1tnaXZpO6i1N4AWCyedQXWwmYogLfS4CuYmfPQNb3e1axxNqIYfKxUSNN5VzofKgw
 JCpTLsU+vIqfunmAbvu2qk7zEc4qgygXB+twYTdM44e38iU+eIxMBt3KEw8UfKpvMvsK
 7mFCl0GUXM711aBmhdIHJe7j4pOBUF7JmuKA0Ff5bhJWe7/kgxV5+YlfmGgrO67XF4Pm
 J2aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oZUb/U1CrEMY4E4q2fV4JdxPwe4neVYstLVzHAJ5JHM=;
 b=z0sIlyeJDpLVyZi+ypABocr3dYwWe1/Z8AqAJMyP26qSoHXIPJ9wE3gV3u5KNma312
 eJvIZx2b8nQV6Qg5NNmv36y7c6m0HbGCuQytRQOEk0Q4KaDildad9CNISRhXqneFwa9v
 35wgY09L5vC+c1Wnwq/3CQdzVEZSad93eebLI8Y9E48vUoar21hGZ2wVsfAMHNkENWTZ
 hTGO605PUAIXgKtEVQGcZkwTDnmnQpXros3duhsfzxZKwW0VcOVnPNp76Jpg7dVJLYKH
 1uFDItXS+iZ+IRqHPFLpXxYTqnxZx0o1Ae6HjwVZglcyhJzzu03dk2m0KzsQVcfj+eY5
 1Ucg==
X-Gm-Message-State: ACgBeo1jy1I+lZ7t+6tTjEAdEgAOBloFqjxdNUB8KyDvzq5NuWXJ471T
 Tua5PSDvbwW/WZT62vg4NGgYNLREEATqmg==
X-Google-Smtp-Source: AA6agR4yHrPH/ZJbR72T4KA2Y1DqMNoguxzFQ7goxhQQulRKKrFf26E0lWz2vP6bgpnZK8svkeokrA==
X-Received: by 2002:a17:902:f68d:b0:16f:2314:7483 with SMTP id
 l13-20020a170902f68d00b0016f23147483mr8329770plg.18.1659729325282; 
 Fri, 05 Aug 2022 12:55:25 -0700 (PDT)
Received: from stoup.. ([2602:ae:154e:e201:abf8:e436:f4c:9089])
 by smtp.gmail.com with ESMTPSA id
 h13-20020a170902f70d00b0016f0c2ea158sm3393048plo.157.2022.08.05.12.55.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Aug 2022 12:55:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Song Gao <gaosong@loongson.cn>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 6/7] target/loongarch: Update loongarch-fpu.xml
Date: Fri,  5 Aug 2022 12:55:14 -0700
Message-Id: <20220805195515.349768-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220805195515.349768-1-richard.henderson@linaro.org>
References: <20220805195515.349768-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Song Gao <gaosong@loongson.cn>

Rename loongarch-fpu64.xml to loongarch-fpu.xml and update
loongarch-fpu.xml to match upstream GDB [1]

[1]:https://github.com/bminor/binutils-gdb/blob/master/gdb/features/loongarch/fpu.xml

Signed-off-by: Song Gao <gaosong@loongson.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Acked-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220805033523.1416837-5-gaosong@loongson.cn>
---
 configs/targets/loongarch64-softmmu.mak |  2 +-
 target/loongarch/gdbstub.c              |  2 +-
 gdb-xml/loongarch-fpu.xml               | 50 ++++++++++++++++++++++
 gdb-xml/loongarch-fpu64.xml             | 57 -------------------------
 4 files changed, 52 insertions(+), 59 deletions(-)
 create mode 100644 gdb-xml/loongarch-fpu.xml
 delete mode 100644 gdb-xml/loongarch-fpu64.xml

diff --git a/configs/targets/loongarch64-softmmu.mak b/configs/targets/loongarch64-softmmu.mak
index 483474ba93..9abc99056f 100644
--- a/configs/targets/loongarch64-softmmu.mak
+++ b/configs/targets/loongarch64-softmmu.mak
@@ -1,5 +1,5 @@
 TARGET_ARCH=loongarch64
 TARGET_BASE_ARCH=loongarch
 TARGET_SUPPORTS_MTTCG=y
-TARGET_XML_FILES= gdb-xml/loongarch-base64.xml gdb-xml/loongarch-fpu64.xml
+TARGET_XML_FILES= gdb-xml/loongarch-base64.xml gdb-xml/loongarch-fpu.xml
 TARGET_NEED_FDT=y
diff --git a/target/loongarch/gdbstub.c b/target/loongarch/gdbstub.c
index 5feb43445f..d3a5e404b0 100644
--- a/target/loongarch/gdbstub.c
+++ b/target/loongarch/gdbstub.c
@@ -80,5 +80,5 @@ static int loongarch_gdb_set_fpu(CPULoongArchState *env,
 void loongarch_cpu_register_gdb_regs_for_features(CPUState *cs)
 {
     gdb_register_coprocessor(cs, loongarch_gdb_get_fpu, loongarch_gdb_set_fpu,
-                             41, "loongarch-fpu64.xml", 0);
+                             41, "loongarch-fpu.xml", 0);
 }
diff --git a/gdb-xml/loongarch-fpu.xml b/gdb-xml/loongarch-fpu.xml
new file mode 100644
index 0000000000..78e42cf5dd
--- /dev/null
+++ b/gdb-xml/loongarch-fpu.xml
@@ -0,0 +1,50 @@
+<?xml version="1.0"?>
+<!-- Copyright (C) 2021 Free Software Foundation, Inc.
+
+     Copying and distribution of this file, with or without modification,
+     are permitted in any medium without royalty provided the copyright
+     notice and this notice are preserved.  -->
+
+<!DOCTYPE feature SYSTEM "gdb-target.dtd">
+<feature name="org.gnu.gdb.loongarch.fpu">
+
+  <union id="fputype">
+    <field name="f" type="ieee_single"/>
+    <field name="d" type="ieee_double"/>
+  </union>
+
+  <reg name="f0" bitsize="64" type="fputype" group="float"/>
+  <reg name="f1" bitsize="64" type="fputype" group="float"/>
+  <reg name="f2" bitsize="64" type="fputype" group="float"/>
+  <reg name="f3" bitsize="64" type="fputype" group="float"/>
+  <reg name="f4" bitsize="64" type="fputype" group="float"/>
+  <reg name="f5" bitsize="64" type="fputype" group="float"/>
+  <reg name="f6" bitsize="64" type="fputype" group="float"/>
+  <reg name="f7" bitsize="64" type="fputype" group="float"/>
+  <reg name="f8" bitsize="64" type="fputype" group="float"/>
+  <reg name="f9" bitsize="64" type="fputype" group="float"/>
+  <reg name="f10" bitsize="64" type="fputype" group="float"/>
+  <reg name="f11" bitsize="64" type="fputype" group="float"/>
+  <reg name="f12" bitsize="64" type="fputype" group="float"/>
+  <reg name="f13" bitsize="64" type="fputype" group="float"/>
+  <reg name="f14" bitsize="64" type="fputype" group="float"/>
+  <reg name="f15" bitsize="64" type="fputype" group="float"/>
+  <reg name="f16" bitsize="64" type="fputype" group="float"/>
+  <reg name="f17" bitsize="64" type="fputype" group="float"/>
+  <reg name="f18" bitsize="64" type="fputype" group="float"/>
+  <reg name="f19" bitsize="64" type="fputype" group="float"/>
+  <reg name="f20" bitsize="64" type="fputype" group="float"/>
+  <reg name="f21" bitsize="64" type="fputype" group="float"/>
+  <reg name="f22" bitsize="64" type="fputype" group="float"/>
+  <reg name="f23" bitsize="64" type="fputype" group="float"/>
+  <reg name="f24" bitsize="64" type="fputype" group="float"/>
+  <reg name="f25" bitsize="64" type="fputype" group="float"/>
+  <reg name="f26" bitsize="64" type="fputype" group="float"/>
+  <reg name="f27" bitsize="64" type="fputype" group="float"/>
+  <reg name="f28" bitsize="64" type="fputype" group="float"/>
+  <reg name="f29" bitsize="64" type="fputype" group="float"/>
+  <reg name="f30" bitsize="64" type="fputype" group="float"/>
+  <reg name="f31" bitsize="64" type="fputype" group="float"/>
+  <reg name="fcc" bitsize="64" type="uint64" group="float"/>
+  <reg name="fcsr" bitsize="32" type="uint32" group="float"/>
+</feature>
diff --git a/gdb-xml/loongarch-fpu64.xml b/gdb-xml/loongarch-fpu64.xml
deleted file mode 100644
index e52cf89fbc..0000000000
--- a/gdb-xml/loongarch-fpu64.xml
+++ /dev/null
@@ -1,57 +0,0 @@
-<?xml version="1.0"?>
-<!-- Copyright (C) 2021 Free Software Foundation, Inc.
-
-     Copying and distribution of this file, with or without modification,
-     are permitted in any medium without royalty provided the copyright
-     notice and this notice are preserved.  -->
-
-<!DOCTYPE feature SYSTEM "gdb-target.dtd">
-<feature name="org.gnu.gdb.loongarch.fpu">
-
-  <union id="fpu64type">
-    <field name="f" type="ieee_single"/>
-    <field name="d" type="ieee_double"/>
-  </union>
-
-  <reg name="f0" bitsize="64" type="fpu64type" group="float"/>
-  <reg name="f1" bitsize="64" type="fpu64type" group="float"/>
-  <reg name="f2" bitsize="64" type="fpu64type" group="float"/>
-  <reg name="f3" bitsize="64" type="fpu64type" group="float"/>
-  <reg name="f4" bitsize="64" type="fpu64type" group="float"/>
-  <reg name="f5" bitsize="64" type="fpu64type" group="float"/>
-  <reg name="f6" bitsize="64" type="fpu64type" group="float"/>
-  <reg name="f7" bitsize="64" type="fpu64type" group="float"/>
-  <reg name="f8" bitsize="64" type="fpu64type" group="float"/>
-  <reg name="f9" bitsize="64" type="fpu64type" group="float"/>
-  <reg name="f10" bitsize="64" type="fpu64type" group="float"/>
-  <reg name="f11" bitsize="64" type="fpu64type" group="float"/>
-  <reg name="f12" bitsize="64" type="fpu64type" group="float"/>
-  <reg name="f13" bitsize="64" type="fpu64type" group="float"/>
-  <reg name="f14" bitsize="64" type="fpu64type" group="float"/>
-  <reg name="f15" bitsize="64" type="fpu64type" group="float"/>
-  <reg name="f16" bitsize="64" type="fpu64type" group="float"/>
-  <reg name="f17" bitsize="64" type="fpu64type" group="float"/>
-  <reg name="f18" bitsize="64" type="fpu64type" group="float"/>
-  <reg name="f19" bitsize="64" type="fpu64type" group="float"/>
-  <reg name="f20" bitsize="64" type="fpu64type" group="float"/>
-  <reg name="f21" bitsize="64" type="fpu64type" group="float"/>
-  <reg name="f22" bitsize="64" type="fpu64type" group="float"/>
-  <reg name="f23" bitsize="64" type="fpu64type" group="float"/>
-  <reg name="f24" bitsize="64" type="fpu64type" group="float"/>
-  <reg name="f25" bitsize="64" type="fpu64type" group="float"/>
-  <reg name="f26" bitsize="64" type="fpu64type" group="float"/>
-  <reg name="f27" bitsize="64" type="fpu64type" group="float"/>
-  <reg name="f28" bitsize="64" type="fpu64type" group="float"/>
-  <reg name="f29" bitsize="64" type="fpu64type" group="float"/>
-  <reg name="f30" bitsize="64" type="fpu64type" group="float"/>
-  <reg name="f31" bitsize="64" type="fpu64type" group="float"/>
-  <reg name="fcc0" bitsize="8" type="uint8" group="float"/>
-  <reg name="fcc1" bitsize="8" type="uint8" group="float"/>
-  <reg name="fcc2" bitsize="8" type="uint8" group="float"/>
-  <reg name="fcc3" bitsize="8" type="uint8" group="float"/>
-  <reg name="fcc4" bitsize="8" type="uint8" group="float"/>
-  <reg name="fcc5" bitsize="8" type="uint8" group="float"/>
-  <reg name="fcc6" bitsize="8" type="uint8" group="float"/>
-  <reg name="fcc7" bitsize="8" type="uint8" group="float"/>
-  <reg name="fcsr" bitsize="32" type="uint32" group="float"/>
-</feature>
-- 
2.34.1


