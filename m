Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9906589FBC
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 19:14:11 +0200 (CEST)
Received: from localhost ([::1]:54134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJeQE-0006wI-KB
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 13:14:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oJcHW-0007Uw-Cr
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 10:57:02 -0400
Received: from mail-he1eur04on0727.outbound.protection.outlook.com
 ([2a01:111:f400:fe0d::727]:37958
 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oJcHT-000317-BX
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 10:57:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eK41juRBFFjtogYseecypP1Uxz+/jYPSbridu7MGmzwotVrkfkOZ8xjoODJd6vMbb868H72SliFfYUQL4iyJ7mcKP0nc1CiBI1XOwfASv5vq5J2dneZgi2Duor0DVh+AscgmFVKqIZObvG/Oz8wKDw/Qla3nv3J4Wd2M6/BK/BRrJ1e8jGDOanDTCG2PGcrWTgIDRaDwbSrA2610SNrW73rUT6RNrrRbfbKhdYJz++/bJaew3d30U51DsWDP6JmPE9bj2rRUZ8ZWmwl2Rmq1tv+UqrMJXuEQVomVViE7ZVOEFQRUkum/JsXZuc6k7Hx+aa3r6TxG5/3Q0TFrYfqWaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BRXa5P6v5I2u1fRzcji7CJ+T55A+JEycw60PH1vhr/o=;
 b=NL+sg1ZKijCA5MzfhjTscy8oAfXZ08esfveXb3JYANmTz50bqwoaV8OCX+n3JL/l/a2pgd9I4O6Ut7DS7H7YoZdSlOEmgHWYBpqiSLBZx018atiGe6ooRH31r2j/h8cE8a/8FHA4LrReiBisajHxPd9PGa7q7sMLSn3a6TlieGwO9L3hqw26/7MiyMsmzuU5u2SP7rO+g3cW1S+wIBcUxVgoEitRFsB5mgCB0e1jGig5qWkERJ2BSo+1Ol0csADdLi05L6/m4NjDlSKLv6ooWaS9+7lrPzK+oqRq3zK07RH8UtXZL2N09uOsYBkaoyJEqqEJJAc3B4c+ol6mT2PeCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BRXa5P6v5I2u1fRzcji7CJ+T55A+JEycw60PH1vhr/o=;
 b=fEOpnvxskrCwh8Z80UPw3u86iLz400knqI+ZteFRK5hjonfr6q7dICuBSCP0dBf/hRCw5Rv8xIsYkAV4VQVXwfcpjZpXPsvC5HdW06EqYCVSt9ON69FITqB822fdN03h6xIGA+LGZ413BY8ygKQeU+vHotccCUSFIGqPwDbkdQ6h7ZrsJlNxI8kfy5OGh2zCD+PJBnqQ+aFrwl2vttQWmzqf3CJZSbXcjjJB10LmZ3UjNrrUoOpN0Ov7VvuAOVMeMZ+9zsK1qmwHJfMv6CB5VYdjFQwSkWejIHAGFifv0VHuCNOLkB9Iy6vlgYBwS9CVKNR19qAfse3AGKtAfLa0Gw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by DBAPR08MB5624.eurprd08.prod.outlook.com (2603:10a6:10:1a8::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.12; Thu, 4 Aug
 2022 14:52:10 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2%6]) with mapi id 15.20.5504.015; Thu, 4 Aug 2022
 14:52:09 +0000
From: alexander.ivanov@virtuozzo.com
To: qemu-devel@nongnu.org
Cc: den@virtuozzo.com
Subject: [PATCH 0/3] Check and repair duplicated clusters in parallels images
Date: Thu,  4 Aug 2022 16:51:57 +0200
Message-Id: <20220804145200.564072-1-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0146.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::20) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c15b9357-b623-4b05-bccc-08da7628e87d
X-MS-TrafficTypeDiagnostic: DBAPR08MB5624:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0spk9oItHsj4kPgmpJ1qVg18wYsPG9zaxwHuRPQuxG9xP8NUl1HXvk7kDL/+CDhiypBahjeawaypkFQoCEGBe1R7WWP3yCqqjzMN2yyb0NRcbOOBdHQxOxcqD0OlP3dIQUJWg/aRkCT/bvTAhU7hbE1u8yRgqU5TwASRpXfFcYtb06OCg6RjyV425OceU7c9hNYvpiBse4sbXoIVttY0+cXTkreiA9yUFqA4wCP68fTz7OjREbADmaIakzdQQq5jCyHAqWzrtqzpQ0vZhTkn7cb3FzI9VK1hcb9jyCo6djGqBslWLoh0kHtHbIr56ysLRwpVq1n3LrW59VpK9/C3dtqQmBbBBmHKN+EgS3VjHzXDOaizJzk56cKbknXHydrxIGv7bG2ObUIlOYEOrXcvth6e0Kxk7M3iApm2mAqJ+Ax9h/EiJkzkbAf91cv5RLJha617DHtnEeHbyD6kTxQ5OmW0f1/cp2lM68gE5rOPFyXg2MjcFdCcOT5C1+sg+VKivF2M0QHjtRFoaVBXcIC1Wh5QdkIieVCpPkmysd8r3qBNEUQXeAMU/5csLKMuSfWBe3rJQXGtx8nOOSoLTu7ZknsEr+3cXpM9ZGlw7brbsFzizeZg4xv+B6lHS2obc8DD5w2amfkjMp7nEBBbJ0UA1gmq7KePVgjln2iTl6FW2qcIXkyMWud6qKEDN/XN5b1BA8t7JzjdSonAkm6hDs0LqdGkm/X7MgJl6FClmpZmcEKKYenyUtoiUKKstHAkAwDO58hoL/OnbGLdV3zeh6ELSESQmzmqpajjvMKf8/C+G78=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(396003)(346002)(136003)(39850400004)(376002)(66946007)(8936002)(2906002)(83380400001)(2616005)(107886003)(186003)(66556008)(8676002)(36756003)(66476007)(1076003)(5660300002)(4326008)(316002)(6486002)(478600001)(26005)(6512007)(6916009)(41300700001)(6666004)(6506007)(9686003)(52116002)(86362001)(38350700002)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OTPOpaEQVAzxDAU/H3LOeyN6ofF2W4Bl6ugXroHWAW7mHclMhXeEFNjIiiOf?=
 =?us-ascii?Q?+CPgxsOOUC153NBR/HQg95DfPM0ALvG0YFFclsaouNbBnrSRgHnMQ/qMQfLH?=
 =?us-ascii?Q?iPzq7bET8v/voqOqLW0kNcM5LE9CAlN6N+5Hc+cPD/ae9UfNSWjUBhVpSe+j?=
 =?us-ascii?Q?1vcKLMuRFFU06n+47mH0sbaEGheSUTbKg8cZPzcZO7COWq1x8OOB4amL4xXE?=
 =?us-ascii?Q?BeNpwYLrR3kGih59gxZv0Ovb08kUA49L52N+7RmBwT1ryUUs46kC/c/993sf?=
 =?us-ascii?Q?SNBtFHTHg4srxEFXbdsURasX97lKZkly/4pWL/2PXnDKY/ReknZuA1oI6mHM?=
 =?us-ascii?Q?vfbCHAaCtgIwrO03Z5/rl5/fHqdX0iNr+ahJmlguZpIa4jqNpsAMqlFcdjgP?=
 =?us-ascii?Q?u0yQjq/FMQq1RwYWRPznmjejF2wOh/tRSc70zfWs0XYPzHHwoETlpfEJIf2x?=
 =?us-ascii?Q?nTz/QmSBHGwcJprSdOOVIbNyZCLkkbWHWu7Zj7wZYsIa61hcJbUU+XoYBMZv?=
 =?us-ascii?Q?BIIj9KnygfyVExlf8gA/xxXTdHq4AbtvxEDmpTcpEq4mYmUQumrZEWTHHZnh?=
 =?us-ascii?Q?tRdZRNvi+Tw/T1CHnFISv+uPcc06jNYOTVnDZtrLlfsPLDlqkYr9BA4Pdyff?=
 =?us-ascii?Q?WxVP6uXedz2yN7ldRCYmCKxc6RZNxqYC6QEi/gh+p/1/W7w0xYa7zzuF++ex?=
 =?us-ascii?Q?ohD1Vyll9XCEhai5fHd09YQWDaZaRM/KPkVqiJLxR8nh0ICBFrCCfeWxDubC?=
 =?us-ascii?Q?ZMhoMQNljmcdPTvv7S4nKpCN0hZmfJR7brC3i952IGsokODZwQip8ywghTE4?=
 =?us-ascii?Q?3Cy2Cbi63+JNVPSkeDwGBnc3tPtD7UrGXmnqvl9UV3aqZ1fnKWMwfPnWlizz?=
 =?us-ascii?Q?DKZqJLlN94lEF/TOL72Hsw6vjZBbQYyAEaH8QU0+G61RBenkoYEI/2SrStgz?=
 =?us-ascii?Q?9Bq+Y6gBsFvnHon3jpKKb5yb6jI4oDVx8Vf2/aKgfIG7E0fj/GqTsslwRBP/?=
 =?us-ascii?Q?BomTWiWTJVW3E1+y89GUSimqm8wybYo1eMc9kkSIH9In+jL7QlU+72pinupc?=
 =?us-ascii?Q?cDxF1CZLzgB+weVwcCnTPMAIf4zxKsYgooEP0WNewHvYYmnctVpt93xco6O2?=
 =?us-ascii?Q?s48s/etlP3stU7xK0adxV1wGBDZPbTdafW/AhvUaRv6QdfZYEHPCm/U4B+Cg?=
 =?us-ascii?Q?gdMo2EMFuTgtejAXbii1aNzCZTVsIwBfj+FspTXkZbtc2Exn2FssqhHEU4Ku?=
 =?us-ascii?Q?eX+T/ue38yy3ASmkotMCFb+ZMoAux/UfCiH1oDJy4rYzLp6ZQVbOwyaunDU/?=
 =?us-ascii?Q?ZiGKDVnFAIy5sEC+Oz5UMX+Vt9CCltpqeH7BaKTx7y+5h6/stX+ebrGvzKS7?=
 =?us-ascii?Q?o6PBH0utodjgo+6LCQioZr/BmjjbEujLjD/1X8eR3v8bTy1IsvxyuTMCv0nx?=
 =?us-ascii?Q?SLnK+C44J8+qnqa3iTMy9QDB3gqQWGchgAk81FA+w7GJrBxnoSNlmCJ1eVSB?=
 =?us-ascii?Q?vZfwBrE9lz/g7LD37Pmr7DxHYdTxWxiRwSaSFK6oSzntSe7MKxoRsqbBdWrd?=
 =?us-ascii?Q?buqftCmq7zjdJhDYHFwly16m/TgLR3MAenshIPhsND4dzdAPlhj97yvKrD46?=
 =?us-ascii?Q?9w=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c15b9357-b623-4b05-bccc-08da7628e87d
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2022 14:52:09.9076 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s/0NTtZg2tgJvEC57TAXYGrZWhkiPdhQxBJOfjFLxkkVdIJh6DI9pGx+lbvHczhmqscxTIsFAsWE3hoSnF8rjB50jtB05L5klW7FoVDUejo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5624
Received-SPF: pass client-ip=2a01:111:f400:fe0d::727;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 04 Aug 2022 13:10:06 -0400
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

From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>

Parallels image file can be corrupted this way: two guest memory areas
refer to the same host memory area (duplicated offsets in BAT).
qemu-img check copies data from duplicated cluster to the new cluster and
writes new corresponding offset to BAT instead of duplicated one.

Test 314 uses sample corrupted image parallels-2-duplicated-cluster.bz2.
Reading from duplicated offset and from original offset returns the same
data. After repairing changing either of these blocks of data
does not affect another one.

Alexander Ivanov (3):
  parallels: Add checking and repairing duplicate offsets in BAT
  parallels: Let duplicates repairing pass without unwanted messages
  iotests, parallels: Add a test for duplicated clusters

 block/parallels.c                             | 112 ++++++++++++++++--
 tests/qemu-iotests/314                        |  88 ++++++++++++++
 tests/qemu-iotests/314.out                    |  36 ++++++
 .../parallels-2-duplicated-cluster.bz2        | Bin 0 -> 148 bytes
 4 files changed, 227 insertions(+), 9 deletions(-)
 create mode 100755 tests/qemu-iotests/314
 create mode 100644 tests/qemu-iotests/314.out
 create mode 100644 tests/qemu-iotests/sample_images/parallels-2-duplicated-cluster.bz2

-- 
2.34.1


