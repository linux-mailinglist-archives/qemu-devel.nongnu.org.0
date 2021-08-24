Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 366A53F5A34
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 10:52:48 +0200 (CEST)
Received: from localhost ([::1]:36044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mISAk-0006gR-2i
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 04:52:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mIRyO-0002xU-3G; Tue, 24 Aug 2021 04:39:56 -0400
Received: from mail-eopbgr50092.outbound.protection.outlook.com
 ([40.107.5.92]:39447 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mIRyM-0007cr-73; Tue, 24 Aug 2021 04:39:55 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=asQZJrXb6A5lK9BAIzdb1QnZq1WJWD9s0wWSF4eL7V6WlQDVxpNfcVsRzXJ16NVP47qJTi3iU/dMRVt8nt6nChqmooVnglHZmRkJ+FBCObGfiF7sdfF+MSIf/VIg0ZtwrLK3QKR1BLeFcwkd82BkajoQ0mlhEA5EKhoXQO4TmmrfdPV5YTFSET/Uw92QfB0E8jD1kTW/uHTA84gwaHRiZaYjHRVNaRYSjLBvu2lYbRbGxx3TH285WaH3PcFZyHP/1yCkK0IowDzis3nEzda/1Jor2BF+FMijiG+dDO0ComTa8Jb6TcWDm4MrCZqy8XNIluwdGFfXrdvJMwVd3OymyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TL+Dt1sAp3vhxXpWprlMvslntvmI9tK/UfQr63vTPKw=;
 b=S7Q+7SlEBaK6hAfxcOFCWXqPA4xn/tENgZaTJAoIdpMKtUCq+ezuoU2MkgunjnsP7j2y+FsmZYFmDHi95DZmr252zHz3AcFLn+WzHZNi+Xrr39H9TlsjovKbEgbyayzq0ORam65b9gC9MCIW5I/nUmiimgKim53b58+piur9vLo3Bl9rFZF2ism+aln5ekBrNXUPIpj9CUmwLCAx91Igjf5C6WDyAWL36xonyKZgEoZGaQKe4OIed1tF454JiqYOvBo3ZbYeUzLHUueakuFo02jVoBnc/gPJk50/Z+zcZW0viuavVbn52TKGhgScLpuFZBFgzzMkV5wMq/6K5zLT6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TL+Dt1sAp3vhxXpWprlMvslntvmI9tK/UfQr63vTPKw=;
 b=IPTCKjlsw74Epsj1xY6MH71BQW7CaNqghc+jTuwtDDvNPe6fQhXcryWZ2pnxzr2Wpg6PlLXwYkbQONpfW5B5ZSsE8I7xxpDrVHmpl5nBCtubiYJRQHeFv5+NlSS3vozVEefY6EM6rya9q0InFBrIyJa6NKoHdAzbFLl7hj0HPg0=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5333.eurprd08.prod.outlook.com (2603:10a6:20b:104::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Tue, 24 Aug
 2021 08:39:41 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::3c5e:7829:362d:1423]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::3c5e:7829:362d:1423%2]) with mapi id 15.20.4436.025; Tue, 24 Aug 2021
 08:39:41 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 hreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v8 17/34] block/copy-before-write: bdrv_cbw_append(): drop
 unused compress arg
