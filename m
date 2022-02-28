Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A9D4C6B3B
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 12:48:51 +0100 (CET)
Received: from localhost ([::1]:45800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOeWI-0003QX-Nr
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 06:48:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nOeNg-0001zJ-8d; Mon, 28 Feb 2022 06:39:56 -0500
Received: from [2a01:111:f400:fe02::721] (port=57446
 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nOeNe-0002MY-0l; Mon, 28 Feb 2022 06:39:55 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fje/V5pPYQlvSWR6AXclCJUhwa4pY8K75uMSn6Ty7WTFDnQ/UQhD19btvB5DafuLS9cG7MpXpFmeNPZcbPaI2UcjNLhCdcV2YL22bCb3ak39REkmvFbfXp1M9Nzgq7EeSV3QUYPQfI56WmpK0ryr4zsKzfI9Vd6S0bGCIP7SEoznkqyBXqAESzFCUhcf+mxFMCFEL5DiedhIh8O2UUW9ax/F+SimDsPGc3dUiRXIVuPeyFmgak4GXYQmfTCJ4iAx+iequEgW3+FFuWz5Fa/SKYjUNAqSuSYRF+mM9KCoTB/wJ2uv0ZDm1hUHYwvsVyQR2T8r6iWPs5wj+7j1tcF5Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ca8vM/oTqjTB8b5Pi2Mz4F8t/yw948dRrpl+Gsj2CCw=;
 b=Qcfote+0vVtomnpFYde8ZTzA0+KR88nrdYPDJw3zGTB29pUpovCuAYQqZSEAKH66FhttZhAm25eGmDt7QWVOXfRISiG9uNuTRf/bWpAjALuOW1vGPb7Ii5vwrSDrYep/x+17DBj+vO6APkAOy20DRDcItAVCTf6TtC6DS/75YMSTIx41zvUnJj2zijLdcJxA4XSrgPyqKnF4sgqgYOtHafejmTX9VpDdrCNYsbLchW2LI8ReR7i/1iCjMyVYtW2+mtry5lKF5tNwBTexGIySTYmxID4YefNbODZBiGY2U3W7AKexbyumxBXotTcI9rlF3KS+Y3NC22OfL+wamKpuNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ca8vM/oTqjTB8b5Pi2Mz4F8t/yw948dRrpl+Gsj2CCw=;
 b=LohAb5XqPVsyjqGtmAGq44DC39g3+EhLhl6yC2IQF+s5UMZFPSG7ykpiMdQDEclisi0ICZiuxxxaWr5nj5mKaoiunbxlsr9IiVGoFtP/8tOVCkLkuS4LaELNNQH/ai1cTCw39Q6MebDO1U/O0Pwf6CEFiwSk0k/2UVjeOlUtJgM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by VI1PR0802MB2272.eurprd08.prod.outlook.com (2603:10a6:800:9d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.21; Mon, 28 Feb
 2022 11:39:49 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%3]) with mapi id 15.20.5017.027; Mon, 28 Feb 2022
 11:39:49 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, fam@euphon.net,
 stefanha@redhat.com, eblake@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 nikita.lapshin@virtuozzo.com
Subject: [PATCH v5 05/16] block/block-copy: add block_copy_reset()
Date: Mon, 28 Feb 2022 12:39:16 +0100
Message-Id: <20220228113927.1852146-6-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220228113927.1852146-1-vsementsov@virtuozzo.com>
References: <20220228113927.1852146-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR09CA0135.eurprd09.prod.outlook.com
 (2603:10a6:803:12c::19) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 045f4191-b93a-44ca-a332-08d9faaf06b6
X-MS-TrafficTypeDiagnostic: VI1PR0802MB2272:EE_
X-Microsoft-Antispam-PRVS: <VI1PR0802MB2272E87E43AB5042AB7326DFC1019@VI1PR0802MB2272.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r+kETa5sESQSp62K+2jsiMTmPXLSji2egbRPkZoMVQek+SdpSzc4fDKA/NGGNCVLXXCgNyIYdIrqolsG0uWn+RPRLWT7uu6BykW8MkZWHA6m6L6gbBP5VJb2M0yS1WKqpeVJnmFl7oCsq45AD08Dd5gn5oPKCp60u+tZ1QhoUVzHU19/yoU2Z5Dyjwbn+G0fBQ+Nzoy54J1GrUOBUemh0iqD474HzJ6UOWUJ79L2+NLDntZHbVBwINklKhZGnusEj49l84iAW9NvRneID96QNoYlH8xBSeRa7po3defr8B9a8KX/64EwkhS8zE9Dn7tcTVlA/Zecfwe+sxypK3YdeB1+Ce/ZmYO+18pj4RZMPr0q0Uip6zNDNiUDxXNh2PYxnMdkfECPNHf7yPFpjbitxwkCilkCfcCUNcJqHWoQqpwhiKKXNy5kh9ZobUFETvOYrEBjfu7uuyV/nGFqmaVNd1mf78hFKGkbUZcb6MNEacyK2xT8GGHp0bCedgzIw/jGfh7zi/MU3pKVnJLbci1YcViHBGcJy0NjAvJpEnegQVEt6/t/6mgP7fCSMaYG8dh0CJkGox7qHyyxas/XB0TsZBeDe8grWklcgG22l948UF5ohzIRihS3wwHruqH1RiPKcckbRpba5ch/bIsflmKtVV2+9OcEL1kRlJJVFm7l2wlX4MFHGQgBynRNOFbn8rhR8V9bu34u+zcQiXb1Ey/cxA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(5660300002)(8936002)(4326008)(2906002)(66946007)(66556008)(66476007)(8676002)(86362001)(36756003)(38350700002)(38100700002)(316002)(83380400001)(1076003)(186003)(26005)(107886003)(6486002)(508600001)(6916009)(52116002)(6506007)(6512007)(6666004)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qoMvIvNBMP9cetj/M6bqRmc5I0arAozlWBumNsmPd/aJubws0ozRLB2BzTLc?=
 =?us-ascii?Q?qtdKSI3AkzljnSju1fyeXfQTvtPbXymLq8Jd6WKsov0IqTqYiv96BBp0f920?=
 =?us-ascii?Q?RdHCj9vSO12SF++Ah4uAsiv9AqUgtWGbcWCldOcRuQOArsRyQGjEEbVW2klY?=
 =?us-ascii?Q?TuMrFj5srZNy+cAsCd2VcizyL7yPa49wdK5UThqucB6+XCX2jmUjleOKre0d?=
 =?us-ascii?Q?pCdGzKyD/lKxk+fpT1o8IknxcCOHy8e3o2gDjG/w5V3btTVYcjgcUN4RrE6f?=
 =?us-ascii?Q?ilsx/fOI7vSh/r936QhWshLOFBJbuTgpDS4F5Soka1YQXMEmpntGCM0paSB0?=
 =?us-ascii?Q?Pj6rB1Ch0EMexSP4dNWX3SvOXfbsd6fDuI2BJnBjbtPdQTqdz6G01/dutBtU?=
 =?us-ascii?Q?+nnURChiN8EZqXocRxUgPA4VCxPEeVUGfdq2V2HZjr01VQw1JgzIa3H6OIhM?=
 =?us-ascii?Q?j7uBIswxJhtZTK7nwi6szusCx755+z/JSDDw5MRiWTOyYzfDPtd7BNTCmP4v?=
 =?us-ascii?Q?Lr45ey/yneNYO2ZtyvO/claCgKh3N5ugkis99vlStp6V11+JtSmhfczTF0P+?=
 =?us-ascii?Q?eqviV3WJdJ5uL0Elf4wnNg5vKOcG+ga9SDAtuh1RE+bZ2qfll7PlztFtc0Nw?=
 =?us-ascii?Q?03px/opIJANSLuJW3Np/asREsTp4gdJt5Ff41BOpD/oi2Ra2uCUZ1OilHjRr?=
 =?us-ascii?Q?4cfLLgOdpTMvg8v3wTbWdmmNp82e1/hmypZnNgr+SSOsm2nb5OlgGYz7SqI2?=
 =?us-ascii?Q?fXyPgYPUYgt4Qmq35U5jrnOdTysQZOCe8+qY3TAhaSS4de8V55GdkUY/pMYy?=
 =?us-ascii?Q?wWWpHC0TKEswm33G+4Q/CyjE8eyP7RPoxtoB9H3RCKTpjJOHKRV1Z40lkCke?=
 =?us-ascii?Q?qu6s6Ptpmu4fwekF4c3Jn05bjxqMsNd0zhLr0k0n3mZ6EAOECzXh6N8+Xp4u?=
 =?us-ascii?Q?rLVQpszza/9APBEdynzPJSzBE7v+ajM0mBr54ccTxAn5sUcW8T8BM2+l8J5B?=
 =?us-ascii?Q?igAywwOEt334Pma7B5d/RJJqf0/XKcdtziclcNz60ig8hqxm1+I5fEeYchMy?=
 =?us-ascii?Q?izLCx81+GnKql/4iAf+Ca8NuWCe+p9pttYIqFsZn+RoZ+pVHbv3eM4NmEnKD?=
 =?us-ascii?Q?ZKvpsEh5xib3fr+cvCAKlPINC5u2GR9d3W04hz3MwQjCZFOICJQZTbAggyBo?=
 =?us-ascii?Q?q3RUg20hcOWlRhq5/6BXIIMJ6ifugohNMOhDux7R8VHl0MUyJ0UyqU3o4kE1?=
 =?us-ascii?Q?V/zCiKxerMLFp08HsnSdR04/2hQCEPFugiKhwdJlTMKnKSjP6DoAfXCZGNY5?=
 =?us-ascii?Q?YPib8c/AFN+pcShJ1z6wV1PjwZrO55F3Bip6VL2dGZxanbo1zmDT8BEAAksm?=
 =?us-ascii?Q?euU/8hZMHwxAeUdGbnMsNi1vIaR26N+CxsYwJBAnq21/XYnbRqStiQ0UuFXi?=
 =?us-ascii?Q?oMLGRO1oNbHB3Rggu+hqQJ0pYpqGJ1m8pcQjbPcm7uFeT8LYkJMHq09WPQ2J?=
 =?us-ascii?Q?kBTJvudUE2LUFQcU+JPH/3/STpwjd3bM31/WIX1lNEDab6OhGfBOEZodMw/g?=
 =?us-ascii?Q?cc4vMFhcmlNYtt/M1+U7T5R4/vccc7wrMIyN5sqGjfk63CudXtQHfDhJo/x2?=
 =?us-ascii?Q?Mukc62mQ+5lNCNr8synmeM4Zzi8f63dmrDq0tNruxtkPRFUYYHskBBtsRP3l?=
 =?us-ascii?Q?xsoR0Jj5g6z+A9RpmwkB/SxdhMs=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 045f4191-b93a-44ca-a332-08d9faaf06b6
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2022 11:39:48.9739 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h6CnmFHvPl1WWKCQ9T7zxeEz4Mc7eiRiRgY1j0VzKco6Mc7g6b1mi8bDZYZcERiyJv/DBWMlbL2SXOF4gZY1hVjbQAE0ufaSNtVD6aNBAKQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2272
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:fe02::721
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:fe02::721;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Split block_copy_reset() out of block_copy_reset_unallocated() to be
used separately later.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
---
 include/block/block-copy.h |  1 +
 block/block-copy.c         | 21 +++++++++++++--------
 2 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/include/block/block-copy.h b/include/block/block-copy.h
index b80ad02299..68bbd344b2 100644
--- a/include/block/block-copy.h
+++ b/include/block/block-copy.h
@@ -35,6 +35,7 @@ void block_copy_set_progress_meter(BlockCopyState *s, ProgressMeter *pm);
 
 void block_copy_state_free(BlockCopyState *s);
 
+void block_copy_reset(BlockCopyState *s, int64_t offset, int64_t bytes);
 int64_t block_copy_reset_unallocated(BlockCopyState *s,
                                      int64_t offset, int64_t *count);
 
diff --git a/block/block-copy.c b/block/block-copy.c
index 8aa6ee6a5c..0834e29b6e 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -692,6 +692,18 @@ static int block_copy_is_cluster_allocated(BlockCopyState *s, int64_t offset,
     }
 }
 
