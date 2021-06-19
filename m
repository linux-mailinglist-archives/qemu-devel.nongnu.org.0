Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E903ADB1C
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 19:31:48 +0200 (CEST)
Received: from localhost ([::1]:45608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lueot-0003LN-Rq
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 13:31:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luejs-0003UA-2v
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 13:26:36 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:38606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luejp-0003aJ-F1
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 13:26:35 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 t19-20020a17090ae513b029016f66a73701so2663570pjy.3
 for <qemu-devel@nongnu.org>; Sat, 19 Jun 2021 10:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Yss0fdcq2xuDYayxCjybFaIy9QYHnfPZU6LWnmiOPAM=;
 b=xG137mObUWZEgmXMM9MtIBFF2Ugri3uCeIz8VcSm/zxeq7kDSejYp2OCzvIbAxrdDj
 ax4o7gmZqmEnef2P7svkeULztX/71iZ37iG7xnINDCI9o1Pqa5BUtKEmUqSYW4NYKFr9
 gMVs9Yt6OYf0lypQLknltXs2T7snMP9364F3zo48DvKKFRkF3CRfEt/t0vXQyY8EvJLM
 xmmyz09YTJvr4mMYsOsqfuUC1zD1Ee+5redOYndtnt03+xy0Ulas0tPMp37gtIQDIzZ+
 n9kuw50ARn1QNRL6/NP8DL54kARx0wE/uzKHr0TY0jUBw1Z769aoJdWkzNNUoKcoz+EA
 P80Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Yss0fdcq2xuDYayxCjybFaIy9QYHnfPZU6LWnmiOPAM=;
 b=BgcLSzNaAw560FTYGW7zGOkwj8q7pBd/ii+LmqkbKWsMwIeiVhBvAxz9+4CsxAcaam
 +aYso1bOQmZiIG8VHWu34ZUgpBdkTIbibq9TjBGqbiQePYxtINmc2k2lvspUVFpvvVKj
 tmevu/AqIu3xlCaBcD7tUqNKOBsD9IAajs1oYssgTJbYjMiDUq9ExQNNg+HZLte83PVy
 owuKtProgNNsfF9eTc01LvKAnc1b5/jsQfThjfQHhldVEsT+0RvhkPWg7U5wJEem7bQI
 YNhnG6JWuVDfZrbpy5aBazav6uiNpNXNFH+9DeaHE1AKzYBF86FImfPvpaguEdDJSljA
 KXow==
X-Gm-Message-State: AOAM530f8eJmeURadQ7zd+Z8FohOzi0I4GqXZIZKNEvbdHkMDqdyj5bK
 ItKb73UXJE19JOTM/Vh/mNFLjJXjcXmc0w==
X-Google-Smtp-Source: ABdhPJy6xtGJjefxu2APV+ABmJ6jhRb4fzRxTw/9FUHMloKYvS1RDpDZ+AS+ooD2OgvCZ8fPvOVMWA==
X-Received: by 2002:a17:90b:1d02:: with SMTP id
 on2mr28573691pjb.128.1624123592286; 
 Sat, 19 Jun 2021 10:26:32 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id co18sm2084241pjb.37.2021.06.19.10.26.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jun 2021 10:26:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 07/15] softmmu/memory: Simplify access_with_adjusted_size
 interface
Date: Sat, 19 Jun 2021 10:26:18 -0700
Message-Id: <20210619172626.875885-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210619172626.875885-1-richard.henderson@linaro.org>
References: <20210619172626.875885-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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
Cc: alex.bennee@linaro.org, pbonzini@redhat.com, mark.cave-ayland@ilande.co.uk,
 f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Create a typedef for the access_fn callback.  Remove the
access_size_{min,max} and access_fn arguments, and instead
derive these from the MemoryRegion argument.  Add a write
boolean argument.  Mark the function inline.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 softmmu/memory.c | 67 +++++++++++++++++++-----------------------------
 1 file changed, 26 insertions(+), 41 deletions(-)

