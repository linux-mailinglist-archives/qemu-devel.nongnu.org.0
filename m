Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F591542E6
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Feb 2020 12:18:08 +0100 (CET)
Received: from localhost ([::1]:36318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1izfAd-0003DK-H4
	for lists+qemu-devel@lfdr.de; Thu, 06 Feb 2020 06:18:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50607)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <david@redhat.com>) id 1izepB-0004VH-FK
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 05:55:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <david@redhat.com>) id 1izep9-0003k7-Qu
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 05:55:57 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:22339
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <david@redhat.com>) id 1izep9-0003dK-Lg
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 05:55:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580986555;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=bnPOW1G44qTpvGj1MftB10PT1Z+1QFANOM1qlenfUGY=;
 b=UOlz0jkLqkm+WHcDAKq6WPVt3lqlhH2tj+hGXefibWJ4SyRV3DpBgM7g+VpFfolpbC+OTT
 e7GNbBlT3yRAbx/XOxHnJnBRh4rcpvYN6fqKZZXrinpDDe/UR+unXQw7Qu88/qymRcL7GT
 wcPDLlu0ceQk/FUFWhR5GWQHDDVLKDI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-143-kS86Aa1GOAKvT8Kl-kdQ9g-1; Thu, 06 Feb 2020 05:55:52 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EF43A18A8C83;
 Thu,  6 Feb 2020 10:55:50 +0000 (UTC)
Received: from [10.36.118.119] (unknown [10.36.118.119])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 764205C1D8;
 Thu,  6 Feb 2020 10:55:40 +0000 (UTC)
