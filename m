Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C444F8C06
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Apr 2022 05:08:52 +0200 (CEST)
Received: from localhost ([::1]:59976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncezT-0003CM-EH
	for lists+qemu-devel@lfdr.de; Thu, 07 Apr 2022 23:08:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1ncexd-0002Rg-69
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 23:06:57 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:45643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1ncexb-0002Xd-Jp
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 23:06:56 -0400
Received: by mail-pl1-x62b.google.com with SMTP id k13so1544855plk.12
 for <qemu-devel@nongnu.org>; Thu, 07 Apr 2022 20:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=EC5S9HeeAeWu2eNBsyivixNrTA70JdgMnP+Pf2/O2qg=;
 b=EpAjw7jw4WWVD+pRhIzuMb0FhqzyaNBFP80LNXjV0r/rD1/RB0ZkW8mCtl8L5gOm9V
 vYcU6A29g2I+ODCG7pJZTrN48/CYZYH2lv+cQ1Lf7e6rqqAWkC4Zg44oVvO2qbceqxRo
 2qLu9D+9FYKb3NJMrbsxNA0m6heqbgDkSiRLDlvDb1HeKTXTSt9G9kajaf7pzoL45aP7
 er0hjWFfhWotgPNcWgxfJDyv1MZZNuzL3s89S1dWzCczh9jGeW2xgklsEbgMgjSxgw6R
 x4FhGo9SSJMZy48OO8AsLDL/iCZU9HnFQ24dhJNIik7tEolbvUEEVC685pqbjr5/nDw0
 ND+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=EC5S9HeeAeWu2eNBsyivixNrTA70JdgMnP+Pf2/O2qg=;
 b=Vzi8m3FJeYEGD3NL06lveUi2gIllunk3J8YuLr+u5OTJihlUXPGBDthwGKYfbB0o7O
 PG2rBOSgAYMaTE3+xHRJS+zb1RpU0D2V7+CZKjiGNCD0wAq9S2EY7GRizJgkfERgKD1k
 K6VUdFJo/EDPNsaaf6xSDFbf33BLpFU/OK5ntgU0ppvXKGSRt2jYUa/9UH7OHIS+9PS4
 aHSWHyb5BOIn730pWwW9yaQJdz6inx6QFPF6bMV/pawE8RAuwTvYPzN9OZlm+IodSif5
 l98D7Bq/Gr+Ft9xU7QSuZlLsUGtPLh0ps30/6CmlUxw+fC2BY1sAzGeDdD74RGpwHzTN
 AJ5A==
X-Gm-Message-State: AOAM531BDfDBo1diVC9qezYigiTy7fbaQcRIeIAEFUAolnU0mXUuZpJi
 6WDcWjfJ3wO/etn5j1tm5pyaxA==
X-Google-Smtp-Source: ABdhPJxAdWyP+XVhR9LTj3ckSl+Vd8CbfsIFM48H3Oti2JTQQI09MpZlrgO3+njMgmysdIXAz/Vv0Q==
X-Received: by 2002:a17:90a:d354:b0:1ca:a0aa:bc23 with SMTP id
 i20-20020a17090ad35400b001caa0aabc23mr19424438pjx.142.1649387213690; 
 Thu, 07 Apr 2022 20:06:53 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157]) by smtp.gmail.com with ESMTPSA id
 u6-20020a17090a3fc600b001ca88b0bdfesm10338286pjm.13.2022.04.07.20.06.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Apr 2022 20:06:52 -0700 (PDT)
Date: Fri, 8 Apr 2022 03:06:49 +0000
From: Sean Christopherson <seanjc@google.com>
To: Michael Roth <michael.roth@amd.com>
Cc: Chao Peng <chao.p.peng@linux.intel.com>, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
 Hugh Dickins <hughd@google.com>, Jeff Layton <jlayton@kernel.org>,
 "J . Bruce Fields" <bfields@fieldses.org>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>,
 Steven Price <steven.price@arm.com>,
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve <vannapurve@google.com>,
 Yu Zhang <yu.c.zhang@linux.intel.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 luto@kernel.org, jun.nakajima@intel.com, dave.hansen@intel.com,
 ak@linux.intel.com, david@redhat.com
Subject: Re: [PATCH v5 11/13] KVM: Zap existing KVM mappings when pages
 changed in the private fd
Message-ID: <Yk+myTh1rMfeWOt3@google.com>
References: <20220310140911.50924-1-chao.p.peng@linux.intel.com>
 <20220310140911.50924-12-chao.p.peng@linux.intel.com>
 <20220405234535.ijctzcbxkat2o5ij@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220405234535.ijctzcbxkat2o5ij@amd.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=seanjc@google.com; helo=mail-pl1-x62b.google.com
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

On Tue, Apr 05, 2022, Michael Roth wrote:
> On Thu, Mar 10, 2022 at 10:09:09PM +0800, Chao Peng wrote:
> >  static inline bool kvm_slot_is_private(const struct kvm_memory_slot *slot)
> > diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> > index 67349421eae3..52319f49d58a 100644
> > --- a/virt/kvm/kvm_main.c
> > +++ b/virt/kvm/kvm_main.c
> > @@ -841,8 +841,43 @@ static int kvm_init_mmu_notifier(struct kvm *kvm)
> >  #endif /* CONFIG_MMU_NOTIFIER && KVM_ARCH_WANT_MMU_NOTIFIER */
> >  
> >  #ifdef CONFIG_MEMFILE_NOTIFIER
> > +static void kvm_memfile_notifier_handler(struct memfile_notifier *notifier,
> > +					 pgoff_t start, pgoff_t end)
> > +{
> > +	int idx;
> > +	struct kvm_memory_slot *slot = container_of(notifier,
> > +						    struct kvm_memory_slot,
> > +						    notifier);
> > +	struct kvm_gfn_range gfn_range = {
> > +		.slot		= slot,
> > +		.start		= start - (slot->private_offset >> PAGE_SHIFT),
> > +		.end		= end - (slot->private_offset >> PAGE_SHIFT),
> > +		.may_block 	= true,
> > +	};
> > +	struct kvm *kvm = slot->kvm;
> > +
> > +	gfn_range.start = max(gfn_range.start, slot->base_gfn);
> > +	gfn_range.end = min(gfn_range.end, slot->base_gfn + slot->npages);
> > +
> > +	if (gfn_range.start >= gfn_range.end)
> > +		return;
> > +
> > +	idx = srcu_read_lock(&kvm->srcu);
> > +	KVM_MMU_LOCK(kvm);
> > +	kvm_unmap_gfn_range(kvm, &gfn_range);
> > +	kvm_flush_remote_tlbs(kvm);
> > +	KVM_MMU_UNLOCK(kvm);
> > +	srcu_read_unlock(&kvm->srcu, idx);
> 
> Should this also invalidate gfn_to_pfn_cache mappings? Otherwise it seems
> possible the kernel might end up inadvertantly writing to now-private guest
> memory via a now-stale gfn_to_pfn_cache entry.

Yes.  Ideally we'd get these flows to share common code and avoid these goofs.
I tried very briefly but they're just different enough to make it ugly.

