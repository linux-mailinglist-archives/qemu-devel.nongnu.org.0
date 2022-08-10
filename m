Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9A758E9A9
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 11:32:21 +0200 (CEST)
Received: from localhost ([::1]:40156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLi4a-0007l1-IB
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 05:32:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1oLi00-0005kK-SF
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 05:27:41 -0400
Received: from mga03.intel.com ([134.134.136.65]:64255)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1oLhzv-0003It-0r
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 05:27:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660123651; x=1691659651;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=tUwaauJkG9H9jpzDjix3eFFhcAHzm8fbdGUPBBoncrI=;
 b=SpHAhAnr5Bi17xAUPmjqaGhtlXLAW4XqaWFeJHG43FJafujwh4OdN/XP
 qJCa2lcp1re2S616RxTEE0ysTPiZs/uur8CnWhianJXa8Oasn7Rq2kDWw
 qXeQo966jDVOrMEyF/tFhewnqFum+YfPUfH+B6EKSS9BCEMl9kwd4a2S0
 lai4jpVC1LvshPEcVGMHWiiXJWsErfI8pJnA0Wgg7gpBlfWsB9MjmxmAp
 a47mQKsuf0RkqRS9givgKqHa6mE9aKoCzQWnuo8YYhwoTf57pp6i1n7XG
 OJu5BzIZaEe9E6O2OtOizsZz0D+JPR7NULWfEgH8g+TJcqHtOGisqvqTj Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10434"; a="292292096"
X-IronPort-AV: E=Sophos;i="5.93,226,1654585200"; d="scan'208";a="292292096"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2022 02:27:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,226,1654585200"; d="scan'208";a="664820289"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.193.75])
 by fmsmga008.fm.intel.com with ESMTP; 10 Aug 2022 02:27:17 -0700
Date: Wed, 10 Aug 2022 17:22:32 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: David Hildenbrand <david@redhat.com>
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
 ak@linux.intel.com, aarcange@redhat.com, ddutile@redhat.com,
 dhildenb@redhat.com, Quentin Perret <qperret@google.com>,
 Michael Roth <michael.roth@amd.com>, mhocko@suse.com,
 Muchun Song <songmuchun@bytedance.com>
Subject: Re: [PATCH v7 03/14] mm: Introduce memfile_notifier
Message-ID: <20220810092232.GC862421@chaop.bj.intel.com>
References: <20220706082016.2603916-1-chao.p.peng@linux.intel.com>
 <20220706082016.2603916-4-chao.p.peng@linux.intel.com>
 <13394075-fca0-6f2b-92a2-f1291fcec9a3@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <13394075-fca0-6f2b-92a2-f1291fcec9a3@redhat.com>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Aug 05, 2022 at 03:22:58PM +0200, David Hildenbrand wrote:
> On 06.07.22 10:20, Chao Peng wrote:
> > This patch introduces memfile_notifier facility so existing memory file
> > subsystems (e.g. tmpfs/hugetlbfs) can provide memory pages to allow a
> > third kernel component to make use of memory bookmarked in the memory
> > file and gets notified when the pages in the memory file become
> > invalidated.
> 
> Stupid question, but why is this called "memfile_notifier" and not
> "memfd_notifier". We're only dealing with memfd's after all ... which
> are anonymous files essentially. Or what am I missing? Are there any
> other plans for fs than plain memfd support that I am not aware of?

There were some discussions on this in v3.
  https://lkml.org/lkml/2021/12/28/484
Sean commented it's OK to abstract it from memfd but he also wants the
kAPI (name) should not bind to memfd to make room for future non-memfd
usages.

> 
> > 
> > It will be used for KVM to use a file descriptor as the guest memory
> > backing store and KVM will use this memfile_notifier interface to
> > interact with memory file subsystems. In the future there might be other
> > consumers (e.g. VFIO with encrypted device memory).
> > 
> > It consists below components:
> >  - memfile_backing_store: Each supported memory file subsystem can be
> >    implemented as a memory backing store which bookmarks memory and
> >    provides callbacks for other kernel systems (memfile_notifier
> >    consumers) to interact with.
> >  - memfile_notifier: memfile_notifier consumers defines callbacks and
> >    associate them to a file using memfile_register_notifier().
> >  - memfile_node: A memfile_node is associated with the file (inode) from
> >    the backing store and includes feature flags and a list of registered
> >    memfile_notifier for notifying.
> > 
> > In KVM usages, userspace is in charge of guest memory lifecycle: it first
> > allocates pages in memory backing store and then passes the fd to KVM and
> > lets KVM register memory slot to memory backing store via
> > memfile_register_notifier.
> 
> Can we add documentation/description in any form how the different
> functions exposed in linux/memfile_notifier.h are supposed to be used?

Yeah, code comments can be added.

> 
> Staring at memfile_node_set_flags() and memfile_notifier_invalidate()
> it's not immediately clear to me who's supposed to call that and under
> which conditions.

I will also amend the commit message.

Chao
> 
> -- 
> Thanks,
> 
> David / dhildenb

