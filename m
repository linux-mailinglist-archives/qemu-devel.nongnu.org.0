Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB0C4F9C00
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Apr 2022 19:48:47 +0200 (CEST)
Received: from localhost ([::1]:51438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncsj0-0006L1-7R
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 13:48:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1ncsfw-00054p-HE
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 13:45:37 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:44792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1ncsfu-0003kK-Bn
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 13:45:36 -0400
Received: by mail-pl1-x632.google.com with SMTP id j8so8500364pll.11
 for <qemu-devel@nongnu.org>; Fri, 08 Apr 2022 10:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=s27MJ117DUPs53Z7xdyXtL5VHtZQFh7zZ/JJA1Nflns=;
 b=V/XQJHgMs2oCFW1wMCzCu+sTQ+qvof+T4DGcnXyShnLN40r97RvaZgCWqaB78Qch/p
 hlNQfGpJCLosKzyjptBpAtUlu2msEfNdyb/bGr9IbxmQXxwc8S43cxnLeInmnSeVV5jp
 mSp5D5zKMUHUgwIeudpGNIrVm9dVL8KrKUOHyioUdZQvPb9QSKGTlZf0zo2HVU14BTvz
 Evd//HQ+uy7+Bs8J0HiKe/NnDUBy24QcdWdFasR/HpYwnSC078Mf5dwvpsiFC2kYtwZ/
 SiWNYN+ad5d2SVglSEMGaIUqJhtmjwyYsX1T0x1z9Oqgiao6haG5JSxUyWS297eSqO9E
 r7bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=s27MJ117DUPs53Z7xdyXtL5VHtZQFh7zZ/JJA1Nflns=;
 b=w2j59h8Tlxq2b3YLLSmltuYOyys2AcX4srd0JBFdNg3/l6735Q4+AJ7PYKNuVoNh3N
 es7EJkatLo3RbTr0kP8s8JixoAfSkmF6Ye4/6rxeh6/TpAQcEKLJZjSuVGMbRLYh+LSW
 PZJ3PLvi/24tNH2TPGOtuY8tvXBjqADXWA+GYRsve+3aKFZH4b9aK4Wl5TIaMh1xPwz9
 8y98w+Z5X108zr30Ocwzu+gBtDdFZROydPuSnYL/UGEvIjHqK7eDD3yNG6QP0rZpWQ9m
 EwKdDb+Mk2bDfHJynpOBMfYEGL8hcL/BeFWelJKtM7NFzBJvMIMSb+5NvYxNsu7OJpKP
 EyZA==
X-Gm-Message-State: AOAM532ZpVPEOlNo2zZAaTMCePqIPRmBiNJfIoy57SL60J9n1lxeKoyY
 OwmY6fbreIBZAsgNj8rX+3f3Bw==
X-Google-Smtp-Source: ABdhPJz2PLnM5p3wbYInU8k2mPvxFUdB4gG7Xt0HvGtcuAR9qQdgQ3+6H0J5e/oTUgFcZECrT000HA==
X-Received: by 2002:a17:90a:f189:b0:1ca:c279:1bdf with SMTP id
 bv9-20020a17090af18900b001cac2791bdfmr22988444pjb.185.1649439923187; 
 Fri, 08 Apr 2022 10:45:23 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157]) by smtp.gmail.com with ESMTPSA id
 y3-20020a056a00190300b004fa2411bb92sm28238078pfi.93.2022.04.08.10.45.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 10:45:22 -0700 (PDT)
Date: Fri, 8 Apr 2022 17:45:19 +0000
From: Sean Christopherson <seanjc@google.com>
To: Chao Peng <chao.p.peng@linux.intel.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
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
Subject: Re: [PATCH v5 05/13] KVM: Extend the memslot to support fd-based
 private memory
Message-ID: <YlB0r4wird8tXDrr@google.com>
References: <20220310140911.50924-1-chao.p.peng@linux.intel.com>
 <20220310140911.50924-6-chao.p.peng@linux.intel.com>
 <YkIvEeC3/lgKTLPt@google.com>
 <20220408134641.GD57095@chaop.bj.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220408134641.GD57095@chaop.bj.intel.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=seanjc@google.com; helo=mail-pl1-x632.google.com
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

On Fri, Apr 08, 2022, Chao Peng wrote:
> On Mon, Mar 28, 2022 at 09:56:33PM +0000, Sean Christopherson wrote:
> > struct kvm_userspace_memory_region_ext {
> > #ifdef __KERNEL__
> 
> Is this #ifndef? As I think anonymous struct is only for kernel?

Doh, yes, I inverted that.

> Thanks,
> Chao
> 
> > 	struct kvm_userspace_memory_region region;
> > #else
> > 	struct kvm_userspace_memory_region;
> > #endif
> > 	__u64 private_offset;
> > 	__u32 private_fd;
> > 	__u32 padding[5];
> > };
> > 
> > #ifdef __KERNEL__
> > #define kvm_user_mem_region kvm_userspace_memory_region_ext
> > #endif
> > 
> > [*] https://lore.kernel.org/all/20220301145233.3689119-1-arnd@kernel.org
> > 
> > > +	__u64 private_offset;
> > > +	__u32 private_fd;
> > > +	__u32 padding[5];
> > > +};