+void block_copy_reset(BlockCopyState *s, int64_t offset, int64_t bytes)
+{
+    QEMU_LOCK_GUARD(&s->lock);
+
+    bdrv_reset_dirty_bitmap(s->copy_bitmap, offset, bytes);
+    if (s->progress) {
+        progress_set_remaining(s->progress,
+                               bdrv_get_dirty_count(s->copy_bitmap) +
+                               s->in_flight_bytes);
+    }
+}
+
 /*
  * Reset bits in copy_bitmap starting at offset if they represent unallocated
  * data in the image. May reset subsequent contiguous bits.
@@ -712,14 +724,7 @@ int64_t block_copy_reset_unallocated(BlockCopyState *s,
     bytes = clusters * s->cluster_size;
 
     if (!ret) {
-        qemu_co_mutex_lock(&s->lock);
-        bdrv_reset_dirty_bitmap(s->copy_bitmap, offset, bytes);
-        if (s->progress) {
-            progress_set_remaining(s->progress,
-                                   bdrv_get_dirty_count(s->copy_bitmap) +
-                                   s->in_flight_bytes);
-        }
-        qemu_co_mutex_unlock(&s->lock);
+        block_copy_reset(s, offset, bytes);
     }
 
     *count = bytes;
-- 
2.31.1


