Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A32D2EFFB4
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Jan 2021 14:06:12 +0100 (CET)
Received: from localhost ([::1]:57074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyDwZ-0004cc-IU
	for lists+qemu-devel@lfdr.de; Sat, 09 Jan 2021 08:06:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kyDpa-0006J9-W1; Sat, 09 Jan 2021 07:58:59 -0500
Received: from mail-am6eur05on2129.outbound.protection.outlook.com
 ([40.107.22.129]:46432 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kyDpZ-0003fN-86; Sat, 09 Jan 2021 07:58:58 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=it6mf2tNYdcFWmbSg1ZoZTW+phr8rt3KLjLk2v0g4/f0ncQG401ZVzp5CDCEtBEURn90dHU6+2EQWNR5cLuphO50eFpSGIZ3QZJrQmAM24rc/vS5t9lekWfxmqQ50cO1PQaOG1LyLFQCD1u2ZENaIdnAh3i9eywaC2HxhIxYJkpHtqV3pbImW3YDzYQdu8kbW2W5yXHugcoJJxHEmpkmbgjgPXMtr5lEcjEaSonNqovHonP4OE+JTgAVghx1TmUR3VAkY2J34oDNZ/PjrNuATt2+ZlpAWmkSvvKOpIIWwBJ2DWnJOU3FdUU/UhePFXVcD/UmiBIQmCmr7qlzcU1qJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ri/gAVBqCFMbPnfGitHImcXgSuKzBCYqOqV/VUfQisU=;
 b=exfCdEv0ZW1N7m371IpG7jBhCEDPDBqCKcFHldarGMyTe+ES41vTfWIXaV2m+CY6vPrgRN0ZyRrQRVFLcOsfnxJmv91nhgDz6Tt9KQKmERvw1q0kY98Es5cEQBAApKUDQ+HUP6qUI8GOGm8LQPG62bMn5RpsuHDuZ7b/x2rJenZ+G2oGKwqBjC3DdIt1S5y9jbOJ8NbvGigATyJMGjRHec86ts1/tWz4zWTjDg65lqQohn5SSzwA6PV5kTeJfttMs5z4AfCUE/4VMN8s7NI0nI9bfw22PAj9HCUatvFDFyZow4msJzwvTO/i0PaLb6HYfR501+CxkppKEumQijkXtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ri/gAVBqCFMbPnfGitHImcXgSuKzBCYqOqV/VUfQisU=;
 b=vHRfvlrPQ/b/fWLsQ6l5JX4woZTI/Nh5yLjSTnU99IOc84R11ckR0s5mxtxrf6L+v5VFlNtxlQmdQr/GWv2lYLlSRnQ4A2ZC7f/bWUAKXk456/wn6VIB4/0YHHOeUbLchl/BErt6XU0NG4fqV7k8tlpWHuBUp8tIqFtbu0xlVII=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0802MB2418.eurprd08.prod.outlook.com (2603:10a6:203:9f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Sat, 9 Jan
 2021 12:58:48 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%7]) with mapi id 15.20.3742.011; Sat, 9 Jan 2021
 12:58:48 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v5 06/14] block/mirror: drop extra error propagation in
 commit_active_start()
Date: Sat,  9 Jan 2021 15:58:03 +0300
Message-Id: <20210109125811.209870-7-vsementsov@virtuozzo.com>
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
 15.20.3742.6 via Frontend Transport; Sat, 9 Jan 2021 12:58:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 628e4602-6cf5-4975-474b-08d8b49e4e0e
