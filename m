Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E665874E8
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 02:52:24 +0200 (CEST)
Received: from localhost ([::1]:37686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIg90-0006g9-88
	for lists+qemu-devel@lfdr.de; Mon, 01 Aug 2022 20:52:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1oIg69-0005B9-E4
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 20:49:25 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:43965)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1oIg67-0000IS-9g
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 20:49:25 -0400
Received: by mail-pl1-x62c.google.com with SMTP id y15so11977732plp.10
 for <qemu-devel@nongnu.org>; Mon, 01 Aug 2022 17:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc;
 bh=fYrbrS8yv9H/RvUOOyuHQrSi1loIQEHWMZ/8CZZ3RXc=;
 b=gO0RsnmpomRU40aaGuswU5stzk1dV4NDc3pxJ6zSc9zcDzvqVHJEsaTU46TCCnnEDM
 VIM2Q44ozglwDHGobO6GUhmj4taro6Si7I5uJlkeFvBIDIYNgCZMO9DNDT/Fr4nlOf8j
 FKfGYbL8I576CFY482PM+hUdjOGAEqqzJXYVPR8s7R687SE/sN2YRJ0jIEeCCsAk1y6f
 DVn0KhP6WN2ELlJd8pOY+UaucR7IsHDggLN+juJdfB22mcm/n8UKO1ldaQKA7IYzA1tt
 upHroORCIR8C9toovIJlWRMZF59BNixyWef3Z9805sHHgrSaCK+JCYEP+TBUe8H+AEPS
 tz/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=fYrbrS8yv9H/RvUOOyuHQrSi1loIQEHWMZ/8CZZ3RXc=;
 b=aVoltoeSNdMhTS4Owq0n9dD7Tdat9mMdKeDpJxhI7I/p31t4jzC+yDp8ZlGI3mgFfm
 a94Za7cpmD0ysucrN3JKQKbD9Nyu8GqtgLD2/PXKfW7jewciIlkUPBuN4c/DRAGhHJmD
 UT6prL5QwxLsTpbri2WQbdjgMtfT76hdJ1ks4hyWmC879GQmm2oXv2aPRZzI5O6G4GUT
 ZzoS8rbZXYDpvVPnD2TbbfzVG/uXgZfZWSLdrySHz1aLGudUG2BHcNw01FB+JJWORNEy
 Ki+JSqRlBzNmVyPgjm7krSDdLKH5nRDb6fq8l3p/uao/r6eAs+OD4SZv3cLzDhZm7R1V
 9n8w==
X-Gm-Message-State: ACgBeo20qokWMdElOUzkda3GKccWSdIwr25JOFEF/KPhrRC0p6vkT/JU
 GVztFMKUbzU04VOY4xxFXYI0sQ==
X-Google-Smtp-Source: AA6agR5NFcyJ/Eqf8Y9BodOFj30Va8ngMe4AFfAM05tfz+rj1jrOYkiljXtYcYQIlQH1KwHfCRTqmw==
X-Received: by 2002:a17:903:1209:b0:16c:ece7:f68b with SMTP id
 l9-20020a170903120900b0016cece7f68bmr19190691plh.112.1659401359068; 
 Mon, 01 Aug 2022 17:49:19 -0700 (PDT)
Received: from google.com (7.104.168.34.bc.googleusercontent.com.
 [34.168.104.7]) by smtp.gmail.com with ESMTPSA id
 o1-20020a170902d4c100b0016c4147e48asm5966869plg.219.2022.08.01.17.49.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Aug 2022 17:49:18 -0700 (PDT)
Date: Tue, 2 Aug 2022 00:49:14 +0000
From: Sean Christopherson <seanjc@google.com>
To: Chao Peng <chao.p.peng@linux.intel.com>
Cc: Wei Wang <wei.w.wang@linux.intel.com>,
 "Gupta, Pankaj" <pankaj.gupta@amd.com>, kvm@vger.kernel.org,
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
Subject: Re: [PATCH v7 11/14] KVM: Register/unregister the guest private
 memory regions
Message-ID: <Yuh0ikhoh+tCK6VW@google.com>
References: <20220719140843.GA84779@chaop.bj.intel.com>
 <36e671d2-6b95-8e4f-c2ac-fee4b2670c6e@amd.com>
 <20220720150706.GB124133@chaop.bj.intel.com>
 <d0fd229d-afa6-c66d-3e55-09ac5877453e@amd.com>
 <YtgrkXqP/GIi9ujZ@google.com>
 <45ae9f57-d595-f202-abb5-26a03a2ca131@linux.intel.com>
 <20220721092906.GA153288@chaop.bj.intel.com>
 <YtmT2irvgInX1kPp@google.com>
 <20220725130417.GA304216@chaop.bj.intel.com>
 <YuQ64RgWqdoAAGdY@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YuQ64RgWqdoAAGdY@google.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=seanjc@google.com; helo=mail-pl1-x62c.google.com
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

