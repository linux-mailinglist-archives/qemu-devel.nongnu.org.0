Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 080BB3F5A70
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 11:07:33 +0200 (CEST)
Received: from localhost ([::1]:56794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mISP6-0006ik-2S
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 05:07:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mIRz5-0005EL-AX; Tue, 24 Aug 2021 04:40:39 -0400
Received: from mail-eopbgr130131.outbound.protection.outlook.com
 ([40.107.13.131]:22309 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mIRz3-00086z-Ly; Tue, 24 Aug 2021 04:40:39 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T2f6psVDq93/4AmE5mpc/MZ0merakFV+Gme176uxQpinDQ+vKCl1EzoYmYsGe885RJClH4u5179NzUtG7Amb54ueaOX90Mq7zC9PzCZHQREV7Eqvho1u9rN/Y7ysqHEe9Du0kOJ7snQhaDU785CazwZn2uzNE+jz8hf1ZwCT2OSt6NRWgSOvzQCxHnW1d7QIjBlxEWE61PDxoDMr9aJZ+XsNutufkR1rZrlsA6P3wYoozRnYGIUcN+sbmjALIvXVK7W7/oM0U8ZrbpMV80d6Xb/R7vSlKoKle5alvbliBpEr6B0JX5bn3G5RePRILdOEcAK+KtHBe1gKEtOyvhSrEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Fdt/9kXHN1yQLBrMNRdUEjvnHhIP48yC5QLgDEN0ag=;
 b=iQCJJyR9YZ3LpMvOl9I3gada+hoZrZeQPo8dw9MrHTqPNc1OTS/061YxY7Vdy+vAtJW+ilVgl36VmCRfCppWBleJzstJY+0b3tEGIR9chEMDqz9lxJX6hkKGrzjeokLmeIRDQV9tnwYRe+kzz9gJ+F4cyZ/e/cIpRpyN3lZWmCtL3my0w8wq+A0hMGAlyl1suGiAxHzd4sinwZ0MkaThRacmWo6rr/Yhoueaem5aE6zFOMT/Nc/mHutK49N/hoBB6jC8+h1MyKFiarMr1pjN6P8jkJd5iCofpJ/uKrM+Lydnnl8cHXcodsqunm6lhbuFOxC2ZOaLZHHS8mLQEuRWvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Fdt/9kXHN1yQLBrMNRdUEjvnHhIP48yC5QLgDEN0ag=;
 b=MTw7lR8oQKrwIOaQq/srv/2khxG9srIU+DsMutqRvT1lDduEgT4fnnK7BR5GSdNJEAivLUbKDYIcwdZYPWmKiaG3sg90HMQxBpnfbmeYpV44tzZG6vF2YnoKGoToxCXAo69zVBgoYFHQcUMAV8ICpwEwz4gBMC6Hhf8eutSDgQU=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5077.eurprd08.prod.outlook.com (2603:10a6:20b:e6::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Tue, 24 Aug
 2021 08:40:30 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::3c5e:7829:362d:1423]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::3c5e:7829:362d:1423%2]) with mapi id 15.20.4436.025; Tue, 24 Aug 2021
 08:40:30 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 hreitz@redhat.com, kwolf@redhat.com, Max Reitz <mreitz@redhat.com>
Subject: [PATCH v8 32/34] iotests/image-fleecing: prepare for adding new
 test-case
