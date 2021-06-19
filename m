Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD6B3ADB20
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 19:35:09 +0200 (CEST)
Received: from localhost ([::1]:54442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lues7-0000wf-W7
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 13:35:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luejr-0003RA-4b
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 13:26:35 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:44790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luejm-0003XK-TL
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 13:26:34 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 p4-20020a17090a9304b029016f3020d867so5652782pjo.3
 for <qemu-devel@nongnu.org>; Sat, 19 Jun 2021 10:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FVpEAjKW1kUBtBgKlqDp4yNhZraQMxoelOJmzjDRV6M=;
 b=sdQ+ZsNOeTX1Wzq5VLZLC1vI1RkhhrNhuoGJD2IxtY0t9nVwSQZVy8YMICyeOAifRV
 c/dT8ea/xD0M0u8URHZVmfpJ9pWfb16KB2BJSEUUavpJi1gmA1a6FgWH0k49xSv/0WS7
 I5jy8X+XMCsfY+2U2JFagqg/zUokUYMC9RmpA9pFqqd+vTHt3tCp0Ch3Zbk+/TRUX8im
 MpsIN4bil8OCyxbW0tk4Dr60nHfZgGABDx4rvzSh71WxugypBpFJ8RDYtBR07Wsscwnz
 ecvewUyDqe3aJtiHgxP5NTvX+eGxV/oL4GFcEk+a4s1ol5bmwn+p87RAcpOVwHiOB0Jj
 CVBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FVpEAjKW1kUBtBgKlqDp4yNhZraQMxoelOJmzjDRV6M=;
 b=TtU/xelL3ZLYmI5KTt/ROX/Orr9mp65w3KSnwRqLpnTbSJwYF5+Qn8zNVDeeeIy54f
 fUrN/1NJJaUN+055vhYA8x/VHzBxsu45FhCX0FuVN7Mp+p6lLWvKA+jLvN8oPt4ZDkUN
 0yNzl9eM67g5P4mSpKwcvdS8DPycy2BmpwNGUoMTN/hK1djtTnf7TXd8quKAE0oqavuN
 nq4rNkcmxRc155aN/W0PwT7pufgBie5aY3sngAtWLj/0+DukzvaXSoHT4HzVor3Zuv86
 XswJw0SqBBGgSyTP8fZ/eLXBGLD7888mjiQ3bCqm1Wa4upHZOvU5Vq/jjSZ9PoeaABAz
 MxVg==
X-Gm-Message-State: AOAM5338diOM1ri8CvaCjXvjHCAl1SiCjCrEB5ugqACV+KnirR4iw038
 ATllmp+1UM+GqZgMTOG1I9ftc1LXwwM1Qg==
X-Google-Smtp-Source: ABdhPJxLfFavrGciYgGNl2KsAIX2O1JpRwTWu0ugqabNOrZIzo2R6CnCa5qrpv3HXnJ8UB8R5z9KqA==
X-Received: by 2002:a17:90b:3543:: with SMTP id
 lt3mr13427503pjb.115.1624123589324; 
 Sat, 19 Jun 2021 10:26:29 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id co18sm2084241pjb.37.2021.06.19.10.26.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jun 2021 10:26:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 02/15] accel/tcg: Extract load_helper_unaligned from
 load_helper
Date: Sat, 19 Jun 2021 10:26:13 -0700
Message-Id: <20210619172626.875885-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210619172626.875885-1-richard.henderson@linaro.org>
References: <20210619172626.875885-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Replace a goto statement by an inlined function for easier review.
No logical change intended.

Inspired-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210609141010.1066750-2-f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cputlb.c | 52 ++++++++++++++++++++++++++++------------------
 1 file changed, 32 insertions(+), 20 deletions(-)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index f24348e979..a94de90099 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1851,6 +1851,34 @@ load_memop(const void *haddr, MemOp op)
     }
 }
 
+static inline uint64_t QEMU_ALWAYS_INLINE
+load_helper_unaligned(CPUArchState *env, target_ulong addr, TCGMemOpIdx oi,
+                      uintptr_t retaddr, MemOp op, bool code_read,
+                      FullLoadHelper *full_load)
+{
+    size_t size = memop_size(op);
+    target_ulong addr1, addr2;
+    uint64_t res;
+    uint64_t r1, r2;
+    unsigned shift;
+
+    addr1 = addr & ~((target_ulong)size - 1);
+    addr2 = addr1 + size;
+    r1 = full_load(env, addr1, oi, retaddr);
+    r2 = full_load(env, addr2, oi, retaddr);
+    shift = (addr & (size - 1)) * 8;
+
+    if (memop_big_endian(op)) {
+        /* Big-endian combine.  */
+        res = (r1 << shift) | (r2 >> ((size * 8) - shift));
+    } else {
+        /* Little-endian combine.  */
+        res = (r1 >> shift) | (r2 << ((size * 8) - shift));
+    }
+
+    return res & MAKE_64BIT_MASK(0, size * 8);
+}
+
 static inline uint64_t QEMU_ALWAYS_INLINE
 load_helper(CPUArchState *env, target_ulong addr, TCGMemOpIdx oi,
             uintptr_t retaddr, MemOp op, bool code_read,
@@ -1866,7 +1894,6 @@ load_helper(CPUArchState *env, target_ulong addr, TCGMemOpIdx oi,
         code_read ? MMU_INST_FETCH : MMU_DATA_LOAD;
     unsigned a_bits = get_alignment_bits(get_memop(oi));
     void *haddr;
-    uint64_t res;
     size_t size = memop_size(op);
 
     /* Handle CPU specific unaligned behaviour */
@@ -1895,7 +1922,8 @@ load_helper(CPUArchState *env, target_ulong addr, TCGMemOpIdx oi,
 
         /* For anything that is unaligned, recurse through full_load.  */
         if ((addr & (size - 1)) != 0) {
-            goto do_unaligned_access;
+            return load_helper_unaligned(env, addr, oi, retaddr, op,
+                                         code_read, full_load);
         }
 
         iotlbentry = &env_tlb(env)->d[mmu_idx].iotlb[index];
@@ -1932,24 +1960,8 @@ load_helper(CPUArchState *env, target_ulong addr, TCGMemOpIdx oi,
     if (size > 1
         && unlikely((addr & ~TARGET_PAGE_MASK) + size - 1
                     >= TARGET_PAGE_SIZE)) {
-        target_ulong addr1, addr2;
-        uint64_t r1, r2;
-        unsigned shift;
-    do_unaligned_access:
-        addr1 = addr & ~((target_ulong)size - 1);
-        addr2 = addr1 + size;
-        r1 = full_load(env, addr1, oi, retaddr);
-        r2 = full_load(env, addr2, oi, retaddr);
-        shift = (addr & (size - 1)) * 8;
-
-        if (memop_big_endian(op)) {
-            /* Big-endian combine.  */
-            res = (r1 << shift) | (r2 >> ((size * 8) - shift));
-        } else {
-            /* Little-endian combine.  */
-            res = (r1 >> shift) | (r2 << ((size * 8) - shift));
-        }
-        return res & MAKE_64BIT_MASK(0, size * 8);
+        return load_helper_unaligned(env, addr, oi, retaddr, op,
+                                     code_read, full_load);
     }
 
     haddr = (void *)((uintptr_t)addr + entry->addend);
-- 
2.25.1


