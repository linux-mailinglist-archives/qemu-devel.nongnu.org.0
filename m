Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1201759B32D
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Aug 2022 12:50:16 +0200 (CEST)
Received: from localhost ([::1]:46338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oPiWz-0000zo-47
	for lists+qemu-devel@lfdr.de; Sun, 21 Aug 2022 06:50:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <willy@infradead.org>)
 id 1oPiBl-0004km-Fz
 for qemu-devel@nongnu.org; Sun, 21 Aug 2022 06:28:20 -0400
Received: from casper.infradead.org ([2001:8b0:10b:1236::1]:50470)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <willy@infradead.org>)
 id 1oPiBj-0004Lk-1M
 for qemu-devel@nongnu.org; Sun, 21 Aug 2022 06:28:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=ezqnpfSoqTQDMJ+hJHVpOcv6CdCxoRGL+MI+YKi2ajc=; b=oGft0gECLBoMj2UBuNjBRRw7oU
 +dq00PAmbDXUBvlm8/tj+3wvQ6+u1mI4tCmpI7ekjaZJY5bZRNO9OebH9SJpV1ysh/OWtfztRfWPW
 oh7BrM3UcOp9ibf9eSMPU5DoNPWCirAlzoF7UBdHCRQtmm6dE/aZytFO5kBG+bAYbqLdyYZzrVtt/
 iuZP3zYaHC4+P7CXpDkHhx26k0MpnTHE/dEowsrIT+sGbKv23kjGfdNLUtoruLSmY1Y3DtZhd/9Hl
 3LYOd+8SlRhwWalnWFB/NWtwuYs86Tc9tyA9RmJoFdeb0dwyoEDgnWuoUSo1B+PY04MuuTWMM54Av
 EsSC0QFw==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1oPiBE-00D7rG-Sc; Sun, 21 Aug 2022 10:27:44 +0000
Date: Sun, 21 Aug 2022 11:27:44 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Hugh Dickins <hughd@google.com>
Cc: "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Chao Peng <chao.p.peng@linux.intel.com>, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
 linux-doc@vger.kernel.org, qemu-devel@nongnu.org,
 linux-kselftest@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Sean Christopherson <seanjc@google.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
 Jeff Layton <jlayton@kernel.org>,
 "J . Bruce Fields" <bfields@fieldses.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Shuah Khan <shuah@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Steven Price <steven.price@arm.com>,
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve <vannapurve@google.com>,
 Yu Zhang <yu.c.zhang@linux.intel.com>, luto@kernel.org,
 jun.nakajima@intel.com, dave.hansen@intel.com, ak@linux.intel.com,
 david@redhat.com, aarcange@redhat.com, ddutile@redhat.com,
 dhildenb@redhat.com, Quentin Perret <qperret@google.com>,
 Michael Roth <michael.roth@amd.com>, mhocko@suse.com,
 Muchun Song <songmuchun@bytedance.com>,
 "Gupta, Pankaj" <pankaj.gupta@amd.com>
Subject: Re: [PATCH v7 00/14] KVM: mm: fd-based approach for supporting KVM
 guest private memory
Message-ID: <YwIIoFJrKPBXaRDW@casper.infradead.org>
References: <20220706082016.2603916-1-chao.p.peng@linux.intel.com>
 <ff5c5b97-acdf-9745-ebe5-c6609dd6322e@google.com>
 <20220818132421.6xmjqduempmxnnu2@box>
 <c6ccbb96-5849-2e2f-3b49-4ea711af525d@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c6ccbb96-5849-2e2f-3b49-4ea711af525d@google.com>
Received-SPF: none client-ip=2001:8b0:10b:1236::1;
 envelope-from=willy@infradead.org; helo=casper.infradead.org
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Aug 18, 2022 at 08:00:41PM -0700, Hugh Dickins wrote:
> tmpfs and hugetlbfs and page cache are designed around sharing memory:
> TDX is designed around absolutely not sharing memory; and the further
> uses which Sean foresees appear not to need it as page cache either.
> 
> Except perhaps for page migration reasons.  It's somewhat incidental,  
> but of course page migration knows how to migrate page cache, so
> masquerading as page cache will give a short cut to page migration,
> when page migration becomes at all possible.

I haven't read the patch series, and I'm not taking a position one way
or the other on whether this is better implemented as a shmem addition
or a shim that asks shmem for memory.  Page migration can be done for
driver memory by using PageMovable.  I just rewrote how it works, so
the details are top of my mind at the moment if anyone wants something
explained.  Commit 68f2736a8583 is the key one to look at.

