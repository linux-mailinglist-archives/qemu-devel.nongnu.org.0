Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E28343ADB1E
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 19:31:50 +0200 (CEST)
Received: from localhost ([::1]:45816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lueov-0003Tk-Pz
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 13:31:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luejq-0003PT-7k
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 13:26:34 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:43781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luejo-0003ZO-FV
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 13:26:33 -0400
Received: by mail-pg1-x52d.google.com with SMTP id e22so4354820pgv.10
 for <qemu-devel@nongnu.org>; Sat, 19 Jun 2021 10:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=T5vMXhrM5rWdv6nO0g8iwcSHNdJ0kMFYBGi03uVNbn8=;
 b=ZzaFGVcwPVIC9L3O42c7ivq47EO5nEGDThF2Pt5WyzAdm/zaEgbw61cHFJWvyqXJIA
 XzqkyH2hGLyXtQZCzgF/UwAlyZK3CekDJRWL7oLeN7BYV98LEDOv/OOLEkjpVfwOj7KI
 XTBXohtfUxS7rO7SgeBgyOUH5ECxhpLnmGaiLyeaHEzfe687sc+a8N1Yt+P/ZP1fnLhS
 BCOQ27Zea4od4g1rW2YA4FR2j6Aw34cXjOOQ2/oSmPszy7kARmMk7hPLr1Xx6v0oDgEL
 v5hYn6rg+ZibxVnaq1TSLWT47MD+GC2HkBvSZ+FJHjvzub3izaSLR+LgW5qqJ4Ku68td
 r2iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=T5vMXhrM5rWdv6nO0g8iwcSHNdJ0kMFYBGi03uVNbn8=;
 b=cy4dy/KeqEe+61w8BGNOktSNBdHXbOpIRI+gF8TNPm+XrRniYtmBh+p7RfChhKNoGi
 4QQUACqxYH44fn/Z7HxteOFp7VPajSjtkqfYp2JD3RSjamHx69bL1BouwwMN4JDB/d4h
 zO5IaXD3ZGikrGgFDIWYj45r9O+5uDEI1Lc3NP4fHU6ezTc67KgRWM1GtqRxDQtHUPRj
 yHl+RcI+5xPzueFl17Q+CgllhbluUXC4aVbNaSug/7hyuVDkvCFxPBHoz+cUTg9Ph4kc
 H8Vrnayx7pm61dW8zE7mA1FAFnY69TlKOFqMfnybMFjKyywnnUB2/sW5shawjSgr1WIX
 syag==
X-Gm-Message-State: AOAM5300LDiU4LV4F09Kiqol13tkv84Ue5k1qLhZSNyXnqttaD3RgLt8
 ZixIaoZGYKHw/RIZ+kX5av/I9qqLFNClMA==
X-Google-Smtp-Source: ABdhPJz4I0MZgZrEnpQjQJzcg1k0rCLLvYwPpliwZ4RJNkSsKUfQv9k0PWcxRq/3L90kyboYcPEUDw==
X-Received: by 2002:aa7:8543:0:b029:2e9:e077:21f6 with SMTP id
 y3-20020aa785430000b02902e9e07721f6mr11126244pfn.69.1624123591189; 
 Sat, 19 Jun 2021 10:26:31 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id co18sm2084241pjb.37.2021.06.19.10.26.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jun 2021 10:26:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/15] accel/tcg: Handle page span access before i/o access
Date: Sat, 19 Jun 2021 10:26:16 -0700
Message-Id: <20210619172626.875885-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210619172626.875885-1-richard.henderson@linaro.org>
References: <20210619172626.875885-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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

At present this is a distinction without much effect.
But this will enable further improvements.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cputlb.c | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 23a97849be..6209e00c9b 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1916,6 +1916,14 @@ load_helper(CPUArchState *env, target_ulong addr, TCGMemOpIdx oi,
         tlb_addr &= ~TLB_INVALID_MASK;
     }
 
+    /* Handle access that spans two pages. */
+    if (size > 1
+        && unlikely((addr & ~TARGET_PAGE_MASK) + size - 1
+                    >= TARGET_PAGE_SIZE)) {
+        return load_helper_unaligned(env, addr, oi, retaddr, op,
+                                     code_read, byte_load);
+    }
+
     /* Handle anything that isn't just a straight memory access.  */
     if (unlikely(tlb_addr & ~TARGET_PAGE_MASK)) {
         CPUIOTLBEntry *iotlbentry;
@@ -1957,14 +1965,6 @@ load_helper(CPUArchState *env, target_ulong addr, TCGMemOpIdx oi,
         return load_memop(haddr, op);
     }
 
-    /* Handle slow unaligned access (it spans two pages or IO).  */
-    if (size > 1
-        && unlikely((addr & ~TARGET_PAGE_MASK) + size - 1
-                    >= TARGET_PAGE_SIZE)) {
-        return load_helper_unaligned(env, addr, oi, retaddr, op,
-                                     code_read, byte_load);
-    }
-
     haddr = (void *)((uintptr_t)addr + entry->addend);
     return load_memop(haddr, op);
 }
@@ -2421,6 +2421,16 @@ store_helper(CPUArchState *env, target_ulong addr, uint64_t val,
         tlb_addr = tlb_addr_write(entry) & ~TLB_INVALID_MASK;
     }
 
+    /* Handle access that spans two pages. */
+    if (size > 1
+        && unlikely((addr & ~TARGET_PAGE_MASK) + size - 1
+                     >= TARGET_PAGE_SIZE)) {
+    do_unaligned_access:
+        store_helper_unaligned(env, addr, val, retaddr, size,
+                               mmu_idx, memop_big_endian(op));
+        return;
+    }
+
     /* Handle anything that isn't just a straight memory access.  */
     if (unlikely(tlb_addr & ~TARGET_PAGE_MASK)) {
         CPUIOTLBEntry *iotlbentry;
@@ -2474,16 +2484,6 @@ store_helper(CPUArchState *env, target_ulong addr, uint64_t val,
         return;
     }
 
-    /* Handle slow unaligned access (it spans two pages or IO).  */
-    if (size > 1
-        && unlikely((addr & ~TARGET_PAGE_MASK) + size - 1
-                     >= TARGET_PAGE_SIZE)) {
-    do_unaligned_access:
-        store_helper_unaligned(env, addr, val, retaddr, size,
-                               mmu_idx, memop_big_endian(op));
-        return;
-    }
-
     haddr = (void *)((uintptr_t)addr + entry->addend);
     store_memop(haddr, val, op);
 }
-- 
2.25.1


