Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF483459130
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 16:18:36 +0100 (CET)
Received: from localhost ([::1]:42882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpB5X-0007R8-MO
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 10:18:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mpB37-0005yI-8I
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 10:16:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mpB2s-0002Ua-Ts
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 10:15:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637594149;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=621jYNtFW+0mFTU6R2GKZf+P+Fi4Pvi8SOzQ0aE6RqI=;
 b=iwkuELpZAhqolFQcC1E6znrWv2bjBEuIT4o77IdVGM4lv+Y6VLR4FhYvje5zKJ6D3w6yjR
 ktOjG7C7d3NYSzLVrn7S3sP8zOpm9GY+qW92a6jxpkc6GZJPe51k8dgXrAD4yAEF4wC5WU
 V0+D0vruKnDpbRxgTUctKHh3LY5hRaA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-415-HKOOwmtPP4OWzz1jwto9vA-1; Mon, 22 Nov 2021 10:15:48 -0500
X-MC-Unique: HKOOwmtPP4OWzz1jwto9vA-1
Received: by mail-wr1-f71.google.com with SMTP id
 h13-20020adfa4cd000000b001883fd029e8so3213171wrb.11
 for <qemu-devel@nongnu.org>; Mon, 22 Nov 2021 07:15:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=621jYNtFW+0mFTU6R2GKZf+P+Fi4Pvi8SOzQ0aE6RqI=;
 b=rqByjd4m5ouV0BKwnDo7UQc8WCcSYMTBC6+Cn2rq13F27BmtMpn84N+cUgw7SIuWVw
 YmZk73R7pt8UsX2ofAfuH5Tp4TkcmFaXMebIRYip+Ka67q5FPYsiIeq2XixhziNqf8YP
 Ar1Sk772dJfSIBfo7U0UIMdw7TJJ6HT4MAGBYcOmyIGfCScDtXyoeQKbtgVHcJGCyUmB
 qbYafBqXWvoCNwHHZstSZCACTWlSIfwGUPro6nGusB4Fkk1gcn0Bo2l1zSZvVf3rfpj7
 kozo1LyI/pwA5C0zUNX2CtFIAlhnY9cXE88P6C2Fl+lQbbhlenMaKfSVbYxYPfPsr+Ax
 Xc3g==
X-Gm-Message-State: AOAM532bD8DAx/zURnRFZfVoTq0fwOImnwqYEi/vXVUn/T5iYkjiyqIa
 D9quTksAoyPYPcWiuYx+4VG6QqeXjg5ygtDWiKwOlCTfmde4S9STo25eDjE8RNZpCF10FtGc6kP
 jP7X7bHfC2JEwVn4=
X-Received: by 2002:a5d:47c9:: with SMTP id o9mr23544447wrc.348.1637594147122; 
 Mon, 22 Nov 2021 07:15:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxuFOOEsifCDD0U8JxvjAD6WFeCs8A6VTuxwL4oNddrkpIFu/eH1rQJ0/pc+09fBfKgQ5UEOw==
X-Received: by 2002:a5d:47c9:: with SMTP id o9mr23544380wrc.348.1637594146835; 
 Mon, 22 Nov 2021 07:15:46 -0800 (PST)
Received: from [192.168.3.132] (p5b0c667b.dip0.t-ipconnect.de. [91.12.102.123])
 by smtp.gmail.com with ESMTPSA id d7sm8948184wrw.87.2021.11.22.07.15.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Nov 2021 07:15:46 -0800 (PST)
Message-ID: <f201406b-1448-f7c4-5484-3f4c257b6896@redhat.com>
Date: Mon, 22 Nov 2021 16:15:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [RFC v2 PATCH 01/13] mm/shmem: Introduce F_SEAL_GUEST
To: Jason Gunthorpe <jgg@ziepe.ca>
References: <20211119134739.20218-1-chao.p.peng@linux.intel.com>
 <20211119134739.20218-2-chao.p.peng@linux.intel.com>
 <20211119151943.GH876299@ziepe.ca>
 <df11d753-6242-8f7c-cb04-c095f68b41fa@redhat.com>
 <20211119160023.GI876299@ziepe.ca>
 <4efdccac-245f-eb1f-5b7f-c1044ff0103d@redhat.com>
 <20211122133145.GQ876299@ziepe.ca>
 <56c0dffc-5fc4-c337-3e85-a5c9ce619140@redhat.com>
 <20211122140148.GR876299@ziepe.ca>
 <d2b46b84-8930-4304-2946-4d4a16698b24@redhat.com>
 <20211122150956.GS876299@ziepe.ca>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20211122150956.GS876299@ziepe.ca>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.709,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.097, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 "H . Peter Anvin" <hpa@zytor.com>, Chao Peng <chao.p.peng@linux.intel.com>,
 ak@linux.intel.com, Jonathan Corbet <corbet@lwn.net>,
 Joerg Roedel <joro@8bytes.org>, x86@kernel.org,
 Hugh Dickins <hughd@google.com>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, luto@kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Jim Mattson <jmattson@google.com>, dave.hansen@intel.com,
 Sean Christopherson <seanjc@google.com>, susie.li@intel.com,
 Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
 john.ji@intel.com, Yu Zhang <yu.c.zhang@linux.intel.com>,
 linux-fsdevel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22.11.21 16:09, Jason Gunthorpe wrote:
> On Mon, Nov 22, 2021 at 03:57:17PM +0100, David Hildenbrand wrote:
>> On 22.11.21 15:01, Jason Gunthorpe wrote:
>>> On Mon, Nov 22, 2021 at 02:35:49PM +0100, David Hildenbrand wrote:
>>>> On 22.11.21 14:31, Jason Gunthorpe wrote:
>>>>> On Mon, Nov 22, 2021 at 10:26:12AM +0100, David Hildenbrand wrote:
>>>>>
>>>>>> I do wonder if we want to support sharing such memfds between processes
>>>>>> in all cases ... we most certainly don't want to be able to share
>>>>>> encrypted memory between VMs (I heard that the kernel has to forbid
>>>>>> that). It would make sense in the use case you describe, though.
>>>>>
>>>>> If there is a F_SEAL_XX that blocks every kind of new access, who
>>>>> cares if userspace passes the FD around or not?
>>>> I was imagining that you actually would want to do some kind of "change
>>>> ownership". But yeah, the intended semantics and all use cases we have
>>>> in mind are not fully clear to me yet. If it's really "no new access"
>>>> (side note: is "access" the right word?) then sure, we can pass the fd
>>>> around.
>>>
>>> What is "ownership" in a world with kvm and iommu are reading pages
>>> out of the same fd?
>>
>> In the world of encrypted memory / TDX, KVM somewhat "owns" that memory
>> IMHO (for example, only it can migrate or swap out these pages; it's
>> might be debatable if the TDX module or KVM actually "own" these pages ).
> 
> Sounds like it is a swap provider more than an owner?

Yes, I think we can phrase it that way, + "migrate provider"


-- 
Thanks,

David / dhildenb


