Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EADBC6A4672
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 16:51:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWflm-00043B-FA; Mon, 27 Feb 2023 10:50:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pWflM-0003tY-Ds
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 10:50:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pWflK-0004TK-Vs
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 10:50:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677513002;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C0qTD4v7x7WbvBhRl9y/p2gd/UAwPgrTFzyLivR2vaM=;
 b=GkPj67BvL8zfSJfBabOgcFPIghqXAZdZ3PIbhqlSXOwNGnGeO5LsYxAo/L7H4eaZtYMdVD
 qt1GnGaDWAO4Wn1IDei7b6j89OCm7koSjnsxg1Wa5AOr8P18wFMHiMIptIyQRyiiVh/hnX
 GJaxrSUjG/VfY38n3i8wDbEZeqF1WPE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-628-qdpLXW-xO0KaA2TmwX2Dpw-1; Mon, 27 Feb 2023 10:50:01 -0500
X-MC-Unique: qdpLXW-xO0KaA2TmwX2Dpw-1
Received: by mail-wm1-f70.google.com with SMTP id
 u19-20020a05600c00d300b003eb24ce58ceso2526490wmm.9
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 07:50:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:organization:from
 :references:cc:to:content-language:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=C0qTD4v7x7WbvBhRl9y/p2gd/UAwPgrTFzyLivR2vaM=;
 b=YCWGGQtVKK/K197lJ3KwKZgicDyBHyScoZh7jvjZGB9QspNRcKjHTLFetOCHo9Kmib
 NEFmY8ixTpKGfu+kNAKpA+N0utiHRRpgFF7YnXU3E5GpY1V3F98+IlhraxOwBr5/cv4v
 tRpKjAjS69IeDgEeY3ns+VxPIOzVW+/3PJn4iU4OVi93q86lMKfePo9wevfX2n3A6ECi
 qsfzXquUL3PAtQtBc4z1UyU+hszDzA7t2VF9lgWXxY1zkw2cmOmkeweuFnKU9je4tM8m
 YIOCNH+SIlfo/XoeqK/uHlGQgm0RPwuqfizZ5OVpnhuyQDHSuoUrznH3uY4Eum3vuLyM
 eFJQ==
X-Gm-Message-State: AO0yUKVkLLOaTxrM1V1n9X9kJDptgaFR88XZ5XtMS9PQhqpdqcbNR2Xr
 cdyZorD9wSjydCdQ8V/8v+GK0VKOKFKDqkjox0efCTe268prjMo0dTR0oRlpXGfI3MshBtDy5l8
 6ZhVvn0NbAC5HM2E=
X-Received: by 2002:a5d:4e46:0:b0:2c7:194a:15cf with SMTP id
 r6-20020a5d4e46000000b002c7194a15cfmr10438962wrt.22.1677512999377; 
 Mon, 27 Feb 2023 07:49:59 -0800 (PST)
X-Google-Smtp-Source: AK7set/FY3L3yaxoXIHdUjT2BD4IZkktB8b8ladKl741UjMoE9Y/QAdDFCTjsJ/uZJX/qfCK/96GWw==
X-Received: by 2002:a5d:4e46:0:b0:2c7:194a:15cf with SMTP id
 r6-20020a5d4e46000000b002c7194a15cfmr10438942wrt.22.1677512999029; 
 Mon, 27 Feb 2023 07:49:59 -0800 (PST)
Received: from ?IPV6:2003:cb:c703:1f00:7816:2307:5967:2228?
 (p200300cbc7031f007816230759672228.dip0.t-ipconnect.de.
 [2003:cb:c703:1f00:7816:2307:5967:2228])
 by smtp.gmail.com with ESMTPSA id
 r1-20020a1c2b01000000b003e9ae2a8cbfsm9793068wmr.2.2023.02.27.07.49.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Feb 2023 07:49:58 -0800 (PST)
Message-ID: <0c0d725f-2de8-392a-9e8b-0e49dcecd9b4@redhat.com>
Date: Mon, 27 Feb 2023 16:49:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Content-Language: en-US
To: Igor Mammedov <imammedo@redhat.com>, Yangming via <qemu-devel@nongnu.org>
Cc: Yangming <yangming73@huawei.com>, "mst@redhat.com" <mst@redhat.com>,
 "ani@anisinha.ca" <ani@anisinha.ca>,
 "wangzhigang (O)" <wangzhigang17@huawei.com>,
 "zhangliang (AG)" <zhangliang5@huawei.com>
References: <d9e62d4914a24b63af9f94a0e99b32c9@huawei.com>
 <20230223203241.28d38c29@imammedo.users.ipa.redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: VM crashed while hot-plugging memory
In-Reply-To: <20230223203241.28d38c29@imammedo.users.ipa.redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.089, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 23.02.23 20:32, Igor Mammedov wrote:
> On Fri, 10 Feb 2023 09:30:18 +0000
> Yangming via <qemu-devel@nongnu.org> wrote:
> 
>> Hello all:
>>
>> I found VM crashed while hot-plugging memory.
>>
>> Base infomation:
>> qemu version: qemu-master
>> requirements: hugepages, virtio-gpu
>>
>> It happens by the following steps:
>> 1. Booting a VM with hugepages and a virtio-gpu device.
>> 2. Connecting VNC of the VM.
>> 3. After the VM booted, hot-plugging 512G memory.
>> 4. Then you can find that the image in vnc is blocked and the worse thing is that the VM crashed.
>>
>> Actually the vcpu is blocked because of dead lock.
>>
>> Analysis:
>> As when hot-pluging the BQL is held, at the meanwhile, virtio-gpu is trying to hold the BQL for writing date. Then a vcpu is blocked waiting for hugepages hot-plugging, specifically, waiting for touching pages. If the blocked vcpu stops for several seconds, the soft lockup will happen, if it stops for a long time, e.g. 30s, the VM will crash.
>>
>> I am wandering if there are some ideas to avoid VM soft lockup and even VM crash ?
> 
> Maybe David can suggest something
> (CCed)

Using hugepages usually requires memory preallocation. That 
preallocation is expensive and can take quite some time, and all 
hotplugging operations happen under the BQL.

Things that could improve the situation without modifications:

(a) Disable memory preallocation (prealloc=off on the memory backend).
     But that means that if you run out of huge pages, that your VM may
     crash.

(b) Use a file on a hugetlb mount, and preallocate the memory
     externally, outside of QEMU, before plugging creating the memory
     backend and plugging the DIMM. As all memory is already
     preallocated, plugging the DIMM should be fast.

(c) Use multiple, smaller DIMMs.

(d) Parallel preallocation, using multiple preallocation threads.

(e) Use virtio-mem instead of DIMMs, which will add the memory
     incrementally in smaller steps (e.g., 128MiB -- 2 GiB). But it is
     not supported by all guests (especially not under Windows yet).


There are some upstream ideas on how to do preallcoation with hugetlb 
faster, especially, having a pool of pre-zero'ed huge pages in the 
kernel, such that allocation of a huge page gets significantly faster -- 
not upstream.

Further, there was the idea of asynchronous preallocation in QEMU. That 
could help when first creating the memory backend and waiting until it 
was asynchronously preallocation. Then, one could plug the DIMM.

-- 
Thanks,

David / dhildenb


