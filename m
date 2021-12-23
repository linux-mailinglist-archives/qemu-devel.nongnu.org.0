Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 857AF47E764
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 19:03:54 +0100 (CET)
Received: from localhost ([::1]:57124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0SRV-0004gl-5a
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 13:03:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1n0SQK-00040K-T8
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 13:02:40 -0500
Received: from [2607:f8b0:4864:20::431] (port=46977
 helo=mail-pf1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1n0SQJ-0007mC-9E
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 13:02:40 -0500
Received: by mail-pf1-x431.google.com with SMTP id t123so5858930pfc.13
 for <qemu-devel@nongnu.org>; Thu, 23 Dec 2021 10:02:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=F3vp7cNpz2qk0OIvJVZgGpZrlLI8cGs8eddNh3pH4O0=;
 b=V6LVAQd/8UIn8ldsx5JR1O9YpJZeToHbDLZbS7mg8/+loFV7/N7sZ+XhcLN4ER+wrt
 a4OJl94CKbfUSCf2rds4kBh5Lrrm72ej4Vw2jCZdwyaTpvW1Rfri5/b6D0d+XdP6rcLq
 EnCBOIjnXfg4hlKeBatFlHOFTTdwmCQQ6xeF/Ly1U82igCJHWiW1VL+d3kr+QmXcuLv8
 0JyTkQyChwcIVqzmWpqo1NlewbWrHW4RFSMnsRxLAB2r1vNJbOQ7FxBRMK3jdWuCu2Zf
 vQb1n9Yb12+2OopiSqPqPM/6Qm6od8AV54HqElWU29SUVdpkee1DGnFa+7+XiW0B251Y
 fEzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=F3vp7cNpz2qk0OIvJVZgGpZrlLI8cGs8eddNh3pH4O0=;
 b=oH/DrVpArliW6U0L8e6mCfEam1WKw/wHmETvVamjXwLDwsfZMDPwhO5qpSzYJXe7um
 2l2uIzs+cEQCXmLhhatz4N40W1Z/nRTowzRs85LMIu+wz3MmS0vi2frAMyOV5TyOWB+W
 Su9jNLooxLDQCWZq2W6E8FfD5orOIVYnlTYo07XeHr5vcTKTQIdBfNh260XSv1im4OGt
 EJmLu17srUQzpnUe8t9xmjhYxSLLHDqb13Lwr+kDr/SEpeX5mzz5Yu6ZG12mt+9wOcMR
 SLJdAb/wuXV5OG3gHFvNkUWpfq5HVS4pqFX+KgJnCrqgVeqAP18fzAvvLwQCWl2i41x4
 8OXw==
X-Gm-Message-State: AOAM532nzT8vcQ3yBskW6LhFlgnlhpF0E/rseUOupiXSoFRRLwoJ1SVc
 mA4+5QwVcoEVkvKFbNhRcC/Pwg==
X-Google-Smtp-Source: ABdhPJwrV3ydO2yyHoylZ6+Gjlc1pXLEXn2GLpfX+eRE21Of6xThdp2NrJD74NCN2Jt8w5I9duli3Q==
X-Received: by 2002:a65:648b:: with SMTP id e11mr3022987pgv.138.1640282557705; 
 Thu, 23 Dec 2021 10:02:37 -0800 (PST)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157])
 by smtp.gmail.com with ESMTPSA id gg23sm9329532pjb.31.2021.12.23.10.02.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Dec 2021 10:02:36 -0800 (PST)
Date: Thu, 23 Dec 2021 18:02:33 +0000
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
Message-ID: <YcS5uStTallwRs0G@google.com>
References: <20211223123011.41044-1-chao.p.peng@linux.intel.com>
 <20211223123011.41044-6-chao.p.peng@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211223123011.41044-6-chao.p.peng@linux.intel.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::431
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=seanjc@google.com; helo=mail-pf1-x431.google.com
X-Spam_score_int: -138
X-Spam_score: -13.9
X-Spam_bar: -------------
X-Spam_report: (-13.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, FSL_HELO_FAKE=2.899, RCVD_IN_DNSWL_NONE=-0.0001,
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

On Thu, Dec 23, 2021, Chao Peng wrote:
> Similar to hva_tree for hva range, maintain interval tree ofs_tree for
> offset range of a fd-based memslot so the lookup by offset range can be
> faster when memslot count is high.

This won't work.  The hva_tree relies on there being exactly one virtual address
space, whereas with private memory, userspace can map multiple files into the
guest at different gfns, but with overlapping offsets.

I also dislike hijacking __kvm_handle_hva_range() in patch 07.

KVM also needs to disallow mapping the same file+offset into multiple gfns, which
I don't see anywhere in this series.

In other words, there needs to be a 1:1 gfn:file+offset mapping.  Since userspace
likely wants to allocate a single file for guest private memory and map it into
multiple discontiguous slots, e.g. to skip the PCI hole, the best idea off the top
of my head would be to register the notifier on a per-slot basis, not a per-VM
basis.  It would require a 'struct kvm *' in 'struct kvm_memory_slot', but that's
not a huge deal.

That way, KVM's notifier callback already knows the memslot and can compute overlap
between the memslot and the range by reversing the math done by kvm_memfd_get_pfn().
Then, armed with the gfn and slot, invalidation is just a matter of constructing
a struct kvm_gfn_range and invoking kvm_unmap_gfn_range().

