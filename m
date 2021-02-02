Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE1B430BEBD
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 13:52:49 +0100 (CET)
Received: from localhost ([::1]:45322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6vAm-0003jT-LS
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 07:52:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l6v8m-0001Bb-Fw; Tue, 02 Feb 2021 07:50:44 -0500
Received: from mail-db8eur05on2114.outbound.protection.outlook.com
 ([40.107.20.114]:11748 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l6v8j-0001rd-Pg; Tue, 02 Feb 2021 07:50:44 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MzwJSovB5bj9wbEk26ztsnKISbvXfSs8VIzQutT6AKLxcAKfkg8eMoG6jXNj9R21nq77OocolYC5qQP3yqoWnoS5vRTyLjuiBAnJ1VM1lOA3j7GEbopzj0SFOz8GDaQ0PUqhaAfJTe+xW2DxYIV06OxQWJkrsN1VPgdhKbqWsiGIpJ85HHVsLZUvflRjc7Yq6AIkNrBa+uIZqcZ1LHyEqckMWwrMIlLh5YNsP2dTtDoh9nFSVq3amAThf47Ek3RDQG6IIN7kBTY4jIk7w3GpK6k7XtQBPhSrZfCpdcfdd8SHx4yJXUKxhCMh2aVqFpr+Q+gQGUP31PR4TK+vnKUV+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rzX+l81j5y7f0CtI8hWxu+7DxNcJYKbY79rkafOc7Co=;
 b=NSqFM45TcWTeY1Z4mpSMBXAJqxgnNdu9EP1fMHp+2t+Yz8pp+bjAek8xkkL8cZzcfDE0Hiz+CLc77Qc7ubGUAyTnP03/gGfiNXtxC1j4DJGyDOCWsX1b9gAIRNRei+uft0IM3Y2SJUjgUGhjZV3Lz+PnfxboHHKFh2DTMvTbQB5YRk9OhlMLoIwJt+nMBwFXBsCNUOHWrg0IvJyhfjq60SSL2sgIGatdbf5f44wYKVf++35MNXmc7sXJ74oZaAarbBDUYdBkXZD4nSWbAAs+HvBzvdnOlYMyLGrQOJ8C3dglTD6MwwNCIE+6I3Mg3GEdgKYSvjOfjYfSTMSLs8byVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rzX+l81j5y7f0CtI8hWxu+7DxNcJYKbY79rkafOc7Co=;
 b=CO3erXCHox30xTSubsGAQT05CnYhjcnI0hq/v6nS4wbuQ92N/01XHi12MgWJFo8rx9x+dyUuRiiF+CHWnMe+wCIn3y89yFaJNxZiVUqGYEwCjnzAAxcVbMivBFF3KLrAiXqbUWfxw8wiPjt4GGRmrzXUK7B5HwzRpKhJOMFEM84=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3544.eurprd08.prod.outlook.com (2603:10a6:20b:4e::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17; Tue, 2 Feb
 2021 12:50:37 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3805.028; Tue, 2 Feb 2021
 12:50:37 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v7 05/14] block: drop extra error propagation for
 bdrv_set_backing_hd
Date: Tue,  2 Feb 2021 15:49:47 +0300
Message-Id: <20210202124956.63146-6-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210202124956.63146-1-vsementsov@virtuozzo.com>
References: <20210202124956.63146-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.137]
X-ClientProxiedBy: AM0PR02CA0002.eurprd02.prod.outlook.com
 (2603:10a6:208:3e::15) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.137) by
 AM0PR02CA0002.eurprd02.prod.outlook.com (2603:10a6:208:3e::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.17 via Frontend Transport; Tue, 2 Feb 2021 12:50:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 977a0718-e346-415e-6e25-08d8c779234d
X-MS-TrafficTypeDiagnostic: AM6PR08MB3544:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3544405299A43D3A482D1175C1B59@AM6PR08MB3544.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:765;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZdTkb2GK//Sz6RY6885Lm0r6jcINkxAHF4TWEDUTsd7n9YSWqmLF6RuVb4xDCJkOgZKQWciOStKe+W5ppXx2dlQ7ezQiYCJP01laCg+HFHyV1W1d5fde93imdJXy/gLOGarjimqoi0QzaWJ7ocdGxrXDV6p9qP2YgHgTgHOnpkM8zIFuZfY2zReoBLCKNtz/6EznrFpuDYNfuVe0aO8+kp3WgYT5AmfOqfyM35l7OFJgs62ftx6K6cdy4iQBUJPIRdcD4YGWLcWMv6lVsuQqzlSjwi9M/DT+F93YlBKJ2zJhGAYP+V6v/n5LXAcnWuzdm2Pbui+aYY3Uv0IAITrpN2r1wXTZM+1WKnSsSOoozYeZv6DqISur2I3w7063o/3FuxZxvfafNi1dt68IKizro6fgfuq2nfytqos0OdMuj88wdzgSIA8kNwJ7HA0Dik/WTHKx3J8f3rQgBhhKHMC7ORyQHaJzxhIg8Zo6+AFf+6qnAwgvAJ7g1udOnyIVOyfZniIP1jkt140mDz/4uMJT7g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(39850400004)(136003)(366004)(376002)(478600001)(4744005)(956004)(186003)(26005)(86362001)(4326008)(5660300002)(83380400001)(8936002)(6506007)(8676002)(66476007)(2906002)(6916009)(2616005)(1076003)(66946007)(66556008)(6666004)(316002)(36756003)(7416002)(52116002)(6486002)(16526019)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?2WEWC7vkV6er86FxgEuFHpPeAU9HpcviTiu4g1VdwP9+/fq+pb0YcuFUQ4u1?=
 =?us-ascii?Q?QXsW/2ofFIRs9ZXQ3E600yrGA7y80hAploalL0e0BqzftHDcd8fV89nLfECs?=
 =?us-ascii?Q?2rGog9P7d0jC/6yfjrP+jE6FzAC3OXCVprftmfW1yvzkcPgFFAm30RqIVZWW?=
 =?us-ascii?Q?8RduBSkwugn4YMtO4fDGecpASqQ4yYp+9MDFkD+X3b7JQuFNgA5/zEMb0mYP?=
 =?us-ascii?Q?Ra8ckt9RZteBjln5i7DnDg6TS+4mVQ0HNrYwYZZHMBz6fg9u7kMkmwjicqSE?=
 =?us-ascii?Q?Xw9Nj5UGBeZrN/+e2EnC3dzIRX4uYzRwwdw2OYrxJif1NMfCsZykiqJp2aR+?=
 =?us-ascii?Q?L2sCErKJyyYlRDLt4HBkWK+UYqRuKMxwz4DSsRS23/zcbAIst2olSu2tkKBY?=
 =?us-ascii?Q?jxkMf4Mpa5a6LajcsweOt7q+YQF9yQ2hdRcAYce+Nlkp6qzWD8QBt57DRWGW?=
 =?us-ascii?Q?kbvB5WDneFs8sLyaBg7lyEkBZtIhj9VIlT3yuOc1bSPWoGZ0e0Yfl6VN1/L0?=
 =?us-ascii?Q?vmX4p1pGqoAdBqhARq1+2v68z6OWwSm8TyNHnidwoKcPsrcmjuE4A9D/pAxL?=
 =?us-ascii?Q?iUvtuCc8ZXd5+kDTMdzmYbL/+65W/yEE3DWmZihYbFCJVpVlOB0TKulkJobu?=
 =?us-ascii?Q?gjF4TKlP8vnheNutj2+rhzNs8em9OL9pP8FshFseL5jIQ8xmzYyE3ueCDpXA?=
 =?us-ascii?Q?XMrQX4763LBhfataEFp1USnO914O5Pa29bNry4y2skeCqnR95LYvz6pGW8yd?=
 =?us-ascii?Q?2CEPMCtPsneHwd+kyJ2LcC5Wb690GLeQwPf7arSs9hguVpmWTV8Tk66iSpXF?=
 =?us-ascii?Q?BXydEv4dOqcjzBcxOlemaQ2+zjXKfR3aWVZaxaYvnGYJhFnBoNPXib1IA7CH?=
 =?us-ascii?Q?y9d/xRf4luqJih3AuosgAzefegrqwOCoRhHSkZ+lrrH7dyf92uiRkyJSBavg?=
 =?us-ascii?Q?8thqjGylWRDidjcuv4wa/O0M7tUC1KzKS8s0VyoSStLw4jji1hPDouHW/oLV?=
 =?us-ascii?Q?/SYs7cbr//3vkMaSM7ZU9jf9e6jl4l1p+ugJ1GtY7eYdRYhCyYYdvZDNaNPP?=
 =?us-ascii?Q?2J3Ww/c6?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 977a0718-e346-415e-6e25-08d8c779234d
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2021 12:50:37.1795 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8buOGOKK6VGttNjkJv1qdtCr7dN7DmQXzpw8PtzZfMQTSrrMXeN7/cGiDUC6aZRVEuMWAYvZNDBYLVM6kgtylCgTUv7SWycHwjBHqJtAtyU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3544
Received-SPF: pass client-ip=40.107.20.114;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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
index 48b0de36ff..d679ed8036 100644
--- a/block.c
+++ b/block.c
@@ -2973,11 +2973,9 @@ int bdrv_open_backing_file(BlockDriverState *bs, QDict *parent_options,
 
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


