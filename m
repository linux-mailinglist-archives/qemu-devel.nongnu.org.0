Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB6C7457673
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 19:34:11 +0100 (CET)
Received: from localhost ([::1]:35314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo8iB-0003EE-0W
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 13:34:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mo8Xz-0005p3-Lq
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 13:23:41 -0500
Received: from [2001:738:2001:2001::2001] (port=39696 helo=zero.eik.bme.hu)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mo8Xw-0001up-Os
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 13:23:38 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 4871D75603A;
 Fri, 19 Nov 2021 19:23:35 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 23732755FE6; Fri, 19 Nov 2021 19:23:35 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 21993755F74;
 Fri, 19 Nov 2021 19:23:35 +0100 (CET)
Date: Fri, 19 Nov 2021 19:23:35 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH-for-7.0 2/5] hw/display/vga-mmio: Inline vga_mm_init()
In-Reply-To: <e414c4b-11b-86d7-0b3-5f937db07f49@eik.bme.hu>
Message-ID: <f78126db-9533-2796-4ead-6d4e60cce2dd@eik.bme.hu>
References: <20211119171202.458919-1-f4bug@amsat.org>
 <20211119171202.458919-3-f4bug@amsat.org>
 <e414c4b-11b-86d7-0b3-5f937db07f49@eik.bme.hu>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1362958849-1637346215=:35384"
X-Spam-Probability: 9%
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:738:2001:2001::2001
 (failed)
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?ISO-8859-15?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1362958849-1637346215=:35384
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Fri, 19 Nov 2021, BALATON Zoltan wrote:
> On Fri, 19 Nov 2021, Philippe Mathieu-Daudé wrote:
>> Inline vga_mm_init() in vga_mmio_init() to simplify the
>> next patch review. Kind of.
>> 
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>> hw/display/vga-mmio.c | 27 ++++++++++-----------------
>> 1 file changed, 10 insertions(+), 17 deletions(-)
>> 
>> diff --git a/hw/display/vga-mmio.c b/hw/display/vga-mmio.c
>> index 8aaf44e7b1d..0aefbcf53a0 100644
>> --- a/hw/display/vga-mmio.c
>> +++ b/hw/display/vga-mmio.c
>> @@ -65,12 +65,19 @@ static const MemoryRegionOps vga_mm_ctrl_ops = {
>>     .endianness = DEVICE_NATIVE_ENDIAN,
>> };
>> 
>> -static void vga_mm_init(VGAMmioState *s, hwaddr vram_base,
>> -                        hwaddr ctrl_base, int it_shift,
>> -                        MemoryRegion *address_space)
>> +int vga_mmio_init(hwaddr vram_base,
>> +                    hwaddr ctrl_base, int it_shift,
>> +                    MemoryRegion *address_space)
>
> Indentation? (But it's removed later so does not really matter.)
>
>> {
>> +    VGAMmioState *s;
>>     MemoryRegion *s_ioport_ctrl, *vga_io_memory;
>> 
>> +    s = g_malloc0(sizeof(*s));
>> +
>> +    s->vga.vram_size_mb = VGA_RAM_SIZE / MiB;
>> +    s->vga.global_vmstate = true;
>> +    vga_common_init(&s->vga, NULL);
>> +
>>     s->it_shift = it_shift;
>>     s_ioport_ctrl = g_malloc(sizeof(*s_ioport_ctrl));
>>     memory_region_init_io(s_ioport_ctrl, NULL, &vga_mm_ctrl_ops, s,
>> @@ -89,20 +96,6 @@ static void vga_mm_init(VGAMmioState *s, hwaddr 
>> vram_base,
>>     memory_region_add_subregion(address_space,
>>                                 vram_base + 0x000a0000, vga_io_memory);
>>     memory_region_set_coalescing(vga_io_memory);
>> -}
>> -
>> -int vga_mmio_init(hwaddr vram_base,
>> -                    hwaddr ctrl_base, int it_shift,
>> -                    MemoryRegion *address_space)
>> -{
>> -    VGAMmioState *s;
>> -
>> -    s = g_malloc0(sizeof(*s));
>> -
>> -    s->vga.vram_size_mb = VGA_RAM_SIZE / MiB;
>> -    s->vga.global_vmstate = true;
>> -    vga_common_init(&s->vga, NULL);
>> -    vga_mm_init(s, vram_base, ctrl_base, it_shift, address_space);
>
> Where did this vga_mm_init() go?

Sorry, this is what's being inlined... So I mean

Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>

> Regards,
> BALATON Zoltan
>
>>     s->vga.con = graphic_console_init(NULL, 0, s->vga.hw_ops, s);
>> 
>
--3866299591-1362958849-1637346215=:35384--

