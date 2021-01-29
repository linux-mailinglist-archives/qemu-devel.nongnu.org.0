Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7426C30873A
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 10:08:41 +0100 (CET)
Received: from localhost ([::1]:50290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5Plg-00089i-Fo
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 04:08:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l5Pk5-0006uD-Kf; Fri, 29 Jan 2021 04:07:02 -0500
Received: from mail-eopbgr130115.outbound.protection.outlook.com
 ([40.107.13.115]:54017 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l5Pjz-0008S7-KK; Fri, 29 Jan 2021 04:07:00 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K8g6Vs53PEaQkVOUgHUo+SZuuxHq4n3PWMQ9jVNNUAooCPVRzs3Wdvr/4szmeeXVU6MzwOg1CHjnk0Llg2iZX90fV5eRwO9Q3YLherfO2Kd11iuv8jpioYWToevYVZVGRZQ2+UDSG6RUvOrjqKwayk8i0t4/sbwPCh5WQd8Rx3v3z89Uhkuv5vSwyEn68zcaG5kkjoVMCm3OSJj81i3ghs57mE0alaC0hGHvgv8VtRNRwG2qNj/MW5JuJ4sq1S901wJd3II6qz9ppOZ8oMO/aa/WHz5KZNzmb+9beQlwFXW3FYkBJBZE+bWS9TUxhpqgdgPF0Tcrvi9lGBEQw85dIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YN13K3+eNI+BVeiRvzMaAjZjZYS5Tuo69be7GPCgu1w=;
 b=NOM5kXY2vJutADVxXsEJ5S4ngbiz+cHePK0meCwuhknTm39N/ZIJyW9MelacUKaR2gB45vc+AF5iDAtAPB5oPSEx5FkIoFtzbTPc2Ypk2/31jJlt17xEgugL9LuXEJRExwEXKRXqHoV4ScS+OlAwSOgykustZa76h6jjZSBRO3Qu9Q94draHmukPGRDcyeZ3kpI4cdvQUAYV/sRs4cbGdFQQs0Wg40But+YYxcGEg2m4RkHcuGAPnwObIMs2Xakklwpz+/FglAc7YP2fEJis9tIr8JirRKMNmkbR2qwmZmdhuTjJW66YjfbuBAnYBRQ9WTXPe3EFKodEKab0JxjNSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YN13K3+eNI+BVeiRvzMaAjZjZYS5Tuo69be7GPCgu1w=;
 b=GcBwrxojFwItcAItXnpeU3Mwpq3Zxgj+a4ie4Jn3MfahgJd272JKv6DqcXAKb25KJCKsONt2sMm+9LYxZr2pK2DrPYJWPipbMFgl+15FDOdxmZZkYV++piQxYqCis4mOWUQCw57lsaEOM+DekqVVTVPrsIWJwnYfKqz9s2zKbOM=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4786.eurprd08.prod.outlook.com (2603:10a6:20b:cc::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.19; Fri, 29 Jan
 2021 09:06:51 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3784.019; Fri, 29 Jan 2021
 09:06:51 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH] iotests/testrunner: fix recognition of python tests
Date: Fri, 29 Jan 2021 12:06:16 +0300
Message-Id: <20210129090616.84145-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.152]
X-ClientProxiedBy: AM8P191CA0026.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:21a::31) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.152) by
 AM8P191CA0026.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:21a::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3805.17 via Frontend Transport; Fri, 29 Jan 2021 09:06:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1f5231d0-6aad-41bc-88e6-08d8c4353778
