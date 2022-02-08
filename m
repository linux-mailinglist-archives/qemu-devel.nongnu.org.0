Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B564AE0FE
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 19:39:15 +0100 (CET)
Received: from localhost ([::1]:50846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHVOJ-0001Ak-V5
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 13:39:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rppt@kernel.org>) id 1nHV8U-0005rE-Du
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 13:22:42 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:58994)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rppt@kernel.org>) id 1nHV8R-0005wV-P0
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 13:22:42 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D879BB81A2C;
 Tue,  8 Feb 2022 18:22:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93A23C004E1;
 Tue,  8 Feb 2022 18:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644344548;
 bh=pbwoMFvbx4OzTTkyGFIGfJ12xlO6+bE4SbLdm1gW5I0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DNuiUrZiyZwnx2Zetr26GwhCvtD03/IVpLo3FpvdvheOmgnRQ5SYpGaYm+Tt7uSCB
 DNMr3SgUwAL7VlAzw2uF3oEX3Wq5S10qEgoTyDTnGB+be+NTkuRT5/OLFBEIvq2DvT
 fSEpMjSFRMvpJRMracavaaMy5fOna6tJw+zCiKVkNqwsV+eoYkh7G6+ClTVrFzkadr
 PFkVf1dyiiRN4XTIRu9GSzf5v2WddgxQ4JepSha8CpVS8dm0saZc9wIZnG4sYTbUuA
 9XieRr9l5HYMJp/kMD/0xmCjHB96Q35e5J6cbaJxVLDo+YXYIhKqEEooynG8+zxmzx
 ua2MSdS8fgBxw==
Date: Tue, 8 Feb 2022 20:22:05 +0200
From: Mike Rapoport <rppt@kernel.org>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v4 02/12] mm/memfd: Introduce MFD_INACCESSIBLE flag
Message-ID: <YgK0zZjq+KNoeNYM@kernel.org>
References: <20220118132121.31388-1-chao.p.peng@linux.intel.com>
 <20220118132121.31388-3-chao.p.peng@linux.intel.com>
 <25166513-3074-f3b9-12cc-420ba74f153e@suse.cz>
 <07aae6e7-4042-1c5c-a482-6ad3a34a3b07@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <07aae6e7-4042-1c5c-a482-6ad3a34a3b07@redhat.com>
Received-SPF: pass client-ip=145.40.68.75; envelope-from=rppt@kernel.org;
 helo=ams.source.kernel.org
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Wanpeng Li <wanpengli@tencent.com>, jun.nakajima@intel.com,
 kvm@vger.kernel.org, qemu-devel@nongnu.org,
 "J . Bruce Fields" <bfields@fieldses.org>, linux-mm@kvack.org,
 "H . Peter Anvin" <hpa@zytor.com>, Chao Peng <chao.p.peng@linux.intel.com>,
 ak@linux.intel.com, Jonathan Corbet <corbet@lwn.net>,
 Joerg Roedel <joro@8bytes.org>, x86@kernel.org,
 Hugh Dickins <hughd@google.com>, Mike Rapoport <rppt@linux.ibm.com>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 luto@kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>,
 Jim Mattson <jmattson@google.com>, dave.hansen@intel.com,
 Sean Christopherson <seanjc@google.com>, Jeff Layton <jlayton@kernel.org>,
 linux-kernel@vger.kernel.org, Yu Zhang <yu.c.zhang@linux.intel.com>,
 linux-fsdevel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 08, 2022 at 09:49:35AM +0100, David Hildenbrand wrote:
> On 07.02.22 19:51, Vlastimil Babka wrote:
> > On 1/18/22 14:21, Chao Peng wrote:
> >> Introduce a new memfd_create() flag indicating the content of the
> >> created memfd is inaccessible from userspace. It does this by force
> >> setting F_SEAL_INACCESSIBLE seal when the file is created. It also set
> >> F_SEAL_SEAL to prevent future sealing, which means, it can not coexist
> >> with MFD_ALLOW_SEALING.
> >>
> >> The pages backed by such memfd will be used as guest private memory in
> >> confidential computing environments such as Intel TDX/AMD SEV. Since
> >> page migration/swapping is not yet supported for such usages so these
> >> pages are currently marked as UNMOVABLE and UNEVICTABLE which makes
> >> them behave like long-term pinned pages.
> > 
> > Shouldn't the amount of such memory allocations be restricted? E.g. similar
> > to secretmem_mmap() doing mlock_future_check().

Heh, for me it was easy, I had the VMA :)
 
> I've raised this already in the past and Kirill wanted to look into it [1].
> 
> We'll most certainly need a way to limit/control the amount of
> unswappable + unmovable ("worse than mlock" memory) a user/process can
> consume via this mechanism.

I think the accounting can be handled in notify_fallocate() and
notify_invalidate_page().

> [1] https://lkml.kernel.org/r/20211122135933.arjxpl7wyskkwvwv@box.shutemov.name
>
> -- 
> Thanks,
> 
> David / dhildenb

-- 
Sincerely yours,
Mike.

