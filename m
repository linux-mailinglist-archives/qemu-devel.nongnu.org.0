Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9E704B920C
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 21:02:37 +0100 (CET)
Received: from localhost ([::1]:33360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKQVY-0004so-Tw
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 15:02:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nKQGD-0003oy-0s; Wed, 16 Feb 2022 14:46:47 -0500
Received: from [2a01:111:f400:fe08::723] (port=55682
 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nKQGB-0006EC-0x; Wed, 16 Feb 2022 14:46:44 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m/kPMsAcbEq3pgYf47mbvfpwlAwVj5DUh4GMvpePBOO1XGLQWHSvR6pCprkFauweaIPAoFbKgknSG6Mi9XXR8jKPTG6PMzcp4bSnxCvuiArylZeDCQMTgz1utgFEPLKfe1N4EBnGz/ITwGAhp6VHr7gL7qBcrsjmZ2kJTVIsTtJVWS59ukbMpcIotriBzCpPB/QidAXDr1UAwjuxeg+5oKuD+yhWF/QedCushKLlxpSPyawxC5nJbqiT70UhfjYeIFLIxY8lSGx9h8KVa8ddLzdsxC/aYG6kKejnphJXDZBr78V80+LFM5fEFFSapb7FmNTUORSCaCsOlg3LwfobMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LzU1OaVgW9BswqeWbpnWhiOAqn0FfB5qKBAUJUKlZOQ=;
 b=ZRKypbisiWtikBDJVb1bdPMAMfL2XhNkCseLZKX+BMqNRMpfzleA4sPMA5EQ0fsolYQX4CgX8tp0CrUDA0EJ+wxewZdZbkdiOAQNEoPtYWYNruYW+Tb05GQ43ipK+QhntOTJF8zrR5XT6PrWKZ8HkseEvcVlvbKTD/tEdlFf2HuydQQS2b3lSmxnXR1Xpnlt+EhlF0aNJinPnVi0b8f74acDYwlc62V58ghzatOIQg9LDX54COi+9jfgs7ZFxroGIMsCqw2NoG/ZN5NVz420BGnG1oHlckGlk4KS9/d11zJ5pqErey40T8x8CocpxJqnwl41hJRVCIW3Rlt9uNSPtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LzU1OaVgW9BswqeWbpnWhiOAqn0FfB5qKBAUJUKlZOQ=;
 b=M4OEIkp7o4QpHs3q1BP8GZxTFXO0FJfsK/zKBrKeKuucNsWUK/o4HzxCapXcRrfdP3rhtG5c/88XKvGieeIiM01fVAYgax+6Q7HxBmUNUr2YESZlp9+M278yOR9WjgvwRIR/CwKbMitnj8NuCkD9OSk0LqHly1uWwQhkPRbR8VA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM4PR08MB2851.eurprd08.prod.outlook.com (2603:10a6:205:d::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.15; Wed, 16 Feb
 2022 19:46:34 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%4]) with mapi id 15.20.4995.016; Wed, 16 Feb 2022
 19:46:34 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, xiechanglong.d@gmail.com,
 wencongyang2@huawei.com, fam@euphon.net, stefanha@redhat.com,
 eblake@redhat.com, hreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, nikita.lapshin@virtuozzo.com
Subject: [PATCH v4 08/18] block/dirty-bitmap: introduce
 bdrv_dirty_bitmap_status()
Date: Wed, 16 Feb 2022 20:46:07 +0100
Message-Id: <20220216194617.126484-9-vsementsov@virtuozzo.com>
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
X-MS-Office365-Filtering-Correlation-Id: 97aa272e-c67e-486c-7bb5-08d9f1850837
X-MS-TrafficTypeDiagnostic: AM4PR08MB2851:EE_
X-Microsoft-Antispam-PRVS: <AM4PR08MB28517652CD9FC7B73463D404C1359@AM4PR08MB2851.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:901;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ko9QHDR8p4POdA6DfbXXqvGb0qla7Sa8sky145aIKjA1mbt147eflaVwmf01IaSdwztuHgvlo4JdwyLk2LJx1CMwq/ZkZhQvEfrvVIywretUPj6yF4ZslmwvppYHzeItev+9xphv6+xXuZ0N5QAvqIL/qeeVPKyIoitdl4sfy4bqPxYynoLpe3UpTxCKEpuwKoPRzSIaB0qfshUjI01Eyv5sFVsFSUy3YQMbXB1I67RumtdJGN49vwJV303zuwlQSssr9GBzjaKZaMroWDN3H1oVch9RFvTqmXfSL+TE8ryqcBPoKqWbjM7WTdf3SGUVJ6s2CcpVIh0DdcWWpMcNUy1TchNXHdO8ldm1szz5uW4adw0AhGpbQD8eV8IJY3X00mk6ty8y0INvrgAeEWsV/ApxBoyPhkkRVNLNWyGf+UVTjYMPIXtbkpIqMcwXrWyM+21cOndmVTsbj5ksMKjs1YsAnlSzrGor8bOy0gfvDZL/gmq3ZBE3146y7aES/m6Kdn5XXjtWIrrV5j0H82YoZLE6YBNYW30X4qYXs2ROLunH3E7oowyL+4epzBCXc0UWQ76d5Kjdhyehb1Yjz/IdvijgRKPf6xedtE9/njH39LJpndx6j0Ptx1tbhoxFkSFj1dBBKtvon3327FenqLpgtLSWolSUYe8lrk/jDevQCck8ZjpfbPbkfxdH0mxv6osmnEPt/W4cpXBqXjdiozizxROlJpd6xQDnAg/l8QSWLjU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(52116002)(7416002)(6486002)(1076003)(36756003)(2906002)(86362001)(83380400001)(508600001)(316002)(6916009)(5660300002)(66946007)(66476007)(2616005)(6512007)(66556008)(8676002)(107886003)(4326008)(26005)(6506007)(8936002)(38350700002)(186003)(6666004)(38100700002)(14143004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZBFbtHJpAbuKnwExoLg8Lo4fbUt4/3mDfxZYjJA+GYJJOlCPrvJUZLZMX+8K?=
 =?us-ascii?Q?7KZ3zW/wTs64xce0Ok0Kmcv6c4NA8mCYHBjv+jHwev8yYzMPwEs00fttDTtP?=
 =?us-ascii?Q?vRZkmkhYFqZnluqn0jhS5QPDJ6So5LYccQoA/BAKGCqPHU/eAtpqVbM4M7sS?=
 =?us-ascii?Q?WfhlADMox4PXciBQckyk8qLoNba1bvVxGE0jQMnmXbUCeMhmp04dmIkfGDTB?=
 =?us-ascii?Q?YlHU6zLD7hgAX2moWlL4UlmUlj5xaiVqebGoNeLNkNN3IujiRxlYAP8yhr5C?=
 =?us-ascii?Q?2wpN2wtZUPHWpsE4UaYG03r3amIclwCFOWtjzdfImFM2ke/K27dfIsVSQiPG?=
 =?us-ascii?Q?xGu/nqPkA5/io35V/Z113lW7xJ4SGcteap4keBLRXMeLMuugx7rquNBQHbXb?=
 =?us-ascii?Q?YlybH/d9byJVSK2BuyJkRI6gxWLaNLFBRpczzlnEkX9FKGcdfbnuosGlFRqj?=
 =?us-ascii?Q?J2+JMfUwkZGvvkBlSDcLdJELOfJr/Ta6kHpj6gSOtKQj8moNxXZsp7fjpySO?=
 =?us-ascii?Q?PkCRa9KX7sn0uWiXGG3c3X5UENcWr/7SIC0nFqUzWlq9GljDf7JISFKwOnxp?=
 =?us-ascii?Q?oJxSfEA+wYls3q2qNMOp4JIn4cJavY8p0CPLGFPOklfB9F6FOInP2U8SQFyn?=
 =?us-ascii?Q?GAC+oQQOyzxCO1P6sSTndVY1mUH8fvkURQ5DwEoclKEEJWaLQQxgoY033lmG?=
 =?us-ascii?Q?yeUNgat37myNMbFY2MznpHtIzKOuyv/0kLqPZhmiIjPwIVtofcFQOd7JMoSc?=
 =?us-ascii?Q?oKExEkikdYlQHfAq0pGbv4aABTprFM3dfir+skaKU9fMRvZiq1MBHBjVmQ7b?=
 =?us-ascii?Q?uKY9DOwpdHVDqNPKcL8d4TE0TdML3nOLl/wgrKpQeTYQGWl0OPwSShgSHZXi?=
 =?us-ascii?Q?uSRJKBGMrO/UFfsOnVIPxag0jGp/oy56yHShsGzKaQO/200mWmv/0PWBd/3A?=
 =?us-ascii?Q?qlWuEuwiWGIkog+Fgg0TxTrdzx/bQJxKu6MYLwMMGPQNlgSWwSzsKYsyZVqa?=
 =?us-ascii?Q?1/sIVDS3qWTpRJBeWinLUmRk+OVjXCeqng9aiK+MlIzaYPVC8T2eiWnLmOoX?=
 =?us-ascii?Q?cVlNJFX6G95JZTLqfLvkFoUpxBJUSNu9orzq8PIIOtD8LNg2NWe/8IZVLlDK?=
 =?us-ascii?Q?ILUKmvc3Yuws4upOMm/vafkVb/5KqA/lA7qXYOuWPtirEAG/vOMIkQbIpMHp?=
 =?us-ascii?Q?/pPisHufhYvZarAAOiamPQCZBdeMKp7cDSdae3sKI6W/1a6cna+BGOwKbJDz?=
 =?us-ascii?Q?zL3LXrZoQrRlEneiXsqhJJR7VOU/9Kwvl1+XqSdxsFVQe6ZMaJ50R3tfZ1iw?=
 =?us-ascii?Q?KSiDpnC9U7PHDKZL9Z9I1s5X1MtX7n68Hz11rgmDl7rVuPqXz8StrjhHAZTN?=
 =?us-ascii?Q?tC25Mp6kOGX4riq2+BMYgrMbPq5x7/GeGEG78SAIAcAVRAbgXGIwZI9YqNE3?=
 =?us-ascii?Q?I7ogodYfq8eMJQaOS0XslsB01mQps5bfLDJoPWnBFLzBKtyczgubdMJNNJnk?=
 =?us-ascii?Q?FN2KhgNm6jSYB63rdYCXXLzPaVwZwqEs2M/6ROoCLxvPDkcv0+B3tOR8XIiE?=
 =?us-ascii?Q?MTQKPls91E6g3HXr/1WB6aU9C7r0vXxtrDPvd1mptY6ZWK5Vg/lKHVe044IX?=
 =?us-ascii?Q?rgm61Jz3uV3AK5+zKXGroS9eCt+GWeAJKnsd5hTxMGsujForySUfEkf9wO6o?=
 =?us-ascii?Q?TmheYw=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97aa272e-c67e-486c-7bb5-08d9f1850837
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2022 19:46:34.3716 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YfQND6ZZtqMceab7ZSf6SrhCgmmALXepmZ89WUGbCRge1MVK8iLQmdLf9+6vLnOGGp5811Ka9JWHFjOrEqDjZvk7Unag2Bbwy1CKjZBraEI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR08MB2851
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:fe08::723
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:fe08::723;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-AM5-obe.outbound.protection.outlook.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.978, RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
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

Add a convenient function similar with bdrv_block_status() to get
status of dirty bitmap.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/dirty-bitmap.h |  2 ++
 include/qemu/hbitmap.h       | 12 ++++++++++++
 block/dirty-bitmap.c         |  6 ++++++
 util/hbitmap.c               | 33 +++++++++++++++++++++++++++++++++
 4 files changed, 53 insertions(+)

diff --git a/include/block/dirty-bitmap.h b/include/block/dirty-bitmap.h
index f95d350b70..6528336c4c 100644
--- a/include/block/dirty-bitmap.h
+++ b/include/block/dirty-bitmap.h
@@ -115,6 +115,8 @@ int64_t bdrv_dirty_bitmap_next_zero(BdrvDirtyBitmap *bitmap, int64_t offset,
 bool bdrv_dirty_bitmap_next_dirty_area(BdrvDirtyBitmap *bitmap,
         int64_t start, int64_t end, int64_t max_dirty_count,
         int64_t *dirty_start, int64_t *dirty_count);
+bool bdrv_dirty_bitmap_status(BdrvDirtyBitmap *bitmap, int64_t offset,
+                              int64_t bytes, int64_t *count);
 BdrvDirtyBitmap *bdrv_reclaim_dirty_bitmap_locked(BdrvDirtyBitmap *bitmap,
                                                   Error **errp);
 
diff --git a/include/qemu/hbitmap.h b/include/qemu/hbitmap.h
index 5e71b6d6f7..5bd986aa44 100644
--- a/include/qemu/hbitmap.h
+++ b/include/qemu/hbitmap.h
@@ -340,6 +340,18 @@ bool hbitmap_next_dirty_area(const HBitmap *hb, int64_t start, int64_t end,
                              int64_t max_dirty_count,
                              int64_t *dirty_start, int64_t *dirty_count);
 
+/*
+ * bdrv_dirty_bitmap_status:
+ * @hb: The HBitmap to operate on
+ * @start: The bit to start from
+ * @count: Number of bits to proceed
+ * @pnum: Out-parameter. How many bits has same value starting from @start
+ *
+ * Returns true if bitmap is dirty at @start, false otherwise.
+ */
+bool hbitmap_status(const HBitmap *hb, int64_t start, int64_t count,
+                    int64_t *pnum);
+
 /**
  * hbitmap_iter_next:
  * @hbi: HBitmapIter to operate on.
diff --git a/block/dirty-bitmap.c b/block/dirty-bitmap.c
index 94a0276833..08d56845ad 100644
--- a/block/dirty-bitmap.c
+++ b/block/dirty-bitmap.c
@@ -875,6 +875,12 @@ bool bdrv_dirty_bitmap_next_dirty_area(BdrvDirtyBitmap *bitmap,
                                    dirty_start, dirty_count);
 }
 
+bool bdrv_dirty_bitmap_status(BdrvDirtyBitmap *bitmap, int64_t offset,
+                              int64_t bytes, int64_t *count)
+{
+    return hbitmap_status(bitmap->bitmap, offset, bytes, count);
+}
+
 /**
  * bdrv_merge_dirty_bitmap: merge src into dest.
  * Ensures permissions on bitmaps are reasonable; use for public API.
diff --git a/util/hbitmap.c b/util/hbitmap.c
index 305b894a63..dd0501d9a7 100644
--- a/util/hbitmap.c
+++ b/util/hbitmap.c
@@ -301,6 +301,39 @@ bool hbitmap_next_dirty_area(const HBitmap *hb, int64_t start, int64_t end,
     return true;
 }
 
+bool hbitmap_status(const HBitmap *hb, int64_t start, int64_t count,
+                    int64_t *pnum)
+{
+    int64_t next_dirty, next_zero;
+
+    assert(start >= 0);
+    assert(count > 0);
+    assert(start + count <= hb->orig_size);
+
+    next_dirty = hbitmap_next_dirty(hb, start, count);
+    if (next_dirty == -1) {
+        *pnum = count;
+        return false;
+    }
+
+    if (next_dirty > start) {
+        *pnum = next_dirty - start;
+        return false;
+    }
+
+    assert(next_dirty == start);
+
+    next_zero = hbitmap_next_zero(hb, start, count);
+    if (next_zero == -1) {
+        *pnum = count;
+        return true;
+    }
+
+    assert(next_zero > start);
+    *pnum = next_zero - start;
+    return false;
+}
+
 bool hbitmap_empty(const HBitmap *hb)
 {
     return hb->count == 0;
-- 
2.31.1


