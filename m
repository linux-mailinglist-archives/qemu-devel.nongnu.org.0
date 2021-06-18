Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1148F3AC018
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 02:28:58 +0200 (CEST)
Received: from localhost ([::1]:33984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lu2NU-0004nB-O7
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 20:28:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lu2MR-00046z-RN
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 20:27:51 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:28633)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lu2MO-0004Wp-HN
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 20:27:51 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 580BE7457E5;
 Fri, 18 Jun 2021 02:27:43 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 13B9E7456E3; Fri, 18 Jun 2021 02:27:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 0DF297456B4;
 Fri, 18 Jun 2021 02:27:43 +0200 (CEST)
Date: Fri, 18 Jun 2021 02:27:43 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH v5 15/15] hw/i2c: Introduce i2c_start_recv() and
 i2c_start_send()
In-Reply-To: <20210617115334.2761573-16-f4bug@amsat.org>
Message-ID: <aec1aec-9010-46b6-ee20-8a3339a94798@eik.bme.hu>
References: <20210617115334.2761573-1-f4bug@amsat.org>
 <20210617115334.2761573-16-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 BOUNDARY="3866299591-940412549-1623975935=:59666"
Content-ID: <9f97f23e-45b4-ec52-44fc-98faebb8841e@eik.bme.hu>
X-Spam-Probability: 9%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: Corey Minyard <cminyard@mvista.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-940412549-1623975935=:59666
Content-Type: text/plain; CHARSET=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 8BIT
Content-ID: <f12e658a-2d7c-88b2-b852-c9d1bf44b25e@eik.bme.hu>

On Thu, 17 Jun 2021, Philippe Mathieu-Daudé wrote:
> To ease reviewing code using the I2C bus API, introduce the
> i2c_start_recv() and i2c_start_send() helpers which don't
> take the confusing 'is_recv' boolean argument.

In defence of this is_recv I'd like to mention that I2C has such a bit in 
device addresses that decides if it's a receive or send so this is 
actually a good match for that. The problem was that the send_recv 
function had it reversed. With that fixed it was actually a good match for 
i2c operations and in some cases allowed to write less code. Like the 
auxbus shows that became twice as large using these separate functions 
instead of being able to handle send or receive the same way.

Regards,
BALATON Zoltan

