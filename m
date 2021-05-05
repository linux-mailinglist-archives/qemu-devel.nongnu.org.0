Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F04373556
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 09:06:40 +0200 (CEST)
Received: from localhost ([::1]:50622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leBcF-0005Dd-2o
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 03:06:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1leBWL-0007xa-Jg; Wed, 05 May 2021 03:00:34 -0400
Received: from mail-eopbgr70123.outbound.protection.outlook.com
 ([40.107.7.123]:51520 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1leBWI-0005wK-0c; Wed, 05 May 2021 03:00:33 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N4NU+efsDHzNsoTozilJ1fwmXqrB050/rc6KV89pNwac16Tbj5gSLr3nqeyBbkI5RABQvVRJ9C2gx9a6Gd/IUgXtvHTzUXYNx5CfLcT5Qdnfem47cZGHP5m6kBWuMlRQGYjnhaGFfCXduZ0eh+AsJfsgXv2yGEyx+ZDySLY8S0f4h9KTox0F9M+gG0+7EMhsowPnp8hoS/65qM4nJEvYko+CF8o5+Q4+DY9FwObAnxeSF5cUECzzOI8vPigNE2LGmdf66+L/8YVoOtKvffKujADZjrd7X8uoSRzqQYDuMNvmhyeLLvy14DeMn264oUZXjifr9ezhTm1LDQKgL3kMXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yh7t0+Jcb7uOUCaU96d6uLUnxIJpp4mstPuBzzvRy28=;
 b=L1y33FajpKV2tePmFU7gXzepwe1E8SJM1ZkU7RCEH9jAc3Uv11BFO2UbTCyip/LNcA/iZZHc/zdf1uCTX8se3qU53anozPBAPntPII9397HntDWHP/lIxx6ICbtSYgHjOhNPLvNevYP/DWFyP0qztNoCXgpgKSV6R8w7PKvgdD8B2BgcmfHgGmelNkW1W+Mv3vKjukOiOwizyEY6+edClRVhjBdkXit6QOzRENBQfwKulbuqQLmriIgOzMoeKqUIZTefDMALFKNrm0mPdUVgAcsKlp/yHzTpVEJVEJGQ/pyjKwKvVdccTb4892/94QUdBngR4F2+yp/zB9NSWa/5yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yh7t0+Jcb7uOUCaU96d6uLUnxIJpp4mstPuBzzvRy28=;
 b=KR74qLdtSH5LTctxHDuih1dDK4hD4RWv812wXgBuRHiXPAiMtCuelflC/x6X7xB9XaOxVDmW+xG1Dci8n39Kvitvez4FuDIV31OyISXAWcg/m5iCbXupiCAyeRL8pmMReH+UWFamg+Qjj1AjN9eyY00jW9pT6HEvRaZYSDSAivE=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1652.eurprd08.prod.outlook.com (2603:10a6:203:3c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.38; Wed, 5 May
 2021 07:00:18 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.026; Wed, 5 May 2021
 07:00:18 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, den@openvz.org, ktkhai@virtuozzo.com,
 eblake@redhat.com, berto@igalia.com
Subject: [PATCH v2 07/10] qcow2-refcount: check_refcounts_l2(): check reserved
 bits
Date: Wed,  5 May 2021 09:59:52 +0300
Message-Id: <20210505065955.13964-8-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210505065955.13964-1-vsementsov@virtuozzo.com>
References: <20210505065955.13964-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.236]
X-ClientProxiedBy: HE1PR0101CA0013.eurprd01.prod.exchangelabs.com
 (2603:10a6:3:77::23) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.236) by
 HE1PR0101CA0013.eurprd01.prod.exchangelabs.com (2603:10a6:3:77::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.24 via Frontend
 Transport; Wed, 5 May 2021 07:00:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1de637da-2a3f-4eb8-be36-08d90f93716a
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1652:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB16522AFF0C492317CDAF6896C1599@AM5PR0801MB1652.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:53;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JRRN/2OsQNs5GyW/mhzTfOvXJcXDc9yZ2vNIsmUEYsVUqM51LUsKKNJEiylVGTYjDUyZkwUJk6IdiRoe4a83V5TSYxPCvP3yIByNZ2ALEpgC6/NvltHFROq9o1hP3oI6fmltBu6bQoPRyb8sRWQods0SJFJ/NR4+wvB7cGmUz16pjdqiyFPfLNYC4iM610Pr4N1EkO8O+/GVhKrd3ihhNIfUkC9sJLNOuAeSNjs+hDpoT+sWZpbljOffmphCjPShQ/eDMqnjLToTFInXesVMSMdboOcgof5pAY7WDcmYUrANfwkRNo8gjhTArTglL8fZWUzjIp2j+rETaFez6jA8TPduPuyILR5vTEFiIlgz8Jf1HzGOZicn6Cvj2cMjob6kz3e4ogVB2bhb47+3dFSYKZIJMyQ7CuIkv93NvP2hjEKiKzOKEAneeTvasTM6SyDGGXOpEi7eAXt4eazJQtcjVhrz+dHu6CpP/R9HlwtQNTMdvfrPEvFRtb9TyVt+Ry3MLGz5oJUgI/xfHlAkuh2z7vL6haD3G4vz4j6idh8BMA7zhygf67uasbd32lqBp+oCNGptyuOukBOuP18SkUFnPGak0kyl8IUbwixkJ57dewJk6Oa5a5tpZhtMPyK8ZEjRdLm8LlbakHT8Y53K6XjRMP0Q9FWvxJA5oIZiE4VdqFg+ejVHBRv1gE6lkhjngKXT
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(39830400003)(136003)(346002)(376002)(2616005)(2906002)(956004)(36756003)(66946007)(19627235002)(6486002)(8676002)(8936002)(6916009)(4326008)(6666004)(16526019)(186003)(6512007)(1076003)(316002)(38100700002)(86362001)(38350700002)(83380400001)(66556008)(26005)(6506007)(66476007)(5660300002)(52116002)(478600001)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?d9yCcraRkHWeQGhlfSAxCpkcifNS2/WA0iZOVHUUq3oSjGULZSRrpFClTr2s?=
 =?us-ascii?Q?lTYBEp3VFE2msaxb0mKTXiWAbQH7bvh5aGQVAQu+gVNk2UbRHtwhRqic5WQu?=
 =?us-ascii?Q?3I6xwXJDy9kuS1XA72+PHm3AK9MvusS2MpJIYI8Z5/KP3TOIKBo6WfjQFnKo?=
 =?us-ascii?Q?T21I/jFketl8awPBYRW50qoG//JpzcoR2bhi7lDQBQZnqznLCbhCMDRUybXS?=
 =?us-ascii?Q?052j5O2RubQ5k21+3CaAomWVs23Z5hlWaODYATfuyd9GZf82wu6Z981apFtF?=
 =?us-ascii?Q?0vGxoOZ241BLxNl7kDMfdXxooAmJd5jj5XXT2b5hzkzISWaiZzbI4VabOzbx?=
 =?us-ascii?Q?1PNOarajSvLSut99PUrpElgTl3EU8K9oV9JVot4D+n6JoDknROqLS41OrevA?=
 =?us-ascii?Q?PpN7aps0p06BKQj32D/du886E1+y6/uoF8E564VJSPUpKZgn+uVIEkbEf3yt?=
 =?us-ascii?Q?EGMJGjHyCeIalKhlVA5oBTI6DuMIcFx+LrExIVmYdl4imW0Ng/5zC6Zqd4xv?=
 =?us-ascii?Q?RWEydnGqVNU4FrJOQkxRDaRs5T9CPyBxC4+3irWnhe3kd/sk6NaY59VvTg+V?=
 =?us-ascii?Q?vjTCcsfrjmgYI8y+p2tolR6n9g6ICW69baMAKMU6IVMc7RVHVmKqCFWT8Fas?=
 =?us-ascii?Q?RPy1z6n8pP+X7JJcbLJl52bF4gLRfy2PYwGsdBW+pgRmXS6YkladnjgmHkWq?=
 =?us-ascii?Q?CmNTocNj8mJeVyWPnUhj9APXuvxBQY3ev14867wvnC2A33WaXh66PDpEFKEb?=
 =?us-ascii?Q?vvPazh8Vb9IQrwWySP2OwoifU2ZVjjHzwjgCOQf8P3XZKbjm/BzEoWw5X6Ya?=
 =?us-ascii?Q?bGuQ04GlPsuv9mEasQtm4Y/Xhh5PUy1PXJyrUWMfSAobU7i+Oo5b8+4ji/2a?=
 =?us-ascii?Q?WUW2/HwwrZ0P37aWC1pM4TJ6Ni+CBG6jnfdkXhWpzfY7s36ds/bZoBHPq1ka?=
 =?us-ascii?Q?B7LNOwAv9j+8DjeHUOhKkGFPU+HWcv2caKAsOJ5N6N9wPYXmkY33P6DZoL0B?=
 =?us-ascii?Q?2LLjExm4bjXcazBJbX2d4D8L2iCgez/Tmgi4Fq1ULvikSh5VInGgIlzhLGX9?=
 =?us-ascii?Q?HrU3QBlOU8zUT15nd5QomOZbhMGieL27RXREj8HOtL1L+snzeJnm75qxX08U?=
 =?us-ascii?Q?w2HgJrrAE5Dl6pmXzCYEU2qaHQhSYVTJ+/Ju03aO0RdeQSKvt1g+ZGkUcBhc?=
 =?us-ascii?Q?5D8C64GAaujZvs2JAQP41tCubX5S/7PU6RL5yQ9ujQtt/AKiSVhOvgvF/wBc?=
 =?us-ascii?Q?RJVXFSaTrV77YKmb1ZGUNUD/nUa1M+1NmV0m1dIzyMencROb5lZ6JuvhMuqQ?=
 =?us-ascii?Q?rTdxV5HRq4XiDJD5woKHSAeU?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1de637da-2a3f-4eb8-be36-08d90f93716a
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2021 07:00:18.8410 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZocvoLfEiLtlt6tcbyPkub8FCb3ejw/khs/7VcLkviu2o15ID+U1dlGVp9G1yvEKaRAjMgPBJBrygKxj00C3BoYOBCZip0RCC8GgsPu6v3o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1652
Received-SPF: pass client-ip=40.107.7.123;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 block/qcow2.h          |  1 +
 block/qcow2-refcount.c | 12 +++++++++++-
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/block/qcow2.h b/block/qcow2.h
index c0e1e83796..b8b1093b61 100644
--- a/block/qcow2.h
+++ b/block/qcow2.h
@@ -587,6 +587,7 @@ typedef enum QCow2MetadataOverlap {
 
 #define L1E_OFFSET_MASK 0x00fffffffffffe00ULL
 #define L2E_OFFSET_MASK 0x00fffffffffffe00ULL
+#define L2E_STD_RESERVED_MASK 0x3f000000000001feULL
 
 #define REFT_OFFSET_MASK 0xfffffffffffffe00ULL
 
diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
index 062ec48a15..47cc82449b 100644
--- a/block/qcow2-refcount.c
+++ b/block/qcow2-refcount.c
@@ -1682,8 +1682,18 @@ static int check_refcounts_l2(BlockDriverState *bs, BdrvCheckResult *res,
         int csize;
         l2_entry = get_l2_entry(s, l2_table, i);
         uint64_t l2_bitmap = get_l2_bitmap(s, l2_table, i);
+        QCow2ClusterType type = qcow2_get_cluster_type(bs, l2_entry);
 
-        switch (qcow2_get_cluster_type(bs, l2_entry)) {
+        if (type != QCOW2_CLUSTER_COMPRESSED) {
+            /* Check reserved bits of Standard Cluster Descriptor */
+            if (l2_entry & L2E_STD_RESERVED_MASK) {
+                fprintf(stderr, "ERROR found l2 entry with reserved bits set: "
+                        "%" PRIx64, l2_entry);
+                res->corruptions++;
+            }
+        }
+
+        switch (type) {
         case QCOW2_CLUSTER_COMPRESSED:
             /* Compressed clusters don't have QCOW_OFLAG_COPIED */
             if (l2_entry & QCOW_OFLAG_COPIED) {
-- 
2.29.2


