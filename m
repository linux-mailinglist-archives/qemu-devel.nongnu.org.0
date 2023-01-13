Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 760AB669943
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 15:00:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGKaa-0003Ia-Eg; Fri, 13 Jan 2023 08:59:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pGKaX-0003Hv-VE
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 08:59:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pGKaV-0000v5-CW
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 08:59:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673618358;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=11LxIg0MG5q+LRaI0KC4YPpuBVk0O5+Any4BkouRIoM=;
 b=ReGTrdcC76Cw+EakAYB9BB43IpbkkWzE7gLBkmD36mgTs7rdBt2gqj13aAnntmfLJS7qmy
 ECw5paeXhcE/X2LhzR9j6TRqFKqpJaQxIlZbujernvA+G0ViPLevDRRi1DOHAnnO7lk/Nd
 VyFcUvtsELEeHcz++HSgn7YCgEVZdvA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-29-mGd8cKsBOViYTfrOqaKA9Q-1; Fri, 13 Jan 2023 08:59:17 -0500
X-MC-Unique: mGd8cKsBOViYTfrOqaKA9Q-1
Received: by mail-wr1-f72.google.com with SMTP id
 o5-20020adfba05000000b0029064ccbe46so4163281wrg.9
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 05:59:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:organization:from
 :references:cc:to:content-language:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=11LxIg0MG5q+LRaI0KC4YPpuBVk0O5+Any4BkouRIoM=;
 b=CnTfc9C9hZdF92ZcKvZin3CrUb+u5Pf/ez4yCg/rO/q8ccdtVy0Ua1wKl3YXUJ2jaj
 k5ESNARxOd+zFzfsT6oXr+P5NiZHCQCyqSnuYR+frq5sMOZP4mZ/oQwTSS44kQXGBhYP
 rxvi+/zTgq/oeH6pWgZ03i5oul/rvcdH0PvJucBBe7DFYvd08iYhbqjvbg9NUaR2xKaE
 /+cjRfryq+7N3bLhHlFNoz0qY3wedLWRzQIcAWKQRkyIYB+w88mRNECY24d0L5xE5rvd
 YTpDF1cLZ0yJfUfENGMuaJ4OrcYmcNnsss7BCh6Z14ZckgFE+nF/oB92VBeTt1Id1/Yr
 oaHQ==
X-Gm-Message-State: AFqh2kptdMacGFXgyYKVAoi1wCFK0vFvePJjpr4/SDEGtK4HLdxcvWnc
 uACuqZwzkyfXrNm2pohPKkmHfanafrMCY0NdZVlzKPlHCME1uy2OHhPFpVovqcbshSUdJzdubVM
 YZbUH1kXhCOaiJfg=
X-Received: by 2002:a5d:6e8f:0:b0:276:473f:7120 with SMTP id
 k15-20020a5d6e8f000000b00276473f7120mr52102215wrz.26.1673618355826; 
 Fri, 13 Jan 2023 05:59:15 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuWPTVoApPUJpqFrsAHoYxXgu0MP2nd65SlhfqsimpqrIRzlXFt1I7FVPU0ZKA2To0lfTSlzA==
X-Received: by 2002:a5d:6e8f:0:b0:276:473f:7120 with SMTP id
 k15-20020a5d6e8f000000b00276473f7120mr52102203wrz.26.1673618355530; 
 Fri, 13 Jan 2023 05:59:15 -0800 (PST)
Received: from ?IPV6:2003:cb:c704:ec00:869d:7200:eb03:db01?
 (p200300cbc704ec00869d7200eb03db01.dip0.t-ipconnect.de.
 [2003:cb:c704:ec00:869d:7200:eb03:db01])
 by smtp.gmail.com with ESMTPSA id
 u24-20020adfa198000000b002bc84c55758sm12919355wru.63.2023.01.13.05.59.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Jan 2023 05:59:15 -0800 (PST)
Message-ID: <fd611830-5686-eafc-444e-4db519afbe46@redhat.com>
Date: Fri, 13 Jan 2023 14:59:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-US
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: qemu-devel@nongnu.org, Juan Quintela <quintela@redhat.com>,
 Peter Xu <peterx@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Michal Privoznik <mprivozn@redhat.com>
