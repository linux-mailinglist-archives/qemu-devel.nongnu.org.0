Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 639A74F9D5B
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Apr 2022 20:55:39 +0200 (CEST)
Received: from localhost ([::1]:40960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nctlg-0005gt-BG
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 14:55:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nctkK-00050b-Ls
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 14:54:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55496)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nctkG-0006TA-KN
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 14:54:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649444047;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9uyU2VFoeBsyhZOJQIlctyu40TJSn7XsF2RPXyVl1do=;
 b=bPbJpzFTWJ1kz+HbNC8CputV4kqjt3EqDmVP0l7nUYx4EsrhnA6u0XW00SgrmliA8NjrS6
 Z00od8mtowCCuTEsXKXNA5/iNoZKTpKJzUFSquw7JcFOWojwUqSYA0azShz0qBGpN2IC2K
 7KD05f5tQd02w3Ol4O/n4BAOCl4OHaE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-499-5Vd_d1GxM0yn1cPi4Oloqg-1; Fri, 08 Apr 2022 14:54:06 -0400
X-MC-Unique: 5Vd_d1GxM0yn1cPi4Oloqg-1
Received: by mail-wm1-f71.google.com with SMTP id
 f12-20020a05600c154c00b0038ea9ed0a4aso908975wmg.1
 for <qemu-devel@nongnu.org>; Fri, 08 Apr 2022 11:54:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:organization:subject
 :in-reply-to:content-transfer-encoding;
 bh=9uyU2VFoeBsyhZOJQIlctyu40TJSn7XsF2RPXyVl1do=;
 b=QHvuLbFmQF+Jse6ifNyH//baCLy3SBlZqnygTNHLDg0BW2cWG/YgO5Q1bPA03lyKRj
 8GT1wmzzYICgI8lxEcd3kNkk70XImvLzrvD4b14U4oKb7uZYiB1xjE8JAtlB2m53c2dm
 P3R/UiS5kA6PI9ARfrk0XTKRx4nLCR/pvVGp4dP4gdfoPu0OJPlhAijrz8rm0HMRgjTb
 FHke9sTsi+PpmhEiDEv76swnQanFRbmAPUurn+8O4j2+oVb0+2ABQrPL5dbfB+vDhMgW
 z6rlxn7F9/tZqxZ+/34GJKlc/ShEwLdH+uKpn74v+8y/+FBu/tN8fmYhHce2PCXN7AGy
 Lt8A==
X-Gm-Message-State: AOAM531qkQ9e1UPfOCjLzhcy4XYDByI2BPwkUX9NynWmMJF86/YrlqiF
 qpljKuvy7G+eGhqzOslOQYNY1XhzyhxlNXyBsC9twW6YVeuVW27TXOJppkRSHS+UHH8fs8Uiv9I
 iPrRPfXtLIu7aef4=
X-Received: by 2002:a05:600c:4f96:b0:38e:7dbf:f80b with SMTP id
 n22-20020a05600c4f9600b0038e7dbff80bmr18613239wmq.2.1649444044867; 
 Fri, 08 Apr 2022 11:54:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwfhFIN8L3LyDcNyYvbpwcm/BIFpkPDSLWEfCSbEb0j8Zms39cvKkg2Ev9kPXAaH+LcMXIctA==
X-Received: by 2002:a05:600c:4f96:b0:38e:7dbf:f80b with SMTP id
 n22-20020a05600c4f9600b0038e7dbff80bmr18613189wmq.2.1649444044533; 
 Fri, 08 Apr 2022 11:54:04 -0700 (PDT)
Received: from ?IPV6:2003:cb:c704:fd00:612:f12b:a4a2:26b0?
 (p200300cbc704fd000612f12ba4a226b0.dip0.t-ipconnect.de.
 [2003:cb:c704:fd00:612:f12b:a4a2:26b0])
 by smtp.gmail.com with ESMTPSA id
 o19-20020a05600c511300b0038d0d8f67e5sm10994785wms.16.2022.04.08.11.54.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Apr 2022 11:54:04 -0700 (PDT)
Message-ID: <7ab689e7-e04d-5693-f899-d2d785b09892@redhat.com>
Date: Fri, 8 Apr 2022 20:54:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
To: Sean Christopherson <seanjc@google.com>, Andy Lutomirski <luto@kernel.org>
References: <20220310140911.50924-1-chao.p.peng@linux.intel.com>
 <20220310140911.50924-5-chao.p.peng@linux.intel.com>
 <Yk8L0CwKpTrv3Rg3@google.com>
 <02e18c90-196e-409e-b2ac-822aceea8891@www.fastmail.com>
 <YlB3Z8fqJ+67a2Ck@google.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v5 04/13] mm/shmem: Restrict MFD_INACCESSIBLE memory
 against RLIMIT_MEMLOCK
