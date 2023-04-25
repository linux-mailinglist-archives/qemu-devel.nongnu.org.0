Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A77E66EE22E
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 14:48:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prI45-00011x-Go; Tue, 25 Apr 2023 08:46:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1prI43-00011B-52; Tue, 25 Apr 2023 08:46:35 -0400
Received: from mail-he1eur04on070e.outbound.protection.outlook.com
 ([2a01:111:f400:fe0d::70e]
 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1prI41-0000dV-Ec; Tue, 25 Apr 2023 08:46:34 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hnOC2VmyGiOH6UGHXYJqWyTkiyumKGN+XC5LZw1yC7UNPnKqK7+xpIw8ciHEp4tlsF6/zrPMsWnzOUNrFVsLaqqHki0QJ5eUcUKq3HEKBlmSX4MWCS2LKzA3nCRC5YG7lHF94zEZzQD4nsnMI6TYag32IDNRPvsknNlBZH3dZ7MY3/wfJm76Tx/OCs4xGAhMDTm8O37y0YAuHGrChfXi+MpfBT/TAq5kr9IKwIFAfHb2x5RSLzOfBLH3YOiWIMwJW9eRyGOnaSWsqaVFQwTk9wEeaSYTiTA8lz5UVNY118xxLfLV7Aba0zGMMVLUeqkX6g611UTekDBcdR7BUtrTQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3GvT27kDCFrUH6hSrkHbtT4GLpFGO7Id7kGL5uywp14=;
 b=UMTWzIDstMn/pmLwBWjBjJ8D0Xfqs2Ai9u2CoqdmmixKU0qDBeIY5j1WK2sZ1puoHI0AVVuXifc8uiY/yIIBNH28f4fLIp2Ln2WXIWQk48VeXcOczdthXNAZm4NcfhXg9arjxB/EejbxEaqUYC++xuoqM0m9RPGTjT9RPcwJ9+z1TWL7iyRHpdcRUUSTZz2NT20Q4H5e9UpexEgOjOXY640h1KpD9AF1EVum2LKp2MPArGcPEm+fnHAb63P2oyOPaEd1HWL+9k84psKBrJCHtheFZuf1xcWQQP0poJU1knCVPMwvHXrqk9+M4SyWSd0mlTpYPfegNddWrNZl5ani3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3GvT27kDCFrUH6hSrkHbtT4GLpFGO7Id7kGL5uywp14=;
 b=Sp2dwFxRzVHOwFVDPUZ4xMi6UhaRteJSCduep66s10DQs9ZVXDSp51uuubl5+7XN1VYq+wdQ8iyqnARYDQ3ER17w26pd7v3hg9aaXHbX/n+YI5h3kBdnni8K5SFNa1PlNHC1/2BRV1S/RTteSvYtz52yJaHf+7sLXVObLm8ubmUbtFlFQPSmaJ/Pfe7TreQ8UiampvIDEzOM3SspJ5p+E8joikGvIbhzyniZdJWEC6TBMUX0Ud7nCsRKMxC1NiLwZXLdF6QbsQM6eUL5ANndCsaWMgwY8g/P83GClLzVuKxB7yR0qapRaJjjaApsGFzvHuaBTkh7mBerMVcH25ZoVg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by AS8PR08MB9410.eurprd08.prod.outlook.com (2603:10a6:20b:5a9::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Tue, 25 Apr
 2023 12:46:28 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::b630:c4eb:fba3:1158]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::b630:c4eb:fba3:1158%6]) with mapi id 15.20.6319.034; Tue, 25 Apr 2023
 12:46:28 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH 0/6] iotests: Add and fix tests for parallels images
Date: Tue, 25 Apr 2023 14:46:13 +0200
Message-Id: <20230425124620.241022-1-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR07CA0238.eurprd07.prod.outlook.com
 (2603:10a6:802:58::41) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:EE_|AS8PR08MB9410:EE_
