Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50228372CEA
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 17:27:28 +0200 (CEST)
Received: from localhost ([::1]:50430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldwxL-00010v-Cx
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 11:27:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ldwru-0003wq-Pr; Tue, 04 May 2021 11:21:50 -0400
Received: from mail-eopbgr20111.outbound.protection.outlook.com
 ([40.107.2.111]:7358 helo=EUR02-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ldwrs-000711-Cl; Tue, 04 May 2021 11:21:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c+DuPsMHlMAm5zXTikM+nJyyYL/kJ4KmqfvZkkL8eBaxc6JOk2Zf8I/sjLrSni2BZhvir4mfIhzjVSK5r8NH778UOtc0Pzl6+zsgNwYZIRcdwF+RhIFk0byoQe1OSVIn1ok+wn1gXQreBLMbNgnmTzRjHQOZtdNqq9kKo1CrBln3nTaVwmgJOYeHC+WxEfyGteMK+/+irEqZ2rL4GH+rNJMzpunkoU7NpkRMzUEQZpNKANRhphglX7IT0x0aw5VLBy4RFW86gy3oGib6QBhixApV/a+Ihcowvrm3bHCqwtbhBif37QKA5QZYt/E6X/PKdfzNvQK2cZcc3UQXRw0pqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tZYfdDJ6Nzcu6FvmmPg6qo+P7zjy1gZUeqLCRuFK9Ks=;
 b=bQ61Zu22zkYRv7xjdsXmMvCy6AH7rM6tW6+HX83z0W4HHKcl2lRtYiTJhu1IigIlMAh+eIyuk43C7yybwDdfUJlcROOgjcnivb/bfGpwpoA2JJeTbGCtAf+r4/v36faWQgKKPCkCbBeO7vAHxQKuCm6BZEFSZvIO1EID438XcxipPcIjmB9se9EEKcgdej1ThTUVANIlhXD8PllDrRBUH488v/YMMU8djFRZ79svOr/kX//LWg+G8M0+fDJEd81idRDePjWNlBVMiU8c1E328nsed7tURAhh6nSW8LcTKFeZu2+Xy6XGpwONXyPnWYBaDz6rp4tlyTZULagIjpZ38A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tZYfdDJ6Nzcu6FvmmPg6qo+P7zjy1gZUeqLCRuFK9Ks=;
 b=T4YM1pxKY07zsFpe+IoemGzK7joUD65kPanWCpsuzja+TuccWj4QEZLlIAbsOQcvua3+je42eyl+FqTwAtqUNENo8bH+8jwO0vU18me7A6pqZIMU0fsmKhPXKOFOdJylcRr9L/rQ0cQZiZJwQ8V0se/odd5sQPmUbwlNoj8QzJA=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4916.eurprd08.prod.outlook.com (2603:10a6:20b:ca::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.41; Tue, 4 May
 2021 15:21:34 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.024; Tue, 4 May 2021
 15:21:34 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, den@openvz.org, ktkhai@virtuozzo.com
Subject: [PATCH 07/10] qcow2-refcount: check_refcounts_l2(): check reserved
 bits
Date: Tue,  4 May 2021 18:20:20 +0300
Message-Id: <20210504152023.322862-8-vsementsov@virtuozzo.com>
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
 15.20.4087.27 via Frontend Transport; Tue, 4 May 2021 15:21:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f6e87d3a-bb05-4b63-57e2-08d90f104d48
X-MS-TrafficTypeDiagnostic: AM6PR08MB4916:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB491608BADD22AC76FD6523C8C15A9@AM6PR08MB4916.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:53;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FsZKa8YPrcDEiHWX6AfcjYuAAp2nqJisAMpgbayQ9s8LV8nS2mc6k010j1pGvPC2OehAfK2WKhmpdLkoSDZ6dC+bsDte/BRHzx8vKp0UZxipoMbu7tFMz2klgEJLzUH6ae4GzuIGTKQfPewpDmzsVpd4Y7DHcI7zWJ9q5vFda+czCRoUu7S+Q0CxPsD8OBtFLQswtXmCP9l7pZS18QzDvJd2uIurCun7lZJtAdq0/PG5Uw7EWBRIN3nKP+P9kBtj9xK5zjp6f8qsyx7PNoDGtCDuxTCAV/oCUbxtnQ+BaVQVlXNenG61WjqbrXHIoVNBuuFe0Ss/WWzIqLtDPZkngpo8xX63BBRC3P4qnZ11TJTN+l5k6nyaFlUQ+EG/LgN/Aa9HcwmSUIC9HidDiD5GAeZ7nQDmmT/JhVUnZ0XT/pFs1BmlIXaJzZfRrRdfpwoZXZxAbDCK2Oh8jRKwfrkZIoGX/HitULysBMhKEry8ViwjdYaFd+dQOreOb3LtT4MiVs0am43AUMDAV4NgwLC6Zn5EQlbcIgTM73/fI0fEP64NfloEyR/+GHjppHHUCCYMDpqG+d5XLhz0PGbmILLyZkvMmrbGnsUBijVF/pdeBJQ8qlAejcHQUjPDTLms50seu21xoKm3YxwWw61+wSSD1nzqTojEaihBto2BmGWwhwP1AACD75oZUHW0sipZWaYJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(136003)(366004)(346002)(39830400003)(66556008)(52116002)(6506007)(66946007)(16526019)(66476007)(5660300002)(107886003)(36756003)(8936002)(4326008)(19627235002)(2906002)(6486002)(86362001)(186003)(26005)(956004)(478600001)(83380400001)(6666004)(8676002)(6512007)(316002)(2616005)(1076003)(6916009)(38100700002)(38350700002)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Wg2Qn7HbKE8LlrMu4C1MuhrpSOogpNw1jspF5N1ko0Aql6NeJ4199uyHkYF3?=
 =?us-ascii?Q?GPJGOBP3jAeSeM5zOTF+m4EF/Orgad8oVoZGCLywwGfw9GtmOjJUEvXy455W?=
 =?us-ascii?Q?tkrPmPq05NpkjgtztdZ+2Ts6Ql9yuw9aH4gWiNknUMq0e1wR1a67KyLVGtk8?=
 =?us-ascii?Q?LQvOJcfxHlPqYgYlHqvIFwxCj415eqcb2vFqqMsmG9Zh+MBDWRjg3HxXiY0O?=
 =?us-ascii?Q?RORRUJ+qy2ahXNwWJv44eyNN5kZ86SZuWduyQSPTc1Uiv2WNqpcGzKnWBz5z?=
 =?us-ascii?Q?SR7gneyZo/Nnc+J66I4OB6upLFeiXmkRpg1thiKY/9v/vqGLiBvgJZlDAt16?=
 =?us-ascii?Q?Ck8j36Ve4g1hqXiQueSGpxmlqoyM2fvbZy8pbamK2sickycmYg6vHDlcTfMJ?=
 =?us-ascii?Q?KNjA7h1p4EuCR6JYuOzfLSy4Y756g3Kp96+tLstPZXC+cXmR9C79LdL+1+Ua?=
 =?us-ascii?Q?u4CTA81g2nJSp8/Zd0Lzhj+VwcpETt4j9D057lrWXRC29i5J3PaxDC9rJwwA?=
 =?us-ascii?Q?d9y4mjJ9SBiQT5xDfrgaqNdLNdDRBqeL3Kh/UlxZ27j/laLVWgcOXmYt7nnl?=
 =?us-ascii?Q?UOaZzAcFgvEVMDukxJYOuTSdp97GIZwmtiRDTYsDudlETTq9Dv3tz9K3N6/X?=
 =?us-ascii?Q?nRDSCZcYcnLGVCB0LUksOiaXF7cm+hfEExugdv6K77nIkh3pye3QM+Wo2ybM?=
 =?us-ascii?Q?4IEIjrgqut3uCleF4K0kplFSl+9+fGlK+YEzhunwYccdpvashvClqWA5ZwFk?=
 =?us-ascii?Q?gBvOw9DerwxmBoiUYyLWMZnGQfzavHqSfah3WDOoNViNU4FBb3n2fGORxKv4?=
 =?us-ascii?Q?vETn42Q9cLq3kJo0R9BDs0vzd1t1iI3YtZfNoQwlvdtZvsL9QZj9scxCxi0m?=
 =?us-ascii?Q?w4a1cpAHZmvkslB1g76Qc+3JexWCwHsS/wcPa3bI1SsV9epWD3ryGzbriVZh?=
 =?us-ascii?Q?QmdkZrxzxTOkTySpXwRu3eeq++ETQgmx2wtTMsfckrET33ew0V6IeTjLWYEW?=
 =?us-ascii?Q?MP2D829UtxNlNHccF6V+bdnX99Cojygo0kEVjxFLxCP3CA73R+s3KUuy30lw?=
 =?us-ascii?Q?EoixTH3uzm4bHXrlmPA6RbDTCSx/fugy8Txz7lZgcITPI/h9dJLTLumPAnT5?=
 =?us-ascii?Q?N0z79ZcwoWcCllUSZS01oaUUR9+GA/5CXkCTjQpbhTrkAb9Twwm810DBeAM/?=
 =?us-ascii?Q?V7jKKa3Eynbpze7yARv5J+T86HcE927wldXbqlbwyYGWB0WmVkLhtd0Fbd7A?=
 =?us-ascii?Q?soWr2Jb4Q/uszNaeb3sPcqRYeD4YiE/z0CJyIzWTtwFgukRPwd6SUOl5j3dA?=
 =?us-ascii?Q?uKjqiAXoEpBrNQ/qV7RPlHIS?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6e87d3a-bb05-4b63-57e2-08d90f104d48
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2021 15:21:34.3799 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kRmQg8qbXjaVSLus9PoMV7hjwo9iINH76mneF/3Mo1uMuYJuC8Fk7p8SAMrKf7qKwGsqYOswNSra3XZUuK1J6IRCtB/s6PQeHFDQpriRGrM=
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
 block/qcow2.h          |  1 +
 block/qcow2-refcount.c | 12 +++++++++++-
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/block/qcow2.h b/block/qcow2.h
index c0e1e83796..b8b1093b61 100644
--- a/block/qcow2.h
+++ b/block/qcow2.h
@@ -587,6 +587,7 @@ typedef enum QCow2MetadataOverlap {
 
 #define L1E_OFFSET_MASK 0x00fffffffffffe00ULL
 #define L2E_OFFSET_MASK 0x00fffffffffffe00ULL
+#define L2E_STD_RESERVED_MASK 0x3f000000000001feULL
 
 #define REFT_OFFSET_MASK 0xfffffffffffffe00ULL
 
diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
index dc940f3003..44fc0dd5dc 100644
--- a/block/qcow2-refcount.c
+++ b/block/qcow2-refcount.c
@@ -1682,8 +1682,18 @@ static int check_refcounts_l2(BlockDriverState *bs, BdrvCheckResult *res,
         int csize;
         l2_entry = get_l2_entry(s, l2_table, i);
         uint64_t l2_bitmap = get_l2_bitmap(s, l2_table, i);
+        QCow2ClusterType type = qcow2_get_cluster_type(bs, l2_entry);
 
-        switch (qcow2_get_cluster_type(bs, l2_entry)) {
+        if (type != QCOW2_CLUSTER_COMPRESSED) {
+            /* Check reserved bits of Standard Cluster Descriptor */
+            if (l2_entry & L2E_STD_RESERVED_MASK) {
+                fprintf(stderr, "ERROR found l2 entry with reserved bits set: "
+                        "%" PRIx64, l2_entry);
+                res->corruptions++;
+            }
+        }
+
+        switch (type) {
         case QCOW2_CLUSTER_COMPRESSED:
             /* Compressed clusters don't have QCOW_OFLAG_COPIED */
             if (l2_entry & QCOW_OFLAG_COPIED) {
-- 
2.29.2


