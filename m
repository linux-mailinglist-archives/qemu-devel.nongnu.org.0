Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB542372CE5
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 17:23:59 +0200 (CEST)
Received: from localhost ([::1]:41562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldwty-0005kj-Qf
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 11:23:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ldwrs-0003nJ-9q; Tue, 04 May 2021 11:21:48 -0400
Received: from mail-eopbgr20111.outbound.protection.outlook.com
 ([40.107.2.111]:7358 helo=EUR02-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ldwro-000711-Dr; Tue, 04 May 2021 11:21:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pcr8zhTKaCPKemJd9ToQtXJquUzQLhhq91izcfRtO4nMvZHsrr184tlm3hHhOnam/MAO6HlJOV1y5cQUt9a4GYMJs5r9HICyMuC+hRwiyqgqBwcUcrs6dC7ASoiU3bt6mJgBzSbN//oI9DPhouXVsNU+i92biFJFUwU9CAnDP5eprSNmfqOfjboMeROQ45QejmjJZDgQa7hWdraDxFX+XrvQdeaeaQIYYI0hehfZTW49IfH8lSQL8/c8K2WlYvtqtKwRDzTpXwSAjKXG/yRuPBs7Z42fQVbnDulCJjWzBIqo+s3jkxd8WNbRnhADYMqJvj0JMPO/1sE6xB1nH8IHdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NojLf3STacdOoUxQZhrqKuz++a+QRMfE6jol+jKzf0Y=;
 b=PAvIDQALaE1ixRr8gsD+EAzARfYVTbqBkSU2dTbfLEqJ8MSEflxkV3+3f1v9/uBzXPDy/C3dIka1JLP1yelP7Hf4v9gEbEbtnBuKdHIt8MRmZLBefHRthobk/4zIkOvZ19ILqeTa5B2XjEZCCsuB+IH3up14ynV7ooFQFBhfg9TCQx0gszXDs6vT+BAO1N1FD/pMHQM4P/qqjzUU92UhTqmtHFlFsQbb8liE8Rxrb2MSYnJo4oejwAJ5YX0wzF2ofjhqIwRmQTZJAa1DzlSyM7XCZZFgKHEt7+spppIp8OAxxm6VXHc+GQkmmT/l/VrNfFYifU3Be55pbFiUlOTEPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NojLf3STacdOoUxQZhrqKuz++a+QRMfE6jol+jKzf0Y=;
 b=EaKpynclIWCqK42Lu1Jp159EnIQj0I6dgdVg9hsocKqV+rw0P7DJ1Evl61RDy0IVuLu7zNIeYyLFj2/w3+GQi8ii90mXJcNEXYHd35Q9Jj3oEFCUP9arKHgwZIUzhDt5orb0qjyQe91NQBZ5xb2hI/anh0Ro59Eb9RM9h6odfGA=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4916.eurprd08.prod.outlook.com (2603:10a6:20b:ca::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.41; Tue, 4 May
 2021 15:21:33 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.024; Tue, 4 May 2021
 15:21:32 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, den@openvz.org, ktkhai@virtuozzo.com
Subject: [PATCH 05/10] qcow2-refcount: fix_l2_entry_by_zero(): also zero L2
 entry bitmap
Date: Tue,  4 May 2021 18:20:18 +0300
Message-Id: <20210504152023.322862-6-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210504152023.322862-1-vsementsov@virtuozzo.com>
References: <20210504152023.322862-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.251]
X-ClientProxiedBy: HE1PR0901CA0052.eurprd09.prod.outlook.com
 (2603:10a6:3:45::20) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.251) by
 HE1PR0901CA0052.eurprd09.prod.outlook.com (2603:10a6:3:45::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.27 via Frontend Transport; Tue, 4 May 2021 15:21:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: db737def-311f-4482-8a23-08d90f104c1b
X-MS-TrafficTypeDiagnostic: AM6PR08MB4916:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4916914B88DC2C81A7D041A5C15A9@AM6PR08MB4916.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:136;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: owdZraH9eRvLvyK33KRIcrAY/jnf69ciLp3a+GBvkFMdFTRicoGw1aNJWW9b2Q+IAXJa2by82mSjoGsA3xV9Txy1O7eHdLuHIuUvvmBvyggAPZ2x9xAS8suwDrZ6oMnedmiBAtSpi1Drj9MTF883TZPJfHf7/cclcyxCOnwcAurM5RYiv24zV/YaWBVEgGu9jJHT60ucOM8R701Z7rokI2yqaOEL2S38OrfuNWUahkalItbGQZC2hLDaEA0jK9lv/3/gyUxMOx+fUC1tKu7i7kpP2dC6i/lu+Z9Sg1SHWdPS1Recmy0+hCd2xcARPWnkjIhhDzUei62seOuTN4Ol1mE7BWYd45btLuZNBwjwSlMi5Qn0LvzGxNs3nKDNZK1t9QVd3zYpy6p9XWpz1GDvaRPjnWyyDSQrGix9PrTx+GZYPT9MDCQ2ATnJ/SVOtitA4/ZCk5Nun3TKcy56f4MS2BswaWJVLaHnWLzIFvMrYBGfqIWu7/oGjKQ+Iu4TFTw8iN/W6yIiuDw4tV8my1ReL6ulKTtOebYOc8NJkhJWMWGLCwG8gXWaO1WkYs4DyOANLXDcXJRRrBJf3GuTnOlUyFAqpJ18WfWXTdWrMKcsLyw3sZgMqkv61sttB90vROk4eS0J5X+rEJcVIEnYBrzKxnA3qxuEQDAB6bLnMKl1LMC4Uu2w35jIYe/qCwKnzxZF
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(136003)(366004)(346002)(39830400003)(66556008)(52116002)(6506007)(66946007)(16526019)(66476007)(5660300002)(107886003)(36756003)(8936002)(4326008)(2906002)(6486002)(86362001)(186003)(26005)(956004)(478600001)(83380400001)(6666004)(8676002)(6512007)(316002)(2616005)(1076003)(6916009)(38100700002)(38350700002)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?H8DFmfHOX/5GqzwX2nGPOH2yu+jJSExU9UCWnknAINcAr5FsbxYTlROAnyzq?=
 =?us-ascii?Q?zLxJFGNL7JCMaei/yxbUYbfS3pZO8xcUtZe6RuagTvvkifBVCHN05fnwrpN0?=
 =?us-ascii?Q?TNRLQYA0P5OTvuecJG548Gs69DAxhWuqQjjhYG5oWITHm+00Rn6PkZBttkdk?=
 =?us-ascii?Q?A92erKs0+CNGF8twE58ypoAenkQT7llBArxjWTC+YVfuoBKJ70K4xl+xqgrX?=
 =?us-ascii?Q?YxlZz4aItONZngrEcH5P/gOEzRtZcgA7nXKiCIWaq61+pENOqgdiQSBZCIU5?=
 =?us-ascii?Q?2A/DSkp18r8rxTP2dO1OoSXLDm1bPlNfUXTgn4LjOkJVpmdLYNIS8kNj08Db?=
 =?us-ascii?Q?qSZ9pJkjH/kromnAMkLM3138nt+PvleN2/3yanKMk6E4YcxW3fJXPB+Zu8pj?=
 =?us-ascii?Q?buxSsQSj4wI4JYcD3SXjlifkEtZNeU4uHS8uNlZ1PO6O5CJABX5lN+dYSlVA?=
 =?us-ascii?Q?GL6y+tb7eC3XI+fe4XQx/b2W5cXkhlAkL9Kp9KVWIqPfewe3KSaH69bQ83SB?=
 =?us-ascii?Q?HpEJRGYFSP7hkmjaQDoARWOixB8nNH6i6kIvjCWo8/u3lQKafL2EE5/j6EoC?=
 =?us-ascii?Q?QaflKt6VYYnpjHtJufYvrqpnVJ/kIoUJflLhr9+fjpN1daf79X3oS57H2iiu?=
 =?us-ascii?Q?Fv7Xi3Ekl8g93zpOmLQC2CL407aLLVfnv7nDhZLrgjwaJI+ZKoDVC1fvV8uL?=
 =?us-ascii?Q?3twxj3jTxobGngpJhqBE675rfsQsv2HVaajEb0EOyEjwITOQoefPV0+fA/Qq?=
 =?us-ascii?Q?y2fDk48gF1CR7ygJUftYF+UB2gdfv7FqSbgg6+4rY3ojNPriyEwPsdR7WQWM?=
 =?us-ascii?Q?zt6CNLRlukszebcQPrvDLrikB2z5dIm4dcJN0vPi/otrk/f8DcwmdrGTyZqG?=
 =?us-ascii?Q?5Mrowmk6I4kzmz3M95e8SVCT+iq2J9Q2TJRbiNnow2KQX6WLlKam/5BuC8g2?=
 =?us-ascii?Q?CjwsGXQbFaqI57nyg5q7VT6v0mJnuqeC5I3UP1ov+tMznMYC9IEhwCn9SPfE?=
 =?us-ascii?Q?gd7YW4EacOFP0EA932sFOv5R4VY8rGr0JiJ7bRrr9LD+Zf2WI/kUogrm6zMe?=
 =?us-ascii?Q?3b6/u3jIr4GOIZrFLA9Dra+ol63x/ddQklfNRjSpGzQ+BYdtj+SmqKT7ihtX?=
 =?us-ascii?Q?V80grACftYsoiscMHKzHOSsEinaIRmVjX1tgpc8FwQuh3eq4b5LnCzxKe7iF?=
 =?us-ascii?Q?TK/9e8IKqHAsgPdY5debFH+G+AuYGqJxjEe0c3jLG55HQ29sMW9xPCzCU/ac?=
 =?us-ascii?Q?oTzRtEnQZp/+m1dFPnRJTf4oVOyWWmXAb9bVtm4+lUNbtteqgR2nwoNjS2cF?=
 =?us-ascii?Q?pk2c/ZUq+H6B0pZ7Tu4h3WTo?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db737def-311f-4482-8a23-08d90f104c1b
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2021 15:21:32.1866 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F5sZhdu21LFe1GdFRNYsaDRX0hnEeOVA5TMmE5kRuixU9o4Mo8GVFnyUYgZGPaLwu63OZHdSu6gpSxQ9DLV1mnqbI93aWzMaDaLg1gIihEg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4916
Received-SPF: pass client-ip=40.107.2.111;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-VE1-obe.outbound.protection.outlook.com
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

We'll reuse the function to fix wrong L2 entry bitmap. Support it now.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/qcow2-refcount.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
index f1e771d742..62d59eb2e9 100644
--- a/block/qcow2-refcount.c
+++ b/block/qcow2-refcount.c
@@ -1588,7 +1588,8 @@ enum {
 };
 
 /*
- * Fix L2 entry by making it QCOW2_CLUSTER_ZERO_PLAIN.
+ * Fix L2 entry by making it QCOW2_CLUSTER_ZERO_PLAIN (or maing all its present
+ * subclusters QCOW2_SUBCLUSTER_ZERO_PLAIN).
  *
  * Function do res->corruptions-- on success, so caller is responsible to do
  * corresponding res->corruptions++ prior to the call.
@@ -1605,9 +1606,20 @@ static int fix_l2_entry_by_zero(BlockDriverState *bs, BdrvCheckResult *res,
     int idx = l2_index * (l2_entry_size(s) / sizeof(uint64_t));
     uint64_t l2e_offset = l2_offset + (uint64_t)l2_index * l2_entry_size(s);
     int ign = active ? QCOW2_OL_ACTIVE_L2 : QCOW2_OL_INACTIVE_L2;
-    uint64_t l2_entry = has_subclusters(s) ? 0 : QCOW_OFLAG_ZERO;
 
-    set_l2_entry(s, l2_table, l2_index, l2_entry);
+    if (has_subclusters(s)) {
+        uint64_t l2_bitmap = get_l2_bitmap(s, l2_table, l2_index);
+
+        /* Allocated subclusters becomes zero */
+        l2_bitmap |= l2_bitmap << 32;
+        l2_bitmap &= QCOW_L2_BITMAP_ALL_ZEROES;
+
+        set_l2_bitmap(s, l2_table, l2_index, l2_bitmap);
+        set_l2_entry(s, l2_table, l2_index, 0);
+    } else {
+        set_l2_entry(s, l2_table, l2_index, QCOW_OFLAG_ZERO);
+    }
+
     ret = qcow2_pre_write_overlap_check(bs, ign, l2e_offset, l2_entry_size(s),
                                         false);
     if (metadata_overlap) {
-- 
2.29.2


