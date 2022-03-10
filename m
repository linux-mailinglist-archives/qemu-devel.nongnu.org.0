Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A9A4D495F
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 15:21:08 +0100 (CET)
Received: from localhost ([::1]:53764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSJf9-0008OF-OQ
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 09:21:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1nSJVm-0008UM-7H
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 09:11:28 -0500
Received: from mga03.intel.com ([134.134.136.65]:35210)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1nSJVk-00054G-Mg
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 09:11:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646921484; x=1678457484;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=XcUkjLL+YpWw11P834waxgWm/NgeT+vT/ACdu5U5CAo=;
 b=H+4JDP+tnIqN70FDTgMkJe1GCfTp8sD8YKNdwhrrDe89D4omRGI7PB1l
 Hu4FWXufZPp1KDm0ic/RRdyShCwmDvzmekjCNvxu4mWnM1CxUVtm26B7Y
 a+jqea6Y6xnZ+huehTsR2hg5cKDBOnS9uKvtrNekqGQ8+24+kQgGlAReq
 TLuoN1tzlsXPNkW9tkOGMkxy3m4G954EPYV7jImBsNwihl1tKM5Nkzmg6
 plCpxqHv5hUgc2+hJSr6gRpyPEZ69LH/9DQ3M0cQcQQaybnyWQz9ZxIja
 9X7TT3yA9yECJoQdyhdDsmV8zo8phqfVsE5dAnxntuiUAV6T2tF7GWCyD g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10281"; a="255203402"
X-IronPort-AV: E=Sophos;i="5.90,170,1643702400"; d="scan'208";a="255203402"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2022 06:11:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,170,1643702400"; d="scan'208";a="554655270"
Received: from chaop.bj.intel.com ([10.240.192.101])
 by orsmga008.jf.intel.com with ESMTP; 10 Mar 2022 06:11:12 -0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
 qemu-devel@nongnu.org
Subject: [PATCH v5 13/13] memfd_create.2: Describe MFD_INACCESSIBLE flag
Date: Thu, 10 Mar 2022 22:09:11 +0800
Message-Id: <20220310140911.50924-14-chao.p.peng@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220310140911.50924-1-chao.p.peng@linux.intel.com>
References: <20220310140911.50924-1-chao.p.peng@linux.intel.com>
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
Cc: Wanpeng Li <wanpengli@tencent.com>, jun.nakajima@intel.com,
 david@redhat.com, "J . Bruce Fields" <bfields@fieldses.org>,
 dave.hansen@intel.com, "H . Peter Anvin" <hpa@zytor.com>,
 Chao Peng <chao.p.peng@linux.intel.com>, ak@linux.intel.com,
 Jonathan Corbet <corbet@lwn.net>, Joerg Roedel <joro@8bytes.org>,
 x86@kernel.org, Hugh Dickins <hughd@google.com>,
 Steven Price <steven.price@arm.com>, Ingo Molnar <mingo@redhat.com>,
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Borislav Petkov <bp@alien8.de>, luto@kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jim Mattson <jmattson@google.com>,
 Sean Christopherson <seanjc@google.com>, Jeff Layton <jlayton@kernel.org>,
 Yu Zhang <yu.c.zhang@linux.intel.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 Vishal Annapurve <vannapurve@google.com>, Mike Rapoport <rppt@kernel.org>
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


