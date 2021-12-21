Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 936CF47C34C
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 16:46:34 +0100 (CET)
Received: from localhost ([::1]:47122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzhLV-0000ve-OZ
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 10:46:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1mzhJs-000056-Vt
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 10:44:53 -0500
Received: from [2607:f8b0:4864:20::429] (port=42724
 helo=mail-pf1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1mzhJn-0006pY-8W
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 10:44:52 -0500
Received: by mail-pf1-x429.google.com with SMTP id t19so5795209pfg.9
 for <qemu-devel@nongnu.org>; Tue, 21 Dec 2021 07:44:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=k/JMvwK29hd8F/EfV5XzDRnc59RW8yzi0W84ODXNMgs=;
 b=AbVrsJdBc5MN3KQC0A9AIyS9IRMdFjbEfvVJtUC3LZIrYXKcfifwgybiMrJ1dzyejd
 q8YUFb1QM78QNIXTzVIec5gAsnLvo3X4AAG9zJHBWwIwUsGBs7Az4wPXZREawmQ76537
 D4yK7omm6pLvt14gmta/yF+uKHmpG3uYwhvqYGCO1YbTfXustV5RYUKJ6USZinlk6B9J
 dms6mrO1SjUxJjtuiu0tTWEq3XPddVfxNpbBEmbK2Nvq8909cqhkI5e1UBaZoLob+Zff
 NFQDtXgY+753bzTe2lIKwytRe5IF/iysrdIxwl5Qq0gfzEU22ZxLymbf3FGvWJr/8MfY
 IGdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=k/JMvwK29hd8F/EfV5XzDRnc59RW8yzi0W84ODXNMgs=;
 b=JILFP0mKWn4vWRvTUsgi4uvbvVDZ9ngrFu0q1LAxMe3w9DbEx0A7HI0CqgU++23Ydz
 e7PNu8JdGI74fERWBGAmEuzW3du+yzb8Fo1dhGbP4MA52yF9q6RMJpPb/R51tfLXH3Qb
 Y7zCtVlh3l4+jkw49zYpvs0gVC8iBAsSWS6WOgpt0jKRI5XFIYr7NHhihcKWp2TVA0H3
 j1AkAE4fRJUPiHNZW2nltef649SVBvbmMjvc2G2ODzeErELxFdsdz1q6Sje24xOsM4ab
 8KTUHT5xxTGy4sdePO5PZE0GBJhH30TayZK6qqfE1zPnu69LS9+FA0ZwOSaN2GDUX8U5
 L3bw==
X-Gm-Message-State: AOAM530DMHSv53AV2qosD+Kt7KD+e7+HNkGowgeQ3rfTz3foptv0/YFc
 +7Wwd9B5P+/snS/SPMV6vIZmiw==
X-Google-Smtp-Source: ABdhPJxrzNHBFbWmw0xZGAtZ2iGNWlJDv22rYelmdk8vCnJP2iZK3gUwsvnZ7g69hELWZvhhMRjJJA==
X-Received: by 2002:a63:8249:: with SMTP id w70mr3516432pgd.274.1640101484781; 
 Tue, 21 Dec 2021 07:44:44 -0800 (PST)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157])
 by smtp.gmail.com with ESMTPSA id s16sm22577607pfu.109.2021.12.21.07.44.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Dec 2021 07:44:44 -0800 (PST)
Date: Tue, 21 Dec 2021 15:44:40 +0000
From: Sean Christopherson <seanjc@google.com>
To: Chao Peng <chao.p.peng@linux.intel.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
 Hugh Dickins <hughd@google.com>, Jeff Layton <jlayton@kernel.org>,
 "J . Bruce Fields" <bfields@fieldses.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Yu Zhang <yu.c.zhang@linux.intel.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 luto@kernel.org, john.ji@intel.com, susie.li@intel.com,
 jun.nakajima@intel.com, dave.hansen@intel.com, ak@linux.intel.com,
 david@redhat.com
Subject: Re: [PATCH v3 00/15] KVM: mm: fd-based approach for supporting KVM
 guest private memory
Message-ID: <YcH2aGNJn57pLihJ@google.com>
References: <20211221151125.19446-1-chao.p.peng@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211221151125.19446-1-chao.p.peng@linux.intel.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::429
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=seanjc@google.com; helo=mail-pf1-x429.google.com
X-Spam_score_int: -138
X-Spam_score: -13.9
X-Spam_bar: -------------
X-Spam_report: (-13.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, FSL_HELO_FAKE=2.899, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Tue, Dec 21, 2021, Chao Peng wrote:
> This is the third version of this series which try to implement the
> fd-based KVM guest private memory.

...

> Test
> ----
> This code has been tested with latest TDX code patches hosted at
> (https://github.com/intel/tdx/tree/kvm-upstream) with minimal TDX
> adaption and QEMU support.
> 
> Example QEMU command line:
> -object tdx-guest,id=tdx \
> -object memory-backend-memfd-private,id=ram1,size=2G \
> -machine q35,kvm-type=tdx,pic=no,kernel_irqchip=split,memory-encryption=tdx,memory-backend=ram1
> 
> Changelog
> ----------
> v3:
>   - Added locking protection when calling
>     invalidate_page_range/fallocate callbacks.
>   - Changed memslot structure to keep use useraddr for shared memory.
>   - Re-organized F_SEAL_INACCESSIBLE and MEMFD_OPS.
>   - Added MFD_INACCESSIBLE flag to force F_SEAL_INACCESSIBLE.
>   - Commit message improvement.
>   - Many small fixes for comments from the last version.

Can you rebase on top of kvm/queue and send a new version?  There's a massive
overhaul of KVM's memslots code that's queued for 5.17, and the KVM core changes
in this series conflict mightily.

It's ok if the private memslot support isn't tested exactly as-is, it's not like
any of us reviewers can test it anyways, but I would like to be able to apply
cleanly and verify that the series doesn't break existing functionality.

This version also appears to be based on an internal development branch, e.g. patch
12/15 has some bits from the TDX series.

@@ -336,6 +348,7 @@ struct kvm_tdx_exit {
 #define KVM_EXIT_X86_BUS_LOCK     33
 #define KVM_EXIT_XEN              34
 #define KVM_EXIT_RISCV_SBI        35
+#define KVM_EXIT_MEMORY_ERROR     36
 #define KVM_EXIT_TDX              50   /* dump number to avoid conflict. */

 /* For KVM_EXIT_INTERNAL_ERROR */
@@ -554,6 +567,8 @@ struct kvm_run {
                        unsigned long args[6];
                        unsigned long ret[2];
                } riscv_sbi;
+               /* KVM_EXIT_MEMORY_ERROR */
+               struct kvm_memory_exit mem;
                /* KVM_EXIT_TDX_VMCALL */
                struct kvm_tdx_exit tdx;
                /* Fix the size of the union. */


