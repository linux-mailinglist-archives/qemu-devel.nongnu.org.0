Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 848BB39788F
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 18:59:02 +0200 (CEST)
Received: from localhost ([::1]:45318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo7jJ-0002iR-Ew
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 12:59:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lo7c1-0003Ew-ER; Tue, 01 Jun 2021 12:51:29 -0400
Received: from mail-eopbgr150112.outbound.protection.outlook.com
 ([40.107.15.112]:35829 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lo7by-0002O8-5I; Tue, 01 Jun 2021 12:51:29 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Iwk63I/kq4ItJccDqNtII/4+jlDJRd8uzqTFBs1wkWAfZa+G7xXyvD2TirOyebPcbfb5eW6u/Ec5bYemy5/4XyP7NaA1SpXqMNHRWDvuuOtJZIbDQ5TnxSAVp3HYQxQ7wwEyYTyh411LpI/4DH08pStIOiVHoLSneZwrOtvViMSDMva16EdaN4bOK07LdjoCsG0to6BTOXINelRgxqt5x2IOgKCq4AvlxBZpFBTJJnavD+aaOuS121oO1mA2mRKOtTQIaoDF4SG4Z0qAE2x1BHRq7o3jsSSpxTFNS12tjc7mPtkVdeTRDjVmB29q/h7pUeHS4lZE7o3qYtm56CknUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u4ocnYB2elMcQ6ru6jvylmC8TgB30m1LbCBjWVE9qmc=;
 b=gTJoMZ34G7/UIpEl1jRKpOJeGXs5bdgYJTQnvSV1QDtnuCfnlrU/oS4+QIW7j6ea2tep878+4ugzvY4G5beLE7anOeFix+gzkkHLIrdoPaxgY+GRTGRpRXnjJBeMYtZd2hr4oN7b5S8c/bNvpVY/+6RiW/KY9cEZtYD1nxvSNltXOA4WepKorL+Z91BNBDCkTX4h1iR0H+v4e6Cx/w3hSJaN3bO4dMUcI5UA/vBO4Ub40zbwK2IPWyWbNxzC8xEJtKYri5Fx/h/aYHGfgzjJpHapyh9h8+u040yzW5aSw/r6BRH4Y/rynOHXwOgaJ+4qGPVKYezA8gdbT2CUOSjxoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u4ocnYB2elMcQ6ru6jvylmC8TgB30m1LbCBjWVE9qmc=;
 b=EKrtvXyREjmBWdlxrnpgypCmLZuUu4jI3d10qhlYXg1EybdosgihVRLHMEA8dYshA82NZ7TVqMkCY0EJFuNGMIIPjDKQpC8BOBXqAssHDS7Ul4FBi9h5itnRq2DBSMWi5x1IjzZCYwIixgQuzLfLnXUmCGL28Z1KVAYteyWzeKI=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1972.eurprd08.prod.outlook.com (2603:10a6:203:4b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.24; Tue, 1 Jun
 2021 16:51:14 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%7]) with mapi id 15.20.4173.030; Tue, 1 Jun 2021
 16:51:14 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v3 23/35] block/copy-before-write: make public block driver
