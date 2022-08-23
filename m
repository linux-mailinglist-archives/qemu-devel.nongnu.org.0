Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D0CC59EEA2
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 00:08:33 +0200 (CEST)
Received: from localhost ([::1]:40114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQc4V-0005C1-Nx
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 18:08:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQc1u-0008FI-Fz
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 18:05:50 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:40755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQc1s-0001Pj-SU
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 18:05:50 -0400
Received: by mail-pl1-x62e.google.com with SMTP id x23so14021543pll.7
 for <qemu-devel@nongnu.org>; Tue, 23 Aug 2022 15:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=+TkWIdFQsuVrBlz1iMZEZBv2Eng982tGzQv+UxtokKc=;
 b=ogHPF1YDTP16bHxplKV5svr1jYj8fYHn+hG4xP/fCiq4yOaw1QIu0aOZb/PEJnTTue
 WX4YMDG2KBNzX3Rw01g3TWoUUttIyjzPBwQIA6Yq+UGYA6gtpxbEZaIhiq3JhMmIusyR
 biZduVRr1mYn7FDEnRansvK7bI/BuxCsPueBrzAXE/abPuPVLPttCqbzx0uL8ufoWnJG
 R/qvH5bSPjL/YFWlTbVQq5N9RD8hn5rcPQ7tFovJb8wZ+GurULJvCkdsNsJ4rXguOrhG
 x4Ab0CWGjCiMQpGokHwgbhVhWvabWRjeEs9XwGdSR8xjdgpCOpjq3xK0OwKt2FPdYyV7
 wDGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=+TkWIdFQsuVrBlz1iMZEZBv2Eng982tGzQv+UxtokKc=;
 b=257goKBICq1caqAKwTyUtbRAaxHXifpz3dMhox+M3sgBD22Pp7i+ZN6G+rcaqKL/fC
 b997ikDbOlOKZr0mfUAn4c7l1qKCJko8o+h6osFzHBcMLciPLxoPvFMxHd+xaYvRUR6M
 rfEoRCplpHu0gjm8ZD4YXvCxe+t1HZg3X2Xa36BZorknqEWF7W2NYyeIGtkN6vP5k3b0
 bL3jdia3RMwUrXEMxkcmfQTj9vob9sN8VFFWdH1ZTAgEQypp8HfRt6avn578ujufKDy0
 Gn4u5TTq8Dr+uQK+xpA3ydRRSTUicaDaU1KTJ91sqXbeRonaTdcD+pX3KCPfv/lmpgIj
 qTzA==
X-Gm-Message-State: ACgBeo2RdkyfEu3smmJhBy6inGTrGKQA7QgQBwdz1k6B6oa8Xw0EozWi
 4MkEyMgF9uzU26Z1jHFxMXZS/LiOezQH1g==
X-Google-Smtp-Source: AA6agR58us1e4TMsBTDavrkqtrIgJ9s5L5t61zpxBT7sVrG4AdhEXM+xZTUi6wytm3ykmJY4xlnj4w==
X-Received: by 2002:a17:902:e5c6:b0:16e:f3b6:ddb5 with SMTP id
 u6-20020a170902e5c600b0016ef3b6ddb5mr25993952plf.122.1661292347586; 
 Tue, 23 Aug 2022 15:05:47 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:46f9:77b4:ec0a:c2d9])
 by smtp.gmail.com with ESMTPSA id
 n12-20020a170902f60c00b0017292073839sm11020974plg.178.2022.08.23.15.05.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Aug 2022 15:05:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: iii@linux.ibm.com,
	laurent@vivier.eu,
	alex.bennee@linaro.org
Subject: [PATCH v7 02/20] linux-user/hppa: Allocate page zero as a commpage
Date: Tue, 23 Aug 2022 15:05:24 -0700
Message-Id: <20220823220542.1993395-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220823220542.1993395-1-richard.henderson@linaro.org>
References: <20220823220542.1993395-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

We're about to start validating PAGE_EXEC, which means that we've
got to mark page zero executable.  We had been special casing this
entirely within translate.

Acked-by: Ilya Leoshkevich <iii@linux.ibm.com>
Tested-by: Ilya Leoshkevich <iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/elfload.c | 34 +++++++++++++++++++++++++++++++---
 1 file changed, 31 insertions(+), 3 deletions(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 3e3dc02499..29d910c4cc 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -1646,6 +1646,34 @@ static inline void init_thread(struct target_pt_regs *regs,
     regs->gr[31] = infop->entry;
 }
 
+#define LO_COMMPAGE  0
+
+static bool init_guest_commpage(void)
+{
+    void *want = g2h_untagged(LO_COMMPAGE);
+    void *addr = mmap(want, qemu_host_page_size, PROT_NONE,
+                      MAP_ANONYMOUS | MAP_PRIVATE | MAP_FIXED, -1, 0);
+
+    if (addr == MAP_FAILED) {
+        perror("Allocating guest commpage");
+        exit(EXIT_FAILURE);
+    }
+    if (addr != want) {
+        return false;
+    }
+
+    /*
+     * On Linux, page zero is normally marked execute only + gateway.
+     * Normal read or write is supposed to fail (thus PROT_NONE above),
+     * but specific offsets have kernel code mapped to raise permissions
+     * and implement syscalls.  Here, simply mark the page executable.
+     * Special case the entry points during translation (see do_page_zero).
+     */
+    page_set_flags(LO_COMMPAGE, LO_COMMPAGE + TARGET_PAGE_SIZE,
+                   PAGE_EXEC | PAGE_VALID);
+    return true;
+}
+
 #endif /* TARGET_HPPA */
 
 #ifdef TARGET_XTENSA
@@ -2326,12 +2354,12 @@ static abi_ulong create_elf_tables(abi_ulong p, int argc, int envc,
 }
 
 #if defined(HI_COMMPAGE)
-#define LO_COMMPAGE 0
+#define LO_COMMPAGE -1
 #elif defined(LO_COMMPAGE)
 #define HI_COMMPAGE 0
 #else
 #define HI_COMMPAGE 0
-#define LO_COMMPAGE 0
+#define LO_COMMPAGE -1
 #define init_guest_commpage() true
 #endif
 
@@ -2555,7 +2583,7 @@ static void pgb_static(const char *image_name, abi_ulong orig_loaddr,
         } else {
             offset = -(HI_COMMPAGE & -align);
         }
-    } else if (LO_COMMPAGE != 0) {
+    } else if (LO_COMMPAGE != -1) {
         loaddr = MIN(loaddr, LO_COMMPAGE & -align);
     }
 
-- 
2.34.1


