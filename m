Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 618A557C82D
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 11:54:48 +0200 (CEST)
Received: from localhost ([::1]:49922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEStL-0000io-Gl
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 05:54:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oESpa-0005yf-8H
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 05:50:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37417)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oESpX-0002vO-Ur
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 05:50:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658397051;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CO7yqSOqdsoA6FvkegluY8/8ZAYmjQUUu2UI2GMdWBk=;
 b=g0t9sncE7mdImJqYQm7BmbGU86Il0rQ1sVbdiBpMUoWAfy5pZXY1GE88FS+32Sd7qNg4Sw
 Zzy6cXugq5N30Uh1qIY7rV1HILKAMn8JQrhO3VRNE/h+b7KfFasKXMhy8C/Hp20zBxFUhn
 cTr+5fnAQoAB7sGOtSL6UfpB0T3MRwM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-141-fXr1i-ClN5St8DgVRYtu9A-1; Thu, 21 Jul 2022 05:50:49 -0400
X-MC-Unique: fXr1i-ClN5St8DgVRYtu9A-1
Received: by mail-wm1-f71.google.com with SMTP id
 n21-20020a7bc5d5000000b003a2ff4d7a9bso457840wmk.9
 for <qemu-devel@nongnu.org>; Thu, 21 Jul 2022 02:50:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:organization:in-reply-to
 :content-transfer-encoding;
 bh=CO7yqSOqdsoA6FvkegluY8/8ZAYmjQUUu2UI2GMdWBk=;
 b=hHGFk2TT0iaAeEUQOSaNlZdUKNH837GIQkj7guT6x8hP+Md2K3dkJMVqw36munKW+u
 9oAGmlxxfanAkbrIHOyEOVx0Snf7xrWn3RE9HYE6ykkOOwmRA/BDr9ys0WiDcm3u84pd
 1v1ZKnBc7xCE0rKyffDEoZGXG9PFPRb8Q+NAWGOVP3WcCBKzf7ihLX0bRSIlSv+HQkYb
 rfyRB3jaon28y8VbbjAXl0s0cyBAOqgV4kD1OcsFxYJHH97L2UPxRfPQeYlZ3MUxCwt7
 rb9kaxXGVAt9eqMycgUoffy1t7ipksBX8CpA1Vx0ALUrKw4YZj3rFJe5+Y2TnRSavCWC
 hVOA==
X-Gm-Message-State: AJIora/PJykQCwV5d74c/doGtzSr2RghNkwJA/ffNFLcw50vqgN+Pt1m
 jPvkUu3Ndh5QDYnJB2dQjPG0udH90uUkAXGOA/hFQPLxiMAILSzkfVGT7Icgsr0b0LuURcSxxjm
 yLKKhrEvRUrNOrMk=
X-Received: by 2002:a05:600c:cd:b0:3a3:f40:8776 with SMTP id
 u13-20020a05600c00cd00b003a30f408776mr7645499wmm.9.1658397048700; 
 Thu, 21 Jul 2022 02:50:48 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uts89nDIOzg3pgovfDVxNFStA298ovCBRrYUGQIqDJzEAWNm0lSXxPmyA4m/lsmvtQcMdkAw==
X-Received: by 2002:a05:600c:cd:b0:3a3:f40:8776 with SMTP id
 u13-20020a05600c00cd00b003a30f408776mr7645440wmm.9.1658397048195; 
 Thu, 21 Jul 2022 02:50:48 -0700 (PDT)
Received: from ?IPV6:2003:cb:c707:e000:25d3:15fa:4c8b:7e8d?
 (p200300cbc707e00025d315fa4c8b7e8d.dip0.t-ipconnect.de.
 [2003:cb:c707:e000:25d3:15fa:4c8b:7e8d])
 by smtp.gmail.com with ESMTPSA id
 k23-20020a05600c1c9700b003a31b00c216sm1340719wms.0.2022.07.21.02.50.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Jul 2022 02:50:47 -0700 (PDT)
