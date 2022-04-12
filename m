Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA824FCEE3
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Apr 2022 07:20:40 +0200 (CEST)
Received: from localhost ([::1]:49412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ne8xD-0000Rv-48
	for lists+qemu-devel@lfdr.de; Tue, 12 Apr 2022 01:20:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hughd@google.com>) id 1ne8r8-0007il-Rn
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 01:14:22 -0400
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29]:40161)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hughd@google.com>) id 1ne8r6-00045s-0e
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 01:14:22 -0400
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-d6e29fb3d7so19671186fac.7
 for <qemu-devel@nongnu.org>; Mon, 11 Apr 2022 22:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :mime-version; bh=7AXHvKyDS+8sXsKK4DrpbEGpG8JmWPbR7ulEunl5/Pc=;
 b=MIKtm3AFEh6CUVVNwUV8SeElPxDQU+nDCsyp+WcUsmZ4pYGMDS8fAcdOR85R0GnShf
 Y4SvxZp6GJGIWSDO3Qz0y+u4ZcAKbd5h4QgxfwJ80V2XMN4GDeNiF7fIlHS12g+G1n/h
 Kv7zR3bRSH86ipJifMek23BAEcPpsO3GQOK2qAQPq7d5D/TFRqQckEDpcn4OYWx7WoM9
 lUklPUH6KUc5SlQqi1stBQ4I3bHiGY7ZT6LaR8lgLF5UeZqRnpzjDs527tWEzRy8OZZn
 nmt6hJ/Qq1aIeTJZ8BRsG/eRuI5lX0MY/pv7AqCy9vDclBFJLYkpepT8CENCuRctsE08
 JerA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:mime-version;
 bh=7AXHvKyDS+8sXsKK4DrpbEGpG8JmWPbR7ulEunl5/Pc=;
 b=XqkrIlQ8pYuLaJEV+jNlMjqAmi4GPGMplGlbkY77lM+fA+RTcjQ+/D5JODGxF54xfo
 kTR7khSM+H9Dz+Oe+BegeirQ0m4Hknhmbo+sO2kpHr8CupBqTGSkVdyAe5rnSssEGqTu
 IoX3HXPY7Ojbl1H8pOa/aYDm3afcF8Mwt4BPvv9CNz62U+VCcTpHuWPI4+Vy/f3WAwvS
 kAToNgMuw57GMqzAbEYxCadZWt74F3ihF2WjhLwPhrOAcVTelsKlctUvl6a7Sm00xfq/
 69e5teSc44QjJQZZvywWZXfJHocpsc1nwr3MQDSsO7p6LomF/cdHt20tRZHIexqDnOSP
 uwGA==
X-Gm-Message-State: AOAM530QrpuQqTAx4j9v4ZgHi3fTsqJSP1RKkaI6eEiEs5Xziq8G+Eoh
 fNhwhQVTaiND15b6CyFtm+OI+w==
X-Google-Smtp-Source: ABdhPJzGUlHADzn2yFu7M3obTMzPSe7EDZTZ3EDogaZbWHy2xdUqchu+tTmHlhlBd5Pwc/mriWkvvQ==
X-Received: by 2002:a05:6870:5390:b0:de:f680:db03 with SMTP id
 h16-20020a056870539000b000def680db03mr1269177oan.237.1649740456270; 
 Mon, 11 Apr 2022 22:14:16 -0700 (PDT)
Received: from ripple.attlocal.net
 (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
 by smtp.gmail.com with ESMTPSA id
 e9-20020a056820060900b003216277bfdasm12481870oow.19.2022.04.11.22.14.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Apr 2022 22:14:15 -0700 (PDT)
Date: Mon, 11 Apr 2022 22:14:00 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.anvils
To: "Kirill A. Shutemov" <kirill@shutemov.name>
cc: Chao Peng <chao.p.peng@linux.intel.com>, 
 Sean Christopherson <seanjc@google.com>, kvm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org, 
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
 Jonathan Corbet <corbet@lwn.net>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
 Wanpeng Li <wanpengli@tencent.com>, Jim Mattson <jmattson@google.com>, 
 Joerg Roedel <joro@8bytes.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>, 
 Hugh Dickins <hughd@google.com>, Jeff Layton <jlayton@kernel.org>, 
 "J . Bruce Fields" <bfields@fieldses.org>, 
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>, 
 Steven Price <steven.price@arm.com>, 
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>, 
 Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve <vannapurve@google.com>, 
 Yu Zhang <yu.c.zhang@linux.intel.com>, 
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, 
 Shakeel Butt <shakeelb@google.com>, luto@kernel.org, 
 jun.nakajima@intel.com, dave.hansen@intel.com, ak@linux.intel.com, 
 david@redhat.com
Subject: Re: [PATCH v5 04/13] mm/shmem: Restrict MFD_INACCESSIBLE memory
 against RLIMIT_MEMLOCK
In-Reply-To: <20220411153433.6sqqqd6vzhyfjee6@box.shutemov.name>
Message-ID: <2c39702b-2a71-cda2-685-93908763912@google.com>
References: <20220310140911.50924-1-chao.p.peng@linux.intel.com>
 <20220310140911.50924-5-chao.p.peng@linux.intel.com>
 <Yk8L0CwKpTrv3Rg3@google.com> <20220408130254.GB57095@chaop.bj.intel.com>
 <20220411153433.6sqqqd6vzhyfjee6@box.shutemov.name>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=2001:4860:4864:20::29;
 envelope-from=hughd@google.com; helo=mail-oa1-x29.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 12 Apr 2022 01:19:23 -0400
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

On Mon, 11 Apr 2022, Kirill A. Shutemov wrote:
> On Fri, Apr 08, 2022 at 09:02:54PM +0800, Chao Peng wrote:
> > > I think the correct approach is to not do the locking automatically for SHM_F_INACCESSIBLE,
> > > and instead require userspace to do shmctl(.., SHM_LOCK, ...) if userspace knows the
> > > consumers don't support migrate/swap.  That'd require wrapping migrate_page() and then
> > > wiring up notifier hooks for migrate/swap, but IMO that's a good thing to get sorted
> > > out sooner than later.  KVM isn't planning on support migrate/swap for TDX or SNP,
> > > but supporting at least migrate for a software-only implementation a la pKVM should
> > > be relatively straightforward.  On the notifiee side, KVM can terminate the VM if it
> > > gets an unexpected migrate/swap, e.g. so that TDX/SEV VMs don't die later with
> > > exceptions and/or data corruption (pre-SNP SEV guests) in the guest.
> > 
> > SHM_LOCK sounds like a good match.
> 
> Emm, no. shmctl(2) and SHM_LOCK are SysV IPC thing. I don't see how they
> fit here.

I am still struggling to formulate a constructive response on
MFD_INACCESSIBLE in general: but before doing so, let me jump in here
to say that I'm firmly on the side of SHM_LOCK being the right model -
but admittedly not through userspace calling shmctl(2).

Please refer to our last year's posting "[PATCH 10/16] tmpfs: fcntl(fd,
F_MEM_LOCK) to memlock a tmpfs file" for the example of how Shakeel did
it then (though only a small part of that would be needed for this case):
https://lore.kernel.org/linux-mm/54e03798-d836-ae64-f41-4a1d46bc115b@google.com/

And until such time as swapping is enabled, this memlock accounting would
be necessarily entailed by "MFD_INACCESSIBLE", or however that turns out
to be implemented: not something that we could trust userspace to call
separately.

Hugh

