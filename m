Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F180266E3A3
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 17:34:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHoun-0000AX-Dy; Tue, 17 Jan 2023 11:34:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1pHoum-00009W-0C
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 11:34:24 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1pHouj-0007Ac-R8
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 11:34:23 -0500
Received: by mail-pl1-x62b.google.com with SMTP id d9so34068838pll.9
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 08:34:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=RlZqHzGUK9sPKKEmcxJQVC8fJtWdk0oagrgJ42/FWUo=;
 b=GagBZ/fJ0HIkXHzRy0CbCmfPpWlzsJy94tpCQ8EM447gdtHwUNdr+/0ms8CyEKLf1H
 87BAPR3m4cGTNmHhS8FQWCA3jItdgTfg2O1y324ETrJm9wif/kqBuR0HABESY8b/QAXW
 IdA3nGsd/k2ZqRgAvcYxZeCzmgBjDiOyukOBmUMFSdxgtarQPCrC3WBhG1hEtHyio7lz
 MzrrcIHf6oGoCuyNiTRgvEzRwP444dif738YtJUGeanCHpbfef03LW6AovbhF8dvV0XM
 1zN6puNvHyQtXK+RTTCXdAlDnDwIGobsKZXyE9Dho+bA5WDucJ5i+fSls2V2hPVXYH+n
 HUjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RlZqHzGUK9sPKKEmcxJQVC8fJtWdk0oagrgJ42/FWUo=;
 b=R2SiqJhNTLsb+OXbiLX+ncd0lfQCc7gwLsro4J1gislMnlvG3AKTDa7T00V4uVtgFH
 WBiu9EhBtMrnWg7zukpe25a8531ZeGgkYPSNRpm9mLV8wyIyimEZU/bPyVWm/tZ+33X3
 RtPiMNpOqJEUTfSxsTjHmro0my4A/PCGbjAZdA0IgyKNZFItp3dKlycyrP7u8i28zBUe
 Ok0FN2EW0TQGiiHnS8rLfWbuD0zixJBgja/KshkwcgZhnZO2Da2ARhKaZF74k90Rpjpc
 yhxdnUC9zJ4zPNwB1gUFEMu9NU/vib8WnMEH86vR31ywCpz7ZdDSTy9bJzIJEr/bwkK8
 T+/g==
X-Gm-Message-State: AFqh2krpyRMeBnzPKGx3GAQk2ZsQcuI3gEXuvUVYC1nqPMh4D50i+8Bp
 3+BN1A+p/Zf3+pvK+teKjKDM/g==
X-Google-Smtp-Source: AMrXdXsfdieWfN0MIWgnbSJR6LpHJOm0kOFvhc/mphSIUbDTi7tsqX9OyAWcQeZT7PRkx/BuaGfRaQ==
X-Received: by 2002:a17:90a:9503:b0:227:679:17df with SMTP id
 t3-20020a17090a950300b00227067917dfmr2436705pjo.0.1673973259775; 
 Tue, 17 Jan 2023 08:34:19 -0800 (PST)
Received: from google.com (7.104.168.34.bc.googleusercontent.com.
 [34.168.104.7]) by smtp.gmail.com with ESMTPSA id
 y7-20020a17090a474700b00219463262desm18118727pjg.39.2023.01.17.08.34.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 08:34:19 -0800 (PST)
Date: Tue, 17 Jan 2023 16:34:15 +0000
From: Sean Christopherson <seanjc@google.com>
To: Chao Peng <chao.p.peng@linux.intel.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
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
Subject: Re: [PATCH v10 1/9] mm: Introduce memfd_restricted system call to
 create restricted user memory
Message-ID: <Y8bOB7VuVIsxoMcn@google.com>
References: <20221202061347.1070246-1-chao.p.peng@linux.intel.com>
 <20221202061347.1070246-2-chao.p.peng@linux.intel.com>
 <Y8HTITl1+Oe0H7Gd@google.com>
 <20230117124107.GA273037@chaop.bj.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230117124107.GA273037@chaop.bj.intel.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=seanjc@google.com; helo=mail-pl1-x62b.google.com
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

