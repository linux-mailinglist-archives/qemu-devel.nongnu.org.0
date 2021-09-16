Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A5CE40DE3E
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 17:37:52 +0200 (CEST)
Received: from localhost ([::1]:49630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQtSR-0003dX-FI
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 11:37:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQtLP-0001Dv-4R
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 11:30:35 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:40875)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQtLK-0002Ml-IA
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 11:30:32 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 n13-20020a17090a4e0d00b0017946980d8dso7791040pjh.5
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 08:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/b65paiPCJASFJfCtunYkpNY6XJIYqckezX/cCSvcrY=;
 b=eQCOAoqWDMQN3xZsEWy9jOI8Eeir3e/tkrzegQWiRoWuEXfMhCO6K681BVoFe/di58
 7ejKDnxDGWZeAfY5DVW0K6Y3rtFiv0MxMNvl2+SR5ZCiTDp0vlcaNRUvSPiIsbj6osps
 uLmbArvdm+H7lmFVZJiGEN4Wz+2zNEX6TVres+uBlj9oMCwB7u2fzLWp69P4J6O+QSST
 Y8mAJtljl9D0Pe2aUWAcKqbK3difRqarnFLGGX4QSnKlVTYCfpUfY8vXa+zVlk2SybsJ
 6SmZ2pL+nJelKpnYnV20IR9raE/wvADCjaFFNuQq7QLerDkPKdwU1TEH/SLmfSzLBaV2
 DA5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/b65paiPCJASFJfCtunYkpNY6XJIYqckezX/cCSvcrY=;
 b=ChOKYG/8IFwMF/oyrGhTcBiEaOUtVu3S3L4MV+q15au9VdjVJHtAmlBQCHMp2sdKL8
 WAnDp34WQSvyf5wKR8VlQCRN0Ta5RHe1e/goyj0qAIADIy9z5bw+1lj6RfUUed9yc4bm
 8XEJqRzFPETYbg5adzXhWFEHhGnsBy5iOph9/gfG1myorSBXXcuOs5A2iRuI4WJ4D/TY
 MCtjcN6hxN9zmqb15Hq4CrAVcY4uZBspMfWN+9InmOB2LYRIWC4BacsWTbPukrCyr3nk
 TcKCclOLFu5aknCeaoH3x4sM8j8lIF1nISXwygqtQYcFuRCBOghSc93hhoyUPOmEwpsg
 Dqgw==
X-Gm-Message-State: AOAM531xXOyFv0ieBJcfWu32VZdyJ6GrIJMnYTPHoA7d0OYJSi8ug6sj
 xY1GCbAO1R2y9G/BfwWKnPNILL01pbQZTQ==
X-Google-Smtp-Source: ABdhPJzWVoOBu+hsJS3BU/NfU2+6rZADyNViunL42Evw6kaBjPzRpgA5aA+MG3OaWFHOtCet98aFjg==
X-Received: by 2002:a17:90a:bb09:: with SMTP id
 u9mr6707819pjr.165.1631806228395; 
 Thu, 16 Sep 2021 08:30:28 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id b7sm3779447pgs.64.2021.09.16.08.30.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 08:30:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 03/35] hw/core: Restrict cpu_has_work() to sysemu
Date: Thu, 16 Sep 2021 08:29:53 -0700
Message-Id: <20210916153025.1944763-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210916153025.1944763-1-richard.henderson@linaro.org>
References: <20210916153025.1944763-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

cpu_has_work() is only called from system emulation code.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210912172731.789788-3-f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/core/cpu.h | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index bc864564ce..2bd563e221 100644
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
2.25.1


