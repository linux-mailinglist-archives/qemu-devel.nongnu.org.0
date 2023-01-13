Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D254366A6E0
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Jan 2023 00:17:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGTHx-0003ky-0n; Fri, 13 Jan 2023 18:16:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1pGTHo-0003kP-Ub
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 18:16:41 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1pGTHm-00087k-TA
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 18:16:36 -0500
Received: by mail-pl1-x629.google.com with SMTP id p24so24895091plw.11
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 15:16:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=aWow72s2ZHPfyutUF3LRtthWGyQvB6TRG4mGrzQPS+Y=;
 b=E/wbWTkGCcwoXs6O8irB3PXyBwoRW4uEkWDuoU13XByhJzTvIiq4OfNzvKMYIxRBd8
 N5dRvUnnXxuGkG1NqPLQ9NcLguZ/hQembSMTLovSWxd/eNEA47F4pw2VMvBTgCh83EhX
 bKzfh13CLYQPbU31yNkCeE7nVtvWxeSrEzOQXXJn3Ra1e263z8sIZrm9ZwC48e/SEbDs
 3aEzaEkItlDgZ56c4opqTh+L6mEGkhcrmVBFbTe1hFC/UfsbAkExmK+Dw6Q5zVDBQe5Z
 vQO9KR1KEhsZRidc5t6FXrTt3AyPbDNocZckiEhBhgfdJEwaG1EcApBlL60GoZCzvH2P
 EHwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aWow72s2ZHPfyutUF3LRtthWGyQvB6TRG4mGrzQPS+Y=;
 b=W6NxnaLTIAQeloB7L8B//H+sLjrt5UfZhHKLOcKy7ahRJHsnXcMsh6mt1SE41vucGH
 FzEasYtEODGhB923EjDYkEOG3l2POdbjRSQN5LFJPiirwyfmD4Crbea04grUjc42rY6C
 GouXBBNjEY+I+Lr5d37Nl4Nxo0IbK8wvXWF7IYO2EFIgDzoLCYNRCI+S7vRK1Mw1JMhc
 Tj2VdzCiFqOfdAYxH3HeBCyvCqKTuHVt2IBZB4MR3DiX8MGAWcJPzv+LIv/ppJbwahiB
 fKSOzxBubHey4zGBA3J3hwJpvwaMewMjkCmVZrZF3TVswNuvWVRD8HzTtQkcYnCxB+4b
 pagA==
X-Gm-Message-State: AFqh2koJqMEBMmz9l0vDYe/mEeEjq3XFWpFvNGjIAz39YpAH/6/S75/C
 MjE8rkh2GtwnV5zDoS9NMRD1jA==
X-Google-Smtp-Source: AMrXdXsw5eR35BhM0SQtUTPreOToQACUohVatv5rPzW7S1K5nzUfkKmIR6WQPAlOT0G0H1aK7d4JHA==
X-Received: by 2002:a17:902:c409:b0:194:6d3c:38a5 with SMTP id
 k9-20020a170902c40900b001946d3c38a5mr502925plk.1.1673651792454; 
 Fri, 13 Jan 2023 15:16:32 -0800 (PST)
Received: from google.com (7.104.168.34.bc.googleusercontent.com.
 [34.168.104.7]) by smtp.gmail.com with ESMTPSA id
 q3-20020a17090311c300b0018c990ce7fesm14720017plh.239.2023.01.13.15.16.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 15:16:31 -0800 (PST)
Date: Fri, 13 Jan 2023 23:16:27 +0000
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
Subject: Re: [PATCH v10 7/9] KVM: Update lpage info when private/shared
 memory are mixed
Message-ID: <Y8HmS2iE4u0Gfkrn@google.com>
References: <20221202061347.1070246-1-chao.p.peng@linux.intel.com>
 <20221202061347.1070246-8-chao.p.peng@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221202061347.1070246-8-chao.p.peng@linux.intel.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=seanjc@google.com; helo=mail-pl1-x629.google.com
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

On Fri, Dec 02, 2022, Chao Peng wrote:
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index 9a07380f8d3c..5aefcff614d2 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -12362,6 +12362,8 @@ static int kvm_alloc_memslot_metadata(struct kvm *kvm,
>  		if ((slot->base_gfn + npages) & (KVM_PAGES_PER_HPAGE(level) - 1))
>  			linfo[lpages - 1].disallow_lpage = 1;
>  		ugfn = slot->userspace_addr >> PAGE_SHIFT;
> +		if (kvm_slot_can_be_private(slot))
> +			ugfn |= slot->restricted_offset >> PAGE_SHIFT;
>  		/*
>  		 * If the gfn and userspace address are not aligned wrt each
>  		 * other, disable large page support for this slot.

Forgot to talk about the bug.  This code needs to handle the scenario where a
memslot is created with existing, non-uniform attributes.  It might be a bit ugly
(I didn't even try to write the code), but it's definitely possible, and since
memslot updates are already slow I think it's best to handle things here.

In the meantime, I added this so we don't forget to fix it before merging.

#ifdef CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES
	pr_crit_once("FIXME: Walk the memory attributes of the slot and set the mixed status appropriately");
#endif


