Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0350D2EFFB1
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Jan 2021 14:02:49 +0100 (CET)
Received: from localhost ([::1]:48768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyDtI-0000j7-0t
	for lists+qemu-devel@lfdr.de; Sat, 09 Jan 2021 08:02:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kyDpZ-0006Ei-DU; Sat, 09 Jan 2021 07:58:57 -0500
Received: from mail-eopbgr60103.outbound.protection.outlook.com
 ([40.107.6.103]:49158 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kyDpX-0003dJ-KS; Sat, 09 Jan 2021 07:58:57 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X40AG7ngRZETF9t0YlAcay1ExZubITbglHgbIs3X2QtheRT5dYBpW+D9IHb9O3B+6SPKf3eLO8WWq/5yZ7dJPHPcNCj7Xq1Gdc82Gn0e1nhS9yzGwBYM9EEyLYxZykM/CnYOvE/NBYwPInbxtkh7ObWRLRghq0TyCYhsgn9XmloXlrwqbj10abWSQ3NgzBQo5BUl6NelVqH9IfwPzPjuUxGIV1yTnkYiO8zlrZFYAd8Iu5DDUuidWaSZLrmsGj86dDh8Cuwk1ha8+z+HABDBzuxxw7HrY8lh056ClSwdep9R8W3TIFcQmCIIracIEw4UPDrk2AU9ge1UYUZP1tGLPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iTb4i/TU8HCHgeMPZ+/3I0dtaeoR6bFUd4N9WISs+2k=;
 b=LPsdMk8QDYidl5YacugM8n4INfpa4V7p1JaRv5fl+kHNT9xOomZvJaSFoOrR+Hjv2gkIlFMQ7HH7SRcgTMnv0I7yzqfcuw/byTyL1bn1w9m6W0mBIO7U/pTsZfizCySktEliQmILmI+4ogpqMGRXbA6W7GphokWyGFXfUdoGVEMXioqiMyYkXqPkRnfO67saWhSy0NmwWMILBPoUSIXIn8gP2EaHvnf81JRRtUqzwRmJ30Oe1VbuW1tuIYCWs0MQ3W4sYt5QU1xejmT2V4TAt3m9pul7SpTKM/zzZwuAQ3NoLFbtb/LRwKTVX+7gMeOQrd+3KlsPwOkJmc31TKB/Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iTb4i/TU8HCHgeMPZ+/3I0dtaeoR6bFUd4N9WISs+2k=;
 b=vHzQSmIkRX8k52EG+gdavMxcb7ypBt2cJPzkG0s7ZOfCWLhzmqxfktCQnuiRyKJW8hFdjV/Y3bFLu1VwUX6ZUS7IwrtkZEcO0i3GXcOKpvc7kEin8Bc/F7lpYj1GeLhABx+JPCJ4DCF42kmD4ctG+fNQCIibcIedNGFcA2IEWc8=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0802MB2418.eurprd08.prod.outlook.com (2603:10a6:203:9f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Sat, 9 Jan
 2021 12:58:46 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%7]) with mapi id 15.20.3742.011; Sat, 9 Jan 2021
 12:58:46 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v5 05/14] block: drop extra error propagation for
 bdrv_set_backing_hd
