Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D1974571D8
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 16:41:29 +0100 (CET)
Received: from localhost ([::1]:60888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo611-0007UN-To
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 10:41:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mo5z5-0006Ne-G2
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 10:39:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60973)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mo5z2-0002Fe-9w
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 10:39:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637336362;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DsNc1Iy6WSOW9ZyvvnH8bkc6OnCaXrc9G/cZpSnv6/Y=;
 b=gxNywoOPUzNQD30xdpnbne6kh8pSoYEcxkmaVG8Oy8eXYqnHkga1QpdyfF/iGvMsMIFYuw
 UiP5EHZMT9ka489oMWZw+3CylMuUayvMj2oPrvMZPxjURwQHFwpDInW33V27oYuuq1Vny5
 8K+Bn2zVD2oLX0UL6yyKEci6QWT7x58=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-505-GBhTUxufOYa9QhTyjCU45g-1; Fri, 19 Nov 2021 10:39:18 -0500
X-MC-Unique: GBhTUxufOYa9QhTyjCU45g-1
Received: by mail-wm1-f71.google.com with SMTP id
 n41-20020a05600c502900b003335ab97f41so4933033wmr.3
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 07:39:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=DsNc1Iy6WSOW9ZyvvnH8bkc6OnCaXrc9G/cZpSnv6/Y=;
 b=fhqTbKHHhq6D8AqJBuOgWQkrLBqqS4zJ98jEgzoiLlSDOqg9uMWFm3UsBL7+5dAWGE
 Bxtx1DK3oK4Puf+S0uG2pQqN4paK3Nn2CG+BNLttezQ6cHCguApJK6d0Ht9FuPzbtglQ
 1BY7K7j/x2iHQrmBoKyizE+pgMEkVZkFYcMPpsqHVLYkNfIcrmZQT1jUdILJGiEHTDGG
 b8dL7oLWJkndgqAcKYNsP3QeGyHujDbUtDxWE5cMXQTQjFzri0npGLTlXFPhSVqyXfFx
 1v6Zwr1peIgMFnKVSIGWn5wshvVEEZs48PevVWTVHNwU3w6QHII4K0bCyBMEUUk8vckL
 jkAQ==
X-Gm-Message-State: AOAM530sKyTV952a0xKaNM3h6jD4lQPJ2Uo6gmPqlcdTi9UXxrGX2BcU
 k7wh1NMa0kvkrEJAHkLt9Of9HpmqW+izHskAn0SAYMEvmKQJ4Ez/hP1pK/K8XNsT2sfdmJqNheG
 humPNJDKY6fdooZg=
X-Received: by 2002:a1c:7f56:: with SMTP id a83mr732000wmd.32.1637336357641;
 Fri, 19 Nov 2021 07:39:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw4oITHzX1lxkkdw28CPiDPbmMdcPR9dT1zPt74sOy7KqZZqsLOUPmgkUDSXt/kGh+UoeRKqw==
X-Received: by 2002:a1c:7f56:: with SMTP id a83mr731928wmd.32.1637336357312;
 Fri, 19 Nov 2021 07:39:17 -0800 (PST)
Received: from [192.168.3.132] (p5b0c6271.dip0.t-ipconnect.de. [91.12.98.113])
 by smtp.gmail.com with ESMTPSA id
 j19sm110732wra.5.2021.11.19.07.39.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Nov 2021 07:39:16 -0800 (PST)
Message-ID: <df11d753-6242-8f7c-cb04-c095f68b41fa@redhat.com>
Date: Fri, 19 Nov 2021 16:39:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [RFC v2 PATCH 01/13] mm/shmem: Introduce F_SEAL_GUEST
To: Jason Gunthorpe <jgg@ziepe.ca>, Chao Peng <chao.p.peng@linux.intel.com>
References: <20211119134739.20218-1-chao.p.peng@linux.intel.com>
 <20211119134739.20218-2-chao.p.peng@linux.intel.com>
 <20211119151943.GH876299@ziepe.ca>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20211119151943.GH876299@ziepe.ca>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.727, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Wanpeng Li <wanpengli@tencent.com>, jun.nakajima@intel.com,
 kvm@vger.kernel.org, qemu-devel@nongnu.org,
 "J . Bruce Fields" <bfields@fieldses.org>, linux-mm@kvack.org,
 "H . Peter Anvin" <hpa@zytor.com>, ak@linux.intel.com,
 Jonathan Corbet <corbet@lwn.net>, Joerg Roedel <joro@8bytes.org>,
 x86@kernel.org, Hugh Dickins <hughd@google.com>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 luto@kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Jim Mattson <jmattson@google.com>,
 dave.hansen@intel.com, Sean Christopherson <seanjc@google.com>,
 susie.li@intel.com, Jeff Layton <jlayton@kernel.org>,
 linux-kernel@vger.kernel.org, john.ji@intel.com,
 Yu Zhang <yu.c.zhang@linux.intel.com>, linux-fsdevel@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19.11.21 16:19, Jason Gunthorpe wrote:
