Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE65464F51
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Dec 2021 15:01:12 +0100 (CET)
Received: from localhost ([::1]:42048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msQAY-0006Pv-1A
	for lists+qemu-devel@lfdr.de; Wed, 01 Dec 2021 09:01:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1msQ7s-0005Py-1e
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 08:58:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20381)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1msQ7n-0003xy-EK
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 08:58:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638367094;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6VP3PAgV5W710Vs3J6zDKxOP1b9k+WaQpxVqLN43VSI=;
 b=RbHi9WAx6crnI1FkDhIh9OfJDEn4+/66VwSz7UBD+OHok7PixVGeb39awvtbo1ZiRvplMf
 024mohlj2K2jmT/AFdPuN5qvaRBzh4/eb0VrTmJmTDeeqGSR30i/J5jyFn/o0N3cKAOxn2
 4gv2YkZ2FRuuxuCTKxbY/A8KAluM1ug=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-522-hFSzvMZvNp6ZqzTy4ciONg-1; Wed, 01 Dec 2021 08:58:13 -0500
X-MC-Unique: hFSzvMZvNp6ZqzTy4ciONg-1
Received: by mail-wm1-f72.google.com with SMTP id
 m14-20020a05600c3b0e00b0033308dcc933so960159wms.7
 for <qemu-devel@nongnu.org>; Wed, 01 Dec 2021 05:58:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6VP3PAgV5W710Vs3J6zDKxOP1b9k+WaQpxVqLN43VSI=;
 b=ITJkFZzkyif4zpJnX4UjxSFoa0+ubt8Z1iA9gDPgVgq9V3bzaA2MvyY0raSwSoOGYS
 fqYpqt8ZRQU9wn/5f1/0yX4jLmGAnxKDE/NHKflVbyJ0mywRasoJSltt2ZjE2peAdH+C
 OQXpiwlA0cs6wfanwBDs4n3In/ejuunfIGy3siq45kMaU5bZYUOIsZXoqwNhw5FHRpYr
 xPvZv13VHvtNYD/mqLG5fL69RfR6OwcIdCsNdbxmlYV0Mzmp+5YluIk62qIvLFhvlQfL
 WNs9dcf4C5BOeslrlw50PfgiD32kJtW8AAQVRKVVFy4SCTvwkwYNmZlUztTAG9431tjQ
 TGQg==
X-Gm-Message-State: AOAM532JWsigmSSDkKjqvz9ZMClCP3nn1G9vdCgkj8nDpxPjRODbEjPm
 zgYX8woWajqCLMXWfkVZLxTbSmrInpyOcKmTkMeqShO2u7vL5zfZdVgTJVGNesAG9Cum6j/1E09
 BbECXtuvzcjDtg5M=
X-Received: by 2002:a5d:45c4:: with SMTP id b4mr6864569wrs.222.1638367092224; 
 Wed, 01 Dec 2021 05:58:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxIdT3VdBZw1h3ms/k13T2G/L/Wds0KmuEsrWVTZWOpjA8rmPz4kddH8NWasy0cvohCLk2d4A==
X-Received: by 2002:a5d:45c4:: with SMTP id b4mr6864540wrs.222.1638367091974; 
 Wed, 01 Dec 2021 05:58:11 -0800 (PST)
Received: from [192.168.1.12] (abayonne-654-1-79-213.w86-222.abo.wanadoo.fr.
 [86.222.222.213])
 by smtp.gmail.com with ESMTPSA id g18sm1474617wmq.4.2021.12.01.05.58.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Dec 2021 05:58:11 -0800 (PST)
Message-ID: <e61ac9e5-a468-9513-09bd-513ede996c93@redhat.com>
Date: Wed, 1 Dec 2021 14:58:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: Odd square bracket encoding in QOM names
To: =?UTF-8?B?TWljaGFsIFByw612b3puw61r?= <mprivozn@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 qemu-devel <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
References: <32fd9815-11b1-686f-5c2b-9d31c72a64c6@ilande.co.uk>
 <fec32eb4-3b7b-e2b7-29f9-b1795dfeb2eb@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <fec32eb4-3b7b-e2b7-29f9-b1795dfeb2eb@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.716,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.211, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/30/21 10:41, Michal Prívozník wrote:
