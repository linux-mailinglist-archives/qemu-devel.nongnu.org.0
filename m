Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4792F8D73
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Jan 2021 14:47:53 +0100 (CET)
Received: from localhost ([::1]:35850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0lvk-0004ze-MA
	for lists+qemu-devel@lfdr.de; Sat, 16 Jan 2021 08:47:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l0lt7-00036r-DJ; Sat, 16 Jan 2021 08:45:09 -0500
Received: from mail-eopbgr60109.outbound.protection.outlook.com
 ([40.107.6.109]:49662 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l0lt1-0007U8-KJ; Sat, 16 Jan 2021 08:45:08 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eSBiX9eMcd7xHY8iFSb00M/8m2nFxKYZNWpYZVfMZ+bMvDdOsukuuWdX3fdu6+qfcsHTRsPhVBKc0SZ4liHEiKoyoeYrDCZBdbp39hkLgCUAFHb1FqKV8f3iF7AOlzMNS5sPtbq3W0/eDgMttNRlfpOluACaF2e6AQODotKzDHwubkJl+XN6sA3skhscSeDpn8C3Ob13Hv/ALKSVv6Y6iEje3okGdCnoy/ypv020JHelHQJ9p+o0JURIOjKbhzSnK0WlVq5LpJQwNg512pE/fbJlrO1WyzOuovv+g7WXTVuqVVE+4Ifhjko+lh2+9skz7Z5WOFT3IfgQzIUV/QZFgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6C4w9qxTpaXEau8bMi2mMQBj23TfWmoW5XG3QxZG6nk=;
 b=TqRPSa9TkNKzEyGR6Dg6LTaaB5wNFwh+Z9rN7UeQ31dY+8Q8GlxHN3e5rmdyzdTMZCNkNo2URPKsL+fSHRXSXSrtMnezh3vZFlZErcCX7xtjyB28Nonl4V04HktQOnF6ottUiPcO7oKEZiHo+peGMnL4dRck5qsR7DVeZFFcQqrJpgGr7uaMX7Rz+SrSQX2dfOtdDz8DbuGTaQDxdsH4MuBY5vq/aeryC2g1FOfglx2lHyhKMqDnw6G1fNa16yHLGnTykg9Q0Bg00tqGmAzrYi7lehic3gRgmWqLHt0PjrNg24yWjw00FCr6gH4hxUYvl5Se9GFvQt1Hds3GKFy8Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6C4w9qxTpaXEau8bMi2mMQBj23TfWmoW5XG3QxZG6nk=;
 b=JSmRUh3C1WCrCoyOOz8T6enhihkv10ZBNf3wYGKCLVU7WgUnyGGWfxFJA6Ah8nrO0iLMHQ4KV7vNRV6F7NwkyjjWFt6HfTLVhBQWT9Y1TI0V5PEep47QwR4Yz4vZ/OnyGiJ0YTeUY8nY3Z2ZjyetADUwhJ8Q+6c4F6MJMQc8pLA=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB2098.eurprd08.prod.outlook.com (2603:10a6:203:4a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Sat, 16 Jan
 2021 13:44:59 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%9]) with mapi id 15.20.3763.013; Sat, 16 Jan 2021
 13:44:59 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v7 00/11] Rework iotests/check