On Tue, Jan 17, 2023, Chao Peng wrote:
> On Fri, Jan 13, 2023 at 09:54:41PM +0000, Sean Christopherson wrote:
> > > +	list_for_each_entry(notifier, &data->notifiers, list) {
> > > +		notifier->ops->invalidate_start(notifier, start, end);
> > 
> > Two major design issues that we overlooked long ago:
> > 
> >   1. Blindly invoking notifiers will not scale.  E.g. if userspace configures a
> >      VM with a large number of convertible memslots that are all backed by a
> >      single large restrictedmem instance, then converting a single page will
> >      result in a linear walk through all memslots.  I don't expect anyone to
> >      actually do something silly like that, but I also never expected there to be
> >      a legitimate usecase for thousands of memslots.
> > 
> >   2. This approach fails to provide the ability for KVM to ensure a guest has
> >      exclusive access to a page.  As discussed in the past, the kernel can rely
> >      on hardware (and maybe ARM's pKVM implementation?) for those guarantees, but
> >      only for SNP and TDX VMs.  For VMs where userspace is trusted to some extent,
> >      e.g. SEV, there is value in ensuring a 1:1 association.
> > 
> >      And probably more importantly, relying on hardware for SNP and TDX yields a
> >      poor ABI and complicates KVM's internals.  If the kernel doesn't guarantee a
> >      page is exclusive to a guest, i.e. if userspace can hand out the same page
> >      from a restrictedmem instance to multiple VMs, then failure will occur only
> >      when KVM tries to assign the page to the second VM.  That will happen deep
> >      in KVM, which means KVM needs to gracefully handle such errors, and it means
> >      that KVM's ABI effectively allows plumbing garbage into its memslots.
> 
> It may not be a valid usage, but in my TDX environment I do meet below
> issue.
> 
> kvm_set_user_memory AddrSpace#0 Slot#0 flags=0x4 gpa=0x0 size=0x80000000 ua=0x7fe1ebfff000 ret=0
> kvm_set_user_memory AddrSpace#0 Slot#1 flags=0x4 gpa=0xffc00000 size=0x400000 ua=0x7fe271579000 ret=0
> kvm_set_user_memory AddrSpace#0 Slot#2 flags=0x4 gpa=0xfeda0000 size=0x20000 ua=0x7fe1ec09f000 ret=-22
> 
> Slot#2('SMRAM') is actually an alias into system memory(Slot#0) in QEMU
> and slot#2 fails due to below exclusive check.
> 
> Currently I changed QEMU code to mark these alias slots as shared
> instead of private but I'm not 100% confident this is correct fix.

That's a QEMU bug of sorts.  SMM is mutually exclusive with TDX, QEMU shouldn't
be configuring SMRAM (or any SMM memslots for that matter) for TDX guests.

Actually, KVM should enforce that by disallowing SMM memslots for TDX guests.
Ditto for SNP guests and UPM-backed SEV and SEV-ES guests.  I think it probably
even makes sense to introduce that restriction in the base UPM support, e.g.
something like the below.  That would unnecessarily prevent emulating SMM for
KVM_X86_PROTECTED_VM types that aren't encrypted, but IMO that's an acceptable
limitation until there's an actual use case for KVM_X86_PROTECTED_VM guests beyond
SEV (my thought is that KVM_X86_PROTECTED_VM will mostly be a vehicle for selftests
and UPM-based SEV and SEV-ES guests).

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 48b7bdad1e0a..0a8aac821cb0 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -4357,6 +4357,14 @@ bool kvm_arch_has_private_mem(struct kvm *kvm)
        return kvm->arch.vm_type != KVM_X86_DEFAULT_VM;
 }
 
+bool kvm_arch_nr_address_spaces(struct kvm *kvm)
+{
+       if (kvm->arch.vm_type != KVM_X86_DEFAULT_VM)
+               return 1;
+
+       return KVM_ADDRESS_SPACE_NUM;
+}
+
 static bool kvm_is_vm_type_supported(unsigned long type)
 {
        return type == KVM_X86_DEFAULT_VM ||
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 97801d81ee42..e0a3fc819fe5 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -2126,7 +2126,7 @@ int __kvm_set_memory_region(struct kvm *kvm,
             mem->restricted_offset + mem->memory_size < mem->restricted_offset ||
             0 /* TODO: require gfn be aligned with restricted offset */))
                return -EINVAL;
-       if (as_id >= KVM_ADDRESS_SPACE_NUM || id >= KVM_MEM_SLOTS_NUM)
+       if (as_id >= kvm_arch_nr_address_spaces(vm) || id >= KVM_MEM_SLOTS_NUM)
                return -EINVAL;
        if (mem->guest_phys_addr + mem->memory_size < mem->guest_phys_addr)
                return -EINVAL;


