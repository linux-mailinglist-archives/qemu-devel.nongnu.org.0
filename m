Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD08E550B3D
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Jun 2022 16:52:47 +0200 (CEST)
Received: from localhost ([::1]:47454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o2wIA-0008Fr-Ix
	for lists+qemu-devel@lfdr.de; Sun, 19 Jun 2022 10:52:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o2wGJ-0006uQ-6U
 for qemu-devel@nongnu.org; Sun, 19 Jun 2022 10:50:53 -0400
Received: from 2.mo552.mail-out.ovh.net ([178.33.105.233]:38057)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o2wGD-0005G2-Fb
 for qemu-devel@nongnu.org; Sun, 19 Jun 2022 10:50:48 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.220])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id E6DA12775D;
 Sun, 19 Jun 2022 14:50:39 +0000 (UTC)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Sun, 19 Jun
 2022 16:50:37 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G005c9d85d6a-5561-40bf-a8a8-c7ece1019c44,
 F3BB28978D5D33C371BBBD2B34D0F30B2C684C62) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <b7f39817-fa9b-6642-f06c-e0927c32d482@kaod.org>
Date: Sun, 19 Jun 2022 16:50:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 00/21] aspeed: Extend ast2600 I2C model with new mode
Content-Language: en-US
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
CC: Peter Maydell <peter.maydell@linaro.org>, Joe Komlodi
 <komlodi@google.com>, Troy Lee <troy_lee@aspeedtech.com>, Jamin Lin
 <jamin_lin@aspeedtech.com>, Steven Lee <steven_lee@aspeedtech.com>, Klaus
 Jensen <k.jensen@samsung.com>, Peter Delevoryas <pdel@fb.com>, Corey Minyard
 <cminyard@mvista.com>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, Damien
 Hedde <damien.hedde@greensocs.com>, Andrew Jeffery <andrew@aj.id.au>, Joel
 Stanley <joel@jms.id.au>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>, Wainer dos Santos
 Moschetta <wainersm@redhat.com>, Beraldo Leal <bleal@redhat.com>
References: <20220606150732.2282041-1-clg@kaod.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220606150732.2282041-1-clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 80875f7e-527d-49fe-a38d-88bc8fbcfdde
X-Ovh-Tracer-Id: 4016929394616798154
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedruddvledgkedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeekteejtdelkeejvdevffduhfetteelieefgeefffeugffhfeekheffueefledujeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopegslhgvrghlsehrvgguhhgrthdrtghomhdpoffvtefjohhsthepmhhoheehvd
Received-SPF: pass client-ip=178.33.105.233; envelope-from=clg@kaod.org;
 helo=2.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello Corey,

On 6/6/22 17:07, Cédric Le Goater wrote:
> Hello,
> 
> Here is a series aggregating recent changes proposed on the Aspeed
> ast2600 I2C controller model.
> 
> First comes a large set of changes converting the model to use the
> registerfield interface and adding the I2C new register mode
> (Joe). Since this is complex to review, extra tests are added to the
> acceptance test suite to check that I2C devices are still functional
> in the ast2600-evb machine. These tests use small buildroot images
> available on GH.
> 
> The ast1030 and ast2600 SoC share the same I2C logic. This series adds
> I2C support to the ast1030 now that new register mode is supported.
> There was a previous proposal from Troy doing the same but Joe's
> patchset covers the same need (and converts the model to registerfield)
> 
> Follows a proposal from Klaus adding support for multi master in the
> I2C core and the Aspeed I2C model, for the old register mode only. The
> new register mode still needs to be addressed but this shouldn't take
> too long once old register mode is merged.
> 
> Last, I have added the I2C echo device and test provided by Klaus. I
> think it would be interesting to keep them for tests. Please, tell me.
> 
> Thanks,
> 
> C.
> 
> Cédric Le Goater (7):
>    test/avocado/machine_aspeed.py: Move OpenBMC tests
>    test/avocado/machine_aspeed.py: Add tests using buildroot images
>    test/avocado/machine_aspeed.py: Add I2C tests to ast2600-evb
>    test/avocado/machine_aspeed.py: Add an I2C RTC test
>    aspeed/i2c: Add ast1030 controller models
>    aspeed/i2c: Enable SLAVE_ADDR_RX_MATCH always
>    test/avocado/machine_aspeed.py: Add I2C slave tests
> 
> Joe Komlodi (7):
>    hw/registerfields: Add shared fields macros
>    aspeed: i2c: Add ctrl_global_rsvd property
>    aspeed: i2c: Migrate to registerfields API
>    aspeed: i2c: Use reg array instead of individual vars
>    aspeed: i2c: Add new mode support
>    aspeed: i2c: Add PKT_DONE IRQ to trace
>    aspeed: i2c: Move regs and helpers to header file
> 
> Klaus Jensen (6):
>    hw/i2c/aspeed: rework raise interrupt trace event
>    hw/i2c/aspeed: add DEV_ADDR in old register mode


>    hw/i2c: support multiple masters
>    hw/i2c: add asynchronous send
>    hw/i2c/aspeed: add slave device in old register mode


Do you think we can move forward with the above 3 patches and include
them in an Aspeed PR ? I didn't see any objection.

Thanks,

C.



>    hw/misc: add a toy i2c echo device [DO NOT PULL]
> 
> Troy Lee (1):
>    aspeed: Add I2C buses to AST1030 model
> 
>   include/hw/i2c/aspeed_i2c.h         | 299 ++++++++-
>   include/hw/i2c/i2c.h                |  30 +
>   include/hw/registerfields.h         |  70 +++
>   hw/arm/aspeed.c                     |  13 +
>   hw/arm/aspeed_ast10x0.c             |  18 +
>   hw/arm/aspeed_ast2600.c             |   2 +
>   hw/arm/pxa2xx.c                     |   2 +
>   hw/display/sii9022.c                |   2 +
>   hw/display/ssd0303.c                |   2 +
>   hw/i2c/aspeed_i2c.c                 | 901 ++++++++++++++++++----------
>   hw/i2c/core.c                       |  70 ++-
>   hw/i2c/smbus_slave.c                |   4 +
>   hw/misc/i2c-echo.c                  | 162 +++++
>   hw/nvram/eeprom_at24c.c             |   2 +
>   hw/sensor/lsm303dlhc_mag.c          |   2 +
>   hw/i2c/trace-events                 |   4 +-
>   hw/misc/meson.build                 |   2 +
>   tests/avocado/boot_linux_console.py |  43 --
>   tests/avocado/machine_aspeed.py     | 128 ++++
>   19 files changed, 1393 insertions(+), 363 deletions(-)
>   create mode 100644 hw/misc/i2c-echo.c
> 


