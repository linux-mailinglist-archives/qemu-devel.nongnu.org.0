Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A628562CD9B
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 23:25:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovQpS-0000vx-4F; Wed, 16 Nov 2022 17:24:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1ovQpP-0000vT-Nd
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 17:24:20 -0500
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1ovQpN-0003Ry-Sv
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 17:24:19 -0500
Received: by mail-pg1-x529.google.com with SMTP id q71so229423pgq.8
 for <qemu-devel@nongnu.org>; Wed, 16 Nov 2022 14:24:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=QGkcU8bsAXTracYvItbCwnniUSLgMtAC897scf+9ddo=;
 b=Yb4wKwuTq8SDmbVGc+P7ahM8KCEiEG3EeQYJnIBy43Yu4s+iC+yGjvQgmVRoCCNQD4
 bFiXa2DlOoj+M6COODORifyN82jIJfcy0aF0ZJtT8PTph1kJcj2QMeh/X+0txTmE1L9e
 vjCm/+n4/Ca01rOL6VyR5fbnbwtckm/wl6rnzgA+2U9G86s1X+WQKo3mRqwdqt/NZj4i
 P3BxQwhuIeyDfA8UssWFkeXvKFbx/BZ4epGrEEpau+te7+rSV+HSw5cBzmIPmEEBr4ge
 1bl1xkBDMVGhMoLkvC/hKl/ZnG4RNCOpP9NsjFm/3oC6Zxx7zYxZx28Lz46N2hnBOT/Z
 8NoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QGkcU8bsAXTracYvItbCwnniUSLgMtAC897scf+9ddo=;
 b=24QBq0LI6L/1UtNek4GMC+B3fcDiueTIhHmpf61LDXrI5Cf0M0QDswScfzJsvdd9SD
 0TyYVEIQ/u/9Zu2Jp5necXzfKki9epwhojzF6LIFYDJV2P2E3R88iTeA6F5gIlKarq4k
 ke3hQsExH3Kk5aeLzvGoPtoVwSvDsNHruC8Ph6QPjW8mOMNn2VO1OkNjtnHuVSuR4U4H
 tJ17MTeSHwJlTcUEgvhVb7WmM4smGAPkLhzG/erseZlZfqdMbZVIsWr42jgoVzisFDwg
 uP3eBhs+KoDyBtt5aJeeaRnH4/bg4tFbkizMkCakCgxQovHxpTI5B49IlmN6Cd+OFu35
 1biA==
X-Gm-Message-State: ANoB5pnNlHQUwP3GGi6h4vcBeqM1rRAJvxWuBa64Or4S5QpGUFDdusF+
 pf0KXRk8vy4rIT/KsZZ7fJ8wbg==
X-Google-Smtp-Source: AA0mqf57GusGHy4fGdIdCCD+ypBDi3fwzFhsJUW/Qb2DW/M9r1lO66W8ccdVhRkSLbzOP4I6svKevg==
X-Received: by 2002:a63:560c:0:b0:476:9983:b4b5 with SMTP id
 k12-20020a63560c000000b004769983b4b5mr12164723pgb.516.1668637455542; 
 Wed, 16 Nov 2022 14:24:15 -0800 (PST)
Received: from google.com (7.104.168.34.bc.googleusercontent.com.
 [34.168.104.7]) by smtp.gmail.com with ESMTPSA id
 k15-20020aa7972f000000b0056bbba4302dsm11324389pfg.119.2022.11.16.14.24.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Nov 2022 14:24:15 -0800 (PST)
Date: Wed, 16 Nov 2022 22:24:11 +0000
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
 Quentin Perret <qperret@google.com>, tabba@google.com,
 Michael Roth <michael.roth@amd.com>, mhocko@suse.com,
 Muchun Song <songmuchun@bytedance.com>, wei.w.wang@intel.com
Subject: Re: [PATCH v9 5/8] KVM: Register/unregister the guest private memory
 regions
Message-ID: <Y3VjCxCiujCOLP7x@google.com>
References: <20221025151344.3784230-1-chao.p.peng@linux.intel.com>
 <20221025151344.3784230-6-chao.p.peng@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221025151344.3784230-6-chao.p.peng@linux.intel.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=seanjc@google.com; helo=mail-pg1-x529.google.com
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

On Tue, Oct 25, 2022, Chao Peng wrote:
> +static int kvm_vm_ioctl_set_mem_attr(struct kvm *kvm, gpa_t gpa, gpa_t size,
> +				     bool is_private)
> +{
> +	gfn_t start, end;
> +	unsigned long i;
> +	void *entry;
> +	int idx;
> +	int r = 0;
> +
> +	if (size == 0 || gpa + size < gpa)
> +		return -EINVAL;
> +	if (gpa & (PAGE_SIZE - 1) || size & (PAGE_SIZE - 1))
> +		return -EINVAL;
> +
> +	start = gpa >> PAGE_SHIFT;
> +	end = (gpa + size - 1 + PAGE_SIZE) >> PAGE_SHIFT;
> +
> +	/*
> +	 * Guest memory defaults to private, kvm->mem_attr_array only stores
> +	 * shared memory.
> +	 */
> +	entry = is_private ? NULL : xa_mk_value(KVM_MEM_ATTR_SHARED);
> +
> +	idx = srcu_read_lock(&kvm->srcu);
> +	KVM_MMU_LOCK(kvm);
> +	kvm_mmu_invalidate_begin(kvm, start, end);
> +
> +	for (i = start; i < end; i++) {
> +		r = xa_err(xa_store(&kvm->mem_attr_array, i, entry,
> +				    GFP_KERNEL_ACCOUNT));
> +		if (r)
> +			goto err;
> +	}
> +
> +	kvm_unmap_mem_range(kvm, start, end);
> +
> +	goto ret;
> +err:
> +	for (; i > start; i--)
> +		xa_erase(&kvm->mem_attr_array, i);

I don't think deleting previous entries is correct.  To unwind, the correct thing
to do is restore the original values.  E.g. if userspace space is mapping a large
range as shared, and some of the previous entries were shared, deleting them would
incorrectly "convert" those entries to private.

Tracking the previous state likely isn't the best approach, e.g. it would require
speculatively allocating extra memory for a rare condition that is likely going to
lead to OOM anyways.

Instead of trying to unwind, what about updating the ioctl() params such that
retrying with the updated addr+size would Just Work?  E.g.

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 55b07aae67cc..f1de592a1a06 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -1015,15 +1015,12 @@ static int kvm_vm_ioctl_set_mem_attr(struct kvm *kvm, gpa_t gpa, gpa_t size,
 
        kvm_unmap_mem_range(kvm, start, end, attr);
 
-       goto ret;
-err:
-       for (; i > start; i--)
-               xa_erase(&kvm->mem_attr_array, i);
-ret:
        kvm_mmu_invalidate_end(kvm, start, end);
        KVM_MMU_UNLOCK(kvm);
        srcu_read_unlock(&kvm->srcu, idx);
 
+       <update gpa and size>
+
        return r;
 }
 #endif /* CONFIG_KVM_GENERIC_PRIVATE_MEM */
@@ -4989,6 +4986,8 @@ static long kvm_vm_ioctl(struct file *filp,
 
                r = kvm_vm_ioctl_set_mem_attr(kvm, region.addr,
                                              region.size, set);
+               if (copy_to_user(argp, &region, sizeof(region)) && !r)
+                       r = -EFAULT
                break;
        }
 #endif

