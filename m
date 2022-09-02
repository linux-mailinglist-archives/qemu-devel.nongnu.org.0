Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 567CA5AAF50
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Sep 2022 14:36:37 +0200 (CEST)
Received: from localhost ([::1]:59844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oU5uW-0008FL-3h
	for lists+qemu-devel@lfdr.de; Fri, 02 Sep 2022 08:36:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kirill.shutemov@linux.intel.com>)
 id 1oU5oa-0004A6-CS
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 08:30:28 -0400
Received: from mga02.intel.com ([134.134.136.20]:50739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kirill.shutemov@linux.intel.com>)
 id 1oU5oY-0008PQ-Ix
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 08:30:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662121826; x=1693657826;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=fDpXS+mwMN4S7KTgnVwvjs5feZwWXlXraJAIEBzDX2M=;
 b=TQc1lOiRuo8B4URpP8uuP9G5F5+8OINUlGwCJx4HK0DHwPO0oDbkrWf6
 8Di4qzQQEY4TC0stpO9uU3eBQZtZfWm60YLg2JbJh0QPvigh/z646tg2w
 3RVJHlnCKKS+onKAf4tv8fEtLHY0zttJkUdQy/HtDZVsINbufFK1FXO5K
 mDgs+BAfdUmVqOeTikvVNTxvk0+/6x0Up5ducMRTQdkqxWczed3186LN8
 UY1ootLw5qa9HMVBDLVvDmiktg5GK9baCjIO/sTcSHoa2y6ujOiU3GKAS
 HwKGGRk0nqN4/nWBjdn0uAlBG02rePcZYkMfF6UUudFc1xbGfo9U44g69 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10457"; a="282955862"
X-IronPort-AV: E=Sophos;i="5.93,283,1654585200"; d="scan'208";a="282955862"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2022 05:30:23 -0700
X-IronPort-AV: E=Sophos;i="5.93,283,1654585200"; d="scan'208";a="674338766"
Received: from azmijews-mobl2.ger.corp.intel.com (HELO box.shutemov.name)
 ([10.252.45.129])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2022 05:30:12 -0700
Received: by box.shutemov.name (Postfix, from userid 1000)
 id 5AC6D10484B; Fri,  2 Sep 2022 15:30:10 +0300 (+03)
Date: Fri, 2 Sep 2022 15:30:10 +0300
From: "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
To: Chao Peng <chao.p.peng@linux.intel.com>
Cc: Hugh Dickins <hughd@google.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
 linux-doc@vger.kernel.org, qemu-devel@nongnu.org,
 linux-kselftest@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Sean Christopherson <seanjc@google.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
 Jeff Layton <jlayton@kernel.org>,
 "J . Bruce Fields" <bfields@fieldses.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Shuah Khan <shuah@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Steven Price <steven.price@arm.com>,
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve <vannapurve@google.com>,
 Yu Zhang <yu.c.zhang@linux.intel.com>, luto@kernel.org,
 jun.nakajima@intel.com, dave.hansen@intel.com, ak@linux.intel.com,
 david@redhat.com, aarcange@redhat.com, ddutile@redhat.com,
 dhildenb@redhat.com, Quentin Perret <qperret@google.com>,
 Michael Roth <michael.roth@amd.com>, mhocko@suse.com,
 Muchun Song <songmuchun@bytedance.com>,
 "Gupta, Pankaj" <pankaj.gupta@amd.com>,
 Elena Reshetova <elena.reshetova@intel.com>
Subject: Re: [PATCH v7 00/14] KVM: mm: fd-based approach for supporting KVM
 guest private memory
Message-ID: <20220902123010.zfyv6apmo3v67a2i@box.shutemov.name>
References: <20220706082016.2603916-1-chao.p.peng@linux.intel.com>
 <ff5c5b97-acdf-9745-ebe5-c6609dd6322e@google.com>
 <20220818132421.6xmjqduempmxnnu2@box>
 <c6ccbb96-5849-2e2f-3b49-4ea711af525d@google.com>
 <20220820002700.6yflrxklmpsavdzi@box.shutemov.name>
 <c194262b-b634-4baf-abf0-dc727e8f1d7@google.com>
 <20220831142439.65q2gi4g2d2z4ofh@box.shutemov.name>
 <20220902102757.GB1712673@chaop.bj.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220902102757.GB1712673@chaop.bj.intel.com>
Received-SPF: none client-ip=134.134.136.20;
 envelope-from=kirill.shutemov@linux.intel.com; helo=mga02.intel.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Fri, Sep 02, 2022 at 06:27:57PM +0800, Chao Peng wrote:
> > +	if (flags & MFD_INACCESSIBLE) {
> > +		struct file *inaccessible_file;
> > +
> > +		inaccessible_file = memfd_mkinaccessible(file);
> > +		if (IS_ERR(inaccessible_file)) {
> > +			error = PTR_ERR(inaccessible_file);
> > +			goto err_file;
> > +		}
> 
> The new file should alse be marked as O_LARGEFILE otherwise setting the
> initial size greater than 2^31 on the fd will be refused by ftruncate().
> 
> +               inaccessible_file->f_flags |= O_LARGEFILE;
> +

Good catch. Thanks.

I will modify memfd_mkinaccessible() to do this.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov

