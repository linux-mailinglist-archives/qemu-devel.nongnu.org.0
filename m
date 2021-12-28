Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17008480D8E
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Dec 2021 22:49:30 +0100 (CET)
Received: from localhost ([::1]:60242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n2KLY-0001P5-NI
	for lists+qemu-devel@lfdr.de; Tue, 28 Dec 2021 16:49:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1n2KKO-0000jQ-Og
 for qemu-devel@nongnu.org; Tue, 28 Dec 2021 16:48:16 -0500
Received: from [2607:f8b0:4864:20::42e] (port=42962
 helo=mail-pf1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1n2KKN-0003tx-4F
 for qemu-devel@nongnu.org; Tue, 28 Dec 2021 16:48:16 -0500
Received: by mail-pf1-x42e.google.com with SMTP id t19so17160209pfg.9
 for <qemu-devel@nongnu.org>; Tue, 28 Dec 2021 13:48:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=AINbZEGCl8z/7FJgJFS1bW6C73bLWpVUK2DVW0sKcL8=;
 b=i8BDfu3Cbnb3Viigeb90+/RoyFCsdY4zmmhG67xy1/xKkRGBvV7zYsDSfUujxRz1M6
 WKWW+hF3hWcTBahPXxiAE2dd5TzfFfyW+kaCuL37DnTaDADymu2gDTSIFocZkVOxl6Bm
 CXzjV9xx6eCJ5Fw/xZYWhUhKQdZf9vwKMKPt6PajLZqspTsivs90pzHPbq5ZOF4iu0Al
 EogQs7/Dz0D2oeqbOHpA93p/WmGqQRboZHG7tge27x0qsYapE32/3MTkgYVB/z5hT7Oh
 xGGAYApGd3to+yh2r1kf72CjhAP/3e8BbkQgzoMOcENXvMEuD5Cz7S0TaFuhwptpdVII
 KgIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=AINbZEGCl8z/7FJgJFS1bW6C73bLWpVUK2DVW0sKcL8=;
 b=3Swi8+k/t13Xz4Xc81iJB6QeV9y7+c6q/YpGkv+yhPY2Y5HGG7q2DxGVwnmgB2JeNF
 c6iCyb6GPDX1WYbLhSzopdz/y/Z4YXSEnKMpInWFXJWIKiirkJF1N1hwRkeNMgweqGug
 i0/WoIvIBZNEuownsT2zswUcf0EC/E3w11j/AgOTmAnu5osp1IdZa5Xjm82qCUVNVF3D
 B4IuvCFLK44T+B8n660h+8rHrZADL7+pYyhuc7FQV27gRxrsGJc1XYQoBU4AJZkWpfAk
 JBhZT6ZWeQshTrwikFYdYisY9KBbbqbYo3wQbJBslFnHZsSI6yiCY2Bjfekt0A73C7tY
 VMQw==
X-Gm-Message-State: AOAM532WiXZkbjZSRLJ1D6Y1wkpPd1K73AkVbT+5zSk5CG8xRcXo5z5S
 2vaRUM1sVzMm36UPlY0RimfNXA==
X-Google-Smtp-Source: ABdhPJyKE3UVODPS1fshDuKNztoIqtf+jVLcm9grjNtuxnSRjURqBYuIllKdU8KU2kEC55IFpKtL1g==
X-Received: by 2002:a63:711a:: with SMTP id m26mr3052221pgc.49.1640728092301; 
 Tue, 28 Dec 2021 13:48:12 -0800 (PST)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157])
 by smtp.gmail.com with ESMTPSA id t8sm113511pfj.114.2021.12.28.13.48.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Dec 2021 13:48:11 -0800 (PST)
Date: Tue, 28 Dec 2021 21:48:08 +0000
From: Sean Christopherson <seanjc@google.com>
To: Chao Peng <chao.p.peng@linux.intel.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
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
 jun.nakajima@intel.com, dave.hansen@intel.com, ak@linux.intel.com,
 david@redhat.com
Subject: Re: [PATCH v3 kvm/queue 05/16] KVM: Maintain ofs_tree for fast
 memslot lookup by file offset
Message-ID: <YcuGGCo5pR31GkZE@google.com>
References: <20211223123011.41044-1-chao.p.peng@linux.intel.com>
 <20211223123011.41044-6-chao.p.peng@linux.intel.com>
 <YcS5uStTallwRs0G@google.com>
 <20211224035418.GA43608@chaop.bj.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211224035418.GA43608@chaop.bj.intel.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=seanjc@google.com; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -167
X-Spam_score: -16.8
X-Spam_bar: ----------------
X-Spam_report: (-16.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, FSL_HELO_FAKE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5,
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

On Fri, Dec 24, 2021, Chao Peng wrote:
> On Thu, Dec 23, 2021 at 06:02:33PM +0000, Sean Christopherson wrote:
> > On Thu, Dec 23, 2021, Chao Peng wrote:
> > > Similar to hva_tree for hva range, maintain interval tree ofs_tree for
> > > offset range of a fd-based memslot so the lookup by offset range can be
> > > faster when memslot count is high.
> > 
> > This won't work.  The hva_tree relies on there being exactly one virtual address
> > space, whereas with private memory, userspace can map multiple files into the
> > guest at different gfns, but with overlapping offsets.
> 
> OK, that's the point.
> 
> > 
> > I also dislike hijacking __kvm_handle_hva_range() in patch 07.
> > 
> > KVM also needs to disallow mapping the same file+offset into multiple gfns, which
> > I don't see anywhere in this series.
> 
> This can be checked against file+offset overlapping with existing slots
> when register a new one.
> 
> > 
> > In other words, there needs to be a 1:1 gfn:file+offset mapping.  Since userspace
> > likely wants to allocate a single file for guest private memory and map it into
> > multiple discontiguous slots, e.g. to skip the PCI hole, the best idea off the top
> > of my head would be to register the notifier on a per-slot basis, not a per-VM
> > basis.  It would require a 'struct kvm *' in 'struct kvm_memory_slot', but that's
> > not a huge deal.
> > 
> > That way, KVM's notifier callback already knows the memslot and can compute overlap
> > between the memslot and the range by reversing the math done by kvm_memfd_get_pfn().
> > Then, armed with the gfn and slot, invalidation is just a matter of constructing
> > a struct kvm_gfn_range and invoking kvm_unmap_gfn_range().
> 
> KVM is easy but the kernel bits would be difficulty, it has to maintain
> fd+offset to memslot mapping because one fd can have multiple memslots,
> it need decide which memslot needs to be notified.

No, the kernel side maintains an opaque pointer like it does today, KVM handles
reverse engineering the memslot to get the offset and whatever else it needs.
notify_fallocate() and other callbacks are unchanged, though they probably can
drop the inode.

E.g. likely with bad math and handwaving on the overlap detection:

int kvm_private_fd_fallocate_range(void *owner, pgoff_t start, pgoff_t end)
{
	struct kvm_memory_slot *slot = owner;
	struct kvm_gfn_range gfn_range = {
		.slot	   = slot,
		.start	   = (start - slot->private_offset) >> PAGE_SHIFT,
		.end	   = (end - slot->private_offset) >> PAGE_SHIFT,
		.may_block = true,
	};

	if (!has_overlap(slot, start, end))
		return 0;

	gfn_range.end = min(gfn_range.end, slot->base_gfn + slot->npages);

	kvm_unmap_gfn_range(slot->kvm, &gfn_range);
	return 0;
}


