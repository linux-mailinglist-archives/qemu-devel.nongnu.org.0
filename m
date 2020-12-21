Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D522E00D3
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 20:16:08 +0100 (CET)
Received: from localhost ([::1]:60950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krQf9-000090-GH
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 14:16:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1krQWW-0003NN-2X
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 14:07:12 -0500
Received: from mail-eopbgr20090.outbound.protection.outlook.com
 ([40.107.2.90]:62614 helo=EUR02-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1krQWU-0006a3-9E
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 14:07:11 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CSsyiJxk5DdH2R8lX+g9uqGbOctMhT7BPEijtsjBc1RzF2RZZ7UmCNJejmPD+xGM1azHLmaadha04sHeVGfA/N5OoAIWZBrn1s9k5I9EK7GdMKo9i69aV1r3FpTrtS0nG50bP8VEFuCn03tWne3lh75C4uaDuSxPpDE39pxmQ0P4kck0oKinimWNowNSvXIkqA+Gs5YU+7KkuW8GXnhT1tmMb4scPhxjYrqYAAVDMLi71qQw+0kjDyMYK032G58KOEKUkSKidwRXpUny8Jk6a9fi6Jhz/romojMHGhomC+HBfp8XsGJIGS/5fUCfLDm0ubdnxSJkO6/2CiWxZAtLcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pii+Km3azXOH6i7te3wloObtkCxotV1dcnczxvWWNT0=;
 b=BROl8D3lSnUOjPNTkIvQYtbNyCuO7CoeE9qAGO7JUU8kWPb9+PAWtY5wEIu9YuNjGxIq2Wa9Qpf+T8D9dNcgVBv7UrXke98QjHj71GhjR/6Vj4y8wcztEWNRUQTaBeGO98SOz516WUmjLoVycMs+CEh+ibCxsU76ptV82PGncS05dTqYp6VJXivyzgwSYZ+/g98jprpbJbdRGOELK2Cy2M1hpGyo7riyLpLaPCaUy3lsjBZ2BYAkHAyUdUufS1Cuowe/A/5MgB6Sp8D+LN4oEDejN/PRgjku8sUEygGTO+inZNKKM006sVHcuxBZzIUj94ZPb15o2XY6iFQM0DyPSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pii+Km3azXOH6i7te3wloObtkCxotV1dcnczxvWWNT0=;
 b=nnzoG7KMwq0Um2FSEI4jM3FREAySPWRDyi3BccFou4/68ttO6ALTx7+ErPXA45ZJcM9T6QZFdlWRlNerMSoldLXYEYosQhyKnN5HO9H1eztO5NzDtD4NNXPmwqJma/wHeSZzFxPNSD1wRZd02S0g0RPhmjMmgS2OWzGiICwPIQ8=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1652.eurprd08.prod.outlook.com (2603:10a6:203:3c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.30; Mon, 21 Dec
 2020 19:06:36 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3676.033; Mon, 21 Dec 2020
 19:06:36 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/5] net/tap: net_init_tap_one(): fix net-client leak on
 failure path
Date: Mon, 21 Dec 2020 22:06:09 +0300
Message-Id: <20201221190609.93768-6-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201221190609.93768-1-vsementsov@virtuozzo.com>
References: <20201221190609.93768-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.92]
X-ClientProxiedBy: AM0PR02CA0173.eurprd02.prod.outlook.com
 (2603:10a6:20b:28e::10) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.92) by
 AM0PR02CA0173.eurprd02.prod.outlook.com (2603:10a6:20b:28e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.28 via Frontend
 Transport; Mon, 21 Dec 2020 19:06:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dc465360-b82d-4fa4-1e41-08d8a5e389ec
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1652:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB1652345110DE59FAB3A1B0BEC1C00@AM5PR0801MB1652.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:324;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xWF5aiA/AfftuWEMfsa0ZmkG7+T45jDPcRpbFGABl2Xr0QlAV6YCr0Zts1tUOgHZ2eODQDhk4wNlilzhO3JOZnwiR7sS0X2eXpANeRLV2+P1zvLUxEHVMaBEqv2pubOXtiWGaUtcQ67e0VCX4OsmHTSuB4Q3Yl49lzQAhvgkJ9o50lDlqGTWJQrBDcdlhs+ljLZMn9cgbHFDqWNtzmgu1ZueaRPQOcC84JXJJo7j8n6iHcwzuX7q6/BWKS9rpdBBR9GTsTyVkcQhLFRqBIRh2gZ7LBCQfLuy+XHssRB+t9Nlt/9F7O41B5cX/A8TFPV1K1epwz7IRebkgGu/x0OvvN+Bra0e5skKPVznkMBFF+txnWSBJr6cBWGazNANcoUOEFwRHl15GtVHtyU1fcRB7w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39840400004)(396003)(136003)(366004)(376002)(478600001)(186003)(16526019)(6506007)(6486002)(8936002)(8676002)(26005)(2616005)(956004)(1076003)(86362001)(5660300002)(4326008)(66476007)(66556008)(66946007)(107886003)(6512007)(52116002)(2906002)(6916009)(6666004)(83380400001)(36756003)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?7/VAq0mkOd6jqljMAFOK6XiOPo/ihW391lQapxDdJcXjivK0OYyUUgjF3muc?=
 =?us-ascii?Q?Aon/lOcq44urEpTwIMuxEy+HvOK+QqHNvmCCU/nebfNK4kUTKHpp3Vt35TNG?=
 =?us-ascii?Q?xZpW//7tfe+n4kkYbAwg2oiWDKoFYP7Ox6yw4lFQKMQGwyFKjmhA6zFT1iwU?=
 =?us-ascii?Q?ben4ENZ58XnT7ZcJHL/BSSojBeewieVkhakygirNG9yilq0K2L49loSoURz7?=
 =?us-ascii?Q?pmVRbhqOeV5pbnB8TKA2y8s1DusH64yBMD1qdQ5EvA1LwFUbRfg7pPj0bwme?=
 =?us-ascii?Q?pCVaEP/innGP8lRPQJvFbFfSW23q8PFiNvndmedt/r+4xGASboWK04GLPcWL?=
 =?us-ascii?Q?RLg17xbcXJYO5MhfjgpYhCHoy5GaUwXDBdG7f+yxqndcyIUHHm3gT5CCUUtJ?=
 =?us-ascii?Q?sIPDIlG2FK8J5ngX40GuZoxcfeESWITwJahh7jRlIvZOty/3EKZxis6eVkzn?=
 =?us-ascii?Q?/5DFbUBdgtdiZlFtXvBj9UZ+DyLMgsz0wle/tuTKXqNvrFZ2LltcFESu2Bi8?=
 =?us-ascii?Q?QiAzBmXIAJ1rl7rZFGrGtMA4fSN+ujW2cCcbqfzntzaxPjEqKDVcRl+G384e?=
 =?us-ascii?Q?eW071Q7whCNtyn1zSge6RLPNdvsJ9eSpbMdZvkoAivTlyZgZZBwhk5BTK6OY?=
 =?us-ascii?Q?cqT8lqgNKWVNwgC86M8UwgnVDWa10mRxz+0pWyXEabTMXl+l3vLYz/2xMHhT?=
 =?us-ascii?Q?bhwjzrVK8ERnstZz6DXnzlrDQpE1q63TxOvYQNla823Jn4kcZ0635VN0gPQV?=
 =?us-ascii?Q?PnKoufDKKCTlZLHyX0RL9kJor59ly4cuxSDaojErmUuGCaKd73ep/EQ/Pe5M?=
 =?us-ascii?Q?Py0RjJQElEhGHNYO1bp0oITQX/0CqCIs2nJB7K7EG/DbSAJoz0vd3npPvfH0?=
 =?us-ascii?Q?CB6PjL1NYNBYO6TOPS423Iwz6JHjsCdW4QvwI52fJZNTe/Cp+ofMkVL5g8V8?=
 =?us-ascii?Q?wAdZxucCvO/N1dHRn+I9NLR/CoHwZDAOcv4pjZHXaAzaIquGwXAQ1IGsY0HK?=
 =?us-ascii?Q?lJ8v?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2020 19:06:36.1742 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: dc465360-b82d-4fa4-1e41-08d8a5e389ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9wUuswnl1JbsSj5rP77xxpp5Mh/HSuObmj4Dw7EA98rLaeym5nn6PrtZYogOwwPTq//jk42Cp01gQUa/MFlvgsH1lx7Puerf5kq3SpxnvtU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1652
