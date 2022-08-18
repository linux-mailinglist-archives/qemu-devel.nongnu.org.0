Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C323B597E2F
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Aug 2022 07:45:13 +0200 (CEST)
Received: from localhost ([::1]:38778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOYLA-00053W-Bw
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 01:45:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hughd@google.com>) id 1oOYGk-00034R-Tq
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 01:40:42 -0400
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835]:40790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hughd@google.com>) id 1oOYGi-0007La-KW
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 01:40:38 -0400
Received: by mail-qt1-x835.google.com with SMTP id w28so429317qtc.7
 for <qemu-devel@nongnu.org>; Wed, 17 Aug 2022 22:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
 :date:from:to:cc;
 bh=c4YN6O08AaYBNToE2Um1itfC+MNp00Kd+ydM+T0W7ko=;
 b=IZg9hsqi4ssQ7fuSUIn7+iozROcN5MvemR4pWibTfFN+hfgd52YevwqpQv+32PXVtk
 tMKwa30Shd3IsjRcMLHYaAnJfl/UHy6ihTpMO5jxCGTVmCK8t9Q/fI2uh+GiuGiPBmQT
 hK2VF/OtxMLDbC/ytFlCkss/tfpwYlp5+ZwaMpzIEC+P6HlTmxeljMnHhkBQPeC4di9d
 T2u0GkCtVLOLm6jsVJ/3uxGfDAAj5JLx6gR6GsoWNUhw61Zp1rHlGIeQeHfYiVPTdajB
 O6i+/DSqdHmANKvtofbV85bdjkpgDV6mKg5DiLTieyv2rXLbetaIRb7kxG6T1BLHQnBp
 SkEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc;
 bh=c4YN6O08AaYBNToE2Um1itfC+MNp00Kd+ydM+T0W7ko=;
 b=nZ78OJhUd/xJQElgqpVHiwzlJWpSLKDVCCUaOkPLta2xGF2f23T7q4rD78i4sKHrtH
 uEWAWkZaFC7Xe0x04ia+Mwt1hsXkk1gcTpB06wBQ9YC4TJokhHnxK1HYfYNlP6HqJHIj
 gLWlg4kyuvGfm3WujwZpBR6mCEtl3PyZoxWtYWRxjD1Hj6kWgu3Tmx9NGnM5KOoSrEnc
 nExlNXo0XylXkJO2X7mG2VQXcRrrnh+r8fN/1eNBXCuOFJU41NuvYrwt2WeApHefb8wZ
 MoR5HVkyNuXarR5umLCycwW14cuTBYNBIJfEx6b/9B6kjrJpS5ABFLLpaqft1KyXUcKY
 XBaQ==
X-Gm-Message-State: ACgBeo3T5Tji0FP9OnUVhzcxFyIFnveVno63Vsq6OEJZJeC3p5nF7esR
 e8aH8NWlmF70IsGImEzKSc9h+w==
X-Google-Smtp-Source: AA6agR4Fw98jiMqwiSkyP6cz6JD/D6jUG7NFWUxowXwEedXtNOOsMzX1sD0rCuxeyRSGmm1fcXkVkw==
X-Received: by 2002:a05:622a:1745:b0:343:5e40:47b1 with SMTP id
 l5-20020a05622a174500b003435e4047b1mr1310585qtk.120.1660801233516; 
 Wed, 17 Aug 2022 22:40:33 -0700 (PDT)
