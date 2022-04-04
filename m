Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 973D94F17D8
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Apr 2022 17:02:38 +0200 (CEST)
Received: from localhost ([::1]:50494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbOE1-0002Dd-9g
	for lists+qemu-devel@lfdr.de; Mon, 04 Apr 2022 11:02:37 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qperret@google.com>)
 id 1nbOCw-0001Xl-1m
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 11:01:30 -0400
Received: from [2a00:1450:4864:20::52f] (port=42609
 helo=mail-ed1-x52f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <qperret@google.com>)
 id 1nbOCu-00023Q-0h
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 11:01:29 -0400
Received: by mail-ed1-x52f.google.com with SMTP id k2so4214121edj.9
 for <qemu-devel@nongnu.org>; Mon, 04 Apr 2022 08:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=i+zr5M68aloOJzDo2BfmM/AByzuuaBC8sU7HTQ424Ng=;
 b=P1lRqzuiE1i5AQgVXMAadjQxuZaNvOCmKCWVC7NoAosWtxg6O6uGhV1Fs5d9UThrZ1
 zNrRtXos2DqCwVW5VD+GKbPk1i42rM9aiUb9yc0F+sIK7PRpivdnddQGLO7YoWG7oZmw
 1x+zSzZfSodiP6Ntsi6OzrVuazT7b0XFcTsGnlR/cfyiEBMAvlIIi+by8VcRPuSXfbaq
 jvnXsXf/ijVmNTh2jlG406awsf8vRVsNEmYxTWAk77H/Jd0WSG835ZDrosun+PmVeAme
 A2bgEVeBBvzo/mxIlfxdxxqbrAD3YyIIefiix/stRu7ICwOCzguPsSvKzSzjE2W+YgM+
 7sjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=i+zr5M68aloOJzDo2BfmM/AByzuuaBC8sU7HTQ424Ng=;
 b=RKE6QIzPaMh0cOWcBf7/py6Lc7s3D2H55SdK75K6G8qxH/5pXo3rfnt6Xvw6mfla25
 O3CGpnyaGmiZZGfBrMEVMgYQ+4tPZGkB4dqI7w2Dq8zxTSUaQBJOfTlVnpHlMnUYk5mA
 w3562cXgkMzBM0TO5pZhQHlejLIbjkmxhBrmSZ+BzQiDq2R8KujJevxqfwDxlfzOqLax
 a2JxZd8dU5NmK1bbNfMs2RDosjO7MX0qHJ6czGIk+btYEZkBRtibNiKuyT3yun1brANk
 iF6gko9+N2kGJsuLe2iIWewii/mN2mgkaU5te9FfZFlmy5Swxn9YtMPUSRcJmlz8qb6R
 Ta7Q==
X-Gm-Message-State: AOAM531/BKhUjLpYeNWexk0BntomVq6q5SueeVi1cvvX90i6zFZLRi63
 DD4FVan8yAUjpjEnP7/A0mbKuw==
X-Google-Smtp-Source: ABdhPJwdjQe3XZ1e4GuiLZkjz2XSDy8kccxsDVifb45M/0aMy9MY01MBSRkMjNi/1qqoMOzRLXd9XA==
X-Received: by 2002:aa7:cdc9:0:b0:419:197e:14d9 with SMTP id
 h9-20020aa7cdc9000000b00419197e14d9mr498264edw.375.1649084485024; 
 Mon, 04 Apr 2022 08:01:25 -0700 (PDT)
Received: from google.com (30.171.91.34.bc.googleusercontent.com.
 [34.91.171.30]) by smtp.gmail.com with ESMTPSA id
 y14-20020a056402440e00b00416046b623csm5690519eda.2.2022.04.04.08.01.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Apr 2022 08:01:24 -0700 (PDT)
Date: Mon, 4 Apr 2022 15:01:21 +0000
From: Quentin Perret <qperret@google.com>
To: Andy Lutomirski <luto@kernel.org>
Cc: Sean Christopherson <seanjc@google.com>,
 Steven Price <steven.price@arm.com>,
 Chao Peng <chao.p.peng@linux.intel.com>, kvm list <kvm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 Linux API <linux-api@vger.kernel.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 the arch/x86 maintainers <x86@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Hugh Dickins <hughd@google.com>,
 Jeff Layton <jlayton@kernel.org>,
 "J . Bruce Fields" <bfields@fieldses.org>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>,
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve <vannapurve@google.com>,
 Yu Zhang <yu.c.zhang@linux.intel.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 "Nakajima, Jun" <jun.nakajima@intel.com>,
 Dave Hansen <dave.hansen@intel.com>, Andi Kleen <ak@linux.intel.com>,
 David Hildenbrand <david@redhat.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>
