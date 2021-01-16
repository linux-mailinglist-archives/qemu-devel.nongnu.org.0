Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F12A2F8F9D
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Jan 2021 23:11:14 +0100 (CET)
Received: from localhost ([::1]:45498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0tmr-0002SJ-7A
	for lists+qemu-devel@lfdr.de; Sat, 16 Jan 2021 17:11:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l0tVF-0004Ry-JB; Sat, 16 Jan 2021 16:53:01 -0500
Received: from mail-vi1eur05on2133.outbound.protection.outlook.com
 ([40.107.21.133]:35449 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l0tVD-0000ae-TR; Sat, 16 Jan 2021 16:53:01 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=adyjTar/zlIxKvnsg0zhPgq6rjPN62bUlb7BI3lTGc4C9pdWlWx9LTex6DJ2OsybESnuSa1HJQhqsLyWC7/4cY7SXBBCAoKKAF7uFmeg1GTRz0FIJtFMzTpWhV+JgkK8NEbR5KgDdiOZnMBdo4nXdqRROzLyxYfsDyZquERIlpMQOhdMShhAtqo8FSGNkaSGQ4+k2Ne/d3EQDGoVr0egJxzlrra1I9WLEOXSYYwhE9kL9cyA7YSUCv+K7oV340DGwKPfSzkqSLRIzi72NV3XFRrUIZM5E+2sM3dp5HalD/ge08BUnVYioeOGRkqC2TaMo8/3bXMhF2SVMJo34klcTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ri/gAVBqCFMbPnfGitHImcXgSuKzBCYqOqV/VUfQisU=;
 b=ZGiZJXd0IAJxfU3w9ZPUo3ihLWZ9PMgFoLQpTbwF+qi3WLvp+sEHyiF78uf/GBYXqNWwr9JJV73XN9ZS7rJDIzCwTG5KoACHX2qVzdfW/VYFIAze65LMGL+lQBUcWkm35H3vLy+dFVyzR/w5oCQ+iuHFHbvfQNCcizvP+okqJlMBvo2k1s3qIcM3NYITPB/cTiA9FvzgvtjRwbTzn3sSwZtxMvpzrhspDp52bneKJBvUDm95EbzH4cR7TuDIGhMAXWova5zXhobIMP5fb6Dowb09rXe2fU63/23ORHMJOvvPudCXzUwlM5T5WzrnvjKFRChMG4F2qqR/6YTaDPFPZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ri/gAVBqCFMbPnfGitHImcXgSuKzBCYqOqV/VUfQisU=;
 b=wm51nS+o3+PR390l+fYR2Z4n6YWtQABXWIGmW1LVF9RTSfM09kHiY1PeCV/OLYxmUs6EgO5V0pSXJr3+B6S6o5x1hZ9F1oMUkSann8CIB2khQbUSUbt8pID18OajL6ybEYUfMqijq2g6ldwlu05MD7CGaxoeeedFtpT/Sl9u4ns=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3542.eurprd08.prod.outlook.com (2603:10a6:20b:4b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.12; Sat, 16 Jan
 2021 21:52:51 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%9]) with mapi id 15.20.3763.013; Sat, 16 Jan 2021
 21:52:51 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v6 06/14] block/mirror: drop extra error propagation in
 commit_active_start()
Date: Sun, 17 Jan 2021 00:52:01 +0300
Message-Id: <20210116215209.823266-7-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210116215209.823266-1-vsementsov@virtuozzo.com>
References: <20210116215209.823266-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.72]
X-ClientProxiedBy: AM9P195CA0006.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:21f::11) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.72) by
 AM9P195CA0006.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:21f::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.10 via Frontend Transport; Sat, 16 Jan 2021 21:52:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 144d7e34-9b9b-408c-b3b5-08d8ba691257
