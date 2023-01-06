Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A1965FAAD
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 05:19:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDeBP-0006aP-8j; Thu, 05 Jan 2023 23:18:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1pDeBL-0006Zu-0C
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 23:18:15 -0500
Received: from mga09.intel.com ([134.134.136.24])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1pDeBJ-0000fI-2Y
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 23:18:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1672978693; x=1704514693;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=EJ99zGke5SZh6gZ65kHYJO251QjbQMEaDGPaMs8wAzE=;
 b=iAjFy9NktYipfzaOKO69TRb98U9+/AC9DjiF9XIPRF1bnEpA7arQY5pk
 XfTPIXD9CbzNXmBuY3KBNtgPKhoD5iuEmMD5xMpgQuvDXG0k0NBJieRR6
 0bfehhiIYXHrIiImo0BVXmZp+vGoso6NIJtqLec2z+uYz4uRHFfLgf4I2
 cDhWNfThCvREcTBh1/hXVljkq7roY/4sYlKpnf9juAzpmJUYyU1vVwRYK
 BaPMTYIjF+Qf6WLTyvNwvrdnV2/9oHOxHOYLGaGJlB5ZirHPLIzARgJ6h
 Kd3AcE6C3mlnvTe78BJKcQtILtpZ0plpo28gafQdQKAWgXvN/DSE+NDr+ g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10581"; a="323651266"
X-IronPort-AV: E=Sophos;i="5.96,304,1665471600"; d="scan'208";a="323651266"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2023 20:18:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10581"; a="744504828"
X-IronPort-AV: E=Sophos;i="5.96,304,1665471600"; d="scan'208";a="744504828"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.193.75])
 by FMSMGA003.fm.intel.com with ESMTP; 05 Jan 2023 20:17:58 -0800
Date: Fri, 6 Jan 2023 12:13:46 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: Vishal Annapurve <vannapurve@google.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
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
 Vlastimil Babka <vbabka@suse.cz>, Yu Zhang <yu.c.zhang@linux.intel.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 luto@kernel.org, jun.nakajima@intel.com, dave.hansen@intel.com,
 ak@linux.intel.com, david@redhat.com, aarcange@redhat.com,
 ddutile@redhat.com, dhildenb@redhat.com,
 Quentin Perret <qperret@google.com>, tabba@google.com,
 Michael Roth <michael.roth@amd.com>, mhocko@suse.com, wei.w.wang@intel.com
Subject: Re: [PATCH v10 9/9] KVM: Enable and expose KVM_MEM_PRIVATE
Message-ID: <20230106041346.GA2288017@chaop.bj.intel.com>
References: <20221202061347.1070246-1-chao.p.peng@linux.intel.com>
 <20221202061347.1070246-10-chao.p.peng@linux.intel.com>
 <CAGtprH_pbSo1HeEFUEB6ZZxm-=NEw+nLZ6ZVvr76=9BeX=AHPA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGtprH_pbSo1HeEFUEB6ZZxm-=NEw+nLZ6ZVvr76=9BeX=AHPA@mail.gmail.com>
Received-SPF: none client-ip=134.134.136.24;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga09.intel.com
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

On Thu, Jan 05, 2023 at 12:38:30PM -0800, Vishal Annapurve wrote:
> On Thu, Dec 1, 2022 at 10:20 PM Chao Peng <chao.p.peng@linux.intel.com> wrote:
> >
> > +#ifdef CONFIG_HAVE_KVM_RESTRICTED_MEM
> > +static bool restrictedmem_range_is_valid(struct kvm_memory_slot *slot,
> > +                                        pgoff_t start, pgoff_t end,
> > +                                        gfn_t *gfn_start, gfn_t *gfn_end)
> > +{
> > +       unsigned long base_pgoff = slot->restricted_offset >> PAGE_SHIFT;
> > +
> > +       if (start > base_pgoff)
> > +               *gfn_start = slot->base_gfn + start - base_pgoff;
> 
> There should be a check for overflow here in case start is a very big
> value. Additional check can look like:
> if (start >= base_pgoff + slot->npages)
>        return false;
> 
> > +       else
> > +               *gfn_start = slot->base_gfn;
> > +
> > +       if (end < base_pgoff + slot->npages)
> > +               *gfn_end = slot->base_gfn + end - base_pgoff;
> 
> If "end" is smaller than base_pgoff, this can cause overflow and
> return the range as valid. There should be additional check:
> if (end < base_pgoff)
>          return false;

Thanks! Both are good catches. The improved code:

static bool restrictedmem_range_is_valid(struct kvm_memory_slot *slot,
					 pgoff_t start, pgoff_t end,
					 gfn_t *gfn_start, gfn_t *gfn_end)
{
	unsigned long base_pgoff = slot->restricted_offset >> PAGE_SHIFT;

	if (start >= base_pgoff + slot->npages)
		return false;
	else if (start <= base_pgoff)
		*gfn_start = slot->base_gfn;
	else
		*gfn_start = start - base_pgoff + slot->base_gfn;

	if (end <= base_pgoff)
		return false;
	else if (end >= base_pgoff + slot->npages)
		*gfn_end = slot->base_gfn + slot->npages;
	else
		*gfn_end = end - base_pgoff + slot->base_gfn;

	if (*gfn_start >= *gfn_end)
		return false;

	return true;
}

Thanks,
Chao
> 
> 
> > +       else
> > +               *gfn_end = slot->base_gfn + slot->npages;
> > +
> > +       if (*gfn_start >= *gfn_end)
> > +               return false;
> > +
> > +       return true;
> > +}
> > +

