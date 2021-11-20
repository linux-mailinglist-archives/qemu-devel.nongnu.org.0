Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F79D457A71
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Nov 2021 02:25:10 +0100 (CET)
Received: from localhost ([::1]:55868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1moF7s-0000mh-QI
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 20:25:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1moF6C-0008A6-ER
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 20:23:24 -0500
Received: from [2607:f8b0:4864:20::635] (port=43787
 helo=mail-pl1-x635.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1moF6A-0008AV-Gy
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 20:23:24 -0500
Received: by mail-pl1-x635.google.com with SMTP id m24so9410413pls.10
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 17:23:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=/Xij941QtBI1Uy4eu8Bu4KYhGHxK/4BecrqjrKxNLxc=;
 b=GpoQ21DjhXv2BUYJlGx0hMtF15Q8bpsRbq0wJvD6yrNvx1DYqqtNexsuLz1NRYVJ7e
 NHFLzQYzZOyh+GJfAJnENBvIm+qSEHAVkgDfaCl/Zr3pl/+QESPUvhi1a2uPxB+ICwuy
 d5j4VltRnAABaR74WGpaFwAADwy0tlcySm0JDW/fekN3+r5XTQVTXr1Oeo7Jdu+sGAFN
 rv5qPR8lCfq27Bt1ONuGfxXO5QpeOfd39C4seaS4JUP7gy5aJprSPYN7u6PlhL8Ju2dl
 odxJsmR6NbgGQCOlLIJktpJf2jC+gWvVcaW+8w8uNLE8ah6nxpfEwfFkX5r9M/k9m+ys
 91CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/Xij941QtBI1Uy4eu8Bu4KYhGHxK/4BecrqjrKxNLxc=;
 b=cGhkGrDsVxWCqnmlquJWKiP7T0dA0j72gtBCjuI4NAadymtA7AYShexNF00sJpGuSN
 Ryb4/ePx9L7sveiIcuPErpRmeEQGahBPvd7IcA34M3LFywjvO16dwfTP5K4JkOsnxD2b
 c8zcOA3V/hZmN6IBn4dv8LURECmUZo4oCcZqgRQPKIERr84HK9R60Alm03gQwFW5mA7/
 ixeYiYPHbR+1FZ2R1EAVJpmHRWKQ81XBjnwNOG69C9hR+mQ0YLxOETl8fcyEwvydLdvh
 XdL3Hfyt++i4j2JFPHDhRRrosjtD1OP/F8uhHsjb1gGPlKdYEyUSfzPIa1oNfziQIj2A
 NCtg==
X-Gm-Message-State: AOAM532rlF72u6NS/FV5KNXpDmWBz6d86Mv7QBhhvLTAxopUAc+/zj02
 hoPFRuv8fS4A8Gc0NqmjWVxWiw==
X-Google-Smtp-Source: ABdhPJzlUE1Um8kito32w8cWRvgp+EMtWNpSCF44SWtHzwom4+CZVI8C0AgTahILZETsub8pzqpAog==
X-Received: by 2002:a17:90b:3ec4:: with SMTP id
 rm4mr5349860pjb.88.1637371400077; 
 Fri, 19 Nov 2021 17:23:20 -0800 (PST)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157])
 by smtp.gmail.com with ESMTPSA id k12sm635804pgi.23.2021.11.19.17.23.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 17:23:19 -0800 (PST)
Date: Sat, 20 Nov 2021 01:23:16 +0000
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
Message-ID: <YZhOBD6vlkBEyq8t@google.com>
References: <20211119134739.20218-1-chao.p.peng@linux.intel.com>
 <20211119134739.20218-2-chao.p.peng@linux.intel.com>
 <20211119151943.GH876299@ziepe.ca>
 <df11d753-6242-8f7c-cb04-c095f68b41fa@redhat.com>
 <YZf4aAlbyeWw8wUk@google.com> <20211119194746.GM876299@ziepe.ca>
 <YZgjc5x6FeBxOqbD@google.com> <20211119233312.GO876299@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211119233312.GO876299@ziepe.ca>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::635
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=seanjc@google.com; helo=mail-pl1-x635.google.com
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
> On Fri, Nov 19, 2021 at 10:21:39PM +0000, Sean Christopherson wrote:
> > On Fri, Nov 19, 2021, Jason Gunthorpe wrote:
> > > On Fri, Nov 19, 2021 at 07:18:00PM +0000, Sean Christopherson wrote:
> > > > No ideas for the kernel API, but that's also less concerning since
> > > > it's not set in stone.  I'm also not sure that dedicated APIs for
> > > > each high-ish level use case would be a bad thing, as the semantics
> > > > are unlikely to be different to some extent.  E.g. for the KVM use
> > > > case, there can be at most one guest associated with the fd, but
> > > > there can be any number of VFIO devices attached to the fd.
> > > 
> > > Even the kvm thing is not a hard restriction when you take away
> > > confidential compute.
> > > 
> > > Why can't we have multiple KVMs linked to the same FD if the memory
> > > isn't encrypted? Sure it isn't actually useful but it should work
> > > fine.
> > 
> > Hmm, true, but I want the KVM semantics to be 1:1 even if memory
> > isn't encrypted.
> 
> That is policy and it doesn't belong hardwired into the kernel.

Agreed.  I had a blurb typed up about that policy just being an "exclusive" flag
in the kernel API that KVM would set when creating a confidential VM, but deleted
it and forgot to restore it when I went down the tangent of removing userspace
from the TCB without an assist from hardware/firmware.

> Your explanation makes me think that the F_SEAL_XX isn't defined
> properly. It should be a userspace trap door to prevent any new
> external accesses, including establishing new kvms, iommu's, rdmas,
> mmaps, read/write, etc.

Hmm, the way I was thinking of it is that it the F_SEAL_XX itself would prevent
mapping/accessing it from userspace, and that any policy beyond that would be
done via kernel APIs and thus handled by whatever in-kernel agent can access the
memory.  E.g. in the confidential VM case, without support for trusted devices,
KVM would require that it be the sole owner of the file.

