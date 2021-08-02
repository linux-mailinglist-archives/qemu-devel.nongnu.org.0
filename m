Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE16F3DDFAC
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 20:57:49 +0200 (CEST)
Received: from localhost ([::1]:56126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAd8G-0007lF-Rv
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 14:57:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mAd5G-0002PT-PC; Mon, 02 Aug 2021 14:54:44 -0400
Received: from mail-vi1eur05on2137.outbound.protection.outlook.com
 ([40.107.21.137]:42689 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mAd5D-0001pD-2D; Mon, 02 Aug 2021 14:54:41 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YKqXq8jofr/plSX9jKRkngq9YtGXGA8jogne7aQCwvwqKrVw7m4o2Dj138pUxiD03xZYCnqUtVZMfakPQFEaYNyYlytZsIWRN/o2nshizVovF6Vrz/zxEIKg6mVoabxcRWkFe9Ruo9MoYoQh/FKsycDt8A1lTaQqcJgwCIFDHvtmPPhTVmWME3Oum0YB/MT6iFHMzmOf4P6HGN/zxqN+VBl/zYAKA3jLOe4kS3bCL50+x3pcmvrHAsn8WizvT24IjymHRJmJ+pNRtMp5hnI2Tm7PRfc4Ln/Hko9UCZGykx8zyYrHWZMTCDFUsUpsUcWon/v7znZitjrHwHL3bZk7tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ihev6lnGTb6C/JZ6h936hMNFegzy+SLHYLw1VCPOp0I=;
 b=dy3tgtUlszNiiWlUwXcNmr+jFQITLZWaSsaD1RTItFuPZOY9hBwJseutCCWAH0622WUlU21/lmYg5NLm8TQ9Q15Uu3OMvwr+gNTp5vCRsnwotTycIXZ6Nh6OeyNrhAgaVUc5AUeo8Gq4qJXLmzWYuagi7oZTYCwZF+Rxrc5lYd0ovFtVCZoNzOWBtwzd1w32zPZtFlBS9HXeJ/EQiZQSWacbCGTS2dvSXDibCSMSPzYGvf1qgjeKJMb4/tmwMjjNpsQ8Vw+QWOwXDFAedLASWPqwCCYV6KdBOEAfMJC+JLs15y6HyoWoN+1tvEs8QPgDMUfjBR4aSpwPNUy5JEmmRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ihev6lnGTb6C/JZ6h936hMNFegzy+SLHYLw1VCPOp0I=;
 b=KCIZv2FNv0STbOqp9sa9N5oSNtWebTHa5STmWw+NErJ5siQc9uZMfrH/lG7RrBLLiPYYMNxJK1LDaRDm9MquDbauHDvRx6dw+ma+vBfe1YigYiaqLEZRp5S0srHC53iNnTCxbTYhYRIo6rLyScltvSsh1KE2+rBdLcrN/U7x57A=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4405.eurprd08.prod.outlook.com (2603:10a6:20b:b7::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.21; Mon, 2 Aug
 2021 18:54:33 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%8]) with mapi id 15.20.4373.026; Mon, 2 Aug 2021
 18:54:33 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, armbru@redhat.com, eblake@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 den@openvz.org, nshirokovskiy@virtuozzo.com, yur@virtuozzo.com,
 dim@virtuozzo.com, igor@virtuozzo.com, pkrempa@redhat.com,
 libvir-list@redhat.com, stefanha@redhat.com
Subject: [PATCH RFC 0/8] blockdev-replace
Date: Mon,  2 Aug 2021 21:54:08 +0300
Message-Id: <20210802185416.50877-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR05CA0240.eurprd05.prod.outlook.com
 (2603:10a6:3:fb::16) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.211) by
 HE1PR05CA0240.eurprd05.prod.outlook.com (2603:10a6:3:fb::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4373.18 via Frontend Transport; Mon, 2 Aug 2021 18:54:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fbdb4ebc-db87-4352-9ec8-08d955e6f767
X-MS-TrafficTypeDiagnostic: AM6PR08MB4405:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB44052F4958C47A537A97632DC1EF9@AM6PR08MB4405.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1+FXYsKpCVD2MmQelduZxkhgPl/+12MTGDwfTM7orDvJJ+p/wc29j/0D5FCzVkGY/CzOXcR7PedA982dk89vKNhCkKnN9RgcZWIlRUUj+JPO6Gy1IlE+e7xZyVJJDj+aPc03mVTa+hK6uztkuyP5vliqfnE13RwSu7lh64S/t05RP7VBgBusZCsWA20wJ/8tu4wKKcTS9KNslG2cG2fafHpKhY34EqNi82LELxg+ELYLUq+74uuxqLHZdGKGVvJuyAD31UQT+XRvN6odZxA/uUGGgHiPLqQN9EE6mz4AhM0OMlNI7Cjl3SN/NiOcZNmVQ5lyWyd/zFli6RGneY4T52hB/X48P6zZ/T2Q8gax18sxQae1bF9F41CelOwm5fxuE99wxCHu5q/qFhuSwAlVW0tb8L3Dpz8OVseAK8K4gkcALGSqkb961Ph4EO5n0uKMNMLf1ASODtPYKws8AImbuBKKqZb5NZTOn1u7dyFOAwVtPws3Ee3EHmmiOxXGLxHOeB+xxhlj2cfaoFGbeoHFLaqqtZNV2+gHBA0+OEeThyJ5ityAIeUjBlNqtMj9WfjJhrDyrFdEK9GAt8XE9pwgRbqHv8ML21AscQV17EMR6GEIi9uauN4O1K5X7OT3iX3QZPrUjH/kmcQDUd0SSFVpwyoufdtpGl9/d8Kbk4Q1Hh3i4wPcj6jaszVkII3cp4ta0Bcf56OvlmOcUKOXczhdvg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39840400004)(396003)(136003)(376002)(346002)(186003)(2906002)(316002)(5660300002)(26005)(6916009)(2616005)(956004)(38100700002)(7416002)(38350700002)(4326008)(36756003)(86362001)(6512007)(66476007)(66946007)(66556008)(8936002)(6486002)(478600001)(1076003)(6506007)(8676002)(83380400001)(6666004)(52116002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?10qRzq2VtcLhix1WmSkQUWbNG9AIyTgG1PS1lvp/evogZkFPnkmteNJYDMn8?=
 =?us-ascii?Q?GzuHP/TFYq2xLtWPx6S7in9+CASy9oUAU1m6XGz2GLhlcHSNO9ZXJQjrnJEU?=
 =?us-ascii?Q?yseiRoZDc+jwukNDNoTKHUDf9G7wf6RmvjPHxMXcPt58LeFJvbXXEqOBiZJA?=
 =?us-ascii?Q?Q1kuplnb1HMxCh0hRCI2fkkuNPK6hdcnctqasPegiheYWRAVmw/xl+//7GlZ?=
 =?us-ascii?Q?2+r3WkrXZoYQPOH/g+yVbLsvS8jvDj9AahquetaKXa9anyyL23GIux8TCgV7?=
 =?us-ascii?Q?MXwaAOKHUy9mL88zm+4bmVD+6j9s2m67chH5WFQJE2AkADd6mMTqpvj4ZBST?=
 =?us-ascii?Q?jCJdZpc3CIUOL8iRogkGIvRMAg/sFs3DLFtyAswEqRi/xndbabjYX9rKgrCv?=
 =?us-ascii?Q?8VeRW3qADy3fXevCcItgNO2u1DtmOQPwbMr0IoVOOLPpOJOzbbxVpXRInRqn?=
 =?us-ascii?Q?ApYPwVuJa+RkIMqyUF6738Nnl3AE/+1PWIlRUzBAuTXNJrks2s3oBNc5ERFr?=
 =?us-ascii?Q?VD/wqmfkeSYMUDzBh3jWhYKPqGaedBg2O9BOxRaP7Xcc5ATRpbLmAgrY1paL?=
 =?us-ascii?Q?gE6Ausx8mvwevQOUDCTqKQyK4Jl0RddZcM41BRne5HHAqZca+K/WW+m2lLa9?=
 =?us-ascii?Q?GLSDSkoHbwE6qZZZH1r3uQBhHfHPMkogOONwAJ2flJCSjzPhFETTjgzGYfd+?=
 =?us-ascii?Q?vy5GeA0A6Aw0KEO5qxud5udFt2/cO8wrxVKNmZxmydA9vDrlBTrAW4slVhy+?=
 =?us-ascii?Q?WymlIsG/6xHSEpPbyjbEI2hSuTfOjq5TTyp5xCAKQOiCQDKr+tmgbBz/ZmMc?=
 =?us-ascii?Q?u5Bl4to0Rol16ZMfm1c8xDK2bs/pk6l6gHXnk7ritzM2qPcpaBIDpYdJzpKW?=
 =?us-ascii?Q?s8NL5DE7kav/gT8C/v914KS4nybYt//ZfkFQg+Eja8vMPJIIZKSfvx99zgP7?=
 =?us-ascii?Q?S+mGfptunsvFGkUHmWfGZhHJTqGTHkKpmpG/PkPhDPUHBAA9perrI7ynjuSu?=
 =?us-ascii?Q?ag1aEn7evDuFCRwT/M/R0tOX5T0oyZTvT+ubxmelosfI74C3cINQjDsusqNK?=
 =?us-ascii?Q?FVjoYI4i2Ot3BULsuGuBpCVZV00T+f82FC+2aeBgnu/itSCpwld+L4yjkY9b?=
 =?us-ascii?Q?xZGhzcrWMJTG0MMnPzZwgAjPg8hGCpU88Ammw6yVQTK+EBlHRlUixMCjjF/y?=
 =?us-ascii?Q?WCp+81SIpLwzIrHUSPTlf1qmGYHozg+UljmktQRK5OMoRBhbCgrLwyd+aKyl?=
 =?us-ascii?Q?9U8Jlus9HlNT6VRHH/zx6DButy5aWArxldeWFp9B2LhnwWRToNadQoekKSfY?=
 =?us-ascii?Q?jMaBdaIzwAnjwHWZix87o1yy?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbdb4ebc-db87-4352-9ec8-08d955e6f767
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2021 18:54:33.3717 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KVXo8TJbaWVBBNczA8sYvneTcmAmgXqRAgGVm9K9/NOyQCo28ZUQEs6XUMprsYP5YuB+XbDxzuhDjZIUJpKsMszd1mghMBYdveDcp7eQ9V8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4405
Received-SPF: pass client-ip=40.107.21.137;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all!

As a continuation of "Qemu block filter insertion/removal API"
discussion, here is my proposal of blockdev-replace.

The realization allows:

- replace children of different parents: BDS, block devices, block
  exports

- automatically replace all parents of specific BDS, excluding creating
  loops (like bdrv_replace_node())

- do several replacements in one transaction

It's an untested draft, so you may go to patch 8, to look at QAPI
addition.

Vladimir Sementsov-Ogievskiy (8):
  block-backend: blk_root(): drop const specifier on return type
  block: add BlockParentClass class
  block: realize BlockParentClass for BlockDriverState
  block/export: realize BlockParentClass functionality
  qdev: improve find_device_state() to distinguish simple not found case
  qdev: realize BlockParentClass
  block: improve bdrv_replace_node_noperm()
  qapi: add blockdev-replace command

 qapi/block-core.json           |  78 ++++++++++++++++
 include/block/block-parent.h   |  32 +++++++
 include/sysemu/block-backend.h |   2 +-
 block.c                        | 158 ++++++++++++++++++++++++++++++++-
 block/block-backend.c          |   2 +-
 block/block-parent.c           |  66 ++++++++++++++
 block/export/export.c          |  44 +++++++++
 softmmu/qdev-monitor.c         |  90 +++++++++++++++----
 block/meson.build              |   1 +
 9 files changed, 453 insertions(+), 20 deletions(-)
 create mode 100644 include/block/block-parent.h
 create mode 100644 block/block-parent.c

-- 
2.29.2


