Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A3359E6E2
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 18:20:34 +0200 (CEST)
Received: from localhost ([::1]:51800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQWdk-0003AM-Mu
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 12:20:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1oQWPI-0004Lr-N4
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 12:05:37 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:42700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1oQWPH-0006jR-0l
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 12:05:36 -0400
Received: by mail-pf1-x42a.google.com with SMTP id y15so9908561pfr.9
 for <qemu-devel@nongnu.org>; Tue, 23 Aug 2022 09:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc;
 bh=aVBt+IuocN3gZGMsPNsv72g8OF66w1EEamrVZjnB+J4=;
 b=aHRlHO4kNIRNDNrpKgB2QM9cSMZjQBb6u4l59Y4E0tZW/BrvBnqckZTcn9cz3SUw3D
 igHUCLBokcR+QGB8XUc1cJbRn7hVuyKGyfeg1tfWEOZHpP64tT9cUzSSzx1Y0vgX+Uyv
 RPdN051ayBxF8NbSnhZI7UkDJIxJC2b9PXw94OGmVsv1/XB2K1qoCbLTnhTe5HqVT1w+
 uDjWiexbtDjcheCp9qg/+R4RDyAtHxBooBSO8W1phCNDG09PvGpKx4gmxB38OKo5Au+a
 wQuvSmBbg3eLIxGH8V0BVxy3Pbhs0aKjR4E9VsFcpOdyvMRpUtUfAdi6lWLpFgc21aKV
 eFRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=aVBt+IuocN3gZGMsPNsv72g8OF66w1EEamrVZjnB+J4=;
 b=kDJhmr5lw56MHhrKTM/2j5lnAvp+IiuFzOlvd0QG79F152LTTG2uofNSySfhs3AAYa
 oIIPxFtlimyIoUjyCkmTCLqu72YjVaV7JEEJvcDcbwhdtqkjjZyHMJxW97SB/CqsZ6Po
 4PcgE0v603Bo3DN2Sx9+06N2P8SxAcF8Z1AJ/sSRxNdEFSZB1jhDPbwONvYTtwhlXRbp
 VFn0jsKppVC8WmByROeX4B9dWNPa8d28JoIsm3cY7RDunRYHnEkmYVSvuYlxh8JBuSTZ
 Y1uE5q8L1rUTdvic9mMH+cjJBf39IFYP+AbYofBBDtJbIQ2xrlDpAb2Qu9Z7IsYULsrR
 we/A==
X-Gm-Message-State: ACgBeo37Jb+oy3CfIQXDmrkkE0APRCEWUYmKxHxdRWhC7o6GAbjyFPCh
 tgGdgJ1ZoiZOyzMZQ18fb9mJYQ==
X-Google-Smtp-Source: AA6agR7U2euXK2YAHsShhKay0KkYkkaAjkpwjugKPMjrIdRBiwJTOXGIGRCd9tb8zWpXTJzh2djP8w==
X-Received: by 2002:a63:1c11:0:b0:41d:89d5:8ef0 with SMTP id
 c17-20020a631c11000000b0041d89d58ef0mr21289304pgc.403.1661270731660; 
 Tue, 23 Aug 2022 09:05:31 -0700 (PDT)
Received: from google.com (7.104.168.34.bc.googleusercontent.com.
 [34.168.104.7]) by smtp.gmail.com with ESMTPSA id
 z27-20020aa7959b000000b00536ede9e344sm2384650pfj.14.2022.08.23.09.05.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Aug 2022 09:05:31 -0700 (PDT)
Date: Tue, 23 Aug 2022 16:05:27 +0000
From: Sean Christopherson <seanjc@google.com>
To: David Hildenbrand <david@redhat.com>
Cc: Hugh Dickins <hughd@google.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
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
 aarcange@redhat.com, ddutile@redhat.com, dhildenb@redhat.com,
 Quentin Perret <qperret@google.com>,
 Michael Roth <michael.roth@amd.com>, mhocko@suse.com,
 Muchun Song <songmuchun@bytedance.com>,
 "Gupta, Pankaj" <pankaj.gupta@amd.com>
Subject: Re: [PATCH v7 00/14] KVM: mm: fd-based approach for supporting KVM
 guest private memory
Message-ID: <YwT6x2g9jcMH60LI@google.com>
References: <20220706082016.2603916-1-chao.p.peng@linux.intel.com>
 <ff5c5b97-acdf-9745-ebe5-c6609dd6322e@google.com>
 <20220818132421.6xmjqduempmxnnu2@box> <Yv7XTON3MwuC1Q3U@google.com>
 <226ab26d-9aa8-dce2-c7f0-9e3f5b65b63@google.com>
 <b2743a3a-a1b4-2d2e-98be-87b58ad387cf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b2743a3a-a1b4-2d2e-98be-87b58ad387cf@redhat.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=seanjc@google.com; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -144
X-Spam_score: -14.5
X-Spam_bar: --------------
X-Spam_report: (-14.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, FSL_HELO_FAKE=3.096, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
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

On Tue, Aug 23, 2022, David Hildenbrand wrote:
> On 19.08.22 05:38, Hugh Dickins wrote:
> > On Fri, 19 Aug 2022, Sean Christopherson wrote:
> >> On Thu, Aug 18, 2022, Kirill A . Shutemov wrote:
> >>> On Wed, Aug 17, 2022 at 10:40:12PM -0700, Hugh Dickins wrote:
> >>>> On Wed, 6 Jul 2022, Chao Peng wrote:
> >>>> But since then, TDX in particular has forced an effort into preventing
> >>>> (by flags, seals, notifiers) almost everything that makes it shmem/tmpfs.
> >>>>
> >>>> Are any of the shmem.c mods useful to existing users of shmem.c? No.
> >>>> Is MFD_INACCESSIBLE useful or comprehensible to memfd_create() users? No.
> >>
> >> But QEMU and other VMMs are users of shmem and memfd.  The new features certainly
> >> aren't useful for _all_ existing users, but I don't think it's fair to say that
> >> they're not useful for _any_ existing users.
> > 
> > Okay, I stand corrected: there exist some users of memfd_create()
> > who will also have use for "INACCESSIBLE" memory.
> 
> As raised in reply to the relevant patch, I'm not sure if we really have
> to/want to expose MFD_INACCESSIBLE to user space. I feel like this is a
> requirement of specific memfd_notifer (memfile_notifier) implementations
> -- such as TDX that will convert the memory and MCE-kill the machine on
> ordinary write access. We might be able to set/enforce this when
> registering a notifier internally instead, and fail notifier
> registration if a condition isn't met (e.g., existing mmap).
>
> So I'd be curious, which other users of shmem/memfd would benefit from
> (MMU)-"INACCESSIBLE" memory obtained via memfd_create()?

I agree that there's no need to expose the inaccessible behavior via uAPI.  Making
it a kernel-internal thing that's negotiated/resolved when KVM binds to the fd
would align INACCESSIBLE with the UNMOVABLE and UNRECLAIMABLE flags (and any other
flags that get added in the future).

AFAICT, the user-visible flag is a holdover from the early RFCs and doesn't provide
any unique functionality.

If we go that route, we might want to have shmem/memfd require INACCESSIBLE to be
set for the initial implementation.  I.e. disallow binding without INACCESSIBLE
until there's a use case.

