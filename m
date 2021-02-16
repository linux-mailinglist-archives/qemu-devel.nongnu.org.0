Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC6E31CDD7
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 17:19:19 +0100 (CET)
Received: from localhost ([::1]:59518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC34H-0000Q3-8G
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 11:19:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lC32F-0006yB-Ru
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 11:17:11 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:38562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lC328-0002MK-Qf
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 11:17:11 -0500
Received: by mail-wm1-x336.google.com with SMTP id x4so15009182wmi.3
 for <qemu-devel@nongnu.org>; Tue, 16 Feb 2021 08:17:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=+NAflEZcFdaRslOS7OY9WO2OvINuWrOKI1AQgGCdq5E=;
 b=wI0EGYdyVSTeA62Cug/wdDEegQGCGDbscjshcFZ9Pf/qpfiWl275gxmsIU+wlqI6Oa
 NyMq4G9tKmRUwyGCTMG8nkJ4hS4Oposrz5RLsAjeO4w+iz/LsUToM9MxvhOW3FUNJp/u
 dGo1Ki2OOCRtPlDlW6QE784hg9yYmGApVBIN2IhvHaIL3hmwewRdrastCRiwYmYZBnCd
 Sb4XeCNRuLNdJzSaAfZuWNj5lznqo71BL6x/FT5JwxAzVEDZo62s1ehfxJWuTL021pWM
 dUnHo+7B/5gPy81e/c+PWbq+mpjT9z9HmT0rP/275RdhgteW9imQDnFgBWIYmnzVvtWg
 5U+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+NAflEZcFdaRslOS7OY9WO2OvINuWrOKI1AQgGCdq5E=;
 b=rqqxs8GDMm0HSB6mq6g+tIgZlZ+3HCDyTpbC/zPiijGIw9Nq2V9s20b7mjikCC1cu/
 UIUHK5qHIRvA9h91O0/cjXM9gL6conTUWwEo756TPVx1Bv3VGPGGD67Bg/reVmQRx2om
 CZULptKtygNyMVlIxpuuRBcrk64E7uYkN/MXhLUm3KyOw16g2D2zmDuixt3bStGhBI04
 juZ4AC3VM1Z+CW8smZtBCPugvGUb7FhBs+jDHRo/c6pjdor6cMtC49SUBR9lbPhnwiFS
 R/vT82V+HUnhgVrHwpwV00EHU3wU2OzY+xZqVNPgn5/JLuIXgLjAIfRNppWrKnnDQ0sr
 rYZg==
X-Gm-Message-State: AOAM532yTaQTj0goCDd1pT/XhoroBLcQUo6fcXbaV55V4bfj0O/MbY6I
 iON4ODWJ38D4Daam591LWPVW6hTbPf25cw==
X-Google-Smtp-Source: ABdhPJxSkiRGs5GA1matfQsrMwmJPkO567Qw0BY5RzEqKwBm+UvbI+mohOgnmdBCRSv63peIqJkuYQ==
X-Received: by 2002:a1c:31d5:: with SMTP id x204mr3825310wmx.175.1613492223335; 
 Tue, 16 Feb 2021 08:17:03 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d5sm30630482wrb.14.2021.02.16.08.17.02
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Feb 2021 08:17:03 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 04/40] exec: Use uintptr_t in cpu_ldst.h
Date: Tue, 16 Feb 2021 16:16:22 +0000
Message-Id: <20210216161658.29881-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210216161658.29881-1-peter.maydell@linaro.org>
References: <20210216161658.29881-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

This is more descriptive than 'unsigned long'.
No functional change, since these match on all linux+bsd hosts.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20210212184902.1251044-5-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/exec/cpu_ldst.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
index ef54cb7e1f8..3f9063aaded 100644
--- a/include/exec/cpu_ldst.h
+++ b/include/exec/cpu_ldst.h
@@ -70,14 +70,14 @@ typedef uint64_t abi_ptr;
 #endif
 
 /* All direct uses of g2h and h2g need to go away for usermode softmmu.  */
-#define g2h(x) ((void *)((unsigned long)(abi_ptr)(x) + guest_base))
+#define g2h(x) ((void *)((uintptr_t)(abi_ptr)(x) + guest_base))
 
 #if HOST_LONG_BITS <= TARGET_VIRT_ADDR_SPACE_BITS
 #define guest_addr_valid(x) (1)
 #else
 #define guest_addr_valid(x) ((x) <= GUEST_ADDR_MAX)
 #endif
-#define h2g_valid(x) guest_addr_valid((unsigned long)(x) - guest_base)
+#define h2g_valid(x) guest_addr_valid((uintptr_t)(x) - guest_base)
 
 static inline int guest_range_valid(unsigned long start, unsigned long len)
 {
@@ -85,7 +85,7 @@ static inline int guest_range_valid(unsigned long start, unsigned long len)
 }
 
 #define h2g_nocheck(x) ({ \
-    unsigned long __ret = (unsigned long)(x) - guest_base; \
+    uintptr_t __ret = (uintptr_t)(x) - guest_base; \
     (abi_ptr)__ret; \
 })
 
-- 
2.20.1


