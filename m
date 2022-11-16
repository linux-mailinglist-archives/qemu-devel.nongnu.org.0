Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C37B362CD78
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 23:14:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovQei-0004vP-Sa; Wed, 16 Nov 2022 17:13:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1ovQeh-0004vD-0t
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 17:13:15 -0500
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1ovQef-00087b-4z
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 17:13:14 -0500
Received: by mail-pg1-x534.google.com with SMTP id q71so198093pgq.8
 for <qemu-devel@nongnu.org>; Wed, 16 Nov 2022 14:13:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=LEALi84Ium1ZlWZzXz+cwmcGDIY43dRDsmFo60UxT98=;
 b=ahJ8bsoBVgCCr8jscmazuErp1mcQI1GMVSN2Oxb3HpXUz+ero20SbhLgGY9RN/H+xD
 tFV3t/zAOJii91OWn9GYaKLEyrD3W909tKm2iGNsxzCbCGxYeFicSe43FkMw3GrxNaZ4
 QEGWUsO8rKh/1aRQGDInDmRqtr1Uh9x4T4xE6Uyjgq8L1s43VxjHes14Oqogismgc+Hz
 hM+9p0PlJEfu2Vm2j+80XeoERr1jltAIVvqBvqBzdoq18EHFXEu2PM8hqeKwoj0zSd5c
 QktiEetb5wdRlA9m0xLmXCpLd9EkKJQux+HW3MyXNOrVpvVh4V4725vD5tPgEwbYQN7X
 nxHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LEALi84Ium1ZlWZzXz+cwmcGDIY43dRDsmFo60UxT98=;
 b=irhh0/WixWyNWUxq4olZM7PcQ1QQKSYW3433VvOYaQ9nx28zQntxCwrGw4a6MDA7WU
 gue0i+h79+Yk/c7n1uw1BLlC/oqoyTWxfshUEFoYXfRgJD8j+reRrNewWK4iHSCatJY1
 +MnMcbkXSp5TfaA8AO6oAHGQko/UtCEf4yvJgVUgcjURfgNydGdBTv1MoPaZ5ucLGWOA
 j9dCJcP//7kGfciCI08vmOt+SSJSUWDW6JduSAlmGqHlQC9pao7/va2SGEPYRWYDGrqt
 I447ZfdQOhv3FZmva6FGHfRdPdMU90XPPgFTC3S3OlNeWpOInHjxvvZOzBZkes3aoOUQ
 h1sA==
X-Gm-Message-State: ANoB5pl4rCYEHw/WwIvKSqkqmtN8jtZTvJ3jJYL8HDPhrQqpi68Rn41C
 etkw7OUUJsn2athdnhdPOmbhRg==
X-Google-Smtp-Source: AA0mqf6tUAmTqse/Fkst1piL5RNn0zRmV8+vRAL9N/G2uaYzEal3MxGusaZa1JYBear3ieq3f8Blvg==
X-Received: by 2002:a63:454e:0:b0:476:cdb8:28fd with SMTP id
 u14-20020a63454e000000b00476cdb828fdmr7485375pgk.358.1668636791454; 
 Wed, 16 Nov 2022 14:13:11 -0800 (PST)
Received: from google.com (7.104.168.34.bc.googleusercontent.com.
 [34.168.104.7]) by smtp.gmail.com with ESMTPSA id
 h4-20020a170902680400b0017b264a2d4asm12676465plk.44.2022.11.16.14.13.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Nov 2022 14:13:11 -0800 (PST)
Date: Wed, 16 Nov 2022 22:13:07 +0000
From: Sean Christopherson <seanjc@google.com>
To: Ackerley Tng <ackerleytng@google.com>
Cc: chao.p.peng@linux.intel.com, aarcange@redhat.com, ak@linux.intel.com,
 akpm@linux-foundation.org, bfields@fieldses.org, bp@alien8.de,
 corbet@lwn.net, dave.hansen@intel.com, david@redhat.com,
 ddutile@redhat.com, dhildenb@redhat.com, hpa@zytor.com,
 hughd@google.com, jlayton@kernel.org, jmattson@google.com,
 joro@8bytes.org, jun.nakajima@intel.com,
 kirill.shutemov@linux.intel.com, kvm@vger.kernel.org,
 linux-api@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, luto@kernel.org,
 mail@maciej.szmigiero.name, mhocko@suse.com, michael.roth@amd.com,
 mingo@redhat.com, pbonzini@redhat.com, qemu-devel@nongnu.org,
 qperret@google.com, rppt@kernel.org, shuah@kernel.org,
 songmuchun@bytedance.com, steven.price@arm.com, tabba@google.com,
 tglx@linutronix.de, vannapurve@google.com, vbabka@suse.cz,
 vkuznets@redhat.com, wanpengli@tencent.com, wei.w.wang@intel.com,
 x86@kernel.org, yu.c.zhang@linux.intel.com
Subject: Re: [PATCH v9 7/8] KVM: Handle page fault for private memory
Message-ID: <Y3Vgc5KrNRA8r6vh@google.com>
References: <20221025151344.3784230-8-chao.p.peng@linux.intel.com>
 <20221116205025.1510291-1-ackerleytng@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221116205025.1510291-1-ackerleytng@google.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=seanjc@google.com; helo=mail-pg1-x534.google.com
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

