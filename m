Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1B33BBA0D
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 11:18:43 +0200 (CEST)
Received: from localhost ([::1]:36444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0KkU-0005Cv-2d
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 05:18:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m0Ki3-00025u-Pp; Mon, 05 Jul 2021 05:16:11 -0400
Received: from mail-eopbgr40109.outbound.protection.outlook.com
 ([40.107.4.109]:55110 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m0Ki0-0007tK-5S; Mon, 05 Jul 2021 05:16:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NqTXMTggNr9uI/uem22XDenS3H+pbk+d4y3uhjvm/CpZtQSkAX2f46vjXfRC1Go3l7UQA4Grij5YMH2JcQnUlejJPBRVBzl10aIU5X+eKHZLOp0duT5zy8herM0ndVWVjjhxcChDuLICuO2l6FsBIsnbcThSNFvMSwk4ZwCh8Hs2LXPTmg82pUeR3ADQJtgGN3KrxGBMp4e63n/dtNrzIDlpIDNOFJtePACQj5s3moRh3u+EPw7YJ0IS/ucVv/5CqS5mCa9+g1j3l0hCGjXDZG9omQeRzG+e/8vqHbv0CcT50XsWSoNChqrahuTkHBqjLOjWsP43jjK2eFGngVfY8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fZmkXn0RuiXgfSVzUrkEU+5fOuamGQb08mwY/nbOqbo=;
 b=hKhkf4mapQ/7cA8+ekbs0D0V32lO4MWrXslYnXT2fVXd3qPCWbCVUl/Ij0UIwfds6EN0M6jj5Lw9Cb1nltaGEGQedeaNF3eIrLAFPo8WkUBhNtM5gf8wq3tUBDqEQnFSzuTO1PntloUqyqd5lRzrVWJT9obrX4+G0kZhYC7GRU6NscUukkdqSqovTsFdRbknODOSPg/XyDYTVU3/rRggMgUsS5fQsnUcPmam07PEX2oxda4ku7OeVyf38IkX1ohYEMMXl0LMt2SCTDGQSe3KMP2SEErDmCULqqhb1qv25K+PsZ1zs7I49fc7QFdSUOiRFoAgkzi7Dgy23A+S77Ev9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fZmkXn0RuiXgfSVzUrkEU+5fOuamGQb08mwY/nbOqbo=;
 b=KFt/ELdLS9MsH4tR0RIrACARn7KN7OCEnmB1Jh1KjJxjF04akdlsVLBlc3XNtPAJ5GrqjILH527sl6F8O9nj9dkJCH8gcKRvGT3ByBtQvmhDN/4Tw7K5ceuYNTgHz0TVzhKvIXRc/MfhbSnA7u5B174gPCD+MEgxzSsg597HYBA=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1714.eurprd08.prod.outlook.com (2603:10a6:203:3a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22; Mon, 5 Jul
 2021 09:16:04 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4264.026; Mon, 5 Jul 2021
 09:16:04 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, mreitz@redhat.com,
 vsementsov@virtuozzo.com, den@openvz.org, jsnow@redhat.com
Subject: [PATCH 00/14] iotests: support zstd
Date: Mon,  5 Jul 2021 12:15:35 +0300
Message-Id: <20210705091549.178335-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: HE1PR05CA0235.eurprd05.prod.outlook.com
 (2603:10a6:3:fb::11) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.215) by
 HE1PR05CA0235.eurprd05.prod.outlook.com (2603:10a6:3:fb::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.22 via Frontend Transport; Mon, 5 Jul 2021 09:16:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fb52ae5f-f2ca-470d-36d1-08d93f9583a3
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1714:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB17146EECD0C0E7350EE83483C11C9@AM5PR0801MB1714.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:291;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iFsr2Pv5pzS0KI+Wa86n2QHg4MKxejc4FYPL+KUp4NUJhz4IdPrk+e6Kyqb0XlRC1+mzM9IMlI/DgWm3HOejFJORx5oAEEIax1k59eI3Z201hWoJEdJHvtd4knkK4PFU9bnhpLW5NKicqXGcv+O0NUpl8CPfIoAH8KLFEpmvgfY4TSnfDdIAWioDwRWOJdpp6AJMOkNh6zB48rhuvkzvFeRWmUpsANh6FZ8b7OxxaBM1e/0/R9V8PgzNvpgh0NAEiKJYIcxhNPZmUiLvbfDSAb9uj52QXQLJrW/m9BlIniUXew7wbPsKiTBdCnE+e6z1sferUTkMld8AUZNvGNsvbrTPpc/t0xcONSvXv3RBfeZS+mCDx+QKYE223qXklnknjiXtby1cB1q4eyWJrH8J75Sm4eAwOdk7EgvBACtV3Vg6U4frH4/pWdQhoo3dE1cc7LG7hKx+EumUD9gMG1ASlp8wM8rYEvIkMxPRrMQ5UHJMdcjbvx5Zn64pSkFNAiOaOzXOH1K6K6KvLssGDt6m2y32ZzYhQl3ex8EFgBwWIPSl+bkQfyX2Xiw7G1DW7x9VNEQyle+U/PeY9Sztexd4ZAXuM9q64n+sw3mrE5aGUvsFv5PO1/awFwtQepqOOb1PJ4YIHEmvDZLlp1rOpnB4fsgENnjpLXQ845jNMXphGwQBx7DjvVQJpQW8c1tZIS3lTZ+EQDiCyZ2TqayTm/3+NuKHI8CVHRaaFAMFT7hLVt6UY2OAny5kc/+3zCzCn88l
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(39830400003)(366004)(346002)(376002)(16526019)(186003)(8676002)(5660300002)(8936002)(1076003)(36756003)(956004)(2616005)(83380400001)(38100700002)(316002)(6486002)(52116002)(478600001)(66476007)(6916009)(26005)(66946007)(38350700002)(66556008)(4326008)(2906002)(86362001)(6512007)(6666004)(6506007)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yX3Tozz2wpDyhj1vES1CN2GrYPnM2i06ZwOSyOYI2EoSvTT2Kg8IOR2/8lvF?=
 =?us-ascii?Q?5sw/zgaTAFd/fLbIQPXtbtKUf/Msyj4WHyvmt2N5fulOQzaBsZPEHA6uFvKJ?=
 =?us-ascii?Q?Mn54XVB9PStLVZDi6xIVat3xivCeGi0P9Tniq7fbHrTO34v5w9Y34CaHBfXG?=
 =?us-ascii?Q?IUzeUASkDo6WJPN3LPZsBLBv/zoc7cuWzzdP1SI4bdRX/SI96iFA5GZk4Y+W?=
 =?us-ascii?Q?TDq4OwygzvriGqWETMRF7uuxSg+Tvt+8/ktngiiIojBIQl1XXRGu6FLUUzjE?=
 =?us-ascii?Q?AcTD17E5kraXPtPJzdwq/q+aDVwyH/6cHUQKA9GptTc80EdJ/65bG4zx6f83?=
 =?us-ascii?Q?cSd1blxQntfQ7k39IA2potSmqt2SO1FjbT+psinoyBJQWsTmIuUWAeExx2Gp?=
 =?us-ascii?Q?MCFngh/mEogdGbtierzOly7s/LaVsVy8dr2Yr2Vc0/B1dW/Q8DdOav03j4y4?=
 =?us-ascii?Q?jkz/OxVA/D279NPB4wgWUn6TJmU8Yg5Hi4V9a+FWF1nR2F5dDod8jkBvtKrP?=
 =?us-ascii?Q?weBMeCL2nY8X0t1HDxaf04dF2X/loj2vSjKk0xyUj2FsverSCq2G87z30zkK?=
 =?us-ascii?Q?pimpTvx9aYRhen4N9fU8TsWvZ/xwxEo6EqxJlet5XkCxzDYiYT07/XopfNsS?=
 =?us-ascii?Q?I5VKBWwNcSeEKGTBXC2GlQZI4ALcRA1pKDAC2jAZnLHrThiRXHVTg7jo/GBh?=
 =?us-ascii?Q?UCv/oH094PMkKbSi9X+sB1uE9m8XLXqnpHzWdrHuxv9C9UVqzBHrI1KhA0m8?=
 =?us-ascii?Q?mux6oasPbkIJUVf0n/YPk8bU01jyrGvcvKYGZZSMopRjzHpZymaroIW5Dl3f?=
 =?us-ascii?Q?xu1yA93POB2w2oH2NE3wpw25gHq2XredvrFg/l3YPzEhoak4zrT8ChEoxMEe?=
 =?us-ascii?Q?GHx7pLrAobgrEpS9/f6cPaBibNjNMt0jUm7sXVTq678Vg5l9+buOw52i1azw?=
 =?us-ascii?Q?zsTPx9Ya25i8Xl+5SIJK78RVzz2PcuDMLXhSa7wBbrD/4a20bx8ZK7fIEpwx?=
 =?us-ascii?Q?3yOy3BIDdrCSvc5Zi5JbA7b0uJ7+Z0xs5RsjcjfoS/Xf2F0E67Kp80SjXfl0?=
 =?us-ascii?Q?Izsuu4uZbykDND0ts19hJcNJWmeGIAAt5PBc41nH6PjS6cCj1KMXgQkuponO?=
 =?us-ascii?Q?R+XhGL4s7iPb/AvhpcsP+nZBBw+rxGPJLgAdGtKCNZvwctxFWFF6dG6yLI1G?=
 =?us-ascii?Q?RFgSGvEg9P3DifuCIVXzYCtXZsh2/tYLEaGSKgkMtTaKErbcqUQZlBDHsCVr?=
 =?us-ascii?Q?o/rhP8LvbDhxAFsJc459hhpJtKHI2iMyZ3THXIHYeJGMTUIvkKR57A2jz2T1?=
 =?us-ascii?Q?5NqZvZq1w90aaHyPNjiV4aSP?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb52ae5f-f2ca-470d-36d1-08d93f9583a3
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2021 09:16:04.2308 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C3lUKMCGli3iCszRczYKrE0sRFn3FpVxTBbU8hf1A3Jq0jbiLuzKRt6kr3rCpLXG0rKpnPVB3PcZy9wD6sEGPu51ggX6erm3CH0XczYiTMg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1714
Received-SPF: pass client-ip=40.107.4.109;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-DB5-obe.outbound.protection.outlook.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all!

These series makes all test pass with

   IMGOPTS='compression_type=zstd'

Also, python iotests start to support IMGOPTS (they didn't before).

Also, tests works if enable compression type zstd by default. There is
no such config option currently, probably it will appear in future or
we'll go some another way (like external config file, like
/etc/qemu.conf). For now you may test with a simple patch like:

    --- a/block/qcow2.c
    +++ b/block/qcow2.c
    @@ -3539,6 +3539,11 @@ qcow2_co_create(BlockdevCreateOptions *create_options, Error **errp)
                 goto out;
             }
         }
    +
    +    if (!qcow2_opts->has_compression_type && version >= 3) {
    +        qcow2_opts->has_compression_type = true;
    +        qcow2_opts->compression_type = QCOW2_COMPRESSION_TYPE_ZSTD;
    +    }
     
         if (qcow2_opts->has_compression_type &&
             qcow2_opts->compression_type != QCOW2_COMPRESSION_TYPE_ZLIB) {

We want to use zstd compression type by default in Virtuozzo 8. This is
the first step, which is good anyway: improve iotests.

Vladimir Sementsov-Ogievskiy (14):
  iotests.py: img_info_log(): rename imgopts argument
  iotests.py: qemu_img*("create"): support
    IMGOPTS='compression_type=zstd'
  iotest 303: explicit compression type
  iotest 065: explicit compression type
  iotests.py: filter compression type out
  iotest 302: use img_info_log() helper
  qcow2: simple case support for downgrading of qcow2 images with zstd
  iotests/common.rc: _make_test_img(): smarter compressiont_type
    handling
  iotests/common.rc: introduce _qcow2_dump_header helper
  iotests: massive use _qcow2_dump_header
  iotests: bash tests: filter compression type
  iotests 60: more accurate set dirty bit in qcow2 header
  iotest 39: use _qcow2_dump_header
  iotest 214: explicit compression type

 block/qcow2.c                    | 58 ++++++++++++++++++++++++++-
 tests/qemu-iotests/031           |  6 +--
 tests/qemu-iotests/036           |  6 +--
 tests/qemu-iotests/039           | 22 +++++------
 tests/qemu-iotests/060           | 22 +++++------
 tests/qemu-iotests/060.out       |  2 +-
 tests/qemu-iotests/061           | 36 ++++++++---------
 tests/qemu-iotests/061.out       | 12 +++---
 tests/qemu-iotests/065           | 14 +++----
 tests/qemu-iotests/082.out       | 14 +++----
 tests/qemu-iotests/137           |  2 +-
 tests/qemu-iotests/198.out       |  4 +-
 tests/qemu-iotests/206.out       | 10 ++---
 tests/qemu-iotests/210           |  8 ++--
 tests/qemu-iotests/214           |  2 +-
 tests/qemu-iotests/242.out       | 10 ++---
 tests/qemu-iotests/255.out       |  8 ++--
 tests/qemu-iotests/274.out       | 68 ++++++++++++++++----------------
 tests/qemu-iotests/280.out       |  2 +-
 tests/qemu-iotests/287           |  8 ++--
 tests/qemu-iotests/302           |  3 +-
 tests/qemu-iotests/302.out       |  7 ++--
 tests/qemu-iotests/303           | 25 +++++++-----
 tests/qemu-iotests/303.out       | 30 +++++++++++++-
 tests/qemu-iotests/common.filter |  7 ++++
 tests/qemu-iotests/common.rc     | 30 ++++++++++++++
 tests/qemu-iotests/iotests.py    | 66 +++++++++++++++++++++++++++++--
 27 files changed, 333 insertions(+), 149 deletions(-)

-- 
2.29.2


