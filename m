Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E09B8457068
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 15:13:04 +0100 (CET)
Received: from localhost ([::1]:47320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo4dT-0006CS-FO
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 09:13:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mo4IT-0000vM-PD
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 08:51:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36463)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mo4IQ-0000wQ-VO
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 08:51:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637329876;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0MQ6EmX5xeBMO7143sm+kmalOXvvH8veZYgNdztafAY=;
 b=Du9s4mAvHjp3HTcNatjhyJ3KkDckrh1zfwF+jr9J7tVTUY1CrL3DfvyXUTHnLQHOe9Rno0
 suBtY3F0jMozvjK2dV6+9taJfE+cvwqxmE/+wdEDYJ80TACvb3c4u2WGCrA7hu6Ypu+1H8
 V3z1nmVNSaNiEo+61RmAq44xQqOo/lo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-553-k9LoLr-YPS2vt7SOLIK5LQ-1; Fri, 19 Nov 2021 08:51:15 -0500
X-MC-Unique: k9LoLr-YPS2vt7SOLIK5LQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 n16-20020a05600c3b9000b003331973fdbbso4784933wms.0
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 05:51:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=0MQ6EmX5xeBMO7143sm+kmalOXvvH8veZYgNdztafAY=;
 b=UbtQ8RZPLrQnFi9GVs47HisxPh6/TaoYPhglWkWY6PqV+vOvilB7vJIcv7qhR87wvs
 +n9kAm0VBqmWL+bSGmTveNCPa9lwTbbvK3r7/TQbv4nl4TTYKh+Elrt4Cax+ypHrF9ty
 yqYlbq/2Ofy2ic4o8lXGxIgw0v0n9X3XZU2w+6UdlBIUitNcl7HJ3UKCKI7GMmTifdft
 YZo7z6FNdqwm+mAN0iVn3lcAeuni7Zl568WCfVq2520OeGfj8CF/n6ZySwjGG0olDoxs
 4ZZ/WGCNlFrKubOPT4gJ6srHdSSCrY8BUNDz4EUiH7+zbXSYcQNdlEBfwBaHBesbFhCi
 JMnQ==
X-Gm-Message-State: AOAM5304BaD/ZLnFii2RwaIhZ5LCV88NhJT6fG0d/clORUQhYzr1Afj2
 IXUZKSTVGo6OJlmJNYljQhCLBzsXt4YZsZo7yFgRngiuXHsliBq+74zba5ERbUyTxX3+YSo1HnX
 AhaKw+gXsuBbdRPQ=
X-Received: by 2002:a05:6000:1a45:: with SMTP id
 t5mr7549048wry.306.1637329874064; 
 Fri, 19 Nov 2021 05:51:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyguzOIQ4dtj/UgUT64libXTpwo03IBVeH470Oj9eTA/dOIJOsebKLkqM9WONqcZosshV46JQ==
X-Received: by 2002:a05:6000:1a45:: with SMTP id
 t5mr7548995wry.306.1637329873829; 
 Fri, 19 Nov 2021 05:51:13 -0800 (PST)
Received: from [192.168.3.132] (p5b0c6271.dip0.t-ipconnect.de. [91.12.98.113])
 by smtp.gmail.com with ESMTPSA id
 f15sm3823943wmg.30.2021.11.19.05.51.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Nov 2021 05:51:13 -0800 (PST)
Message-ID: <942e0dd6-e426-06f6-7b6c-0e80d23c27e6@redhat.com>
Date: Fri, 19 Nov 2021 14:51:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [RFC v2 PATCH 01/13] mm/shmem: Introduce F_SEAL_GUEST
To: Chao Peng <chao.p.peng@linux.intel.com>, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, qemu-devel@nongnu.org
References: <20211119134739.20218-1-chao.p.peng@linux.intel.com>
 <20211119134739.20218-2-chao.p.peng@linux.intel.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20211119134739.20218-2-chao.p.peng@linux.intel.com>
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
Cc: Wanpeng Li <wanpengli@tencent.com>, luto@kernel.org,
 "J . Bruce Fields" <bfields@fieldses.org>, dave.hansen@intel.com,
 "H . Peter Anvin" <hpa@zytor.com>, ak@linux.intel.com,
 Jonathan Corbet <corbet@lwn.net>, Joerg Roedel <joro@8bytes.org>,
 x86@kernel.org, Hugh Dickins <hughd@google.com>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 jun.nakajima@intel.com, Thomas Gleixner <tglx@linutronix.de>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Jim Mattson <jmattson@google.com>,
 Sean Christopherson <seanjc@google.com>, susie.li@intel.com,
 Jeff Layton <jlayton@kernel.org>, john.ji@intel.com,
 Yu Zhang <yu.c.zhang@linux.intel.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19.11.21 14:47, Chao Peng wrote:
> From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
> 
> The new seal type provides semantics required for KVM guest private
> memory support. A file descriptor with the seal set is going to be used
> as source of guest memory in confidential computing environments such as
> Intel TDX and AMD SEV.
> 
> F_SEAL_GUEST can only be set on empty memfd. After the seal is set
> userspace cannot read, write or mmap the memfd.
> 
> Userspace is in charge of guest memory lifecycle: it can allocate the
> memory with falloc or punch hole to free memory from the guest.
> 
> The file descriptor passed down to KVM as guest memory backend. KVM
> register itself as the owner of the memfd via memfd_register_guest().
> 
> KVM provides callback that needed to be called on fallocate and punch
> hole.
> 
> memfd_register_guest() returns callbacks that need be used for
> requesting a new page from memfd.
> 

Repeating the feedback I already shared in a private mail thread:


As long as page migration / swapping is not supported, these pages
behave like any longterm pinned pages (e.g., VFIO) or secretmem pages.

1. These pages are not MOVABLE. They must not end up on ZONE_MOVABLE or
MIGRATE_CMA.

That should be easy to handle, you have to adjust the gfp_mask to
	mapping_set_gfp_mask(inode->i_mapping, GFP_HIGHUSER);
just as mm/secretmem.c:secretmem_file_create() does.

2. These pages behave like mlocked pages and should be accounted as such.

This is probably where the accounting "fun" starts, but maybe it's
easier than I think to handle.

See mm/secretmem.c:secretmem_mmap(), where we account the pages as
VM_LOCKED and will consequently check per-process mlock limits. As we
don't mmap(), the same approach cannot be reused.

See drivers/vfio/vfio_iommu_type1.c:vfio_pin_map_dma() and
vfio_pin_pages_remote() on how to manually account via mm->locked_vm .

But it's a bit hairy because these pages are not actually mapped into
the page tables of the MM, so it might need some thought. Similarly,
these pages actually behave like "pinned" (as in mm->pinned_vm), but we
just don't increase the refcount AFAIR. Again, accounting really is a
bit hairy ...



-- 
Thanks,

David / dhildenb


