Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28AF65B2DC9
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Sep 2022 06:51:49 +0200 (CEST)
Received: from localhost ([::1]:51674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWVzX-0006s3-QP
	for lists+qemu-devel@lfdr.de; Fri, 09 Sep 2022 00:51:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luto@kernel.org>) id 1oWVwc-00057A-9p
 for qemu-devel@nongnu.org; Fri, 09 Sep 2022 00:48:46 -0400
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1]:39120)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luto@kernel.org>) id 1oWVwa-0006zq-6g
 for qemu-devel@nongnu.org; Fri, 09 Sep 2022 00:48:45 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 64F2EB822A8;
 Fri,  9 Sep 2022 04:48:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77FD9C433C1;
 Fri,  9 Sep 2022 04:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1662698919;
 bh=0J6ER8fnpFHY39WsvpWQrzmPphu08JvaKTYLSCsE2Hg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Nhj471FrBLU3A3EN6xY82qO+CS7EigLtAFQjoed4e7kJlmYNbsyWx58NBcDcWid+C
 kpl5OUkyH4T1KLqbUBdoGbX1tHo5jzChTsJZhr63Y2a6JPOddewEf+EMoxk93bvuz9
 NqGv5k6mcLo2uOReZLUpdQMNVueJVO1CH7VHOd9P1WHejMuUiLAWq1/eSAkVsNC3Fh
 xd5DtarFsGvOADus8UhKVpVH5D9jaRiIAJe/VLjr3kknWg2PAkKRdx+wB+RLNrdTTE
 S1pu4iFWorBwalJrPWhjEAwsV7cOngtqcJEVDb3sqUBFE54ruJIj9kp8cQq5SkvUdr
 AKq+U1uONwy/g==
Message-ID: <95bd287b-d17f-fda8-58c9-20700b1e0c72@kernel.org>
Date: Thu, 8 Sep 2022 21:48:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v7 00/14] KVM: mm: fd-based approach for supporting KVM
 guest private memory
Content-Language: en-US
To: "Kirill A. Shutemov" <kirill@shutemov.name>,
 Hugh Dickins <hughd@google.com>
Cc: "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Chao Peng <chao.p.peng@linux.intel.com>, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
 linux-doc@vger.kernel.org, qemu-devel@nongnu.org,
 linux-kselftest@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Sean Christopherson <seanjc@google.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, x86@kernel.org,
 "H . Peter Anvin" <hpa@zytor.com>, Jeff Layton <jlayton@kernel.org>,
 "J . Bruce Fields" <bfields@fieldses.org>,
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Steven Price <steven.price@arm.com>,
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve <vannapurve@google.com>,
 Yu Zhang <yu.c.zhang@linux.intel.com>, jun.nakajima@intel.com,
 dave.hansen@intel.com, ak@linux.intel.com, david@redhat.com,
 aarcange@redhat.com, ddutile@redhat.com, dhildenb@redhat.com,
 Quentin Perret <qperret@google.com>, Michael Roth <michael.roth@amd.com>,
 mhocko@suse.com, Muchun Song <songmuchun@bytedance.com>,
 "Gupta, Pankaj" <pankaj.gupta@amd.com>
References: <20220706082016.2603916-1-chao.p.peng@linux.intel.com>
 <ff5c5b97-acdf-9745-ebe5-c6609dd6322e@google.com>
 <20220818132421.6xmjqduempmxnnu2@box>
 <c6ccbb96-5849-2e2f-3b49-4ea711af525d@google.com>
 <20220820002700.6yflrxklmpsavdzi@box.shutemov.name>
From: Andy Lutomirski <luto@kernel.org>
In-Reply-To: <20220820002700.6yflrxklmpsavdzi@box.shutemov.name>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2604:1380:4601:e00::1;
 envelope-from=luto@kernel.org; helo=ams.source.kernel.org
X-Spam_score_int: -102
X-Spam_score: -10.3
X-Spam_bar: ----------
X-Spam_report: (-10.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.142, RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 8/19/22 17:27, Kirill A. Shutemov wrote:
> On Thu, Aug 18, 2022 at 08:00:41PM -0700, Hugh Dickins wrote:
>> On Thu, 18 Aug 2022, Kirill A . Shutemov wrote:
>>> On Wed, Aug 17, 2022 at 10:40:12PM -0700, Hugh Dickins wrote:
>>>>
>>>> If your memory could be swapped, that would be enough of a good reason
>>>> to make use of shmem.c: but it cannot be swapped; and although there
>>>> are some references in the mailthreads to it perhaps being swappable
>>>> in future, I get the impression that will not happen soon if ever.
>>>>
>>>> If your memory could be migrated, that would be some reason to use
>>>> filesystem page cache (because page migration happens to understand
>>>> that type of memory): but it cannot be migrated.
>>>
>>> Migration support is in pipeline. It is part of TDX 1.5 [1]. And swapping
>>> theoretically possible, but I'm not aware of any plans as of now.
>>>
>>> [1] https://www.intel.com/content/www/us/en/developer/articles/technical/intel-trust-domain-extensions.html
>>
>> I always forget, migration means different things to different audiences.
>> As an mm person, I was meaning page migration, whereas a virtualization
>> person thinks VM live migration (which that reference appears to be about),
>> a scheduler person task migration, an ornithologist bird migration, etc.
>>
>> But you're an mm person too: you may have cited that reference in the
>> knowledge that TDX 1.5 Live Migration will entail page migration of the
>> kind I'm thinking of.  (Anyway, it's not important to clarify that here.)
> 
> TDX 1.5 brings both.
> 
> In TDX speak, mm migration called relocation. See TDH.MEM.PAGE.RELOCATE.
> 

This seems to be a pretty bad fit for the way that the core mm migrates 
pages.  The core mm unmaps the page, then moves (in software) the 
contents to a new address, then faults it in.  TDH.MEM.PAGE.RELOCATE 
doesn't fit into that workflow very well.  I'm not saying it can't be 
done, but it won't just work.