Date: Sat,  9 Jan 2021 15:58:02 +0300
Message-Id: <20210109125811.209870-6-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210109125811.209870-1-vsementsov@virtuozzo.com>
References: <20210109125811.209870-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.119]
X-ClientProxiedBy: AM0PR04CA0053.eurprd04.prod.outlook.com
 (2603:10a6:208:1::30) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.119) by
 AM0PR04CA0053.eurprd04.prod.outlook.com (2603:10a6:208:1::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Sat, 9 Jan 2021 12:58:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e42eb41b-a7b1-44fc-7068-08d8b49e4d45
X-MS-TrafficTypeDiagnostic: AM5PR0802MB2418:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0802MB241823F2341585567EC241FEC1AD0@AM5PR0802MB2418.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:765;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: q/CoCw/KHtRoqPNMNbE2l/UEHpbk9Bw8+g/g+/KWimAR7/ed0TaLOlFhvSO8rn4K77QTgLrxjAZ08FrAc+qAHpEh7C4evPYyGglGPOpHu9WbTpdGzlCtNkb5woAYdCNen3F+YcVWByDe7Um8J3sadqZUAmw4hfbHKLSFtXUXea/9w9hxVtDoC+u9cx1cVKgMHePyr6c6Zf9uo+BWw7mmPey7SKaA9b/gon6l8JDIbU0mtIcPSgXHW/5gVRr3vGnrpOTexweUIiddiQurLCJwI/XbMMhOxvDWOZqwyAhMURukAR5AJzfZyezwCbYCnnuiQYoVa3ePN5ki1tH5taqEwWACp7kMTINCde2yiXWhaZF2BHVgDxlM43GayvuXr+INnAD49IykZQD68OBYOy954g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(346002)(396003)(376002)(39840400004)(956004)(2616005)(66946007)(478600001)(8676002)(5660300002)(66476007)(66556008)(6916009)(83380400001)(52116002)(2906002)(6666004)(8936002)(1076003)(4744005)(6506007)(316002)(26005)(4326008)(186003)(16526019)(7416002)(36756003)(6512007)(6486002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?8oYX7mHu5IFEHUojNuP469XfgXJGKlIKEok38rCR5iY9onexz9gTsSDiRfiW?=
 =?us-ascii?Q?ik6dx1orBKXTp8Gw1Ln7FRMZdAOEzkzuwMOFHXAFLFgApOzS+538mjDePC/z?=
 =?us-ascii?Q?gN27u2V0DQD7acVO1H0OeJq2LTCI89xQDyIk1YVdjJvGE8IESNQrWRm09DcS?=
 =?us-ascii?Q?EsM9Iqw9RiGp8DJ9rn3uGHwrotvDRLWe1nB3AJDPO82C25eVcKZEmVAdqV+J?=
 =?us-ascii?Q?aXEkFKPk81cucRlLvWxtWGYw+vKBsIB//MEJamLK9hDiGhb+TftUD5B0ypNI?=
 =?us-ascii?Q?qQOlDVaHUYjZUTZezdzyd4UPhpGVt9F4h+/Yx6bJwDJn1eEU7++cocBaXDcx?=
 =?us-ascii?Q?Q6hgtCIL+5dOugoAOI4LWbeKmW6nj6xeR3E9L/yjdDkqX1bYj1GTdFu0wg0y?=
 =?us-ascii?Q?sOEfhjKTPVwZ3GH3ICg2+c4TrK+hTheJg1Xo8l+gWokyMbTtzjmDCjLHAs7e?=
 =?us-ascii?Q?KKBJDakTn4xi9bg3RYKaXeZefbl+Hcntbpr7xXvj2NP43J6NryAsFUrW6O9u?=
 =?us-ascii?Q?mEWq1yp2ukc+CtEXkw/8lz2RbGN5sNserNLnVx8RHeFcNSRfs3O+G9JQYcVf?=
 =?us-ascii?Q?MU5U516x7sTKKDOjO1ZUEDrH0H2nYOmjtcqpZJ7LoQakFhtlsfE044Y89OCu?=
 =?us-ascii?Q?iBf6tKWMqUoy8fYBkFMzEktFNEwz0fj+iZjrzaeXBbCvF3lCXW+/iFjBShi5?=
 =?us-ascii?Q?z3ExnZbxdUjrd9WZAZb/1oeR+quNcr0S9z3uc5ym2p6wmBRw07lnh/gk7PDp?=
 =?us-ascii?Q?ULo/h5XzGaThrmsubyXdzNwYRqwP3KpTduFZXf9bLjVbixY7EBUrTVh+7h8P?=
 =?us-ascii?Q?jXTKIWABTfCAN86vk9OZdQ/X8J0qVEpqY1wx4ctO1hHgfXF/PH4u1u7BF3UM?=
 =?us-ascii?Q?KPE2ft6MOWU2FkjML8JY0B1SnvVpZbkZu6qADKSTvruGd5pLKA+JybSmjh81?=
 =?us-ascii?Q?wbyrq/FPoMd//xl7eOIwoR02Tt4eAg2Xqnty5cmqISWH3tF2dyfFTkqF4nqX?=
 =?us-ascii?Q?udnj?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2021 12:58:46.6785 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: e42eb41b-a7b1-44fc-7068-08d8b49e4d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZqhKdaPGKM9VnvldfKL0OD32aIDZEHkvTYqsoMpjMRIsekdRRo1rTDEsiVk26LTUpmsq+t00VtZzXQ7XvB8Ce+Qtov+tcwdhkyRhdq21qSw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2418
Received-SPF: pass client-ip=40.107.6.103;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, berto@igalia.com,
 pavel.dovgaluk@ispras.ru, qemu-devel@nongnu.org, armbru@redhat.com,
 Greg Kurz <groug@kaod.org>, stefanha@redhat.com, pbonzini@redhat.com,
 mreitz@redhat.com, jsnow@redhat.com, ari@tuxera.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

bdrv_set_backing_hd now returns status, let's use it.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
Reviewed-by: Alberto Garcia <berto@igalia.com>
---
 block.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/block.c b/block.c
index 2a13fbfc73..0d7a62476f 100644
--- a/block.c
+++ b/block.c
@@ -2975,11 +2975,9 @@ int bdrv_open_backing_file(BlockDriverState *bs, QDict *parent_options,
 
     /* Hook up the backing file link; drop our reference, bs owns the
      * backing_hd reference now */
-    bdrv_set_backing_hd(bs, backing_hd, &local_err);
+    ret = bdrv_set_backing_hd(bs, backing_hd, errp);
     bdrv_unref(backing_hd);
-    if (local_err) {
-        error_propagate(errp, local_err);
-        ret = -EINVAL;
+    if (ret < 0) {
         goto free_exit;
     }
 
-- 
2.29.2


