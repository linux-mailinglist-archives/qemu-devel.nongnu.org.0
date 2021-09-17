Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C15140F55F
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 11:55:21 +0200 (CEST)
Received: from localhost ([::1]:38290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRAaV-00057u-9Y
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 05:55:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mRAZ4-0004Sv-HF
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 05:53:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21952)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mRAZ2-00084Q-T4
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 05:53:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631872427;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cG7YxVeoXaYLirmLF4dsMVO6g+csrhmYz4t27047l+Y=;
 b=cPybwzCvgEWWWFIgu31zDWsH8tt4ypy84JJZChy17vjQtKauKHoF1m7TEJGVB47xZ8EDrY
 V2+9keaO31BzAv5Hl6rTWzLIlHxlGJvj6khS2jVHAkYy2Dmh4kOEs8tkHrvam0V1dDXPl3
 658w9rWFi9z2l2Uu3wY0pTJ6SRi0UOQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-564-SsxvGysJMoe3LsDEnBbbqQ-1; Fri, 17 Sep 2021 05:53:46 -0400
X-MC-Unique: SsxvGysJMoe3LsDEnBbbqQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1E18184A5E3;
 Fri, 17 Sep 2021 09:53:45 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 796B95D6D5;
 Fri, 17 Sep 2021 09:53:44 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0DC6F113865F; Fri, 17 Sep 2021 11:53:43 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: [PATCH v3 11/20] nubus-device: add romfile property for loading
 declaration ROMs
References: <20210916100554.10963-1-mark.cave-ayland@ilande.co.uk>
 <20210916100554.10963-12-mark.cave-ayland@ilande.co.uk>
 <a6857eaa-a0d3-c098-3cda-057ee9fa15a4@amsat.org>
 <878rzw655h.fsf@dusky.pond.sub.org>
 <f8e0ec4d-2692-774f-ad67-9fc40ace044d@ilande.co.uk>
Date: Fri, 17 Sep 2021 11:53:43 +0200
In-Reply-To: <f8e0ec4d-2692-774f-ad67-9fc40ace044d@ilande.co.uk> (Mark
 Cave-Ayland's message of "Thu, 16 Sep 2021 15:19:53 +0100")
Message-ID: <87fsu3wms8.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: laurent@vivier.eu,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk> writes:

> On 16/09/2021 14:06, Markus Armbruster wrote:
>
>> Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:
>>=20
>>> On 9/16/21 12:05 PM, Mark Cave-Ayland wrote:
>>>> The declaration ROM is located at the top-most address of the standard=
 slot
>>>> space.
>>>>
>>>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>>>> ---
>>>>   hw/nubus/nubus-device.c  | 43 ++++++++++++++++++++++++++++++++++++++=
+-
>>>>   include/hw/nubus/nubus.h |  6 ++++++
>>>>   2 files changed, 48 insertions(+), 1 deletion(-)
>>>
>>>> @@ -38,10 +43,46 @@ static void nubus_device_realize(DeviceState *dev,=
 Error **errp)
>>>>       memory_region_add_subregion(&nubus->slot_io, slot_offset,
>>>>                                   &nd->slot_mem);
>>>>       g_free(name);
>>>> +
>>>> +    /* Declaration ROM */
>>>> +    if (nd->romfile !=3D NULL) {
>>>> +        path =3D qemu_find_file(QEMU_FILE_TYPE_BIOS, nd->romfile);
>>>> +        if (path =3D=3D NULL) {
>>>> +            path =3D g_strdup(nd->romfile);
>>>> +        }
>>>> +
>>>> +        size =3D get_image_size(path);
>>>> +        if (size < 0) {
>>>> +            error_setg(errp, "failed to find romfile \"%s\"", nd->rom=
file);
>>>> +            g_free(path);
>>>> +            return;
>>>> +        } else if (size =3D=3D 0) {
>>>> +            error_setg(errp, "romfile \"%s\" is empty", nd->romfile);
>>>> +            g_free(path);
>>>> +            return;
>>>> +        } else if (size > NUBUS_DECL_ROM_MAX_SIZE) {
>>>> +            error_setg(errp, "romfile \"%s\" too large (maximum size =
128K)",
>>>> +                       nd->romfile);
>>>> +            g_free(path);
>>>> +            return;
>>>> +        }
>>>> +
>>>> +        name =3D g_strdup_printf("nubus-slot-%x-declaration-rom", nd-=
>slot);
>>>> +        memory_region_init_rom(&nd->decl_rom, OBJECT(dev), name, size=
,
>>>> +                               &error_fatal);
>> Is this error expected to happen?
>> If yes, you should quite probably propagate it.
>> If no, &error_abort.
>
> (goes and looks)
>
> Ultimately this gets set from
> memory_region_init_rom_device_nomigrate() where err is returned from
> qemu_ram_alloc() which is fairly fatal. So I guess this should be
> &error_abort then?

There are two schools of thought on handling out-of-memory conditions.

One school argues that attempting to recover by failing the operation is
expensive and futile.  It's expensive, because it creates a huge number
of failure paths that wouldn't otherwise exists, and won't be tested.
It's futile, because by the time malloc() fails, the process is doomed
anyway.  That's g_malloc().  It aborts on OOM.

The other school disagrees, and writes the error paths.  In this case,
propagate to caller.

In QEMU, we of course do both, and with no clear guidance on when to do
what.  All we have is talk about aborting only on "small" allocations,
whatever "small" may be.

I'm cool with &error_abort here.

> Note that I copied that part of the logic from hw/pci/pci.c's
> pci_add_option_rom() so it may also need to be adjusted there.

We're quite prone to use &error_fatal or NULL where we should use
&error_abort.

>>>> +        ret =3D load_image_mr(path, &nd->decl_rom);
>>>
>>> load_image_mr() already calls get_image_size(), rom_add_file() and
>>> qemu_find_file(). *But* it doesn't takes and Error handle, and report
>>> error using fprintf()...
>>=20
>> ... except when they don't:
>>      int load_image_mr(const char *filename, MemoryRegion *mr)
>>      {
>>          int size;
>>          if (!memory_access_is_direct(mr, false)) {
>>              /* Can only load an image into RAM or ROM */
>> --->        return -1;
>>          }
>>          size =3D get_image_size(filename);
>>          if (size < 0 || size > memory_region_size(mr)) {
>>              return -1;
>>          }
>>          if (size > 0) {
>>              if (rom_add_file_mr(filename, mr, -1) < 0) {
>>                  return -1;
>>              }
>>          }
>>          return size;
>>      }
>> Hot mess!
>>=20
>>>                           So unfortunately rom_add*() functions are
>>> kinda outdated and you are doing the right thing to propagate detailled
>>> errors.
>>=20
>> I can't see errors being propagated, only a warn_report()...
>>=20
>>>          Therefore:
>>>
>>> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>>>
>>>> +        g_free(path);
>>>> +        if (ret < 0) {
>>>> +            warn_report("nubus-device: could not load prom '%s'", nd-=
>romfile);
>> ... here.
>
> Looking again at pci_add_option_rom() then perhaps this should be
> error_setg() instead: if you are explicitly trying to load a ROM
> image, then you should at least be able to get the filename correct.

Makes sense to me.

>>>> +        }
>>>> +        memory_region_add_subregion(&nd->slot_mem, NUBUS_SLOT_SIZE - =
size,
>>>> +                                    &nd->decl_rom);
>>>> +    }
>>>>   }
>
>
> ATB,
>
> Mark.


