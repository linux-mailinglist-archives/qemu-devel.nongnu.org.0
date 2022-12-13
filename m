Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D088164B4C4
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 13:06:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p541i-0004uT-5A; Tue, 13 Dec 2022 07:04:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1p541b-0004oS-58
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 07:04:45 -0500
Received: from mga11.intel.com ([192.55.52.93])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1p541W-0000v9-Gf
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 07:04:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670933078; x=1702469078;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Mmu9iz+w3ikTp4SbfrscqkeC55Id70T9EZSgNrTlufI=;
 b=mPBMt29nlQ9+kCjr3gfoXdt2D3NQaBpbENTPXIQUwqbjmMdU7sa7bGt1
 3+YZZxFKcSPoplsbPK/8otDe9MBrauWTmvFu/nKFVXqe2F99vWczSQEzL
 A9SWIgcEyAimIISpNYGqaBPTphmM604turrXTBMQ9ZuHDMQ/ClJGirvmY
 rKVMSjSV6LiRsxs01v3OfTinFNOB5Q4B7XPqxiSkNpV/Bm6eKvwbTvCyO
 lU/a8RWkyS+07WsqhZcoLGsIihcK/t1weKCrvqnZdEGWpgV6AFNb4+pTW
 wxPgf5ZXh2ghbbkSoIfRzp8hSZfULaMN70K9+A7S4DRY67SMYvVakSPrG w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10559"; a="315751835"
X-IronPort-AV: E=Sophos;i="5.96,241,1665471600"; d="scan'208";a="315751835"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2022 04:04:30 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10559"; a="598800801"
X-IronPort-AV: E=Sophos;i="5.96,241,1665471600"; d="scan'208";a="598800801"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.255.31.20])
 ([10.255.31.20])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2022 04:04:17 -0800
Message-ID: <4d736cc0-f249-6531-c0af-7093c2c2537f@intel.com>
Date: Tue, 13 Dec 2022 20:04:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.5.1
Subject: Re: [PATCH v10 3/9] KVM: Extend the memslot to support fd-based
 private memory
Content-Language: en-US
To: Chao Peng <chao.p.peng@linux.intel.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-api@vger.kernel.org, linux-doc@vger.kernel.org, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Sean Christopherson <seanjc@google.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Arnd Bergmann <arnd@arndb.de>,
 Naoya Horiguchi <naoya.horiguchi@nec.com>, Miaohe Lin
 <linmiaohe@huawei.com>, x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
 Hugh Dickins <hughd@google.com>, Jeff Layton <jlayton@kernel.org>,
 "J . Bruce Fields" <bfields@fieldses.org>,
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Steven Price <steven.price@arm.com>,
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve <vannapurve@google.com>,
 Yu Zhang <yu.c.zhang@linux.intel.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, luto@kernel.org,
 jun.nakajima@intel.com, dave.hansen@intel.com, ak@linux.intel.com,
 david@redhat.com, aarcange@redhat.com, ddutile@redhat.com,
 dhildenb@redhat.com, Quentin Perret <qperret@google.com>, tabba@google.com,
 Michael Roth <michael.roth@amd.com>, mhocko@suse.com, wei.w.wang@intel.com
References: <20221202061347.1070246-1-chao.p.peng@linux.intel.com>
 <20221202061347.1070246-4-chao.p.peng@linux.intel.com>
 <cd950a78-5c5b-16ef-d0a6-ad2878af067e@intel.com>
 <20221208113003.GE1304936@chaop.bj.intel.com>
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20221208113003.GE1304936@chaop.bj.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=192.55.52.93; envelope-from=xiaoyao.li@intel.com;
 helo=mga11.intel.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.999, HK_RANDOM_FROM=0.999, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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

On 12/8/2022 7:30 PM, Chao Peng wrote:
> On Thu, Dec 08, 2022 at 04:37:03PM +0800, Xiaoyao Li wrote:
>> On 12/2/2022 2:13 PM, Chao Peng wrote:
>>
>> ..
>>
>>> Together with the change, a new config HAVE_KVM_RESTRICTED_MEM is added
>>> and right now it is selected on X86_64 only.
>>>
>>
>>  From the patch implementation, I have no idea why HAVE_KVM_RESTRICTED_MEM is
>> needed.
> 
> The reason is we want KVM further controls the feature enabling. An
> opt-in CONFIG_RESTRICTEDMEM can cause problem if user sets that for
> unsupported architectures.

HAVE_KVM_RESTRICTED_MEM is not used in this patch. It's better to 
introduce it in the patch that actually uses it.

> Here is the original discussion:
> https://lore.kernel.org/all/YkJLFu98hZOvTSrL@google.com/
> 
> Thanks,
> Chao


