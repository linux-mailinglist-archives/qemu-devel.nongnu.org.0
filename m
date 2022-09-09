Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5021C5B2DB7
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Sep 2022 06:48:13 +0200 (CEST)
Received: from localhost ([::1]:51358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWVw4-00050w-0O
	for lists+qemu-devel@lfdr.de; Fri, 09 Sep 2022 00:48:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luto@kernel.org>) id 1oWVss-00038B-Qc
 for qemu-devel@nongnu.org; Fri, 09 Sep 2022 00:44:55 -0400
Received: from dfw.source.kernel.org ([139.178.84.217]:33598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luto@kernel.org>) id 1oWVsq-0006ON-Gq
 for qemu-devel@nongnu.org; Fri, 09 Sep 2022 00:44:54 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4347D61E94;
 Fri,  9 Sep 2022 04:44:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E45CC433C1;
 Fri,  9 Sep 2022 04:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1662698687;
 bh=enEwLIV4OwLmN/RgbTuEUX2L54sFfCWJPwewzGbYInE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=cLrhFtKHGXINYvsGREelVRIrtsdDSdhyssoSgqKj1qRrv8lKr0eHelXtdnDQr85sC
 vUhwAfnsNzkQoKexpnXMoJMT2YKwm5XKP5lz/55VUhKJAfkOYJlwEC7BQKT5XWACfI
 1k3vOOYkyrSJreY+nrZBkF7nlWbJdvuk7q1CKzdUycNfapzFNnsGW/qGhV4hFmnntR
 OfJ8zVRoAu1qi5JA6EiUBZ7jakY55X0EANPYhumQNRuDzDBGpuIpiLT6sCkdfGVwZE
 3o0LkAEWoAGTiudx3mSdHcf7Y878UhbbaZuVzxJ+2HSUPNQIqSpy8GPq8284tGcG6p
 KiZxc67uW85HQ==
Message-ID: <48f7d192-993d-1df1-db0a-f985e61669b6@kernel.org>
Date: Thu, 8 Sep 2022 21:44:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v7 00/14] KVM: mm: fd-based approach for supporting KVM
 guest private memory
Content-Language: en-US
To: "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Hugh Dickins <hughd@google.com>
Cc: Chao Peng <chao.p.peng@linux.intel.com>, kvm@vger.kernel.org,
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
From: Andy Lutomirski <luto@kernel.org>
In-Reply-To: <20220818132421.6xmjqduempmxnnu2@box>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=139.178.84.217; envelope-from=luto@kernel.org;
 helo=dfw.source.kernel.org
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

On 8/18/22 06:24, Kirill A . Shutemov wrote:
> On Wed, Aug 17, 2022 at 10:40:12PM -0700, Hugh Dickins wrote:
>> On Wed, 6 Jul 2022, Chao Peng wrote:
>>> This is the v7 of this series which tries to implement the fd-based KVM
>>> guest private memory.
>>
>> Here at last are my reluctant thoughts on this patchset.
>>
>> fd-based approach for supporting KVM guest private memory: fine.
>>
>> Use or abuse of memfd and shmem.c: mistaken.
>>
>> memfd_create() was an excellent way to put together the initial prototype.
>>
>> But since then, TDX in particular has forced an effort into preventing
>> (by flags, seals, notifiers) almost everything that makes it shmem/tmpfs.
>>
>> Are any of the shmem.c mods useful to existing users of shmem.c? No.
>> Is MFD_INACCESSIBLE useful or comprehensible to memfd_create() users? No.
>>
>> What use do you have for a filesystem here?  Almost none.
>> IIUC, what you want is an fd through which QEMU can allocate kernel
>> memory, selectively free that memory, and communicate fd+offset+length
>> to KVM.  And perhaps an interface to initialize a little of that memory
>> from a template (presumably copied from a real file on disk somewhere).
>>
>> You don't need shmem.c or a filesystem for that!
>>
>> If your memory could be swapped, that would be enough of a good reason
>> to make use of shmem.c: but it cannot be swapped; and although there
>> are some references in the mailthreads to it perhaps being swappable
>> in future, I get the impression that will not happen soon if ever.
>>
>> If your memory could be migrated, that would be some reason to use
>> filesystem page cache (because page migration happens to understand
>> that type of memory): but it cannot be migrated.
> 
> Migration support is in pipeline. It is part of TDX 1.5 [1]. And swapping
> theoretically possible, but I'm not aware of any plans as of now.
> 
> [1] https://www.intel.com/content/www/us/en/developer/articles/technical/intel-trust-domain-extensions.html
> 

This thing?

https://cdrdv2.intel.com/v1/dl/getContent/733578

That looks like migration between computers, not between NUMA nodes.  Or 
am I missing something?

