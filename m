Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B994C127E
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 13:10:34 +0100 (CET)
Received: from localhost ([::1]:55298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMqTZ-0002Py-Ao
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 07:10:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.price@arm.com>)
 id 1nMqOq-000886-4w
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 07:05:41 -0500
Received: from foss.arm.com ([217.140.110.172]:45920)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <steven.price@arm.com>) id 1nMqOn-000082-6Y
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 07:05:39 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B9AA7ED1;
 Wed, 23 Feb 2022 04:05:33 -0800 (PST)
Received: from [10.57.37.225] (unknown [10.57.37.225])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 960A63F70D;
 Wed, 23 Feb 2022 04:05:29 -0800 (PST)
Message-ID: <71a06402-6743-bfd2-bbd4-997f8e256554@arm.com>
Date: Wed, 23 Feb 2022 12:05:28 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 01/12] mm/shmem: Introduce F_SEAL_INACCESSIBLE
Content-Language: en-GB
To: Chao Peng <chao.p.peng@linux.intel.com>, Andy Lutomirski <luto@kernel.org>
References: <20220118132121.31388-1-chao.p.peng@linux.intel.com>
 <20220118132121.31388-2-chao.p.peng@linux.intel.com>
 <619547ad-de96-1be9-036b-a7b4e99b09a6@kernel.org>
 <20220217130631.GB32679@chaop.bj.intel.com>
 <2ca78dcb-61d9-4c9d-baa9-955b6f4298bb@www.fastmail.com>
 <20220223114935.GA53733@chaop.bj.intel.com>
From: Steven Price <steven.price@arm.com>
In-Reply-To: <20220223114935.GA53733@chaop.bj.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=217.140.110.172;
 envelope-from=steven.price@arm.com; helo=foss.arm.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Wanpeng Li <wanpengli@tencent.com>, kvm list <kvm@vger.kernel.org>,
 David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org,
 "J . Bruce Fields" <bfields@fieldses.org>, linux-mm@kvack.org,
 "H. Peter Anvin" <hpa@zytor.com>, Andi Kleen <ak@linux.intel.com>,
 Jonathan Corbet <corbet@lwn.net>, Joerg Roedel <joro@8bytes.org>,
 the arch/x86 maintainers <x86@kernel.org>, Hugh Dickins <hughd@google.com>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "Nakajima,
 Jun" <jun.nakajima@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Jim Mattson <jmattson@google.com>,
 Dave Hansen <dave.hansen@intel.com>, Linux API <linux-api@vger.kernel.org>,
 Jeff Layton <jlayton@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Yu Zhang <yu.c.zhang@linux.intel.com>, Sean Christopherson <seanjc@google.com>,
 linux-fsdevel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23/02/2022 11:49, Chao Peng wrote:
> On Thu, Feb 17, 2022 at 11:09:35AM -0800, Andy Lutomirski wrote:
>> On Thu, Feb 17, 2022, at 5:06 AM, Chao Peng wrote:
>>> On Fri, Feb 11, 2022 at 03:33:35PM -0800, Andy Lutomirski wrote:
>>>> On 1/18/22 05:21, Chao Peng wrote:
>>>>> From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
>>>>>
>>>>> Introduce a new seal F_SEAL_INACCESSIBLE indicating the content of
>>>>> the file is inaccessible from userspace through ordinary MMU access
>>>>> (e.g., read/write/mmap). However, the file content can be accessed
>>>>> via a different mechanism (e.g. KVM MMU) indirectly.
>>>>>
>>>>> It provides semantics required for KVM guest private memory support
>>>>> that a file descriptor with this seal set is going to be used as the
>>>>> source of guest memory in confidential computing environments such
>>>>> as Intel TDX/AMD SEV but may not be accessible from host userspace.
>>>>>
>>>>> At this time only shmem implements this seal.
>>>>>
>>>>
>>>> I don't dislike this *that* much, but I do dislike this. F_SEAL_INACCESSIBLE
>>>> essentially transmutes a memfd into a different type of object.  While this
>>>> can apparently be done successfully and without races (as in this code),
>>>> it's at least awkward.  I think that either creating a special inaccessible
>>>> memfd should be a single operation that create the correct type of object or
>>>> there should be a clear justification for why it's a two-step process.
>>>
>>> Now one justification maybe from Stever's comment to patch-00: for ARM
>>> usage it can be used with creating a normal memfd, (partially)populate
>>> it with initial guest memory content (e.g. firmware), and then
>>> F_SEAL_INACCESSIBLE it just before the first time lunch of the guest in
>>> KVM (definitely the current code needs to be changed to support that).
>>
>> Except we don't allow F_SEAL_INACCESSIBLE on a non-empty file, right?  So this won't work.
> 
> Hmm, right, if we set F_SEAL_INACCESSIBLE on a non-empty file, we will 
> need to make sure access to existing mmap-ed area should be prevented,
> but that is hard.
> 
>>
>> In any case, the whole confidential VM initialization story is a bit buddy.  From the earlier emails, it sounds like ARM expects the host to fill in guest memory and measure it.  From my recollection of Intel's scheme (which may well be wrong, and I could easily be confusing it with SGX), TDX instead measures what is essentially a transcript of the series of operations that initializes the VM.  These are fundamentally not the same thing even if they accomplish the same end goal.  For TDX, we unavoidably need an operation (ioctl or similar) that initializes things according to the VM's instructions, and ARM ought to be able to use roughly the same mechanism.
> 
> Yes, TDX requires a ioctl. Steven may comment on the ARM part.

The Arm story is evolving so I can't give a definite answer yet. Our
current prototyping works by creating the initial VM content in a
memslot as with a normal VM and then calling an ioctl which throws the
big switch and converts all the (populated) pages to be protected. At
this point the RMM performs a measurement of the data that the VM is
being populated with.

The above (in our prototype) suffers from all the expected problems with
a malicious VMM being able to trick the host kernel into accessing those
pages after they have been protected (causing a fault detected by the
hardware).

The ideal (from our perspective) approach would be to follow the same
flow but where the VMM populates a memfd rather than normal anonymous
pages. The memfd could then be sealed and the pages converted to
protected ones (with the RMM measuring them in the process).

The question becomes how is that memfd populated? It would be nice if
that could be done using normal operations on a memfd (i.e. using
mmap()) and therefore this code could be (relatively) portable. This
would mean that any pages mapped from the memfd would either need to
block the sealing or be revoked at the time of sealing.

The other approach is we could of course implement a special ioctl which
effectively does a memcpy into the (created empty and sealed) memfd and
does the necessary dance with the RMM to measure the contents. This
would match the "transcript of the series of operations" described above
- but seems much less ideal from the viewpoint of the VMM.

Steve

> Chao
>>
>> Also, if we ever get fancy and teach the page allocator about memory with reduced directmap permissions, it may well be more efficient for userspace to shove data into a memfd via ioctl than it is to mmap it and write the data.
> 
> 
> 


