Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED96D356AA5
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 12:57:47 +0200 (CEST)
Received: from localhost ([::1]:50010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lU5sZ-0000mm-2t
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 06:57:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lU5iM-0005dK-IC; Wed, 07 Apr 2021 06:47:14 -0400
Received: from mail-eopbgr00091.outbound.protection.outlook.com
 ([40.107.0.91]:45540 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lU5iK-0001P2-P2; Wed, 07 Apr 2021 06:47:14 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ofY7QETR6nMgd1n9sQW0Fjls3oiCxYsNsPwsK6L5PKKebVDYkYgs/r2X5j8PXkYEsz2iwhE49E/wNtIx2oxRM8z0EJiFD8hqa8mAkeBTQZtCc7qhj6LRc1b0KewpWwPIN9rQ5MUyHZpuzsDCUzsu6P2MmBh5aVugXGdncSm0d40BLe0ZI/qInD6K2RGS1ARn4McGwxe8odi+JKBjrdlsPf6gPdPDzhejKwIhLKnKVqHnqKiasiV0ProAFbSxqt7WMBXjDMxfPQuLxFKHTg9bo80a2IpLKk5UPdJNip1mqULhj2R+9PlxK3cL+e06Tqn0/siMwxlEnTdluyLJKiPIkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IutMC+V3Hg685D8bTTHel48vtRgleZt7rCfLjz6LtUY=;
 b=lBeSRFp+gtxvKfnYIcVDzKyCnyF78waj2mRdbiw20VgwHsbdRlP9Yuu4Q0VU3rvwsWc2UtDM7CAUa0nA4DEAknDW5AsTomY9ZfBN9e0MNeNwE+Bzl3FrsP6pphgJjkkR9J8oHB/RXu4YqlU2hKNSyE3+gQ9iO2zNa5HrQarIhDkgrAc8xm0xRTr+VglIK5kBqXIAO3qV/jebMb0tLYVr0hbTp838acVxzPphUw/8BF4h+fBZ5UVlpLRiZlucDgnFwO3M5zo5SAns2iYwkYbg20eFNy9Ffx+dgptIm+PgL+haE3XZ0Wl9uQwpkf2Ah+C6gCwA6JqA70hlKhIlVYhyzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IutMC+V3Hg685D8bTTHel48vtRgleZt7rCfLjz6LtUY=;
 b=nWEF9n/tbouKR0BW/R0EEFfXKg3d6q0gSo+4k72MwjpNC921amJzs0wtQOJZ9TE+jyjs2fDIGEO8gYKBPRJcntLyyVPorJx32Tg6CegyShRhvNtxxLY54sIG/ed6+b32Pl2U58MeuzqAPLzwBKEY6TI70uu0fQwy0SB2PLdxRcY=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6805.eurprd08.prod.outlook.com (2603:10a6:20b:396::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.18; Wed, 7 Apr
 2021 10:47:07 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4020.017; Wed, 7 Apr 2021
 10:47:07 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, eblake@redhat.com, rvkagan@yandex-team.ru,
 den@openvz.org
Subject: [PATCH 07/14] block/nbd: drop nbd_free_connect_thread()
Date: Wed,  7 Apr 2021 13:46:30 +0300
Message-Id: <20210407104637.36033-8-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210407104637.36033-1-vsementsov@virtuozzo.com>
References: <20210407104637.36033-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.206]
X-ClientProxiedBy: HE1PR0902CA0021.eurprd09.prod.outlook.com
 (2603:10a6:3:e5::31) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.206) by
 HE1PR0902CA0021.eurprd09.prod.outlook.com (2603:10a6:3:e5::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.17 via Frontend Transport; Wed, 7 Apr 2021 10:47:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7fda6920-3178-4d3a-7b50-08d8f9b27cfe
X-MS-TrafficTypeDiagnostic: AS8PR08MB6805:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB68054C42B223ED8893EF7FC7C1759@AS8PR08MB6805.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:207;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VHsXLb+LUO8SMG2Ld1wXJy6PHV2D3wTqAWToT7hVPwW2k5JQMr3RhxFMV+X/fSnDkXU7LzLjLelHGimTyMXSlKlJ18YDt+pmF4i/PJnhLM7+s1qzuNv1wkK9LjFrbFmC4wR33zsq96wXom9KqDEdp2OpYE2SdlqtHYrjysRvjzwKJrFIr2JHM1EZkLJbTjdtUws8EhHaLSr7ztogWXD50M8z+ehssO3CfDA2S97hZnexlnKDTI2thJK2Wz4SjgWG7jYjAP2eqL5FzEBxMAV9/Rh39ZTKRDHkDc0IbV1Tct0dmHH1j9HrxHAMLwpc5TMyczFumfY6BNHYi2qSuWsxrXkCE7oU85xOmslx9hzplZ08pu3P8ZoZSX7JSlAAu8STbsEXu6ze11do+eMQ/1koXbo02Nf77s7Z41oAbbymn6X3GqaMrtlwcrQKEob7+WveSkWuEwVI9PlcBnHvQ9No9d/cTBY4CtLF3bxWjDv3ckc1yDqlpte/ed1j/utTh6C0rd/smbJ/QL5C16DeDkI0eMPM9s3byl94CcLX/+FwMXrLeosMZbu+o3Pkkqk+KlfRCo7q/UPd91ed/8vgWVW2EvV1tvqQDgJ3/EhQKv//eLRewigfe/Vl30VzVWv8wROnUfUcrdWgsMdgC3RHOSplKsp4ie3/45v7I+SYqvpsIMNB8BdHyILwmr14zfC/9CNqtjE5hhqrIxCY0XfRxpXylP//FwD27KOUwJvCzLw4nKQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(366004)(396003)(346002)(39840400004)(8936002)(6506007)(6916009)(8676002)(52116002)(478600001)(6486002)(38100700001)(956004)(2616005)(69590400012)(316002)(16526019)(186003)(83380400001)(4326008)(107886003)(26005)(6666004)(38350700001)(86362001)(2906002)(36756003)(5660300002)(6512007)(66476007)(66556008)(66946007)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?JFmsCkWJwF3iaM5UjesDdcBYvSPs97iVhH/LS2z/naQdplGhOCFrie7/jdLq?=
 =?us-ascii?Q?QNI2M6uqpjuAvBhQw/LZRYLdNQ3ks+eEhvnnZHXpG/cJQ9SBdMM4YVruLQjf?=
 =?us-ascii?Q?KgHdO/ol7P6CUqg6K0Rj3p4HLii5XbuaXxuCLKl503/B99GFA4df/NPDm7I5?=
 =?us-ascii?Q?zMEgFHYtBJPpR2Hk9YcgyU+4VW3bEdcrvTbXNcSf6tuDEBxsolPQe0qYco/N?=
 =?us-ascii?Q?UnFHFqwkHSd7LGYVJtwDT3tNDmBIKVjP15LsUBMn5k/sUDz7866t07H5oJbA?=
 =?us-ascii?Q?K17Fkk8dOhieI2xjAvFeQH4E3WivJ3xcP1BY7yomHuaVwi32E5EZNbUvtHJY?=
 =?us-ascii?Q?jSpH8vdJyt/qtg8q0i/rudxcxCj8/8DJkUni0T1C/vqKdIcAw5I2DwmAR27Z?=
 =?us-ascii?Q?UUyaBHDbI1HTqRIYwwOp2HZ1awkHNwrdkw/oV03BGtS4TOdaLr1wxbBenD0D?=
 =?us-ascii?Q?AGza2nl16isMvQOU52zfZ7axVkDuLu5gZawFLIvm4QoHAJ8YMGAvG+MQ+zIz?=
 =?us-ascii?Q?flV4pxkZHGjvaZD5u0JKEoIL3xYGbn79anLgvM9RqN6YY40RYkb3qCuIIGVO?=
 =?us-ascii?Q?ZHpN424jU7tX8FAt+iaifXZ0aIXiPG8JO2IpIjLFnwoaOGWPN4AoyGTYEHrb?=
 =?us-ascii?Q?2dg4rhLajav4J3kOuzshAZmBhpCpA4nyyhX8ZxDm9Bsyh7W1pi1rvJFIcU7a?=
 =?us-ascii?Q?cumgFmWBvz149SZE9O0XtO/saBWKpxrTA/0ikAx1NA4XrdrYnaba0h2sTfG8?=
 =?us-ascii?Q?boWZnDA/z5+otyPfbAIB5gZNXPnh9Q32DeMddAiRV8QT12BQfXeWSETmgWms?=
 =?us-ascii?Q?12YtVB7D1C5R81FImqLKA1GrTe8StJESvkY+qWqqsQPaIdczUEv9WdBiB99Q?=
 =?us-ascii?Q?VNbFa41BKmoI7tv/gokyHv7u6TBU1C5nhcIsZSI3I9fWPiHOz7Gj3uXHqkUw?=
 =?us-ascii?Q?O7r5Tf33+eYtKbWb9D0JWv1R1OyloBXOhXsiMIOmaeWOuHiCLUH103HzFQyl?=
 =?us-ascii?Q?5FChSCW0n4YxxVbt2spAfBydcmtUc0K+AGiDYiytQa2a7vOOi5DcMtFtMp9o?=
 =?us-ascii?Q?Px/gh/Mc6jnJf2ONFW7njQ3YMkTS7fFaeAAmUon0PBJ3PzBqwpPUdxxUo5rp?=
 =?us-ascii?Q?b4rYBaaln91LgQ1EIQzAhdNYIiUdxgz08mdyPCgIyb09UucPFwUOSiT/VVLo?=
 =?us-ascii?Q?C2TFLh/6JjsZ6ENACCitP19hdnb4jW16cJR1K2mlh/i1x5E1qgI7LFEmee37?=
 =?us-ascii?Q?hQekV9+TgLrI8A1JJW7VnZDUrUxo+z69uZbKgMatNZxCbsFxjmiN1+DYP6o2?=
 =?us-ascii?Q?4SGDsKJ1SY0CBlwHTmOoIWNq?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fda6920-3178-4d3a-7b50-08d8f9b27cfe
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2021 10:47:07.1244 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QvugcTSFZCs6tc4qv/7mepyUPopjIPBMJA9u9BKl4IV4iz/lyeNno0XDADiybEemxl7GjpCPOC2cM0hpebjz/3jnrt0lcAFa51/UjYWA/i4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6805
Received-SPF: pass client-ip=40.107.0.91;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-AM5-obe.outbound.protection.outlook.com
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

Now it's only a wrapper on g_free, we don't need it. Also, it's
clearing the state of nbd connect thread callback, not thread itself,
so name is not very good. Drop it.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/nbd.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index 23eb8adab1..4e669d762a 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -382,11 +382,6 @@ static void nbd_init_connect_thread(BDRVNBDState *s)
     qemu_mutex_init(&s->connect_thread->mutex);
 }
 
-static void nbd_free_connect_thread(NBDConnectCB *thr)
-{
-    g_free(thr);
-}
-
 static void connect_thread_cb(QIOChannelSocket *sioc, int ret, void *opaque)
 {
     NBDConnectCB *thr = opaque;
@@ -416,7 +411,7 @@ static void connect_thread_cb(QIOChannelSocket *sioc, int ret, void *opaque)
     qemu_mutex_unlock(&thr->mutex);
 
     if (do_free) {
-        nbd_free_connect_thread(thr);
+        g_free(thr);
     }
 }
 
@@ -581,7 +576,7 @@ static void nbd_co_establish_connection_cancel(BlockDriverState *bs,
     qemu_mutex_unlock(&thr->mutex);
 
     if (do_free) {
-        nbd_free_connect_thread(thr);
+        g_free(thr);
         s->connect_thread = NULL;
     }
 
-- 
2.29.2