Received: from ripple.attlocal.net
 (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
 by smtp.gmail.com with ESMTPSA id
 m1-20020a05620a290100b006b95f832aebsm787055qkp.96.2022.08.17.22.40.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Aug 2022 22:40:33 -0700 (PDT)
Date: Wed, 17 Aug 2022 22:40:12 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.anvils
To: Chao Peng <chao.p.peng@linux.intel.com>
cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org, 
 linux-doc@vger.kernel.org, qemu-devel@nongnu.org, 
 linux-kselftest@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, 
 Jonathan Corbet <corbet@lwn.net>, Sean Christopherson <seanjc@google.com>, 
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>, 
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, x86@kernel.org, 
 "H . Peter Anvin" <hpa@zytor.com>, Hugh Dickins <hughd@google.com>, 
 Jeff Layton <jlayton@kernel.org>, 
 "J . Bruce Fields" <bfields@fieldses.org>, 
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Steven Price <steven.price@arm.com>, 
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>, 
 Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve <vannapurve@google.com>, 
 Yu Zhang <yu.c.zhang@linux.intel.com>, 
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, luto@kernel.org, 
 jun.nakajima@intel.com, dave.hansen@intel.com, ak@linux.intel.com, 
 david@redhat.com, aarcange@redhat.com, ddutile@redhat.com, 
 dhildenb@redhat.com, Quentin Perret <qperret@google.com>, 
 Michael Roth <michael.roth@amd.com>, mhocko@suse.com, 
 Muchun Song <songmuchun@bytedance.com>, 
 "Gupta, Pankaj" <pankaj.gupta@amd.com>
Subject: Re: [PATCH v7 00/14] KVM: mm: fd-based approach for supporting KVM
 guest private memory
In-Reply-To: <20220706082016.2603916-1-chao.p.peng@linux.intel.com>
Message-ID: <ff5c5b97-acdf-9745-ebe5-c6609dd6322e@google.com>
References: <20220706082016.2603916-1-chao.p.peng@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=2607:f8b0:4864:20::835;
 envelope-from=hughd@google.com; helo=mail-qt1-x835.google.com
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

On Wed, 6 Jul 2022, Chao Peng wrote:
> This is the v7 of this series which tries to implement the fd-based KVM
> guest private memory.

Here at last are my reluctant thoughts on this patchset.

fd-based approach for supporting KVM guest private memory: fine.

Use or abuse of memfd and shmem.c: mistaken.

memfd_create() was an excellent way to put together the initial prototype.

But since then, TDX in particular has forced an effort into preventing
(by flags, seals, notifiers) almost everything that makes it shmem/tmpfs.

Are any of the shmem.c mods useful to existing users of shmem.c? No.
Is MFD_INACCESSIBLE useful or comprehensible to memfd_create() users? No.

What use do you have for a filesystem here?  Almost none.
IIUC, what you want is an fd through which QEMU can allocate kernel
memory, selectively free that memory, and communicate fd+offset+length
to KVM.  And perhaps an interface to initialize a little of that memory
from a template (presumably copied from a real file on disk somewhere).

You don't need shmem.c or a filesystem for that!

If your memory could be swapped, that would be enough of a good reason
to make use of shmem.c: but it cannot be swapped; and although there
are some references in the mailthreads to it perhaps being swappable
in future, I get the impression that will not happen soon if ever.

If your memory could be migrated, that would be some reason to use
filesystem page cache (because page migration happens to understand
that type of memory): but it cannot be migrated.

Some of these impressions may come from earlier iterations of the
patchset (v7 looks better in several ways than v5).  I am probably
underestimating the extent to which you have taken on board other
usages beyond TDX and SEV private memory, and rightly want to serve
them all with similar interfaces: perhaps there is enough justification
for shmem there, but I don't see it.  There was mention of userfaultfd
in one link: does that provide the justification for using shmem?

I'm afraid of the special demands you may make of memory allocation
later on - surprised that huge pages are not mentioned already;
gigantic contiguous extents? secretmem removed from direct map?

Here's what I would prefer, and imagine much easier for you to maintain;
but I'm no system designer, and may be misunderstanding throughout.

QEMU gets fd from opening /dev/kvm_something, uses ioctls (or perhaps
the fallocate syscall interface itself) to allocate and free the memory,
ioctl for initializing some of it too.  KVM in control of whether that
fd can be read or written or mmap'ed or whatever, no need to prevent it
in shmem.c, no need for flags, seals, notifications to and fro because
KVM is already in control and knows the history.  If shmem actually has
value, call into it underneath - somewhat like SysV SHM, and /dev/zero
mmap, and i915/gem make use of it underneath.  If shmem has nothing to
add, just allocate and free kernel memory directly, recorded in your
own xarray.

With that /dev/kvm_something subject to access controls and LSMs -
which I cannot find for memfd_create().  Full marks for including the
MFD_INACCESSIBLE manpage update, and for Cc'ing linux-api: but I'd
have expected some doubts from that direction already.

Hugh

