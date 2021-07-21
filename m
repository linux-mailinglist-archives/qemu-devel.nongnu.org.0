Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0F63D0C85
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 12:44:53 +0200 (CEST)
Received: from localhost ([::1]:44058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m69ie-0002hi-N6
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 06:44:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m6980-0008UB-9X; Wed, 21 Jul 2021 06:07:00 -0400
Received: from mail-eopbgr40103.outbound.protection.outlook.com
 ([40.107.4.103]:3138 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m697y-0002NL-17; Wed, 21 Jul 2021 06:07:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cJcjpO2pT7p1UL/l4Sr89uiLCK/NC1A4vPkOxHbR+wkc/qZEhw11VxTZgITAJC7wfEo7bUKQwUIUbdmWk/VJkv6RI0E5BfLdcVWh3fkqjhMZr4VI/XQ1RRZTtD4vpE5bbmOA70bRnQeTQJI+gIpIQseEXSzr4NMswksjysI3ALz2JStci1hGzSRiWG38wsa6R1DaYJjct6MMfnfVkBdAVjs3fwWbAaUrSpGjMW476kl69LNhAYcQNx3rd+SBOjOMaWfkEoUbp5HFIpHmczuKIzbxalRQw3ANFamZguwmqMPiTInx98vDCM8IPkczcBRjFHxWLj+vPrDDLAMq+AgdNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Fdt/9kXHN1yQLBrMNRdUEjvnHhIP48yC5QLgDEN0ag=;
 b=ZRxLAh48UY3kzHaVs72+cr/jJ+JbVcHSqd1czUx8k5TLoLZ4znMjt2QUNbNl3pgFwbsAzxxj54YchLlYT5iwtbHMSQQ3Ze95BTVwfV8/hDKdAr6vL+d7dqOst5MFh9Mx6osUEEWoy2Ezbj0Fj2Sz6wVJ+5oat5qiJR+raJrwMJbJUGkw8FL/ZN6ulQNWM8P3bpLUhicOp41cglOyCDA/5AiTGRGYAc+mI4y0UJOrDvuEnzKBUuqyUVEWdDQm+/YMRR8e5DLMS5M+ZswZmtgEi0tib+iHvTjNGOwjY8JIGd0oyX7T9jOQjwNwkPIRiC/NsK85Ga72NvF0GGvwSytipg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Fdt/9kXHN1yQLBrMNRdUEjvnHhIP48yC5QLgDEN0ag=;
 b=QZsISN+IOyZjFMGoevkqhMgzMOGBGrhULUgTCchkQ8iZI4+MLSY5E4EO3NE/VXddXVNDj3jeKYmE1D767Mm35Fw7gSAYzwnMsLG5+qHnc5ZUXGI48Bkj+XyyFQ3EETg+Ktmgbs+4FZM9/a4Q5kcHAvfX9JQXhXnPXGoA5OiF6zY=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB5911.eurprd08.prod.outlook.com (2603:10a6:20b:292::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.26; Wed, 21 Jul
 2021 10:06:54 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%6]) with mapi id 15.20.4331.034; Wed, 21 Jul 2021
 10:06:54 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v6 32/33] iotests/image-fleecing: prepare for adding new
 test-case
Date: Wed, 21 Jul 2021 13:05:54 +0300
Message-Id: <20210721100555.45594-33-vsementsov@virtuozzo.com>
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
 15.20.4352.12 via Frontend Transport; Wed, 21 Jul 2021 10:06:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 33ad3083-a410-4a25-a05f-08d94c2f4486
