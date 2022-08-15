Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96512592B26
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Aug 2022 11:16:48 +0200 (CEST)
Received: from localhost ([::1]:41018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNWDE-0001zS-CE
	for lists+qemu-devel@lfdr.de; Mon, 15 Aug 2022 05:16:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oNVzk-0000fY-38; Mon, 15 Aug 2022 05:02:48 -0400
Received: from mail-dbaeur03on2099.outbound.protection.outlook.com
 ([40.107.104.99]:8993 helo=EUR03-DBA-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oNVzi-0000MA-Gc; Mon, 15 Aug 2022 05:02:47 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SMg9jxx03fxGeKCShqiIQNdwjnls8bagJN3OJxCT/wBRAbMc4CSHn48wqVY6y0FIrMBsf9Jy7JFJC7Qls66kOjF2Pa3O8OpqCiZGZGbI3KfZc/CFO27kEo7Y4WaexXsxTVyHlF7IKQX3Qo8g9mwikQUEifxp+0IifYMsXhdAYmrXa9seEM87yvUUbdS4xNo4mEq4giVUxJ3+B6VA2mJOskaDYa+Y4vYYQct4yPa/RjPg9QiS2Y5U0gqBMQjx0drWkO9HCqNQBNg9mXjugQZMkoTpdt1RtXeP9W3viHV1ALXJWg2j873sFX+5RcmcPZaVYn4M5AZuBQjJwkmt6XgoKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S1lzotjwO8r8L2co4V6lN//G6swnZcb/1Gt2FoiQ3y4=;
 b=eAF8XhzXAwSiYQZArAa5Pe2qner9ZWQ8D+ivipmX1KEHgg2zMNU3cEz4f9TAHl5yndV9I9MRoqhoNxKiAbRAHw5EeVIqeZtOTGEnQL/76T00VrNInvUWCG+axaTTHmeR69oEorhK8w/XiM6FdGyXfPCj8jhorGlH0HWvgqpSPByfXBo3QHxWm/hhcaEiP02sYp7UG+Uf5eFuVha84Jp06Yw9JGtCOV7W47bAR2A7sf+nvfQw7gqrHt2m+/5GJvoMs+S8mrXJtBFtBZXL1j11tgUqJH7xxBdXQS6vT7jqkQIlVxgxF5AulKMhJw0Sxhz+jJjmkaP1syyvKLmESpoJKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S1lzotjwO8r8L2co4V6lN//G6swnZcb/1Gt2FoiQ3y4=;
 b=xWtag+4EjJPCqZg0mkKnFnAAWq5bNBN6Jka9THzM6ZXWo1dcmjMtwOTep3VEaVD2SVRVOZI5PV/cDzBueAn6oWsRUUgrGNm2IRoMUge9TiouGd/Skvxbx5lvBtQWQ1CWpcjfO/kAePcpZz9AUlAOqQxJfGzCDiNVu/nRsQXhYobw8WTDijgAKgPy0I9s09r2TcBF9PBh3h5oMrwzYbSvANXrfi5oTh5g2Cf1eC6dksBLDr0kyx682ogFhvhZuh5J57GSB24FAY0CrFmS5m5DsYyn3rYLwfZ/GIARKOSakF+DVxeFud3D4mBRylpOCGO+Bpva3LuPKCrCxIPYFw652g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from DB9PR08MB7100.eurprd08.prod.outlook.com (2603:10a6:10:2c6::19)
 by PA4PR08MB6032.eurprd08.prod.outlook.com (2603:10a6:102:e4::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Mon, 15 Aug
 2022 09:02:31 +0000
Received: from DB9PR08MB7100.eurprd08.prod.outlook.com
 ([fe80::4033:4b6e:d42c:349c]) by DB9PR08MB7100.eurprd08.prod.outlook.com
 ([fe80::4033:4b6e:d42c:349c%9]) with mapi id 15.20.5504.028; Mon, 15 Aug 2022
 09:02:31 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v3 8/8] parallels: Replace qemu_co_mutex_lock by
 WITH_QEMU_LOCK_GUARD
Date: Mon, 15 Aug 2022 11:02:16 +0200
Message-Id: <20220815090216.1818622-9-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220815090216.1818622-1-alexander.ivanov@virtuozzo.com>
References: <20220815090216.1818622-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0044.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::7) To DB9PR08MB7100.eurprd08.prod.outlook.com
 (2603:10a6:10:2c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 00becbe1-2634-409b-336f-08da7e9ce31c
X-MS-TrafficTypeDiagnostic: PA4PR08MB6032:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BlqmvSSMzpzqsJSJcg/PyFx6+RWBdzHbMEnBTqeGRnjPf9XN8sZNqviQg6VWupBVmZ9g9zZ5zRMi88Ty/kf3WMQL4worK9N33X+F+ox3tD+tPRsJltNZzx5sDFTUhnalDUj2NsLHInje0GYL0O2GvfibRjFj2gIJZT98WPaxB9CH2qmqxFV3SGMokTTxdTHaHvtNoNhm3orGL/ig3iHZitK7pr/GSDQqrlOx0qEcksXlmmspXlQPqE+ZmhDvvV009r2Q+M6ku/mhhqhpQqbDqV5np55SGuNRX71IT1D5/f5rK7g9WbFx9g+ueCTcrbxU1s/roCi4u6K7q330D/ZCtLTIXqP4kZoD1M+Q9PdWF4yYjgwOXGrMXSkSWKC5QxaldE4M/8GeuptoNR3BkbPdZU4qfIJ6D7EHc7ikeYMDcloI/0lJh+mYmjKQv8nfAMjNRbSINX1h4Nb5PF6aqS5UOmRKkNUbLldqQ5MMKHFsK4MWscD1E8j0KgOqHy+0aTsF98tZ6Sg8XLCCsr8bBCSpYYhdd2Zq/lPY30ttUfumpGu0nT+R7m3HaSupnaKmD5UOgTBHxdtDsgWR0kIMl1W39DtYvP3w6dl3B79N+ZR7GNhcX7qfNks/gI8N5adfeaW6n89UcTxP+/2czeUWV7pGydjqk45ivhSW/LoaC/EiJ8SqMsD5fhau78x85YcSVXD9V3kf/0YReNf12t3G9p1OGaB7vKIE21fha9292lLaP7m+TditBxxsGDBgIwNuKqSkRml+Yw9YdFDJfn/1mwrpO4dlz5WuJxUR93wPHi7PBesGJSaxittYAKNz5ZpEUCVl
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR08MB7100.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(376002)(39840400004)(136003)(346002)(396003)(83380400001)(86362001)(2616005)(41300700001)(36756003)(6506007)(26005)(6512007)(6666004)(1076003)(4326008)(52116002)(186003)(316002)(6486002)(478600001)(66946007)(2906002)(66476007)(66556008)(6916009)(38100700002)(5660300002)(44832011)(8676002)(38350700002)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2u7k2yPu4xuhwZQUNG/REmPl6NY01I9Q3yRqjxHgkaV6JmpIujjCVF2iuQ4C?=
 =?us-ascii?Q?Y2JW03PCheWz16SrItJ2wbLJkJqobB+LR6m4waTPAlR40y9o44jJAZmxxym9?=
 =?us-ascii?Q?FaPxbeJTT6IgoW+KBONQS6bCpa/fX6HMlN/Y3b1E+n9PkgXA4UIngYyrNbyA?=
 =?us-ascii?Q?Kj7QozUpxu90iHisORyjYlQKAgRLFSwLs+FGHn9V8hHGX8PRms5koZrcXomX?=
 =?us-ascii?Q?Ggc1i5Yt0t5EHsG5GIe/FjrdCXqCVVxieffzO9bXgBF779Fc219upemUpO7R?=
 =?us-ascii?Q?YwTW/MGPwRflJTH0DQm4L9+HTAhS5W9kHOeB9LKL9wtw6KKs23dy0E/mcXwW?=
 =?us-ascii?Q?NjpS4Fu2kPsM/EpkH5nPrsMFCBP9+PwUaWg2RKoVJ6RNyyJAIuxC8ObJU6OP?=
 =?us-ascii?Q?2fwnx4z2zQlpY5E44DVfSXhRclLpBr9PCuXPL3OtaqHOJMufyXghlJEXX/z4?=
 =?us-ascii?Q?hrIQ3XodPz7xzekm5fARgtzcMhwGs2eMdLqOWPrE56JhadvPDQEtEtyemtVT?=
 =?us-ascii?Q?WlKV/HsL9wx+mlfHuZZctbdtIwOWz4l685Fn7G2p8VLWfkDiidVwRXUYalaN?=
 =?us-ascii?Q?4HgY7xPr535ooyT+yeJsuh+lf2Q96r/1ZFYc+e7SIbzW0XBxCmxifHqjHN3h?=
 =?us-ascii?Q?/G2PvAnE44lEc80Vuw7fgw+jwPMSv+vIbCq9gjdkgB7pj0O4tRScxdIsi7GL?=
 =?us-ascii?Q?uIvxA9BR1aH0cRMudkt9UtD+b7hBbIyrF8yiFGbtuZheQ/SlRkP6O/2xYXa3?=
 =?us-ascii?Q?nVhF2a0+XQlObiDeY/qJVdT+02yyJSMQKTrZbShNJiuLGTAYQv1MYuo8Mupr?=
 =?us-ascii?Q?SVTLnXLd4uj51y81AvVwbfABvu6OnHVuIQE1DQyo8tQBqM8wkkAqv2yq25yZ?=
 =?us-ascii?Q?w2jjuCzYvuwlgNvkKHdI4sueGZFMPA6mqAdNYty3lERoqitFTcZA/4SYE/32?=
 =?us-ascii?Q?ELuLzLfm/ftGTgtRg0Tbstpwt/8zAXiJCTwHdWPXtI5h7XBSWZbnT+zD2t0Z?=
 =?us-ascii?Q?WLtjDNh3dbGxiEDOMRguq2FvJSdtb5gbWnO6/obpkkmY3Uq7HDBmaSGbM2vE?=
 =?us-ascii?Q?lEZYePDCM7ocEJXPVH/yEyJXuW5tm5fD19K2NMQUyAJg4UgHMPaSpXSHJ09f?=
 =?us-ascii?Q?Zvb+/7UmJH7Glj/1xckbzHVvf9//8XgaaYaLIGFYDRqRhmpYN4h9+MSmM5c/?=
 =?us-ascii?Q?tDnbZbiVisRxKMmh7gar5SftIXbFUK25wZQrlZACwNCvl663KQbWhbwJHmb3?=
 =?us-ascii?Q?WSx0C4kKra4NVn4SPDXKN8IsXlZyVZvrxPbN4WWDIqMjtjBT2EEFf46tM5h+?=
 =?us-ascii?Q?wLPFQvIqOegwCWB7rfgfSFeR+Y2wCrjSHzORZyjJq+Go4AY4pRBFsQ6vM8xK?=
 =?us-ascii?Q?sX1QzJpD8VlyGTl+0f9Cbka4ekr3qQ6EALssClTmSCYeUIC6Sd/xg0UOOU40?=
 =?us-ascii?Q?dkMsorB84MMKUHu5dLAAI9TYyDyLjPB0f+wkPN77Sbs6p1CEViLuUqLet5zb?=
 =?us-ascii?Q?vwmeuBCMqbmoljYS8nQlGhO619A35J1VJ1R/B6zlQ9DMloGnuJl2emRtOSIh?=
 =?us-ascii?Q?rmBmNEWyR8zpzmD8aCq8N7Nf8MtrZbQEE7RPiQSIPBWmLvC4RWILprB/7TsB?=
 =?us-ascii?Q?0/mRG72G8sE82FpL4GW9gTI=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00becbe1-2634-409b-336f-08da7e9ce31c
X-MS-Exchange-CrossTenant-AuthSource: DB9PR08MB7100.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2022 09:02:31.7557 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JgFNnSOeHXySyO7IhHCWkA4ZebNhEyrlaZ/vNLQdhS6RRa2Nv8p+TGRAcGNhetcRwlQjrLTVVp7ooN57rGCWbNe5wIZbx3MBolwRejJf6k0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6032
Received-SPF: pass client-ip=40.107.104.99;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR03-DBA-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Replace the way we use mutex in parallels_co_check() for simplier
and less error prone code.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
---
v2: Fix an incorrect usage of WITH_QEMU_LOCK_GUARD.
v3: Fix commit message.

 block/parallels.c | 26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/block/parallels.c b/block/parallels.c
index d0364182bb..e124a8bb7d 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -553,24 +553,22 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
     BDRVParallelsState *s = bs->opaque;
     int ret;
 
-    qemu_co_mutex_lock(&s->lock);
+    WITH_QEMU_LOCK_GUARD(&s->lock) {
+        parallels_check_unclean(bs, res, fix);
 
-    parallels_check_unclean(bs, res, fix);
+        ret = parallels_check_outside_image(bs, res, fix);
+        if (ret < 0) {
+            return ret;
+        }
 
-    ret = parallels_check_outside_image(bs, res, fix);
-    if (ret < 0) {
-        goto out;
-    }
-
-    ret = parallels_check_leak(bs, res, fix);
-    if (ret < 0) {
-        goto out;
-    }
+        ret = parallels_check_leak(bs, res, fix);
+        if (ret < 0) {
+            return ret;
+        }
 
-    parallels_collect_statistics(bs, res, fix);
+        parallels_collect_statistics(bs, res, fix);
 
-out:
-    qemu_co_mutex_unlock(&s->lock);
+    }
 
     ret = bdrv_co_flush(bs);
     if (ret < 0) {
-- 
2.34.1