> On 11/30/21 09:35, Mark Cave-Ayland wrote:
>> Hi all,
>>
>> Has there been a recent change as to how square brackets are encoded
>> within QOM names? I noticed that the output has changed here in the
>> "info qom-tree" output in qemu-system-m68k for the q800 machine.
>>
>> The q800 machine has a set of 256 memory region aliases that used to
>> appear in the "info qom-tree" output as:
>>
>>     /mac_m68k.io[100] (memory-region)
>>     /mac_m68k.io[101] (memory-region)
>>     /mac_m68k.io[102] (memory-region)
>>
>> but they now appear as:
>>
>>     /mac_m68k.io\x5b100\x5d[0] (memory-region)
>>     /mac_m68k.io\x5b101\x5d[0] (memory-region)
>>     /mac_m68k.io\x5b102\x5d[0] (memory-region)
>>
>> Is there something that could cause the names to be double-encoded
>> before being displayed?
> 
> I see the same behavior on x86_64 and qemu-system-x86_64 but with a
> different member:
> 
> /machine (pc-i440fx-4.0-machine)
>   /device-memory[0] (memory-region)
>   /fw_cfg (fw_cfg_io)
>     /\x2from@etc\x2facpi\x2frsdp[0] (memory-region)
>     /\x2from@etc\x2facpi\x2ftables[0] (memory-region)
>     /\x2from@etc\x2ftable-loader[0] (memory-region)

This is memory_region_escape_name() in memory_region_do_init().

#2  0x5dd1740 in object_property_add_child (obj=0x6bfe3f0,
name=0x66a7900 "\\x2from@etc\\x2ftable-loader[*]", child=0x70a93e0) at
qom/object.c:1761
#3  0x5c73182 in memory_region_do_init (mr=0x70a93e0, owner=0x6bfe3f0,
name=0x7fffffffd290 "/rom@etc/table-loader", size=4096) at
softmmu/memory.c:1182
#4  0x5c731f1 in memory_region_init (mr=0x70a93e0, owner=0x6bfe3f0,
name=0x7fffffffd290 "/rom@etc/table-loader", size=4096) at
softmmu/memory.c:1195
#5  0x5c73fcd in memory_region_init_resizeable_ram (mr=0x70a93e0,
owner=0x6bfe3f0, name=0x7fffffffd290 "/rom@etc/table-loader", size=4096,
max_size=65536, resized=
    0x597cb6d <fw_cfg_resized>, errp=0x6611780 <error_fatal>) at
softmmu/memory.c:1572
#6  0x597cc18 in rom_set_mr (rom=0x7956c00, owner=0x6bfe3f0,
name=0x7fffffffd290 "/rom@etc/table-loader", ro=true) at
hw/core/loader.c:946
#7  0x597d428 in rom_add_blob
    (name=0x60fed25 "etc/table-loader", blob=0x7968200, len=4096,
max_len=65536, addr=18446744073709551615, fw_file_name=0x60fed25
"etc/table-loader", fw_callback=0x5be0137 <acpi_build_update>,
callback_opaque=0x794b980, as=0x0, read_only=true) at hw/core/loader.c:1086
#8  0x59363a9 in acpi_add_rom_blob (update=0x5be0137
<acpi_build_update>, opaque=0x794b980, blob=0x69ddca0, name=0x60fed25
"etc/table-loader")
    at hw/acpi/utils.c:46
#9  0x5be03b7 in acpi_setup () at hw/i386/acpi-build.c:2820

Wasn't it always like that with fw_cfg?

> And the same happens over QMP too:
> 
> virsh qemu-monitor-command $dom qom-list '"path":"/machine/fw_cfg"'
> 
> {"return":[{"name":"type","type":"string"},{"name":"parent_bus","type":"link<bus>"},{"name":"realized","type":"bool"},{"name":"hotplugged","type":"bool"},{"name":"hotpluggable","type":"bool"},{"name":"acpi-mr-restore","type":"bool"},{"name":"x-file-slots","type":"uint16"},{"name":"dma_enabled","type":"bool"},{"name":"\\x2from@etc\\x2facpi\\x2ftables[0]","type":"child<memory-region>"},{"name":"fwcfg.dma[0]","type":"child<memory-region>"},{"name":"fwcfg[0]","type":"child<memory-region>"},{"name":"\\x2from@etc\\x2facpi\\x2frsdp[0]","type":"child<memory-region>"},{"name":"\\x2from@etc\\x2ftable-loader[0]","type":"child<memory-region>"}],"id":"libvirt-455"}
> 
> Michal
> 
> 


