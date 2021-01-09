Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 916952EFF76
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Jan 2021 13:35:40 +0100 (CET)
Received: from localhost ([::1]:38650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyDT1-00089l-LH
	for lists+qemu-devel@lfdr.de; Sat, 09 Jan 2021 07:35:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kyDL7-0008AV-Qn; Sat, 09 Jan 2021 07:27:29 -0500
Received: from mail-am6eur05on2131.outbound.protection.outlook.com
 ([40.107.22.131]:49601 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kyDL6-00065E-2A; Sat, 09 Jan 2021 07:27:29 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QzTTxWZRRk9ROb+LWF/VTI6pkOoGx98x6UDjT22CQhyK1RatnPnVUz2bilnvXVzZUePtPurT7h5BtnGI2Dy6RWcg+d6tR0u/lN0HXrhRWW3ivczkBcj6zfb3OCSXSEniz1ZAqg83oqTzk61nEizquSemmd1AKCPqFXxebFsspEmuRZUcqyz1PcDHjrivcE1CGBeMN2SdottlbBNIWCLxSt3vfAj98a7oZF9wTGG1iqkSfLro0HZ09pa8qeg1B7knbZUvN97moaq8HtyJPr3D61T4+SKlRyVtec0aNbwgr5Y5p5GbmXYCX9ZeCdgUxayVGNJfUJDEuwadltAyMZMDsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xXvtTaKYXIQiU7vjXUuKi7Se61OBHnn5jh4bB6a4oD0=;
 b=fl80RsMj74Ni2kUorImhXBuOjCjXFZOWzNL7T6w2Wz0bIT3ufhYCuUIo34YXRyx3xXTtue30yjUNGIAGTgK4zj71hQcW7t6v/WnXbQhBMnj7oPyJ33QD5jdLz46jFNGBaXVgeixtdykwsdzqYmVY6yEfTgO3iwOv109fAfNiKl92rl5WJg38ZM6fAw3z3vjrvcSPfIl4QtSF8uWRneLFYo0v61Y8hcCciXBhU0HW/W1G7svz3WPmhO0vD6FoxBDCj1YzGk8Gyi9RA9ZIFLGGhKWjFUiseuQ1nMpwpCDwNiYPWGsaG6BWKPay/xeRjtD5tnvnQfKiOEnDDl51hLeHsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xXvtTaKYXIQiU7vjXUuKi7Se61OBHnn5jh4bB6a4oD0=;
 b=qmbSXkyO2/d11SESpU8+w0NOizaQ7lHxsvhBnhcwasooTRI9P89dUWrEK7g6Wpm8niJdopYz7LwvRS69rdTQNYYyTcvrFWc+4x9INW1URl4xVOAcdVIkZdJjbik5TZJNU6XahqtsaQmZoGkd4fEe8fT7bGCQ9JZoOMzYBahOljk=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0802MB2529.eurprd08.prod.outlook.com (2603:10a6:203:9e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.11; Sat, 9 Jan
 2021 12:27:07 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%7]) with mapi id 15.20.3742.011; Sat, 9 Jan 2021
 12:27:07 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v6 05/11] iotests/294: add shebang line
Date: Sat,  9 Jan 2021 15:26:25 +0300
Message-Id: <20210109122631.167314-6-vsementsov@virtuozzo.com>
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
 Transport; Sat, 9 Jan 2021 12:27:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 92a28e2b-e740-4726-33a1-08d8b499e153
