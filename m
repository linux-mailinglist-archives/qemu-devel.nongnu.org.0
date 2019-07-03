Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 719B65D7F7
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Jul 2019 23:58:49 +0200 (CEST)
Received: from localhost ([::1]:57848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hiQnY-000776-05
	for lists+qemu-devel@lfdr.de; Tue, 02 Jul 2019 17:58:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54035)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <balaton@eik.bme.hu>) id 1hiQiI-0004lv-Gg
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 17:53:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <balaton@eik.bme.hu>) id 1hiQiG-0006LY-PR
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 17:53:22 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:14065)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <balaton@eik.bme.hu>)
 id 1hiQi8-00063e-F7; Tue, 02 Jul 2019 17:53:12 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 2A5337456B8;
 Tue,  2 Jul 2019 23:52:53 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id EDA597456B7; Tue,  2 Jul 2019 23:52:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id E247274569A;
 Tue,  2 Jul 2019 23:52:52 +0200 (CEST)
Date: Tue, 2 Jul 2019 23:52:52 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Peter Maydell <peter.maydell@linaro.org>
In-Reply-To: <20190702163844.20458-1-peter.maydell@linaro.org>
Message-ID: <alpine.BSF.2.21.9999.1907022343160.68337@zero.eik.bme.hu>
References: <20190702163844.20458-1-peter.maydell@linaro.org>
User-Agent: Alpine 2.21.9999 (BSF 287 2018-06-16)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2001:738:2001:2001::2001
Subject: Re: [Qemu-devel] [PATCH for-4.1] hw/i2c/bitbang_i2c: Use in-place
 rather than malloc'd bitbang_i2c_interface struct
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 2 Jul 2019, Peter Maydell wrote:
> Currently the bitbang_i2c_init() function allocates a
> bitbang_i2c_interface struct which it returns.  This is unfortunate
> because it means that if the function is used from a DeviceState
> init method then the memory will be leaked by an "init then delete"
> cycle, as used by the qmp/hmp commands that list device properties.
>
> Since three out of four of the uses of this function are in
> device init methods, switch the function to do an in-place
> initialization of a struct that can be embedded in the
> device state struct of the caller.
>
> This fixes LeakSanitizer leak warnings that have appeared in the
> patchew configuration (which only tries to run the sanitizers
> for the x86_64-softmmu target) now that we use the bitbang-i2c
> code in an x86-64 config.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> This isn't the only problem with this code : it is also
> missing reset and migration handling and generally looks like
> it needs proper conversion to QOM somehow. But this will shut
> the patchew complaints up and seems ok for 4.1.
>
> Disclaimer: checked only that the leak-sanitizer is now happy
> and with a 'make check'.

I've tested the ppc4xx and ati-vga parts with AROS and MorphOS and these 
can still access i2c devices so I think it works.

> ---
> hw/display/ati_int.h         |  2 +-
> include/hw/i2c/bitbang_i2c.h | 38 ++++++++++++++++++++++++++++-
> include/hw/i2c/ppc4xx_i2c.h  |  2 +-
> hw/display/ati.c             |  7 +++---
> hw/i2c/bitbang_i2c.c         | 47 +++---------------------------------
> hw/i2c/ppc4xx_i2c.c          |  6 ++---
> hw/i2c/versatile_i2c.c       |  8 +++---
> 7 files changed, 53 insertions(+), 57 deletions(-)
>
> diff --git a/hw/display/ati_int.h b/hw/display/ati_int.h
> index 9b67d0022ad..31a1927b3ec 100644
> --- a/hw/display/ati_int.h
> +++ b/hw/display/ati_int.h
> @@ -88,7 +88,7 @@ typedef struct ATIVGAState {
>     uint16_t cursor_size;
>     uint32_t cursor_offset;
>     QEMUCursor *cursor;
> -    bitbang_i2c_interface *bbi2c;
> +    bitbang_i2c_interface bbi2c;
>     MemoryRegion io;
>     MemoryRegion mm;
>     ATIVGARegs regs;
> diff --git a/include/hw/i2c/bitbang_i2c.h b/include/hw/i2c/bitbang_i2c.h
> index 3a7126d5dee..92334e9016a 100644
> --- a/include/hw/i2c/bitbang_i2c.h
> +++ b/include/hw/i2c/bitbang_i2c.h
> @@ -8,7 +8,43 @@ typedef struct bitbang_i2c_interface bitbang_i2c_interface;

Maybe this typedef ^^^ can now be moved to the struct below instead of 
coming first (or even written in the same line as
typedef struct { } bitbang_i2c_interface;
as there is no need to have both struct bitbang_i2c_interface and the 
typedeffed name available). But I don't really mind, so

Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>

Thanks for fixing this.

Regards,
BALATON Zoltan

> #define BITBANG_I2C_SDA 0
> #define BITBANG_I2C_SCL 1
>
> -bitbang_i2c_interface *bitbang_i2c_init(I2CBus *bus);
> +typedef enum bitbang_i2c_state {
> +    STOPPED = 0,
> +    SENDING_BIT7,
> +    SENDING_BIT6,
> +    SENDING_BIT5,
> +    SENDING_BIT4,
> +    SENDING_BIT3,
> +    SENDING_BIT2,
> +    SENDING_BIT1,
> +    SENDING_BIT0,
> +    WAITING_FOR_ACK,
> +    RECEIVING_BIT7,
> +    RECEIVING_BIT6,
> +    RECEIVING_BIT5,
> +    RECEIVING_BIT4,
> +    RECEIVING_BIT3,
> +    RECEIVING_BIT2,
> +    RECEIVING_BIT1,
> +    RECEIVING_BIT0,
> +    SENDING_ACK,
> +    SENT_NACK
> +} bitbang_i2c_state;
> +
> +struct bitbang_i2c_interface {
> +    I2CBus *bus;
> +    bitbang_i2c_state state;
> +    int last_data;
> +    int last_clock;
> +    int device_out;
> +    uint8_t buffer;
> +    int current_addr;
> +};
> +
> +/**
> + * bitbang_i2c_init: in-place initialize the bitbang_i2c_interface struct
> + */
> +void bitbang_i2c_init(bitbang_i2c_interface *s, I2CBus *bus);
> int bitbang_i2c_set(bitbang_i2c_interface *i2c, int line, int level);
>
> #endif