X-MS-TrafficTypeDiagnostic: AM6PR08MB3542:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB35422CF841F707BDF1948581C1A60@AM6PR08MB3542.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:268;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fO0RroudoI5QRTwOgYcjokRzvdf9hCwSbSLviAE+Mn6BGvJjLT5S+IZ1LmCkS2XNeNauelrYAR8SNiixJh8fFFzMdEJfeVVjPLi3mBKFOqVkIymiW+LtzyjTaNbmqePJC02x7fFFSE21jx6cMGyxAy26m1zXFXD7O83tfl4OGT5AB9lPpq10DDdGNel+3e65PT5ccEXc9BX/mxVrzdGXwu7mN/NVG6WEK4B0GfMWOj/Wh2VW/M/tCUrq5MHDULbARvHqRGyZlUop+KBz5FTUH11PCQCoByqt5yrprOHOOrdGIi8L+2NCS7yP3niZP2H746Cp4/hDybOpC5Wc4YIxkGEid224I4fBZU0dG4SZyuB7iOgE5cozLHWAnqoXbWyA0Tc+QD7ZrmHgysvuedfhElaRzA5icI3PYIaNGSFnZectGp+KULzKrhUBHHqXVKhCxdwBLbxPKdSKBIy9NjGju69kVtQ4RkHSsymwBbTW0EbJHO+xyDzP4kYHnF+O3BPuJU+s01+7u2XtG+311K0HbA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39840400004)(376002)(136003)(366004)(396003)(66946007)(66556008)(66476007)(83380400001)(6486002)(26005)(8676002)(8936002)(86362001)(2906002)(16526019)(478600001)(316002)(6506007)(52116002)(186003)(36756003)(6666004)(4326008)(6916009)(6512007)(2616005)(5660300002)(1076003)(7416002)(956004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?35lGoZtlUx6SyFCUumGUSIS0yl33daEzSneGJB8875H8liKeU/CwyZbbw6oE?=
 =?us-ascii?Q?s/jut6aT4k/2weeEKQ9iEc0T9nl/niC1as2ia3tDt1cb8s44xmRI5SN+uidQ?=
 =?us-ascii?Q?twTKrv3AuJHc+6b+sAsuiRbCOX+H9sARe14o5EVARyRtd4b/iqGag5rdKHUc?=
 =?us-ascii?Q?uUeWTDhANYzUKCLkqf7VVkrR4y0RoCyEj5lNGBSWI6WIcpOewY8JJ6xtXQJ9?=
 =?us-ascii?Q?3NtPgoXE/onAf9U4RDxEi8+jJlrZQ2AWi1H8vjaeQDQv0LJEFbSg20IViiyC?=
 =?us-ascii?Q?fDLMOp5qcTU0tRtyxoPXEog9sbSxttExFezcoDBKCIWcY+1xEVVXvmqZRjZ3?=
 =?us-ascii?Q?vcB2iU7WaWZc5XoWtUYNX6tt+08UL73IphRkDVYV3ic6xPs9Pc3KmEwUXVVE?=
 =?us-ascii?Q?CVQXYCaNWbB60QgwJ/nUWjjc68zw/f5SpJhPNKksrzsbS6RlvonHALHK349w?=
 =?us-ascii?Q?+YIUqhHiiv0KBMA7UFRX/o2t817nvfZsGknL1HfAKWijSwaOhbg2OtfgDHiI?=
 =?us-ascii?Q?7znpsjz4A2LCht7mmzYyO9+5vSdwvWbwLgLK6pEAZpmKKZFC8J0iB3u8BwE4?=
 =?us-ascii?Q?sbj9DDx//wg/MjRZHY7ltluu2VMctN9MhQ7EqB3YAkKi7TMhwzpfOGwEoaoT?=
 =?us-ascii?Q?AWsfLe9tw8qeMt/Bt0Ry2UO0vrHHFJrQ/HIqMo/vTuiPblcdND5zT0bnu+kH?=
 =?us-ascii?Q?AQckHoYVqftxxz/elZeG0jO6V6extbzITMv95YJ8bEHS4fzx8FM+93kZ8fZb?=
 =?us-ascii?Q?4hcGNIbb7UOdcKbrTpbBsBnwF2hYbngn11Oz8MLu49OYQFScEjydl7GZ+7vI?=
 =?us-ascii?Q?dgyXCITUK/BaebN8MRq4nLvdemj0SwBwqbk6508vOuY6PymkNCCENs5eIu4p?=
 =?us-ascii?Q?hG0lbNYRuGwbGNUjLBGj2loDM75EaU60WMhTkuwxM9zr8cQJZqLK+fqVJwmd?=
 =?us-ascii?Q?217fBdmuxoulMBPmwVpfRRqxgGilibOKE0vNZQpANS553MEH2CnNfNYYpCem?=
 =?us-ascii?Q?G2Wf?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 144d7e34-9b9b-408c-b3b5-08d8ba691257
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2021 21:52:51.6174 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t6MPBtGKG5ANjh6xc6dXmeUAu5cRUAPx0tOj2UT39mhwYu0jyMD1zBVZChfhwWlpZTxRuDZgST0iCzQLz/K8lkZulK9L2XR5WJ0LT+rk7F8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3542
Received-SPF: pass client-ip=40.107.21.133;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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


