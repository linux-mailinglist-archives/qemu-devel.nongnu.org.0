Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2BC656834B
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 11:17:27 +0200 (CEST)
Received: from localhost ([::1]:42122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o919y-0007rN-SF
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 05:17:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1o90LM-0006HR-7p
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 04:25:08 -0400
Received: from mga03.intel.com ([134.134.136.65]:26694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1o90LJ-0000Ss-19
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 04:25:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657095905; x=1688631905;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HzvDsZFYJFjfwBhl27KbOiRZ4k+htychclP9Iyjwp74=;
 b=nnteEQAy/nJrpiyQhjY/TDcz8TGJnyZMCZ64hqt/RNbBFamAMNyob0qX
 SxdtSb62+m+WSbeQM5ODq9bR3jHvSm/GShe3s6XVZavqRidEQyScXiwk2
 mgKfgdCORW8UUxt93lZ3hvn52PDS72TFAgqp+10+cQdYzt1kibytlEnec
 WSWUB10hbU83w7TGvF2f+AYFCql0Ltsj6qifah4uf646yIDFEVVsmFxsx
 7wFgwAO5rHCc+PtcOOS9pc43bwe54KkRas1uOYTNNJO2DmnpWEHc6Yk/T
 j4vUY2LvHV3iVqwJOslP/YYt56JiDpOqANb1h0t7rU8BDOP1YRE4/xY9C g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10399"; a="284800837"
X-IronPort-AV: E=Sophos;i="5.92,249,1650956400"; d="scan'208";a="284800837"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2022 01:24:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,249,1650956400"; d="scan'208";a="567967955"
Received: from chaop.bj.intel.com ([10.240.192.101])
 by orsmga006.jf.intel.com with ESMTP; 06 Jul 2022 01:24:41 -0700
From: Chao Peng <chao.p.peng@linux.intel.com>
To: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
 linux-doc@vger.kernel.org, qemu-devel@nongnu.org,
 linux-kselftest@vger.kernel.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Sean Christopherson <seanjc@google.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, x86@kernel.org,
 "H . Peter Anvin" <hpa@zytor.com>, Hugh Dickins <hughd@google.com>,
 Jeff Layton <jlayton@kernel.org>,
 "J . Bruce Fields" <bfields@fieldses.org>,
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Steven Price <steven.price@arm.com>,
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve <vannapurve@google.com>,
 Yu Zhang <yu.c.zhang@linux.intel.com>,
 Chao Peng <chao.p.peng@linux.intel.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, luto@kernel.org,
 jun.nakajima@intel.com, dave.hansen@intel.com, ak@linux.intel.com,
 david@redhat.com, aarcange@redhat.com, ddutile@redhat.com,
 dhildenb@redhat.com, Quentin Perret <qperret@google.com>,
 Michael Roth <michael.roth@amd.com>, mhocko@suse.com,
 Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v7 06/14] KVM: Rename KVM_PRIVATE_MEM_SLOTS to
 KVM_INTERNAL_MEM_SLOTS
Date: Wed,  6 Jul 2022 16:20:08 +0800
Message-Id: <20220706082016.2603916-7-chao.p.peng@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220706082016.2603916-1-chao.p.peng@linux.intel.com>
References: <20220706082016.2603916-1-chao.p.peng@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=134.134.136.65;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga03.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

KVM_INTERNAL_MEM_SLOTS better reflects the fact those slots are not
exposed to userspace and avoids confusion to real private slots that
is going to be added.

Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
---
 arch/mips/include/asm/kvm_host.h | 2 +-
 arch/x86/include/asm/kvm_host.h  | 2 +-
 include/linux/kvm_host.h         | 6 +++---
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/mips/include/asm/kvm_host.h b/arch/mips/include/asm/kvm_host.h
index 717716cc51c5..45a978c805bc 100644
--- a/arch/mips/include/asm/kvm_host.h
+++ b/arch/mips/include/asm/kvm_host.h
@@ -85,7 +85,7 @@
 
 #define KVM_MAX_VCPUS		16
 /* memory slots that does not exposed to userspace */
-#define KVM_PRIVATE_MEM_SLOTS	0
+#define KVM_INTERNAL_MEM_SLOTS	0
 
 #define KVM_HALT_POLL_NS_DEFAULT 500000
 
diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index de5a149d0971..dae190e19fce 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -53,7 +53,7 @@
 #define KVM_MAX_VCPU_IDS (KVM_MAX_VCPUS * KVM_VCPU_ID_RATIO)
 
 /* memory slots that are not exposed to userspace */
-#define KVM_PRIVATE_MEM_SLOTS 3
+#define KVM_INTERNAL_MEM_SLOTS 3
 
 #define KVM_HALT_POLL_NS_DEFAULT 200000
 
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 3b40f8d68fbb..0bdb6044e316 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -656,12 +656,12 @@ struct kvm_irq_routing_table {
 };
 #endif
 
-#ifndef KVM_PRIVATE_MEM_SLOTS
-#define KVM_PRIVATE_MEM_SLOTS 0
+#ifndef KVM_INTERNAL_MEM_SLOTS
+#define KVM_INTERNAL_MEM_SLOTS 0
 #endif
 
 #define KVM_MEM_SLOTS_NUM SHRT_MAX
-#define KVM_USER_MEM_SLOTS (KVM_MEM_SLOTS_NUM - KVM_PRIVATE_MEM_SLOTS)
+#define KVM_USER_MEM_SLOTS (KVM_MEM_SLOTS_NUM - KVM_INTERNAL_MEM_SLOTS)
 
 #ifndef __KVM_VCPU_MULTIPLE_ADDRESS_SPACE
 static inline int kvm_arch_vcpu_memslots_id(struct kvm_vcpu *vcpu)
-- 
2.25.1


