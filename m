Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2DC868EEEF
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 13:26:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPjV0-0001jl-Fb; Wed, 08 Feb 2023 07:24:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@gmail.com>)
 id 1pPjUx-0001jL-LT
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 07:24:27 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@gmail.com>)
 id 1pPjUv-0002Ic-Cu
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 07:24:27 -0500
Received: by mail-pl1-x62a.google.com with SMTP id f6so251781pln.12
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 04:24:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Eww0bGHARNDro+m4qM4alVSDjm0iyW4r5Bw76JD/1d0=;
 b=UwDzNnVKuF/8eUzNV/aymL9+YcldSIDvjEKmYPNChw9tl/cW29Zad264smZsYHW8Qe
 3K+A+0a2pom4OZZbxKrjZjNutSB5FHodxpuAzzRchE6kaJcQ+5/lupwMD0s9d0crb4Sa
 E2m54aLLmCbokqcbW9FYc9zQr3zWZnOqTWppeVRy7ISY2XtRs4xPRjU02s++w/HKJlFl
 kg04wIBDr54WQd38+rYVn2umHbHARWKII1ybL4idTSuoiziEp1hZqzFvsUqhl59swDNr
 Yi7r6xIUpqFdwY449R217+sVKup3An5sYZWWhbEK3lIoH3KXY5u5fLczWnZjy4KAyIPb
 6UgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Eww0bGHARNDro+m4qM4alVSDjm0iyW4r5Bw76JD/1d0=;
 b=BKn/tJeOXz2JeimlONr7SeKyrJga5/1g6cXynanSf0/liWoZObI7ED1Z9XWjInT5Ig
 jgwBdM8ygCHypKNBN7Wo/uy4I4pR9GE1SLHMAFUEKL3KTTzwXSbJ06dwfg2gk8nMS/QN
 A8nwxbbfnZLXcQsEj28rdBDxygYD7YXj6FjtwfHL1p12bgdzZeeZbxyCBDmhJTIFD2LF
 Kjd2ihHm8E1U16hHTlikprVUqisYvrv65fxCqq55ahXUEURGQHCn30IkAJ96iBeD8LQG
 qeuVs+L57UAfwlGh712uVx2gN+YhWR07AJ0O1Ba9mi+YmZIZfOC912f8Bqb+dM1GeANX
 oe3w==
X-Gm-Message-State: AO0yUKU2RGAoga6aYQnIkl84Hl7aHSHQ2edWsBEvIRuZbFKvOljsUII+
 ymqD7tztn7JXjImuL4OC0QI=
X-Google-Smtp-Source: AK7set/EW3iOkejUiaBMrPtlYGHcnCsU5yA10F1vOHdYEM6oZRjOqRVew+hXFhEI9WsmU30z7oOHew==
X-Received: by 2002:a05:6a21:38c8:b0:be:bf28:b7da with SMTP id
 yk8-20020a056a2138c800b000bebf28b7damr5858337pzb.20.1675859063311; 
 Wed, 08 Feb 2023 04:24:23 -0800 (PST)
Received: from localhost ([192.55.54.55]) by smtp.gmail.com with ESMTPSA id
 p22-20020aa78616000000b0058d9b68042fsm1546476pfn.14.2023.02.08.04.24.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Feb 2023 04:24:22 -0800 (PST)
Date: Wed, 8 Feb 2023 04:24:21 -0800
From: Isaku Yamahata <isaku.yamahata@gmail.com>
To: Sean Christopherson <seanjc@google.com>
Cc: Isaku Yamahata <isaku.yamahata@gmail.com>,
 Chao Peng <chao.p.peng@linux.intel.com>, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-api@vger.kernel.org, linux-doc@vger.kernel.org,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Arnd Bergmann <arnd@arndb.de>, Naoya Horiguchi <naoya.horiguchi@nec.com>,
 Miaohe Lin <linmiaohe@huawei.com>, x86@kernel.org,
 "H . Peter Anvin" <hpa@zytor.com>, Hugh Dickins <hughd@google.com>,
 Jeff Layton <jlayton@kernel.org>,
 "J . Bruce Fields" <bfields@fieldses.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Shuah Khan <shuah@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Steven Price <steven.price@arm.com>,
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve <vannapurve@google.com>,
 Yu Zhang <yu.c.zhang@linux.intel.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 luto@kernel.org, jun.nakajima@intel.com, dave.hansen@intel.com,
 ak@linux.intel.com, david@redhat.com, aarcange@redhat.com,
 ddutile@redhat.com, dhildenb@redhat.com,
 Quentin Perret <qperret@google.com>, tabba@google.com,
 Michael Roth <michael.roth@amd.com>, mhocko@suse.com, wei.w.wang@intel.com
