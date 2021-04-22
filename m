Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A58D3368520
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 18:46:13 +0200 (CEST)
Received: from localhost ([::1]:59400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZcSy-0003ef-FJ
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 12:46:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lZcEb-0007QM-R8; Thu, 22 Apr 2021 12:31:22 -0400
Received: from mail-eopbgr40129.outbound.protection.outlook.com
 ([40.107.4.129]:3204 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lZcEW-0003yB-Du; Thu, 22 Apr 2021 12:31:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cwKu9go6LbS6K/B6g0KwHZwnuUg8nLQpmxjJiIboDKL9OZtmh96kvGASMh16n3Gs40mf4Mzenty6LaUF+TbaxRtv+Zg0LVi5HmlJR4PMClEP71zr5VFMHvWu6a7KfyXgHZUQpYcuLOy7icWoC6QbcxHEdJWs36wWkHVAPOXCAaj8ok7ywfAVU9dINW5sMxf5CiWf+ynqNKSkbDwNvjCq1Ql6jbQW7NQ63cKJOr2B25LdQGrWXcTnGIt/0wbMGukGyoTY5r3Q6p2PzuSUYiYgCwQWLMBEDwVUlig0OJCbc8lomxvV/tniKtP+KimcEqiRCTbITl3KU6KWZAZ6UK3KmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IytXGJ9WJOemtPQ9ezqfHE1QEDITcp6UTkqeQQ1MR5E=;
 b=N0f6aWJWDDs+KVR5OnSrrYcvDpndOxdB+fPDdKsSo/X8xhJvZRuG/5MJDoRXjztBFol/oc22AP0lx51fCpL3cuaXZYxQ5L0JOmufHXM2hDUbxrwAn4EjYIcsHSreDVe98rYlRa+MFtg74p2r3WQBloQu5YsAlZynZsFOPZ6mV9ofPGZeZoeCjsMakRqkXJyLDKoAe1XXVpW+mAuDpEkB36ij4FEnAz+avM1Mwlg/dDeRHljG96YeHlXisqLCL+vgVDMz9c9eiiXi58rL4WW525KVeKX2Ci2k+YtrhCqRcspQK1GttqBzLjXL91xdboypoYOQZL3f8RsKKgnT/cThaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IytXGJ9WJOemtPQ9ezqfHE1QEDITcp6UTkqeQQ1MR5E=;
 b=DlN63HwKiymjgp2vPaI/CZmF5wUIKypg98ZnpviqrGyo9RHgLavYKxyFt5RK04stlMswr4YkZPFVr68MDbBEd95LiBB5jQ5/WRbyMq5vPuzpFYwTFLP05nN3DpagzRwzchXCC89b1ifMOJd+PwsgYWyjftSe0GmIqii69hk5Yd4=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3861.eurprd08.prod.outlook.com (2603:10a6:20b:80::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Thu, 22 Apr
 2021 16:31:07 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4065.021; Thu, 22 Apr 2021
 16:31:07 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, den@openvz.org
Subject: [PATCH v6 06/12] block/qcow2: refactor qcow2_co_preadv_task() to have
 one return
Date: Thu, 22 Apr 2021 19:30:40 +0300
Message-Id: <20210422163046.442932-7-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210422163046.442932-1-vsementsov@virtuozzo.com>
References: <20210422163046.442932-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.222]
X-ClientProxiedBy: HE1PR0501CA0006.eurprd05.prod.outlook.com
 (2603:10a6:3:1a::16) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.222) by
 HE1PR0501CA0006.eurprd05.prod.outlook.com (2603:10a6:3:1a::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.16 via Frontend Transport; Thu, 22 Apr 2021 16:31:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7080c447-16f2-4138-fdc5-08d905ac07b6
X-MS-TrafficTypeDiagnostic: AM6PR08MB3861:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB386124C18D1D1C79C7D18583C1469@AM6PR08MB3861.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:376;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WRjCT2YvcND38aY2DcYLhHEW17eACFeJIu0Uif0X0dnHz87OcI7+iAfnFpBagu+P7Gi6AzIdD2it2pJSAMSZnWioPbntWKGSttm7wxKcNQt7QnZSu6bWs4V43oSwMTa7dcrgreyDvfh0ptYbk45eXathtYfQYKDPKxVHD1Euin9JuzHfsCRXstekpt7JkZBR0uzaAt9kLAAnlDSHsHsh6Pguqm4B0pnJe0xqyjS+yJGeDj+ks9auGXA9mJl8GsHftxnbVhUH5w7GRQy8UrVDKIg2sN2ROOcnXy86HMHl73GQHnEs/hvKekEJjBhwhxCTYlyQcKmI3E8/RzGQW61AXa0OD7ddgl0yUpeg/Kh2Sy8MPQseq2XIW23glPLCKiZFs12fHS/An528av6a8zV7NjfscRHdlWi2IR96J0tKwaEl1sCxS3YJUe0hHKs+yyFcvyyI36lMdZdiVSygqY832VF8EolD3jAmHEKvkkpdw11iHiCTi/hZQnzV+qkDW+RT5R4Vg0AaAylRj6EmwFhHzfd7HoSZEacYeqK2oNkQ3DgFYenqpK2j7EFvLPmZ+pIZWGLKQ+OQXDSWDPKBtX7chCWGhfpsdjFhzigVzT6cR9OHATwykOVpAyaDYQzuzyNnQnnDXpNHMgnzWuVeb0Mm1lxOb6dE0pNHAjVWDnSjKazRPTfK10uH7FUb5oybdTmc
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(136003)(366004)(39840400004)(396003)(6666004)(4326008)(107886003)(26005)(6486002)(956004)(2906002)(83380400001)(2616005)(52116002)(316002)(478600001)(8936002)(66476007)(6916009)(66556008)(66946007)(38100700002)(1076003)(38350700002)(5660300002)(6506007)(8676002)(186003)(6512007)(16526019)(36756003)(86362001)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?kzM3NnwCBNoDhBlVvQ7NL2GjH8MYypt0dtvty+qbposlWn7wLHKFftD9Nrpb?=
 =?us-ascii?Q?9Rof9xFJgT8AN12OGTVdkr0jm0PkBO9JsiOHgV0Vq82YJxai+mwCrKciEpcc?=
 =?us-ascii?Q?XL/qxWhKybq78jOpwlfl8WavdnppYuUAEVsWhXnwdhhpSsmizd6tRzjlcK2w?=
 =?us-ascii?Q?W5Tzk1a8H3ZBFnwqRZhOScy4f+5kOZFpGeIzRtcTtllfK6LZKA4H9Vv5bdMB?=
 =?us-ascii?Q?Vpg1vIJgOSqUw2Ug9KMJTCf/R130xAqLoibmZmKudx0NtKXeoNTbSQ9i/WG2?=
 =?us-ascii?Q?NH5C/uC6huVfDkz6OSfKYdzs0X6l+V1w/w1jpg4T/tWA9MckRYvZDBBuZe84?=
 =?us-ascii?Q?XNlnMIC62GWAlLF+zbLWIYYb14P5RwrF9U9LxBmIqMb0X9KU6gEXWZMw3qkD?=
 =?us-ascii?Q?p6mQVV7SRI9+9MO84SaBynxtEyuKhH88Dfp4v3BmQ/7t+PKh1fpWDwzjUCmr?=
 =?us-ascii?Q?hxrdQ3VRPGcsWbdWMuVBOjdnZFu0sjXa0iJHmfFySYZhyuH9+RXRLP183o53?=
 =?us-ascii?Q?jQFO2k3X4lxQOq4ElAno9Jj8m4i006cunCgNymMrKduqSCaoXq4KENjelpHc?=
 =?us-ascii?Q?bmYvgBHerRyk2XRKffm/MhNq6pjijSDB6k+1XftsbuMlDTdSfy87qV/ZjkTn?=
 =?us-ascii?Q?ejV5dC5znwhKQQLNhGDmvQGBJRQ1Y4RwLcWjiQq4cMVwG7oa4Jj8YaGTVCMW?=
 =?us-ascii?Q?Y1G0VaKe/xDp0xjGS1Lm7SUmxVYWm3f/ln9Qw3W9CIx5dzAYR3uynRBdutgn?=
 =?us-ascii?Q?WVTFvFU08kPQ+0NmddZ3rrzXKYvJIRhkPIUlvOi5mAbOHMMlaHmUDEAgG4LH?=
 =?us-ascii?Q?wsniBdLryfAl3nDio21KZ+c5RkOI2wCqU/C1+mC6O+5OySh2gaDXpcIaiipp?=
 =?us-ascii?Q?JDNrEFdnicWnlpkau+F9dJdNZFegh3TMu4qqhU8NbSCsD9YqceyrkcupN3gK?=
 =?us-ascii?Q?xKDFSzUzlN8DAu7gqJJZWZZGPj2tJEz+5vlKIBgcaCP6AjA7tnZcXnB0tumj?=
 =?us-ascii?Q?dUPnh9HTrQYU+zpoIm5au5Tbdxn1t8rz/Y22Tfr01q19SEZJRDJfG4A/yR7w?=
 =?us-ascii?Q?RGixcaiJnCUm1P6K2Djcspss90ie/Wh345/nYAYEN6WBAh+yBg0reqUIJlkp?=
 =?us-ascii?Q?uXbSHYSFm//8ooYgJ3L1L2EPpMurx41jOwBzOoWwk94u0/1kNUoG1uQ7lDvk?=
 =?us-ascii?Q?FazXFzd4jRgOfvy9/cM7ZNmCQYFfLv8u3u6TjgLJ1GLKgbSiKAD35hwh+KJ1?=
 =?us-ascii?Q?LExd3CnCJUey0Lyo1mlAq1ORCXTuwoyKum2poJjBHvF3v5+5d6y9uel7wXQP?=
 =?us-ascii?Q?wIsuhTkKHbVuEsd+UZgv3LZu?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7080c447-16f2-4138-fdc5-08d905ac07b6
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2021 16:31:07.2966 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T5xo2uI0Av5KPBfVvom+SPpUbCCbx8wy/7PYdJrtDVoNnjcvEENF/qGGcR4L4R778ltVSmcbAftTZ9D8m7axYT5dFXJHBlcZL85dLOMsARM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3861
Received-SPF: pass client-ip=40.107.4.129;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-DB5-obe.outbound.protection.outlook.com
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

We are going to add an action before return for this function. Refactor
function now to make further patch simpler.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/qcow2.c | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/block/qcow2.c b/block/qcow2.c
index 7049f7fc3e..066d44e2be 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -2234,6 +2234,7 @@ static coroutine_fn int qcow2_co_preadv_task(BlockDriverState *bs,
                                              size_t qiov_offset)
 {
     BDRVQcow2State *s = bs->opaque;
+    int ret;
 
     switch (subc_type) {
     case QCOW2_SUBCLUSTER_ZERO_PLAIN:
@@ -2246,28 +2247,31 @@ static coroutine_fn int qcow2_co_preadv_task(BlockDriverState *bs,
         assert(bs->backing); /* otherwise handled in qcow2_co_preadv_part */
 
         BLKDBG_EVENT(bs->file, BLKDBG_READ_BACKING_AIO);
-        return bdrv_co_preadv_part(bs->backing, offset, bytes,
-                                   qiov, qiov_offset, 0);
+        ret = bdrv_co_preadv_part(bs->backing, offset, bytes,
+                                  qiov, qiov_offset, 0);
+        break;
 
     case QCOW2_SUBCLUSTER_COMPRESSED:
-        return qcow2_co_preadv_compressed(bs, host_offset,
-                                          offset, bytes, qiov, qiov_offset);
+        ret = qcow2_co_preadv_compressed(bs, host_offset,
+                                         offset, bytes, qiov, qiov_offset);
+        break;
 
     case QCOW2_SUBCLUSTER_NORMAL:
         if (bs->encrypted) {
-            return qcow2_co_preadv_encrypted(bs, host_offset,
-                                             offset, bytes, qiov, qiov_offset);
+            ret = qcow2_co_preadv_encrypted(bs, host_offset,
+                                            offset, bytes, qiov, qiov_offset);
+        } else {
+            BLKDBG_EVENT(bs->file, BLKDBG_READ_AIO);
+            ret = bdrv_co_preadv_part(s->data_file, host_offset,
+                                      bytes, qiov, qiov_offset, 0);
         }
-
-        BLKDBG_EVENT(bs->file, BLKDBG_READ_AIO);
-        return bdrv_co_preadv_part(s->data_file, host_offset,
-                                   bytes, qiov, qiov_offset, 0);
+        break;
 
     default:
         g_assert_not_reached();
     }
 
-    g_assert_not_reached();
+    return ret;
 }
 
 static coroutine_fn int qcow2_co_preadv_task_entry(AioTask *task)
-- 
2.29.2


