Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B749D5B2DDB
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Sep 2022 06:57:41 +0200 (CEST)
Received: from localhost ([::1]:38566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWW5E-00008o-SN
	for lists+qemu-devel@lfdr.de; Fri, 09 Sep 2022 00:57:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luto@kernel.org>) id 1oWW3D-00078J-Bj
 for qemu-devel@nongnu.org; Fri, 09 Sep 2022 00:55:35 -0400
Received: from dfw.source.kernel.org ([139.178.84.217]:38368)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luto@kernel.org>) id 1oWW3A-0007ug-JU
 for qemu-devel@nongnu.org; Fri, 09 Sep 2022 00:55:34 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2B05661E8B;
 Fri,  9 Sep 2022 04:55:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69DD9C433C1;
 Fri,  9 Sep 2022 04:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1662699330;
 bh=msAn2untxTbG9lve9YPiSW6u+1kfRzel1BmeAbbTzVk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=IKpdWrtStwoZtZ8Zp9KpRJe1T01ctzX66EYNB7h2x8B4rtGdZP9oYfts2NOHcp1Kh
 E1cA58qajYyLtbh77dc2M+/EoeARTgA9xWAWZ4e9XN/mL8rv8RfSZlJP8LXwLggjmY
 YpRluduZsf7cTrFjP4TfVLVCoO0ysDpWAqC+fgIuJ0YrwP/sS0O+AXsXLFqy83uAvb
 XvSwOe03Uha8ElXacHenw22uJDKmJ4cL4fTSkDreOUCeYZMs6kr0YHWmtdGDqUj9bE
 ogaegpX9MZ8RpBZW/2ATqKUOaVyI4yqiiItNREGu3ok+kqbbK6NSi9juXf/vUiVBT0
 U2x+iNrNJgM/g==
Message-ID: <8f2fdba8-ce19-0dff-5934-5d51cde94915@kernel.org>
Date: Thu, 8 Sep 2022 21:55:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v7 00/14] KVM: mm: fd-based approach for supporting KVM
 guest private memory
Content-Language: en-US
To: Chao Peng <chao.p.peng@linux.intel.com>,
 Sean Christopherson <seanjc@google.com>
Cc: David Hildenbrand <david@redhat.com>, Hugh Dickins <hughd@google.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
 linux-doc@vger.kernel.org, qemu-devel@nongnu.org,
 linux-kselftest@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Wanpeng Li <wanpengli@tencent.com>, Jim Mattson <jmattson@google.com>,
 Joerg Roedel <joro@8bytes.org>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
 Jeff Layton <jlayton@kernel.org>, "J . Bruce Fields" <bfields@fieldses.org>,
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Steven Price <steven.price@arm.com>,
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve <vannapurve@google.com>,
 Yu Zhang <yu.c.zhang@linux.intel.com>, jun.nakajima@intel.com,
 dave.hansen@intel.com, ak@linux.intel.com, aarcange@redhat.com,
 ddutile@redhat.com, dhildenb@redhat.com, Quentin Perret
 <qperret@google.com>, Michael Roth <michael.roth@amd.com>, mhocko@suse.com,
 Muchun Song <songmuchun@bytedance.com>, "Gupta, Pankaj"
 <pankaj.gupta@amd.com>
References: <20220706082016.2603916-1-chao.p.peng@linux.intel.com>
 <ff5c5b97-acdf-9745-ebe5-c6609dd6322e@google.com>
 <20220818132421.6xmjqduempmxnnu2@box> <Yv7XTON3MwuC1Q3U@google.com>
 <226ab26d-9aa8-dce2-c7f0-9e3f5b65b63@google.com>
 <b2743a3a-a1b4-2d2e-98be-87b58ad387cf@redhat.com>
 <YwT6x2g9jcMH60LI@google.com> <20220824094149.GA1383966@chaop.bj.intel.com>
