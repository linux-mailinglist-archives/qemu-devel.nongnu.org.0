Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9D7D3BBA0B
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 11:18:40 +0200 (CEST)
Received: from localhost ([::1]:36182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0KkR-00052R-Su
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 05:18:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m0Ki8-00029l-BZ; Mon, 05 Jul 2021 05:16:16 -0400
Received: from mail-db8eur05on2138.outbound.protection.outlook.com
 ([40.107.20.138]:40000 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m0Ki5-000816-P7; Mon, 05 Jul 2021 05:16:16 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a1cHVOZJMMnnm2d3uYqmnqSWaJQ8p8L3KUI6JhvvunbEUU6/TACCF/hCB4avVk8aZpfIUcFZM/+Wj/yHGmw/4pGT8rqchADuWx76lRiz5PFNdKkMulXFfwnt9gU+0Njjkj0neYfKuPxLAwwvtEjB2TklXe58mRzW7BoDfVjSE50zXfBFRveC+r12tSKyn/7VHTljHtzkCdoVJrG08+2gDOjzZGPxnE1v+0w0cqVJsxe+TS2Je43fN81uuRqlwNgkPqVFYqjZcXKyYYKzL0uJzyHE1qkTTsn0xNMTl830RQJ3cOWCcyjIHWwBneXkFGmN5QfVOMW2siY3d2vV68WIlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+1bJp1VbryRD3lAoFrjwUz+8MpJ6aYdOyYUt7Tj8b8A=;
 b=DCdTlYHcH/eLBd7NL5shXxrPK4F+unIQEvZoFU1Houwvh1oLZpFVKiiYnykgGJ6rAtBs5lW8PCWDBAJPaNzoeFP2oti3xczkYBr4cTSeVnoEHVgZCaHct5L7wDr9e6ZMnjHuVCPCL6AF5TnN4S6cehtwwC8xYqNcYXzlPqXJXl0mDfzHChDDbPUoGk9GE7KBQgznHNtDq5+AOmhAiXnVBSyNp99y/L0kiSugNA1WoM83e0sWTMex1EkGer9yIxWHqo9tm+hU4XdoBZIyGulCJPKQEnif/5A6oLoZYUAeSh7CmhaE198LhYuXtKTlHq71m1JMedEQP0/2edzXF0+2wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+1bJp1VbryRD3lAoFrjwUz+8MpJ6aYdOyYUt7Tj8b8A=;
 b=b3/oRD5pBVyxnbzT4T4vUJ5TEqRbqxupWgtMjFOdqvf3gfB72d3Guh5YK5wy32VT2FrPuh7P8wfyepQ+boQ6plZB86nNVmOb908tNxE+shI225PyHU9JQXIdMKBvoz/JbVm7faEMxedHBkB6HWBCKVa+TOaYWetFrG0AAaNQUws=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4470.eurprd08.prod.outlook.com (2603:10a6:20b:b5::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22; Mon, 5 Jul
 2021 09:16:11 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4264.026; Mon, 5 Jul 2021
 09:16:10 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, mreitz@redhat.com,
 vsementsov@virtuozzo.com, den@openvz.org, jsnow@redhat.com
Subject: [PATCH 06/14] iotest 302: use img_info_log() helper
Date: Mon,  5 Jul 2021 12:15:41 +0300
Message-Id: <20210705091549.178335-7-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210705091549.178335-1-vsementsov@virtuozzo.com>
References: <20210705091549.178335-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: HE1PR05CA0235.eurprd05.prod.outlook.com
 (2603:10a6:3:fb::11) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.215) by
 HE1PR05CA0235.eurprd05.prod.outlook.com (2603:10a6:3:fb::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.22 via Frontend Transport; Mon, 5 Jul 2021 09:16:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 931406d3-7e09-47de-0875-08d93f958795
X-MS-TrafficTypeDiagnostic: AM6PR08MB4470:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4470CE71D11DFBD8EAFB4928C11C9@AM6PR08MB4470.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Xvv/TrkbrxSytgB34evcpgfYMLxKSAUI3bAzvHjKo/77K1Obw7E2xDLy1Od2yy/mOk31Ee84KVvHD4GxCPHYRUP9X7N2n+VH/thi9AiFZBLXPLP9VR6L6k9EKcTyf+UY4mJfJ+V7bqkpxUxFKBOWvN0uPlD5NcR8JVQs54OY+FRlkb6yfs1jbNXkQdGZyz5F+SMxCvL/fCiDoiY3SUqzOkGfBkG8Uv633JqC2ZPbIxGu0n9Bxw084EECI0NT0d47t00LQEQHZGcb7S+bt/CtEmBjvq0jcmBNtjEpsviUQVfY29Y3GtrBvKD0nuxp6L56hGQIqhbLBKqExwpKZ0Zkd9fo2tvWm8K/3VC1UNNvsl11BjriwSivwvoisQ56TdrpUJlh+BNs5aG3bHaVzpp29obwWCb24s3coNJ1pH053LJbjMlAq7+pKIyG0tZSQY/qSTDKxQZOBOUDU94CQdSYtKrwdjZ2Blnxuesu2aGjO9IBn9VU1jCA5GFdDxmAKXbQVRR2Fzjzcu0mAxW/G7m4UMHB9pAzVKRquWGSy7f0NSHg9nXgFUIo3NcbRl8D/7XB8YavvDpVTatiGnGLRhzfBlorWKSxSeyhUDmMD2a7pw1xyW8yTg7y3ZqaDMUxNU1C1rDrIfBpVQGUnW11ebdRYB4pCbUVrOZqVVholRedJlR4Y+rL6NTHqhKuNVSjqQUpbrbSd7Iyl8/2bdS+vhIYJAqILUXVwd4O0hC5mOnGVcDmvWspiamyNgWVa9uW/IMZ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39840400004)(366004)(376002)(346002)(396003)(478600001)(66946007)(66476007)(66556008)(4326008)(956004)(2616005)(83380400001)(6512007)(2906002)(38350700002)(316002)(38100700002)(6916009)(6506007)(6486002)(1076003)(26005)(186003)(16526019)(5660300002)(36756003)(52116002)(8936002)(6666004)(86362001)(8676002)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IB8EONy/wz1PZokq5KUDSvUHfcS+ye0jlHeLYSo0a528+ljU6afOGN9cNnhS?=
 =?us-ascii?Q?J8LxcVAPk2NacPcvPTO9ay/9ayCypwqpBsYZVOVlqezTXEwiyChnDe9ZCRJ/?=
 =?us-ascii?Q?zEY9n5spK5pQK0COt9r9x4L6/WGOBK+cANbE32qcA+kNxL9u3shLgi7Vvq/A?=
 =?us-ascii?Q?vMw+DPUC2W9vjmqMcRBtRdYygOxlovsx44zHMIju+LKqAPguta363P3zg50v?=
 =?us-ascii?Q?IykraN5YJwKaf1jp14uxKW61qpZhferpf4ECGZ1KKYlt+zFyOd78ag1akJg/?=
 =?us-ascii?Q?6PgY7kT9tnYXSg4LNEEp68HQzEeFSRj3TbEj7EhPiuLhZWKxguyTTAuXkgjm?=
 =?us-ascii?Q?5YWEgZk9giIxBt52S5S5idbHurISfVigaGT+xH8cPngiPtMbt1sulcoQsojX?=
 =?us-ascii?Q?bezrZldj4U827nNAT/uffeIC7iornDLTFfEyxZYT1c/3zkX/C1MjxrVO8obB?=
 =?us-ascii?Q?u64u6849QcVNtITjJL9ZoKTNJrOqTI/+7B+Uetbl1rmbpFStwJoYfMIwcqP9?=
 =?us-ascii?Q?APmCUW1zP86NJixpavQBIAZtFTY6+laLih4rypnMqw65PCZHYAYhi3u875yh?=
 =?us-ascii?Q?WyVaBpwAu8WHRNZy1khpNQi+SiXaFXeZzSZRt3E9NMJ+uQHg3Q6ssuJcPj4X?=
 =?us-ascii?Q?XX/MlufuY1xqTvkTr9W9I03/RjoIcwSBp07TWT39zQi3xcDpyVcnPn7Dsp22?=
 =?us-ascii?Q?Q1MzYm/B5qA4f2UDP1909YK1vwrbsqy7N4yPIMBQtQ64BbB+iUUq1684zxZ/?=
 =?us-ascii?Q?0ESjvSgdDHD0lhlANZ5Usufb+W5LEthb6t6fnFn5/sp2cO7pXHpPZjfi7QG7?=
 =?us-ascii?Q?Mc/Zi57yJ3SAw1Vtn6wsDkjhXeakbjqEx+kUccz5CoVJnVomJHTnsv8KleOD?=
 =?us-ascii?Q?xbFFgwaHJKBVeYu+Szd/D7M057V6MYUCEGbFyMlkNAi+M45SVdOoYHejzumT?=
 =?us-ascii?Q?P9m7pwseKPhTbbtjuyEqrrZ74T9IMEAV1Lx70/cDcBlGPo1HXELpInszh8nU?=
 =?us-ascii?Q?HxNmYT8hNEzw4W1PWUf3/QyvV3OvQ6Fl+VEPEBvGI5916uBcMBWYyyHxtfrD?=
 =?us-ascii?Q?qgJIu9v7dnoeAg/tMmhTUBHoHBZwE8aQ49fOSotE1kOlaFOv/nRpbm4C0jyF?=
 =?us-ascii?Q?IEIJrW38hpljb0WnTgR13e/7f1Il3t15RvIFOLGnAnKQY87BfZI9lCqJ2rc3?=
 =?us-ascii?Q?F+IsHDGOO7PcBuYNCfWYjegZPNWgMF7p5OV6HR1EoVdvhEvcCjUDSJDlCGlD?=
 =?us-ascii?Q?qUX28BHqmtNOq9GKAtoQlNZ9+BmYfh4x5kjWy1GWOy3ABtTmc8iWKcTfLSRm?=
 =?us-ascii?Q?fIV7WyQKWMHp//HEJR4A1Q3I?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 931406d3-7e09-47de-0875-08d93f958795
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2021 09:16:10.8606 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cp7QydC3UeZ4c5GNVrJfgR0FekelW9uNL8IoTQq56BJPaDJq/19uvIkWVQArnJJH6DlCBGZlgmygSkV/a6oaA4uSLdvAD+qCq9U+HJ3pUuw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4470
Received-SPF: pass client-ip=40.107.20.138;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

Instead of qemu_img_log("info", ..) use generic helper img_info_log().

img_info_log() has smarter logic. For example it use filter_img_info()
to filter output, which in turns filter a compression type. So it will
help us in future when we implement a possibility to use zstd
compression by default (with help of some runtime config file or maybe
build option). For now to test you should recompile qemu with a small
patch:

    --- a/block/qcow2.c
    +++ b/block/qcow2.c
    @@ -3540,6 +3540,11 @@ qcow2_co_create(BlockdevCreateOptions *create_options, Error **errp)
             }
         }

    +    if (!qcow2_opts->has_compression_type && version >= 3) {
    +        qcow2_opts->has_compression_type = true;
    +        qcow2_opts->compression_type = QCOW2_COMPRESSION_TYPE_ZSTD;
    +    }
    +
         if (qcow2_opts->has_compression_type &&
             qcow2_opts->compression_type != QCOW2_COMPRESSION_TYPE_ZLIB) {

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/302     | 3 ++-
 tests/qemu-iotests/302.out | 7 +++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/tests/qemu-iotests/302 b/tests/qemu-iotests/302
index 5695af4914..2180dbc896 100755
--- a/tests/qemu-iotests/302
+++ b/tests/qemu-iotests/302
@@ -34,6 +34,7 @@ from iotests import (
     qemu_img_measure,
     qemu_io,
     qemu_nbd_popen,
+    img_info_log,
 )
 
 iotests.script_initialize(supported_fmts=["qcow2"])
@@ -99,7 +100,7 @@ with tarfile.open(tar_file, "w") as tar:
             nbd_uri)
 
         iotests.log("=== Converted image info ===")
-        qemu_img_log("info", nbd_uri)
+        img_info_log(nbd_uri)
 
         iotests.log("=== Converted image check ===")
         qemu_img_log("check", nbd_uri)
diff --git a/tests/qemu-iotests/302.out b/tests/qemu-iotests/302.out
index e2f6077e83..3e7c281b91 100644
--- a/tests/qemu-iotests/302.out
+++ b/tests/qemu-iotests/302.out
@@ -6,14 +6,13 @@ virtual size: 448 KiB (458752 bytes)
 disk size: unavailable
 
 === Converted image info ===
-image: nbd+unix:///exp?socket=SOCK_DIR/PID-nbd-sock
-file format: qcow2
+image: TEST_IMG
+file format: IMGFMT
 virtual size: 1 GiB (1073741824 bytes)
-disk size: unavailable
 cluster_size: 65536
 Format specific information:
     compat: 1.1
-    compression type: zlib
+    compression type: COMPRESSION_TYPE
     lazy refcounts: false
     refcount bits: 16
     corrupt: false
-- 
2.29.2


