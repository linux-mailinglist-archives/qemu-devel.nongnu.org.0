Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD97418B84
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 00:36:17 +0200 (CEST)
Received: from localhost ([::1]:38868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUcko-00088I-VM
	for lists+qemu-devel@lfdr.de; Sun, 26 Sep 2021 18:36:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUcdL-00029G-UB
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 18:28:31 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:38623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUcdK-0005zr-Ed
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 18:28:31 -0400
Received: by mail-wr1-x42c.google.com with SMTP id u18so46532212wrg.5
 for <qemu-devel@nongnu.org>; Sun, 26 Sep 2021 15:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zpMC5xjCsBbH9RpT6gPVCF+edgca48PVAQbhvKWBiG4=;
 b=eudP0goO9ZnicrGuuChVGFg6VRAPLWGodTwx00qC7j8AcLXJSIARimyry/vy+znOwJ
 CMJImwD3fXnN5lZp0S7d4LkV/JY17ytV9l4LM2x/QiOKE6oIcv2CquijRI8PPigUfhiI
 Olll9jpBSM4s4OWVRPFISaHUPUq4dttnKLX5Fk1QpYWRVmlebffNsdYX+JCM4bRMVAUf
 JfGzzbem8MMtENFMsn173L1vB1+IziAi0sA/q0uJ57KQKUu6lB1+N4FE+bdMBmhkgFmF
 EBYO3jQCsY191Q7vfjWZ+oxDXFFGDxOxyvmuHTUIo8+mnj1D6KDWZCxOiUCGvUCcLSfZ
 mRIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=zpMC5xjCsBbH9RpT6gPVCF+edgca48PVAQbhvKWBiG4=;
 b=rwOoM+uTdc5vkJkUwKPTm4y49pkL3czlr1QIMu+ZNv3KxrGPdSwYFpRcT1Qq+at5AZ
 UWuzB75vJQH8FyaExQMJaQpFo7A3AE77IK5cUid2o0tIwKGnxAM9x81XfqQmaRACpGmM
 GufSPyBQZI0cQZafNBBEGTEjhlPVVq3Um0bIOHO/ODFEpiExSL3eNXaHV8VV6RDGsxAK
 knuPTW/iOo9GcBDcAbeBH76gINarm8EwSQGPQF+sabapReTOuljZ2vHiGUuroOjrsoKa
 IF8I7A8cVoMjWrLWQUY0geEsLgqeGLcgGroHitDLl3GT9XwZpJDyCISWSo5yxPhbK7Vp
 4EtQ==
X-Gm-Message-State: AOAM531g+od1IRp50DCxo+g7gZW86eQwJbUFFtIkEE/CuaWMbnkLMj72
 U+2aKTmtI/pbr1eNuSJWhdfFvOD5srQ=
X-Google-Smtp-Source: ABdhPJwLNShyheWFYRfshXozc0iYHKyHFbdhGxGeI5uiwhin6ygVnDncSgPIkqRJvBf0uIbngT2avQ==
X-Received: by 2002:a7b:cc8d:: with SMTP id p13mr12720547wma.10.1632695308913; 
 Sun, 26 Sep 2021 15:28:28 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 e2sm14921269wra.40.2021.09.26.15.28.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Sep 2021 15:28:28 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 15/40] accel/tcg: Introduce TCGCPUOps::has_work()
Date: Mon, 27 Sep 2021 00:26:51 +0200
Message-Id: <20210926222716.1732932-16-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210926222716.1732932-1-f4bug@amsat.org>
References: <20210926222716.1732932-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce a target-specific has_work() handler for TCG.
Eventually call it from tcg_cpu_has_work(), our
AccelOpsClass::has_work() handler.

Inspired-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/core/tcg-cpu-ops.h | 4 ++++
 accel/tcg/tcg-accel-ops.c     | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/include/hw/core/tcg-cpu-ops.h b/include/hw/core/tcg-cpu-ops.h
index 6cbe17f2e6d..c19c507b23c 100644
--- a/include/hw/core/tcg-cpu-ops.h
+++ b/include/hw/core/tcg-cpu-ops.h
@@ -66,6 +66,10 @@ struct TCGCPUOps {
     void (*do_interrupt)(CPUState *cpu);
 #endif /* !CONFIG_USER_ONLY || !TARGET_I386 */
 #ifdef CONFIG_SOFTMMU
+    /**
+     * @has_work: Callback for checking if there is work to do.
+     */
+    bool (*has_work)(CPUState *cpu);
     /** @cpu_exec_interrupt: Callback for processing interrupts in cpu_exec */
     bool (*cpu_exec_interrupt)(CPUState *cpu, int interrupt_request);
     /**
diff --git a/accel/tcg/tcg-accel-ops.c b/accel/tcg/tcg-accel-ops.c
index ebaacff1842..cd44bb6d0d8 100644
--- a/accel/tcg/tcg-accel-ops.c
+++ b/accel/tcg/tcg-accel-ops.c
@@ -32,6 +32,7 @@
 #include "qemu/main-loop.h"
 #include "qemu/guest-random.h"
 #include "exec/exec-all.h"
+#include "hw/core/tcg-cpu-ops.h"
 
 #include "tcg-accel-ops.h"
 #include "tcg-accel-ops-mttcg.h"
@@ -80,6 +81,9 @@ static bool tcg_cpu_has_work(CPUState *cpu)
     if (cc->has_work) {
         return cc->has_work(cpu);
     }
+    if (cc->tcg_ops->has_work) {
+        return cc->tcg_ops->has_work(cpu);
+    }
     return false;
 }
 
-- 
2.31.1


