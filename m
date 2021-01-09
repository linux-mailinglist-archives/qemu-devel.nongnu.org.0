Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD31E2EFF5E
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Jan 2021 13:28:42 +0100 (CET)
Received: from localhost ([::1]:50810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyDMH-0001HA-M9
	for lists+qemu-devel@lfdr.de; Sat, 09 Jan 2021 07:28:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kyDKx-0007xo-Jr; Sat, 09 Jan 2021 07:27:20 -0500
Received: from mail-am6eur05on2131.outbound.protection.outlook.com
 ([40.107.22.131]:49601 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kyDKn-00065E-Rv; Sat, 09 Jan 2021 07:27:15 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EFmNuZ+9n4nlZOXW8Ot5oQrpLsVIR8cKWMf83EK5rlM5hbk/lSJvzxKhwmDaQLx+NFrXYLkiakU3/KtcAfCoQnPfv25IFvskCXyIRNw+oGNLsfT0JRmPHhPS/pH4vs8fkFykE81v0F9Dm9naCWBhzvJ/sJt0kHPuX33gv3VjO+D8Kze4vIoJ73JTeT0lYavFo86ambG8lK4cTMxn/YrcVy5qaZvvxYxgehWPnqR1u45ixG0tS5nJlqkTnakOjgp8S6kLUKdNHlob+iZ62OpLR0UC+chKkAUN3lW0JYujarA+TN1KIcq+cbJm7ir37DUkwDZ9/klKGZPIa6lelE6u+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rEdcMc3a0pe1LYf7g6BdVH+m8T8UKHhq3GHA3zYxdEU=;
 b=hhhQbf5OCIxqgZ4QVcbtWem1psg8aQM5vitFUfelcHjDqUxCukd2acfVPX7pU8d61T7bzQIRUd95m9+rqeYJEuPWRLSzXzvxC5OBxlGWbVj0MtZDyToZmdzZ37Xvscd9aAz0nzI6NB5xnxQUDMYSDik5e0DmjA60g4AbP5IvgrFX94Xfo22jZWcDxUlackzZi047dRorbm6mYw00/xDObU5/nekRkYpueai04R8P52MPFd/Dc5IuA3MQoSPhQkUNwnqfY/SV34XZtfQ3+Q3OJdXj61fVf0TDjlPiArXg4fABkKCuZgqU8EQR5U293jJzolt875Kn4ov/LeKOX5dScA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rEdcMc3a0pe1LYf7g6BdVH+m8T8UKHhq3GHA3zYxdEU=;
 b=Xg310IzVHS7rbR9Cd3upioLP24Mm/8ab3YiMJrrxanlUJhgs1DLk8DJlg+u8KK7hRgAnEYtSZ/ZZBSPtO1JRxu6fdeyEbyg96iacGuvyXfdFAXLYKOzNv36rboGbEJ6I/ZGyNn4RhCblcAqdxCdK4RWnkIT7UvvxlTFaGLxGerM=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0802MB2529.eurprd08.prod.outlook.com (2603:10a6:203:9e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.11; Sat, 9 Jan
 2021 12:27:04 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%7]) with mapi id 15.20.3742.011; Sat, 9 Jan 2021
 12:27:04 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v6 01/11] iotests/277: use dot slash for nbd-fault-injector.py
 running
