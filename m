Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F53167772
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Feb 2020 09:43:05 +0100 (CET)
Received: from localhost ([::1]:53808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j53to-0000x3-W5
	for lists+qemu-devel@lfdr.de; Fri, 21 Feb 2020 03:43:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56525)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <david@redhat.com>) id 1j53sa-0008Qt-Lo
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 03:41:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <david@redhat.com>) id 1j53sZ-0001mC-2e
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 03:41:48 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:58524
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <david@redhat.com>) id 1j53sY-0001iM-Tk
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 03:41:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582274506;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Mnm7DGdiNK7y2dLZuucSZgblp4WrUYqVykCyjJu2Ddg=;
 b=g/10jrOCryCGdhk558UpRRQV9jSotY0Ix/46H7xgQ368NX/jU0W0M/GVqJmxCObW3g0zWn
 FlXz2EvT/aEqpEm7gOT6RzZHR2dBc91ZHXA+T16xlY4T4O+91fKUtCbKNjDI9NvP2a5HIt
 v7Qdx7ASOqxGmDkyjvvrYTf8cBldl9A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-147-HJRojBDcMm2LQKu9mvb25Q-1; Fri, 21 Feb 2020 03:41:45 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8AB85800D5A;
 Fri, 21 Feb 2020 08:41:43 +0000 (UTC)
Received: from [10.36.117.197] (ovpn-117-197.ams2.redhat.com [10.36.117.197])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5C5AB90F79;
 Fri, 21 Feb 2020 08:41:35 +0000 (UTC)
Subject: Re: [PATCH v1 10/13] migrate/ram: Handle RAM block resizes during
 postcopy
From: David Hildenbrand <david@redhat.com>
To: Peter Xu <peterx@redhat.com>
References: <20200219161725.115218-1-david@redhat.com>
 <20200219161725.115218-11-david@redhat.com> <20200220205443.GD15253@xz-x1>
 <9a4207fe-4b35-8b6a-6b29-3ad2e704b492@redhat.com>
Autocrypt: addr=david@redhat.com; prefer-encrypt=mutual; keydata=
 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
