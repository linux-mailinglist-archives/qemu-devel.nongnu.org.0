Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 598C9402060
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 21:21:39 +0200 (CEST)
Received: from localhost ([::1]:56122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNKBW-0000nu-FG
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 15:21:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mNJxk-0005Yp-6G; Mon, 06 Sep 2021 15:07:24 -0400
Received: from mail-eopbgr80094.outbound.protection.outlook.com
 ([40.107.8.94]:32928 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mNJxh-0002Fk-UH; Mon, 06 Sep 2021 15:07:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SoqpLK9ds1l3F3l9/knD4KXmtaw9DuF9YclG7O4QBHJUzpLpHeE78nFDMtswHD7472n5DhDc4/407N4tn+dtAmjhH2IGNQCbbjT4v+p6lgYRYy/hcdGQm8+UvZ3WM4NmiOABl3ByeLQYp28ee7y8dB77wKy3QOSRfsfQD47vFVNGayqp37KvM7i1yfN4zWzT3iVq3F9uAFxX6mkPLactMNV3TjYqh4IJL+8QHcl7tNKbLHG9Qi1iLBDHpFO+Dz0bJFSGl9FCCDEe92PHhG/kea+PPWxssUQ4ywoM/8y9hjkA0nujrUvkLcY7TPvxkJg7DzSssbNTNoDdyoZTWIJnUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=PBowHRJXeSxZMf/TC7/DloqiOgMrP0SU5ZXOb9raffw=;
 b=NENRV4mPbaKjx12jie4+K4DYmkKRhXreqpzhelrXrdTIScqsfAt2jULmng3Nn0qQKbCcb6Y9lERRwTLQk4n12S1cUsbwtXRKv2+YG63dgUhYXs6cr5EvBdtZ7/YSy7sf35nYlQ9vWwWI27PbIIyfSf+XgJaUCkXlUzQBu4T6XGO2cxWhK6ycsSuUjZozi5zVbuQmmQam6UH4WqTE0gvhHIa4NmtQW7otMDdJAldwxB/91QU/IAYzaFsCF+eCL8VOgRohMY0WwBh25VeTlzaHASTDifoc4WI3GLrzEAQZ3bsfRg/tnEpLp2s29ce/wbhjD+VcYEfch94cTPe2M84rOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PBowHRJXeSxZMf/TC7/DloqiOgMrP0SU5ZXOb9raffw=;
 b=OyvPBJfpWs/q4NuAHK/YNT2hsmAhjjOWK79zYhZAIM6gKOfm/qkzzKIJETYEFzIKqwxFiDRIPfJ+lX8TlLGuUbBDgzRZOfyBibeziGbkYgoiO2HK1RXrcnidMPAMO0ToIndwHQ12qT/BC9pQJ6l1yURQCpqQozrTrIbfej+EikU=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4849.eurprd08.prod.outlook.com (2603:10a6:20b:c3::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.24; Mon, 6 Sep
 2021 19:07:14 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%8]) with mapi id 15.20.4478.025; Mon, 6 Sep 2021
 19:07:14 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, vsementsov@virtuozzo.com, eblake@redhat.com,
 den@openvz.org
Subject: [PATCH v3 5/9] nbd/client-connection: improve error message of
 cancelled attempt
Date: Mon,  6 Sep 2021 22:06:50 +0300
Message-Id: <20210906190654.183421-6-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210906190654.183421-1-vsementsov@virtuozzo.com>
References: <20210906190654.183421-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR05CA0302.eurprd05.prod.outlook.com
 (2603:10a6:7:93::33) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.196) by
 HE1PR05CA0302.eurprd05.prod.outlook.com (2603:10a6:7:93::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.17 via Frontend Transport; Mon, 6 Sep 2021 19:07:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bd5e259a-582e-46a3-3589-08d97169897c
X-MS-TrafficTypeDiagnostic: AM6PR08MB4849:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB48495702C42B59FE213DF49AC1D29@AM6PR08MB4849.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FXaMSo8AdJw3L6hms93BHIbMcaXBS0tEqP8zJAEJX3Opw+6HXrSXvYFuduznQposKekLArbWysGQUY//+HdI8sSm5BMt68PWfz9W42+daBvqTbjuQiLyw3RtkIYFq3ENRalRICpbghbtLWzetYwifnDHBR9vJBKc8xcJQ5wbo6eIFXBYjnGTzV47wsFp5f0NOu6Hj7rY1Ue5lvlYCYubonCzgPNrdq7nKAdk3loPbqSp+KqfSoxEdAZM24ckfJTF6WrjrqPBNfkVQxOb/Td38sZkItFGxa9i2VbYq6tCdz86cDaa1gkkC5Hb1Bc+naU7FTITvJrwLSLrf9vIg/dxP+KtW/absM0JF8dGTDTPEOK+I9GrXc5q2TnxEmgd4e6jvMmPIHHRQHWxAoA40USy3H4dKks8536I1aFqnwhcPxZssz6gSmbNBMFabOH6m0ySlcFeE6vj0I6MTFm9wRinP+VA4zd5bFOmA4UJYEs8k6p6SYLDbPT5wjPxBv1TEkqOv/Ko5+o9xTcj5UsQhP4N/hIcMVrLt9bw+pQn3qgNSugGKfQXgVJSh+H/PMl8Rhbswf6cjiAPw78JRDVZ8i/T5uemj/n+Pa8QwJQ4r1KmS7pY/N5LSyt0+KCLL5H3MxRoym+ornUaQw17mb76hAtdK/ubi51SmoJ5a5YxgMf4v2zfrmZt/uCIsQ8Os8yqh3YKeoWC7W61gUOniLgRpagsxQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39840400004)(346002)(366004)(396003)(136003)(66476007)(66556008)(38350700002)(478600001)(83380400001)(26005)(66946007)(8676002)(5660300002)(1076003)(186003)(38100700002)(52116002)(2616005)(4326008)(8936002)(36756003)(107886003)(6506007)(15650500001)(86362001)(6666004)(956004)(6512007)(316002)(6486002)(2906002)(6916009);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vvacEpoOKUQdBQ9acD/sRKwNKcqJ3t+Tuul/wNO5/OEEtCslsFxC0KKUzvDB?=
 =?us-ascii?Q?RkS/7kDAQkCPxIX0Jx9p9XbRqjDaO52jz5B4fWJEKwvxg63VPMuKQo185mTu?=
 =?us-ascii?Q?PYzfEUnXAO4yYgVXuVp9uRckuPJZmqYsMMuqYoJq+NoeK2wmibDOGrq/R3eF?=
 =?us-ascii?Q?6lizREd0YmbP0ZL57w3ub9fYbJaE3LqjqQlbs6/N+gwqHguxO+mllD2VmRl2?=
 =?us-ascii?Q?E3Ihpm6QeCccxMzHYIS0n7fNKdLPqz5SXB7SidsUqAmy/LOCFGjMnR5eiwAL?=
 =?us-ascii?Q?3BimHJexo+4geTXJd1PLwS6FnqAahMznIuOEKIA8RLu50egH74Usl0BjVG/R?=
 =?us-ascii?Q?kKCwbdeavSsh//IgCrFXyGQKjgwHvglZYfBZbkQD9ObXE1qA0w3xGsvQjSYd?=
 =?us-ascii?Q?nq6mE189cgLphxKlruX0BHvSVtQZT6xizOICUl4fg0OLvbYRu/eKDoGq74UR?=
 =?us-ascii?Q?Dnb8gHcPstJYmpyEK6UX1AMA1+bkUcA23NaFtzyrrcsLx/6sqTrTgOCfMhIO?=
 =?us-ascii?Q?j48TaP766PNZRA3O4atnxnz1AA22GxLmVjPa3esW49zJcRaSj5UacX0ao+2V?=
 =?us-ascii?Q?giPebOR97wmQVR8fraGk5vyo3zGcV3jCvrSxiz7/4nEhIRQiDkBJ9ZiROgPL?=
 =?us-ascii?Q?0aBfmI0oXaQFE23EXgxJEziMZhaUDJCLpGrfe9792k1UEBsk593gez+nQbq+?=
 =?us-ascii?Q?CFuuMpmT8Y9edtSj/VdlyHDdF1RM6SoAyXuGmyF7nj0y1ahRXZxR/JZHdVcK?=
 =?us-ascii?Q?pFtxgkjQwuLLn0ZtvNrBof7mtxMYwSa0NGhqUjWWjCEaTYqKUmCCQvehTigq?=
 =?us-ascii?Q?yMtSUaHDvD9K2xkwo47KiS+5M6nOFbO1eynUXajTTqxlXQFEdRPtwnuAJUSB?=
 =?us-ascii?Q?zHk1D6UpcpRrxgnQ7J8cVY7BZd47x6jujNsF1LIw0VPZ8fMzWVJjXf7mfB1B?=
 =?us-ascii?Q?Efq49qQJOXkHV5P6hwmI2qCk76C17b1hqvEWwzyxHZCzteAp85YmdSF7OPFX?=
 =?us-ascii?Q?10SiibE9P+FhOiS/1PUQJdQpY+xy8Q4yGToZvXOwauFuoMtxXZntr4y0NvyP?=
 =?us-ascii?Q?9hqDBBHPmP1ba7X0gvDWLiAuVClxO2oYRIRL/bz6hrsmSli1/0Pcm8h/KRA8?=
 =?us-ascii?Q?je8CZDSoMHTswh67X4X4pmnMTWtLGVVh5X0/Akkc5xcaYLV1CnlF2bqKD1Rl?=
 =?us-ascii?Q?XdpnbKEDGXSE+rGHXfpuWD6gtcf54iyYAoAPm2NKqnETkBk0eO1W9vnsAaTn?=
 =?us-ascii?Q?9p9C6YNnOhEfweyJp4p4gOl8d8rRdHFHvcsuqmhkzTo/ELeIaFjTsBmS4SdJ?=
 =?us-ascii?Q?DrQ5f89nApM5sqFPc8Yiz6YY?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd5e259a-582e-46a3-3589-08d97169897c
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2021 19:07:14.3332 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wdA19VWm3kL484u5hoHYJK8ZcqevVX8yQY6wshVTIqT8KOqhUUzgt8LXDQNOT38dhXV3CN+Z1+aYZtrj9H+EhZOS730HpFeSMXJlC5gyEQo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4849
Received-SPF: pass client-ip=40.107.8.94;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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
---
 nbd/client-connection.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/nbd/client-connection.c b/nbd/client-connection.c
index 722998c985..2bda42641d 100644
--- a/nbd/client-connection.c
+++ b/nbd/client-connection.c
@@ -351,8 +351,15 @@ nbd_co_establish_connection(NBDClientConnection *conn, NBDExportInfo *info,
             if (conn->err) {
                 error_propagate(errp, error_copy(conn->err));
             } else {
-                error_setg(errp,
-                           "Connection attempt cancelled by other operation");
+                /*
+                 * The only possible case here is cancelling by open_timer
+                 * during nbd_open(). So, the error message is for that case.
+                 * If we have more use cases, we can refactor
+                 * nbd_co_establish_connection_cancel() to take an additional
+                 * parameter cancel_reason, that would be passed than to the
+                 * caller of cancelled nbd_co_establish_connection().
+                 */
+                error_setg(errp, "Connection attempt cancelled by timeout");
             }
 
             return NULL;
-- 
2.29.2