> Use these new helpers in the SMBus / AUX bus models.
>
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> include/hw/i2c/i2c.h  | 24 ++++++++++++++++++++++++
> hw/i2c/core.c         | 10 ++++++++++
> hw/i2c/pm_smbus.c     |  4 ++--
> hw/i2c/smbus_master.c | 22 +++++++++++-----------
> hw/misc/auxbus.c      | 12 ++++++------
> 5 files changed, 53 insertions(+), 19 deletions(-)
>
> diff --git a/include/hw/i2c/i2c.h b/include/hw/i2c/i2c.h
> index 21f2dba1bf7..5ca3b708c0b 100644
> --- a/include/hw/i2c/i2c.h
> +++ b/include/hw/i2c/i2c.h
> @@ -88,9 +88,33 @@ int i2c_bus_busy(I2CBus *bus);
>  * @address: address of the slave
>  * @is_recv: indicates the transfer direction
>  *
> + * When @is_recv is a known boolean constant, use the
> + * i2c_start_recv() or i2c_start_send() helper instead.
> + *
>  * Returns: 0 on success, -1 on error
>  */
> int i2c_start_transfer(I2CBus *bus, uint8_t address, bool is_recv);
> +
> +/**
> + * i2c_start_recv: start a 'receive' transfer on an I2C bus.
> + *
> + * @bus: #I2CBus to be used
> + * @address: address of the slave
> + *
> + * Returns: 0 on success, -1 on error
> + */
> +int i2c_start_recv(I2CBus *bus, uint8_t address);
> +
> +/**
> + * i2c_start_send: start a 'send' transfer on an I2C bus.
> + *
> + * @bus: #I2CBus to be used
> + * @address: address of the slave
> + *
> + * Returns: 0 on success, -1 on error
> + */
> +int i2c_start_send(I2CBus *bus, uint8_t address);
> +
> void i2c_end_transfer(I2CBus *bus);
> void i2c_nack(I2CBus *bus);
> int i2c_send(I2CBus *bus, uint8_t data);
> diff --git a/hw/i2c/core.c b/hw/i2c/core.c
> index 5483bf95a3e..416372ad00c 100644
> --- a/hw/i2c/core.c
> +++ b/hw/i2c/core.c
> @@ -180,6 +180,16 @@ int i2c_start_transfer(I2CBus *bus, uint8_t address, bool is_recv)
>                                                : I2C_START_SEND);
> }
>
> +int i2c_start_recv(I2CBus *bus, uint8_t address)
> +{
> +    return i2c_do_start_transfer(bus, address, I2C_START_RECV);
> +}
> +
> +int i2c_start_send(I2CBus *bus, uint8_t address)
> +{
> +    return i2c_do_start_transfer(bus, address, I2C_START_SEND);
> +}
> +
> void i2c_end_transfer(I2CBus *bus)
> {
>     I2CSlaveClass *sc;
> diff --git a/hw/i2c/pm_smbus.c b/hw/i2c/pm_smbus.c
> index 06e1e5321b9..d7eae548cbc 100644
> --- a/hw/i2c/pm_smbus.c
> +++ b/hw/i2c/pm_smbus.c
> @@ -128,14 +128,14 @@ static void smb_transaction(PMSMBus *s)
>          * So at least Linux may or may not set the read bit here.
>          * So just ignore the read bit for this command.
>          */
> -        if (i2c_start_transfer(bus, addr, 0)) {
> +        if (i2c_start_send(bus, addr)) {
>             goto error;
>         }
>         ret = i2c_send(bus, s->smb_data1);
>         if (ret) {
>             goto error;
>         }
> -        if (i2c_start_transfer(bus, addr, 1)) {
> +        if (i2c_start_recv(bus, addr)) {
>             goto error;
>         }
>         s->in_i2c_block_read = true;
> diff --git a/hw/i2c/smbus_master.c b/hw/i2c/smbus_master.c
> index dc43b8637d1..6a53c34e70b 100644
> --- a/hw/i2c/smbus_master.c
> +++ b/hw/i2c/smbus_master.c
> @@ -29,7 +29,7 @@ int smbus_receive_byte(I2CBus *bus, uint8_t addr)
> {
>     uint8_t data;
>
> -    if (i2c_start_transfer(bus, addr, 1)) {
> +    if (i2c_start_recv(bus, addr)) {
>         return -1;
>     }
>     data = i2c_recv(bus);
> @@ -40,7 +40,7 @@ int smbus_receive_byte(I2CBus *bus, uint8_t addr)
>
> int smbus_send_byte(I2CBus *bus, uint8_t addr, uint8_t data)
> {
> -    if (i2c_start_transfer(bus, addr, 0)) {
> +    if (i2c_start_send(bus, addr)) {
>         return -1;
>     }
>     i2c_send(bus, data);
> @@ -51,11 +51,11 @@ int smbus_send_byte(I2CBus *bus, uint8_t addr, uint8_t data)
> int smbus_read_byte(I2CBus *bus, uint8_t addr, uint8_t command)
> {
>     uint8_t data;
> -    if (i2c_start_transfer(bus, addr, 0)) {
> +    if (i2c_start_send(bus, addr)) {
>         return -1;
>     }
>     i2c_send(bus, command);
> -    if (i2c_start_transfer(bus, addr, 1)) {
> +    if (i2c_start_recv(bus, addr)) {
>         i2c_end_transfer(bus);
>         return -1;
>     }
> @@ -67,7 +67,7 @@ int smbus_read_byte(I2CBus *bus, uint8_t addr, uint8_t command)
>
> int smbus_write_byte(I2CBus *bus, uint8_t addr, uint8_t command, uint8_t data)
> {
> -    if (i2c_start_transfer(bus, addr, 0)) {
> +    if (i2c_start_send(bus, addr)) {
>         return -1;
>     }
>     i2c_send(bus, command);
> @@ -79,11 +79,11 @@ int smbus_write_byte(I2CBus *bus, uint8_t addr, uint8_t command, uint8_t data)
> int smbus_read_word(I2CBus *bus, uint8_t addr, uint8_t command)
> {
>     uint16_t data;
> -    if (i2c_start_transfer(bus, addr, 0)) {
> +    if (i2c_start_send(bus, addr)) {
>         return -1;
>     }
>     i2c_send(bus, command);
> -    if (i2c_start_transfer(bus, addr, 1)) {
> +    if (i2c_start_recv(bus, addr)) {
>         i2c_end_transfer(bus);
>         return -1;
>     }
> @@ -96,7 +96,7 @@ int smbus_read_word(I2CBus *bus, uint8_t addr, uint8_t command)
>
> int smbus_write_word(I2CBus *bus, uint8_t addr, uint8_t command, uint16_t data)
> {
> -    if (i2c_start_transfer(bus, addr, 0)) {
> +    if (i2c_start_send(bus, addr)) {
>         return -1;
>     }
>     i2c_send(bus, command);
> @@ -113,12 +113,12 @@ int smbus_read_block(I2CBus *bus, uint8_t addr, uint8_t command, uint8_t *data,
>     int i;
>
>     if (send_cmd) {
> -        if (i2c_start_transfer(bus, addr, 0)) {
> +        if (i2c_start_send(bus, addr)) {
>             return -1;
>         }
>         i2c_send(bus, command);
>     }
> -    if (i2c_start_transfer(bus, addr, 1)) {
> +    if (i2c_start_recv(bus, addr)) {
>         if (send_cmd) {
>             i2c_end_transfer(bus);
>         }
> @@ -149,7 +149,7 @@ int smbus_write_block(I2CBus *bus, uint8_t addr, uint8_t command, uint8_t *data,
>         len = 32;
>     }
>
> -    if (i2c_start_transfer(bus, addr, 0)) {
> +    if (i2c_start_send(bus, addr)) {
>         return -1;
>     }
>     i2c_send(bus, command);
> diff --git a/hw/misc/auxbus.c b/hw/misc/auxbus.c
> index 44aa9730bc9..434ff8d910d 100644
> --- a/hw/misc/auxbus.c
> +++ b/hw/misc/auxbus.c
> @@ -135,7 +135,7 @@ AUXReply aux_request(AUXBus *bus, AUXCommand cmd, uint32_t address,
>             i2c_end_transfer(i2c_bus);
>         }
>
> -        if (i2c_start_transfer(i2c_bus, address, true)) {
> +        if (i2c_start_recv(i2c_bus, address)) {
>             ret = AUX_I2C_NACK;
>             break;
>         }
> @@ -151,7 +151,7 @@ AUXReply aux_request(AUXBus *bus, AUXCommand cmd, uint32_t address,
>             i2c_end_transfer(i2c_bus);
>         }
>
> -        if (i2c_start_transfer(i2c_bus, address, false)) {
> +        if (i2c_start_send(i2c_bus, address)) {
>             ret = AUX_I2C_NACK;
>             break;
>         }
> @@ -179,7 +179,7 @@ AUXReply aux_request(AUXBus *bus, AUXCommand cmd, uint32_t address,
>             /*
>              * No transactions started..
>              */
> -            if (i2c_start_transfer(i2c_bus, address, false)) {
> +            if (i2c_start_send(i2c_bus, address)) {
>                 break;
>             }
>         } else if ((address != bus->last_i2c_address) ||
> @@ -188,7 +188,7 @@ AUXReply aux_request(AUXBus *bus, AUXCommand cmd, uint32_t address,
>              * Transaction started but we need to restart..
>              */
>             i2c_end_transfer(i2c_bus);
> -            if (i2c_start_transfer(i2c_bus, address, false)) {
> +            if (i2c_start_send(i2c_bus, address)) {
>                 break;
>             }
>         }
> @@ -210,7 +210,7 @@ AUXReply aux_request(AUXBus *bus, AUXCommand cmd, uint32_t address,
>             /*
>              * No transactions started..
>              */
> -            if (i2c_start_transfer(i2c_bus, address, true)) {
> +            if (i2c_start_recv(i2c_bus, address)) {
>                 break;
>             }
>         } else if ((address != bus->last_i2c_address) ||
> @@ -219,7 +219,7 @@ AUXReply aux_request(AUXBus *bus, AUXCommand cmd, uint32_t address,
>              * Transaction started but we need to restart..
>              */
>             i2c_end_transfer(i2c_bus);
> -            if (i2c_start_transfer(i2c_bus, address, true)) {
> +            if (i2c_start_recv(i2c_bus, address)) {
>                 break;
>             }
>         }
>
--3866299591-940412549-1623975935=:59666--

