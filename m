Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F30E22CE1A8
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 23:31:37 +0100 (CET)
Received: from localhost ([::1]:36956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkx8T-00089Y-1R
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 17:31:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kkx4a-0003wM-9o; Thu, 03 Dec 2020 17:27:36 -0500
Received: from mail-eopbgr140112.outbound.protection.outlook.com
 ([40.107.14.112]:63621 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kkx4Y-0000Cm-Vx; Thu, 03 Dec 2020 17:27:36 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mp8XpiGIA1WGsektrvCIaHtINDouRX98rIdq00PDr6qZp2IXH4dx7zXAtsb2xxyZObM4uYJBo1OFyPgF/ejpOAKPJJ65EQ5RKLeOCpN3v4WQa6wqo6Ix4mz93M+HczkFMRp64eqQLFMsvtvxBeVlWNIpZkJh/MQK3aJJGtzEXZohxOB2tu2R8NoBFJDY0km2QSggTqaVYTWkhyGAFeWeVzPNHYvSigj4YoLXHCP/UO6loGPC6iqVm5mPpBfqAwE6G/TWFrcCbZIPrmOdoJrfBoprMcrY2r6un9Bzn5hLpR4/UI4atKRvFYwzXlolEJhlexSaA+t/XfWKexyaOzkDDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=89fylv+4Ut/9LpYp6Ye5PB1ZhSCSLm5k0FGorHeLhno=;
 b=IEYdiz1AvxE4oe/dtJu9Emb1czW+Z7ZiRoLhnvR9W5F2dv1p7Ih2nmYqoZa/6i2YCETXTJ4q1pzCr+jJUYsaO3SHdKLOvAGrLMUMsNVUR2i+z7lTKIQ5CE3lBE9Uo0q5Bcc/LUhTb6zoBYlyfjXJkyVjB0ahFwZt/OqOWu+Gw2iC/KQp7x3UZEZe/gyoGI6Flbvhd8Bom3s8za9yi8pZo4fMlWfnotjD9MPH5KugTZaPN619kjRyLrLk6i0XBtSE07oq3Qxi5Zof3P4owA3uWYhfyAoqhqlStHXTj+wV20OVfsKmyqI/DPRFATIkt10DQvKuas7WkA6E1hfUeA7Q8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=89fylv+4Ut/9LpYp6Ye5PB1ZhSCSLm5k0FGorHeLhno=;
 b=BCMop7H/YE1EKY9D5jgjNB1ENDzhTho0lICFKxpicaF6dAXYPLK/v6ZAFZhxdAWbsnSQc26BfrohCzx+Oeuqy6iZkXID5sL035yCI23rCbFh7J0mka4t7hi5M/NhS1l5qsEGbvRacrMPTwwIz7MTc/yu9Dt0ZAKq7H/mZ8hLmts=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5446.eurprd08.prod.outlook.com (2603:10a6:20b:107::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.20; Thu, 3 Dec
 2020 22:27:29 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3632.020; Thu, 3 Dec 2020
 22:27:29 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, fam@euphon.net, stefanha@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, eblake@redhat.com, berto@igalia.com,
 den@openvz.org, vsementsov@virtuozzo.com
Subject: [PATCH 1/4] block/file-posix: fix workaround in raw_do_pwrite_zeroes()
Date: Fri,  4 Dec 2020 01:27:10 +0300
Message-Id: <20201203222713.13507-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20201203222713.13507-1-vsementsov@virtuozzo.com>
References: <20201203222713.13507-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.91]
X-ClientProxiedBy: AM4PR07CA0036.eurprd07.prod.outlook.com
 (2603:10a6:205:1::49) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.91) by
 AM4PR07CA0036.eurprd07.prod.outlook.com (2603:10a6:205:1::49) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.7 via Frontend Transport; Thu, 3 Dec 2020 22:27:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 72726a01-d6d2-4f51-be66-08d897da9e92
X-MS-TrafficTypeDiagnostic: AM7PR08MB5446:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR08MB54466A6AE2F9EE135FE78686C1F20@AM7PR08MB5446.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1824;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Kp192CNUQrgbGZh+WJ01GoSVW1+ZJVvNoY/0TDl1IvdWHAbR8JYYmeeda2e0am25Ke67lmD8v3NHGA42i9hXrPHhPTZCheiB+ybIOPxwTz6jgQwZZj/UWpfxCLzgHZK2QcLKNcV3ueoQTUQcefmjk8GoGWqsduWmSZLeKgzUkz9aUyHptmzgHoeehRqMUhj59Ej/eChzL/anC7kR6CjHcghIiYLeUvNmIhiYkiA+BCcXCtKCJGNh947PQRIZwW4C8AXm6O3ZmJQ8YzuiXBVcQfK3olBYozNSSexG2fOIJegn6N2+Sp3hmuW2qpmEezmcUafTFjFWWrfwC1/2Ojyd/Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(39840400004)(396003)(366004)(136003)(4326008)(2906002)(8936002)(6916009)(2616005)(36756003)(5660300002)(52116002)(6486002)(478600001)(66946007)(66556008)(66476007)(83380400001)(86362001)(1076003)(8676002)(6512007)(316002)(6506007)(6666004)(956004)(4744005)(26005)(186003)(16526019)(107886003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?WBRcXG3JdPdcc29fd0a9isjoyPXsnL0EHLfs971zURm0kKGeOgHd7qSmbKr5?=
 =?us-ascii?Q?l+ImuJ0Hy608RlwXHeU5zg4mMS9HyYW/t8cHVW7e0SNveYnKeBHrqxpTuPPi?=
 =?us-ascii?Q?xDMCbCs5+yB2Etgdml+glqvFLIYGmRlpNis4eUDLyGU4W6rVeBHs/MTeobkm?=
 =?us-ascii?Q?kqePVjBA3qbuWQhojowEYt4aEwFke3kTQzgIQ215H8L8fJ4J6hnYnVACM4L4?=
 =?us-ascii?Q?aP6B+zHcq4Mnz9NLgrYZTNUqpFiC3/a0xb9XZ3/AbLQxf7IzN/F9DtEsY3zb?=
 =?us-ascii?Q?IPszDiwH8bZAwQozkpATGIcFVX5nb+NA/Pls7y74sULW9lHNgeiMyxufzDbw?=
 =?us-ascii?Q?G4naMbf9tksP6ZaOlaMpGtXx4fRe9BQpZEEe/MC+I30jfYtgdXoCrTyGYM25?=
 =?us-ascii?Q?8bw0GqiZ6953eJTXrsIXVDjGaywi/gh3pW4IatRez7lN9dUu55XWmeaadVvx?=
 =?us-ascii?Q?AWI9y8jgV45qyK5vCksGZaGjsR395bgS6D7WJwx+hkG+poF349FDt5XwRMC6?=
 =?us-ascii?Q?LuxkIji7Z1lIOyrW+apKkqjrIXIF/1SKdA3POjKFHq79l4U8Fk0kNpDwo8dd?=
 =?us-ascii?Q?lOFmPL9BOFGYwAeR4HC3mMUVbA0BVEm2MD5J3k84sL30iRNOgEX/zzI8ufiz?=
 =?us-ascii?Q?Hy5l3BMCK5+JHfz2dKKMXU3Dzay/qOOQ6fEOcS/jircyd9ppeJ/IrRwR9BSf?=
 =?us-ascii?Q?4AP9ITAVHubdZeHxJUbWlhAO0u0gwMd8r8qHyVrEYKQAZ0GrPB68pcKh028n?=
 =?us-ascii?Q?WBU1Hbog4E32UAnxReU/05Ecgz5o8WSCO4ohim91Byv7cZIe1Edw8lQBbd2A?=
 =?us-ascii?Q?oH+3bAgfAxkOpHgiIPOeXhb06Z5M2XF8I2llljzMR1biVClAzDLIIf2FlK9m?=
 =?us-ascii?Q?rku48hVGn9ce/Vz5rn21wKbp+3Sr4I0WVxkts6ZThGb41k+6BIVHdsEfIQH7?=
 =?us-ascii?Q?Hs5orP80n9A0k9rX/gB08pGEKCbNGbslXGA5osWK/i/P1+nzAtuErb4dkdek?=
 =?us-ascii?Q?L9D8?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72726a01-d6d2-4f51-be66-08d897da9e92
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2020 22:27:29.3400 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wrFvKZ4n+xM3WInMfXlsX5adwG+0Oz1LGLNQ0xMQSEeRTcFEQAvAPhPFuBBwfByjwTEvQse5l/B28WgyL5Ft0/v0CW7T3O+IU15cLkMs5ew=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5446
Received-SPF: pass client-ip=40.107.14.112;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: 5
X-Spam_score: 0.5
X-Spam_bar: /
X-Spam_report: (0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, MSGID_FROM_MTA_HEADER=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, RCVD_IN_SBL_CSS=3.335,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

We should not set overlap_bytes:

1. Don't worry: it is calculated by bdrv_mark_request_serialising() and
   will be equal to or greater than bytes anyway.

2. If the request was already aligned up to some greater alignment,
   than we may break things: we reduce overlap_bytes, and further
   bdrv_mark_request_serialising() may not help, as it will not restore
   old bigger alignment.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/file-posix.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/block/file-posix.c b/block/file-posix.c
index d5fd1dbcd2..1b35bd6cfa 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -2952,7 +2952,6 @@ raw_do_pwrite_zeroes(BlockDriverState *bs, int64_t offset, int bytes,
 
         end = INT64_MAX & -(uint64_t)bs->bl.request_alignment;
         req->bytes = end - req->offset;
-        req->overlap_bytes = req->bytes;
 
         bdrv_mark_request_serialising(req, bs->bl.request_alignment);
     }
-- 
2.21.3


