Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9273407EF3
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Sep 2021 19:29:35 +0200 (CEST)
Received: from localhost ([::1]:58074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPTIM-0007cM-Te
	for lists+qemu-devel@lfdr.de; Sun, 12 Sep 2021 13:29:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mPTGc-0005Mj-CE
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 13:27:46 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:45850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mPTGa-0004IP-Tf
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 13:27:46 -0400
Received: by mail-wr1-x42c.google.com with SMTP id d21so3219860wra.12
 for <qemu-devel@nongnu.org>; Sun, 12 Sep 2021 10:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tcpBP/9O11lxH2OkY3DQ1OAE3IFU4nJ2jfhNdgzdGjo=;
 b=JixNNMDnQWkfEOitzmixTeIfAnZe0sufCngbXzLetQsRYaCAKjzIxRyO31pVI14lKE
 g7ftKDJ3zu92O2KtDcQgXmrK6RvW8NBihJzT4cB834ZEN+7zEVK+WzWTJssM6yX9g5fz
 auYyfhL9e0Q4A4gwXIG5tfyP/L6QLt86KsB5msdJlF7iLYhPgNuZvFSRwQuT7rdiTx0D
 h1vZSVfmexa2eIdD2ZaQvM2fJa8gIcpJRX4SUGs/W+k4KfXIuVQ499JcXYoMXLo34ws3
 YAMH9ZeL7j3Rox6kw5srQICVp9Qnyc2AUUP3V8xQkhQRlXePVYVqc4o/kygKhBRnJyou
 A+wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=tcpBP/9O11lxH2OkY3DQ1OAE3IFU4nJ2jfhNdgzdGjo=;
 b=QT+SQJ9f7Wex3iXNDVMnDX++UEyXzgFPxibSdVi9DtwzClSqjO0atvXu4lexxAaBS7
 MjPM2mvyflEkWyp5u4y0E2zCfsKznzlq2fCufdjyKoj1XdBBtwhU77A249Sneq/xiSo7
 vb7fuUeXg2vVzioKi5HUPC/QdfEm8qt0I4EI3zbVT2EoiLG6xCBDN3MRj5/4OoREzJYV
 6OdgMJCn48RRuI+AQ7awht+4u5dP+M6CcKezIWc7MUGrZ61aWK0LWAYLBlDJDcQ2VSOK
 4iWwHkEMkgiA8xRy1rCuWMfb37q8KbckmDF6nCaqXHHklpdHi7/OwD5MgLmj2EK65Y3p
 SqVg==
X-Gm-Message-State: AOAM530DBDd/qygVEWjJPNnsmeP6HQkqbe4qD2wmgHuE+e1hCpuL0BU7
 ylmI6MGjlbzvMXj+T95n3HnOUQQ7KmE=
X-Google-Smtp-Source: ABdhPJz1t0gM78HeLwEXxugyzTvm6uWuK41P4y8OW7ReirZHWuFzlUAR/q1JSQQRRXmMWfbHdwiolg==
X-Received: by 2002:adf:90cc:: with SMTP id i70mr8361547wri.408.1631467663011; 
 Sun, 12 Sep 2021 10:27:43 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id z5sm4702133wmf.33.2021.09.12.10.27.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 10:27:42 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 02/30] hw/core: Restrict cpu_has_work() to sysemu
Date: Sun, 12 Sep 2021 19:27:03 +0200
Message-Id: <20210912172731.789788-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210912172731.789788-1-f4bug@amsat.org>
References: <20210912172731.789788-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

cpu_has_work() is only called from system emulation code.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/core/cpu.h | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index bc864564cee..2bd563e221f 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -538,6 +538,22 @@ enum CPUDumpFlags {
 void cpu_dump_state(CPUState *cpu, FILE *f, int flags);
 
 #ifndef CONFIG_USER_ONLY
+/**
+ * cpu_has_work:
+ * @cpu: The vCPU to check.
+ *
+ * Checks whether the CPU has work to do.
+ *
+ * Returns: %true if the CPU has work, %false otherwise.
+ */
+static inline bool cpu_has_work(CPUState *cpu)
+{
+    CPUClass *cc = CPU_GET_CLASS(cpu);
+
+    g_assert(cc->has_work);
+    return cc->has_work(cpu);
+}
+
 /**
  * cpu_get_phys_page_attrs_debug:
  * @cpu: The CPU to obtain the physical page address for.
@@ -636,22 +652,6 @@ CPUState *cpu_create(const char *typename);
  */
 const char *parse_cpu_option(const char *cpu_option);
 
-/**
- * cpu_has_work:
- * @cpu: The vCPU to check.
- *
- * Checks whether the CPU has work to do.
- *
- * Returns: %true if the CPU has work, %false otherwise.
- */
-static inline bool cpu_has_work(CPUState *cpu)
-{
-    CPUClass *cc = CPU_GET_CLASS(cpu);
-
-    g_assert(cc->has_work);
-    return cc->has_work(cpu);
-}
-
 /**
  * qemu_cpu_is_self:
  * @cpu: The vCPU to check against.
-- 
2.31.1


