Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B64EA663156
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 21:21:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEybv-0005HR-DB; Mon, 09 Jan 2023 15:19:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEybr-00056C-1U
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 15:19:07 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEybp-00054g-7k
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 15:19:06 -0500
Received: by mail-pl1-x632.google.com with SMTP id d3so10781368plr.10
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 12:19:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iqqpjlza/yK0HsDNhpb8C0T7r/IzSeSCH09wUywlg8k=;
 b=Nps7CHq+IOjCm0YfB0rvtWHeSLe+JUVkX5GGPi+tTiVuUgorxG38J/tysW5Uk0NOUk
 vbGqET/edUAWXPzv2Vk1IOG5SSaPg/vs2+hIPXlYxNLuUP4NKsZlYSGIyZj1dgDOhKdR
 A9JtsV9VOebj9Lzuwax2lUpkvLS0MyU5zoRYKJBTXAZYVXpH5VV+5I+8lY2Oxbt9k/fZ
 ETC3djY79KSQKTs0/ZjBVKZhnm1MVjZIItXzvPeNTeykwP0sXGyDgWJ34e4YKOvdta+m
 CHKIq/xVGp3MtX4Su04k25SqYrcsvk2KaBZymSBXAMyEPvnO5m08Aaj69REpatBoaNUm
 VNrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iqqpjlza/yK0HsDNhpb8C0T7r/IzSeSCH09wUywlg8k=;
 b=qHxVdKCygccWIRbxrj2VRU2AvwMGmAbKM4TwE9/qLT2m3lxsvotWNMYPgoyxBwx2Sv
 1oYHIoKShzH53vfYE7tbAb93k1tYVPgvqF6r0eq0oGAiHdKuxBE6kib/w82w9EkZGL5e
 4/wJlEItnkTrqtmAUyrqDjcwmbquG+f0TupzipDABqDSUNxZEwF8SKRYi5p0s93i8xIU
 JdAHyjyO3/IUony/NttyPLi13BVKLpNKwzf53+0roU9eKid6sotwjDZl0wTlPucZBAre
 dOyMy+/DUozxOFavhI3NQIeF9SoRGJSzxG/INdCVdxBbsC1D6I4rFdQYEElRPRoxP34o
 gEBQ==
X-Gm-Message-State: AFqh2kp00+2x5ZtZ5RGTGyNzRPjDuhCg85//g5FBYWjTiJzwlSb7H83B
 bJfYwk3R5d9lPe1+RqY28KPGPjp0mb1e9c2w
X-Google-Smtp-Source: AMrXdXsTLRCXsr7MgN0E+jiXQyq5RemtrxvxBrowvnYF/vLdypI02rsYIC7pdfTQHz/aUgQ9G6t3jQ==
X-Received: by 2002:a05:6a20:94c6:b0:ad:aaac:d40b with SMTP id
 ht6-20020a056a2094c600b000adaaacd40bmr78778140pzb.45.1673295543865; 
 Mon, 09 Jan 2023 12:19:03 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:158e:facf:7a46:ba9f])
 by smtp.gmail.com with ESMTPSA id
 c132-20020a621c8a000000b00589a7824703sm1470972pfc.194.2023.01.09.12.19.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 12:19:03 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: david@redhat.com
Subject: [PATCH 6/7] target/s390x: Inline do_access_{get,set}_byte
Date: Mon,  9 Jan 2023 12:18:55 -0800
Message-Id: <20230109201856.3916639-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230109201856.3916639-1-richard.henderson@linaro.org>
References: <20230109201856.3916639-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Inline into the parent functions with a simple test
to select the page, and a new define to remove ifdefs.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/mem_helper.c | 70 +++++++++++++++--------------------
 1 file changed, 30 insertions(+), 40 deletions(-)

diff --git a/target/s390x/tcg/mem_helper.c b/target/s390x/tcg/mem_helper.c
index f7dc710814..92eb6564c3 100644
--- a/target/s390x/tcg/mem_helper.c
+++ b/target/s390x/tcg/mem_helper.c
@@ -35,6 +35,12 @@
 #include "hw/boards.h"
 #endif
 
+#ifdef CONFIG_USER_ONLY
+# define user_or_likely(X)    true
+#else
+# define user_or_likely(X)    likely(X)
+#endif
+
 /*****************************************************************************/
 /* Softmmu support */
 
@@ -246,59 +252,43 @@ static void access_memset(CPUS390XState *env, S390Access *desta,
                      desta->mmu_idx, ra);
 }
 
-static uint8_t do_access_get_byte(CPUS390XState *env, vaddr vaddr,
-                                  void *haddr, int offset,
-                                  int mmu_idx, uintptr_t ra)
-{
-#ifdef CONFIG_USER_ONLY
-    return ldub_p(haddr + offset);
-#else
-    if (likely(haddr)) {
-        return ldub_p(haddr + offset);
-    } else {
-        MemOpIdx oi = make_memop_idx(MO_UB, mmu_idx);
-        return cpu_ldb_mmu(env, vaddr + offset, oi, ra);
-    }
-#endif
-}
-
 static uint8_t access_get_byte(CPUS390XState *env, S390Access *access,
                                int offset, uintptr_t ra)
 {
-    if (offset < access->size1) {
-        return do_access_get_byte(env, access->vaddr1, access->haddr1,
-                                  offset, access->mmu_idx, ra);
+    target_ulong vaddr = access->vaddr1;
+    void *haddr = access->haddr1;
+
+    if (unlikely(offset >= access->size1)) {
+        offset -= access->size1;
+        vaddr = access->vaddr2;
+        haddr = access->haddr2;
     }
-    return do_access_get_byte(env, access->vaddr2, access->haddr2,
-                              offset - access->size1, access->mmu_idx, ra);
-}
 
-static void do_access_set_byte(CPUS390XState *env, vaddr vaddr, void *haddr,
-                               int offset, uint8_t byte, int mmu_idx,
-                               uintptr_t ra)
-{
-#ifdef CONFIG_USER_ONLY
-    stb_p(haddr + offset, byte);
-#else
-
-    if (likely(haddr)) {
-        stb_p(haddr + offset, byte);
+    if (user_or_likely(haddr)) {
+        return ldub_p(haddr + offset);
     } else {
-        MemOpIdx oi = make_memop_idx(MO_UB, mmu_idx);
-        cpu_stb_mmu(env, vaddr + offset, byte, oi, ra);
+        MemOpIdx oi = make_memop_idx(MO_UB, access->mmu_idx);
+        return cpu_ldb_mmu(env, vaddr + offset, oi, ra);
     }
-#endif
 }
 
 static void access_set_byte(CPUS390XState *env, S390Access *access,
                             int offset, uint8_t byte, uintptr_t ra)
 {
-    if (offset < access->size1) {
-        do_access_set_byte(env, access->vaddr1, access->haddr1, offset, byte,
-                           access->mmu_idx, ra);
+    target_ulong vaddr = access->vaddr1;
+    void *haddr = access->haddr1;
+
+    if (unlikely(offset >= access->size1)) {
+        offset -= access->size1;
+        vaddr = access->vaddr2;
+        haddr = access->haddr2;
+    }
+
+    if (user_or_likely(haddr)) {
+        stb_p(haddr + offset, byte);
     } else {
-        do_access_set_byte(env, access->vaddr2, access->haddr2,
-                           offset - access->size1, byte, access->mmu_idx, ra);
+        MemOpIdx oi = make_memop_idx(MO_UB, access->mmu_idx);
+        cpu_stb_mmu(env, vaddr + offset, byte, oi, ra);
     }
 }
 
-- 
2.34.1


