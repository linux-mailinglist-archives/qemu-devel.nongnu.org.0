Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69BBB420959
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 12:35:14 +0200 (CEST)
Received: from localhost ([::1]:37282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXLJP-0005LW-LQ
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 06:35:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mXLGS-0002S0-CD
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 06:32:08 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:15013)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mXLGP-0007xA-BR
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 06:32:07 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id DD6F87462D3;
 Mon,  4 Oct 2021 12:32:01 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id B0A37745953; Mon,  4 Oct 2021 12:32:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id AF4097457EE;
 Mon,  4 Oct 2021 12:32:01 +0200 (CEST)
Date: Mon, 4 Oct 2021 12:32:01 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH 06/12] macfb: implement mode sense to allow display type
 to be detected
In-Reply-To: <c92f20ba-14af-f5de-75a0-aba0c48eb6ed@vivier.eu>
Message-ID: <22e95f4f-83e0-d165-4649-9cd2de6e8f9@eik.bme.hu>
References: <20211002110007.30825-1-mark.cave-ayland@ilande.co.uk>
 <20211002110007.30825-7-mark.cave-ayland@ilande.co.uk>
 <c92f20ba-14af-f5de-75a0-aba0c48eb6ed@vivier.eu>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-2133789685-1633343521=:36040"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-2133789685-1633343521=:36040
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Mon, 4 Oct 2021, Laurent Vivier wrote:
> Le 02/10/2021 à 13:00, Mark Cave-Ayland a écrit :
>> The MacOS toolbox ROM uses the monitor sense to detect the display type and then
>> offer a fixed set of resolutions and colour depths accordingly. Implement the
>> monitor sense using information found in Apple Technical Note HW26: "Macintosh
>> Quadra Built-In Video" along with some local experiments.
>>
>> Since the default configuration is 640 x 480 with 8-bit colour then hardcode
>> the sense register to return MACFB_DISPLAY_VGA for now.
>>
>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>> ---
>>  hw/display/macfb.c         | 117 ++++++++++++++++++++++++++++++++++++-
>>  hw/display/trace-events    |   2 +
>>  include/hw/display/macfb.h |  20 +++++++
>>  3 files changed, 137 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/display/macfb.c b/hw/display/macfb.c
>> index 62c2727a5b..5c95aa4a11 100644
>> --- a/hw/display/macfb.c
>> +++ b/hw/display/macfb.c
>> @@ -28,8 +28,66 @@
>>  #define MACFB_PAGE_SIZE 4096
>>  #define MACFB_VRAM_SIZE (4 * MiB)
>>
>> -#define DAFB_RESET      0x200
>> -#define DAFB_LUT        0x213
>> +#define DAFB_MODE_SENSE     0x1c
>> +#define DAFB_RESET          0x200
>> +#define DAFB_LUT            0x213
>> +
>> +
>> +/*
>> + * Quadra sense codes taken from Apple Technical Note HW26:
>> + * "Macintosh Quadra Built-In Video". The sense codes and
>
> https://developer.apple.com/library/archive/technotes/hw/hw_26.html

URLs may change or go away so I think it's better to reference by title in 
comments, then one can find it by that whereas a stale URL is not much 
help a few years from now.

Regards,
BALATON Zoltan

>> + * extended sense codes have different meanings:
>> + *
>> + * Sense:
>> + *    bit 2: SENSE2 (pin 10)
>> + *    bit 1: SENSE1 (pin 7)
>> + *    bit 0: SENSE0 (pin 4)
>> + *
>> + * 0 = pin tied to ground
>> + * 1 = pin unconnected
>> + *
>> + * Extended Sense:
>> + *    bit 2: pins 4-10
>> + *    bit 1: pins 10-7
>> + *    bit 0: pins 7-4
>> + *
>> + * 0 = pins tied together
>> + * 1 = pins unconnected
>> + *
>> + * Reads from the sense register appear to be active low, i.e. a 1 indicates
>> + * that the pin is tied to ground, a 0 indicates the pin is disconnected.
>> + *
>> + * Writes to the sense register appear to activate pulldowns i.e. a 1 enables
>> + * a pulldown on a particular pin.
>> + *
>> + * The MacOS toolbox appears to use a series of reads and writes to first
>> + * determine if extended sense is to be used, and then check which pins are
>> + * tied together in order to determine the display type.
>> + */
>> +
>> +typedef struct MacFbSense {
>> +    uint8_t type;
>> +    uint8_t sense;
>> +    uint8_t ext_sense;
>> +} MacFbSense;
>> +
>> +static MacFbSense macfb_sense_table[] = {
>> +    { MACFB_DISPLAY_APPLE_21_COLOR, 0x0, 0 },
>> +    { MACFB_DISPLAY_APPLE_PORTRAIT, 0x1, 0 },
>> +    { MACFB_DISPLAY_APPLE_12_RGB, 0x2, 0 },
>> +    { MACFB_DISPLAY_APPLE_2PAGE_MONO, 0x3, 0 },
>> +    { MACFB_DISPLAY_NTSC_UNDERSCAN, 0x4, 0 },
>> +    { MACFB_DISPLAY_NTSC_OVERSCAN, 0x4, 0 },
>> +    { MACFB_DISPLAY_APPLE_12_MONO, 0x6, 0 },
>> +    { MACFB_DISPLAY_APPLE_13_RGB, 0x6, 0 },
>> +    { MACFB_DISPLAY_16_COLOR, 0x7, 0x3 },
>> +    { MACFB_DISPLAY_PAL1_UNDERSCAN, 0x7, 0x0 },
>> +    { MACFB_DISPLAY_PAL1_OVERSCAN, 0x7, 0x0 },
>> +    { MACFB_DISPLAY_PAL2_UNDERSCAN, 0x7, 0x6 },
>> +    { MACFB_DISPLAY_PAL2_OVERSCAN, 0x7, 0x6 },
>> +    { MACFB_DISPLAY_VGA, 0x7, 0x5 },
>> +    { MACFB_DISPLAY_SVGA, 0x7, 0x5 },
>
> Perhaps it could be interesting to also have the "no external monitor" entry?
> But generally not to have monitor prevents the boot of MacOS.
>
> ...
>
> Reviewed-by: Laurent Vivier <laurent@vivier.eu>
>
>
--3866299591-2133789685-1633343521=:36040--