Message-ID: <39067d09-b32b-23a6-ae0e-00ac2fe0466c@redhat.com>
Date: Thu, 21 Jul 2022 11:50:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v7 01/14] mm: Add F_SEAL_AUTO_ALLOCATE seal to memfd
Content-Language: en-US
From: David Hildenbrand <david@redhat.com>
To: Chao Peng <chao.p.peng@linux.intel.com>, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
 linux-doc@vger.kernel.org, qemu-devel@nongnu.org,
 linux-kselftest@vger.kernel.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Sean Christopherson <seanjc@google.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, x86@kernel.org,
 "H . Peter Anvin" <hpa@zytor.com>, Hugh Dickins <hughd@google.com>,
 Jeff Layton <jlayton@kernel.org>, "J . Bruce Fields" <bfields@fieldses.org>,
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Steven Price <steven.price@arm.com>,
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve <vannapurve@google.com>,
 Yu Zhang <yu.c.zhang@linux.intel.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, luto@kernel.org,
 jun.nakajima@intel.com, dave.hansen@intel.com, ak@linux.intel.com,
 aarcange@redhat.com, ddutile@redhat.com, dhildenb@redhat.com,
 Quentin Perret <qperret@google.com>, Michael Roth <michael.roth@amd.com>,
 mhocko@suse.com, Muchun Song <songmuchun@bytedance.com>
References: <20220706082016.2603916-1-chao.p.peng@linux.intel.com>
 <20220706082016.2603916-2-chao.p.peng@linux.intel.com>
 <f39c4f63-a511-4beb-b3a4-66589ddb5475@redhat.com>
Organization: Red Hat
In-Reply-To: <f39c4f63-a511-4beb-b3a4-66589ddb5475@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 21.07.22 11:44, David Hildenbrand wrote:
> On 06.07.22 10:20, Chao Peng wrote:
>> Normally, a write to unallocated space of a file or the hole of a sparse
>> file automatically causes space allocation, for memfd, this equals to
>> memory allocation. This new seal prevents such automatically allocating,
>> either this is from a direct write() or a write on the previously
>> mmap-ed area. The seal does not prevent fallocate() so an explicit
>> fallocate() can still cause allocating and can be used to reserve
>> memory.
>>
>> This is used to prevent unintentional allocation from userspace on a
>> stray or careless write and any intentional allocation should use an
>> explicit fallocate(). One of the main usecases is to avoid memory double
>> allocation for confidential computing usage where we use two memfds to
>> back guest memory and at a single point only one memfd is alive and we
>> want to prevent memory allocation for the other memfd which may have
>> been mmap-ed previously. More discussion can be found at:
>>
>>   https://lkml.org/lkml/2022/6/14/1255
>>
>> Suggested-by: Sean Christopherson <seanjc@google.com>
>> Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
>> ---
>>  include/uapi/linux/fcntl.h |  1 +
>>  mm/memfd.c                 |  3 ++-
>>  mm/shmem.c                 | 16 ++++++++++++++--
>>  3 files changed, 17 insertions(+), 3 deletions(-)
>>
>> diff --git a/include/uapi/linux/fcntl.h b/include/uapi/linux/fcntl.h
>> index 2f86b2ad6d7e..98bdabc8e309 100644
>> --- a/include/uapi/linux/fcntl.h
>> +++ b/include/uapi/linux/fcntl.h
>> @@ -43,6 +43,7 @@
>>  #define F_SEAL_GROW	0x0004	/* prevent file from growing */
>>  #define F_SEAL_WRITE	0x0008	/* prevent writes */
>>  #define F_SEAL_FUTURE_WRITE	0x0010  /* prevent future writes while mapped */
>> +#define F_SEAL_AUTO_ALLOCATE	0x0020  /* prevent allocation for writes */
> 
> Why only "on writes" and not "on reads". IIRC, shmem doesn't support the
> shared zeropage, so you'll simply allocate a new page via read() or on
> read faults.

Correction: on read() we don't allocate a fresh page. But on read faults
we would. So this comment here needs clarification.

> 
> 
> Also, I *think* you can place pages via userfaultfd into shmem. Not sure
> if that would count "auto alloc", but it would certainly bypass fallocate().
> 


-- 
Thanks,

David / dhildenb