X-MS-Office365-Filtering-Correlation-Id: ec992474-267d-4e83-ec8f-08db458b1675
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fX5EeddiR8SklDGddERHFHTwnMZEvZ/XwCXREXJiXcwy+N19rrSkRUl2HWDAbczJhnLvaEpUb7W++J8SJqplXgQAGy6a2zOvppKq7RHrBSoLfCdKRSTd1S6Dzxh6XEwdVCzV0Y2TSI8DYe4olC/3f7tdfqYUV7rMWUgJ88UsTPDlON03+R/EQYOXdRw2sxEg3VqpM1I57Q0w54lHuLlwwrDrvCTxerzS5J7V1D02G1XBqHp0kGrdZstkAoDI8Yb36jop7xOMWbXz7Dp0M75uoCu7ZYYPeU24Lry+P5zrKTTX4B6Es3wBkftkWsdAB1AX/5luMDzwCBMkzWyUB6sqE4snr96cdB/FkRUXxSWsbeOBYfzfGnnF72VirX5iqArYbiWHOt6X7Kby9ecd5ftMGy+e7zuQZtqlpCTCbVQQJ5Ng9SEwwsQh72seNVpgSukTepNvxD/4AcCRd745sca377orkH9ygfUxngtq3MIOpFL8pNRsr+ydMgAC89Zv313HiQ4sGe9r/B2Lp5NG7SeY00ijYBPBnGszsGh5MvdwUMMsFZFHt/OHo07NYel3gXk7x5AAXPIwSxMyHgEzX/pbp+ryUzhxsDKEqh3i2BKYEk88Mjnj8epOp0Aigy2WP0VY
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(366004)(39850400004)(346002)(136003)(376002)(451199021)(4744005)(52116002)(6486002)(2906002)(6512007)(6506007)(2616005)(6666004)(186003)(1076003)(66946007)(66476007)(8936002)(8676002)(66556008)(41300700001)(6916009)(4326008)(316002)(26005)(478600001)(44832011)(5660300002)(38350700002)(38100700002)(36756003)(86362001)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5Zpyic2aFkC3BO/VyK3Q8tR+OGCBRhOViOx8vk1jWXs1yrsJ9wS5xtePI3HV?=
 =?us-ascii?Q?oeZgQtyFG4owlx5zz54sxW2ZYx4gKWyWiIpzXM+AuIGjFib/61Hs1i9crPP0?=
 =?us-ascii?Q?c6BWhb6gWzr10Uve6F2s5Af3XO8P/GiyNYuH0yZDm52I68LjnVSoX20vaY+Y?=
 =?us-ascii?Q?54AUJq6212CyavDDMUdmKcNhceRbHzOIypcLVUQ8actarZqmw93nv3ndS0EA?=
 =?us-ascii?Q?kIRm5KjAJeYp0zsaRXPSWYZlzLc1N69fGCiRGhqA4pZWPabZIz4Abqf8QzSY?=
 =?us-ascii?Q?HHYFB+goXdnYmIPWJxZsr1NHN+901zSDrPB0ZEXjuLdOOdRNcteDlKpemCIy?=
 =?us-ascii?Q?uvSYTIU1v3lqUvMGqscCUH1kQMghOwkiYsVq21Pd7MRaOopFQfuGNYbnpZUU?=
 =?us-ascii?Q?84pMDtH3Y5WLbBzfWT0oUy6LCMO/U0xnTMcJGV5XTb4/gwm2x3mNpZbnc9lI?=
 =?us-ascii?Q?UW6vYp4EfBM6269fcVN0hE7pfDPJ/MzuFZ31fTCb00GilYOpz5Bb0UNQ5/Dq?=
 =?us-ascii?Q?78jbOBQdw0hOdhGqDjTF9pt0w0I8k9pfwWnjeP32ilsWq8JWt3N8XMoKx/h1?=
 =?us-ascii?Q?4pUG/SpmGgULofx2x6yrvdi7tFzxQkxmjEXQRYRs3/6Slvn2k9+LTz+dcn7C?=
 =?us-ascii?Q?BTnayfXhnxzoe+lCH876EOfQg8oF17RT9Kx7o8NzVrZj9fRlIGg5dv2W9AS9?=
 =?us-ascii?Q?LV5TbZOuv0VzNyuQ1BXdGhh1GAoRidBHDyI89+jQKoOj8RchQRsujp9cxzVD?=
 =?us-ascii?Q?i73Pp4EBMW0R6UfrXHsWUV9/aJU6rHFnqRx0LBtJUN8fphAAXY0WgtGV35rz?=
 =?us-ascii?Q?vpmu/NVddlZQYIjEQKyrse/gHtq6pt/q/lT1K4FXq4V1DmKMxjqCBBzgyxUE?=
 =?us-ascii?Q?sJAZgX9c7grzjCsn/gJhUPh1zvxhmOIr1DFMUdRjdZJdtvLpmgMJUdav3hhZ?=
 =?us-ascii?Q?kwIsw6mY4Qf/q6crU8DzC0NviNkkFBqLebSXUmhuWPml9VT+SeufoHnO/4j+?=
 =?us-ascii?Q?VL8VKowZl5AQrXaGNG+UUGvppx5F1grDcPXnyKr+sLpe9kfKy/s4CbkAgF5R?=
 =?us-ascii?Q?b6jRASM3n66j6qqNy5mgiCEnau/Wyv3ckcdOQ1RtFXGp6a9ZzFH7d0wYUfkJ?=
 =?us-ascii?Q?0qPBs7Hc1r9RbXQT82dN9xCsKeDf7RIaYe8hoz81kPC4wbA6r9qawRcO8Uo/?=
 =?us-ascii?Q?GS1/NDbpql+Qab9XnDXf/D1POFEYa/sex9Rq+z+G3iJvOqaAZOCFQvBwiUJZ?=
 =?us-ascii?Q?Eq/qbG1Q/1MbVsZRZI+/iZeoeMM+F1sFLIQCywbD+E7lfAjPoMGw7kDvsLTp?=
 =?us-ascii?Q?R/ZZfCGo09OEsoZv1Ui3zd6Wxxs7QgqeKZ+dxXNzGiat/W3RAMeMq47zTnzj?=
 =?us-ascii?Q?iuQMsApksCKz7a4ZnbUxspRuwh6qwnz6wNNiM8oihmJ83VazovAuKs9XtZMq?=
 =?us-ascii?Q?OGphDDlzEtuWLOfnvf8V9UuZV4qWPaEKx2vKnXApV1EKVvunj4qtWYF8y00T?=
 =?us-ascii?Q?+hqLZeCj5fkCN46EJHVd97GQlSydOi8lR/sAQ0W8ftedmNYGy0z9az0rfKnN?=
 =?us-ascii?Q?5XPrczJMx9EKYX4nydpGp28poNjQ2sOkwT80oNqB3VBuVvAcK3MNQ2+EbUs5?=
 =?us-ascii?Q?yA=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec992474-267d-4e83-ec8f-08db458b1675
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2023 12:46:28.4286 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iDA6YznOxxp8UaR2jkBbN6zYlHfNfMh9Nbt3cIgeREz8kbljqqLVrrMJiaeQjTGHiHiNSjJF9/JzXeKl3jBqFwZzRBP4GBc4UG1ld81ST0E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9410
Received-SPF: pass client-ip=2a01:111:f400:fe0d::70e;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Add iotests for new functionality for parallels images. Fix existing tests.

Alexander Ivanov (6):
  iotests: Add out-of-image check test for parallels format
  iotests: Add leak check test for parallels format
  iotests: Add test for BAT entries duplication check
  iotests: Refactor tests of parallels images checks (131)
  iotests: Fix cluster size in parallels images tests (131)
  iotests: Fix test 131 after repair was added to parallels_open()

 tests/qemu-iotests/131                        |  36 ++---
 tests/qemu-iotests/131.out                    |  59 ++++----
 tests/qemu-iotests/tests/parallels-checks     | 130 ++++++++++++++++++
 tests/qemu-iotests/tests/parallels-checks.out |  65 +++++++++
 4 files changed, 239 insertions(+), 51 deletions(-)
 create mode 100755 tests/qemu-iotests/tests/parallels-checks
 create mode 100644 tests/qemu-iotests/tests/parallels-checks.out

-- 
2.34.1