Date: Tue,  1 Jun 2021 19:50:14 +0300
Message-Id: <20210601165026.326877-24-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210601165026.326877-1-vsementsov@virtuozzo.com>
References: <20210601165026.326877-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.210]
X-ClientProxiedBy: HE1P189CA0028.EURP189.PROD.OUTLOOK.COM (2603:10a6:7:53::41)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.210) by
 HE1P189CA0028.EURP189.PROD.OUTLOOK.COM (2603:10a6:7:53::41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.20 via Frontend Transport; Tue, 1 Jun 2021 16:51:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0c6ea71c-5a06-4481-908d-08d9251d777a
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1972:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB197265E286E1D134FFC787A9C13E9@AM5PR0801MB1972.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:341;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: h9s3zz+nZi0sklXsq9WsNZvcLybrfXSPucRBi7mjLowV/rlVRIBk3cQFdawShgFHNJkLaaFf9RpMXCDQOU9wNlhyB6F4mLT1GEDLuAwUlOWb1m/yw2cDOumun1b4v2NZPlvPkmyPMSlb3fsRPjeGen/tMi3qe67pzqgfhEuiu9tY76PBeaB1KBY5nDztBpw1k3q69KwQp+83JgFPdUNB8sG70fTnCva0CBKBuxmBs1S8H+/QFSwcqF9Nl3XiQ8nKi6SSAZSnj1SwZr1oSsBN8/i9acoFMjbJTS0RhWJaCeYjcPrb9a804tpz49s9VngxGfnqNjiUMIu1IL02Yr22w7S8JO3pB2GlByuVOwS6LTxrNTU+OeZ4N7yhHvz2/MBBTml6xXFot/aiUae0KnpK3iIsL7stKqLiPcnDPdtk8GliUX3GzzsD5k4JOsCY3JaX53qPjk3VFEPdsJH4HndaM2QPD54Y/8TblWPShmRDxN0nNi6B1Ewy8SXFt9ikUoHa6GuWEZ9FQJqHXnL/v3iSevP+BjReXtYT0IdbiDdQJE4hew035ZJfcumg1DLcZ6DSkuffbS7IDF6EtGqv4SP1pHnx/nEIO6XyGF8M28WDShaNvnOa1Kcc63UBSyItcWt3CE8ONEsI89NJEV5tKINL2rDx/CUABkyxhrfs26D5qqUWYWgO1Xp/qOW4phCNcRhd
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(376002)(396003)(39840400004)(346002)(52116002)(5660300002)(2906002)(478600001)(26005)(6916009)(1076003)(8936002)(2616005)(6486002)(38100700002)(4326008)(16526019)(186003)(38350700002)(316002)(83380400001)(956004)(66556008)(86362001)(66476007)(66946007)(36756003)(6512007)(8676002)(7416002)(6506007)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?c/mNZ7AEg+fK5rJV1MySagL0InvxdLO8s4Y9E+o1xDZCVz64odxEWUxhXQ6d?=
 =?us-ascii?Q?auSIkdysgll4u5lIBASjlK0n4WhlkgsIZcgUf3WSjgJay9MVqCtk7RySJJL7?=
 =?us-ascii?Q?HXY2gBJSMK1SPOW1YoGl304RNOBdkp0AaXDzaVkERr7qqkBThDDasvzVxlis?=
 =?us-ascii?Q?ewUGL4P3Q6wQzyluKnsJV0gxgJ9b/8dDXZ4PCI/ngirfSd3TU86LoShAw5rh?=
 =?us-ascii?Q?L9BQFxrG4Ia0KwqXTIE+sHg/OaNC0rClOof3hxC0B/FC9sfVbydGAGq3OOfV?=
 =?us-ascii?Q?nVMh1szCWfFWQ7rIweZHaT7obFtHDz03mLbO9tjVNH/3fFq7AmA9VigR96f2?=
 =?us-ascii?Q?iRgSr4+MwjGhB95eVPHk0lAlci0BwM9BH/AJRXVBwejNxqv+NGcTyMhkcmkv?=
 =?us-ascii?Q?8BdfBDxnvj2nBZQp3rOt6slBrY7CGaFG1ffchnMb+1IgSETvgfzz0UyzKZHF?=
 =?us-ascii?Q?bOiJruAW6V2e+uB+zJC02i4sRr56lC6JQR4Z9RqUc/9iYAOVpBW0cO6Bpx+0?=
 =?us-ascii?Q?teEKXAvJdF+2gYCicdlX6QKOY/ei+Lj2IGJZat85TkDg4NChoVX2SkRVtY/o?=
 =?us-ascii?Q?3N/sRfweiwTs4IrHQhVop9LjwO0IgRt9cXVkKOUtL0+tHl98io2u82vGQYkc?=
 =?us-ascii?Q?HKrGTBXHm8n/b9cG1fjUzwlKFycSEZNMgFCr+Br1+cZh7jic9jHt99bGuQFy?=
 =?us-ascii?Q?6aZ0hpeenzn+5BEQo3QOdXVBC7WT1oxvF2kxSbKOsFq6FcZ0sM/h8Mfde9GK?=
 =?us-ascii?Q?OMW0RDzRmxRVgVHBcSTINbDxTFOsGhkN/nOLaLN4QG4K0MHr/Btem7XbLMiX?=
 =?us-ascii?Q?JnELgPF3J+L2O5RlXMYoLGbQYPfiLb4noZZ/YcJ0kjQH9fiVWcbTVALzRwCl?=
 =?us-ascii?Q?GOtuab02Tqd8JwrVZv4PxuxFbD5opuQyDHFeDbIuZyWyUbSCzjJi+dE3Sg2C?=
 =?us-ascii?Q?TF+U7PyUfFwEztCx68RkpJqEez63xYsZBZjL4jhp5q/uvrjRwSWLAQS8xQRu?=
 =?us-ascii?Q?rEPelUEZGWOMgg3pPm7dn0fIP85BkRxylAat4PHsEOXpvRnEPVfm+2raUMTd?=
 =?us-ascii?Q?yQbYHgX3b7/1zc6P7/1hZ0shPIFJRgDA/bzfFLGoxMXrHa+6MIfNn2WkA0Xy?=
 =?us-ascii?Q?DVIYRJkhXHfii+j5HENgZ3tpuGyhHT0l5tGR1Swe2WqUiQB6MDL9bq3mlwpm?=
 =?us-ascii?Q?kcuhQ30wpybN81nR3+pNmRl5ky4SZZD6exVt+JG/3EGMByqjrtTki+WZnAjN?=
 =?us-ascii?Q?Vp150/27bsslo84EXIZ6AuPfSMFNQTGPfVEskmi+RskYa9e0aGsCCepxU23w?=
 =?us-ascii?Q?MFWbgIaN5uQXtM72VRDcNxFU?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c6ea71c-5a06-4481-908d-08d9251d777a
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2021 16:51:13.9650 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 561tXU7AnpanrAc4Hl51v4BM0wWM0FTa0QuxuuF5MQUOrB77MOfaA9b8BjaLGpol0lWPQ0MklrVR1Dk2MItiThkO05mDTqHp6+n6nzA0OYE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1972
Received-SPF: pass client-ip=40.107.15.112;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-DB5-obe.outbound.protection.outlook.com
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

Finally, copy-before-write gets own .bdrv_open and .bdrv_close
handlers, block_init() call and becomes available through bdrv_open().

To achieve this:

 - cbw_init gets unused flags argument and becomes cbw_open
 - block_copy_state_free() call moved to new cbw_close()
 - in bdrv_cbw_append:
   - options are completed with driver and node-name, and we can simply
     use bdrv_insert_node() to do both open and drained replacing
 - in bdrv_cbw_drop:
   - cbw_close() is now responsible for freeing s->bcs, so don't do it
     here

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 block/copy-before-write.c | 60 ++++++++++++++++++---------------------
 1 file changed, 28 insertions(+), 32 deletions(-)

diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index 2efe098aae..2cd68b480a 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -144,7 +144,8 @@ static void cbw_child_perm(BlockDriverState *bs, BdrvChild *c,
     }
 }
 
