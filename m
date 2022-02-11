Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 411D74B2765
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 14:49:37 +0100 (CET)
Received: from localhost ([::1]:48790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIWIp-00057E-QQ
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 08:49:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nIVt6-0000ZF-BT; Fri, 11 Feb 2022 08:23:00 -0500
Received: from [2a01:111:f400:fe0c::726] (port=41871
 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nIVt3-0008I0-2h; Fri, 11 Feb 2022 08:22:59 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SJE7brtNHzIKqDF1mqvkLEfPHZcZAjdzfImQn7QtxiYfrz66XGmNnXto2xvL980ZxSmrOr1GekvvdQJ3sh1vxkA1Kg53ocTWwou77gns8dKFbLVdsUFkd1b74fSJDnBCWV1x49fl4vLDPxxukZCRhJ3ynbbzk9qzxo22+uwd9d1dhPHmNSuLZEGXPU6piw4RbYwNaUjORixJSUkz901FUO2K16vuJR77ffkf0JPKFEhJHZYLyjeYbReatRQX/wyX6e88U6YA915AHo7aoIku4rhv6ez0ohe/VT5tyb8ssqse25N1MmVpbNx+9F66CNNsicR4QjKCRi/25gPrXAeonw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=67vtTUc9X2x935hlGjkKgiWVhNV3LVLoqjA5uXMZ1Ls=;
 b=bJGRz12GZD8thnCIMUtBd6U3Okfkc8nroZR+LfKHPGbc8G3k3CcfCSnYWPzaKOSmfdA0nAGpcoEn/O81sdpowPRQmHi+mx+4FWRPmfuvXpy8rmDwZUaIhHcIBHfHnwwKlO4KUajSe5e18qAvuJaiC37MAHxzV6ZJAuL81DdGArMrLjHB4Y9x0N9yKFjWO3f1MIhjLu30ieVJCiXGFxTrzs670F8/IzhNVGis82KK+rvponOYvJDvJSM22iUt0s6TYJMlFX/l+nxBWse0lLMMf2SVzWZKU4f76hmhmE0skmagLXfI4ZW9Ku6UlDjHfEZBg7g1bBdg9gyeAvvdnlZpgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=67vtTUc9X2x935hlGjkKgiWVhNV3LVLoqjA5uXMZ1Ls=;
 b=d9allmc5JcvQWpmQm8VQfPadiCvIvGzTNTCON8HxPBHENfD5in9r36KyxkzZJuH6NBQZUVLCIDMXSBBZVMrnx7CctN4lvL4XKzGFRP9Tr7njZDo/tqxlbICLwOFHKh/N3cRdnZjHAmGSoUzKuhoWQwLZiGDAdUg2nQ7+0WxCALE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by DB7PR08MB3865.eurprd08.prod.outlook.com (2603:10a6:10:74::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Fri, 11 Feb
 2022 13:22:50 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%4]) with mapi id 15.20.4975.011; Fri, 11 Feb 2022
 13:22:50 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, richard.henderson@linaro.org,
 peter.maydell@linaro.org, vsementsov@virtuozzo.com, eblake@redhat.com
Subject: [PULL v2 0/7] nbd: handle AioContext change correctly
Date: Fri, 11 Feb 2022 14:22:33 +0100
Message-Id: <20220211132240.781958-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM5PR0601CA0048.eurprd06.prod.outlook.com
 (2603:10a6:203:68::34) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8593211c-23dd-4cc7-d6e9-08d9ed619a4d
X-MS-TrafficTypeDiagnostic: DB7PR08MB3865:EE_
X-Microsoft-Antispam-PRVS: <DB7PR08MB3865FC6AC5FC9FCF68350C9CC1309@DB7PR08MB3865.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:83;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TjvTmcICwosJ/OanIHHw4H5ywo35pDvV2OTL2ULoZl51VJf+lpi/n9Q/UFscs9hQYPcbnnkod9N5+aYJjZWSx3yjV8ov2mJHHyA9apKuWmPQj+EbmEMP3FTBh2bZhemCZcQg33mKr160Z3CiTySs8+6F5D7yTTvwbxhC2eFtaV7MA4KSETWUmVVMrZ4OMO2IGiGL9/zoyEnHTjxhZ6HfJpoawE2EvldgVSzwhPt3tccZYJe4uqSrRaZNYbpit0Hwek8Lt3u4CJrgbmkln8elzDYsUNJJgqbtiMAEDDagOXL49bs0IRWiDCm6/efolgktXNHOEfbwnx2oa/GNb0f+GFyBJO7/fXWfhvatzb1vbixa1o6kRT1aRV1byIjhVahfTxeHMNM79z0ptYTfp8usCn98zszLQiJyZbPXLxtPy4UiDAwLMCszPqEJKV+BQ4XHreGvw7iTET5+g8aQxC962Ep2acYZSCUbcvQtV9jryQnZCl1QfgWGOxgXmPoOl6wZkHkHNuPclGW94VN1Yx/zlXMrLgREE/pvmPWbcZs50SFkZmosz+5OCNgt5dfUJTmjgbupHUhJP+8La+2lWaJkb8si/LNNhbKXWdFMdUX85wlFcLpmcLXPulxxCW33ssHNijUl6iAa7jHM5F97qj+TW4SR0itBFgEVQ/taVxeZMvX4SVFqHfyLgAukBrzeNHkrULIbzWQ4DFL78CH2XD+qt6Jf5jlR1dnOqgGWqta5e2c8++mea1a2zdyuDjKubAR1/pI1UQb/wFKw9qEHoJOh7g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(316002)(6916009)(2906002)(38100700002)(86362001)(508600001)(38350700002)(966005)(6486002)(36756003)(83380400001)(52116002)(186003)(26005)(5660300002)(6666004)(1076003)(8936002)(4326008)(6506007)(8676002)(66946007)(66556008)(6512007)(2616005)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3+AB+8I5GHT7AyYbJaB1Qte5xSTeA98JpOnqAGOM3AyyTIanVM9EYfvMhHL5?=
 =?us-ascii?Q?HU1PZIlWlfZba51B7sBqRbpj5uoCDnlDdrqJ0taHSG7FjvOGSARX+Or8Xm/R?=
 =?us-ascii?Q?uJBmHJZBEu0H3ZN9ljWDUstpBgcrnzCzcQM22PbeOu5QS0QsFu/E0JKefDiH?=
 =?us-ascii?Q?VoaiokcAdXICn3btm/sp+FyRt11RB90Bl2fnr5eYHgIPVdFdHp57Et7vPUSe?=
 =?us-ascii?Q?jO8WtkdjHCi8jQjhaQebNEIdvxBHzTpwvwyEkfQYtrK2Q9xo396nYkvx8+iJ?=
 =?us-ascii?Q?USqMg+/7ZXylrtFsmbfSt1BCN1EQurdeTsPBWeApUtwKA0LYVXP4UVi/lVdu?=
 =?us-ascii?Q?8pn7fkN4iIaVwYOGfPCUdtDOyrrUWdoE4TgL/oDsYK/xdkIZVTFu5haPeVED?=
 =?us-ascii?Q?iFzPuL4i0Xjku+E6EsmpDrTGZThSBW4MMV63dJv/afTe+hCh35rf17qNbENr?=
 =?us-ascii?Q?lk03RyMazYGlqjquZjOt+dHgGUfUmhz6awLcHYYYRRZUdnq+3noTImQ2BoRX?=
 =?us-ascii?Q?ujQBJDRiL5KbyD1i+oIMY4iem57dPSC0pwM9LX9XZCSvCaoSGRNnBJj9aAhe?=
 =?us-ascii?Q?wvuSmrL/3tvRQKbK29vaXGXDxvEoJvieCQkQz5dnxBFF/8Qdtf06LReeMvf7?=
 =?us-ascii?Q?1EG/YqtnLLqRy89/5H+3SyTHOAN0hfldMg6w4EDRag028whqfb2V3R38ebr0?=
 =?us-ascii?Q?ZqR/2n3aTMXzePcCdNyTfodtmXObkmuiF1yW9fFEg2wzDcuvy+5FIf1HrejN?=
 =?us-ascii?Q?ulOVzASaM46K0EEs50iVfAdKttSzNBoT9whgqLUT68wfok8TkZEO8gZ0epMV?=
 =?us-ascii?Q?5hnntK/omnF3b6Jj81B/nXB9KAK1/GO+qQY/uJ57Evs/KOqLXr3VW5VYEryj?=
 =?us-ascii?Q?dQiZia3XLL3934yFDl0sJoC5BxZhgDtgN7WkxDNWHCyYxIn+++nZqLu4ufXN?=
 =?us-ascii?Q?IZorw5baHykWnK9hiAOqi9xNbyN0CFGd/TrN+u+TxccvOrW99OfQWJvbRRMc?=
 =?us-ascii?Q?ZvXe/D7qAy75rtiy9h8miwgo1KS9y+yErDlYBM58ju+3XkKbcwJfarA7fx2i?=
 =?us-ascii?Q?XfAmGunkOZ8HUIbW/5E/VUusKeOsirXaAOVG5pa6U67k/Sr3u22xyrLDV2FC?=
 =?us-ascii?Q?FH6kL3CyScMvoBS/aDQjNRemNDviSlA5+UCnA+KfTsG5PjRq5bcsExumg6gQ?=
 =?us-ascii?Q?5VpYTgqlAotq41+7tVJC2OqxEn4y1gJMzhS4wK6HgX4oWOMWaWXLpqHa7a5H?=
 =?us-ascii?Q?7vsp9k3O7vlUgVrGk0L9xp4NTLdVh/y02e8GySZH4DF7x0bzt0/nXRf9fbXL?=
 =?us-ascii?Q?x8maosp3/j71muEyvVVCRnGJdh1rNyP1kF6unVEmgRM+f68Gglc5Z65CLzjb?=
 =?us-ascii?Q?FEIFsbWZ5ELZnELl/MhHohZhjKlOixs2V8adCzALoIsq6lwp9l1aMbg6mNxX?=
 =?us-ascii?Q?l0rwBGLXM0P6zkaUM+ytL1mGzruQETOanAqB67XMixr51/x5ArqjzM/38UuD?=
 =?us-ascii?Q?wAxZy2Ymw9ilPLHgFOBlajHQYgzAojnkdjobSogJekXQg9lJIWYTJeJqKdvs?=
 =?us-ascii?Q?RJpBXjZNNHnsV4aw9LaPibDx1V4XCgU6Cjf7gGYNdP1CdB9p0hnGSL1i/3UW?=
 =?us-ascii?Q?mcSuw/tdcqAtueAN+NifCy/PY/LF1POsSZr5awkL9y84RqCE9A9wXek+eXcN?=
 =?us-ascii?Q?BrPglw=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8593211c-23dd-4cc7-d6e9-08d9ed619a4d
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2022 13:22:50.7288 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2O9Ct42sF/oEK9+rgjHPlhmDMfyP+hS/oMOm4GY0tOJb5YfPsnayPxYMa8lcjiH7WegdFU98PHU03Eb/GSspnVIxtO7O7IutzlhCuORIFfI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3865
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:fe0c::726
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:fe0c::726;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

The following changes since commit 0a301624c2f4ced3331ffd5bce85b4274fe132af:

  Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20220208' into staging (2022-02-08 11:40:08 +0000)

are available in the Git repository at:

  https://src.openvz.org/scm/~vsementsov/qemu.git tags/pull-nbd-2022-02-09-v2

for you to fetch changes up to 8cfbe929e8c26050f0a4580a1606a370a947d4ce:

  iotests/281: Let NBD connection yield in iothread (2022-02-11 14:06:18 +0100)

----------------------------------------------------------------
nbd: handle AioContext change correctly

v2: add my s-o-b marks to each commit

----------------------------------------------------------------

Hanna Reitz (7):
  block/nbd: Delete reconnect delay timer when done
  block/nbd: Delete open timer when done
  block/nbd: Assert there are no timers when closed
  iotests.py: Add QemuStorageDaemon class
  iotests/281: Test lingering timers
  block/nbd: Move s->ioc on AioContext change
  iotests/281: Let NBD connection yield in iothread

 block/nbd.c                   |  64 +++++++++++++++++++++
 tests/qemu-iotests/281        | 101 +++++++++++++++++++++++++++++++++-
 tests/qemu-iotests/281.out    |   4 +-
 tests/qemu-iotests/iotests.py |  40 ++++++++++++++
 4 files changed, 205 insertions(+), 4 deletions(-)

-- 
2.31.1


