Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F0E372843
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 11:48:24 +0200 (CEST)
Received: from localhost ([::1]:39442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldrfD-0000ha-Lw
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 05:48:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ldrcT-0006r9-Qr; Tue, 04 May 2021 05:45:33 -0400
Received: from mail-vi1eur05on2125.outbound.protection.outlook.com
 ([40.107.21.125]:31488 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ldrcR-0001RP-7C; Tue, 04 May 2021 05:45:33 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cw35bbtB8mF05yOtHdSD2g2XA590ScIY1J1Zi0bRNJY+/vqP2B8bKeQ07ZrMovM6A6+gs4kiyLyZpQr2WyS6G4uaXh7PIMhWvBLK2biIYc+w8c7T6giJhuc5HRsLbgxGetqbEPWwcDFW5tvHi2ousSFy3e3suGcSWAI/NtcegdyGgepRBbXAPZvRmMNBe4tUANlQliLjlECaGNKSbEa/5Il9mSeKBAdkm6eQUoJBwrElyzZ3G5SPvAvOSdFIoXGP7k9OPpxxjaY46zR21jRBQ3K6Or6WCoj1fywdXLqBp+MjkWKG3wOHfa+wU2sOzyUqZ6OpSlf6gMO62X//yenYMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b+lD9dsyde2gPEXgbkI09VYAPvmNkKEFe5BMnXZKMCk=;
 b=KjMbUioOxc7NEv1xD9cOQgBaf2N+MxVkuxrw7X2z/IBbETAX3QwKjtC/6kFsusP27aj43HbhEng4FwcKr4y1I0c6snU7vc57CUmv4g70GkAot/N7muqMP4oajt+Fq4gUYPAjYZThDcOpakqBTjNOfaraORRGnv9ci10mHWIFl312SSaf/zxFmttTZcFZRLQtS7X6SF/A5fmWchx4mzCK7rey+vqfpWTRGIJ92Hnzw1n5Dx7odBVYuT8dZNjRJTRtcz/Sq769YV1SqhzspFTIqehU5NscWsVVjO/g6LKqkwGsiD9yinAX95D8+6qOZ33RDIdbHm/wprbfAq9lvZYIGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b+lD9dsyde2gPEXgbkI09VYAPvmNkKEFe5BMnXZKMCk=;
 b=TmNy3gGHdoQE+twb57F+cAJIbbj7778tFYs3UIPSbRiBeJkeCPtoyQMl+CbuHFOvhLXIkQMfFZFfZ34xC+qVtiSHTqXMSbvg2iE++R+SF8eljcgv8I6deRZdJmy3QNv3oCfKzGQyvTGuh60F1JewAxSh41COpGOpUxGrwOYdVCc=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6947.eurprd08.prod.outlook.com (2603:10a6:20b:346::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.24; Tue, 4 May
 2021 09:45:27 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.024; Tue, 4 May 2021
 09:45:27 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, berto@igalia.com
Subject: [PATCH v2 3/5] block: improve bdrv_child_get_parent_desc()
Date: Tue,  4 May 2021 12:45:08 +0300
Message-Id: <20210504094510.25032-4-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210504094510.25032-1-vsementsov@virtuozzo.com>
References: <20210504094510.25032-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.251]
X-ClientProxiedBy: HE1PR02CA0107.eurprd02.prod.outlook.com
 (2603:10a6:7:29::36) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.251) by
 HE1PR02CA0107.eurprd02.prod.outlook.com (2603:10a6:7:29::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.24 via Frontend Transport; Tue, 4 May 2021 09:45:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: be0a86fe-0da9-4c92-d7e8-08d90ee158ff
X-MS-TrafficTypeDiagnostic: AS8PR08MB6947:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6947590D38A74AFCFFCCE48DC15A9@AS8PR08MB6947.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HA7ZpT/7/3AvSwrsuhnw608E4rD9C0DV4O8zUSNaS46+3pr9WJsuuDLhRWFTO3RxO5r4F5U5VQ7J+UH0Yo+nFsMyvIps+y1TgdDT5wWg5DFR1iiawdf6CTqUJRXjy/swxmuA0XrwD7Q3PZrvKJyGhKMY108hBrYUgzw7thXUGFiiDDIiAt7e5z1to16W/yMMQ7uIInlt+6XSNvM3Hqutg+VL/aE6E/Autd58nYDQd8zczB+mussXvitOYlLheU3ytY87FA49Kg53YLBMA0X+UHxKJ3yNJJvCtzaFCy/+nJ0lLL2F8qnSBn4CADph5+fmHzB5OYOs7AFssLpZbTe+EI5iZeO/7KUB/iJ/e6o3nmR6J8vxMgqkQHQUAKDJ2JGQRwKfsWlsP9gjd5xWz3hUtA0LDfju5rd1gN2vXj0W4gLcV33CLOgDyJnXWDkUAtYV7Ahu7XVQ+B2fGSD1hmZGyG2EHK4sNKXKttql/ODrIiGKmQuZGQQczBFoeLV9grq1h5hormIiMyyjFdinZeuOxFiTqnUhc3u9LYC9iJVmlqspQprq444+DbZDyIcTxMvPHqURaIG5v8lT7W5LHX+TywtxvQ5QXDPfrCTf9Rq00NivZAoO19NQzn5oAuY1R3GSyd2nXL5zZ0DRSxUragdOnKWDTygVrtv1Zcx2+aefGQwk/seksK8bd6sXuBFWNos1
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(376002)(366004)(346002)(39840400004)(6506007)(66946007)(66476007)(16526019)(52116002)(36756003)(83380400001)(6666004)(186003)(6512007)(86362001)(38350700002)(38100700002)(66556008)(478600001)(4326008)(1076003)(5660300002)(316002)(2906002)(8676002)(8936002)(6486002)(6916009)(956004)(2616005)(26005)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?o23YKlp96sSEG+Ky7Pkl+ujJkqMTKZWyyANhk/aVveJ5cgjrQiBxT3ubSD2A?=
 =?us-ascii?Q?ylQreMcgp37VMCWryVtJW0+CH+sMUlBHKeq1ECwFd1QzVvSDzRGpYkA5dqF3?=
 =?us-ascii?Q?9IUkG2RXKfqws5eNOsYnBTc+AnHPlFeYGoQ+7M0WSGEGedV8PNOO7USBTFz8?=
 =?us-ascii?Q?Afhbh/WFROOxVp6+VyHfsUTjup0OGTsJdVPQfibJQ/jF6G8ezd7iKc1aOiFw?=
 =?us-ascii?Q?FSefSqf9bYZhYoT+PlDOpdeanwtQTCRZvK6ZYzcKOIul7Y9aFp9TPzf3cuL5?=
 =?us-ascii?Q?aSLDlVZ8mD8wgMbfQbmOZL4VoTFFFiRltB91R2PiDdNcLj8ZhqIVTqrrKVIW?=
 =?us-ascii?Q?SPe6gbyi+b/ZN7MUR1YZEvIkwZVRCQ0rhMEpSTVxB+WGm6zscDaMn5hIyHCU?=
 =?us-ascii?Q?UCyFM91RhgSQcfMQmj+R+XpJhWGYHEMjxz+oc3w7t9BT65oIOO8eUcT7u/bz?=
 =?us-ascii?Q?b4N56gWg0WilqCfNgM/EdItweZMZlBBw0pCYTCpxTPsQRmJyza6xPIbtdEHh?=
 =?us-ascii?Q?xc09AkVnQtywpGjSwUbTZ1Ty1gFAjNzTTPL4HIv5mJw+vNS15HA9z61rDIA2?=
 =?us-ascii?Q?0YSf6LKJJRDhvbG3ISLBhpxMmqGsjV9DvBs9ojLUYn8KJbtClOXemXKk4xQ4?=
 =?us-ascii?Q?uXRrEyfuqXvwkwRrHmH6ThN28S78jPj5B9klnPxmXZAePzrhMAiIRfBXD8z1?=
 =?us-ascii?Q?5JeyhicYSP/fKlxIMilV4DRtqCUXvYNR/MPEXAeF1GHOQ1gxNEi/b4Be/nzP?=
 =?us-ascii?Q?lCxn8gaZgx1FljQTZWGpC5X/C8y4h35qPeSmiDSp127hGx867uhe6x0WbweB?=
 =?us-ascii?Q?S9pKsHPd+e2cYMis4pFuJpmstetRxaF3+zzar2akh9ElRpxGkf3NMfxDxbXa?=
 =?us-ascii?Q?rDImS1JSa+IGAMDFRYLPcYjVntTiq4096LdKwTwBhXjg1QufdZKQl3bYhTPd?=
 =?us-ascii?Q?P8Bg5HlHRdANVA/6CEVgfBnj2zO/iyGtRLZLZA5Y+l5DeExdxNz9/LPRkfk1?=
 =?us-ascii?Q?vfseNcSB4e8LPK6WLFKFErV3n43rnKY2tdQFg9Btjj3kTO3HpCqoRco8q0W5?=
 =?us-ascii?Q?w5n+N+lV3lu0ndjhFQNiKsaI9rKJ+U7/W2Cl0o8kjrtkTZY6/1avo/OW2sFm?=
 =?us-ascii?Q?yQeXtvoqfeLbz6j59gzZ6AISDXxoda7S0pc9Rg4ZE5EdxKy+MoG7DDamnEhi?=
 =?us-ascii?Q?peGkAbe3a3xM6ROmFLRU+fEWc16ifhNlmkj0/2etJMYyOmk21lnd+JuLbIyC?=
 =?us-ascii?Q?bpIiCIjJ52AbZgrTLTc8Rf477242giCCMBJDCY0F/BSzh40rJylf68659i3T?=
 =?us-ascii?Q?0j9FUnt4rlz6tplkZgVa5C1O?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be0a86fe-0da9-4c92-d7e8-08d90ee158ff
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2021 09:45:27.4283 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kr551PZMUxWOGrLYA2V1H36EstMHeZEOkmicZuKO2ou2zuTti8lCovvFh39PqpRyLRwFjrlN01/T7yh9OB16X3Zdo1v6bq8QHkU/s6cS0qU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6947
Received-SPF: pass client-ip=40.107.21.125;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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

We have different types of parents: block nodes, block backends and
jobs. So, it makes sense to specify type together with name.

Next, this handler us used to compose an error message about permission
conflict. And permission conflict occurs in a specific place of block
graph. We shouldn't report name of parent device (as it refers another
place in block graph), but exactly and only the name of the node. So,
use bdrv_get_node_name() directly.

iotest 283 output is updated.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block.c                    | 2 +-
 tests/qemu-iotests/283.out | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/block.c b/block.c
index b9df90d61d..54a3da9311 100644
--- a/block.c
+++ b/block.c
@@ -1152,7 +1152,7 @@ int bdrv_parse_cache_mode(const char *mode, int *flags, bool *writethrough)
 static char *bdrv_child_get_parent_desc(BdrvChild *c)
 {
     BlockDriverState *parent = c->opaque;
-    return g_strdup(bdrv_get_device_or_node_name(parent));
+    return g_strdup_printf("node '%s'", bdrv_get_node_name(parent));
 }
 
 static void bdrv_child_cb_drained_begin(BdrvChild *child)
diff --git a/tests/qemu-iotests/283.out b/tests/qemu-iotests/283.out
index 97e62a4c94..c9397bfc44 100644
--- a/tests/qemu-iotests/283.out
+++ b/tests/qemu-iotests/283.out
@@ -5,7 +5,7 @@
 {"execute": "blockdev-add", "arguments": {"driver": "blkdebug", "image": "base", "node-name": "other", "take-child-perms": ["write"]}}
 {"return": {}}
 {"execute": "blockdev-backup", "arguments": {"device": "source", "sync": "full", "target": "target"}}
-{"error": {"class": "GenericError", "desc": "Cannot append backup-top filter: Conflicts with use by source as 'image', which does not allow 'write' on base"}}
+{"error": {"class": "GenericError", "desc": "Cannot append backup-top filter: Conflicts with use by node 'source' as 'image', which does not allow 'write' on base"}}
 
 === backup-top should be gone after job-finalize ===
 
-- 
2.29.2


