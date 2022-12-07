Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE8A645410
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Dec 2022 07:35:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2o0Z-0002WA-Lp; Wed, 07 Dec 2022 01:34:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@gmail.com>)
 id 1p2o0X-0002W2-NP
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 01:34:17 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@gmail.com>)
 id 1p2o0V-0005XX-Tv
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 01:34:17 -0500
Received: by mail-pl1-x62d.google.com with SMTP id a9so16151677pld.7
 for <qemu-devel@nongnu.org>; Tue, 06 Dec 2022 22:34:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=C15cHp35UgTVcGwyWVF0FgqoGcE+bZVU/5tK1HiVhGg=;
 b=CKqZ/l9PnwBZEtXNtp4aPBttpJeA89ZaQxsLN+jKw3eUVeg9N70IqMgdpBhfmoMdRN
 wnNcjMkoLzHDq6uSVjjvzsYnerZjG1HIAwRJ1o5QS5Yp8oNstErg28aAus8PdaoLeqx3
 f2++jCdgHb8lDQ6ETyzyDMSqpkHcnxdDTU7zRBcFo3QBH9uNzewTIfvJ1efH8a1UHYv+
 dz6o9xbAOwTWr7xaQjDIg+nKseYPUY71PlOmzpnNJTkqlzgQvjmD1yQTL6sJfRdqQoUC
 XKpDVo69w4cJKZZVhcBHWOWsfC+8Xh7NT3VFznBfTVfB1ab0ptONygi3M5nMJitgBbY6
 fyNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C15cHp35UgTVcGwyWVF0FgqoGcE+bZVU/5tK1HiVhGg=;
 b=vjYOJwv8Yp9CwYKmeIKeua8eK6lc7AT0xTcrqeO26p9hUzpe6rU1KG4y+RdfTot1yQ
 u85eOlHdsPV24ldvJjvxrTVw8GJImAGgJaaTd+PJ1PnvAc6XPL59WBJWH3c+oSoxz0V9
 fBHi+HczKe9WMlHIezrDk45kcAgNTKDRWIBA5cJYJHDOt/p6qwwc4J1LzADHxm2V+GlQ
 Ld3X6MdqmmoYWtW1zvG/El/fBl0dp0hrIA/oeB+lOv+VovwtsQkfljngKMVAXv6+QINb
 MOESNnvTf5cuIo9QJys+hK0SxwR7ORH8RPMo/Dwjs315xzdmZBpZXGXCp+T6KVfokWJ/
 1Z2A==
X-Gm-Message-State: ANoB5plG6fqMQK3VQHP+FEzxXT8NVXUdWPSjRRPzBEZjmVas+4gCwoBi
 CfqGBzcx+YXlP48sWAihw64=
X-Google-Smtp-Source: AA0mqf7ST4xuwmjyV+Fg/LkYpzDRbEp/+IDjSth6MZo3us+POloNmlOnA05Cq/8ntpMh4DvZF8JHuw==
X-Received: by 2002:a17:90a:9313:b0:213:2168:1c78 with SMTP id
 p19-20020a17090a931300b0021321681c78mr99342910pjo.72.1670394853895; 
 Tue, 06 Dec 2022 22:34:13 -0800 (PST)
Received: from localhost ([192.55.54.55]) by smtp.gmail.com with ESMTPSA id
 x6-20020a623106000000b005745eb7eccasm12686643pfx.112.2022.12.06.22.34.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Dec 2022 22:34:12 -0800 (PST)
Date: Tue, 6 Dec 2022 22:34:11 -0800
From: Isaku Yamahata <isaku.yamahata@gmail.com>
To: Chao Peng <chao.p.peng@linux.intel.com>
Cc: Fuad Tabba <tabba@google.com>, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-api@vger.kernel.org, linux-doc@vger.kernel.org,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Sean Christopherson <seanjc@google.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
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
 Quentin Perret <qperret@google.com>,
 Michael Roth <michael.roth@amd.com>, mhocko@suse.com,
 wei.w.wang@intel.com, isaku.yamahata@gmail.com
Subject: Re: [PATCH v10 5/9] KVM: Use gfn instead of hva for mmu_notifier_retry
Message-ID: <20221207063411.GB3632095@ls.amr.corp.intel.com>
References: <20221202061347.1070246-1-chao.p.peng@linux.intel.com>
 <20221202061347.1070246-6-chao.p.peng@linux.intel.com>
 <CA+EHjTy5+Ke_7Uh72p--H9kGcE-PK4EVmp7ym6Q1-PO28u6CCQ@mail.gmail.com>
 <20221206115623.GB1216605@chaop.bj.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221206115623.GB1216605@chaop.bj.intel.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=isaku.yamahata@gmail.com; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Tue, Dec 06, 2022 at 07:56:23PM +0800,
Chao Peng <chao.p.peng@linux.intel.com> wrote:

> > > -       if (unlikely(kvm->mmu_invalidate_in_progress) &&
> > > -           hva >= kvm->mmu_invalidate_range_start &&
> > > -           hva < kvm->mmu_invalidate_range_end)
> > > -               return 1;
> > > +       if (unlikely(kvm->mmu_invalidate_in_progress)) {
> > > +               /*
> > > +                * Dropping mmu_lock after bumping mmu_invalidate_in_progress
> > > +                * but before updating the range is a KVM bug.
> > > +                */
> > > +               if (WARN_ON_ONCE(kvm->mmu_invalidate_range_start == INVALID_GPA ||
> > > +                                kvm->mmu_invalidate_range_end == INVALID_GPA))
> > 
> > INVALID_GPA is an x86-specific define in
> > arch/x86/include/asm/kvm_host.h, so this doesn't build on other
> > architectures. The obvious fix is to move it to
> > include/linux/kvm_host.h.
> 
> Hmm, INVALID_GPA is defined as ZERO for x86, not 100% confident this is
> correct choice for other architectures, but after search it has not been
> used for other architectures, so should be safe to make it common.

INVALID_GPA is defined as all bit 1.  Please notice "~" (tilde).

#define INVALID_GPA (~(gpa_t)0)
-- 
Isaku Yamahata <isaku.yamahata@gmail.com>

