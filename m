Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE201552EA
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Feb 2020 08:25:18 +0100 (CET)
Received: from localhost ([::1]:51014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1izy0r-0002xM-A9
	for lists+qemu-devel@lfdr.de; Fri, 07 Feb 2020 02:25:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58752)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1izxyS-0000SV-Gn
 for qemu-devel@nongnu.org; Fri, 07 Feb 2020 02:22:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1izxyQ-0005dW-C5
 for qemu-devel@nongnu.org; Fri, 07 Feb 2020 02:22:48 -0500
Received: from 8.mo2.mail-out.ovh.net ([188.165.52.147]:42523)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1izxyQ-0005a3-6d
 for qemu-devel@nongnu.org; Fri, 07 Feb 2020 02:22:46 -0500
Received: from player714.ha.ovh.net (unknown [10.108.35.240])
 by mo2.mail-out.ovh.net (Postfix) with ESMTP id B65121C8F8F
 for <qemu-devel@nongnu.org>; Fri,  7 Feb 2020 08:22:43 +0100 (CET)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player714.ha.ovh.net (Postfix) with ESMTPSA id 779F5F082EC8;
 Fri,  7 Feb 2020 07:22:31 +0000 (UTC)
Subject: Re: [PATCH v2 3/4] m25p80: Improve command handling for unsupported
 commands
To: Guenter Roeck <linux@roeck-us.net>,
 Alistair Francis <alistair@alistair23.me>, Kevin Wolf <kwolf@redhat.com>
References: <20200206183219.3756-1-linux@roeck-us.net>
 <20200206183219.3756-3-linux@roeck-us.net>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <f1f8af75-c1a6-482c-395d-9dab67ef2cc0@kaod.org>
Date: Fri, 7 Feb 2020 08:22:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200206183219.3756-3-linux@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 1171780329806531504
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedugedrheeggddutdejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpkedvrdeigedrvdehtddrudejtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejudegrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrgh
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 188.165.52.147
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 Andrew Jeffery <andrew@aj.id.au>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/6/20 7:32 PM, Guenter Roeck wrote:
> Whenever an unsupported command is encountered, the current code
> interprets each transferred byte as new command. Most of the time, thos=
e
> 'commands' are interpreted as new unknown commands. However, in rare
> cases, it may be that for example address or length information
> passed with the original command is by itself a valid command.
> If that happens, the state machine may get completely confused and,
> worst case, start writing data into the flash or even erase it.
>=20
> To avoid the problem, transition into STATE_READING_DATA and keep
> sending a value of 0 until the chip is deselected after encountering
> an unsupported command.
>=20
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>


Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>

> ---
> v2: Split patch into two parts; improved description.
>=20
>  hw/block/m25p80.c | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
> index 53bf63856f..8227088441 100644
> --- a/hw/block/m25p80.c
> +++ b/hw/block/m25p80.c
> @@ -1161,6 +1161,11 @@ static void decode_new_cmd(Flash *s, uint32_t va=
lue)
>          s->quad_enable =3D false;
>          break;
>      default:
> +        s->pos =3D 0;
> +        s->len =3D 1;
> +        s->state =3D STATE_READING_DATA;
> +        s->data_read_loop =3D true;
> +        s->data[0] =3D 0;
>          qemu_log_mask(LOG_GUEST_ERROR, "M25P80: Unknown cmd %x\n", val=
ue);
>          break;
>      }
>=20


