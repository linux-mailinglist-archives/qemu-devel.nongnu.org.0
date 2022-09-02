Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5011B5AAC7F
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Sep 2022 12:33:27 +0200 (CEST)
Received: from localhost ([::1]:54304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oU3zJ-00059M-Uq
	for lists+qemu-devel@lfdr.de; Fri, 02 Sep 2022 06:33:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1oU3qL-0007V3-QP
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 06:24:10 -0400
Received: from mga17.intel.com ([192.55.52.151]:15626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1oU3qE-0005bb-TH
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 06:24:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662114242; x=1693650242;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Hmx1025FThlE9cx1UE6O8SOkWc9A3kuNYU7VIFp8RZU=;
 b=KumCkS/Wt+bNEP4EyrOMMiWnU+uewbGLcFwsxIjCS11STSL4Lt+e4IqI
 xKafJShGNjbfLB/ZSlgZNX4A11upmuSRd1tZ7Ex0TwrFLflk90tqx71Xf
 qaJXia9mo3MP+3tubUrBZ6fi9BrDqYnz8u7L97I3XkYu1jwJTSixhDLEt
 gghiUqKwhMJWYYZGZKnf6janpBcAkeffAEGRbJXgHprsr3Tb7P0yKRu+Y
 KJqe8oJ3VymCGSWqCXE8xySaqJcRSg8uzGLNq8VtZgNY+2HwlHODt1eku
 Jc48LqbsgqlnaK6oUgqOA74zXF7zVota+nLUq3i6y2glZSUU/Ya5KB2/G g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10457"; a="276353511"
X-IronPort-AV: E=Sophos;i="5.93,283,1654585200"; d="scan'208";a="276353511"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2022 03:23:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,283,1654585200"; d="scan'208";a="608943940"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.193.75])
 by orsmga007.jf.intel.com with ESMTP; 02 Sep 2022 03:23:46 -0700
Date: Fri, 2 Sep 2022 18:19:05 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: Fuad Tabba <tabba@google.com>
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
 Muchun Song <songmuchun@bytedance.com>,
 Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH v7 00/14] KVM: mm: fd-based approach for supporting KVM
 guest private memory
Message-ID: <20220902101905.GA1712673@chaop.bj.intel.com>
References: <20220706082016.2603916-1-chao.p.peng@linux.intel.com>
 <CA+EHjTy6NF=BkCqK0vhXLdtKZMahp55JUMSfxN96-NT3YiMXYQ@mail.gmail.com>
 <20220829151756.GB1586678@chaop.bj.intel.com>
 <CA+EHjTxgKJ=9UP=DWtNsSgD2FtvBMYrUbcS=9h5j8Tmk57WqxQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=gb2312
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+EHjTxgKJ=9UP=DWtNsSgD2FtvBMYrUbcS=9h5j8Tmk57WqxQ@mail.gmail.com>
Received-SPF: none client-ip=192.55.52.151;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga17.intel.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

On Wed, Aug 31, 2022 at 10:12:12AM +0100, Fuad Tabba wrote:
> > > Moreover, something which was discussed here before [3], is the
> > > ability to share in-place. For pKVM/arm64, the conversion between
> > > shared and private involves only changes to the stage-2 page tables,
> > > which are controlled by the hypervisor. Android supports this in-place
> > > conversion already, and I think that the cost of copying for many
> > > use-cases that would involve large amounts of data would be big. We
> > > will measure the relative costs in due course, but in the meantime
> > > we¡¯re nervous about adopting a new user ABI which doesn¡¯t appear to
> > > cater for in-place conversion; having just the fd would simplify that
> > > somewhat
> >
> > I understand there is difficulty to achieve that with the current
> > private_fd + userspace_addr (they basically in two separate fds), but is
> > it possible for pKVM to extend this? Brainstorming for example, pKVM can
> > ignore userspace_addr and only use private_fd to cover both shared and
> > private memory, or pKVM introduce new KVM memslot flag?
> 
> It's not that there's anything blocking pKVM from doing that. It's
> that the disconnect of using a memory address for the shared memory,
> and a file descriptor for the private memory doesn't really make sense
> for pKVM. I see how it makes sense for TDX and the Intel-specific
> implementation. It just seems that this is baking in an
> implementation-specific aspect as a part of the KVM general api, and
> the worry is that this might have some unintended consequences in the
> future.

It's true this API originates from supporting TDX and probably other
similar confidential computing(CC) technologies. But if we ever get
chance to make it more common to cover more usages like pKVM, I would
also like to. The challenge on this point is pKVM diverges a lot from CC
usages, putting both shared and private memory in the same fd
complicates CC usages. If two things are different enough, I'm also
thinking implementation-specific may not be that bad.

Chao

