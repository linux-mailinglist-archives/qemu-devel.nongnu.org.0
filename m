Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF76B38E8B1
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 16:25:14 +0200 (CEST)
Received: from localhost ([::1]:56910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llBW5-0005HM-Gt
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 10:25:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1llBSA-0007IH-Lt; Mon, 24 May 2021 10:21:10 -0400
Received: from mail-eopbgr50103.outbound.protection.outlook.com
 ([40.107.5.103]:9605 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1llBS8-0006u5-RT; Mon, 24 May 2021 10:21:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L9Muge5O2wm2g3t0AgfAsc7jmOcvboxnAPPbq47OEHihD+QlTcrMJfkchYI4QOxIsy28ssNXJXwhUFUB+j8xCEoUAJ6zT2h8ccsCgc12eUsLrPhjhdj+gv0kb3AXG8lLL3ry6JyRflN2+32wV/owjYIRdTkypSRxrlnDVNbO1WfqltD8OMmyqboLnK/pORSgVINsbuNwClFPie1jjSF8etzDm1cSp7Dwb+OY596lVzmlQ5w0Ns2dV77F3N6/Co4KIbzJKaqFnuhKUydDQ82VTyGAWaZG/+h0WzJaeUVTjMGDCTVo/sYDlwjbTrO2LP1siec24nUwcljY90gpnaH/EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fb/JbJfFGdqroR2KDGRC0fscvDrKAKAnElwBfhdl57Y=;
 b=hK8NycbzuraOWprsVbA+fPkQbjZ0Lirr6G5G/LUaDpjDuALun85+6OlQqeqrh3JfChiDGSQ5LzKUZ96VipJ0vlFQhQMFcr1X+kBrLqUnOkrC69wvcSxkUjNT3uNbHfri9VQVa1U0eEBXAWSfx1sHdOSdp9pfHjbjNNCeebY5ScwUDyQxNqVoCMMtF2FE/RC/GHgkb7Nhq0gw/PwqJyduWoY66ZrlrEuXK1xR5o3xGDlQHOMcyl5ZMxsbvSTi9ixVASj0GgHgFVc0vCRIO+OTVPdYGwwgAd39ylViuUzLFbvtWBVrX803vfq41A0RhplJpE2GnAVLC8CgC6LT2fichA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fb/JbJfFGdqroR2KDGRC0fscvDrKAKAnElwBfhdl57Y=;
 b=EaoIRk752JIqITXMz3G5nsby3WOwveEqN4B8OO79Yglx4XU0WnYIZEouIgO10vX+1LSll6Gy2rrYZf9okGcZ49R+TuSLzi55WRZ0Qtkb26zXppqQdNK89bIFXQ6ufKllenPAwZIjsDgbtrj5KcVtaioU8kPIdZEEtclaWnDMKxM=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4165.eurprd08.prod.outlook.com (2603:10a6:20b:a2::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.27; Mon, 24 May
 2021 14:20:55 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%8]) with mapi id 15.20.4150.027; Mon, 24 May 2021
 14:20:55 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com, den@openvz.org,
 vsementsov@virtuozzo.com, ktkhai@virtuozzo.com, eblake@redhat.com,
 berto@igalia.com
Subject: [PATCH v3 09/10] qcow2-refcount: check_refcounts_l1(): check reserved
 bits
Date: Mon, 24 May 2021 17:20:30 +0300
Message-Id: <20210524142031.142109-10-vsementsov@virtuozzo.com>
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
 15.20.4150.23 via Frontend Transport; Mon, 24 May 2021 14:20:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 55e62b1b-a387-40db-c513-08d91ebf24e4
X-MS-TrafficTypeDiagnostic: AM6PR08MB4165:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4165F4945B41E2C2A31FAD3BC1269@AM6PR08MB4165.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:257;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5BZrImfXHpoVLuihpRYnIbM4ERII7lxhNvsc6CS19WRbcuoKCoW/wGpQPK7fII1O8y3t8ITawupibc3RKsa9xo3YBGXOTmXSLqrqvOg2SVwt842gxcoNDftbip+lg/pzluUvXmMv8Go7QRBZYWONdARKtn8UmZhmQoIIsENv3CDdvu4ov8hVospAyo5Lw41up50105xFPtlRiiKWVBxIg7vwdILKc/g9Al4T5ZR/PoCMa2clY4HN4VXdy05YGGVvyay1/U6uStYlVfiEW6rEe2i+NUvSX8ws4AnKZBIAaWGPHKwRdKwOLyYbitThknJABerf+J7ibwvfZpSZSpU6chXxMVWQe9eN9SGY13lXyVAA9vIi61Hf3LuuU5yP5xcStauO7ITGlVytgn77oZ2W/dM9s2Sxw6Le1enDJpD0rRSjHjbXpVSOcsjyaGCqxXJE2SdZiR5opZp8aY4IoRvrWA/16LUzRc2xPNaa+7pFEenTzJjCpxUgSzjrXRl2SBo5oJCRRqO10BdGsJf6NnKrFlQiXqZ68FwYEbTQFWsebY8zCFFbLZqEtgNm5ll9Gr5cL/48B65a5/K6RJzQ2E5BnTVMrtEtSYPzfvMeVm2aO4FtKUrs3We98R0lTEwwZaMPK8Hm/0WPU5gC4k33lyt+aBT8CokyqRLh/Y/G7bZvSq5WJmlKj5BHu5WdglV58bKu
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(346002)(39840400004)(366004)(396003)(6486002)(52116002)(186003)(36756003)(478600001)(2616005)(956004)(26005)(8936002)(316002)(83380400001)(2906002)(6512007)(16526019)(8676002)(6916009)(66556008)(66476007)(19627235002)(4326008)(66946007)(38100700002)(38350700002)(5660300002)(86362001)(1076003)(6666004)(6506007)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?RQhuQAjYBuQSwxPOyiEmwjY4e10xoxRbC0vW7WAZj0wuK74jHn7h1PeAuw7h?=
 =?us-ascii?Q?/EQq9muBoUcj9JNMiLAEZG1t8tbLkLBzDpukj92ezILNNNgd/CVd1ecDAu5a?=
 =?us-ascii?Q?qfh1S2gkEdePO7Ls5Z3lDOtgwClfjrwzoFDcQh7EZXALpQUW+lnIUjvcJngU?=
 =?us-ascii?Q?R7KyGtia7bxUedkI82VSC/BJnGJ8yTSRRLv4loa84qDFdjKfNR50R18oC0U3?=
 =?us-ascii?Q?iNwmHtrkVc2qMq6a5OQUuC9bLw3GsQEdLcnYcTta0qFQQV8m0XFbCawaLHM0?=
 =?us-ascii?Q?tcP9hdd3f3TLbqs9WEp2mTuASG9vLHEfryqKgEm2rSoGnDorUQswKHGaJIlM?=
 =?us-ascii?Q?yPidzLC7mCTEbvTZCa9YlmClvZJswo5wi0BJpG/sI93M3aad/LLwwbgRVpo5?=
 =?us-ascii?Q?kjG/8nMw6h7+jc5zYammPFFPV5fzfguvIhstUH8ex070pHbBl4K239wheFhW?=
 =?us-ascii?Q?klhe1swiFqHq7xqic3CfOBfORyPL4JRk8BZ7+xaLt+vRK848F/FPpQ5O6OAv?=
 =?us-ascii?Q?aV5vBT6ghdlixIH0b0MBOcukMcm59IBhzUrNXCDpVYXYrNQXRSGqSVzL8Tdl?=
 =?us-ascii?Q?yA5miB4vTlx+NmxqxjfiEkz3/Ed1YZU5pwb6ITQ6ZYyJc1vGCwOME3jpSxkx?=
 =?us-ascii?Q?qjtb5easDDMPy7qo/YBw5MWUypgKUAY4VJsSO21xVTQf7fqtHO/W/L0PQ/hj?=
 =?us-ascii?Q?t0Oj+kNc1BL31D8spEECuzSVwJP9aoTTnbkO856HQWyhnmKIh7qgbElLt2Bd?=
 =?us-ascii?Q?0+2vZkNxMRVVKbZM0SbEDuhrBUwF/YViHjYLQh+2tyUrl9PYuCV4+r7vK1pz?=
 =?us-ascii?Q?0pkinfeMel04Uov1WbEw7f13s5tttwIywv/okcDCf/OsoheYEQFIQajNLfab?=
 =?us-ascii?Q?q4jp92QfxJcQWZF3ZggqvHKEcsICKyQHEElc6frpVeFwo8ksFuw6A8iF866v?=
 =?us-ascii?Q?oM0rce1OS1DOCV1z/0uyIF9L5KxXPyQxwweLn8F+T6tqfHMvSfn8TTPnRFvc?=
 =?us-ascii?Q?6KZPylaH7InK1xpJmceoCox22ZRDcK+qN3+7osR+Ez+Z1VPTiWj9TIkz0L/D?=
 =?us-ascii?Q?P1ZGXAHc5aNcYx6g/SyZM0tI+zHnoAaG0iXJS5goZBIkGKdD0g/RAEnrEzUF?=
 =?us-ascii?Q?koFGLTY9pKT5zY4nhn+CgW7IT1hs5RyrUM7hIsRQfuYB9bgk9iU2kEVYPHfr?=
 =?us-ascii?Q?KaCKrZAGTKkdQljTxH6VpyiCUAyJYbDkxB4Qi5RCXJbt4E56G4BwnVld/muS?=
 =?us-ascii?Q?XWqvkUA6TDx4b5x9fnaBJo0WkMnvyG3AE0oAcLWotuGpmemo1Vmj/mjWJEwa?=
 =?us-ascii?Q?07+ksptCO8nITfzOtvkTS7E2?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55e62b1b-a387-40db-c513-08d91ebf24e4
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2021 14:20:55.7778 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CzCIfT+w/LUqHnFH9859TvGgsKQdqZWdDjWMfO+xuIVprL2CaEI434GIk0gyU2PyBaSvClq4/EU1mTgL3p6eGQ308fpttcTy9z8Fkbq4ryQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4165
Received-SPF: pass client-ip=40.107.5.103;
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
Reviewed-by: Eric Blake <eblake@redhat.com>
Tested-by: Kirill Tkhai <ktkhai@virtuozzo.com>
---
 block/qcow2.h          | 1 +
 block/qcow2-refcount.c | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/block/qcow2.h b/block/qcow2.h
index b8b1093b61..58fd7f1678 100644
--- a/block/qcow2.h
+++ b/block/qcow2.h
@@ -586,6 +586,7 @@ typedef enum QCow2MetadataOverlap {
     (QCOW2_OL_CACHED | QCOW2_OL_INACTIVE_L2)
 
 #define L1E_OFFSET_MASK 0x00fffffffffffe00ULL
+#define L1E_RESERVED_MASK 0x7f000000000001ffULL
 #define L2E_OFFSET_MASK 0x00fffffffffffe00ULL
 #define L2E_STD_RESERVED_MASK 0x3f000000000001feULL
 
diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
index adebb15598..5903e058b9 100644
--- a/block/qcow2-refcount.c
+++ b/block/qcow2-refcount.c
@@ -1904,6 +1904,12 @@ static int check_refcounts_l1(BlockDriverState *bs,
             continue;
         }
 
+        if (l1_table[i] & L1E_RESERVED_MASK) {
+            fprintf(stderr, "ERROR found L1 entry with reserved bits set: "
+                    "%" PRIx64 "\n", l1_table[i]);
+            res->corruptions++;
+        }
+
         l2_offset = l1_table[i] & L1E_OFFSET_MASK;
 
         /* Mark L2 table as used */
-- 
2.29.2


