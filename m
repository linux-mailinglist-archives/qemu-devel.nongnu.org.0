Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB2558AC81
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 16:53:30 +0200 (CEST)
Received: from localhost ([::1]:49920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJyhc-0004zD-Jc
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 10:53:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oJyfp-0002sU-6k
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 10:51:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oJyfk-0002h5-Im
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 10:51:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659711091;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CgO7SeAxIeIGIpUD7Zg+HxbuJx7OC6Zm+M4XYtM+zaA=;
 b=ekt+nlN8pg0/oBdQrKHHnYaT9pNmns05XLnWkvTY7xURwaxctHbDsmoH6Ctu2fih/76Oha
 4Gx5R9Z6QHgr9NTWP225kggR6X6eJaQ0CxvbcXz5AtTbtMw/WJKA7UdhhrgVu32krPPKnR
 h5W/qXnWTWSWpUFdCJLLztLo0LrkfC0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-597-LqyBTuuwOMOpzhyfi7s1BQ-1; Fri, 05 Aug 2022 10:51:30 -0400
X-MC-Unique: LqyBTuuwOMOpzhyfi7s1BQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 h65-20020a1c2144000000b003a30cae106cso4284325wmh.8
 for <qemu-devel@nongnu.org>; Fri, 05 Aug 2022 07:51:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=CgO7SeAxIeIGIpUD7Zg+HxbuJx7OC6Zm+M4XYtM+zaA=;
 b=K6VmQp7kHJIfD1NmoCm9LfepZoHUC8Xw2k8VRqOW9/39ZRozzSJoiZHpckd98+MrAM
 m2nuZ1rIokqcf1nIHOlXLOeMYnmDuzNnwPCpDpqVJD0Zh9C2ARghZfEF47czaWvWQu4v
 FKFsaYuUUUZDK9zFT/WXlt+L4i69zqDdonRbgLZCbfeEoq1HtJDQt05HpbQoQmAGDlTv
 cLiuVirZ5nGiOTREyO3mtN1hmUiLehVGK0N7NabdqNsTQOQ33eh03W7XOnXIqXqzHg4A
 iWaeQMMkBJJW3j74Idh/Ejj0XcjlNAI6MdZfy66HM55d7cjpCcCKiraPTEIMZulphDV1
 5O0w==
X-Gm-Message-State: ACgBeo0tMohBukzUeDUS/dUHOslofzaF6eQdJppv94lhx7NABHUWfeS6
 5LqSWiCN3MUWXU/gPZvKvj4Iiq5dO5grt6IZHwVms1Xh8PgfcYEZ6w/BfuoJ2u3fnXXJoeEt/Do
 mivhFo+Sk+KmwOyk=
X-Received: by 2002:a05:600c:4b83:b0:3a5:1121:f445 with SMTP id
 e3-20020a05600c4b8300b003a51121f445mr5113219wmp.9.1659711088986; 
 Fri, 05 Aug 2022 07:51:28 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7zc98WiVfkp+n5Rgn0gBjzzd6etkdbdhjQ3m5Dy6T8IjYSz8r8a5n92TSjnXqcxFLoVkwp8Q==
X-Received: by 2002:a05:600c:4b83:b0:3a5:1121:f445 with SMTP id
 e3-20020a05600c4b8300b003a51121f445mr5113196wmp.9.1659711088734; 
 Fri, 05 Aug 2022 07:51:28 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-42-113-85.web.vodafone.de.
 [109.42.113.85]) by smtp.gmail.com with ESMTPSA id
 z11-20020a5d44cb000000b00220688d445esm4920396wrr.117.2022.08.05.07.51.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Aug 2022 07:51:27 -0700 (PDT)
Message-ID: <700fc2b0-8a81-9adf-a47c-f72f6a7ecb3e@redhat.com>
Date: Fri, 5 Aug 2022 16:51:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] hw/net: Discard overly fragmented packets
Content-Language: en-US
To: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org
Cc: Mauro Matteo Cascella <mcascell@redhat.com>,
 Andrew Melnychenko <andrew@daynix.com>, Alexander Bulekov <alxndr@bu.edu>,
 Li Qiang <liq3ea@gmail.com>, Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Prasad J Pandit <ppandit@redhat.com>, qemu-stable@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20210705084011.814175-1-philmd@redhat.com>
 <adb810ea-a4f3-3ff9-3f4b-9973c3e1f518@redhat.com>
 <40744707-c9ab-a7c2-c509-6d0275a69114@redhat.com>
 <b389e61b-4606-1327-3aa0-b4e056ba8dd3@redhat.com>
 <b1ce9a24-0e77-7a15-9532-d3bc7d480492@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <b1ce9a24-0e77-7a15-9532-d3bc7d480492@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 11/08/2021 06.08, Jason Wang wrote:
> 
> 在 2021/8/4 上午9:43, Jason Wang 写道:
>>
>> 在 2021/8/3 下午5:51, Philippe Mathieu-Daudé 写道:
>>> On 8/3/21 11:33 AM, Thomas Huth wrote:
>>>> On 05/07/2021 10.40, Philippe Mathieu-Daudé wrote:
>>>>> Our infrastructure can handle fragmented packets up to
>>>>> NET_MAX_FRAG_SG_LIST (64) pieces. This hard limit has
>>>>> been proven enough in production for years. If it is
>>>>> reached, it is likely an evil crafted packet. Discard it.
>>>>>
>>>>> Include the qtest reproducer provided by Alexander Bulekov:
>>>>>
>>>>>     $ make check-qtest-i386
>>>>>     ...
>>>>>     Running test qtest-i386/fuzz-vmxnet3-test
>>>>>     qemu-system-i386: net/eth.c:334: void
>>>>> eth_setup_ip4_fragmentation(const void *, size_t, void *, size_t,
>>>>> size_t, size_t, _Bool):
>>>>>     Assertion `frag_offset % IP_FRAG_UNIT_SIZE == 0' failed.
>>>>>
>>>>> Cc: qemu-stable@nongnu.org
>>>>> Reported-by: OSS-Fuzz (Issue 35799)
>>>>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/460
>>>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>>>> ---
>>>>>    hw/net/net_tx_pkt.c             |   8 ++
>>>>>    tests/qtest/fuzz-vmxnet3-test.c | 195 ++++++++++++++++++++++++++++++++
>>>>>    MAINTAINERS                     |   1 +
>>>>>    tests/qtest/meson.build         |   1 +
>>>>>    4 files changed, 205 insertions(+)
>>>>>    create mode 100644 tests/qtest/fuzz-vmxnet3-test.c
>>>> Reviewed-by: Thomas Huth <thuth@redhat.com>
>>>>
>>>> Jason, I think this would even still qualify for QEMU v6.1 ?
>>> Yes, easy one for 6.1.
>>
>>
>> Yes, this will be included for rc3.
>>
>> Thanks
> 
> For some reasons it misses rc3.
> 
> I will include it for 6.2.
> 
> Sorry.

  Hi Jason,

looks like this fell through the cracks again ... could you maybe pick it up 
now for QEMU 7.1 ?

  Thomas


