Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01385598749
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Aug 2022 17:21:50 +0200 (CEST)
Received: from localhost ([::1]:53736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOhL8-0002ZW-Kb
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 11:21:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oOhEq-0005oE-9R; Thu, 18 Aug 2022 11:15:17 -0400
Received: from mail-vi1eur05on2109.outbound.protection.outlook.com
 ([40.107.21.109]:61536 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oOhEn-00071h-Ko; Thu, 18 Aug 2022 11:15:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L0NEhGpaDJaeZ4IPNhwQ6i85x3bskRe68V9IUjANDvR28KrsYPHuL0sJZfTYwdyZ7BP6PyfcCJQbQg0cHHchI63s0yDHCP4Yh3YzalNfyDwYBrreR54zdpR84UaRHZcqe3w61FvhGztwMb7TQ7mL5lYVMrZylEmUx1G9lMqN3RIPJq3bY4+N/wU74ZdI1HbczC9UmbAdavbI9cjs0UXSgw5KnzwrGm3wIdmGsRIKYqrQPUtTLr4rleK3tLfxjPHAgyAGemvRbyeYbTiNrFHcJQSPEn+0bghnqWcxVI18GIc+7iRm4HkWpcD5ESHNLYVEtMussEcbAbYo4VdCyu8wbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bfjCEB1XhsFtO2vnQC5cI2LPQqJ2CsUn3sTDnhFvbmU=;
 b=Y/4KZ1Xd5KxMKqIa6RDnWx86UC2M9QuZzn4M+voVplavMTC1Oim+I5O370rTCv7j8uGxlo5Up45BxplIXZ6Au+o0UQ1y3Z/JAFRKEhBO4Mx7OTh/d+okW6eGEzwrIGPNbRwItaWX0NwJz6fJbMSZJkF/aztQ6TOZYkMebHOE3NE6RVmhdmFb7b60tdGRXHA1OkolMJz8mcS5QJXKbARL+4xz3V3ifAuUgWuJxNdYZFz42LhtupALl9U70eN0HEATDTIL08WhKUxKH5vzs9ht7bpKFHzhPTZWFiav6EyFvYAM4It48lQgIMMaWVr/V+Ho9VCPJcvNLh6lvIW5oXUdTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bfjCEB1XhsFtO2vnQC5cI2LPQqJ2CsUn3sTDnhFvbmU=;
 b=ymS6xnAtbhOVkZPUkH8Sck0VnGy+akF3TOYgv9Zei0axDlTgyoQD08iwWuLF4hCisQbDc1R82n87r3SinfMOhXX4n1d9JECvis4saEXdpTKSH4/N28vlMgr5t4oUH7dslUvrK8Rv/DayldSh81oC1NIMYlSlrzqq0K77sg2EiwF+x5BGJ4sBHjzsVUgYujfTo6OVk8Pjp9nHjpjee/OjJ8JaPkhAXxl3E4gG38N13eA8dbVFZbVI3HLZf8ZiWoZI5WLszlDPTnc6paMzx4j9pyxCuFwlG1ZFk/s8go7hsk6EPZVRQ7/Q58Rn4FBeU/7Ssj+8O49TnCtzyRyDW2w+2A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by AM0PR08MB3715.eurprd08.prod.outlook.com (2603:10a6:208:10b::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16; Thu, 18 Aug
 2022 15:15:06 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2%7]) with mapi id 15.20.5546.016; Thu, 18 Aug 2022
 15:15:06 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH 1/9] parallels: Out of image offset in BAT leads to image
 inflation
