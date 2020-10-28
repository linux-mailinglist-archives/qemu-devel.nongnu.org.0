Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC1F29CE79
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Oct 2020 08:13:17 +0100 (CET)
Received: from localhost ([::1]:51016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kXfe0-0005lr-Ub
	for lists+qemu-devel@lfdr.de; Wed, 28 Oct 2020 03:13:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1kXfca-0004St-Fu; Wed, 28 Oct 2020 03:11:48 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:2116)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1kXfcY-0003Ga-Ki; Wed, 28 Oct 2020 03:11:48 -0400
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4CLfrb6RKpz6yy4;
 Wed, 28 Oct 2020 15:11:43 +0800 (CST)
Received: from [10.174.187.138] (10.174.187.138) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.487.0; Wed, 28 Oct 2020 15:11:30 +0800
Message-ID: <5F9919A2.9080205@huawei.com>
Date: Wed, 28 Oct 2020 15:11:30 +0800
From: AlexChen <alex.chen@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.2; WOW64;
 rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: <pbonzini@redhat.com>, <chenhc@lemote.com>, <pasic@linux.ibm.com>,
 <borntraeger@de.ibm.com>, <mtosatti@redhat.com>, <cohuck@redhat.com>
Subject: [PATCH 2/4] kvm: Replace DEBUG_KVM with CONFIG_DEBUG_KVM
References: <5F97FD61.4060804@huawei.com> <5F991331.4020604@huawei.com>
In-Reply-To: <5F991331.4020604@huawei.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.187.138]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35; envelope-from=alex.chen@huawei.com;
 helo=szxga07-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/28 03:11:28
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: zhengchuan@huawei.com, qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
 kvm@vger.kernel.org, zhang.zhanghailiang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now we can control the definition of DPRINTF by CONFIG_DEBUG_KVM,
so let's replace DEBUG_KVM with CONFIG_DEBUG_KVM.

Signed-off-by: AlexChen <alex.chen@huawei.com>
---
 accel/kvm/kvm-all.c | 3 +--
 target/i386/kvm.c   | 4 +---
 target/mips/kvm.c   | 6 ++++--
 target/s390x/kvm.c  | 6 +++---
 4 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 9ef5daf4c5..fc6d99a731 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -60,9 +60,8 @@
  */
 #define PAGE_SIZE qemu_real_host_page_size

-//#define DEBUG_KVM

-#ifdef DEBUG_KVM
+#ifdef CONFIG_DEBUG_KVM
 #define DPRINTF(fmt, ...) \
     do { fprintf(stderr, fmt, ## __VA_ARGS__); } while (0)
 #else
diff --git a/target/i386/kvm.c b/target/i386/kvm.c
index cf46259534..3e9344aed5 100644
--- a/target/i386/kvm.c
+++ b/target/i386/kvm.c
@@ -50,9 +50,7 @@
 #include "exec/memattrs.h"
 #include "trace.h"

-//#define DEBUG_KVM
-
-#ifdef DEBUG_KVM
+#ifdef CONFIG_DEBUG_KVM
 #define DPRINTF(fmt, ...) \
     do { fprintf(stderr, fmt, ## __VA_ARGS__); } while (0)
 #else
diff --git a/target/mips/kvm.c b/target/mips/kvm.c
index 72637a1e02..a0b979e6d2 100644
--- a/target/mips/kvm.c
+++ b/target/mips/kvm.c
@@ -28,10 +28,12 @@
 #include "exec/memattrs.h"
 #include "hw/boards.h"

-#define DEBUG_KVM 0
+#ifndef CONFIG_DEBUG_KVM
+#define CONFIG_DEBUG_KVM 0
+#endif

 #define DPRINTF(fmt, ...) \
-    do { if (DEBUG_KVM) { fprintf(stderr, fmt, ## __VA_ARGS__); } } while (0)
+    do { if (CONFIG_DEBUG_KVM) { fprintf(stderr, fmt, ## __VA_ARGS__); } } while (0)

 static int kvm_mips_fpu_cap;
 static int kvm_mips_msa_cap;
diff --git a/target/s390x/kvm.c b/target/s390x/kvm.c
index f13eff688c..8bc9e1e468 100644
--- a/target/s390x/kvm.c
+++ b/target/s390x/kvm.c
@@ -52,12 +52,12 @@
 #include "hw/s390x/s390-virtio-hcall.h"
 #include "hw/s390x/pv.h"

-#ifndef DEBUG_KVM
-#define DEBUG_KVM  0
+#ifndef CONFIG_DEBUG_KVM
+#define CONFIG_DEBUG_KVM  0
 #endif

 #define DPRINTF(fmt, ...) do {                \
-    if (DEBUG_KVM) {                          \
+    if (CONFIG_DEBUG_KVM) {                          \
         fprintf(stderr, fmt, ## __VA_ARGS__); \
     }                                         \
 } while (0)
-- 
2.19.1

