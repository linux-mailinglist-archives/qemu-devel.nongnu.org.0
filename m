Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6CCA4128AE
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 00:12:18 +0200 (CEST)
Received: from localhost ([::1]:41162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSRWL-00041X-QU
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 18:12:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mSR62-0002xW-1l
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 17:45:06 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:33710)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mSR60-0001Wm-GT
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 17:45:05 -0400
Received: by mail-wr1-x433.google.com with SMTP id t18so33641126wrb.0
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 14:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tcpBP/9O11lxH2OkY3DQ1OAE3IFU4nJ2jfhNdgzdGjo=;
 b=KNqaiPJJG7+8+0l9g/i8xd7y5CGN1e7IVj1XOui33LadYMx2Z8YehyaRKhXD5digSn
 tl3Q7iNGMk9aAmX69HGPDQiqk77kZIULOi5KiaB7HbE3HQ73MzjTWoYs37ONzjANdc9W
 6q21G1DIFF9i+YGQqKt14lYzth4J+s8pnDyYK3xIq2ZWLn68FXRCtT3+HwMKtTmJPUdQ
 +cBVoaHUPqqHWx63F2wM2EcvDVz8k6ArZHxbNruyl+bFVUqng0kJkLqb/FNxma0/rdd6
 0H2oYKnwtN4nhltlyN2ZQtWqeNm/9jUJJ6FkV5mzwmh+a8WraVr/LwalgnH+E8oFRnqy
 FlkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=tcpBP/9O11lxH2OkY3DQ1OAE3IFU4nJ2jfhNdgzdGjo=;
 b=CyOP+uz1djoxE04wmliKb7BxqA4Yl6zLNwn+gcB4OeRmvK6OEoeOZNGdQJpTzkZce1
 kHq//V5V6yoPuGC91vX1qkn0NK6ctbPftzV60lZENTQMVVlFJu8z2AgyFHFlUWBeotAY
 TyAmEgSaGBNVXb9uo1vRpD/x9rKPFQK+Bt8KNnGzbrp27e/itt//+biQxKLx0pM+66NZ
 2GaoII/OAIQfKjwD9R4lCLA80d+3gC50bpK7rREhb9kYC9nX1y+fXDVhan3F6Eevz17M
 IFUoNln8E28kPrfF5iAwoldUStVRMJEoHhLk5h4rEgUIZt9x00k+aLry1PVNoC3DUJjA
 LtSQ==
X-Gm-Message-State: AOAM533McOCCn3Ls2brSiTLpYgwDnL6iSL2CoSIXH+XO54XNa6FQV0V/
 ETCx+2jzPnSzsO2iqGFLtRm7dUM5Zzc=
X-Google-Smtp-Source: ABdhPJy61JGIBHdffCz52LmMSIW9jUKu7fnf0C0ppuOp9o6+JyYGfGk2UuP4emp/jz5ltlCzDpefHw==
X-Received: by 2002:a05:600c:4e86:: with SMTP id
 f6mr1104874wmq.166.1632174303059; 
 Mon, 20 Sep 2021 14:45:03 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 q126sm657539wma.10.2021.09.20.14.45.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 14:45:02 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 03/31] hw/core: Restrict cpu_has_work() to sysemu
Date: Mon, 20 Sep 2021 23:44:19 +0200
Message-Id: <20210920214447.2998623-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210920214447.2998623-1-f4bug@amsat.org>
References: <20210920214447.2998623-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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


