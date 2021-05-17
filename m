Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63FD83824D3
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 08:55:07 +0200 (CEST)
Received: from localhost ([::1]:51796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liX9Z-0001Gp-80
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 02:55:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1liX03-0003id-Sc; Mon, 17 May 2021 02:45:12 -0400
Received: from mail-eopbgr30113.outbound.protection.outlook.com
 ([40.107.3.113]:13457 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1liWzu-0001tv-EP; Mon, 17 May 2021 02:45:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NKR+Yam/2TlskphWghH6Qa+XEWsknHDEPus7QJpM0x55EC9Aq9zK9/5uBjGFRK8U2ndNjMYTGoA1a5BS4F8BCRbedsRdKk0jMlRR6vr2bPNl3kCjzwUNuy7DeNKkKkcG3w7j+MptzN485RSvPw6w7QJfv3hV5Z772QPpZw2j57Ic6TxwYo6LfgeWNIcqtckSv2GYrDroD9hN4SJSrW1K69WnwHeZdngdi9fm64v5OBlpJvXCDPc62koe8d14mdPY54WrmyufUhRBXkQe44xG219uQEpyf9F0LkgKC/oOaEvT3Ux64ysxQ0eksAo0JCCiBoTjMKmIcIwu+JEU0VvjRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kOrHBzHfSh4rVE+n0RYahokr8YYT082PseajZ6AxKvc=;
 b=Du/XdpshATfBD0H23AFxg4PLfmh226VFmYou4s2wHqUGNPV3qJ1CXZVIuXp8ASidwp5PypNq8sWPieqAbhXIYuFBQgKwErZ4RuxsjfYCmttjWyBxvYo0iRFGi2BEHd6bI8O2sW8NSnOXqPi0ENCzvNTjdq3i8ZOCwjwkV1rWEwLF1kxeWjAympYgWE+5jkeAoaq4BY5jAH24B+ReWPFH1UnQJzpwHXcaPM0i7xOhduZTv+1MxS3x3zwMtdDY+traKCOgSGXt+VB4RaSdQeC2S6ujiX3aFTSRqQFwc6ABT7YomGKX6TauxsDmztl2hPRhhnz5jS5WKHuMtPXPKhhiKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kOrHBzHfSh4rVE+n0RYahokr8YYT082PseajZ6AxKvc=;
 b=eQWrBdpa0n0jAzZupftT92dIl1RHib7+7NPzwTP4nREnWCU1eURN1c0F6IlIM2QfEFv7xJIUCNU58nnMJOM17hCvRe4E2JcvS/pdHkK5VvzHtBjICfU4E4IOykySs0exByfB0f1M3FwyWXFq+MhXZxmKbu9MT0Q4MA6Jp9lessc=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3382.eurprd08.prod.outlook.com (2603:10a6:20b:47::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Mon, 17 May
 2021 06:44:50 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4129.031; Mon, 17 May 2021
 06:44:50 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 ehabkost@redhat.com, berrange@redhat.com, pbonzini@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, mreitz@redhat.com,
 kwolf@redhat.com, den@openvz.org
Subject: [PATCH 04/21] qdev: allow setting drive property for realized device
Date: Mon, 17 May 2021 09:44:11 +0300
Message-Id: <20210517064428.16223-6-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210517064428.16223-1-vsementsov@virtuozzo.com>
References: <20210517064428.16223-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.231]
X-ClientProxiedBy: HE1PR05CA0275.eurprd05.prod.outlook.com
 (2603:10a6:3:fc::27) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.231) by
 HE1PR05CA0275.eurprd05.prod.outlook.com (2603:10a6:3:fc::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.24 via Frontend Transport; Mon, 17 May 2021 06:44:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2c2f05e3-08df-420f-b19a-08d918ff44fb
X-MS-TrafficTypeDiagnostic: AM6PR08MB3382:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3382ABD6C019CB0C80951644C12D9@AM6PR08MB3382.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HPSBdVoBCVbtonkEtPMoy/EGSzzgXYdSR1uCzYkdPWzAhQXJNPAqmteKMNCM+exQbqkUz0t9OkBZ0PaAFMiCokbHcHTArxZts/9F4UsVLc9DfUZQ7GgkoPE3FF2s2rh4n/wpfVcHgyPUSBpKS5qN4I+/pEM9k/6fTVaYyo9cCoVCBNhBnpb6nTx7sbnI8ssd5/9Eqhb0T9Tea92pK6yL5ELgOf+OwuBfMET7cFCmkDTFueR99GXOy8GFyJXTiI7XRWt1bm6EAZOVXzHA0iwlivFhavJVgo9nf5JScvksp66kP593HhjAWLvkasHQFeuRpG0kDGpmT1559jLt9AciG/A91Pb2/f9xwJTWWTsX0E+2lrzdSAWKgKvORYxd7MrLTDlamebAeDKSF1LLNHX/izgoIU+EXVsgfNlpzpQtmgLPdLHAX0RGA3LlIY2VIh6w3I+JbqCst2tXTSK3tWh/9mNG1uVj+tiVWpvGnsf37dcUBybnC+OIcHg0HcssjL/nEc9MLgkwZV8nnDOey4mRAcZzrQXBTgxHqSUmrdlpTwDZ0QxOowejeBERvzpG95LbB97wVQJimv8cu2/Io5SeaMHRGRfUYJjYWHXfQTJBugAHS7OSqV67uDX/PHR11+aDXnFDKIPmS5ud2RlGfUCyVp75N2yk5+xQvCerVxJZ1Qdxl4Hr5I2oMUKp+U5ydRid
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(346002)(396003)(136003)(39840400004)(6486002)(26005)(2906002)(316002)(36756003)(66946007)(1076003)(107886003)(5660300002)(16526019)(186003)(478600001)(38350700002)(38100700002)(8676002)(6666004)(86362001)(2616005)(66556008)(52116002)(8936002)(66476007)(83380400001)(6916009)(6506007)(6512007)(956004)(7416002)(4326008)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?l95yFIkOPcfFY17u8EeX1I4LP2vMw29XsPPe3zciFbbQSkxaB0EDqpyv6K1z?=
 =?us-ascii?Q?ACT+K1QlXsOkRzBLoR1MsHSYyNfm/95IxYA0HccmXmnNqOk0gVS+xBOaKDmU?=
 =?us-ascii?Q?Nku3hpth1MnWVj27+k74xIYxd4zw4HRg7tIYJ9q1uog27MsufGtJfcWszyjh?=
 =?us-ascii?Q?p68D53lpZrwLsj+kWjBKEmmDSKznonLVohspm46hilVst23l4ZtkkZu9BwuW?=
 =?us-ascii?Q?knnGJfgMlGqBALIb+f86jdON06Ck6hPkPVLQSgtxnr1UTJK7IfF2V6+1x5dX?=
 =?us-ascii?Q?6PjQsWR7t2HZmxAjhuo4LR/ra3zhKiEeo5l++/uij3jHHHeZalSC9wGvSkkF?=
 =?us-ascii?Q?tfKOBE38aM/wJyVtnKN94uYi+EK4ddXVbw/ptLOz8P+KVc1x018bhyQPqaPg?=
 =?us-ascii?Q?2tmXm1bV+HRJ6nFX4pMcZX0qw/b67zcmIpGMfH/GGrTV1gt4zG3VBjQLPY/c?=
 =?us-ascii?Q?GtgKEz4JzXANMZuTTxvQbWl8yg7acQb9CYhyTVlWokqZuy64p6+Z8yQht/y7?=
 =?us-ascii?Q?GBHxVN+J3HvVpsvQWUaxBsf3zdTcLckVCLKqS0ulfO/gxRzJ6nBUyaf2S81C?=
 =?us-ascii?Q?h1pSTDOZ0Q218fvOmpmsb9mQrvcwHI1AX7RkUVmfOHIB5y43PTfTPmBixhMn?=
 =?us-ascii?Q?WhPb5OxNoLOfaFnTODlX0hhJdUr4Eruj0TPqqgQi7dkKn2EwBVs91R42Gdgm?=
 =?us-ascii?Q?2yq+wGjYXbfEEXTKvPWAHrDoCsZ9+g1tRdd5NgICZJTQyQlJ9AUvMAc4hKwP?=
 =?us-ascii?Q?bAp151UyI5sXgYiFHvXD/yFPPK/UeOnNg4Aa6+kIBROIHSSl/zWtuW0CXv2V?=
 =?us-ascii?Q?z7QchGN6NwtcnBFztZ8tHVlrth4ESB27BZLOYN1xAS6BSrrQ1VC3aeEzDPBm?=
 =?us-ascii?Q?6iq4yW+iIy7ZzeYPZIXHI2+g4So+jtZoV6kMrnJjnxXvAOB37Fs/UQ1fhS8Z?=
 =?us-ascii?Q?J/Gy9YkZr0YJ2jNKj5z+xC8n2gbYpwhqzaFCIQim9LbdLSx5f6kWBnGzGWLw?=
 =?us-ascii?Q?pYOJaa93cnqk7xet+sDSwuSPWfTv9Z7/Jj9WToNyqIdHAOG2+2pdl7zrVE3s?=
 =?us-ascii?Q?fIEaFYXbeW+EQAgiGHXTwjrkcRU2SlDRTQrP9/eyAzl1SLWnPW9VKEoqni4j?=
 =?us-ascii?Q?jQ0om6HQOC/p/C0mFfaDyJm2O3jxrVyTlN0FmcpTFuzX/rmm/YsJlre3XJGf?=
 =?us-ascii?Q?ETwbUbh2q2n36+/3nhQBuy5guieII7lfr7ZUnobMv95MBRmUsSacz6+0ljz+?=
 =?us-ascii?Q?e7gLzEn90yGzC33YwSfpA8Sg6jzNEQvMP411JLti8vADkZ73mhTFbxyds+Tn?=
 =?us-ascii?Q?1PFUthU/egsHLqO/wpjZmbUn?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c2f05e3-08df-420f-b19a-08d918ff44fb
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2021 06:44:50.4789 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MvS3tx6U5s6mqQt/0zimK3o9vDYzLomK5+BBNcSOtqIUG7fyI1UImD3SaEXqMx/krgpi8AdY2sgZcOth7mWCjHkc27D3Y6JdX1bZsGKV7FQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3382
Received-SPF: pass client-ip=40.107.3.113;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-AM5-obe.outbound.protection.outlook.com
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

We need an ability to insert filters above top block node, attached to
block device. It can't be achieved with blockdev-reopen command. So, we
want do it with help of qom-set.

Intended usage:

1. blockdev-add, creating the filter, which child is at top node A,
   attached to some guest block device.

2. qom-set, to change bs attached to root blk from original node to
   newly create filter.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 hw/core/qdev-properties-system.c | 30 ++++++++++++++++++++++--------
 1 file changed, 22 insertions(+), 8 deletions(-)

diff --git a/hw/core/qdev-properties-system.c b/hw/core/qdev-properties-system.c
index 2760c21f11..7d97562654 100644
--- a/hw/core/qdev-properties-system.c
+++ b/hw/core/qdev-properties-system.c
@@ -93,16 +93,30 @@ static void set_drive_helper(Object *obj, Visitor *v, const char *name,
     BlockBackend *blk;
     bool blk_created = false;
     int ret;
+    BlockDriverState *bs;
+    AioContext *ctx;
 
     if (!visit_type_str(v, name, &str, errp)) {
         return;
     }
 
-    /*
-     * TODO Should this really be an error?  If no, the old value
-     * needs to be released before we store the new one.
-     */
-    if (!check_prop_still_unset(obj, name, *ptr, str, errp)) {
+    if (*ptr) {
+        /* BlockBackend alread exists. So, we want to change attached node */
+        blk = *ptr;
+        ctx = blk_get_aio_context(blk);
+        bs = bdrv_lookup_bs(NULL, str, errp);
+        if (!bs) {
+            return;
+        }
+
+        if (ctx != bdrv_get_aio_context(bs)) {
+            error_setg(errp, "Different aio context is not supported for new "
+                       "node");
+        }
+
+        aio_context_acquire(ctx);
+        blk_replace_bs(blk, bs, errp);
+        aio_context_release(ctx);
         return;
     }
 
@@ -114,7 +128,7 @@ static void set_drive_helper(Object *obj, Visitor *v, const char *name,
 
     blk = blk_by_name(str);
     if (!blk) {
-        BlockDriverState *bs = bdrv_lookup_bs(NULL, str, NULL);
+        bs = bdrv_lookup_bs(NULL, str, NULL);
         if (bs) {
             /*
              * If the device supports iothreads, it will make sure to move the
@@ -123,8 +137,7 @@ static void set_drive_helper(Object *obj, Visitor *v, const char *name,
              * aware of iothreads require their BlockBackends to be in the main
              * AioContext.
              */
-            AioContext *ctx = iothread ? bdrv_get_aio_context(bs) :
-                                         qemu_get_aio_context();
+            ctx = iothread ? bdrv_get_aio_context(bs) : qemu_get_aio_context();
             blk = blk_new(ctx, 0, BLK_PERM_ALL);
             blk_created = true;
 
@@ -196,6 +209,7 @@ static void release_drive(Object *obj, const char *name, void *opaque)
 const PropertyInfo qdev_prop_drive = {
     .name  = "str",
     .description = "Node name or ID of a block device to use as a backend",
+    .realized_set_allowed = true,
     .get   = get_drive,
     .set   = set_drive,
     .release = release_drive,
-- 
2.29.2


