Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E7CF3ABFEB
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 01:58:49 +0200 (CEST)
Received: from localhost ([::1]:59586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lu1uK-0001fu-5w
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 19:58:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lu1tY-00010I-Cu
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 19:58:00 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:22031)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lu1tV-0002qp-GY
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 19:57:59 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id B35D27457E5;
 Fri, 18 Jun 2021 01:57:53 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 901367456E3; Fri, 18 Jun 2021 01:57:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 8EA0A7456B4;
 Fri, 18 Jun 2021 01:57:53 +0200 (CEST)
Date: Fri, 18 Jun 2021 01:57:53 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH v5 14/15] hw/i2c: Extract i2c_do_start_transfer() from
 i2c_start_transfer()
In-Reply-To: <20210617115334.2761573-15-f4bug@amsat.org>
Message-ID: <5edc6174-c731-b4e3-61e0-dc64a2cb1f52@eik.bme.hu>
References: <20210617115334.2761573-1-f4bug@amsat.org>
 <20210617115334.2761573-15-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 BOUNDARY="3866299591-1199009183-1623973986=:59666"
Content-ID: <4637ba6-2f56-65c-b8d9-d3e98db64b6d@eik.bme.hu>
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

--3866299591-1199009183-1623973986=:59666
Content-Type: text/plain; CHARSET=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 8BIT
Content-ID: <93aff5e-ce61-3a26-ded9-d444191f145f@eik.bme.hu>

On Thu, 17 Jun 2021, Philippe Mathieu-Daudé wrote:
> To allow further simplications, extract i2c_do_start_transfer()
> from i2c_start_transfer(). This is mostly the same function,
> but the former is static and takes an enum argument.
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> hw/i2c/core.c | 14 ++++++++++++--
> 1 file changed, 12 insertions(+), 2 deletions(-)
>
> diff --git a/hw/i2c/core.c b/hw/i2c/core.c
> index 6639ca8c2e0..5483bf95a3e 100644
> --- a/hw/i2c/core.c
> +++ b/hw/i2c/core.c
> @@ -114,8 +114,11 @@ bool i2c_scan_bus(I2CBus *bus, uint8_t address, bool broadcast,
>  * protocol uses a start transfer to switch from write to read mode
>  * without releasing the bus.  If that fails, the bus is still
>  * in a transaction.
> + *
> + * @event must be I2C_START_RECV or I2C_START_SEND.
>  */
> -int i2c_start_transfer(I2CBus *bus, uint8_t address, bool is_recv)
> +static int i2c_do_start_transfer(I2CBus *bus, uint8_t address,
> +                                 enum i2c_event event)
> {
>     I2CSlaveClass *sc;
>     I2CNode *node;
> @@ -157,7 +160,7 @@ int i2c_start_transfer(I2CBus *bus, uint8_t address, bool is_recv)
>
>         if (sc->event) {
>             trace_i2c_event("start", s->address);
> -            rv = sc->event(s, is_recv ? I2C_START_RECV : I2C_START_SEND);
> +            rv = sc->event(s, event);
>             if (rv && !bus->broadcast) {
>                 if (bus_scanned) {
>                     /* First call, terminate the transfer. */
> @@ -170,6 +173,13 @@ int i2c_start_transfer(I2CBus *bus, uint8_t address, bool is_recv)
>     return 0;
> }
>
> +int i2c_start_transfer(I2CBus *bus, uint8_t address, bool is_recv)
> +{
> +    return i2c_do_start_transfer(bus, address, is_recv
> +                                               ? I2C_START_RECV
> +                                               : I2C_START_SEND);
> +}
> +

Why is this better than keeping the original function and just add 
wrappers calling that for i2c_start_send/start_recv? So you could just 
drop this patch and change the next one to call i2c_start_transfer(bus, 
addr, true) for i2c_start_recv and with false for start_send. This seems 
to add another variant for no good reason. If the enum would only have 
these two values then that could be an improvement (although the function 
is static so nothing else could use it) but it's actually reusing an enum 
with other values so this does not seem to make it much better. Then you 
could just keep the existing function.

Regards,
BALATON Zoltan

> void i2c_end_transfer(I2CBus *bus)
> {
>     I2CSlaveClass *sc;
>
--3866299591-1199009183-1623973986=:59666--