X-MS-TrafficTypeDiagnostic: AM5PR0802MB2529:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0802MB252919FEC636F6A93C18DB18C1AD0@AM5PR0802MB2529.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:296;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: B4yswDC86/X8DRnn8gGVuW8w0PxeZ2vAs2VeJmAx8dnya7vs+3QFZM1DASfajUWhaUza/iC+vyMXPc5r+xOwMM3eHVY3Shv0ovmz1gnijWELUPsFdGsb6QvUNAY0Or8I5UiLrcvFvTqNhwTbezPWLY8JtMCajrRtsOqgK3xAWggYHkE3d0PQThEVytlFe5I/vi6pzBNh/u7/TEICNZ5Jf1UiBz5/QJNuW9GHq+3IDDSt1xHMpviXTRCUg23Yft1xzZesgm1zvV5kj69TpTFY8XWUERYshTfxK0RGUIpsIZGUNU3Akr9yhm+y5o+Z7DJW465zpGtX+fVIa3qq2tP1R09vQ2Rkndas+c2eoisLdpTHrpNtcVRaFIiHF63sCwQbu+i4nFauSKtCSeVRQd7a1w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(39840400004)(366004)(396003)(376002)(8936002)(6666004)(1076003)(6506007)(52116002)(478600001)(4744005)(2906002)(8676002)(16526019)(5660300002)(186003)(26005)(36756003)(66556008)(66476007)(6916009)(66946007)(2616005)(6486002)(6512007)(4326008)(86362001)(956004)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?nWsOZJJeBJzukHs9WDYs0iCuzn2r93rf9v34Wa6nVW/EtXTe/y5DnCG7khYL?=
 =?us-ascii?Q?oBg2UjKIou8kJ26290APfXLc7MsecdVWRpo3IjhzLH92fZUE8yR5DIcM0FVr?=
 =?us-ascii?Q?oWXwHYz2dlokGhG7fnxI4H7I7n26ldUMecgomG1Ti4mdpLPEGdCeV1EjIvH2?=
 =?us-ascii?Q?mwnSDpCAQRj2hhXi1JzG9QmEMkep1q8lHoz6Mr0cKjvxl02ypr3yfVt6vcuc?=
 =?us-ascii?Q?Z2PPve3foAQJy8V0gImFnwq+IrDy3mLqZr1+XkkELtIvO9eABt++YXO2+Gox?=
 =?us-ascii?Q?HSYWDzOMkC9HfBbFXv1R81U/AafzZhB59UFfogutXCYEu82n35u08yGNaoti?=
 =?us-ascii?Q?gZdwEeznJ7tftaNpfGhSRnHZIRK0gBYsVtCl66xB9ZA0FZKjlnpcT7wmLhOQ?=
 =?us-ascii?Q?E0hwyFSKpj+hhBpaQNoE1goBrl+8KGBgYFTnMqEYIfA60xr6EoICQcwRdP/Z?=
 =?us-ascii?Q?rbCvm4qCL9398P10FmPsoSYUOunOgUtPoHG+6VYQG0AZiaJwfEeu7V2xvVym?=
 =?us-ascii?Q?AjCXxEFnkqUTtiDU8WyaCj6bJqKKxCmqzbPSl2fZKiGHPyNHa1ZOqAbVNfS0?=
 =?us-ascii?Q?Sw11GO/dJSs7TkPsFE9Z0JwDTB1+Otwcba+VDGAN+jdKw3ivlPRhhgpbuS+T?=
 =?us-ascii?Q?mRWvQ6ZBzJYopjNtLZPrTitUWPVwAHuV2Mxyxu/8AGbOA4R5STu2WouohQqT?=
 =?us-ascii?Q?uoDNejEh4LebK7p9rj/S9W3VLFX/nDZ5bbhovz2zhJQOqyrG9shamkQdqkbP?=
 =?us-ascii?Q?CaJwJaBWncJEz9UNAWMN5d24xN8XqUyqZ42KgLf/t25ey2/xsMMMSQxKJyEY?=
 =?us-ascii?Q?llr0dseJVV+I3XgHCkEkgn+xL8TRpgP10xXEzZKjcg3FRE+hQHBzd8BboKvJ?=
 =?us-ascii?Q?Wlk65mqSbi/yoBAclfARXGDa1+v0Vvgb5FSYX9KNqH+mxxAMdEvVYNOE3231?=
 =?us-ascii?Q?91NEFKipskfnMPEhPOiWF9ZzhOtrLsWRyCLZNRHvwbZD/4J2J0dcvBT/h9N2?=
 =?us-ascii?Q?cier?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2021 12:27:07.5540 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: 92a28e2b-e740-4726-33a1-08d8b499e153
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T6pxxj0Twcqzn4QxwCu+y/GeJoCGhsK3/rH5X6Y0r6yVCQP+N1cMc0Lqiu7F7+onbFjBD/qwQ6YXRLx1FMGd31V9s6Yl+h2tnhpMxzI/7Go=
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

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/294 | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/qemu-iotests/294 b/tests/qemu-iotests/294
index 87da35db49..4c375ed609 100755
--- a/tests/qemu-iotests/294
+++ b/tests/qemu-iotests/294
@@ -1,3 +1,4 @@
+#!/usr/bin/env bash
 #
 # Copyright (C) 2019 Red Hat, Inc.
 #
-- 
2.29.2


