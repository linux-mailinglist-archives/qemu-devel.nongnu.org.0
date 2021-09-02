Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 013463FF84F
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 02:17:11 +0200 (CEST)
Received: from localhost ([::1]:58062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLwtK-00086B-17
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 20:17:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mLwRF-0006xm-DZ
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 19:48:09 -0400
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136]:34601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mLwRD-00033d-F6
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 19:48:09 -0400
Received: by mail-il1-x136.google.com with SMTP id j15so3581074ila.1
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 16:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LfrE81ZrxSCq64hVLSr9n7zzdJ11Q73sKolgD5sAWUM=;
 b=BHRG4FtTu+HF0WcI9fOsImByqR1nD1ZRWh/SywvTqH5p3un8i44TsPSEiVj/V6NPFr
 o5H/NT5pPEcyyjb7RwCX0u8++ZrE9KBSjDIeC45CYqN00x2XiOiDry20e/72kNkvkSoy
 51KQ7Si18sCdTociiQUCLnNISP7530PH+373yKxIRe5wc3HGxVrm1Q9VklMvIqX39DmP
 WTLfEnRLW9VR52HVXOOiEepopedHbncy+DfZuVcpTGuCaWd5QiNUIQjozivhRnWOP+a0
 NP30ntdaIZJLox9VuR+mtCF0oE1Ho41f+KWMhELFMEWc+343Hy3jub3cqZv2IPM5lJWp
 MueA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LfrE81ZrxSCq64hVLSr9n7zzdJ11Q73sKolgD5sAWUM=;
 b=C6iXXkGFVQEkNXqp9oKewWW66L9XVCxn22aEolSJTocx9jmpllc2gy9/oADJ0T8I9P
 LAKlv/9QnXD1A+ZLzpyg+l6mcyK1vOB9RdarobQdpyIYaf8lpihMZeR+En/JZwqoKH9L
 gbLxgib3BFXm7WrCZxRr+GTz4Q+6YJ0pBKQvC66D7rQ/2HEMmKCcNnvB1HFMLwOdjiAo
 CcKWuEFphnsLLnESjE4O15ELpPoZjCAnmR2+21ZCYyZ/jYGhGDtSXb7Q0sDcxIIJpB4B
 0RemOwdw20SGVCC/UNJSEfSOu3AIx1IG4J6S3DMA37YTX0a6p2yhmrLrVF+Yh9W+OB9X
 hTkw==
X-Gm-Message-State: AOAM533yRuEOcrLHKiSpJwmK5bm7bbSLCTGLUjSJRIiXp1LAm1yEefHh
 D43SR9e2KOd8g74IugFzh5r3xFMfiQa+uA==
X-Google-Smtp-Source: ABdhPJyB7Edoj1btCUYpGL6p6hyjA2vstOUN5vqGdd8Xmlez4XYMGk1tFilAgwmrQoA9ySr46hr55g==
X-Received: by 2002:a05:6e02:1d9e:: with SMTP id
 h30mr519686ila.195.1630626486022; 
 Thu, 02 Sep 2021 16:48:06 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id u10sm1740502ilg.15.2021.09.02.16.48.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 16:48:05 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PATCH v3 23/43] bsd-user: define max args in terms of pages
Date: Thu,  2 Sep 2021 17:47:09 -0600
Message-Id: <20210902234729.76141-24-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210902234729.76141-1-imp@bsdimp.com>
References: <20210902234729.76141-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::136;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x136.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: kevans@freebsd.org, Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@FreeBSD.org>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@FreeBSD.org>

For 32-bit platforms, pass in up to 256k of args. For 64-bit, bump that
to 512k.

Signed-off-by: Kyle Evans <kevans@freebsd.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/qemu.h | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index 55d71130bb..fea1a167e4 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -20,6 +20,7 @@
 
 #include "qemu/osdep.h"
 #include "cpu.h"
+#include "qemu/units.h"
 #include "exec/cpu_ldst.h"
 #include "exec/exec-all.h"
 
@@ -101,11 +102,17 @@ extern const char *qemu_uname_release;
 extern unsigned long mmap_min_addr;
 
 /*
- * MAX_ARG_PAGES defines the number of pages allocated for arguments
- * and envelope for the new program. 32 should suffice, this gives
- * a maximum env+arg of 128kB w/4KB pages!
+ * TARGET_ARG_MAX defines the number of bytes allocated for arguments
+ * and envelope for the new program. 256k should suffice for a reasonable
+ * maxiumum env+arg in 32-bit environments, bump it up to 512k for !ILP32
+ * platforms.
  */
-#define MAX_ARG_PAGES 32
+#if TARGET_ABI_BITS > 32
+#define TARGET_ARG_MAX (512 * KiB)
+#else
+#define TARGET_ARG_MAX (256 * KiB)
+#endif
+#define MAX_ARG_PAGES (TARGET_ARG_MAX / TARGET_PAGE_SIZE)
 
 /*
  * This structure is used to hold the arguments that are
-- 
2.32.0