Subject: Re: [PATCH v2 1/7] exec: Fix for qemu_ram_resize() callback
To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>
References: <20200117174522.22044-1-shameerali.kolothum.thodi@huawei.com>
 <20200117174522.22044-2-shameerali.kolothum.thodi@huawei.com>
 <20200204162320.67e5d353@redhat.com>
 <74eaaa45-0d20-9a21-fbf8-6d29deb248eb@redhat.com>
 <4ce41554-8b8e-dbb5-5fe9-43af09950f23@redhat.com>
 <8e0b2c762e914c64bebfab5fc7441661@huawei.com>
 <133f274e-e942-7008-93d2-8edb1bc4d7ae@redhat.com>
 <52fff289cca14874ad493fc25806fe3d@huawei.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; prefer-encrypt=mutual; keydata=
 mQINBFXLn5EBEAC+zYvAFJxCBY9Tr1xZgcESmxVNI/0ffzE/ZQOiHJl6mGkmA1R7/uUpiCjJ
 dBrn+lhhOYjjNefFQou6478faXE6o2AhmebqT4KiQoUQFV4R7y1KMEKoSyy8hQaK1umALTdL
 QZLQMzNE74ap+GDK0wnacPQFpcG1AE9RMq3aeErY5tujekBS32jfC/7AnH7I0v1v1TbbK3Gp
 XNeiN4QroO+5qaSr0ID2sz5jtBLRb15RMre27E1ImpaIv2Jw8NJgW0k/D1RyKCwaTsgRdwuK
 Kx/Y91XuSBdz0uOyU/S8kM1+ag0wvsGlpBVxRR/xw/E8M7TEwuCZQArqqTCmkG6HGcXFT0V9
 PXFNNgV5jXMQRwU0O/ztJIQqsE5LsUomE//bLwzj9IVsaQpKDqW6TAPjcdBDPLHvriq7kGjt
 WhVhdl0qEYB8lkBEU7V2Yb+SYhmhpDrti9Fq1EsmhiHSkxJcGREoMK/63r9WLZYI3+4W2rAc
 UucZa4OT27U5ZISjNg3Ev0rxU5UH2/pT4wJCfxwocmqaRr6UYmrtZmND89X0KigoFD/XSeVv
 jwBRNjPAubK9/k5NoRrYqztM9W6sJqrH8+UWZ1Idd/DdmogJh0gNC0+N42Za9yBRURfIdKSb
 B3JfpUqcWwE7vUaYrHG1nw54pLUoPG6sAA7Mehl3nd4pZUALHwARAQABtCREYXZpZCBIaWxk
 ZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT6JAlgEEwEIAEICGwMFCQlmAYAGCwkIBwMCBhUI
 AgkKCwQWAgMBAh4BAheAFiEEG9nKrXNcTDpGDfzKTd4Q9wD/g1oFAl3pImkCGQEACgkQTd4Q
 9wD/g1o+VA//SFvIHUAvul05u6wKv/pIR6aICPdpF9EIgEU448g+7FfDgQwcEny1pbEzAmiw
 zAXIQ9H0NZh96lcq+yDLtONnXk/bEYWHHUA014A1wqcYNRY8RvY1+eVHb0uu0KYQoXkzvu+s
 Dncuguk470XPnscL27hs8PgOP6QjG4jt75K2LfZ0eAqTOUCZTJxA8A7E9+XTYuU0hs7QVrWJ
 jQdFxQbRMrYz7uP8KmTK9/Cnvqehgl4EzyRaZppshruKMeyheBgvgJd5On1wWq4ZUV5PFM4x
 II3QbD3EJfWbaJMR55jI9dMFa+vK7MFz3rhWOkEx/QR959lfdRSTXdxs8V3zDvChcmRVGN8U
 Vo93d1YNtWnA9w6oCW1dnDZ4kgQZZSBIjp6iHcA08apzh7DPi08jL7M9UQByeYGr8KuR4i6e
 RZI6xhlZerUScVzn35ONwOC91VdYiQgjemiVLq1WDDZ3B7DIzUZ4RQTOaIWdtXBWb8zWakt/
 ztGhsx0e39Gvt3391O1PgcA7ilhvqrBPemJrlb9xSPPRbaNAW39P8ws/UJnzSJqnHMVxbRZC
 Am4add/SM+OCP0w3xYss1jy9T+XdZa0lhUvJfLy7tNcjVG/sxkBXOaSC24MFPuwnoC9WvCVQ
 ZBxouph3kqc4Dt5X1EeXVLeba+466P1fe1rC8MbcwDkoUo65Ag0EVcufkQEQAOfX3n0g0fZz
 Bgm/S2zF/kxQKCEKP8ID+Vz8sy2GpDvveBq4H2Y34XWsT1zLJdvqPI4af4ZSMxuerWjXbVWb
 T6d4odQIG0fKx4F8NccDqbgHeZRNajXeeJ3R7gAzvWvQNLz4piHrO/B4tf8svmRBL0ZB5P5A
 2uhdwLU3NZuK22zpNn4is87BPWF8HhY0L5fafgDMOqnf4guJVJPYNPhUFzXUbPqOKOkL8ojk
 CXxkOFHAbjstSK5Ca3fKquY3rdX3DNo+EL7FvAiw1mUtS+5GeYE+RMnDCsVFm/C7kY8c2d0G
 NWkB9pJM5+mnIoFNxy7YBcldYATVeOHoY4LyaUWNnAvFYWp08dHWfZo9WCiJMuTfgtH9tc75
 7QanMVdPt6fDK8UUXIBLQ2TWr/sQKE9xtFuEmoQGlE1l6bGaDnnMLcYu+Asp3kDT0w4zYGsx
 5r6XQVRH4+5N6eHZiaeYtFOujp5n+pjBaQK7wUUjDilPQ5QMzIuCL4YjVoylWiBNknvQWBXS
 lQCWmavOT9sttGQXdPCC5ynI+1ymZC1ORZKANLnRAb0NH/UCzcsstw2TAkFnMEbo9Zu9w7Kv
 AxBQXWeXhJI9XQssfrf4Gusdqx8nPEpfOqCtbbwJMATbHyqLt7/oz/5deGuwxgb65pWIzufa
 N7eop7uh+6bezi+rugUI+w6DABEBAAGJAiUEGAECAA8FAlXLn5ECGwwFCQlmAYAACgkQTd4Q
 9wD/g1qA6w/+M+ggFv+JdVsz5+ZIc6MSyGUozASX+bmIuPeIecc9UsFRatc91LuJCKMkD9Uv
 GOcWSeFpLrSGRQ1Z7EMzFVU//qVs6uzhsNk0RYMyS0B6oloW3FpyQ+zOVylFWQCzoyyf227y
 GW8HnXunJSC+4PtlL2AY4yZjAVAPLK2l6mhgClVXTQ/S7cBoTQKP+jvVJOoYkpnFxWE9pn4t
 H5QIFk7Ip8TKr5k3fXVWk4lnUi9MTF/5L/mWqdyIO1s7cjharQCstfWCzWrVeVctpVoDfJWp
 4LwTuQ5yEM2KcPeElLg5fR7WB2zH97oI6/Ko2DlovmfQqXh9xWozQt0iGy5tWzh6I0JrlcxJ
 ileZWLccC4XKD1037Hy2FLAjzfoWgwBLA6ULu0exOOdIa58H4PsXtkFPrUF980EEibUp0zFz
 GotRVekFAceUaRvAj7dh76cToeZkfsjAvBVb4COXuhgX6N4pofgNkW2AtgYu1nUsPAo+NftU
 CxrhjHtLn4QEBpkbErnXQyMjHpIatlYGutVMS91XTQXYydCh5crMPs7hYVsvnmGHIaB9ZMfB
 njnuI31KBiLUks+paRkHQlFcgS2N3gkRBzH7xSZ+t7Re3jvXdXEzKBbQ+dC3lpJB0wPnyMcX
 FOTT3aZT7IgePkt5iC/BKBk3hqKteTnJFeVIT7EC+a6YUFg=
