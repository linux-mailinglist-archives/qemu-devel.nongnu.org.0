Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19AB058ABA5
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 15:30:28 +0200 (CEST)
Received: from localhost ([::1]:50560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJxPH-00036k-12
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 09:30:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oJxNq-0000wW-Is
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 09:28:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58103)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oJxNo-0002YK-NR
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 09:28:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659706135;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5LwXiW7Z9fPKOQuP6mWqJcS8w+uYP/AKU9h+QKQOqfY=;
 b=Q/oPvAzm+yT65mDJtPfKoMpPCpfPjnFDUuV6lK5QIEG6VR7qMSPeMULzI7G7SSndrJ3eNt
 YcF95heURkfGhPDALn/p1Cf77Hl/EqWjuLOSUmD6a+c/ErxQ2IXrKWUHMmjs9uP4RtPIEM
 /qehMpaCcDkneZ1dwAq8lyYDSWnIJGE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-315-b5QmJwRjOBK40JGNizfS6A-1; Fri, 05 Aug 2022 09:28:54 -0400
X-MC-Unique: b5QmJwRjOBK40JGNizfS6A-1
Received: by mail-wr1-f70.google.com with SMTP id
 e21-20020adf9bd5000000b002207a51b7feso497988wrc.10
 for <qemu-devel@nongnu.org>; Fri, 05 Aug 2022 06:28:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc;
 bh=5LwXiW7Z9fPKOQuP6mWqJcS8w+uYP/AKU9h+QKQOqfY=;
 b=ZV9mZc7YKGyK5jt48hMG20BiGtEB3DRW9KCcjZfFBK8bmiTiflmMvjojOIU9Rpxldl
 hBzyBdzMcaKl9fQ12NIw51UsLq4jHk2eg0ubb98EzPsyUUZMpWHU26Kaxn7i5BCBHQf7
 epuSW0UILcfA5jZIZQ8CIyBtxDlranhgw6vUpELcI6NXhzIeoDr8k84hip7a+p6lzm3p
 a91sipyWOAD6V6i5yCQ3RuY8vd4N0GI5fmhcW3gM5DXLJ9IEd3fu+qKe8Z1rd3hAZPLM
 Z9jl+wookluS/d5R4PUgNCF6rXWYt5ZN/UgXDSPfjpFGw8PSfPhHmXOW9alqTPwwb3u5
 kY6Q==
X-Gm-Message-State: ACgBeo30uuBCF5pL1D94V5LRkrZSMFqYtnz065iWzDaPzGJO8cb/yc9C
 EX/xQyspRI6f801CFDiyV6NXacSZMacFayiQ+8v8GDZck0OTH80xPq9tK+W78hbNQTwNJVOnqap
 k9TphV9AYGxZb69c=
X-Received: by 2002:a05:6000:1acf:b0:21d:b410:599a with SMTP id
 i15-20020a0560001acf00b0021db410599amr4119472wry.123.1659706133366; 
 Fri, 05 Aug 2022 06:28:53 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4rDbFbn4pE0ENzxm72PrKdoCqlUokRwvGeNDRUB01hSQV7gEIr0bukiPJi7Qq8c2+e4UOfGA==
X-Received: by 2002:a05:6000:1acf:b0:21d:b410:599a with SMTP id
 i15-20020a0560001acf00b0021db410599amr4119438wry.123.1659706133086; 
 Fri, 05 Aug 2022 06:28:53 -0700 (PDT)
Received: from ?IPV6:2003:cb:c706:fb00:f5c3:24b2:3d03:9d52?
 (p200300cbc706fb00f5c324b23d039d52.dip0.t-ipconnect.de.
 [2003:cb:c706:fb00:f5c3:24b2:3d03:9d52])
 by smtp.gmail.com with ESMTPSA id
 ck19-20020a5d5e93000000b0021ee65426a2sm3893063wrb.65.2022.08.05.06.28.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Aug 2022 06:28:52 -0700 (PDT)
Message-ID: <203c752f-9439-b5ae-056c-27b2631dcb81@redhat.com>
Date: Fri, 5 Aug 2022 15:28:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v7 05/14] mm/memfd: Introduce MFD_INACCESSIBLE flag
Content-Language: en-US
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
 <20220706082016.2603916-6-chao.p.peng@linux.intel.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220706082016.2603916-6-chao.p.peng@linux.intel.com>
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

On 06.07.22 10:20, Chao Peng wrote:
> Introduce a new memfd_create() flag indicating the content of the
> created memfd is inaccessible from userspace through ordinary MMU
> access (e.g., read/write/mmap). However, the file content can be
> accessed via a different mechanism (e.g. KVM MMU) indirectly.
> 
> It provides semantics required for KVM guest private memory support
> that a file descriptor with this flag set is going to be used as the
> source of guest memory in confidential computing environments such
> as Intel TDX/AMD SEV but may not be accessible from host userspace.
> 
> The flag can not coexist with MFD_ALLOW_SEALING, future sealing is
> also impossible for a memfd created with this flag.

It's kind of weird to have it that way. Why should the user have to
care? It's the notifier requirement to have that, no?

Why can't we handle that when register a notifier? If anything is
already mapped, fail registering the notifier if the notifier has these
demands. If registering succeeds, block it internally.

Or what am I missing? We might not need the memfile set flag semantics
eventually and would not have to expose such a flag to user space.

-- 
Thanks,

David / dhildenb


