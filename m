Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A1859D31B
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 10:09:52 +0200 (CEST)
Received: from localhost ([::1]:34472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQOyt-0001n9-L3
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 04:09:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oQOki-0005h6-3D
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 03:55:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41545)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oQOkg-0008W6-3v
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 03:55:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661241309;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EIwZ7BoTfdMUAhH2fOQC6fOziS/YjfnIvgRTO5vTHto=;
 b=DyCI55PulUdOrmKB+WgGxp1BNPAeh4juvIPpeXCF87rXoNnLnpMySUbuwRhr2S0tj1ME19
 XoH2s5lhUgWm3ytjpdAK5bRJwjnYlJotPWAxLQCFL+JlZGmvCyohxuntZ48XyDsa5fE2YY
 haGZa/VSZ6I6oWfy2Vr9bHAQfLHmsYI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-488-ORKeBojbM6iP5W9nL5l8vw-1; Tue, 23 Aug 2022 03:55:07 -0400
X-MC-Unique: ORKeBojbM6iP5W9nL5l8vw-1
Received: by mail-wm1-f72.google.com with SMTP id
 ay21-20020a05600c1e1500b003a6271a9718so7346408wmb.0
 for <qemu-devel@nongnu.org>; Tue, 23 Aug 2022 00:55:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:organization:from
 :references:cc:to:content-language:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc;
 bh=EIwZ7BoTfdMUAhH2fOQC6fOziS/YjfnIvgRTO5vTHto=;
 b=FM91zd46JZkjR8KAO3bTmwgwYpshNeGWTOsPxaAbTlCAaL6UL0OmCuj0xI7C2fcUUO
 87Sn62nlIpSsgm/soJCamKvdN+tX9oAH1X7VSRJR/S5mrVjfJ/6V6JD96MAeF/v27vkD
 nvDutOFflejsp1VPTunJJcznLSX1bepX485aVRh+4VXSNf5qm9mF39wvKTfBf0B2KIs9
 H8k5ZMtYyXF0DGn7eKjz7akYkFdAQ6AgiXIDD5rIwPpMJCjHbH276qdB9NAbCIyH1vFm
 KzNIDoSQku1J9Gi+uY5LUfDHTLMkeuU3c6fcpdiyqYvaywG2XCQCgsYI4dyZfsli5wx5
 EX+Q==
X-Gm-Message-State: ACgBeo3T0UcsRKzhd/bfBX+B6tk3Crikd16nVJ2EBXU+QLHuTxrWq1BB
 jk3ftDa0mWyiDH6Nearj/z6rh7UfTQsTx9tVPdTv4cEHY4E3dRdcpLP/LqtMMQVQ6a5xusW17Sz
 d/C08263hrlXyPeM=
X-Received: by 2002:adf:f643:0:b0:225:2cb3:4b05 with SMTP id
 x3-20020adff643000000b002252cb34b05mr13203089wrp.12.1661241306650; 
 Tue, 23 Aug 2022 00:55:06 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7QQcmZIjuOTP3rp/phaSR8BK9i2DfQ3gujUYj0ItGrG9WBrBV+POmli4zo4g6w/n8XuVdszg==
X-Received: by 2002:adf:f643:0:b0:225:2cb3:4b05 with SMTP id
 x3-20020adff643000000b002252cb34b05mr13203037wrp.12.1661241306387; 
 Tue, 23 Aug 2022 00:55:06 -0700 (PDT)
Received: from ?IPV6:2003:cb:c70b:1600:c48b:1fab:a330:5182?
 (p200300cbc70b1600c48b1faba3305182.dip0.t-ipconnect.de.
 [2003:cb:c70b:1600:c48b:1fab:a330:5182])
 by smtp.gmail.com with ESMTPSA id
 c9-20020a05600c100900b003a2f6367049sm16281074wmc.48.2022.08.23.00.55.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Aug 2022 00:55:05 -0700 (PDT)
Message-ID: <b2743a3a-a1b4-2d2e-98be-87b58ad387cf@redhat.com>
Date: Tue, 23 Aug 2022 09:55:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Hugh Dickins <hughd@google.com>, Sean Christopherson <seanjc@google.com>
Cc: "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Chao Peng <chao.p.peng@linux.intel.com>, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
 linux-doc@vger.kernel.org, qemu-devel@nongnu.org,
 linux-kselftest@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Wanpeng Li <wanpengli@tencent.com>, Jim Mattson <jmattson@google.com>,
 Joerg Roedel <joro@8bytes.org>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
 Jeff Layton <jlayton@kernel.org>, "J . Bruce Fields" <bfields@fieldses.org>,
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Steven Price <steven.price@arm.com>,
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve <vannapurve@google.com>,
 Yu Zhang <yu.c.zhang@linux.intel.com>, luto@kernel.org,
 jun.nakajima@intel.com, dave.hansen@intel.com, ak@linux.intel.com,
 aarcange@redhat.com, ddutile@redhat.com, dhildenb@redhat.com,
 Quentin Perret <qperret@google.com>, Michael Roth <michael.roth@amd.com>,
 mhocko@suse.com, Muchun Song <songmuchun@bytedance.com>,
 "Gupta, Pankaj" <pankaj.gupta@amd.com>
References: <20220706082016.2603916-1-chao.p.peng@linux.intel.com>
 <ff5c5b97-acdf-9745-ebe5-c6609dd6322e@google.com>
 <20220818132421.6xmjqduempmxnnu2@box> <Yv7XTON3MwuC1Q3U@google.com>
 <226ab26d-9aa8-dce2-c7f0-9e3f5b65b63@google.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v7 00/14] KVM: mm: fd-based approach for supporting KVM
 guest private memory
In-Reply-To: <226ab26d-9aa8-dce2-c7f0-9e3f5b65b63@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 19.08.22 05:38, Hugh Dickins wrote:
> On Fri, 19 Aug 2022, Sean Christopherson wrote:
>> On Thu, Aug 18, 2022, Kirill A . Shutemov wrote:
>>> On Wed, Aug 17, 2022 at 10:40:12PM -0700, Hugh Dickins wrote:
>>>> On Wed, 6 Jul 2022, Chao Peng wrote:
>>>> But since then, TDX in particular has forced an effort into preventing
>>>> (by flags, seals, notifiers) almost everything that makes it shmem/tmpfs.
>>>>
>>>> Are any of the shmem.c mods useful to existing users of shmem.c? No.
>>>> Is MFD_INACCESSIBLE useful or comprehensible to memfd_create() users? No.
>>
>> But QEMU and other VMMs are users of shmem and memfd.  The new features certainly
>> aren't useful for _all_ existing users, but I don't think it's fair to say that
>> they're not useful for _any_ existing users.
> 
> Okay, I stand corrected: there exist some users of memfd_create()
> who will also have use for "INACCESSIBLE" memory.

As raised in reply to the relevant patch, I'm not sure if we really have
to/want to expose MFD_INACCESSIBLE to user space. I feel like this is a
requirement of specific memfd_notifer (memfile_notifier) implementations
-- such as TDX that will convert the memory and MCE-kill the machine on
ordinary write access. We might be able to set/enforce this when
registering a notifier internally instead, and fail notifier
registration if a condition isn't met (e.g., existing mmap).

So I'd be curious, which other users of shmem/memfd would benefit from
(MMU)-"INACCESSIBLE" memory obtained via memfd_create()?

-- 
Thanks,

David / dhildenb


