Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E67A69903A
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 10:41:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSalc-00070T-H3; Thu, 16 Feb 2023 04:41:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pSala-00070L-LU
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 04:41:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pSalY-0005qo-Ar
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 04:41:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676540482;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Gmwi3nEDJwaAff3Fc8Gdw19GfxhLDRlC4Hp/kbYrQqc=;
 b=hiVQpW+RI2ElLy/6NvSTUCCYKDDSl75f5/Vj8PqI7vT7EtBJcHoLjcHVaVkJUJuRE4kXzO
 FE9+ByFtazGW5vWeKAI5MMQZlExF8iy99pHPmzTYQBgxuETcBwb0zBRDhuQJcCFipO1J9q
 sY7Gcvx3OEgJBA9P5+bx4XCqnfaF0vc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-595-Wq4SBV7yP6KAc7FKMgfwYA-1; Thu, 16 Feb 2023 04:41:18 -0500
X-MC-Unique: Wq4SBV7yP6KAc7FKMgfwYA-1
Received: by mail-wm1-f71.google.com with SMTP id
 j20-20020a05600c1c1400b003dc5dd44c0cso596257wms.8
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 01:41:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Gmwi3nEDJwaAff3Fc8Gdw19GfxhLDRlC4Hp/kbYrQqc=;
 b=AysDhJoVKau04+ynZeGMtu8DSz0rBtK/5y6RKN4aKR1KpCmvzLUUp7mtxRNB7WM3j6
 ZYsLaZQPrQfbwPxYxlox96JY8Kd32Tu16Kai7tPPIyardpp/R1nFMQjjjWx8leOnz0ot
 T21ec1au3bv4w+sRimR6bVLvepqaBYe8hUK2ToW0zr0sULgA4dVD8Wu8FccZL5+GmLIY
 0ouuqaPdLdxJYJ9uIg/jdQDJz2F73btpvQEI3jKW1cMe2NLv6theNKTAWQgna/QK2E7X
 jSk7iNWeMvnbEC3fDkzaP3PzUnWax2baL9QNyamoZ4DvPkJTMFyb8Qi0RIbz6FZ1tfyU
 YD/w==
X-Gm-Message-State: AO0yUKUWdheht8uJKjaEp2sBiOG9azG3LCAClgx1kMei50b2zEAaj3dq
 AxEDB/2KmdxLVXX4B5UXBYdrHquf2F/0KmdDdvlJYDQ/ENsgwvvtmnZVSwcqELpl7uC+a+1o64D
 2XkCkI1x+55Sk5Bk=
X-Received: by 2002:a05:600c:43d2:b0:3e1:f8af:7942 with SMTP id
 f18-20020a05600c43d200b003e1f8af7942mr4417114wmn.22.1676540477731; 
 Thu, 16 Feb 2023 01:41:17 -0800 (PST)
X-Google-Smtp-Source: AK7set/oggqqqV4UfbebLA50a7kFC2t5aIQUzgDU4Y/+rLroQMqzr7b1jBFCFplQuftcMkUVk4L02g==
X-Received: by 2002:a05:600c:43d2:b0:3e1:f8af:7942 with SMTP id
 f18-20020a05600c43d200b003e1f8af7942mr4417078wmn.22.1676540477379; 
 Thu, 16 Feb 2023 01:41:17 -0800 (PST)
Received: from ?IPV6:2003:cb:c708:bc00:2acb:9e46:1412:686a?
 (p200300cbc708bc002acb9e461412686a.dip0.t-ipconnect.de.
 [2003:cb:c708:bc00:2acb:9e46:1412:686a])
 by smtp.gmail.com with ESMTPSA id
 j26-20020a05600c1c1a00b003df245cd853sm1211974wms.44.2023.02.16.01.41.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Feb 2023 01:41:16 -0800 (PST)
Message-ID: <62c84fa8-d7c4-5163-fe1e-f2c7e5a2c7aa@redhat.com>
Date: Thu, 16 Feb 2023 10:41:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v10 0/9] KVM: mm: fd-based approach for supporting KVM
Content-Language: en-US
To: Mike Rapoport <rppt@kernel.org>, Chao Peng <chao.p.peng@linux.intel.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-api@vger.kernel.org, linux-doc@vger.kernel.org, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Sean Christopherson <seanjc@google.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Arnd Bergmann <arnd@arndb.de>,
 Naoya Horiguchi <naoya.horiguchi@nec.com>, Miaohe Lin
 <linmiaohe@huawei.com>, x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
 Hugh Dickins <hughd@google.com>, Jeff Layton <jlayton@kernel.org>,
 "J . Bruce Fields" <bfields@fieldses.org>,
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>,
 Steven Price <steven.price@arm.com>,
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve <vannapurve@google.com>,
 Yu Zhang <yu.c.zhang@linux.intel.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, luto@kernel.org,
 jun.nakajima@intel.com, dave.hansen@intel.com, ak@linux.intel.com,
 aarcange@redhat.com, ddutile@redhat.com, dhildenb@redhat.com,
 Quentin Perret <qperret@google.com>, tabba@google.com,
 Michael Roth <michael.roth@amd.com>, mhocko@suse.com, wei.w.wang@intel.com
References: <20221202061347.1070246-1-chao.p.peng@linux.intel.com>
 <Y+27kRxJoXlMcbtH@kernel.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <Y+27kRxJoXlMcbtH@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.257, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 16.02.23 06:13, Mike Rapoport wrote:
> Hi,
> 
> On Fri, Dec 02, 2022 at 02:13:38PM +0800, Chao Peng wrote:
>> This patch series implements KVM guest private memory for confidential
>> computing scenarios like Intel TDX[1]. If a TDX host accesses
>> TDX-protected guest memory, machine check can happen which can further
>> crash the running host system, this is terrible for multi-tenant
>> configurations. The host accesses include those from KVM userspace like
>> QEMU. This series addresses KVM userspace induced crash by introducing
>> new mm and KVM interfaces so KVM userspace can still manage guest memory
>> via a fd-based approach, but it can never access the guest memory
>> content.
> 
> Sorry for jumping late.
> 
> Unless I'm missing something, hibernation will also cause an machine check
> when there is TDX-protected memory in the system. When the hibernation
> creates memory snapshot it essentially walks all physical pages and saves
> their contents, so for TDX memory this will trigger machine check, right?

I recall bringing that up in the past (also memory access due to kdump, 
/prov/kcore) and was told that the main focus for now is preventing 
unprivileged users from crashing the system, that is, not mapping such 
memory into user space (e.g., QEMU). In the long run, we'll want to 
handle such pages also properly in the other events where the kernel 
might access them.

-- 
Thanks,

David / dhildenb


