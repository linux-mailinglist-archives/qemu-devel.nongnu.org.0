Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92FE458EA71
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 12:28:35 +0200 (CEST)
Received: from localhost ([::1]:58432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLix0-0000db-I9
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 06:28:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oLib2-0006oJ-GG
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 06:05:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oLiay-0000sC-NL
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 06:05:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660125947;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=83RYZm97KNj9NYPWWYz4fzmlCpq267m27613RMfC+Pg=;
 b=UHeEaq1VsJh0smxEW5O4pSxnHz5WOcUVkyByN8C1d/kkzrKLEagB5waD//NXUY/Eks+7xT
 B6VDiPUTtQMxQZdd3KuyHXxKqbBCF2GtO/RkMcwSQVIOQeygDAhyNeh4naClHzUuT3Hh+W
 iXrFgrt7f/IEYgpEnELBjnbQetKS9Bw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-75-hU0GO-PMMsaizOEV_TSNRg-1; Wed, 10 Aug 2022 06:05:45 -0400
X-MC-Unique: hU0GO-PMMsaizOEV_TSNRg-1
Received: by mail-wm1-f69.google.com with SMTP id
 j22-20020a05600c485600b003a50fa6981bso860872wmo.9
 for <qemu-devel@nongnu.org>; Wed, 10 Aug 2022 03:05:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:organization:from
 :references:cc:to:content-language:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc;
 bh=83RYZm97KNj9NYPWWYz4fzmlCpq267m27613RMfC+Pg=;
 b=IcI1mWb+p/n4eRLdUf/upT6xYKDNBITxDRmKO1EfW9XNg4v5yYYIzLjQh4ZnMHVb5/
 Ur5RXclfsm3R6w4Te+FMQPdVR9UV5kz4T89tcanFxVoh2J9W57Jtl02bXT4g4xthvxM6
 Q6wj7k4saW/ZULvpIl6SEGgPVN7l3VK2jXOKlpIfCXGGhMoJMmdxdFCDcdfFWHqlH2zI
 wAYG1Tg0paMtMdnvC/Pap7Uql83tUf34PI0et+I19KwilgQhnrBfQMHpfOWYhp8zflJ5
 VYG+kdRgVK+WwgQu1GtXl3rfKdijEa9qf/IK9Rw3v8VgAwTn2r6f3Sj3aZxn9MN7mTDw
 MykQ==
X-Gm-Message-State: ACgBeo0t5j1qowvG3jrBw4BhIF20fEgv1giYGHByLuLhpBOLwKbkrATe
 cAsb/gWWVknIxow9f05Q+ZyBCFzg9qI+sUgPjAR3SlM+CruFFeMrLmejb3ZvZ003ovbJg5yr1jK
 OF4AsZ/6T5UZfGzk=
X-Received: by 2002:a5d:64ae:0:b0:220:6c4c:5a60 with SMTP id
 m14-20020a5d64ae000000b002206c4c5a60mr17058812wrp.636.1660125944501; 
 Wed, 10 Aug 2022 03:05:44 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5i72uisBNMVtDIvVDVfSxV1hzWrZROoCbvcTeBej4J7CIdnSDFuFoSBTJk3opG5+sXP+xgow==
X-Received: by 2002:a5d:64ae:0:b0:220:6c4c:5a60 with SMTP id
 m14-20020a5d64ae000000b002206c4c5a60mr17058769wrp.636.1660125944245; 
 Wed, 10 Aug 2022 03:05:44 -0700 (PDT)
Received: from ?IPV6:2003:cb:c707:1600:a3ce:b459:ef57:7b93?
 (p200300cbc7071600a3ceb459ef577b93.dip0.t-ipconnect.de.
 [2003:cb:c707:1600:a3ce:b459:ef57:7b93])
 by smtp.gmail.com with ESMTPSA id
 t188-20020a1c46c5000000b003a327f19bf9sm1793951wma.14.2022.08.10.03.05.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Aug 2022 03:05:43 -0700 (PDT)
Message-ID: <00f1aa03-bc82-ffce-569b-e2d5c459992c@redhat.com>
Date: Wed, 10 Aug 2022 12:05:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Chao Peng <chao.p.peng@linux.intel.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
 linux-doc@vger.kernel.org, qemu-devel@nongnu.org,
 linux-kselftest@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Sean Christopherson <seanjc@google.com>,
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
 <20220706082016.2603916-4-chao.p.peng@linux.intel.com>
 <13394075-fca0-6f2b-92a2-f1291fcec9a3@redhat.com>
 <20220810092232.GC862421@chaop.bj.intel.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v7 03/14] mm: Introduce memfile_notifier
In-Reply-To: <20220810092232.GC862421@chaop.bj.intel.com>
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

On 10.08.22 11:22, Chao Peng wrote:
> On Fri, Aug 05, 2022 at 03:22:58PM +0200, David Hildenbrand wrote:
>> On 06.07.22 10:20, Chao Peng wrote:
>>> This patch introduces memfile_notifier facility so existing memory file
>>> subsystems (e.g. tmpfs/hugetlbfs) can provide memory pages to allow a
>>> third kernel component to make use of memory bookmarked in the memory
>>> file and gets notified when the pages in the memory file become
>>> invalidated.
>>
>> Stupid question, but why is this called "memfile_notifier" and not
>> "memfd_notifier". We're only dealing with memfd's after all ... which
>> are anonymous files essentially. Or what am I missing? Are there any
>> other plans for fs than plain memfd support that I am not aware of?
> 
> There were some discussions on this in v3.
>   https://lkml.org/lkml/2021/12/28/484
> Sean commented it's OK to abstract it from memfd but he also wants the
> kAPI (name) should not bind to memfd to make room for future non-memfd
> usages.

Sorry, but how is "memfile" any better? memfd abstracted to memfile?! :)

I understand Sean's suggestion about abstracting, but if the new name
makes it harder to grasp and there isn't really an alternative to memfd
in sight, I'm not so sure I enjoy the tried abstraction here.

Otherwise we'd have to get creative now and discuss something like
"file_population_notifer" or "mapping_population_notifer" and I am not
sure that our time is well spent doing so right now.

... as this is kernel-internal, we can always adjust the name as we
please later, once we *actually* now what the abstraction should be.
Until then I'd suggest to KIS and soft-glue this to memfd.

Or am I missing something important?

-- 
Thanks,

David / dhildenb


