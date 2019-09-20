Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9359B93EB
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Sep 2019 17:25:54 +0200 (CEST)
Received: from localhost ([::1]:60770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iBKnC-0005lh-04
	for lists+qemu-devel@lfdr.de; Fri, 20 Sep 2019 11:25:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43190)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iBKm2-0005El-9w
 for qemu-devel@nongnu.org; Fri, 20 Sep 2019 11:24:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iBKm1-0002s0-CF
 for qemu-devel@nongnu.org; Fri, 20 Sep 2019 11:24:42 -0400
Received: from 2.mo173.mail-out.ovh.net ([178.33.251.49]:52265)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iBKm1-0002r0-6j
 for qemu-devel@nongnu.org; Fri, 20 Sep 2019 11:24:41 -0400
Received: from player772.ha.ovh.net (unknown [10.109.159.157])
 by mo173.mail-out.ovh.net (Postfix) with ESMTP id 1F8CA117E18
 for <qemu-devel@nongnu.org>; Fri, 20 Sep 2019 17:24:38 +0200 (CEST)
Received: from kaod.org (lfbn-1-2240-157.w90-76.abo.wanadoo.fr [90.76.60.157])
 (Authenticated sender: clg@kaod.org)
 by player772.ha.ovh.net (Postfix) with ESMTPSA id 140F4A088065;
 Fri, 20 Sep 2019 15:24:34 +0000 (UTC)
Subject: Re: [PATCH 12/21] aspeed/smc: Add AST2600 support
To: Joel Stanley <joel@jms.id.au>
References: <20190919055002.6729-1-clg@kaod.org>
 <20190919055002.6729-13-clg@kaod.org>
 <CACPK8XcJRT8fa81vp7aC8f+yfOxaHMFd9+tijq7j1D68DGbFcQ@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <f06cbfcf-8fe3-2b1b-b259-4995e4b30480@kaod.org>
Date: Fri, 20 Sep 2019 17:24:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CACPK8XcJRT8fa81vp7aC8f+yfOxaHMFd9+tijq7j1D68DGbFcQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 17236964624092728235
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrvddvgdekjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/09/2019 06:46, Joel Stanley wrote:
> On Thu, 19 Sep 2019 at 05:51, C=C3=A9dric Le Goater <clg@kaod.org> wrot=
e:
>>
>> The AST2600 SoC SMC controller is a SPI only controller now and has a
>> few extensions which we will need to take into account when SW
>> requires it.
>>
>>  - 4BYTE mode
>>  - HCLK divider has changed (SPI Training)
>>  - CE0-2 Read Timing Compensation registers
>>
>> This is enough to support u-boot.
>=20
> As easy as that! I hope the Linux driver is as simple :)

Only HW will tell ! :)
=20
>> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
>=20
> Reviewed-by: Joel Stanley <joel@jms.id.au>

I had some issues with the segment routines. I will have to resend
this one.

thanks,

C.

=20