Date: Tue, 24 Aug 2021 11:38:54 +0300
Message-Id: <20210824083856.17408-33-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210824083856.17408-1-vsementsov@virtuozzo.com>
References: <20210824083856.17408-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR05CA0178.eurprd05.prod.outlook.com
 (2603:10a6:3:f8::26) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.249) by
 HE1PR05CA0178.eurprd05.prod.outlook.com (2603:10a6:3:f8::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Tue, 24 Aug 2021 08:40:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 971e8b8f-f972-46d2-c4bc-08d966dac464
X-MS-TrafficTypeDiagnostic: AM6PR08MB5077:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB5077AF61B0B7E2A9FCE01749C1C59@AM6PR08MB5077.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:478;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OhOqStHa8IEKNWMRCjbbq297njzhoaqDf5nwt8A4WKChT+zhe/+ZVFqnPyQCbAeDlY1SqJHq7syAwk7MIvdDhHhIVJRru3WS9uygJf3TpH+4BrrwdR60JnfQBUQJKnG7+muO2uFcD0qHrKHr+z+f/4pgTyXGHdq50Qh9n5wu9xhbpltzer4XE42ZDzJJl1mLTEJc2cWL/8GNSEfhYsbIgGs2dvaX/t5F3eS3c+zEkdpRaGBjtU01ohyagLcQthVZ0yE3FxsJ+8Dv917xIABfbgPS/rBFIGEuBM2EK5iFTesoAHIizMHjWCbruQL1gSgEmk+liaNbebCHEmtqFI/n44BLM3ZCenqFVgkuCIvDC586w/WuhdU7aqrmswYs2GLvAeiicf8uhnVx8wfsA/uvcKrNIhKxxuQexILPWDnbTkdIJ79bIQX7RxBz1+udF57ot/pUam7zOMaAszc9MkqmDrrfDJQ41B3+ROjFYUI7QZ/eE709A/jE9vST8M+5eMiFFm2G9rxanoeeft7v6FLdrUC7vaMaam2VWRC9qaRgD940ZdQVCtFEbI58EjPBLWOsdXZpaLn/jU0aZOiqiF8c6Dzg4OWHPtumNdwBvmFtcdfv4IXWddbMyrQclc12s8VoA9w5301ME7u2QK6zkSA36VIYA3HYcJ9Hih3xX2ugvwcsrpf2F7VqNjhSmG8CZe8SyS3XogyuM3z6LHv9rk0sEg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(366004)(136003)(39840400004)(346002)(956004)(66476007)(66946007)(316002)(6506007)(36756003)(2906002)(66556008)(6512007)(186003)(2616005)(1076003)(6486002)(52116002)(6666004)(86362001)(38100700002)(38350700002)(8676002)(4326008)(478600001)(26005)(5660300002)(7416002)(83380400001)(6916009)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wA/IqnQ/nEd5wfpjPSU6mxm8MwbA/f+GbXKYVkNLmyLH/hlfQuPAo0vbBVit?=
 =?us-ascii?Q?JhBJErKrVPs4t21pFEQ+BmOQ3jB+Irhh8QmhbPTvMwb/LTBOLE2vj0q3+Jwk?=
 =?us-ascii?Q?eqAyE6clpICK10sD/VNxdchxmDdXF/5zNR/5UWHEvnunZn2Dw0BvElz/29WM?=
 =?us-ascii?Q?zxew5R/p10y9+xe3g5FaA1tqmdzZMXyar0s8EoEFnbCN0Tyfaqp6Bgl1asgP?=
 =?us-ascii?Q?199+OY/gQ8IjNzbCnK4MIJlWhGD/2nhw7abW8Ym7qDWlONTiboON6k+32RAu?=
 =?us-ascii?Q?YjUbiUSf9Sc5mr13BwgoDDRkvmgCb9xn4ajW6mIcZY/KSA0BlLzfWJcKpNHJ?=
 =?us-ascii?Q?P/lk0KmPwnlt3vGVvF/dGeY+w+JZ3YP/EwqEbJJ/OxIb04nVUNBBCkQ9+7m+?=
 =?us-ascii?Q?iH9yYLU/6y9/ZyP6Ui6k/n9BVCIq2lTEkBnw1Lro0+KBIBOTRtvRp6NpjJpa?=
 =?us-ascii?Q?RQ8GzDWuPRS/yvqQo1wLIX/etGVBYSse/IJnVXFQqbofcxRKKezlclAYbFra?=
 =?us-ascii?Q?qjuCYdEFQMq7CSnw7PWI/z9dlatB1qbmMISPY9rzC0RpPVoWzgyBTby5/A/+?=
 =?us-ascii?Q?cni8il+03nYq67oSGkm/HHK6nfGeeeZdCaO4Z5d8oCmaBxlm/Jl+jCcU0Jyw?=
 =?us-ascii?Q?eei7eSnaKlumZ5mpzfceQieVtTaZ2dKanfLWOiETPekGrpLJTjIKoZ9bfYmP?=
 =?us-ascii?Q?ZYNLJVH5jw1QsCvVnnzdawLinbIYjsgXFCSvYdwmVHlpnKUz/4LyfZyGDKTD?=
 =?us-ascii?Q?gRN/8dSHvbsTL6WIxQ8x4xC0kz5XBRBvJVg5iB2KNdTLdE/NqhHbIiZ2HwjC?=
 =?us-ascii?Q?vMAMOZCJtzn+sL+ch5iyyJFGn4V72jgMm/+w/qEExDC6rGZJWwE9hJWltz4n?=
 =?us-ascii?Q?hlXc7ihHeSgXLEXPdjgwXfbCnFo6WvMNcwvfXdv0LaOspNLtBKgfhVnhtwMu?=
 =?us-ascii?Q?pqEMS+l2XGsYOzLpzBBbhuTEm8hr808E+f4dULNXqfAemWq8a0T/yoVbS/Ac?=
 =?us-ascii?Q?QOpgCpR2RS6fsqcPlydVCZ+Dm+oJGZ2kTA7OM0eDRVeCUfTEtZhtMm4u3Shi?=
 =?us-ascii?Q?SU+J9+QnnsHIxc/v2L54ZMTdetSxuKD5f640vNxS/OH6r68hfdDxe/wjX47u?=
 =?us-ascii?Q?IA47RSyKrGkPlMMtpbO3UlwWPzr+EyCXaxbSrYg/ZSSmbyXICMrgPEhJj7cq?=
 =?us-ascii?Q?1zBf1NxMOJ/L/3k1jHlbOocnOQoxWfad3SmNFw+T7W8JOFqHrp3mHPoyLd9W?=
 =?us-ascii?Q?5cQjOUNZBQk7Yuouea8bqTLtBjolJSjlpCoyU27xFbwdOZwCF8wAdcRVPj+k?=
 =?us-ascii?Q?W2pyd2p7pPBd1WFjDQ1xjPkl?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 971e8b8f-f972-46d2-c4bc-08d966dac464
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 08:40:03.5289 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yNqrI14cPBINLKAW90KsWZz5JzLdCuxInqj1ct7hlmXxuPMkfiiRuI4pwMyxcUIZfO1eF2vk8y1nORtpaiiaPv/AWJyRrnz9y+rOCzBOGZk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5077
Received-SPF: pass client-ip=40.107.13.131;
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


