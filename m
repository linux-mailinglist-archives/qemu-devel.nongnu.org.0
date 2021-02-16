Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A2831D03C
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 19:31:29 +0100 (CET)
Received: from localhost ([::1]:59050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC58C-0007Kt-3V
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 13:31:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>)
 id 1lC55Q-0005Wp-Pl; Tue, 16 Feb 2021 13:28:37 -0500
Received: from mail-bn7nam10on2132.outbound.protection.outlook.com
 ([40.107.92.132]:20864 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>)
 id 1lC55O-0007Uk-Im; Tue, 16 Feb 2021 13:28:36 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NmSyr02dFRygRQAyxLk5T2mW8lcjbFbCulNqwxhw8s3rJi/DmzpPHBhi6Gc5WaW9Ef3jkqXWcbLWOtV9yrUHhcEubA3vdzRmQfmb2XEg/qIfDXAlt8U2Q9V2bGZAOI0qc8W9WM3r7KEqp5k1+3eAR1ax9H5rmtlXAfL0tSCE1cx5OFHTW4vkmsddnqxiXsVzXNRfp6s+mCfB/QHWOxid4Tz0ysrJxZUcuXV/jUJ94QNwuPvcNSQ5JLph/JQqgf0KgImgjpBPscEZqwT7QIRybYqu6SXQiKc1XnUN7HY3AabKGy68aGQAL/3G4HiApW7dAe+uNGKLgkT79+3izfX/fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xSgFoTj4uq7rnGGptJEjENOdmC9BiMpahAPVjwMFlUM=;
 b=Em4e9Sq//n1E9kbbZk18So+Z3BmZ9D2TghLZU4nO66oOnqluzU+0SOEviKjVSMZ/M0sQwivtOnFHK5rWAOkwbnTiIkD4RY19vlgcLVpUKJlEIIEzdSk4p/DqOzfVWgys9KljBgbNj8z9NAR6fcl9rNM/XxWNjmdadTRI9asql3gqcROgfvJF5AQAeD6E/YAvGaDweugpkMabPYyMR1qr01jBCrg7VYRl97T6OXD8ffbW9zYuR7K/OTpiAwb9e3x9iX6IiUmo5I0hefPl41BTP4sUjMKFdt63sc38Vzs/5cEMfIsiFTc4ItKaihycw0ci75KIT0lphl8wn+yR7/8bhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xSgFoTj4uq7rnGGptJEjENOdmC9BiMpahAPVjwMFlUM=;
 b=JMxAuwyY6P/exZ6rGpNJuOhJalt4fH9YFML64Hwr5LJlqQU3rBS2eWvqUDYyvGJ3GZ55LBwha+N0KBOiTOagH0cLOa3OVR+g57jZ792tLkFQiXAL+NA49L4LoKseXQUzsHnus00fRXYnYBRqvCQviWQC2/Q9/kJWqr9sJV5bc/c=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SN6PR03MB3615.namprd03.prod.outlook.com (2603:10b6:805:50::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27; Tue, 16 Feb
 2021 18:13:28 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::e828:cd84:e00c:6310]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::e828:cd84:e00c:6310%6]) with mapi id 15.20.3846.041; Tue, 16 Feb 2021
 18:13:28 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PATCH] fuzz-test: remove unneccessary debugging flags
