Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F341E4FE185
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Apr 2022 15:06:21 +0200 (CEST)
Received: from localhost ([::1]:44252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1neGDs-0008AJ-Qc
	for lists+qemu-devel@lfdr.de; Tue, 12 Apr 2022 09:06:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1neG8p-0003fJ-R2
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 09:01:08 -0400
Received: from mga09.intel.com ([134.134.136.24]:57103)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1neG8i-00033U-Uw
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 09:01:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649768461; x=1681304461;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=lExz5hm5xcTzyOEY6YHWDS3MJSoSHVq4Qg2JWxxoCRg=;
 b=V/eu6esiqwciHje46v+NzO5whjGsF09q+lrf51+NLqN1McC389aRsbU2
 1h3Ot4aeKBLCPv82AxG0USQZp8nhmsbAfriAIubG/ZUPi/4n99UBxXixf
 zkamqz9IPNbZtTG5IcveIy9EdCCgnuTZIZnEInt7XESRHSygGVqjxa/GZ
 GKf6sIgOMQq51FjXkIgl8LBkSkEab/n7QsXORt8BQsXiJY9tO1fQEhUUd
 kVPXYBl3Z+OFXa2kl6rbauYV3vdekmyr49JXzdY/zcRKit1KruTDcQAiT
 9DWjsOWnvErqsa5YirxcdkdPXrUJEEdxJhEujrJfDbey/uVCegKocqDRA g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10314"; a="261805858"
X-IronPort-AV: E=Sophos;i="5.90,253,1643702400"; d="scan'208";a="261805858"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2022 06:00:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,253,1643702400"; d="scan'208";a="699826034"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.192.101])
 by fmsmga001.fm.intel.com with ESMTP; 12 Apr 2022 06:00:51 -0700
Date: Tue, 12 Apr 2022 21:00:40 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: Vishal Annapurve <vannapurve@google.com>
Subject: Re: [PATCH v5 00/13] KVM: mm: fd-based approach for supporting KVM
 guest private memory
Message-ID: <20220412130040.GD8013@chaop.bj.intel.com>
References: <20220310140911.50924-1-chao.p.peng@linux.intel.com>
 <CALCETrWk1Y47JQC=V028A7Tmc9776Oo4AjgwqRtd9K=XDh6=TA@mail.gmail.com>
 <CAGtprH9DGyxSKSwVhc0Td3x-M4-C6j=+d3DEtkxOty+PPB0V_g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGtprH9DGyxSKSwVhc0Td3x-M4-C6j=+d3DEtkxOty+PPB0V_g@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Received-SPF: none client-ip=134.134.136.24;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga09.intel.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Wanpeng Li <wanpengli@tencent.com>, Jun Nakajima <jun.nakajima@intel.com>,
 kvm@vger.kernel.org, david@redhat.com, qemu-devel@nongnu.org,
 "J . Bruce Fields" <bfields@fieldses.org>, linux-mm@kvack.org,
 "H . Peter Anvin" <hpa@zytor.com>, ak@linux.intel.com,
 Jonathan Corbet <corbet@lwn.net>, Joerg Roedel <joro@8bytes.org>,
 x86@kernel.org, Hugh Dickins <hughd@google.com>,
 Steven Price <steven.price@arm.com>, Ingo Molnar <mingo@redhat.com>,
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>,
 Jim Mattson <jmattson@google.com>, dave.hansen@intel.com,
 linux-api@vger.kernel.org, Jeff Layton <jlayton@kernel.org>,
 linux-kernel@vger.kernel.org, Yu Zhang <yu.c.zhang@linux.intel.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Sean Christopherson <seanjc@google.com>, linux-fsdevel@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Mike Rapoport <rppt@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 08, 2022 at 11:35:05AM -1000, Vishal Annapurve wrote:
> On Mon, Mar 28, 2022 at 10:17 AM Andy Lutomirski <luto@kernel.org> wrote:
> >
> > On Thu, Mar 10, 2022 at 6:09 AM Chao Peng <chao.p.peng@linux.intel.com> wrote:
> > >
> > > This is the v5 of this series which tries to implement the fd-based KVM
> > > guest private memory. The patches are based on latest kvm/queue branch
> > > commit:
> > >
> > >   d5089416b7fb KVM: x86: Introduce KVM_CAP_DISABLE_QUIRKS2
> >
> > Can this series be run and a VM booted without TDX?  A feature like
> > that might help push it forward.
> >
> > --Andy
> 
> I have posted a RFC series with selftests to exercise the UPM feature
> with normal non-confidential VMs via
> https://lore.kernel.org/kvm/20220408210545.3915712-1-vannapurve@google.com/

Thanks Vishal, this sounds very helpful, it already started to find
bugs.

Chao
> 
> -- Vishal

