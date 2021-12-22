Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B0647D630
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 19:02:18 +0100 (CET)
Received: from localhost ([::1]:47160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n05wP-0001eG-GX
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 13:02:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n05bt-0001ZD-2C; Wed, 22 Dec 2021 12:41:05 -0500
Received: from mail-eopbgr60133.outbound.protection.outlook.com
 ([40.107.6.133]:36163 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n05bm-0002Zq-WC; Wed, 22 Dec 2021 12:41:04 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mkNpOPbA3fQURCBpkMglgj6HNXSgfQtqzkdXYpRYAv03Bd3PI93w52AZuEWAvRbMlsWv/J7op+3qTicCsYmcFEGjyokA8dkM6XyVJsNWboYaeFmJ1LXC36gi8Ccts39tqmTcVplPZsD+/0KfU+VZOQ0+gBhOm5P53OEu+CX23/krHvO4WXPZsdETFrOIx9D3D/B8gYjqTedwB2Wdx5OcFPBwDaYX8KOeMVehoMtgstXY6M6kn0kx9LiHisVpjIPWSGqinQyOVrFFIYDyNU1FjHDP4mjblpsK8C1AUUfanMRvCQ2icamis0KuCE90OhxuDSb0rk9kgHNTcOyjwGODsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mniKP/3EA5x2CHyTzvADdVyDSQ5tMhsYoqy4/Vu7G9o=;
 b=XColKTcMMJYhqXHJ9aVM8Aja6nrgWANUBZ5vCs+mnZ3XkNMesr7r+N0rNVUXdMWSR8UW3uITDfEiK1xLPzY7cWTlgMd9lEd84kSt5XVFxSv56VO9lKGnfAdLp+VKSS+ZNjS/rroFak3Ko8dSii9zoB7VXij/V2H2OusWtkcaWt0lnSNmZVu9LBEsYLPOB+EmAuRAtng3KoFJAeDadN3ZWs2PVeiPGvuzNBwTkgFG78Dv9UBKJ40r/sxnjVHBn9EMZxXR29yiX6YjOe/hqHckhMh7r0oATVj0mHDaSLcIbzWdz1hvA7piymXvh+RAyJ4z6WVzd8GfHj/VOS53EOvYdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mniKP/3EA5x2CHyTzvADdVyDSQ5tMhsYoqy4/Vu7G9o=;
 b=Yf2g5/Cl45FU28OAPKw4kDYhmgMyb+7wwvOCiO8vCBVO+m9QCQmhRKvdmxnNj5XybXOYi43wWQYE44CkUAurrXlpFPLe+HlxT4DwkB7gqlOZaqbhColUfmPq6nA/PTwZVYyqPi+4d4pqrYCD/1gI9HX3wjhSnGHyMN7HPw7bIFg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from DB9PR08MB6748.eurprd08.prod.outlook.com (2603:10a6:10:2a7::16)
 by DB8PR08MB3964.eurprd08.prod.outlook.com (2603:10a6:10:a4::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.17; Wed, 22 Dec
 2021 17:40:44 +0000
Received: from DB9PR08MB6748.eurprd08.prod.outlook.com
 ([fe80::a89f:c7bc:b9f8:fc3e]) by DB9PR08MB6748.eurprd08.prod.outlook.com
 ([fe80::a89f:c7bc:b9f8:fc3e%6]) with mapi id 15.20.4823.019; Wed, 22 Dec 2021
 17:40:44 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, xiechanglong.d@gmail.com,
 wencongyang2@huawei.com, eblake@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 nikita.lapshin@virtuozzo.com
Subject: [PATCH v3 15/19] iotests.py: add qemu_io_pipe_and_status()
Date: Wed, 22 Dec 2021 18:40:14 +0100
Message-Id: <20211222174018.257550-16-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211222174018.257550-1-vsementsov@virtuozzo.com>
References: <20211222174018.257550-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS8P250CA0017.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:330::22) To DB9PR08MB6748.eurprd08.prod.outlook.com
 (2603:10a6:10:2a7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 93cd1802-2277-4f53-fcec-08d9c5722e2a
X-MS-TrafficTypeDiagnostic: DB8PR08MB3964:EE_
X-Microsoft-Antispam-PRVS: <DB8PR08MB3964D35A815EA0613AC0571FC17D9@DB8PR08MB3964.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:337;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JNt8LnGgsuxYpoXIIwFNQFcSduBK08/q8JxGT+rLAFejnWsAmxATicx73Qcc0qXBNf7s+QAS4RTpFBQH/bEmG7/Fh+RaDCEC4JsQq7GZAD+cNay2NqDxh6x+o1wxND4VuDKOStzZphWtpR9IIjC67wxTcL3V67ED7fONKOAUJG7zYWdMAekNMRXeT6fCHPzYFFYQMocgxiPTKF58i8XLMgIl9xlvtISFfuujPUAni9f5ceqwM6CEEs441ujQLb2BQnfzO/WPj7gJjRiBFq8QufKKz0WQtOmTMDg1wzZW7e3GTTQLTYglaBoaI5g9VugHHftaB61L4FZpt4ypsP6k2kUFSUEufg2o/4yDjN2CKWkgJsGK4orbxeNTCInTKgjNDwq0Rtk75oAcIaEkCQQqfmRUW12GuZXy3wqofJg73gkMdfQRcfRhzy81Ezm61QOGsjjd5zFU6qV30uZCE/CFIV6b9C0AVHnJ1rP1ISzAOYFcg5MI9ptjEkiTMIuUIAHzeTk307nscrfrTdlXzI3wMVcjnlvhhyFrth1t6RITZZ5wPw8B7dzsf+5oLPFY4qo4eYWI2Ib8sYmV/PqGLroc2YLb6xG3mkoim4Gt4XlH8/lNnz68QDL11bEenx2RYZOICg59dvbOSQQzTxAfEdbaEaVnbbPQ9l6ehc0UR3cHXi1YzV+MdoGNqXXSIu32zeAZ0Ws84W3rriw4vkKJnjFqjw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR08MB6748.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(107886003)(6512007)(6506007)(26005)(316002)(4744005)(52116002)(2906002)(186003)(508600001)(6486002)(6916009)(4326008)(2616005)(8936002)(5660300002)(6666004)(8676002)(1076003)(38100700002)(38350700002)(86362001)(66946007)(66476007)(66556008)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1g0O13t37A01KtduKFkxl9Xg0GxRHuWPeTzKbXx0U0/z3aRJF5ge+MLWt05y?=
 =?us-ascii?Q?U/A97sSxhaTe6RTIGZNBMqvnKBcpT7A3LN/xPcv1OU5XvcvtTH/kRaXZOblK?=
 =?us-ascii?Q?jw+btjRpokcIxdYve7D6RpfBpBuP543VPjdfBkR8X6GTlj3FQPCur0lhgFiz?=
 =?us-ascii?Q?QYGgsSmhrDecZxAbTsLL3feDDq6xQ/HqdsimHh+mir5hhtGGzyghso1gpTk5?=
 =?us-ascii?Q?IeyhKrL44+ewvlc26Oq9OBORpRDreaujkORVmExlIbY85RI1ztoHyTcrFZ8N?=
 =?us-ascii?Q?XIkkBUoQ71aHVv9paMqm5N9+HQ7M6iSUFssOkR7wVAcdexZzlMSNEvDuoAkU?=
 =?us-ascii?Q?q9amLQJ6A5I9bUthb7gJoXBIXR6uuQWwUGSLiNWA4apr8jfdOkAO73WAJYeg?=
 =?us-ascii?Q?aQPPDg/1qjNWer8S9IyBEZbX76tk5UN4KXhfRU/ND5/Piub2FxJ8Fq7QgnsH?=
 =?us-ascii?Q?feT7PqCQtXd6+1/wapUAVsePTe22lnkrjhM0YprL2IW9RaiQIkX09DI7aq7D?=
 =?us-ascii?Q?MncAcshXUE7H1uj80PwehalWrDV6lX1hNkg7GkofqrOI8EzJInAykC4IuE8x?=
 =?us-ascii?Q?1XexNGzy1A3n2BeU86AUqu8G7i+ifQeUrG+3AKBYuoHNn5/ksjNGNa2m3+vm?=
 =?us-ascii?Q?6mQi1aTq+pbXYvRXfWBwyTTrryu6WhUY517qWluzk88E3zTpY37hBuReZFeO?=
 =?us-ascii?Q?/wEFzplyUhE/W/Udwm8cEumIwC/s8jPAeEsOlS5cLrY/oeigkuI5SYbHAR6/?=
 =?us-ascii?Q?ck2hsnVyR1e4Bzg4lzdN4CfTgNpYqqJYO/GxubCW5PMzj0DGbqlgLi77DeNF?=
 =?us-ascii?Q?aouzNxTQiUQhx5MiwpOGU2S9KMIprOX4Z8M1qE/92TcKIMrTA3oxZ0k1Vomg?=
 =?us-ascii?Q?8+yFo+AqaBnyqn14KEg6wwbhUGgemiDgOPfy5f9WjrBdQVRRgfXrdjbSXK6W?=
 =?us-ascii?Q?gYd3QZ4l1FF63o15yp9lPDQeX4XVn3YQDn0Bt8hOsgvkfVUIwq3SWNdY9MAx?=
 =?us-ascii?Q?Sq4ajcmYUyW/5RD7P5MwAk/6d0TrJNZBUDcIJup2RL7bm7BGUodiJ5Dd1HAU?=
 =?us-ascii?Q?KPBpAbguUgwteQCVgYL0CoJxCRq8M23+lk0HcIanBvFQeQ/uX1cZqKf7aeog?=
 =?us-ascii?Q?nwKhuFzvTkOo426vTYPoYtcnAweAZ7kba1gM1SCEp32lVgHTezlMT63uTrG/?=
 =?us-ascii?Q?moLtaK2LrYIad/F4/lIRjyWc7EXeebsdgrp6KrIj42ZbSmZa/AsRIjMmrK/J?=
 =?us-ascii?Q?+C/7D9Z6Mkfew5ns3TQA0vDP6GPAtQrTyOU3yhSN77QNjsyiNI4TgvsnD39p?=
 =?us-ascii?Q?gSiEiShrKJqnGesTJig3D2eDPtI2SPIAj0zMj0X60PqCisAzg4oI414Y24JU?=
 =?us-ascii?Q?npDUxEcXEHIvUH5kl9/HgWztFfm7CHRq3SNYyJOk6MDIyvM1IPtLr2MmLvB6?=
 =?us-ascii?Q?z0jX42U3bJFIkiGzfZG4o6CAicoGSY5lHOmo+TkiS18mwHA7WY0Lv7xl0hOV?=
 =?us-ascii?Q?tg95aYYOhc29MQjwz7mQhLoWCEK7SX8JN/f0hoWhtQzE6GdPCYnLueD+zGOy?=
 =?us-ascii?Q?c9SmT/QPNfXlLj0YXUk7Dd1WyzyXY65TUkhz3mucU5X4ZYnZ9Akmy6qYewA0?=
 =?us-ascii?Q?9i5PNMOfHzts52nLP8S1yZOTtUgr3w3Vqachllq2wurtszVM02ZxuQfNo6DX?=
 =?us-ascii?Q?cpMrPA=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93cd1802-2277-4f53-fcec-08d9c5722e2a
X-MS-Exchange-CrossTenant-AuthSource: DB9PR08MB6748.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2021 17:40:44.5536 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q58bpxZsvKcnpyF8kjd/KbpHP/cRCxws7PxpfX7B5C5q3xyP3aGfNhLuDosGcg50eBoysT04dMMPSzfRDdIzWh5Q7AL637NF8vYA7cRCVRQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB3964
Received-SPF: pass client-ip=40.107.6.133;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Add helper that returns both status and output, to be used in the
following commit

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/iotests.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 83bfedb902..b5e6216517 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -238,6 +238,10 @@ def qemu_io(*args):
     args = qemu_io_args + list(args)
     return qemu_tool_pipe_and_status('qemu-io', args)[0]
 
+def qemu_io_pipe_and_status(*args):
+    args = qemu_io_args + list(args)
+    return qemu_tool_pipe_and_status('qemu-io', args)
+
 def qemu_io_log(*args):
     result = qemu_io(*args)
     log(result, filters=[filter_testfiles, filter_qemu_io])
-- 
2.31.1


