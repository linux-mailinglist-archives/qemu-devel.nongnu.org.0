Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81EED302AE0
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 19:55:56 +0100 (CET)
Received: from localhost ([::1]:55984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l471n-000255-9A
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 13:55:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l46xR-0007IP-NA; Mon, 25 Jan 2021 13:51:25 -0500
Received: from mail-vi1eur05on2101.outbound.protection.outlook.com
 ([40.107.21.101]:34720 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l46xM-0005Oj-4s; Mon, 25 Jan 2021 13:51:24 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UM1TFMnLJqn67Nj/VRQGQK/7o/a4BTtAw2El+RhfsJ3d7+M+q60UdnFX+7JLTKYzGGushySDbhu9KPuSE9bDUyBlupWPF3hpcJvMBjdPSBfbcLJGvPNkPAsmQpP/seB1PoEYUnt0EvoGGiXxjKpwEpplrQ4+ujD58SrOvPpD4ldYtk5m5wLMRluFMDJG41RfZf8j3sNZ4RcL3CWY4QvLkJUs9QYLvSoypqNIX8TmA5FMtRmk+RyYmwwemkaDuFz1FcVcxeq7xtGhGvF6rqdLks5dIxnNBr9mT5aFAq98MoGzM/drgF4sidQ1t+xLt0y8WGQdqthCafGJAPYs5hJihA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OIQSU4o22lP9aSmCpVj7OuMnvGlhRqZfnTmeoHLVZq0=;
 b=Zktm1QOZKNf4hKaXctwkbzMqJWoxOO13USgYprqjWOEc2TILGDQCg1aY1MDG2pqlHci9L2miQv6WCub8J9jIqVrEkVu8R66j3UYQOPO/iiYv2vMoIomFqVmKib2rOQ+TswoYIQAwj9KjdH5gdhowHBY+XTrfon1aT+k7GD5uYGhTBVuxJWVxun+N2+PnFOdxUY+mF+0Ex9OXQEauMPnZ24vFzclCutflwA16HusA/DswJ3jhn48P9CA5HMV5m4LnfHBTEnYqO/qNSQafYG/GOSONeFew9D0AenpMh3i9aSYERpkvPczGycaYGdpuVcHRGM34IsxxZ55w31aObIG4Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OIQSU4o22lP9aSmCpVj7OuMnvGlhRqZfnTmeoHLVZq0=;
 b=cMs/elOTdTYO5joUDHzotBF4ba8Pqe3XxabCVqLrf6fqEki9e/W1yj7qMe5U7Krn9YKtZZdj8E+kKn3DY7r3LBJiV6wt9Xrsj8nIdEpuQEpt0q0WpFkKOph4tUo58E5w1oe755Okr6tPBf5Z0vxUVuN3gXqiqWXXVoCTg2aq5zE=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4405.eurprd08.prod.outlook.com (2603:10a6:20b:b7::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.15; Mon, 25 Jan
 2021 18:51:14 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3784.019; Mon, 25 Jan 2021
 18:51:14 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v9 0/6] Rework iotests/check
Date: Mon, 25 Jan 2021 21:50:50 +0300
Message-Id: <20210125185056.129513-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.113]
X-ClientProxiedBy: AM0PR01CA0134.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:168::39) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.113) by
 AM0PR01CA0134.eurprd01.prod.exchangelabs.com (2603:10a6:208:168::39) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12 via Frontend
 Transport; Mon, 25 Jan 2021 18:51:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 46db2a7c-6ea1-4218-1fbd-08d8c16230d2
