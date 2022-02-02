Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EADA74A6E0A
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 10:46:19 +0100 (CET)
Received: from localhost ([::1]:36936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFCDS-0004XA-Au
	for lists+qemu-devel@lfdr.de; Wed, 02 Feb 2022 04:46:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.price@arm.com>)
 id 1nFBrO-0004q2-Lp
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 04:23:34 -0500
Received: from foss.arm.com ([217.140.110.172]:38870)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <steven.price@arm.com>) id 1nFBrL-0005nm-CH
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 04:23:29 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 949B71FB;
 Wed,  2 Feb 2022 01:23:24 -0800 (PST)
Received: from [10.57.10.145] (unknown [10.57.10.145])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0DB623F40C;
 Wed,  2 Feb 2022 01:23:17 -0800 (PST)
Message-ID: <74a4a56f-539e-c51b-d90b-d2d6f55a34a3@arm.com>
Date: Wed, 2 Feb 2022 09:23:16 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 00/12] KVM: mm: fd-based approach for supporting KVM
 guest private memory
Content-Language: en-GB
To: "Nakajima, Jun" <jun.nakajima@intel.com>
References: <20220118132121.31388-1-chao.p.peng@linux.intel.com>
 <3326f57a-169d-8eb8-2b8b-0379c33ba7a5@arm.com>
 <08A0882C-2E35-4CFD-9176-FCB6665D1F3E@intel.com>
From: Steven Price <steven.price@arm.com>
In-Reply-To: <08A0882C-2E35-4CFD-9176-FCB6665D1F3E@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: Wanpeng Li <wanpengli@tencent.com>, KVM list <kvm@vger.kernel.org>,
 "david@redhat.com" <david@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "J . Bruce Fields" <bfields@fieldses.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 "H . Peter Anvin" <hpa@zytor.com>, Chao Peng <chao.p.peng@linux.intel.com>,
 "ak@linux.intel.com" <ak@linux.intel.com>, Jonathan Corbet <corbet@lwn.net>,
 Joerg Roedel <joro@8bytes.org>, "x86@kernel.org" <x86@kernel.org>,
 Hugh Dickins <hughd@google.com>, Ingo Molnar <mingo@redhat.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Borislav Petkov <bp@alien8.de>,
 "Lutomirski, Andy" <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Jim Mattson <jmattson@google.com>,
 "Hansen, Dave" <dave.hansen@intel.com>, "Christopherson, ,
 Sean" <seanjc@google.com>, Jeff Layton <jlayton@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, Yu Zhang <yu.c.zhang@linux.intel.com>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Jun,

