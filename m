Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2559369C2F
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 23:47:25 +0200 (CEST)
Received: from localhost ([::1]:36716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1la3e1-000358-1R
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 17:47:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1la3Xm-0004zM-E3; Fri, 23 Apr 2021 17:40:58 -0400
Received: from mail-eopbgr10127.outbound.protection.outlook.com
 ([40.107.1.127]:4578 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1la3Xk-0002m3-Qt; Fri, 23 Apr 2021 17:40:58 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LTjkmjd9CKbDHH4dCjxDiiH7r+C9/DnwWgVCCI3kObROKuDuqozFkYQpOrHE3vCdaNDryvOaWTyHhdmPn0XxymmM3O/ZnIHaQA+JerZH/G3q3kf/u12CH1fN4WikUjH4FsQ46s9AV117L5UvnJ46C1rvDwyBN0GgnQ/FrHIl0HugKLR3bcat86+vQDc6mCPfLlsELQERT6dDpd2VHx2NVNxaXxjnBIi69GFhDt1qGbpqCGkVmo1l6DTul5aoo7iK/TzgDVENs+MZuGanvzeUEJk9Eiu+lJosZwXC48NCoKDIb2jNwTG+dM5L55n0+JMw2JUp1vja4VArEO37LBCLOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H/+shfLISwkOirf04DiUtMpKyo+BE3BeVeHJm/68kK4=;
 b=S+VCv/CDxeRwFE2ylOCcBjt/cxmT5V1JHCmX1Kt2yc/dPeHyBhY5ucb7KmuIBbjXkD+1TPnI5nEDOV33mYOU4dBCktxcftI2F7Qo7U5v3RP4y/HZV4BCq0+Q3Z84iTdRxgHRaDuk9Ey9SgD25NaAsnYzHS++GJwvq0Buvj9Gr2zhXhaUHqc0rNGmf4t1EAwubBvqauRTmOBdr3fzhpwfNuoECNIldPR8deC2pNonkgCGulmoO4XZDS8Lwz+Rd9mPqnboiAgLksmHSgfxrvK0mKUsowRZWZOEeU4m7/DwcootsQSutHjgYzuhSWPuLf6kItkIKxdh7yVFJqdzr53bYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H/+shfLISwkOirf04DiUtMpKyo+BE3BeVeHJm/68kK4=;
 b=qY1X52ZcI+T3AVMdcazLUAvXIycUElUhNJxFEEVd8a+UyT1lZKTKf/BAnEpgRxPKSwzihW8aFulnFf7UZnhA6zOT2+o/dOI5HQ0JHUd/jwrn1xKQJtt0zT336/5vsehuV8WoRjuFNwV8J5fAH/wexP0n9NVTwvZLmP/L93EAqhs=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6374.eurprd08.prod.outlook.com (2603:10a6:20b:338::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.22; Fri, 23 Apr
 2021 21:40:50 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4065.021; Fri, 23 Apr 2021
 21:40:50 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, crosa@redhat.com, ehabkost@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 philmd@redhat.com
Subject: [PATCH 01/11] block-coroutine-wrapper: allow non bdrv_ prefix
Date: Sat, 24 Apr 2021 00:40:23 +0300
Message-Id: <20210423214033.474034-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210423214033.474034-1-vsementsov@virtuozzo.com>
References: <20210423214033.474034-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.222]
X-ClientProxiedBy: HE1P192CA0012.EURP192.PROD.OUTLOOK.COM (2603:10a6:3:fe::22)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.222) by
 HE1P192CA0012.EURP192.PROD.OUTLOOK.COM (2603:10a6:3:fe::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.21 via Frontend Transport; Fri, 23 Apr 2021 21:40:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9be8727b-e055-4481-b89b-08d906a07652
X-MS-TrafficTypeDiagnostic: AS8PR08MB6374:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB63742DF6E7D2ADCFF63637FFC1459@AS8PR08MB6374.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:608;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sbxw4ihFd44Y/LI+tHyjNwU9wLQLpAoJeUNTK6O/z8IrWYPY5xb6ds0L9REnZmQdbSKZtKn6/G/p9Obaxuxqqhf4CerBxU94I9Z21/vdqOfRIifCHmqn40KjbnGKzXCUyqyP8WjFlGkv4S8tgizxvbbkbzEE0ZBSE/k995tbSBIyaX5QCiCtP5+CTcWw6mlA49hZVzCm7sTT5tQkgDZa/9W0Fpblm4luSO5KQ0f71blZv9IxXOlOutiSQhtU/Ni0aDK1KWn4QoFEXY13FXE2Kq6T76U/vKs7Jt4Z+Yq+l4aK8rV9hqoKL9L5Mz1aqgDmgxo4cYo1EKO2TLGoHNNha4x2v+hAJWXZHQ1UT+1SKFdZuxPxuocBLh6WJ9Rk4gOWvpyo0w1Ljd5xCYLfxB8bSEzZEUBzAR4oTVQXqtjJgRcAtMztxXeqq+s9O2kpC2o+cLTT01leOhuHC7DIa6zgUlWJHG/9CGQIaM27tOF4nOhubNiyavPEaEqcHpLsswVfv7zKcI6FLW2vFbOFI+yLPd3noi4sAUlCbGf2hm1th5kYCy6WyOGxP3SiMNInAaG11hVwo/quobtvFqgG20rglaTmYoa4bXpijjyP+ux4slJLfSaRhFd257ClaIjEgJ63jPdjj4wj0E1j/9IxS99Xy00XLTfiBQTObRjKC4NBfauDxgu1LDRrkGfbtXhP3nH6
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(396003)(39840400004)(346002)(376002)(316002)(2616005)(26005)(956004)(83380400001)(8676002)(4326008)(38100700002)(38350700002)(478600001)(6666004)(5660300002)(86362001)(186003)(6506007)(66476007)(66556008)(1076003)(16526019)(6512007)(6916009)(6486002)(2906002)(52116002)(36756003)(66946007)(8936002)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?mBbow6aqQTyS4y3QCDsWfcAjs2XVeQeUw400PG9BW+ZypVJ5oB/v3HE00rH2?=
 =?us-ascii?Q?ek4ryU9lPWWtXywCP7YYIQY5FOl9gdpcOqIex4G9Wp+k89iyqzkondyu8l+T?=
 =?us-ascii?Q?Z+NzdWouySR92IR+LCa7GDiWdZWaWoOmh63UJkoeMJEy9f4rYfK+wfdRVybY?=
 =?us-ascii?Q?aI79xzvbIm2Z4mhyPmp0rDK2+xuX06p5WzSMyEEansqvVMkL+fqQkuuLU5az?=
 =?us-ascii?Q?/hwI/e28Jv0n4t0dZWDNsMMHGc1E/3ExF7ETPmSfqo9FcilSyI6oS7dyjr8g?=
 =?us-ascii?Q?wqyEL/+8PxyYkeUodwoQIvgUb9Di53EkspgBOYsBo5aplKFp6j0pnCBkzmEG?=
 =?us-ascii?Q?FYiEH5cu6dWXJWGOJyF4Tt6aB5+P3EuCD+nYZAqYAHK/bKAxsIXj2FfWrlYh?=
 =?us-ascii?Q?LXbOrqy8Csvs2SYvQHBo3zygYuKRNcSaShismvYP/WpRXoPh4PvQyTO37c7K?=
 =?us-ascii?Q?qF2XrLhY1trhSFdWkbmSqRO7jXbKqsrFQoK5BZ6opr8BNUwfFhDyEFgGx0I5?=
 =?us-ascii?Q?Sj2RRL+plZaDWFOewLQXmEzXDOHgIw/jCHs3rRXpD2Hp306m+H4ouCq8mU1l?=
 =?us-ascii?Q?v90XhJ6x5MjGr0ts4R7Ry41Ne+KUSXG1PP1BjTDIWRJsgJw/LAmr3mJRht8x?=
 =?us-ascii?Q?ANmfWj24wjAKkW4H+hhMlaNDFmTCypXNEhNZYVBY0bomA//teE78U4LtPjUw?=
 =?us-ascii?Q?Cj/FT1VxQ5qHY21qJyasTY9dFYJrma/y6KY1REtlxmxMvD8pnztagZfYFK/p?=
 =?us-ascii?Q?vLU47TP/XMcmgOe1SoBkuBLPXLk64KXHckSW4D+O5fDJvvKcMR9yK8TFQrpe?=
 =?us-ascii?Q?J7fDb4jtmoVLBclKWzPuNSJ8FRHfvFJZKQTTYyWnhu/vOJ7t/OHg6w9Obc8s?=
 =?us-ascii?Q?X5a34oEe5d45rX05fVo3yE5MbSNygFkAjk4MQ1JQRdg4Kq0rZxesvKTXaX+t?=
 =?us-ascii?Q?CAwyIvYzclRhjIPUe4SZVRjzOc5mNIYdGu15cD/LtyfFV3n+Ejf/cHHkDlfq?=
 =?us-ascii?Q?PprDz3v6Z17KEK0R2zIMe8cCQor8J7+SXUUWmLjw0vFDYMgp8SG2rmoQG1VN?=
 =?us-ascii?Q?Fh2HHHDDef7fjsGOLS1bUAt0sRvGoHVEnKSPM4w8//0uMgne2Fm5AUVxXLYK?=
 =?us-ascii?Q?POTNjibafULf6kqyNlx/IN/RMfldxS7w9xv2hk0t+8elHOlNkIbIIq/fKyfD?=
 =?us-ascii?Q?l5+IqkIehIfbozR80UH/P9nzPzjvkyGGbDQPMpHlK3A3esLFa6LkASJ9s1CQ?=
 =?us-ascii?Q?+FD5UWt/zSUhYD64fNytIzjTZJLrBA2QPqPbhLM5Yaibxckt1vXZ2PJ4pRKT?=
 =?us-ascii?Q?jSm0Zgzd3K/z/BHq1mkqiP+z?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9be8727b-e055-4481-b89b-08d906a07652
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2021 21:40:50.4479 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A8S+nkdw0cojNbIA03yrv1Drz2fUKgS0jj2b+I41bFRKkL5jDzf7WKsLejI1z77f4UT+oDRPtFIbKzqQhfqkfn50b+DPjknXQzG82oN/ADo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6374
Received-SPF: pass client-ip=40.107.1.127;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-HE1-obe.outbound.protection.outlook.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We are going to reuse the script to generate a qcow2_ function in
further commit. Prepare the script now.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 scripts/block-coroutine-wrapper.py | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/scripts/block-coroutine-wrapper.py b/scripts/block-coroutine-wrapper.py
index 0461fd1c45..85dbeb9ecf 100644
--- a/scripts/block-coroutine-wrapper.py
+++ b/scripts/block-coroutine-wrapper.py
@@ -98,12 +98,13 @@ def snake_to_camel(func_name: str) -> str:
 
 
 def gen_wrapper(func: FuncDecl) -> str:
-    assert func.name.startswith('bdrv_')
-    assert not func.name.startswith('bdrv_co_')
+    assert not '_co_' in func.name
     assert func.return_type == 'int'
     assert func.args[0].type in ['BlockDriverState *', 'BdrvChild *']
 
-    name = 'bdrv_co_' + func.name[5:]
+    subsystem, subname = func.name.split('_', 1)
+
+    name = f'{subsystem}_co_{subname}'
     bs = 'bs' if func.args[0].type == 'BlockDriverState *' else 'child->bs'
     struct_name = snake_to_camel(name)
 
-- 
2.29.2