Date: Tue, 24 Aug 2021 11:38:39 +0300
Message-Id: <20210824083856.17408-18-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210824083856.17408-1-vsementsov@virtuozzo.com>
References: <20210824083856.17408-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR05CA0178.eurprd05.prod.outlook.com
 (2603:10a6:3:f8::26) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.249) by
 HE1PR05CA0178.eurprd05.prod.outlook.com (2603:10a6:3:f8::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Tue, 24 Aug 2021 08:39:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 60cfbe40-b2bd-4607-c326-08d966dab723
X-MS-TrafficTypeDiagnostic: AM7PR08MB5333:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR08MB5333C018BFDDAC546EC803F1C1C59@AM7PR08MB5333.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:60;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zN+XYkKXlw9/+1Lk2CNirknV3DVSkMvCTqWCoOPqW1N8D0Xgo6telcDvAkT00JdqjgNVmVnIOAVzgARcA7aI1XSpZ/G4DmKdlkrToqnha1qkRspYMnkGH+dGBZJSf4VwLrqnb9ovV3/jnF6t23kRNW5qmAMrZNG11fDKBtR6sZzovFXfVElxGXuuJaeYzrhza/yVIOWHMpNV72XDEIjbvhymEIMJe+OBxSB3m9Inq6V2HpQgN10EkPR1LzU59KA+9PAonyw6Yg9b/WCuNNvKALEAA6aFQp+0w7WlLrTu/dneT1tHi9+NUz1mYP2+tBRZ76PQB6dM3GfBfdBG7gv3f1MJSWB/veUiTAa1joYhoY6oerX0QlRWF3ShDDjXT/1LDGxo3mw3rwCIh1XctQ3byrUm5k4X2JKPV5Pf9L47mzfiedQNDNRE3xVyxAwXY8veGichW5JT+M4zGHODTb4n9yX+ILuDTb+/LlUtpmbNRRIsoLA8qwGrn8JRyX4cmOpc0WeuP1rl4hGXOT9uf+BtclHOn/5ymA8OGJrv2j/PpxCqnwdH36es5ziHZ67JwWEgB9G6dasoVwgZNOakMNjq5VOZVG7pQJbcjtJ6rfcWggJpju89LytOZNEcl0dHxyI+GLuBMitPGlSEuaVaAjQgTO/RVCcYjk7Y0fqPParAaOArZzt5MAAj7/w4XVkJTrSIVJUk4bsVn+YWzgOnpGq8AA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39840400004)(346002)(396003)(366004)(376002)(38100700002)(8676002)(4326008)(86362001)(52116002)(38350700002)(83380400001)(7416002)(8936002)(6916009)(5660300002)(478600001)(26005)(1076003)(6506007)(6512007)(186003)(2616005)(66556008)(36756003)(66476007)(66946007)(956004)(316002)(6486002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/I/uXSQSmw2OrCbMl9pUigE/bFu+6VGGA5w3+jcXxME5wptYntDH7mKsPVQB?=
 =?us-ascii?Q?TbvW19va4ZSyblN3Gp74rbO9oA48S65qtq87M/+V1iWHB1+tu7zBJf2V6EcO?=
 =?us-ascii?Q?ICwE7X0n2fiEvoYx+EOfClOjzd3394MLPtsdw29c0gu1tq5OHa9wz3ud53eB?=
 =?us-ascii?Q?IvHBW5l+aD2ws3F+RVVsq10a6budKLliWITImbTMYFdTUCW2twWOR4O8eRN0?=
 =?us-ascii?Q?p9hFIQ6Frg480wlMIzKmnpVhHFbYVial29+CAIqKCbK48iNzQLvy13/TD+mu?=
 =?us-ascii?Q?9iF+OxW+z0mzSM54w5hATM5sfYnpo79yKsR+IYsKp5RfkLMC5H9MmjUb6JSF?=
 =?us-ascii?Q?rR33407ADuOwllH0HI4AQvUAfqkszECrCF0fjdRFLgZ4CMMB5gqXGUAJpxXe?=
 =?us-ascii?Q?K5JcsT7xssImt98a9hfGOUwo5WRdHoBD5RD4ssRqzUfjo0aRPDLgfJW4iZiz?=
 =?us-ascii?Q?HbkNQj1UhsdaLvHKEN14NxTkVGGbgp0BMFC8p9HXhd/Q1xeAy+fyqWNFHgwN?=
 =?us-ascii?Q?ZLr5HavXRnfH5p4PK8fxOXYyQjiOsaDCVbRY7rSUeqGX55WOZdQTuelH+Ve6?=
 =?us-ascii?Q?N9fp54Mbo8Wp01ccZL52vSPgZ5nexBl7AKqNWuiEgf5OHQ8Nn8ZJ9v67wH9X?=
 =?us-ascii?Q?unkChvruaorecP7nQ1EG11TXK6f/Yu/Rz3awJCBPU1Ir5+wby2CCAK+PIrRN?=
 =?us-ascii?Q?N35wV8wMiR3dbL6bPYJJiboEPbyRo+yCIvocKQJiYffbXEjv5mOTr0W6brSv?=
 =?us-ascii?Q?wMxEy85iB/eCrrH3qEguCt2rW9OxyocXSc0x/AZlaxbyFhJHA9RYFah+lepM?=
 =?us-ascii?Q?tRMPr2tVopnpaMrCXZ4uNsLQmsYOtTUVreII0VpaMTCUOjuq7IDLauqV0GHn?=
 =?us-ascii?Q?UyGqDtUFyslJwu72Lm3HG4aZWifTO1gKeoUjbSShb/7XiqUByPds0WTBc38u?=
 =?us-ascii?Q?7MHNDaKQPYXV5t0/9uH0mEyxa6q62cKk1+oPpP7NRvRe5kjCcl5hxsS4bF6T?=
 =?us-ascii?Q?Dq07YJo4v/ZBO6XappBvhbvDAi4MT5+6g/C+HKLnMUvxWWD4Nz5RY08PNKZZ?=
 =?us-ascii?Q?ftKUpj0ryPM6TvRcoL6NK11XW74lRKO0FcotLsWAHEWxMA0LVRyBUebfbFN4?=
 =?us-ascii?Q?dIIhAVBCJ/xWG59Zno3z7TqItz6Q1Ag0TbAwfPRVpzcOgf4NLR5lshepmmVr?=
 =?us-ascii?Q?yPc4F4Bl+LIBxA47AVnMx9UaZDCpUnzSBxK1rS9rldMzDKnb6BGj4fne+VGw?=
 =?us-ascii?Q?g22X9fkM8In0meIm4cJxHw9fly6NZ/RqQDr8HRrlMArAqA5V0f7+NgfdwWvk?=
 =?us-ascii?Q?+fwbuhRNa85FyfGnD4yOUjz/?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60cfbe40-b2bd-4607-c326-08d966dab723
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 08:39:41.3095 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sun2tWfCnMMfrOOfW/RV7LtzvVcFEUCbS/X1AbPsX80L4Syb1JnuZ0OBnG6ZrZp6Cuh6t06ECX73aiMiD7EnwQZZQkJ3+h5xy3IBqxxiZxI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5333
Received-SPF: pass client-ip=40.107.5.92;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-VE1-obe.outbound.protection.outlook.com
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
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
---
 block/copy-before-write.h | 1 -
 block/backup.c            | 2 +-
 block/copy-before-write.c | 7 +++----
 3 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/block/copy-before-write.h b/block/copy-before-write.h
index b386fd8f01..51847e711a 100644
--- a/block/copy-before-write.h
+++ b/block/copy-before-write.h
@@ -32,7 +32,6 @@
 BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
                                   BlockDriverState *target,
                                   const char *filter_node_name,
-                                  bool compress,
                                   BlockCopyState **bcs,
                                   Error **errp);
 void bdrv_cbw_drop(BlockDriverState *bs);
