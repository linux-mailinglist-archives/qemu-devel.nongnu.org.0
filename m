Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED1C7308B58
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 18:24:13 +0100 (CET)
Received: from localhost ([::1]:51714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5XVE-0006in-H8
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 12:24:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l5X07-0001Uj-OK; Fri, 29 Jan 2021 11:52:07 -0500
Received: from mail-eopbgr60091.outbound.protection.outlook.com
 ([40.107.6.91]:6275 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l5Wzv-0007Pt-HN; Fri, 29 Jan 2021 11:52:03 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yh9qRYH7NUYjNZVi4F1Idy3wMZ6xfOUm2N0Jlw1CPh4bskHuZL3/Sf+V1L35GGcovXRJk6QEBR7rZfQ4etngVzLzjhmmMCqgms7jfkxdFsvCbyAengk+sym5ouhv5/csTG6iOLHF3nE7H2AcXTycDzidCRNhchDMhs22kGLnF8pcyAcEXq9WfAgaeoQxQvuJKkEPUte9pK/mWXEnFdHupxHDVPaewcEdUJ5WCMObZonfBkoblpAceF8MS8p/ILV59H9BtMNTxwk5y4qBNUhIG3YKHEPxpq9fvXFF1EOYrJf/Fg1crE+8FhFeB+NJgW4EHe3/Gz+RMeZDeqfMXFWJbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7sACqhT3LC0le2qy95oJqyBeh8bjD+/wB/gzlkAwfxs=;
 b=XwOLhKK+gMmf4lZKVG+2RkeHaKy+3tV8S89EVDfa9kywxlLMtHUiDGgHsQvYCYBzSn2PoXD02brSkH3AUrICRfxBMQBHntvT8Y/3z5uH8kCy4U0QORFEtNqYBoeFZ3CoYC6KUc8yFPiqxwIQA2XVn/lsTSwM1CSGTiRs/PcEuDEBCqg6XsP0m3jxvmcVsolGbkJwQQGL/Zq+r5UNVBF+rmmr561ZWQzCnJZudfqpibFdSLaR4wHNVR7ItePXYY7fPgov+L0fFO+ChwldIIveU8dxA+gD5ZQmXEjGK+kikdGQRU8lE2tlkqqFduAXpJ/6jKmJYIl8i665h8vwVjyrRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7sACqhT3LC0le2qy95oJqyBeh8bjD+/wB/gzlkAwfxs=;
 b=BD3MylcwV/ZawMROAKnWS4pJaeaPFmstPq9butVx+B77rJUQeA/t22Wlg6ktgH9v4IQhgjOTgUDGHtMyI6K6TvXAIwmrreuBF0/w6Z+20qqPnxjoYh2h9UwL2yegpOcz0jTxjEO8rnkxAKIS3guwsu2Y9M6hNcGfhWYCNsSI3vs=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3621.eurprd08.prod.outlook.com (2603:10a6:20b:4b::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.17; Fri, 29 Jan
 2021 16:51:42 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3784.019; Fri, 29 Jan 2021
 16:51:42 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH 1/7] qemu/queue: add some useful QLIST_ and QTAILQ_ macros
Date: Fri, 29 Jan 2021 19:50:24 +0300
Message-Id: <20210129165030.640169-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210129165030.640169-1-vsementsov@virtuozzo.com>
References: <20210129165030.640169-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.152]
X-ClientProxiedBy: AM0PR02CA0001.eurprd02.prod.outlook.com
 (2603:10a6:208:3e::14) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.152) by
 AM0PR02CA0001.eurprd02.prod.outlook.com (2603:10a6:208:3e::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3805.16 via Frontend Transport; Fri, 29 Jan 2021 16:51:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f3c58f20-dc11-4144-6899-08d8c47626fe
X-MS-TrafficTypeDiagnostic: AM6PR08MB3621:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3621E4626011F06088372E30C1B99@AM6PR08MB3621.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:110;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BeIsebOtuclbXDL5TkzTNuJt67ed8IBw60kJP5nFI7yWoDQaYo6nf9hWCsQ02V5rb44DYAGPEzD/WdsTJhBliFaOZGvMtoYPXVHkjcrKnpIS930OOMz+r82u0HEQuU6x4bCpe7a2b5R6EvxT6Yeh2cWBEEXGB63iLd3RzxDs//vrizllQXXFYF14ubEpfV7Yvhs3NLHM/hTYlKIJfA+pR9fBc/C8dXzWHnY7I+dgyFFwRU2en5BEhMjKN3bI948AZj76nMITqcRg+SjKWi3IP1+S6GP8sHPn9QfrAnvnmD9Xh6taDeiMc74DK1he0pyC5gfkhMcRplnTJCRFgh4zdN5jJreDu6cQaqJhxRN8+tqy3fxC+P96ZhlLICqKrb2tcxdUYYdSFMVifURYZfBaomupgJDMgtA+W4sByK5QPQ4pZ1NUGWlTVjBeRmXL8AJjl8UZ708wnLrqvs7d9Ofuuuk6Vx2CmHU48vI5sYaAEA0/xBI9pvbswgXXh1OLTJw0nfC5aeR6NXNQ618tO0ba7w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(396003)(136003)(39840400004)(376002)(66476007)(83380400001)(1076003)(86362001)(8936002)(6486002)(316002)(52116002)(6512007)(66946007)(8676002)(2616005)(2906002)(66556008)(36756003)(4326008)(16526019)(6506007)(26005)(186003)(107886003)(956004)(6916009)(6666004)(5660300002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?t/M2RQhvFuLbg3LiRTZ7zRoOhzq/dEaiICZP3Xq+llqIhAdq2YT6CS5TejLU?=
 =?us-ascii?Q?KNgxSx1a8KzN9E5RQbuDSYo1XgQkioBPLqLdjR0H8FqcRs9V7O6LM2sGNnE5?=
 =?us-ascii?Q?706PzzY0VPYzvqypywFrIOhZechvwXR6qoBzbvDYTETACKxHBFV/Hn7AiWeY?=
 =?us-ascii?Q?noQVT662gFm3cDJqX8gW7wJh6L3tzMtmHclSzdqwSnpOU8yBnJLE0DG/ivFV?=
 =?us-ascii?Q?gyu+W7IxHt6WRTNJ1jpCEnUqmwcm4XJjUjMmyMxmGS1iB2zGVwNbUxeXsZ3C?=
 =?us-ascii?Q?ESmq01U/JtLY/SIttmOZd8ZO0SHVRBKoXNg3uuevbqkz4XYv+Fh19xTJ7DAN?=
 =?us-ascii?Q?49Cbw2QIoYqg22Lg7bMtAnLNbHa+Is3YEAZXeNP475OC+vzZuBMpvT0sUHTH?=
 =?us-ascii?Q?lC07s5fE10W4WkTjFysaQtV+hiGQ0a1UqOy2CZqE3RndP9UDUwUyz694mM2Y?=
 =?us-ascii?Q?4tWGY9lHyr7M2WHaMvnSDKDcnxUepVTf7fo6Ht2qiFEadxw/OunPJpzGLomg?=
 =?us-ascii?Q?6W4NAN7aOU2IcUR+zFR7pqSfRdP0wGuMr/7+CLq19t2AXV21lzy61OId2C5Y?=
 =?us-ascii?Q?4neHdTxnX0LYuzh7nG4sdcs7Q65Fyp6szEcbiu2kQ0QKBHZs394zTulumqo8?=
 =?us-ascii?Q?q7aHDZfH20B7Oo2NT9OKoL3GC4tMSFDA3QVpp03Nc8gQcA9ety+oRxoWQ1Gz?=
 =?us-ascii?Q?RBEYpBbdloOqn64WvYxKES2uso4gjnAuG8ZacBSCl/7cWF4tjbM8Hxk6z6iO?=
 =?us-ascii?Q?LRuToiYUo826t4QB12DUzC7adh01KYKJoIT3op2j30y4S7ho1LXp+lQASGZV?=
 =?us-ascii?Q?z253le+z2/k4fTw0UR6WH4zYvWH1wkynBqUXjW+4BXtKXi43daaLisXoMX8a?=
 =?us-ascii?Q?WEVXgfZKtcQb4zNSeIEi9MHoQP494qjrmYPl+/WE315sLW6UvF2Z+3VSyOWG?=
 =?us-ascii?Q?wpm6zHUA69CNXspySBum3A8PcfvYxDJ6cwydyOaNKgX03ouKmNWHK/H/GA/5?=
 =?us-ascii?Q?PUW4ijb6/DkRFNf8zJB9ictvqrC82eR59vPOZdj3S1i4aI7Pww3SspA8vMsV?=
 =?us-ascii?Q?XcDkuh2i?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3c58f20-dc11-4144-6899-08d8c47626fe
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2021 16:51:41.4836 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vscyH4l1DVCHRJ87QfkR62vA3Dnk/k3qYHd9dsmOmlRP1gym32xETkzgtvtko2IW2wRurn1kDJ4mJcVIE4OdTGo6G0veT94tfFCvYX80Cig=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3621
Received-SPF: pass client-ip=40.107.6.91;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, armbru@redhat.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add QLIST_FOREACH_FUNC_SAFE(), QTAILQ_FOREACH_FUNC_SAFE() and
QTAILQ_POP_HEAD(), to be used in following commit.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/qemu/queue.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/include/qemu/queue.h b/include/qemu/queue.h
index e029e7bf66..03e1fce85f 100644
--- a/include/qemu/queue.h
+++ b/include/qemu/queue.h
@@ -173,6 +173,13 @@ struct {                                                                \
                 (var) && ((next_var) = ((var)->field.le_next), 1);      \
                 (var) = (next_var))
 
+#define QLIST_FOREACH_FUNC_SAFE(head, field, func) do {                 \
+    typeof(*QLIST_FIRST(head)) *qffs_var, *qffs_next_var;               \
+    QLIST_FOREACH_SAFE(qffs_var, (head), field, qffs_next_var) {        \
+        (func)(qffs_var);                                               \
+    }                                                                   \
+} while (/*CONSTCOND*/0)
+
 /*
  * List access methods.
  */
@@ -490,6 +497,13 @@ union {                                                                 \
              (var) && ((prev_var) = QTAILQ_PREV(var, field), 1);        \
              (var) = (prev_var))
 
+#define QTAILQ_FOREACH_FUNC_SAFE(head, field, func) do {                \
+    typeof(*QTAILQ_FIRST(head)) *qffs_var, *qffs_next_var;              \
+    QTAILQ_FOREACH_SAFE(qffs_var, (head), field, qffs_next_var) {       \
+        (func)(qffs_var);                                               \
+    }                                                                   \
+} while (/*CONSTCOND*/0)
+
 /*
  * Tail queue access methods.
  */
-- 
2.29.2


