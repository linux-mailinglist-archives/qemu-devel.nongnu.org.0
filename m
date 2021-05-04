Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E10372CEC
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 17:29:46 +0200 (CEST)
Received: from localhost ([::1]:55920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldwzZ-0003LL-NV
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 11:29:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ldwry-00046h-Nw; Tue, 04 May 2021 11:21:54 -0400
Received: from mail-eopbgr80102.outbound.protection.outlook.com
 ([40.107.8.102]:61999 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ldwrw-0006zb-Ul; Tue, 04 May 2021 11:21:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eJH4TdWuqNBdO7CGrnlvORr5t38omVv9IDmrk6y17+wGxBpxHoNPmaSpbhyUYOb+c5diEpbh8I/7e87ee+LI4V+vx5bzgvBfVONK3n/bjce9L2CquIWSCMCTcZxMKmEHLAbciis8r0l8M3MU74/otuyG7Z6le1YnHg9d6/4MZug189xaokn5UxsH3RgAP5jKrmxnXB2MmFXtSPZYqM7XIajvDkRXccHhtLOCiLgGCuCSj1s7tSWI3WxS7OBdN65pPRpgA4F3AplsclvezsxBnGLFqPKXXXBvlTNz1lsb6nXzTCwg+T7UNLNQMe4cKMPNiU8FFv4xJ5Z98FR/1Ht95A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WGP5ny7jB2j1kn05rWrzMJdJwtFl4juqcyfBWeMTHDA=;
 b=W9PyomVEBq9bSqmQE6Qhjsz9pZ0eWWKgh4f42NNGmc+hqfZA0a+9spHMtSj6kNUzEIXQEknI+m08ohMR6solwCbX//y8rxe7D9A+v8D2wfwvSsjC4E6gmm/ciNqetLhTr0MsghxcH4a9SmN5y/Q5BVsm0FpOxQ5H4eR0tXlSUEGgvRnQ4Trz05HlC0e7kAOAApYQXR07WsOn4U+jdJPPBUz5nN8FAjbRfbFdXqu9dlM9DszSjOMMyejSUZ/2KiTXk4I/HjltQJYuLvVgwY0i5JQ79AYHtz04Glt7XUWqG89uls+AVvOUZzDf4BAXfqJ06/2I3HC2/C0tppfj56WfeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WGP5ny7jB2j1kn05rWrzMJdJwtFl4juqcyfBWeMTHDA=;
 b=Lo7IDdWqgrAoAj2oBywXL5G4fAj07plzU03y2IhxhakkoctLAqpTB37JWm8FMfRbEqgCbKYUv+vk1Xn5Is/a90aMH78gwJty4bN/J9WzqIcw3akHwQs5JrRDrLMosgP3O/sWUD+5rTRltJNuaru11LMPIWFOZx2bfdBBffwFvF4=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4916.eurprd08.prod.outlook.com (2603:10a6:20b:ca::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.41; Tue, 4 May
 2021 15:21:37 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.024; Tue, 4 May 2021
 15:21:37 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, den@openvz.org, ktkhai@virtuozzo.com
Subject: [PATCH 10/10] qcow2-refcount: check_refblocks(): add separate message
 for reserved
Date: Tue,  4 May 2021 18:20:23 +0300
Message-Id: <20210504152023.322862-11-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210504152023.322862-1-vsementsov@virtuozzo.com>
References: <20210504152023.322862-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.251]
X-ClientProxiedBy: HE1PR0901CA0052.eurprd09.prod.outlook.com
 (2603:10a6:3:45::20) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.251) by
 HE1PR0901CA0052.eurprd09.prod.outlook.com (2603:10a6:3:45::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.27 via Frontend Transport; Tue, 4 May 2021 15:21:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 766ac616-67dc-436a-014b-08d90f104f67
X-MS-TrafficTypeDiagnostic: AM6PR08MB4916:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4916111B9B7420B86CC8751DC15A9@AM6PR08MB4916.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:198;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QI3Uv8m9ySpLdDZbiU4LkP86l8boe+vNqEZfNo7RHzvt3NGrRf6bmpn+qDrPY9Vuu4Ftnit6dcNgLyLTcRdDs3dA2u+Y0NHnjKElvGWNZpts0qU6O0WcwIlpdieK4njuu7XYRyT3JA12/vHI3j/6RJLF2tq/Ryx0AkaRcOHlfCCp07/3TdytigDRegTyxkwW27U8U0OqgOuKERS+ZNA6LPefqahVQAa13o8siBeTJtKQznD8hULyAbtE+XVWFFfyvjbWCPDnUJUpQWvUPe/zteuFKZU4PV3vu0jNW3eGw5Jfpp/HjdOJMtwzu4WNWzq3E7Pjjrha0HJjguchtwlcryCOdCb6dAMN9OEha+5OoqqAVvrTJN6tBoQbtwYqGa62083Bz4shXdETiIeLxB1Q1c4TGA3XR9SEwYvYmx1HRZuQmsDwv49A+QmyKEC53mg1QVVsPJ59FeUJUlKNNB2l/M8UpfxmFDAoJHyqXT/wo9NEUd1i8mDwA3t79txWMqRRJ3XOOuZ0n+q+Jq6i5dOKgv780QUfIALTzGLnoeanRHuez9wiSqrExhpoDSB5aHlo5YkVdYCFM54gigve6At0KBaESx8mDcnRVyB+D3t1QE+qNeQeqShadJs4NV2gvUS1fEO1VNFqzm/fw5OdxYShBtmXIoOI5bSXBBKEoGrIArxzY7+WDcMjwm+BAcbRqtnI
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(136003)(366004)(346002)(39830400003)(66556008)(52116002)(6506007)(66946007)(16526019)(66476007)(5660300002)(107886003)(36756003)(8936002)(4326008)(19627235002)(2906002)(6486002)(86362001)(186003)(26005)(956004)(478600001)(83380400001)(6666004)(8676002)(6512007)(316002)(2616005)(1076003)(6916009)(38100700002)(38350700002)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?0NyvLuhppDrf/HTbhjNOtySTBE4RjYSo1pQRUoFQBkNLVG+Wsm0yq0+W4XEC?=
 =?us-ascii?Q?hmTpZ9+wckIW270O9FYtXAw3HN2pn8masmfan3QXPEb+uk4IWqZp1IShAT2B?=
 =?us-ascii?Q?lBv7lAxawHtfNc9onW+hbjD18XGa2B1iqCGrBCMGXIgjZjm7+kBZ0l/vDm+8?=
 =?us-ascii?Q?xDNKTwZoBoo00/9qPU+6Epi4aRBUZ5T8jhNYzeOXZmIkQbZK4sqHyLDio2z7?=
 =?us-ascii?Q?sIKxh8Aoi2qfFhRiTLxPPL2BRS0EGK/dnBvu9bun+DjZCxgVMp6bwUZVMjlp?=
 =?us-ascii?Q?rajb9z7xNBhXK6GPQuVpVe+Y91ub+mErE7UizsdXgSWsPdrYMZuefXzY9Ly8?=
 =?us-ascii?Q?2dD9fzxLNc7rtrJe8sBWUBlDwYwPln1evPrwSF4jSwAwGLAOJLW280t+1HzJ?=
 =?us-ascii?Q?lwlRcdzH3zkBnuvUHhBiRWEsVsb2MrDYtSlbdmm2pYgpBgh3+R+Oq1O0qhH8?=
 =?us-ascii?Q?B0gmDODNKLcPJLU7k32XgcMuk8giwZaw27rSjcE4iDX4czkntLdAK9qSpdyl?=
 =?us-ascii?Q?KetGRUV9e0jwJw6+3VKlGbpfnabd93dsxyJ7RCkmWwk/taZXVimE0S6jXa9m?=
 =?us-ascii?Q?CHDwrUqWDP7T4/QCoTxl3QZz/Z8z2NJoRIGAxxdhqc719DOfzN0l53U/i1ec?=
 =?us-ascii?Q?Rxo5BdVzZGmtclOQ04P0S7N/b52vN2cUsNaNrES81sPmyTJJMuRiJhlEZeXc?=
 =?us-ascii?Q?2rTnY/Kix4LasrVdNiqRFZ4r8JGIsMLwRmxI0P7mPDa2bAL9eQZPFLYhKKuM?=
 =?us-ascii?Q?d68lobwNY4Z8nuxaRHRv2ZJ0GGarq2ov8peTUoWvACM8cn/TR4fMp2U7qWOo?=
 =?us-ascii?Q?roarGZkKa4HJKLoCZUlYWolLKzg7qfs2YNk1ZFOWOO05Txl29QRNztX2Lsd1?=
 =?us-ascii?Q?kbJWNL5SZsxmVd9enWgnsCeXMhCjJbZ84nsbP51oNmhBEiOZ1gW1gLkG+lD9?=
 =?us-ascii?Q?8Z3WrEX9FEEJVOMMpcNFDAZEWKBZXp322AEOTFmyUf/wdF3O6KN+sf7XxO/t?=
 =?us-ascii?Q?fO081VJBAGtRzKA/ui3960W1ADCJWIqMFDdg/wWBlwHyX0GFRf5mmZWkzonr?=
 =?us-ascii?Q?ONu4RRKz06d4JsWXLKYnXBWS18cyZSkmXtjUOweDIQMXnZtORe2COPWILzeD?=
 =?us-ascii?Q?BBWxilScPNG9MjL+tidS5RSVENXtXB45NJBo5k2Ejt0D1wAmjI8tXlJ5n2Or?=
 =?us-ascii?Q?lDuXOtDKwvh78TCn0dBct4V9b1bIYUwZ7hLZJb/H9sP2IbxH3J0GFmJsLu0M?=
 =?us-ascii?Q?baRq3mgifosaweiIB18eFCmtieTjeQZJraDxkX4UGqKZ5AHIbPkZEJwSxw5s?=
 =?us-ascii?Q?DVZXi5TYlFjm2kkQE5qATejZ?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 766ac616-67dc-436a-014b-08d90f104f67
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2021 15:21:37.6874 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +/QgC40W/YwQYAqCr0sVKTTZCl2YYxjFUxQYIzrniz3WjkZENDwzr771cD/T7EM45Pu/gKITkTRA4EB7ZuMCC2gzvrRqhtETCUC10BCc/8Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4916
Received-SPF: pass client-ip=40.107.8.102;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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

Split checking for reserved bits out of aligned offset check.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/qcow2.h          |  1 +
 block/qcow2-refcount.c | 10 +++++++++-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/block/qcow2.h b/block/qcow2.h
index 58fd7f1678..fd48a89d45 100644
--- a/block/qcow2.h
+++ b/block/qcow2.h
@@ -591,6 +591,7 @@ typedef enum QCow2MetadataOverlap {
 #define L2E_STD_RESERVED_MASK 0x3f000000000001feULL
 
 #define REFT_OFFSET_MASK 0xfffffffffffffe00ULL
+#define REFT_RESERVED_MASK 0x1ffULL
 
 #define INV_OFFSET (-1ULL)
 
diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
index 9a20aac0c9..9ae45efc75 100644
--- a/block/qcow2-refcount.c
+++ b/block/qcow2-refcount.c
@@ -2090,9 +2090,17 @@ static int check_refblocks(BlockDriverState *bs, BdrvCheckResult *res,
 
     for(i = 0; i < s->refcount_table_size; i++) {
         uint64_t offset, cluster;
-        offset = s->refcount_table[i];
+        offset = s->refcount_table[i] & REFT_OFFSET_MASK;
         cluster = offset >> s->cluster_bits;
 
+        if (s->refcount_table[i] & REFT_RESERVED_MASK) {
+            fprintf(stderr, "ERROR refcount table entry %" PRId64 " has "
+                    "reserved bits set\n", i);
+            res->corruptions++;
+            *rebuild = true;
+            continue;
+        }
+
         /* Refcount blocks are cluster aligned */
         if (offset_into_cluster(s, offset)) {
             fprintf(stderr, "ERROR refcount block %" PRId64 " is not "
-- 
2.29.2