Received-SPF: pass client-ip=40.107.2.90;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-VE1-obe.outbound.protection.outlook.com
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
Cc: den@openvz.org, jasowang@redhat.com, vsementsov@virtuozzo.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

net_tap_fd_init() allocates new NetClientState through
qemu_new_net_client(). We should free it on failure path.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---

Attention: it's an intuitive patch.

I see, that net-client is leaked. May be it's still freed some tricky
way? And I don't understand the whole logic of qemu_del_net_client(),
it's just the only public interface to free net-client I found.

 net/tap.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/net/tap.c b/net/tap.c
index 89ea04862b..ba4c34af3d 100644
--- a/net/tap.c
+++ b/net/tap.c
@@ -711,7 +711,7 @@ static void net_init_tap_one(const NetdevTapOptions *tap, NetClientState *peer,
 
     ret = tap_set_sndbuf(s->fd, tap, errp);
     if (ret < 0) {
-        return;
+        goto fail;
     }
 
     if (tap->has_fd || tap->has_fds) {
@@ -739,13 +739,20 @@ static void net_init_tap_one(const NetdevTapOptions *tap, NetClientState *peer,
         if (ret < 0) {
             if (tap->has_vhostforce && tap->vhostforce) {
                 error_propagate(errp, err);
+                goto fail;
             } else {
                 warn_report_err(err);
             }
         }
     } else if (vhostfdname) {
         error_setg(errp, "vhostfd(s)= is not valid without vhost");
+        goto fail;
     }
+
+    return;
+
+fail:
+    qemu_del_net_client(&s->nc);
 }
 
 static int get_fds(char *str, char *fds[], int max)
-- 
2.28.0


