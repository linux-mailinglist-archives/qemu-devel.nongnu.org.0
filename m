Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3083EE755
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 09:37:30 +0200 (CEST)
Received: from localhost ([::1]:45684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFtf7-0002b3-4V
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 03:37:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mFte2-0001kO-GG; Tue, 17 Aug 2021 03:36:23 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:37370
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mFte0-0003X3-M3; Tue, 17 Aug 2021 03:36:22 -0400
Received: from host109-153-84-5.range109-153.btcentralplus.com ([109.153.84.5]
 helo=[192.168.50.176])
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mFtda-0001w3-LP; Tue, 17 Aug 2021 08:35:59 +0100
To: Thomas Huth <thuth@redhat.com>, "Jose R. Ziviani" <jziviani@suse.de>,
 qemu-devel@nongnu.org
References: <20210816135504.9089-1-jziviani@suse.de>
 <f047a8d8-93f5-3f62-0834-c036931090d2@redhat.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <cd2d673b-c9aa-1b9a-7025-9afb787f99b6@ilande.co.uk>
Date: Tue, 17 Aug 2021 08:36:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <f047a8d8-93f5-3f62-0834-c036931090d2@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 109.153.84.5
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v3] vga: don't abort when adding a duplicate isa-vga device
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.71,
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, philmd@redhat.com,
 kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17/08/2021 08:25, Thomas Huth wrote:

> On 16/08/2021 15.55, Jose R. Ziviani wrote:
>> If users try to add an isa-vga device that was already registered,
>> still in command line, qemu will crash:
>>
>> $ qemu-system-mips64el -M pica61 -device isa-vga
>> RAMBlock "vga.vram" already registered, abort!
>> Aborted (core dumped)
>>
>> That particular board registers the device automaticaly, so it's
>> not obvious that a VGA device already exists. This patch changes
>> this behavior by displaying a message and exiting without crashing.
>>
>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/44
>> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> Signed-off-by: Jose R. Ziviani <jziviani@suse.de>
>> ---
>> v2 to v3: Improved error message
>> v1 to v2: Use error_setg instead of error_report
>>
>>   hw/display/vga-isa.c | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>
>> diff --git a/hw/display/vga-isa.c b/hw/display/vga-isa.c
>> index 90851e730b..30d55b41c3 100644
>> --- a/hw/display/vga-isa.c
>> +++ b/hw/display/vga-isa.c
>> @@ -33,6 +33,7 @@
>>   #include "hw/loader.h"
>>   #include "hw/qdev-properties.h"
>>   #include "qom/object.h"
>> +#include "qapi/error.h"
>>   #define TYPE_ISA_VGA "isa-vga"
>>   OBJECT_DECLARE_SIMPLE_TYPE(ISAVGAState, ISA_VGA)
>> @@ -61,6 +62,15 @@ static void vga_isa_realizefn(DeviceState *dev, Error **errp)
>>       MemoryRegion *vga_io_memory;
>>       const MemoryRegionPortio *vga_ports, *vbe_ports;
>> +    /*
>> +     * make sure this device is not being added twice, if so
>> +     * exit without crashing qemu
>> +     */
>> +    if (qemu_ram_block_by_name("vga.vram")) {
>> +        error_setg(errp, "'isa-vga' device already registered");
>> +        return;
>> +    }
>> +
>>       s->global_vmstate = true;
>>       vga_common_init(s, OBJECT(dev));
>>       s->legacy_address_space = isa_address_space(isadev);
>>
> 
> Reviewed-by: Thomas Huth <thuth@redhat.com>

Instead of checking for the presence of the vga.vram block, would it be better to use 
the standard object_resolve_path_type() method to check for the presence of the 
existing isa-vga device instead? See 
https://lists.gnu.org/archive/html/qemu-devel/2021-07/msg00717.html for how this was 
done for virgl.


ATB,

Mark.

