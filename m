Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C024D2EFFBC
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Jan 2021 14:08:40 +0100 (CET)
Received: from localhost ([::1]:37362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyDyx-0008VJ-QZ
	for lists+qemu-devel@lfdr.de; Sat, 09 Jan 2021 08:08:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kyDph-0006b6-HL; Sat, 09 Jan 2021 07:59:05 -0500
Received: from mail-eopbgr60103.outbound.protection.outlook.com
 ([40.107.6.103]:49158 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kyDpf-0003dJ-N0; Sat, 09 Jan 2021 07:59:05 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jFiOS7QY4wme4vQ74wU5EPmxaBzSbfUqVqyrbok7lUh3YnW2p17QKopBoULuiVuJK8L/3jzTstcWzsWgzTTv1qbDgnPAErbBl5o0LHqTpFGv73oJU09vfXeQ+NJgXI/DiFEzM6uJ1kEZOFdqNfxfv5rhQujPx0wPvoFCVcUQCryeq+uG7aPRD9nFKgBbN+lOhwpwZCTQDOBUqpxPCWD9RZkDySm14uUSMKEeOCDMUHMB4Z6WOfnJmRHGJl4kmHT2A1G+o6iUJL43n51wQVYTsbxI0bjVIX7t0gRrUvqeCPNZ19OXvD0T1hSpB2zZUKGEwzIoaQtXN7cYr085UXjgpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=83GlCXkaxacMXgNIB425cxfYzkCiaetQsIeCxDT5l3w=;
 b=dQjP1hoZEC1WmtPSrvN+KJ7HEmpHJj1PyvWOpZVxSS0cnrH5FYgjS6GclKkJMvfGttHSbwScgMye7ECcPVEGQPaoCuZaGrHKmgdyvIhR1EHEtpvMiq6VAOD2rJ56hYstgtUQJiDVf2Jwe8nBeXojxfH95349MlwjKoHRg2YKqKvpmcJdcJ0oQRpeKlRaEvWCDpCtwo+q3D/AqdixK6PMYmBfuGx3rI9zauuYMqh4N1k4TfPiNu2Wsf0Hu1KCZHuNGwCuhmZXc3d9BEQOkx1DEf4WC5yBteNdUZfBOGdrHzxwAJSlu2qNEoQX8wWzp76Io3+TEmSDhhhBKn/ePvMU8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=83GlCXkaxacMXgNIB425cxfYzkCiaetQsIeCxDT5l3w=;
 b=KuPZAqUvvzZWnY+daG+UbHeBWCv8Qzh6anle+FsPUd/VBUWH48n5LLbEgpBCW2IhRBcSun8eFGsJ/vcJ8TveMqbjNluuFsbYsLOmUJGNQ3BiT49asLPEDm6XVv7o1LfqZFdIMZP8oiNQibeMtHJ51u1VUEIRbU1MfdJFbxvct/Y=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0802MB2418.eurprd08.prod.outlook.com (2603:10a6:203:9f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Sat, 9 Jan
 2021 12:58:54 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%7]) with mapi id 15.20.3742.011; Sat, 9 Jan 2021
 12:58:54 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v5 11/14] block/qcow2: read_cache_sizes: return status value