Date: Tue, 16 Feb 2021 13:13:15 -0500
Message-Id: <20210216181316.794276-1-alxndr@bu.edu>
X-Mailer: git-send-email 2.28.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [72.74.210.193]
X-ClientProxiedBy: BL0PR0102CA0055.prod.exchangelabs.com
 (2603:10b6:208:25::32) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from stormtrooper.vrmnet (72.74.210.193) by
 BL0PR0102CA0055.prod.exchangelabs.com (2603:10b6:208:25::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3846.28 via Frontend Transport; Tue, 16 Feb 2021 18:13:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a871192c-fdea-464c-4d58-08d8d2a68ee6
X-MS-TrafficTypeDiagnostic: SN6PR03MB3615:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR03MB36157D40CAA2CBC76B1D1840BA879@SN6PR03MB3615.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:419;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: geBY29W6pXaR+PpikVDzfwPT9xnaMlL6lgRvrmrf3xS39bXiQB/ZeZkPKQNTim/7y4j4ygtkH7KVV6qK9sbJA8VC7C8I0m3arqq4O98qqVXztYjq4rfQHIv4u7hSb+zvlI3mKMIvyYTiNvDxOJM/xvfEx13D7lfCM7vHi/yuVjrOKvxaOtZrBFSEPn5yGg7fp33XFFJGOjCsrotfaZjYoyhqEbsGa0m8xIUeoIL/9BKjkX/0xxZYmn9qmA5E8/TlYnZFTbf6djxrILG734pZGDlwhw32m2OktuTnsRn8hIedfp51/fp08qVLnrJGKK5vBYR+6A9lozxSzRTMZQuA19DjhgxxwMmkmv6oIvQKLbNLnV3NesqPyb67tgwjKIVIYcSaeO/jfJhvmX3qGbbs64h/D1yxqB44NwdrvKQW4S9pysXHDHeBBUrHJaDXIfAj4ymetOb5v+KFmi9uBuBUYgfHBYTa5uZStoqShDGht8LiAYPV9pn516IVkjnG1FKTS03/ViZE3dEP/oHmG0+/vw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(39860400002)(136003)(346002)(376002)(2906002)(6512007)(83380400001)(66556008)(786003)(316002)(66476007)(75432002)(54906003)(8676002)(6916009)(66946007)(186003)(52116002)(4326008)(1076003)(36756003)(8936002)(6486002)(478600001)(5660300002)(16526019)(26005)(6506007)(86362001)(6666004)(4744005)(2616005)(956004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?eCTZhN0aZH2fG1bSHWS6/q5RWxcBUkOYAXcLs/YOuUHFy1XcSxcBUw3N4vKQ?=
 =?us-ascii?Q?vWtlH0+HSwF54SfsjLJISsKIjP+ZDUuCTSLfI8ocVAM5jva3agC7Kmi4L4z2?=
 =?us-ascii?Q?HHY4PyojpqrKoH+Vzw7I5u53wkSj28268FZUzeePQeDXS9f6wqZGP6jSMJqk?=
 =?us-ascii?Q?bqTSseKbDZsfSeXxLf/Sgbov/tOe6lMkzIm7JJrCbY9HcUqyu2bakG1yAeQK?=
 =?us-ascii?Q?5Bf762gt4RqhieIKsXlBt01gB/UglWa7fMFf3QplVkKeXPDSyHGLs2fqTFS3?=
 =?us-ascii?Q?Rq5PdqJKQKKZoGIhKKDsx3Z/eMVhL6J5rkMb1AC9DEWxNTvXkVID5P1EsI5g?=
 =?us-ascii?Q?BceQb6yHaTyU9rFxm1WDkdB+Z65Kv+ctdO3cMbjza8V8DwL/feDQ/6ioOL5M?=
 =?us-ascii?Q?0wON5cH5IZOKPSsCcgbH3sVD2kYxgjGYJGyyDoQRtIUcWEEQswl1/vIxvpES?=
 =?us-ascii?Q?r6Ntpz9ykD8nVhzrE5k6QMTq7pN0hWuPyH9hge3lt3gqT5SnUj3ebVqKjHXy?=
 =?us-ascii?Q?a64Yf+8havQk7QjpM76hD2gKKYZj163OtqIziCUl23aBQrTy4nN8LJ3H1yzA?=
 =?us-ascii?Q?++DZiABrQQfQSZm8Kf4+AKjIX4FzCUpNh94kdEQ7oWTB0myrrxXhjk4IexQ9?=
 =?us-ascii?Q?6SxmNefN5WCRHCwfKzFxpbZS1NDNf34HwyCbI0BuErk4vHRJkfqzHa83HFSN?=
 =?us-ascii?Q?Be2y6VxLRxy4xJgBWJY+ZeaWcLREQvY/niJg2QZY10cPqW4DBNqIZp8ZTggL?=
 =?us-ascii?Q?IrK1RzT0pYvupyrWd0C3rIyRMSNL/tYSKgkfdBaLYW2wxBCFkQxt1HZxAHls?=
 =?us-ascii?Q?PWcPTcVfoI+8RV5xcd89HG6FeKwzZKCKhbFWA/gkSskI3bDicWq8gPWUSOiJ?=
 =?us-ascii?Q?bwnObJM7VqZ++JoKu1wXfx9lurGgtviitEdeyOYj/YBUbVpiRc0DQ7nWPOdb?=
 =?us-ascii?Q?yh3be26pSxT1f4AAiHGwmo7zNOczv8uesPiGm2iVCZmP9P00Dp9j2alFuNg/?=
 =?us-ascii?Q?Ll46Vo8k8trdhn+oqJWcBB36rKTZwOSG4g2MLhpG8/1eHJRUmIfxUjuILQvj?=
 =?us-ascii?Q?Gl6Q13fPFxEq22AQJsCBzYK7cm+u60dIyPbGT4+94wYnivE4Aq1lxymVUlcM?=
 =?us-ascii?Q?4vdinvQqc/g5iXFVMfSagoWqwiboxfFKsFhU/sW3vahLSsFR+HWn3YkTyoQx?=
 =?us-ascii?Q?iHo+Vp20yd9oMVG4KCL1myWGzZGxwgKD8A9NGFZVBXU5JCoaX6+LMOq2BAIV?=
 =?us-ascii?Q?kUh/XHqZrsWGmrI7QoDHHvUq4/bKgaSXBxa8rX93SyRSeqoJonybXWRXMiFJ?=
 =?us-ascii?Q?xYFJObdrU+qXM8e1egqfJOLb?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: a871192c-fdea-464c-4d58-08d8d2a68ee6
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2021 18:13:28.0125 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wp+rw/fsalP/zZMjlyHYTNxu3l2hLwFPH97JItli7qHmx7H9/GtuzMJI/rsA2T8g
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB3615
Received-SPF: pass client-ip=40.107.92.132; envelope-from=alxndr@bu.edu;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.999,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-trivial@nongnu.org, Alexander Bulekov <alxndr@bu.edu>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These flags cause the output to look strange for 'make check', and
they aren't needed to reproduce bugs, if they reappear.

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
---
 tests/qtest/fuzz-test.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tests/qtest/fuzz-test.c b/tests/qtest/fuzz-test.c
index cdb1100a0b..6f161c93be 100644
--- a/tests/qtest/fuzz-test.c
+++ b/tests/qtest/fuzz-test.c
@@ -39,8 +39,7 @@ static void test_lp1878642_pci_bus_get_irq_level_assert(void)
     QTestState *s;
 
     s = qtest_init("-M pc-q35-5.0 "
-                   "-nographic -monitor none -serial none "
-                   "-d guest_errors -trace pci*");
+                   "-nographic -monitor none -serial none");
 
     qtest_outl(s, 0xcf8, 0x8400f841);
     qtest_outl(s, 0xcfc, 0xebed205d);
-- 
2.28.0


