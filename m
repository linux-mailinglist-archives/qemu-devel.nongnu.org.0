Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54BE158EE9A
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 16:41:36 +0200 (CEST)
Received: from localhost ([::1]:59674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLmtr-0007ED-0O
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 10:41:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1oLmrN-0004iV-CN
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 10:39:01 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:53859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1oLmrB-0002ET-SK
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 10:38:51 -0400
Received: by mail-pj1-x102a.google.com with SMTP id pm17so14942755pjb.3
 for <qemu-devel@nongnu.org>; Wed, 10 Aug 2022 07:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc;
 bh=Ypn04yBcDr+ITRCaJvIIISj7ZAHB/5ZItGV+XVBLIJA=;
 b=Ib7E12JPGES3Yh+/p5apucZMNbtgTR05tdzqgOSPvuWuFN40kpN7Y2iwzMoGGvkAZp
 2k6pDQ5Dx3ZoMZNesLC3dNSPLtDlj6mFmyXD/hvHO01hHIZDaQ/OR4FrBHZGfdNO21hw
 c0Xp2gA8KqMlXerNeIQmKwkXlI8cJezWd5Q2pb36QkpOhC2IVatzB9PBUsADaiqPqXP2
 sLaur3TZOTh5i5zvWHRfjklZ2CiHLPAi2y2CsipxjSxRi1GYU+xZki37dsLL1ac5Lqxt
 CFqKYU6lzhVRJu4rIj89PYEW8X9BB+MXX2MHW1+4lVn1QpHvQgzsA9lEsg8UN0bQzIeg
 NyJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=Ypn04yBcDr+ITRCaJvIIISj7ZAHB/5ZItGV+XVBLIJA=;
 b=FbomcEpVJVmqzK5EuCE2CTHWwsQjZtNV/C6tOwb3KoMdTqKvD8MmNn4GuLpmVRIqCK
 xxfq8yJTCDtibmJv92clW1hEAGBtjtuxGwPomDUXKb0taKuHoLTbXtW5jFnSL0CpnwKA
 M70IWtCA8DWlS7vp/1PMhD9tDbxRbx8YdmCtN43UqRiSuAam7vsYfLbT5Gm1lG61fLvd
 qcFsP2MQ8p/u/FjcXO+erwzUdpb44rCIwN0vmhCzWOjXYrSp422Tn14xoyam0NcSIfG2
 NmYYaAFGijPlnq6+ilUi5AbxPKO1u3zJVweEBjiY2QD/uKloKKx/53PbSdgJuURihGW4
 fs6A==
X-Gm-Message-State: ACgBeo0N3jxXzfQmGrSdXlzhsZPOtz7ZWSYXkOygM1NszTcw2jeSizpM
 5W8Zw4+BU5ECYPdOgh7oMYQfsw==
X-Google-Smtp-Source: AA6agR4Cvm3nfmT646uuzkbDloN+L+b0YWWySRf26lyByFiwirk1nGGGgDmPcfMs3KzFCTJQbDMGGw==
X-Received: by 2002:a17:90b:4c0f:b0:1f5:179a:28df with SMTP id
 na15-20020a17090b4c0f00b001f5179a28dfmr4088508pjb.42.1660142327422; 
 Wed, 10 Aug 2022 07:38:47 -0700 (PDT)
Received: from google.com (7.104.168.34.bc.googleusercontent.com.
 [34.168.104.7]) by smtp.gmail.com with ESMTPSA id
 z125-20020a623383000000b0052c92329115sm2033721pfz.218.2022.08.10.07.38.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 07:38:47 -0700 (PDT)
Date: Wed, 10 Aug 2022 14:38:43 +0000
From: Sean Christopherson <seanjc@google.com>
To: David Hildenbrand <david@redhat.com>
Cc: Chao Peng <chao.p.peng@linux.intel.com>, kvm@vger.kernel.org,
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
 Hugh Dickins <hughd@google.com>, Jeff Layton <jlayton@kernel.org>,
 "J . Bruce Fields" <bfields@fieldses.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Shuah Khan <shuah@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Steven Price <steven.price@arm.com>,
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve <vannapurve@google.com>,
 Yu Zhang <yu.c.zhang@linux.intel.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 luto@kernel.org, jun.nakajima@intel.com, dave.hansen@intel.com,
 ak@linux.intel.com, aarcange@redhat.com, ddutile@redhat.com,
 dhildenb@redhat.com, Quentin Perret <qperret@google.com>,
 Michael Roth <michael.roth@amd.com>, mhocko@suse.com,
 Muchun Song <songmuchun@bytedance.com>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH v7 03/14] mm: Introduce memfile_notifier
Message-ID: <YvPC87FMgF7uac7z@google.com>
References: <20220706082016.2603916-1-chao.p.peng@linux.intel.com>
 <20220706082016.2603916-4-chao.p.peng@linux.intel.com>
 <13394075-fca0-6f2b-92a2-f1291fcec9a3@redhat.com>
 <20220810092232.GC862421@chaop.bj.intel.com>
 <00f1aa03-bc82-ffce-569b-e2d5c459992c@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <00f1aa03-bc82-ffce-569b-e2d5c459992c@redhat.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=seanjc@google.com; helo=mail-pj1-x102a.google.com
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

+Will

On Wed, Aug 10, 2022, David Hildenbrand wrote:
> On 10.08.22 11:22, Chao Peng wrote:
> > On Fri, Aug 05, 2022 at 03:22:58PM +0200, David Hildenbrand wrote:
> >> On 06.07.22 10:20, Chao Peng wrote:
> >>> This patch introduces memfile_notifier facility so existing memory file
> >>> subsystems (e.g. tmpfs/hugetlbfs) can provide memory pages to allow a
> >>> third kernel component to make use of memory bookmarked in the memory
> >>> file and gets notified when the pages in the memory file become
> >>> invalidated.
> >>
> >> Stupid question, but why is this called "memfile_notifier" and not
> >> "memfd_notifier". We're only dealing with memfd's after all ... which
> >> are anonymous files essentially. Or what am I missing? Are there any
> >> other plans for fs than plain memfd support that I am not aware of?
> > 
> > There were some discussions on this in v3.
> >   https://lkml.org/lkml/2021/12/28/484
> > Sean commented it's OK to abstract it from memfd but he also wants the
> > kAPI (name) should not bind to memfd to make room for future non-memfd
> > usages.
> 
> Sorry, but how is "memfile" any better? memfd abstracted to memfile?! :)

FWIW, I don't really like the memfile name either.

> I understand Sean's suggestion about abstracting, but if the new name
> makes it harder to grasp and there isn't really an alternative to memfd
> in sight, I'm not so sure I enjoy the tried abstraction here.

ARM's pKVM implementation is potentially (hopefully) going to switch to this API
(as a consumer) sooner than later.  If they anticipate being able to use memfd,
then there's unlikely to be a second backing type any time soon.

Quentin, Will?
 
> Otherwise we'd have to get creative now and discuss something like
> "file_population_notifer" or "mapping_population_notifer" and I am not
> sure that our time is well spent doing so right now.
> 
> ... as this is kernel-internal, we can always adjust the name as we
> please later, once we *actually* now what the abstraction should be.
> Until then I'd suggest to KIS and soft-glue this to memfd.
> 
> Or am I missing something important?

I don't think you're missing anything.  I'd still prefer a name that doesn't couple
KVM to memfd, but it's not a sticking point, and I've never been able to come up
with a better name...

With a little bit of cleverness I think we can keep the coupling in KVM to a
minimum, which is what I really care about.

