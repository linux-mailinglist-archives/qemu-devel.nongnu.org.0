Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4156C5B7E
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 01:42:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pf91S-0000Gx-Kn; Wed, 22 Mar 2023 20:41:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@gmail.com>)
 id 1pf91Q-0000Go-E8
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 20:41:40 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@gmail.com>)
 id 1pf91M-0006p5-E5
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 20:41:39 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 e15-20020a17090ac20f00b0023d1b009f52so369796pjt.2
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 17:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679532093;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Nli6dQUADXkCT93kaRog0dXznCLZzv1eET9HwLL1Hk0=;
 b=EgHbbrk1aauBVwgIaxEGTuMprK1xZNCus6XfsR6fTEbDOFj+ziwreVSGEj/LVGbLgt
 fpWHEknmI6xPnkL3vhPFM8JUBHK+9DFF2XRnJm2G899AmfDNW5psqAw0j1PgntSJmXKs
 OaBchepVlSLISwFFVP/DMUdk/Vy9A9+2NtoMqDw7qbw/4InBCaIA9A3AP5CMb7a5rMlP
 Z0yQiLGinRUrkZV0SfLN2APGES4i35hk6ePSUkjZaTVtkPG1YyZ7rgYx5oJQOyuw/E6b
 H3NTfoUnIpteFYPhEQmsJE48AKcWflqd9VeHjIWIlcgh99q5GI8HZWlel8dFjcqwWv1A
 0Qlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679532093;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Nli6dQUADXkCT93kaRog0dXznCLZzv1eET9HwLL1Hk0=;
 b=yK7d8lAAivTa7gmEPW2/2giklf1bE+MeVYDYK6u6huJkoLvjqvlrs/rqIBpm95/G1O
 A1Qrn7sFCMU2+vY+/0SC11m5kr6SRlQ1zNY+HdKbhQNWenRgVelNbJxKhuD+T2pmbkVR
 4t7XUmddqRi4m+DxsSoAsJw5NLOo/OM4G/mIMHzaSxo2myjZKCuhRke2oTmRkH50r6yF
 vMJUooMHodq9VL07bXg6b3A5B6HnLek1vL1xKN+GumuVTIsIr2bTPHhvpcbcy8c41nOH
 l9jY6+kE4cX9O/hN8BqzB0U4FcRZBrLxUWwhXCnT8gleZEwEQM2doPceCRQgfUeKSdPr
 MnHw==
X-Gm-Message-State: AO0yUKUeX/9mny4HR3gC/jpofuD+7QJMdBPjpgnckRSYW4FIc2cAfRVe
 6UGbltzZF3E6wazvxD0NFnQ=
X-Google-Smtp-Source: AK7set8gXt+r3vrcFcNCwocuZTBvWUUZ3nPNYHgXD8Mgde+9UJkFIYJ5dt0UG9U5gaW437O/xM/diQ==
X-Received: by 2002:a17:90b:384b:b0:23d:5196:eca8 with SMTP id
 nl11-20020a17090b384b00b0023d5196eca8mr6076318pjb.20.1679532093114; 
 Wed, 22 Mar 2023 17:41:33 -0700 (PDT)
Received: from localhost ([192.55.54.55]) by smtp.gmail.com with ESMTPSA id
 q61-20020a17090a17c300b00233db0db3dfsm123775pja.7.2023.03.22.17.41.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Mar 2023 17:41:32 -0700 (PDT)
Date: Wed, 22 Mar 2023 17:41:31 -0700
From: Isaku Yamahata <isaku.yamahata@gmail.com>
To: Chao Peng <chao.p.peng@linux.intel.com>
Cc: Ackerley Tng <ackerleytng@google.com>, seanjc@google.com,
 kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-api@vger.kernel.org,
 linux-doc@vger.kernel.org, qemu-devel@nongnu.org,
 pbonzini@redhat.com, corbet@lwn.net, vkuznets@redhat.com,
 wanpengli@tencent.com, jmattson@google.com, joro@8bytes.org,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, arnd@arndb.de,
 naoya.horiguchi@nec.com, linmiaohe@huawei.com, x86@kernel.org,
 hpa@zytor.com, hughd@google.com, jlayton@kernel.org,
 bfields@fieldses.org, akpm@linux-foundation.org, shuah@kernel.org,
 rppt@kernel.org, steven.price@arm.com, mail@maciej.szmigiero.name,
 vbabka@suse.cz, vannapurve@google.com, yu.c.zhang@linux.intel.com,
 kirill.shutemov@linux.intel.com, luto@kernel.org,
 jun.nakajima@intel.com, dave.hansen@intel.com, ak@linux.intel.com,
 david@redhat.com, aarcange@redhat.com, ddutile@redhat.com,
 dhildenb@redhat.com, qperret@google.com, tabba@google.com,
 michael.roth@amd.com, mhocko@suse.com, wei.w.wang@intel.com,
 isaku.yamahata@gmail.com
Subject: Re: [PATCH v10 9/9] KVM: Enable and expose KVM_MEM_PRIVATE
Message-ID: <20230323004131.GA214881@ls.amr.corp.intel.com>
References: <20230128140030.GB700688@chaop.bj.intel.com>
 <diqz5ybc3xsr.fsf@ackerleytng-cloudtop.c.googlers.com>
 <20230308074026.GA2183207@chaop.bj.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230308074026.GA2183207@chaop.bj.intel.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=isaku.yamahata@gmail.com; helo=mail-pj1-x102e.google.com
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

On Wed, Mar 08, 2023 at 03:40:26PM +0800,
Chao Peng <chao.p.peng@linux.intel.com> wrote:

