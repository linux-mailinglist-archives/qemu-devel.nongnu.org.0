Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B72AB2071A4
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Jun 2020 12:58:06 +0200 (CEST)
Received: from localhost ([::1]:51112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jo36T-0006KM-M6
	for lists+qemu-devel@lfdr.de; Wed, 24 Jun 2020 06:58:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jo2zx-0001UA-5v
 for qemu-devel@nongnu.org; Wed, 24 Jun 2020 06:51:21 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:38900
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jo2zu-0001PI-HB
 for qemu-devel@nongnu.org; Wed, 24 Jun 2020 06:51:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592995877;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=65Md/+FXVq30o+iMg9BrOQSdT+SBN82WMVybJPbTxSc=;
 b=FfkMtMWTmrcW7Zfibcq9syNT+r30Syt70dHmpZ//ZqM9YtU0jtSasW5uQz/ZBDuCfZNBqH
 5ubonCSuf4ufo1ZfiMlgCovlurCc5QL/x5BXh87e4Sr9EXDXW43+Yi4UlME3vrPVqtlvC2
 Zt3+KWTOl++F2MgmUIFSti4pfYLSTY8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-83-fY3KDEk2Pq-Nd1G6K83X5Q-1; Wed, 24 Jun 2020 06:51:14 -0400
X-MC-Unique: fY3KDEk2Pq-Nd1G6K83X5Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 70473107ACCD
 for <qemu-devel@nongnu.org>; Wed, 24 Jun 2020 10:51:13 +0000 (UTC)
Received: from virtlab511.virt.lab.eng.bos.redhat.com
 (virtlab511.virt.lab.eng.bos.redhat.com [10.19.152.198])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0199F1F2;
 Wed, 24 Jun 2020 10:51:12 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 25/31] osdep: Make MIN/MAX evaluate arguments only once
Date: Wed, 24 Jun 2020 06:50:42 -0400
Message-Id: <20200624105048.375353-25-pbonzini@redhat.com>
In-Reply-To: <20200624104917.375143-1-pbonzini@redhat.com>
References: <20200624104917.375143-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/24 02:33:25
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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

From: Eric Blake <eblake@redhat.com>

I'm not aware of any immediate bugs in qemu where a second runtime
evalution of the arguments to MIN() or MAX() causes a problem, but
proactively preventing such abuse is easier than falling prey to an
unintended case down the road.  At any rate, here's the conversation
that sparked the current patch:
https://lists.gnu.org/archive/html/qemu-devel/2018-12/msg05718.html

Update the MIN/MAX macros to only evaluate their argument once at
runtime; this uses typeof(1 ? (a) : (b)) to ensure that we are
promoting the temporaries to the same type as the final comparison (we
have to trigger type promotion, as typeof(bitfield) won't compile; and
we can't use typeof((a) + (b)) or even typeof((a) + 0), as some of our
uses of MAX are on void* pointers where such addition is undefined).

However, we are unable to work around gcc refusing to compile ({}) in
a constant context (such as the array length of a static variable),
even when only used in the dead branch of a __builtin_choose_expr(),
so we have to provide a second macro pair MIN_CONST and MAX_CONST for
use when both arguments are known to be compile-time constants and
where the result must also be usable as a constant; this second form
evaluates arguments multiple times but that doesn't matter for
constants.  By using a void expression as the expansion if a
non-constant is presented to this second form, we can enlist the
compiler to ensure the double evaluation is not attempted on
non-constants.

Alas, as both macros now rely on compiler intrinsics, they are no
longer usable in preprocessor #if conditions; those will just have to
be open-coded or the logic rewritten into #define or runtime 'if'
conditions (but where the compiler dead-code-elimination will probably
still apply).

I tested that both gcc 10.1.1 and clang 10.0.0 produce errors for all
forms of macro mis-use.  As the errors can sometimes be cryptic, I'm
demonstrating the gcc output:

Use of MIN when MIN_CONST is needed:

