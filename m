Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D40F48C84D
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 17:28:26 +0100 (CET)
Received: from localhost ([::1]:43044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7gU5-0005q5-A5
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 11:28:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1n7gS2-0004DM-P3
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 11:26:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48356)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1n7gRz-0005Qp-8i
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 11:26:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642004774;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=btAnv5HQD9s7AF6IVxc3ryq16z1BpAVfzCFZB/4j4g8=;
 b=G+8JspXUkEByH3H07S2Q5so/ncoXjPeieoKE7dOFTUQzckNNKLniZHYGpaYwpuBNptZEfU
 bLSAfIPdeE9WHZO5E8zKj9Ej5Fm7pqbuLdIm/wZfyz0h6m7H6Muxnp+rscMjLnqkWHfjbt
 Aholk5mGQJJm3UQeyXbdibhhRMYWeKw=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-662-9f5SY-CvNLOFA-_q_CloaA-1; Wed, 12 Jan 2022 11:26:12 -0500
X-MC-Unique: 9f5SY-CvNLOFA-_q_CloaA-1
Received: by mail-ed1-f72.google.com with SMTP id
 v18-20020a056402349200b003f8d3b7ee8dso2688895edc.23
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 08:26:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=btAnv5HQD9s7AF6IVxc3ryq16z1BpAVfzCFZB/4j4g8=;
 b=ESkOr1GNpCycBjZdDBcJBpI0pS8YJI8EN6R/9LNVsVdo+umj6wkvFoxTIpddmRCQrU
 D/hL8oV3I9HySpl3eXDqdYnYehpPsCRrmA9ON2pCS+dE594WnvqzgEIwfZG7wAV5WjVk
 o9MV6/IZUAN3YlQKfhmevzW9I+CGj6c5fFLB5jo6Y1I8RoS2vqy9C3EtXcVF/+GIW5ku
 ZIyhQSxtPg3Lq5AsIE81u4NQI2JCIoWyObiJfVbY5KIEbq/V2x+27KEb8+lB0FZYvlRE
 J+IZPhohxMFAteKETgCDC4ABiBVSaPIIqnsrGlODugrgbAE81uX8S3fr1rsvTLPtFlOj
 /3hA==
X-Gm-Message-State: AOAM532jE7gI3d3P8SGh/Gr+7C+Lbp8j4Szg0qKqdUNAJXOaP5E+jtCd
 C4DTIUPMSNyFuaNO3kO9fYUxmJ63aPk0JWryrX0eQ1hsvnzSVsBsz5mmu2EgGxC7triJC1YuSvD
 aTiAejr773G7j62M=
X-Received: by 2002:a17:906:7e11:: with SMTP id
 e17mr404898ejr.288.1642004771335; 
 Wed, 12 Jan 2022 08:26:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwGrdGTD2k6TEUAeAo2AWUz1oWBC4FUhqYkHV04HQQWjoG27oOP8/U7Ydr9Jii2+/dZlal+GA==
X-Received: by 2002:a17:906:7e11:: with SMTP id
 e17mr404879ejr.288.1642004771064; 
 Wed, 12 Jan 2022 08:26:11 -0800 (PST)
Received: from ?IPV6:2003:cb:c702:4700:e25f:39eb:3cb8:1dec?
 (p200300cbc7024700e25f39eb3cb81dec.dip0.t-ipconnect.de.
 [2003:cb:c702:4700:e25f:39eb:3cb8:1dec])
 by smtp.gmail.com with ESMTPSA id g17sm54971eja.165.2022.01.12.08.26.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jan 2022 08:26:10 -0800 (PST)
Message-ID: <f20bd3ca-8d55-4124-78c8-7a2f4ce9f7f7@redhat.com>
Date: Wed, 12 Jan 2022 17:26:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [RFC] virtio_pmem: enable live migration support
To: Pankaj Gupta <pankaj.gupta@ionos.com>
References: <20211231120127.22394-1-pankaj.gupta.linux@gmail.com>
 <625c92c6-3618-fbaa-aea6-0ed86df872d3@redhat.com>
 <CAM9Jb+hvCZoXLx4_xx8KTq4oBts7MCe-ozp5ZuX2yPW6=tyLGQ@mail.gmail.com>
 <d0fc0d8e-fe38-1ab2-2d56-23345de783e7@redhat.com>
 <CALzYo32zxdL6ET_5Btw=Hoat8i4KtA2iUEpd9+_sXSbw84_SAA@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <CALzYo32zxdL6ET_5Btw=Hoat8i4KtA2iUEpd9+_sXSbw84_SAA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Rik van Riel <riel@surriel.com>,
 Qemu Developers <qemu-devel@nongnu.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Dan Williams <dan.j.williams@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12.01.22 17:08, Pankaj Gupta wrote:
>>>> I mean, that would be fundamentally broken, because the fsync() would
>>>> corrupt the file. So I assume in a sane environment, the dst could only
>>>> have stale clean pagecache pages. And we'd have to get rid of these to
>>>> re-read everything from file.
>>>
>>> In case of write back cache mode, we could still have stale dirty
>>> pages at the destination
>>> host and destination fsync is not the right thing to do. We need to
>>> invalidate these pages
>>> (Can we invalidate dirty pages resident in page cache with
>>> POSIX_FADV_DONTNEED as
>>> well?) man pages say, we cannot (unless i misunderstood it).
>>>
>>
>> I think you'd have to fsync + POSIX_FADV_DONTNEED. But I am still
>> confused how we could end up with dirty pagecache pages on the
>> destination. In my opinion, there should only be clean pagecache pages
>> -- can someone enlighten me? :)
> 
> because of activity on the page cache pages corresponding to mmap region
> in the past which is not synced yet or not reclaimed yet. Maybe this
> is hypothetical
> or not possible, happy to learn?

Right, but assume the following *sane*

#1 H0 starts and runs VM.
#2 H0 migrates VM to H1.
#3 H1 runs VM.
#4 H1 migrates VM to H0.
#5 H0 runs VM.

We'd expect a proper fsync during #2, writing back any dirty pages to
the memory backend. Otherwise, #3 would already be broken. Similarly,
we'd expect a proper fsync during #4.

I assume during #4 we could find clean pagecache pages that are actually
invalid, because the underlying file was changed by H1. So we have to
make sure to invalidate all pagecache pages (all clean).

-- 
Thanks,

David / dhildenb


