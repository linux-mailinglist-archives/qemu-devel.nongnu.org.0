Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5401F38E8B6
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 16:27:29 +0200 (CEST)
Received: from localhost ([::1]:38164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llBYG-0003Ox-AQ
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 10:27:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1llBS6-000716-IT; Mon, 24 May 2021 10:21:06 -0400
Received: from mail-eopbgr70122.outbound.protection.outlook.com
 ([40.107.7.122]:51129 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1llBS4-0006l3-J7; Mon, 24 May 2021 10:21:06 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lyxPk77bfDRy8DZXtTn4E06NdhtrF4Nkk2qWDIq0KAqvsr/nk+zYZWS9ZPB+sGMq2saZ/6UMnySA/+XJ1tAVrK80VRzuw/DjbL3QhuNS2seSUjMUxoof5n24qkZ2fWJJZxhTJKFJUVrjgeDQQKdX2GY5e77KWYbAJLGifct20HiAB4PXkQMUdyvs69mP9j7f2S3NJQ1yVdpP8bmBw/FipkjzdKmbFgcq7ypUdoc3ADdhE7smZTrRwfe6UBb/Fap/l0TN/90cs8DMlwkVmVNBoOplbIF5X2kmfRpMuFE4if/q3VzIylqmW223NaajKgeKdWJLjTagTb/FjiyVzUs+nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8uIOxITwxhggvesR9LxaQVjj5hrQdYiD4V7SN/sbqXA=;
 b=N6rrYH3lr+M+L5GIHXkDgWgxU+bkYxXQPKVG7TV1Z1eTenKsCg2omuH+yafua3wJHbJRDx/JouybUQuJWWQlVHc/gKifSEGuXWvwmGRTcskSME94vj8AJ5NI8A8T2hw0rgYzxfzSy8YBTAapuXusyCnbBzjVK1d+g8ML6OZctEVTmH1nXEylFEnv4mrW1Uee0eTTzlYC93EjDxHwrRlF6LDn4vqNvm4cXMy87J57bo0UmtnFRCdOZaicZbAXtywfcRYpnklUo0RO6Uwws8K0fpqHz82P21jlrGELQhd6mFADQLzT7DfofPshh0V601Jknv2E+IJvvdALIdrsNDhHng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8uIOxITwxhggvesR9LxaQVjj5hrQdYiD4V7SN/sbqXA=;
 b=YA0mh6xdAKU3Ip2AUipsOlbvESPSiw1poJR6/KI2QqdroZ7UIFnCdtHZ4enAUlEbEY5g0flgUaOp0Dgr5sR3hha2NxyD69kTF9TC0MZo8y2SzPFyWCu5ZYMt5sfXqW3iW5It7wYJeKjD3SuwnWGNKXV7DmIa0nvwVGs3nmq+/Qs=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4165.eurprd08.prod.outlook.com (2603:10a6:20b:a2::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.27; Mon, 24 May
 2021 14:20:52 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%8]) with mapi id 15.20.4150.027; Mon, 24 May 2021
 14:20:52 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com, den@openvz.org,
 vsementsov@virtuozzo.com, ktkhai@virtuozzo.com, eblake@redhat.com,
 berto@igalia.com
Subject: [PATCH v3 06/10] qcow2-refcount: check_refcounts_l2(): check l2_bitmap
Date: Mon, 24 May 2021 17:20:27 +0300
Message-Id: <20210524142031.142109-7-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210524142031.142109-1-vsementsov@virtuozzo.com>
References: <20210524142031.142109-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.195]
X-ClientProxiedBy: HE1PR09CA0063.eurprd09.prod.outlook.com
 (2603:10a6:7:3c::31) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.195) by
 HE1PR09CA0063.eurprd09.prod.outlook.com (2603:10a6:7:3c::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.23 via Frontend Transport; Mon, 24 May 2021 14:20:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d1d544c2-560d-44d3-a76c-08d91ebf22d1
X-MS-TrafficTypeDiagnostic: AM6PR08MB4165:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4165308AE89668FC9EE9A2F4C1269@AM6PR08MB4165.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:389;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +IyoQBUlPPx4mjRF7gesO3+ICH7FiDo6ywgUmfcCYgO1jCRcpRS+qRcpOsFbyXXmQbpizwePsjHK51s1VcACNGG5Lqyf8C/PwpgJ6+TBZQFN9/8dPdR31ZOaujv2IWwGUeggWoZqgcmykFk3rpMeYAPSa92QhOcUL7v1sozBv6GadLxnPHWiUcbuh6uH71snae0+7fRSnvLKb3o7mN8MxLMPNJ+6+PwmH5SYwISqgjMCqdvKdKV9/Tr6ISg7DYTAhf1CTcCpBOebrjmq2OjdBLmOas10ScXrci9783uaiDzxeud9AV4MQb04Y5KNb2hLelL6PNe8eRuk5Bro695ubFEIDR38lg7Wa1MvHk4GW0JaLi9auBxULZcTH3oyXGrm8686KnPDgr/SD+8Xla69ZZinM/kR2odGN0jrRQwRcuAb0iaX2d01vf28Ff2vE5gf8o2lAMzRxRK0vaekvC/tDD6cVASGg4XsaWvFfvtyniaY1nCnqOhCJHVopWI+Jwmgtcbn0oQg5Trk5j5njfqMpOh/cQftuK2KszPLzhW0qJGM2dK49jI2hGDduwe6ayvlqU/jl2r9mNuGFurkyFUpLpofYdE4RqMaXusHk4aW32t2gvoZSr0GyXObLhby6AOK0md173WQsiMVrrD/QDG3vDXn7vhfeCS5WeUViz/bSbY2pPsQWPpE97I5UJoGbAo2
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(346002)(39840400004)(366004)(396003)(6486002)(52116002)(186003)(36756003)(478600001)(2616005)(956004)(26005)(8936002)(316002)(83380400001)(2906002)(6512007)(16526019)(8676002)(6916009)(66556008)(66476007)(4326008)(66946007)(38100700002)(38350700002)(5660300002)(86362001)(1076003)(6666004)(6506007)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?1lMT4iQxsgbF4yKqKS8BRJ1z8BqcsuGr9yIXKYfGK4PSSm83VjtXeooTAbf5?=
 =?us-ascii?Q?MlDfWujtzWs5Evu2EHMQvq421nx22Sjd38juyxtLZvyLZJCBJ3vgGkShptl8?=
 =?us-ascii?Q?EpQPrpcJjbhgfZufEML1oupt+c6Ynk3kcl65rT/quh4/G4JXywf8xvY4e+Md?=
 =?us-ascii?Q?TO+Ja47SeHxgRfEVKi2YYml52iLR+pNjxRwz9HzYI7ZiMrHVUOxQZfrbPwgI?=
 =?us-ascii?Q?VOrOh2qASmmPVM9BQzi33L1oiYmDXOvWlIfTXrQI9KIO8FBc8pRa8txG5ase?=
 =?us-ascii?Q?yyRGUO4LOav2tAOp+qz63qPXKiodpZABgF92rdTIj5QF6AzrcAAIxIdJ1u41?=
 =?us-ascii?Q?fMADr5tSltxhQpxnwK3tvztSamd8xIh0oTkQ1Nl4IarIgLChKCUTX5kLvygf?=
 =?us-ascii?Q?IWnSx2+z1Dgd1jr/n+D9gOEr8yQDYmaPTa2outIrBM4FlH3sUCsZEbEgfhbB?=
 =?us-ascii?Q?qIrAluDw/M/UOONQashbX78SsG3X7EvBMM0GXWhYhKpy8Hm+2zOOn1fgahTF?=
 =?us-ascii?Q?gdXRYAneDABNlyhpq1rJ0pCmD5QPoO91/iqC1NBmFOD6vnjujxHLPHvj7Tuq?=
 =?us-ascii?Q?EUZ6nQy3dxFmjjRp21iF0vjz+pS8hJcFjOt/c7aW6VCsI8yeKPRwDne/urGh?=
 =?us-ascii?Q?+TY17APFKv8Q5TXudrES/vpabFcZouV3v45cZtGAzKSmNEcdCJUKPBTQBWNq?=
 =?us-ascii?Q?+T5/vC7gnULUTTrN5++8cn4BipVBnNdHHRQQRe7u8ywEYVY+pwppMW5kFPTP?=
 =?us-ascii?Q?wDqW4gyDEUBa7aQt3ytVB9FU6avluRAy80XqqLRDJlBkpIXxtBcLg/LIDVu6?=
 =?us-ascii?Q?Pg0tREpOzyfvcMtXXzYWb+cdzO0Uu4Joa7MrC9/Cn8WiYM8p+pT9NwjdMS3d?=
 =?us-ascii?Q?GBAMhbnYOKreayVWQwhsTw/YhvQywsJb610u5oLkRo3BiTHpYddOk1g2A7qf?=
 =?us-ascii?Q?6xKl+Y07zK9lTbVC642PEn/U4CyOYZiUJQL+LXL9nO3qgNF6oYGTFjKhyofD?=
 =?us-ascii?Q?8xW5QGTaPrbS/TtGX3rZetyN8xWvMzQNuYAoNTnBSTBb769Giyvh/jdbnp6D?=
 =?us-ascii?Q?7vtrZioTF6g2BDfqoBH0F8aarxrR+HvoW0rm94sYqAskf3WRbhK8SZ1CMIUL?=
 =?us-ascii?Q?kY9OyGPKDsOyOA13Bo9Q3kIbn79ppsHLStOYGmSZKtBPr3jjYUS9Htc8HX/Y?=
 =?us-ascii?Q?+PlpShNLeilkKTcEEi7N1JxWKlu9h4BZZLkTKaYcPDbXGvWEbpulH46HUBzz?=
 =?us-ascii?Q?COlTEXV8f23r0PE0F6U4Dz6dGd/nkGsrOHMfY294GQsN7rexCHe4zt9Wl0Zk?=
 =?us-ascii?Q?Exas3fHpMSUTPq2QQxXaCw2G?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1d544c2-560d-44d3-a76c-08d91ebf22d1
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2021 14:20:52.2562 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7Em56agp5msWd4tmMyVrzIbSj/AvYjwE+GgijjYpnlHsfnW9CXRY5IelO9/7A1631nMFlDd/Ehu5J7yLFuRHKwkTiL+i2fJtvzBdneLuWHw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4165
Received-SPF: pass client-ip=40.107.7.122;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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

Check subcluster bitmap of the l2 entry for different types of
clusters:

 - for compressed it must be zero
 - for allocated check consistency of two parts of the bitmap
 - for unallocated all subclusters should be unallocated
   (or zero-plain)

For unallocated clusters we can safely fix the entry by making it
zero-plain.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Tested-by: Kirill Tkhai <ktkhai@virtuozzo.com>
---
 block/qcow2-refcount.c | 30 +++++++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
index f48c5e1b5d..062ec48a15 100644
--- a/block/qcow2-refcount.c
+++ b/block/qcow2-refcount.c
@@ -1681,6 +1681,7 @@ static int check_refcounts_l2(BlockDriverState *bs, BdrvCheckResult *res,
         uint64_t coffset;
         int csize;
         l2_entry = get_l2_entry(s, l2_table, i);
+        uint64_t l2_bitmap = get_l2_bitmap(s, l2_table, i);
 
         switch (qcow2_get_cluster_type(bs, l2_entry)) {
         case QCOW2_CLUSTER_COMPRESSED:
@@ -1700,6 +1701,14 @@ static int check_refcounts_l2(BlockDriverState *bs, BdrvCheckResult *res,
                 break;
             }
 
+            if (l2_bitmap) {
+                fprintf(stderr, "ERROR compressed cluster %d with non-zero "
+                        "subcluster allocation bitmap, entry=0x%" PRIx64 "\n",
+                        i, l2_entry);
+                res->corruptions++;
+                break;
+            }
+
             /* Mark cluster as used */
             qcow2_parse_compressed_l2_entry(bs, l2_entry, &coffset, &csize);
             ret = qcow2_inc_refcounts_imrt(
@@ -1727,13 +1736,19 @@ static int check_refcounts_l2(BlockDriverState *bs, BdrvCheckResult *res,
         {
             uint64_t offset = l2_entry & L2E_OFFSET_MASK;
 
+            if ((l2_bitmap >> 32) & l2_bitmap) {
+                res->corruptions++;
+                fprintf(stderr, "ERROR offset=%" PRIx64 ": Allocated "
+                        "cluster has corrupted subcluster allocation bitmap\n",
+                        offset);
+            }
+
             /* Correct offsets are cluster aligned */
             if (offset_into_cluster(s, offset)) {
                 bool contains_data;
                 res->corruptions++;
 
                 if (has_subclusters(s)) {
-                    uint64_t l2_bitmap = get_l2_bitmap(s, l2_table, i);
                     contains_data = (l2_bitmap & QCOW_L2_BITMAP_ALL_ALLOC);
                 } else {
                     contains_data = !(l2_entry & QCOW_OFLAG_ZERO);
@@ -1800,6 +1815,19 @@ static int check_refcounts_l2(BlockDriverState *bs, BdrvCheckResult *res,
 
         case QCOW2_CLUSTER_ZERO_PLAIN:
         case QCOW2_CLUSTER_UNALLOCATED:
+            if (l2_bitmap & QCOW_L2_BITMAP_ALL_ALLOC) {
+                res->corruptions++;
+                fprintf(stderr, "%s: Unallocated "
+                        "cluster has non-zero subcluster allocation map\n",
+                        fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR");
+                if (fix & BDRV_FIX_ERRORS) {
+                    ret = fix_l2_entry_by_zero(bs, res, l2_offset, l2_table, i,
+                                               active, &metadata_overlap);
+                    if (metadata_overlap) {
+                        return ret;
+                    }
+                }
+            }
             break;
 
         default:
-- 
2.29.2