From: Andy Lutomirski <luto@kernel.org>
In-Reply-To: <20220824094149.GA1383966@chaop.bj.intel.com>
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

On 8/24/22 02:41, Chao Peng wrote:
> On Tue, Aug 23, 2022 at 04:05:27PM +0000, Sean Christopherson wrote:
>> On Tue, Aug 23, 2022, David Hildenbrand wrote:
>>> On 19.08.22 05:38, Hugh Dickins wrote:
>>>> On Fri, 19 Aug 2022, Sean Christopherson wrote:
>>>>> On Thu, Aug 18, 2022, Kirill A . Shutemov wrote:
>>>>>> On Wed, Aug 17, 2022 at 10:40:12PM -0700, Hugh Dickins wrote:
>>>>>>> On Wed, 6 Jul 2022, Chao Peng wrote:
>>>>>>> But since then, TDX in particular has forced an effort into preventing
>>>>>>> (by flags, seals, notifiers) almost everything that makes it shmem/tmpfs.
>>>>>>>
>>>>>>> Are any of the shmem.c mods useful to existing users of shmem.c? No.
>>>>>>> Is MFD_INACCESSIBLE useful or comprehensible to memfd_create() users? No.
>>>>>
>>>>> But QEMU and other VMMs are users of shmem and memfd.  The new features certainly
>>>>> aren't useful for _all_ existing users, but I don't think it's fair to say that
>>>>> they're not useful for _any_ existing users.
>>>>
>>>> Okay, I stand corrected: there exist some users of memfd_create()
>>>> who will also have use for "INACCESSIBLE" memory.
>>>
>>> As raised in reply to the relevant patch, I'm not sure if we really have
>>> to/want to expose MFD_INACCESSIBLE to user space. I feel like this is a
>>> requirement of specific memfd_notifer (memfile_notifier) implementations
>>> -- such as TDX that will convert the memory and MCE-kill the machine on
>>> ordinary write access. We might be able to set/enforce this when
>>> registering a notifier internally instead, and fail notifier
>>> registration if a condition isn't met (e.g., existing mmap).
>>>
>>> So I'd be curious, which other users of shmem/memfd would benefit from
>>> (MMU)-"INACCESSIBLE" memory obtained via memfd_create()?
>>
>> I agree that there's no need to expose the inaccessible behavior via uAPI.  Making
>> it a kernel-internal thing that's negotiated/resolved when KVM binds to the fd
>> would align INACCESSIBLE with the UNMOVABLE and UNRECLAIMABLE flags (and any other
>> flags that get added in the future).
>>
>> AFAICT, the user-visible flag is a holdover from the early RFCs and doesn't provide
>> any unique functionality.
> 
> That's also what I'm thinking. And I don't see problem immediately if
> user has populated the fd at the binding time. Actually that looks an
> advantage for previously discussed guest payload pre-loading.

I think this gets awkward. Trying to define sensible semantics for what 
happens if a shmem or similar fd gets used as secret guest memory and 
that fd isn't utterly and completely empty can get quite nasty.  For 
example:

If there are already mmaps, then TDX (much more so than SEV) really 
doesn't want to also use it as guest memory.

If there is already data in the fd, then maybe some technologies can use 
this for pre-population, but TDX needs explicit instructions in order to 
get the guest's hash right.


In general, it seems like it will be much more likely to actually work 
well if the user (uAPI) is required to declare to the kernel exactly 
what the fd is for (e.g. TDX secret memory, software-only secret memory, 
etc) before doing anything at all with it other than binding it to KVM.

INACCESSIBLE is a way to achieve this.  Maybe it's not the prettiest in 
the world -- I personally would rather see an explicit request for, say, 
TDX or SEV memory or maybe the memory that works for a particular KVM 
instance instead of something generic like INACCESSIBLE, but this is a 
pretty weak preference.  But I think that just starting with a plain 
memfd is a can of worms.

