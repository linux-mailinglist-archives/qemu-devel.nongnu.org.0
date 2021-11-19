Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E5C4578CA
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 23:29:11 +0100 (CET)
Received: from localhost ([::1]:56906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1moCNa-0004W1-4b
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 17:29:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1moCMG-0003ow-LE
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 17:27:51 -0500
Received: from [2607:f8b0:4864:20::230] (port=36514
 helo=mail-oi1-x230.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1moCMF-0001Mn-2A
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 17:27:48 -0500
Received: by mail-oi1-x230.google.com with SMTP id t23so24431850oiw.3
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 14:27:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=BWddyG3YL6k7bG+TnBK28e//6M0bIbW4TSIkWYmJ/v8=;
 b=EuwLBJL7d8Z1+TfWgCR5KtCvEV67f5PIxvqG3aTGsd/eshhsU8erJhoGf0qFXRBYNK
 ojHHmODuu2mFpfgcCH9Mh7DUEoaZ86X30XwStlGJZNYWsNn9NL94sEru/vUg5Nbj4Ygk
 rg0O9yS0UoSLKIy+BYbkKCS7p6NG7AJKpFjEP2DFQyX8BBbyhzRWp+wRYVub/WiG1a4H
 EGDfKcdqN4CON4UFuLc4/wDhL1EAWBW4K279192TaFlRQ297QMSEKJ5/s8gtUr82qbLh
 G3wDAbAF+/UYwO1h3h+UwsxOj6qLscYU/yF0iX9FS4zA7l58NfcA9DyBK+/NK/quciN+
 kONA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=BWddyG3YL6k7bG+TnBK28e//6M0bIbW4TSIkWYmJ/v8=;
 b=If8lw2ENXiT9SPknA03W+DrvmqdQmjGT9Z4VKbaMJvdrFp8vKeqjUlxYCqJA5DZ1uw
 /v3Cce0CWJKXAfE3XxSb9DkWqiQHbAvn1a/i492mXuACV9SvO+a4kgvUZTMMXik06UkO
 msvwR7lnpQqTJBpGvkp+olyeLL4yndNx14zFUpLgFRss+CHVKl4RmtRIA2e1/DreYM+T
 IJS8LgaEFGR0wh8u+5YwhJgcGJZ4wrqM2ILfStSUdJu7ee47utrwZg2irm49YFYkEy76
 1f2+CPujNnX176VwTjxdim1oEpAmG8Qo2Kn3iCjQhOODP044aIAM/tEiZNmSykpprT1B
 LuBw==
X-Gm-Message-State: AOAM531o9ZrHaA/aYnMXWTMdmItK3oxON2I0KAl/+f0ZB9760kDOVGnx
 AVtR9dZPrUgGz1wQWD0n56ghk5DaXh7pdA==
X-Google-Smtp-Source: ABdhPJw5pCQ1lvi4R7CtbDaQGcOJnt0PSBvoK0mJGOtw9m+Psi5Ckwf4h+0YLOW3oeLbqYaNToVYnQ==
X-Received: by 2002:a17:90b:1c81:: with SMTP id
 oo1mr3963147pjb.171.1637360503250; 
 Fri, 19 Nov 2021 14:21:43 -0800 (PST)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157])
 by smtp.gmail.com with ESMTPSA id w17sm601647pfu.58.2021.11.19.14.21.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 14:21:42 -0800 (PST)
Date: Fri, 19 Nov 2021 22:21:39 +0000
From: Sean Christopherson <seanjc@google.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: David Hildenbrand <david@redhat.com>,
 Chao Peng <chao.p.peng@linux.intel.com>, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
 Hugh Dickins <hughd@google.com>, Jeff Layton <jlayton@kernel.org>,
 "J . Bruce Fields" <bfields@fieldses.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Yu Zhang <yu.c.zhang@linux.intel.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 luto@kernel.org, john.ji@intel.com, susie.li@intel.com,
 jun.nakajima@intel.com, dave.hansen@intel.com, ak@linux.intel.com
Subject: Re: [RFC v2 PATCH 01/13] mm/shmem: Introduce F_SEAL_GUEST
Message-ID: <YZgjc5x6FeBxOqbD@google.com>
References: <20211119134739.20218-1-chao.p.peng@linux.intel.com>
 <20211119134739.20218-2-chao.p.peng@linux.intel.com>
 <20211119151943.GH876299@ziepe.ca>
 <df11d753-6242-8f7c-cb04-c095f68b41fa@redhat.com>
 <YZf4aAlbyeWw8wUk@google.com> <20211119194746.GM876299@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211119194746.GM876299@ziepe.ca>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::230
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::230;
 envelope-from=seanjc@google.com; helo=mail-oi1-x230.google.com
X-Spam_score_int: -167
X-Spam_score: -16.8
X-Spam_bar: ----------------
X-Spam_report: (-16.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, FSL_HELO_FAKE=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=no autolearn_force=no
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

On Fri, Nov 19, 2021, Jason Gunthorpe wrote:
> On Fri, Nov 19, 2021 at 07:18:00PM +0000, Sean Christopherson wrote:
> > No ideas for the kernel API, but that's also less concerning since
> > it's not set in stone.  I'm also not sure that dedicated APIs for
> > each high-ish level use case would be a bad thing, as the semantics
> > are unlikely to be different to some extent.  E.g. for the KVM use
> > case, there can be at most one guest associated with the fd, but
> > there can be any number of VFIO devices attached to the fd.
> 
> Even the kvm thing is not a hard restriction when you take away
> confidential compute.
> 
> Why can't we have multiple KVMs linked to the same FD if the memory
> isn't encrypted? Sure it isn't actually useful but it should work
> fine.

Hmm, true, but I want the KVM semantics to be 1:1 even if memory isn't encrypted.
Encrypting memory with a key that isn't available to the host is necessary to
(mostly) remove the host kernel from the guest's TCB, but it's not necessary to
remove host userspace from the TCB.  KVM absolutely can and should be able to do
that without relying on additional hardware/firmware.  Ignoring attestation and
whether or not the guest fully trusts the host kernel, there's value in preventing
a buggy or compromised userspace from attacking/corrupting the guest by remapping
guest memory or by mapping the same memory into multiple guests.

> Supporting only one thing is just a way to avoid having a linked list
> of clients to broadcast invalidations too - for instance by using a
> standard notifier block...

It's not just avoiding the linked list, there's a trust element as well.  E.g. in
the scenario where a device can access a confidential VM's encrypted private memory,
the guest is still the "owner" of the memory and needs to explicitly grant access to
a third party, e.g. the device or perhaps another VM.

That said, I'm certainly not dead set on having "guest" in the name, nor am I
opposed to implementing multi-consumer support from the get-go so we don't end
up with a mess later on.

> Also, how does dirty tracking work on this memory?

For KVM usage, KVM would provide the dirty bit info.  No idea how VFIO or other
use cases would work.

