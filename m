Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE656A9D11
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 18:21:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY94V-0005Vv-0Z; Fri, 03 Mar 2023 12:19:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pY94S-0005Vk-OV
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 12:19:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pY94Q-0003Qm-Si
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 12:19:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677863989;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Pe/Uoc8r2RK2RtqW9FRSug7sbCN6iAxq5CdaDKwC19o=;
 b=OjWLzaDZ98XPX5rrrvm+UI0m16ejJg0Laf0RPXTNzcnUQaz7dPAcSxHM/occpgvxOO3CNX
 pFPIrW3xFSgeUDWlixtJQCUIXDAo6oBO/g7aRk1KTTf6qhQxwNpPelUwKSE4H8HTlmgTp+
 waYuH3Sbm+b+QrqREKT70Wq3+rUCpH0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-403-d3khjUA8P0C1isND-zW_vA-1; Fri, 03 Mar 2023 12:19:48 -0500
X-MC-Unique: d3khjUA8P0C1isND-zW_vA-1
Received: by mail-wm1-f71.google.com with SMTP id
 az39-20020a05600c602700b003e97eb80524so3135527wmb.4
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 09:19:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Pe/Uoc8r2RK2RtqW9FRSug7sbCN6iAxq5CdaDKwC19o=;
 b=dAQ9XB6NpllA9gBeg2iiQlxo5HKo8Kmna+9xYNkdQ64DvRLmbT8rAYMcxZPsoS1gzn
 FPxs14Db0/vPZX/vV08K/sPqPBJpfsOvgMzl8i+GpU1h0WDCuBpdfL1aPXvzYJkLwhwQ
 IUVqE82u2T2UvhABwY1A9tvM/ouBAMosJ4B0F/9z6jLglskP0mLBvNDqKzHQe2hDWKY5
 t85z7GdLiGE+zo036ICU0qlNNWGiblI02tmaJxVf9XT+/t1wQAOJ4Iy8G8YIB+a53+M2
 FwJYkXXKmVlFndcfWtCIM8DhS/hrOlMjVqHCgG9gCPGEvU8WuU9mWcywyjS7I6iPT+dO
 Kr6w==
X-Gm-Message-State: AO0yUKX+gTvWJnkynO4w/WqaGhQTLENBo41N9acV8t5dsKmfEkpfhsea
 vvtJ0L7VHkHzqSxMsToBGyYs3yHZWu4sfP7gKmBA/MKEb+BxmhIcpdEY2rSsJIBZeayAi9zWGlc
 o+/Rjh/d/VbWJC9ETuIx4/WyoK+RdWMmGbz3dktWMPbP8XAhK8BWntENXDNu4rVDwKHlWDuaZ
X-Received: by 2002:adf:fd41:0:b0:2ce:3ae0:55a7 with SMTP id
 h1-20020adffd41000000b002ce3ae055a7mr1269381wrs.29.1677863986279; 
 Fri, 03 Mar 2023 09:19:46 -0800 (PST)
X-Google-Smtp-Source: AK7set+dyiV8Vp9hJo8MF4EC/iw2sbFeqqK7pvfH1DYHSzPXJTr4i8W/s3OtxZK1kA4pixxAYvbkDQ==
X-Received: by 2002:adf:fd41:0:b0:2ce:3ae0:55a7 with SMTP id
 h1-20020adffd41000000b002ce3ae055a7mr1269362wrs.29.1677863985910; 
 Fri, 03 Mar 2023 09:19:45 -0800 (PST)
Received: from avogadro.local (nat-pool-mxp-u.redhat.com. [149.6.153.187])
 by smtp.gmail.com with ESMTPSA id
 r1-20020a056000014100b002c5534db60bsm2792341wrx.71.2023.03.03.09.19.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 09:19:45 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: gshan@redhat.com, eesposit@redhat.com, david@redhat.com,
 stefanha@redhat.com, cohuck@redhat.com, eauger@redhat.com
Subject: [PATCH 1/8] qatomic: add smp_mb__before/after_rmw()
Date: Fri,  3 Mar 2023 18:19:32 +0100
Message-Id: <20230303171939.237819-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230303171939.237819-1-pbonzini@redhat.com>
References: <20230303171939.237819-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On ARM, seqcst loads and stores (which QEMU does not use) are compiled
respectively as LDAR and STLR instructions.  Even though STLR is also
used for store-release operations, STLR followed by LDAR provides
store-against-load ordering, which is stronger than a store-release.
Compare this to ARMv7, where store-release is DMB+STR and store-seqcst
is DMB+STR+DMB.

This means that on ARM a sequence of

  qatomic_store_release(&y, ...);         // STLR
  a = qatomic_load_acquire(&x);           // LDAR

provides stronger ordering at the processor level than the two MOV
instructions you'd get on x86.

Likewise, on ARM sequentially consistent read-modify-write operations only
need to use LDAXR and STLXR respectively for the load and the store, which
is weaker than the LOCK prefix used on x86.

In a strange twist of events, however, the _stronger_ semantics
of the ARM instructions can end up causing bugs on ARM, not on x86.
The problems occur when seqcst atomics are mixed with relaxed atomics.

QEMU's atomics try to bridge the Linux API (that most of the developers
are familiar with) and the C11 API, and the two have a substantial
difference:

- in Linux, strongly-ordered atomics such as atomic_add_return() affect
  the global ordering of _all_ memory operations, including for example
  READ_ONCE()/WRITE_ONCE()

- in C11, sequentially consistent atomics (except for seq-cst fences)
  only affect the ordering of sequentially consistent operations.
  In particular, since relaxed loads are done with LDR on ARM, they are
  not ordered against seqcst stores (which are done with STLR).

