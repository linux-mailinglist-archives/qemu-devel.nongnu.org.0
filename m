Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA95D40ABA7
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 12:28:36 +0200 (CEST)
Received: from localhost ([::1]:51604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ5g4-0007bM-1Q
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 06:28:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mQ5dm-00044k-Sl; Tue, 14 Sep 2021 06:26:14 -0400
Received: from mail-eopbgr70123.outbound.protection.outlook.com
 ([40.107.7.123]:7651 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mQ5dj-0003M0-Ql; Tue, 14 Sep 2021 06:26:14 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fC6cJlrAlPQXp4xGy4VYA4+QH9AXau0qT6YGdK0TUmUyyT2kzc4zRFrew+QqLt5QKXzHdUgLgo9uVfUB/QhEcbonX3hOBbXhLdhgJUNTS0NH8IoZ8QlAiyH0o8lgLxB6xjBtaP3n8kcdTDgO6jovMVusKbepLpQt2ylUB/ERsRiIfbx/Ce4YBwjXg4k1O/aOAj6DFkDjhotbit6Msmlm3evyy7CLzVr5DTNqJLbIKJpfFYHV046QegzYa9p9A6+Z4lNGlzuFxNGVi/UbuGxIzTVHWbq8p20SJmyKnkoCPk4J8E8q3YXzd8pYyQuRUhpGFRn3JvrS1LW98ttX/vQukQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=GO/w5VIAU2ohG/2Z5mjhVI8ocQn0sah8/39dVvXYQkE=;
 b=oEc7Oj7ZUXFNYKANtGdCnoq0iQpRkH69RJi0VruFkwDxLyTZCdrbTMdhbxnxfHK/qz8h7Pt0DpOhzkaxq8WHbOBU2tO9eKSC3bu6kGsmB/te8BIIeH8LPsqbpAsvR7euX/DljmMhHIhI8bTXZnxFUcDtybAlUxR41cEpyNSvg8rZ6I7FycmVSmx3sckiYm46XHmFMtRRux8bcXiQOOXCXdF4/LA8tE8HpGlMrPiVTTV5Yucu+dmqcjVIm3iGA51at3JlTERxrBP+shhtbe72PwpLIS5Q9IFqK3Sy5k/NnAJQBpPFkNhy7VYptUFJj5kx9pxQs8xBIDN5AHKw1+SpxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GO/w5VIAU2ohG/2Z5mjhVI8ocQn0sah8/39dVvXYQkE=;
 b=EqVVxRSGsZ+FTSTRi4hD3xAWjv8COXpZ6CyKAt71Nh7MfCGmvZASKIt2x5pOLPfuChJbIqjA33m8k9lg/Wvxf13SO0sEGtV7TcBLXZE38VafoKw1HMGbT2iWaYpf1YcBU4JPMToZEfv8/g7saMvNwl9Kr2KGjeybc7h2BNyoT6k=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1716.eurprd08.prod.outlook.com (2603:10a6:203:39::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.18; Tue, 14 Sep
 2021 10:26:06 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4500.019; Tue, 14 Sep 2021
 10:26:06 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com
Subject: [PATCH v3 00/17] iotests: support zstd
Date: Tue, 14 Sep 2021 13:25:30 +0300
Message-Id: <20210914102547.83963-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1P191CA0004.EURP191.PROD.OUTLOOK.COM (2603:10a6:3:cf::14)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.196) by
 HE1P191CA0004.EURP191.PROD.OUTLOOK.COM (2603:10a6:3:cf::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Tue, 14 Sep 2021 10:26:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 15ef1ee9-8ea2-4e13-869e-08d9776a0fd0
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1716:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB1716B19A0D0AE00B2739E302C1DA9@AM5PR0801MB1716.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mujb0KmgdMQWk+WAEWkFzaMOWAqz1eBb6yEg1rwDlt9rUGkVJOb+SgOCOcCZGcm39XhemaxCLHc5LxYmRzpbhHSyE+b44vlSwJhe8jX4JQgFek7mLWwoeGVtdmGHB7K9+pKob6CbN7dapzscYIfBhQMk7fQItgwMjFPC6pwcMembxEcM7RcxOOBK9L0TCHqhb/9bCa1VhvgLh11Sgi8m57XTOveomi+/5k5W8Lnp1/8G3DAdu3bWtDS+Zxr911s9Dbz0PVsooa0gi7BqYC9Yrn7tyVEzka+3t4qSo8y3MLV/RcoGpSWqva054xOZzSS6pxZar30BFEe6+bcO/mBjJzYVlUiWojhWMC9c1T84F6xzHaPNk+0LbkiO07D/m4Rm3jqk2XMwU9NQ65H9NwSKR5xoU5JuemJWCj0QeZG5wqvnOAix/40rFT9L+saRjxiiq87t6dWTD6zNtnNcM42onsqDbcorbE+Sot7ZWYmNpKVY5qjlDh5PG5kYooPvqBSEdBNba/umCdiL2Y8odkLMJqqEyAaMHYL1uKFngk5jmojJf0swlTmINULlEnBOCEc+MAH8v6NwJD+bonUeyXCrdTc3xlKZEJSScKJgZ/SHy5DHsTfcjObY7H/8M2wopkId8pFvhalppJqoMfFrV2QtB8hk9pYZ2naN0bjoEmTj5hypkx9xTOQdhcuZ33TTlw8QcEnNfipSw9CxQ7slJIQ1Zw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(346002)(376002)(39850400004)(136003)(478600001)(66946007)(66476007)(66556008)(36756003)(6512007)(52116002)(186003)(4326008)(6916009)(5660300002)(2906002)(83380400001)(86362001)(2616005)(8676002)(38100700002)(38350700002)(956004)(6666004)(26005)(316002)(6486002)(8936002)(6506007)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tYZSl8ZH6qtMH/hBuVGK65jt8IdPwHGt1wQbCm69IZRtmrOdaEaR+H9a5Vbb?=
 =?us-ascii?Q?3roQrDFYseY8k5MB6k9Bsn0cL70e9tkuCz1mNPPPfhqLO4LpSBrC9ny5gsfi?=
 =?us-ascii?Q?kGMknYLPIxTSI+3mgIPbTWbaDA41fH3+GXIQU1ahkFWceEKd4EXA01Z9kewz?=
 =?us-ascii?Q?pW/F7kJOI6Gfrp0MMVsPBX6XitYvPdOU6FFNxtGYWVrNkHMWOl2WVdWoGSjN?=
 =?us-ascii?Q?1SRKDKZAwgk+fcQjPzwH9XAlIOSW8Pwp7ED4FcwEz482KgeBaS5a1xMO+cgo?=
 =?us-ascii?Q?Wnn4nIun6MqUxMtHsH8YJsHyizRr6ZVeobiswrlvGlnl0Nb6dvhl5A1IOsCv?=
 =?us-ascii?Q?DACxi4JX92bYeynfWSJ86RFbPrJ68p+lPmu6u2PDB7ZbrlhAOy2+ujb5d7Qq?=
 =?us-ascii?Q?PK2DxuMdTzlEAquByvpULV36IqjOQAmyfmnc9mcUn4g3OFN7x5nr0uyjGqrK?=
 =?us-ascii?Q?mFT7uiQeq0BVK6tRCOvvz+FKl+JhtB+hi4q6NY6asN7eq9XZwLJoA3k97a9M?=
 =?us-ascii?Q?AZziLUkmlVbNA2hUPMhHe51RTlcjm9fgqMv+2hjH9dwczfw4JKodokr7bnF4?=
 =?us-ascii?Q?fAFGet1zoGPGD/B0awlp6QEiFQJldYS3LxWlTBiXegUR9Ehy0lV0GOBYVi/n?=
 =?us-ascii?Q?Begm8XFwe7aX79hcFHKaz9L+3k8kskGOpBV5CdAosyJJlyrZNx1qyt/zById?=
 =?us-ascii?Q?N610JTQYwJCv1cVZLYYzDKhH5Cvbo/q1z9zipFyT7agzS2JlF8ssaaJKrmKx?=
 =?us-ascii?Q?zpeiDUWjJ2hblz9JJRY5NvIfUNMnnqilr8ql6QZRvKPe9aOLLeFJMguUooUr?=
 =?us-ascii?Q?p0nj5naTc4d1NQgQXo+4FT37oSwbTN5pWpDJC5Sp8wrZY/o0rXwleOkJe1BH?=
 =?us-ascii?Q?yD34C7xpc6dlMYXWJaE+WPVv2akh9oD33fGXMtoY2EKyYlWThUYlV2M8D/Qr?=
 =?us-ascii?Q?iU613lv1uAvYP8He8hFMUtBolIy6tP3Zjp+/KNkK0s+zGo2LoVB7iiB74LDQ?=
 =?us-ascii?Q?3rPeOXBht30KfJ8gET+ZeTDZLzCawhQrnuwscPilCJ0To/M7A+s9Lyess+TN?=
 =?us-ascii?Q?NAiSCAos10opbJZjqtw616xZaDlrazjzNhEaxs1/KrAeYX71PYLbp04rx3pH?=
 =?us-ascii?Q?OnhanZG31ZCSL20cm9fMyQ67+SQOKvS1flb12mW20WvTMGRr01UDkN4lJ+tL?=
 =?us-ascii?Q?FMarzeUbTjxkKlkx4uYD/ZjdGGfc0UkW3rwQUKr/41FWeWBpcj5p/ifufmug?=
 =?us-ascii?Q?/aBDXuz0Pr/cJcwVPyI79C1SBsocb/GFNbD9by3yfZV2cs3Tg6Lv/kUTKw5w?=
 =?us-ascii?Q?xOK1wtB6L2BJ1j9EsCexRLVe?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15ef1ee9-8ea2-4e13-869e-08d9776a0fd0
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2021 10:26:06.7080 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QkITtRDR8FhHZn0Kn2KNH/yoMsUkxMpG9+K1Glq91cmqMQzdx+mSrmZzF2lGhCV+zEQC7THB4X0Ew2SSl4br0aneoqWScos0G7HFPrzOnkY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1716
Received-SPF: pass client-ip=40.107.7.123;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These series makes tests pass with

   IMGOPTS='compression_type=zstd'

Also, python iotests start to support IMGOPTS (they didn't before).

v3:
02-04,06,08,14,17: add Hanna's r-b
07  iotests.py: filter out successful output of qemu-img create
      fix subject
      handle 149, 237 and 296 iotests
         (note, 149 is handled intuitively, as it fails :(

Vladimir Sementsov-Ogievskiy (17):
  iotests.py: img_info_log(): rename imgopts argument
  iotests.py: qemu_img*("create"): support
    IMGOPTS='compression_type=zstd'
  iotests: drop qemu_img_verbose() helper
  iotests.py: rewrite default luks support in qemu_img
  iotest 303: explicit compression type
  iotest 065: explicit compression type
  iotests.py: filter out successful output of qemu-img create
  iotests.py: filter compression type out
  iotest 302: use img_info_log() helper
  qcow2: simple case support for downgrading of qcow2 images with zstd
  iotests/common.rc: introduce _qcow2_dump_header helper
  iotests: massive use _qcow2_dump_header
  iotest 39: use _qcow2_dump_header
  iotests: bash tests: filter compression type
  iotests 60: more accurate set dirty bit in qcow2 header
  iotest 214: explicit compression type
  iotests: declare lack of support for compresion_type in IMGOPTS

 block/qcow2.c                    | 58 +++++++++++++++++++++-
 tests/qemu-iotests/031           | 11 +++--
 tests/qemu-iotests/036           |  6 +--
 tests/qemu-iotests/039           | 22 ++++-----
 tests/qemu-iotests/044           |  5 +-
 tests/qemu-iotests/044.out       |  1 +
 tests/qemu-iotests/051           |  5 +-
 tests/qemu-iotests/060           | 22 ++++-----
 tests/qemu-iotests/060.out       |  2 +-
 tests/qemu-iotests/061           | 42 ++++++++--------
 tests/qemu-iotests/061.out       | 12 ++---
 tests/qemu-iotests/065           | 16 +++---
 tests/qemu-iotests/082.out       | 14 +++---
 tests/qemu-iotests/112           |  3 +-
 tests/qemu-iotests/137           |  2 +-
 tests/qemu-iotests/149.out       | 21 --------
 tests/qemu-iotests/198.out       |  4 +-
 tests/qemu-iotests/206.out       | 10 ++--
 tests/qemu-iotests/209           |  7 +--
 tests/qemu-iotests/209.out       |  2 +
 tests/qemu-iotests/210           |  8 +--
 tests/qemu-iotests/214           |  2 +-
 tests/qemu-iotests/237.out       |  3 --
 tests/qemu-iotests/242.out       | 10 ++--
 tests/qemu-iotests/255.out       |  4 --
 tests/qemu-iotests/274.out       | 39 ++-------------
 tests/qemu-iotests/280.out       |  1 -
 tests/qemu-iotests/287           |  8 +--
 tests/qemu-iotests/290           |  2 +-
 tests/qemu-iotests/296.out       | 10 ++--
 tests/qemu-iotests/302           |  4 +-
 tests/qemu-iotests/302.out       |  7 ++-
 tests/qemu-iotests/303           | 25 ++++++----
 tests/qemu-iotests/303.out       | 30 +++++++++++-
 tests/qemu-iotests/common.filter |  8 +++
 tests/qemu-iotests/common.rc     | 22 +++++++++
 tests/qemu-iotests/iotests.py    | 84 ++++++++++++++++++++------------
 37 files changed, 313 insertions(+), 219 deletions(-)

-- 
2.29.2


