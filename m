Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB9F6915A7
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 01:35:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQHO9-0007IF-MO; Thu, 09 Feb 2023 19:35:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1pQHO7-0007I2-ND
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 19:35:39 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1pQHO5-0002WY-SW
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 19:35:39 -0500
Received: by mail-pj1-x1032.google.com with SMTP id mi9so3656281pjb.4
 for <qemu-devel@nongnu.org>; Thu, 09 Feb 2023 16:35:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=W7YPU86kRh43fh/B9xA9EKXQH40cZnkadx8AsjXbI3M=;
 b=n02O/fL0+7AmXTmeiZ+eZ9d5ZT/GiXiS4usm8YWkyYIOPv66XejcWTG/tLJzS4ejkM
 ovnmjNf+/V4WMPR5hJhke3vD4GplhYtvL9vEmYS6rKRFRInOWY36YmcSGRlRlXtIqk2x
 zyyYNZ5RPe7YC1b4z/lhTrlqaQI8TZd/6fcFdDffIo1BEQ/N3P7wZXdRNFCaaVDVEmaC
 k7EM7JL4YwRd8/j1fpMwi0Sv19KAavj/Z3Lox3YCddOW/BESEhsEfDKnGobVr1uu+fRI
 IcumcKWqHnYFfcFoEuc9ODLNMlqMcGwYmuqo7O/bx2Pw8Bf2iZVjEA7+bSDnR5xz4m5D
 EuCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W7YPU86kRh43fh/B9xA9EKXQH40cZnkadx8AsjXbI3M=;
 b=lNp6bOJ6BUUbt6qksHszpw57XpL1pyqJI5bBZ3yPZVYq1pYlDu1CztSCmQapETJJtm
 9MrgJJo4hGDa8ZoDJ97jvSm7iK0h3iIegCLZg9mvNb8s6kcyskXIE9o63ztk+1yU5ETK
 PeZ/Lm5zLJ7R5Ic6DQStn6dcnbSdTM6i6eZ/DoxnKTBIolCLL1oRIad0MNIKJDCSrwdC
 RYpu0U4NOlaGHSeOkLrEDz/muKq7BgS2Z5YMvGS3PdWR3fNwogVuUtRCOKl1t34cCgNo
 i8KgWl6aKplkVsjXKvAtTWFVLSTSGpHyI0IlC0qOZnzN3Y/PR+Nv+YZpACLlpXzKJOSv
 0AFw==
X-Gm-Message-State: AO0yUKVWSFt4XgenLeIiieRw3lIbxqNOA2brFldEnqNkBPak2ti3HUe8
 HQSB1v2hYCh37SHP7kZQffCS0A==
X-Google-Smtp-Source: AK7set/11E4jpVghRlgOmElBR2Eplp/YT9s1l5QVxf/giHCfieVdfEaQkx8Mgi5PszE54dGY0TW/bw==
X-Received: by 2002:a17:902:e551:b0:19a:6cd2:a658 with SMTP id
 n17-20020a170902e55100b0019a6cd2a658mr34785plf.7.1675989335399; 
 Thu, 09 Feb 2023 16:35:35 -0800 (PST)
Received: from google.com (7.104.168.34.bc.googleusercontent.com.
 [34.168.104.7]) by smtp.gmail.com with ESMTPSA id
 a11-20020a1709027e4b00b00189b2b8dbedsm2069302pln.228.2023.02.09.16.35.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Feb 2023 16:35:34 -0800 (PST)
Date: Fri, 10 Feb 2023 00:35:30 +0000
From: Sean Christopherson <seanjc@google.com>
To: Isaku Yamahata <isaku.yamahata@gmail.com>
Cc: Chao Peng <chao.p.peng@linux.intel.com>, kvm@vger.kernel.org,
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
Message-ID: <Y+WRUriIoan/XChx@google.com>
References: <20221202061347.1070246-1-chao.p.peng@linux.intel.com>
 <20221202061347.1070246-3-chao.p.peng@linux.intel.com>
 <20230209072529.GB4175971@ls.amr.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230209072529.GB4175971@ls.amr.corp.intel.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=seanjc@google.com; helo=mail-pj1-x1032.google.com
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

On Wed, Feb 08, 2023, Isaku Yamahata wrote:
> On Fri, Dec 02, 2022 at 02:13:40PM +0800,
> Chao Peng <chao.p.peng@linux.intel.com> wrote:
> 
> > +static int kvm_vm_ioctl_set_mem_attributes(struct kvm *kvm,
> > +					   struct kvm_memory_attributes *attrs)
> > +{
> > +	gfn_t start, end;
> > +	unsigned long i;
> > +	void *entry;
> > +	u64 supported_attrs = kvm_supported_mem_attributes(kvm);
> > +
> > +	/* flags is currently not used. */
> > +	if (attrs->flags)
> > +		return -EINVAL;
> > +	if (attrs->attributes & ~supported_attrs)
> > +		return -EINVAL;
> > +	if (attrs->size == 0 || attrs->address + attrs->size < attrs->address)
> > +		return -EINVAL;
> > +	if (!PAGE_ALIGNED(attrs->address) || !PAGE_ALIGNED(attrs->size))
> > +		return -EINVAL;
> > +
> > +	start = attrs->address >> PAGE_SHIFT;
> > +	end = (attrs->address + attrs->size - 1 + PAGE_SIZE) >> PAGE_SHIFT;
> > +
> > +	entry = attrs->attributes ? xa_mk_value(attrs->attributes) : NULL;
> > +
> > +	mutex_lock(&kvm->lock);
> > +	for (i = start; i < end; i++)
> > +		if (xa_err(xa_store(&kvm->mem_attr_array, i, entry,
> > +				    GFP_KERNEL_ACCOUNT)))
> > +			break;
> > +	mutex_unlock(&kvm->lock);
> > +
> > +	attrs->address = i << PAGE_SHIFT;
> > +	attrs->size = (end - i) << PAGE_SHIFT;
> > +
> > +	return 0;
> > +}
> > +#endif /* CONFIG_HAVE_KVM_MEMORY_ATTRIBUTES */
> > +
> 
> If memslot isn't private, it should return error if private attribute is set.

Why?  I'd rather keep the two things separate.  If we enforce this sort of thing
at KVM_SET_MEMORY_ATTRIBUTES, then we also have to enforce it at
KVM_SET_USER_MEMORY_REGION.