In-Reply-To: <YlB3Z8fqJ+67a2Ck@google.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
 qemu-devel@nongnu.org, "J . Bruce Fields" <bfields@fieldses.org>,
 linux-mm@kvack.org, "H. Peter Anvin" <hpa@zytor.com>,
 Chao Peng <chao.p.peng@linux.intel.com>, Andi Kleen <ak@linux.intel.com>,
 Jonathan Corbet <corbet@lwn.net>, Joerg Roedel <joro@8bytes.org>,
 the arch/x86 maintainers <x86@kernel.org>, Hugh Dickins <hughd@google.com>,
 Steven Price <steven.price@arm.com>, Ingo Molnar <mingo@redhat.com>,
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Borislav Petkov <bp@alien8.de>, "Nakajima, Jun" <jun.nakajima@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jim Mattson <jmattson@google.com>,
 Dave Hansen <dave.hansen@intel.com>, Linux API <linux-api@vger.kernel.org>,
 Jeff Layton <jlayton@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Yu Zhang <yu.c.zhang@linux.intel.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 linux-fsdevel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Vishal Annapurve <vannapurve@google.com>, Mike Rapoport <rppt@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08.04.22 19:56, Sean Christopherson wrote:
> On Thu, Apr 07, 2022, Andy Lutomirski wrote:
>>
>> On Thu, Apr 7, 2022, at 9:05 AM, Sean Christopherson wrote:
>>> On Thu, Mar 10, 2022, Chao Peng wrote:
>>>> Since page migration / swapping is not supported yet, MFD_INACCESSIBLE
>>>> memory behave like longterm pinned pages and thus should be accounted to
>>>> mm->pinned_vm and be restricted by RLIMIT_MEMLOCK.
>>>>
>>>> Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
>>>> ---
>>>>  mm/shmem.c | 25 ++++++++++++++++++++++++-
>>>>  1 file changed, 24 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/mm/shmem.c b/mm/shmem.c
>>>> index 7b43e274c9a2..ae46fb96494b 100644
>>>> --- a/mm/shmem.c
>>>> +++ b/mm/shmem.c
>>>> @@ -915,14 +915,17 @@ static void notify_fallocate(struct inode *inode, pgoff_t start, pgoff_t end)
>>>>  static void notify_invalidate_page(struct inode *inode, struct folio *folio,
>>>>  				   pgoff_t start, pgoff_t end)
>>>>  {
>>>> -#ifdef CONFIG_MEMFILE_NOTIFIER
>>>>  	struct shmem_inode_info *info = SHMEM_I(inode);
>>>>  
>>>> +#ifdef CONFIG_MEMFILE_NOTIFIER
>>>>  	start = max(start, folio->index);
>>>>  	end = min(end, folio->index + folio_nr_pages(folio));
>>>>  
>>>>  	memfile_notifier_invalidate(&info->memfile_notifiers, start, end);
>>>>  #endif
>>>> +
>>>> +	if (info->xflags & SHM_F_INACCESSIBLE)
>>>> +		atomic64_sub(end - start, &current->mm->pinned_vm);
>>>
>>> As Vishal's to-be-posted selftest discovered, this is broken as current->mm
>>> may be NULL.  Or it may be a completely different mm, e.g. AFAICT there's
>>> nothing that prevents a different process from punching hole in the shmem
>>> backing.
>>>
>>
>> How about just not charging the mm in the first place?  There’s precedent:
>> ramfs and hugetlbfs (at least sometimes — I’ve lost track of the current
>> status).
>>
>> In any case, for an administrator to try to assemble the various rlimits into
>> a coherent policy is, and always has been, quite messy. ISTM cgroup limits,
>> which can actually add across processes usefully, are much better.
>>
>> So, aside from the fact that these fds aren’t in a filesystem and are thus
>> available by default, I’m not convinced that this accounting is useful or
>> necessary.
>>
>> Maybe we could just have some switch require to enable creation of private
>> memory in the first place, and anyone who flips that switch without
>> configuring cgroups is subject to DoS.
> 
> I personally have no objection to that, and I'm 99% certain Google doesn't rely
> on RLIMIT_MEMLOCK.
> 

It's unnacceptable for distributions to have random unprivileged users
be able to allocate an unlimited amount of unmovable memory. And any
kind of these "switches" won't help a thing because the distribution
will have to enable them either way.

I raised in the past that accounting might be challenging, so it's no
surprise that something popped up now.

RLIMIT_MEMLOCK was the obvious candidate, but as we discovered int he
past already with secretmem, it's not 100% that good of a fit (unmovable
is worth than mlocked). But it gets the job done for now at least.

So I'm open for alternative to limit the amount of unmovable memory we
might allocate for user space, and then we could convert seretmem as well.

Random switches are not an option.

-- 
Thanks,

David / dhildenb


