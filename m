Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E434590AB
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 15:59:06 +0100 (CET)
Received: from localhost ([::1]:33960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpAmf-0006xw-Ab
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 09:59:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mpAl4-0004VR-3O
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 09:57:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29161)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mpAl1-0007Ta-TY
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 09:57:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637593043;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a6sxP8BbpsAMN/5roSu3j/ZWT90syA5vCmiIsqjbMtk=;
 b=CTZzBYOj9NMS5ihn+fb5DQ0CxKjOREYArVSwooh1gGYa7KVAOl/GRdo+Lm3TQbPQ0N5RMX
 trHokDDWh6MqpRVL150h4rHCDPS8CKctvHJXt7xOcml7yfI84XG/1CzOa+lx8Ku+yVMg34
 1mEDWYR0JMwosIttyQ5pqFLcz9/tpK8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-130-Oa8UnAnHN7amKcz6IAaA-w-1; Mon, 22 Nov 2021 09:57:22 -0500
X-MC-Unique: Oa8UnAnHN7amKcz6IAaA-w-1
Received: by mail-wm1-f71.google.com with SMTP id
 138-20020a1c0090000000b00338bb803204so6171108wma.1
 for <qemu-devel@nongnu.org>; Mon, 22 Nov 2021 06:57:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=a6sxP8BbpsAMN/5roSu3j/ZWT90syA5vCmiIsqjbMtk=;
 b=aE5to7GSh4LfA4GNGiWDzNm48/Eyb49bEO2qHTgnUBPP9HxqxMEZl1Q6pHm8gNC/OE
 nzig8OzWE0EstlkyBp9ONtWpdAvaLFERebwnqT+EsWRnWU1TUqaWNjkDEQkk90amLk4T
 G4Q07LkRgrbV7DZS54O3d2OwNgOXOrkT8Iz27j2XBxahwTGtBAi60aT0dcGyi+yyvqli
 ncVvgclxh+eirNff3YuQXIiQAjBXPSiGcfktV2BA20ccBiG8dVXvcMl2+G0AuSk5i7N+
 SZI9Cnkra9YERgbeoBTGmsH4bxcC9pY2T18125HOi6QpSovunkBuuVZUACJ1lykeQZDu
 LFFw==
X-Gm-Message-State: AOAM531CxedLlHrEbt7gmexB0/zLnINsHNRFkmLllyKYkQGSgNrm9RBw
 fxluSZlHQ3pvo+hLcyN/R+aCYtzEjjyMlA9Tu5BWuTks4JxVHQ82kckO8+e7aIPTLQgjn3M4qsu
 egdyNjYyx1j+x+4s=
X-Received: by 2002:a7b:ce8c:: with SMTP id q12mr29900017wmj.91.1637593040912; 
 Mon, 22 Nov 2021 06:57:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzb1fVkmOhpRnzBJsEnrS5eq+nBwa2MfaKvZWrzzGVY0sVj4OHkUiEBZAugOc7zSp386W7pog==
X-Received: by 2002:a7b:ce8c:: with SMTP id q12mr29899978wmj.91.1637593040715; 
 Mon, 22 Nov 2021 06:57:20 -0800 (PST)
Received: from [192.168.3.132] (p5b0c667b.dip0.t-ipconnect.de. [91.12.102.123])
 by smtp.gmail.com with ESMTPSA id s63sm10249585wme.22.2021.11.22.06.57.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Nov 2021 06:57:20 -0800 (PST)
Message-ID: <d2b46b84-8930-4304-2946-4d4a16698b24@redhat.com>
Date: Mon, 22 Nov 2021 15:57:17 +0100
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
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20211122140148.GR876299@ziepe.ca>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.709,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.097, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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

On 22.11.21 15:01, Jason Gunthorpe wrote:
> On Mon, Nov 22, 2021 at 02:35:49PM +0100, David Hildenbrand wrote:
>> On 22.11.21 14:31, Jason Gunthorpe wrote:
>>> On Mon, Nov 22, 2021 at 10:26:12AM +0100, David Hildenbrand wrote:
>>>
>>>> I do wonder if we want to support sharing such memfds between processes
>>>> in all cases ... we most certainly don't want to be able to share
>>>> encrypted memory between VMs (I heard that the kernel has to forbid
>>>> that). It would make sense in the use case you describe, though.
>>>
>>> If there is a F_SEAL_XX that blocks every kind of new access, who
>>> cares if userspace passes the FD around or not?
>> I was imagining that you actually would want to do some kind of "change
>> ownership". But yeah, the intended semantics and all use cases we have
>> in mind are not fully clear to me yet. If it's really "no new access"
>> (side note: is "access" the right word?) then sure, we can pass the fd
>> around.
> 
> What is "ownership" in a world with kvm and iommu are reading pages
> out of the same fd?

In the world of encrypted memory / TDX, KVM somewhat "owns" that memory
IMHO (for example, only it can migrate or swap out these pages; it's
might be debatable if the TDX module or KVM actually "own" these pages ).

-- 
Thanks,

David / dhildenb