X-MS-TrafficTypeDiagnostic: AS8PR08MB5911:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB59117ED69E8245CC0E97DD11C1E39@AS8PR08MB5911.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:478;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WzSjb0XB/GFYlRqQjXt3hlXkIIjlNsiUbZ3lKIi2v1XqkzPdyyY/pGRCyAxVyKxZYWb9y+Yl7vxy8W86/G0M2ERyN+ojGFgoDRof5pzLTJyHcYqa8d8koh8zCMzpi4fIednDTG4XEd5GuTjSjo4i5LhLRM2lPub3jkb4O/qw6qoxX1waxrDbB9oWOqyPWS3eHEiE1QkZUTpZ7Du0Tb2+h2pGRFTsMzJO73HpstEX3N9RNIDd8UVcWg4CBxUmzA5ELthTXLkNaN0EZYx1YAn4ukoRuNnszJ7dMuo6ppiPEQ7x8tqwyjtE2+9AFZKAwN1eWOPUXOqc2VMtrA7R49vk5JasyollNIi+7AacIieztmcQOdNRQSU4n6YxLEESVZPaFkIpgkHYmsLBWcrJuT0zFCLXXXmQR6kdObkhzQNtVDZv7toXPFkVpEmtGYiBqp4qK71dqgjICyigu+8PmFVVvfa7j2yKetzC1YjxwfezKk7SoSXL/A/an2lqrfV5nnUQ/+TA++Yytgd0IB8qZQri9h/HqQptGpMNBXDXQkx0fQNvl3D6wiVYk7oEAAQKm47ZgL2aJBOyHM/0GToA1SfPompTqLj/pZYHRIFVEzsRryeptn4n4cnCuAukOB60PFJyXQ0IWjNSMhva1JXi+4ykHy4Z0GY+Bg5WzFt0pJlUvrqTLLI2LOXTezRnvaOMmBHXEZc6kiAhqV0+c3d892ltKQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39840400004)(396003)(346002)(366004)(136003)(66556008)(4326008)(6916009)(5660300002)(7416002)(66946007)(6486002)(8676002)(6506007)(6512007)(2616005)(1076003)(66476007)(52116002)(36756003)(26005)(478600001)(83380400001)(86362001)(2906002)(38350700002)(38100700002)(8936002)(186003)(316002)(956004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?a7KS0lEjHcXNYe4B1meM6fVGEkEE3JePi2k9FJSxaT6KN0VtG3RVxf5OLeAe?=
 =?us-ascii?Q?daKru8rjcWoHkurGCI7iac3mtITyxLr4vIjDkf5+nObeUe7D1NJxPiQAVWlE?=
 =?us-ascii?Q?MthrZSG/2blEC7GYJWTCFqMwMHNJLLXC6K/MNIEZh1YJ2Ih/VWQFyT/LUxKX?=
 =?us-ascii?Q?EN234xKxRhR84NK8mygRX6FpRThp6yNegLucFX8/zYRmYWXMC6CZu6bEXiTJ?=
 =?us-ascii?Q?qlSR2JzuH9flYwjd3wXFpERy60yF4hPuWVoKedMkyDGxk0EccYSBcjfFye9d?=
 =?us-ascii?Q?rPzCKaxn9ny6ZfpD1a7drcXagOdEqOFJYIEivzHhgwtedibKHaRPJcPjyFTK?=
 =?us-ascii?Q?bXcZhrESgmIqpCvMh8jsoWvmn8c838EgzFAKd95dimzHrL5bu3/UnIi50JIl?=
 =?us-ascii?Q?AI0lA12TudXtqpUrViSleBelvuLJLNImkS8blRZbTpvTHKgbVku1O7rNePxa?=
 =?us-ascii?Q?wICz88W3HktedBAWHsWghLlMkHh5W3GPHvn3A2v3ufCKy2hSSVXZ9Zb3ydZF?=
 =?us-ascii?Q?O4qTfXk3gKMQMmnTY/gXgNodmI5y7yiI7EoJZm2MBYK2nZ21VowQmS8wffsi?=
 =?us-ascii?Q?uArKJ7wLj9dkY9jHi4vkRqUIke+YzzQNMwvnjrC90wcBV44FZPTxGb5W5Tpy?=
 =?us-ascii?Q?TLrk9tP6AEG1kq6sHM+d+qA3GhIbq9GpDnG2rySfO5m+6K/SmNi5cAagCxp7?=
 =?us-ascii?Q?hyp61rw9OIk38aj66hDSzv8cAQIAUbA/po+5y3774EKL8IxUa6z1Oiv/EW1z?=
 =?us-ascii?Q?77QuTJRI2GW6UBEqAyf27K8t6rSGhSbvyj1sVFIJO+V/Gh7bJNJ+CdvSNq/4?=
 =?us-ascii?Q?oEf/m76mUboDi4BkT887RiWLURboHQRBW5jLrKeVPwo792ETPutqEgWAjKW+?=
 =?us-ascii?Q?+3XBo02HF6o8bMYIFZNGOjBPs1h4aPvNzaYwOQO+NaPKXnAQyPn3OA0+SkB8?=
 =?us-ascii?Q?EEx1mSV0ZSta70eYNKE7uEjtfYLPBQF0OdmKSxnqHb/KpxHOlU0danTZOFCX?=
 =?us-ascii?Q?wljwMqt9LNTAX7KsxcN0CDFQorz2ifAARW9mb24CA5P1pmLukPMlOe/QTPBR?=
 =?us-ascii?Q?UX0zP+f4xrPiNtAcvJ4cJuXvuAM2PtfoxFwvK2i08V5HieyypMvQop71v/+b?=
 =?us-ascii?Q?5zuRARkuf0FgPUZiKJeDlHDGcWYPxihHYB1IrRLK357ukZaKcOLp+Y0bJsX4?=
 =?us-ascii?Q?neRuaypQT2XekDbT9d1nG1YnOVxYwGJ6TNwqSHfTGGA9sZ5wZgG+D1vrRrnJ?=
 =?us-ascii?Q?r0JmGVGSDaE8iKYy0VgviBFqX/SzkwKg+3rhXKDfTUtUx+wzQdAAekC0umP0?=
 =?us-ascii?Q?KAgKnx5QUbAm8TJtFz5uWReX?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33ad3083-a410-4a25-a05f-08d94c2f4486
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2021 10:06:54.7877 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DA20o1W8ac4cMCLg6H+3l7qNM9X9t4a/RUSe5nmCUEvEo208i17YxZNglwmcN5kVG2PMbsHVfubHQdKP9VSZOJ4602Rzpiny2iLjCsLHycc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5911
Received-SPF: pass client-ip=40.107.4.103;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, MSGID_FROM_MTA_HEADER=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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


