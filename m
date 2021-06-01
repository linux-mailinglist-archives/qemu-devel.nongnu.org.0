Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC8F3978AA
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 19:04:21 +0200 (CEST)
Received: from localhost ([::1]:33116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo7oS-0005Bh-IW
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 13:04:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lo7bl-0002BG-0k; Tue, 01 Jun 2021 12:51:13 -0400
Received: from mail-am6eur05on2127.outbound.protection.outlook.com
 ([40.107.22.127]:14240 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lo7bf-0002Cd-ML; Tue, 01 Jun 2021 12:51:12 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OtHYUrg4gRkkkzQB42CGqMCdRXY6IF5AlSG7uI2u0DwgzdB7/cYpcbS7a6jy9+ohLhnL08eI5QLsVp3wUyNB3O1D2V5i+doFdIZ19kbBzpH/OugyvkjqBZPGgZgifhxPKgyA3aX4gt5fr4lam2rwvJ6YaqOiZwzGNs5fduTVt5DQby08GWELDsbtXOVGrRZmX0GO6e3HYrVpXsLWz5Pvx3R7zV7+ws0OC/M2ifGlJxJBHQMhUqofeT6m6BbeTsoXk1u6mvqiWrG4Q0T8bsERTa6pFGTR+/GRa/eckGIpncXZxbWKlbp0CMSIBuZwE9NrDfbFDzFfk5bNQ2kqha86bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vFZ2N8HbuZD1E5/sueLbbBtUq4xdCLJaWlsPftjA7no=;
 b=ZRifSf1wlu4BbGLx7X0pKDs21ydEWSMRazMtStVkApZxLyjFjyAHvxUN+km/LitrE7ebbeTraiMqrnmXLtetQrgj2xVh1kNJFpB/cxMzRniq7USNIkoxIVTTKbXJyw8jAJwkTHdqwXvJMhJ8FEncDQu3Fhm7XwsBQUtCsENHtEKBKOHO0nw9mNTgrPk54xBIGvhT40d+5zziwyQ1THmHag7HI5ToLfxx+H8FnttoQCAxYpzp7j91PU1DXDd1N003ldmKySH/trX9nyMROxf75ggH5wIC0lARiUWJ002ptzDdnUXxP3M7kW/ERXCONk5Xb6lPwNPw/Dtcf9oKR0lckA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vFZ2N8HbuZD1E5/sueLbbBtUq4xdCLJaWlsPftjA7no=;
 b=Bm1PgqVsgONK6W6R+dbUMVSVyhJa6kn6tP+wU+X5Rds5gi0wMp66QA8TSyTcy2Lmx5Gj7+D8Lc4TWQvwF0RtlHQuZtQWCuhhETqJxByItkZeMbcD2umA7hCKgznPjECWcOrUs8rjZKkGBTQ15qVo+QI5EBz98Xfp9OwTANhAcoI=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1972.eurprd08.prod.outlook.com (2603:10a6:203:4b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.24; Tue, 1 Jun
 2021 16:50:59 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%7]) with mapi id 15.20.4173.030; Tue, 1 Jun 2021
 16:50:59 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v3 12/35] block/copy-before-write: relax permission
 requirements when no parents
