Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A8C229336
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jul 2020 10:13:00 +0200 (CEST)
Received: from localhost ([::1]:45210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jy9s3-0000cY-OL
	for lists+qemu-devel@lfdr.de; Wed, 22 Jul 2020 04:12:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dplotnikov@virtuozzo.com>)
 id 1jy9qt-0007it-GB
 for qemu-devel@nongnu.org; Wed, 22 Jul 2020 04:11:47 -0400
Received: from relay.sw.ru ([185.231.240.75]:54956 helo=relay3.sw.ru)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dplotnikov@virtuozzo.com>)
 id 1jy9qq-0004p7-ML
 for qemu-devel@nongnu.org; Wed, 22 Jul 2020 04:11:46 -0400
Received: from [10.94.4.71] (helo=dptest2.qa.sw.ru)
 by relay3.sw.ru with esmtp (Exim 4.93)
 (envelope-from <dplotnikov@virtuozzo.com>)
 id 1jy9ql-0002yK-PU; Wed, 22 Jul 2020 11:11:39 +0300
From: Denis Plotnikov <dplotnikov@virtuozzo.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v0 1/4] bitops: add some atomic versions of bitmap operations
Date: Wed, 22 Jul 2020 11:11:30 +0300
Message-Id: <20200722081133.29926-2-dplotnikov@virtuozzo.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20200722081133.29926-1-dplotnikov@virtuozzo.com>
References: <20200722081133.29926-1-dplotnikov@virtuozzo.com>
Received-SPF: pass client-ip=185.231.240.75;
 envelope-from=dplotnikov@virtuozzo.com; helo=relay3.sw.ru
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/22 04:11:41
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_BL_SPAMCOP_NET=1.347,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: quintela@redhat.com, dgilbert@redhat.com, peterx@redhat.com,
 armbru@redhat.com, den@openvz.org, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

1. test bit
2. test and set bit

Signed-off-by: Denis Plotnikov <dplotnikov@virtuozzo.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
---
 include/qemu/bitops.h | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/include/qemu/bitops.h b/include/qemu/bitops.h
index f55ce8b320..63218afa5a 100644
--- a/include/qemu/bitops.h
+++ b/include/qemu/bitops.h
@@ -95,6 +95,21 @@ static inline int test_and_set_bit(long nr, unsigned long *addr)
     return (old & mask) != 0;
 }
 
+/**
+ * test_and_set_bit_atomic - Set a bit atomically and return its old value
+ * @nr: Bit to set
+ * @addr: Address to count from
+ */
+static inline int test_and_set_bit_atomic(long nr, unsigned long *addr)
+{
+    unsigned long mask = BIT_MASK(nr);
+    unsigned long *p = addr + BIT_WORD(nr);
+    unsigned long old;
+
+    old = atomic_fetch_or(p, mask);
+    return (old & mask) != 0;
+}
+
 /**
  * test_and_clear_bit - Clear a bit and return its old value
  * @nr: Bit to clear
@@ -135,6 +150,16 @@ static inline int test_bit(long nr, const unsigned long *addr)
     return 1UL & (addr[BIT_WORD(nr)] >> (nr & (BITS_PER_LONG-1)));
 }
 
+/**
+ * test_bit_atomic - Determine whether a bit is set atomicallly
+ * @nr: bit number to test
+ * @addr: Address to start counting from
+ */
+static inline int test_bit_atomic(long nr, const unsigned long *addr)
+{
+    long valid_nr = nr & (BITS_PER_LONG - 1);
+    return 1UL & (atomic_read(&addr[BIT_WORD(nr)]) >> valid_nr);
+}
 /**
  * find_last_bit - find the last set bit in a memory region
  * @addr: The address to start the search at
-- 
2.17.0