Subject: Re: [PATCH v5 00/13] KVM: mm: fd-based approach for supporting KVM
 guest private memory
Message-ID: <YksIQYdG41v3KWkr@google.com>
References: <YkHspg+YzOsbUaCf@google.com> <YkH32nx+YsJuUbmZ@google.com>
 <YkIFW25WgV2WIQHb@google.com> <YkM7eHCHEBe5NkNH@google.com>
 <88620519-029e-342b-0a85-ce2a20eaf41b@arm.com>
 <YkQzfjgTQaDd2E2T@google.com> <YkSaUQX89ZEojsQb@google.com>
 <80aad2f9-9612-4e87-a27a-755d3fa97c92@www.fastmail.com>
 <YkcTTY4YjQs5BRhE@google.com>
 <83fd55f8-cd42-4588-9bf6-199cbce70f33@www.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <83fd55f8-cd42-4588-9bf6-199cbce70f33@www.fastmail.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=qperret@google.com; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -161
X-Spam_score: -16.2
X-Spam_bar: ----------------
X-Spam_report: (-16.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01, USER_IN_DEF_DKIM_WL=-7.5,
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

On Friday 01 Apr 2022 at 12:56:50 (-0700), Andy Lutomirski wrote:
> On Fri, Apr 1, 2022, at 7:59 AM, Quentin Perret wrote:
> > On Thursday 31 Mar 2022 at 09:04:56 (-0700), Andy Lutomirski wrote:
> 
> 
> > To answer your original question about memory 'conversion', the key
> > thing is that the pKVM hypervisor controls the stage-2 page-tables for
> > everyone in the system, all guests as well as the host. As such, a page
> > 'conversion' is nothing more than a permission change in the relevant
> > page-tables.
> >
> 
> So I can see two different ways to approach this.
> 
> One is that you split the whole address space in half and, just like SEV and TDX, allocate one bit to indicate the shared/private status of a page.  This makes it work a lot like SEV and TDX.
>
> The other is to have shared and private pages be distinguished only by their hypercall history and the (protected) page tables.  This saves some address space and some page table allocations, but it opens some cans of worms too.  In particular, the guest and the hypervisor need to coordinate, in a way that the guest can trust, to ensure that the guest's idea of which pages are private match the host's.  This model seems a bit harder to support nicely with the private memory fd model, but not necessarily impossible.

Right. Perhaps one thing I should clarify as well: pKVM (as opposed to
TDX) has only _one_ page-table per guest, and it is controllex by the
hypervisor only. So the hypervisor needs to be involved for both shared
and private mappings. As such, shared pages have relatively similar
constraints when it comes to host mm stuff --  we can't migrate shared
pages or swap them out without getting the hypervisor involved.

> Also, what are you trying to accomplish by having the host userspace mmap private pages?

What I would really like to have is non-destructive in-place conversions
of pages. mmap-ing the pages that have been shared back felt like a good
fit for the private=>shared conversion, but in fact I'm not all that
opinionated about the API as long as the behaviour and the performance
are there. Happy to look into alternatives.

FWIW, there are a couple of reasons why I'd like to have in-place
conversions:

 - one goal of pKVM is to migrate some things away from the Arm
   Trustzone environment (e.g. DRM and the likes) and into protected VMs
   instead. This will give Linux a fighting chance to defend itself
   against these things -- they currently have access to _all_ memory.
   And transitioning pages between Linux and Trustzone (donations and
   shares) is fast and non-destructive, so we really do not want pKVM to
   regress by requiring the hypervisor to memcpy things;

 - it can be very useful for protected VMs to do shared=>private
   conversions. Think of a VM receiving some data from the host in a
   shared buffer, and then it wants to operate on that buffer without
   risking to leak confidential informations in a transient state. In
   that case the most logical thing to do is to convert the buffer back
   to private, do whatever needs to be done on that buffer (decrypting a
   frame, ...), and then share it back with the host to consume it;

 - similar to the previous point, a protected VM might want to
   temporarily turn a buffer private to avoid ToCToU issues;

 - once we're able to do device assignment to protected VMs, this might
   allow DMA-ing to a private buffer, and make it shared later w/o
   bouncing.

And there is probably more.

IIUC, the private fd proposal as it stands requires shared and private
pages to come from entirely distinct places. So it's not entirely clear
to me how any of the above could be supported without having the
hypervisor memcpy the data during conversions, which I really don't want
to do for performance reasons.

> Is the idea that multiple guest could share the same page until such time as one of them tries to write to it?

That would certainly be possible to implement in the pKVM
environment with the right tracking, so I think it is worth considering
as a future goal.

Thanks,
Quentin

