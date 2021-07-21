Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7271E3D0C80
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 12:40:45 +0200 (CEST)
Received: from localhost ([::1]:58730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m69ee-00023h-Bs
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 06:40:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m697u-0008MD-62; Wed, 21 Jul 2021 06:06:54 -0400
Received: from mail-vi1eur05on2135.outbound.protection.outlook.com
 ([40.107.21.135]:17760 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m697s-0002He-H0; Wed, 21 Jul 2021 06:06:53 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CVOw2MJJcCVNkzy9s70bbI8SoTO/fv7ih/GUJ3HtIWPR3caWWVAfXHCDLgYem7kzYqPbWypFsIBsz/Q9RZhpMguFWApb/TyuBOjJJtBZjIAlLD8qP2C1jCfWnaSWoruLnOlxkuNLiJV2eeFWkQt8WneOiw97e9jEIsbN+XnHg4KTxT9RT1xB1v8iOOKFRUmoXtlQhTMNwOjqCaR3vtlelWB1uAGAQQFX5w48U9RtlBpft/oTY1T917vnnETrUyhBxWtR7HCraqi83xM8xLQ4yeNWhQzq36EXes2JgrB9bZ1Yhf73xTdQQB25PDfQmVwPwGQSjO5SjDDU6er/EUS7sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V7B38eMa75IHaXy1CHdobFWRDMprMUUEh7qz2TZeq4M=;
 b=aQ3WMMGVERDYe4F71TZXu0ZfzyljtUvafTNwrOALCUNQEKXBdezkZl88Bp400pnDoZjdZp4+7NHMBEbbbpwGoykAU9bqfUjCNtuZVxz8M7rbTS8jYqRfcGIozyxcLE25yZBHc1UodW7xvm/8QKf2wO1aUqNn8Jp0VRWHjnGS+OTPXzf3kdB1VFT/c4ROjz9QKO0TY1fsgfYR3FBWnI+d3msxIl1VHH11kmJMb+w3UFv7TFrKqs4vYd2AXGhJLpUlr7FQMuKzjZuM6eqUFJph6gHmPrnDcPUn2d7SXNwfBp37O6Be10wVZjg5PLP0WlXxpaffCpJDjrLRccSxpClCCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V7B38eMa75IHaXy1CHdobFWRDMprMUUEh7qz2TZeq4M=;
 b=M/Jnt2tn85Tx6lacX6tO5l9gHRmH4FZzk3Sm2ceKZJc/MajbmGbm2Xm82TC8fh0Dwn1V7ib70t/Vn9UC/qWoHLXCrpS2yhVQCryE7OgzpsourT0cC8mRmBm0BJKI1ZIQDp5L0hdvMnKDBqjK9/QfiWrbYCBZ3meRlmVm6wPz8O4=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.25; Wed, 21 Jul
 2021 10:06:45 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%6]) with mapi id 15.20.4331.034; Wed, 21 Jul 2021
 10:06:45 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v6 25/33] iotests.py: VM: add own __enter__ method
