Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE0C416653
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 22:03:34 +0200 (CEST)
Received: from localhost ([::1]:43912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTUwP-00046g-UR
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 16:03:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mTUoc-0003vd-FT
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 15:55:31 -0400
Received: from mail-db8eur05on2123.outbound.protection.outlook.com
 ([40.107.20.123]:59503 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mTUoa-0002vM-Vd
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 15:55:30 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ImT1NrFa3CEzZGiRvm9vl+7zrO7OM4AxH31shvg1OzPfi6smLtcLXnYRqGBh2uFR4mdrGE8mlucNbK/3doiBXIKA91cbMpImZSRK1HYvGWGw5hDBZE+T21Ei9G467Bst5txBxJlNhFUeuVdwVD0WGjQaYimL3fKNeeCc2kKzPgVas5FgE9ACl2F9bGAQbHiC8Ikx0rgfBPVBgLEXZIGuDNa7KnXuQcasQMEvr//26IF6G4LBq6nFCpcsBWweDXH/Zh5rRVid6JcmZmAOcqH96X77CW1uXzPzam9j6WmWzgxDtMtijDK7dZMEUkiSIGG9xhcuiRQ05/pPkYbbtzDJIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=UptxbLLQFZX4H8r4gf4KL+mSelEaRTjOoGu8qB5pQkE=;
 b=ODN2rrzx5IhZ6JRB8ZukUy/W5/cEIbSkYnWhZuCEmcX7oCLn53C5rnAKQhD2s/yjIFpOApDnmIlJaIauPll0n+zSWrJ05wKXUIeK6EFihU8i5/MPBSKo7I4Il07yZs/A5nm+r5okkUyaKCKbj4G4Gm+o9PaNO66LXaKdYudaytDgpTWVGAwpz1OyOpj1TP/CI/R9frHIMzab9ox3X9DOH+CkfDVgOmKhnTfF55zOooTL6aaerR9b6Alaler4nxCVbAm6uxSpcbtuMSp/TBJX3Z19C2AIAF8cHHtjX8lQjnGhhoWVnGdgkvuDWeYmYoZMY6rMAjb+4mOcBBObsZgx3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UptxbLLQFZX4H8r4gf4KL+mSelEaRTjOoGu8qB5pQkE=;
 b=aihX4qUaJA2JMF6HJ9QzvHlHdWEBmmfDJ0I5bjbCE7ZydB+YqBwAphlZRR5C3gVy89GGxcz3W6eM+AIs74gTV+RmH3Ojxuimmk/AEu7XY266Rkg3XFSO1FGXAT2dtJ0gT4RpKsf2QC04aKu7UgghebJqhvllUTqk6Af4irNJhBI=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3224.eurprd08.prod.outlook.com (2603:10a6:209:47::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.18; Thu, 23 Sep
 2021 19:55:10 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4544.015; Thu, 23 Sep 2021
 19:55:10 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, pbonzini@redhat.com, michael.roth@amd.com,
 armbru@redhat.com, vsementsov@virtuozzo.com, den@openvz.org
Subject: [PATCH 4/5] util/qemu-option: make qemu_opt_del_all() function public
Date: Thu, 23 Sep 2021 22:54:50 +0300
Message-Id: <20210923195451.714796-5-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210923195451.714796-1-vsementsov@virtuozzo.com>
References: <20210923195451.714796-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1P18901CA0018.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:3:8b::28) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
Received: from localhost.localdomain (185.215.60.205) by
 HE1P18901CA0018.EURP189.PROD.OUTLOOK.COM (2603:10a6:3:8b::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.14 via Frontend Transport; Thu, 23 Sep 2021 19:55:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7d18a7ff-29c9-4381-2b90-08d97ecc0cf0
X-MS-TrafficTypeDiagnostic: AM6PR08MB3224:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB32243442269A62F1B7243E02C1A39@AM6PR08MB3224.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:397;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DFDrHbxRj+Omey4tf1qBWyU7f8cyHKzGr07CrTWYFF7gSkMfuxPZeyOnhKoE49jHGZBAkpmVUlxPQ0+kCh0DXBOgVm9ilPjGyQjuvmUqveTwNPCfT6LikP80yQNRgJVTYr26SJaT/CZbHtxK8jeccm8OahclY4JpQdPDMWKJmbt4itilXlQfwcEeRFKWGrsbjQC57mCq4aWIpNHm349F8Auv15DgBYJW+deilyKmDQ3z6fo8yqplWRyxxZdbMCorlkfh2VrBJi+wSFNZldFl/bMgUMN8uwSXVRJDTsm5oQiXVpKxILynQ4cQj/Ep8rwisvp0OI7iDhXl2/vYx67egj0iGJ7Fa4fAon749LBEwGouITgduUntuJNYZ39m4tLDw2TSuYTOnh6CphuTrHIGOqEIomWzxSnlXWalizHl/WmOc/IRO18d6nsMcNieGxP4sFCAEBUqexfTj/rN/knOw/eTeCmqZPfhC+8Q+RsYLTkbWBXwlILidx0jVryiG517ghKSuj0FirTJYrUQYizVUi6UqiLZ0clhuQnFsCF2Pj+bVkib4Fw/3gQzQgePChGLQO3VAplWYNWVwINNml9Gq2xm2w3JmhQCL63hGwES9fnx2T/vAkIg0DK4mR5lm9vsuDSzzTvwE2LxojOoUqQY6+0sqnAB013ICuDX5fw99k46K0mPUkOCCgX92LaVo6giOA2wCULpDo3Sti/dEJkdJA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6506007)(508600001)(6486002)(5660300002)(38350700002)(38100700002)(86362001)(52116002)(36756003)(6666004)(66476007)(186003)(66946007)(66556008)(316002)(8676002)(8936002)(107886003)(956004)(2616005)(26005)(83380400001)(1076003)(6512007)(2906002)(4326008)(6916009);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eCFSRNJGsIApabxQeiw7s8WqgIAavInzRP91FveEnxra8epuHxBIelJFlhoo?=
 =?us-ascii?Q?/GkQRsmJA+sqVhHf0UWePHZhGfeLuOkJ3oW/DOcW6sWLpL/zrdtI0wCX0hsR?=
 =?us-ascii?Q?MqZZedgX4j8/RbPKHBXg+YX5LtQ+ukOoHED4GrR8Jz1CKca6qA2m1RCevC0Y?=
 =?us-ascii?Q?4KWVg9Maol7AaHaNPsYNmD9hoj5oBL59lUKRYgcIosz0St78Q1KfJNSka8BU?=
 =?us-ascii?Q?+sew9D4NwKXwbOUVV+n0QRnAyZxnhRXvg3mG27OMlSpnQTdCttrq6ySdu5r2?=
 =?us-ascii?Q?6YT9pTTMeh7k41FNjVm9O0FqcHNSumdUTTh+fwl061QzhWrxy8z9eRt1pVD6?=
 =?us-ascii?Q?3+As8r2i6Ne7OWP2b4Er3ocGujdDp48SxUSHXr6z8VO19P7CCUfgBIT1Rsce?=
 =?us-ascii?Q?PfScZo48se+4OOAMxJlBeq3BxJ4AdTlD4hON3Sb1EtTz8uTyuGrotw7kDTnb?=
 =?us-ascii?Q?l3fHAj/Fg+oP6Shg5MDqCdgvNuJ541o8vUvJcDDO9NOMHzUmcnTgbZzPu5Zi?=
 =?us-ascii?Q?UJXio6ASEwKhxe3/DqkWatMAPMQ/lqWBMqf+tCkqFlXwgLTIrQ202i/lLFfF?=
 =?us-ascii?Q?SNGolcl7PZy5fkubpLpYMtfE4JHdDxr9Uwao/0w/GNadpg8aGPoh/7P3Bwje?=
 =?us-ascii?Q?jrXEiZRkbXemflcgyY3q8uBK54uuoteUwBf3kIHA5sRun6/DRMb5lqSzFTak?=
 =?us-ascii?Q?MDqbj+qpHrCi1AskogFsP6I8APS/ZexY/yeSjQ0Q66pUpWYw5wrSdL+0YnLL?=
 =?us-ascii?Q?53kNCemxju29+Ad4nuBuVAPvSJEGcnz+0AN+et8tng8Mdi4/PgJ1xqIb4VdH?=
 =?us-ascii?Q?/Qzw94p1DeOXCJRlyARKqxKq75vsdBYcMlGJY5NS4NuAAWZerd61PiOzqH8t?=
 =?us-ascii?Q?2D+wPI7srS8htjoe/HQOOh3geqr1w1kqsovG9Y4buBZrjHpOrhFV/AYWtswn?=
 =?us-ascii?Q?eKVllQaO0G7InEPv52gsk1Gdl8KiBqpAcAhzQhaHfd7idGUo+e90k8UGDALV?=
 =?us-ascii?Q?xSl1rGuyahpiR2+IKKWNud9j1agCZckNiuVqv1OqQgl0EzSiTRcxQNXKS5E6?=
 =?us-ascii?Q?1eoxtL5WxmPrd7nYBMTUVA/7xkUTM2/5EMDa0Pf58/XXKUMIg6PmiwnMGqA4?=
 =?us-ascii?Q?WnqnjvqfIs07SWLkud/x1VfaCfaxUyq4CU39Cavd7vqanu4s/lKnpBMPnnbU?=
 =?us-ascii?Q?Ic25PhUPSGhy6bvYPgNpLZ76IgC8BIV6NLNzFkme1w2SsTuGTsr5GRUbizHd?=
 =?us-ascii?Q?S+kI+Bxhf6FKa2WIAvkw3b3COrnXeGEcukkL29IQ9jYVKw5nHGNxHCFJ6oW3?=
 =?us-ascii?Q?XOmHrG83i/6Lcfi6RCayFHq1?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d18a7ff-29c9-4381-2b90-08d97ecc0cf0
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 19:55:10.6713 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sk3lM7eKawZGlir22S9JQKeaeog/RiJDs+apvdYgY0S8/syKE0hNOD577JAG72RRYf4X+5MP2PNjpQO4Yv8srqInCgTCiuMDfCnALMB/mRg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3224
Received-SPF: pass client-ip=40.107.20.123;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

To be used in the following commit.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/qemu/option.h | 1 +
 util/qemu-option.c    | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/qemu/option.h b/include/qemu/option.h
index 306bf07575..4ba88f2632 100644
--- a/include/qemu/option.h
+++ b/include/qemu/option.h
@@ -71,6 +71,7 @@ struct QemuOptsList {
 
 const char *qemu_opt_get(QemuOpts *opts, const char *name);
 char *qemu_opt_get_del(QemuOpts *opts, const char *name);
+void qemu_opt_del_all(QemuOpts *opts, const char *name);
 /**
  * qemu_opt_has_help_opt:
  * @opts: options to search for a help request
diff --git a/util/qemu-option.c b/util/qemu-option.c
index 61cb4a97bd..2c75cc2e46 100644
--- a/util/qemu-option.c
+++ b/util/qemu-option.c
@@ -244,7 +244,7 @@ static void qemu_opt_del(QemuOpt *opt)
 /* qemu_opt_set allows many settings for the same option.
  * This function deletes all settings for an option.
  */
-static void qemu_opt_del_all(QemuOpts *opts, const char *name)
+void qemu_opt_del_all(QemuOpts *opts, const char *name)
 {
     QemuOpt *opt, *next_opt;
 
-- 
2.29.2


