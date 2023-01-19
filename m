Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F28A673D74
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 16:26:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIWn1-0002qf-RG; Thu, 19 Jan 2023 10:25:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1pIWmz-0002qT-6W
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 10:25:18 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1pIWmw-0001TL-UW
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 10:25:16 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 z4-20020a17090a170400b00226d331390cso2100143pjd.5
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 07:25:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=u3x+gqjTmgbestDAk4Awmq54vOdmydIW5Pid7KApIj0=;
 b=mBCVF1D4CCb5Ux/a0sTklFD5Mi8L9pIXDGbMCkJlimD4PHSACap2p25+kVgwBgrsIq
 EvdnQ1DJdyozyD6i/NGQ9LHUxMYOj57ZDAvsSBtrXrWSIG9rE81ZQPLMflUW9tlr3kaQ
 W5HhRhzDrOZXVo2eJJX+pBBPi5F1VgqXmlz+Dn+5py/XCqnPsdSKBwTESeGVpPIz964i
 Y7hB+IGNBYCrP1QuYyMwMmClI1OOCW3cnNMzXyQEA2j3fMpJV5G+s3nKt4FHhRG/KAkL
 4FVfZGb2GwNGLwVQhykEPhQCdeJbS7eHn+w6UX0yqcdlwsdurSpSSE/duLw9iP7/BBnl
 1UDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u3x+gqjTmgbestDAk4Awmq54vOdmydIW5Pid7KApIj0=;
 b=tKEdlIxM4g4myDU1b6UzW5Z74y9kRp3qWEipD4tzl/1g33ZiZq86G1/Zin8bY+7rNz
 Qm1+IcramGfJgRiPhISwIDlv6ewsDCbsdpLS51u29SW+GxP8OTsxbt7wB1pSezgAVZQN
 KKyZBHHh+XbB/r0XSwjTALcX3hp1n62394Id3R+/qJ/I3q1ZWYjdkqxkazsbWAptPgmy
 irNv2V42+Ct0vEUUENt+KDL2Vka8r828/7OZjtRkO4J8YK+bMKSaXEEn4TzJGLXLx+G/
 vsxCl/e0gOaqp4BpFxM8r0KfMeYmHy8W6yBkIX2/C2BGNdI+/aT05MWPlwcbN3Ijtode
 X4ew==
X-Gm-Message-State: AFqh2kpIXqlp88pGj0y79KMKe6uIo41e++1kZc6jCS9MpWScHaUbV13u
 J5QORHZZL5Nq73wC4d8h9WKq+Q==
X-Google-Smtp-Source: AMrXdXuFbwGpoS/BOsR3GLdQjSETsa46BfhBRwIB416u+GXbq71Q0+uUKVzOwXl/a9TU4tZ66S2N/Q==
X-Received: by 2002:a05:6a20:ce43:b0:b8:c3c0:e7f7 with SMTP id
 id3-20020a056a20ce4300b000b8c3c0e7f7mr1187627pzb.1.1674141912349; 
 Thu, 19 Jan 2023 07:25:12 -0800 (PST)
Received: from google.com (7.104.168.34.bc.googleusercontent.com.
 [34.168.104.7]) by smtp.gmail.com with ESMTPSA id
 z16-20020a170903019000b001945339354asm5530181plg.197.2023.01.19.07.25.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jan 2023 07:25:11 -0800 (PST)
Date: Thu, 19 Jan 2023 15:25:08 +0000
From: Sean Christopherson <seanjc@google.com>
To: Isaku Yamahata <isaku.yamahata@gmail.com>
Cc: Chao Peng <chao.p.peng@linux.intel.com>, kvm@vger.kernel.org,
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
Message-ID: <Y8lg1G2lRIrI/hld@google.com>
References: <20221202061347.1070246-1-chao.p.peng@linux.intel.com>
 <Y8H5Z3e4hZkFxAVS@google.com>
 <20230119111308.GC2976263@ls.amr.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230119111308.GC2976263@ls.amr.corp.intel.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=seanjc@google.com; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Jan 19, 2023, Isaku Yamahata wrote:
> On Sat, Jan 14, 2023 at 12:37:59AM +0000,
> Sean Christopherson <seanjc@google.com> wrote:
> 
> > On Fri, Dec 02, 2022, Chao Peng wrote:
> > > This patch series implements KVM guest private memory for confidential
> > > computing scenarios like Intel TDX[1]. If a TDX host accesses
> > > TDX-protected guest memory, machine check can happen which can further
> > > crash the running host system, this is terrible for multi-tenant
> > > configurations. The host accesses include those from KVM userspace like
> > > QEMU. This series addresses KVM userspace induced crash by introducing
> > > new mm and KVM interfaces so KVM userspace can still manage guest memory
> > > via a fd-based approach, but it can never access the guest memory
> > > content.
> > > 
> > > The patch series touches both core mm and KVM code. I appreciate
> > > Andrew/Hugh and Paolo/Sean can review and pick these patches. Any other
> > > reviews are always welcome.
> > >   - 01: mm change, target for mm tree
> > >   - 02-09: KVM change, target for KVM tree
> > 
> > A version with all of my feedback, plus reworked versions of Vishal's selftest,
> > is available here:
> > 
> >   git@github.com:sean-jc/linux.git x86/upm_base_support
> > 
> > It compiles and passes the selftest, but it's otherwise barely tested.  There are
> > a few todos (2 I think?) and many of the commits need changelogs, i.e. it's still
> > a WIP.
> > 
> > As for next steps, can you (handwaving all of the TDX folks) take a look at what
> > I pushed and see if there's anything horrifically broken, and that it still works
> > for TDX?
> > 
> > Fuad (and pKVM folks) same ask for you with respect to pKVM.  Absolutely no rush
> > (and I mean that).
> > 
> > On my side, the two things on my mind are (a) tests and (b) downstream dependencies
> > (SEV and TDX).  For tests, I want to build a lists of tests that are required for
> > merging so that the criteria for merging are clear, and so that if the list is large
> > (haven't thought much yet), the work of writing and running tests can be distributed.
> > 
> > Regarding downstream dependencies, before this lands, I want to pull in all the
> > TDX and SNP series and see how everything fits together.  Specifically, I want to
> > make sure that we don't end up with a uAPI that necessitates ugly code, and that we
> > don't miss an opportunity to make things simpler.  The patches in the SNP series to
> > add "legacy" SEV support for UPM in particular made me slightly rethink some minor
> > details.  Nothing remotely major, but something that needs attention since it'll
> > be uAPI.
> 
> Although I'm still debuging with TDX KVM, I needed the following.
> kvm_faultin_pfn() is called without mmu_lock held.  the race to change
> private/shared is handled by mmu_seq.  Maybe dedicated function only for
> kvm_faultin_pfn().

Gah, you're not on the other thread where this was discussed[*].  Simply deleting
the lockdep assertion is safe, for guest types that rely on the attributes to
define shared vs. private, KVM rechecks the attributes under the protection of
mmu_seq.

I'll get a fixed version pushed out today.

[*] https://lore.kernel.org/all/Y8gpl+LwSuSgBFks@google.com

