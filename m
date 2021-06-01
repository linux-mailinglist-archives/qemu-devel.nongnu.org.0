Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ADA63978AB
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 19:04:53 +0200 (CEST)
Received: from localhost ([::1]:34314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo7oy-00060P-FJ
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 13:04:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lo7c9-0003jd-F9; Tue, 01 Jun 2021 12:51:37 -0400
Received: from mail-eopbgr130139.outbound.protection.outlook.com
 ([40.107.13.139]:37856 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lo7c5-0002Zc-3v; Tue, 01 Jun 2021 12:51:36 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fW/hgzP0IXFSq1hZd5U6ll7h4xmpwJBISBx6Tozfeh8CnwnRxzctoFd4JgagK/Hy9rs8R44yvfi0nqYVebYRAOGnrffx5Jvzih69slAXg8YAvU5C2NGLH0YNKk+kt6TU/q9FDBNQU0SSbmxkfzRVKF4VdKzGnRfoKtJTk3F2Q3ida7c5ojYBAGi4GzfkcpmSuygdRKKs4qrJCUPjMEMyuWPHUVs5MJAUsxUgX70SJ7hKp1yN7qIedzfNLOBZhAzplXMyHD1ODtEHijfZfwEVOeZdtVMUUOWsPsBR5bTZDdZgl+QsAb9IyuAArDzdESFmYyzb7Xe5KrP05KsiJoiaEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pm/DX8vEH9U0U4+GCtPJAxsZlteqTAW/fTB5aMXiQYE=;
 b=KUGmlLmuQJxzqwGRAFH52WP/jhbgCV0h1bAdlk1O9QXvuZrkRBGnjJkwAQNl8Fvyt5zqjMDUoKLJtN/f84Gbnrei6y/nHM+Ws1Qib8E+M/rR/gUxhG8q0VLSxI15d1Dl8dQd5i6SAwotYlfBGlkH6pFccrNY38+iG0NTDjrgxNhVXsrxzi9v2V6OSNL5mBXuznb5fdbRaygK/36xgrVqNFxVpgwSIhSN/HD60PKyGPkhFJKLJaJWYGU+sBl2k1jposDHu0wfdT6eZXMxEdxsv9DTJbz+G285VKgB5MX8WrKhaxY4aOAKdSnQxu3RRA8lpe6Y042pxfBvwXr2hi5xUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pm/DX8vEH9U0U4+GCtPJAxsZlteqTAW/fTB5aMXiQYE=;
 b=qs651f9WU7PQthG0E/u79nFKJNFjXT9noHHKx1HR7Cbc9QCpVEUfAA+aY2V63lSiTZmWpQdipyiPl2JPg+i6Nxx3Z39Lj0wAPnKNiXlM6nGUxx0kpeL0OZswmpfFpb3aRZHLiPG7PoGfxpP/7ZeoMg3zMC62RNLm5PEBeg3x0k8=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3864.eurprd08.prod.outlook.com (2603:10a6:20b:8e::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.27; Tue, 1 Jun
 2021 16:51:23 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%7]) with mapi id 15.20.4173.030; Tue, 1 Jun 2021
 16:51:23 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v3 30/35] iotests: move 222 to tests/image-fleecing
Date: Tue,  1 Jun 2021 19:50:21 +0300
Message-Id: <20210601165026.326877-31-vsementsov@virtuozzo.com>
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
 15.20.4173.20 via Frontend Transport; Tue, 1 Jun 2021 16:51:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1530ee76-3d19-4f75-3e89-08d9251d7d19
