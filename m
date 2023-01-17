Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ACB866DE10
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 13:50:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHlPx-0006Db-Sw; Tue, 17 Jan 2023 07:50:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1pHlPv-0006AN-HG
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 07:50:19 -0500
Received: from mga11.intel.com ([192.55.52.93])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1pHlPt-0001uv-C0
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 07:50:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673959817; x=1705495817;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=ymQ/JZoVFvqCeW/jz/ISyD5XcjWYygq7yVQJBCOqdNM=;
 b=i4CF0otHZnPsGILI0+EGc0EMrEg+3dJ13aWmYnBBhZDyRBmS1sPvPZjL
 tNp05N67W/0LiE3bqcjwsXHHvWAcOgmSPgrSSpmVGE85ZMVNijG+UJtcN
 ASLnC5ONq+LQVCtpidHUu6y7/WM6ZAk8rLyoe7zRU+wfjbCirWU5l6cv9
 zTf9LgN9pFVRbeYtd71zHTZCiNDAp2xc4QDgj+bJn3VowZoKYnQkf6lDq
 P+14HiljjyRwjqkYUlnEERGJAmLh0LbJjIliVZfsjbo0qArGN+QYv3rtr
 BV+pPTmB0vxTFqqiEwpepsz3183dGAbA0zmQsIH0GKpvSiPwjLkrT1lTo Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="322374474"
X-IronPort-AV: E=Sophos;i="5.97,222,1669104000"; d="scan'208";a="322374474"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2023 04:50:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="691571557"
X-IronPort-AV: E=Sophos;i="5.97,222,1669104000"; d="scan'208";a="691571557"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.192.105])
 by orsmga001.jf.intel.com with ESMTP; 17 Jan 2023 04:50:02 -0800
Date: Tue, 17 Jan 2023 20:42:14 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: Jarkko Sakkinen <jarkko@kernel.org>, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-api@vger.kernel.org, linux-doc@vger.kernel.org,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Arnd Bergmann <arnd@arndb.de>, Naoya Horiguchi <naoya.horiguchi@nec.com>,
 Miaohe Lin <linmiaohe@huawei.com>, x86@kernel.org,
 "H . Peter Anvin" <hpa@zytor.com>, Hugh Dickins <hughd@google.com>,
 Jeff Layton <jlayton@kernel.org>,
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
 Quentin Perret <qperret@google.com>, tabba@google.com,
 Michael Roth <michael.roth@amd.com>, mhocko@suse.com, wei.w.wang@intel.com
Subject: Re: [PATCH v10 3/9] KVM: Extend the memslot to support fd-based
 private memory
Message-ID: <20230117124214.GB273037@chaop.bj.intel.com>
References: <20221202061347.1070246-1-chao.p.peng@linux.intel.com>
 <20221202061347.1070246-4-chao.p.peng@linux.intel.com>
 <Y7azFdnnGAdGPqmv@kernel.org>
 <20230106094000.GA2297836@chaop.bj.intel.com>
 <Y7xrtf9FCuYRYm1q@google.com>
 <20230110091432.GA2441264@chaop.bj.intel.com>
 <Y8HdMzlNFhFwlkGS@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y8HdMzlNFhFwlkGS@google.com>
Received-SPF: none client-ip=192.55.52.93;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga11.intel.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Jan 13, 2023 at 10:37:39PM +0000, Sean Christopherson wrote:
> On Tue, Jan 10, 2023, Chao Peng wrote:
> > On Mon, Jan 09, 2023 at 07:32:05PM +0000, Sean Christopherson wrote:
> > > On Fri, Jan 06, 2023, Chao Peng wrote:
> > > > On Thu, Jan 05, 2023 at 11:23:01AM +0000, Jarkko Sakkinen wrote:
> > > > > On Fri, Dec 02, 2022 at 02:13:41PM +0800, Chao Peng wrote:
> > > > > > To make future maintenance easy, internally use a binary compatible
> > > > > > alias struct kvm_user_mem_region to handle both the normal and the
> > > > > > '_ext' variants.
> > > > > 
> > > > > Feels bit hacky IMHO, and more like a completely new feature than
> > > > > an extension.
> > > > > 
> > > > > Why not just add a new ioctl? The commit message does not address
> > > > > the most essential design here.
> > > > 
> > > > Yes, people can always choose to add a new ioctl for this kind of change
> > > > and the balance point here is we want to also avoid 'too many ioctls' if
> > > > the functionalities are similar.  The '_ext' variant reuses all the
> > > > existing fields in the 'normal' variant and most importantly KVM
> > > > internally can reuse most of the code. I certainly can add some words in
> > > > the commit message to explain this design choice.
> > > 
> > > After seeing the userspace side of this, I agree with Jarkko; overloading
> > > KVM_SET_USER_MEMORY_REGION is a hack.  E.g. the size validation ends up being
> > > bogus, and userspace ends up abusing unions or implementing kvm_user_mem_region
> > > itself.
> > 
> > How is the size validation being bogus? I don't quite follow.
> 
> The ioctl() magic embeds the size of the payload (struct kvm_userspace_memory_region
> in this case) in the ioctl() number, and that information is visible to userspace
> via _IOCTL_SIZE().  Attempting to take a larger size can mess up sanity checks,
> e.g. KVM selftests get tripped up on this assert if KVM_SET_USER_MEMORY_REGION is
> passed an "extended" struct.
> 
> 	#define kvm_do_ioctl(fd, cmd, arg)						\
> 	({										\
> 		kvm_static_assert(!_IOC_SIZE(cmd) || sizeof(*arg) == _IOC_SIZE(cmd));	\
> 		ioctl(fd, cmd, arg);							\
> 	})

Got it. Thanks for the explanation.

Chao

