Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 394FD136C93
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jan 2020 12:58:16 +0100 (CET)
Received: from localhost ([::1]:44520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ipsve-0007jP-QA
	for lists+qemu-devel@lfdr.de; Fri, 10 Jan 2020 06:58:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48615)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1ipsub-0006im-2y
 for qemu-devel@nongnu.org; Fri, 10 Jan 2020 06:57:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1ipsuZ-0005Qx-KH
 for qemu-devel@nongnu.org; Fri, 10 Jan 2020 06:57:08 -0500
Received: from 14.mo4.mail-out.ovh.net ([46.105.40.29]:46126)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1ipsuY-0005M7-E1
 for qemu-devel@nongnu.org; Fri, 10 Jan 2020 06:57:07 -0500
Received: from player690.ha.ovh.net (unknown [10.108.1.13])
 by mo4.mail-out.ovh.net (Postfix) with ESMTP id AAFD12161C8
 for <qemu-devel@nongnu.org>; Fri, 10 Jan 2020 12:57:02 +0100 (CET)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player690.ha.ovh.net (Postfix) with ESMTPSA id B54D3DF37D5B;
 Fri, 10 Jan 2020 11:56:56 +0000 (UTC)
Subject: Re: [PATCH 2/5] hw/arm: ast2600: Wire up the eMMC controller
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20200107073423.30043-1-clg@kaod.org>
 <20200107073423.30043-3-clg@kaod.org>
 <a7c45303-e624-d7aa-df6f-e03f26b3cba7@redhat.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <901d2dc7-f8ed-bbca-b587-19fce5fed631@kaod.org>
Date: Fri, 10 Jan 2020 12:56:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <a7c45303-e624-d7aa-df6f-e03f26b3cba7@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 7389844039592151872
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrvdeifedgfedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpkedvrdeigedrvdehtddrudejtdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrieeltddrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 46.105.40.29
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

>> +
>> +=C2=A0=C2=A0=C2=A0 sysbus_init_child_obj(obj, "emmc", OBJECT(&s->emmc=
), sizeof(s->emmc),
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 TYPE_ASPEED_SDHCI);
>> +
>> +=C2=A0=C2=A0=C2=A0 object_property_set_int(OBJECT(&s->emmc), 1, "num-=
slots", &error_abort);
>> +
>> +=C2=A0=C2=A0=C2=A0 sysbus_init_child_obj(obj, "emmc[*]", OBJECT(&s->e=
mmc.slots[0]),
>=20
> Single block, so use "emmc" instead.

Andrew, how should we call the objects in the slots ? "sdhci" ?=20

Thanks,

C.=20

