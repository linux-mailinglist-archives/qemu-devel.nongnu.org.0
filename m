Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C338630880E
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 12:07:20 +0100 (CET)
Received: from localhost ([::1]:51380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5RcV-0004cy-QU
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 06:07:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5RW4-0004RG-W2
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:00:41 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:37915)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5RVr-0006yX-Mg
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:00:40 -0500
Received: by mail-wr1-x42b.google.com with SMTP id s7so5397447wru.5
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 03:00:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=wUKwKAR4mrxHk/aDOVAn0j/MLIPGv5LCN37QdLveryo=;
 b=SmZ3tJYK8HHwcR+p+8matgsOpGA2MXXFKtUaIt+hhaWb5lnWlNwNznBge3Oek8a0F/
 ln5ykOBEJliA4tdXxavCPasSZCvGWCSkhXOQOok3beytj0ogtAF/8nq6qnY9x4FjJLKv
 tWQm/uEe+cIC7T3AaD4oPQND4QAMjrZ8/CjH+K/+6B2i/t6oo9Zj3MCREZW4K+kAHg5b
 gDvwcYGIDDDJQvPiym045x52hW2To9AmvEGAPcSyS/HaY+XLVw5x8zh8xREor3XEcij5
 HLo26Yx4OpoHIQ4x7huw0UKuA6/+fL1l3e8qTphwxY6N0zDv8pOdpdMc93soOkUbK7kP
 pdwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wUKwKAR4mrxHk/aDOVAn0j/MLIPGv5LCN37QdLveryo=;
 b=MJzkcXtYROMCDr9GhTGUPjkK2dG7wg5aUDuj1IyQDXfFckH+V+s5BaoAlYb8gi0GY+
 9GFU8QMZEbIaVgiy1F8lXW6eMzGdjdwuwZm5gI6GOl1Pt4t+f60PEMU4eqxBpQEESyHU
 li+CbE+tq5NNPC2kOwmgZUR2NejIi7Qyda8LCJ/qJjFu6gqLF/PE3TirdR86csZkb702
 3oemIkV4bNn/DxZ/MIOlXTEXWovbe60WOzn7cCUTkCckjhaQZkDM5oQtBaEeSd/DNmFB
 UzH3/1M5xI3+IPG2sSCcGPWKgOh6Tbj/UXunmHk67SiSFt2cYWLRIZUQSlu0S2nNN6KG
 xCnA==
X-Gm-Message-State: AOAM531jq5asAUuQbx1Hze8zxWkBEQ2G69EA0gN15BE17LHzrMRngGCl
 x8REHE3ug4jn4eROp2iw7kHGbv6ExP7/Hw==
X-Google-Smtp-Source: ABdhPJza/WWcLi6S3aZ5qaA593ToT5yzglCGTLAFSv2xjypUa1mMKQKfa43XAakL/8P/x9KAjIzMtg==
X-Received: by 2002:adf:b1da:: with SMTP id r26mr4129130wra.198.1611918025270; 
 Fri, 29 Jan 2021 03:00:25 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id w20sm9268761wmm.12.2021.01.29.03.00.24
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 03:00:24 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 11/46] osdep: build with non-working system() function
Date: Fri, 29 Jan 2021 10:59:37 +0000
Message-Id: <20210129110012.8660-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210129110012.8660-1-peter.maydell@linaro.org>
References: <20210129110012.8660-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
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

From: Joelle van Dyne <j@getutm.app>

Build without error on hosts without a working system(). If system()
is called, return -1 with ENOSYS.

Signed-off-by: Joelle van Dyne <j@getutm.app>
Message-id: 20210126012457.39046-6-j@getutm.app
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 meson.build          |  1 +
 include/qemu/osdep.h | 12 ++++++++++++
 2 files changed, 13 insertions(+)

diff --git a/meson.build b/meson.build
index 27c31caa2d1..9ecb09dfe21 100644
--- a/meson.build
+++ b/meson.build
@@ -1127,6 +1127,7 @@ config_host_data.set('HAVE_DRM_H', cc.has_header('libdrm/drm.h'))
 config_host_data.set('HAVE_PTY_H', cc.has_header('pty.h'))
 config_host_data.set('HAVE_SYS_IOCCOM_H', cc.has_header('sys/ioccom.h'))
 config_host_data.set('HAVE_SYS_KCOV_H', cc.has_header('sys/kcov.h'))
+config_host_data.set('HAVE_SYSTEM_FUNCTION', cc.has_function('system', prefix: '#include <stdlib.h>'))
 
 config_host_data.set('CONFIG_PREADV', cc.has_function('preadv', prefix: '#include <sys/uio.h>'))
 
diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index b6ffdc15bf3..ba15be9c569 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -710,4 +710,16 @@ static inline void qemu_thread_jit_write(void) {}
 static inline void qemu_thread_jit_execute(void) {}
 #endif
 
+/**
+ * Platforms which do not support system() return ENOSYS
+ */
+#ifndef HAVE_SYSTEM_FUNCTION
+#define system platform_does_not_support_system
+static inline int platform_does_not_support_system(const char *command)
+{
+    errno = ENOSYS;
+    return -1;
+}
+#endif /* !HAVE_SYSTEM_FUNCTION */
+
 #endif
-- 
2.20.1


