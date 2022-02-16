Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA4C4B91D2
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 20:53:49 +0100 (CET)
Received: from localhost ([::1]:42002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKQN2-000818-Vc
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 14:53:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nKQGB-0003ny-OJ; Wed, 16 Feb 2022 14:46:44 -0500
Received: from [2a01:111:f400:7e1b::707] (port=17600
 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nKQG9-0006Dk-Dk; Wed, 16 Feb 2022 14:46:43 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H3f6DIzzLbFiipgjb0LlMR8W9ntNDBXdCrYEeG75HghJ3fSx043yToiyiexkzU8lC/4dNTKnPyMgzMd3PvglVqEJmh236okn5UXpg6yH3kJkScFCbVPQgUniPIRPrzKyhvvoLICY0EvHVjmZbXvxi1zPthlquqgooCmOq61NnU1uGz4IIkrO1Q2WbdOk0sgwk6qNKpOeZe+bAEzS3GD5TegkF5HzKDpWlfzOP4jB7iT35ekSwcf5KvkuEum7X6SWcIUmb3VIcif1pwhs5x4/iEtuHxcrUQrJnT7cAJVJOtjdbFusZaoB8I4PM5jz9iduHTxIxsDAYJ9/6au23Qezhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jJ+dodkR0FY4zseuCiVqlZI4z730SbpvR0TOEEUVAM0=;
 b=RHWR3eSUJysCfiDoK8COz8+WysrCqA+hBI4mJfopgaqevAK/R+m2V4paah0QI1s0KEZVRaTz1zZvu74b0hD9iBCK2OiqLUy8zPGuNesg/VXCUl/RHFhxcVog5ZT43UBjlbMuR6K7TFg2DecRuy/TKRedWW2ZYoAHcH9ax6zSf20lCWS8Gy3svZo7Lw6mjHD8UIGkEJ92RKYZuUKwxv7AIDpREFK/XauUsRHOtrWtG5tN+pwztFt9sXWgJuisTj6yskaHELxIrOw6b9KQhVMo6MvJ//G8zxbRadmz9Eo2Zm5zUyunewiJy+yJDU7+VdOXkVEQHecarlvt2qeXqRZRcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jJ+dodkR0FY4zseuCiVqlZI4z730SbpvR0TOEEUVAM0=;
 b=MbdkJXeSCeW3pPNnRDYsPCdJYENj4HFnHiT2SNQAX4iI3Ruj9QcEBQro91JC5AgAqvaJOj11X/zOzMuG/ONkwM6MW7+2LaUOuyuha4qgv2w1ks3upZhe3XZidFy+pTEk+eFBQfvrgAc/MJjPGLb3Gv2IfQBKC4T7LqL5CzpPh6s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM4PR08MB2851.eurprd08.prod.outlook.com (2603:10a6:205:d::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.15; Wed, 16 Feb
 2022 19:46:30 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%4]) with mapi id 15.20.4995.016; Wed, 16 Feb 2022
 19:46:30 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, xiechanglong.d@gmail.com,
 wencongyang2@huawei.com, fam@euphon.net, stefanha@redhat.com,
 eblake@redhat.com, hreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, nikita.lapshin@virtuozzo.com
Subject: [PATCH v4 07/18] block/reqlist: reqlist_find_conflict(): use
 ranges_overlap()
Date: Wed, 16 Feb 2022 20:46:06 +0100
Message-Id: <20220216194617.126484-8-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220216194617.126484-1-vsementsov@virtuozzo.com>
References: <20220216194617.126484-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS8PR05CA0005.eurprd05.prod.outlook.com
 (2603:10a6:20b:311::10) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 30fa6540-878a-48e9-0d2e-08d9f18506f5
X-MS-TrafficTypeDiagnostic: AM4PR08MB2851:EE_
X-Microsoft-Antispam-PRVS: <AM4PR08MB28513AF5ED92C9A6076073B0C1359@AM4PR08MB2851.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:265;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eEG2PdqTjbEGINrt2gJOrRsfLBDa/gzU17QE26M2CspHfaqPCi+whckA/Ut8fHLfqRNHdfCwqGJKoo1TC2w4A1bKgX8oC/4fm134Nki27lKmAW9DQkQUmkVdNYeF711/OBS5X4X7dM6Hw5+OUPBTbCK3+QTsaMsvAZb9BbXJzu2RX5I6Y0/RLVwXsLA9+H4TvnDNRZpCwjjPlwdRkX/SioYA3yM0sMEcD2RGl++CoGFg+GXUdWnosMS1rqOMPBlODqV3a7oSM0A7fZVdXVtcL18DsABX+4kuXFGqH7sA8e3Ul1WkYc1Ku/u0fcmzQ6sL3+mmg2PU2QQl+fQLg50FXbALQfNYpC1OcgbAfcQOGMMOX9TXGnslKofw8aOcnGutomYT0tRIiVEL6yU+VKo8HVidZJMzcoJ0KO2zc4YTKLDHgnXabzcU3vja5MxgoCXpTPbs3OWpC/ar29bdB92wKmiENAmTJpBEG1EKMxrL7GMk4ayo7M6lgQB71hSgtJB4g82/vjVcRmleT/goOB2YKuN99D2rCsH5SoN/GnVXlajYiST48FmlDIw5lhAwHa5WYA2vV32ijRb9672NgjxS+ddakEyKIgWLcGHBLOoYppaYWd0oguFT/rBm3dCt1drG18TjK8pI8/9bmE2EGYzUMr84yRu9oEBlx32OVF2lwlX5SdYMaPlGQ0qI5oB2EmUWylUMNFFQADNX6ntqMeJjmQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(52116002)(7416002)(6486002)(1076003)(36756003)(2906002)(86362001)(83380400001)(508600001)(316002)(6916009)(5660300002)(66946007)(66476007)(2616005)(6512007)(66556008)(8676002)(107886003)(4326008)(26005)(6506007)(8936002)(38350700002)(186003)(6666004)(4744005)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?a0txt4pDjsl69cWHyjKj8gzi06eSUDEGWa5Ecj11di5GtaC2H8HnlKHAiGov?=
 =?us-ascii?Q?RtbrVJh1vr+YWsCjEMV8Nt8b8w/ULKO/MgIEf9dZxAoyfTk146/B0f9C/tJJ?=
 =?us-ascii?Q?sOBN08+QdI+QVVRFncMZHmPvoRKQ0E3CnJ71341zLywbbjJXp41H3bM8Rodd?=
 =?us-ascii?Q?ROnPQIM7ho3U/f/5FelTtUDb7BiW+KLmLb5Srw9Izlde1pQhVekAYPEWfNS6?=
 =?us-ascii?Q?bLC/MpqYfuATeqO7p7+nLFk2cyd/sgzOwi6m0Fb/v9+b+pApJN3xknpMgh7O?=
 =?us-ascii?Q?zrK+xBztugRCXrLxSCI4Lvs6cm4HzeqWZa7nmEFSDCqGWYzQsBZdmukMMp/k?=
 =?us-ascii?Q?OjhkEL4/6X3SBvD29kpkbjoKeXARzbfPaM29BZwROIKuc3qGxCK5wU4tsEG5?=
 =?us-ascii?Q?wkfE8Lur6l55xGSwHD5dpLArhKgb2YaXrWI4kw9Oig7IQB606EWjRToo/eH/?=
 =?us-ascii?Q?6YhGF8ooGNrmHBUSqSNMRjXz+1sotQ2fTB40vdEKQ2ReqCGQjYLB6vfoZR4s?=
 =?us-ascii?Q?KmWffQQptvB8IBEyBYOcuv7CmjoQTV7MYqJIjtg/CjvSs26Quy7EdM3j+8uk?=
 =?us-ascii?Q?IWMwFhUI5wBMJzh+i+2Yww5uLwHJS4W+uaHu3lG1i2N4Pj5z9GkPrEQP7gqh?=
 =?us-ascii?Q?bp5DaOyWMh6+Wzot8h9KxbKv83Nay8vzslwsOaJxaaTgLFch+hQDVpoW64a2?=
 =?us-ascii?Q?z1Ti8ZrjF3thy3AbDeluO1oIb2Y8V76zkoJK4XD5o1PcDBJiVxj8NMRkSKVB?=
 =?us-ascii?Q?LhdJnklZ6tZaGSgs7VoQ/0BO3FjYTnU6p0MIdV+kDzTtLlV5lIcmQ9dMM+ng?=
 =?us-ascii?Q?dtxhapeen1Y4ec5GyVBtxlAxuebFE8NZImFedotffeCC39F/Dey4iskIjs9Z?=
 =?us-ascii?Q?boHQ9BmhHBdhKUrWyL1Ut8XDpQw/qx6w8/X+CVWVSX3fbmGRyHVf2+hVW8yZ?=
 =?us-ascii?Q?tYPjx+d/+WLeSdX6eW/dtO5i1Xj7Vp4mnW6025XUSabp4eCnVth+yN/Kz8E7?=
 =?us-ascii?Q?iHlKiATslwb6jDmqxINPCLintrUgnuja3CB1yjZ5eQ9U6SYu5otQ5ZfVvxEA?=
 =?us-ascii?Q?eyGbtjjz0AyZuB2duY5jehpsN6EAMRoi/fm8x1/bUgtmPwmGUC2NlfcXrB+R?=
 =?us-ascii?Q?ZAv0LT2HcEx/XFQqDj4qZaR3mqwkWBitiT8yTE+diUwvklbVJFl0x/Rclut3?=
 =?us-ascii?Q?7CYmEOhqdpF+t+oWwVYqVP+qMjqBIdEjsLRAj1U5bvdaDjCdbFgqmcSm2ujo?=
 =?us-ascii?Q?Gw4T2mD876g+Qd8OsEECZZckp9+/Gi5U/SrjqpfYvDItbyWtGzdB7FOfVeaS?=
 =?us-ascii?Q?a9pW+u4Yx1WGoLtKffFcNIGajBwUUeUT8eZFkYpWph4OcEUD6TsAqRwVnzsv?=
 =?us-ascii?Q?8S5Ob0cpCjRZXVJ/5hvcdCUO7EaCSrxbCPsst3JSHJp84vjkLTm8wTW0Rubg?=
 =?us-ascii?Q?gHD88CbCHij/1aT6QbMvc7QFcugRbc0jYJ205FLMpLigNMIEeYCqr80qRvFA?=
 =?us-ascii?Q?vXeVutHuRiSiVCXxwAs46inzAr235u6qdNsuNbzIeyi9kqpkje0+Zj1nwVmz?=
 =?us-ascii?Q?24zAtcz7+du4olychSJ/BJYY/4n5BeLO+mY0QMQhbd5dLXjBeGsh04YGxoRT?=
 =?us-ascii?Q?MhmRBxH4szZC59r83FpaYt+y/lMlvHe3+pRB6XPsluV+wtQXYmJLb+Rm74yJ?=
 =?us-ascii?Q?15EySw=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30fa6540-878a-48e9-0d2e-08d9f18506f5
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2022 19:46:30.0240 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dclhk810qv/kQlHr4MWvZIM2/6qIXxPaijunQgVzriu25l6NK+MmM9P4j5Qk4WYb42dSjIQggL89KxoL7Qt1liXYZHcLP9dwmO5yiVZeXpA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR08MB2851
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:7e1b::707
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:7e1b::707;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.978, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Let's reuse convenient helper.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/reqlist.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/block/reqlist.c b/block/reqlist.c
index 5e320ba649..09fecbd48c 100644
--- a/block/reqlist.c
+++ b/block/reqlist.c
@@ -13,6 +13,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/range.h"
 
 #include "block/reqlist.h"
 
@@ -35,7 +36,7 @@ BlockReq *reqlist_find_conflict(BlockReqList *reqs, int64_t offset,
     BlockReq *r;
 
     QLIST_FOREACH(r, reqs, list) {
-        if (offset + bytes > r->offset && offset < r->offset + r->bytes) {
+        if (ranges_overlap(offset, bytes, r->offset, r->bytes)) {
             return r;
         }
     }
-- 
2.31.1