X-MS-TrafficTypeDiagnostic: AM6PR08MB4405:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4405CC0CA6A56A2D4CA860AAC1BD0@AM6PR08MB4405.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: K0YSf+Hjv3htIYr8wdMEJdFQ3QqMLrs4Z2PAoOhSJl1nlMp3lxij6LLc4V06Q4JOdZH3hp49o6118Q2oIurtRoMSjRWb7UcWrbgeCWOYnSLsT/p0BS7IR75CkHRPykk58xC4ilMQPQsiSZR7z8QEsB+f/9h+qIurj8oDrc6ruNTY+YM2yvKmJwTET36P91uvI44ddrT+wjW2LKDUQ8dvBvs2KNBzbfxub6uDZnJJfXbH880DuOU8xIeDco0iqEp4kBEa1345shbjU5IzU6gFzXC1ImH8WIAtiE826yBR64d6bTdHrHtmtoTDVzaEVl5NhYToEMguQvUTQhPA4gPbD495K4ac/7o73f12BZgcpRciLBQtHoZ9t6BU/O4ur3KLsxx4z7733eatF/A5xWGf1A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(136003)(366004)(396003)(376002)(346002)(478600001)(2906002)(8676002)(6512007)(83380400001)(6666004)(6506007)(86362001)(5660300002)(36756003)(26005)(186003)(2616005)(16526019)(107886003)(1076003)(66476007)(66946007)(6486002)(52116002)(66556008)(4326008)(956004)(8936002)(316002)(6916009);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?XuQ4k0JtrGkM/QReUx+OkQ02uejOJt6y8LNkODaK6FI/tu3cebjvAY5bvCSd?=
 =?us-ascii?Q?kQfNlLpXls2o0YRLwzYFlKXFT4mQLY+Gkqbnh+WLmDJOfxGbtQwNmMNOKSsO?=
 =?us-ascii?Q?kqfvIecnVw7r/lD7BfLbnS2aL9Uy18dXu+icxB/ATT1ZjST5jmVRue1uzSaj?=
 =?us-ascii?Q?2qGVhat+l5w2TKQBVl+ztA4lJFZEh24cjSK/MckkB0xJ9ZG7a5waBrXjH4lu?=
 =?us-ascii?Q?lht3ukC7j9BISXzPXygQ+8j92uUy6J1Er83c5hGwMAuhlPuFNBZMInrlKHBV?=
 =?us-ascii?Q?0FzOFcKNwKexxQD3HWKiJ9/rF5ce4A/QZdz1HN2YvR0oMmH41JZaWS6qBpww?=
 =?us-ascii?Q?Sz9rWJeAFNBj0cj2OErGFUNumdSCFtTyeKME+RX2dC/0QzLpNQvcVSnaFr8a?=
 =?us-ascii?Q?+Ot0TnXbXozNBYiCAIcTwSUgSddVwHWDKH3vF4cWr5Nlb/UwpFlrUefjT458?=
 =?us-ascii?Q?NBPR69/sliVTvCFMh0mZbiSaACdVZ+tpOb5sLblIU/Bbh0wGXTm22sxmpcfi?=
 =?us-ascii?Q?k0jP2BMRUH1M5E/kl/bRGtx8ayaJ712VfrS01esvGj1fAhEcV/8EpIv77Dem?=
 =?us-ascii?Q?aQMvCDIDB9xzawQMyQbX8vGLTIl5q6wIwXdLlABMmkvBoc96sbWg5vXDOX+x?=
 =?us-ascii?Q?hDeW3APxhJkO4CO27S5ea/zLCHO7uzwkk6nOSkUmHBVG/lYYSWFjjZ7ZcE8V?=
 =?us-ascii?Q?imcruP/ZA7RiK05aBTgiCQIokZsYrRA+qxxIKjWxSFjIsNJvtgVPKomQAKy3?=
 =?us-ascii?Q?HHGCeCKvjPAlVO/V0rsjUxDCszAKPK9mHc6nyOi2n4cnvfFWd3JgPI8gbkPs?=
 =?us-ascii?Q?Hh8k1htz538FxZ/EMOIKBMu79PdInzpmk/UhDCsOl8OO9N5uBE1avJYogJ9S?=
 =?us-ascii?Q?EPdtCTbEgNYA4ekwjKjAkdI4NEPoC1LCo4Wh3KhVzJ35uNaNjXW5OIYrXI82?=
 =?us-ascii?Q?bUv8xuXenyuVShK62ISK4ACUNd48fxoHotiXXVObPGsUft6EuLnBFu6Ida/d?=
 =?us-ascii?Q?vcFO3weStoXjwugZORD4j+5J1/1H1RECD8g6OA/sH5CVr3dciGgW5sLPGumi?=
 =?us-ascii?Q?l63N/nM/?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46db2a7c-6ea1-4218-1fbd-08d8c16230d2
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2021 18:51:14.4381 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G4yX5Hm8UwNcO1RC0Djsr1bInt5ON4aYwth+lYEchrZiI1yW4l0mRndVr1skdck2Ug9O6EUCB47bLy4/WZmEfOVItWx4TiaHlBMK32LNtZw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4405
Received-SPF: pass client-ip=40.107.21.101;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

v9:
01: new, one more whitespace-fixing patch
testenv: allow case when we don't have system-arch emulator, but have several for another architectures
         change direct os.access(..., os.X_OK) calls to new helper function which also check that path is a file
testrunner: s/fail/not run/ for 'No qualified output'
            drop elapsed time arg for one of 'not run' results (now no elapsed time for any 'not run' result)

Vladimir Sementsov-Ogievskiy (6):
  iotests: 146: drop extra whitespaces from .out file
  iotests: add findtests.py
  iotests: add testenv.py
  iotests: add testrunner.py
  iotests: rewrite check into python
  iotests: rename and move 169 and 199 tests

 docs/devel/testing.rst                        |   50 +-
 Makefile                                      |    1 -
 tests/check-block.sh                          |    2 +-
 tests/qemu-iotests/146.out                    |  780 ++++++------
 tests/qemu-iotests/check                      | 1095 ++---------------
 tests/qemu-iotests/common.env.in              |    3 -
 tests/qemu-iotests/findtests.py               |  159 +++
 tests/qemu-iotests/group                      |  321 -----
 tests/qemu-iotests/iotests.py                 |    8 +
 tests/qemu-iotests/meson.build                |    3 -
 tests/qemu-iotests/testenv.py                 |  279 +++++
 tests/qemu-iotests/testrunner.py              |  366 ++++++
 .../migrate-bitmaps-postcopy-test}            |    0
 .../migrate-bitmaps-postcopy-test.out}        |    0
 .../{169 => tests/migrate-bitmaps-test}       |    0
 .../migrate-bitmaps-test.out}                 |    0
 16 files changed, 1381 insertions(+), 1686 deletions(-)
 delete mode 100644 tests/qemu-iotests/common.env.in
 create mode 100644 tests/qemu-iotests/findtests.py
 delete mode 100644 tests/qemu-iotests/group
 create mode 100644 tests/qemu-iotests/testenv.py
 create mode 100644 tests/qemu-iotests/testrunner.py
 rename tests/qemu-iotests/{199 => tests/migrate-bitmaps-postcopy-test} (100%)
 rename tests/qemu-iotests/{199.out => tests/migrate-bitmaps-postcopy-test.out} (100%)
 rename tests/qemu-iotests/{169 => tests/migrate-bitmaps-test} (100%)
 rename tests/qemu-iotests/{169.out => tests/migrate-bitmaps-test.out} (100%)

-- 
2.29.2


