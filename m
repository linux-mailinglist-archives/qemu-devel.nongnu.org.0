Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE6D4572FA2
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 09:51:22 +0200 (CEST)
Received: from localhost ([::1]:47850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBX9T-0007Ye-TW
	for lists+qemu-devel@lfdr.de; Wed, 13 Jul 2022 03:51:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1oBX72-00063p-CI
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 03:48:48 -0400
Received: from mga11.intel.com ([192.55.52.93]:36264)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1oBX6z-0001m0-1T
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 03:48:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657698525; x=1689234525;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=nUfcHt/iaf3oMSfMyzHxGwWsSmqpbvlJ2JFwYR1oe/M=;
 b=Dlk8uQwbPtKSwMrvRmBAJaxNseP47/ieMwYEOvaKl3weU3lb3SMzgalX
 uBNiOyZM3g4zmLkIulI6oINdwfnZuF9L6oBYSGmlTOcxh61Q8RtNup6st
 n08yvb+XhYQEUDupSJXckIy8iVZjHu2DtfEGCBmEvRqdkTEf5AjZ+M93V
 JTFp63pyT6jQ9SdNf52zWYA4D/M32fcXoIY66Md2zLfaaNTLktKlW8tbS
 3g2yqEj/8ynrNnMVF/JMLI8DqToJOKqXI9NSu12wvZXdsKSakdMZXncKi
 fXHL6MhzhBX8qFa5gYGqXLPTAgTyY4UKjLTDxzblvwVJZGRuHICdpknVM g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10406"; a="282693326"
X-IronPort-AV: E=Sophos;i="5.92,267,1650956400"; d="scan'208";a="282693326"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2022 00:48:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,267,1650956400"; d="scan'208";a="685067167"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.192.101])
 by FMSMGA003.fm.intel.com with ESMTP; 13 Jul 2022 00:48:16 -0700
Date: Wed, 13 Jul 2022 15:44:58 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: "Gupta, Pankaj" <pankaj.gupta@amd.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
 linux-doc@vger.kernel.org, qemu-devel@nongnu.org,
 linux-kselftest@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Sean Christopherson <seanjc@google.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
 Hugh Dickins <hughd@google.com>, Jeff Layton <jlayton@kernel.org>,
 "J . Bruce Fields" <bfields@fieldses.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Shuah Khan <shuah@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Steven Price <steven.price@arm.com>,
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve <vannapurve@google.com>,
 Yu Zhang <yu.c.zhang@linux.intel.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 luto@kernel.org, jun.nakajima@intel.com, dave.hansen@intel.com,
 ak@linux.intel.com, david@redhat.com, aarcange@redhat.com,
 ddutile@redhat.com, dhildenb@redhat.com,
 Quentin Perret <qperret@google.com>,
 Michael Roth <michael.roth@amd.com>, mhocko@suse.com,
 Muchun Song <songmuchun@bytedance.com>
Subject: Re: [PATCH v7 04/14] mm/shmem: Support memfile_notifier
Message-ID: <20220713074458.GB2831541@chaop.bj.intel.com>
References: <20220706082016.2603916-1-chao.p.peng@linux.intel.com>
 <20220706082016.2603916-5-chao.p.peng@linux.intel.com>
 <c4112b84-9359-d4c8-1852-0057c074607c@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c4112b84-9359-d4c8-1852-0057c074607c@amd.com>
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
Reply-To: Chao Peng <chao.p.peng@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 12, 2022 at 08:02:34PM +0200, Gupta, Pankaj wrote:
> On 7/6/2022 10:20 AM, Chao Peng wrote:
> > From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
> > 
> > Implement shmem as a memfile_notifier backing store. Essentially it
> > interacts with the memfile_notifier feature flags for userspace
> > access/page migration/page reclaiming and implements the necessary
> > memfile_backing_store callbacks.
> > 
> > Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> > Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
> > ---
> >   include/linux/shmem_fs.h |   2 +
> >   mm/shmem.c               | 109 ++++++++++++++++++++++++++++++++++++++-
> >   2 files changed, 110 insertions(+), 1 deletion(-)
...

> > +#ifdef CONFIG_MIGRATION
> > +static int shmem_migrate_page(struct address_space *mapping,
> > +			      struct page *newpage, struct page *page,
> > +			      enum migrate_mode mode)
> > +{
> > +	struct inode *inode = mapping->host;
> > +	struct shmem_inode_info *info = SHMEM_I(inode);
> > +
> > +	if (info->memfile_node.flags & MEMFILE_F_UNMOVABLE)
> > +		return -EOPNOTSUPP;
> > +	return migrate_page(mapping, newpage, page, mode);
> 
> Wondering how well page migrate would work for private pages
> on shmem memfd based backend?

From high level:
  - KVM unset MEMFILE_F_UNMOVABLE bit to indicate it capable of
    migrating a page.
  - Introduce new 'migrate' callback(s) to memfile_notifier_ops for KVM
    to register.
  - The callback is hooked to migrate_page() here.
  - Once page migration requested, shmem calls into the 'migrate'
    callback(s) to perform additional steps for encrypted memory (For
    TDX we will call TDH.MEM.PAGE.RELOCATE).

Chao
> 
> > +}
> > +#endif
> > +
> >   const struct address_space_operations shmem_aops = {
> >   	.writepage	= shmem_writepage,
> >   	.dirty_folio	= noop_dirty_folio,
> > @@ -3814,7 +3872,7 @@ const struct address_space_operations shmem_aops = {
> >   	.write_end	= shmem_write_end,
> >   #endif
> >   #ifdef CONFIG_MIGRATION
> > -	.migratepage	= migrate_page,
> > +	.migratepage	= shmem_migrate_page,
> >   #endif
> >   	.error_remove_page = shmem_error_remove_page,
> >   };
> > @@ -3931,6 +3989,51 @@ static struct file_system_type shmem_fs_type = {
> >   	.fs_flags	= FS_USERNS_MOUNT,
> >   };
 

