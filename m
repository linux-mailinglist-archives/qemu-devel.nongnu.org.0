Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1024419D794
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Apr 2020 15:29:46 +0200 (CEST)
Received: from localhost ([::1]:55494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jKMOG-0003QI-Ta
	for lists+qemu-devel@lfdr.de; Fri, 03 Apr 2020 09:29:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33547)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1jKMNT-0002nm-MW
 for qemu-devel@nongnu.org; Fri, 03 Apr 2020 09:28:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1jKMNS-00027A-DV
 for qemu-devel@nongnu.org; Fri, 03 Apr 2020 09:28:55 -0400
Received: from 7.mo6.mail-out.ovh.net ([46.105.59.196]:37286)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1jKMNS-0001ra-8N
 for qemu-devel@nongnu.org; Fri, 03 Apr 2020 09:28:54 -0400
Received: from player737.ha.ovh.net (unknown [10.110.171.96])
 by mo6.mail-out.ovh.net (Postfix) with ESMTP id 5D03F207DD1
 for <qemu-devel@nongnu.org>; Fri,  3 Apr 2020 15:28:45 +0200 (CEST)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player737.ha.ovh.net (Postfix) with ESMTPSA id 299DD7A2CBE7;
 Fri,  3 Apr 2020 13:28:39 +0000 (UTC)
Subject: Re: [PATCH for-5.0] hw/gpio/aspeed_gpio.c: Don't directly include
 assert.h
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200403124712.24826-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <ed43d629-c6ad-f3ff-6e40-aa9ccddbebc2@kaod.org>
Date: Fri, 3 Apr 2020 15:28:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200403124712.24826-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 4182718157698534355
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduhedrtdeigdeigecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgsehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecukfhppedtrddtrddtrddtpdekvddrieegrddvhedtrddujedtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeefjedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhg
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.59.196
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/3/20 2:47 PM, Peter Maydell wrote:
> Remove a direct include of assert.h -- this is already
> provided by qemu/osdep.h, and it breaks our rule that the
> first include must always be osdep.h.
>=20
> In particular we must get the assert() macro via osdep.h
> to avoid compile failures on mingw (see the comment in
> osdep.h where we redefine assert() for that platform).
>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>


Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>

> ---
> Reported via a random comment on our github mirror...
> we should probably do a proper clean-includes run post-5.0.

with a 'sort' maybe.

Thanks,

C.=20

>=20
>  hw/gpio/aspeed_gpio.c | 2 --
>  1 file changed, 2 deletions(-)
>=20
> diff --git a/hw/gpio/aspeed_gpio.c b/hw/gpio/aspeed_gpio.c
> index 41e11ea9b04..e52fcfd9a03 100644
> --- a/hw/gpio/aspeed_gpio.c
> +++ b/hw/gpio/aspeed_gpio.c
> @@ -6,8 +6,6 @@
>   * SPDX-License-Identifier: GPL-2.0-or-later
>   */
> =20
> -#include <assert.h>
> -
>  #include "qemu/osdep.h"
>  #include "qemu/host-utils.h"
>  #include "qemu/log.h"
>=20


