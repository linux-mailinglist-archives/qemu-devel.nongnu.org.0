Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE7B10C57E
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Nov 2019 09:54:32 +0100 (CET)
Received: from localhost ([::1]:46616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iaFZG-0008LV-9w
	for lists+qemu-devel@lfdr.de; Thu, 28 Nov 2019 03:54:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44738)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iaFSa-0004gV-UA
 for qemu-devel@nongnu.org; Thu, 28 Nov 2019 03:47:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iaFSZ-0007Bh-PJ
 for qemu-devel@nongnu.org; Thu, 28 Nov 2019 03:47:36 -0500
Received: from 15.mo1.mail-out.ovh.net ([188.165.38.232]:46109)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iaFSZ-00077I-Co
 for qemu-devel@nongnu.org; Thu, 28 Nov 2019 03:47:35 -0500
Received: from player761.ha.ovh.net (unknown [10.108.35.90])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id 31F5F19C84B
 for <qemu-devel@nongnu.org>; Thu, 28 Nov 2019 09:47:31 +0100 (CET)
Received: from kaod.org (lfbn-1-2229-223.w90-76.abo.wanadoo.fr [90.76.50.223])
 (Authenticated sender: clg@kaod.org)
 by player761.ha.ovh.net (Postfix) with ESMTPSA id B58DDCA740CB;
 Thu, 28 Nov 2019 08:47:26 +0000 (UTC)
Subject: Re: [PATCH 1/4] target/arm: Remove redundant scaling of nexttick
To: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org
References: <20191128054527.25450-1-andrew@aj.id.au>
 <20191128054527.25450-2-andrew@aj.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <0d116fec-b943-a348-b301-76102c1ba097@kaod.org>
Date: Thu, 28 Nov 2019 09:47:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191128054527.25450-2-andrew@aj.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 9917770804571048768
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrudeiiedguddviecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjqdffgfeufgfipdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgsehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecukfhppedtrddtrddtrddtpdeltddrjeeirdehtddrvddvfeenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeeiuddrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 188.165.38.232
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
Cc: peter.maydell@linaro.org, joel@jms.id.au, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28/11/2019 06:45, Andrew Jeffery wrote:
> The corner-case codepath was adjusting nexttick such that overflow
> wouldn't occur when timer_mod() scaled the value back up. Remove a use
> of GTIMER_SCALE and avoid unnecessary operations by calling
> timer_mod_ns() directly.
>=20
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>


> ---
>  target/arm/helper.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index a089fb5a6909..65c4441a3896 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -2446,9 +2446,10 @@ static void gt_recalc_timer(ARMCPU *cpu, int tim=
eridx)
>           * timer expires we will reset the timer for any remaining per=
iod.
>           */
>          if (nexttick > INT64_MAX / GTIMER_SCALE) {
> -            nexttick =3D INT64_MAX / GTIMER_SCALE;
> +            timer_mod_ns(cpu->gt_timer[timeridx], INT64_MAX);
> +        } else {
> +            timer_mod(cpu->gt_timer[timeridx], nexttick);
>          }
> -        timer_mod(cpu->gt_timer[timeridx], nexttick);
>          trace_arm_gt_recalc(timeridx, irqstate, nexttick);
>      } else {
>          /* Timer disabled: ISTATUS and timer output always clear */
>=20


