Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD465064AF
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 08:41:15 +0200 (CEST)
Received: from localhost ([::1]:60790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nghY2-0000IE-Pt
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 02:41:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nggmF-0001FA-G8
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 01:51:52 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:41528)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nggly-0004Rj-Pf
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 01:51:51 -0400
Received: by mail-wr1-x434.google.com with SMTP id e21so20911117wrc.8
 for <qemu-devel@nongnu.org>; Mon, 18 Apr 2022 22:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+i7r/TfTxXm7W7xbct2uv6xQtR/0n9zjhJWiUVcwXM8=;
 b=U2v73/aUFPUvivjBH7haiWst8CXhIt3zVcfQCEMOsM/3XBwjAVLThYixigZdajgNxf
 bhnX1MmvVXFG6W52UWqmsQHw8M+wWfCyr6VS12F9w6H4TLsWnks+obFBwuecZ02IvwV4
 QCvf5HVNp4L2X4CGIKQuN1p8cpSl4RFVR8M/DsrgiIj3DGHxKD7y1r32UneGM9ga55Oi
 WhwLNhuHXQnM39EeoHGK+B2xITu5AiL1JjD0xFiipLBfz3VcQ5QRb6kxzBQWIRMy6eJW
 TK7x9Z9d+9Z5NFI1pETr37PDQyshcipTMPDT/FdIUPwdoUBz+aHz1VlgknJhPb45M7Lh
 iOxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=+i7r/TfTxXm7W7xbct2uv6xQtR/0n9zjhJWiUVcwXM8=;
 b=CmlZsl20UXT+k/z+k3iv9f3HuHYIWS16uOC0j55VmKPBPgFSXUdAeAh0FqMzETqPwP
 0DTDIw92WazantxR8kxPrGZQlXJ86LGFgJIUa9M8nVloz0RU5yYk6Gm4YP0aPtomwbUe
 V3AqhcXGr/rdj9yv1nSLlbfRi/QIDKtxP12VubKy1+fINkrjJdfD8lTJtP1Nane/0J/J
 T4MJzZUI0UHeaye+QhtUybnQId1ui1l7wis1/wBL6GqFiIVDYSlEBmqRbnRSZSZXwDFq
 Ax2XS8PVgPhQuAU+6pH7GAGICnyhSAPFPtvOWl4oVVuaVfFLaltpJX8IPUclmAumWbq7
 oXLg==
X-Gm-Message-State: AOAM531b0r+bLO+p5yCG0FmREemPq59dOPowcRKcHYQscl9iZy3k5wgj
 ESFu0UKFqopmNxnKr5XQwww18KVW+ZzVVQ==
X-Google-Smtp-Source: ABdhPJwBX3AvDUp6keRGAOcqckgDi+QOPAw7hMEy7qZqmKVsTCB5oV89ceG1thUdLHG1sI/ZRldUMw==
X-Received: by 2002:a5d:6487:0:b0:20a:a600:c512 with SMTP id
 o7-20020a5d6487000000b0020aa600c512mr1476880wri.560.1650347491893; 
 Mon, 18 Apr 2022 22:51:31 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.gmail.com with ESMTPSA id
 bg8-20020a05600c3c8800b0038e4c5967besm15763510wmb.3.2022.04.18.22.51.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Apr 2022 22:51:31 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 28/53] include: move target page bits declaration to page-vary.h
Date: Tue, 19 Apr 2022 07:50:44 +0200
Message-Id: <20220419055109.142788-29-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220419055109.142788-1-pbonzini@redhat.com>
References: <20220419055109.142788-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, PP_MIME_FAKE_ASCII_TEXT=0.999,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Since the implementation unit is page-vary.c.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220323155743.1585078-24-marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/exec/page-vary.h | 18 ++++++++++++++++++
 include/qemu-common.h    | 17 -----------------
 page-vary.c              |  2 +-
 softmmu/physmem.c        |  2 +-
 softmmu/vl.c             |  1 +
 target/arm/cpu.c         |  2 +-
 6 files changed, 22 insertions(+), 20 deletions(-)

diff --git a/include/exec/page-vary.h b/include/exec/page-vary.h
index c22a7a742e..ebbe9b169b 100644
--- a/include/exec/page-vary.h
+++ b/include/exec/page-vary.h
@@ -31,4 +31,22 @@ extern bool set_preferred_target_page_bits_common(int bits);
 extern void finalize_target_page_bits_common(int min);
 #endif
 
+/**
+ * set_preferred_target_page_bits:
+ * @bits: number of bits needed to represent an address within the page
+ *
+ * Set the preferred target page size (the actual target page
+ * size may be smaller than any given CPU's preference).
+ * Returns true on success, false on failure (which can only happen
+ * if this is called after the system has already finalized its
+ * choice of page size and the requested page size is smaller than that).
+ */
+bool set_preferred_target_page_bits(int bits);
+
+/**
+ * finalize_target_page_bits:
+ * Commit the final value set by set_preferred_target_page_bits.
+ */
+void finalize_target_page_bits(void);
+
 #endif /* EXEC_PAGE_VARY_H */
diff --git a/include/qemu-common.h b/include/qemu-common.h
index ced260d08b..bc73daecb4 100644
--- a/include/qemu-common.h
+++ b/include/qemu-common.h
@@ -24,23 +24,6 @@
 int qemu_main(int argc, char **argv, char **envp);
 #endif
 
-/**
- * set_preferred_target_page_bits:
- * @bits: number of bits needed to represent an address within the page
- *
- * Set the preferred target page size (the actual target page
- * size may be smaller than any given CPU's preference).
- * Returns true on success, false on failure (which can only happen
- * if this is called after the system has already finalized its
- * choice of page size and the requested page size is smaller than that).
- */
-bool set_preferred_target_page_bits(int bits);
-
-/**
- * finalize_target_page_bits:
- * Commit the final value set by set_preferred_target_page_bits.
- */
-void finalize_target_page_bits(void);
 
 void qemu_progress_init(int enabled, float min_skip);
 void qemu_progress_end(void);
diff --git a/page-vary.c b/page-vary.c
index 057c7f1815..343b4adb95 100644
--- a/page-vary.c
+++ b/page-vary.c
@@ -20,7 +20,7 @@
 #define IN_PAGE_VARY 1
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
+#include "exec/page-vary.h"
 #include "exec/exec-all.h"
 
 bool set_preferred_target_page_bits(int bits)
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index cdf0db733e..657841eed0 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -18,7 +18,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
+#include "exec/page-vary.h"
 #include "qapi/error.h"
 
 #include "qemu/cutils.h"
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 6f646531a0..46aba6a039 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -27,6 +27,7 @@
 #include "qemu/datadir.h"
 #include "qemu/units.h"
 #include "exec/cpu-common.h"
+#include "exec/page-vary.h"
 #include "hw/qdev-properties.h"
 #include "qapi/compat-policy.h"
 #include "qapi/error.h"
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 0980d33901..3609de0888 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -22,7 +22,7 @@
 #include "qemu/qemu-print.h"
 #include "qemu/timer.h"
 #include "qemu/log.h"
-#include "qemu-common.h"
+#include "exec/page-vary.h"
 #include "target/arm/idau.h"
 #include "qemu/module.h"
 #include "qapi/error.h"
-- 
2.35.1



