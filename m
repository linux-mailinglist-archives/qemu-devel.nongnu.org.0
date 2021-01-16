Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2FF2F8D7B
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Jan 2021 14:53:41 +0100 (CET)
Received: from localhost ([::1]:51882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0m1M-0003Np-4q
	for lists+qemu-devel@lfdr.de; Sat, 16 Jan 2021 08:53:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l0lt9-00037J-1U; Sat, 16 Jan 2021 08:45:11 -0500
Received: from mail-eopbgr60109.outbound.protection.outlook.com
 ([40.107.6.109]:49662 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l0lt7-0007U8-Cg; Sat, 16 Jan 2021 08:45:10 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QDeAUTvQBlB8IDDwibc4sdURY4HnA62Iie3AzpnJioWv0SxG7jHih4NNajAJtePfgvcL98a12dtiYnY0IIA8tEuqXqH4k1oB4+t+7aoo0KTvx0FmgsKwG5lIHHa1E3iVaYcxoNirzGqIfe2QCnREuqXQYvqGmWnhx6vds6PAvJ2mNE0hb4RYtUFwV7wY4Lk01jo+ItA2cdGnoOTUzaRapM9TwjZStDeQ6nJaJsLq8hlscv+LYY7g0m8hx/Vmb9h2hiNrUay6/S9oJXhU4pJhcZOJBtg6atuh5R95jeOWbkc/9K2lseUnRAtGojv/N3BFOFlFi9DUXat+taDbaEp6dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qcxe31h/IQSJ1MqInU5mp3Ssd4l3FJDdAote1BN+jQI=;
 b=QFKblVjwZoH1qlhc0/UzOu3+9ddOsVzf+X/3PFOzg9k7aDcJ0aq2QJYwpF+QFNLJqzo9faIuLJUHFE2xVUQoUSLLp01sFibwXfRX6ALTqtQMIhXtUZU9V3vF6okQxQzmKJfPPl34jTBg/w0Y5HpRhDp7qQxsB8NCkRAjJjFKI4zZ6EXl4Yd3Z7QEIh+1y5DkpioaBt3/rB2X+ceshPzSEJlssuPMbuvcRXWOl6gwJfX2Felc7VOWjjQwfWpHzjFTzOMd01wA/PdOw1cw4lKTgpmipBcPH1yttufeOk8YDr5dmmjqPJwdh2fp8S31h2deZkxncqAC/UZLAgQfh7x7eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qcxe31h/IQSJ1MqInU5mp3Ssd4l3FJDdAote1BN+jQI=;
 b=Aq0xukE00c/LNpMgTuGCLdMiv56nOnZmLHLTbQP9aVb3N3MRFbtn+0/w2DYmdHPvWksdnq/4qsF5VVjIzzfAo0eQPbnpB7mRwt29Z8PJxdxPjQ3GHctJ1Q2387H1ShuQxOQpxKAaVXY63Mpy0IKojeqeHRV/aBspkU6/dJktZ1g=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB2098.eurprd08.prod.outlook.com (2603:10a6:203:4a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Sat, 16 Jan
 2021 13:45:01 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%9]) with mapi id 15.20.3763.013; Sat, 16 Jan 2021
 13:45:01 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v7 02/11] iotests/303: use dot slash for qcow2.py running
