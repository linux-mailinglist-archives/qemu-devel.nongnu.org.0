Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 816AA40ADE2
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 14:37:27 +0200 (CEST)
Received: from localhost ([::1]:32934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ7gk-0000L7-Gw
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 08:37:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mQ7VE-0001oz-Cr; Tue, 14 Sep 2021 08:25:32 -0400
Received: from mail-eopbgr40107.outbound.protection.outlook.com
 ([40.107.4.107]:50377 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mQ7VC-0006CE-Tb; Tue, 14 Sep 2021 08:25:32 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fmwt0Cm0DVkfyQnu302nl3CjnmLEz/qnu9DzDSklYGuN2wL5M1lpMvcKIMlN40ZiKX29nPZNEyn1bT1y8UepSi+ZMWyt8MFM4UzvFIjsDDiD7oQgyX8ZpLy8BVbKjuv/eUAchWwJDt6329EcOHP+RgMmXjZsV/IdcwgIJZqIpcGTK2Y6RpzvDNar9YrfUo7Fz07uW1WIdbv6KyQluuSFxLl779ML0qTTtgf4KsWvbFsH8AG8yKIvnDZhVLLQv+Q+tbL0kEw7xz0JL4e9LfioNp9BspHb7cqAn9weLW+G+pV5e7TDbbphDIJSyDvQLayHg70/3gG23lVPjVBUqitHjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=8yrEBm5IwizU4eb9IdbXAjqEIXmN6P/F51h412eUtk8=;
 b=RSwFWzT8j7yt3pDMfFL/7ajtDDUI3mdlX+scgS1vbL0PyfBI/alYSpGhM5J0HSbFQnkb7KXw9+XlAtM7g6AHIhDz0d9i13ycTGTyzHunf8lki4M9yzhsoDh/SsHZxQ4nf4Z2hGnFvZLAeBpVCkIIngYIIBrS4bY2D8o23LXbufu6OFrEnpunFHva0l3nt41JSuVcKDkghb6tcw6qwgzyjaxaFMNJp7vAKIp6rsiEZdjMyN031w/YlanwldYMwOurU7BmjPbqXghU2Ad+K8eXO6rISAKwDrM3f4Fjsvie7Yqu07IfW7URTXbMy/SABkiByrYT+oOZ4v932EoEfHNVEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8yrEBm5IwizU4eb9IdbXAjqEIXmN6P/F51h412eUtk8=;
 b=Aw5NWJmrQQHjjfqisuWRBy+fS5vZ0kGorttE0GX40ehiEB9/RmHJ7gpHkfi8X1Iof/z6jsuoSvVQrPypIYdDqnzf7PT0qbdFbAPRJj7EYrObk1FWBwTF0IbCcVZNR+f/jfiWp0MhChdGQu2htN9BBAhlX0XweKoJO01NSSehbq4=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3157.eurprd08.prod.outlook.com (2603:10a6:209:48::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.17; Tue, 14 Sep
 2021 12:25:28 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4500.019; Tue, 14 Sep 2021
 12:25:28 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, kwolf@redhat.com, den@openvz.org,
 ktkhai@virtuozzo.com, eblake@redhat.com, berto@igalia.com,
 vsementsov@virtuozzo.com
Subject: [PATCH v4 09/10] qcow2-refcount: check_refcounts_l1(): check reserved
 bits
Date: Tue, 14 Sep 2021 15:24:53 +0300
Message-Id: <20210914122454.141075-10-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210914122454.141075-1-vsementsov@virtuozzo.com>
References: <20210914122454.141075-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1P18901CA0009.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:3:8b::19) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.196) by
 HE1P18901CA0009.EURP189.PROD.OUTLOOK.COM (2603:10a6:3:8b::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Tue, 14 Sep 2021 12:25:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 67471562-3c4e-4aed-d856-08d9777abc6c
X-MS-TrafficTypeDiagnostic: AM6PR08MB3157:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3157A40B4D9853CF998FE639C1DA9@AM6PR08MB3157.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:257;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ym2+6Zmg80GDKGIacGWPauHv1onQYy8/nKQPHG2whLOvl18j3ir3I0CTpGhXN6bwcKsrvNEAwSmdXX3RCOJvodDubf6e2E7NUcbKsAOjFg45MbbFGXLBiy9KaGEbixlvz9a/amH2jtCkfDvhKhhrI5xrk6GVlguqdJ+Dli0ZU8hHGCp+39SVZfa1Y3e5NY4sld4ZGjLekG3uNYlkRlIO1KQC0O4rZ6Yi7BZA02GOKT4iXMBuis7cszoMCyCOz9nIK4Y/7gy0fn/qWq/db+dgTpsVQdvZg3lAOESQ2fCS7Phz8Wm/D3LYhrl6TF8geX8ZyNDdVDUN3ne1eRstyj51PkeKvB2lIBht63eExLmI/13QJg2UkGKXG0hAvMQve4cZLB5CODMvM5fQsLKxTmQRdgzbuJoFarO7gjulCrpY6Dbd+Ln+jRVXbXfIUB+3XrE/IuX4ykFO0HRi7hkPQQLeE8RSISqq/4yMMciPsQr80FkMbcS+VVjxmbhall/nzLVwgMEHjSjdaYhZgFHy/kVxn9AeN8M8S6ykTAAuHzkSTqcZilaUieteQfr9nbcSsBs4uHWDZaB33WpPz06VEitj31/D+6aY1EAtRe6v9KWEQHBRWoJNur9Om3dbr5M3BlqnobkB2zgCDnihyS0Jl7samHMpzpl5l+oYp+0Xk70y5ITzvijwdP7agwbMUPxQDW5IYjpMARx2v+ETGzWFoW12gA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(376002)(396003)(346002)(39850400004)(52116002)(2906002)(6486002)(8676002)(38100700002)(38350700002)(2616005)(1076003)(5660300002)(6666004)(956004)(107886003)(66476007)(6916009)(19627235002)(186003)(4326008)(26005)(86362001)(83380400001)(316002)(8936002)(66946007)(478600001)(36756003)(6506007)(66556008)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pZMyHnb+pm77+UEEa8Or2O2xWaV6QN11jvyizs/RLX+JjmqnGsRf2p1XWcju?=
 =?us-ascii?Q?LjQhCYkgr5XYoaf22nuRZ+XGF2BrmR2TeNJMrAEITZ/r3kr92Sgyl5sACuot?=
 =?us-ascii?Q?Y9BiwoCErNyhLcaa6Zd1GpwrePVdyxf0sf6WsJKiSiMOK31mlzAVjRn+6hWf?=
 =?us-ascii?Q?9KLgxf73XmoI86z5VBqnPasTuxPgxYP1CgzMFa0+DiLrrQlL0BRol6Ng2qrw?=
 =?us-ascii?Q?TuehcU/gJrMlypFMhBFMUFEP/sBL7jB03yHAB61vNvlf/zV3QhzlPBqrsUpl?=
 =?us-ascii?Q?TLT2QnvU6EVsf9h0sujkfr/oPy7mXJLB6WMuhON6K+Lv13hFIDtMGocAt5nL?=
 =?us-ascii?Q?fczzriPJO9mqpNVIeGoWhvXSzjDCYYO9FH5Dye6j4a6YBw0rGAnDU4So5+2P?=
 =?us-ascii?Q?J3aAU/R2nKONL7A1uKtq0rlQuM5UuZX8/mVBml+6ZWWcgost9g5EVTy8WkR6?=
 =?us-ascii?Q?HzDuujF4o6yen7xy6lRKSf/W/r0kBwC/sHXU8hh2xRZETLS7N4qR3MXuR/Kg?=
 =?us-ascii?Q?DNSMUvZCGMjHNDZ08Ec9/KQhB4jt5+2b9i/eGQnF4mU2VTaFALl5+sFg614M?=
 =?us-ascii?Q?5vfAJ+7Ds5hXqWM2I1p7JKG1oEgQnHaZHMk1HjljwzgqEXHtJShH2olG29Ib?=
 =?us-ascii?Q?Zufk8H9P/WeyR0EZ8F3dF2Z+iuLeHZtGbRBya0g1Ayid3Ip3dTvsxqPCeybH?=
 =?us-ascii?Q?kN277zI23kgKxm5T+NoPAfzLrvxqlDRiALw8fh7lpiKWh9dMulbZHAulPCYZ?=
 =?us-ascii?Q?QGptpbDfYPx06nQ5zpQMcdHwTnsXtyPvJtznE1dbCGKw8MsOnfNFARUMPuum?=
 =?us-ascii?Q?9TjkZ3O18QCEl/MD/Kd98uRlf51AOwGU+19NH4XtvgEP01VTTkf6vSn42pGY?=
 =?us-ascii?Q?fIY4JIJor55Xwlu1i3a5znwFSP+jD9MEn29DJKNe3VSQ7SSw4XFG2W69BzG/?=
 =?us-ascii?Q?ZTcgeHHmOAER4ez62kDRubQ+z2bO0wmCVQ8s1Kqg9HKOQTMPW70PFsbqZVWs?=
 =?us-ascii?Q?y4WPsuxkQ8YRbbBQHAeoDGQTW/EAyVyj5VbkrO+jVL9fochcmT6OUxdT152m?=
 =?us-ascii?Q?hIZV2l7Wsaap9eO+/Llx0UbV++SdECvK7AkktzpEi9oWmbEHkrNvKRnVfN09?=
 =?us-ascii?Q?ArxH5/+z9V1ada4I+4BWULqLTZyrBDcqPTPYFdgDArgXVfWl0UDu8T1JU++v?=
 =?us-ascii?Q?v8GAFz9Tx2nLEQwc5vsl3nb6i+AFPrvLote7m3PbM2/uRjfq47M+T5OZty62?=
 =?us-ascii?Q?gqM+UwvhUD+X4fTjJx8c2Y8ACCcHSBYOMIIpMw7pshlqQ8jZ3Q5SuGaL7Fh3?=
 =?us-ascii?Q?vMZLhH5JfpnfrvSjO7mzHHZm?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67471562-3c4e-4aed-d856-08d9777abc6c
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2021 12:25:28.2263 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uBnE/ICf0x7oslFlElVbs+uLCvjN5s+xBaRNw+7UC1I/ITt4tUxMjXJVuCNKvjLK5RZTG/jgFQieEGnKBnxEyLF8FAreDlffsw8MWKeCWfI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3157
Received-SPF: pass client-ip=40.107.4.107;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-DB5-obe.outbound.protection.outlook.com
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
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
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
index 153e5ca087..75751a0181 100644
--- a/block/qcow2-refcount.c
+++ b/block/qcow2-refcount.c
@@ -1900,6 +1900,12 @@ static int check_refcounts_l1(BlockDriverState *bs,
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


