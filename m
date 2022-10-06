Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE2475F5F8A
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 05:21:57 +0200 (CEST)
Received: from localhost ([::1]:44266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogHSO-0005kI-Qo
	for lists+qemu-devel@lfdr.de; Wed, 05 Oct 2022 23:21:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogHIS-00063Y-M9
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 23:11:40 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:35705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogHIR-00070K-0X
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 23:11:40 -0400
Received: by mail-pf1-x42c.google.com with SMTP id i6so885664pfb.2
 for <qemu-devel@nongnu.org>; Wed, 05 Oct 2022 20:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=4O5Pusqh/NH2CJ/60q5/VIa/uQIj1tsm3YYoLnejOVs=;
 b=LzL661m8unDrk4abE8Wzx0j8KAhBvsKNgLHjy8wttFc/avaRqEy0uw7wVFy+cDz7lg
 E5gxDFvwI5hbD64Yh+SQRVZ6FWTrLsLOhe0yC/3ROJepVSsM5u0QLlbjlQRQFlziIeVl
 F9U2ch7s+LkUecPjHmbOaFr9Lmsi8gDDHsyst/5Uauaim/9DLQAL0KW9dfXgj3ZWWsn1
 WXlskbpKPzMPiiZEmoOfFBVj8+pAvLW++qI9bB9/9lj+hk/1Vq2xq89Ohal+sTIj7T2t
 zCRca1Be5G6okTuimitt9wSM8qc3a6Qxx1HhYxLOEl4zoIgu5nQxk464Bv8mtDUiIqCL
 dt1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=4O5Pusqh/NH2CJ/60q5/VIa/uQIj1tsm3YYoLnejOVs=;
 b=7Sf1PX+oC8fzPatM9mBKbjPd5Mbg8Ax6MY6PIgyRKguWd9pxjDrJesQ6NvTmlU9aOv
 9kKpVhVzUW2UHfE9L1nLZESsIHlFR6dGqtqjJJkVwNEzavS6j3H3VRQj/LIgx5JmEAVZ
 lG3RJt2sYV+ramUjnzzdCEfODJFfSOsHpt9M6LI0Z4ZYC4EwDgrXNFUuTi4dPJC6tfRs
 bmrS2glNz7akMOJRpxO+yJ4fhxQ/cuTgmMVD+wflwQG6m/EN3aXx62sEG9JPONYGOVsu
 zqjYmTxcAE0sKEZnPGEVTFBvrFFtor9MTti2zp3xaNiiNQ4e/OjLjU2zom4AGI9owjDX
 J2mw==
X-Gm-Message-State: ACrzQf2cRJIAea9kA9oD0z3TUg2zLaPHS+eyqIQRb2w4PplPVqCrr9MO
 LBE1m62+P3D22xD8slIlMmZZ5FQ/eM7hAQ==
X-Google-Smtp-Source: AMsMyM4Ms+MUFt53QKa2hi9A2FJP0hRW9na2bG1j75FXuXnm1mhrrVxT8MaD+hBw+5Hg8lyCePhB/g==
X-Received: by 2002:aa7:8887:0:b0:561:6985:1d02 with SMTP id
 z7-20020aa78887000000b0056169851d02mr2939769pfe.82.1665025897691; 
 Wed, 05 Oct 2022 20:11:37 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:9ad0:4307:7d39:bb61])
 by smtp.gmail.com with ESMTPSA id
 u128-20020a627986000000b0056281da3bcbsm58360pfc.149.2022.10.05.20.11.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Oct 2022 20:11:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, laurent@vivier.eu, pbonzini@redhat.com,
 imp@bsdimp.com, f4bug@amsat.org
Subject: [PATCH 18/24] accel/tcg: Move TARGET_PAGE_DATA_SIZE impl to
 user-exec.c
Date: Wed,  5 Oct 2022 20:11:07 -0700
Message-Id: <20221006031113.1139454-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221006031113.1139454-1-richard.henderson@linaro.org>
References: <20221006031113.1139454-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since "target data" is always user-only, move it out of
translate-all.c to user-exec.c.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/translate-all.c | 50 ---------------------------------------
 accel/tcg/user-exec.c     | 50 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 50 insertions(+), 50 deletions(-)

diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 04401ceac7..dbd4eff0cf 100644
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


