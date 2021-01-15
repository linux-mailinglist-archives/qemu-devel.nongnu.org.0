Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C35A22F88FD
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 23:58:34 +0100 (CET)
Received: from localhost ([::1]:46668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0Y37-0005aV-Pf
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 17:58:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l0Xs3-0003Xd-QB
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 17:47:13 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:44028)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l0Xrt-0005D0-U0
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 17:47:04 -0500
Received: by mail-pl1-x62a.google.com with SMTP id x12so5437788plr.10
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 14:46:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uDiO56BD9yBVu0nwAI/hhOcXCMAfaRu426dsljY4dMQ=;
 b=Ii11emU21XXA52/szniJPxFW7eatwD+xZDT7o7o6j3R9fHAsGDCsRXujER8F9l0bV9
 qSFsWQUaSvCuosTkzdQHBEYqgy5E3uO+y66zlvQH6bmaVbyhmNMi4HMgmSERSNCNFF0a
 qr90BL4XHqOmZHQg9TGVCWCWX1r35lnVAxKZvyvb8z7PQ9oMAyss/4ZJ8IaWQ/9FqEgI
 WAI2nGwYzR+b6d7HYudUVrgXaHzrN2+OBADyBuqKXO8KBKOIgtyg6jYyDjZVtWZ7lqoq
 GEbdMwzoNSWo8WWZRHAiUmTNb6f9OmXGL162uoeHdIXzB8rWLeyxj6FBArY1DKBRWNMq
 Hmlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uDiO56BD9yBVu0nwAI/hhOcXCMAfaRu426dsljY4dMQ=;
 b=FPL4Hz4D02VtKypIq+bFXguNKYAeusPxJhGtzJE55fTXqilB8f2vzrimQujosrOmyw
 vHiyS8LaYKOwfKkBxNq7kygPHOJLmuZgr50MLkcZk4jdVXV65Kl/cbQ11r1uXBEw78Pq
 iRkt94NophRajbuslcVnHacLZiCXat+ZnIzw5GZbROdgjRWI1zGpeUTK7E6Gq2H6YcP0
 wVYIW3u2LkBG3C08Z6lsfHEImSMnlAVbsuZ1HNoAdv+mtZpe0J/kUGPRD+cJVitqTust
 w4ORj2Qoc71jioW4fd0HCEZySQVT9JLO6NYhPjTh7+5lGAsbOBbHBH49kKYZnGBZ+xyq
 VbYw==
X-Gm-Message-State: AOAM53279/xDD9XeraP5eY9EzmR5oo4cmFwEnWO1RL/r5ig6UY0iAY4s
 2qMVf4SxJ1S22JvcKRRUy81JGbLgdg4QNBhW
X-Google-Smtp-Source: ABdhPJxgO9LF9GZs8nh8w+N3IXQ9fG/yQg85ZY7eyDFiP1Kb+fx5SEuhsTdB2Lgh+euIMmdOUWZlCg==
X-Received: by 2002:a17:90a:5991:: with SMTP id
 l17mr1845333pji.187.1610750815323; 
 Fri, 15 Jan 2021 14:46:55 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id s13sm9521700pfd.99.2021.01.15.14.46.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 14:46:54 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 04/21] exec: Use uintptr_t in cpu_ldst.h
Date: Fri, 15 Jan 2021 12:46:28 -1000
Message-Id: <20210115224645.1196742-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210115224645.1196742-1-richard.henderson@linaro.org>
References: <20210115224645.1196742-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is more descriptive than 'unsigned long'.
No functional change, since these match on all linux+bsd hosts.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/cpu_ldst.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
index ef54cb7e1f..3f9063aade 100644
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
2.25.1


