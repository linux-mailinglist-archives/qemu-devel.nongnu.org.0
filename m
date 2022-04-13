Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF414FFB3F
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Apr 2022 18:26:56 +0200 (CEST)
Received: from localhost ([::1]:60530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nefpX-0002ps-3R
	for lists+qemu-devel@lfdr.de; Wed, 13 Apr 2022 12:26:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nefnl-0001eV-6f
 for qemu-devel@nongnu.org; Wed, 13 Apr 2022 12:25:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51966)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nefni-0001Mi-72
 for qemu-devel@nongnu.org; Wed, 13 Apr 2022 12:25:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649867101;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RgEcoM6U2AWPf465Xahivshzo2kZbOX7C4c0ahKp1Dw=;
 b=Eplmut0vF4DlV6c+zkqOtHlqzpvGJ3v8k5+lbRl4yV4OIA9iFxRyXwgYXzb6KlsVO9QzW3
 nl7HxNwJgX3oOvsp23Un2bK8WEuOBeDieMudWOsbppTnuMOa3/mJXAO8o3AjJSCeWGDNZi
 qjYkdrvIe6mRigEbiz/xC4dFVOxgsL0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-466-teuhBOvAMrS4F7MsIOUzwQ-1; Wed, 13 Apr 2022 12:25:00 -0400
X-MC-Unique: teuhBOvAMrS4F7MsIOUzwQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 c125-20020a1c3583000000b0038e3f6e871aso1087301wma.8
 for <qemu-devel@nongnu.org>; Wed, 13 Apr 2022 09:24:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=RgEcoM6U2AWPf465Xahivshzo2kZbOX7C4c0ahKp1Dw=;
 b=TwvJPpvUSczLMFyPcJSQEGn4wrdHkjr9j4S/57RAWdcGjq3NuhlqD21iap0OPkIokT
 YhLaUF3ZzHLXq9n+YCUSmjv0FwSgjSBAFBbbiOnPwLyK8k+I+FLSAuUccult2JNB3Lpv
 mxOP+nvgtnmDj8ZsKw1PldsoEoYsya1Quy22ApgJ7ScJgYq8aCnQyWrA28AWe8dTkNOB
 FGAjUoZhMcE3kqZt+bK4iBjuTZEmGA981qrllgIz32K7WOOXdpwGQdsw2cQw44T4VxNh
 mMyWq0hU2lkQTTIruO3PCUBVz/Jkb6/S6RL8xpNhES9cbNqEYLm77q6akLu8EZfif6jB
 dN8Q==
X-Gm-Message-State: AOAM533yNsOz/M4heCYpHhryrjl1i82zf1E+BCZuwiodXzf84yC3USQE
 7yLAkQy9bXCBjB6BKU25HWzMF0Oho8vYNkL4Vb6N14tGA94XdDVb6L7F3mjVuW1Vvc+WibYOCiD
 rna6OVML2JNZxPEE=
X-Received: by 2002:a05:600c:3c8f:b0:38e:4e47:3e95 with SMTP id
 bg15-20020a05600c3c8f00b0038e4e473e95mr9076160wmb.173.1649867098893; 
 Wed, 13 Apr 2022 09:24:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwylTIzzqJtz5EFX+MPmIPe9ZuRAk8yMJ3/juBgt0JzCyKFOBhzlfQN6ejdx28PKvB0mUKO0g==
X-Received: by 2002:a05:600c:3c8f:b0:38e:4e47:3e95 with SMTP id
 bg15-20020a05600c3c8f00b0038e4e473e95mr9076112wmb.173.1649867098647; 
 Wed, 13 Apr 2022 09:24:58 -0700 (PDT)
Received: from ?IPV6:2003:cb:c704:5800:1078:ebb9:e2c3:ea8c?
 (p200300cbc70458001078ebb9e2c3ea8c.dip0.t-ipconnect.de.
 [2003:cb:c704:5800:1078:ebb9:e2c3:ea8c])
 by smtp.gmail.com with ESMTPSA id
 n7-20020a5d5987000000b00207891050d4sm16274621wri.46.2022.04.13.09.24.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Apr 2022 09:24:58 -0700 (PDT)
Message-ID: <1686fd2d-d9c3-ec12-32df-8c4c5ae26b08@redhat.com>
Date: Wed, 13 Apr 2022 18:24:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v5 04/13] mm/shmem: Restrict MFD_INACCESSIBLE memory
 against RLIMIT_MEMLOCK
To: Jason Gunthorpe <jgg@ziepe.ca>
References: <20220310140911.50924-1-chao.p.peng@linux.intel.com>
 <20220310140911.50924-5-chao.p.peng@linux.intel.com>
 <Yk8L0CwKpTrv3Rg3@google.com>
 <02e18c90-196e-409e-b2ac-822aceea8891@www.fastmail.com>
 <YlB3Z8fqJ+67a2Ck@google.com>
 <7ab689e7-e04d-5693-f899-d2d785b09892@redhat.com>
 <20220412143636.GG64706@ziepe.ca>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220412143636.GG64706@ziepe.ca>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: Wanpeng Li <wanpengli@tencent.com>, "Nakajima,
 Jun" <jun.nakajima@intel.com>, kvm list <kvm@vger.kernel.org>,
 qemu-devel@nongnu.org, "J . Bruce Fields" <bfields@fieldses.org>,
 linux-mm@kvack.org, "H. Peter Anvin" <hpa@zytor.com>,
 Chao Peng <chao.p.peng@linux.intel.com>, Andi Kleen <ak@linux.intel.com>,
 Jonathan Corbet <corbet@lwn.net>, Joerg Roedel <joro@8bytes.org>,
 the arch/x86 maintainers <x86@kernel.org>, Hugh Dickins <hughd@google.com>,
 Steven Price <steven.price@arm.com>, Ingo Molnar <mingo@redhat.com>,
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>,
 Jim Mattson <jmattson@google.com>, Dave Hansen <dave.hansen@intel.com>,
 Sean Christopherson <seanjc@google.com>, Jeff Layton <jlayton@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Yu Zhang <yu.c.zhang@linux.intel.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Linux API <linux-api@vger.kernel.org>, linux-fsdevel@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Vishal Annapurve <vannapurve@google.com>, Mike Rapoport <rppt@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12.04.22 16:36, Jason Gunthorpe wrote:
> On Fri, Apr 08, 2022 at 08:54:02PM +0200, David Hildenbrand wrote:
> 
>> RLIMIT_MEMLOCK was the obvious candidate, but as we discovered int he
>> past already with secretmem, it's not 100% that good of a fit (unmovable
>> is worth than mlocked). But it gets the job done for now at least.
> 
> No, it doesn't. There are too many different interpretations how
> MELOCK is supposed to work
> 
> eg VFIO accounts per-process so hostile users can just fork to go past
> it.
> 
> RDMA is per-process but uses a different counter, so you can double up
> 
> iouring is per-user and users a 3rd counter, so it can triple up on
> the above two

Thanks for that summary, very helpful.

> 
>> So I'm open for alternative to limit the amount of unmovable memory we
>> might allocate for user space, and then we could convert seretmem as well.
> 
> I think it has to be cgroup based considering where we are now :\

Most probably. I think the important lessons we learned are that

* mlocked != unmovable.
* RLIMIT_MEMLOCK should most probably never have been abused for
  unmovable memory (especially, long-term pinning)


-- 
Thanks,

David / dhildenb


