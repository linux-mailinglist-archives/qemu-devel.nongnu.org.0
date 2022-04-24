Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 470AC50D06A
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Apr 2022 10:11:56 +0200 (CEST)
Received: from localhost ([::1]:47224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1niXLW-0003OU-RU
	for lists+qemu-devel@lfdr.de; Sun, 24 Apr 2022 04:11:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1niXHn-0002eg-Sz
 for qemu-devel@nongnu.org; Sun, 24 Apr 2022 04:08:04 -0400
Received: from mga17.intel.com ([192.55.52.151]:38067)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1niXHj-00007Q-Og
 for qemu-devel@nongnu.org; Sun, 24 Apr 2022 04:08:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650787679; x=1682323679;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=Jg69NAeROVkmxoEWc411QwNioJnF4WnIiJ0sHVRfPPE=;
 b=QdgEHG8suMiCZ5hl66ULpMrWrXwHyrcqCg3U00B8t0IsAC3QDMnBAW4/
 6jmCYlN2F5Jyv/qmb3TMdcLFgDyYHmrUukzJPhNPxB2hayAKehmJSqA+B
 CAckv01/8VtqjSIwdoejKlv1ybkhn5XsPuQcGJ82jYqTErOj/XhXpBVYo
 /16pgq/AwfW1Eg0zQQOUICvwCKEx7VTrU/lqIQdZL/z2mOJrTR+uADlER
 clE1AZ9Yfew2wN06yNEkmiIhYIoFmjC05W60oWD6AxJYnb9Y4TjqQrm00
 gPoL5khDCf59XZrkrXkG8QY81+ig2Sl80AeBxtdieDtRsLKzkG79qUlQY Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10326"; a="245584078"
X-IronPort-AV: E=Sophos;i="5.90,286,1643702400"; d="scan'208";a="245584078"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2022 01:07:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,286,1643702400"; d="scan'208";a="704146191"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.192.101])
 by fmsmga001.fm.intel.com with ESMTP; 24 Apr 2022 01:07:45 -0700
Date: Sun, 24 Apr 2022 16:07:37 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v5 00/13] KVM: mm: fd-based approach for supporting KVM
 guest private memory
Message-ID: <20220424080737.GA4207@chaop.bj.intel.com>
References: <80aad2f9-9612-4e87-a27a-755d3fa97c92@www.fastmail.com>
 <YkcTTY4YjQs5BRhE@google.com>
 <83fd55f8-cd42-4588-9bf6-199cbce70f33@www.fastmail.com>
 <YksIQYdG41v3KWkr@google.com> <Ykslo2eo2eRXrpFR@google.com>
 <eefc3c74-acca-419c-8947-726ce2458446@www.fastmail.com>
 <Ykwbqv90C7+8K+Ao@google.com> <YkyEaYiL0BrDYcZv@google.com>
 <20220422105612.GB61987@chaop.bj.intel.com>
 <ae7c9c7a-ecda-8c80-751f-f05dbc6489d7@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ae7c9c7a-ecda-8c80-751f-f05dbc6489d7@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Received-SPF: none client-ip=192.55.52.151;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga17.intel.com
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
Cc: Wanpeng Li <wanpengli@tencent.com>, "Nakajima,
 Jun" <jun.nakajima@intel.com>, kvm list <kvm@vger.kernel.org>,
 David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org,
 "J . Bruce Fields" <bfields@fieldses.org>, linux-mm@kvack.org,
 "H. Peter Anvin" <hpa@zytor.com>, Will Deacon <will@kernel.org>,
 Dave Hansen <dave.hansen@intel.com>, Andi Kleen <ak@linux.intel.com>,
 Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, the arch/x86 maintainers <x86@kernel.org>,
 Hugh Dickins <hughd@google.com>, Steven Price <steven.price@arm.com>,
 Ingo Molnar <mingo@redhat.com>,
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>,
 Jim Mattson <jmattson@google.com>, Quentin Perret <qperret@google.com>,
 Sean Christopherson <seanjc@google.com>, Jeff Layton <jlayton@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Yu Zhang <yu.c.zhang@linux.intel.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Linux API <linux-api@vger.kernel.org>, linux-fsdevel@vger.kernel.org,
 Vitaly Kuznetsov <vkuznets@redhat.com>,
 Vishal Annapurve <vannapurve@google.com>, Mike Rapoport <rppt@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 22, 2022 at 01:06:25PM +0200, Paolo Bonzini wrote:
> On 4/22/22 12:56, Chao Peng wrote:
> >          /* memfile notifier flags */
> >          #define MFN_F_USER_INACCESSIBLE   0x0001  /* memory allocated in the file is inaccessible from userspace (e.g. read/write/mmap) */
> >          #define MFN_F_UNMOVABLE           0x0002  /* memory allocated in the file is unmovable */
> >          #define MFN_F_UNRECLAIMABLE       0x0003  /* memory allocated in the file is unreclaimable (e.g. via kswapd or any other pathes) */
> 
> You probably mean BIT(0/1/2) here.

Right, it's BIT(n), Thanks.

Chao
> 
> Paolo
> 
> >      When memfile_notifier is being registered, memfile_register_notifier will
> >      need check these flags. E.g. for MFN_F_USER_INACCESSIBLE, it fails when
> >      previous mmap-ed mapping exists on the fd (I'm still unclear on how to do
> >      this). When multiple consumers are supported it also need check all
> >      registered consumers to see if any conflict (e.g. all consumers should have
> >      MFN_F_USER_INACCESSIBLE set). Only when the register succeeds, the fd is
> >      converted into a private fd, before that, the fd is just a normal (shared)
> >      one. During this conversion, the previous data is preserved so you can put
> >      some initial data in guest pages (whether the architecture allows this is
> >      architecture-specific and out of the scope of this patch).