Date: Sat, 16 Jan 2021 16:44:15 +0300
Message-Id: <20210116134424.82867-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210116134424.82867-1-vsementsov@virtuozzo.com>
References: <20210116134424.82867-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.72]
X-ClientProxiedBy: AM4PR0701CA0019.eurprd07.prod.outlook.com
 (2603:10a6:200:42::29) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.72) by
 AM4PR0701CA0019.eurprd07.prod.outlook.com (2603:10a6:200:42::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.4 via Frontend
 Transport; Sat, 16 Jan 2021 13:45:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 877fc77e-9032-4046-ce71-08d8ba24ebde
X-MS-TrafficTypeDiagnostic: AM5PR0801MB2098:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB2098C2A487478DD85B15F15BC1A60@AM5PR0801MB2098.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8x4T4MQYpDHg2o9pGmMx5SJXR3asEnEyOlk2WBG7J2Ldn8EpMQ7WNl+24GIcfaImFJ3xg6nxPdRIQeJSStIKv7xaKzbNrQ+HAy4LN02QRZTWOEYgfYDltFaKP7wnRbIIblr5rsk0ufjRXrDUSfO/AlFOdXHMvc0edN3MoDziGIZgFGiOEvcjBGqMUV0FDIDJG874EUOm/VB7LngsqnXq5myA/FiMfq7iLqB5t2XTMFj4+beBN8RndAx77g3l5f3VoEYrZZ5YOh5LVBQPynIHn3/tTiaHgZPuKg0H9bRYIQ8QpKOjK3BscWDKEr+8YQZlPh6J9IRNF2bx9CW74hwM3YwReYs4Bcgb6mVO+jOv7R8foLwUeqYl5Y0K+RxXjMoSuBvrvo35k6RGtYpERaDOM+xNas4xcHQcj5ituz4Cl06WWWvCjOJWRzHXJkgQBVt8/UtZOwok52NXOOcINoi3uVdWs4VyrZRi4P0Kk4vsZF0+5UcYEV97PClL3fiWErzWiB3RA3msJd2k/EkDx7zfSQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(366004)(376002)(346002)(39830400003)(6916009)(36756003)(83380400001)(66946007)(6666004)(6512007)(86362001)(1076003)(66556008)(5660300002)(6486002)(66476007)(6506007)(478600001)(4326008)(8676002)(8936002)(956004)(2906002)(52116002)(186003)(16526019)(316002)(26005)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?frcgx1EZvqvxILoSFGHCraSXYA8yyzrrix92J0fdTDOpt/LesSPH3glB5NkT?=
 =?us-ascii?Q?zZ/yqQUNfCNlw/ei8s8UsXr3zDuQus5+EJV4htXVw/reermoUDRNTONV9cJm?=
 =?us-ascii?Q?eFY12a4O+9sp2sez5jGEMdnPtO0vGAb64D04mP/GGdVI1eZwhRrm7qLHgfoi?=
 =?us-ascii?Q?Q15eKakIK5HMLmLDyiqPMkytazxWiU0VpmxWQ1LVb3WmFR8VufOo24vSPM3/?=
 =?us-ascii?Q?+uGwtCXMvBccOBYtPidneLhB5APB6U3gJP1qao1ZK6baOMNTe3RSCmk/afbl?=
 =?us-ascii?Q?trLTjM5xJd+NGb72oLwXwZJcmJpXAZzo3gpVgk/xMaYtAr2KuV5L1mWmw5Sp?=
 =?us-ascii?Q?G/zEH0VffAhDEbnIgVe9TW3pXPLYJ4pMLLERR0JON+0Me8g09uFBuxAN6ON/?=
 =?us-ascii?Q?o2/AuZS3G15v1DMSvmKSNpjTdXHSvfHaisRI14G0rw1PPgLwEK761D/CDeDD?=
 =?us-ascii?Q?qFXGMxKY4pFFJB50oEKuUym73txX5jFoJH1Ehk0Q7dxOx5s00U4ttTiVvetg?=
 =?us-ascii?Q?gaaj2joAtuds20qXC7+l4jwukZQ125mYOGPNJwaBoN77a/SydG0EvP5UsZuL?=
 =?us-ascii?Q?Ww701vmlfBdHxVk5BqttHu8nhex9fYTxYs94vC6/mP+KdQF8LLfRu8b8Tf1g?=
 =?us-ascii?Q?XL+SEREzvOI2unr6+ieWyEfJw3KKlUKe2o478h+ih03HPqiOADlBIYX+9t5G?=
 =?us-ascii?Q?XO7k3371ZG084jUEykAHpCq+EL/oBdteVM/+u8JCxgUXeqaYtLVp3pD2ps92?=
 =?us-ascii?Q?uas+OT42wRSyoPtaWgAweJwZ1d+wrkBkVoKtaISSlMi4fKp+VBrXpsCctjIl?=
 =?us-ascii?Q?0KghShdnrFMA1AQXIlUg3Yj4c7DOW3hMSnrc7Y+5g/6J5BEj7v5sMEp5yfb2?=
 =?us-ascii?Q?oJirUGJ2ou+q/Vu/ycfmgdME5EIBCYaZslJV62B9dJSrs5NfybScvUHAZOCW?=
 =?us-ascii?Q?PwFo2FtlxhrAx5Sb1U9ZSJ6sTxivAbgIJPzEonO6Soy4pA5yJdQO4bIImXz/?=
 =?us-ascii?Q?43yg?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 877fc77e-9032-4046-ce71-08d8ba24ebde
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2021 13:45:01.3623 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n0/sQDAnPIx40nFaeQRYTWwf0197o0k3RL+FWWGLEvKZt/V1QTIzPq6Y/yc4/NmSXpiKW0/xVmNKnOdZr/tojd8wGziczDxD1E0Sb/aQIEo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB2098
Received-SPF: pass client-ip=40.107.6.109;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If you run './check 303', check includes common.config which adjusts
$PATH to include '.' first, and therefore finds qcow2.py on PATH.  But
if you run './303' directly, there is nothing to adjust PATH, and if
'.' is not already on your PATH by other means, the test fails because
the executable is not found.  Adjust how we invoke the helper
executable to avoid needing a PATH search in the first place.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 tests/qemu-iotests/303 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/303 b/tests/qemu-iotests/303
index 6c21774483..11cd9eeb26 100755
--- a/tests/qemu-iotests/303
+++ b/tests/qemu-iotests/303
@@ -56,7 +56,7 @@ qemu_img_create('-f', iotests.imgfmt, disk, '10M')
 
 add_bitmap(1, 0, 6, False)
 add_bitmap(2, 6, 8, True)
-dump = ['qcow2.py', disk, 'dump-header']
+dump = ['./qcow2.py', disk, 'dump-header']
 subprocess.run(dump)
 # Dump the metadata in JSON format
 dump.append('-j')
-- 
2.29.2


