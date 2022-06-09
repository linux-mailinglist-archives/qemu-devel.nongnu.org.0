Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7FE3545628
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 23:08:12 +0200 (CEST)
Received: from localhost ([::1]:35896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzPNz-00042G-Dg
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 17:08:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1nzOmN-0003ty-7Y
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 16:29:19 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:46705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1nzOmH-0008Tl-TR
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 16:29:17 -0400
Received: by mail-pl1-x633.google.com with SMTP id d13so5474726plh.13
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 13:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=C4/yJYyLya7rE6Jieokr56CujDpfPfuLcGNiEECS+QU=;
 b=CjppovKB2YLi+/umkUgs7TGbUGFHqjbhz+/vuQpURnYcTn7Y/XOYbzw0Ykj8khDf1D
 lU6118PzbLcDnYEohwwuQpWRqLnFFor88HMkhxJnTWzVFPYmlDCWI4t25w0FcOY9LsJ3
 Xx+fRvY97K5Q4b9fyl2wIJsNDu8BFxuzsJC2MBkEM8rOua9Xl2avo9S7S1w8ygcb6WQp
 l07wjz7O+ipoSddpByuvOEx8LLG0at/WFa44rE+IaodvVFqdep6gbL1AbyDvvOmSNBeS
 GcNHdTH1imkTwWGYIM5B+u73KBCppBXzzkigAH/N4DrtNRxqLpENGyWxu6onk+j5isHM
 5lXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=C4/yJYyLya7rE6Jieokr56CujDpfPfuLcGNiEECS+QU=;
 b=QX7Jy1xjOEnk4slb3eIh8dy97wu9W2wjlTZHYqNA+xomhYTyEMiszUTnm2VVQP/1rL
 g4+66eqR2QFyJeBESGD6mYkg09vmLKJYOPUdBBfp9ZgL/S+KywLj4YQy3dOplrDuyzXJ
 dbWyggS4GjuJ4hG6FK2O/afKO/LmunBNbiMrs+pQL2HU/mblvSaSQs6YLxCTQtS1SRo6
 cTMksjqidmkU7lbFhhS/Ti5yghD70Xg1hL89NG7rw4FvLkAW1sQP48wJKTogHkiSq0ru
 YkB00ab8gJV3lne58dX917u0B/CT1GYT7MaK3qc8/P/N7y9TqjJ3RcjO6AioYNW8ukUJ
 ZtFw==
X-Gm-Message-State: AOAM5326FzXhDRf6LFRm7YmKPEpmApBjm4pGWUJgwN7m47ug0Ja4C6m4
 itXUzC7DqI5g/oHXV2gWUq6hTfdFks/iUg==
X-Google-Smtp-Source: ABdhPJx0nBU6Y+TUh04OO6/IROXMWJ7hUc76Ud455mDwfSNlb8nAgIObkwH4NgXB0NSx9cPem36m4g==
X-Received: by 2002:a17:90a:b284:b0:1e3:826b:d11d with SMTP id
 c4-20020a17090ab28400b001e3826bd11dmr5147277pjr.79.1654806551448; 
 Thu, 09 Jun 2022 13:29:11 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157]) by smtp.gmail.com with ESMTPSA id
 e3-20020a17090301c300b0016511314b94sm17748369plh.159.2022.06.09.13.29.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 13:29:10 -0700 (PDT)
Date: Thu, 9 Jun 2022 20:29:06 +0000
From: Sean Christopherson <seanjc@google.com>
To: Vishal Annapurve <vannapurve@google.com>
Cc: Chao Peng <chao.p.peng@linux.intel.com>, Marc Orr <marcorr@google.com>,
 kvm list <kvm@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 linux-api@vger.kernel.org, linux-doc@vger.kernel.org,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 x86 <x86@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>,
 Hugh Dickins <hughd@google.com>, Jeff Layton <jlayton@kernel.org>,
 "J . Bruce Fields" <bfields@fieldses.org>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>,
 Steven Price <steven.price@arm.com>,
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Vlastimil Babka <vbabka@suse.cz>, Yu Zhang <yu.c.zhang@linux.intel.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Andy Lutomirski <luto@kernel.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Dave Hansen <dave.hansen@intel.com>, Andi Kleen <ak@linux.intel.com>,
 David Hildenbrand <david@redhat.com>, aarcange@redhat.com,
 ddutile@redhat.com, dhildenb@redhat.com,
 Quentin Perret <qperret@google.com>,
 Michael Roth <michael.roth@amd.com>, mhocko@suse.com