In file included from /home/eblake/qemu/qemu-img.c:25:
/home/eblake/qemu/include/qemu/osdep.h:249:5: error: braced-group within expression allowed only inside a function
  249 |     ({                                                  \
      |     ^
/home/eblake/qemu/qemu-img.c:92:12: note: in expansion of macro â€˜MINâ€™
   92 | char array[MIN(1, 2)] = "";
      |            ^~~

Use of MIN_CONST when MIN is needed:

/home/eblake/qemu/qemu-img.c: In function â€˜is_allocated_sectorsâ€™:
/home/eblake/qemu/qemu-img.c:1225:15: error: void value not ignored as it ought to be
 1225 |             i = MIN_CONST(i, n);
      |               ^

Use of MIN in the preprocessor:

In file included from /home/eblake/qemu/accel/tcg/translate-all.c:20:
/home/eblake/qemu/accel/tcg/translate-all.c: In function â€˜page_check_rangeâ€™:
/home/eblake/qemu/include/qemu/osdep.h:249:6: error: token "{" is not valid in preprocessor expressions
  249 |     ({                                                  \
      |      ^

Fix the resulting callsites that used #if or computed a compile-time
constant min or max to use the new macros.  cpu-defs.h is interesting,
as CPU_TLB_DYN_MAX_BITS is sometimes used as a constant and sometimes
dynamic.

Signed-off-by: Eric Blake <eblake@redhat.com>

Message-Id: <20200604215236.2798244-1-eblake@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 accel/tcg/translate-all.c |  6 ++---
 hw/usb/hcd-xhci.h         |  2 +-
 include/block/block.h     |  4 +--
 include/exec/cpu-all.h    |  8 +++---
 include/exec/cpu-defs.h   |  7 ++++-
 include/qemu/osdep.h      | 55 ++++++++++++++++++++++++++++++++-------
 migration/qemu-file.c     |  2 +-
 7 files changed, 61 insertions(+), 23 deletions(-)

diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index c3d37058a1..2afa46bd2b 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -2582,9 +2582,9 @@ int page_check_range(target_ulong start, target_ulong len, int flags)
     /* This function should never be called with addresses outside the
        guest address space.  If this assert fires, it probably indicates
        a missing call to h2g_valid.  */
-#if TARGET_ABI_BITS > L1_MAP_ADDR_SPACE_BITS
-    assert(start < ((target_ulong)1 << L1_MAP_ADDR_SPACE_BITS));
-#endif
+    if (TARGET_ABI_BITS > L1_MAP_ADDR_SPACE_BITS) {
+        assert(start < ((target_ulong)1 << L1_MAP_ADDR_SPACE_BITS));
+    }
 
     if (len == 0) {
         return 0;
diff --git a/hw/usb/hcd-xhci.h b/hw/usb/hcd-xhci.h
index 2fad4df2a7..946af51fc2 100644
--- a/hw/usb/hcd-xhci.h
+++ b/hw/usb/hcd-xhci.h
@@ -214,7 +214,7 @@ struct XHCIState {
     uint32_t dcbaap_high;
     uint32_t config;
 
-    USBPort  uports[MAX(MAXPORTS_2, MAXPORTS_3)];
+    USBPort  uports[MAX_CONST(MAXPORTS_2, MAXPORTS_3)];
     XHCIPort ports[MAXPORTS];
     XHCISlot slots[MAXSLOTS];
     uint32_t numports;
diff --git a/include/block/block.h b/include/block/block.h
index 25e299605e..e8fc814996 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -133,8 +133,8 @@ typedef struct HDGeometry {
 #define BDRV_SECTOR_BITS   9
 #define BDRV_SECTOR_SIZE   (1ULL << BDRV_SECTOR_BITS)
 
-#define BDRV_REQUEST_MAX_SECTORS MIN(SIZE_MAX >> BDRV_SECTOR_BITS, \
-                                     INT_MAX >> BDRV_SECTOR_BITS)
+#define BDRV_REQUEST_MAX_SECTORS MIN_CONST(SIZE_MAX >> BDRV_SECTOR_BITS, \
+                                           INT_MAX >> BDRV_SECTOR_BITS)
 #define BDRV_REQUEST_MAX_BYTES (BDRV_REQUEST_MAX_SECTORS << BDRV_SECTOR_BITS)
 
 /*
diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index fb4e8a8e29..fc403d456b 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -176,11 +176,9 @@ extern unsigned long reserved_va;
  * avoid setting bits at the top of guest addresses that might need
  * to be used for tags.
  */
-#if MIN(TARGET_VIRT_ADDR_SPACE_BITS, TARGET_ABI_BITS) <= 32
-# define GUEST_ADDR_MAX_  UINT32_MAX
-#else
-# define GUEST_ADDR_MAX_  (~0ul)
-#endif
+#define GUEST_ADDR_MAX_                                                 \
+    ((MIN_CONST(TARGET_VIRT_ADDR_SPACE_BITS, TARGET_ABI_BITS) <= 32) ?  \
+     UINT32_MAX : ~0ul)
 #define GUEST_ADDR_MAX    (reserved_va ? reserved_va - 1 : GUEST_ADDR_MAX_)
 
 #else
diff --git a/include/exec/cpu-defs.h b/include/exec/cpu-defs.h
index 8c44abefa2..9185632337 100644
--- a/include/exec/cpu-defs.h
+++ b/include/exec/cpu-defs.h
@@ -102,8 +102,13 @@ typedef uint64_t target_ulong;
  * Skylake's Level-2 STLB has 16 1G entries.
  * Also, make sure we do not size the TLB past the guest's address space.
  */
-#  define CPU_TLB_DYN_MAX_BITS                                  \
+#  ifdef TARGET_PAGE_BITS_VARY
+#   define CPU_TLB_DYN_MAX_BITS                                  \
     MIN(22, TARGET_VIRT_ADDR_SPACE_BITS - TARGET_PAGE_BITS)
+#  else
+#   define CPU_TLB_DYN_MAX_BITS                                  \
+    MIN_CONST(22, TARGET_VIRT_ADDR_SPACE_BITS - TARGET_PAGE_BITS)
+#  endif
 # endif
 
 typedef struct CPUTLBEntry {
diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index ff7c17b857..1d1a547206 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -236,18 +236,53 @@ extern int daemon(int, int);
 #define SIZE_MAX ((size_t)-1)
 #endif
 
-#ifndef MIN
-#define MIN(a, b) (((a) < (b)) ? (a) : (b))
-#endif
-#ifndef MAX
-#define MAX(a, b) (((a) > (b)) ? (a) : (b))
-#endif
-
-/* Minimum function that returns zero only iff both values are zero.
+/*
+ * Two variations of MIN/MAX macros. The first is for runtime use, and
+ * evaluates arguments only once (so it is safe even with side
+ * effects), but will not work in constant contexts (such as array
+ * size declarations) because of the '{}'.  The second is for constant
+ * expression use, where evaluating arguments twice is safe because
+ * the result is going to be constant anyway, but will not work in a
+ * runtime context because of a void expression where a value is
+ * expected.  Thus, both gcc and clang will fail to compile if you use
+ * the wrong macro (even if the error may seem a bit cryptic).
+ *
+ * Note that neither form is usable as an #if condition; if you truly
+ * need to write conditional code that depends on a minimum or maximum
+ * determined by the pre-processor instead of the compiler, you'll
+ * have to open-code it.
+ */
+#undef MIN
+#define MIN(a, b)                                       \
+    ({                                                  \
+        typeof(1 ? (a) : (b)) _a = (a), _b = (b);       \
+        _a < _b ? _a : _b;                              \
+    })
+#define MIN_CONST(a, b)                                         \
+    __builtin_choose_expr(                                      \
+        __builtin_constant_p(a) && __builtin_constant_p(b),     \
+        (a) < (b) ? (a) : (b),                                  \
+        ((void)0))
+#undef MAX
+#define MAX(a, b)                                       \
+    ({                                                  \
+        typeof(1 ? (a) : (b)) _a = (a), _b = (b);       \
+        _a > _b ? _a : _b;                              \
+    })
+#define MAX_CONST(a, b)                                         \
+    __builtin_choose_expr(                                      \
+        __builtin_constant_p(a) && __builtin_constant_p(b),     \
+        (a) > (b) ? (a) : (b),                                  \
+        __builtin_unreachable())
+
+/* Minimum function that returns zero only if both values are zero.
  * Intended for use with unsigned values only. */
 #ifndef MIN_NON_ZERO
-#define MIN_NON_ZERO(a, b) ((a) == 0 ? (b) : \
-                                ((b) == 0 ? (a) : (MIN(a, b))))
+#define MIN_NON_ZERO(a, b)                              \
+    ({                                                  \
+        typeof(1 ? (a) : (b)) _a = (a), _b = (b);       \
+        _a == 0 ? _b : (_b == 0 || _b > _a) ? _a : _b;  \
+    })
 #endif
 
 /* Round number down to multiple */
diff --git a/migration/qemu-file.c b/migration/qemu-file.c
index 1c3a358a14..be21518c57 100644
--- a/migration/qemu-file.c
+++ b/migration/qemu-file.c
@@ -31,7 +31,7 @@
 #include "qapi/error.h"
 
 #define IO_BUF_SIZE 32768
-#define MAX_IOV_SIZE MIN(IOV_MAX, 64)
+#define MAX_IOV_SIZE MIN_CONST(IOV_MAX, 64)
 
 struct QEMUFile {
     const QEMUFileOps *ops;
-- 
2.26.2



