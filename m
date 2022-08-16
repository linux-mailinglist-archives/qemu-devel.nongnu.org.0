Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 303C75963D4
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 22:41:49 +0200 (CEST)
Received: from localhost ([::1]:51806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oO3Nk-00009r-8r
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 16:41:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oO3GP-0004fU-Oe
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 16:34:13 -0400
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f]:33620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oO3GO-0004TO-3k
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 16:34:13 -0400
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-10edfa2d57dso12982428fac.0
 for <qemu-devel@nongnu.org>; Tue, 16 Aug 2022 13:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=aJaNQ6aSdE9rWibAJT4lh7LTRwz3SqqWw+/j8K8vQwg=;
 b=oEnMed6tOl3Y+xrLCmvfWgfuaWYWu3X97xgc/ysSM9aVPWfbLsw6DQwmi77+Kwshfg
 tkgqfIcJaqD7iI3n1EktcX/lH3sdryHe/fiJtnqIx3xjnwwKH/c+rw5qY1IYvtteTTMP
 CDBo/zOLPFWGYqXJazEynH973s0k6lL+akWmhV+f6RQK7gUSX6M0G/G4OaMSVM05Igjd
 Ora/qx2GvapfmEWp79EBQRS3PVu67MQBdDrwe9yKGxHPWM+0gvQ2psUntEveFX3/WBQK
 VK1B1nki5NwOymq4tjFO13oaH03ZnwcHyo/UyzKdFr80JXAWpFFhlAiJafJ3x9kjOb4p
 c5Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=aJaNQ6aSdE9rWibAJT4lh7LTRwz3SqqWw+/j8K8vQwg=;
 b=OM7X8xR00cLQKmHakxzwbm/gGW1OPZMLu0V+x5NmSSqk0HG2QYpsiRuob6w9P4hltr
 tgiCoDV4Ax3SDw4Qov2OI5sn20w2+dO/lUIz/Hxhh6S5BneWh74wPDOSfj4XX06f3eoc
 j+1Ta4NngOQoaMsXZAhTAj6gQHbaFR31aZppTsmFPiiaxzUqM5ZALPhJ83ENxk4gO5al
 x4xm2+nYGCrFlyEls8C3h4Jcydm92O0jO8CSmhjSwpVBmX8Izmt3U5OhKXMF0ior5a/Y
 REJ5GzP4shhB77qIKIgbjHK1ExNFUlK+x9A2IujSEr0YW2H1ifQk+l3oYWMp3kmDfT7j
 0z+w==
X-Gm-Message-State: ACgBeo0uyz10bxGWESgxQEvTC0KmQr/hNQ+lzg7gZciU2GQ3MnxZkA4w
 Ia/W9KVWBY/63/+EmeHMGLtRnaeZxzk8+w==
X-Google-Smtp-Source: AA6agR5QloLnexmhB6aaW0yHTIzd3pfTqjdlI8EYIxlgEb2CSRznLrbSrCzZDw927/ez7i06DuLZWw==
X-Received: by 2002:a05:6870:5584:b0:10d:ccda:433c with SMTP id
 n4-20020a056870558400b0010dccda433cmr135106oao.185.1660682050234; 
 Tue, 16 Aug 2022 13:34:10 -0700 (PDT)
Received: from stoup.. ([2605:ef80:80f6:61fa:9bc2:5095:d612:5e22])
 by smtp.gmail.com with ESMTPSA id
 y23-20020a056870b01700b0010ef8ccde67sm2285220oae.13.2022.08.16.13.34.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Aug 2022 13:34:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	iii@linux.ibm.com
Subject: [PATCH v2 02/33] linux-user/hppa: Allocate page zero as a commpage
Date: Tue, 16 Aug 2022 15:33:29 -0500
Message-Id: <20220816203400.161187-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220816203400.161187-1-richard.henderson@linaro.org>
References: <20220816203400.161187-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2f;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2f.google.com
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