> On Wed, Mar 08, 2023 at 12:13:24AM +0000, Ackerley Tng wrote:
> > Chao Peng <chao.p.peng@linux.intel.com> writes:
> > 
> > > On Sat, Jan 14, 2023 at 12:01:01AM +0000, Sean Christopherson wrote:
> > > > On Fri, Dec 02, 2022, Chao Peng wrote:
> > > ...
> > > > Strongly prefer to use similar logic to existing code that detects wraps:
> > 
> > > > 		mem->restricted_offset + mem->memory_size < mem->restricted_offset
> > 
> > > > This is also where I'd like to add the "gfn is aligned to offset"
> > > > check, though
> > > > my brain is too fried to figure that out right now.
> > 
> > > Used count_trailing_zeros() for this TODO, unsure we have other better
> > > approach.
> > 
> > > diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> > > index afc8c26fa652..fd34c5f7cd2f 100644
> > > --- a/virt/kvm/kvm_main.c
> > > +++ b/virt/kvm/kvm_main.c
> > > @@ -56,6 +56,7 @@
> > >   #include <asm/processor.h>
> > >   #include <asm/ioctl.h>
> > >   #include <linux/uaccess.h>
> > > +#include <linux/count_zeros.h>
> > 
> > >   #include "coalesced_mmio.h"
> > >   #include "async_pf.h"
> > > @@ -2087,6 +2088,19 @@ static bool kvm_check_memslot_overlap(struct
> > > kvm_memslots *slots, int id,
> > >   	return false;
> > >   }
> > 
> > > +/*
> > > + * Return true when ALIGNMENT(offset) >= ALIGNMENT(gpa).
> > > + */
> > > +static bool kvm_check_rmem_offset_alignment(u64 offset, u64 gpa)
> > > +{
> > > +	if (!offset)
> > > +		return true;
> > > +	if (!gpa)
> > > +		return false;
> > > +
> > > +	return !!(count_trailing_zeros(offset) >= count_trailing_zeros(gpa));

This check doesn't work expected. For example, offset = 2GB, gpa=4GB
this check fails.
I come up with the following.

From ec87e25082f0497431b732702fae82c6a05071bf Mon Sep 17 00:00:00 2001
Message-Id: <ec87e25082f0497431b732702fae82c6a05071bf.1679531995.git.isaku.yamahata@intel.com>
From: Isaku Yamahata <isaku.yamahata@intel.com>
Date: Wed, 22 Mar 2023 15:32:56 -0700
Subject: [PATCH] KVM: Relax alignment check for restricted mem

kvm_check_rmem_offset_alignment() only checks based on offset alignment
and GPA alignment.  However, the actual alignment for offset depends
on architecture.  For x86 case, it can be 1G, 2M or 4K.  So even if
GPA is aligned for 1G+, only 1G-alignment is required for offset.

Without this patch, gpa=4G, offset=2G results in failure of memory slot
creation.

Fixes: edc8814b2c77 ("KVM: Require gfn be aligned with restricted offset")
Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
---
 arch/x86/include/asm/kvm_host.h | 15 +++++++++++++++
 virt/kvm/kvm_main.c             |  9 ++++++++-
 2 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 88e11dd3afde..03af44650f24 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -16,6 +16,7 @@
 #include <linux/irq_work.h>
 #include <linux/irq.h>
 #include <linux/workqueue.h>
+#include <linux/count_zeros.h>
 
 #include <linux/kvm.h>
 #include <linux/kvm_para.h>
@@ -143,6 +144,20 @@
 #define KVM_HPAGE_MASK(x)	(~(KVM_HPAGE_SIZE(x) - 1))
 #define KVM_PAGES_PER_HPAGE(x)	(KVM_HPAGE_SIZE(x) / PAGE_SIZE)
 
+#define kvm_arch_required_alignment	kvm_arch_required_alignment
+static inline int kvm_arch_required_alignment(u64 gpa)
+{
+	int zeros = count_trailing_zeros(gpa);
+
+	WARN_ON_ONCE(!PAGE_ALIGNED(gpa));
+	if (zeros >= KVM_HPAGE_SHIFT(PG_LEVEL_1G))
+		return KVM_HPAGE_SHIFT(PG_LEVEL_1G);
+	else if (zeros >= KVM_HPAGE_SHIFT(PG_LEVEL_2M))
+		return KVM_HPAGE_SHIFT(PG_LEVEL_2M);
+
+	return PAGE_SHIFT;
+}
+
 #define KVM_MEMSLOT_PAGES_TO_MMU_PAGES_RATIO 50
 #define KVM_MIN_ALLOC_MMU_PAGES 64UL
 #define KVM_MMU_HASH_SHIFT 12
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index c9c4eef457b0..f4ff96171d24 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -2113,6 +2113,13 @@ static bool kvm_check_memslot_overlap(struct kvm_memslots *slots, int id,
 	return false;
 }
 
+#ifndef kvm_arch_required_alignment
+__weak int kvm_arch_required_alignment(u64 gpa)
+{
+	return PAGE_SHIFT
+}
+#endif
+
 /*
  * Return true when ALIGNMENT(offset) >= ALIGNMENT(gpa).
  */
@@ -2123,7 +2130,7 @@ static bool kvm_check_rmem_offset_alignment(u64 offset, u64 gpa)
 	if (!gpa)
 		return false;
 
-	return !!(count_trailing_zeros(offset) >= count_trailing_zeros(gpa));
+	return !!(count_trailing_zeros(offset) >= kvm_arch_required_alignment(gpa));
 }
 
 /*
-- 
2.25.1



-- 
Isaku Yamahata <isaku.yamahata@gmail.com>

