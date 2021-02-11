Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9695B318C14
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 14:32:03 +0100 (CET)
Received: from localhost ([::1]:41154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAC4f-0004vJ-MC
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 08:32:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lABZG-0008LQ-7r
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:59:35 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:36756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lABZ8-00004y-9M
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:59:34 -0500
Received: by mail-wr1-x432.google.com with SMTP id u14so4118236wri.3
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 04:59:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=A7ZOkJKx8zqr+LMVmnNNeeuYc84tBTozRptYcVKimjQ=;
 b=b/s1eUvylo0iHE6NN156d6kGZzdPzpaN/6glbrqfpvWNC9lUyD3UjqRaQj0Rpyfo0B
 WVsBnrYAOFPFQaHLE2KVuQ5KJkyc/crDudODnBW0Cu/IMWSQThj4nZFpRMok6aifC9t0
 939/dmV59n+tM6XmOIOOjy0B26wjxFSUhS1vwzF4BHu35eUzBIkkXFDN7bD17lE0aHDx
 r8GLD9Wk/1LVJzYW8czo5iX7husGikgRNCor0RnVkquJlRZ6mUzg/xjgXnHK6EW3GOtx
 0+WvcrE2qXRqQ3BdnZ/ehfcxzaAb3Oz+c+NhOKQ2U+pPiSMDGtooLKOl00NPyz3qTghd
 f8LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A7ZOkJKx8zqr+LMVmnNNeeuYc84tBTozRptYcVKimjQ=;
 b=lg8X2JIMktnrOhJyWH1W1dFnnnMU8Typ1eaZf0/YqKn7/LWfYjPusGS2Tb6LRqigEp
 iz9Vcrk+LSubxt3f0Wagd4FM1URxlSmTsb9nm+7ESLvsqxGCWFwXiWV2WRAe6dMSNsFA
 Q8Ye5kxfAGM5Iwj6aE9vrkqGjTFrwALAPWIMBOP2I3SD8qM9+haA1ARbDItAH0I5uyfO
 MUxHYtDMdoh2m5Nz4LRo+vumO2oSaIENYx0V1ml5GLZp0Y8vl3IUWr/wieZbnUZpd+nz
 SFrzz5xbHYqu9cBZlJiFrHswfXHvT/2h0a8lkolNqLAZoOjYphwFvjRpEdwR8x9HE1of
 FCSg==
X-Gm-Message-State: AOAM530KUem3fxXGdDS5H0I52QrwhXLewKPaNxyNeCg71yzmhhmV9S7t
 WxyMyeFGCVzOTXPyGj2TfPDa/ZbBzVt5jg==
X-Google-Smtp-Source: ABdhPJxfwKkQfhp2Sefryw44qiojNKqSdMF2Es93mAhI0A9gCbO9z/9vA2NEw1pcuahuHsivYS5l0A==
X-Received: by 2002:a5d:47a2:: with SMTP id 2mr5580927wrb.393.1613048363937;
 Thu, 11 Feb 2021 04:59:23 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g15sm4955716wrx.1.2021.02.11.04.59.23
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 04:59:23 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 28/45] linux-user: Handle tags in lock_user/unlock_user
Date: Thu, 11 Feb 2021 12:58:43 +0000
Message-Id: <20210211125900.22777-29-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210211125900.22777-1-peter.maydell@linaro.org>
References: <20210211125900.22777-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

Resolve the untagged address once, using thread_cpu.
Tidy the DEBUG_REMAP code using glib routines.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20210210000223.884088-20-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 linux-user/uaccess.c | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/linux-user/uaccess.c b/linux-user/uaccess.c
index 76af6a92b11..c6969130163 100644
--- a/linux-user/uaccess.c
+++ b/linux-user/uaccess.c
@@ -6,36 +6,37 @@
 
 void *lock_user(int type, abi_ulong guest_addr, size_t len, bool copy)
 {
+    void *host_addr;
+
+    guest_addr = cpu_untagged_addr(thread_cpu, guest_addr);
     if (!access_ok_untagged(type, guest_addr, len)) {
         return NULL;
     }
+    host_addr = g2h_untagged(guest_addr);
 #ifdef DEBUG_REMAP
-    {
-        void *addr;
-        addr = g_malloc(len);
-        if (copy) {
-            memcpy(addr, g2h(guest_addr), len);
-        } else {
-            memset(addr, 0, len);
-        }
-        return addr;
+    if (copy) {
+        host_addr = g_memdup(host_addr, len);
+    } else {
+        host_addr = g_malloc0(len);
     }
-#else
-    return g2h_untagged(guest_addr);
 #endif
+    return host_addr;
 }
 
 #ifdef DEBUG_REMAP
 void unlock_user(void *host_ptr, abi_ulong guest_addr, size_t len);
 {
+    void *host_ptr_conv;
+
     if (!host_ptr) {
         return;
     }
-    if (host_ptr == g2h_untagged(guest_addr)) {
+    host_ptr_conv = g2h(thread_cpu, guest_addr);
+    if (host_ptr == host_ptr_conv) {
         return;
     }
     if (len != 0) {
-        memcpy(g2h_untagged(guest_addr), host_ptr, len);
+        memcpy(host_ptr_conv, host_ptr, len);
     }
     g_free(host_ptr);
 }
-- 
2.20.1