Date: Tue,  1 Jun 2021 19:50:03 +0300
Message-Id: <20210601165026.326877-13-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210601165026.326877-1-vsementsov@virtuozzo.com>
References: <20210601165026.326877-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.210]
X-ClientProxiedBy: HE1P189CA0028.EURP189.PROD.OUTLOOK.COM (2603:10a6:7:53::41)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.210) by
 HE1P189CA0028.EURP189.PROD.OUTLOOK.COM (2603:10a6:7:53::41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.20 via Frontend Transport; Tue, 1 Jun 2021 16:50:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c6f53266-3a66-4b49-4405-08d9251d6ea3
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1972:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB1972FE6386DD016A1B4F181CC13E9@AM5PR0801MB1972.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4dtfI+iR9tt1rNSYt5avr3b8YRWWuIzAwwXIWFKHxrF6OQn6l74a07bijgxFMFxYbjEUXUG4Wo3rTAXbRwcSFmYC10m1wfU7sO9hWfCMQN3Xp2R1k9EGv/Jp/CaZ9KzQE4pyJomEoYS7Blbb3+LA3a/VUIvsZYIRjl/S85BKJXfnlWwhV+u+NB2g6J0ZMaWFifyMB+Eh8U/foBptGlVvbB8wB4R1jiuUfT7H72z56/a8x1yOmfgKAtihPxMs4w/xAcigIykIwK+GZQZYnOP07hK3F9LIF+drsuDiGzSO7Af3oHeYJVv34BMfRCOMuu9ETE1EK0/Kcb6bghVLEdbompk0SHFdt7nhlxY5LZM/rQewSvdMX8u2NrhXNfl1LAkjpgvy6sHWG74wba7vIVsBDYXPSh0RduFvlNeBlizk4afoiNuaVlRFtxeRpT6jl+sR8JBKOlmUj0nuJEO0RaM2fTzvfoZn7EqQqfONdr51vrf9UsXYDXyJeumGkYZhXSa3DmhydckRKBphE32sifkgzn9yKdKvBUfMRCAk7E7aJudDZAbiR5BOtxe0s8FfJGiJ2sk0qoZF+C0TDMjj0x5oyNwVwFYNXJ9GbYmvoxBdWY6EijyrIoQ3AzzrvNF3Mmp4hEM2Dl4E1rv2cOgLs8p/pohZmpDXv66OykKywQ7jY6IHvhs1CVZ8GUxrfCmewwQh
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(376002)(396003)(39840400004)(346002)(52116002)(5660300002)(2906002)(478600001)(26005)(6916009)(1076003)(8936002)(2616005)(6486002)(38100700002)(4326008)(16526019)(186003)(38350700002)(6666004)(316002)(83380400001)(956004)(66556008)(86362001)(66476007)(66946007)(36756003)(6512007)(8676002)(7416002)(6506007)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?yuNYCnHa7+lHd9BP2uKxnGLuIIncS1FMSGi3vJPu5ZcA8eur8ztvifBHwJlO?=
 =?us-ascii?Q?cv13mvdlfCKyoKoEMt3fXRx4Zo+YdH1ZGqA4vlqYHZKq1mKETi85xzMRR24V?=
 =?us-ascii?Q?qTA2fAqW5ZQ2Jm0U3hsnkYtzhKRcBob8rdazrTPewxIQhrkS7/FTARydC+4o?=
 =?us-ascii?Q?iqNLwG8EZtKCrzTFV+ahgBPU/7Alg/Q0mbTwm7ammS5zJNxq6vO6fIITR532?=
 =?us-ascii?Q?PuKfbJEjoCj3N+9XatjVJYFWwrkxMJnA5/CWwmr/iA85z8tyE70zjXBEW56K?=
 =?us-ascii?Q?eIT487aUTR9JRL/RxGnNEmZYYvepinnw9ylcmHrJWVsJClhHXPEh5fGnl1Ma?=
 =?us-ascii?Q?LNvtpkzgvjWMJWr7kt83iGWPIeobCkiJ5qDbNkqZEDOr7ozmmqL25WsXHl5Y?=
 =?us-ascii?Q?cFuDaZQ8YvTe6+T31Ol88NGNMCDPff3KoNZZRdhENMIopcmY7knMEyHn8LbM?=
 =?us-ascii?Q?6TgTrrd1BLduNBCfApmypcD/7QsKN0lqmyGQLmEKTyvoh4TrT26q7rzCOozi?=
 =?us-ascii?Q?pknSPWl3GNga29/GtVKITfRKwYhBDbtpsws4CD/046plS4nNd8lhye4zQcPT?=
 =?us-ascii?Q?Ykism/21Up5qC4LvEP86RHukn1F+2cQc3tAf1RLt8pSFsrp/sRWvaIw1LiGd?=
 =?us-ascii?Q?dYRc+E8oHB5zY7g5Qj6dme/72Til1ghtlqOr13BcwpPu80zm+O8HBZ84PPlK?=
 =?us-ascii?Q?YPo0qenEkk0lv/CtuQWZ3+0RNXFFrnTsKhMwadG3H7ZIIywIw4IkXyalC6er?=
 =?us-ascii?Q?cCMEV3d8DChSDlQ+apbnw+fVu9EmGG0/othAF6KI6WqOC/4TL2BAaEYVNhXs?=
 =?us-ascii?Q?Wrn1ssdvm49Zr5EPghfYt/8kzCwp10tbuLPGXkCq6JYoLEkwJcjSs9jL920w?=
 =?us-ascii?Q?4GPsfc3UBqP2Bwo475qz12tLBjMDZLS1X4ZJDdst08lxZ5LOUzNWyROYM11l?=
 =?us-ascii?Q?PtDItNMTMasvpkkIJFMAoKs26idx2tv/V9BeMHZ+T5nZtFr37e5GcQSDinMR?=
 =?us-ascii?Q?YitaHzMSxHgAKGU890XrDO+AeXc+zylJcZQRodGzBpnVpDH4X/mFEVcd9QF/?=
 =?us-ascii?Q?+3IGxbL1I1KOuYHwrRmkgJVtoFA7UDKAMX3CdOq82HZvb4OpWuORkw6clQAC?=
 =?us-ascii?Q?9lBNzH/halcL/ZF1JuJFXVizv5t/jWz1TWmBNNds7DgT2DJEbRems7ziEqAq?=
 =?us-ascii?Q?QzR8aOn2YHNBSuOp4cQ8mw+5rS9DcoEmFfPkhEFJydw+RQVlZJLsJ6zu53S4?=
 =?us-ascii?Q?X6oZHbjc/YwQe1hFCV7Qd1x40zIm4D1+a6Vr40jFpRgjALjGrXuA7my2/sKl?=
 =?us-ascii?Q?10lrUGEP5pa7FBdBU4/7ETkt?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6f53266-3a66-4b49-4405-08d9251d6ea3
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2021 16:50:59.1124 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0sB6YY6E4yu0aPcycGrhn81pxxo2/ZBxzmcETfIaEgKSMZ7dbiXzw7TBlwX8u/JVpd8brVzSqRttc5I+kZlO6yyQ8tWDOvfVWZAOGoXFHfc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1972
Received-SPF: pass client-ip=40.107.22.127;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FORGED_SPF_HELO=1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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

We are going to publish copy-before-write filter. So, user should be
able to create it with blockdev-add first, specifying both filtered and
target children. And then do blockdev-reopen, to actually insert the
filter where needed.

Currently, filter unshares write permission unconditionally on source
node. It's good, but it will not allow to do blockdev-add. So, let's
relax restrictions when filter doesn't have any parent.

Test output is modified, as now permission conflict happens only when
job creates a blk parent for filter node.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 block/copy-before-write.c  | 8 +++++---
 tests/qemu-iotests/283.out | 2 +-
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index a7996d54db..2a51cc64e4 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -142,10 +142,12 @@ static void cbw_child_perm(BlockDriverState *bs, BdrvChild *c,
         bdrv_default_perms(bs, c, role, reopen_queue,
                            perm, shared, nperm, nshared);
 
-        if (perm & BLK_PERM_WRITE) {
-            *nperm = *nperm | BLK_PERM_CONSISTENT_READ;
+        if (!QLIST_EMPTY(&bs->parents)) {
+            if (perm & BLK_PERM_WRITE) {
+                *nperm = *nperm | BLK_PERM_CONSISTENT_READ;
+            }
+            *nshared &= ~(BLK_PERM_WRITE | BLK_PERM_RESIZE);
         }
-        *nshared &= ~(BLK_PERM_WRITE | BLK_PERM_RESIZE);
     }
 }
 
diff --git a/tests/qemu-iotests/283.out b/tests/qemu-iotests/283.out
index e08f807dab..d5350ce7a7 100644
--- a/tests/qemu-iotests/283.out
+++ b/tests/qemu-iotests/283.out
@@ -5,7 +5,7 @@
 {"execute": "blockdev-add", "arguments": {"driver": "blkdebug", "image": "base", "node-name": "other", "take-child-perms": ["write"]}}
 {"return": {}}
 {"execute": "blockdev-backup", "arguments": {"device": "source", "sync": "full", "target": "target"}}
-{"error": {"class": "GenericError", "desc": "Cannot append copy-before-write filter: Conflicts with use by source as 'image', which does not allow 'write' on base"}}
+{"error": {"class": "GenericError", "desc": "Conflicts with use by source as 'image', which does not allow 'write' on base"}}
 
 === copy-before-write filter should be gone after job-finalize ===
 
-- 
2.29.2