diff --git a/block/backup.c b/block/backup.c
index 83516297cb..4869f1e5da 100644
--- a/block/backup.c
+++ b/block/backup.c
@@ -452,7 +452,7 @@ BlockJob *backup_job_create(const char *job_id, BlockDriverState *bs,
         goto error;
     }
 
-    cbw = bdrv_cbw_append(bs, target, filter_node_name, false, &bcs, errp);
+    cbw = bdrv_cbw_append(bs, target, filter_node_name, &bcs, errp);
     if (!cbw) {
         goto error;
     }
diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index 4858dcf8ff..1e7180760a 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -145,7 +145,7 @@ static void cbw_child_perm(BlockDriverState *bs, BdrvChild *c,
 }
 
 static int cbw_init(BlockDriverState *bs, BlockDriverState *source,
-                    BlockDriverState *target, bool compress, Error **errp)
+                    BlockDriverState *target, Error **errp)
 {
     BDRVCopyBeforeWriteState *s = bs->opaque;
 
@@ -173,7 +173,7 @@ static int cbw_init(BlockDriverState *bs, BlockDriverState *source,
             ((BDRV_REQ_FUA | BDRV_REQ_MAY_UNMAP | BDRV_REQ_NO_FALLBACK) &
              bs->file->bs->supported_zero_flags);
 
-    s->bcs = block_copy_state_new(bs->file, s->target, false, compress, errp);
+    s->bcs = block_copy_state_new(bs->file, s->target, false, false, errp);
     if (!s->bcs) {
         error_prepend(errp, "Cannot create block-copy-state: ");
         return -EINVAL;
@@ -202,7 +202,6 @@ BlockDriver bdrv_cbw_filter = {
 BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
                                   BlockDriverState *target,
                                   const char *filter_node_name,
-                                  bool compress,
                                   BlockCopyState **bcs,
                                   Error **errp)
 {
@@ -221,7 +220,7 @@ BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
     }
     state = top->opaque;
 
-    ret = cbw_init(top, source, target, compress, errp);
+    ret = cbw_init(top, source, target, errp);
     if (ret < 0) {
         goto fail;
     }
-- 
2.29.2


