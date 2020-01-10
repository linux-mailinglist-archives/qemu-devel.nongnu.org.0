Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F3B136B08
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jan 2020 11:27:34 +0100 (CET)
Received: from localhost ([::1]:43618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iprVt-0004qu-BY
	for lists+qemu-devel@lfdr.de; Fri, 10 Jan 2020 05:27:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32908)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iprTw-0002Zm-I6
 for qemu-devel@nongnu.org; Fri, 10 Jan 2020 05:25:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iprTv-000598-Ba
 for qemu-devel@nongnu.org; Fri, 10 Jan 2020 05:25:32 -0500
Received: from 6.mo2.mail-out.ovh.net ([87.98.165.38]:41111)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iprTv-0004yq-2r
 for qemu-devel@nongnu.org; Fri, 10 Jan 2020 05:25:31 -0500
Received: from player786.ha.ovh.net (unknown [10.109.146.163])
 by mo2.mail-out.ovh.net (Postfix) with ESMTP id 9E4A31BF188
 for <qemu-devel@nongnu.org>; Fri, 10 Jan 2020 11:25:28 +0100 (CET)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player786.ha.ovh.net (Postfix) with ESMTPSA id A284AE3A03BF;
 Fri, 10 Jan 2020 10:25:19 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 0/5] aspeed: extensions and fixes
Date: Fri, 10 Jan 2020 11:25:13 +0100
Message-Id: <20200110102518.4233-1-clg@kaod.org>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 5843420520192772881
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrvdeifedgudehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffogggtgfesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpkedvrdeigedrvdehtddrudejtdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeekiedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 87.98.165.38
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

Here is a short series adding :

 - a new eMMC controller model for the AST2600 SoC (Andrew)
 - accessors to control the led state of the pca9552 device (Joel)
 - a 'execute-in-place' property to boot directly from CE0

Thanks,

C.

Changes since v1:

  - removed ternary operator from sdhci_attach_drive()
  - changed object name to "emmc"


Andrew Jeffery (2):
  hw/sd: Configure number of slots exposed by the ASPEED SDHCI model
  hw/arm: ast2600: Wire up the eMMC controller

C=C3=A9dric Le Goater (2):
  ftgmac100: check RX and TX buffer alignment
  hw/arm/aspeed: add a 'execute-in-place' property to boot directly from
    CE0

Joel Stanley (1):
  misc/pca9552: Add qom set and get

 include/hw/arm/aspeed.h      |  2 +
 include/hw/arm/aspeed_soc.h  |  2 +
 include/hw/sd/aspeed_sdhci.h |  1 +
 hw/arm/aspeed.c              | 72 +++++++++++++++++++++++------
 hw/arm/aspeed_ast2600.c      | 23 +++++++++
 hw/arm/aspeed_soc.c          |  2 +
 hw/misc/pca9552.c            | 90 ++++++++++++++++++++++++++++++++++++
 hw/net/ftgmac100.c           | 13 ++++++
 hw/sd/aspeed_sdhci.c         | 11 ++++-
 9 files changed, 199 insertions(+), 17 deletions(-)

--=20
2.21.1


