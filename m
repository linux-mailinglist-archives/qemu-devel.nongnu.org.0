Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A94725991B0
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Aug 2022 02:23:33 +0200 (CEST)
Received: from localhost ([::1]:47100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOpnQ-00028W-Qy
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 20:23:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1oOpka-0006zU-Jr
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 20:20:36 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:41603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1oOpkY-00027X-TZ
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 20:20:36 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 t2-20020a17090a4e4200b001f21572f3a4so3408133pjl.0
 for <qemu-devel@nongnu.org>; Thu, 18 Aug 2022 17:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc;
 bh=pEgXnTJKFJrTL3CTka16XSJbg6kxwB4cnfOI/Ofjlz4=;
 b=jQOCWpbvee03T0P8xijjOYN3zJfdX6BqWq3GiUDY54GeiB2kYOpPOdypH/gNOYaODr
 ix4Q5zM5HRdkrH8VNhhYaqC4bGm3TWrsr3zotxk6UhP/oyxM/RNGcU3wIqmpKytWvU4a
 BTREDH/HNF59rmTBvSdbCesgF6GRyz5K9//B1DM9fRziLLn/FELyxzGGJ6BTGO4HJJrl
 o0UAtZhP3o05JqW/WffSD/W7KBey1RzgtF0ZEqIKFPy09PHnweIeH6czpkeJBsdR0KF6
 StCY9jf29Uto9xBg0n+/eHlcuPQ9Rk2xvxAOK7+9vgIk182YafaVSJIp8WTK07eIFh8d
 mv/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=pEgXnTJKFJrTL3CTka16XSJbg6kxwB4cnfOI/Ofjlz4=;
 b=bFI8mntTAhctGV8wQ1q8OnNw7/AisrfMnNtu6LPvFXpErSCr4wpSrX7y6K9gEj2fSu
 TBt3UUuq1wcu8ElXGcbGYrO3B102WoI67WJCsNX/EraTkTmRT0TBisuiZnLcAk1/rtf7
 XpZaoRaJCtFhjKRBi1WA/C2r/YpKiFkjJ0vE1MFisSHpmGtnFH8sx1fh4NoL/RE4mqZ9
 z+Eqb8v8LC9/+w6hC5kBjHFLJQ0KMS41bOEwGXGfGmp0Pn5+w5LOr5ocoBx0W4YviQ00
 kfdrARtS6bEc5fsos3PN0pB5bRtNPsHuXMaxWsX/KIoXqLQXAn4wpzUDatU+Twna/cV+
 hIHQ==
X-Gm-Message-State: ACgBeo1zG28VMtSzMoKmSzhQ6F/KtngMllulQB1fbJ9o4V+6Agpdc/O4
 bCZSDvDNefGjMdNt4VEOwvF0WA==
X-Google-Smtp-Source: AA6agR7cPKIHabvzPHesQ7mysYM4f98Not26hLuTLYt6okFI7nMH1sNNM2K+QGI7RxRYoX8JypicJA==
X-Received: by 2002:a17:902:7208:b0:172:a9d6:527 with SMTP id
 ba8-20020a170902720800b00172a9d60527mr4900702plb.32.1660868432853; 
 Thu, 18 Aug 2022 17:20:32 -0700 (PDT)
Received: from google.com (7.104.168.34.bc.googleusercontent.com.
 [34.168.104.7]) by smtp.gmail.com with ESMTPSA id
 l4-20020a170903244400b0016bedcced2fsm1984501pls.35.2022.08.18.17.20.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Aug 2022 17:20:32 -0700 (PDT)
Date: Fri, 19 Aug 2022 00:20:28 +0000
From: Sean Christopherson <seanjc@google.com>
To: "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Cc: Hugh Dickins <hughd@google.com>,
 Chao Peng <chao.p.peng@linux.intel.com>, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
 linux-doc@vger.kernel.org, qemu-devel@nongnu.org,
 linux-kselftest@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Wanpeng Li <wanpengli@tencent.com>,
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
Message-ID: <Yv7XTON3MwuC1Q3U@google.com>
References: <20220706082016.2603916-1-chao.p.peng@linux.intel.com>
 <ff5c5b97-acdf-9745-ebe5-c6609dd6322e@google.com>
 <20220818132421.6xmjqduempmxnnu2@box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220818132421.6xmjqduempmxnnu2@box>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=seanjc@google.com; helo=mail-pj1-x102b.google.com
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

On Thu, Aug 18, 2022, Kirill A . Shutemov wrote:
> On Wed, Aug 17, 2022 at 10:40:12PM -0700, Hugh Dickins wrote:
> > On Wed, 6 Jul 2022, Chao Peng wrote:
> > But since then, TDX in particular has forced an effort into preventing
> > (by flags, seals, notifiers) almost everything that makes it shmem/tmpfs.
> > 
> > Are any of the shmem.c mods useful to existing users of shmem.c? No.
> > Is MFD_INACCESSIBLE useful or comprehensible to memfd_create() users? No.

But QEMU and other VMMs are users of shmem and memfd.  The new features certainly
aren't useful for _all_ existing users, but I don't think it's fair to say that
they're not useful for _any_ existing users.

> > What use do you have for a filesystem here?  Almost none.
> > IIUC, what you want is an fd through which QEMU can allocate kernel
> > memory, selectively free that memory, and communicate fd+offset+length
> > to KVM.  And perhaps an interface to initialize a little of that memory
> > from a template (presumably copied from a real file on disk somewhere).
> > 
> > You don't need shmem.c or a filesystem for that!
> > 
> > If your memory could be swapped, that would be enough of a good reason
> > to make use of shmem.c: but it cannot be swapped; and although there
> > are some references in the mailthreads to it perhaps being swappable
> > in future, I get the impression that will not happen soon if ever.
> > 
> > If your memory could be migrated, that would be some reason to use
> > filesystem page cache (because page migration happens to understand
> > that type of memory): but it cannot be migrated.
> 
> Migration support is in pipeline. It is part of TDX 1.5 [1]. 

And this isn't intended for just TDX (or SNP, or pKVM).  We're not _that_ far off
from being able to use UPM for "regular" VMs as a way to provide defense-in-depth
without having to take on the overhead of confidential VMs.  At that point,
migration and probably even swap are on the table.

> And swapping theoretically possible, but I'm not aware of any plans as of
> now.

Ya, I highly doubt confidential VMs will ever bother with swap.

> > I'm afraid of the special demands you may make of memory allocation
> > later on - surprised that huge pages are not mentioned already;
> > gigantic contiguous extents? secretmem removed from direct map?
> 
> The design allows for extension to hugetlbfs if needed. Combination of
> MFD_INACCESSIBLE | MFD_HUGETLB should route this way. There should be zero
> implications for shmem. It is going to be separate struct memfile_backing_store.
> 
> I'm not sure secretmem is a fit here as we want to extend MFD_INACCESSIBLE
> to be movable if platform supports it and secretmem is not migratable by
> design (without direct mapping fragmentations).

But secretmem _could_ be a fit.  If a use case wants to unmap guest private memory
from both userspace and the kernel then KVM should absolutely be able to support
that, but at the same time I don't want to have to update KVM to enable secretmem
(and I definitely don't want KVM poking into the directmap itself).

MFD_INACCESSIBLE should only say "this memory can't be mapped into userspace",
any other properties should be completely separate, e.g. the inability to migrate
pages is effective a restriction from KVM (acting on behalf of TDX/SNP), it's not
a fundamental property of MFD_INACCESSIBLE.

