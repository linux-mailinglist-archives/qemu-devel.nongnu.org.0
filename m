Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3DDB50E2B4
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 16:09:49 +0200 (CEST)
Received: from localhost ([::1]:43588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nizPQ-0006Y8-GC
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 10:09:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nizMv-0001dT-Cs
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 10:07:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36036)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nizMt-0001rh-DT
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 10:07:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650895630;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SVM3muYPJyfaOhJtwnQezE4YHj5J/gwIIpTn05v9eQ0=;
 b=AX+p/qHMvsVRnowd0dCqAfHdaD4AqpAvu1BQ72T5NRR2xuZiMFceKe91L+FGy24p1mZtQc
 9pyYcyzDNgyw6T12dGsmShqx1bImQ9xJi4r+mT72J1WjS3vW/tDdBZQuGoyrYlJ6dwJYIG
 L+bFjZdNjTd2t8OAthyV6SBIc6IaxNs=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-660-II0fF2jXPWq3UHxo7PCSew-1; Mon, 25 Apr 2022 10:07:08 -0400
X-MC-Unique: II0fF2jXPWq3UHxo7PCSew-1
Received: by mail-wm1-f71.google.com with SMTP id
 r204-20020a1c44d5000000b0038eaca2b8c9so10343220wma.7
 for <qemu-devel@nongnu.org>; Mon, 25 Apr 2022 07:07:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:organization:subject
 :in-reply-to:content-transfer-encoding;
 bh=SVM3muYPJyfaOhJtwnQezE4YHj5J/gwIIpTn05v9eQ0=;
 b=pzwUF1oE9H2yNNh/GgyL7XnN5Nj57YKKzNG+ZvRPecenjUAxpGBqQs2Xquj9nygqt/
 g6mvm/+e8etc7XtPaGomosc8Sv5P6sDtTpZVjxdp+dWIwD85hEhLAqcy4uE1BD0UIdGx
 /23SpAMLHFJ2axkC243glj4T7n2Xcpfm8XnYbqx6OEIhxW1OKbrvTJArTAeeVV6SgOjU
 68Xb5ZpizjmQ+PgD53Xo8EJpJ+da16oQDpgfPhrZWYnwAtLEic3UY61nUQv85sqeBPBs
 Hj3QV/nf3eYlLt2O91b57eibUBFhOiTaD0vh7rMzINlPxw1ljXk/FQsF0pjPNRu4X4Hc
 iy8w==
X-Gm-Message-State: AOAM531NWetUxFd3ETzK/oA4sDqw2hPk8bX745CVYWoHXgLVe8dl03IH
 ivQ9OtzWiUNh5VGlbrj7LGQiDLI8TFz4zqw7CZamYYvf+WVP9lhg29DQF94AtiU9NWVVSNnY2Yz
 UwC5OBUPDN1TsN9I=
X-Received: by 2002:a5d:6241:0:b0:207:ac0e:3549 with SMTP id
 m1-20020a5d6241000000b00207ac0e3549mr14371890wrv.343.1650895627108; 
 Mon, 25 Apr 2022 07:07:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzgoNX9maOD+O7h8van/rWNjXvLl8lKMAp755C32BIUi/e19PViAQ+6Xwf7k6WLPh49+cUdlA==
X-Received: by 2002:a5d:6241:0:b0:207:ac0e:3549 with SMTP id
 m1-20020a5d6241000000b00207ac0e3549mr14371841wrv.343.1650895626813; 
 Mon, 25 Apr 2022 07:07:06 -0700 (PDT)
Received: from ?IPV6:2003:cb:c700:fc00:490d:ed6a:8b22:223a?
 (p200300cbc700fc00490ded6a8b22223a.dip0.t-ipconnect.de.
 [2003:cb:c700:fc00:490d:ed6a:8b22:223a])
 by smtp.gmail.com with ESMTPSA id
 t18-20020a05600c199200b0039291537cfesm11669789wmq.21.2022.04.25.07.07.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Apr 2022 07:07:06 -0700 (PDT)
