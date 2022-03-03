Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03EBD4CC6B5
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 21:01:04 +0100 (CET)
Received: from localhost ([::1]:54438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPrdG-0000tU-RD
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 15:01:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nPrNG-00046q-MU; Thu, 03 Mar 2022 14:44:31 -0500
Received: from [2a01:111:f400:7d00::710] (port=7585
 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nPrNE-0004Xj-Up; Thu, 03 Mar 2022 14:44:30 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jrUn+rUMT27NNDLM2pi1zP2F8ZsgCQPZL0Syv9141bN/rcVvzMy+hSK7zzqnu3053GOAkbUDnAc/0XR2sMhjgopjCz/hMRBQMSK7UAEJIGcrwdNlYj1Fj+XLxs1vv2Baw0qx62Mcye0nIRonHHSFKM6IyDji4nOgtXIU/4kR/NKf/RkNAQza80hJVrlTG9LnkpX7gWP/XEVW27Qd+3NgFBXlx4SCECdFXV4JdKWJ+Dl53K732ug4BzAUkYGVXi+en0/ICEtp5/EvlYexJxHGq1RwY8Y1xWiuwJfm0XZYG8y0Hmcaccg2kebYxUwTMYOt/Com34LHVSt0cleN28WfzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gaYYTHt+J27XJ8iUeKAJ7iE9wB98iZR1jC6tKdNEJ4o=;
 b=ni/AluKp6zqKBQeQ5b4ZOKrCjmcJnVcUjH7zWvKgD2SgL2QC+0CCnbmewY+nw8WBrruoIHPhOwfUib9MKUFv0cg9hTi182pTAuf16FWjs84hf5DDVzz+b4QpiRCDri4f8JUTtx+A1L06G29+BF9ClwW+lfNDk3oqZFwwgm+6D4Guz2jP48vXDdH0S8Lpe9czNn26YOksu6H8oasis94a8KRoVVRFWA/kU6LKtNps2Q4AU6swWdFszh4KHAF2tjuOUn0gJCEkRFwWdzxIc2IY6OY9YG/wtxLQbZ/rqXwJHMoBFbc035AoxNiNi5Zk57FRvf+LbFCKBg0JeZh8aQV6Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gaYYTHt+J27XJ8iUeKAJ7iE9wB98iZR1jC6tKdNEJ4o=;
 b=R2mXzVKM7aYgyQmZ6Akw6fQjkEQWqIIpoVlP3TIsGN3zzowkH21V88HH6BXkFQcoXOXhbYS+GoGiVzO1VJkSE6Hr3WaxcVF8PwlnhkD7CfA6cdPTUzQf52wPXWq6EE08oaG87Gfx84Eh221i4SySACnjoQyDgR1EIVGF+dsAi4s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by VE1PR08MB4736.eurprd08.prod.outlook.com (2603:10a6:802:a6::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.26; Thu, 3 Mar
 2022 19:44:15 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4545:8e0c:19c7:2a6d]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4545:8e0c:19c7:2a6d%5]) with mapi id 15.20.5038.014; Thu, 3 Mar 2022
 19:44:15 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, fam@euphon.net,
 stefanha@redhat.com, eblake@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com
Subject: [PATCH v6 14/16] iotests.py: add qemu_io_pipe_and_status()
Date: Thu,  3 Mar 2022 20:43:47 +0100
Message-Id: <20220303194349.2304213-15-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220303194349.2304213-1-vsementsov@virtuozzo.com>
References: <20220303194349.2304213-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VE1PR03CA0038.eurprd03.prod.outlook.com
 (2603:10a6:803:118::27) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d7d6eead-3f51-4942-3203-08d9fd4e32fd