Organization: Red Hat GmbH
Message-ID: <0bef755a-a798-5cca-ef5d-d1df7affa07c@redhat.com>
Date: Fri, 21 Feb 2020 09:41:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <9a4207fe-4b35-8b6a-6b29-3ad2e704b492@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: HJRojBDcMm2LQKu9mvb25Q-1
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Shannon Zhao <shannon.zhao@linaro.org>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21.02.20 09:35, David Hildenbrand wrote:
> On 20.02.20 21:54, Peter Xu wrote:
>> On Wed, Feb 19, 2020 at 05:17:22PM +0100, David Hildenbrand wrote:
>>> Resizing while migrating is dangerous and does not work as expected.
>>> The whole migration code works on the usable_length of ram blocks and d=
oes
>>> not expect this to change at random points in time.
>>>
>>> In the case of postcopy, relying on used_length is racy as soon as the
>>> guest is running. Also, when used_length changes we might leave the
>>> uffd handler registered for some memory regions, reject valid pages
>>> when migrating and fail when sending the recv bitmap to the source.
>>>
>>> Resizing can be trigger *after* (but not during) a reset in
>>> ACPI code by the guest
>>> - hw/arm/virt-acpi-build.c:acpi_ram_update()
>>> - hw/i386/acpi-build.c:acpi_ram_update()
>>>
>>> Let's remember the original used_length in a separate variable and
>>> use it in relevant postcopy code. Make sure to update it when we resize
>>> during precopy, when synchronizing the RAM block sizes with the source.
>>>
>>> Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>>> Cc: Juan Quintela <quintela@redhat.com>
>>> Cc: Eduardo Habkost <ehabkost@redhat.com>
>>> Cc: Paolo Bonzini <pbonzini@redhat.com>
>>> Cc: Igor Mammedov <imammedo@redhat.com>
>>> Cc: "Michael S. Tsirkin" <mst@redhat.com>
>>> Cc: Richard Henderson <richard.henderson@linaro.org>
>>> Cc: Shannon Zhao <shannon.zhao@linaro.org>
>>> Cc: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>>> Cc: Peter Xu <peterx@redhat.com>
>>> Signed-off-by: David Hildenbrand <david@redhat.com>
>>> ---
>>>  include/exec/ramblock.h  |  9 +++++++++
>>>  migration/postcopy-ram.c | 15 ++++++++++++---
>>>  migration/ram.c          | 11 +++++++++--
>>>  3 files changed, 30 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/include/exec/ramblock.h b/include/exec/ramblock.h
>>> index 07d50864d8..0e9e9b346b 100644
>>> --- a/include/exec/ramblock.h
>>> +++ b/include/exec/ramblock.h
>>> @@ -59,6 +59,15 @@ struct RAMBlock {
>>>       */
>>>      unsigned long *clear_bmap;
>>>      uint8_t clear_bmap_shift;
>>> +
>>> +    /*
>>> +     * RAM block used_length before the guest started running while po=
stcopy
>>> +     * was active. Once the guest is running, used_length can change. =
Used to
>>> +     * register/unregister uffd handlers and as the size of the recv b=
itmap.
>>> +     * Receiving any page beyond this length will bail out, as it coul=
d not have
>>> +     * been valid on the source.
>>> +     */
>>> +    ram_addr_t postcopy_length;
>>>  };
>>>  #endif
>>>  #endif
>>> diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
>>> index a36402722b..c68caf4e42 100644
>>> --- a/migration/postcopy-ram.c
>>> +++ b/migration/postcopy-ram.c
>>> @@ -17,6 +17,7 @@
>>>   */
>>> =20
>>>  #include "qemu/osdep.h"
>>> +#include "qemu/rcu.h"
>>>  #include "exec/target_page.h"
>>>  #include "migration.h"
>>>  #include "qemu-file.h"
>>> @@ -31,6 +32,7 @@
>>>  #include "qemu/error-report.h"
>>>  #include "trace.h"
>>>  #include "hw/boards.h"
>>> +#include "exec/ramblock.h"
>>> =20
>>>  /* Arbitrary limit on size of each discard command,
>>>   * keeps them around ~200 bytes
>>> @@ -456,6 +458,13 @@ static int init_range(RAMBlock *rb, void *opaque)
>>>      ram_addr_t length =3D qemu_ram_get_used_length(rb);
>>>      trace_postcopy_init_range(block_name, host_addr, offset, length);
>>> =20
>>> +    /*
>>> +     * Save the used_length before running the guest. In case we have =
to
>>> +     * resize RAM blocks when syncing RAM block sizes from the source =
during
>>> +     * precopy, we'll update it manually via the ram block notifier.
>>> +     */
>>> +    rb->postcopy_length =3D length;
>>> +
>>>      /*
>>>       * We need the whole of RAM to be truly empty for postcopy, so thi=
ngs
>>>       * like ROMs and any data tables built during init must be zero'd
>>> @@ -478,7 +487,7 @@ static int cleanup_range(RAMBlock *rb, void *opaque=
)
>>>      const char *block_name =3D qemu_ram_get_idstr(rb);
>>>      void *host_addr =3D qemu_ram_get_host_addr(rb);
>>>      ram_addr_t offset =3D qemu_ram_get_offset(rb);
>>> -    ram_addr_t length =3D qemu_ram_get_used_length(rb);
>>> +    ram_addr_t length =3D rb->postcopy_length;
>>>      MigrationIncomingState *mis =3D opaque;
>>>      struct uffdio_range range_struct;
>>>      trace_postcopy_cleanup_range(block_name, host_addr, offset, length=
);
>>> @@ -600,7 +609,7 @@ static int nhp_range(RAMBlock *rb, void *opaque)
>>>      const char *block_name =3D qemu_ram_get_idstr(rb);
>>>      void *host_addr =3D qemu_ram_get_host_addr(rb);
>>>      ram_addr_t offset =3D qemu_ram_get_offset(rb);
>>> -    ram_addr_t length =3D qemu_ram_get_used_length(rb);
>>> +    ram_addr_t length =3D rb->postcopy_length;
>>>      trace_postcopy_nhp_range(block_name, host_addr, offset, length);
>>> =20
>>>      /*
>>> @@ -644,7 +653,7 @@ static int ram_block_enable_notify(RAMBlock *rb, vo=
id *opaque)
>>>      struct uffdio_register reg_struct;
>>> =20
>>>      reg_struct.range.start =3D (uintptr_t)qemu_ram_get_host_addr(rb);
>>> -    reg_struct.range.len =3D qemu_ram_get_used_length(rb);
>>> +    reg_struct.range.len =3D rb->postcopy_length;
>>>      reg_struct.mode =3D UFFDIO_REGISTER_MODE_MISSING;
>>> =20
>>>      /* Now tell our userfault_fd that it's responsible for this area *=
/
>>> diff --git a/migration/ram.c b/migration/ram.c
>>> index ab1f5534cf..6d1dcb362c 100644
>>> --- a/migration/ram.c
>>> +++ b/migration/ram.c
>>> @@ -244,7 +244,7 @@ int64_t ramblock_recv_bitmap_send(QEMUFile *file,
>>>          return -1;
>>>      }
>>> =20
>>> -    nbits =3D block->used_length >> TARGET_PAGE_BITS;
>>> +    nbits =3D block->postcopy_length >> TARGET_PAGE_BITS;
>>> =20
>>>      /*
>>>       * Make sure the tmp bitmap buffer is big enough, e.g., on 32bit
>>> @@ -3159,7 +3159,13 @@ static int ram_load_postcopy(QEMUFile *f)
>>>                  break;
>>>              }
>>> =20
>>> -            if (!offset_in_ramblock(block, addr)) {
>>> +            /*
>>> +             * Relying on used_length is racy and can result in false =
positives.
>>> +             * We might place pages beyond used_length in case RAM was=
 shrunk
>>> +             * while in postcopy, which is fine - trying to place via
>>> +             * UFFDIO_COPY/UFFDIO_ZEROPAGE will never segfault.
>>> +             */
>>> +            if (!block->host || addr >=3D block->postcopy_length) {
>>>                  error_report("Illegal RAM offset " RAM_ADDR_FMT, addr)=
;
>>>                  ret =3D -EINVAL;
>>>                  break;
>>> @@ -3744,6 +3750,7 @@ static void ram_mig_ram_block_resized(RAMBlockNot=
ifier *n, void *host,
>>>                               rb->idstr);
>>>              }
>>>          }
>>> +        rb->postcopy_length =3D new_size;
>>
>> With this change, postcopy_length will be the same as used_length?
>>
>> I thought you wanted to cache that value when starting the postcopy
>> phase so postcopy_length should be constant after set once.  Did I
>> misunderstood?
>=20
> So, my understanding on the migration target:
>=20
> 1. Source VM started and initialized.

"Destination VM", sorry.


--=20
Thanks,

David / dhildenb