Date: Thu, 18 Aug 2022 17:14:48 +0200
Message-Id: <20220818151456.2118470-2-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220818151456.2118470-1-alexander.ivanov@virtuozzo.com>
References: <20220818151456.2118470-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0092.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::13) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3b5b394c-7cc0-4840-fc1e-08da812c6e8f
X-MS-TrafficTypeDiagnostic: AM0PR08MB3715:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C/anH2KNDKZZn+Mh9B79+Ec4jKNEC+1XTaKdP89UyDZI7EkcNO/DjmTpqQAyFDCeEVznxCdbdVnI+0yVr2WS7mNPCsiSWJxGZXEYkbo/8CmGa5lSupkca2dwyRThIxTNfWZcHgJFhoPpGWruEt4q9DdDYjw6s99fuXvE42/qqNlQIOiL7dssSRY2nqbEncwupbCHc8VE5bLEKPJqKgnNzro2XiDeU6PGCg9NVR1bSc4usTjwpP2s1yPLWTk88ghkcGw4g4P1FFSpgOdRKY/YPnNlec+bjkKaVHVEIm8lT9U5I4K8DSMDwXHi8ThFDNLZ1HdH/O86oIdcDtEOfC+9Ros7fcGQkQGrRzbaICWT0aPVpPKsGdknGTknLe2GClmiy8xxMY3wwiEM23LTB0Ki8JAtGSxzhcVEHGyKNXNdgkedAexE+DlTCQUgifDnU/11cFxUQyTmngUwDz4KwlTS78QrfntumGOf8J+a6NN7gfDdNDCy0eCC3y4y8E/6EsZ24uXtuN3J9inw7HZAYm7McCwp/KonyXsSg/UMEHNETCwOYWex0Yzlv9ExWAKpsUEeMd6S1jyoplv+YiFEmqWyH/hUp2MyGsM7I8YoyWU6+PkvuOVComR8c2WddiOa148jydXSShrV+stcU1hYBe3BCpLmrS+bwOcQMrzp/x/RB/T/gOo7fcNMKobfUTQPptZ5+lyq/j3135Orq8qoBmEdZqwzflPutrxHWN3eMuLso7HPPyVYn/69DV7e6jifpyveHacGcOXO5Aely2VWWtGYKQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(346002)(376002)(39850400004)(396003)(366004)(83380400001)(52116002)(6506007)(6512007)(26005)(2616005)(186003)(1076003)(38350700002)(38100700002)(66556008)(4326008)(8936002)(5660300002)(44832011)(8676002)(66476007)(66946007)(2906002)(6666004)(478600001)(6486002)(41300700001)(316002)(86362001)(6916009)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mE1QtbRsCPti84ky6eUGJcNXX0YdvUMI8wCIDpCnixOX09/WK4u1zPJwAJvV?=
 =?us-ascii?Q?BKXpd9LOJYekM7PWphhBOcAv0rrtuvJi++qY2ulm/Q6pE7KwWeao5wARWPhT?=
 =?us-ascii?Q?/lRbMCvODl33lJAROuA76n/iVgsTCc4ovfH2hS1fHIbHZYNSJvy4hOmGNIe/?=
 =?us-ascii?Q?Ak6kpNDzMGWjtgNzWOH/d3+Avvp2jlJ6sQBQZZgJ6IMkX+MPrRMa3Zkg6mPj?=
 =?us-ascii?Q?44uk48Js90jugzGLmjeL3wc4t5hWXDIG6LZNsMpssClg1WAnrVrxCwMzN4+V?=
 =?us-ascii?Q?YAN78/56IW4Zi/VsMSxe0ILaX0GFKtvjzd6JA5wsii0zZd7MwlYl8+qAbNl7?=
 =?us-ascii?Q?X86mry04x1cUoEKfuvfNAzytdH0BL9eq1/ahSiT75nYD59E0pXOn/FlKrEkT?=
 =?us-ascii?Q?0lNaVS94clHJvBdt7uckATSSG0HjKgtsgU8b/Hy3THqdShtqHuI3sebMI/jr?=
 =?us-ascii?Q?s4szlpA9SDB0ahRJZ5gsC+XwQfVZaOlKE0nqvfNaUQXNws8kk8nhYNiuhh3q?=
 =?us-ascii?Q?NDEmaOMyDjNTakNKlw3WqUbux5uWJA+IV5LHlhSUsqHJ8HBQPzSIsVIfjstX?=
 =?us-ascii?Q?2YOtCKE0p5uMu+oqrpKIpVHIHGoERuTQF1/ZAccs8ZxrHSbGCme1EwQF0iFA?=
 =?us-ascii?Q?4VJHlXZZmGpO+rqpZIfktLxUNi4Iz31D9ViR0S6qpI/c6IBh5v4kyIcnxdcn?=
 =?us-ascii?Q?dt8Sbw9QlqAInLmDjXYIkXP/lOSHMD/loHalX0G0UHZm3CQpmY2iMwrfAPPy?=
 =?us-ascii?Q?yNogTv8WB50ijqoTEIlWeFktgF+joF1xlY0dohY4CC2I0JURSxtp8mV8sNVd?=
 =?us-ascii?Q?T10irHZdq3G9lGluW8qCx96TjulLrS/Vx9fhjWtVCg6n9IiVS8X3SWL3fAr2?=
 =?us-ascii?Q?LVGJs4PW5yd1TYHOn+nq3h4f6SSzGikH7+ASyyylPsLqS/78PdhNSqbkL+QW?=
 =?us-ascii?Q?uu+t4suCDOxCi9geV51RdVMss22nS1MyIq2kasBT4F8UNQDnXGIb8dvoNeFU?=
 =?us-ascii?Q?XZXQOya6KnOgon7zaGo9RPt8kbQfmaSYvVGQ9AZZhzFjowSWD3IPA3V36EzR?=
 =?us-ascii?Q?axMzp6HY53ycdGTQodR0qK0IYdrPAjD6/im4v2eS7CKanxWDi9Ouiot42in/?=
 =?us-ascii?Q?8m+UbXmJQGT15IDjsAj61aKC1bx+xvijaGhTCcJXFj0n0czy9Hrda5WS44SX?=
 =?us-ascii?Q?xRHOokF63oOxVTS5lDqnwUZmVqbsvhr73ZAivcvjs/EW6Tpq/ox5kPw+KstH?=
 =?us-ascii?Q?REVH5XvisJMudtkYqbqPxG/oua/fFY4Tb8T+uTlt2cUrayVjF/F3drssnhfv?=
 =?us-ascii?Q?Ok+BMUqZXhZV6OticzNvU7U9t3b6MGXd9OWCjiKkrOi7b9VO0epILkIe+D4+?=
 =?us-ascii?Q?3oaN5OJkG5ourV4tfuHqFWcmj7aZs5vjCUQ6NxYw4tT6yyzvcyeEl5+2exAL?=
 =?us-ascii?Q?5u0rxP9FLAvccTdgYjkbyi7A738TESoUyralJVhiAMRcQAoy1PSETBUowLpY?=
 =?us-ascii?Q?K8Ifkr7ATI9JuciGz4swDEWT3nTPrRHAobPK+qzyZuhh8sC6gldpc3JQmBB9?=
 =?us-ascii?Q?/hJhgKhSJZfTDAG5bVkjQMN1JYjtnkT9CopKjY2/B/uQBgklm7b9Ngkxz1B7?=
 =?us-ascii?Q?rCw7kfPoyUynawd2Uf8FIhc=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b5b394c-7cc0-4840-fc1e-08da812c6e8f
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2022 15:15:06.1070 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KFPaIOJDEy5+iw6HAcaBk6nOmcu3IRbWmARNdgzoXhDtHLjalrZVOX4q5vgSnaOjbEEhJP5ZYKQqQPy8+w+FApe/bOKuxcNaC7xCDOrEE9Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3715
Received-SPF: pass client-ip=40.107.21.109;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