On 02/02/2022 02:28, Nakajima, Jun wrote:
> 
>> On Jan 28, 2022, at 8:47 AM, Steven Price <steven.price@arm.com> wrote:
>>
>> On 18/01/2022 13:21, Chao Peng wrote:
>>> This is the v4 of this series which try to implement the fd-based KVM
>>> guest private memory. The patches are based on latest kvm/queue branch
>>> commit:
>>>
>>>  fea31d169094 KVM: x86/pmu: Fix available_event_types check for
>>>               REF_CPU_CYCLES event
>>>
>>> Introduction
>>> ------------
>>> In general this patch series introduce fd-based memslot which provides
>>> guest memory through memory file descriptor fd[offset,size] instead of
>>> hva/size. The fd can be created from a supported memory filesystem
>>> like tmpfs/hugetlbfs etc. which we refer as memory backing store. KVM
>>> and the the memory backing store exchange callbacks when such memslot
>>> gets created. At runtime KVM will call into callbacks provided by the
>>> backing store to get the pfn with the fd+offset. Memory backing store
>>> will also call into KVM callbacks when userspace fallocate/punch hole
>>> on the fd to notify KVM to map/unmap secondary MMU page tables.
>>>
>>> Comparing to existing hva-based memslot, this new type of memslot allows
>>> guest memory unmapped from host userspace like QEMU and even the kernel
>>> itself, therefore reduce attack surface and prevent bugs.
>>>
>>> Based on this fd-based memslot, we can build guest private memory that
>>> is going to be used in confidential computing environments such as Intel
>>> TDX and AMD SEV. When supported, the memory backing store can provide
>>> more enforcement on the fd and KVM can use a single memslot to hold both
>>> the private and shared part of the guest memory. 
>>
>> This looks like it will be useful for Arm's Confidential Compute
>> Architecture (CCA) too - in particular we need a way of ensuring that
>> user space cannot 'trick' the kernel into accessing memory which has
>> been delegated to a realm (i.e. protected guest), and a memfd seems like
>> a good match.
> 
> Good to hear that it will be useful for ARM’s CCA as well.
> 
>>
>> Some comments below.
>>
>>> mm extension
>>> ---------------------
>>> Introduces new F_SEAL_INACCESSIBLE for shmem and new MFD_INACCESSIBLE
>>> flag for memfd_create(), the file created with these flags cannot read(),
>>> write() or mmap() etc via normal MMU operations. The file content can
>>> only be used with the newly introduced memfile_notifier extension.
>>
>> For Arm CCA we are expecting to seed the realm with an initial memory
>> contents (e.g. kernel and initrd) which will then be measured before
>> execution starts. The 'obvious' way of doing this with a memfd would be
>> to populate parts of the memfd then seal it with F_SEAL_INACCESSIBLE.
> 
> As far as I understand, we have the same problem with TDX, where a guest TD (Trust Domain) starts in private memory. We seed the private memory typically with a guest firmware, and the initial image (plaintext) is copied to somewhere in QEMU memory (from disk, for example) for that purpose; this location is not associated with the target GPA.
> 
> Upon a (new) ioctl from QEMU, KVM requests the TDX Module to copy the pages to private memory (by encrypting) specifying the target GPA, using a TDX interface function (TDH.MEM.PAGE.ADD). The actual pages for the private memory is allocated by the callbacks provided by the backing store during the “copy” operation.
> 
> We extended the existing KVM_MEMORY_ENCRYPT_OP (ioctl) for the above. 

Ok, so if I understand correctly QEMU would do something along the lines of:

1. Use memfd_create(...MFD_INACCESSIBLE) to allocate private memory for
the guest.

2. ftruncate/fallocate the memfd to back the appropriate areas of the memfd.

3. Create a memslot in KVM pointing to the memfd

4. Load the 'guest firmware' (kernel/initrd or similar) into VMM memory

5. Use the KVM_MEMORY_ENCRYPT_OP to request the 'guest firmware' be
copied into the private memory. The ioctl would temporarily pin the
pages and ask the TDX module to copy (& encrypt) the data into the
private memory, unpinning after the copy.

6. QEMU can then free the unencrypted copy of the guest firmware.

>>
>> However as things stand it's not possible to set the INACCESSIBLE seal
>> after creating a memfd (F_ALL_SEALS hasn't been updated to include it).
>>
>> One potential workaround would be for arm64 to provide a custom KVM
>> ioctl to effectively memcpy() into the guest's protected memory which
>> would only be accessible before the guest has started. The drawback is
>> that it requires two copies of the data during guest setup.
> 
> So, the guest pages are not encrypted in the realm?

The pages are likely to be encrypted, but architecturally it doesn't
matter - the hardware prevents the 'Normal World' accessing the pages
when they are assigned to the realm. Encryption is only necessary to
protect against hardware attacks (e.g. bus snooping).

> I think you could do the same thing, i.e. KVM copies the pages to the realm, where pages are allocated by the backing store. But, yes, it will have two copies of the data at that time unless encrypted. .

I'm not sure I follow the "unless encrypted" part of that.

>>
>> Do you think things could be relaxed so the F_SEAL_INACCESSIBLE flag
>> could be set after a memfd has been created (and partially populated)?
>>
> 
> I think F_SEAL_INACCESSIBLE could be deferred to the point where measurement of the initial image is done (we call “build-time” measurement in TDX). For example, if we add a callback to activate F_SEAL_INACCESSIBLE and KVM calls it before such the measurement time, does that work for you?

Yes, if it's possible to defer setting the F_SEAL_INACCESSIBLE then it
should be possible for QEMU to load the initial 'guest firmware'
straight into the memfd. Then to launch the guest the trusted component
only needs to protect and measure the populated pages - there's no need
to copy the data from one set of pages to another. This removes the need
to have two copies of the initial image in memory at the point of measuring.

Thanks,

Steve

