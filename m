Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D509BFFFFD
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Nov 2019 09:03:09 +0100 (CET)
Received: from localhost ([::1]:58954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iWc04-0000Fl-Sy
	for lists+qemu-devel@lfdr.de; Mon, 18 Nov 2019 03:03:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47201)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iWbz2-0007zC-7t
 for qemu-devel@nongnu.org; Mon, 18 Nov 2019 03:02:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iWbz1-0007M4-1j
 for qemu-devel@nongnu.org; Mon, 18 Nov 2019 03:02:03 -0500
Received: from 6.mo177.mail-out.ovh.net ([46.105.51.249]:35740)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iWbyx-0007Bd-MV
 for qemu-devel@nongnu.org; Mon, 18 Nov 2019 03:02:01 -0500
Received: from player763.ha.ovh.net (unknown [10.109.160.93])
 by mo177.mail-out.ovh.net (Postfix) with ESMTP id 9538210E746
 for <qemu-devel@nongnu.org>; Mon, 18 Nov 2019 09:01:53 +0100 (CET)
Received: from kaod.org (lfbn-1-2229-223.w90-76.abo.wanadoo.fr [90.76.50.223])
 (Authenticated sender: clg@kaod.org)
 by player763.ha.ovh.net (Postfix) with ESMTPSA id 1AF27C361097;
 Mon, 18 Nov 2019 08:01:44 +0000 (UTC)
Subject: Re: [QEMU-DEVEL][PATCH] gpio: fix memory leak in aspeed_gpio_init()
To: pannengyuan@huawei.com, peter.maydell@linaro.org, andrew@aj.id.au,
 joel@jms.id.au
References: <1574041065-34936-1-git-send-email-pannengyuan@huawei.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <6cfb4721-d2f7-6876-83a8-2e4bf82b8c84@kaod.org>
Date: Mon, 18 Nov 2019 09:01:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <1574041065-34936-1-git-send-email-pannengyuan@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 5760385401363532776
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrudeggedgudduiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjqdffgfeufgfipdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhepuffvfhfhkffffgggjggtgfesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpledtrdejiedrhedtrddvvdefnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejieefrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghenucevlhhushhtvghrufhiiigvpedt
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 46.105.51.249
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
Cc: qemu-arm@nongnu.org, kenny.zhangjun@huawei.com, qemu-devel@nongnu.org,
 zhang.zhanghailiang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/11/2019 02:37, pannengyuan@huawei.com wrote:
> From: PanNengyuan <pannengyuan@huawei.com>
>=20
> Address Sanitizer shows memory leak in hw/gpio/aspeed_gpio.c:875
>=20
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: PanNengyuan <pannengyuan@huawei.com>

Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>=20

I will add this patch the series I am building for 5.0.

Thanks,

C.

> ---
>  hw/gpio/aspeed_gpio.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/hw/gpio/aspeed_gpio.c b/hw/gpio/aspeed_gpio.c
> index 7acc5fa..41e11ea 100644
> --- a/hw/gpio/aspeed_gpio.c
> +++ b/hw/gpio/aspeed_gpio.c
> @@ -876,6 +876,7 @@ static void aspeed_gpio_init(Object *obj)
>                                 pin_idx % GPIOS_PER_GROUP);
>          object_property_add(obj, name, "bool", aspeed_gpio_get_pin,
>                              aspeed_gpio_set_pin, NULL, NULL, NULL);
> +        g_free(name);
>      }
>  }
> =20
>=20