On Fri, Jul 29, 2022, Sean Christopherson wrote:
> On Mon, Jul 25, 2022, Chao Peng wrote:
> > On Thu, Jul 21, 2022 at 05:58:50PM +0000, Sean Christopherson wrote:
> > > On Thu, Jul 21, 2022, Chao Peng wrote:
> > > > On Thu, Jul 21, 2022 at 03:34:59PM +0800, Wei Wang wrote:
> > > > > 
> > > > > 
> > > > > On 7/21/22 00:21, Sean Christopherson wrote:
> > > > > Maybe you could tag it with cgs for all the confidential guest support
> > > > > related stuff: e.g. kvm_vm_ioctl_set_cgs_mem()
> > > > > 
> > > > > bool is_private = ioctl == KVM_MEMORY_ENCRYPT_REG_REGION;
> > > > > ...
> > > > > kvm_vm_ioctl_set_cgs_mem(, is_private)
> > > > 
> > > > If we plan to widely use such abbr. through KVM (e.g. it's well known),
> > > > I'm fine.
> > > 
> > > I'd prefer to stay away from "confidential guest", and away from any VM-scoped
> > > name for that matter.  User-unmappable memmory has use cases beyond hiding guest
> > > state from the host, e.g. userspace could use inaccessible/unmappable memory to
> > > harden itself against unintentional access to guest memory.
> > > 
> > > > I actually use mem_attr in patch: https://lkml.org/lkml/2022/7/20/610
> > > > But I also don't quite like it, it's so generic and sounds say nothing.
> > > > 
> > > > But I do want a name can cover future usages other than just 
> > > > private/shared (pKVM for example may have a third state).
> > > 
> > > I don't think there can be a third top-level state.  Memory is either private to
> > > the guest or it's not.  There can be sub-states, e.g. memory could be selectively
> > > shared or encrypted with a different key, in which case we'd need metadata to
> > > track that state.
> > > 
> > > Though that begs the question of whether or not private_fd is the correct
> > > terminology.  E.g. if guest memory is backed by a memfd that can't be mapped by
> > > userspace (currently F_SEAL_INACCESSIBLE), but something else in the kernel plugs
> > > that memory into a device or another VM, then arguably that memory is shared,
> > > especially the multi-VM scenario.
> > > 
> > > For TDX and SNP "private vs. shared" is likely the correct terminology given the
> > > current specs, but for generic KVM it's probably better to align with whatever
> > > terminology is used for memfd.  "inaccessible_fd" and "user_inaccessible_fd" are
> > > a bit odd since the fd itself is accesible.
> > > 
> > > What about "user_unmappable"?  E.g.
> > > 
> > >   F_SEAL_USER_UNMAPPABLE, MFD_USER_UNMAPPABLE, KVM_HAS_USER_UNMAPPABLE_MEMORY,
> > >   MEMFILE_F_USER_INACCESSIBLE, user_unmappable_fd, etc...
> > 
> > For KVM I also think user_unmappable looks better than 'private', e.g.
> > user_unmappable_fd/KVM_HAS_USER_UNMAPPABLE_MEMORY sounds more
> > appropriate names. For memfd however, I don't feel that strong to change
> > it from current 'inaccessible' to 'user_unmappable', one of the reason
> > is it's not just about unmappable, but actually also inaccessible
> > through direct ioctls like read()/write().
> 
> Heh, I _knew_ there had to be a catch.  I agree that INACCESSIBLE is better for
> memfd.

Thought about this some more...

I think we should avoid UNMAPPABLE even on the KVM side of things for the core
memslots functionality and instead be very literal, e.g.

	KVM_HAS_FD_BASED_MEMSLOTS
	KVM_MEM_FD_VALID

We'll still need KVM_HAS_USER_UNMAPPABLE_MEMORY, but it won't be tied directly to
the memslot.  Decoupling the two thingis will require a bit of extra work, but the
code impact should be quite small, e.g. explicitly query and propagate
MEMFILE_F_USER_INACCESSIBLE to kvm_memory_slot to track if a memslot can be private.
And unless I'm missing something, it won't require an additional memslot flag.
The biggest oddity (if we don't also add KVM_MEM_PRIVATE) is that KVM would
effectively ignore the hva for fd-based memslots for VM types that don't support
private memory, i.e. userspace can't opt out of using the fd-based backing, but that
doesn't seem like a deal breaker.

Decoupling private memory from fd-based memslots will allow using fd-based memslots
for backing VMs even if the memory is user mappable, which opens up potentially
interesting use cases.  It would also allow testing some parts of fd-based memslots
with existing VMs.

The big advantage of KVM's hva-based memslots is that KVM doesn't care what's backing
a memslot, and so (in thoery) enabling new backing stores for KVM is free.  It's not
always free, but at this point I think we've eliminated most of the hiccups, e.g. x86's
MMU should no longer require additional enlightenment to support huge pages for new
backing types.

On the flip-side, a big disadvantage of hva-based memslots is that KVM doesn't
_know_ what's backing a memslot.  This is one of the major reasons, if not _the_
main reason at this point, why KVM binds a VM to a single virtual address space.
Running with different hva=>pfn mappings would either be completely unsafe or
prohibitively expensive (nearly impossible?) to ensure.

With fd-based memslots, KVM essentially binds a memslot directly to the backing
store.  This allows KVM to do a "deep" comparison of a memslot between two address
spaces simply by checking that the backing store is the same.  For intra-host/copyless
migration (to upgrade the userspace VMM), being able to do a deep comparison would
theoretically allow transferring KVM's page tables between VMs instead of forcing
the target VM to rebuild the page tables.  There are memcg complications (and probably
many others) for transferring page tables, but I'm pretty sure it could work.

I don't have a concrete use case (this is a recent idea on my end), but since we're
already adding fd-based memory, I can't think of a good reason not make it more generic
for not much extra cost.  And there are definitely classes of VMs for which fd-based
memory would Just Work, e.g. large VMs that are never oversubscribed on memory don't
need to support reclaim, so the fact that fd-based memslots won't support page aging
(among other things) right away is a non-issue.

