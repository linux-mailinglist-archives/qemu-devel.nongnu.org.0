Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C9604131E4
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 12:41:39 +0200 (CEST)
Received: from localhost ([::1]:47732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSdDW-00039K-3U
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 06:41:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mScta-0001Z7-N6; Tue, 21 Sep 2021 06:21:02 -0400
Received: from mail-eopbgr150090.outbound.protection.outlook.com
 ([40.107.15.90]:45198 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mSctY-0002Rp-MQ; Tue, 21 Sep 2021 06:21:02 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OVPUL1L2hM6BIPsL9YGib2uhnuJGy1m/HnHyujW2hLB+1j2T8SmUmSc+l0u0PpEXFtth1l8UzOG+t4fMHAZI1r4N0ANDI6YmiABgZeMfTnToXpWmSflYm4KfKHDwZiULu3WyxqYkZlGn31u3tbsEdTjeEp1BpMeh2SCbhidYNTi+3GOT6KhsUYZJ1YheCct2aja39STKHsfBa/+UcFLOjeXoMD6J4sKLpHHMYIhA94YnMgQoACGkBe/ah3k1eFhjKEztbPcOqxknDU/aQ9G6caYN3C3w5lUf0zrcgHHrROBWjMHDePY8KcJXuNZx1XzWqiu2PUC5epz1amWClE8T0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=Q8sBAJiPB3seyvv/kNpVsfzY0FjTRbwCyERWd1+yC+0=;
 b=KaLa29TGbM4qkuHBc0nmXIPnpZzph61zqtZcXL3svC4e6hnteKTkhIB4YXNSSOvVD3GSUmaE4iDD0m9aCyeSFBwilEbK7e/dSss9+7ZuzG2TbuWp4Xi632SiDisnv0oC4otUjLMHOrpJ1FRgVHmPIdpG3KwzvJ7mW9Dl62HSHOT4WGIPtEl1n/4HVojePiWIU0DwGAbfcphpntosPf5083XnECq/UwbRh01boJClw+ZhY68OPiD/so66eTewzb+Lw9FfjNC9qIHqGUttG8dxSPVG6LbkbDIajgoxR/FKZ0k4Q+EsJo6cZwtNbduaAR5DaGJhPQ4oiv6I166Jugdjhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q8sBAJiPB3seyvv/kNpVsfzY0FjTRbwCyERWd1+yC+0=;
 b=fvHbamnT00hlLbTgVA1/J8VoT9N5orAh+RzLbNjhxB1ET4lZDFINWI/Im7ka4WxnpDCR2m0ZW/+VQQ0zxXT0kwTE3MUmtJC0jA/wMUCAQjQu8lcj1dUzOLZHgtbHRkm8+3AbEEB6D0jajWk6giozOlHBRU/JkoHAcK2P4fwmrE8=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB5944.eurprd08.prod.outlook.com (2603:10a6:20b:297::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Tue, 21 Sep
 2021 10:20:44 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4544.013; Tue, 21 Sep 2021
 10:20:44 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, kwolf@redhat.com,
 hreitz@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 Eric Blake <eblake@redhat.com>
Subject: [PULL 09/12] mirror: Check job_is_cancelled() earlier
Date: Tue, 21 Sep 2021 13:20:14 +0300
Message-Id: <20210921102017.273679-10-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210921102017.273679-1-vsementsov@virtuozzo.com>
References: <20210921102017.273679-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR06CA0127.eurprd06.prod.outlook.com
 (2603:10a6:7:16::14) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
Received: from localhost.localdomain (185.215.60.205) by
 HE1PR06CA0127.eurprd06.prod.outlook.com (2603:10a6:7:16::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.16 via Frontend Transport; Tue, 21 Sep 2021 10:20:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c7639a2f-fb96-41a3-6676-08d97ce9789c
X-MS-TrafficTypeDiagnostic: AS8PR08MB5944:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB5944D1C1DDB29951244ED923C1A19@AS8PR08MB5944.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:660;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FkBw20Un9ytTM3nlqgHw3c86ib4IFPMQnEQNkCGz39NmbRbJ5pLhSmTdPzkFVaO84dVeBxdREkhlM1RyJGUiDHHKyJhaAmeRQd8B1ixM2Ro2B97PbAEdpbx7JnlpLK9Tq8t6kY+mzXTHu5cMl3YuZSUAIBDBavauPbxGZMDG9itSq28ZabchzWb3eZYCh+1IcLUX1A8lB7LC9dV8wlCzEIXayvKebBq4D9RMfhiEA+MgSf/VVk3uL58NmnJXM3xrEU09MPnjq+o7MuGDlTcJ+vwI9I9JJ3a/EdZLiM2kmeJL7xcgpUxwZbMG0lrWLqG9/IoKamMgP5WJ2jsZAvQKCMPM+6/b4DTAUi5t9eNjspHC6gteA3qSoDSFo6P38zSX4Uc4e+gMbf078Fv5pFhc0uU+LhrSY3+Q3Il+i6gyfeuE/UZjV4jru4u0kWuGosNZBrfv3Uv9fYjh8mvZaxPZVhi0fIqSrBR9WiLyaSDJXeKgJRPKXHIBVhWcLXswpdTFXpc57eG1b8D2POwjpDpifAaAmVe/blU2mjhtgsFEIi4XAJL013liQzAaEFWzHHzKE2ZESeY86wvE4ECBQGKWgz4TI5alrTeVDAF+9EOxO5Xvib5nQ+ICk+Kgr7A4OsAlecMf55ZbtEferaqX4ocFxFWcgHwASfuLZtPxx9sum6KyutALfKo4Mp/W7Xsh0rIcbcj3vj2A4QloZTG3w3tqK/N4DQYMCWifKutfoOJ00M29S5omqemM2m3/5rOvYCS7kwvsyeodd5pptRmMd2+PVrZpzTFWuHiU5wHozGzCKzU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8676002)(6512007)(83380400001)(86362001)(1076003)(8936002)(6916009)(186003)(38350700002)(316002)(52116002)(508600001)(66476007)(6666004)(66556008)(6506007)(2906002)(26005)(36756003)(66946007)(966005)(4326008)(6486002)(2616005)(956004)(38100700002)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MOlEbrfXr43TIcu/DCmvtsjvaeaw5HXkeyVnDoL+cO9pNuGuFoiUZ9uNuZlI?=
 =?us-ascii?Q?JKZghFfFV884dtYNzgE0/Ai92IkP5LpcQ+jg/1Cz25S+rcLctTjqRlBsVQ6Z?=
 =?us-ascii?Q?SMg2Jv2df9KjT2y4At6cb9bFekudFvtkN/6Q+MfV/fLR4Ri4hsGW5W/7jKfi?=
 =?us-ascii?Q?Qdis7Df/O2kzRwOwQMm3ZXrp9+TCYXbXVoUa4uAEqcgcTTlsGYXTYP840sL0?=
 =?us-ascii?Q?gDmGiHdYHQ6q9/aw7n0ef1LqFqDLrr61NPfqr+/aKMFi1R4zY/qaY7Djfjh/?=
 =?us-ascii?Q?440fTvXROEhH9oHtEnhkOwzZiHq3MJvy9dE6MOD7ATPkG1NFq+7r2GO3xGf/?=
 =?us-ascii?Q?AN81ZxhGPzAOGmTZsJfFKLtcb77N2kMz+pQXWta30QSMMVodozaprvJmi1eI?=
 =?us-ascii?Q?VYj1xbYxoZdmNVhC17pAGj3JFNWBanFiN9AD2oMjJYvHOCxQ4GZSpCdD9bdC?=
 =?us-ascii?Q?DiSvhLML4EtKUu4vRRPOpAXP9pUKBihmHMjdgu0KLO86ELnZgvZqQ5Lcmntl?=
 =?us-ascii?Q?jtoAmPe5oKOBPDRV/Ca9q6FvSLQxI383mRQ+PVrskcd65HaiOEDAF7Bmq/CV?=
 =?us-ascii?Q?DzkU1/64zD4M90HoYqNKzi/dp7RFp7TGAQxeAt/U4N7CnwL40OEzWDB4qUDf?=
 =?us-ascii?Q?Z+ijEF/l+l9wIBVBYKbNN4NW/NYoB4FhMUST75uK5uz5fwA4GfuR/i0B83Ms?=
 =?us-ascii?Q?4QQ8nLmFmj+vFsSg4878p6vIMM45UqIkpNefhmbciKo+lmc+3ippGNtqrbrJ?=
 =?us-ascii?Q?ejB4k2dQQ1Uzb1z7FCJi0No5ZEgyDiDf8x3KW/4eTRULt4BUNAX2DepV0Zjg?=
 =?us-ascii?Q?CtjPaCHFnWluFUbCoVY4rJSLwSXpED2obHmCn6kNpo2ygsylUyYRtrmxpOUT?=
 =?us-ascii?Q?xEdWP4MAFScnDmJTRACG/Ah4kMDmrXYfIsA6ijzJqfxr85fHGqYitotBopQz?=
 =?us-ascii?Q?ivysI4VEC5915N6mnRmNq+6LhEgHKMSar7TBm8YJn0ezMIMVZg5a7NfPq35s?=
 =?us-ascii?Q?jIKCBtP0hZ0HdJvOQrlSG5FlNy7ZWQb2/cSULd9uvxQa8bfj8ZHWWeVNEu42?=
 =?us-ascii?Q?nrslpT6PyUgEvrVGekBI57K+z624TrvFMnO+bKdEwR8mczwElXxKczY1Qrft?=
 =?us-ascii?Q?jjdBF8edSWAvmoj7VKIKeWpV8/iQ1GpzWq9aP/dKe/SavMnRyXtC/T7YpqaV?=
 =?us-ascii?Q?QXMZdWTNLj9ee4ZGfAIM155P4RHeBwVIkL7Hhg0kyNybA+/AVWNFyX/Fd7e/?=
 =?us-ascii?Q?JamJDz7a247BiP4Qm15vox8IcJN/B8xvNCwbfJ9HWxX892lSSu8l8womEFPQ?=
 =?us-ascii?Q?fTRbWoI7lgoJDabTFcV61tc6?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7639a2f-fb96-41a3-6676-08d97ce9789c
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2021 10:20:44.5014 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ryN3uKzL8HTIETuBCtPoLvA39zq2e9H8Qq9O398J5jO4DTGiaAQPyx/YdSQWStmYtoKQUAzS2IKzCMAoeM7m5rSNwd0GUONkGM+YMmOLLDU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5944
Received-SPF: pass client-ip=40.107.15.90;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-DB5-obe.outbound.protection.outlook.com
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

From: Hanna Reitz <hreitz@redhat.com>

We must check whether the job is force-cancelled early in our main loop,
most importantly before any `continue` statement.  For example, we used
to have `continue`s before our current checking location that are
triggered by `mirror_flush()` failing.  So, if `mirror_flush()` kept
failing, force-cancelling the job would not terminate it.

Jobs can be cancelled while they yield, and once they are
(force-cancelled), they should not generate new I/O requests.
Therefore, we should put the check after the last yield before
mirror_iteration() is invoked.

Buglink: https://gitlab.com/qemu-project/qemu/-/issues/462
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20210907124245.143492-10-hreitz@redhat.com>
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/mirror.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/block/mirror.c b/block/mirror.c
index cfebe50845..1dbf648311 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -1007,6 +1007,11 @@ static int coroutine_fn mirror_run(Job *job, Error **errp)
 
         job_pause_point(&s->common.job);
 
+        if (job_is_cancelled(&s->common.job)) {
+            ret = 0;
+            goto immediate_exit;
+        }
+
         cnt = bdrv_get_dirty_count(s->dirty_bitmap);
         /* cnt is the number of dirty bytes remaining and s->bytes_in_flight is
          * the number of bytes currently being processed; together those are
@@ -1085,8 +1090,6 @@ static int coroutine_fn mirror_run(Job *job, Error **errp)
             break;
         }
 
-        ret = 0;
-
         if (job_is_ready(&s->common.job) && !should_complete) {
             delay_ns = (s->in_flight == 0 &&
                         cnt == 0 ? BLOCK_JOB_SLICE_TIME : 0);
@@ -1094,9 +1097,6 @@ static int coroutine_fn mirror_run(Job *job, Error **errp)
         trace_mirror_before_sleep(s, cnt, job_is_ready(&s->common.job),
                                   delay_ns);
         job_sleep_ns(&s->common.job, delay_ns);
-        if (job_is_cancelled(&s->common.job)) {
-            break;
-        }
         s->last_pause_ns = qemu_clock_get_ns(QEMU_CLOCK_REALTIME);
     }
 
-- 
2.29.2