On Wed, Nov 16, 2022, Ackerley Tng wrote:
> >@@ -4173,6 +4203,22 @@ static int kvm_faultin_pfn(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault)
> > 			return RET_PF_EMULATE;
> > 	}
> >
> >+	if (kvm_slot_can_be_private(slot) &&
> >+	    fault->is_private != kvm_mem_is_private(vcpu->kvm, fault->gfn)) {
> >+		vcpu->run->exit_reason = KVM_EXIT_MEMORY_FAULT;
> >+		if (fault->is_private)
> >+			vcpu->run->memory.flags = KVM_MEMORY_EXIT_FLAG_PRIVATE;
> >+		else
> >+			vcpu->run->memory.flags = 0;
> >+		vcpu->run->memory.padding = 0;
> >+		vcpu->run->memory.gpa = fault->gfn << PAGE_SHIFT;
> >+		vcpu->run->memory.size = PAGE_SIZE;
> >+		return RET_PF_USER;
> >+	}
> >+
> >+	if (fault->is_private)
> >+		return kvm_faultin_pfn_private(fault);
> >+
> 
> Since each memslot may also not be backed by restricted memory, we
> should also check if the memslot has been set up for private memory
> with
> 
> 	if (fault->is_private && kvm_slot_can_be_private(slot))
> 		return kvm_faultin_pfn_private(fault);
> 
> Without this check, restrictedmem_get_page will get called with NULL
> in slot->restricted_file, which causes a NULL pointer dereference.

Hmm, silently skipping the faultin would result in KVM faulting in the shared
portion of the memslot, and I believe would end up mapping that pfn as private,
i.e. would map a non-UPM PFN as a private mapping.  For TDX and SNP, that would
be double ungood as it would let the host access memory that is mapped private,
i.e. lead to #MC or #PF(RMP) in the host.

I believe the correct solution is to drop the "can be private" check from the
above check, and instead handle that in kvm_faultin_pfn_private().  That would fix
another bug, e.g. if the fault is shared, the slot can't be private, but for
whatever reason userspace marked the gfn as private.  Even though KVM might be
able service the fault, the correct thing to do in that case is to exit to userspace.

E.g.

---
 arch/x86/kvm/mmu/mmu.c | 36 ++++++++++++++++++++++--------------
 1 file changed, 22 insertions(+), 14 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 10017a9f26ee..e2ac8873938e 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -4158,11 +4158,29 @@ static inline u8 order_to_level(int order)
 	return PG_LEVEL_4K;
 }
 
-static int kvm_faultin_pfn_private(struct kvm_page_fault *fault)
+static int kvm_do_memory_fault_exit(struct kvm_vcpu *vcpu,
+					struct kvm_page_fault *fault)
+{
+	vcpu->run->exit_reason = KVM_EXIT_MEMORY_FAULT;
+	if (fault->is_private)
+		vcpu->run->memory.flags = KVM_MEMORY_EXIT_FLAG_PRIVATE;
+	else
+		vcpu->run->memory.flags = 0;
+	vcpu->run->memory.padding = 0;
+	vcpu->run->memory.gpa = fault->gfn << PAGE_SHIFT;
+	vcpu->run->memory.size = PAGE_SIZE;
+	return RET_PF_USER;
+}
+
+static int kvm_faultin_pfn_private(struct kvm_vcpu *vcpu,
+				   struct kvm_page_fault *fault)
 {
 	int order;
 	struct kvm_memory_slot *slot = fault->slot;
 
+	if (kvm_slot_can_be_private(slot))
+		return kvm_do_memory_fault_exit(vcpu, fault);
+
 	if (kvm_restricted_mem_get_pfn(slot, fault->gfn, &fault->pfn, &order))
 		return RET_PF_RETRY;
 
@@ -4203,21 +4221,11 @@ static int kvm_faultin_pfn(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault)
 			return RET_PF_EMULATE;
 	}
 
-	if (kvm_slot_can_be_private(slot) &&
-	    fault->is_private != kvm_mem_is_private(vcpu->kvm, fault->gfn)) {
-		vcpu->run->exit_reason = KVM_EXIT_MEMORY_FAULT;
-		if (fault->is_private)
-			vcpu->run->memory.flags = KVM_MEMORY_EXIT_FLAG_PRIVATE;
-		else
-			vcpu->run->memory.flags = 0;
-		vcpu->run->memory.padding = 0;
-		vcpu->run->memory.gpa = fault->gfn << PAGE_SHIFT;
-		vcpu->run->memory.size = PAGE_SIZE;
-		return RET_PF_USER;
-	}
+	if (fault->is_private != kvm_mem_is_private(vcpu->kvm, fault->gfn))
+		return kvm_do_memory_fault_exit(vcpu, fault);
 
 	if (fault->is_private)
-		return kvm_faultin_pfn_private(fault);
+		return kvm_faultin_pfn_private(vcpu, fault);
 
 	async = false;
 	fault->pfn = __gfn_to_pfn_memslot(slot, fault->gfn, false, &async,

base-commit: 969d761bb7b8654605937f31ae76123dcb7f15a3
-- 


