Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04ABC19F0B9
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Apr 2020 09:26:14 +0200 (CEST)
Received: from localhost ([::1]:55702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jLM97-0003w4-3P
	for lists+qemu-devel@lfdr.de; Mon, 06 Apr 2020 03:26:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56017)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1jLM81-00034Q-Cb
 for qemu-devel@nongnu.org; Mon, 06 Apr 2020 03:25:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1jLM80-0004WC-B6
 for qemu-devel@nongnu.org; Mon, 06 Apr 2020 03:25:05 -0400
Received: from 6.mo4.mail-out.ovh.net ([188.165.36.253]:60081)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1jLM80-0004Ry-5L
 for qemu-devel@nongnu.org; Mon, 06 Apr 2020 03:25:04 -0400
Received: from player698.ha.ovh.net (unknown [10.110.103.195])
 by mo4.mail-out.ovh.net (Postfix) with ESMTP id AC4CC230651
 for <qemu-devel@nongnu.org>; Mon,  6 Apr 2020 09:24:55 +0200 (CEST)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player698.ha.ovh.net (Postfix) with ESMTPSA id A4437111D7EBD;
 Mon,  6 Apr 2020 07:24:48 +0000 (UTC)
Subject: Re: [PATCH] qom/object: Fix object_child_foreach_recursive() return
 value
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200404153340.164861-1-clg@kaod.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <6737a37a-7190-0585-cc1f-08d5e7f757e5@kaod.org>
Date: Mon, 6 Apr 2020 09:24:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200404153340.164861-1-clg@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 15656482631112100838
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduhedruddvgdduvdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucffohhmrghinhepohiilhgrsghsrdhorhhgnecukfhppedtrddtrddtrddtpdekvddrieegrddvhedtrddujedtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrieelkedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhg
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 188.165.36.253
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello David,

On 4/4/20 5:33 PM, C=C3=A9dric Le Goater wrote:
> When recursing, the return value of do_object_child_foreach() is not
> taken into account.

Patch "ppc/pnv: Create BMC devices only when defaults are enabled" :

	http://patchwork.ozlabs.org/patch/1266421

depends on this fix.=20

May be it can go through the ppc branch ? A patchset with these
two patches would have been easier to track :/ Sorry about that.

Thanks,

C.=20

> Cc: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
> Fixes: d714b8de7747 ("qom: Add recursive version of object_child_for_ea=
ch")
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  qom/object.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/qom/object.c b/qom/object.c
> index 1812f792247d..b68a707a5e65 100644
> --- a/qom/object.c
> +++ b/qom/object.c
> @@ -1057,7 +1057,10 @@ static int do_object_child_foreach(Object *obj,
>                  break;
>              }
>              if (recurse) {
> -                do_object_child_foreach(child, fn, opaque, true);
> +                ret =3D do_object_child_foreach(child, fn, opaque, tru=
e);
> +                if (ret !=3D 0) {
> +                    break;
> +                }
>              }
>          }
>      }
>=20


