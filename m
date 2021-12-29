Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDEE348165C
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Dec 2021 20:33:37 +0100 (CET)
Received: from localhost ([::1]:40008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n2ehc-0007NX-RG
	for lists+qemu-devel@lfdr.de; Wed, 29 Dec 2021 14:33:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n2eWV-0006i7-BT; Wed, 29 Dec 2021 14:22:07 -0500
Received: from mail-eopbgr70107.outbound.protection.outlook.com
 ([40.107.7.107]:6337 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n2eWT-0000B6-Ad; Wed, 29 Dec 2021 14:22:07 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P6opznIxITxfwCs9N2FJBX2LAVWMStziA8beitxOlF9ArCIlWdWT6rTVpgYfn9HVjccrVsJSMOPYuPqF/oSATPTNi1GL7eNEnhtruaH33miZp+imRCCDmpg1Ss5j3XxjwqNm/goht0lgG5QdCgdguj2bq42I8r4kuJGts6HPP1FGuw+XL96VqJxufsId0yy4D0TYO49GUBUt6ED4OEaW97296Z2078QN4j8P7O5iKs1PyWB3FgKISKLJTb25BhSnW5+Luiq7vUMMIQ0GozdKvBydqgr5a9WQ9L4b//meL5CGqwmVDCW10uqB/+stDqu0YO6OTxSyJScQ6FHSdmNDfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LUpUzwWdrOr9MTpj6QIgtQC9lRyIPeowNrpLguhRrCQ=;
 b=ef+1VSAmRcGU43YzP7epvzhRQdANMU/uC7OlLhUTHte0+fG2Ti/4IGXFlQar9A5/iiskDcuM32ojN7D8n8a5BC/Q2UYpJoBoGweRHZkLFzHc0M03Go3Px2v7oiUhCwjoubeF2m/0XHvz2bUOOgXc2LhcMK7TY7QL7FIV2cKd8YV9tbJ8PL+ZgjpX36c0qGxIxWO62glG4LcfDeQNCJn9eU7efJ8Hl43J43JsYIiHGTLcEImn9Ot6KW/zt8eEZ7gKUYAXM0Sj2hzrqhQvAsbyBmDniGrRDMj/wN9+VKfsFr87JUhI7Bmd6KfyKtTC6gcg/7DWfOuHZ06Z10bMAJS9HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LUpUzwWdrOr9MTpj6QIgtQC9lRyIPeowNrpLguhRrCQ=;
 b=OOpzdUOO81/TeQJqjgIaN1GsZu50MU9wx+uR0LYYs6NdUSP0FwctKOyw5umMfiikXw69bsMOpj0XSCBW4e0Fzg7Wu6ODCUMvxhol5DNmB9xSt1tH+fFyM4aZcSPad3+BTkpw9uprL6AVNFOPPnHzv6yCR6uu/rua/eiRutj6+jY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM4PR0802MB2276.eurprd08.prod.outlook.com (2603:10a6:200:5f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.18; Wed, 29 Dec
 2021 19:21:46 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112%5]) with mapi id 15.20.4823.023; Wed, 29 Dec 2021
 19:21:46 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 richard.henderson@linaro.org, peter.maydell@linaro.org,
 vsementsov@virtuozzo.com, jsnow@redhat.com,
 Nikita Lapshin <nikita.lapshin@virtuozzo.com>
Subject: [PULL 6/6] blockjob: drop BlockJob.blk field
Date: Wed, 29 Dec 2021 20:21:27 +0100
Message-Id: <20211229192127.1772134-7-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211229192127.1772134-1-vsementsov@virtuozzo.com>
References: <20211229192127.1772134-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS8PR04CA0152.eurprd04.prod.outlook.com
 (2603:10a6:20b:331::7) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 70e14abc-3ebd-4ac5-9874-08d9cb007440
X-MS-TrafficTypeDiagnostic: AM4PR0802MB2276:EE_
X-Microsoft-Antispam-PRVS: <AM4PR0802MB2276BC07E739E3CFA5BC8D58C1449@AM4PR0802MB2276.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u/ub2Cj92ui9baOTrH4/oBVmX2Coq+8RhagwAIAODE9yemI1kkfujDHocXsnkLwLCbJWUWcBf9Q0HwkFe/aeixz/Xq41XXmVICB5u5ySKnaVyyUNwDOOpPCN7TH1YyaDUCFVfcr8TxF9PpAAEy4prQRjHC53bs1BMM+suN/XabwV3dp0toESlOnoEKo+gC4J9Lud9c0yBIoblKsddccldciX9dNGB/JbQpeUu7u9rMsuF2UD3zpxanYe6z0ac22AUBxeSnD1ZBOsiDgie1LErUy/4y+lDS1qSq4H8OpymDv6ODnfl/rZebnJjB+mIGORJSYwCMBW0sfu4b0vUDrx+xwNvwHQlCujne+/LCKAqOPGGmjYDfy0J+M1FBPQvo4Itf/YjQwnJgUWVdfPgQF5ueKhHxB5D1qq8mOD7tUD34vz64+qqQZHeYHMpb7T06fl2WL40tXDzI+1URmvhup3ELSRpAzjc4hCzW1slPHW+MGlfx52xq8632vhaLWG2fvi9LCIokw0Zqm6eof2hNExfTDPZVWYITzs18KkeY8w+1F/Extcw8m4yYn+LHebdKOiXcGO2UGjcVyfu4pTmtKR79c/MpJG97nslnB2vd4VVteKJXE7zQA8Q+TU9X+/GNGy2nr7Uj/5Gs8SL5a46As1hyxktMsOjRgID3CyoqpsVEnUetl5Dw6jf8ZfUwHB6URgdb4OQWw9chgzesoVv6GYfw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(508600001)(52116002)(1076003)(6666004)(83380400001)(2616005)(2906002)(6512007)(36756003)(6506007)(107886003)(316002)(86362001)(38350700002)(8676002)(66556008)(66946007)(66476007)(6916009)(38100700002)(5660300002)(8936002)(6486002)(186003)(26005)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eM7xLSGvrqmUhpHSQsashcUfz5olYvLWj+2lYDaM/589yQrca2g6SniwUcfE?=
 =?us-ascii?Q?VNR/1MTvbOUnozmHKd1GlnlBTt/XWi2mzrL+EhLDZTk0pzfTuLBg/Hp9WW4D?=
 =?us-ascii?Q?wCTqhauzmoUfa95nlvoYaEDuzgzA91wqD/Rn8GwiKB34hgLiVGmIaVHJv1x8?=
 =?us-ascii?Q?Fq8QV/eTWDb+XTIEtot6HaLUosRaCVqq8YyNBdz8JV8XqAVNr1GHGaGIy2Td?=
 =?us-ascii?Q?wz7crY8Zsvw0lmHeobFE66eBteBxL9CfqhbjzkTlHGRu6fuFHQSDCwBI8rdp?=
 =?us-ascii?Q?HARcCiJDg65rRN1BRnE+QMX6hr7DSlkV5AbIp4ORKoOEpGOR3aMj+lSTjubu?=
 =?us-ascii?Q?MqkIoH+H0Q2ixQzT+oh3mt/PoGaybf4QlPsG4kE/LBsSNUazWrTKGDEcngZG?=
 =?us-ascii?Q?vFt2u5ob0ETZpwARLIwr/dXuRMtd80STkPqYAJQCwttDfy5G6DIzTJU+Q8sK?=
 =?us-ascii?Q?tqDqpB7mBdeu6mb5Y6RUBCSMHnPrOnQTSHUjgUVpCkFk5lhSY3qCFWynXHrS?=
 =?us-ascii?Q?DdDsW5NJ5m7FPjDB9NIF9kZ3JXkqy/nRr/yunef3QTdE5HzJ34JUV0M3Fd4N?=
 =?us-ascii?Q?Zg2KzKqCdXcI4EHYTmdxvwVI45O3Mb2wv9UZmIQxkAHKkiV14OSV9WvvRRVs?=
 =?us-ascii?Q?W4KXHfUZugFCS8MYiyEG1IJSyKWDpQgvUI8dRlZ5KOU5BX3M+I9fe0tSTzDu?=
 =?us-ascii?Q?q3Q87V9mZG3L2aIMH3n3/RRDWw9FM9tABRc5iLFnXNd5LnJArjRoXSYovEie?=
 =?us-ascii?Q?c9eHDcvdKo/IDchz4XKueAPYBhingAtqVdbVe7yhQ6J07B3Y2rP/GgyIO/tE?=
 =?us-ascii?Q?g1rdNv4jc2sVo4P3ttgy/+RGo+M95KtQIvdPUP/FahWfVVrMPnrJGh9BgEz+?=
 =?us-ascii?Q?+ClvRA7r/wh6gETONnKlWm+zhOUrsU1C9USqZ0czrAggw2pbNheWWI4Qgfst?=
 =?us-ascii?Q?KCqgja4PD1Z9XTt2hmLS0aW07MJ08UVfP4qLHkRzWO1ySk+M98q0/NFsdrxN?=
 =?us-ascii?Q?Sme2JnYoJybUHkj8FIw6Dy+uGRV7m5XnXrEJMYEx8Anc4QpkbCmNGs6JEyy5?=
 =?us-ascii?Q?+Rti5sLA6AYlhbuevybKAL4/XCjM/iqvs4V/01v/Pdp95IRamqRDqExixMEd?=
 =?us-ascii?Q?4R2t3v6utgwbdDKqAvrqwNNCKbDEltjxRpkaHYvyDPuDGfjtammkYcb2Tlx6?=
 =?us-ascii?Q?WshXG6N3iK4IJPo85Ap2wNj8EK3jBXF01PL+4gEB+y0fRGDh8ZmLx1ya3Wek?=
 =?us-ascii?Q?uJ6neYwn0lA5qgOSl8NdI1RZbiO3BPqYqyse5IQYME4vxqaFZnoWjcrnZpur?=
 =?us-ascii?Q?NSIjgZxECPgw/qqOLru9WpRhEbKRdwu90gkRAAgz0WlQjh5CIn6J0ptU0SEB?=
 =?us-ascii?Q?ohU59tMTJZJpSsZnR+EcvBQbqcj0XYHRiYu6r4Td+ij7+nlRcVMenjfa9+nh?=
 =?us-ascii?Q?YoIVnbk/QcqCy3TnJ/s5TrSnjQPvOTVnGVjgVu4cT3mGO3plOGACHiZ50iRf?=
 =?us-ascii?Q?8sqGi5mTjneGLXFz07iDzWbWUxEhHJrt7p4kD9MLP7owtWH9nh+bFtrHa2AF?=
 =?us-ascii?Q?8gjYv537KSEKuNGNBUVd7L/0yBNuWdsJvk4I12frFtMoyCSD2DJWc6qYFxt2?=
 =?us-ascii?Q?1OF3Nh4Psdiqg0Sazo/a5zEJxERZYmB9usrtIsdYu9yspsfaIaaU1pNOikVA?=
 =?us-ascii?Q?FxmakA=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70e14abc-3ebd-4ac5-9874-08d9cb007440
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2021 19:21:46.1245 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v5Pk1Z/DPBnCpi16T5Ile88c0vE2lfBl+VKaJjsUeyyP8JLxPWvM2QSKhgD43WK/wrpSG1XizB5FPEVr+vVougQKESFArLosP+vjoueK6Tw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0802MB2276
Received-SPF: pass client-ip=40.107.7.107;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

It's unused now (except for permission handling)[*]. The only reasonable
user of it was block-stream job, recently updated to use own blk. And
other block jobs prefer to use own source node related objects.

So, the arguments of dropping the field are:

 - block jobs prefer not to use it
 - block jobs usually has more then one node to operate on, and better
   to operate symmetrically (for example has both source and target
   blk's in specific block-job state structure)

*: BlockJob.blk is used to keep some permissions. We simply move
permissions to block-job child created in block_job_create() together
with blk.

In mirror, we just should not care anymore about restoring state of
blk. Most probably this code could be dropped long ago, after dropping
bs->job pointer. Now it finally goes away together with BlockJob.blk
itself.

iotest 141 output is updated, as "bdrv_has_blk(bs)" check in
qmp_blockdev_del() doesn't fail (we don't have blk now). Still, new
error message looks even better.

In iotest 283 we need to add a job id, otherwise "Invalid job ID"
happens now earlier than permission check (as permissions moved from
blk to block-job node).

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Nikita Lapshin <nikita.lapshin@virtuozzo.com>
---
 include/block/blockjob.h   |  3 ---
 block/mirror.c             |  7 -------
 blockjob.c                 | 31 ++++++++++++-------------------
 tests/qemu-iotests/141.out |  2 +-
 tests/qemu-iotests/283     |  3 ++-
 tests/qemu-iotests/283.out |  2 +-
 6 files changed, 16 insertions(+), 32 deletions(-)

diff --git a/include/block/blockjob.h b/include/block/blockjob.h
index 3b84805140..87fbb3985f 100644
--- a/include/block/blockjob.h
+++ b/include/block/blockjob.h
@@ -43,9 +43,6 @@ typedef struct BlockJob {
     /** Data belonging to the generic Job infrastructure */
     Job job;
 
-    /** The block device on which the job is operating.  */
-    BlockBackend *blk;
-
     /** Status that is published by the query-block-jobs QMP API */
     BlockDeviceIoStatus iostatus;
 
diff --git a/block/mirror.c b/block/mirror.c
index efec2c7674..959e3dfbd6 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -771,13 +771,6 @@ static int mirror_exit_common(Job *job)
     block_job_remove_all_bdrv(bjob);
     bdrv_replace_node(mirror_top_bs, mirror_top_bs->backing->bs, &error_abort);
 
-    /* We just changed the BDS the job BB refers to (with either or both of the
-     * bdrv_replace_node() calls), so switch the BB back so the cleanup does
-     * the right thing. We don't need any permissions any more now. */
-    blk_remove_bs(bjob->blk);
-    blk_set_perm(bjob->blk, 0, BLK_PERM_ALL, &error_abort);
-    blk_insert_bs(bjob->blk, mirror_top_bs, &error_abort);
-
     bs_opaque->job = NULL;
 
     bdrv_drained_end(src);
diff --git a/blockjob.c b/blockjob.c
index 70bc3105a6..10815a89fe 100644
--- a/blockjob.c
+++ b/blockjob.c
@@ -86,7 +86,6 @@ void block_job_free(Job *job)
     BlockJob *bjob = container_of(job, BlockJob, job);
 
     block_job_remove_all_bdrv(bjob);
-    blk_unref(bjob->blk);
     ratelimit_destroy(&bjob->limit);
     error_free(bjob->blocker);
 }
@@ -433,22 +432,16 @@ void *block_job_create(const char *job_id, const BlockJobDriver *driver,
                        uint64_t shared_perm, int64_t speed, int flags,
                        BlockCompletionFunc *cb, void *opaque, Error **errp)
 {
-    BlockBackend *blk;
     BlockJob *job;
+    int ret;
 
     if (job_id == NULL && !(flags & JOB_INTERNAL)) {
         job_id = bdrv_get_device_name(bs);
     }
 
-    blk = blk_new_with_bs(bs, perm, shared_perm, errp);
-    if (!blk) {
-        return NULL;
-    }
-
-    job = job_create(job_id, &driver->job_driver, txn, blk_get_aio_context(blk),
+    job = job_create(job_id, &driver->job_driver, txn, bdrv_get_aio_context(bs),
                      flags, cb, opaque, errp);
     if (job == NULL) {
-        blk_unref(blk);
         return NULL;
     }
 
@@ -458,8 +451,6 @@ void *block_job_create(const char *job_id, const BlockJobDriver *driver,
 
     ratelimit_init(&job->limit);
 
-    job->blk = blk;
-
     job->finalize_cancelled_notifier.notify = block_job_event_cancelled;
     job->finalize_completed_notifier.notify = block_job_event_completed;
     job->pending_notifier.notify = block_job_event_pending;
@@ -476,21 +467,23 @@ void *block_job_create(const char *job_id, const BlockJobDriver *driver,
 
     error_setg(&job->blocker, "block device is in use by block job: %s",
                job_type_str(&job->job));
-    block_job_add_bdrv(job, "main node", bs, 0, BLK_PERM_ALL, &error_abort);
+
+    ret = block_job_add_bdrv(job, "main node", bs, perm, shared_perm, errp);
+    if (ret < 0) {
+        goto fail;
+    }
 
     bdrv_op_unblock(bs, BLOCK_OP_TYPE_DATAPLANE, job->blocker);
 
-    /* Disable request queuing in the BlockBackend to avoid deadlocks on drain:
-     * The job reports that it's busy until it reaches a pause point. */
-    blk_set_disable_request_queuing(blk, true);
-    blk_set_allow_aio_context_change(blk, true);
-
     if (!block_job_set_speed(job, speed, errp)) {
-        job_early_fail(&job->job);
-        return NULL;
+        goto fail;
     }
 
     return job;
+
+fail:
+    job_early_fail(&job->job);
+    return NULL;
 }
 
 void block_job_iostatus_reset(BlockJob *job)
diff --git a/tests/qemu-iotests/141.out b/tests/qemu-iotests/141.out
index c4c15fb275..63203d9944 100644
--- a/tests/qemu-iotests/141.out
+++ b/tests/qemu-iotests/141.out
@@ -132,7 +132,7 @@ wrote 1048576/1048576 bytes at offset 0
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "running", "id": "job0"}}
 {'execute': 'blockdev-del',
           'arguments': {'node-name': 'drv0'}}
-{"error": {"class": "GenericError", "desc": "Node drv0 is in use"}}
+{"error": {"class": "GenericError", "desc": "Node 'drv0' is busy: block device is in use by block job: commit"}}
 {'execute': 'block-job-cancel',
           'arguments': {'device': 'job0'}}
 {"return": {}}
diff --git a/tests/qemu-iotests/283 b/tests/qemu-iotests/283
index a09e0183ae..5defe48e97 100755
--- a/tests/qemu-iotests/283
+++ b/tests/qemu-iotests/283
@@ -93,7 +93,8 @@ vm.qmp_log('blockdev-add', **{
     'take-child-perms': ['write']
 })
 
-vm.qmp_log('blockdev-backup', sync='full', device='source', target='target')
+vm.qmp_log('blockdev-backup', sync='full', device='source', target='target',
+           job_id="backup0")
 
 vm.shutdown()
 
diff --git a/tests/qemu-iotests/283.out b/tests/qemu-iotests/283.out
index 5bb75952ef..5e4f456db5 100644
--- a/tests/qemu-iotests/283.out
+++ b/tests/qemu-iotests/283.out
@@ -4,7 +4,7 @@
 {"return": {}}
 {"execute": "blockdev-add", "arguments": {"driver": "blkdebug", "image": "base", "node-name": "other", "take-child-perms": ["write"]}}
 {"return": {}}
-{"execute": "blockdev-backup", "arguments": {"device": "source", "sync": "full", "target": "target"}}
+{"execute": "blockdev-backup", "arguments": {"device": "source", "job-id": "backup0", "sync": "full", "target": "target"}}
 {"error": {"class": "GenericError", "desc": "Permission conflict on node 'base': permissions 'write' are both required by node 'other' (uses node 'base' as 'image' child) and unshared by node 'source' (uses node 'base' as 'image' child)."}}
 
 === copy-before-write filter should be gone after job-finalize ===
-- 
2.31.1