diff --git a/softmmu/memory.c b/softmmu/memory.c
index 744c5a80bd..7373d89600 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -509,22 +509,24 @@ static MemTxResult memory_region_write_with_attrs_accessor(MemoryRegion *mr,
     return mr->ops->write_with_attrs(mr->opaque, addr, tmp, size, attrs);
 }
 
+typedef MemTxResult MemoryRegionAccessFn(MemoryRegion *mr,
+                                         hwaddr addr,
+                                         uint64_t *value,
+                                         unsigned size,
+                                         signed shift,
+                                         uint64_t mask,
+                                         MemTxAttrs attrs);
+
 static MemTxResult access_with_adjusted_size(hwaddr addr,
-                                      uint64_t *value,
-                                      unsigned size,
-                                      unsigned access_size_min,
-                                      unsigned access_size_max,
-                                      MemTxResult (*access_fn)
-                                                  (MemoryRegion *mr,
-                                                   hwaddr addr,
-                                                   uint64_t *value,
-                                                   unsigned size,
-                                                   signed shift,
-                                                   uint64_t mask,
-                                                   MemTxAttrs attrs),
-                                      MemoryRegion *mr,
-                                      MemTxAttrs attrs)
+                                             uint64_t *value,
+                                             unsigned size,
+                                             MemoryRegion *mr,
+                                             MemTxAttrs attrs,
+                                             bool write)
 {
+    unsigned access_size_min = mr->ops->impl.min_access_size;
+    unsigned access_size_max = mr->ops->impl.max_access_size;
+    MemoryRegionAccessFn *access_fn;
     uint64_t access_mask;
     unsigned access_size;
     unsigned i;
@@ -537,6 +539,14 @@ static MemTxResult access_with_adjusted_size(hwaddr addr,
         access_size_max = 4;
     }
 
+    if (write) {
+        access_fn = (mr->ops->write ? memory_region_write_accessor
+                     : memory_region_write_with_attrs_accessor);
+    } else {
+        access_fn = (mr->ops->read ? memory_region_read_accessor
+                     : memory_region_read_with_attrs_accessor);
+    }
+
     /* FIXME: support unaligned access? */
     access_size = MAX(MIN(size, access_size_max), access_size_min);
     access_mask = MAKE_64BIT_MASK(0, access_size * 8);
@@ -1423,19 +1433,7 @@ MemTxResult memory_region_dispatch_read(MemoryRegion *mr,
     }
 
     *pval = 0;
-    if (mr->ops->read) {
-        r = access_with_adjusted_size(addr, pval, size,
-                                      mr->ops->impl.min_access_size,
-                                      mr->ops->impl.max_access_size,
-                                      memory_region_read_accessor,
-                                      mr, attrs);
-    } else {
-        r = access_with_adjusted_size(addr, pval, size,
-                                      mr->ops->impl.min_access_size,
-                                      mr->ops->impl.max_access_size,
-                                      memory_region_read_with_attrs_accessor,
-                                      mr, attrs);
-    }
+    r = access_with_adjusted_size(addr, pval, size, mr, attrs, false);
     adjust_endianness(mr, pval, op);
     return r;
 }
@@ -1486,20 +1484,7 @@ MemTxResult memory_region_dispatch_write(MemoryRegion *mr,
         return MEMTX_OK;
     }
 
-    if (mr->ops->write) {
-        return access_with_adjusted_size(addr, &data, size,
-                                         mr->ops->impl.min_access_size,
-                                         mr->ops->impl.max_access_size,
-                                         memory_region_write_accessor, mr,
-                                         attrs);
-    } else {
-        return
-            access_with_adjusted_size(addr, &data, size,
-                                      mr->ops->impl.min_access_size,
-                                      mr->ops->impl.max_access_size,
-                                      memory_region_write_with_attrs_accessor,
-                                      mr, attrs);
-    }
+    return access_with_adjusted_size(addr, &data, size, mr, attrs, true);
 }
 
 void memory_region_init_io(MemoryRegion *mr,
-- 
2.25.1


