Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 796A8695512
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 00:55:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRidu-0007v8-0e; Mon, 13 Feb 2023 18:53:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@gmail.com>)
 id 1pRidp-0007up-RT
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 18:53:49 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@gmail.com>)
 id 1pRido-0003E8-64
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 18:53:49 -0500
Received: by mail-pl1-x62c.google.com with SMTP id i18so6857293pli.3
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 15:53:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=oN12p0IDxvmorHBGQ7GzjlWOyGaJlkT0wNKpNtRNPE8=;
 b=C91FV0IHIHySQTRkb86+GocwXDr8WlYgQiYnUNZd1Ke1PWzwc0Ui3swRKoM/EMugmd
 mtDyIYfBfzKVpqk3ZurWfE4C06NJuP7sWx9xClULK72fPaRyTgD475XUP5w0R0lmJSxg
 fqPMDhOQ1CLyvdP8vm+bEyoR42WnbkStnrKpQAmZxWuxcmJUuRvcyRi1Rk+aqkGEy+qK
 F0pLZENP3TbitJijIx7cS7NuofTEJwgwDOkN5GYMW48d2+LHtiHhs30rOQ3tZSv01O8e
 FB7gFZ7JbhxL0Pno8NSgZttpMsmCG6pRRBkbmMYW6rJKC8Z6IMP2dpIC+LDTcFZNOFFC
 kxfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oN12p0IDxvmorHBGQ7GzjlWOyGaJlkT0wNKpNtRNPE8=;
 b=tO9Pnng40P7m7pbbxVgPvq/5+5IQKkQiezAVe6TnxPekwfK6FGzcSl/yKlLm9UOqCP
 3r42wNZ3GPlUnro+jnU/HY8BcQwNyrcxO8hrlhmV7tVzqQ9d3tuBgwHR9z0mwfqxC9UF
 vHL03fdGg3BDO96PVI6262/7i0vpgJsgDHu25H6tkfotEuNciIXBR/OjeoGRYsinreJp
 Xtj8YtV86Nj75IXY/J0vjsA2+HMzvnX0lE6q8ombakjOBack93xfIrK/UsYsdAPZociH
 tCiKTRr0fgyhH7PycBqMz+/wKcfoDJcZ6m1rp5N5KZtXJUAq5hOSZQxjwdfCle/VReeA
 uCsg==
X-Gm-Message-State: AO0yUKUlrQ4EPk6g35GcA5RJp/by4M+zv6DdbTjteZbsMUXo57Pw8eBH
 QsLF7EO9jPMQ6pWfb0ZAHYs=
X-Google-Smtp-Source: AK7set/amp4VFmNZkQNRNmMa3hykvI7jc+MqhCv8WD2YyR0i7BGfBFGLnLeucu0LFmUtyzTRowTMiQ==
X-Received: by 2002:a05:6a20:12c7:b0:c3:161a:b954 with SMTP id
 v7-20020a056a2012c700b000c3161ab954mr391641pzg.44.1676332425999; 
 Mon, 13 Feb 2023 15:53:45 -0800 (PST)
Received: from localhost ([192.55.54.55]) by smtp.gmail.com with ESMTPSA id
 z20-20020aa791d4000000b0058e08796e98sm8406145pfa.196.2023.02.13.15.53.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 15:53:45 -0800 (PST)
Date: Mon, 13 Feb 2023 15:53:43 -0800
From: Isaku Yamahata <isaku.yamahata@gmail.com>
To: Sean Christopherson <seanjc@google.com>
Cc: Isaku Yamahata <isaku.yamahata@gmail.com>,
 Chao Peng <chao.p.peng@linux.intel.com>, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
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
Subject: Re: [PATCH v10 2/9] KVM: Introduce per-page memory attributes
Message-ID: <20230213235343.GC4175971@ls.amr.corp.intel.com>
References: <20221202061347.1070246-1-chao.p.peng@linux.intel.com>
 <20221202061347.1070246-3-chao.p.peng@linux.intel.com>
 <20230209072529.GB4175971@ls.amr.corp.intel.com>
 <Y+WRUriIoan/XChx@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y+WRUriIoan/XChx@google.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=isaku.yamahata@gmail.com; helo=mail-pl1-x62c.google.com
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

On Fri, Feb 10, 2023 at 12:35:30AM +0000,
Sean Christopherson <seanjc@google.com> wrote:

> On Wed, Feb 08, 2023, Isaku Yamahata wrote:
> > On Fri, Dec 02, 2022 at 02:13:40PM +0800,
> > Chao Peng <chao.p.peng@linux.intel.com> wrote:
> > 
> > > +static int kvm_vm_ioctl_set_mem_attributes(struct kvm *kvm,
> > > +					   struct kvm_memory_attributes *attrs)
> > > +{
> > > +	gfn_t start, end;
> > > +	unsigned long i;
> > > +	void *entry;
> > > +	u64 supported_attrs = kvm_supported_mem_attributes(kvm);
> > > +
> > > +	/* flags is currently not used. */
> > > +	if (attrs->flags)
> > > +		return -EINVAL;
> > > +	if (attrs->attributes & ~supported_attrs)
> > > +		return -EINVAL;
> > > +	if (attrs->size == 0 || attrs->address + attrs->size < attrs->address)
> > > +		return -EINVAL;
> > > +	if (!PAGE_ALIGNED(attrs->address) || !PAGE_ALIGNED(attrs->size))
> > > +		return -EINVAL;
> > > +
> > > +	start = attrs->address >> PAGE_SHIFT;
> > > +	end = (attrs->address + attrs->size - 1 + PAGE_SIZE) >> PAGE_SHIFT;
> > > +
> > > +	entry = attrs->attributes ? xa_mk_value(attrs->attributes) : NULL;
> > > +
> > > +	mutex_lock(&kvm->lock);
> > > +	for (i = start; i < end; i++)
> > > +		if (xa_err(xa_store(&kvm->mem_attr_array, i, entry,
> > > +				    GFP_KERNEL_ACCOUNT)))
> > > +			break;
> > > +	mutex_unlock(&kvm->lock);
> > > +
> > > +	attrs->address = i << PAGE_SHIFT;
> > > +	attrs->size = (end - i) << PAGE_SHIFT;
> > > +
> > > +	return 0;
> > > +}
> > > +#endif /* CONFIG_HAVE_KVM_MEMORY_ATTRIBUTES */
> > > +
> > 
> > If memslot isn't private, it should return error if private attribute is set.
> 
> Why?  I'd rather keep the two things separate.  If we enforce this sort of thing
> at KVM_SET_MEMORY_ATTRIBUTES, then we also have to enforce it at
> KVM_SET_USER_MEMORY_REGION.

For device assignment via shared GPA, non-private memory slot needs to be
allowed.
-- 
Isaku Yamahata <isaku.yamahata@gmail.com>