Message-ID: <d2aa867b-3355-8223-2721-f3e825632255@redhat.com>
Date: Mon, 25 Apr 2022 16:07:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-US
To: Jason Gunthorpe <jgg@ziepe.ca>
References: <20220310140911.50924-1-chao.p.peng@linux.intel.com>
 <20220310140911.50924-5-chao.p.peng@linux.intel.com>
 <Yk8L0CwKpTrv3Rg3@google.com>
 <02e18c90-196e-409e-b2ac-822aceea8891@www.fastmail.com>
 <YlB3Z8fqJ+67a2Ck@google.com>
 <7ab689e7-e04d-5693-f899-d2d785b09892@redhat.com>
 <20220412143636.GG64706@ziepe.ca>
 <1686fd2d-d9c3-ec12-32df-8c4c5ae26b08@redhat.com>
 <20220413175208.GI64706@ziepe.ca>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v5 04/13] mm/shmem: Restrict MFD_INACCESSIBLE memory
 against RLIMIT_MEMLOCK
In-Reply-To: <20220413175208.GI64706@ziepe.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
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

On 13.04.22 19:52, Jason Gunthorpe wrote:
> On Wed, Apr 13, 2022 at 06:24:56PM +0200, David Hildenbrand wrote:
>> On 12.04.22 16:36, Jason Gunthorpe wrote:
>>> On Fri, Apr 08, 2022 at 08:54:02PM +0200, David Hildenbrand wrote:
>>>
>>>> RLIMIT_MEMLOCK was the obvious candidate, but as we discovered int he
>>>> past already with secretmem, it's not 100% that good of a fit (unmovable
>>>> is worth than mlocked). But it gets the job done for now at least.
>>>
>>> No, it doesn't. There are too many different interpretations how
>>> MELOCK is supposed to work
>>>
>>> eg VFIO accounts per-process so hostile users can just fork to go past
>>> it.
>>>
>>> RDMA is per-process but uses a different counter, so you can double up
>>>
>>> iouring is per-user and users a 3rd counter, so it can triple up on
>>> the above two
>>
>> Thanks for that summary, very helpful.
> 
> I kicked off a big discussion when I suggested to change vfio to use
> the same as io_uring
> 
> We may still end up trying it, but the major concern is that libvirt
> sets the RLIMIT_MEMLOCK and if we touch anything here - including
> fixing RDMA, or anything really, it becomes a uAPI break for libvirt..
> 

Okay, so we have to introduce a second mechanism, don't use
RLIMIT_MEMLOCK for new unmovable memory, and then eventually phase out
RLIMIT_MEMLOCK usage for existing unmovable memory consumers (which, as
you say, will be difficult).

>>>> So I'm open for alternative to limit the amount of unmovable memory we
>>>> might allocate for user space, and then we could convert seretmem as well.
>>>
>>> I think it has to be cgroup based considering where we are now :\
>>
>> Most probably. I think the important lessons we learned are that
>>
>> * mlocked != unmovable.
>> * RLIMIT_MEMLOCK should most probably never have been abused for
>>   unmovable memory (especially, long-term pinning)
> 
> The trouble is I'm not sure how anything can correctly/meaningfully
> set a limit.
> 
> Consider qemu where we might have 3 different things all pinning the
> same page (rdma, iouring, vfio) - should the cgroup give 3x the limit?
> What use is that really?

I think your tackling a related problem, that we double-account
unmovable/mlocked memory due to lack of ways to track that a page is
already pinned by the same user/cgroup/whatsoever. Not easy to solve.

The problem also becomes interesting if iouring with fixed buffers
doesn't work on guest RAM, but on some other QEMU buffers.

> 
> IMHO there are only two meaningful scenarios - either you are unpriv
> and limited to a very small number for your user/cgroup - or you are
> priv and you can do whatever you want.
> 
> The idea we can fine tune this to exactly the right amount for a
> workload does not seem realistic and ends up exporting internal kernel
> decisions into a uAPI..


IMHO, there are three use cases:

* App that conditionally uses selected mechanism that end up requiring
  unmovable, long-term allocations. Secretmem, iouring, rdma. We want
  some sane, small default. Apps have a backup path in case any such
  mechanism fails because we're out of allowed unmovable resources.
* App that relies on selected mechanism that end up requiring unmovable,
  long-term allocations. E.g., vfio with known memory consumption, such
  as the VM size. It's fairly easy to come up with the right value.
* App that relies on multiple mechanism that end up requiring unmovable,
  long-term allocations. QEMU with rdma, iouring, vfio, ... I agree that
  coming up with something good is problematic.

Then, there are privileged/unprivileged apps. There might be admins that
just don't care. There might be admins that even want to set some limit
instead of configuring "unlimited" for QEMU.

Long story short, it should be an admin choice what to configure,
especially:
* What the default is for random apps
* What the maximum is for selected apps
* Which apps don't have a maximum

-- 
Thanks,

David / dhildenb


