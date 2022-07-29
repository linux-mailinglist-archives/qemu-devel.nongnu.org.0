Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C165855D0
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jul 2022 21:56:53 +0200 (CEST)
Received: from localhost ([::1]:41248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHW6N-0007EF-GG
	for lists+qemu-devel@lfdr.de; Fri, 29 Jul 2022 15:56:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1oHW3s-00055r-RD
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 15:54:18 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:36498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1oHW3r-0005SA-4r
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 15:54:16 -0400
Received: by mail-pf1-x430.google.com with SMTP id g12so5524053pfb.3
 for <qemu-devel@nongnu.org>; Fri, 29 Jul 2022 12:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc;
 bh=1EqMgjnyhc4WRsC/xGOtxHSz8izgvjHhHYaPjqj6I7s=;
 b=HLB5f+s+ntjkI17+2jp2WegSk0Ip1A1bt9XeV1pSaqeITXDi12YjSrxcIgZXHrMp59
 UrkPVO6LhvZWQkYzIfyeY3oLoZKArVvjkRclfgyghVmxV8STbNsdGoFjh3pa12HmBMQl
 ZtFdRossZIy8OZmwKbexSgbozQy0t+BsKx3y85dydYJVmRQ0UfauaYy+YRuqV7R2JVVT
 Pwmk0Ug1XScP+SUhKwaLYZwcdNCu+i+DjGxkiIBDdXbnnPgK/7oaJTnfrjbSGXfZjqAn
 +yrErgsE08MPBUhSKuwXkcKKsySktnGs6hlT7NDtjtcK0DoVRdqMsEYM6+1flcqF3Q78
 34ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=1EqMgjnyhc4WRsC/xGOtxHSz8izgvjHhHYaPjqj6I7s=;
 b=7MsOFxBN6+Rs+dar3xjcdGUrwa47U/E+hlcLC/cPZQ+1HOq3F+oi9L6F+OBDndnSpQ
 mjfmG3j41Y95JYiPDq3M50v4UeLkOYczgdbUILZxfrIHGBBl4rPU4vfCbJNUljB6aj3n
 ZxmcYdv4DjO/HfJV/+5AveHMoHXqRuVxXRCGjWvZ4mFjwVRDm7BpJT+kOShFgKm0VsDZ
 eVGNVTotIG3TL4P5MmU6kWaRK2mAAuZv51WCdjJH4BTxNIAVJWyPG/37E5zK2RF3IAXC
 HrY5BHf+QdOf8GgadrksTZ6wxZKQE0kGlGzrlyqPdTVBO6r5rwUbU8ESH1A7alG4uHDl
 GIFQ==
X-Gm-Message-State: AJIora+4Ypw6K9Pqby87tVdjT6bTWeChaVV2FYjdSkaD8f7si03FTirP
 oYMPCZxV2a6rUzY9GWjQtfMXPbBdA+7/4Q==
X-Google-Smtp-Source: AGRyM1sksopPXKQjAD2apX+GAbdmTP47VUrtEH0MoOErsIDT2svJe3Hlaz8mC5fBxKu7A6Sbx+StHA==
X-Received: by 2002:a05:6a00:1d26:b0:52b:f8ab:6265 with SMTP id
 a38-20020a056a001d2600b0052bf8ab6265mr5063293pfx.54.1659124453469; 
 Fri, 29 Jul 2022 12:54:13 -0700 (PDT)
Received: from google.com (7.104.168.34.bc.googleusercontent.com.
 [34.168.104.7]) by smtp.gmail.com with ESMTPSA id
 129-20020a621787000000b00518e1251197sm3332537pfx.148.2022.07.29.12.54.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jul 2022 12:54:12 -0700 (PDT)
Date: Fri, 29 Jul 2022 19:54:09 +0000
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
Message-ID: <YuQ64RgWqdoAAGdY@google.com>
References: <f02baa37-8d34-5d07-a0ae-300ffefc7fee@amd.com>
 <20220719140843.GA84779@chaop.bj.intel.com>
 <36e671d2-6b95-8e4f-c2ac-fee4b2670c6e@amd.com>
 <20220720150706.GB124133@chaop.bj.intel.com>
 <d0fd229d-afa6-c66d-3e55-09ac5877453e@amd.com>
 <YtgrkXqP/GIi9ujZ@google.com>
 <45ae9f57-d595-f202-abb5-26a03a2ca131@linux.intel.com>
 <20220721092906.GA153288@chaop.bj.intel.com>
 <YtmT2irvgInX1kPp@google.com>
 <20220725130417.GA304216@chaop.bj.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220725130417.GA304216@chaop.bj.intel.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=seanjc@google.com; helo=mail-pf1-x430.google.com
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

On Mon, Jul 25, 2022, Chao Peng wrote:
> On Thu, Jul 21, 2022 at 05:58:50PM +0000, Sean Christopherson wrote:
> > On Thu, Jul 21, 2022, Chao Peng wrote:
> > > On Thu, Jul 21, 2022 at 03:34:59PM +0800, Wei Wang wrote:
> > > > 
> > > > 
> > > > On 7/21/22 00:21, Sean Christopherson wrote:
> > > > Maybe you could tag it with cgs for all the confidential guest support
> > > > related stuff: e.g. kvm_vm_ioctl_set_cgs_mem()
> > > > 
> > > > bool is_private = ioctl == KVM_MEMORY_ENCRYPT_REG_REGION;
> > > > ...
> > > > kvm_vm_ioctl_set_cgs_mem(, is_private)
> > > 
> > > If we plan to widely use such abbr. through KVM (e.g. it's well known),
> > > I'm fine.
> > 
> > I'd prefer to stay away from "confidential guest", and away from any VM-scoped
> > name for that matter.  User-unmappable memmory has use cases beyond hiding guest
> > state from the host, e.g. userspace could use inaccessible/unmappable memory to
> > harden itself against unintentional access to guest memory.
> > 
> > > I actually use mem_attr in patch: https://lkml.org/lkml/2022/7/20/610
> > > But I also don't quite like it, it's so generic and sounds say nothing.
> > > 
> > > But I do want a name can cover future usages other than just 
> > > private/shared (pKVM for example may have a third state).
> > 
> > I don't think there can be a third top-level state.  Memory is either private to
> > the guest or it's not.  There can be sub-states, e.g. memory could be selectively
> > shared or encrypted with a different key, in which case we'd need metadata to
> > track that state.
> > 
> > Though that begs the question of whether or not private_fd is the correct
> > terminology.  E.g. if guest memory is backed by a memfd that can't be mapped by
> > userspace (currently F_SEAL_INACCESSIBLE), but something else in the kernel plugs
> > that memory into a device or another VM, then arguably that memory is shared,
> > especially the multi-VM scenario.
> > 
> > For TDX and SNP "private vs. shared" is likely the correct terminology given the
> > current specs, but for generic KVM it's probably better to align with whatever
> > terminology is used for memfd.  "inaccessible_fd" and "user_inaccessible_fd" are
> > a bit odd since the fd itself is accesible.
> > 
> > What about "user_unmappable"?  E.g.
> > 
> >   F_SEAL_USER_UNMAPPABLE, MFD_USER_UNMAPPABLE, KVM_HAS_USER_UNMAPPABLE_MEMORY,
> >   MEMFILE_F_USER_INACCESSIBLE, user_unmappable_fd, etc...
> 
> For KVM I also think user_unmappable looks better than 'private', e.g.
> user_unmappable_fd/KVM_HAS_USER_UNMAPPABLE_MEMORY sounds more
> appropriate names. For memfd however, I don't feel that strong to change
> it from current 'inaccessible' to 'user_unmappable', one of the reason
> is it's not just about unmappable, but actually also inaccessible
> through direct ioctls like read()/write().

Heh, I _knew_ there had to be a catch.  I agree that INACCESSIBLE is better for
memfd.

