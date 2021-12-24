Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E1247EB67
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Dec 2021 05:29:03 +0100 (CET)
Received: from localhost ([::1]:34928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0cCU-0004QA-Hc
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 23:29:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1n0cAI-0003et-J4
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 23:26:46 -0500
Received: from mga12.intel.com ([192.55.52.136]:35671)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1n0cAC-0003aG-9R
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 23:26:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640320000; x=1671856000;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=XVICpTcj5dklnFFnMTQIYshv6lyZmXqWiuOZMigDHD4=;
 b=mNX99f7CvvLWvwDhHFXkSyyOWKxJ+lRHUpvW6Yxcc99C95pyjbP8BWY/
 eNnOgh2ijbBv409qxv6yngT8LneT1VyHHw3Ao/9k9GfyR25Wc23P50NLd
 aLXfRUDce1H5Oe7NJjVCco2lCdz2oK+4UhjzYHY8GSttHPN1JYcT7QE3R
 f1g5dE53Wm52yuN7al6OurrggMwKg9oXg88fY1y7LyETMvRwm8hgfF37w
 ZqK5a8i9trCkgkP+HwnRaumbnhwdAg3akVcQDp8Kbn30CxengyV6FoBBl
 geNh8UmnNaULP5Rer07AOTyTXKUYEiKUt8MEpbGWMEp2LPyx5+HSpgdBE A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10207"; a="220936553"
X-IronPort-AV: E=Sophos;i="5.88,231,1635231600"; d="scan'208";a="220936553"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2021 20:26:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,231,1635231600"; d="scan'208";a="664767253"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.192.101])
 by fmsmga001.fm.intel.com with ESMTP; 23 Dec 2021 20:26:31 -0800
Date: Fri, 24 Dec 2021 12:25:54 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v3 kvm/queue 06/16] KVM: Implement fd-based memory using
 MEMFD_OPS interfaces
Message-ID: <20211224042554.GD44042@chaop.bj.intel.com>
References: <20211223123011.41044-1-chao.p.peng@linux.intel.com>
 <20211223123011.41044-7-chao.p.peng@linux.intel.com>
 <YcTBLpVlETdI8JHi@google.com>
 <e3fe04eb-1a01-bea4-f1ea-cb9ee98ee216@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e3fe04eb-1a01-bea4-f1ea-cb9ee98ee216@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Received-SPF: none client-ip=192.55.52.136;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga12.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

On Fri, Dec 24, 2021 at 12:09:47AM +0100, Paolo Bonzini wrote:
> On 12/23/21 19:34, Sean Christopherson wrote:
> > >   	select HAVE_KVM_PM_NOTIFIER if PM
> > > +	select MEMFD_OPS
> > MEMFD_OPS is a weird Kconfig name given that it's not just memfd() that can
> > implement the ops.
> > 
> 
> Or, it's kvm that implements them to talk to memfd?

The only thing is VFIO may also use the same set of callbacks, as
discussed in the v2. But I think that's fine.

Chao
> 
> Paolo

