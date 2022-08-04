Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB477589835
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 09:13:52 +0200 (CEST)
Received: from localhost ([::1]:38016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJV3H-0000uG-PU
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 03:13:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@gmail.com>)
 id 1oJV0M-0006MG-Ok
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 03:10:52 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:43885)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@gmail.com>)
 id 1oJV0K-0000XN-US
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 03:10:50 -0400
Received: by mail-pg1-x533.google.com with SMTP id h132so17175657pgc.10
 for <qemu-devel@nongnu.org>; Thu, 04 Aug 2022 00:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Msx+MTdWqnPNVUHp+3FfvLfdSxDAnztRmbALqvTfmJc=;
 b=ee2B6ZmuD7w/b216B4sfnS7nxgF19nbbPD5seH0PzGR35P0l0m9VVe9qFY5joUzJwv
 iGIgbUoJeOoPnK8RYddMDCWsam2EAdTDUk+2AAnJFInausC/w4mQ2e9JWHj5oNqpLmJM
 ZmraEjxD8qh3F/SCH81nNk09N2xF+KP95AbrPc1phVtNBvj5AX3qcNeulUAWJ7Hymogk
 VqWvw5PYeg9pv95ntmSIiWZUY7COS9mMSx+VnBuEmtTMpgIUnMguWM3fOELjfqr08cB9
 YBCc9XKnWP8+/2JP25FF31wt0Z5iUujxqEQEuxCTiUrEDXf51d/LCk8VLAdiABIOIjqV
 3uTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Msx+MTdWqnPNVUHp+3FfvLfdSxDAnztRmbALqvTfmJc=;
 b=7m13NVsHZmUJe++WcHCP2QXxCqEMYyIIcJ722Bq1XxSFybtK/Z6we0beobjUA5nra5
 R5pNvXPY0MP+sVJEECExymwh3FLpZVfN4ux9NiYAlWiY9g7UdRArFjv1XwRAdHvOlXoB
 BtDK3P1iGfRhww8jjbb0OrAgK4V6sbvYkwBc/NfI8z0i/bNxoyu28QhlIqIQERV0WjHm
 gHitnxTGm7UBYjdT4EuE3mlei50BBViKaPuOleUf3u1q//9OklqtCt87/KJoxjkIa1UC
 Q6K4IwcYHBZjb8HVXX55gFKDmAtP/0EGoPYukOoMFQto8mZ73uwrQcRFSATf5gaBibID
 mZsw==
X-Gm-Message-State: ACgBeo3dPfp2Q5O1bXQ54826mlqQDeDTTohB/URpTXP2Miq559b7JKdd
 5zxs6QWXhKKO2jgqGs4/Qvo=
X-Google-Smtp-Source: AA6agR4epr3dQoXSYo3tVKgoUy+uKNO2hxFagEdJ8l6v4De0QEoIfT716hYj4Pnm1/vc1DQPzChKgQ==
X-Received: by 2002:a63:e343:0:b0:41c:d5cd:a39 with SMTP id
 o3-20020a63e343000000b0041cd5cd0a39mr562084pgj.512.1659597046489; 
 Thu, 04 Aug 2022 00:10:46 -0700 (PDT)
Received: from localhost ([192.55.54.49]) by smtp.gmail.com with ESMTPSA id
 n15-20020a056a00212f00b0052deda6e3d2sm137803pfj.98.2022.08.04.00.10.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Aug 2022 00:10:45 -0700 (PDT)
Date: Thu, 4 Aug 2022 00:10:44 -0700
From: Isaku Yamahata <isaku.yamahata@gmail.com>
To: Chao Peng <chao.p.peng@linux.intel.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
 linux-doc@vger.kernel.org, qemu-devel@nongnu.org,
 linux-kselftest@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Sean Christopherson <seanjc@google.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
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
 Muchun Song <songmuchun@bytedance.com>, isaku.yamahata@gmail.com
Subject: Re: [PATCH v7 07/14] KVM: Use gfn instead of hva for
 mmu_notifier_retry
Message-ID: <20220804071044.GA4091749@ls.amr.corp.intel.com>
References: <20220706082016.2603916-1-chao.p.peng@linux.intel.com>
 <20220706082016.2603916-8-chao.p.peng@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220706082016.2603916-8-chao.p.peng@linux.intel.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=isaku.yamahata@gmail.com; helo=mail-pg1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Wed, Jul 06, 2022 at 04:20:09PM +0800,
Chao Peng <chao.p.peng@linux.intel.com> wrote:

> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index 0bdb6044e316..e9153b54e2a4 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -1362,10 +1362,8 @@ void kvm_mmu_free_memory_cache(struct kvm_mmu_memory_cache *mc);
>  void *kvm_mmu_memory_cache_alloc(struct kvm_mmu_memory_cache *mc);
>  #endif
>  
> -void kvm_inc_notifier_count(struct kvm *kvm, unsigned long start,
> -				   unsigned long end);
> -void kvm_dec_notifier_count(struct kvm *kvm, unsigned long start,
> -				   unsigned long end);
> +void kvm_inc_notifier_count(struct kvm *kvm, gfn_t start, gfn_t end);
> +void kvm_dec_notifier_count(struct kvm *kvm, gfn_t start, gfn_t end);
>  
>  long kvm_arch_dev_ioctl(struct file *filp,
>  			unsigned int ioctl, unsigned long arg);

The corresponding changes in kvm_main.c are missing.

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index b2c79bef61bd..0184e327f6f5 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -711,8 +711,7 @@ static void kvm_mmu_notifier_change_pte(struct mmu_notifier *mn,
        kvm_handle_hva_range(mn, address, address + 1, pte, kvm_set_spte_gfn);
 }
 
-void kvm_inc_notifier_count(struct kvm *kvm, unsigned long start,
-                                  unsigned long end)
+void kvm_inc_notifier_count(struct kvm *kvm, gfn_t start, gfn_t end)
 {
        /*
         * The count increase must become visible at unlock time as no
@@ -786,8 +785,7 @@ static int kvm_mmu_notifier_invalidate_range_start(struct mmu_notifier *mn,
        return 0;
 }
 
-void kvm_dec_notifier_count(struct kvm *kvm, unsigned long start,
-                                  unsigned long end)
+void kvm_dec_notifier_count(struct kvm *kvm, gfn_t start, gfn_t end)
 {
        /*
         * This sequence increase will notify the kvm page fault that


-- 
Isaku Yamahata <isaku.yamahata@gmail.com>

