Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20CFC3DFED9
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 12:04:28 +0200 (CEST)
Received: from localhost ([::1]:39160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBDlD-0005p0-5O
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 06:04:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mBDNa-0006su-Go; Wed, 04 Aug 2021 05:40:03 -0400
Received: from mail-eopbgr30127.outbound.protection.outlook.com
 ([40.107.3.127]:26086 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mBDNZ-0006y7-2B; Wed, 04 Aug 2021 05:40:02 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XbGPYOa837XXBaYMlqeesFHsMh1BtnpJAH0U7euN/kJPWKK6xAerathiYik2u0pntJTZ+SQC0BXf+aZXdnbOHX9lO5zy+luQ13WyrLX1PDEqagAYuGvgBnIYm+Gr+ydn9Lts3078n016ZjRBJCQQTO0u96lofjY7mQ42ID4DN6KoUdpyiYIoS/hIMfrJMKz4by+AbE19USTLcoCEzTYa0F15bmfR78cidKwRNxJPg13Sw3d0J64bg1XezARjzd3NRFbpLWF/K2E6tK/HuTFz2geZTCcoArN/tXV7xVOG3YSXJW649RDzkvQEoibfkbnV+WRlNH6s11GBuctjvk6FOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Fdt/9kXHN1yQLBrMNRdUEjvnHhIP48yC5QLgDEN0ag=;
 b=SwSjrF1p86G5q17imnH2z81xldmlby2NAGa3IMEQcUjBoE1jMzmMipW8mrpuXWUQDNd5g+ivj0mlUC17Lic7sKSj1mRWXpt0IPYpDYrG2JklxcmNkthg++l4MJmbY0jz2WY+bPFhfE1fcM8MpD+zLX488edG8ZbG3WdRpBJcQhYkDFYrbfQk4dmLBWXfv5is6vDkw4kVaxtR7mwIAGfX9ZRwfSvJZo5driB+3q4uy9xMq0nTTBzlObLkl4AfQZAFs0flOIuDmXyVTozinoroSk4UH+yoRZdz1P7lxfi+Oc0hYOWVbwOPfert58wefqbiQ1Iy8AITZYCbZia3SBZTuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Fdt/9kXHN1yQLBrMNRdUEjvnHhIP48yC5QLgDEN0ag=;
 b=AzQZBcqfsEHJhPKWvlupGhva2lcVY+UK0BEmvk+HzVPP7aLC8E4hrUL+HGUnA6iNdDCEBdMDRaMXUJ5jFKjdUcUN1RpNCr4MTqMRnI3TCk43x1r1PSuN2AFMm5GVwdPKrdZdNwl/2iWzqPScEDakyzzs5iaeBMuShuQhrGgOFoA=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5336.eurprd08.prod.outlook.com (2603:10a6:20b:105::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18; Wed, 4 Aug
 2021 09:39:53 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%8]) with mapi id 15.20.4373.026; Wed, 4 Aug 2021
 09:39:51 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v7 32/33] iotests/image-fleecing: prepare for adding new
 test-case
