Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B314F963B
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Apr 2022 14:57:00 +0200 (CEST)
Received: from localhost ([::1]:59652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncoAd-0000sg-8M
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 08:56:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1nco8t-0008CV-Ew
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 08:55:11 -0400
Received: from mga12.intel.com ([192.55.52.136]:48953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1nco8q-0005AK-CO
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 08:55:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649422508; x=1680958508;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=O9odkqTVXr/6ytKIrHbe23E6RNpY/PYB3IDXxuv8ddY=;
 b=HgcUzvh39/dP6AWWNoXWF/gyUB5H1JgpLaCphFWMKqsuk7wQP2icLBgG
 Lf1U+73l4ECruOpuWlHRUG3Qhf49Tq6DUYSB40e+J4CDlVE/5OLOskGqN
 LMr9O1n/f/tg4jWZ7TTEQ8zuk/f41PCImTAyJJRZ7Nl2hUS27ik9KpI8b
 cVhNv2EolfGDdBhm8nvgJN0cufQFgfacscVIFazfgVOBANxHGoao7ivt9
 HF+WlBRZp2m3be+4mc4uyn+cNM49RDPFNXJF3459WkTeDHIYMCOhubS2K
 wVOziVKaXsdy/fFNSulBC40gcRmRDOJQ4UkawCa9HvBCX0i3b7EN0bJQs g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10310"; a="241518269"
X-IronPort-AV: E=Sophos;i="5.90,245,1643702400"; d="scan'208";a="241518269"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2022 05:55:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,245,1643702400"; d="scan'208";a="698172668"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.192.101])
 by fmsmga001.fm.intel.com with ESMTP; 08 Apr 2022 05:54:56 -0700
Date: Fri, 8 Apr 2022 20:54:45 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: Sean Christopherson <seanjc@google.com>
Subject: Re: [PATCH v5 02/13] mm: Introduce memfile_notifier
Message-ID: <20220408125445.GA57095@chaop.bj.intel.com>
References: <20220310140911.50924-1-chao.p.peng@linux.intel.com>
 <20220310140911.50924-3-chao.p.peng@linux.intel.com>
 <YkNTvFqWI5F5w+DW@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YkNTvFqWI5F5w+DW@google.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Received-SPF: none client-ip=192.55.52.136;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga12.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_NONE=0.001,
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
 Steven Price <steven.price@arm.com>, Ingo Molnar <mingo@redhat.com>,
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Borislav Petkov <bp@alien8.de>, luto@kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jim Mattson <jmattson@google.com>,
 dave.hansen@intel.com, linux-api@vger.kernel.org,
 Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
 Yu Zhang <yu.c.zhang@linux.intel.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 linux-fsdevel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Vishal Annapurve <vannapurve@google.com>, Mike Rapoport <rppt@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 29, 2022 at 06:45:16PM +0000, Sean Christopherson wrote:
> On Thu, Mar 10, 2022, Chao Peng wrote:
> > diff --git a/mm/Makefile b/mm/Makefile
> > index 70d4309c9ce3..f628256dce0d 100644
> > +void memfile_notifier_invalidate(struct memfile_notifier_list *list,
> > +				 pgoff_t start, pgoff_t end)
> > +{
> > +	struct memfile_notifier *notifier;
> > +	int id;
> > +
> > +	id = srcu_read_lock(&srcu);
> > +	list_for_each_entry_srcu(notifier, &list->head, list,
> > +				 srcu_read_lock_held(&srcu)) {
> > +		if (notifier->ops && notifier->ops->invalidate)
> 
> Any reason notifier->ops isn't mandatory?

Yes it's mandatory, will skip the check here.

> 
> > +			notifier->ops->invalidate(notifier, start, end);
> > +	}
> > +	srcu_read_unlock(&srcu, id);
> > +}
> > +
> > +void memfile_notifier_fallocate(struct memfile_notifier_list *list,
> > +				pgoff_t start, pgoff_t end)
> > +{
> > +	struct memfile_notifier *notifier;
> > +	int id;
> > +
> > +	id = srcu_read_lock(&srcu);
> > +	list_for_each_entry_srcu(notifier, &list->head, list,
> > +				 srcu_read_lock_held(&srcu)) {
> > +		if (notifier->ops && notifier->ops->fallocate)
> > +			notifier->ops->fallocate(notifier, start, end);
> > +	}
> > +	srcu_read_unlock(&srcu, id);
> > +}
> > +
> > +void memfile_register_backing_store(struct memfile_backing_store *bs)
> > +{
> > +	BUG_ON(!bs || !bs->get_notifier_list);
> > +
> > +	list_add_tail(&bs->list, &backing_store_list);
> > +}
> > +
> > +void memfile_unregister_backing_store(struct memfile_backing_store *bs)
> > +{
> > +	list_del(&bs->list);
> 
> Allowing unregistration of a backing store is broken.  Using the _safe() variant
> is not sufficient to guard against concurrent modification.  I don't see any reason
> to support this out of the gate, the only reason to support unregistering a backing
> store is if the backing store is implemented as a module, and AFAIK none of the
> backing stores we plan on supporting initially support being built as a module.
> These aren't exported, so it's not like that's even possible.  Registration would
> also be broken if modules are allowed, I'm pretty sure module init doesn't run
> under a global lock.
> 
> We can always add this complexity if it's needed in the future, but for now the
> easiest thing would be to tag memfile_register_backing_store() with __init and
> make backing_store_list __ro_after_init.

The only currently supported backing store shmem does not need this so
can remove it for now.

> 
> > +}
> > +
> > +static int memfile_get_notifier_info(struct inode *inode,
> > +				     struct memfile_notifier_list **list,
> > +				     struct memfile_pfn_ops **ops)
> > +{
> > +	struct memfile_backing_store *bs, *iter;
> > +	struct memfile_notifier_list *tmp;
> > +
> > +	list_for_each_entry_safe(bs, iter, &backing_store_list, list) {
> > +		tmp = bs->get_notifier_list(inode);
> > +		if (tmp) {
> > +			*list = tmp;
> > +			if (ops)
> > +				*ops = &bs->pfn_ops;
> > +			return 0;
> > +		}
> > +	}
> > +	return -EOPNOTSUPP;
> > +}
> > +
> > +int memfile_register_notifier(struct inode *inode,
> 
> Taking an inode is a bit odd from a user perspective.  Any reason not to take a
> "struct file *" and get the inode here?  That would give callers a hint that they
> need to hold a reference to the file for the lifetime of the registration.

Yes, I can change.

> 
> > +			      struct memfile_notifier *notifier,
> > +			      struct memfile_pfn_ops **pfn_ops)
> > +{
> > +	struct memfile_notifier_list *list;
> > +	int ret;
> > +
> > +	if (!inode || !notifier | !pfn_ops)
> 
> Bitwise | instead of logical ||.  But IMO taking in a pfn_ops pointer is silly.
> More below.
> 
> > +		return -EINVAL;
> > +
> > +	ret = memfile_get_notifier_info(inode, &list, pfn_ops);
> > +	if (ret)
> > +		return ret;
> > +
> > +	spin_lock(&list->lock);
> > +	list_add_rcu(&notifier->list, &list->head);
> > +	spin_unlock(&list->lock);
> > +
> > +	return 0;
> > +}
> > +EXPORT_SYMBOL_GPL(memfile_register_notifier);
> > +
> > +void memfile_unregister_notifier(struct inode *inode,
> > +				 struct memfile_notifier *notifier)
> > +{
> > +	struct memfile_notifier_list *list;
> > +
> > +	if (!inode || !notifier)
> > +		return;
> > +
> > +	BUG_ON(memfile_get_notifier_info(inode, &list, NULL));
> 
> Eww.  Rather than force the caller to provide the inode/file and the notifier,
> what about grabbing the backing store itself in the notifier?
> 
> 	struct memfile_notifier {
> 		struct list_head list;
> 		struct memfile_notifier_ops *ops;
> 
> 		struct memfile_backing_store *bs;
> 	};
> 
> That also helps avoid confusing between "ops" and "pfn_ops".  IMO, exposing
> memfile_backing_store to the caller isn't a big deal, and is preferable to having
> to rewalk multiple lists just to delete a notifier.

Agreed, good suggestion.

> 
> Then this can become:
> 
>   void memfile_unregister_notifier(struct memfile_notifier *notifier)
>   {
> 	spin_lock(&notifier->bs->list->lock);
> 	list_del_rcu(&notifier->list);
> 	spin_unlock(&notifier->bs->list->lock);
> 
> 	synchronize_srcu(&srcu);
>   }
> 
> and registration can be:
> 
>   int memfile_register_notifier(const struct file *file,
> 			      struct memfile_notifier *notifier)
>   {
> 	struct memfile_notifier_list *list;
> 	struct memfile_backing_store *bs;
> 	int ret;
> 
> 	if (!file || !notifier)
> 		return -EINVAL;
> 
> 	list_for_each_entry(bs, &backing_store_list, list) {
> 		list = bs->get_notifier_list(file_inode(file));
> 		if (list) {
> 			notifier->bs = bs;
> 
> 			spin_lock(&list->lock);
> 			list_add_rcu(&notifier->list, &list->head);
> 			spin_unlock(&list->lock);
> 			return 0;
> 		}
> 	}
> 
> 	return -EOPNOTSUPP;
>   }