Date: Sat,  9 Jan 2021 15:58:08 +0300
Message-Id: <20210109125811.209870-12-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210109125811.209870-1-vsementsov@virtuozzo.com>
References: <20210109125811.209870-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.119]
X-ClientProxiedBy: AM0PR04CA0053.eurprd04.prod.outlook.com
 (2603:10a6:208:1::30) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.119) by
 AM0PR04CA0053.eurprd04.prod.outlook.com (2603:10a6:208:1::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Sat, 9 Jan 2021 12:58:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 49af73c3-b3db-4548-fb99-08d8b49e51a7
X-MS-TrafficTypeDiagnostic: AM5PR0802MB2418:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0802MB2418B026D25F4EE1211A05E8C1AD0@AM5PR0802MB2418.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZUDKCT6DgoHN73XYAE9vZrCs1Ms93IeQ5xOv9qA+O3Q/wETYolE0JQ0HY1We2piHacB7FbVa1spMBkeKYqG+f86W7edQ7Tp9h3jKNN+jllwQ/xLZCs4ChHChnkCA2z/6eIsdvAqeN9cvLgpI7MnSuUUc6r2HST/T2kPuJoiV7s8TNp+mz/gQbdn95yN+RTS+7EZOWP+x6n7wuhPoA7Im95BKK/0T3L6wowuCW1NZar7WHwxORjez+Zh593Cl5lTrRPHvK7zLyVkmAb+CDvGUzyFbCXzb5tDGOgloWmZm6UvFelKHyYf13U/e3NW611Ng9pAYZHRMVEd0uIWLK20FgR0EJPklbrmqIdAgCCDPnbVc2mSM27n+3kI3yeqzevmK/+Q6VMsxkqy0X0cx9tHkBA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(346002)(396003)(376002)(39840400004)(956004)(2616005)(66946007)(478600001)(8676002)(5660300002)(66476007)(66556008)(6916009)(83380400001)(52116002)(2906002)(6666004)(8936002)(1076003)(6506007)(316002)(26005)(4326008)(186003)(16526019)(7416002)(36756003)(6512007)(6486002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?BvcWWE/Euy1zJ+rrA1skWsqpdsP1KplR+JthFER3NjHx8dKyU1JTCBAUFVsz?=
 =?us-ascii?Q?qMcmyP/GbGUloD4vaAD9QGCGLYG2QK2vZtf97YHGsts03+P6tUQuF8egl3by?=
 =?us-ascii?Q?Yn2hQTORDIq5fKTG6wp/YLNYElMPLDtHlMqVk1jgiTaSOhlRDr+dcvW/ECfN?=
 =?us-ascii?Q?aLAUyFmSQDnR/Ny3XW3H52YQ2dy8tHVy2xqAKzifvdj+O9LC+grNqYiT3tNP?=
 =?us-ascii?Q?kWssIYj3f1dOJzFazYdHCnsq4VEiVSFEJkLN008UNGCNlPH5f2CnQggMNDaq?=
 =?us-ascii?Q?WDT3l1XNAMDwtowwawNf9zgYlhX+K3CBZsaYS0NvajIEwpfBktn8TLOye3TI?=
 =?us-ascii?Q?X39In5buG3wD6qFNifCMAQiFCZZnKPD+O+fTaO007EtJJevLobUABB2Q6DvP?=
 =?us-ascii?Q?yHKCeFgSjL+oRP7TMkM4JKEFVUMSxFtca7+bn4aV8fmOg874IS7STWgwbysJ?=
 =?us-ascii?Q?FvQBwL39/pafrUMFRkuPSI/oAY/dlndaDiuoOnI6Qw5WBQGW1hPYb391FDvt?=
 =?us-ascii?Q?7mNPwQTg0fUbPkWE1nCyN6ywGsWpX6V+XwD+CpGVeSnfdjCt5yKUwNpD1rMy?=
 =?us-ascii?Q?r/ae0tjfbODbi76aRtMKvAazz9p4eJmjNUtflXpZeAv2ZB0jxJN6/rZhmdnU?=
 =?us-ascii?Q?Tu/SIQY9smWhVXTyq3u6TIayIsh50B7PTlOaAdf06HBn6uyaN+BxEXZ26Os9?=
 =?us-ascii?Q?hWyuKG5oJwPguLlu0lWWcl3R4At8Ow2LhCNfVAcc6TXJb1gyKIYaf0Gh6cs+?=
 =?us-ascii?Q?8dTz79btggivifxp42OzWPBX6USL4Sr3HgbPmz3HhQw8nAzh0ymNH6Xwoc8w?=
 =?us-ascii?Q?r4JF/vSX6hTIo4FIKvJCv3H8tMP4kM6jmEHs8asUkZ1cIOQHcoYX/cPQ3OaS?=
 =?us-ascii?Q?2ln6vzWWAqJf/OWiGzSzZbvsAQ6y6NWpF64SFgFWJ2kcfPG44Me0XKMFl+9F?=
 =?us-ascii?Q?S7+px2aMEqIN9LDh7XcK41QFhfTtfRfQZTrWVYgqx1Vf11bkOEMAOhV+pPFW?=
 =?us-ascii?Q?bgjs?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2021 12:58:54.0432 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: 49af73c3-b3db-4548-fb99-08d8b49e51a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B34v6DvwNAgafPY0DivFW6+WK3WO1Zti93mQeKvXnGQyl4WF1DjpUswAJGgdFP/t98JXoOkNsPBMClN5kE419uvy6EDbHGrjIVzPXgv2Sn8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2418
Received-SPF: pass client-ip=40.107.6.103;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, berto@igalia.com,
 pavel.dovgaluk@ispras.ru, qemu-devel@nongnu.org, armbru@redhat.com,
 Greg Kurz <groug@kaod.org>, stefanha@redhat.com, pbonzini@redhat.com,
 mreitz@redhat.com, jsnow@redhat.com, ari@tuxera.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It's better to return status together with setting errp. It allows to
reduce error propagation.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
Reviewed-by: Alberto Garcia <berto@igalia.com>
---
 block/qcow2.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/block/qcow2.c b/block/qcow2.c
index 20d67bd9c7..2e0e050997 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -868,7 +868,7 @@ static void qcow2_attach_aio_context(BlockDriverState *bs,
     cache_clean_timer_init(bs, new_context);
 }
 
-static void read_cache_sizes(BlockDriverState *bs, QemuOpts *opts,
+static bool read_cache_sizes(BlockDriverState *bs, QemuOpts *opts,
                              uint64_t *l2_cache_size,
                              uint64_t *l2_cache_entry_size,
                              uint64_t *refcount_cache_size, Error **errp)
@@ -906,16 +906,16 @@ static void read_cache_sizes(BlockDriverState *bs, QemuOpts *opts,
             error_setg(errp, QCOW2_OPT_CACHE_SIZE ", " QCOW2_OPT_L2_CACHE_SIZE
                        " and " QCOW2_OPT_REFCOUNT_CACHE_SIZE " may not be set "
                        "at the same time");
-            return;
+            return false;
         } else if (l2_cache_size_set &&
                    (l2_cache_max_setting > combined_cache_size)) {
             error_setg(errp, QCOW2_OPT_L2_CACHE_SIZE " may not exceed "
                        QCOW2_OPT_CACHE_SIZE);
-            return;
+            return false;
         } else if (*refcount_cache_size > combined_cache_size) {
             error_setg(errp, QCOW2_OPT_REFCOUNT_CACHE_SIZE " may not exceed "
                        QCOW2_OPT_CACHE_SIZE);
-            return;
+            return false;
         }
 
         if (l2_cache_size_set) {
@@ -954,8 +954,10 @@ static void read_cache_sizes(BlockDriverState *bs, QemuOpts *opts,
         error_setg(errp, "L2 cache entry size must be a power of two "
                    "between %d and the cluster size (%d)",
                    1 << MIN_CLUSTER_BITS, s->cluster_size);
-        return;
+        return false;
     }
+
+    return true;
 }
 
 typedef struct Qcow2ReopenState {
@@ -982,7 +984,6 @@ static int qcow2_update_options_prepare(BlockDriverState *bs,
     int i;
     const char *encryptfmt;
     QDict *encryptopts = NULL;
-    Error *local_err = NULL;
     int ret;
 
     qdict_extract_subqdict(options, &encryptopts, "encrypt.");
@@ -995,10 +996,8 @@ static int qcow2_update_options_prepare(BlockDriverState *bs,
     }
 
     /* get L2 table/refcount block cache size from command line options */
-    read_cache_sizes(bs, opts, &l2_cache_size, &l2_cache_entry_size,
-                     &refcount_cache_size, &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
+    if (!read_cache_sizes(bs, opts, &l2_cache_size, &l2_cache_entry_size,
+                          &refcount_cache_size, errp)) {
         ret = -EINVAL;
         goto fail;
     }
-- 
2.29.2