Date: Wed, 21 Jul 2021 13:05:47 +0300
Message-Id: <20210721100555.45594-26-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210721100555.45594-1-vsementsov@virtuozzo.com>
References: <20210721100555.45594-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR0701CA0068.eurprd07.prod.outlook.com
 (2603:10a6:3:64::12) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.211) by
 HE1PR0701CA0068.eurprd07.prod.outlook.com (2603:10a6:3:64::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.12 via Frontend Transport; Wed, 21 Jul 2021 10:06:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fa3ca0d0-779d-42f8-92cd-08d94c2f3ec7
X-MS-TrafficTypeDiagnostic: AM7PR08MB5494:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR08MB54940FCE92C0D6B820181490C1E39@AM7PR08MB5494.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1107;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: D68J9w67zWlb6WEoSTNHqo2Fd1Gq7mUY72Fi2zNhYrp8r55kD4Ib/df3VrzWOt5T4tcJkm7V+ZRjU/1y41HpXA0/Lw3TNhR9WVPQ+xTtQEa6hyfWioaArKMhAHspJRJexlXGXR6Nq0c9XZKzeXIp1Bix0aMLU1Ya6JoXt4jk9SfjXsXf3K+7pX5cK9XMVHIN6kJSp+2HihW3fwp3bqAQ6aLxWdGUJeGJe+9Xw+tTCqSVAxMnOqW2yuY8B8tHdqEpv0/hRJepUjm8pXUPmczIQmh2b0UC+itaqRZLApNRLVoHGaJAImwKftUwLbZa3cbY3AJy4HBGwTHfQAv7D/WaLrCr1tvkz4ulyv6kPMbkNT4RI690lLyhDM6Q2Z2WEeQdv5MI7b2995LgfH7hLFa1l21are+XcTZt+AoPI3XTAm64W1izUDF1MlFdH4Hd2DB+3NZf6C9E34QETwpJTsNt/A6GcONNR+b4NPACakcgnjwRhZh8cv+KX4sbkO4Fy33XVfZ10NXp83Lt0zYslyNhffOw0F2rIPMoYoel7pLcRPDyk+5hiGJsocd2YIOFrkHjbdDVLPufMIA0IYuE5CjQ1wamJuKb3n2Tu5S9Z7xHnwlpfTWKHDA9RqdV9ClBcaX7JtAM2Adv77lvmMaqXe7P3oqbJW9cqH3UUF6ZnS4QSvd6xYbK2LkKUZnEHeH9GCTo2ubuMuLBmpGjvpyytFBbOw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(376002)(366004)(346002)(396003)(136003)(4326008)(36756003)(186003)(8676002)(478600001)(66946007)(86362001)(66476007)(7416002)(8936002)(66556008)(5660300002)(2616005)(956004)(26005)(4744005)(6916009)(52116002)(2906002)(316002)(6486002)(6512007)(6506007)(1076003)(38100700002)(38350700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uWkoPS1dIIaxlw9Ovj2HEuD8Y5H1YGq9NdVFY1UPILkxGzpixcevjuAxHtYo?=
 =?us-ascii?Q?+HK01Pz+hsjqvkSwNz7id/2wXieVw+uHyJka6+uLNHiJSEQuY8+DceaNKU82?=
 =?us-ascii?Q?gnKAxRgp/14V33Goth01m+FQ4/eOa8eN8qnJglopf0PnJKg8a7qKriTLlCXo?=
 =?us-ascii?Q?iWSWyyzGhCCUAaaNzyAmzhKvOopN4FKD30w3TOqDE2RoEqLuajsqOrqJ0IRj?=
 =?us-ascii?Q?xAtI/ghfthwlFGefyWAST80p19ldK/bA6r/GrOjxEKQA77cn3nFoOQH72A6O?=
 =?us-ascii?Q?zHLXKczQ0s7fOqXpNM64thqYE6HPwfcHEoEcjcrGV06LwQyVzCOHkDgQFZLf?=
 =?us-ascii?Q?1jQCzhBaj5SZxL2j3e/HjJ6168EVNVT++Vnx2raXmWNjGTyNtHcC6JU4EaKP?=
 =?us-ascii?Q?rrf7+hviaf5oUMVAqu8rmgiF2F7NcH22KZghQcrY4g0rbhFzDz5f/RN1CSs2?=
 =?us-ascii?Q?1sNme6CdbdUpkPiJAQsvqRtCxNQOhMBEHqE740pd9hBONkaYj94xl44k1S6v?=
 =?us-ascii?Q?lmePs4zb+mWrDZYR1ancR2F10LCwjE1hgxtJ0YdFwwMKL6LvW2yLQnI8Ln51?=
 =?us-ascii?Q?OJzxNiNRprrELplLGMKTUHjqomCknuTCYXY5gwl6Tb+vkwmSWAQ0HatMAYrH?=
 =?us-ascii?Q?1tbrFVw1gvM002MTijxrfTkMXA4aYGjZT+fp5uw5EbDO1Q/jRguOmKY9nw6y?=
 =?us-ascii?Q?MkDjapevZFyNDyKiLbVzgCDn8taLzGTFB+1xNMyw5Z85EjO/QvWudT/8n8Ls?=
 =?us-ascii?Q?/BD8eNZ61vkoH9gysMuTngyyCCTsQNHSTmTS4tNNIciUb19Tl0uCwW6SJl7X?=
 =?us-ascii?Q?RkJ+8XF/0UfBOeLmyiTmBw+FOJ6j7W4lUSb4J0SIn3VdZ5NHALq7NCGDPIh7?=
 =?us-ascii?Q?7AN7g2akET2FydHC5Ctu8PLS6EKpq901xBHuPcLuhT7kdJzoylshkcYKknJp?=
 =?us-ascii?Q?g9pze2a1/K1NEYUaaAi9tmRkXvYDVBbwKMgJbmM80rc2i9+rtJqnZ4UEVR4X?=
 =?us-ascii?Q?AaFuaq6/5aYFV+mJfyvzUZT51cYUXkhAguLHkv9bL5EirpWkEqWit88385gU?=
 =?us-ascii?Q?CimciQYvNbLLVXFFCqFVQVa9dxYSSI9kWawlyLFM7d/lgEydMK2QV11nhZnX?=
 =?us-ascii?Q?iRTKRUUFYu4nj6pb23SxeZecc+Re20E+MCSA5RhxmQgTSzqZyeLhBgMO+I4n?=
 =?us-ascii?Q?Rsf16EyfkxCmZjolpo6KfAvg4Xbkj+PCcahcjoV5cNeUCSztawyIq5rddGLt?=
 =?us-ascii?Q?ksjCQQ/EZvDQYdndlm215IvnhhcVVryMFxpd+FAurcqalcrg738b2LN+zDer?=
 =?us-ascii?Q?6xxzt+UwgewEc0TkjLT0cbWA?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa3ca0d0-779d-42f8-92cd-08d94c2f3ec7
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2021 10:06:45.1460 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6MSIHWvBMk7Dl6EyrsQ9JcvKo6Cp/P0slWnnKxp0nduPlWMoSkGPVMyDxowFAYK7achyQlnnkUsqJa5Bg5q7WocdJikM/qcFVeHjIqPkXN8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5494
Received-SPF: pass client-ip=40.107.21.135;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In superclass __enter__ method is defined with return value type hint
'QEMUMachine'. So, mypy thinks that return value of VM.__enter__ is
QEMUMachine. Let's redefine __enter__ in VM class, to give it correct
type hint.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/iotests.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 89663dac06..025e288ddd 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -568,6 +568,10 @@ def remote_filename(path):
 class VM(qtest.QEMUQtestMachine):
     '''A QEMU VM'''
 
+    # Redefine __enter__ with proper type hint
+    def __enter__(self) -> 'VM':
+        return self
+
     def __init__(self, path_suffix=''):
         name = "qemu%s-%d" % (path_suffix, os.getpid())
         super().__init__(qemu_prog, qemu_opts, name=name,
-- 
2.29.2