-static int cbw_init(BlockDriverState *bs, QDict *options, Error **errp)
+static int cbw_open(BlockDriverState *bs, QDict *options, int flags,
+                    Error **errp)
 {
     BDRVCopyBeforeWriteState *s = bs->opaque;
     BdrvDirtyBitmap *copy_bitmap;
@@ -181,10 +182,21 @@ static int cbw_init(BlockDriverState *bs, QDict *options, Error **errp)
     return 0;
 }
 
+static void cbw_close(BlockDriverState *bs)
+{
+    BDRVCopyBeforeWriteState *s = bs->opaque;
+
+    block_copy_state_free(s->bcs);
+    s->bcs = NULL;
+}
+
 BlockDriver bdrv_cbw_filter = {
     .format_name = "copy-before-write",
     .instance_size = sizeof(BDRVCopyBeforeWriteState),
 
+    .bdrv_open                  = cbw_open,
+    .bdrv_close                 = cbw_close,
+
     .bdrv_co_preadv             = cbw_co_preadv,
     .bdrv_co_pwritev            = cbw_co_pwritev,
     .bdrv_co_pwrite_zeroes      = cbw_co_pwrite_zeroes,
@@ -205,56 +217,40 @@ BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
                                   Error **errp)
 {
     ERRP_GUARD();
-    int ret;
     BDRVCopyBeforeWriteState *state;
     BlockDriverState *top;
     QDict *opts;
 
     assert(source->total_sectors == target->total_sectors);
 
-    top = bdrv_new_open_driver(&bdrv_cbw_filter, filter_node_name,
-                               BDRV_O_RDWR, errp);
-    if (!top) {
-        error_prepend(errp, "Cannot open driver: ");
-        return NULL;
-    }
-    state = top->opaque;
-
     opts = qdict_new();
+    qdict_put_str(opts, "driver", "copy-before-write");
+    if (filter_node_name) {
+        qdict_put_str(opts, "node-name", filter_node_name);
+    }
     qdict_put_str(opts, "file", bdrv_get_node_name(source));
     qdict_put_str(opts, "target", bdrv_get_node_name(target));
 
-    ret = cbw_init(top, opts, errp);
-    qobject_unref(opts);
-    if (ret < 0) {
-        goto fail;
-    }
-
-    bdrv_drained_begin(source);
-    ret = bdrv_replace_node(source, top, errp);
-    bdrv_drained_end(source);
-    if (ret < 0) {
-        error_prepend(errp, "Cannot append copy-before-write filter: ");
-        goto fail;
+    top = bdrv_insert_node(source, opts, BDRV_O_RDWR, errp);
+    if (!top) {
+        return NULL;
     }
 
+    state = top->opaque;
     *bcs = state->bcs;
 
     return top;
-
-fail:
-    block_copy_state_free(state->bcs);
-    bdrv_unref(top);
-    return NULL;
 }
 
 void bdrv_cbw_drop(BlockDriverState *bs)
 {
-    BDRVCopyBeforeWriteState *s = bs->opaque;
-
     bdrv_drop_filter(bs, &error_abort);
-
-    block_copy_state_free(s->bcs);
-
     bdrv_unref(bs);
 }
+
+static void cbw_init(void)
+{
+    bdrv_register(&bdrv_cbw_filter);
+}
+
+block_init(cbw_init);
-- 
2.29.2


