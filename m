Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE9E4C11F8
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 12:54:13 +0100 (CET)
Received: from localhost ([::1]:33708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMqDk-0003WI-Sn
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 06:54:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1nMq9o-0001dC-B0
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 06:50:08 -0500
Received: from mga18.intel.com ([134.134.136.126]:14029)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1nMq9l-0005bB-RJ
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 06:50:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645617005; x=1677153005;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=h059MTs1GCpelszK6wn0Y7AYm7QzLTn2WIrQltgpYTY=;
 b=BnHDNAopdwjw8rPFK8eDcsZYK/ZU2IadBjx3bmuG1i/uJx+/yKMbB8cM
 /QiJHMCZZpEmXOLVlScOzwr3/Lxmd4i+6q0H1i/+g9n7Lp3FPnHZmrshg
 rdT5K1+uEK+5YqqNpnlFXUpIZrq4V3n284Gj8pKBl5B+1KR+v7N7w2Tno
 5rTfXZrtcIA/7bc5P0Iujbz4T6h433GccZ72ww90KStb3toOzAJT3PU1l
 815kZVsjhbS2pS4rfg1xWh0+0YU8dLDNLdJ0N78NPFQEdZyhWvGoplQ6g
 Zy+l/SdP3yDNyDr+G2GRb5RlgHdd9CW/CEu1xfGC21ULpGbEWUrD0aw/J Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10266"; a="235454057"
X-IronPort-AV: E=Sophos;i="5.88,390,1635231600"; d="scan'208";a="235454057"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2022 03:50:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,390,1635231600"; d="scan'208";a="532650031"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.192.101])
 by orsmga007.jf.intel.com with ESMTP; 23 Feb 2022 03:49:55 -0800
Date: Wed, 23 Feb 2022 19:49:35 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: Andy Lutomirski <luto@kernel.org>
Subject: Re: [PATCH v4 01/12] mm/shmem: Introduce F_SEAL_INACCESSIBLE
Message-ID: <20220223114935.GA53733@chaop.bj.intel.com>
References: <20220118132121.31388-1-chao.p.peng@linux.intel.com>
 <20220118132121.31388-2-chao.p.peng@linux.intel.com>
 <619547ad-de96-1be9-036b-a7b4e99b09a6@kernel.org>
 <20220217130631.GB32679@chaop.bj.intel.com>
 <2ca78dcb-61d9-4c9d-baa9-955b6f4298bb@www.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2ca78dcb-61d9-4c9d-baa9-955b6f4298bb@www.fastmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Reply-To: Chao Peng <chao.p.peng@linux.intel.com>
Cc: Wanpeng Li <wanpengli@tencent.com>, kvm list <kvm@vger.kernel.org>,
 David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org,
 "J . Bruce Fields" <bfields@fieldses.org>, linux-mm@kvack.org,
 "H. Peter Anvin" <hpa@zytor.com>, Andi Kleen <ak@linux.intel.com>,
 Jonathan Corbet <corbet@lwn.net>, Joerg Roedel <joro@8bytes.org>,
 the arch/x86 maintainers <x86@kernel.org>, Hugh Dickins <hughd@google.com>,
 Steven Price <steven.price@arm.com>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "Nakajima, Jun" <jun.nakajima@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Jim Mattson <jmattson@google.com>, Dave Hansen <dave.hansen@intel.com>,
 Linux API <linux-api@vger.kernel.org>, Jeff Layton <jlayton@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Yu Zhang <yu.c.zhang@linux.intel.com>, Sean Christopherson <seanjc@google.com>,
 linux-fsdevel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 17, 2022 at 11:09:35AM -0800, Andy Lutomirski wrote:
> On Thu, Feb 17, 2022, at 5:06 AM, Chao Peng wrote:
> > On Fri, Feb 11, 2022 at 03:33:35PM -0800, Andy Lutomirski wrote:
> >> On 1/18/22 05:21, Chao Peng wrote:
> >> > From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
> >> > 
> >> > Introduce a new seal F_SEAL_INACCESSIBLE indicating the content of
> >> > the file is inaccessible from userspace through ordinary MMU access
> >> > (e.g., read/write/mmap). However, the file content can be accessed
> >> > via a different mechanism (e.g. KVM MMU) indirectly.
> >> > 
> >> > It provides semantics required for KVM guest private memory support
> >> > that a file descriptor with this seal set is going to be used as the
> >> > source of guest memory in confidential computing environments such
> >> > as Intel TDX/AMD SEV but may not be accessible from host userspace.
> >> > 
> >> > At this time only shmem implements this seal.
> >> > 
> >> 
> >> I don't dislike this *that* much, but I do dislike this. F_SEAL_INACCESSIBLE
> >> essentially transmutes a memfd into a different type of object.  While this
> >> can apparently be done successfully and without races (as in this code),
> >> it's at least awkward.  I think that either creating a special inaccessible
> >> memfd should be a single operation that create the correct type of object or
> >> there should be a clear justification for why it's a two-step process.
> >
> > Now one justification maybe from Stever's comment to patch-00: for ARM
> > usage it can be used with creating a normal memfd, (partially)populate
> > it with initial guest memory content (e.g. firmware), and then
> > F_SEAL_INACCESSIBLE it just before the first time lunch of the guest in
> > KVM (definitely the current code needs to be changed to support that).
> 
> Except we don't allow F_SEAL_INACCESSIBLE on a non-empty file, right?  So this won't work.

Hmm, right, if we set F_SEAL_INACCESSIBLE on a non-empty file, we will 
need to make sure access to existing mmap-ed area should be prevented,
but that is hard.

> 
> In any case, the whole confidential VM initialization story is a bit buddy.  From the earlier emails, it sounds like ARM expects the host to fill in guest memory and measure it.  From my recollection of Intel's scheme (which may well be wrong, and I could easily be confusing it with SGX), TDX instead measures what is essentially a transcript of the series of operations that initializes the VM.  These are fundamentally not the same thing even if they accomplish the same end goal.  For TDX, we unavoidably need an operation (ioctl or similar) that initializes things according to the VM's instructions, and ARM ought to be able to use roughly the same mechanism.

Yes, TDX requires a ioctl. Steven may comment on the ARM part.

Chao
> 
> Also, if we ever get fancy and teach the page allocator about memory with reduced directmap permissions, it may well be more efficient for userspace to shove data into a memfd via ioctl than it is to mmap it and write the data.




