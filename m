Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B4F149AE43
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 09:43:54 +0100 (CET)
Received: from localhost ([::1]:40942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCHQf-00043h-5S
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 03:43:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1nCH6O-0007ao-1J
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 03:22:57 -0500
Received: from mga17.intel.com ([192.55.52.151]:19290)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1nCH6I-0002sj-IR
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 03:22:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643098970; x=1674634970;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=nQhmw9tqKel7ByAdCmGlBqrn9SP/aEAWIm/Z2cqpZcs=;
 b=jrGW4rEenJDIIg4Uukx2l6fIBivtsML0JbQK5rxRLhyCgbXwSyb9h8Bd
 oIXb/n2MNQHZTLWZFIYbGY5s7G6sl5OKJR75o7jWc7sTwxd0lFLG2Zsfq
 vBrDqX2SXJVFJnS8n0hMYBHrv9qWcbkixOZGhc/xsAIim3Jm1e4LIxG3f
 e4EiVG/Xw998scfT/q/oJjH9X3lbxVAbZNTRXfPc72MQQBcKOFoQqsfEM
 OML7pyTQd4D7lQvEmMbq6+2XSWlf2KKM0qPyGlvfh2AWqWoT4ryFYLDh2
 SsCLAqOUmZ7dx6YNdwq7VaeQ64GLN+IfIc1RQQqk4K1VwUuaSQPfbsmWe Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10237"; a="226922314"
X-IronPort-AV: E=Sophos;i="5.88,314,1635231600"; d="scan'208";a="226922314"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2022 00:22:46 -0800
X-IronPort-AV: E=Sophos;i="5.88,314,1635231600"; d="scan'208";a="534628975"
Received: from xiaoyaol-mobl.ccr.corp.intel.com (HELO [10.255.30.216])
 ([10.255.30.216])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2022 00:22:40 -0800
Message-ID: <21af8d43-75dd-6b32-5362-f8a9575cba8f@intel.com>
Date: Tue, 25 Jan 2022 16:22:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [RFC PATCH v2 20/44] i386/tdx: Parse tdx metadata and store the
 result into TdxGuestState
Content-Language: en-US
To: Gerd Hoffmann <kraxel@redhat.com>
References: <cover.1625704980.git.isaku.yamahata@intel.com>
 <acaf651389c3f407a9d6d0a2e943daf0a85bb5fc.1625704981.git.isaku.yamahata@intel.com>
 <20210826111838.fgbp6v6gd5wzbnho@sirius.home.kraxel.org>
 <a97a75ad-9d1c-a09f-281b-d6b0a7652e78@intel.com>
 <4eb6a628-0af6-409b-7e42-52787ee3e69d@redhat.com>
 <e74fcb88-3add-4bb7-4508-742db44fa3c8@intel.com>
 <20220110110120.ldjekirdzgmgex4z@sirius.home.kraxel.org>
 <8793aa69-3416-d48e-d690-9f70b1784b46@intel.com>
 <20220125074225.sqxukflp3vat7ilu@sirius.home.kraxel.org>
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20220125074225.sqxukflp3vat7ilu@sirius.home.kraxel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=192.55.52.151; envelope-from=xiaoyao.li@intel.com;
 helo=mga17.intel.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.158,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.56, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: isaku.yamahata@intel.com, cohuck@redhat.com,
 "Daniel P. Berrange" <berrange@redhat.com>, ehabkost@redhat.com,
 kvm@vger.kernel.org, mst@redhat.com, seanjc@google.com, alistair@alistair23.me,
 qemu-devel@nongnu.org, mtosatti@redhat.com, "Min M . Xu" <min.m.xu@intel.com>,
 erdemaktas@google.com, pbonzini@redhat.com, Laszlo Ersek <lersek@redhat.com>,
 isaku.yamahata@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/25/2022 3:42 PM, Gerd Hoffmann wrote:
>> Regarding what interface should be used to load TDVF, there are three
>> options:
>>
>>    1) pflash: the same as how we load OVMF.
>>
>>    Suppose TDVF support will finally get into OVMF, using this
>>    interface, it's full compatible with normal VMs. No change required
>>    to QEMU command line and TDVF binary is mapped to the GPA address
>>    right below 4G, but they are actually mapped as RAM.
>>
>>    Of course, we need several hacks (special handling) in QEMU.
> 
> What kind if "hack"?

For example, several pflash codes require the support of read-only 
memslot from KVM. We need to absolve it for TDX guest.

And the pflash won't work as a flash device that no write induced 
KVM_EXIT_MMIO will go to its callback.

>>    Of course, they don't work as flash, the change made to it doesn't
>>    persist.
>>
>>    2) -bios
>>
>>    exploit "-bios" parameter to load TDVF. But again, read-only is not
>>    supported. TDVF is mapped as RAM.
>>
>>    3) generic loader
>>
>>    Just like what this series does. Implement specific parser in generic
>>    loader to load and parse TDVF as private RAM.
>>
>> I'm nor sure if 1) is acceptable from your side. If not, we will go with
>> option 3, since 2) doesn't make too much sense.
> 
> Yep, Daniel (Cc'ed) tried (2) recently for SEV.  Didn't work due to
> differences in -bios and -pflash reset handling.  So that option is
> out I guess.
> 
> SEV uses (1), and there is some support code which you should be able to
> reuse (walker for the list of guid-sections with meta-data in the ovmf
> reset vector for example).
> 
> So TDX going for (1) too is probably the best option.

Yes. With option 1), it's friendly to user that no command change.
And also compatible for future TDX/TDVF when non-volatile variable is 
supported.

Next version of this series will go with option 1). Let's wait and see 
if the real implementation is acceptable or not.

> take care,
>    Gerd
> 