Subject: Re: [PATCH v6 0/8] KVM: mm: fd-based approach for supporting KVM
 guest private memory
Message-ID: <YqJYEheLiGI4KqXF@google.com>
References: <20220519153713.819591-1-chao.p.peng@linux.intel.com>
 <CAGtprH_83CEC0U-cBR2FzHsxbwbGn0QJ87WFNOEet8sineOcbQ@mail.gmail.com>
 <20220607065749.GA1513445@chaop.bj.intel.com>
 <CAA03e5H_vOQS-qdZgacnmqP5T5jJLnEfm44yfRzJQ2KVu0Br+Q@mail.gmail.com>
 <20220608021820.GA1548172@chaop.bj.intel.com>
 <CAGtprH8xyf07jMN7ubTC__BvDj+z41uVGRiCJ7Rc5cv3KWg03w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGtprH8xyf07jMN7ubTC__BvDj+z41uVGRiCJ7Rc5cv3KWg03w@mail.gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=seanjc@google.com; helo=mail-pl1-x633.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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

On Wed, Jun 08, 2022, Vishal Annapurve wrote:
> ...
> > With this patch series, it's actually even not possible for userspace VMM
> > to allocate private page by a direct write, it's basically unmapped from
> > there. If it really wants to, it should so something special, by intention,
> > that's basically the conversion, which we should allow.
> >
> 
> A VM can pass GPA backed by private pages to userspace VMM and when
> Userspace VMM accesses the backing hva there will be pages allocated
> to back the shared fd causing 2 sets of pages backing the same guest
> memory range.
> 
> > Thanks for bringing this up. But in my mind I still think userspace VMM
> > can do and it's its responsibility to guarantee that, if that is hard
> > required.

That was my initial reaction too, but there are unfortunate side effects to punting
this to userspace. 

> By design, userspace VMM is the decision-maker for page
> > conversion and has all the necessary information to know which page is
> > shared/private. It also has the necessary knobs to allocate/free the
> > physical pages for guest memory. Definitely, we should make userspace
> > VMM more robust.
> 
> Making Userspace VMM more robust to avoid double allocation can get
> complex, it will have to keep track of all in-use (by Userspace VMM)
> shared fd memory to disallow conversion from shared to private and
> will have to ensure that all guest supplied addresses belong to shared
> GPA ranges.

IMO, the complexity argument isn't sufficient justfication for introducing new
kernel functionality.  If multiple processes are accessing guest memory then there
already needs to be some amount of coordination, i.e. it can't be _that_ complex.

My concern with forcing userspace to fully handle unmapping shared memory is that
it may lead to additional performance overhead and/or noisy neighbor issues, even
if all guests are well-behaved.

Unnmapping arbitrary ranges will fragment the virtual address space and consume
more memory for all the result VMAs.  The extra memory consumption isn't that big
of a deal, and it will be self-healing to some extent as VMAs will get merged when
the holes are filled back in (if the guest converts back to shared), but it's still
less than desirable.

More concerning is having to take mmap_lock for write for every conversion, which
is very problematic for configurations where a single userspace process maps memory
belong to multiple VMs.  Unmapping and remapping on every conversion will create a
bottleneck, especially if a VM has sub-optimal behavior and is converting pages at
a high rate.

One argument is that userspace can simply rely on cgroups to detect misbehaving
guests, but (a) those types of OOMs will be a nightmare to debug and (b) an OOM
kill from the host is typically considered a _host_ issue and will be treated as
a missed SLO.

An idea for handling this in the kernel without too much complexity would be to
add F_SEAL_FAULT_ALLOCATIONS (terrible name) that would prevent page faults from
allocating pages, i.e. holes can only be filled by an explicit fallocate().  Minor
faults, e.g. due to NUMA balancing stupidity, and major faults due to swap would
still work, but writes to previously unreserved/unallocated memory would get a
SIGSEGV on something it has mapped.  That would allow the userspace VMM to prevent
unintentional allocations without having to coordinate unmapping/remapping across
multiple processes.

