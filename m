Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C8743ADB2A
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 19:42:55 +0200 (CEST)
Received: from localhost ([::1]:44374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lueze-0004yP-1K
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 13:42:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luejz-0003vj-KJ
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 13:26:43 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:41579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lueju-0003dL-KZ
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 13:26:43 -0400
Received: by mail-pf1-x42e.google.com with SMTP id x73so10280293pfc.8
 for <qemu-devel@nongnu.org>; Sat, 19 Jun 2021 10:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HZXg/FINwhlCDx9vLoMBvEcrQqzi0upM0DdxrVdyXzE=;
 b=FvPMg0qLTnaTN/dhXUgrZXO+9vOqrW3MsjIx6uPT7l1pUS0OgAmvFD8rxGfZc2KkpZ
 /MdI2SvHqVNZzDFXohViPnEUmbGErXId5osyY52J5IyRWTLeKbI3CLD1p2d0kQXLthie
 UgRmodlUGu9A+W5k2jEuk1UTtSCXQWLtt5N6Z7zFHHQZmnmoHBag7dUpbqeyrgE1aQlo
 36w0WxwTBwY3HsBoteWEkFh0I+E1yUxIV0tw3CHFYiZI0HFJsjjYrBlzwBD3rZDrJUs+
 2ncZmLAbfSKKtoA/WdTZo1ImSAPHTp2rPirdWbp+L4XV63gSQlBvZbNEYYWmxZaYECUC
 66kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HZXg/FINwhlCDx9vLoMBvEcrQqzi0upM0DdxrVdyXzE=;
 b=t6EwkIphzSaw907sS2XRgp4JqMTw9Y2GC620eTmdHtQI6TYEr8RvbAY3PYq/CU6So3
 amxTzTyEvii0Q3Uqo4AsEGXZhMnYrI1D6ixQtHXI2iIg4Dukw/pHNA49y8J6lXRy/OJX
 ZjyRlj6lq2Bh8NpBTU38+WnOmdd5hgVtMZ5dfRWx2gk3RB1zOQ+7fJvAF8a6AvnvQwns
 BByqin9aQLFok62MQFLfAXNNztCW7KdGZC0BNbNTj4fkOL1XVlLDd2yE8DCjTwjSX4Ys
 KZQ2ayFfzHUERtM6gzj8TEbMrokPScz2ljdySa5WqLVjhfw9d5E+OHBJVEM30AJCo/5b
 ROWw==
X-Gm-Message-State: AOAM533qJ0SmQ/fG3RxJuhOE6fQX+9Cq5/DkXvtBkXobI6wEM1L6oZO2
 XA23kBg8zxK+hce/U0ncdNNrSBG1DiRxZA==
X-Google-Smtp-Source: ABdhPJyRultKX4OHvKyS0VXAbr5mYYFdZNNH3E6LgwfbsPMQKRuQDD2Gh8FXBiwiuxLURbzU74kH2g==
X-Received: by 2002:a63:f944:: with SMTP id q4mr816513pgk.264.1624123597318;
 Sat, 19 Jun 2021 10:26:37 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id co18sm2084241pjb.37.2021.06.19.10.26.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jun 2021 10:26:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 14/15] softmmu/memory: Support some unaligned access
Date: Sat, 19 Jun 2021 10:26:25 -0700
Message-Id: <20210619172626.875885-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210619172626.875885-1-richard.henderson@linaro.org>
References: <20210619172626.875885-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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

Decline to support writes that cannot be covered by access_size_min.
Decline to support unaligned reads that require extraction from more
than two reads.

Do support exact size match when the model supports unaligned.
Do support reducing the operation size to match the alignment.
Do support loads that extract from 1 or 2 larger loads.

Diagnose anything that we do not handle via LOG_GUEST_ERROR,
as any of these cases are probably model or guest errors.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 softmmu/memory.c | 127 ++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 121 insertions(+), 6 deletions(-)

