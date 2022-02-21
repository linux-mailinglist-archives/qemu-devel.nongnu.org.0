Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBCED4BD88C
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 10:33:58 +0100 (CET)
Received: from localhost ([::1]:44260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nM54v-00035a-R2
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 04:33:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nM4zq-0000ET-Uw
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 04:28:47 -0500
Received: from [2a00:1450:4864:20::42a] (port=44922
 helo=mail-wr1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nM4zZ-000133-8V
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 04:28:42 -0500
Received: by mail-wr1-x42a.google.com with SMTP id u1so25877748wrg.11
 for <qemu-devel@nongnu.org>; Mon, 21 Feb 2022 01:28:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=47kr7ialX2Tci80N2MGQK32MRACMf87J895zSjNeWJ0=;
 b=q9vgzB1Wqqy0YGRP6+Z+ejb+tINwC7S2rd4XLFNm7C62oMI+CZ1C42YSF0SiPjUGXg
 3CeNB7jzf8Wt0Ft4oNQT5ybAhACVsud9JJZDGxnCEjY1h7D4Po1mBTstEYsuQRN4Z2Te
 9zUXc3TdYzWQStZCqmBRJty6qgYsPg5cNuyr6Ghanc80Q1TYTHQ93aamkZhVE5KHI8hC
 v+46Af34pjpizw3lR/Mi7h4I+dmydmM4E5c1f85n95VjLq7zjRRR02CMQrd1N6P/X8GZ
 ucKVnnWTLIN13n/4IFaRJdvkUIGASmjfe/m1UdyKFmGGKi08Es0dfAFYS3wrNDeJtH0H
 BHjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=47kr7ialX2Tci80N2MGQK32MRACMf87J895zSjNeWJ0=;
 b=b5rfc+CIY631Ka5Zxo8ZhwdDtJ+0jK2UdJ3IbDSK5Wbs9DuMistfAP5m+45iz8LPT/
 WEnOnbGwidLhMYuxa0zpi33Y3ik7x/FHLaeGntXroPko0jCDKZ41Vp8HlxKDQNZoEL4T
 ZotIPZmwRhymzOPL9hE6E2fAWSmWVcEIhwXH108/VtqpIy8HG/DFNdDAj1L6iB6h4AfD
 Ko5vPz0hzgL7yAN2PQyVf3bVNS4rR3axwLzEsf6bxV2w5buC2e+zDcaoi3MERNQtA1oJ
 8zWlyps8DBqUmBPrmuIFCCT7/+vhG8lkKcsOE49BvOFPFooDKUSw2owErsyK5yLheeI8
 xKiA==
X-Gm-Message-State: AOAM530tfd3+FDSsF4Ktt/ka9sSaCvw4cm0rqFc7pD7mT2C+yAF5OJg9
 G4tM2srGDOg7wqCJG30Af7SNBy041GYikA==
X-Google-Smtp-Source: ABdhPJzYNW0cWYxzbBFzVhG9IqhDNbHDmhc1NoSJlK6I5ot6bkGIfFK0J7+dmB9c6FAOrMujmKUGTA==
X-Received: by 2002:adf:fb8e:0:b0:1e3:241b:218c with SMTP id
 a14-20020adffb8e000000b001e3241b218cmr15087521wrr.359.1645435697023; 
 Mon, 21 Feb 2022 01:28:17 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id q76sm7555778wme.1.2022.02.21.01.28.16
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Feb 2022 01:28:16 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 18/26] include: Move QEMU_MAP_* constants to mmap-alloc.h
Date: Mon, 21 Feb 2022 09:27:52 +0000
Message-Id: <20220221092800.404870-19-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220221092800.404870-1-peter.maydell@linaro.org>
References: <20220221092800.404870-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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

The QEMU_MAP_* constants are used only as arguments to the
qemu_ram_mmap() function.  Move them to mmap-alloc.h, where that
function's prototype is defined.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220208200856.3558249-4-peter.maydell@linaro.org
---
 include/qemu/mmap-alloc.h | 23 +++++++++++++++++++++++
 include/qemu/osdep.h      | 25 -------------------------
 2 files changed, 23 insertions(+), 25 deletions(-)

diff --git a/include/qemu/mmap-alloc.h b/include/qemu/mmap-alloc.h
index 90d0eee7053..5076695cc81 100644
--- a/include/qemu/mmap-alloc.h
+++ b/include/qemu/mmap-alloc.h
@@ -35,4 +35,27 @@ void *qemu_ram_mmap(int fd,
 
 void qemu_ram_munmap(int fd, void *ptr, size_t size);
 
+/*
+ * Abstraction of PROT_ and MAP_ flags as passed to mmap(), for example,
+ * consumed by qemu_ram_mmap().
+ */
+
+/* Map PROT_READ instead of PROT_READ | PROT_WRITE. */
+#define QEMU_MAP_READONLY   (1 << 0)
+
+/* Use MAP_SHARED instead of MAP_PRIVATE. */
+#define QEMU_MAP_SHARED     (1 << 1)
+
+/*
+ * Use MAP_SYNC | MAP_SHARED_VALIDATE if supported. Ignored without
+ * QEMU_MAP_SHARED. If mapping fails, warn and fallback to !QEMU_MAP_SYNC.
+ */
+#define QEMU_MAP_SYNC       (1 << 2)
+
+/*
+ * Use MAP_NORESERVE to skip reservation of swap space (or huge pages if
+ * applicable). Bail out if not supported/effective.
+ */
+#define QEMU_MAP_NORESERVE  (1 << 3)
+
 #endif
diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index ca00899bbd2..165448b12f8 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -401,31 +401,6 @@ static inline void qemu_cleanup_generic_vfree(void *p)
  */
 #define QEMU_AUTO_VFREE __attribute__((cleanup(qemu_cleanup_generic_vfree)))
 
-/*
- * Abstraction of PROT_ and MAP_ flags as passed to mmap(), for example,
- * consumed by qemu_ram_mmap().
- */
-
-/* Map PROT_READ instead of PROT_READ | PROT_WRITE. */
-#define QEMU_MAP_READONLY   (1 << 0)
-
-/* Use MAP_SHARED instead of MAP_PRIVATE. */
-#define QEMU_MAP_SHARED     (1 << 1)
-
-/*
- * Use MAP_SYNC | MAP_SHARED_VALIDATE if supported. Ignored without
- * QEMU_MAP_SHARED. If mapping fails, warn and fallback to !QEMU_MAP_SYNC.
- */
-#define QEMU_MAP_SYNC       (1 << 2)
-
-/*
- * Use MAP_NORESERVE to skip reservation of swap space (or huge pages if
- * applicable). Bail out if not supported/effective.
- */
-#define QEMU_MAP_NORESERVE  (1 << 3)
-
-
-
 #ifdef _WIN32
 #define HAVE_CHARDEV_SERIAL 1
 #elif defined(__linux__) || defined(__sun__) || defined(__FreeBSD__)    \
-- 
2.25.1


