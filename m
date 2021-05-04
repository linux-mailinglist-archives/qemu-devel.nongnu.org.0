Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C989372D0B
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 17:34:54 +0200 (CEST)
Received: from localhost ([::1]:35170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldx4X-0006iW-JR
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 11:34:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ldwrz-00048Z-Nh; Tue, 04 May 2021 11:21:55 -0400
Received: from mail-eopbgr20111.outbound.protection.outlook.com
 ([40.107.2.111]:7358 helo=EUR02-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ldwrv-000711-PI; Tue, 04 May 2021 11:21:55 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RydcGj5HIOf/Q7JQGWn3hIOZ7P+A3fmtbj7q/kkP+jGXoPV0PIgohBVS9a9TuTpcHdnkQVhLuRTiVxrOH1NRee6jrJOgAc+k1kQbwK+RIhL884rIa+EJkVQQ2xx70MYyxA/D2o3hKKqZVcCA3ZU1zYqPK1UgjpPd8G08PEj2WABoEfvlE6bhTF6cSUHWn3SHdsVE5RoQxJX+cBSBI+hoBWNzow9NhXT8WYNAT/VH4PnHtkbOwKV9MwbvpYnP7cThi/x8AA9GldkXm4x6+sB6sUKdOvdIW42aB59nwn7tkXNp30j9bw5kBOBl/jnVcXcxeijIaWQahmHHCuyR82NRaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wcq9POCZ0q2cmXGVr2WJVb3Dr4rsdY2GxlH8MveUPtY=;
 b=XQEteZ8oZKh43lHC5h8hb79lB+/wg1hOStUoqms5ru7l2PtX0a37wB91nQ1pKcGBtyH+0nerRmo8ADuKG+PioSGRjwXRlfGpO5gPvZerC3VT2YvMnKFqpCK8BiKWov3FfCnufd4taQdDCDpCgdF0jyP0Qj+SdZPsZeMZkju5HTKdiXfUZj5ZE6TWdc+10qs29DOkXSSesT/lQVLxuT+F0sYMdtRcw8rdHg+D8JaDqFqq4W+NZ605LO37uHZbHomnGGAMlWMh7S6KukMtlf2x2+c3T33ccQC4RcbIKYK3zfZyY8B2xBkKP3n95XnKd6xBZ1HVqjYOAJ1H11l3KYIV6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wcq9POCZ0q2cmXGVr2WJVb3Dr4rsdY2GxlH8MveUPtY=;
 b=kQOGfR+qYGOkHZTZHg15ox65tRdulxfJzsbH51/Hlrvy93xgoj6GcfwbjUslNT3YXEQdisevJ5m2+KRdSlGlKYycuH9c7UJrVx9rOqAORvJS2UIHTyAYwocy+HooIMZ/v6w08wUzwVTE/1Qcj0R+2c6l6KATqvKupKshnB5Ea9c=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4916.eurprd08.prod.outlook.com (2603:10a6:20b:ca::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.41; Tue, 4 May
 2021 15:21:36 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.024; Tue, 4 May 2021
 15:21:36 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, den@openvz.org, ktkhai@virtuozzo.com
Subject: [PATCH 09/10] qcow2-refcount: check_refcounts_l1(): check reserved
 bits
Date: Tue,  4 May 2021 18:20:22 +0300
Message-Id: <20210504152023.322862-10-vsementsov@virtuozzo.com>
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
 15.20.4087.27 via Frontend Transport; Tue, 4 May 2021 15:21:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 218a2186-ca31-48a4-9cf7-08d90f104ebd
X-MS-TrafficTypeDiagnostic: AM6PR08MB4916:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB491631340E6E08DF51029376C15A9@AM6PR08MB4916.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:257;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cSDiwPDsE0mL6DzIe4je7q95CtzJxmEpuEAga8yJmHvLzw3evivYBpP62Y/draa4JiU49fRh8CImmlohJ4oYZyvTB11aKL1bFQ7LAgJylVw9tE0K5xnXEZMut0ACz5nFtfY+rp4fGA/HJNf9LNpt/ScVbMVTc4/jrL+M2+xu2Nb/wILXl3zM4yrs23F7CWbtMbS4Xx40wc4ZAKCizgysSO1lGanWIxgN1RcSbaJ/zT8Le7HCD0xZbQDu3E5qJNJmY6Zv81EZVaCwn7ougviiyQaL/YwVJj8fgyQ3IM2PLtHpE5zR2J+xLGaasDlQDDmdhl89x/HCLhZQ/yvP0W9IzqRER3bS7zlzF14FrzcAkbEIj8SMHD2Om5YFmICgks5Qr+NJTyJk1IeRZMUEqPbUN1gtPenaAs67DKnxoAF1vZy9QUhryWNQ4q5Oq+wsSJPZISDVRnDJKoMbQUOaKWPgWk+Q49TinI7tLxMT9pU3OYLhFuZKkezIp3HrBfWVA22R5TP6O/di7Gr4Ws1WI0CIAd9wkbB6AguoRw+dX+/+oQz2GG9/5gKMohVMwLSeqaQtWS2Z1xPCWD7DJoLQZJVGrfGKX5ohlZJxn9VzafH/UNRwehIH769y4LfJlLTpZpjM9gkXQyNAry3amWPYUx5dBQh12BMUFsHaAnNRowpmAwXohHe7Yap+PMCY+1hMrS+s
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(136003)(366004)(346002)(39830400003)(66556008)(52116002)(6506007)(66946007)(16526019)(66476007)(5660300002)(107886003)(36756003)(8936002)(4326008)(19627235002)(2906002)(6486002)(86362001)(186003)(26005)(956004)(478600001)(83380400001)(6666004)(8676002)(6512007)(316002)(2616005)(1076003)(6916009)(38100700002)(38350700002)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?m1YZ+5wCH9TliFG0ZMTE9hLGJhKZIeF8ZK5dgkvRIzxpkhUhUYz46MKFREFM?=
 =?us-ascii?Q?IwrYck2K9tVZS0rjWbt5WbFlp/rrjX6BsDqpPmb+Mws5PdojUn8x8O+hxtwH?=
 =?us-ascii?Q?rsOFTAXucTJGz1rundmH0kUYMRjOcQERH8qbGiu8c+YxRcHKq+vLKZ24frWH?=
 =?us-ascii?Q?yZ9yiDFZL8rOAeB/jPvioQ3WOmZ3XNXoodht7CY/e74xY7Ppmjw9QcNWAbgM?=
 =?us-ascii?Q?pBhJdMxj5jhVVfUO5k/JCOgj8jRzrWTtSU8l/EBA8EyZT6YeNe36zUB/lgpw?=
 =?us-ascii?Q?wukPJAw33yeob65fSxChvP5FquwKX1uZQWjCYxVZ/4Pk0h+FowuXW9z945/p?=
 =?us-ascii?Q?xaCu5w0oAGXasEyU6qK8UVcMDUs4YJq1FhVa9scl27VGS277VOaKu5yJlEyW?=
 =?us-ascii?Q?3Q7eJRVHwtf8MoswvzxwrwUgw/JZ2XOmG742Mita0CZquCN+So7uwzRezI01?=
 =?us-ascii?Q?+oMcNYo//FZWdwFCRXlDgJq5RijLWqHJFttnBcX5IvWkmuU1azrT9zwGw6sz?=
 =?us-ascii?Q?oSmNJeeT2pYpPEv3g5ZXcmL88ROAh0QBbcKi0JKuDiFx62JRWIMU6vlWsq5S?=
 =?us-ascii?Q?ztjAUAG/IZFFTnRLYM2vkRhtfz5bZcejAeXpSzKcpZyBqh9XkxKU68g26LSQ?=
 =?us-ascii?Q?7nw33Ky7jSMSvc/zRERO+CoS+cFcNnSMnjtPRd8AGgCGCKHERF9iBXnlfSFd?=
 =?us-ascii?Q?or/nOLr5MZywh/KOsT3dgN+TvdJPhRzXDr4DdK0zntdrNwS1y5y3Kc2NBQR0?=
 =?us-ascii?Q?QKGflkr4uIenOCf1KZNg9rSxk48anE3BINW+yeT5mAPVDguchERfILcnfgMV?=
 =?us-ascii?Q?xSIgqVrUbwEi4r7gJ7skdRGll8tcb0R6eOCUwE4VGzMaVNQtaGvAZiXz/TE2?=
 =?us-ascii?Q?87MIq03skPGeJ93FKPf4rpkkiF5hOJ5CjFbL74BwYi6lVeQJYSyNQHbDATvR?=
 =?us-ascii?Q?uh1oI/59zk1853slNlVbNVFwKvYcZ5M11W11DnClB4NRFFArGvT4vpYBQUHW?=
 =?us-ascii?Q?tsXK87rWNu6V1rWIKOSQlZpp5gHe2s7Mote+fPbRsMXPM8bSnImQtoATLmz+?=
 =?us-ascii?Q?5Tz2B+mdcZHWuqlyz7Scqdm2pDFJ74e4Mg2LF6ooR/BYb4rHOo+KjBukGC2v?=
 =?us-ascii?Q?lN7P8ihSTagrtQV7d7ubKRoOk2yd6IwbLsAIBiZqqc6EpYH8f4gvepYY4zJU?=
 =?us-ascii?Q?YfoeX7NN/KBGvOiefQqNSPZ9o7+izvw71tKb6gllsdInzKkhjAztUrmTvh8I?=
 =?us-ascii?Q?/b+SsbaJg8rHj16t7/5x/daXZrV+gX/G2r7UAkQBivAVgCZO6PZ9qKKaHm5o?=
 =?us-ascii?Q?O+ThH807JqaEJuMnAysHtSAN?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 218a2186-ca31-48a4-9cf7-08d90f104ebd
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2021 15:21:36.6948 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RrDsRMtggkE7umzHRCQ3VhwJib+aKpkUBD1/6z9/BhXRHJeJHxEYUVf0hiCvz7w9vhgGxHNxybyAAOuo7lbIRlUqfs+bWMaruhUjT6pKY14=
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

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
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
index eb6de3dabd..9a20aac0c9 100644
--- a/block/qcow2-refcount.c
+++ b/block/qcow2-refcount.c
@@ -1903,6 +1903,12 @@ static int check_refcounts_l1(BlockDriverState *bs,
             continue;
         }
 
+        if (l1_table[i] & L1E_RESERVED_MASK) {
+            fprintf(stderr, "ERROR found L1 entry with reserved bits set: "
+                    "%" PRIx64, l1_table[i]);
+            res->corruptions++;
+        }
+
         l2_offset = l1_table[i] & L1E_OFFSET_MASK;
 
         /* Mark L2 table as used */
-- 
2.29.2


