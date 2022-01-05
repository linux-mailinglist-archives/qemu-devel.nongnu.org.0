Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB441485714
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 18:09:02 +0100 (CET)
Received: from localhost ([::1]:57190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n59mX-0007hk-65
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 12:09:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1n59hU-0003Y6-6F
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 12:03:48 -0500
Received: from [2607:f8b0:4864:20::1032] (port=44973
 helo=mail-pj1-x1032.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1n59hD-00026d-V5
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 12:03:47 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 n30-20020a17090a5aa100b001b2b6509685so6840527pji.3
 for <qemu-devel@nongnu.org>; Wed, 05 Jan 2022 09:03:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=20PcXM2SOqh0bhoeFDgkuJ5Ggj44o0SuiK3MzhyRmsU=;
 b=rsVhd0t9UYWasE9JkCnUdxw73v/C1RJiVYZucEuqofNaX7J+c9jjVQkj/bSH9/hzML
 1AQ45ueMsGZqHhb+ONFIOTRVECck4WDJiLkhJ0dCZbZRd5F9dDTBiVu7r7REZXD9nDtu
 Xwabj8vwZirYN27UmfT+MFejoQWUI9qJwppOAO8SVy7LPqm06bw6Rk+FSk4JnYLfNzKN
 6FSWMsczvkGo3kv1fgbZktu3eIC0s4j4r+mMRKUgyd5AhelCtF7hT13ZZzUMad8zhHYs
 NsjHcQfwZ6EHDGIT1RaMTzGYfSxfIcJSuUk+//z6aXiUfPd4LC0DhqXQ2LFXonhbNUZK
 5pzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=20PcXM2SOqh0bhoeFDgkuJ5Ggj44o0SuiK3MzhyRmsU=;
 b=BL2uFuH/hn/FaQFMxOoRjmelB9XHSUv5ZFEDEzvInwJKA2OYnjCqNtUiU4DVJLZCtI
 ZVCTR0RkXy4zrSsgspyyvskDZ3CGH7DyDwNM1cilNZ1XBbumWRfHVBFphvkNOVWX279O
 oXF/osX4+Kq5tVuGluYbYOKy6l0Es3346Ch1TKhroTk9JyIuT/UMVKDJ1LgtXsbr6suU
 19ZYdrbMLTLqbp2GduP9uxrtkTnR9Yq2mdgu9Arm3g+FT9J6ZNND0T+R4c5gyrjME8dx
 t1JrODezj1aFQ2iTfn5AUu7/SOe4NEoB4CBivbpIgpvRk8Nk+niICKQrcYi0I1dHLGnm
 JgFg==
X-Gm-Message-State: AOAM533mGtzOgPagPNnzhsTKGKjMZNyZfK6OTC0OChYRrPwAaJGLxuYZ
 iIyU/xqwbhI9YjoVR/W1qboMFA==
X-Google-Smtp-Source: ABdhPJxImFHzV2wP+eap8aozdummb4OVmFsl2PXCC7t1JdswItec85C5qV0TEmNNUwSf2xDAMgaO6g==
X-Received: by 2002:a17:90b:1c86:: with SMTP id
 oo6mr4975265pjb.165.1641402207756; 
 Wed, 05 Jan 2022 09:03:27 -0800 (PST)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157])
 by smtp.gmail.com with ESMTPSA id v3sm23315094pgl.64.2022.01.05.09.03.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jan 2022 09:03:27 -0800 (PST)
Date: Wed, 5 Jan 2022 17:03:23 +0000
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
Subject: Re: [PATCH v3 kvm/queue 11/16] KVM: Add kvm_map_gfn_range
Message-ID: <YdXPW+2hZDsgZD/a@google.com>
References: <20211223123011.41044-1-chao.p.peng@linux.intel.com>
 <20211223123011.41044-12-chao.p.peng@linux.intel.com>
 <YcS6m9CieYaIGA3F@google.com>
 <20211224041351.GB44042@chaop.bj.intel.com>
 <20211231023334.GA7255@chaop.bj.intel.com>
 <YdSEcknuErGe0gQa@google.com>
 <20220105061410.GA25283@chaop.bj.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220105061410.GA25283@chaop.bj.intel.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1032
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=seanjc@google.com; helo=mail-pj1-x1032.google.com
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

On Wed, Jan 05, 2022, Chao Peng wrote:
> On Tue, Jan 04, 2022 at 05:31:30PM +0000, Sean Christopherson wrote:
> > On Fri, Dec 31, 2021, Chao Peng wrote:
> > > On Fri, Dec 24, 2021 at 12:13:51PM +0800, Chao Peng wrote:
> > > > On Thu, Dec 23, 2021 at 06:06:19PM +0000, Sean Christopherson wrote:
> > > > > On Thu, Dec 23, 2021, Chao Peng wrote:
> > > > > > This new function establishes the mapping in KVM page tables for a
> > > > > > given gfn range. It can be used in the memory fallocate callback for
> > > > > > memfd based memory to establish the mapping for KVM secondary MMU when
> > > > > > the pages are allocated in the memory backend.
> > > > > 
> > > > > NAK, under no circumstance should KVM install SPTEs in response to allocating
> > > > > memory in a file.   The correct thing to do is to invalidate the gfn range
> > > > > associated with the newly mapped range, i.e. wipe out any shared SPTEs associated
> > > > > with the memslot.
> > > > 
> > > > Right, thanks.
> > > 
> > > BTW, I think the current fallocate() callback is just useless as long as
> > > we don't want to install KVM SPTEs in response to allocating memory in a
> > > file. The invalidation of the shared SPTEs should be notified through 
> > > mmu_notifier of the shared memory backend, not memfd_notifier of the
> > > private memory backend.
> > 
> > No, because the private fd is the final source of truth as to whether or not a
> > GPA is private, e.g. userspace may choose to not unmap the shared backing.
> > KVM's rule per Paolo's/this proposoal is that a GPA is private if it has a private
> > memslot and is present in the private backing store.  And the other core rule is
> > that KVM must never map both the private and shared variants of a GPA into the
> > guest.
> 
> That's true, but I'm wondering if zapping the shared variant can be
> handled at the time when the private one gets mapped in the KVM page
> fault. No bothering the backing store to dedicate a callback to tell
> KVM.

Hmm, I don't think that would work for the TDP MMU due to page faults taking
mmu_lock for read.  E.g. if two vCPUs concurrently fault in both the shared and
private variants, a race could exist where the private page fault sees the gfn
as private and the shared page fault sees it as shared.  In that case, both faults
will install a SPTE and KVM would end up running with both variants mapped into the
guest.

There's also a performance penalty, as KVM would need to walk the shared EPT tree
on every private page fault.

