Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB1C4A8D12
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 21:16:16 +0100 (CET)
Received: from localhost ([::1]:57986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFiWb-0006Jm-Ke
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 15:16:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nFhdB-0002Ts-TF
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 14:18:58 -0500
Received: from [2607:f8b0:4864:20::42d] (port=44569
 helo=mail-pf1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nFhd7-0002G6-AZ
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 14:18:57 -0500
Received: by mail-pf1-x42d.google.com with SMTP id n32so3015080pfv.11
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 11:18:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=65MPlr88/4m7n+vhG97F5TEU2DofKSKb0ifYE1MH9O8=;
 b=Ndi3yJ23312H+t9HdhxgecchRpwBE+0XTUpdqjj6TsfI1zSkBDnXsZuErwuAbN+7sM
 WA061GBoUZYT2sl/p7QhqY7ePi7yjwCW9I+OCXn3iCFxyVRcf6d0xgSA4zdavqErOvy6
 DShzsE2qXPuHIsdAypNq37a+QMDM4n+R4X7X0mgXQFEEhE4Ln8Hfv+y4lwtxalKeMFyA
 YMGD4vOGvxk/3A9JwSV83CX1ofCMR5mmSp2tkS+WWSl1lm13/jaGsFSqNUjR2cd4sJjt
 hDVopWWGA+lDQB+kUiMqDQSkVi8m/Sqoph8W50MS5U1CYmcFRwvdSskyOir6P6Mz80x2
 OyvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=65MPlr88/4m7n+vhG97F5TEU2DofKSKb0ifYE1MH9O8=;
 b=DA9lgErErUL+PnDeb2uWTWfVWiLjaJ4u9fCstyMT2f9jFnQ2jUD2ON4q5lQYFvCE3Q
 NqUCSh7c7e36+VYdNgqkbm8R52lukFOVFTGw+KZ9abNB1zrPVFXUFU8PxQOoyox8Fz2H
 Q5Ey4SC8K+kahUuHsQ8lQBmU6cLQCRCMd1mWt/xOhtFw8REix9zzNCp9nspfPH4MerD3
 1jdSjIvrXTPAyxTkhwwLRAOx4I2j5402lCWCYeQ3wXRf30f7VXssoRdj4yJLBATzVK8+
 mxz6u9wr1G+HUcmfERDCUVlXyMe2tWs3ZQ/bcysrS/OXXfiVziHTZ7+dSeVyM7jIB8ed
 guBA==
X-Gm-Message-State: AOAM532xz3kpDsvKZFX3QLa4VESut2xZsOLZw0bONKKHYyn6g+YasaGc
 k1LLAJLfWTuXPSIqZ11CNC/MUH/2q1M=
X-Google-Smtp-Source: ABdhPJw8T06zCMvC1vo5DozqDS4jrJmvOO1YkZyVWzhy0odMiU/h4zTUt1LhYWTpSCzfI8AvFAZoEQ==
X-Received: by 2002:a63:9044:: with SMTP id a65mr28971068pge.325.1643915924682; 
 Thu, 03 Feb 2022 11:18:44 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id ms14sm10803143pjb.15.2022.02.03.11.18.42
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 03 Feb 2022 11:18:44 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v2 03/21] exec: Declare vaddr as a generic target-agnostic type
Date: Thu,  3 Feb 2022 20:17:56 +0100
Message-Id: <20220203191814.45023-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220203191814.45023-1-f4bug@amsat.org>
References: <20220203191814.45023-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

Move vaddr type declaration to the generic "exec/cpu-common.h" header.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/exec/cpu-common.h | 12 ++++++++++++
 include/hw/core/cpu.h     | 13 +------------
 2 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
index de5f444b19..cd1d7328a1 100644
--- a/include/exec/cpu-common.h
+++ b/include/exec/cpu-common.h
@@ -7,6 +7,18 @@
 #include "exec/hwaddr.h"
 #endif
 
+/**
+ * vaddr:
+ * Type wide enough to contain any #target_ulong virtual address.
+ */
+typedef uint64_t vaddr;
+#define VADDR_PRId PRId64
+#define VADDR_PRIu PRIu64
+#define VADDR_PRIo PRIo64
+#define VADDR_PRIx PRIx64
+#define VADDR_PRIX PRIX64
+#define VADDR_MAX UINT64_MAX
+
 /* Using intptr_t ensures that qemu_*_page_mask is sign-extended even
  * when intptr_t is 32-bit and we are aligning a long long.
  */
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 76ab3b851c..3f2b681281 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -22,6 +22,7 @@
 
 #include "hw/qdev-core.h"
 #include "disas/dis-asm.h"
+#include "exec/cpu-common.h"
 #include "exec/hwaddr.h"
 #include "exec/memattrs.h"
 #include "qapi/qapi-types-run-state.h"
@@ -35,18 +36,6 @@
 typedef int (*WriteCoreDumpFunction)(const void *buf, size_t size,
                                      void *opaque);
 
-/**
- * vaddr:
- * Type wide enough to contain any #target_ulong virtual address.
- */
-typedef uint64_t vaddr;
-#define VADDR_PRId PRId64
-#define VADDR_PRIu PRIu64
-#define VADDR_PRIo PRIo64
-#define VADDR_PRIx PRIx64
-#define VADDR_PRIX PRIX64
-#define VADDR_MAX UINT64_MAX
-
 /**
  * SECTION:cpu
  * @section_id: QEMU-cpu
-- 
2.34.1