Organization: Red Hat GmbH
Message-ID: <f041380c-afcb-f8d8-89db-8f48c7b46767@redhat.com>
Date: Thu, 6 Feb 2020 11:55:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <52fff289cca14874ad493fc25806fe3d@huawei.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: kS86Aa1GOAKvT8Kl-kdQ9g-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "xiaoguangrong.eric@gmail.com" <xiaoguangrong.eric@gmail.com>,
 "mst@redhat.com" <mst@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Linuxarm <linuxarm@huawei.com>,
 "shannon.zhaosl@gmail.com" <shannon.zhaosl@gmail.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "xuwei \(O\)" <xuwei5@huawei.com>,
 "lersek@redhat.com" <lersek@redhat.com>,
 "eric.auger@redhat.com" <eric.auger@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06.02.20 11:20, Shameerali Kolothum Thodi wrote:
>=20
>=20
>> -----Original Message-----
>> From: David Hildenbrand [mailto:david@redhat.com]
>> Sent: 05 February 2020 16:41
>> To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>;
>> Igor Mammedov <imammedo@redhat.com>
>> Cc: peter.maydell@linaro.org; xiaoguangrong.eric@gmail.com;
>> mst@redhat.com; shannon.zhaosl@gmail.com; qemu-devel@nongnu.org;
>> xuwei (O) <xuwei5@huawei.com>; Linuxarm <linuxarm@huawei.com>;
>> eric.auger@redhat.com; qemu-arm@nongnu.org; lersek@redhat.com
>> Subject: Re: [PATCH v2 1/7] exec: Fix for qemu_ram_resize() callback
>>
>>>> Oh, and one more reason why the proposal in this patch is inconsistent=
:
>>>>
>>>> When migrating resizable memory regions (RAM_SAVE_FLAG_MEM_SIZE)
>> we
>>>> store the block->used_length (ram_save_setup()) and use that value to
>>>> resize the region on the target (ram_load_precopy() -> qemu_ram_resize=
()).
>>>>
>>>> This will be the value the callback will be called with. Page aligned.
>>>>
>>>
>>> Sorry, I didn=E2=80=99t quite get that point and not sure how "req_leng=
th" approach
>>> will affect the migration.
>>
>> The issue is that on migration, you will lose the sub-page size either
>> way. So your callback will be called
>> - on the migration source with a sub-page size (via
>>   memory_region_ram_resize() from e.g., hw/i386/acpi-build.c)
>> - on the migration target with a page-aligned size (via
>>   qemu_ram_resize() from migration/ram.c)
>>
>> So this is inconsistent, especially when migrating.
>=20
> Thanks for explaining. I tried to add some debug prints to further unders=
tand
> what actually happens during migration case.
>=20
> Guest-source with initial one nvdimm
> ----------------------------------------------------
>=20
> -object memory-backend-ram,id=3Dmem1,size=3D1G \
> -device nvdimm,id=3Ddimm1,memdev=3Dmem1 \
>=20
> fw_cfg_add_file_callback: filename etc/boot-fail-wait size 0x4
> fw_cfg_add_file_callback: filename etc/acpi/nvdimm-mem size 0x1000
> fw_cfg_add_file_callback: filename etc/acpi/tables size 0x55f4
> fw_cfg_add_file_callback: filename etc/table-loader size 0xd00
> fw_cfg_add_file_callback: filename etc/tpm/log size 0x0
> fw_cfg_add_file_callback: filename etc/acpi/rsdp size 0x24
> fw_cfg_add_file_callback: filename etc/smbios/smbios-tables size 0x104
> fw_cfg_add_file_callback: filename etc/smbios/smbios-anchor size 0x18
> fw_cfg_modify_file: filename bootorder len 0x0
> fw_cfg_add_file_callback: filename bootorder size 0x0
> fw_cfg_modify_file: filename bios-geometry len 0x0
> fw_cfg_add_file_callback: filename bios-geometry size 0x0
> fw_cfg_modify_file: filename etc/acpi/tables len 0x55f4
> fw_cfg_modify_file: filename etc/acpi/rsdp len 0x24
> fw_cfg_modify_file: filename etc/table-loader len 0xd00
> ....
>=20
> hot add another nvdimm device,
>=20
> (qemu) object_add memory-backend-ram,id=3Dmem2,size=3D1G
> (qemu) device_add nvdimm,id=3Ddimm2,memdev=3Dmem2
>=20
>=20
> root@ubuntu:/# cat /dev/pmem
> pmem0  pmem1
>=20
> Guest-target with two nvdimms
> -----------------------------------------------
>=20
> -object memory-backend-ram,id=3Dmem1,size=3D1G \
> -device nvdimm,id=3Ddimm1,memdev=3Dmem1 \
> -object memory-backend-ram,id=3Dmem2,size=3D1G \
> -device nvdimm,id=3Ddimm2,memdev=3Dmem2 \
>=20
> fw_cfg_add_file_callback: filename etc/boot-fail-wait size 0x4
> fw_cfg_add_file_callback: filename etc/acpi/nvdimm-mem size 0x1000
> fw_cfg_add_file_callback: filename etc/acpi/tables size 0x56ac
> fw_cfg_add_file_callback: filename etc/table-loader size 0xd00
> fw_cfg_add_file_callback: filename etc/tpm/log size 0x0
> fw_cfg_add_file_callback: filename etc/acpi/rsdp size 0x24
> fw_cfg_add_file_callback: filename etc/smbios/smbios-tables size 0x104
> fw_cfg_add_file_callback: filename etc/smbios/smbios-anchor size 0x18
> fw_cfg_modify_file: filename bootorder len 0x0
> fw_cfg_add_file_callback: filename bootorder size 0x0
> fw_cfg_modify_file: filename bios-geometry len 0x0
> fw_cfg_add_file_callback: filename bios-geometry size 0x0
>=20
>=20
> Initiate migration Source --> Target,
>=20
> ram_load_precopy: Ram blk mach-virt.ram length 0x100000000 used_length 0x=
100000000
> ram_load_precopy: Ram blk mem1 length 0x40000000 used_length 0x40000000
> ram_load_precopy: Ram blk mem2 length 0x40000000 used_length 0x40000000
> ram_load_precopy: Ram blk virt.flash0 length 0x4000000 used_length 0x4000=
000
> ram_load_precopy: Ram blk virt.flash1 length 0x4000000 used_length 0x4000=
000
> ram_load_precopy: Ram blk /rom@etc/acpi/tables length 0x6000 used_length =
0x6000
> ram_load_precopy: Ram blk 0000:00:01.0/virtio-net-pci.rom length 0x40000 =
used_length 0x40000
> ram_load_precopy: Ram blk /rom@etc/table-loader length 0x1000 used_length=
 0x1000
> ram_load_precopy: Ram blk /rom@etc/acpi/rsdp length 0x1000 used_length 0x=
1000
>=20
>=20
> root@ubuntu:/# cat /dev/pmem
> pmem0  pmem1 =20
>=20
> From the logs, it looks like the ram_load_precopy() --> qemu_ram_resize()=
 is not
> called as length =3D=3D used_length and both seems to be page aligned val=
ues.
> And from https://github.com/qemu/qemu/blob/master/migration/ram.c#L3421
> qemu_ram_resize() is called with length if length !=3D used_length.

Assume on your source, the old size is 12345 bytes. So 16384 aligned up
(4 pages).

Assume on your target, the new size is 123456 bytes, so 126976 aligned
up (31 pages).

If you migrate from source to destination, the migration code would
resize to 16384, although the "actual size" is 12345. The callback will
be called with the aligned size, not the actual size. Same the other way
around. That's what's inconsistent IMHO.

--=20
Thanks,

David / dhildenb


