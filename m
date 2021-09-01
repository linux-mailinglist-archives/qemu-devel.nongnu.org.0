Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DFF93FE012
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 18:37:39 +0200 (CEST)
Received: from localhost ([::1]:58418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLTF4-00035f-Gb
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 12:37:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mLSgg-0005PZ-G5
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 12:02:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32519)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mLSge-0006Ck-LJ
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 12:02:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630512123;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hw8D14a7GNeBDDnPVZvALA/yxNE0Oy/kdNXaqhOMb6E=;
 b=Hcu8lqTbfSin8sgCqXVb1X8h+KIE42qHOen6TF44XYmArIUP/8Kkx7H/PWs2cWW0m7NAah
 +1EMDyWU2q/JkPZ7FKUGWzQF6GCFIHOSdCoxdxO2acdc3hbUkZpqwD/zpmlj3a5WwS1eD5
 b1LQUEuinXRF/JUWx83WYF2rlOHJ0IQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-44-uK2DwhyaPtqEg_wMiAVQUw-1; Wed, 01 Sep 2021 12:02:02 -0400
X-MC-Unique: uK2DwhyaPtqEg_wMiAVQUw-1
Received: by mail-wm1-f72.google.com with SMTP id
 a201-20020a1c7fd2000000b002e748bf0544so15815wmd.2
 for <qemu-devel@nongnu.org>; Wed, 01 Sep 2021 09:02:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hw8D14a7GNeBDDnPVZvALA/yxNE0Oy/kdNXaqhOMb6E=;
 b=BeBnNzs+CkKGD53gCgy8Ld/+sOUL0kzfTBd96bQSlXR+YdvIcCOzx/Fo20v3I8UrCA
 kiqX+0svdvKsPawn6wMqtfyzrZxmASAGgX2XXBI1drh3vWrZ9ajjeziEogl1WWrFBwwF
 QzLrgMNwS8LWio7NDndXL+W34YAHV/3nFh9F3o5xu+8wb9GFiBdPd/KEkNn9ANk+CjN5
 N2efTxg7uQMO7vmJCq96uvbIuns80MSygceGFYx3bZKuNMKdDJCGPCozMkK8cUmJlcPP
 HfEzXyNw+J9AKiIEsLlzMkgjWSdRM0T7BevL+7hH7hOjON+jr4erLCBJsq0Ggxoe7rPf
 GjQg==
X-Gm-Message-State: AOAM533ubPJraBm17hbcMwIYYgFnrH4layEwM3uFKNoMf/5WcnIhxric
 x6sVUUaNG5WNllpsIK8XRbOOVQ6019ZZczNcN/As7pNmWSWYDZBOMnm8oUhQTguAMhz/FJqAbue
 EaSU8RKYCtIPppK4=
X-Received: by 2002:adf:9e49:: with SMTP id v9mr52711wre.39.1630512120863;
 Wed, 01 Sep 2021 09:02:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyTIwGiJC2VcP+eMfJAjJOazMzBMKpECyWFZogEYwA5rbhl3dSv575LYyKx6hzCffXhWqSnYQ==
X-Received: by 2002:adf:9e49:: with SMTP id v9mr52692wre.39.1630512120699;
 Wed, 01 Sep 2021 09:02:00 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id f23sm137508wmc.3.2021.09.01.09.01.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Sep 2021 09:02:00 -0700 (PDT)
Subject: Re: [PATCH v3] memory: Have 'info mtree' remove duplicated Address
 Space information
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20210823085429.597873-1-philmd@redhat.com>
 <8743192d-225d-c091-ab53-c747daa86f46@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <14bef4b3-6a2a-2a53-1a7d-8d52b285c7f5@redhat.com>
Date: Wed, 1 Sep 2021 18:01:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <8743192d-225d-c091-ab53-c747daa86f46@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.029, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Gerd Hoffmann <kraxel@redhat.com>, Peter Xu <peterx@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/23/21 11:20 AM, David Hildenbrand wrote:
> On 23.08.21 10:54, Philippe Mathieu-Daudé wrote:
>> Per Peter Maydell [*]:
>>
>>    'info mtree' monitor command was designed on the assumption that
>>    there's really only one or two interesting address spaces, and
>>    with more recent developments that's just not the case any more.
>>
>> Similarly about how the FlatView are sorted using a GHashTable,
>> sort the AddressSpace objects to remove the duplications (AS
>> using the same root MemoryRegion).
>>
>> This drastically reduce 'info mtree' on some boards.
> 
> s/reduce/reduces the output of/
> 
>>
>> Before:
>>
>>    $ (echo info mtree; echo q) \
>>      | qemu-system-aarch64 -S -monitor stdio -M raspi3b \
>>      | wc -l
>>    423
>>
>> After:
>>
>>    $ (echo info mtree; echo q) \
>>      | qemu-system-aarch64 -S -monitor stdio -M raspi3b \
>>      | wc -l
>>    106
>>
>>    (qemu) info mtree
>>    address-space: I/O
>>      0000000000000000-000000000000ffff (prio 0, i/o): io
>>
>>    address-space: cpu-memory-0
>>    address-space: cpu-memory-1
>>    address-space: cpu-memory-2
>>    address-space: cpu-memory-3
>>    address-space: cpu-secure-memory-0
>>    address-space: cpu-secure-memory-1
>>    address-space: cpu-secure-memory-2
>>    address-space: cpu-secure-memory-3
> 
> We can still distinguish from a completely empty AS, because we don't
> have an empty line here, correct?

Yes:

(qemu) info mtree
address-space: I/O
  0000000000000000-000000000000ffff (prio 0, i/o): io

address-space shared 4 times:
  - bcm2835-dma-memory
  - bcm2835-fb-memory
  - bcm2835-property-memory
  - dwc2
  0000000000000000-00000000ffffffff (prio 0, i/o): bcm2835-gpu
    0000000000000000-000000003fffffff (prio 0, ram): alias
bcm2835-gpu-ram-alias[*] @ram 0000000000000000-000000003fffffff
    0000000040000000-000000007fffffff (prio 0, ram): alias
bcm2835-gpu-ram-alias[*] @ram 0000000000000000-000000003fffffff
    000000007e000000-000000007effffff (prio 1, i/o): alias
bcm2835-peripherals @bcm2835-peripherals 0000000000000000-0000000000ffffff
    0000000080000000-00000000bfffffff (prio 0, ram): alias
bcm2835-gpu-ram-alias[*] @ram 0000000000000000-000000003fffffff
    00000000c0000000-00000000ffffffff (prio 0, ram): alias
bcm2835-gpu-ram-alias[*] @ram 0000000000000000-000000003fffffff

address-space: bcm2835-mbox-memory
  0000000000000000-000000000000008f (prio 0, i/o): bcm2835-mbox
    0000000000000010-000000000000001f (prio 0, i/o): bcm2835-fb
    0000000000000080-000000000000008f (prio 0, i/o): bcm2835-property

[...]