Date: Sat,  9 Jan 2021 15:26:21 +0300
Message-Id: <20210109122631.167314-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210109122631.167314-1-vsementsov@virtuozzo.com>
References: <20210109122631.167314-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.119]
X-ClientProxiedBy: AM0PR02CA0217.eurprd02.prod.outlook.com
 (2603:10a6:20b:28f::24) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.119) by
 AM0PR02CA0217.eurprd02.prod.outlook.com (2603:10a6:20b:28f::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend
 Transport; Sat, 9 Jan 2021 12:27:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 173c3576-fcdf-4eb9-98e1-08d8b499df60
X-MS-TrafficTypeDiagnostic: AM5PR0802MB2529:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0802MB25298E8655E71CD4C2DAD351C1AD0@AM5PR0802MB2529.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J3ddE9hR/z2Qio1H3Z7Mewibw9lhn4PSb/fR/ddGmuvAQzPvoNz+xGQspoGf7mlBWylxsoaHTsfVe8Nqj9qwqHEeVfHq9qC4H89Di+Mi4eqDECdh/Y8H4z5nExjKLqviJBSvg1YldIlVcN7P3CRxBEsdSMraU/ngqhUgYqse5MO4Re9MbdoG1utuFxHeu7xXB5896CV4cfr+4k8PtvXIGHvG7BwQDsrxRefky5T3ULgkkkNe1f07HSLMipZiNWNq4is01PIkkrzuwtf0kQFCAa1bFX3Et8f0dNNpMi1App3ZdX06A4r4opLe0pazC6NFxXd8Zy6vLjvu9K+3C1gL7FuXIjktWhn8SuFkPlZlUYeIy1zJna3LjophL4zbvAPufHU/QLPw9pMCdWztXZsXiQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(39840400004)(366004)(396003)(376002)(8936002)(6666004)(1076003)(6506007)(52116002)(478600001)(2906002)(8676002)(16526019)(5660300002)(186003)(26005)(36756003)(66556008)(66476007)(6916009)(66946007)(2616005)(6486002)(6512007)(4326008)(83380400001)(86362001)(956004)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?FKdV79g3RFL3AQbvL3yGW69RkkCypa/LezYMbz+V36+6ku05UP4IzOu54ok+?=
 =?us-ascii?Q?y/CMufRIkKsU/CTJh8LTYl3bcboEKj9vZjKADsF5w0Os1m1vj5zm9R5igf21?=
 =?us-ascii?Q?TZGIgz+oPXu8S8v1+1FaKkenPf1K8ueRvBFew7pu7su3Xa3DJwCnOQZk5fhM?=
 =?us-ascii?Q?5LMYem5hBSnchoYszpzu5GHTEUz2w1YjqeaPB0XqEuq3tPLTAQfvDIKpiw3/?=
 =?us-ascii?Q?WYRprybnieuCGPtC+v7aOqAeM4dGQmrqKbx4ufRtAMboA3ewd1Zlm/Ivtl57?=
 =?us-ascii?Q?FrjLZqs23NjZty8T1hsbvl3RB7d+xYMMXFY6BDl3WxSwGn7ElQ+FIbF+N8iu?=
 =?us-ascii?Q?rLQxvT2JV3LB424kkkJgY2xVMLXnFlQTJU4zC9ElhmREXbvW9VwbZLpZNWUg?=
 =?us-ascii?Q?xgtU1jxhfNLg9l3NUbO+ML+nbr2u8lzhgLbEBPssLxZGr6LYYqSvI9fA9PNl?=
 =?us-ascii?Q?ujJhdw73J74dxrY+J0SaUbu4GtuCo8O/x5Ce3F2WacUb3FLb6rs6MRP1L0FY?=
 =?us-ascii?Q?/qz4/wKjZoTIZrX0bNKqGiVze42tQ0AtPtWP5FVhCWMLXRSciRuxGkKDqwAA?=
 =?us-ascii?Q?RxkeilUpDJB3+rosz0QyrLdKN5cMQRdmQhNwekcTISi5NgHlWqi7oT0Voe0B?=
 =?us-ascii?Q?4Zh/1e4QQvZjUxtsaa2zFmo6sE6w7L9buEwi2NQ4zlbfyeiTJT8q7w3DpgB5?=
 =?us-ascii?Q?Y65Fg7GV6TcusT2IdrICgNYhXNDq7IRS1jUE103xIpZ3x9bAxCfWvG884fD0?=
 =?us-ascii?Q?rSSnBYYBp6c1Oe64EB3A6UrAnx6ICvm4CRXaY2UA1fiT4msPxMW70qUBPWIc?=
 =?us-ascii?Q?mgpm4/OFTtj2HzILH2C2WenrOIH6zY4O9LAacvw4G0iOPHMVe6VmR+m2f8uo?=
 =?us-ascii?Q?/lKPqmYdFLpTJeiZyWshOgwthsMkRRtxDTA/mDmD53ggIB/49hFtJgKW36YY?=
 =?us-ascii?Q?nBwWSNxS0iuBpW+98YUireOkdWHj91QXmylsilKwNz+zpKcebf4H+9HotF+O?=
 =?us-ascii?Q?A2VX?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2021 12:27:04.3252 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: 173c3576-fcdf-4eb9-98e1-08d8b499df60
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q7T3rl0fHTX5hfcfuj9QYNcETJlgd2UVoWdxsyoYZwuOWXAzP4RnQeVmiHxrayCqYFwtZ2bKNsq2iRcSM13/TX+ja8uk00pKFtAinW01fS0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2529
Received-SPF: pass client-ip=40.107.22.131;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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

If you run './check 277', check includes common.config which adjusts
$PATH to include '.' first, and therefore finds nbd-fault-injector.py
on PATH.  But if you run './277' directly, there is nothing to adjust
PATH, and if '.' is not already on your PATH by other means, the test
fails because the executable is not found.  Adjust how we invoke the
helper executable to avoid needing a PATH search in the first place.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 tests/qemu-iotests/277 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/277 b/tests/qemu-iotests/277
index d34f87021f..a39ce2d873 100755
--- a/tests/qemu-iotests/277
+++ b/tests/qemu-iotests/277
@@ -42,7 +42,7 @@ def make_conf_file(event):
 def start_server_NBD(event):
     make_conf_file(event)
 
-    srv = subprocess.Popen(['nbd-fault-injector.py', '--classic-negotiation',
+    srv = subprocess.Popen(['./nbd-fault-injector.py', '--classic-negotiation',
                            nbd_sock, conf_file], stdout=subprocess.PIPE,
                            stderr=subprocess.STDOUT, universal_newlines=True)
     line = srv.stdout.readline()
-- 
2.29.2


