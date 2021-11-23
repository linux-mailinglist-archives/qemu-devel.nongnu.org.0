Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E68345A5BA
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 15:33:38 +0100 (CET)
Received: from localhost ([::1]:53966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpWrY-0006xN-P7
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 09:33:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1mpWpl-0006Fr-2F
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 09:31:45 -0500
Received: from mga18.intel.com ([134.134.136.126]:13155)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1mpWpi-0002uV-Kb
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 09:31:44 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10176"; a="221909682"
X-IronPort-AV: E=Sophos;i="5.87,257,1631602800"; d="scan'208";a="221909682"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2021 06:31:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,257,1631602800"; d="scan'208";a="509429128"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.192.101])
 by orsmga008.jf.intel.com with ESMTP; 23 Nov 2021 06:31:17 -0800
Date: Tue, 23 Nov 2021 22:30:31 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [RFC v2 PATCH 04/13] KVM: Add fd-based memslot data structure
 and utils
Message-ID: <20211123143031.GC32088@chaop.bj.intel.com>
References: <20211119134739.20218-1-chao.p.peng@linux.intel.com>
 <20211119134739.20218-5-chao.p.peng@linux.intel.com>
 <d54d58a4-3cd0-5fa3-3a81-b4bb27a7f511@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d54d58a4-3cd0-5fa3-3a81-b4bb27a7f511@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Received-SPF: none client-ip=134.134.136.126;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga18.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Reply-To: Chao Peng <chao.p.peng@linux.intel.com>
Cc: Wanpeng Li <wanpengli@tencent.com>, jun.nakajima@intel.com,
 kvm@vger.kernel.org, david@redhat.com, qemu-devel@nongnu.org,
 "J . Bruce Fields" <bfields@fieldses.org>, linux-mm@kvack.org,
 "H . Peter Anvin" <hpa@zytor.com>, ak@linux.intel.com,
 Jonathan Corbet <corbet@lwn.net>, Joerg Roedel <joro@8bytes.org>,
 x86@kernel.org, Hugh Dickins <hughd@google.com>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 luto@kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Jim Mattson <jmattson@google.com>,
 dave.hansen@intel.com, Sean Christopherson <seanjc@google.com>,
 susie.li@intel.com, Jeff Layton <jlayton@kernel.org>,
 linux-kernel@vger.kernel.org, john.ji@intel.com,
 Yu Zhang <yu.c.zhang@linux.intel.com>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 23, 2021 at 09:41:34AM +0100, Paolo Bonzini wrote:
> On 11/19/21 14:47, Chao Peng wrote:
> > For fd-based memslot store the file references for shared fd and the
> > private fd (if any) in the memslot structure. Since there is no 'hva'
> > concept we cannot call hva_to_pfn() to get a pfn, instead kvm_memfd_ops
> > is added to get_pfn/put_pfn from the memory backing stores that provide
> > these fds.
> > 
> > Signed-off-by: Yu Zhang<yu.c.zhang@linux.intel.com>
> > Signed-off-by: Chao Peng<chao.p.peng@linux.intel.com>
> > ---
> 
> What about kvm_read/write_guest? 

Hmm, that would be another area KVM needs to change. Not totally
undoable.

> Maybe the proposal which kept
> userspace_addr for the shared fd is more doable (it would be great to
> ultimately remove the mandatory userspace mapping for the shared fd, but I
> think KVM is not quite ready for that).

Agree for short term keeping shared part unchanged would be making work
easy:) Let me try that to see if any blocker.

> 
> Paolo

