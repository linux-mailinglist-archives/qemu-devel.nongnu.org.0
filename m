Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5625A1D54
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 01:45:25 +0200 (CEST)
Received: from localhost ([::1]:56332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRMXM-000318-Gs
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 19:45:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1oRMVc-0001dG-7E
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 19:43:36 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:46639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1oRMVa-0007z0-AC
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 19:43:35 -0400
Received: by mail-pl1-x62a.google.com with SMTP id jm11so136750plb.13
 for <qemu-devel@nongnu.org>; Thu, 25 Aug 2022 16:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc;
 bh=CrkUDi4mYcC3qOEbpgTO1y4xAYzFYl9qfJxBFAO1WQU=;
 b=oH89fuC7/OCch4BVe3RICsoOXGZYywI31GBVdOyyzkOO7DEQwz0A3bC8XVXdtvCwd1
 6++QpYTFdw9m4hHnWiKtTIpB7Hi5ELfJeZuqNN9uFKSo7WfdJ9G1Mhm4JK6AV2WHzXjJ
 VbNzkpdmEXJLIC2dBL9fBoXXr3+4Uapf2ay+q5o5OiTRLYNgKYonwB+ySRb6B5oDeL1+
 dAGtJD3OxzwN4u/yHADk0FqkEVYKITXRoFTnTIyXKBO0WL66kWEVFTEfNMRKnT8HVrqd
 r0phSuI2WdqgmUZxadQTwthKDt4ZrV+UeAwXIY6ktT0Ll4TYsN0WDJRL1/UrY3DGWEjg
 ExLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=CrkUDi4mYcC3qOEbpgTO1y4xAYzFYl9qfJxBFAO1WQU=;
 b=BsYCyjZHoIsPAIXKCS6iKSEnClmGXVdFjXcjmINWJ1beJ4jdp71fpMH0QBtNIxEYYo
 xoumEZjfAhjySnt/0Rg0qea/7+yn8fQxlLWTxaBDJklJJnYZUJp84B0yW+DDAdWw7dgE
 4//T1Cz6WzivdC1AK32kHdYFTwF05Q2+ZyY2ooTragR1kThdSkTQznm2DewsLnSGX1Lw
 YDqJPPCh0VOQJYzm72k4mfhYVEl6J+fnQ2mLU6qWWB74rlUjlWhoMnU3JnSt0mf5ze9i
 ULllLwYRVP0KzjF1p9RMKZ0NTIPaJtOYUcq6Fz7VbgH34eZQ49DE/PiA7UmR96j3gTL4
 mm2Q==
X-Gm-Message-State: ACgBeo0IzM8F7OZ89+1tsHFlO4rWYuPKHzNj16Utxcoj2AYWc7oSAyVF
 wDK6icLbqS6aS18X/caIJjlLZw==
X-Google-Smtp-Source: AA6agR7uDYeONp1wM5VEYWT/Ep3xp8EiV6yvT/4U8QUXuA4MqoQg5QOZ3aLyR1Qey0199Sw+p/pMAg==
X-Received: by 2002:a17:90b:2390:b0:1fa:c680:1f63 with SMTP id
 mr16-20020a17090b239000b001fac6801f63mr1464578pjb.16.1661471012094; 
 Thu, 25 Aug 2022 16:43:32 -0700 (PDT)
Received: from google.com (7.104.168.34.bc.googleusercontent.com.
 [34.168.104.7]) by smtp.gmail.com with ESMTPSA id
 a9-20020aa78e89000000b005379fb50ff0sm216131pfr.50.2022.08.25.16.43.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Aug 2022 16:43:31 -0700 (PDT)
Date: Thu, 25 Aug 2022 23:43:27 +0000
From: Sean Christopherson <seanjc@google.com>
To: "Kirill A. Shutemov" <kirill@shutemov.name>
Cc: Chao Peng <chao.p.peng@linux.intel.com>, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
 linux-doc@vger.kernel.org, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
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
 ak@linux.intel.com, david@redhat.com, aarcange@redhat.com,
 ddutile@redhat.com, dhildenb@redhat.com,
 Quentin Perret <qperret@google.com>,
 Michael Roth <michael.roth@amd.com>, mhocko@suse.com
Subject: Re: [PATCH v6 6/8] KVM: Handle page fault for private memory
Message-ID: <YwgJH0TRZO4ie4z8@google.com>
References: <20220519153713.819591-1-chao.p.peng@linux.intel.com>
 <20220519153713.819591-7-chao.p.peng@linux.intel.com>
 <YqzyjZnflCMPo8b/@google.com>
 <20220819004018.mgdvxhl6dj3ujl3f@box.shutemov.name>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220819004018.mgdvxhl6dj3ujl3f@box.shutemov.name>
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=seanjc@google.com; helo=mail-pl1-x62a.google.com
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

On Fri, Aug 19, 2022, Kirill A. Shutemov wrote:
> On Fri, Jun 17, 2022 at 09:30:53PM +0000, Sean Christopherson wrote:
> > > @@ -4088,7 +4144,12 @@ static int direct_page_fault(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault
> > >  		read_unlock(&vcpu->kvm->mmu_lock);
> > >  	else
> > >  		write_unlock(&vcpu->kvm->mmu_lock);
> > > -	kvm_release_pfn_clean(fault->pfn);
> > > +
> > > +	if (fault->is_private)
> > > +		kvm_private_mem_put_pfn(fault->slot, fault->pfn);
> > 
> > Why does the shmem path lock the page, and then unlock it here?
> 
> Lock is require to avoid race with truncate / punch hole. Like if truncate
> happens after get_pfn(), but before it gets into SEPT we are screwed.

Getting the PFN into the SPTE doesn't provide protection in and of itself.  The
protection against truncation and whatnot comes from KVM getting a notification
and either retrying the fault (notification acquires mmu_lock before
direct_page_fault()), or blocking the notification (truncate / punch hole) until
after KVM installs the SPTE.  I.e. KVM just needs to ensure it doesn't install a
SPTE _after_ getting notified.

If the API is similar to gup(), i.e. only elevates the refcount but doesn't lock
the page, then there's no need for a separate kvm_private_mem_put_pfn(), and in
fact no need for ->put_unlock_pfn() because can KVM do set_page_dirty() and
put_page() directly as needed using all of KVM's existing mechanisms.

