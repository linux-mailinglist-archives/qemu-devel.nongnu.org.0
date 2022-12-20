Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0899651BAF
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 08:30:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7X3y-0008Uj-Lg; Tue, 20 Dec 2022 02:29:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1p7X3v-0008UK-2u
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 02:29:19 -0500
Received: from mga02.intel.com ([134.134.136.20])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1p7X3t-0006ul-8y
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 02:29:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671521357; x=1703057357;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=fjNSa0+921I8s8ST66iQKKAKKNcHFJo2C7vp0DyF6bU=;
 b=Hwa4E7mqsjbNs4E2yC/7gtSoTMu4GQlWQODVNxe0p7jYsxv1RRiVy94P
 T2Dye/o/hMJFIvkzBAI1tiua98ZDvHUtpcYobNqMrQzsLmNQYKYmaOzSR
 lMcH4ci1gumk9fUoHGbJBnjUa8DJp+kma1N/0o1A+UEKL+FImh3qvlkYh
 +In6sZzOtra1b82PUKMyr/IMaVxx4s562cGkGztFtV9GnBIqV4NMc2Wfz
 65xMGJH3d4CcRAlBjvbv/TMNjOr9TPgRh+Zy2cYizPJrW+GsjYXdIEA6P
 gUFDi84/TCqXH4xFULQOZpa0FBpEi+GyN5/F1Z/2To5zmeaRnURXiVQMg A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10566"; a="307230631"
X-IronPort-AV: E=Sophos;i="5.96,258,1665471600"; d="scan'208";a="307230631"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2022 23:29:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10566"; a="775191645"
X-IronPort-AV: E=Sophos;i="5.96,258,1665471600"; d="scan'208";a="775191645"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.193.75])
 by orsmga004.jf.intel.com with ESMTP; 19 Dec 2022 23:29:03 -0800
Date: Tue, 20 Dec 2022 15:24:46 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: Borislav Petkov <bp@alien8.de>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-api@vger.kernel.org, linux-doc@vger.kernel.org,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Sean Christopherson <seanjc@google.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Arnd Bergmann <arnd@arndb.de>,
 Naoya Horiguchi <naoya.horiguchi@nec.com>,
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
Message-ID: <20221220072446.GB1724933@chaop.bj.intel.com>
References: <20221202061347.1070246-1-chao.p.peng@linux.intel.com>
 <20221202061347.1070246-3-chao.p.peng@linux.intel.com>
 <Y5yKEpwCzZpNoBrp@zn.tnic>
 <20221219081532.GD1691829@chaop.bj.intel.com>
 <Y6A6MkFjckQ18fFH@zn.tnic>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y6A6MkFjckQ18fFH@zn.tnic>
Received-SPF: none client-ip=134.134.136.20;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga02.intel.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Reply-To: Chao Peng <chao.p.peng@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Dec 19, 2022 at 11:17:22AM +0100, Borislav Petkov wrote:
> On Mon, Dec 19, 2022 at 04:15:32PM +0800, Chao Peng wrote:
> > Tamping down with error number a bit:
> > 
> >         if (attrs->flags)
> >                 return -ENXIO;
> >         if (attrs->attributes & ~supported_attrs)
> >                 return -EOPNOTSUPP;
> >         if (!PAGE_ALIGNED(attrs->address) || !PAGE_ALIGNED(attrs->size) ||
> >             attrs->size == 0)
> >                 return -EINVAL;
> >         if (attrs->address + attrs->size < attrs->address)
> >                 return -E2BIG;
> 
> Yap, better.
> 
> I guess you should add those to the documentation of the ioctl too
> so that people can find out why it fails. Or, well, they can look
> at the code directly too but still... imagine some blurb about
> user-friendliness here...

Thanks for reminding. Yes KVM api doc is the right place to put these
documentation in.

Thanks,
Chao
> 
> :-)
> 
> -- 
> Regards/Gruss,
>     Boris.
> 
> https://people.kernel.org/tglx/notes-about-netiquette

