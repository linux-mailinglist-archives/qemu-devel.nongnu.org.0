Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9262040DCAA
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 16:26:19 +0200 (CEST)
Received: from localhost ([::1]:59252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQsLC-0006cz-HF
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 10:26:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mQsFE-0006QE-RG
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 10:20:09 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:40868
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mQsF8-0003x4-VB
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 10:20:08 -0400
Received: from host109-153-76-56.range109-153.btcentralplus.com
 ([109.153.76.56] helo=[192.168.50.176])
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mQsEx-0001fG-Hx; Thu, 16 Sep 2021 15:19:55 +0100
To: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20210916100554.10963-1-mark.cave-ayland@ilande.co.uk>
 <20210916100554.10963-12-mark.cave-ayland@ilande.co.uk>
 <a6857eaa-a0d3-c098-3cda-057ee9fa15a4@amsat.org>
 <878rzw655h.fsf@dusky.pond.sub.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <f8e0ec4d-2692-774f-ad67-9fc40ace044d@ilande.co.uk>
Date: Thu, 16 Sep 2021 15:19:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <878rzw655h.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 109.153.76.56
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v3 11/20] nubus-device: add romfile property for loading
 declaration ROMs
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.488,
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
Cc: qemu-devel@nongnu.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/09/2021 14:06, Markus Armbruster wrote:

> Philippe Mathieu-Daudé <f4bug@amsat.org> writes:
> 
>> On 9/16/21 12:05 PM, Mark Cave-Ayland wrote:
>>> The declaration ROM is located at the top-most address of the standard slot
>>> space.
>>>
>>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>>> ---
>>>   hw/nubus/nubus-device.c  | 43 +++++++++++++++++++++++++++++++++++++++-
>>>   include/hw/nubus/nubus.h |  6 ++++++
>>>   2 files changed, 48 insertions(+), 1 deletion(-)
>>
>>> @@ -38,10 +43,46 @@ static void nubus_device_realize(DeviceState *dev, Error **errp)
>>>       memory_region_add_subregion(&nubus->slot_io, slot_offset,
>>>                                   &nd->slot_mem);
>>>       g_free(name);
>>> +
>>> +    /* Declaration ROM */
>>> +    if (nd->romfile != NULL) {
>>> +        path = qemu_find_file(QEMU_FILE_TYPE_BIOS, nd->romfile);
>>> +        if (path == NULL) {
>>> +            path = g_strdup(nd->romfile);
>>> +        }
>>> +
>>> +        size = get_image_size(path);
>>> +        if (size < 0) {
>>> +            error_setg(errp, "failed to find romfile \"%s\"", nd->romfile);
>>> +            g_free(path);
>>> +            return;
>>> +        } else if (size == 0) {
>>> +            error_setg(errp, "romfile \"%s\" is empty", nd->romfile);
>>> +            g_free(path);
>>> +            return;
>>> +        } else if (size > NUBUS_DECL_ROM_MAX_SIZE) {
>>> +            error_setg(errp, "romfile \"%s\" too large (maximum size 128K)",
>>> +                       nd->romfile);
>>> +            g_free(path);
>>> +            return;
>>> +        }
>>> +
>>> +        name = g_strdup_printf("nubus-slot-%x-declaration-rom", nd->slot);
>>> +        memory_region_init_rom(&nd->decl_rom, OBJECT(dev), name, size,
>>> +                               &error_fatal);
> 
> Is this error expected to happen?
> 
> If yes, you should quite probably propagate it.
> 
> If no, &error_abort.

(goes and looks)

Ultimately this gets set from memory_region_init_rom_device_nomigrate() where err is 
returned from qemu_ram_alloc() which is fairly fatal. So I guess this should be 
&error_abort then?

Note that I copied that part of the logic from hw/pci/pci.c's pci_add_option_rom() so 
it may also need to be adjusted there.

>>> +        ret = load_image_mr(path, &nd->decl_rom);
>>
>> load_image_mr() already calls get_image_size(), rom_add_file() and
>> qemu_find_file(). *But* it doesn't takes and Error handle, and report
>> error using fprintf()...
> 
> ... except when they don't:
> 
>      int load_image_mr(const char *filename, MemoryRegion *mr)
>      {
>          int size;
> 
>          if (!memory_access_is_direct(mr, false)) {
>              /* Can only load an image into RAM or ROM */
> --->        return -1;
>          }
> 
>          size = get_image_size(filename);
> 
>          if (size < 0 || size > memory_region_size(mr)) {
>              return -1;
>          }
>          if (size > 0) {
>              if (rom_add_file_mr(filename, mr, -1) < 0) {
>                  return -1;
>              }
>          }
>          return size;
>      }
> 
> Hot mess!
> 
>>                           So unfortunately rom_add*() functions are
>> kinda outdated and you are doing the right thing to propagate detailled
>> errors.
> 
> I can't see errors being propagated, only a warn_report()...
> 
>>          Therefore:
>>
>> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>
>>> +        g_free(path);
>>> +        if (ret < 0) {
>>> +            warn_report("nubus-device: could not load prom '%s'", nd->romfile);
> 
> ... here.

Looking again at pci_add_option_rom() then perhaps this should be error_setg() 
instead: if you are explicitly trying to load a ROM image, then you should at least 
be able to get the filename correct.

>>> +        }
>>> +        memory_region_add_subregion(&nd->slot_mem, NUBUS_SLOT_SIZE - size,
>>> +                                    &nd->decl_rom);
>>> +    }
>>>   }


ATB,

Mark.

