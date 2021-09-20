Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5CCB4119BD
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 18:26:35 +0200 (CEST)
Received: from localhost ([::1]:50080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSM7m-0000Dl-Un
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 12:26:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mSM4f-0005p0-Au
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 12:23:22 -0400
Received: from 6.mo548.mail-out.ovh.net ([188.165.58.48]:40789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mSM4Y-0004Ax-PT
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 12:23:20 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.59])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id F03831FEFB;
 Mon, 20 Sep 2021 16:23:10 +0000 (UTC)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Mon, 20 Sep
 2021 18:23:10 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G0054c9765a9-f099-44da-893f-c8d577a6162a,
 C584E5EC745A9DFF7B561FC81DF43D5934FDEC9F) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 00/12] aspeed: SMC cleanups and QOMification 
Date: Mon, 20 Sep 2021 18:22:57 +0200
Message-ID: <20210920162309.1091711-1-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG3EX2.mxp5.local (172.16.2.22) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 5b789446-9a54-431e-81fa-d24aa41aea8b
X-Ovh-Tracer-Id: 13073386770787175206
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrudeivddgleelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffogggtgfhisehtkeertdertdejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepfedvuedtvdeikeekuefhkedujeejgffggffhtefglefgveevfeeghfdvgedtleevnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=188.165.58.48; envelope-from=clg@kaod.org;
 helo=6.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

It looks big but there are no major changes.

This series adds dummy support for the 2nd watchdog registers which
were moved under the AST2600 FMC controller to deactivate the
alternate boot function. Then come cleanups of the AspeedSMC model
mostly removing a useless AspeedSMCController structure (that's the
noisy part) and QOMifying the AspeedSMCFlash and AspeedI2CBus
structures.

Thanks,

C.

Changes in v2:

 - fixed ABR modeling 
 - rewrote some commit logs
 - use of g_autofree variables

Cédric Le Goater (12):
  aspeed/smc: Add watchdog Control/Status Registers
  aspeed/smc: Introduce aspeed_smc_error() helper
  aspeed/smc: Stop using the model name for the memory regions
  aspeed/smc: Drop AspeedSMCController structure
  aspeed/smc: Remove the 'flash' attribute from AspeedSMCFlash
  aspeed/smc: Remove the 'size' attribute from AspeedSMCFlash
  aspeed/smc: Rename AspeedSMCFlash 'id' to 'cs'
  aspeed/smc: QOMify AspeedSMCFlash
  aspeed/smc: Add default reset values
  aspeed/smc: Introduce a new addr_width() class handler
  aspeed/smc: Remove unused attribute 'irqline'
  aspeed/i2c: QOMify AspeedI2CBus

 include/hw/i2c/aspeed_i2c.h |    8 +-
 include/hw/ssi/aspeed_smc.h |   82 ++-
 hw/arm/aspeed.c             |   18 +-
 hw/arm/aspeed_ast2600.c     |   11 +-
 hw/arm/aspeed_soc.c         |    4 +-
 hw/i2c/aspeed_i2c.c         |  101 +++-
 hw/ssi/aspeed_smc.c         | 1128 ++++++++++++++++++++---------------
 7 files changed, 791 insertions(+), 561 deletions(-)

-- 
2.31.1


