Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 543BB5683C2
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 11:43:11 +0200 (CEST)
Received: from localhost ([::1]:43640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o91Ys-0005k0-CB
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 05:43:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1o90Mp-0007GY-4o
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 04:26:40 -0400
Received: from mga18.intel.com ([134.134.136.126]:1783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1o90Mm-0000sf-O0
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 04:26:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657095996; x=1688631996;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XcUkjLL+YpWw11P834waxgWm/NgeT+vT/ACdu5U5CAo=;
 b=m40nXxEWgvxRqgStmYftifXbpMEgKGzpMW6+XvP3hANergHkzo8OovdO
 1T6z+0msKDBc0U4VtdGfSoPzqEPeVrOa0ljlsoccSWLimc4gZd4+UNtjF
 DDWmuwCgNp7k2tSUK2XuzWAU05RHEDgihu0hvfZYqj9WeJMzSbpfcXzhc
 Pg9fLEGhnro2QsQJEk3HkXnB7t6JEm9aohrx1fl5mwu2hmBa9UNTYybrY
 Zpzpyu8fv2QeTFoJdl/8WSoYIXiwPUOvBUylKw12/qiVhMZ8lnxuontaG
 1oGYKZPO1ataV/gaAv0yzjfQtrzspaPicPvsGrmviKzfWtfNHN59Aubm3 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10399"; a="266710165"
X-IronPort-AV: E=Sophos;i="5.92,249,1650956400"; d="scan'208";a="266710165"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2022 01:26:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,249,1650956400"; d="scan'208";a="567968372"
Received: from chaop.bj.intel.com ([10.240.192.101])
 by orsmga006.jf.intel.com with ESMTP; 06 Jul 2022 01:26:16 -0700
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
Subject: [PATCH v7 14/14] memfd_create.2: Describe MFD_INACCESSIBLE flag
Date: Wed,  6 Jul 2022 16:20:16 +0800
Message-Id: <20220706082016.2603916-15-chao.p.peng@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220706082016.2603916-1-chao.p.peng@linux.intel.com>
References: <20220706082016.2603916-1-chao.p.peng@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=134.134.136.126;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga18.intel.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
---
 man2/memfd_create.2 | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/man2/memfd_create.2 b/man2/memfd_create.2
index 89e9c4136..2698222ae 100644
--- a/man2/memfd_create.2
+++ b/man2/memfd_create.2
@@ -101,6 +101,19 @@ meaning that no other seals can be set on the file.
 .\" FIXME Why is the MFD_ALLOW_SEALING behavior not simply the default?
 .\" Is it worth adding some text explaining this?
 .TP
+.BR MFD_INACCESSIBLE
+Disallow userspace access through ordinary MMU accesses via
+.BR read (2),
+.BR write (2)
+and
+.BR mmap (2).
+The file size cannot be changed once initialized.
+This flag cannot coexist with
+.B MFD_ALLOW_SEALING
+and when this flag is set, the initial set of seals will be
+.B F_SEAL_SEAL,
+meaning that no other seals can be set on the file.
+.TP
 .BR MFD_HUGETLB " (since Linux 4.14)"
 .\" commit 749df87bd7bee5a79cef073f5d032ddb2b211de8
 The anonymous file will be created in the hugetlbfs filesystem using
-- 
2.17.1


