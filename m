Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 486A753A27E
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jun 2022 12:23:44 +0200 (CEST)
Received: from localhost ([::1]:43518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwLVv-0001Ys-3z
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 06:23:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1nwLTy-00008l-Tc
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 06:21:43 -0400
Received: from mga04.intel.com ([192.55.52.120]:6850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1nwLTw-0008Dc-OG
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 06:21:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654078900; x=1685614900;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=MPDfwkz64kDPQGnp5LEYEWHtzrsbbGi1CtkgkpVVQ9g=;
 b=nKEbt1Be/vrGuOCO5QKHXla1cojrVpbOtrHcpX9um21OSVR9znaLnm4N
 N0gsHdT6HBgJQNaP0677iv5dDthDtuvzBlxaPJrjx3mnpgHDW1rrQCW2D
 8k6zHE/iHmAP7TUJwtlff2EkTwvZgGbnmS5VhmMwiAcCDMEMT06XIUl/C
 y+MyDV+FutSzjsv79VQGgOQnYcd1gQn30YJGC7E+0kFmnmEMXkixKQ5hN
 7RIuIpp1ZSInPB7xC9UKlyyIuCUA+ITafC1gEzgqz99fMCmssl16fjQEH
 URL4tqoNN69vAmolsO17s21yXdXXCW5TawX9Z6fmmFegLpdvtsM2G2pgG w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10364"; a="274343234"
X-IronPort-AV: E=Sophos;i="5.91,266,1647327600"; d="scan'208";a="274343234"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2022 03:21:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,266,1647327600"; d="scan'208";a="755837829"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.192.101])
 by orsmga005.jf.intel.com with ESMTP; 01 Jun 2022 03:21:12 -0700
Date: Wed, 1 Jun 2022 18:17:47 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: Vishal Annapurve <vannapurve@google.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
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
Message-ID: <20220601101747.GA1255243@chaop.bj.intel.com>
References: <20220519153713.819591-1-chao.p.peng@linux.intel.com>
 <20220519153713.819591-4-chao.p.peng@linux.intel.com>
 <CAGtprH8EMsPMMoOEzjRu0SMVKT0RqmkLk=n+6uXkBA6-wiRtUA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGtprH8EMsPMMoOEzjRu0SMVKT0RqmkLk=n+6uXkBA6-wiRtUA@mail.gmail.com>
Received-SPF: none client-ip=192.55.52.120;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga04.intel.com
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

On Tue, May 31, 2022 at 12:15:00PM -0700, Vishal Annapurve wrote:
> On Thu, May 19, 2022 at 8:41 AM Chao Peng <chao.p.peng@linux.intel.com> wrote:
> >
> > Introduce a new memfd_create() flag indicating the content of the
> > created memfd is inaccessible from userspace through ordinary MMU
> > access (e.g., read/write/mmap). However, the file content can be
> > accessed via a different mechanism (e.g. KVM MMU) indirectly.
> >
> 
> SEV, TDX, pkvm and software-only VMs seem to have usecases to set up
> initial guest boot memory with the needed blobs.
> TDX already supports a KVM IOCTL to transfer contents to private
> memory using the TDX module but rest of the implementations will need
> to invent
> a way to do this.

There are some discussions in https://lkml.org/lkml/2022/5/9/1292
already. I somehow agree with Sean. TDX is using an dedicated ioctl to
copy guest boot memory to private fd so the rest can do that similarly.
The concern is the performance (extra memcpy) but it's trivial since the
initial guest payload is usually optimized in size.

> 
> Is there a plan to support a common implementation for either allowing
> initial write access from userspace to private fd or adding a KVM
> IOCTL to transfer contents to such a file,
> as part of this series through future revisions?

Indeed, adding pre-boot private memory populating on current design
isn't impossible, but there are still some opens, e.g. how to expose
private fd to userspace for access, pKVM and CC usages may have
different requirements. Before that's well-studied I would tend to not
add that and instead use an ioctl to copy. Whether we need a generic
ioctl or feature-specific ioctl, I don't have strong opinion here.
Current TDX uses a feature-specific ioctl so it's not covered in this
series.

Chao
> 
> Regards,
> Vishal