QEMU implements high-level synchronization primitives with the idea that
the primitives contain the necessary memory barriers, and the callers can
use relaxed atomics (qatomic_read/qatomic_set) or even regular accesses.
This is very much incompatible with the C11 view that seqcst accesses
are only ordered against other seqcst accesses, and requires using seqcst
fences as in the following example:

   qatomic_set(&y, 1);            qatomic_set(&x, 1);
   smp_mb();                      smp_mb();
   ... qatomic_read(&x) ...       ... qatomic_read(&y) ...

When a qatomic_*() read-modify write operation is used instead of one
or both stores, developers that are more familiar with the Linux API may
be tempted to omit the smp_mb(), which will work on x86 but not on ARM.

This nasty difference between Linux and C11 read-modify-write operations
has already caused issues in util/async.c and more are being found.
Provide something similar to Linux smp_mb__before/after_atomic(); this
has the double function of documenting clearly why there is a memory
barrier, and avoiding a double barrier on x86 and s390x systems.

The new macro can already be put to use in qatomic_mb_set().

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/devel/atomics.rst | 26 +++++++++++++++++++++-----
 include/qemu/atomic.h  | 17 ++++++++++++++++-
 2 files changed, 37 insertions(+), 6 deletions(-)

diff --git a/docs/devel/atomics.rst b/docs/devel/atomics.rst
index 7957310071d9..898f5393c07a 100644
--- a/docs/devel/atomics.rst
+++ b/docs/devel/atomics.rst
@@ -27,7 +27,8 @@ provides macros that fall in three camps:
 
 - weak atomic access and manual memory barriers: ``qatomic_read()``,
   ``qatomic_set()``, ``smp_rmb()``, ``smp_wmb()``, ``smp_mb()``,
-  ``smp_mb_acquire()``, ``smp_mb_release()``, ``smp_read_barrier_depends()``;
+  ``smp_mb_acquire()``, ``smp_mb_release()``, ``smp_read_barrier_depends()``,
+  ``smp_mb__before_rmw()``, ``smp_mb__after_rmw()``;
 
 - sequentially consistent atomic access: everything else.
 
@@ -472,7 +473,7 @@ and memory barriers, and the equivalents in QEMU:
   sequential consistency.
 
 - in QEMU, ``qatomic_read()`` and ``qatomic_set()`` do not participate in
-  the total ordering enforced by sequentially-consistent operations.
+  the ordering enforced by read-modify-write operations.
   This is because QEMU uses the C11 memory model.  The following example
   is correct in Linux but not in QEMU:
 
@@ -488,9 +489,24 @@ and memory barriers, and the equivalents in QEMU:
   because the read of ``y`` can be moved (by either the processor or the
   compiler) before the write of ``x``.
 
-  Fixing this requires an ``smp_mb()`` memory barrier between the write
-  of ``x`` and the read of ``y``.  In the common case where only one thread
-  writes ``x``, it is also possible to write it like this:
+  Fixing this requires a full memory barrier between the write of ``x`` and
+  the read of ``y``.  QEMU provides ``smp_mb__before_rmw()`` and
+  ``smp_mb__after_rmw()``; they act both as an optimization,
+  avoiding the memory barrier on processors where it is unnecessary,
+  and as a clarification of this corner case of the C11 memory model:
+
+      +--------------------------------+
+      | QEMU (incorrect)               |
+      +================================+
+      | ::                             |
+      |                                |
+      |   a = qatomic_fetch_add(&x, 2);|
+      |   smp_mb__after_rmw();         |
+      |   b = qatomic_read(&y);        |
+      +--------------------------------+
+
+  In the common case where only one thread writes ``x``, it is also possible
+  to write it like this:
 
       +--------------------------------+
       | QEMU (correct)                 |
diff --git a/include/qemu/atomic.h b/include/qemu/atomic.h
index 874134fd19ae..f85834ee8b20 100644
--- a/include/qemu/atomic.h
+++ b/include/qemu/atomic.h
@@ -245,6 +245,20 @@
 #define smp_wmb()   smp_mb_release()
 #define smp_rmb()   smp_mb_acquire()
 
+/*
+ * SEQ_CST is weaker than the older __sync_* builtins and Linux
+ * kernel read-modify-write atomics.  Provide a macro to obtain
+ * the same semantics.
+ */
+#if !defined(QEMU_SANITIZE_THREAD) && \
+    (defined(__i386__) || defined(__x86_64__) || defined(__s390x__))
+# define smp_mb__before_rmw() signal_barrier()
+# define smp_mb__after_rmw() signal_barrier()
+#else
+# define smp_mb__before_rmw() smp_mb()
+# define smp_mb__after_rmw() smp_mb()
+#endif
+
 /* qatomic_mb_read/set semantics map Java volatile variables. They are
  * less expensive on some platforms (notably POWER) than fully
  * sequentially consistent operations.
@@ -259,7 +273,8 @@
 #if !defined(QEMU_SANITIZE_THREAD) && \
     (defined(__i386__) || defined(__x86_64__) || defined(__s390x__))
 /* This is more efficient than a store plus a fence.  */
-# define qatomic_mb_set(ptr, i)  ((void)qatomic_xchg(ptr, i))
+# define qatomic_mb_set(ptr, i) \
+    ({ (void)qatomic_xchg(ptr, i); smp_mb__after_rmw(); })
 #else
 # define qatomic_mb_set(ptr, i) \
    ({ qatomic_store_release(ptr, i); smp_mb(); })
-- 
2.39.1