X-MS-TrafficTypeDiagnostic: AM6PR08MB4786:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB47861B53CBA17E869CADE9DCC1B99@AM6PR08MB4786.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1850;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VbBmfNBjDJgYmyJ6kVupRuEYg8Q9VNA3DmDpoiGT7Gnm29bVl5jpsSWIRZcAU+fI3gy3CDI6Kb47v9maRFgkU120OMASJtdpMmS9GxoIVC8WvxJZQjSCSa5fZqgLXY2j3/zH+Bq9pekH0m9hf7weofw4sSfUmadfTfSOwAfAngfQsLxWrsLeTo7q+1E3t1yoCSZvL/9hqV8CToiIJkqGN4u4TJq5alyatuCqxgTATi9L4QYiyVDvnMYB8IsYWyCd2n1Q38jxh6XV5zz3p0wgQOE7+NMJdo7+G7PZdMMWZjvYLm15CbmXhII+y7NWDGQrr4n+/BiKf5zl2EXgINosrE14Up+hppz8d+OnvTBSZ1x/Kp+P9qWofVvzeAWeDCUHB+kjZwD6yHw5ECDgBvuTY092ipszIXanUcULNjDiwZLkN46dP9UQbvETA6bLGmSLYDlyQFSnjVMZAaXoksOIjFXWkZzTRuICOq4LXKnkY7J+b6LdQ4cJcUo5ST8oM+EpPsH/7eesZSQa4XsvXD4IrA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(346002)(136003)(396003)(39840400004)(4744005)(26005)(83380400001)(16526019)(1076003)(478600001)(107886003)(6506007)(36756003)(4326008)(5660300002)(86362001)(956004)(2616005)(8676002)(66946007)(186003)(6666004)(2906002)(52116002)(8936002)(6512007)(6486002)(66556008)(316002)(66476007)(6916009);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Gk0QBi67mBI1GI5yiPK/MyBkuLg+OeEvJDdeDYoju/7xedwcy1qnZqJnAfRG?=
 =?us-ascii?Q?JY5BGpTHwZ+aMsQyAqMSQ9G0q0zltp3/7zZ4jKUmTL3tOH5EmNd8ImfKTAJ7?=
 =?us-ascii?Q?Y/rgwsj7Bj6g7iMSxVF/s7MMVq5OK4uPXCChOSGG1DrgVZsM/i6xr/2eg7Ia?=
 =?us-ascii?Q?IJD9zJ+rAwgtzuXNJp9YjxAj5QYdV8nT5j34rZ0+86q/UCx4XzNgNZ7jZf/1?=
 =?us-ascii?Q?sd7jWaDtrt8FPx8PhBD6qNFRhg79PQ3sbfO1sAmTODscvaDoU0AEGCknwTgi?=
 =?us-ascii?Q?EizfeLLX/0ibukh7mU9Z8MfjYK4B7TCtTiChGA2EGWBdN4JGG+TbQknyh2K7?=
 =?us-ascii?Q?49uIM61L73K0F+4/XBf8ArsNkyqzEtosBA2eGMEiAZ+7KaJ8fFCdMsfvU5vQ?=
 =?us-ascii?Q?oiYKnkjuY2hrQZQS1ZPGzZ4uQl41lyDgo6kphb5Ui+b6CLoZzsxx1Pwq9bcZ?=
 =?us-ascii?Q?NBdshSkuBBMd+eF5/7qsRCCtjtfa0T2SRZ9EXp3Rq6WoOx1geWOCRXK9VcGF?=
 =?us-ascii?Q?QgoY6OGtCnf9n6TAuiLiFMn/OpzmFN/Wd3hlPECM6kTjWh1ZLur1DSo0HdLv?=
 =?us-ascii?Q?jCdKkQg1qMFA+deAcQlQjPdcAlEnT/ixPCyka9Df6PFA3ZIcIh89rUpo/XZh?=
 =?us-ascii?Q?u/4T/2Q+Ii/si60/OScN2I6PTpTTvP+BRX/4NRy1gdBwQgaZRBHYRPwpin5S?=
 =?us-ascii?Q?Bd3Fwt4TRhP+X6CUUlsaQJSvVBUvIO4zXS+sHXVnCMCPBUuG2AvR90hSda3S?=
 =?us-ascii?Q?FWH0re2fMODE5vCVcjiRN1IiQpdA/jeMsdS1Tzawugmb1QoY/rmx6BbIx2qx?=
 =?us-ascii?Q?cgUdLW7zm4CPBm3gm7zQbNWLIrlK238eHrc6e8xXll8dVM2eCAdK49AQUQhw?=
 =?us-ascii?Q?t1L/UxyIyqyjjE0/ZQxvLLvPidU/EaoWorFNqOPqI4CretC6WQntYNay/N7Q?=
 =?us-ascii?Q?7SHduR5mugh+2qJpAK9TITRQx8+AGqvejt+3A5QWu8wWDnL3jtXCbX4DLXti?=
 =?us-ascii?Q?96GzKs18biLihyQGqOPMJViSEPAbRX+bEB0voNGAz6HOaPUWlD99KukiJ8aI?=
 =?us-ascii?Q?e7XctgxQ5cbCTw/CFg0cobUEi5Nm5w=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f5231d0-6aad-41bc-88e6-08d8c4353778
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2021 09:06:51.7465 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d91WWIj1MXn4P6t8/PA2FlyOs6Wb4FDyr/JSUP9iVaXLY9vPaAthbQUs5wgiMaAuNQMxqRMLPuN+WbFmhZWz7L76HCFO+UOCrlPZWYjAsDY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4786
Received-SPF: pass client-ip=40.107.13.115;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-HE1-obe.outbound.protection.outlook.com
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
Cc: kwolf@redhat.com, thuth@redhat.com, vsementsov@virtuozzo.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We should drop final '\n' before comparing with python3 shebang.

Fixes: d74c754c924ca34e90b7c96ce2f5609d82c0e628
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/testrunner.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/testrunner.py b/tests/qemu-iotests/testrunner.py
index a581be6a29..24b3fba115 100644
--- a/tests/qemu-iotests/testrunner.py
+++ b/tests/qemu-iotests/testrunner.py
@@ -248,7 +248,7 @@ class TestRunner(ContextManager['TestRunner']):
 
         with f_test.open(encoding="utf-8") as f:
             try:
-                if f.readline() == '#!/usr/bin/env python3':
+                if f.readline().rstrip() == '#!/usr/bin/env python3':
                     args.insert(0, self.env.python)
             except UnicodeDecodeError:  # binary test? for future.
                 pass
-- 
2.29.2


