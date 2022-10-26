Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D3360D925
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 04:18:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onVuD-00050n-LP; Tue, 25 Oct 2022 22:12:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onVuB-0004zr-C5
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 22:12:31 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onVu9-0001FG-JI
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 22:12:31 -0400
Received: by mail-pg1-x52f.google.com with SMTP id h185so13420011pgc.10
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 19:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7vkvjsyBKftxlM+MwiEXEaU+OzRW/iKjyp1yuoAXQHA=;
 b=KxbfJqICJahw+XEAcbJ6wv5tOkXv9OLgrzaTIRB+hNrzlYhCv9s3G/471BxtQAeSaB
 gcxgErEnuT4ke78j3u+iZUBAx8SIOCGhZW65xDjiUV5/T8u033/KbiL5pQ6jh+SInLSe
 OWHfLRAkmUWkloy/DXEcyAJM8Y8hnpe1/WsCFQi6NqSebLYm1juBu2jZSquN0PuGjUwX
 iFyKljJCV2tgXvmKGkqf5+8jvRlaGvg6vtDO1E1iRKtuCd3f91RQkr/j0JExm8NOaZ0E
 XeSgd4zZc2SGtrFrsla5iJsXs3+AH88FNmpvsMlX+5yDnrqqk+mnZYh/XA0SLwgLXG84
 fxHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7vkvjsyBKftxlM+MwiEXEaU+OzRW/iKjyp1yuoAXQHA=;
 b=jHKjL5PAG9Law6MYui/kniB7bGlHaFH54dNh3bT+W3rxPBuk+bLqhFoniCZDh4suMM
 gkCn+SRKcx7Im3VhdaGsokFTW/mrbHOtHDzSIeH8Q3X7Dk+VkBHvIkOEV0A/MAQPRBkT
 yqMdCtH/SdvjeNlzDqZ2J1nyOdOsCwvtRbqEDSmVKpUnQr24vqhGnxlzYqW+6dSjbJ59
 38hI+3XjUU0lc+Ki3ijZ5a86DiKTV5ZuyADXNy1z0uhV1ERUErctJw59YK3kN/CyE6sT
 02k8hjOsiU37z5vhKvHoX3gjiXNeIHYecnrLqmH3FCqx6BZEwwtNBSVaBq54RmzrCMd6
 xM2w==
X-Gm-Message-State: ACrzQf0VySh3/WHp75DMVIzWNLP48q0mp3AIJouoR/nhUe8VyvvxmYiy
 id9nV73f/QWGN7pioxPvLuJbC6D8s3KAdlgL
X-Google-Smtp-Source: AMsMyM4AAaNBeP0/NCEAUJRNiYcAR68ek+chScJtvWDZnnEurzkJ51qk+7K/PDryyt9VR4IbX1/3Kw==
X-Received: by 2002:a05:6a00:e1b:b0:537:7c74:c405 with SMTP id
 bq27-20020a056a000e1b00b005377c74c405mr41845312pfb.43.1666750348141; 
 Tue, 25 Oct 2022 19:12:28 -0700 (PDT)
Received: from stoup.hotspotlogin.services ([103.100.225.182])
 by smtp.gmail.com with ESMTPSA id
 o29-20020a635d5d000000b0043c9da02729sm1897833pgm.6.2022.10.25.19.12.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 19:12:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 23/47] accel/tcg: Move TARGET_PAGE_DATA_SIZE impl to user-exec.c
Date: Wed, 26 Oct 2022 12:10:52 +1000
Message-Id: <20221026021116.1988449-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221026021116.1988449-1-richard.henderson@linaro.org>
References: <20221026021116.1988449-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Since "target data" is always user-only, move it out of
translate-all.c to user-exec.c.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/translate-all.c | 50 ---------------------------------------
 accel/tcg/user-exec.c     | 50 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 50 insertions(+), 50 deletions(-)

diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index eea24dea96..433fa247f4 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -1399,56 +1399,6 @@ void page_set_flags(target_ulong start, target_ulong end, int flags)
     }
 }
 
-void page_reset_target_data(target_ulong start, target_ulong end)
-{
-#ifdef TARGET_PAGE_DATA_SIZE
-    target_ulong addr, len;
-
-    /*
-     * This function should never be called with addresses outside the
-     * guest address space.  If this assert fires, it probably indicates
-     * a missing call to h2g_valid.
-     */
-    assert(end - 1 <= GUEST_ADDR_MAX);
-    assert(start < end);
-    assert_memory_lock();
-
-    start = start & TARGET_PAGE_MASK;
-    end = TARGET_PAGE_ALIGN(end);
-
-    for (addr = start, len = end - start;
-         len != 0;
-         len -= TARGET_PAGE_SIZE, addr += TARGET_PAGE_SIZE) {
-        PageDesc *p = page_find_alloc(addr >> TARGET_PAGE_BITS, 1);
-
-        g_free(p->target_data);
-        p->target_data = NULL;
-    }
-#endif
-}
-
-#ifdef TARGET_PAGE_DATA_SIZE
-void *page_get_target_data(target_ulong address)
-{
-    PageDesc *p = page_find(address >> TARGET_PAGE_BITS);
-    return p ? p->target_data : NULL;
-}
-
-void *page_alloc_target_data(target_ulong address)
-{
-    PageDesc *p = page_find(address >> TARGET_PAGE_BITS);
-    void *ret = NULL;
-
-    if (p->flags & PAGE_VALID) {
-        ret = p->target_data;
-        if (!ret) {
-            p->target_data = ret = g_malloc0(TARGET_PAGE_DATA_SIZE);
-        }
-    }
-    return ret;
-}
-#endif /* TARGET_PAGE_DATA_SIZE */
-
 int page_check_range(target_ulong start, target_ulong len, int flags)
 {
     PageDesc *p;
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index 521aa8b61e..927b91900f 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -210,6 +210,56 @@ tb_page_addr_t get_page_addr_code_hostp(CPUArchState *env, target_ulong addr,
     return addr;
 }
 
+void page_reset_target_data(target_ulong start, target_ulong end)
+{
+#ifdef TARGET_PAGE_DATA_SIZE
+    target_ulong addr, len;
+
+    /*
+     * This function should never be called with addresses outside the
+     * guest address space.  If this assert fires, it probably indicates
+     * a missing call to h2g_valid.
+     */
+    assert(end - 1 <= GUEST_ADDR_MAX);
+    assert(start < end);
+    assert_memory_lock();
+
+    start = start & TARGET_PAGE_MASK;
+    end = TARGET_PAGE_ALIGN(end);
+
+    for (addr = start, len = end - start;
+         len != 0;
+         len -= TARGET_PAGE_SIZE, addr += TARGET_PAGE_SIZE) {
+        PageDesc *p = page_find_alloc(addr >> TARGET_PAGE_BITS, 1);
+
+        g_free(p->target_data);
+        p->target_data = NULL;
+    }
+#endif
+}
+
+#ifdef TARGET_PAGE_DATA_SIZE
+void *page_get_target_data(target_ulong address)
+{
+    PageDesc *p = page_find(address >> TARGET_PAGE_BITS);
+    return p ? p->target_data : NULL;
+}
+
+void *page_alloc_target_data(target_ulong address)
+{
+    PageDesc *p = page_find(address >> TARGET_PAGE_BITS);
+    void *ret = NULL;
+
+    if (p->flags & PAGE_VALID) {
+        ret = p->target_data;
+        if (!ret) {
+            p->target_data = ret = g_malloc0(TARGET_PAGE_DATA_SIZE);
+        }
+    }
+    return ret;
+}
+#endif
+
 /* The softmmu versions of these helpers are in cputlb.c.  */
 
 /*
-- 
2.34.1


