Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85EAA3FDF9A
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 18:17:23 +0200 (CEST)
Received: from localhost ([::1]:55022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLSvS-0004Pa-G7
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 12:17:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mLSsE-0001Sj-Is
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 12:14:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42056)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mLSsB-0007Nn-Rf
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 12:14:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630512838;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gJipfRAMYjFoJl9TFwOeukVonwGoACTMmGxhUppiyfk=;
 b=JeGzeLFztmDZ3nmTtRJVONZHlD4rCtcKYkV5bpWYhiyBdrl4ZNRrpPwprMMNiMOAtwI+HR
 5YjbBmbM6oVvD4BX6qYai69TSsvrVx13yK8/YsflpTnCSrZEGQYXDYzy6EjYfpJzkumZVF
 o9AU7YU41AHxNrseF6Uno8WcblvhnkU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-369-ITeXPSmUNt2Jf8QWKxY_yQ-1; Wed, 01 Sep 2021 12:13:57 -0400
X-MC-Unique: ITeXPSmUNt2Jf8QWKxY_yQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 o20-20020a05600c379400b002e755735eedso37556wmr.0
 for <qemu-devel@nongnu.org>; Wed, 01 Sep 2021 09:13:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gJipfRAMYjFoJl9TFwOeukVonwGoACTMmGxhUppiyfk=;
 b=peuMt1WCPGO3LS6LvA2HtIWNjS5D/jMuW9pmWICf1ubeXlcK6OO34crGp8Ibq06vgk
 qyR5wOP48uGNFgaiWgjK+8c4QgqJxJbjEjTCkxuH5dlYHVBvjFVIaRdeIELFD23PC040
 QLrUQnONqJaNX6oB4cpe/r1l+27gZ1JQ90g2s8hQaGHF0Z4fCyaV3UEAFM7KW2woXCTc
 SI9JSy5valbyFjGzpKqhhwo5IrKBG2sbP8a+zdHdld6SHxO2A00R6TpLkiVCoRFQxlRr
 knfsXlf+d5EfZtCxjei03kLmeKV1OEi/fldN+SJibfA5DqryIjd3uAYYyBJenaI19Sc6
 exmg==
X-Gm-Message-State: AOAM533BOJvFjiEXUEXwUpxBeKpWGfXwnupss15V/qn1MBdmXQ9W0C8x
 jS4ZCX7vdfRJAyf/skvuTkF90HR9AzzfLNeaMaIG2IBzqm8GFavH5/rmF5wiLkGRhMW4SQoHwp2
 dcO8k1OUUgdzSISU=
X-Received: by 2002:a1c:6a14:: with SMTP id f20mr301626wmc.142.1630512836649; 
 Wed, 01 Sep 2021 09:13:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJysCY8U2oNnXNqgYO4FQdyjGVux821NPnEpW/l3f8k/c/OEyadcKU0YrOyv8HK4cyEouVTAaA==
X-Received: by 2002:a1c:6a14:: with SMTP id f20mr301595wmc.142.1630512836408; 
 Wed, 01 Sep 2021 09:13:56 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id f23sm161924wmc.3.2021.09.01.09.13.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Sep 2021 09:13:56 -0700 (PDT)
Subject: Re: [PATCH v3] memory: Have 'info mtree' remove duplicated Address
 Space information
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210823085429.597873-1-philmd@redhat.com>
 <8743192d-225d-c091-ab53-c747daa86f46@redhat.com>
 <14bef4b3-6a2a-2a53-1a7d-8d52b285c7f5@redhat.com>
Message-ID: <1dc33d51-e953-6443-cea5-961b5548d3c8@redhat.com>
Date: Wed, 1 Sep 2021 18:13:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <14bef4b3-6a2a-2a53-1a7d-8d52b285c7f5@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
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
 Gerd Hoffmann <kraxel@redhat.com>, Peter Xu <peterx@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/1/21 6:01 PM, Philippe Mathieu-Daudé wrote:
> On 8/23/21 11:20 AM, David Hildenbrand wrote:
>> On 23.08.21 10:54, Philippe Mathieu-Daudé wrote:
>>> Per Peter Maydell [*]:
>>>
>>>    'info mtree' monitor command was designed on the assumption that
>>>    there's really only one or two interesting address spaces, and
>>>    with more recent developments that's just not the case any more.
>>>
>>> Similarly about how the FlatView are sorted using a GHashTable,
>>> sort the AddressSpace objects to remove the duplications (AS
>>> using the same root MemoryRegion).
>>>
>>> This drastically reduce 'info mtree' on some boards.
>>
>> s/reduce/reduces the output of/
>>
>>>
>>> Before:
>>>
>>>    $ (echo info mtree; echo q) \
>>>      | qemu-system-aarch64 -S -monitor stdio -M raspi3b \
>>>      | wc -l
>>>    423
>>>
>>> After:
>>>
>>>    $ (echo info mtree; echo q) \
>>>      | qemu-system-aarch64 -S -monitor stdio -M raspi3b \
>>>      | wc -l
>>>    106
>>>
>>>    (qemu) info mtree
>>>    address-space: I/O
>>>      0000000000000000-000000000000ffff (prio 0, i/o): io
>>>
>>>    address-space: cpu-memory-0
>>>    address-space: cpu-memory-1
>>>    address-space: cpu-memory-2
>>>    address-space: cpu-memory-3
>>>    address-space: cpu-secure-memory-0
>>>    address-space: cpu-secure-memory-1
>>>    address-space: cpu-secure-memory-2
>>>    address-space: cpu-secure-memory-3
>>
>> We can still distinguish from a completely empty AS, because we don't
>> have an empty line here, correct?
> 
> Yes:
> 
> (qemu) info mtree
> address-space: I/O
>   0000000000000000-000000000000ffff (prio 0, i/o): io

Wrong answer because there is 1 MR here.

We can create address_space_init() with NULL MR, because
memory_region_ref() checks for NULL mr, but QEMU aborts
quickly:

(gdb) bt
#0  memory_region_get_flatview_root (mr=0x0) at softmmu/memory.c:685
#1  0x0000555555eec7ef in address_space_update_topology
(as=0x5555567f2a20 <address_space_io>) at softmmu/memory.c:1073
#2  address_space_init (as=0x5555567f2a20 <address_space_io2>, root=0x0,
name=<optimized out>) at softmmu/memory.c:2934
#3  0x0000555555edc7a9 in memory_map_init () at softmmu/physmem.c:2672
#4  cpu_exec_init_all () at softmmu/physmem.c:3070
#5  0x0000555555ef5480 in qemu_create_machine (qdict=0x7fffffffcec0) at
softmmu/vl.c:2126
#6  qemu_init (argc=<optimized out>, argv=0x7fffffffd0e8,
envp=<optimized out>) at softmmu/vl.c:3639
#7  0x00005555559c2fe9 in main (argc=<optimized out>, argv=<optimized
out>, envp=<optimized out>) at softmmu/main.c:49

What is your "completely empty AS" case?