X-MS-TrafficTypeDiagnostic: AM6PR08MB3864:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB386462F3F393E3C213329811C13E9@AM6PR08MB3864.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:497;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Luz8UOrNyZOHA3b2jCxvp+0udQyIYUA4tTp/Jz2zXRItPQ5L5V45yzgFdHRQ5ETeSx6HLtvuEQSMhICA83PlWy2mW+afKjLHbatdhhgh162iUnbXO7ET2h/7/Q4kTRqDKz5cbUEvktJUsDe8RV9jET2N1BsL/Rb6DOJPuICq2azElm9X7kPMg+dXFPZVt57XcoznDbrziucUNII/SyIwawTf+7o0CHm6Ty5EYiKU482pBZM4Dq+ELPn+SoPpkoiD/8vyPXgEsWBX1qq5qZ9Xk6gSHuwLoCUwQuUV2FnG03GbKDRJrziM7mmnudy6ssq5ry66QsK8aH69MTmKDhAKUh0Df4cVlIjZXCSKKvqlQwlKNdjjV4osHdTGZBfJ+PS+sj1RezMTgAdTYV1SpYugTpYi18T/wnFWYy5rCs46MQrHZReYMMcccTrHrhOS8xYxAonO1ZfUSQfPpe7wOW7IPfLX6Z8Of+jMLqxdHQrfO1822I5/sGSRVQrRGvZfw6c+Zdx0RcHQ1qwJTP0YlF5e6kz3rPo9mAS0WkX2DCymBWzbwwQVXWo3n3gYe/BH8pBQJPaUYv2Hj+ixTVLVkUT8fCjPODh+zJhbQ8SkH+rExVmbwUR3qKDYO4HZ64j5LHsbr9vxeK2zrnx37Mpc2FS25qru1fyembr+lDcIEHJ7wmoi7OHARAH4d2WTyAfpliew
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(136003)(376002)(346002)(39840400004)(4744005)(5660300002)(86362001)(26005)(1076003)(8936002)(66556008)(6486002)(83380400001)(478600001)(36756003)(8676002)(2616005)(66476007)(6506007)(38350700002)(6512007)(6916009)(7416002)(52116002)(2906002)(16526019)(4326008)(186003)(316002)(66946007)(38100700002)(956004)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Ngpu5ImJPxXzOyJt9xZ/MzRG+Vrvw8Jaz655wDB+KLPe4v0U7aod8VycNhE/?=
 =?us-ascii?Q?xBmB6SUNMxM0Fso9d2xR4Y3oj2NYx/Ceco2b70v6mDCupbfoOcjrDKqqg0vH?=
 =?us-ascii?Q?sSLBQqCqH47OBqFAxhyiUOVpEBHjWjU+xxAiLmB6d/dFL4NynJYRZnCadQdk?=
 =?us-ascii?Q?s5u3EFdFLMMj0vRS/43Aqodt0rn1QTvKgPJ3318TpJhTqrNxv2StpYLqHa9B?=
 =?us-ascii?Q?p9Oi86GhHg8IxyNb0JHZ9QhukCbGmEXWin8qXtCZuEQJOk3VcDls4U5HxA85?=
 =?us-ascii?Q?EEJOYTKyXcrYl+FwhAitMAonfEcLZGsEo80ZXDq7t+gxTjjo0RuR3x7MkgcH?=
 =?us-ascii?Q?g8aw7OtiSp75S8L1csm7gOgRg8Wm1Scu0oeJg6ru4aT7TTaXpOks8sEBv4kA?=
 =?us-ascii?Q?if+QTZCMlnOjx2s7f4z4iF11c/7MfxQ0FSf6sf21nTdmOsM0tm+lfC8bCICD?=
 =?us-ascii?Q?abI6V8E7i37QCpTZy6BnBBIHEjzSz934KoLwxZRbmChq/I0fSe4Q2eiryYY2?=
 =?us-ascii?Q?OijMDR50+ufc5P5k/wHqz0qmUr1igUjZTDDqPPgup3dWtE/0atWvbUUSkkJS?=
 =?us-ascii?Q?IN8Lq9QKbMxALWq3xC6JLgCFHQEERlp8IxF8pUBLID4p24906kHkZaqQ7wdi?=
 =?us-ascii?Q?Odv8Kns0q+ZFlE0kU4mTuEwUhL/kciNEAJIaEv3PJ5YidgnBB1esg6y1j4W3?=
 =?us-ascii?Q?Rk051uDry+KzdaEeqWajPtiZTPtqc0tz/59nHxy3bWRSETbLarhLLwaZES1W?=
 =?us-ascii?Q?WbJFZbdK6Nblk2f0FZ9yPjpkn9qgboQ4htHgOxtrlm72u38CthMzIqbPWt2u?=
 =?us-ascii?Q?aa1OSfz6v2u8H43YYZr5xRhHIfyHT1EkGIyt8qnWIliOboqAbBHFgPx5c+6e?=
 =?us-ascii?Q?UP2ROVRCf/Cn3Q79IYV5B84DaFo1Z09tFKQ9vCT0+GU+rGygP8OeubAjoH7R?=
 =?us-ascii?Q?nMt+CYXW6/R9X1bJEhqAbgKDI/a5TCxZqTS3B6S6ThAk3uQDTSWI6oi05Fgz?=
 =?us-ascii?Q?V7XpV/GTDSTSevCEtpmnfVjs545uRTMM/pQ+S6G+KqKIgRyV8k5VOuREpVWg?=
 =?us-ascii?Q?jcaG20RmvQOaEtgKx1A3DpTyWqOEaCBF/sRmTh/8ts4zQkr+ACGsrdOxanUQ?=
 =?us-ascii?Q?93ErK6KKBjxxPTLTJsr9/R6W6rbd8bNY8qUz1ypTr2Tm0CvBlldSq+XvJC+P?=
 =?us-ascii?Q?krqDdwAZ6riQLOQXl31zlqB+1ZFJHN9AWQKgKYruqw/yzn/ScD8zndKLpYSt?=
 =?us-ascii?Q?iNpDVwRC8Ze9wxXXkVXtLHiCA22WhZTb6RM0CWVoTPMrn0N6EGxc2AWK6UFJ?=
 =?us-ascii?Q?xW0L2wcCZTFQMKKR/6oa3ec2?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1530ee76-3d19-4f75-3e89-08d9251d7d19
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2021 16:51:23.4195 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LDGjrG9ywcW6eNWFN3l2woKg60wMLo+I/XT0ZnV8nPxBAQLHixxBkgv8pmrgmJ2ZXennHQcQVRqTD1CzQOx5HzdzJFW7rX6o7axXAW+Tgr4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3864
Received-SPF: pass client-ip=40.107.13.139;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-HE1-obe.outbound.protection.outlook.com
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

Give a good name to test file.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/{222 => tests/image-fleecing}         | 0
 tests/qemu-iotests/{222.out => tests/image-fleecing.out} | 0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename tests/qemu-iotests/{222 => tests/image-fleecing} (100%)
 rename tests/qemu-iotests/{222.out => tests/image-fleecing.out} (100%)

diff --git a/tests/qemu-iotests/222 b/tests/qemu-iotests/tests/image-fleecing
similarity index 100%
rename from tests/qemu-iotests/222
rename to tests/qemu-iotests/tests/image-fleecing
diff --git a/tests/qemu-iotests/222.out b/tests/qemu-iotests/tests/image-fleecing.out
similarity index 100%
rename from tests/qemu-iotests/222.out
rename to tests/qemu-iotests/tests/image-fleecing.out
-- 
2.29.2


