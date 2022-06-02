Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3075753B6B0
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 12:13:28 +0200 (CEST)
Received: from localhost ([::1]:47448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwhpW-0000Ly-FO
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 06:13:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1nwhnR-0007Wl-6J
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 06:11:17 -0400
Received: from mga14.intel.com ([192.55.52.115]:25251)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1nwhnO-00070G-Ma
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 06:11:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654164674; x=1685700674;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=da86tUUULUVat8HuHmdIwGDy5StYU/aEj+aL1ESVKiM=;
 b=CsqCMxNtk3ss3cdDELKoNfk+Qj1/8yQHPg/CtTEuSCiMfMbsabu2wZJc
 WhOvYs/tmEVurMzXCFxvUm7utp+zJPy9TvojrOvI0FTXyP7/tmTA5apk5
 zgOig3qQfV3XJ+9AKktBZJb037xN0Q397zMjtOXqyZhdxKgj2ZJ1imaCb
 kScJxsMQ8jlOI2Sr6qs7XQoJ9hgB5/uj1wstnqJoR1u/NbZ8yf2j4IfOY
 DGkLmDzvRdY7GQ2SalS4vwNiVCivZMjjul85b4TXxTz+PGNBST+NcRhqD
 KjLQDqejYw3SS25LVDJFOkZfmbLcJ0OsGwFw0sWlGbhEHSveXwhjJpUTu g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10365"; a="275977337"
X-IronPort-AV: E=Sophos;i="5.91,270,1647327600"; d="scan'208";a="275977337"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2022 03:11:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,270,1647327600"; d="scan'208";a="721237238"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.192.101])
 by fmsmga001.fm.intel.com with ESMTP; 02 Jun 2022 03:10:58 -0700
Date: Thu, 2 Jun 2022 18:07:33 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: "Gupta, Pankaj" <pankaj.gupta@amd.com>
Cc: Vishal Annapurve <vannapurve@google.com>, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
 linux-doc@vger.kernel.org, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Sean Christopherson <seanjc@google.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
 Hugh Dickins <hughd@google.com>, Jeff Layton <jlayton@kernel.org>,
 "J . Bruce Fields" <bfields@fieldses.org>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>,
 Steven Price <steven.price@arm.com>,
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Vlastimil Babka <vbabka@suse.cz>, Yu Zhang <yu.c.zhang@linux.intel.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Andy Lutomirski <luto@kernel.org>,
 Jun Nakajima <jun.nakajima@intel.com>, dave.hansen@intel.com,
 ak@linux.intel.com, david@redhat.com, aarcange@redhat.com,
 ddutile@redhat.com, dhildenb@redhat.com,
 Quentin Perret <qperret@google.com>,
 Michael Roth <michael.roth@amd.com>, mhocko@suse.com
Subject: Re: [PATCH v6 3/8] mm/memfd: Introduce MFD_INACCESSIBLE flag
Message-ID: <20220602100733.GA1296997@chaop.bj.intel.com>
References: <20220519153713.819591-1-chao.p.peng@linux.intel.com>
 <20220519153713.819591-4-chao.p.peng@linux.intel.com>
 <CAGtprH8EMsPMMoOEzjRu0SMVKT0RqmkLk=n+6uXkBA6-wiRtUA@mail.gmail.com>
 <20220601101747.GA1255243@chaop.bj.intel.com>
 <1f1b17e8-a16d-c029-88e0-01f522cc077a@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1f1b17e8-a16d-c029-88e0-01f522cc077a@amd.com>
Received-SPF: none client-ip=192.55.52.115;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga14.intel.com
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

On Wed, Jun 01, 2022 at 02:11:42PM +0200, Gupta, Pankaj wrote:
> 
> > > > Introduce a new memfd_create() flag indicating the content of the
> > > > created memfd is inaccessible from userspace through ordinary MMU
> > > > access (e.g., read/write/mmap). However, the file content can be
> > > > accessed via a different mechanism (e.g. KVM MMU) indirectly.
> > > > 
> > > 
> > > SEV, TDX, pkvm and software-only VMs seem to have usecases to set up
> > > initial guest boot memory with the needed blobs.
> > > TDX already supports a KVM IOCTL to transfer contents to private
> > > memory using the TDX module but rest of the implementations will need
> > > to invent
> > > a way to do this.
> > 
> > There are some discussions in https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flkml.org%2Flkml%2F2022%2F5%2F9%2F1292&amp;data=05%7C01%7Cpankaj.gupta%40amd.com%7Cb81ef334e2dd44c6143308da43b87d17%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637896756895977587%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=oQbM2Hj7GlhJTwnTM%2FPnwsfJlmTL7JR9ULBysAqm6V8%3D&amp;reserved=0
> > already. I somehow agree with Sean. TDX is using an dedicated ioctl to
> > copy guest boot memory to private fd so the rest can do that similarly.
> > The concern is the performance (extra memcpy) but it's trivial since the
> > initial guest payload is usually optimized in size.
> > 
> > > 
> > > Is there a plan to support a common implementation for either allowing
> > > initial write access from userspace to private fd or adding a KVM
> > > IOCTL to transfer contents to such a file,
> > > as part of this series through future revisions?
> > 
> > Indeed, adding pre-boot private memory populating on current design
> > isn't impossible, but there are still some opens, e.g. how to expose
> > private fd to userspace for access, pKVM and CC usages may have
> > different requirements. Before that's well-studied I would tend to not
> > add that and instead use an ioctl to copy. Whether we need a generic
> > ioctl or feature-specific ioctl, I don't have strong opinion here.
> > Current TDX uses a feature-specific ioctl so it's not covered in this
> > series.
> 
> Common function or ioctl to populate preboot private memory actually makes
> sense.
> 
> Sorry, did not follow much of TDX code yet, Is it possible to filter out
> the current TDX specific ioctl to common function so that it can be used by
> other technologies?

TDX code is here:
https://patchwork.kernel.org/project/kvm/patch/70ed041fd47c1f7571aa259450b3f9244edda48d.1651774250.git.isaku.yamahata@intel.com/

AFAICS It might be possible to filter that out to a common function. But
would like to hear from Paolo/Sean for their opinion.

Chao
> 
> Thanks,
> Pankaj