> On Fri, Nov 19, 2021 at 09:47:27PM +0800, Chao Peng wrote:
>> From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
>>
>> The new seal type provides semantics required for KVM guest private
>> memory support. A file descriptor with the seal set is going to be used
>> as source of guest memory in confidential computing environments such as
>> Intel TDX and AMD SEV.
>>
>> F_SEAL_GUEST can only be set on empty memfd. After the seal is set
>> userspace cannot read, write or mmap the memfd.
>>
>> Userspace is in charge of guest memory lifecycle: it can allocate the
>> memory with falloc or punch hole to free memory from the guest.
>>
>> The file descriptor passed down to KVM as guest memory backend. KVM
>> register itself as the owner of the memfd via memfd_register_guest().
>>
>> KVM provides callback that needed to be called on fallocate and punch
>> hole.
>>
>> memfd_register_guest() returns callbacks that need be used for
>> requesting a new page from memfd.
>>
>> Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
>> Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
>>  include/linux/memfd.h      |  24 ++++++++
>>  include/linux/shmem_fs.h   |   9 +++
>>  include/uapi/linux/fcntl.h |   1 +
>>  mm/memfd.c                 |  33 +++++++++-
>>  mm/shmem.c                 | 123 ++++++++++++++++++++++++++++++++++++-
>>  5 files changed, 186 insertions(+), 4 deletions(-)
>>
>> diff --git a/include/linux/memfd.h b/include/linux/memfd.h
>> index 4f1600413f91..ff920ef28688 100644
>> +++ b/include/linux/memfd.h
>> @@ -4,13 +4,37 @@
>>  
>>  #include <linux/file.h>
>>  
>> +struct guest_ops {
>> +	void (*invalidate_page_range)(struct inode *inode, void *owner,
>> +				      pgoff_t start, pgoff_t end);
>> +	void (*fallocate)(struct inode *inode, void *owner,
>> +			  pgoff_t start, pgoff_t end);
>> +};
>> +
>> +struct guest_mem_ops {
>> +	unsigned long (*get_lock_pfn)(struct inode *inode, pgoff_t offset,
>> +				      bool alloc, int *order);
>> +	void (*put_unlock_pfn)(unsigned long pfn);
>> +
>> +};
> 
> Ignoring confidential compute for a moment
> 
> If qmeu can put all the guest memory in a memfd and not map it, then
> I'd also like to see that the IOMMU can use this interface too so we
> can have VFIO working in this configuration.

In QEMU we usually want to (and must) be able to access guest memory
from user space, with the current design we wouldn't even be able to
temporarily mmap it -- which makes sense for encrypted memory only. The
corner case really is encrypted memory. So I don't think we'll see a
broad use of this feature outside of encrypted VMs in QEMU. I might be
wrong, most probably I am :)

> 
> As designed the above looks useful to import a memfd to a VFIO
> container but could you consider some more generic naming than calling
> this 'guest' ?

+1 the guest terminology is somewhat sob-optimal.

> 
> Along the same lines, to support fast migration, we'd want to be able
> to send these things to the RDMA subsytem as well so we can do data
> xfer. Very similar to VFIO.
> 
> Also, shouldn't this be two patches? F_SEAL is not really related to
> these acessors, is it?


Apart from the special "encrypted memory" semantics, I assume nothing
speaks against allowing for mmaping these memfds, for example, for any
other VFIO use cases.

-- 
Thanks,

David / dhildenb