X-MS-TrafficTypeDiagnostic: AM5PR0802MB2418:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0802MB24181A2FFE1C5E61416001D6C1AD0@AM5PR0802MB2418.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:268;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SoBLKXhzh0EyLUypJiVNzDMnCJYRGNksfaTC0+IBobpvJxoEJcqf2kZpxMg2uZSIBWI9tmkfq2nTQ9BaoHQZI4iMHMDap8xAiNOhFE9yhKDjXzJ8yHRWBNN1wjRNES2s8227SXpNFCvMhZfEIlyqIXNXqQNyBFnfrR0DE10QpzbVoAwVf5AgFsfGirgRGko3peb5HROUbbVL+uAqCxGlh+Bvo0ry5LEYsnKNUMnV+uj4vXvsg4EwF7TYuI7K99LSwtkwb45v9+SoU0PAuG+fgUIOn7oTUAfPIJe9SKZmAzkkVmmFMQohkBkabFyRWLB3nao57ByeFscZdk6z/knA8TIZZHijBoEhoPkPqTXBg6yWR2hwAiLqJJZHz4SfhDExDRyburE+tBfK4t7YOoP66g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(346002)(396003)(376002)(39840400004)(956004)(2616005)(66946007)(478600001)(8676002)(5660300002)(66476007)(66556008)(6916009)(83380400001)(52116002)(2906002)(6666004)(8936002)(1076003)(6506007)(316002)(26005)(4326008)(186003)(16526019)(7416002)(36756003)(6512007)(6486002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?IdXfsK5IIHh9opo6CwHObd3YcKqZDZB7nDsbW71cOLjrfDr3a/J9x5q4ge5p?=
 =?us-ascii?Q?DfTMYORA8SR/rAcEP9qtLXY3vi+oMsoBzuqmDqxuolxAtwfBzVhAlJjIDVK2?=
 =?us-ascii?Q?axg9YN32J03hwmvtk4zT2Qx9jEHE6kiuF3wLDFjmnBl9rJSc+23INu3V/gIk?=
 =?us-ascii?Q?x4REpfJdyF5zyZ4W1hixrXoWKE7U4A6s15or+EW6Qj2vy0kAmWW74VBHONf0?=
 =?us-ascii?Q?1D9RlamYRM9Rcwsru8reFfE1Qp8xqopNfbt6PcRMbMeUOFwbTSTMPvy/hZkI?=
 =?us-ascii?Q?z+xlYK/OvzEagIlx5KMtmORzQGxhHNu+UXcr5BT6Gb5xdP4FBGXn6luYo0jL?=
 =?us-ascii?Q?Pldti/7hH99ebRMyxr/LanHI+OhMrmry7Eo8oe4H6pLuNRanxQKfZ4YvTduJ?=
 =?us-ascii?Q?10VPeSiwJPEoPceHg/DooS3bBIN9kKX4TWK4BJ7YH0WvnY/I59tHwieJxMNQ?=
 =?us-ascii?Q?iPrGHgPrrGfrjnfxYqPRslxOgg6NTL95eYR4BKZB4HZ4+RlUpS32Pd5QKPvw?=
 =?us-ascii?Q?3nyh64WbHh5zz1+HHhErd39AVQK5kF3pZ2zbf31AtT3Cm3iU0O0Co8G8U5tj?=
 =?us-ascii?Q?Ro8rt4j3z/2T8UntdcP4al+OEhYHvRgUzi+xtxZgcGPQ1m0EQ6bJkcnm/BU5?=
 =?us-ascii?Q?VrrMJa0lKDdPOdgB00hhR8c5SMwQ4NCqK/OkknkTneX1fcE2+dIHrin2mdH+?=
 =?us-ascii?Q?UKIsx3CvIIDS1xAMLE05WiaPNu4CCWZU/qKDFbtYw7Cz1QZYMj2kRdj9+EFz?=
 =?us-ascii?Q?L6vDAI0nuZ8zb+VgO5t/kauS7WuVGaGOdvPulxG9C2UTzagjvHcVLHJwMU2p?=
 =?us-ascii?Q?5X9TbUfSjAjNp9A3bruw1qkgTgt60Ca6N3teOcsieQgIkKu6Q6DH8wVKWmg+?=
 =?us-ascii?Q?N6YU5wGb4HPyxXyG3NGf0xH1PV6TrqZSVDFSYUI2ispv2aV/ual5xm39yxfw?=
 =?us-ascii?Q?qoNNtzJ0aKyzn20eCkZ0whukjaslPiLaQsV/IDsFYdBv+XupTlM4Tg6OcGjX?=
 =?us-ascii?Q?YEf3?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2021 12:58:47.8952 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: 628e4602-6cf5-4975-474b-08d8b49e4e0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ou9Xf4rFNoOGJqUC39gi4+LEjzmmAg5+N9NFtyx8p9g7I4vXhx+4/W+MsUieaowqRYckPi5pdfqbK/2kWk93kQP1wMY7cobl0xf0jbbUs7U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2418
Received-SPF: pass client-ip=40.107.22.129;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, berto@igalia.com,
 pavel.dovgaluk@ispras.ru, qemu-devel@nongnu.org, armbru@redhat.com,
 Greg Kurz <groug@kaod.org>, stefanha@redhat.com, pbonzini@redhat.com,
 mreitz@redhat.com, jsnow@redhat.com, ari@tuxera.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let's check return value of mirror_start_job to check for failure
instead of local_err.

Rename ret to job, as ret is usually integer variable.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
Reviewed-by: Alberto Garcia <berto@igalia.com>
---
 block/mirror.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/block/mirror.c b/block/mirror.c
index fad2701938..b7b5686a57 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -1851,8 +1851,7 @@ BlockJob *commit_active_start(const char *job_id, BlockDriverState *bs,
                               bool auto_complete, Error **errp)
 {
     bool base_read_only;
-    Error *local_err = NULL;
-    BlockJob *ret;
+    BlockJob *job;
 
     base_read_only = bdrv_is_read_only(base);
 
@@ -1862,19 +1861,18 @@ BlockJob *commit_active_start(const char *job_id, BlockDriverState *bs,
         }
     }
 
-    ret = mirror_start_job(
+    job = mirror_start_job(
                      job_id, bs, creation_flags, base, NULL, speed, 0, 0,
                      MIRROR_LEAVE_BACKING_CHAIN, false,
                      on_error, on_error, true, cb, opaque,
                      &commit_active_job_driver, false, base, auto_complete,
                      filter_node_name, false, MIRROR_COPY_MODE_BACKGROUND,
-                     &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
+                     errp);
+    if (!job) {
         goto error_restore_flags;
     }
 
-    return ret;
+    return job;
 
 error_restore_flags:
     /* ignore error and errp for bdrv_reopen, because we want to propagate
-- 
2.29.2


