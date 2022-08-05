Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2396E58AF48
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 19:57:53 +0200 (CEST)
Received: from localhost ([::1]:49656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oK1a4-0003WY-3U
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 13:57:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1oK1Y3-0000We-3A
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 13:55:47 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:44594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1oK1Y1-0008TP-8b
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 13:55:46 -0400
Received: by mail-ed1-x530.google.com with SMTP id t5so4249291edc.11
 for <qemu-devel@nongnu.org>; Fri, 05 Aug 2022 10:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3pDyPaXmSjg1dfYYTVcD5twgm0VJEcQCaH5PzUebh+o=;
 b=NasTXfyIKwSXshhH6uRWdhVe4jCKkDoBRipCni1OVWDHHkSZE8iK0Vhw289lgKT2uv
 qS6eMQm42wwQy1UZM4kkyrdch99ditPm3awIimLr82sU3if3bt8aw/xZpAu/zujUoS54
 cekJu+G0f5hLStL7JaE8TqYvMOIiGi/Jpq7aUtENnLq1amafw+ZX0Y2XkXTjLvABPgZy
 B2U3SlVeDIS9e9u0kjZ4XgI66qvYPgtf+Dc14Ob180027TtXQXfKeB9PzzQrAjBFtZj5
 NCEt46wYh/AQ0HNsMQk9lnmN60NZeyIIR4J9rMfvYs5Q3+KGn6pMjwuXrHIEpd4ll7dC
 5XQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3pDyPaXmSjg1dfYYTVcD5twgm0VJEcQCaH5PzUebh+o=;
 b=1mfN14pErA+8mYjqk3DE3ns6pa2TlNtPw0kw17BVxPcwozsGWsajae13gFJrK4wYBE
 DjhAT8DaTHu0sZJfJONQsOaRafduDhSD28PMlDsaNpOgF27yOaesT+chJcG35+r/Tqck
 0Oj9EotJ6jEFwNblg6c14qUdzeVLBFfJc3sezeyUUAjxjKHVWjGGoRxRaQ5RZn8yyhZB
 Be2tK8AzRhnBhTYqJuQ1KPclIFwuM4mSPwmzzvANhw0CGIkGwRmXL1u4Q4E1EmBDdIBr
 sgIDcRGkqaFbVQMk9DilzgdeJqYN/tXRY2hgRuexq/YcmbxOoM8mjkXuL679blpMGr4x
 v7Lg==
X-Gm-Message-State: ACgBeo1P+nOglqUTuCzTc+8O9TK1aTik1hvXX5fJIvspUWm+kOlGZ5Hw
 ZdeoyawINFrSZFZhREhjwnw=
X-Google-Smtp-Source: AA6agR5VWBwmuMByhlGp2jZk5km25TlB77WRs6fSjW6q6o8glqXJyrvjZip6gTq1ZgU4MWVWBbx1Kw==
X-Received: by 2002:a05:6402:5518:b0:43a:9e32:b6fc with SMTP id
 fi24-20020a056402551800b0043a9e32b6fcmr8004431edb.252.1659722143505; 
 Fri, 05 Aug 2022 10:55:43 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 b11-20020a17090630cb00b0072b36cbcdaasm1809391ejb.92.2022.08.05.10.55.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Aug 2022 10:55:42 -0700 (PDT)
Message-ID: <472207cf-ff71-563b-7b66-0c7bea9ea8ad@redhat.com>
Date: Fri, 5 Aug 2022 19:55:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v7 01/14] mm: Add F_SEAL_AUTO_ALLOCATE seal to memfd
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>,
 Chao Peng <chao.p.peng@linux.intel.com>, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
 linux-doc@vger.kernel.org, qemu-devel@nongnu.org,
 linux-kselftest@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>, Sean Christopherson
 <seanjc@google.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Wanpeng Li <wanpengli@tencent.com>, Jim Mattson <jmattson@google.com>,
 Joerg Roedel <joro@8bytes.org>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
 Hugh Dickins <hughd@google.com>, Jeff Layton <jlayton@kernel.org>,
 "J . Bruce Fields" <bfields@fieldses.org>,
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
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <f39c4f63-a511-4beb-b3a4-66589ddb5475@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x530.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 7/21/22 11:44, David Hildenbrand wrote:
> 
> Also, I*think*  you can place pages via userfaultfd into shmem. Not
> sure if that would count "auto alloc", but it would certainly bypass
> fallocate().

Yeah, userfaultfd_register would probably have to forbid this for 
F_SEAL_AUTO_ALLOCATE vmas.  Maybe the memfile_node can be reused for 
this, adding a new MEMFILE_F_NO_AUTO_ALLOCATE flags?  Then 
userfault_register would do something like 
memfile_node_get_flags(vma->vm_file) and check the result.

This means moving this patch later, after "mm: Introduce memfile_notifier".

Thanks,

Paolo