diff --git a/softmmu/memory.c b/softmmu/memory.c
index 2fe237327d..baf8573f1b 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -529,7 +529,7 @@ static MemTxResult access_with_adjusted_size(hwaddr addr,
     MemoryRegionAccessFn *access_fn;
     uint64_t access_mask;
     unsigned access_size;
-    unsigned i;
+    signed access_sh;
     MemTxResult r = MEMTX_OK;
 
     if (!access_size_min) {
@@ -547,7 +547,6 @@ static MemTxResult access_with_adjusted_size(hwaddr addr,
                      : memory_region_read_with_attrs_accessor);
     }
 
-    /* FIXME: support unaligned access? */
     /*
      * Check for a small access.
      */
@@ -557,6 +556,10 @@ static MemTxResult access_with_adjusted_size(hwaddr addr,
          * cycle, and many mmio registers have side-effects on read.
          * In practice, this appears to be either (1) model error,
          * or (2) guest error via the fuzzer.
+         *
+         * TODO: Are all short reads also guest or model errors, because
+         * of said side effects?  Or is this valid read-for-effect then
+         * discard the (complete) result via narrow destination register?
          */
         if (write) {
             qemu_log_mask(LOG_GUEST_ERROR, "%s: Invalid short write: %s "
@@ -566,22 +569,134 @@ static MemTxResult access_with_adjusted_size(hwaddr addr,
                           access_size_min, access_size_max);
             return MEMTX_ERROR;
         }
+
+        /*
+         * If the original access is aligned, we can always extract
+         * from a single larger load.
+         */
+        access_size = access_size_min;
+        if (likely((addr & (size - 1)) == 0)) {
+            goto extract;
+        }
+
+        /*
+         * TODO: We could search for a larger load that happens to
+         * cover the unaligned load, but at some point we will always
+         * require two operations.  Extract from two loads.
+         */
+        goto extract2;
     }
 
+    /*
+     * Check for size in range.
+     */
+    if (likely(size <= access_size_max)) {
+        /*
+         * If the access is aligned or if the model supports
+         * unaligned accesses, use one operation directly.
+         */
+        if (likely((addr & (size - 1)) == 0) || mr->ops->impl.unaligned) {
+            access_size = size;
+            access_sh = 0;
+            goto direct;
+        }
+    }
+
+    /*
+     * It is certain that we require multiple operations.
+     * If the access is aligned (or the model supports unaligned),
+     * then we will perform N accesses which exactly cover the
+     * operation requested.
+     */
     access_size = MAX(MIN(size, access_size_max), access_size_min);
+    if (unlikely(addr & (access_size - 1))) {
+        unsigned lsb = addr & -addr;
+        if (lsb >= access_size_min) {
+            /*
+             * The model supports small enough loads that we can
+             * exactly match the operation requested.  For reads,
+             * this is preferable to touching more than requested.
+             * For writes, this is mandatory.
+             */
+            access_size = lsb;
+        } else if (write) {
+            qemu_log_mask(LOG_GUEST_ERROR, "%s: Invalid unaligned write: %s "
+                          "hwaddr: 0x%" HWADDR_PRIx " size: %u "
+                          "min: %u max: %u\n", __func__,
+                          memory_region_name(mr), addr, size,
+                          access_size_min, access_size_max);
+            return MEMTX_ERROR;
+        } else if (size <= access_size_max) {
+            /* As per above, we can use two loads to implement. */
+            access_size = size;
+            goto extract2;
+        } else {
+            /*
+             * TODO: becaseu access_size_max is small, this case requires
+             * more than 2 loads to assemble and extract.  Bail out.
+             */
+            qemu_log_mask(LOG_GUEST_ERROR, "%s: Unhandled unaligned read: %s "
+                          "hwaddr: 0x%" HWADDR_PRIx " size: %u "
+                          "min: %u max: %u\n", __func__,
+                          memory_region_name(mr), addr, size,
+                          access_size_min, access_size_max);
+            return MEMTX_ERROR;
+        }
+    }
+
     access_mask = MAKE_64BIT_MASK(0, access_size * 8);
     if (memory_region_big_endian(mr)) {
-        for (i = 0; i < size; i += access_size) {
+        for (unsigned i = 0; i < size; i += access_size) {
             r |= access_fn(mr, addr + i, value, access_size,
-                        (size - access_size - i) * 8, access_mask, attrs);
+                           (size - access_size - i) * 8, access_mask, attrs);
         }
     } else {
-        for (i = 0; i < size; i += access_size) {
+        for (unsigned i = 0; i < size; i += access_size) {
             r |= access_fn(mr, addr + i, value, access_size, i * 8,
-                        access_mask, attrs);
+                           access_mask, attrs);
         }
     }
     return r;
+
+ extract2:
+    /*
+     * Extract from one or two loads to produce the result.
+     * Validate that we need two loads before performing them.
+     */
+    access_sh = addr & (access_size - 1);
+    if (access_sh + size > access_size) {
+        addr &= ~(access_size - 1);
+        if (memory_region_big_endian(mr)) {
+            access_sh = (access_size - access_sh) * 8;
+            r |= access_fn(mr, addr, value, access_size, access_sh, -1, attrs);
+            access_sh -= access_size * 8;
+            r |= access_fn(mr, addr, value, access_size, access_sh, -1, attrs);
+        } else {
+            access_sh = (access_sh - access_size) * 8;
+            r |= access_fn(mr, addr, value, access_size, access_sh, -1, attrs);
+            access_sh += access_size * 8;
+            r |= access_fn(mr, addr, value, access_size, access_sh, -1, attrs);
+        }
+        *value &= MAKE_64BIT_MASK(0, size * 8);
+        return r;
+    }
+
+ extract:
+    /*
+     * Extract from one larger load to produce the result.
+     */
+    access_sh = addr & (access_size - 1);
+    addr &= ~(access_size - 1);
+    if (memory_region_big_endian(mr)) {
+        access_sh = access_size - size - access_sh;
+    }
+    /* Note that with this interface, right shift is negative. */
+    access_sh *= -8;
+
+ direct:
+    access_mask = MAKE_64BIT_MASK(0, size * 8);
+    return access_fn(mr, addr, value, access_size, access_sh,
+                     access_mask, attrs);
 }
 
 static AddressSpace *memory_region_to_address_space(MemoryRegion *mr)
-- 
2.25.1


