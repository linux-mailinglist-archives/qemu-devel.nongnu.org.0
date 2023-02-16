Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFFB1698B98
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 06:16:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSWbM-0001Em-Lo; Thu, 16 Feb 2023 00:14:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rppt@kernel.org>) id 1pSWbK-0001EO-Eo
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 00:14:34 -0500
Received: from sin.source.kernel.org ([145.40.73.55])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rppt@kernel.org>) id 1pSWbH-000275-U8
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 00:14:34 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id C462DCE25F0;
 Thu, 16 Feb 2023 05:14:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57DFEC433EF;
 Thu, 16 Feb 2023 05:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1676524457;
 bh=5bN2qNXzQ4ZA0g4le+lak/ncOAC6JWfVkeV3mS7J638=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=S6DhiGdHj1JDcPoZ1SfQW0UbLyKedojDvkeLmMsMmBwPwm5Yt9ALPyAEdUcNs/Kri
 y0wdQjtRgesQPv1yH4KbX2jBYemiOzTpuPf+dczvYxTVGZ2quVV8mTHQhPE8aLG4e7
 DXI8KPzfDbQEhul6FRH1xmCTTBptlv18inIYrE3lZPKsxHrObglGNVUJjYWLJw+yRh
 qLoEV/M0+FXsR2Yyl4A/8ONxeFBM4nRHoCK+SPySEBCED0DLIe2fRJWz1w55/Uvg/l
 XxPsCan76eLvTZglTKRcCOa4i7hQJI9KrgiS2Iu63uqvrH8MGX/DwoTfVEw+ty44Xp
 JVI04vumpZNTw==
Date: Thu, 16 Feb 2023 07:13:53 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Chao Peng <chao.p.peng@linux.intel.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-api@vger.kernel.org, linux-doc@vger.kernel.org,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Sean Christopherson <seanjc@google.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Arnd Bergmann <arnd@arndb.de>, Naoya Horiguchi <naoya.horiguchi@nec.com>,
 Miaohe Lin <linmiaohe@huawei.com>, x86@kernel.org,
 "H . Peter Anvin" <hpa@zytor.com>, Hugh Dickins <hughd@google.com>,
 Jeff Layton <jlayton@kernel.org>,
 "J . Bruce Fields" <bfields@fieldses.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Shuah Khan <shuah@kernel.org>, Steven Price <steven.price@arm.com>,
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve <vannapurve@google.com>,
 Yu Zhang <yu.c.zhang@linux.intel.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 luto@kernel.org, jun.nakajima@intel.com, dave.hansen@intel.com,
 ak@linux.intel.com, david@redhat.com, aarcange@redhat.com,
 ddutile@redhat.com, dhildenb@redhat.com,
 Quentin Perret <qperret@google.com>, tabba@google.com,
 Michael Roth <michael.roth@amd.com>, mhocko@suse.com, wei.w.wang@intel.com
Subject: Re: [PATCH v10 0/9] KVM: mm: fd-based approach for supporting KVM
Message-ID: <Y+27kRxJoXlMcbtH@kernel.org>
References: <20221202061347.1070246-1-chao.p.peng@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221202061347.1070246-1-chao.p.peng@linux.intel.com>
Received-SPF: pass client-ip=145.40.73.55; envelope-from=rppt@kernel.org;
 helo=sin.source.kernel.org
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi,

On Fri, Dec 02, 2022 at 02:13:38PM +0800, Chao Peng wrote:
> This patch series implements KVM guest private memory for confidential
> computing scenarios like Intel TDX[1]. If a TDX host accesses
> TDX-protected guest memory, machine check can happen which can further
> crash the running host system, this is terrible for multi-tenant
> configurations. The host accesses include those from KVM userspace like
> QEMU. This series addresses KVM userspace induced crash by introducing
> new mm and KVM interfaces so KVM userspace can still manage guest memory
> via a fd-based approach, but it can never access the guest memory
> content.

Sorry for jumping late.

Unless I'm missing something, hibernation will also cause an machine check
when there is TDX-protected memory in the system. When the hibernation
creates memory snapshot it essentially walks all physical pages and saves
their contents, so for TDX memory this will trigger machine check, right?
 
>  Documentation/virt/kvm/api.rst         | 125 ++++++-
>  arch/x86/entry/syscalls/syscall_32.tbl |   1 +
>  arch/x86/entry/syscalls/syscall_64.tbl |   1 +
>  arch/x86/include/asm/kvm_host.h        |   9 +
>  arch/x86/kvm/Kconfig                   |   3 +
>  arch/x86/kvm/mmu/mmu.c                 | 205 ++++++++++-
>  arch/x86/kvm/mmu/mmu_internal.h        |  14 +-
>  arch/x86/kvm/mmu/mmutrace.h            |   1 +
>  arch/x86/kvm/mmu/tdp_mmu.c             |   2 +-
>  arch/x86/kvm/x86.c                     |  17 +-
>  include/linux/kvm_host.h               | 103 +++++-
>  include/linux/restrictedmem.h          |  71 ++++
>  include/linux/syscalls.h               |   1 +
>  include/uapi/asm-generic/unistd.h      |   5 +-
>  include/uapi/linux/kvm.h               |  53 +++
>  include/uapi/linux/magic.h             |   1 +
>  kernel/sys_ni.c                        |   3 +
>  mm/Kconfig                             |   4 +
>  mm/Makefile                            |   1 +
>  mm/memory-failure.c                    |   3 +
>  mm/restrictedmem.c                     | 318 +++++++++++++++++
>  virt/kvm/Kconfig                       |   6 +
>  virt/kvm/kvm_main.c                    | 469 +++++++++++++++++++++----
>  23 files changed, 1323 insertions(+), 93 deletions(-)
>  create mode 100644 include/linux/restrictedmem.h
>  create mode 100644 mm/restrictedmem.c

-- 
Sincerely yours,
Mike.

