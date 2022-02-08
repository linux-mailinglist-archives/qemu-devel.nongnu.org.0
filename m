Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 593ED4AE280
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 21:14:24 +0100 (CET)
Received: from localhost ([::1]:33904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHWsY-0005yA-UN
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 15:14:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHWnY-00032K-6g
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 15:09:13 -0500
Received: from [2a00:1450:4864:20::42a] (port=41535
 helo=mail-wr1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHWnT-00066f-3t
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 15:09:11 -0500
Received: by mail-wr1-x42a.google.com with SMTP id k1so336047wrd.8
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 12:09:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=PrbYqH6sR5gz/Fz8Pqq4CFLsp5TPR2lRR6F+G57Ib0U=;
 b=xYFevFOPEzZ2XneBLARpjsj9i8smYzoSqvvQJ21OSJH7kD2AEEY0mEGcguKWcd+l76
 8sU8blbrJCrNCKUYwNCWyd8YVOuT4uc3buNb/EkQlyMW2C0kmXgWeGvLn30ChVGvUqbi
 IR5ZkherU6UDaku1tFdv+FdcbLf+IDUbaqW1RCh5zCGiOKuD7/BwUYmlBWz/PknxyJ7x
 z2/hqqpADDr/sOLgGlPUw4pSAoQjjWudxOzhTEPN8AXIo+vtjFxdvZEZ2fE0DZbokQ6U
 8AkSy5bAj+a5RBzBa5vxQbSzdhGCl8houc+kLj9MpxhQIWsPSDInEuRv+n+GrERjdnzy
 TLhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PrbYqH6sR5gz/Fz8Pqq4CFLsp5TPR2lRR6F+G57Ib0U=;
 b=e80hu5wH5GoY7cewPbHfwzWtjgmRyF/XoPR3hEzaiGmoHsX/tclvfuNIROap4iFeqD
 j/oqNsoD9qNnSpn/xh/1fVcn+98YaQGgYdpZYF8j7O+b11uLI9cXNBXKAoNYXGcYtWQw
 /tMzUmSCCjTNn7epMHjdF1Ag2jj3uMZ/MWI/b94/s5HY6S//i8HhGa4sTSaL3+A6o1Cg
 sCWVKwbGbP64s0YX2+0rw0NoKGqwKtDgkFv3oqjvqI05v+AP3Z7hbmA0eHeq0XfiX/BG
 9KBp9DBUK1NVLFiFcT0jRoU3yaVIM/+Rq1GJp+oUcxqFBwuU1OhgGF1PXibOV38R0wBe
 /Oig==
X-Gm-Message-State: AOAM531eN32epTcxcpcezMeZvcwuqoGr3tQl1av6095hXOKG63XSCpV/
 fMKMx/MvHc+LaEOn92gQTu0TtcMdQIA0Bw==
X-Google-Smtp-Source: ABdhPJxtH4VyRHcmh7M0lQ9vHNirjSFtv/qPZsrBtFtJFbNaes5BRMF8e76dd76PRJnch+RtLTeY+w==
X-Received: by 2002:adf:fecf:: with SMTP id q15mr4713762wrs.104.1644350940655; 
 Tue, 08 Feb 2022 12:09:00 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id r2sm4098170wmq.24.2022.02.08.12.09.00
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 12:09:00 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/5] include: Move QEMU_MAP_* constants to mmap-alloc.h
Date: Tue,  8 Feb 2022 20:08:54 +0000
Message-Id: <20220208200856.3558249-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220208200856.3558249-1-peter.maydell@linaro.org>
References: <20220208200856.3558249-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

The QEMU_MAP_* constants are used only as arguments to the
qemu_ram_mmap() function.  Move them to mmap-alloc.h, where that
function's prototype is defined.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
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
index 2a52933ce0e..0715d6b4509 100644
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