Date: Sat, 16 Jan 2021 16:44:13 +0300
Message-Id: <20210116134424.82867-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.72]
X-ClientProxiedBy: AM4PR0701CA0019.eurprd07.prod.outlook.com
 (2603:10a6:200:42::29) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.72) by
 AM4PR0701CA0019.eurprd07.prod.outlook.com (2603:10a6:200:42::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.4 via Frontend
 Transport; Sat, 16 Jan 2021 13:44:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c2f83aea-a4bd-415c-57a9-08d8ba24eaa3
X-MS-TrafficTypeDiagnostic: AM5PR0801MB2098:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB20988F1CB7DA37BFFE762011C1A60@AM5PR0801MB2098.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: k1lySoRwcJHFF5pIDogt3i5ZMJ4eRA/BaGK0vZl+BpsFV446SkKi0EdH2/8uzZPkHB6uYoaF27WTckDL/o9Hjzm8oo/W8QGZpYN/GbqDJbhi7y8UU5KD4oL7pbMX1XfVTr4pOsuQqbEZa1ssQXyvD4rea3mce+ua5yV8f65zQMPD6RK5lIDWeA5F6qA/xem3G/yPDBFdl9v+JqwbgpWlaGRjeAAEg47AKnL4tkg2D3ONMea0tF6wlAne3OhCe/uj7hzzy+aX02tdbq84Gob1LAkDo6iDfPaGV73wNZ1OIYbuOkt7MvFqE3ADnzDHumeSe2FWCMwGDnj2SKJsOThWoOoUQeNfpTFcgcvGZQHBnwveTOMn67Eurarf1/L4ghUhgcLP4KbxV7WnsSpZ5YGIh2uDt/MJfyC+Khz+YLl4RNlaGIOPn4JhKCkO5YL4GQogJKPsKlBsvaFLr6csNrspO2WqdHIQqaLSUcfFKFt92xl+7ZDBFFWXbpENHbKx29CBpModaOgzmXDKMyacDCqzSw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(366004)(376002)(346002)(39830400003)(6916009)(36756003)(83380400001)(66946007)(6666004)(6512007)(86362001)(30864003)(1076003)(66556008)(5660300002)(6486002)(66476007)(6506007)(478600001)(4326008)(8676002)(8936002)(956004)(2906002)(52116002)(186003)(16526019)(316002)(26005)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?qH/bxZop+o3dD+cSbISaaIjo+jhyZ0jtErBq6pJunoXgXALLt3cdAP4v5xiG?=
 =?us-ascii?Q?83tUMzQfSq46uM0zwSOaMuMcGfUWfGSEsHAje7IYqCzNKjq/HIqQmefjCK0j?=
 =?us-ascii?Q?ExA9+ljDoR6Im2n6VdD0IxxVZkmSZ4s2pwFhcaWUzYAijtsIMneIuIH74Nnx?=
 =?us-ascii?Q?1Y7bINajnV5RzNQp1Ve45F2OHZ4LLmXqf+lGoE+bj9AxZ3lw/A2SuJ5cXB29?=
 =?us-ascii?Q?BO8fPOvSzn6a9C948esUKniCTJzbiwwiW/DlaBfa8V4Rc6uEROsSXLsnt4tb?=
 =?us-ascii?Q?qQ0q/Z+E54l007kmHbBH3RB7iGsq2O9J4I9jvNNRgZ7HC0ESR2TmRgSJiunH?=
 =?us-ascii?Q?gWhl00qlm2b+OgHTyPo9LrBuALjUfbZ8+qqGwYPf0kzFnV6Sn269u7cRHciI?=
 =?us-ascii?Q?DU+y891aks5nN+E+CgzZpy02Tt/gK9A8IzDnrRcqBoC2p+waDh3l0z8LYO3R?=
 =?us-ascii?Q?O0hMwr4Fmp06YtXC+A0g33FCe2L2/8bl62BZKJ/dC+JLWVCdsfthRC4evY75?=
 =?us-ascii?Q?gjzZ4O9qvrpCzMFn7rxD5KCxIv55ZfMaRDrCFQkUTZGlI2Yap8uH02PLtlWV?=
 =?us-ascii?Q?cMfbc2+Wh2Gg8CDNX8kykc0U/8dvzchxQst7pqUCh5Gw2Wom8Xda0YGTbWAu?=
 =?us-ascii?Q?uyvNpHs1f4+MgLMDWG1ueXF3FlFEk4AglKO48S2VYsVYyKAMC5emI1TuW88v?=
 =?us-ascii?Q?DGkNm8U0AQ590Aa+7yHCaB3ngwWkAYL8SGQSOdRyu8z0c54bdRuasfErDB6d?=
 =?us-ascii?Q?DfPW9dWEyt1DXmB5Xh5XsUmZEd9P22yErLe8kXdeRxiRKmJAyg9rgQSe/2sX?=
 =?us-ascii?Q?C5VYENwfftBM7oBm4Z53UScA71az8cAAb0fQ5ZHqZlPu2aC9jaX/ADIDZLW3?=
 =?us-ascii?Q?XUd8U59uK/1vSMef5g08ikA6KxwB3iTcXIHcCK918fiSPki4sUKqcAhJE2Gk?=
 =?us-ascii?Q?P/RnIoDXgvQ2puyJ22qhhSN67L6VgXe6LIEEbuQrydoOU8c/4xx4NX2KfqBh?=
 =?us-ascii?Q?Q8AB?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2f83aea-a4bd-415c-57a9-08d8ba24eaa3
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2021 13:44:59.3656 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0thbKYLQV1toM2y/lGS++9CES5JR+yCGTX2e9URsBlputw2VwR9ZWlXC5OFlQovxK7YRPn6ScE64WeQbNRyUx+e/Hh2ZHO+39LTLczT0EU8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB2098
Received-SPF: pass client-ip=40.107.6.109;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all!

These series has 3 goals:

 - get rid of group file (to forget about rebase and in-list conflicts)
 - introduce human-readable names for tests
 - rewrite check into python

v7:
  - fix wording and grammar
  - satisfy python linters
  - move argv interfaces all into one in new check script
  - support '-n' == '--dry-run' option
  - update check-block to run check with correct PYTHON

 findtests: - stop parsing test file after first '# group: ' line
            - use parse_test_name in add_group_file()
            - make new list instead of modifying parameter exclude_groups

 testenv: - fix machine_map
          - fix self.python

 testrunner: use env.python to run python tests

Vladimir Sementsov-Ogievskiy (11):
  iotests/277: use dot slash for nbd-fault-injector.py running
  iotests/303: use dot slash for qcow2.py running
  iotests: fix some whitespaces in test output files
  iotests: make tests executable
  iotests/294: add shebang line
  iotests: define group in each iotest
  iotests: add findtests.py
  iotests: add testenv.py
  iotests: add testrunner.py
  iotests: rewrite check into python
  iotests: rename and move 169 and 199 tests

 docs/devel/testing.rst                        |   50 +-
 Makefile                                      |    1 -
 tests/check-block.sh                          |    2 +-
 tests/qemu-iotests/001                        |    1 +
 tests/qemu-iotests/002                        |    1 +
 tests/qemu-iotests/003                        |    1 +
 tests/qemu-iotests/004                        |    1 +
 tests/qemu-iotests/005                        |    1 +
 tests/qemu-iotests/007                        |    1 +
 tests/qemu-iotests/008                        |    1 +
 tests/qemu-iotests/009                        |    1 +
 tests/qemu-iotests/010                        |    1 +
 tests/qemu-iotests/011                        |    1 +
 tests/qemu-iotests/012                        |    1 +
 tests/qemu-iotests/013                        |    1 +
 tests/qemu-iotests/014                        |    1 +
 tests/qemu-iotests/015                        |    1 +
 tests/qemu-iotests/017                        |    1 +
 tests/qemu-iotests/018                        |    1 +
 tests/qemu-iotests/019                        |    1 +
 tests/qemu-iotests/020                        |    1 +
 tests/qemu-iotests/021                        |    1 +
 tests/qemu-iotests/022                        |    1 +
 tests/qemu-iotests/023                        |    1 +
 tests/qemu-iotests/024                        |    1 +
 tests/qemu-iotests/025                        |    1 +
 tests/qemu-iotests/026                        |    1 +
 tests/qemu-iotests/027                        |    1 +
 tests/qemu-iotests/028                        |    1 +
 tests/qemu-iotests/029                        |    1 +
 tests/qemu-iotests/030                        |    1 +
 tests/qemu-iotests/031                        |    1 +
 tests/qemu-iotests/032                        |    1 +
 tests/qemu-iotests/033                        |    1 +
 tests/qemu-iotests/034                        |    1 +
 tests/qemu-iotests/035                        |    1 +
 tests/qemu-iotests/036                        |    1 +
 tests/qemu-iotests/037                        |    1 +
 tests/qemu-iotests/038                        |    1 +
 tests/qemu-iotests/039                        |    1 +
 tests/qemu-iotests/040                        |    1 +
 tests/qemu-iotests/041                        |    1 +
 tests/qemu-iotests/042                        |    1 +
 tests/qemu-iotests/043                        |    1 +
 tests/qemu-iotests/044                        |    1 +
 tests/qemu-iotests/045                        |    1 +
 tests/qemu-iotests/046                        |    1 +
 tests/qemu-iotests/047                        |    1 +
 tests/qemu-iotests/048                        |    1 +
 tests/qemu-iotests/049                        |    1 +
 tests/qemu-iotests/050                        |    1 +
 tests/qemu-iotests/051                        |    1 +
 tests/qemu-iotests/052                        |    1 +
 tests/qemu-iotests/053                        |    1 +
 tests/qemu-iotests/054                        |    1 +
 tests/qemu-iotests/055                        |    1 +
 tests/qemu-iotests/056                        |    1 +
 tests/qemu-iotests/057                        |    1 +
 tests/qemu-iotests/058                        |    1 +
 tests/qemu-iotests/059                        |    1 +
 tests/qemu-iotests/060                        |    1 +
 tests/qemu-iotests/061                        |    1 +
 tests/qemu-iotests/062                        |    1 +
 tests/qemu-iotests/063                        |    1 +
 tests/qemu-iotests/064                        |    1 +
 tests/qemu-iotests/065                        |    1 +
 tests/qemu-iotests/066                        |    1 +
 tests/qemu-iotests/068                        |    1 +
 tests/qemu-iotests/069                        |    1 +
 tests/qemu-iotests/070                        |    1 +
 tests/qemu-iotests/071                        |    1 +
 tests/qemu-iotests/072                        |    1 +
 tests/qemu-iotests/073                        |    1 +
 tests/qemu-iotests/074                        |    1 +
 tests/qemu-iotests/075                        |    1 +
 tests/qemu-iotests/076                        |    1 +
 tests/qemu-iotests/077                        |    1 +
 tests/qemu-iotests/078                        |    1 +
 tests/qemu-iotests/079                        |    1 +
 tests/qemu-iotests/080                        |    1 +
 tests/qemu-iotests/081                        |    1 +
 tests/qemu-iotests/082                        |    1 +
 tests/qemu-iotests/083                        |    1 +
 tests/qemu-iotests/084                        |    1 +
 tests/qemu-iotests/085                        |    1 +
 tests/qemu-iotests/086                        |    1 +
 tests/qemu-iotests/087                        |    1 +
 tests/qemu-iotests/088                        |    1 +
 tests/qemu-iotests/089                        |    1 +
 tests/qemu-iotests/090                        |    1 +
 tests/qemu-iotests/091                        |    1 +
 tests/qemu-iotests/092                        |    1 +
 tests/qemu-iotests/093                        |    1 +
 tests/qemu-iotests/094                        |    1 +
 tests/qemu-iotests/095                        |    1 +
 tests/qemu-iotests/096                        |    1 +
 tests/qemu-iotests/097                        |    1 +
 tests/qemu-iotests/098                        |    1 +
 tests/qemu-iotests/099                        |    1 +
 tests/qemu-iotests/101                        |    1 +
 tests/qemu-iotests/102                        |    1 +
 tests/qemu-iotests/103                        |    1 +
 tests/qemu-iotests/104                        |    1 +
 tests/qemu-iotests/105                        |    1 +
 tests/qemu-iotests/106                        |    1 +
 tests/qemu-iotests/107                        |    1 +
 tests/qemu-iotests/108                        |    1 +
 tests/qemu-iotests/109                        |    1 +
 tests/qemu-iotests/110                        |    1 +
 tests/qemu-iotests/111                        |    1 +
 tests/qemu-iotests/112                        |    1 +
 tests/qemu-iotests/113                        |    1 +
 tests/qemu-iotests/114                        |    1 +
 tests/qemu-iotests/115                        |    1 +
 tests/qemu-iotests/116                        |    1 +
 tests/qemu-iotests/117                        |    1 +
 tests/qemu-iotests/118                        |    1 +
 tests/qemu-iotests/119                        |    1 +
 tests/qemu-iotests/120                        |    1 +
 tests/qemu-iotests/121                        |    1 +
 tests/qemu-iotests/122                        |    1 +
 tests/qemu-iotests/123                        |    1 +
 tests/qemu-iotests/124                        |    1 +
 tests/qemu-iotests/125                        |    1 +
 tests/qemu-iotests/126                        |    1 +
 tests/qemu-iotests/127                        |    1 +
 tests/qemu-iotests/128                        |    1 +
 tests/qemu-iotests/129                        |    1 +
 tests/qemu-iotests/130                        |    1 +
 tests/qemu-iotests/131                        |    1 +
 tests/qemu-iotests/132                        |    1 +
 tests/qemu-iotests/133                        |    1 +
 tests/qemu-iotests/134                        |    1 +
 tests/qemu-iotests/135                        |    1 +
 tests/qemu-iotests/136                        |    1 +
 tests/qemu-iotests/137                        |    1 +
 tests/qemu-iotests/138                        |    1 +
 tests/qemu-iotests/139                        |    1 +
 tests/qemu-iotests/140                        |    1 +
 tests/qemu-iotests/141                        |    1 +
 tests/qemu-iotests/143                        |    1 +
 tests/qemu-iotests/144                        |    1 +
 tests/qemu-iotests/145                        |    1 +
 tests/qemu-iotests/146                        |    1 +
 tests/qemu-iotests/147                        |    1 +
 tests/qemu-iotests/148                        |    1 +
 tests/qemu-iotests/149                        |    1 +
 tests/qemu-iotests/150                        |    1 +
 tests/qemu-iotests/151                        |    1 +
 tests/qemu-iotests/152                        |    1 +
 tests/qemu-iotests/153                        |    1 +
 tests/qemu-iotests/154                        |    1 +
 tests/qemu-iotests/155                        |    1 +
 tests/qemu-iotests/156                        |    1 +
 tests/qemu-iotests/157                        |    1 +
 tests/qemu-iotests/158                        |    1 +
 tests/qemu-iotests/159                        |    1 +
 tests/qemu-iotests/160                        |    1 +
 tests/qemu-iotests/161                        |    1 +
 tests/qemu-iotests/162                        |    1 +
 tests/qemu-iotests/163                        |    1 +
 tests/qemu-iotests/165                        |    1 +
 tests/qemu-iotests/170                        |    1 +
 tests/qemu-iotests/171                        |    1 +
 tests/qemu-iotests/172                        |    1 +
 tests/qemu-iotests/173                        |    1 +
 tests/qemu-iotests/174                        |    1 +
 tests/qemu-iotests/175                        |    1 +
 tests/qemu-iotests/175.out                    |    2 +-
 tests/qemu-iotests/176                        |    1 +
 tests/qemu-iotests/177                        |    1 +
 tests/qemu-iotests/178                        |    1 +
 tests/qemu-iotests/179                        |    1 +
 tests/qemu-iotests/181                        |    1 +
 tests/qemu-iotests/182                        |    1 +
 tests/qemu-iotests/183                        |    1 +
 tests/qemu-iotests/184                        |    1 +
 tests/qemu-iotests/185                        |    1 +
 tests/qemu-iotests/186                        |    1 +
 tests/qemu-iotests/187                        |    1 +
 tests/qemu-iotests/188                        |    1 +
 tests/qemu-iotests/189                        |    1 +
 tests/qemu-iotests/190                        |    1 +
 tests/qemu-iotests/191                        |    1 +
 tests/qemu-iotests/192                        |    1 +
 tests/qemu-iotests/194                        |    1 +
 tests/qemu-iotests/195                        |    1 +
 tests/qemu-iotests/196                        |    1 +
 tests/qemu-iotests/197                        |    1 +
 tests/qemu-iotests/198                        |    1 +
 tests/qemu-iotests/200                        |    1 +
 tests/qemu-iotests/201                        |    1 +
 tests/qemu-iotests/202                        |    1 +
 tests/qemu-iotests/203                        |    1 +
 tests/qemu-iotests/204                        |    1 +
 tests/qemu-iotests/205                        |    1 +
 tests/qemu-iotests/206                        |    1 +
 tests/qemu-iotests/207                        |    1 +
 tests/qemu-iotests/208                        |    1 +
 tests/qemu-iotests/209                        |    1 +
 tests/qemu-iotests/210                        |    1 +
 tests/qemu-iotests/211                        |    1 +
 tests/qemu-iotests/212                        |    1 +
 tests/qemu-iotests/213                        |    1 +
 tests/qemu-iotests/214                        |    1 +
 tests/qemu-iotests/215                        |    1 +
 tests/qemu-iotests/216                        |    1 +
 tests/qemu-iotests/217                        |    1 +
 tests/qemu-iotests/218                        |    1 +
 tests/qemu-iotests/219                        |    1 +
 tests/qemu-iotests/220                        |    1 +
 tests/qemu-iotests/221                        |    1 +
 tests/qemu-iotests/222                        |    1 +
 tests/qemu-iotests/223                        |    1 +
 tests/qemu-iotests/224                        |    1 +
 tests/qemu-iotests/225                        |    1 +
 tests/qemu-iotests/226                        |    1 +
 tests/qemu-iotests/227                        |    1 +
 tests/qemu-iotests/228                        |    1 +
 tests/qemu-iotests/229                        |    1 +
 tests/qemu-iotests/231                        |    1 +
 tests/qemu-iotests/232                        |    1 +
 tests/qemu-iotests/233                        |    1 +
 tests/qemu-iotests/234                        |    1 +
 tests/qemu-iotests/235                        |    1 +
 tests/qemu-iotests/236                        |    1 +
 tests/qemu-iotests/237                        |    1 +
 tests/qemu-iotests/238                        |    1 +
 tests/qemu-iotests/239                        |    1 +
 tests/qemu-iotests/240                        |    1 +
 tests/qemu-iotests/241                        |    1 +
 tests/qemu-iotests/242                        |    1 +
 tests/qemu-iotests/243                        |    1 +
 tests/qemu-iotests/244                        |    1 +
 tests/qemu-iotests/245                        |    1 +
 tests/qemu-iotests/246                        |    1 +
 tests/qemu-iotests/247                        |    1 +
 tests/qemu-iotests/248                        |    1 +
 tests/qemu-iotests/249                        |    1 +
 tests/qemu-iotests/250                        |    1 +
 tests/qemu-iotests/251                        |    1 +
 tests/qemu-iotests/252                        |    1 +
 tests/qemu-iotests/253                        |    1 +
 tests/qemu-iotests/254                        |    1 +
 tests/qemu-iotests/255                        |    1 +
 tests/qemu-iotests/256                        |    1 +
 tests/qemu-iotests/257                        |    1 +
 tests/qemu-iotests/258                        |    1 +
 tests/qemu-iotests/259                        |    1 +
 tests/qemu-iotests/260                        |    1 +
 tests/qemu-iotests/261                        |    1 +
 tests/qemu-iotests/262                        |    1 +
 tests/qemu-iotests/263                        |    1 +
 tests/qemu-iotests/264                        |    1 +
 tests/qemu-iotests/265                        |    1 +
 tests/qemu-iotests/266                        |    1 +
 tests/qemu-iotests/267                        |    1 +
 tests/qemu-iotests/268                        |    1 +
 tests/qemu-iotests/270                        |    1 +
 tests/qemu-iotests/271                        |    1 +
 tests/qemu-iotests/271.out                    |   12 +-
 tests/qemu-iotests/272                        |    1 +
 tests/qemu-iotests/273                        |    1 +
 tests/qemu-iotests/274                        |    1 +
 tests/qemu-iotests/277                        |    3 +-
 tests/qemu-iotests/279                        |    1 +
 tests/qemu-iotests/280                        |    1 +
 tests/qemu-iotests/281                        |    1 +
 tests/qemu-iotests/282                        |    1 +
 tests/qemu-iotests/283                        |    1 +
 tests/qemu-iotests/284                        |    1 +
 tests/qemu-iotests/286                        |    1 +
 tests/qemu-iotests/287                        |    1 +
 tests/qemu-iotests/287.out                    |   10 +-
 tests/qemu-iotests/288                        |    1 +
 tests/qemu-iotests/289                        |    1 +
 tests/qemu-iotests/290                        |    1 +
 tests/qemu-iotests/291                        |    1 +
 tests/qemu-iotests/292                        |    1 +
 tests/qemu-iotests/293                        |    1 +
 tests/qemu-iotests/294                        |    2 +
 tests/qemu-iotests/295                        |    1 +
 tests/qemu-iotests/296                        |    1 +
 tests/qemu-iotests/297                        |    1 +
 tests/qemu-iotests/298                        |    0
 tests/qemu-iotests/299                        |    1 +
 tests/qemu-iotests/300                        |    1 +
 tests/qemu-iotests/301                        |    1 +
 tests/qemu-iotests/302                        |    1 +
 tests/qemu-iotests/303                        |    3 +-
 tests/qemu-iotests/304                        |    1 +
 tests/qemu-iotests/305                        |    1 +
 tests/qemu-iotests/307                        |    1 +
 tests/qemu-iotests/308                        |    1 +
 tests/qemu-iotests/309                        |    1 +
 tests/qemu-iotests/312                        |    1 +
 tests/qemu-iotests/check                      | 1085 ++---------------
 tests/qemu-iotests/common.env.in              |    3 -
 tests/qemu-iotests/findtests.py               |  159 +++
 tests/qemu-iotests/group                      |  321 -----
 tests/qemu-iotests/meson.build                |    3 -
 tests/qemu-iotests/testenv.py                 |  255 ++++
 tests/qemu-iotests/testrunner.py              |  344 ++++++
 .../migrate-bitmaps-postcopy-test}            |    1 +
 .../migrate-bitmaps-postcopy-test.out}        |    0
 .../{169 => tests/migrate-bitmaps-test}       |    1 +
 .../migrate-bitmaps-test.out}                 |    0
 307 files changed, 1233 insertions(+), 1310 deletions(-)
 mode change 100644 => 100755 tests/qemu-iotests/283
 mode change 100644 => 100755 tests/qemu-iotests/298
 mode change 100644 => 100755 tests/qemu-iotests/299
 delete mode 100644 tests/qemu-iotests/common.env.in
 create mode 100644 tests/qemu-iotests/findtests.py
 delete mode 100644 tests/qemu-iotests/group
 create mode 100644 tests/qemu-iotests/testenv.py
 create mode 100644 tests/qemu-iotests/testrunner.py
 rename tests/qemu-iotests/{199 => tests/migrate-bitmaps-postcopy-test} (99%)
 rename tests/qemu-iotests/{199.out => tests/migrate-bitmaps-postcopy-test.out} (100%)
 rename tests/qemu-iotests/{169 => tests/migrate-bitmaps-test} (99%)
 rename tests/qemu-iotests/{169.out => tests/migrate-bitmaps-test.out} (100%)

-- 
2.29.2