data_end field in BDRVParallelsState is set to the biggest offset present
in BAT. If this offset is outside of the image, any further write will create
the cluster at this offset and/or the image will be truncated to this
offset on close. This is definitely not correct.
Raise an error in parallels_open() if data_end points outside the image and
it is not a check (let the check to repaire the image).

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
---
 block/parallels.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/block/parallels.c b/block/parallels.c
index a229c06f25..c245ca35cd 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -732,6 +732,7 @@ static int parallels_open(BlockDriverState *bs, QDict *options, int flags,
     BDRVParallelsState *s = bs->opaque;
     ParallelsHeader ph;
     int ret, size, i;
+    int64_t file_size;
     QemuOpts *opts = NULL;
     Error *local_err = NULL;
     char *buf;
@@ -811,6 +812,19 @@ static int parallels_open(BlockDriverState *bs, QDict *options, int flags,
         }
     }
 
+    file_size = bdrv_getlength(bs->file->bs);
+    if (file_size < 0) {
+        ret = file_size;
+        goto fail;
+    }
+
+    file_size >>= BDRV_SECTOR_BITS;
+    if (s->data_end > file_size && !(flags & BDRV_O_CHECK)) {
+        error_setg(errp, "parallels: Offset in BAT is out of image");
+        ret = -EINVAL;
+        goto fail;
+    }
+
     if (le32_to_cpu(ph.inuse) == HEADER_INUSE_MAGIC) {
         /* Image was not closed correctly. The check is mandatory */
         s->header_unclean = true;
-- 
2.34.1


