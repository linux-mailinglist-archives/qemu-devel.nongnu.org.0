Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D618A59F899
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 13:27:42 +0200 (CEST)
Received: from localhost ([::1]:46110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQoXt-0003bF-IX
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 07:27:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1oQna6-0005ix-R7
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 06:25:55 -0400
Received: from mga12.intel.com ([192.55.52.136]:2601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1oQna4-0000JO-HA
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 06:25:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661336752; x=1692872752;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=ov6LWOeGKE0o/d22MV9D8SJ+ovEHwDZEA5oKgTfWHCI=;
 b=LTwPgRQam6tS1IsD3dpUwr7fcu9fjmoRjI/qDOsQjxkmHPJ8tba19EFY
 x+Qwz6pyqF14d1xwY2uAf4oFkZFiN9nlNK1bYuOKog5kp8ZqXfJue1XD1
 hYbSuPOwJSrKyEI3VZ9FdBXzVq+MMtEAdlIKA+AsWGo0lixXfieFDyBj6
 JaHBu24NlHttmwxtkuv1C+/Ep+4htUCXlhJmRgUUqRDg1ZrEXSN98jC3G
 ft2MSeW+KxcuBscwmAK9y+uYtQ4GTB4b8xh21NSMDnb9p0cVhMb02kvQG
 TKsvGZ2oaUCaXWNVpgTHTjwOv6SXSm0XhhDip3SatxkFKAJmziI/rkmmq A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10448"; a="273680419"
X-IronPort-AV: E=Sophos;i="5.93,260,1654585200"; d="scan'208";a="273680419"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2022 03:25:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,260,1654585200"; d="scan'208";a="605986064"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.193.75])
 by orsmga007.jf.intel.com with ESMTP; 24 Aug 2022 03:25:39 -0700
Date: Wed, 24 Aug 2022 18:20:56 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: "Kirill A. Shutemov" <kirill@shutemov.name>,
 Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
 linux-doc@vger.kernel.org, qemu-devel@nongnu.org,
 linux-kselftest@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Sean Christopherson <seanjc@google.com>,
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
Subject: Re: [PATCH v7 01/14] mm: Add F_SEAL_AUTO_ALLOCATE seal to memfd
Message-ID: <20220824102056.GA1385482@chaop.bj.intel.com>
References: <20220706082016.2603916-1-chao.p.peng@linux.intel.com>
 <20220706082016.2603916-2-chao.p.peng@linux.intel.com>
 <f39c4f63-a511-4beb-b3a4-66589ddb5475@redhat.com>
 <472207cf-ff71-563b-7b66-0c7bea9ea8ad@redhat.com>
 <20220817234120.mw2j3cgshmuyo2vw@box.shutemov.name>
 <8f6f428b-85e6-a188-7f32-512b6aae0abf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8f6f428b-85e6-a188-7f32-512b6aae0abf@redhat.com>
Received-SPF: none client-ip=192.55.52.136;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga12.intel.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Aug 23, 2022 at 09:36:57AM +0200, David Hildenbrand wrote:
> On 18.08.22 01:41, Kirill A. Shutemov wrote:
> > On Fri, Aug 05, 2022 at 07:55:38PM +0200, Paolo Bonzini wrote:
> >> On 7/21/22 11:44, David Hildenbrand wrote:
> >>>
> >>> Also, I*think*  you can place pages via userfaultfd into shmem. Not
> >>> sure if that would count "auto alloc", but it would certainly bypass
> >>> fallocate().
> >>
> >> Yeah, userfaultfd_register would probably have to forbid this for
> >> F_SEAL_AUTO_ALLOCATE vmas.  Maybe the memfile_node can be reused for this,
> >> adding a new MEMFILE_F_NO_AUTO_ALLOCATE flags?  Then userfault_register
> >> would do something like memfile_node_get_flags(vma->vm_file) and check the
> >> result.
> > 
> > I donno, memory allocation with userfaultfd looks pretty intentional to
> > me. Why would F_SEAL_AUTO_ALLOCATE prevent it?
> > 
> 
> Can't we say the same about a write()?
> 
> > Maybe we would need it in the future for post-copy migration or something?
> > 
> > Or existing practises around userfaultfd touch memory randomly and
> > therefore incompatible with F_SEAL_AUTO_ALLOCATE intent?
> > 
> > Note, that userfaultfd is only relevant for shared memory as it requires
> > VMA which we don't have for MFD_INACCESSIBLE.
> 
> This feature (F_SEAL_AUTO_ALLOCATE) is independent of all the lovely
> encrypted VM stuff, so it doesn't matter how it relates to MFD_INACCESSIBLE.

Right, this patch is for normal user accssible fd. In KVM this flag is
expected to be set on the shared part of the memslot, while all other
patches in this series are for private part of the memslot.

Private memory doesn't have this need because it's totally inaccissible
from userspace so no chance for userspace to write to the fd and cause
allocation by accident. While for shared memory, malicious/buggy guest
OS may cause userspace to write to any range of the shared fd and cause
memory allocation, even that range should the private memory not the
shared memory be visible to guest OS.

Chao
> 
> -- 
> Thanks,
> 
> David / dhildenb
> 

