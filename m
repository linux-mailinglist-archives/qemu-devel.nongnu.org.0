Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E61578664
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 17:29:07 +0200 (CEST)
Received: from localhost ([::1]:39696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDSgD-0002c4-O3
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 11:29:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1oDSdu-0006xt-NM
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 11:26:42 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:41899)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1oDSds-0000n1-U2
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 11:26:42 -0400
Received: by mail-pl1-x62e.google.com with SMTP id j12so9329940plj.8
 for <qemu-devel@nongnu.org>; Mon, 18 Jul 2022 08:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Yt9oE0kz3TmH5FGxe6pEDCKgvRvBbOAA/ay7EMCbyEc=;
 b=Uff3ivfihawnDb3MVf5QlQ2jPMMai38C6bP4DepEErQNRp/Kc0gYVje6cUTN3mqgBa
 8e/i6cCNzLQRIo6XA6wMXV8Z208mTTLPAFevNS72jjatByWcRHbhRuXNC/PzoiNVlj0A
 G9sTexZ1nkBq8bHjUgqFI7BC1X8Fl1pf5ZeLZgS5QdWIqKzWIGGLSvIy/UwP2bykPTMR
 S0KDUdaMZvJIWXXz6SkPgu1okTxSS3xRe0n7hIARn0g4omp+/4Oqj1iwRKhLmSvwxOC1
 gHiiZYsDVdI0DS6/yoOU3d2IjW3kS0u9umKDtPmgnjR6gLoFlRAZm1r5c55NFjc5PcWF
 DbCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Yt9oE0kz3TmH5FGxe6pEDCKgvRvBbOAA/ay7EMCbyEc=;
 b=27NEz5qUXAPEOugY06/Dv42bPMiAHKlqBt3efsDjPqaIRcEPTidpRiwdjhEu3cWG/b
 RS94P5bFTEehcNjdiH5KEZq0v9w22VlNVlUGO5Mxjsh2J07mZrXgXRbhG2IGJ+62ZfgV
 5Sd73z7ulyUNrri1kqK65RIwKNnRehaO4+St9iyZ6sH59W8/WPW7QBCKEWs2awF3qRik
 1lVecvd6EibGpoIJk+YtGEUa+LuSWtVepaDuEJ+CmOuz6OLRd1drBbKzc/leOCEk/HSe
 2iaX1yFnszjbspse7mMgFuY4qq1CDfTp8Zqkm4fbe0TcB78l9ZBwhtZJEaUDrPppCGJN
 lUuQ==
X-Gm-Message-State: AJIora89++WmBwNn5kxWj2NSEGqEgc/rY3Yaiodx53cOPjHZMLVF+KIa
 d03C2Mgvy36ApbtYuPumcQflig==
X-Google-Smtp-Source: AGRyM1vgtGvBYkyh0ni5e/mqVLrnNK1+XKLqZyiT0UcMq2k28Wiwo9nZP6ot9un6Y/cxDUraL3c4cg==
X-Received: by 2002:a17:903:1208:b0:16b:81f6:e992 with SMTP id
 l8-20020a170903120800b0016b81f6e992mr29233754plh.55.1658157998529; 
 Mon, 18 Jul 2022 08:26:38 -0700 (PDT)
Received: from google.com (123.65.230.35.bc.googleusercontent.com.
 [35.230.65.123]) by smtp.gmail.com with ESMTPSA id
 h14-20020a63e14e000000b004161b3c3388sm8342392pgk.26.2022.07.18.08.26.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jul 2022 08:26:38 -0700 (PDT)
Date: Mon, 18 Jul 2022 15:26:34 +0000
From: Sean Christopherson <seanjc@google.com>
To: Chao Peng <chao.p.peng@linux.intel.com>
Cc: "Gupta, Pankaj" <pankaj.gupta@amd.com>, kvm@vger.kernel.org,
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
 ak@linux.intel.com, david@redhat.com, aarcange@redhat.com,
 ddutile@redhat.com, dhildenb@redhat.com,
 Quentin Perret <qperret@google.com>,
 Michael Roth <michael.roth@amd.com>, mhocko@suse.com,
 Muchun Song <songmuchun@bytedance.com>
Subject: Re: [PATCH v7 07/14] KVM: Use gfn instead of hva for
 mmu_notifier_retry
Message-ID: <YtV7qpYZoT6jIKHQ@google.com>
References: <20220706082016.2603916-1-chao.p.peng@linux.intel.com>
 <20220706082016.2603916-8-chao.p.peng@linux.intel.com>
 <d480a850-601b-cda2-b671-04d839c98429@amd.com>
 <20220718132950.GA38104@chaop.bj.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220718132950.GA38104@chaop.bj.intel.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=seanjc@google.com; helo=mail-pl1-x62e.google.com
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

On Mon, Jul 18, 2022, Chao Peng wrote:
> On Fri, Jul 15, 2022 at 01:36:15PM +0200, Gupta, Pankaj wrote:
> > > Currently in mmu_notifier validate path, hva range is recorded and then
> > > checked in the mmu_notifier_retry_hva() from page fault path. However
> > > for the to be introduced private memory, a page fault may not have a hva
> > 
> > As this patch appeared in v7, just wondering did you see an actual bug
> > because of it? And not having corresponding 'hva' occurs only with private
> > memory because its not mapped to host userspace?
> 
> The addressed problem is not new in this version, previous versions I
> also had code to handle it (just in different way). But the problem is:
> mmu_notifier/memfile_notifier may be in the progress of invalidating a
> pfn that obtained earlier in the page fault handler, when happens, we
> should retry the fault. In v6 I used global mmu_notifier_retry() for
> memfile_notifier but that can block unrelated mmu_notifer invalidation
> which has hva range specified.
> 
> Sean gave a comment at https://lkml.org/lkml/2022/6/17/1001 to separate
> memfile_notifier from mmu_notifier but during the implementation I
> realized we actually can reuse the same code for shared and private
> memory if both using gpa range and that can simplify the code handling
> in kvm_zap_gfn_range and some other code (e.g. we don't need two
> versions for memfile_notifier/mmu_notifier).

This should work, though I'm undecided as to whether or not it's a good idea.  KVM
allows aliasing multiple gfns to a single hva, and so using the gfn could result
in a much larger range being rejected given the simplistic algorithm for handling
multiple ranges in kvm_inc_notifier_count().  But I assume such aliasing is uncommon,
so I'm not sure it's worth optimizing for.

> Adding gpa range for private memory invalidation also relieves the
> above blocking issue between private memory page fault and mmu_notifier.

