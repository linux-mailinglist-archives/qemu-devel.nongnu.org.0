Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9DBF44D845
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 15:30:23 +0100 (CET)
Received: from localhost ([::1]:51092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlB5q-0000vM-W5
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 09:30:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1mlAse-00032u-CQ
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 09:16:44 -0500
Received: from mga11.intel.com ([192.55.52.93]:59254)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1mlAsc-0006gt-D6
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 09:16:44 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10164"; a="230378286"
X-IronPort-AV: E=Sophos;i="5.87,226,1631602800"; d="scan'208";a="230378286"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2021 06:16:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,226,1631602800"; d="scan'208";a="492556158"
Received: from chaop.bj.intel.com ([10.240.192.101])
 by orsmga007.jf.intel.com with ESMTP; 11 Nov 2021 06:16:29 -0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, qemu-devel@nongnu.org
Subject: [RFC PATCH 10/13] softmmu/physmem: Add private memory address space
Date: Thu, 11 Nov 2021 22:13:49 +0800
Message-Id: <20211111141352.26311-11-chao.p.peng@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211111141352.26311-1-chao.p.peng@linux.intel.com>
References: <20211111141352.26311-1-chao.p.peng@linux.intel.com>
Received-SPF: none client-ip=192.55.52.93;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga11.intel.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Wanpeng Li <wanpengli@tencent.com>, jun.nakajima@intel.com,
 david@redhat.com, "J . Bruce Fields" <bfields@fieldses.org>,
 dave.hansen@intel.com, "H . Peter Anvin" <hpa@zytor.com>,
 Chao Peng <chao.p.peng@linux.intel.com>, ak@linux.intel.com,
 Jonathan Corbet <corbet@lwn.net>, Joerg Roedel <joro@8bytes.org>,
 x86@kernel.org, Hugh Dickins <hughd@google.com>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 luto@kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Jim Mattson <jmattson@google.com>,
 Sean Christopherson <seanjc@google.com>, susie.li@intel.com,
 Jeff Layton <jlayton@kernel.org>, john.ji@intel.com,
 Yu Zhang <yu.c.zhang@linux.intel.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
---
 include/exec/address-spaces.h |  2 ++
 softmmu/physmem.c             | 13 +++++++++++++
 2 files changed, 15 insertions(+)

diff --git a/include/exec/address-spaces.h b/include/exec/address-spaces.h
index db8bfa9a92..b3f45001c0 100644
--- a/include/exec/address-spaces.h
+++ b/include/exec/address-spaces.h
@@ -27,6 +27,7 @@
  * until a proper bus interface is available.
  */
 MemoryRegion *get_system_memory(void);
+MemoryRegion *get_system_private_memory(void);
 
 /* Get the root I/O port region.  This interface should only be used
  * temporarily until a proper bus interface is available.
@@ -34,6 +35,7 @@ MemoryRegion *get_system_memory(void);
 MemoryRegion *get_system_io(void);
 
 extern AddressSpace address_space_memory;
+extern AddressSpace address_space_private_memory;
 extern AddressSpace address_space_io;
 
 #endif
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index f4d6eeaa17..a2d339fd88 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -85,10 +85,13 @@
 RAMList ram_list = { .blocks = QLIST_HEAD_INITIALIZER(ram_list.blocks) };
 
 static MemoryRegion *system_memory;
+static MemoryRegion *system_private_memory;
 static MemoryRegion *system_io;
 
 AddressSpace address_space_io;
 AddressSpace address_space_memory;
+AddressSpace address_space_private_memory;
+
 
 static MemoryRegion io_mem_unassigned;
 
@@ -2669,6 +2672,11 @@ static void memory_map_init(void)
     memory_region_init(system_memory, NULL, "system", UINT64_MAX);
     address_space_init(&address_space_memory, system_memory, "memory");
 
+    system_private_memory = g_malloc(sizeof(*system_private_memory));
+
+    memory_region_init(system_private_memory, NULL, "system-private", UINT64_MAX);
+    address_space_init(&address_space_private_memory, system_private_memory, "private-memory");
+
     system_io = g_malloc(sizeof(*system_io));
     memory_region_init_io(system_io, NULL, &unassigned_io_ops, NULL, "io",
                           65536);
@@ -2680,6 +2688,11 @@ MemoryRegion *get_system_memory(void)
     return system_memory;
 }
 
+MemoryRegion *get_system_private_memory(void)
+{
+    return system_private_memory;
+}
+
 MemoryRegion *get_system_io(void)
 {
     return system_io;
-- 
2.17.1


