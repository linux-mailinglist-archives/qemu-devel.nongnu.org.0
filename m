Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3EF348472E
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 18:45:13 +0100 (CET)
Received: from localhost ([::1]:45130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4ns0-0001BY-Uu
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 12:45:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1n4nqn-0008Rk-MT
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 12:43:57 -0500
Received: from [2607:f8b0:4864:20::52d] (port=34590
 helo=mail-pg1-x52d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1n4nqm-0008Be-2G
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 12:43:57 -0500
Received: by mail-pg1-x52d.google.com with SMTP id g22so33334355pgn.1
 for <qemu-devel@nongnu.org>; Tue, 04 Jan 2022 09:43:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=13+cbru1EicSyFl290RL62qNhQ55+dHM2uIjjFzOwWQ=;
 b=qiqd4ZBl5BqJHPRL1WkKqev6zYNCBKXygXrnDR+B8P5U+ncr+nyYGcNLR7VtJRMbR+
 nu+XvQR0ZvTHDgijE3+Ephw/fASHy6xXWP0G97pDtjkfz1dKRsQLmc6PexXKZ6eOiTmr
 wLjrAbgjf1xpI3WYhgSKqeScUoNRXJvAlDnLd371vsx/3pwzIE9KXiKfaj3I/ZdHjqA8
 xBpOOwl5sZ+x9RvltjE0m8jfdToQt4TESxL7mb+P6lBPBE7kEi7z47aEbg/ZFbrTwxVh
 thDTi9pkTIUf/VFrmufk4T+y2xu0pNllCtxK03hhz2Xp5v22QQLi5JXx3XoNiDlljx2j
 eUEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=13+cbru1EicSyFl290RL62qNhQ55+dHM2uIjjFzOwWQ=;
 b=T/KY8JBQChLXcQjMbaiEL4/0DdfidV5nfudPS6vjYYe9wuZl4InRZjcD06L3OBbOFj
 1wwScx7lll6clAd6RLTz8+rlpoLpGPAEZ1xHivOuD/RAfKw0S3gQc8s00sBwmoiQWSYP
 kCFoxU9VcJhNSLBeEdqrEFQq2z73bsMQzDFe/YO1xrnEYY5BCqNJuoeR5e39TKxF97mN
 RTAuyGlH89wqisgQsCtPc1A8kfW5d0Zpik/O30FjRU3Nt959bOXAHBh+v40jNrTMhMlG
 bQBeB6JKmYw6EQbcSDwFcQgju6SBNw4tFvrMerSpG8dwKepRU6TiieyLctPQNzG8WRkK
 aKiw==
X-Gm-Message-State: AOAM532Au3WlX6z6JVrkNTAs8fRcwTZ8r8xMEm4OgTDMsdBhql2gCqac
 tkySnhVCjy/CMCSwxCNrvPqlqA==
X-Google-Smtp-Source: ABdhPJzQtrrXhdr9JNHtClHOyyxM1wCawkxYoqgHsdkj3QcxdAXEJm9cAZOEh3vO62LsqFUjGuIFog==
X-Received: by 2002:a63:ba47:: with SMTP id l7mr46031570pgu.75.1641318234513; 
 Tue, 04 Jan 2022 09:43:54 -0800 (PST)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157])
 by smtp.gmail.com with ESMTPSA id n14sm34881764pgd.80.2022.01.04.09.43.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 09:43:53 -0800 (PST)
Date: Tue, 4 Jan 2022 17:43:50 +0000
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
Message-ID: <YdSHViDXGkjz5t/Q@google.com>
References: <20211223123011.41044-1-chao.p.peng@linux.intel.com>
 <20211223123011.41044-6-chao.p.peng@linux.intel.com>
 <YcS5uStTallwRs0G@google.com>
 <20211224035418.GA43608@chaop.bj.intel.com>
 <YcuGGCo5pR31GkZE@google.com>
 <20211231022636.GA7025@chaop.bj.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211231022636.GA7025@chaop.bj.intel.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=seanjc@google.com; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -148
X-Spam_score: -14.9
X-Spam_bar: --------------
X-Spam_report: (-14.9 / 5.0 requ) DKIMWL_WL_MED=-0.001, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Fri, Dec 31, 2021, Chao Peng wrote:
> On Tue, Dec 28, 2021 at 09:48:08PM +0000, Sean Christopherson wrote:
> >KVM handles
> > reverse engineering the memslot to get the offset and whatever else it needs.
> > notify_fallocate() and other callbacks are unchanged, though they probably can
> > drop the inode.
> > 
> > E.g. likely with bad math and handwaving on the overlap detection:
> > 
> > int kvm_private_fd_fallocate_range(void *owner, pgoff_t start, pgoff_t end)
> > {
> > 	struct kvm_memory_slot *slot = owner;
> > 	struct kvm_gfn_range gfn_range = {
> > 		.slot	   = slot,
> > 		.start	   = (start - slot->private_offset) >> PAGE_SHIFT,
> > 		.end	   = (end - slot->private_offset) >> PAGE_SHIFT,
> > 		.may_block = true,
> > 	};
> > 
> > 	if (!has_overlap(slot, start, end))
> > 		return 0;
> > 
> > 	gfn_range.end = min(gfn_range.end, slot->base_gfn + slot->npages);
> > 
> > 	kvm_unmap_gfn_range(slot->kvm, &gfn_range);
> > 	return 0;
> > }
> 
> I understand this KVM side handling, but again one fd can have multiple
> memslots. How shmem decides to notify which memslot from a list of
> memslots when it invokes the notify_fallocate()? Or just notify all
> the possible memslots then let KVM to check? 

Heh, yeah, those are the two choices.  :-)

Either the backing store needs to support registering callbacks for specific,
arbitrary ranges, or it needs to invoke all registered callbacks.  Invoking all
callbacks has my vote; it's much simpler to implement and is unlikely to incur
meaningful overhead.  _Something_ has to find the overlapping ranges, that cost
doesn't magically go away if it's pushed into the backing store.

Note, invoking all notifiers is also aligned with the mmu_notifier behavior.

