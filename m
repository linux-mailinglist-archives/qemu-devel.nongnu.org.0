Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5035C47E634
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 17:13:56 +0100 (CET)
Received: from localhost ([::1]:41108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0Qj5-0005vP-DU
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 11:13:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n0QXv-0005ka-D7; Thu, 23 Dec 2021 11:02:23 -0500
Received: from mail-eopbgr150124.outbound.protection.outlook.com
 ([40.107.15.124]:2176 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n0QXt-0005Js-Pn; Thu, 23 Dec 2021 11:02:23 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NxAXWqKWjD0tiCdYz6alP1CUiAWh2yFhkACqj/eFg9GWFdXyCDsomdGYi+6F/L7yLyY18Z91axETNb7Td3rpqBMxXeBiOGGe+4FEz4jlgcdvd0LbZehYwdV61BJXK1IjhogZpxOTVTVHrR6Hpq4DikTKZ5og0lSLOD2ZY8uO5EeE39AmBQtPS7s203d5EYE2ZFRMsfCdJHCJjpRPJns4w4MeXjdmLxydt9E9rONAdAltqr8GDrORbWfU1i471FmQ7DeKWgk25vO0ZKdRgASI9tcjA8Nh4DC8qE7De8Dfq0dO8BHpEEir23lMTpT1IQ3Wl0e0dYmAUy3QriyNMoFe7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JZ9duRdLM1iFu9d6jG0ecjmGr53zpdW3ngUMGs3ybAI=;
 b=gYlV+xIvflTWNN05XPzQ8tlPQ3gJUiMCuQgy6qFnYRKf2UsuzRRhi2TIZUUnlqmjN9ne297Ukthf+9+QcaE8Wl7xs4bHRMzrpVcXo0zVzDJSmb4z4haDgoW1OkwQ11BZyVZDDiD7/CxYXEmiDm94EHFLO8bWPnXGVu1WEiFTIpRrLbdFkRUbXQc7HumXBY8rvhC/fU4V8+OdcGK01HGMtcOjnbI07F2Kk+Eg+T28tAA9BnHL4OzsPGA5+dC4u4zr6zJtGbUOqtItpetcDnLxo1LuADxoMm39kyX88pefjqLWMufpXYuZV+nf2rxPhV/AkAVXaIWuYj9/8vLxQQoQHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JZ9duRdLM1iFu9d6jG0ecjmGr53zpdW3ngUMGs3ybAI=;
 b=XAfMqgrVW98csluJYqV0uI6BNwzQ25IpdoTdgrEKS5ubQY7ELrjXNM3qVDKylTvzScd4jPynrGVFdA10Ion+OUlcVses5AlSKp5rFbx8zAKAd5IjGXMJbsmdkmAIIf9GiKNdx0+q20NOgXtCZ3dPGuKlr1PFB+fVaXYl3aWRy1U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM9PR08MB6148.eurprd08.prod.outlook.com (2603:10a6:20b:284::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.18; Thu, 23 Dec
 2021 16:01:59 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112%5]) with mapi id 15.20.4823.019; Thu, 23 Dec 2021
 16:01:59 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, Max Reitz <mreitz@redhat.com>
Subject: [PATCH v5 12/19] qcow2: simple case support for downgrading of qcow2
 images with zstd
Date: Thu, 23 Dec 2021 17:01:37 +0100
Message-Id: <20211223160144.1097696-13-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211223160144.1097696-1-vsementsov@virtuozzo.com>
References: <20211223160144.1097696-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS9PR0301CA0001.eurprd03.prod.outlook.com
 (2603:10a6:20b:468::8) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c4bda449-433e-4f2c-00a9-08d9c62d8d0b
X-MS-TrafficTypeDiagnostic: AM9PR08MB6148:EE_
X-Microsoft-Antispam-PRVS: <AM9PR08MB61481CAB243CAEFF49EF495DC17E9@AM9PR08MB6148.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1247;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fW7KsnSV+XYcDmQty6SE8BiKjkLEIPBwNkkswhSs0aVdQr7eq7m+pPvUqJuOJSkYu38ZnmGf7E0rmaoLtETpDMN4fZRXoy7T6WKKlVU4fZTKP/4C0M1hw3r6SOfupec70kaZ96uO6s4Z50un4kRdp0nE7G8jx/ShvE9oxApSj3tPXsSq5+0khttXkRM7gLsPhNieDaeSzCqIxdS9qrim+MrRnOzKN9Gqz/z0nvrVU55MYukqaiCmpfoSbyGRc4f4QMqxxVM5xcFXt+d/529A1yXS27Y2viLeR16sFrTyvmlLvCmpeVdzmP3G8G77D0zHYt5MjDPVxlICmS0aMNgtNFvvwTVfTPty7zHNbsxJ8yh0wfqkAYvu4Ve34Ify6PzuvlUS2l9bXVckpEIVUB68YieCMxyIbbQ22hU/As9ZEckv0GGNGpjhjNUnsVKxjUMZAK/G8D76pvltBFspMqwYm6xjD7Ez/QJj+Zd7mpO5BH7rwVyXXnaFHH3tyuEmc9R0W465gdfOJPWms0cMI1rQ/Gcl22J0Cfn3sYTw9UaPXGvCJnHiQdTOwtcOmd/1YCaXor4t7nKKPP2KXcwgIyDx2s0cXqKZENBnNhuXNqmb4MNXTxoMOK51ckV3N1hN8QKhvyNS/vpKogXJwz1jsjlbqU57JLq/sxWH/HCa2SPN4mAGc5eFsiJYVpfhrScub9EuFk/7thOeiwnyY3XtXzQA7g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(36756003)(5660300002)(8936002)(508600001)(38100700002)(66946007)(316002)(38350700002)(66476007)(66556008)(1076003)(2906002)(4326008)(6666004)(83380400001)(6506007)(2616005)(6916009)(26005)(6486002)(6512007)(19627235002)(86362001)(8676002)(52116002)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?US07T5/Ha9cRHfEqP7oa3phBLZfCbICUmcs7O0hoWOvPdC8hTQTjxjmhPFDW?=
 =?us-ascii?Q?6PIkoxrC1l0+TDDx3izJkgaAYGF9qZdmQl72zYYsFukf3AZ6rYtPNOD3a0gv?=
 =?us-ascii?Q?GTKaSGoLEVw2WmpOWitGyUQXLLiRjTvusqwTvHCHWbpkBUpSr7machlzvxjR?=
 =?us-ascii?Q?26k2hIM7r2P9NW/hgZVmUXQMSVezKMvoeG8PL2hSGE0BzZQUdc9xsr/ycJQI?=
 =?us-ascii?Q?y8yKAT84Fsr1kuZIr7+O7Ke1UupVvlvvzHOJVDbXV5Yk5kZbfiiGDi1D4U8J?=
 =?us-ascii?Q?jMrkC6LfCts/8KcicPVlrbCHeFkwg93j06GMspc0k3hitJ5ylMVxH4nGYr8Q?=
 =?us-ascii?Q?VNF31Mv4gWSR/i8EIRSet58dPZ8Vx+QQH/y1bxCiD8B10y3TLiIWrW2MduUS?=
 =?us-ascii?Q?JuU1wghgcQXM7K4GAOunzV0tjG0lMWma/aoKmuF+xihZsmkr6QcLq8ioKo75?=
 =?us-ascii?Q?8ygEtwAjkXUKQYy4HEcneSY+NAZpsOmveAw4DlzFne73YzMzK0WZ6OhOX9F9?=
 =?us-ascii?Q?liiybUVnkVYbAcJnN713QGPJ/GSbGpmFJFUfhcOM7XC4z7dIDTTPKFU9JYic?=
 =?us-ascii?Q?pMuyfaz8VSqRUTtzgf2zwdlSENYE1GqL5McK7JFZ5C2u7UaYtBST0aNKy1Ux?=
 =?us-ascii?Q?tOAVJjmHTX0islNgV0+TWiZrBf3Ibs+JhdXyEideo5oUI1w2haWFp5R9Stf6?=
 =?us-ascii?Q?EcgvQQvTUTn/8ur9Lb99QmqJl+UtxPGQ5OyiHFvz6HUm5jQhfTzqaoglc/6W?=
 =?us-ascii?Q?AI8Igl+SHGedD8MeW54A3eGdBMEe8L7vteaNwfGFl46PvlHWfm5OxAxzE9L8?=
 =?us-ascii?Q?J0VXWCGBG6HIn5pe/WnUmfSU79no6EDEXCL7AoPEbMuopNSvIaWdfs5QwSrX?=
 =?us-ascii?Q?7kBm+QT2vVDvLtrtvkzYw67G+ct9xvLwI5KOwDliHGazpzvjF2Ozkzta3YNf?=
 =?us-ascii?Q?vs6xs4CrnqKq/5GhEqzkzvYvSIGiTZRqo7Z+TqfAr7DKP+cSgUs4KTbaWkQI?=
 =?us-ascii?Q?XiDZ8Dk3R0oLqa1gRXyNTCUDq9XteYdxkagZCmtfmRpCJB12iVezF6Z8V0zX?=
 =?us-ascii?Q?kNBWo508FfsVRhNyXKgdFuU6iaZg6Bel7dhhwdfwHruTf8EDOsyFCdImg05b?=
 =?us-ascii?Q?Km5hp5iPSdY4dZpOOH2sGBjGhy9hwXher1qfirFWZtQT3j3HqQur82B9dL7s?=
 =?us-ascii?Q?O+I6Fi/U+MdVv0OnIGtU4ipxe+EQOeyR6pU12aEsbFp7poRM3tEIB6eo2rWP?=
 =?us-ascii?Q?H2MrXz4NoCB/2GBEuHHKsWyWyxr6xhH3D44GF64i3i8943ezF8PkhYbNg7xh?=
 =?us-ascii?Q?ckr1xnUWnH62VrIDvv205MEvc5F1Dnp60ehlQtSgjuy5LIM9nedH5sQOSU11?=
 =?us-ascii?Q?tPysckZwhUvDMqr0qzasVVbvQErXpaTklcXHFTyKmgXM7Esod5WFUHzxaKT3?=
 =?us-ascii?Q?oB3XLct7reGGUXqZQLyFpeN0075OBOQQ0UdqTIEi0DBg/IXZ842HK5XjDX4x?=
 =?us-ascii?Q?nZtqNnK31RNu9hDJS0g5ojmqZZ5KGuEIgGMSUDGQdTBZSSHLmmitL0ODg9fa?=
 =?us-ascii?Q?4pZdk3wKPwXDLThdDf+DAZuPhCLm0P2F8/thkDxQ2S5sxUdu/+L/W6RyfC2k?=
 =?us-ascii?Q?wDyaRYBBKsdC4HDhFB4UtDCY1khbi9Z67SwwlmiM3m7tOOMTDTrSa9Fthgof?=
 =?us-ascii?Q?yXoIeeKPI+ZaMUU1wXIjLABdTQo=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4bda449-433e-4f2c-00a9-08d9c62d8d0b
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2021 16:01:59.3022 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hOEBMi9u+GHLMUpehIBOczboRf8ZVzGtcQc5UlPl5jd4W+K6oT89REQqxmhR7YDW/KSLMF+RITynpizOnH+JYnmlyAUmI0LR5JMCoyyH+yM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6148
Received-SPF: pass client-ip=40.107.15.124;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

If image doesn't have any compressed cluster we can easily switch to
zlib compression, which may allow to downgrade the image.

That's mostly needed to support IMGOPTS='compression_type=zstd' in some
iotests which do qcow2 downgrade.

While being here also fix checkpatch complain against '#' in printf
formatting.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 block/qcow2.c | 58 +++++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 56 insertions(+), 2 deletions(-)

diff --git a/block/qcow2.c b/block/qcow2.c
index d509016756..c8115e1cba 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -5279,6 +5279,38 @@ static int qcow2_load_vmstate(BlockDriverState *bs, QEMUIOVector *qiov,
     return bs->drv->bdrv_co_preadv_part(bs, offset, qiov->size, qiov, 0, 0);
 }
 
+static int qcow2_has_compressed_clusters(BlockDriverState *bs)
+{
+    int64_t offset = 0;
+    int64_t bytes = bdrv_getlength(bs);
+
+    if (bytes < 0) {
+        return bytes;
+    }
+
+    while (bytes != 0) {
+        int ret;
+        QCow2SubclusterType type;
+        unsigned int cur_bytes = MIN(INT_MAX, bytes);
+        uint64_t host_offset;
+
+        ret = qcow2_get_host_offset(bs, offset, &cur_bytes, &host_offset,
+                                    &type);
+        if (ret < 0) {
+            return ret;
+        }
+
+        if (type == QCOW2_SUBCLUSTER_COMPRESSED) {
+            return 1;
+        }
+
+        offset += cur_bytes;
+        bytes -= cur_bytes;
+    }
+
+    return 0;
+}
+
 /*
  * Downgrades an image's version. To achieve this, any incompatible features
  * have to be removed.
@@ -5336,9 +5368,10 @@ static int qcow2_downgrade(BlockDriverState *bs, int target_version,
      * the first place; if that happens nonetheless, returning -ENOTSUP is the
      * best thing to do anyway */
 
-    if (s->incompatible_features) {
+    if (s->incompatible_features & ~QCOW2_INCOMPAT_COMPRESSION) {
         error_setg(errp, "Cannot downgrade an image with incompatible features "
-                   "%#" PRIx64 " set", s->incompatible_features);
+                   "0x%" PRIx64 " set",
+                   s->incompatible_features & ~QCOW2_INCOMPAT_COMPRESSION);
         return -ENOTSUP;
     }
 
@@ -5356,6 +5389,27 @@ static int qcow2_downgrade(BlockDriverState *bs, int target_version,
         return ret;
     }
 
+    if (s->incompatible_features & QCOW2_INCOMPAT_COMPRESSION) {
+        ret = qcow2_has_compressed_clusters(bs);
+        if (ret < 0) {
+            error_setg(errp, "Failed to check block status");
+            return -EINVAL;
+        }
+        if (ret) {
+            error_setg(errp, "Cannot downgrade an image with zstd compression "
+                       "type and existing compressed clusters");
+            return -ENOTSUP;
+        }
+        /*
+         * No compressed clusters for now, so just chose default zlib
+         * compression.
+         */
+        s->incompatible_features &= ~QCOW2_INCOMPAT_COMPRESSION;
+        s->compression_type = QCOW2_COMPRESSION_TYPE_ZLIB;
+    }
+
+    assert(s->incompatible_features == 0);
+
     s->qcow_version = target_version;
     ret = qcow2_update_header(bs);
     if (ret < 0) {
-- 
2.31.1


