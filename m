Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 052141A07AE
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Apr 2020 08:52:00 +0200 (CEST)
Received: from localhost ([::1]:42154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jLi5X-0004CC-2A
	for lists+qemu-devel@lfdr.de; Tue, 07 Apr 2020 02:51:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37631)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1jLi34-000210-6V
 for qemu-devel@nongnu.org; Tue, 07 Apr 2020 02:49:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1jLi33-0007d9-5p
 for qemu-devel@nongnu.org; Tue, 07 Apr 2020 02:49:26 -0400
Received: from 2.mo173.mail-out.ovh.net ([178.33.251.49]:47753)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1jLi32-0007ao-V6
 for qemu-devel@nongnu.org; Tue, 07 Apr 2020 02:49:25 -0400
Received: from player746.ha.ovh.net (unknown [10.108.42.170])
 by mo173.mail-out.ovh.net (Postfix) with ESMTP id EA49D134B85
 for <qemu-devel@nongnu.org>; Tue,  7 Apr 2020 08:49:19 +0200 (CEST)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player746.ha.ovh.net (Postfix) with ESMTPSA id CAA261140B04B;
 Tue,  7 Apr 2020 06:49:10 +0000 (UTC)
Subject: Re: [PATCH v1] nrf51: Fix last GPIO CNF address
To: Cameron Esfahani <dirty@apple.com>, qemu-devel@nongnu.org
References: <0b02fe788de99120894f87f6d5c60e15d6a75d85.1586213450.git.dirty@apple.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <7bdd47e1-f082-6aa3-3611-9a0669272ad5@kaod.org>
Date: Tue, 7 Apr 2020 08:49:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <0b02fe788de99120894f87f6d5c60e15d6a75d85.1586213450.git.dirty@apple.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 2481201921378978668
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduhedrudeggdduuddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefuvfhfhffkffgfgggjtgfgsehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecukfhppedtrddtrddtrddtpdekvddrieegrddvhedtrddujedtnecuvehluhhsthgvrhfuihiivgepgeenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeegiedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhg
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 178.33.251.49
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
Cc: peter.maydell@linaro.org, philmd@redhat.com, joel@jms.id.au,
 kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/7/20 12:55 AM, Cameron Esfahani wrote:
> NRF51_GPIO_REG_CNF_END doesn't actually refer to the start of the last
> valid CNF register: it's referring to the last byte of the last valid
> CNF register.
>=20
> This hasn't been a problem up to now, as current implementation in
> memory.c turns an unaligned 4-byte read from 0x77f to a single byte rea=
d
> and the qtest only looks at the least-significant byte of the register.
>=20
> But, when running with Cedric Le Goater's <clg@kaod.org> pending fix fo=
r
> unaligned accesses in memory.c, the qtest breaks.
>=20
> Considering NRF51 doesn't support unaligned accesses, the simplest fix
> is to actually set NRF51_GPIO_REG_CNF_END to the start of the last vali=
d
> CNF register: 0x77c.
>=20
> Now, qtests work with or without Cedric's patch.
>=20
> Signed-off-by: Cameron Esfahani <dirty@apple.com>

Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Tested-by: C=C3=A9dric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>  include/hw/gpio/nrf51_gpio.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/include/hw/gpio/nrf51_gpio.h b/include/hw/gpio/nrf51_gpio.=
h
> index 337ee534bb..1d62bbc928 100644
> --- a/include/hw/gpio/nrf51_gpio.h
> +++ b/include/hw/gpio/nrf51_gpio.h
> @@ -42,7 +42,7 @@
>  #define NRF51_GPIO_REG_DIRSET       0x518
>  #define NRF51_GPIO_REG_DIRCLR       0x51C
>  #define NRF51_GPIO_REG_CNF_START    0x700
> -#define NRF51_GPIO_REG_CNF_END      0x77F
> +#define NRF51_GPIO_REG_CNF_END      0x77C
> =20
>  #define NRF51_GPIO_PULLDOWN 1
>  #define NRF51_GPIO_PULLUP 3
>=20