X-MS-TrafficTypeDiagnostic: VE1PR08MB4736:EE_
X-Microsoft-Antispam-PRVS: <VE1PR08MB473681040E99602D99FCF0A7C1049@VE1PR08MB4736.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PoRF2Cnuk/CB2deOL+yZTIkD10TNuHCjF3l53DsTky/xc6SM3UAeN7tUZzW9r171YyK82EFfuxseMgTVFgU6UHW51cSlj2EJwPwmMha9kE9xtctbUg5BETvhLq66etHyl1mu//8PVBJck18EcsV+8aq55ksYwCpGvbN5Jbq4UxyRHni39pTdAYbj1RSWG2rBMgUFOam083PtBCfSyQyNDN2QXsRhcFovmuYT0XIcOgXzykgImODm1PtRq5pKXjIksEPw7aRTPl7UQE4vyIhmFttjcdkpTbERkVJnfR0rZx6GKnVo0wGbiNpP7n2EPB1KfQU4gDjduRhksFo+gafH8JaiHO+FQIJxS/YnzsrpMCg09O6thTE/mRurv1fMTjB0eh9no+TpdpmDdGW1htDp4fbqw4TJtcpHCdK1qoa4YOBhmXgt9bk6oUsMjLc3ABDK3iaWg3SMB4bDIsFYEEhV86erRG0HsmqL1yDzxlu8zQKCYuTrNzI+yNzU3HUtE6H+bVi4GdH2kv+c2Y80CjGb0WycC8JbRoKblg9pg1QZCLNmHkFHFOtPI7WN48HUoPTw0BcC+Jj9pwpaq92r4zX0aC65D8ZVTzn/SvUc4XCuTTvMT92vs8jRjyK01lKGtVT+oVn1jtz7/zu3h/XxDRujFl68CjbDLSReqWW95jwpRnk3ci5m4BuYVmuS1tG2CJ5hqwXG7WpTgyEnsnBTR8haUw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6506007)(6512007)(26005)(6486002)(6666004)(186003)(1076003)(2616005)(316002)(6916009)(508600001)(36756003)(4326008)(8676002)(66476007)(66556008)(66946007)(4744005)(86362001)(8936002)(5660300002)(52116002)(38100700002)(2906002)(38350700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wZbto/kR5ta+iip+2Pj9cNR8NEIM2FrN1/9qZVTWyNzGAkKnXpO8DjhKpsRE?=
 =?us-ascii?Q?48ROUbMXh6/yO57RNbNYVeLiDQHVMjXiNFXNs5HpdY2OO0Ud3AEbfD/ZfCE1?=
 =?us-ascii?Q?PSFAwqVPNVJ048nIswsrmauyJBnadKLbLzn7UHzGNnb6Q+s79kTbhCGEJBPA?=
 =?us-ascii?Q?SSnrXLq1Hh+72jOZHCh1edVki/N4Z6/kp6BxlM4x6oXtqdeyCT9yd+W3vd4b?=
 =?us-ascii?Q?zeCyxS52uFcElujtM6Dz6r8JdIwq1C9V0lI9AEmoODKYuZENfDrJ6XoxgodR?=
 =?us-ascii?Q?5EqsgG9+NuONJdZUrF1G44t8Wi/+ef47o/Ugt+JKcHSpct7H02XWkLh+Cw6b?=
 =?us-ascii?Q?JvOFWmuNQ005B3hv7F5WcGrgY0CRwfZH27bamAqAm9E9gC7rL7htgJ9VIYrD?=
 =?us-ascii?Q?X/U4nQ1W5brUxsUG37/vHJy1Ts8ivHNWWcs7jy5Tldz0Fpf1dQRmsvh8h16p?=
 =?us-ascii?Q?OE+IZmSqddBiI23n52H/MmohP0ZeevW1i7C+3BzUktiUJQp6XeIvd0tOBUyr?=
 =?us-ascii?Q?J+JgX31e6LA0ISTxnksOGBCAJbOdlwIgY9nIiQS9D3o0soETRAPyZnee5Lm6?=
 =?us-ascii?Q?byzAivy4BVQSyzyPtbjei7JMZQEONmU3b/aAVrpR70D+oTyI+HJHHlv0qk8k?=
 =?us-ascii?Q?LCP1B00VP0SqkXX1FvDi/V1DUt/jzvT70weyZY4ux8Rx6wdbKm/4zLi+9Wmx?=
 =?us-ascii?Q?miFEzv3cLtoPcs4jWz64mMZoeQVDVsKiueuGhb15WeqhRcOUVWpbB+qjOHJc?=
 =?us-ascii?Q?aqADk5Ee95qEvhqA6xMziz016HKZrathaSXhCOYpLvjHfu3ad3d/0sd9Kdgi?=
 =?us-ascii?Q?cUFOOYg7JgBZeaBuri/J/dN1h4F6KdzWRw0bs/s8R5cZJ0OnLl3l7bB5c+oW?=
 =?us-ascii?Q?MmRssfu7NpC4hFUcPNVk+agDxrslh6pTMMQP/4RcX2MDtl3yrOgXcImX1Rov?=
 =?us-ascii?Q?pXtCKpHgoKkDiClrChSpNfekEfRbJQ8/IAhRo62gFWr5VhL5oreaAHvXT6QQ?=
 =?us-ascii?Q?2s2uRjjSUdddlzMQOPEcYZ7eKcuQgeKnoQYI4L90L6kOw3ZHHJDMHoPjotbC?=
 =?us-ascii?Q?HuV9KQaAsbJn/zkh49Kts1WAk6utN5Kd3lmfx7PqKCNYxxyql+c/t7eEWCCP?=
 =?us-ascii?Q?nZb77WDjqONt1UagRWBzX0tPXVQWwO8IW7Kk0cifDWHKtfZYDxt68lgg5q2Y?=
 =?us-ascii?Q?RMuJcztG7dQi0rLvSC3UK+SOAflUwDInXaPTcz/VlfiOtGOcl1pdCR7tr0uo?=
 =?us-ascii?Q?S3tcOJGqY7qv1Km9YSijejJDe0Q4d3chSZaZUfxDNixINGhBVO95Cm8092Ak?=
 =?us-ascii?Q?8+mw32rQnIs9A1a/qV1Mz7N4k7ilqQOss8CzqZJ3ZsF5jajdlbBuE/QUq+Dn?=
 =?us-ascii?Q?AktbIcTBLUtrRYGSZF5UcPhaVRUtsSPK0RZfDfVwrG0AELR/SkXoPnJsu/2B?=
 =?us-ascii?Q?U4RYlZUtHy2ifSpPfmpmF3R+fAa8EYQb9Ncyg9C/dlGE4PXtT5YoKVW9IE+3?=
 =?us-ascii?Q?TYjNNWw9ckZTE6h5wm7oL38zfh59qvmGjcO1dTlutS3/aF+Ht+1vMPP040ES?=
 =?us-ascii?Q?yXJx4e/SPWApCUen7QqPy42GbksdRdp8Jf11VWYtFEEBWlTEVGnFqpKhS6EX?=
 =?us-ascii?Q?OxfHxE6Df+ale2Pl0dcqi4BQ2TRo82c3MSBOwe+AkeN6FSf2SKaqwLwEBsoW?=
 =?us-ascii?Q?NNpEBA=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7d6eead-3f51-4942-3203-08d9fd4e32fd
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 19:44:15.5772 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sCNqgfPFFm+C0THrWhs8dWm6ZNqPLcg9Bgnh3REna+13SUMtCW6ViL21fskXrx259/BKCr4F4K629rducoGRHaPdsP743w2uOyYPv/MUmbE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4736
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:7d00::710
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:7d00::710;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Add helper that returns both status and output, to be used in the
following commit

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/iotests.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 6ba65eb1ff..bb071e5669 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -278,6 +278,9 @@ def qemu_io(*args):
     '''Run qemu-io and return the stdout data'''
     return qemu_tool_pipe_and_status('qemu-io', qemu_io_wrap_args(args))[0]
 
+def qemu_io_pipe_and_status(*args):
+    return qemu_tool_pipe_and_status('qemu-io', qemu_io_wrap_args(args))
+
 def qemu_io_log(*args):
     result = qemu_io(*args)
     log(result, filters=[filter_testfiles, filter_qemu_io])
-- 
2.31.1


