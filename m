Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A3A6E6FF5
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Apr 2023 01:40:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pouuO-0000yx-3z; Tue, 18 Apr 2023 19:38:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3-Sk_ZAsKCnIQSaUhbUojdWWeeWbU.SecgUck-TUlUbdedWdk.ehW@flex--ackerleytng.bounces.google.com>)
 id 1pouuF-0000yb-80
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 19:38:39 -0400
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3-Sk_ZAsKCnIQSaUhbUojdWWeeWbU.SecgUck-TUlUbdedWdk.ehW@flex--ackerleytng.bounces.google.com>)
 id 1pouuC-00083J-Qt
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 19:38:38 -0400
Received: by mail-pl1-x649.google.com with SMTP id
 d9443c01a7336-1a52649285bso18696455ad.0
 for <qemu-devel@nongnu.org>; Tue, 18 Apr 2023 16:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1681861114; x=1684453114;
 h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=KZZcbhEIXep3CsDuGt1XX4NDaxpUgfaEfLEdZFPghSQ=;
 b=hm9bDIHJQIeAjh+0Wi4XwWxk5FEWf9SU2iifaVaFm2SHEQi+MfvRomA6hNFQPypblO
 ajskHfJ21yXbKIgYGAkYYUqP0Ygv5283TmzvvXkvGPLvNGcY8IspXO87zRQLxoMgm7+A
 44LeeK44/TjVVWr4ejNfVV1NjMwkMAjVBZwnQccmKfvNgc/rCXeLfUDkrNJrLDo+aM/k
 5pFpnDDsiw5EE9Dzm//Lga2qY9q3z+kEsegm3Xv/EsUZ8FyYGeSCyJOZ49dURNwlnL2q
 Y5lq2y1JVNHacWD2DjdNMHYSACvPNhgvLrByCLzQkYOtXAP0CIMW0LotNLXFCHIJamQv
 WJuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681861114; x=1684453114;
 h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KZZcbhEIXep3CsDuGt1XX4NDaxpUgfaEfLEdZFPghSQ=;
 b=OSvjmd42qBQ1meIMFn9ky9g14DxEeX//OZBsOXnOxH70wQjZiZbfAsllZqJitTJaq8
 hYAlQU3K6BWcbMmkR6Xzc2u5aJzAIRS7a/8+Kz6keqam/+PAvEzlKdePFvujqnY3hJvw
 RxjLX0tPChYSbgWmnuP1hJHgfBPenm6PZvzCEJTSQw/jhF5v5eprpqEO04zugcwfCOWJ
 o2FlsWN87R5POkszHh1zT03pjnqPHRbS3C2AiUbiQRaHE48oPR4leWFkpicWHanc3Dw+
 gsztWfvqRhuT6eo/Lb2FjVOWWJL0/t3eiQM+oV3TPJVCctIIflC/gqn6tXGAcsCIraJc
 STTg==
X-Gm-Message-State: AAQBX9eTIi5ZcOlQeUBkmqOOEV2bpzY/KHBv0xizMdTzPJ7brr2XB4KD
 kHSQoLNoIHEKqChNhwrjw4H/rhd/XzUiUAo+Pw==
X-Google-Smtp-Source: AKy350Y4yrZy3jVvN3wQp7+RZBqQNJ9wdfC4ADrLjc4RYHgu0a5KoOvNA6U3D5YLtIMfO6ES8yW87Yjz2s2FcMbRug==
X-Received: from ackerleytng-cloudtop.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:1f5f])
 (user=ackerleytng job=sendgmr) by 2002:a17:903:41c5:b0:19a:7bd4:5b0d with
 SMTP id u5-20020a17090341c500b0019a7bd45b0dmr1394106ple.8.1681861113900; Tue,
 18 Apr 2023 16:38:33 -0700 (PDT)
Date: Tue, 18 Apr 2023 23:38:32 +0000
In-Reply-To: <ZDnAuGKrCO2wgjlG@google.com> (message from Sean Christopherson
 on Fri, 14 Apr 2023 14:08:08 -0700)
