Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5C946773A
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 13:24:26 +0100 (CET)
Received: from localhost ([::1]:58352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mt7c1-0006Xc-IK
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 07:24:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mt7aX-0004DK-AN; Fri, 03 Dec 2021 07:22:53 -0500
Received: from mail-eopbgr70128.outbound.protection.outlook.com
 ([40.107.7.128]:26637 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mt7aV-00072E-3x; Fri, 03 Dec 2021 07:22:52 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eeMna+TIqNros5oqjoOAGR0QBZVXZQ8G4+Yg6tKbwQd+O76OtBxF6bY1Blfm/b+tm5TsrWI7VYoKXwNr5+9d7g5HuVFUuvxLFUH5kZs27X3uVf53Aw3mnzaUviv2QnPcZir0NooAPJIT8isJcCDm/9mNrL853Ov34Hl0AV6ahZxw80ke49Qzk9SnhOXy4m+mJet6U0FuBIQrC53is3YR+ZC0KSiOI+wgokgeScF3xKogjbPRS8T4x1kuNY79+Kh4EDZgTmLRgwbVukLrIwRDbUzU03oq/ip3TS6QUc5zAEx6arj0Qyiw3hVBxaeFbKdFe+ZJuoQU0ovLHAg8RqGi4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/MpwnNDQwWl7fv3CArt/P1dUKhcxpbJwH3bf4J39boo=;
 b=lxTIhFR+tfKm7QhOKrvrGBTRNsn52Yrp2zkhVjpkJkYDjaMqB4nleDi2o//qxYf4nIFuSc7l/l7v+K5KSsj8MzUkAl6ZQm+gy6n+d32KfYng17+zv0CsWRr948CbeO4ZeMDT9QFUm/GI+V0AJo4DFLTy+oXH/D0mtcEZcQ5pcqgw+V1JxZn4NcxuTwwZNo8jKnfX6/F65QqMsgTTvVu1vRl8d/J62O3Gg8OJzINH1lDwU8MW/eTQV+vF4Ct2hZaarBCEP0v6JRUpXj1MMZZuhU36N8HvtZ5DM6q6215Fkz/JbmGIQ1FD5BsNT/+vs/B9iBo+gr7Ejd1eEOYChNyM6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/MpwnNDQwWl7fv3CArt/P1dUKhcxpbJwH3bf4J39boo=;
 b=wZibP+oJkmMoiJcjpBI2WI3HkA5B6WxUwjvpM27lLBrQrzF5tewQ6sWOnTv+Rce6iBK31tZEQxN7KOGWfqIvi0qd65IRY/eqp6/+WJG6nZK7ZYi+8FcCbUZqNZOcoZe75HBTZhLp6vNW53vf6Rkf+OtBsnyBNkTD3VUeVHzZOts=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM4PR0802MB2178.eurprd08.prod.outlook.com (2603:10a6:200:5a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11; Fri, 3 Dec
 2021 12:22:38 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a%7]) with mapi id 15.20.4669.024; Fri, 3 Dec 2021
 12:22:38 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, kwolf@redhat.com,
 jsnow@redhat.com, vsementsov@virtuozzo.com, den@openvz.org
Subject: [PATCH 1/3] iotests/testrunner.py: add doc string for run_test()
Date: Fri,  3 Dec 2021 13:22:21 +0100
Message-Id: <20211203122223.2780098-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211203122223.2780098-1-vsementsov@virtuozzo.com>
References: <20211203122223.2780098-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS9PR06CA0111.eurprd06.prod.outlook.com
 (2603:10a6:20b:465::17) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
Received: from kvm.ch-qa.sw.ru (130.117.225.5) by
 AS9PR06CA0111.eurprd06.prod.outlook.com (2603:10a6:20b:465::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11 via Frontend
 Transport; Fri, 3 Dec 2021 12:22:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e1697a9b-eeb1-4008-b863-08d9b6579847
X-MS-TrafficTypeDiagnostic: AM4PR0802MB2178:
X-Microsoft-Antispam-PRVS: <AM4PR0802MB21782FD06084CFDDC6BBA29EC16A9@AM4PR0802MB2178.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:146;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XHCNk11G6Ear3pDTNpIYH6ztV+PHiI1dKHQTVLprdT8X+pGMqN0ybNb+jHKnaKRVAI2O6Zadda0IUYE3dAxoOk/77hRjAcJ2IQGi+MkDn3yIpW7Nb/gbYE8UWu6g38YxH5ixuNvhyQDKcJBeYQiTUgYicqfbIbXhGcw0J3SqNtYFCTUw3eRUyMaKHOy6erZOiFnighq8RdJZ3b4ym3Gi45K4toOoQk8P/ulbUCTGVmX7FknNceJPCz/quFOJAFJIJPfyoFXRuU+JkS1PmnKHJycsKGlxpAFX8HiiXda55GKoIszcriVOct6tYuqLj5aTUUCBhhgPwq/QzMrrifLmP9tLgJ1OfDuQIgIUG7W8odhPFeFd4FdUIzGbsy1Ec+udrmehuouTIJS5vbE4Uv6k9prsuYl+Uzfj7/pvdTUiGRsztbnb14jFZyEjz/2lfZv0RI0mImPBFwUjBc/OfQJ8AFqfnc1LBSp2yNjH7JmKvPDTFV0FdfF/fwmobzTWiWRh5lhpA4CmWApCzKKPoEHVk+YXJ0gT6W0samJv32znWPErqKEf9+MrRr/Wuag02CneHE4eeKsvOBXMp7e1t+EwzQJ675niOyW5JUk6/0S/DaLMUGKiqQ409znKVyRpXLviuSu40gNCk5FXEypte748vc6iW+66gj0zcF+RGbQtOTn7i9j/iUtmJtR2pdcdHnBiMzReM1C2IJfKxCZdXcIWyg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6916009)(508600001)(2906002)(66946007)(52116002)(6506007)(186003)(5660300002)(8936002)(38100700002)(26005)(6486002)(38350700002)(107886003)(36756003)(316002)(2616005)(1076003)(4326008)(86362001)(6512007)(8676002)(6666004)(956004)(66476007)(66556008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yPBHynRbrzQqwPRtRALjZXXasEz9DXcdGBUy32LOUhgKbm2DsHFkhdYxSQHZ?=
 =?us-ascii?Q?vNUKUXCwOiGoF16gU0f+PRXGRu3O0mFQhYG+PGN2l1gy/uUwNbobKXX0W4+S?=
 =?us-ascii?Q?Froe7L3vrQlBMvuDbajyI1SsZT61JITGS6SFpDS2ThxJO+lerzyGpJycijb6?=
 =?us-ascii?Q?+azUddFqUwtXW+Ts4U6NxSGo4w7fGx9eUDMSoKhuHztnhktYKLgvjzSMXjKk?=
 =?us-ascii?Q?DqAu+EPTCQfaI7xf1vTxOy3Mn/Wy+3pso16NIhzw8unCFle0eOg1eO2ipeeu?=
 =?us-ascii?Q?7vUSqHGSYBccMIdP76RAd3wL0uT/pVJElCxpWJBJnEud8OmYCMb68gUbQ5lb?=
 =?us-ascii?Q?EkVa4bWtjd+qy1N1XlOlmIzMMfGa1EBE5XFqa2Wj1K7X4z4bl2RQgIHU2RcJ?=
 =?us-ascii?Q?EssgcEwW09+U6oLruznjSgY7f5upCWVkHuI3wDBXjPP89HYCld7oAUzsHbyS?=
 =?us-ascii?Q?CL1qe0F0U7xjc+muf6q5z0LgnN5ZUcGShSkmOmy3v7AflgjxeIWnjQ+RHQz+?=
 =?us-ascii?Q?pDbEOwDAnOJJBMckHaxgKVNQTUL8IWjXAtfyrT1GgXtv5i/ThA4rPf7xtoUm?=
 =?us-ascii?Q?AVHwiut/Z8zY0eZmsC7fPTtA3SIbHSPVZrb5oS+crLw310Hx/cnj64IiJB8C?=
 =?us-ascii?Q?KEUIXJr7xRnQpXo5WqH3ddWwEqAIWSovFmzP/Auj55l+TrotAdQJnYp8uaZo?=
 =?us-ascii?Q?WBL6XDhZlfjj4V0X7v6HBoL/o1vZxbo1MjCytsLX6idk2nFyntunTTbIFSrR?=
 =?us-ascii?Q?jTprJUOXQbH9LvVHtJrq9kxMyGEL4yOUxVoQKOhO+mVHwnhukwT13rc/hiMQ?=
 =?us-ascii?Q?U7qz0ob+DZqmkWlmvyb/UmS1SP3LsHABcCRBNdW6J9fuqynNKsfFjLYgiQl7?=
 =?us-ascii?Q?58MM/PtEZE+0fvdid4CPE8iqeaNwDkfP3isxKypAe7OnrCONC5/Eeegxh9Qv?=
 =?us-ascii?Q?iLjwefRhqHPXpP/igIFFefXYonxTXK905IAClCfK03vlpnorO4dBQ8o8jc6l?=
 =?us-ascii?Q?v3sgmyY79/qRt7iYM45QY1BGoBe7aeRUgCejQ5NKjR/3sZsVTVGwzPNJQLgG?=
 =?us-ascii?Q?gx8CYqWxttw4UV54vr1oN1Sb6C+v7Aa4bYoBo4bTKXASo+xD7it104X6VERF?=
 =?us-ascii?Q?OGaJ097FXjIsxF4Yl06n4iq/Ng7gKU4tn9U7FYdR/LwXxY1G1qqyGyTnxeTJ?=
 =?us-ascii?Q?q/yovVdaCzTL2rUMmd6iTe0ikSGe4IKXmlKCtx9jmyDnGSoKDOgJ/HbVKTf7?=
 =?us-ascii?Q?0dnwoqGxWjKcykh+C9Et8Pwgdid2t8wSaQa1deecX7f7aJwXmR53Ap/Zh/1g?=
 =?us-ascii?Q?2F3oBrMeulHJgI+Aj+0+UQqnPAbzi+xlLabehFZi4LhayoZDd2njViQ+q5Gm?=
 =?us-ascii?Q?SwDVOjZlxTyj5f2TWwBIiYKWicBBvtv2t7QpThib4rRTW9F3yQlAAyQ55dcY?=
 =?us-ascii?Q?h5Qab67fdqDRpvR/WQ6d0cXx4Tz93oeEs6KTHOBo0baOTdesGZxBZAgq+4TK?=
 =?us-ascii?Q?jHDz2r8BN2kCbqr2wxcng7jRstA+0vTE4P4pNYm3JBvqA5j7mGq9f+PXcdaB?=
 =?us-ascii?Q?04HW/p0uFu8b922hkAxRL4l8qfZQDteo13ThO42dLosI0qIDmlcPunqkh64g?=
 =?us-ascii?Q?A5ephw4b8hInUmQwpB67fxwS1HfigF8gxzYmsQ8MfNC3UUjR5USIEKAXHnl+?=
 =?us-ascii?Q?iRL37g=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1697a9b-eeb1-4008-b863-08d9b6579847
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2021 12:22:38.8438 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GsngQgYJrxugWW8PyzahRtal50xGt3zoiCMReOHrBi8P3Fn3qsWTGSHC/UawdjRix/iS+tTV+kyDQIk0Yzzz8zapuJi8jpX/cl1ZxfmV4pk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0802MB2178
Received-SPF: pass client-ip=40.107.7.128;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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

We are going to modify these methods and will add more documentation in
further commit. As a preparation add basic documentation.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/testrunner.py | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/tests/qemu-iotests/testrunner.py b/tests/qemu-iotests/testrunner.py
index 0e29c2fddd..fa842252d3 100644
--- a/tests/qemu-iotests/testrunner.py
+++ b/tests/qemu-iotests/testrunner.py
@@ -220,6 +220,12 @@ def find_reference(self, test: str) -> str:
         return f'{test}.out'
 
     def do_run_test(self, test: str) -> TestResult:
+        """
+        Run one test
+
+        :param test: test file path
+        """
+
         f_test = Path(test)
         f_bad = Path(f_test.name + '.out.bad')
         f_notrun = Path(f_test.name + '.notrun')
@@ -287,6 +293,13 @@ def do_run_test(self, test: str) -> TestResult:
 
     def run_test(self, test: str,
                  test_field_width: Optional[int] = None) -> TestResult:
+        """
+        Run one test and print short status
+
+        :param test: test file path
+        :param test_field_width: width for first field of status format
+        """
+
         last_el = self.last_elapsed.get(test)
         start = datetime.datetime.now().strftime('%H:%M:%S')
 
-- 
2.31.1