References: <20230112164403.105085-1-david@redhat.com>
 <20230112164403.105085-8-david@redhat.com> <Y8BjGPAuJPDqjFTD@work-vm>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v3 7/8] virtio-mem: Migrate immutable properties early
In-Reply-To: <Y8BjGPAuJPDqjFTD@work-vm>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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

On 12.01.23 20:44, Dr. David Alan Gilbert wrote:
> * David Hildenbrand (david@redhat.com) wrote:
>> The bitmap and the size are immutable while migration is active: see
>> virtio_mem_is_busy(). We can migrate this information early, before
>> migrating any actual RAM content. Further, all information we need for
>> sanity checks is immutable as well.
>>
>> Having this information in place early will, for example, allow for
>> properly preallocating memory before touching these memory locations
>> during RAM migration: this way, we can make sure that all memory was
>> actually preallocated and that any user errors (e.g., insufficient
>> hugetlb pages) can be handled gracefully.
>>
>> In contrast, usable_region_size and requested_size can theoretically
>> still be modified on the source while the VM is running. Keep migrating
>> these properties the usual, late, way.
>>
>> Use a new device property to keep behavior of compat machines
>> unmodified.
> 
> Can you get me a migration file from this? I want to try and understand
> what happens when you have the vmstate_register together with the ->vmsd -
> I'm not quite sure what ends up in the output.  Preferably for a VM with
> two virtio-mem's.

Sure, here is the stripped output from analyze-migration.py:

     "ram (2)": {
         "section sizes": {
             "0000:00:03.0/mem0": "0x0000000780000000",
             "0000:00:04.0/mem1": "0x0000000780000000",
             "pc.ram": "0x0000000100000000",
             "/rom@etc/acpi/tables": "0x0000000000020000",
             "pc.bios": "0x0000000000040000",
             "0000:00:02.0/e1000.rom": "0x0000000000040000",
             "pc.rom": "0x0000000000020000",
             "/rom@etc/table-loader": "0x0000000000001000",
             "/rom@etc/acpi/rsdp": "0x0000000000001000"
         }
     },
     "0000:00:03.0/virtio-mem-device-early (51)": {
         "tmp": "00 00 00 01 40 00 00 00 00 00 00 07 80 00 00 00 00 00 00 00 00 20 00 00 00 00 00 00",
         "size": "0x0000000040000000",
         "bitmap": "ff ff ff ff [...] "
     },
     "0000:00:04.0/virtio-mem-device-early (53)": {
         "tmp": "00 00 00 08 c0 00 00 00 00 00 00 07 80 00 00 00 00 00 00 00 00 20 00 00 00 00 00 00",
         "size": "0x00000001fa400000",
         "bitmap": "ff ff ff ff [...] "
     },
     "timer (0)": {
         "cpu_ticks_offset": "0x00000073f5ba3d28",
         "unused": "00 00 00 00 00 00 00 00",
         "cpu_clock_offset": "0x00000026b744e29c"
     },
[...]
     "serial (50)": {
         "state": {
             "divider": "0x0001",
             "rbr": "0x00",
             "ier": "0x05",
             "iir": "0xc1",
             "lcr": "0x13",
             "mcr": "0x0b",
             "lsr": "0x60",
             "msr": "0xb0",
             "scr": "0x00",
             "fcr_vmstate": "0x81"
         }
     },
     "0000:00:03.0/virtio-mem (52)": {
         "virtio": "00 00 00 02 f4 1a 58 10 07 01 10 00 01 00 ff [...]"
     "0000:00:04.0/virtio-mem (54)": {
         "virtio": "00 00 00 02 f4 1a 58 10 07 01 10 00 01 00 ff [...]"

The data of both "virtio" blobs is extremely large, a lot 0x00 -- no idea what virtio
core stores in there.

Note that vmstate_virtio_mem_device ("virtio-mem-device") will be included by virtio core in the
"virtio" blob.

I can send you a full savevm file privately, just ping me.

-- 
Thanks,

David / dhildenb


