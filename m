Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F17151699
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Feb 2020 08:46:36 +0100 (CET)
Received: from localhost ([::1]:54080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iysup-0006Qe-LL
	for lists+qemu-devel@lfdr.de; Tue, 04 Feb 2020 02:46:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47574)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iystj-0005Da-Qe
 for qemu-devel@nongnu.org; Tue, 04 Feb 2020 02:45:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iysti-0006DH-GO
 for qemu-devel@nongnu.org; Tue, 04 Feb 2020 02:45:27 -0500
Received: from 4.mo2.mail-out.ovh.net ([87.98.172.75]:43625)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iysti-00064X-8L
 for qemu-devel@nongnu.org; Tue, 04 Feb 2020 02:45:26 -0500
Received: from player168.ha.ovh.net (unknown [10.110.208.220])
 by mo2.mail-out.ovh.net (Postfix) with ESMTP id 292611C87A8
 for <qemu-devel@nongnu.org>; Tue,  4 Feb 2020 08:45:23 +0100 (CET)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player168.ha.ovh.net (Postfix) with ESMTPSA id 1BED2EEF7410;
 Tue,  4 Feb 2020 07:45:12 +0000 (UTC)
Subject: Re: [PATCH 3/3] aspeed/smc: Fix number of dummy cycles for
 FAST_READ_4 command
To: Guenter Roeck <linux@roeck-us.net>,
 Alistair Francis <alistair@alistair23.me>
References: <20200203180904.2727-1-linux@roeck-us.net>
 <20200203180904.2727-3-linux@roeck-us.net>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <329f6d24-6d47-4e2e-1a66-7683bc0529a9@kaod.org>
Date: Tue, 4 Feb 2020 08:45:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200203180904.2727-3-linux@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 2383248630908488570
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedugedrgeekgdduuddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpkedvrdeigedrvdehtddrudejtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhduieekrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrgh
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 87.98.172.75
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, Andrew Jeffery <andrew@aj.id.au>,
 Francisco Iglesias <frasse.iglesias@gmail.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/3/20 7:09 PM, Guenter Roeck wrote:
> The Linux kernel recently started using FAST_READ_4 commands.
> This results in flash read failures. At the same time, the m25p80
> emulation is seen to read 8 more bytes than expected. Adjusting the
> expected number of dummy cycles to match FAST_READ fixes the problem.

Which machine are you using for these tests ? the AST2500 evb using
the w25q256 flash model ?=20

Any how, it looks correct.=20

Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Fixes: f95c4bffdc4c ("aspeed/smc: snoop SPI transfers to fake dummy cycle=
s")

I think commit ef06ca3946e2 ("xilinx_spips: Add support for RX discard=20
and RX drain") needs a similar fix. Adding Francisco.

Thanks,

C.=20


> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  hw/ssi/aspeed_smc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
> index f0c7bbbad3..61e8fa57d3 100644
> --- a/hw/ssi/aspeed_smc.c
> +++ b/hw/ssi/aspeed_smc.c
> @@ -762,11 +762,11 @@ static int aspeed_smc_num_dummies(uint8_t command=
)
>      case FAST_READ:
>      case DOR:
>      case QOR:
> +    case FAST_READ_4:
>      case DOR_4:
>      case QOR_4:
>          return 1;
>      case DIOR:
> -    case FAST_READ_4:
>      case DIOR_4:
>          return 2;
>      case QIOR:
>=20