Subject: Re: [PATCH v10 0/9] KVM: mm: fd-based approach for supporting KVM
Message-ID: <20230208122421.GA4175971@ls.amr.corp.intel.com>
References: <20221202061347.1070246-1-chao.p.peng@linux.intel.com>
 <Y8H5Z3e4hZkFxAVS@google.com>
 <20230119111308.GC2976263@ls.amr.corp.intel.com>
 <Y8lg1G2lRIrI/hld@google.com>
 <20230119223704.GD2976263@ls.amr.corp.intel.com>
 <Y880FiYF7YCtsw/i@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y880FiYF7YCtsw/i@google.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=isaku.yamahata@gmail.com; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Jan 24, 2023 at 01:27:50AM +0000,
Sean Christopherson <seanjc@google.com> wrote:

> On Thu, Jan 19, 2023, Isaku Yamahata wrote:
> > On Thu, Jan 19, 2023 at 03:25:08PM +0000,
> > Sean Christopherson <seanjc@google.com> wrote:
> > 
> > > On Thu, Jan 19, 2023, Isaku Yamahata wrote:
> > > > On Sat, Jan 14, 2023 at 12:37:59AM +0000,
> > > > Sean Christopherson <seanjc@google.com> wrote:
> > > > 
> > > > > On Fri, Dec 02, 2022, Chao Peng wrote:
> > > > > > This patch series implements KVM guest private memory for confidential
> > > > > > computing scenarios like Intel TDX[1]. If a TDX host accesses
> > > > > > TDX-protected guest memory, machine check can happen which can further
> > > > > > crash the running host system, this is terrible for multi-tenant
> > > > > > configurations. The host accesses include those from KVM userspace like
> > > > > > QEMU. This series addresses KVM userspace induced crash by introducing
> > > > > > new mm and KVM interfaces so KVM userspace can still manage guest memory
> > > > > > via a fd-based approach, but it can never access the guest memory
> > > > > > content.
> > > > > > 
> > > > > > The patch series touches both core mm and KVM code. I appreciate
> > > > > > Andrew/Hugh and Paolo/Sean can review and pick these patches. Any other
> > > > > > reviews are always welcome.
> > > > > >   - 01: mm change, target for mm tree
> > > > > >   - 02-09: KVM change, target for KVM tree
> > > > > 
> > > > > A version with all of my feedback, plus reworked versions of Vishal's selftest,
> > > > > is available here:
> > > > > 
> > > > >   git@github.com:sean-jc/linux.git x86/upm_base_support
> > > > > 
> > > > > It compiles and passes the selftest, but it's otherwise barely tested.  There are
> > > > > a few todos (2 I think?) and many of the commits need changelogs, i.e. it's still
> > > > > a WIP.
> > > > > 
> > > > > As for next steps, can you (handwaving all of the TDX folks) take a look at what
> > > > > I pushed and see if there's anything horrifically broken, and that it still works
> > > > > for TDX?
> > > > > 
> > > > > Fuad (and pKVM folks) same ask for you with respect to pKVM.  Absolutely no rush
> > > > > (and I mean that).
> > > > > 
> > > > > On my side, the two things on my mind are (a) tests and (b) downstream dependencies
> > > > > (SEV and TDX).  For tests, I want to build a lists of tests that are required for
> > > > > merging so that the criteria for merging are clear, and so that if the list is large
> > > > > (haven't thought much yet), the work of writing and running tests can be distributed.
> > > > > 
> > > > > Regarding downstream dependencies, before this lands, I want to pull in all the
> > > > > TDX and SNP series and see how everything fits together.  Specifically, I want to
> > > > > make sure that we don't end up with a uAPI that necessitates ugly code, and that we
> > > > > don't miss an opportunity to make things simpler.  The patches in the SNP series to
> > > > > add "legacy" SEV support for UPM in particular made me slightly rethink some minor
> > > > > details.  Nothing remotely major, but something that needs attention since it'll
> > > > > be uAPI.
> > > > 
> > > > Although I'm still debuging with TDX KVM, I needed the following.
> > > > kvm_faultin_pfn() is called without mmu_lock held.  the race to change
> > > > private/shared is handled by mmu_seq.  Maybe dedicated function only for
> > > > kvm_faultin_pfn().
> > > 
> > > Gah, you're not on the other thread where this was discussed[*].  Simply deleting
> > > the lockdep assertion is safe, for guest types that rely on the attributes to
> > > define shared vs. private, KVM rechecks the attributes under the protection of
> > > mmu_seq.
> > > 
> > > I'll get a fixed version pushed out today.
> > > 
> > > [*] https://lore.kernel.org/all/Y8gpl+LwSuSgBFks@google.com
> > 
> > Now I have tdx kvm working. I've uploaded at the followings.
> > It's rebased to v6.2-rc3.
> >         git@github.com:yamahata/linux.git tdx/upm
> >         git@github.com:yamahata/qemu.git tdx/upm
> 
> And I finally got a working, building version updated and pushed out (again to):
> 
>   git@github.com:sean-jc/linux.git x86/upm_base_support
> 

Ok, I rebased TDX part to the updated branch.
        git@github.com:yamahata/linux.git tdx/upm
        git@github.com:yamahata/qemu.git tdx/upm

Now it's v6.2-rc7 based.
qemu needs more patches to avoid registering memory slot for SMM. 
-- 
Isaku Yamahata <isaku.yamahata@gmail.com>