Date: Wed,  4 Aug 2021 12:38:12 +0300
Message-Id: <20210804093813.20688-33-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210804093813.20688-1-vsementsov@virtuozzo.com>
References: <20210804093813.20688-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1P191CA0011.EURP191.PROD.OUTLOOK.COM (2603:10a6:3:cf::21)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.211) by
 HE1P191CA0011.EURP191.PROD.OUTLOOK.COM (2603:10a6:3:cf::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.15 via Frontend Transport; Wed, 4 Aug 2021 09:39:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 77671e93-22f7-4db5-edc9-08d9572bbe27
X-MS-TrafficTypeDiagnostic: AM7PR08MB5336:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR08MB53369698FE12BDB0962D40A8C1F19@AM7PR08MB5336.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:478;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qXF525iXm78zARoIHKIQTaVr0cMhe1WttLx1NmecliDRhNnIQ85vjmZ1UqLP+4mBDXUr+oDb+FsBIEPwBS8+X5L/d3ocjfxcP1NHNwG2tfvbmrMmE4qx2GKVjZq/rjlM/e6au6R9avdPyFabjLZECZw3TE3t9t2pzjnV5q/Yi+C0fZzJVvIIQ1X8mB2z4Bq2FoTMgkCP4KDulZ0zMpfqoBTR65lgJ07VdtcPkIpi4KPWtMp4ccj+qBTkoXwZZwKt1RMl4hxFZ39DWxHj//PfCy5gf/rpnVCvs63wbqvtrG0JNRiaoYnzRq4/X4ITxTcDwwzf7lxqrtGh5LiIRW+d+LIJ6Y6VqKTq+EXukIyxtuvVYGXHXUTyUoWczevGkycS3t8bgF2ByVO7naf6M52e9KxXWMqnAdtUxItGvnTDbI06NJhgVtHiIVsuoV1Xh92dXBUoakq43skBxZ/yOFK4xNAfUqqoQXbVfDoxhXFuZIuM3dorNZXDEeXJ9+UefDMbnHr1aV45g3NiLP+rRLdwYb7Bn4r12Io37TOETjj7A9NPeoIie7Q+EHeSUeRh89NN1Ad7sNgfMxsQu5vNETanCm4vAopYN88875GBfyONnKV2yc5Pbk9ZVeWxNM2urwk0NdKT4hpDjzU9Gu8b2O8s3fWuiTT6bejzXn504KUjZEBwYG8F3Uae0XCJbTbr3V3SO3E8Xm7frQDRAoOLMbnlGQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(376002)(346002)(39840400004)(396003)(316002)(36756003)(956004)(7416002)(2616005)(186003)(6666004)(38350700002)(86362001)(6512007)(26005)(38100700002)(6486002)(1076003)(52116002)(478600001)(83380400001)(2906002)(66946007)(66476007)(8936002)(4326008)(5660300002)(6506007)(66556008)(8676002)(6916009);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OFzmgA38GORf0quoHEJkGdP7GfDkvziGdPYI//Hjig4oD01f0iIqkjVKkW6/?=
 =?us-ascii?Q?1NRMm5eXpt5c0g/9G8rkAMGnbRwQwIFOh7ftsufj2oGJezyYio8C5W6ex1i0?=
 =?us-ascii?Q?ud7ghxVGpSo2rgbsv8vXq4RUJE0T69N3VsFvzU1qQVh57vL7dYIyu5lETSOE?=
 =?us-ascii?Q?6poreMI83bPHcr0MhKo3jCD+0XVHqQEwcEHirhiLdxtw0GKtIf74+VM7P/kq?=
 =?us-ascii?Q?sKLyWiQxv7anLzEIHgy0CoIieDztKNAcy18yZ+sle5LOmhfFeYyTc/5q/1SZ?=
 =?us-ascii?Q?TChYPEFWPTljdIGCC33iQhZnatV4yFuw5Nr3Nckr2nAxzEJC0de6pA47OTOr?=
 =?us-ascii?Q?k3L2FBh/lKq86xSZe2UHj5T8J+Ag9GG6WUBu0cOuFzl0RucBo06Tam50ualp?=
 =?us-ascii?Q?fxLxtoIlGvgXyrA1HBjHVakpRKWJi8W1Z0Mclb1CXaDUQV/Lz/cO+N+LJp7w?=
 =?us-ascii?Q?UG8Tg3GXyoqAR/6DYvuCvN2fxv20enTSEaKB2WCUWnuoTVx8LYphWjTg1Fuf?=
 =?us-ascii?Q?KkucqiNauH3g6y6/eLV5R8Ej9D9Prm5xza8extzDe739PzhTxyvwtezKjCR6?=
 =?us-ascii?Q?I+VU8Y9sm8KYqycCh72EjS5/53MB5zZsIuH7ykRAWMLxzCVFvIwy7FicRpBW?=
 =?us-ascii?Q?O1WjViWhIfSiRtypKj2VbiUL2nnAGt3HVVhI4BOxrHPrqUrT/v4jagBW0I5U?=
 =?us-ascii?Q?r/NvY9uqzDrrhNpudJlwCJ5WozvrglM5hhvip9rK3eQBVTxFwnR0AZk0J/H4?=
 =?us-ascii?Q?SIhWFHE0vm7C7YqZwUhwVzLdKWmkIsLcIsSjDwbKGiYhZbJPcf2+CI5imVoa?=
 =?us-ascii?Q?xgdDQOUAWzY/T2hBowY9BB3f0QMnjaj61KjggXyTkEDug2CsHQMSoGjnUemP?=
 =?us-ascii?Q?ETURxSkOs0md/9jrPC1V5mTfo97sXvWI82MdUc5u2hkNCMwtWHBI8flGEz3z?=
 =?us-ascii?Q?j1yxAn8FkalPpeq+YCm8Jyl6jdwA94DakUgoZrTv73tjdH/Xyd52BHCGmPuu?=
 =?us-ascii?Q?HvoyY9mXRIbnI/d7cBM2kmjom9gT2rzTLgZtjtt3fwvczYEgJ0fJett1hcc9?=
 =?us-ascii?Q?fftSdRf+pRnzJ2I+B9wiuzlS/hwv2CFw3xkP2+WQPzsz7gJW6ipT9DFZ6p14?=
 =?us-ascii?Q?02FrhC0V/IdRUcH9OtYUaKkjmlX5/NTrwaQG6tmT5wqW20Gy1cyhD9Zz5yS8?=
 =?us-ascii?Q?CnkMZZWC4hQZ8ByRCpDGduZQ/Bo3SxzGvsxydCADhaomF0nedYLKm5ydRyx+?=
 =?us-ascii?Q?sTs/tU5CyeMEv+w1sdsHFJ4oEVRDf9j3lR1ESdI+gIH8k9O8jg4TGsjCG5eS?=
 =?us-ascii?Q?nbr/QKHFwGT0ZUzTk9hWgo9t?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77671e93-22f7-4db5-edc9-08d9572bbe27
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2021 09:39:23.6547 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W2Nply/aXQL0gaJ/BL5XFL5fLN6a5FmXoKZ6HphuULPo67Jfqrhzm7Pn1DByMtgVXvm/yuR7IFQM9QePuHzRj81n2sUovOEZPNRNjZHEBfs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5336
Received-SPF: pass client-ip=40.107.3.127;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-AM5-obe.outbound.protection.outlook.com
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

We are going to add a test-case with some behavior modifications. So,
let's prepare a function to be reused.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/tests/image-fleecing | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/tests/qemu-iotests/tests/image-fleecing b/tests/qemu-iotests/tests/image-fleecing
index ec4ef5f3f6..e210c00d28 100755
--- a/tests/qemu-iotests/tests/image-fleecing
+++ b/tests/qemu-iotests/tests/image-fleecing
@@ -48,12 +48,7 @@ remainder = [('0xd5', '0x108000',  '32k'), # Right-end of partial-left [1]
              ('0xdc', '32M',       '32k'), # Left-end of partial-right [2]
              ('0xcd', '0x3ff0000', '64k')] # patterns[3]
 
-with iotests.FilePath('base.img') as base_img_path, \
-     iotests.FilePath('fleece.img') as fleece_img_path, \
-     iotests.FilePath('nbd.sock',
-                      base_dir=iotests.sock_dir) as nbd_sock_path, \
-     iotests.VM() as vm:
-
+def do_test(base_img_path, fleece_img_path, nbd_sock_path, vm):
     log('--- Setting up images ---')
     log('')
 
@@ -163,3 +158,15 @@ with iotests.FilePath('base.img') as base_img_path, \
 
     log('')
     log('Done')
+
+
+def test():
+    with iotests.FilePath('base.img') as base_img_path, \
+         iotests.FilePath('fleece.img') as fleece_img_path, \
+         iotests.FilePath('nbd.sock',
+                          base_dir=iotests.sock_dir) as nbd_sock_path, \
+         iotests.VM() as vm:
+        do_test(base_img_path, fleece_img_path, nbd_sock_path, vm)
+
+
+test()
-- 
2.29.2