Mime-Version: 1.0
Message-ID: <diqz354w92x3.fsf@ackerleytng-cloudtop.c.googlers.com>
Subject: Re: [PATCH v10 9/9] KVM: Enable and expose KVM_MEM_PRIVATE
From: Ackerley Tng <ackerleytng@google.com>
To: Sean Christopherson <seanjc@google.com>
Cc: chao.p.peng@linux.intel.com, xiaoyao.li@intel.com, 
 isaku.yamahata@gmail.com, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-api@vger.kernel.org, linux-doc@vger.kernel.org, qemu-devel@nongnu.org, 
 pbonzini@redhat.com, corbet@lwn.net, vkuznets@redhat.com, 
 wanpengli@tencent.com, jmattson@google.com, joro@8bytes.org, 
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, arnd@arndb.de, 
 naoya.horiguchi@nec.com, linmiaohe@huawei.com, x86@kernel.org, hpa@zytor.com, 
 hughd@google.com, jlayton@kernel.org, bfields@fieldses.org, 
 akpm@linux-foundation.org, shuah@kernel.org, rppt@kernel.org, 
 steven.price@arm.com, mail@maciej.szmigiero.name, vbabka@suse.cz, 
 vannapurve@google.com, yu.c.zhang@linux.intel.com, 
 kirill.shutemov@linux.intel.com, luto@kernel.org, jun.nakajima@intel.com, 
 dave.hansen@intel.com, ak@linux.intel.com, david@redhat.com, 
 aarcange@redhat.com, ddutile@redhat.com, dhildenb@redhat.com, 
 qperret@google.com, tabba@google.com, michael.roth@amd.com, mhocko@suse.com, 
 wei.w.wang@intel.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Received-SPF: pass client-ip=2607:f8b0:4864:20::649;
 envelope-from=3-Sk_ZAsKCnIQSaUhbUojdWWeeWbU.SecgUck-TUlUbdedWdk.ehW@flex--ackerleytng.bounces.google.com;
 helo=mail-pl1-x649.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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

Sean Christopherson <seanjc@google.com> writes:

> On Tue, Mar 28, 2023, Chao Peng wrote:
>> On Fri, Mar 24, 2023 at 10:29:25AM +0800, Xiaoyao Li wrote:
>> > On 3/24/2023 10:10 AM, Chao Peng wrote:
>> > > On Wed, Mar 22, 2023 at 05:41:31PM -0700, Isaku Yamahata wrote:
>> > > > On Wed, Mar 08, 2023 at 03:40:26PM +0800,
>> > > > Chao Peng <chao.p.peng@linux.intel.com> wrote:
>> > > >
>> > > > > On Wed, Mar 08, 2023 at 12:13:24AM +0000, Ackerley Tng wrote:
>> > > > > > Chao Peng <chao.p.peng@linux.intel.com> writes:
>> > > > > >
>> > > > > > > On Sat, Jan 14, 2023 at 12:01:01AM +0000, Sean  
>> Christopherson wrote:
>> > > > > > > > On Fri, Dec 02, 2022, Chao Peng wrote:
>> > > > > > > +static bool kvm_check_rmem_offset_alignment(u64 offset, u64  
>> gpa)
>> > > > > > > +{
>> > > > > > > +	if (!offset)
>> > > > > > > +		return true;
>> > > > > > > +	if (!gpa)
>> > > > > > > +		return false;
>> > > > > > > +
>> > > > > > > +	return !!(count_trailing_zeros(offset) >=  
>> count_trailing_zeros(gpa));
>> > > >
>> > > > This check doesn't work expected. For example, offset = 2GB,  
>> gpa=4GB
>> > > > this check fails.
>> > >
>> > > This case is expected to fail as Sean initially suggested[*]:
>> > >    I would rather reject memslot if the gfn has lesser alignment than
>> > >    the offset. I'm totally ok with this approach _if_ there's a use  
>> case.
>> > >    Until such a use case presents itself, I would rather be  
>> conservative
>> > >    from a uAPI perspective.
>> > >
>> > > I understand that we put tighter restriction on this but if you see  
>> such
>> > > restriction is really a big issue for real usage, instead of a
>> > > theoretical problem, then we can loosen the check here. But at that  
>> time
>> > > below code is kind of x86 specific and may need improve.
>> > >
>> > > BTW, in latest code, I replaced count_trailing_zeros() with fls64():
>> > >    return !!(fls64(offset) >= fls64(gpa));
>> >
>> > wouldn't it be !!(ffs64(offset) <= ffs64(gpa)) ?

>> As the function document explains, here we want to return true when
>> ALIGNMENT(offset) >= ALIGNMENT(gpa), so '>=' is what we need.

>> It's worthy clarifying that in Sean's original suggestion he actually
>> mentioned the opposite. He said 'reject memslot if the gfn has lesser
>> alignment than the offset', but I wonder this is his purpose, since
>> if ALIGNMENT(offset) < ALIGNMENT(gpa), we wouldn't be possible to map
>> the page as largepage. Consider we have below config:

>>    gpa=2M, offset=1M

>> In this case KVM tries to map gpa at 2M as 2M hugepage but the physical
>> page at the offset(1M) in private_fd cannot provide the 2M page due to
>> misalignment.

>> But as we discussed in the off-list thread, here we do find a real use
>> case indicating this check is too strict. i.e. QEMU immediately fails
>> when launch a guest > 2G memory. For this case QEMU splits guest memory
>> space into two slots:

>>    Slot#1(ram_below_4G): gpa=0x0, offset=0x0, size=2G
>>    Slot#2(ram_above_4G): gpa=4G,  offset=2G,  size=totalsize-2G

>> This strict alignment check fails for slot#2 because offset(2G) has less
>> alignment than gpa(4G). To allow this, one solution can revert to my
>> previous change in kvm_alloc_memslot_metadata() to disallow hugepage
>> only when the offset/gpa are not aligned to related page size.

>> Sean, How do you think?

> I agree, a pure alignment check is too restrictive, and not really what I  
> intended
> despite past me literally saying that's what I wanted :-)  I think I may  
> have also
> inverted the "less alignment" statement, but luckily I believe that ends  
> up being
> a moot point.

> The goal is to avoid having to juggle scenarios where KVM wants to create  
> a hugepage,
> but restrictedmem can't provide one because of a misaligned file offset.   
> I think
> the rule we want is that the offset must be aligned to the largest page  
> size allowed
> by the memslot _size_.  E.g. on x86, if the memslot size is >=1GiB then  
> the offset
> must be 1GiB or beter, ditto for >=2MiB and >=4KiB (ignoring that 4KiB is  
> already a
> requirement).

> We could loosen that to say the largest size allowed by the memslot, but  
> I don't
> think that's worth the effort unless it's trivially easy to implement in  
> code,
> e.g. KVM could technically allow a 4KiB aligned offset if the memslot is  
> 2MiB
> sized but only 4KiB aligned on the GPA.  I doubt there's a real use case  
> for such
> a memslot, so I want to disallow that unless it's super easy to implement.

Checking my understanding here about why we need this alignment check:

When KVM requests a page from restrictedmem, KVM will provide an offset
into the file in terms of 4K pages.

When shmem is configured to use hugepages, shmem_get_folio() will round
the requested offset down to the nearest hugepage-aligned boundary in
shmem_alloc_hugefolio().

Example of problematic configuration provided to
KVM_SET_USER_MEMORY_REGION2:

+ shmem configured to use 1GB pages
+ restrictedmem_offset provided to KVM_SET_USER_MEMORY_REGION2: 0x4000
+ memory_size provided in KVM_SET_USER_MEMORY_REGION2: 1GB
+ KVM requests offset (pgoff_t) 0x8, which translates to offset 0x8000

restrictedmem_get_page() and shmem_get_folio() returns the page for
offset 0x0 in the file, since rounding down 0x8000 to the nearest 1GB is
0x0. This is allocating outside the range that KVM is supposed to use,
since the parameters provided in KVM_SET_USER_MEMORY_REGION2 is only
supposed to be offset 0x4000 to (0x4000 + 1GB = 0x40004000) in the file.

IIUC shmem will actually just round down (0x4000 rounded down to nearest
1GB will be 0x0) and allocate without checking bounds, so if offset 0x0
to 0x4000 in the file were supposed to be used by something else, there
might be issues.

Hence, this alignment check ensures that rounding down of any offsets
provided by KVM (based on page size configured in the backing file
provided) to restrictedmem_get_page() must not go below the offset
provided to KVM_SET_USER_MEMORY_REGION2.

Enforcing alignment of restrictedmem_offset based on the currently-set
page size in the backing file (i.e. shmem) may not be effective, since
the size of the pages in the backing file can be adjusted to a larger
size after KVM_SET_USER_MEMORY_REGION2 succeeds. With that, we may still
end up allocating outside the range that KVM was provided with.

Hence, to be safe, we should check alignment to the max page size across
all backing filesystems, so the constraint is

     rounding down restrictedmem_offset to
     min(max page size across all backing filesystems,
         max page size that fits in memory_size) == restrictedmem_offset

which is the same check as

     restrictedmem_offset must be aligned to min(max page size across all
     backing filesystems, max page size that fits in memory_size)

which can safely reduce to

     restrictedmem_offset must be aligned to max page size that fits in
     memory_size

since "max page size that fits in memory_size" is probably <= to "max
page size across all backing filesystems", and if it's larger, it'll
just be a tighter constraint.

If the above understanding is correct:

+ We must enforce this in the KVM_SET_USER_MEMORY_REGION2 handler, since
   IIUC shmem will just round down and allocate without checking bounds.

     + I think this is okay because holes in the restrictedmem file (in
       terms of offset) made to accommodate this constraint don't cost us
       anything anyway(?) Are they just arbitrary offsets in a file? In
       our case, this file is usually a new and empty file.

     + In the case of migration of a restrictedmem file between two KVM
       VMs, this constraint would cause a problem is if the largest
       possible page size on the destination machine is larger than that
       of the source machine. In that case, we might have to move the
       data in the file to a different offset (a separate problem).

+ On this note, it seems like there is no check for when the range is
   smaller than the allocated page? Like if the range provided is 4KB in
   size, but shmem is then configured to use a 1GB page, will we end up
   allocating past the end of the range?

