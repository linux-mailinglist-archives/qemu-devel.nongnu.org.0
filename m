Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1894BA340
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 15:43:05 +0100 (CET)
Received: from localhost ([::1]:47478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKhzs-0001dT-PU
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 09:43:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1nKh6y-0003co-JW
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 08:46:20 -0500
Received: from mga03.intel.com ([134.134.136.65]:49582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1nKh6w-0002we-HC
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 08:46:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645105578; x=1676641578;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=8+xFg8pu7fX7w5OrNIMbop+pkXQzV4mq0rLcHHtAokE=;
 b=c2cyrNQ3L93mrat/E3kcpy//tccWaEDq8bUnP7Jjrxbl9bX7Y4slIiZs
 r+mqyjBCQNA12RJHJeG/FvR5ureN6zySR3PBENrqUFt5RhZFcBGOhMqFw
 akrUqX90XbZBtz5orsRCmCnlKK1uGTTpDR5nE6MYs6KIrEz2kyFgff5T/
 +P0QOV5TyctV4BwnEVP4/fMgZSjQtFyrd/J0cwC/nZt3F+mR2QyP37k6O
 BneMUqYxVwUFcPUv0jF3rFDcR5eLKOGfhVXGt4bWDIGJlKxULaLOXXYVB
 oEq9v+1sesraAZMaP6TYaDnOZnTzR6F8xE7y0kOtxDeIDys2gDduysYTx g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10260"; a="250818987"
X-IronPort-AV: E=Sophos;i="5.88,375,1635231600"; d="scan'208";a="250818987"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 05:46:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,375,1635231600"; d="scan'208";a="503513631"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.192.101])
 by orsmga002.jf.intel.com with ESMTP; 17 Feb 2022 05:46:10 -0800
Date: Thu, 17 Feb 2022 21:45:48 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
Subject: Re: [PATCH v4 12/12] KVM: Expose KVM_MEM_PRIVATE
Message-ID: <20220217134548.GA33836@chaop.bj.intel.com>
References: <20220118132121.31388-1-chao.p.peng@linux.intel.com>
 <20220118132121.31388-13-chao.p.peng@linux.intel.com>
 <a121e766-900d-2135-1516-e1d3ba716834@maciej.szmigiero.name>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a121e766-900d-2135-1516-e1d3ba716834@maciej.szmigiero.name>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
 Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
 Yu Zhang <yu.c.zhang@linux.intel.com>, linux-fsdevel@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 25, 2022 at 09:20:39PM +0100, Maciej S. Szmigiero wrote:
> On 18.01.2022 14:21, Chao Peng wrote:
> > KVM_MEM_PRIVATE is not exposed by default but architecture code can turn
> > on it by implementing kvm_arch_private_memory_supported().
> > 
> > Also private memslot cannot be movable and the same file+offset can not
> > be mapped into different GFNs.
> > 
> > Signed-off-by: Yu Zhang <yu.c.zhang@linux.intel.com>
> > Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
> > ---
> (..)
> >   static bool kvm_check_memslot_overlap(struct kvm_memslots *slots, int id,
> > -				      gfn_t start, gfn_t end)
> > +				      struct file *file,
> > +				      gfn_t start, gfn_t end,
> > +				      loff_t start_off, loff_t end_off)
> >   {
> >   	struct kvm_memslot_iter iter;
> > +	struct kvm_memory_slot *slot;
> > +	struct inode *inode;
> > +	int bkt;
> >   	kvm_for_each_memslot_in_gfn_range(&iter, slots, start, end) {
> >   		if (iter.slot->id != id)
> >   			return true;
> >   	}
> > +	/* Disallow mapping the same file+offset into multiple gfns. */
> > +	if (file) {
> > +		inode = file_inode(file);
> > +		kvm_for_each_memslot(slot, bkt, slots) {
> > +			if (slot->private_file &&
> > +			     file_inode(slot->private_file) == inode &&
> > +			     !(end_off <= slot->private_offset ||
> > +			       start_off >= slot->private_offset
> > +					     + (slot->npages >> PAGE_SHIFT)))
> > +				return true;
> > +		}
> > +	}
> 
> That's a linear scan of all memslots on each CREATE (and MOVE) operation
> with a fd - we just spent more than a year rewriting similar linear scans
> into more efficient operations in KVM.

In the last version I tried to solve this problem by using interval tree
(just like existing hva_tree), but finally we realized that in one VM we
can have multiple fds with overlapped offsets so that approach is
incorrect. See https://lkml.org/lkml/2021/12/28/480 for the discussion.

So linear scan is used before I can find a better way.

Chao

