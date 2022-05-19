Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA3B52DA02
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 18:17:08 +0200 (CEST)
Received: from localhost ([::1]:47562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nripl-0008HX-Q9
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 12:17:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1nriIO-0003Cz-4q
 for qemu-devel@nongnu.org; Thu, 19 May 2022 11:42:36 -0400
Received: from mga11.intel.com ([192.55.52.93]:24018)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1nriIM-0000ng-GF
 for qemu-devel@nongnu.org; Thu, 19 May 2022 11:42:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652974954; x=1684510954;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XcUkjLL+YpWw11P834waxgWm/NgeT+vT/ACdu5U5CAo=;
 b=hNmMTSjG6ZyG5DvIkcC37fkWk4gVkU+UU75gX5fQWyunMg+U3ie1sf0g
 RhU80WBxJuoc5QqiSPY86hE0V1Wc3WnmkWcTvtO+R3G4dEh+fBi20zn2K
 Mv/YAkcpqEpyFgpN/qU4fkNG5jxmioHEF2T5pvpIL9z6i3wEpVTiJqf8A
 zuTGWgwSZjSlzdiYkvDsm369cuiABbWxfu7QzLwNOkHzSCQ4wxbC4dI7Q
 kwRdpz6xDvg+l1FCGEMvNt3C+/H0scBvtRkHbFg6oC3N6Irv9ClDlEt7Y
 mN0v/7FNDlElfNzw0qfialV/A5xycuq7IhSa55uiYSQFqRNBd08Vnu9wD A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10352"; a="269837975"
X-IronPort-AV: E=Sophos;i="5.91,237,1647327600"; d="scan'208";a="269837975"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2022 08:42:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,237,1647327600"; d="scan'208";a="598635609"
Received: from chaop.bj.intel.com ([10.240.192.101])
 by orsmga008.jf.intel.com with ESMTP; 19 May 2022 08:42:03 -0700
From: Chao Peng <chao.p.peng@linux.intel.com>
To: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
 linux-doc@vger.kernel.org, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Sean Christopherson <seanjc@google.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, x86@kernel.org,
 "H . Peter Anvin" <hpa@zytor.com>, Hugh Dickins <hughd@google.com>,
 Jeff Layton <jlayton@kernel.org>,
 "J . Bruce Fields" <bfields@fieldses.org>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>,
 Steven Price <steven.price@arm.com>,
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve <vannapurve@google.com>,
 Yu Zhang <yu.c.zhang@linux.intel.com>,
 Chao Peng <chao.p.peng@linux.intel.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, luto@kernel.org,
 jun.nakajima@intel.com, dave.hansen@intel.com, ak@linux.intel.com,
 david@redhat.com, aarcange@redhat.com, ddutile@redhat.com,
 dhildenb@redhat.com, Quentin Perret <qperret@google.com>,
 Michael Roth <michael.roth@amd.com>, mhocko@suse.com
Subject: [PATCH v6 8/8] memfd_create.2: Describe MFD_INACCESSIBLE flag
Date: Thu, 19 May 2022 23:37:13 +0800
Message-Id: <20220519153713.819591-9-chao.p.peng@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220519153713.819591-1-chao.p.peng@linux.intel.com>
References: <20220519153713.819591-1-chao.p.peng@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=192.55.52.93;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga11.intel.com
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_HI=-5,
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


