Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6381C4BA161
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 14:37:38 +0100 (CET)
Received: from localhost ([::1]:35664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKgyT-0001ip-DN
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 08:37:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1nKgV8-0001FY-0r
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 08:07:14 -0500
Received: from mga12.intel.com ([192.55.52.136]:4036)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1nKgV4-0004Hl-Oq
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 08:07:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645103230; x=1676639230;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=xA8H4mCuPL0+Y5H2RRjONOFAaibouE9qYQsummWmUDo=;
 b=ZY/mPN9sbI2+5OgDP5AY4E/SNtBftUJteEuJuiwbf+uwKW7MP32Ls1aw
 3epg5sL5hHkE5hGkZMh3xzTibJB/XpdUFP2rXtsDbmOZCPBRcJ19Q/zWD
 bmSy2nQN/IhjW6rmWvBsG6ONeXn4hKy5O9rIIKrN6AUldb6oD6IiGpONW
 Mxa2i4eJBM1TqXW8gFu0E35fNzAHeNizqyCasuk9VasfN6GlqUsowIiYG
 HPMoT0xQg/qZ/mbs8/w5+9GMdlttZcu6GLAkTS9e0FR5L3z+SWSuC9VXW
 t05pdgtNB6sQqhInDLv7nuQ85wBJ6KbZHJp1P7gTeCWVpVhHbIptep2lT A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10260"; a="230830599"
X-IronPort-AV: E=Sophos;i="5.88,375,1635231600"; d="scan'208";a="230830599"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 05:07:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,375,1635231600"; d="scan'208";a="704790168"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.192.101])
 by orsmga005.jf.intel.com with ESMTP; 17 Feb 2022 05:06:52 -0800
Date: Thu, 17 Feb 2022 21:06:31 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: Andy Lutomirski <luto@kernel.org>
Subject: Re: [PATCH v4 01/12] mm/shmem: Introduce F_SEAL_INACCESSIBLE
Message-ID: <20220217130631.GB32679@chaop.bj.intel.com>
References: <20220118132121.31388-1-chao.p.peng@linux.intel.com>
 <20220118132121.31388-2-chao.p.peng@linux.intel.com>
 <619547ad-de96-1be9-036b-a7b4e99b09a6@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <619547ad-de96-1be9-036b-a7b4e99b09a6@kernel.org>
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
Cc: Wanpeng Li <wanpengli@tencent.com>, kvm@vger.kernel.org, david@redhat.com,
 qemu-devel@nongnu.org, "J . Bruce Fields" <bfields@fieldses.org>,
 linux-mm@kvack.org, "H . Peter Anvin" <hpa@zytor.com>, ak@linux.intel.com,
 Jonathan Corbet <corbet@lwn.net>, Joerg Roedel <joro@8bytes.org>,
 x86@kernel.org, Hugh Dickins <hughd@google.com>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 jun.nakajima@intel.com, Thomas Gleixner <tglx@linutronix.de>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Jim Mattson <jmattson@google.com>,
 dave.hansen@intel.com, Linux API <linux-api@vger.kernel.org>,
 Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
 Yu Zhang <yu.c.zhang@linux.intel.com>, Sean Christopherson <seanjc@google.com>,
 linux-fsdevel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Feb 11, 2022 at 03:33:35PM -0800, Andy Lutomirski wrote:
> On 1/18/22 05:21, Chao Peng wrote:
> > From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
> > 
> > Introduce a new seal F_SEAL_INACCESSIBLE indicating the content of
> > the file is inaccessible from userspace through ordinary MMU access
> > (e.g., read/write/mmap). However, the file content can be accessed
> > via a different mechanism (e.g. KVM MMU) indirectly.
> > 
> > It provides semantics required for KVM guest private memory support
> > that a file descriptor with this seal set is going to be used as the
> > source of guest memory in confidential computing environments such
> > as Intel TDX/AMD SEV but may not be accessible from host userspace.
> > 
> > At this time only shmem implements this seal.
> > 
> 
> I don't dislike this *that* much, but I do dislike this. F_SEAL_INACCESSIBLE
> essentially transmutes a memfd into a different type of object.  While this
> can apparently be done successfully and without races (as in this code),
> it's at least awkward.  I think that either creating a special inaccessible
> memfd should be a single operation that create the correct type of object or
> there should be a clear justification for why it's a two-step process.

Now one justification maybe from Stever's comment to patch-00: for ARM
usage it can be used with creating a normal memfd, (partially)populate
it with initial guest memory content (e.g. firmware), and then
F_SEAL_INACCESSIBLE it just before the first time lunch of the guest in
KVM (definitely the current code needs to be changed to support that).

Thanks,
Chao
> 
> (Imagine if the way to create an eventfd would be to call timerfd_create()
> and then do a special fcntl to turn it into an eventfd but only if it's not
> currently armed.  This would be weird.)

