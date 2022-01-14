Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E1BB48E760
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 10:22:11 +0100 (CET)
Received: from localhost ([::1]:44146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8Img-00089f-N3
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 04:22:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1n8IgX-0002og-0n
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 04:15:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55280)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1n8IgV-0003nx-De
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 04:15:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642151741;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iwv6EsSvfKulT7M/o8JTg7IXbGJCbyMxQoBWSKavecc=;
 b=A1g07xlkKs25uFxfK7JYds3vKDZV4n2ycVSdNiypCQxZN2+mbUOixJwLSqy5IZPdRpUFPu
 GIZUxhPhDF1hSM/SZcZFfVppQg3UuHrihdzAqpI7009XAjWP5lHOqfXSZ6G5camqrOOUth
 rd1fEXi6N0vkiC0uFPzJ4mrVuYYCzq4=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-385-c1CFhRkxNlabH9BCIw5Gfw-1; Fri, 14 Jan 2022 04:15:40 -0500
X-MC-Unique: c1CFhRkxNlabH9BCIw5Gfw-1
Received: by mail-pj1-f72.google.com with SMTP id
 x1-20020a17090ab00100b001b380b8ed35so8659663pjq.7
 for <qemu-devel@nongnu.org>; Fri, 14 Jan 2022 01:15:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=iwv6EsSvfKulT7M/o8JTg7IXbGJCbyMxQoBWSKavecc=;
 b=cltzrZVtPODsFoyvZixXhewDvWvQsveDP2xHVwaumoKcXtTxVpUfqlC9fHmqYGat3z
 7H2TICuP/jdB9ZR2TYX4vAr5GEKCVvBD4OOyiglEsn9XBZ7nHdYtP20jMU6Wgucn0+5D
 yKxAIxqxNIUQO/1hDXjIg5VUoNAmMxz2P5cksNvrIkghV9oQdIXzu84fl0FRf9o+5MM3
 hpyXWvp4ajlf4oJXob6RFotoL0K0K/3hjZcnBXpdBCJYxRxge5F6xVNkOmDKw1WiVwdJ
 y6S1aBWqKYhYzJ9Zw3RGUPjomFKvUULleP2moUNshseAs9JX2J61TvH3EgbY8Qqd/066
 JAEw==
X-Gm-Message-State: AOAM531sjmbFZ1ra/vQaRddcegsRvKEIarDEM7j4VxX0iCTGvHiCPuoC
 eGTQpWjNVPlO30E3tKD+0+MdIX24o3av8UbKpN5H5W/kEu5gTfKFsNZYBRgxrYlKrPp6ZtIMP3i
 MM6FXVSqvgndSlh0=
X-Received: by 2002:a62:384b:0:b0:4bd:ea83:95c5 with SMTP id
 f72-20020a62384b000000b004bdea8395c5mr7926211pfa.75.1642151739474; 
 Fri, 14 Jan 2022 01:15:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy/K9qkBQJNbG/aOb+DuNbT/suLJmB1Vh316YGjW2wGwCU5O5ojLyVGgMhDFuY0RY60xM1qxQ==
X-Received: by 2002:a62:384b:0:b0:4bd:ea83:95c5 with SMTP id
 f72-20020a62384b000000b004bdea8395c5mr7926191pfa.75.1642151739182; 
 Fri, 14 Jan 2022 01:15:39 -0800 (PST)
Received: from [10.72.12.216] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id v12sm4086347pgl.90.2022.01.14.01.15.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jan 2022 01:15:38 -0800 (PST)
Message-ID: <54f9372b-7a04-28db-5f27-0eafaf87d632@redhat.com>
Date: Fri, 14 Jan 2022 17:15:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.1
Subject: Re: [PATCH 2/3] intel-iommu: drop VTDBus
From: Jason Wang <jasowang@redhat.com>
To: Peter Xu <peterx@redhat.com>
References: <20220105041945.13459-1-jasowang@redhat.com>
 <20220105041945.13459-4-jasowang@redhat.com> <Yd+mlM7oqqOkFtO4@xz-m1.local>
 <b542cb8d-d1f4-6583-a89e-49dedafc77d4@redhat.com>
In-Reply-To: <b542cb8d-d1f4-6583-a89e-49dedafc77d4@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
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
Cc: yi.l.liu@intel.com, yi.y.sun@linux.intel.com, qemu-devel@nongnu.org,
 mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2022/1/14 上午10:32, Jason Wang 写道:
>>> dressSpace *as)
>>>   /* GHashTable functions */
>>>   static gboolean vtd_uint64_equal(gconstpointer v1, gconstpointer v2)
>>>   {
>>> -    return *((const uint64_t *)v1) == *((const uint64_t *)v2);
>>> +    const struct vtd_as_key *key1 = v1;
>>> +    const struct vtd_as_key *key2 = v2;
>>> +
>>> +    return (key1->bus == key2->bus) && (key1->devfn == key2->devfn);
>>>   }
>>>     static guint vtd_uint64_hash(gconstpointer v)
>>>   {
>>> -    return (guint)*(const uint64_t *)v;
>>> +    const struct vtd_as_key *key = v;
>>> +    guint value = (guint)(uintptr_t)key->bus;
>>> +
>>> +    return (guint)(value << 8 | key->devfn);
>> Note that value is a pointer to PCIBus*.  Just want to check with you 
>> that it's
>> intended to use this hash value (or maybe you wanted to use Source ID 
>> so it is
>> bus number to use not the bus pointer)?
>
>
> Right, SID should be used here.


Sorry for taking too long for the context switching ...

The hash and shift based the bus pointer is intended since we use bus 
pointer as part of the key. The reason is still, during 
vtd_find_add_as(), SID is not correct since guest might not finish the 
initialization of the device and PCI bridge.

Thanks


