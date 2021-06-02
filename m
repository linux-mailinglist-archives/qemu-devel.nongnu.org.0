Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1A2398A99
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 15:31:53 +0200 (CEST)
Received: from localhost ([::1]:49702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loQyO-0002KG-3M
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 09:31:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1loQg8-0002mx-9g; Wed, 02 Jun 2021 09:13:00 -0400
Received: from mail-eopbgr30130.outbound.protection.outlook.com
 ([40.107.3.130]:57568 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1loQg6-0003lC-G0; Wed, 02 Jun 2021 09:13:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C8iz3qjjEF+jXOanEQHrjSj2Fpc9OgbKRiJhGPZz44kjlEYjUVqxQmEHHvJSoQvA26GjWkA4DySuiFB+k0LPO3X+1LEFcuWJWHsGuOc2ElnZw+MeW1aZogQjgH4ppZ232Izkp0Y7Fx7rRFX6uo3mGOiWvrTvzJMawIOngXADyBBDALijyWPSshyh2mMJaftSElRJaSkxkGiB+6/eAiQEyeXlm9/xhsXW3DIkiQIYElqMBIhFISsSHWZ92827wk4poRltu0CehjgkuQBJtkoS0dobK72PGWoM8NPSG1utAnWkNcWdAmS2/xiU//zUPo6Xj1NxzwAIN4pmYPgmjMBTYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Fdt/9kXHN1yQLBrMNRdUEjvnHhIP48yC5QLgDEN0ag=;
 b=JYG1Xsn1420Ev29ta4bwLdqxK5vztuiHX25gJq/wHuQUJFmSey7vjh/8Y6SxZ4+qgiVN0JK4vY0PEqt+0xCxAWwO829Msskqd93vIzFCGwoMDTJbE0910l+A0UmxTkCXVU9cyuw+x16hQcyr9oNRQRrxwciawxTKIxrGBvc86MUzUaBsaooIcF5bg9Ikc13Nu3BNf9Icn5Q3EefOeXWXLqrXgoeNoYPeH1CSEHu1lZIkW5tSkwCwP+Pc81pEYIxgb8EXBkZ9a6u++CrSsPKSEnuvu+Vd77RvNK2o11Y4DGUciqzA+DXrx847W03psfUaH3X4Lkearfizm9oIDDg62A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Fdt/9kXHN1yQLBrMNRdUEjvnHhIP48yC5QLgDEN0ag=;
 b=Puaad1bVRUulrAfMc9kdeEiLrmUJ147fogkN6xKLbgKU8ylgnDlnwE1Mjnr30XoPzQutr8s09WKLajKBL7oy9N4+WPK8olwdQAQsZxLOLVM7dFtJlCHm+S4ZdMy15Z+Tn8a3vhJ53sSlZ60E+r38ldFRIm16N/dfikKsx4DgBr8=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4536.eurprd08.prod.outlook.com (2603:10a6:20b:bf::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.20; Wed, 2 Jun
 2021 13:12:39 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%7]) with mapi id 15.20.4173.030; Wed, 2 Jun 2021
 13:12:39 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v4 34/35] iotests/image-fleecing: prepare for adding new
 test-case
Date: Wed,  2 Jun 2021 16:11:07 +0300
Message-Id: <20210602131108.74979-35-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210602131108.74979-1-vsementsov@virtuozzo.com>
References: <20210602131108.74979-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.211]
X-ClientProxiedBy: HE1PR0501CA0011.eurprd05.prod.outlook.com
 (2603:10a6:3:1a::21) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.211) by
 HE1PR0501CA0011.eurprd05.prod.outlook.com (2603:10a6:3:1a::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.15 via Frontend Transport; Wed, 2 Jun 2021 13:12:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9f018933-e04d-487f-0c13-08d925c809a4
X-MS-TrafficTypeDiagnostic: AM6PR08MB4536:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4536FC159ADAEC89DB3A4545C13D9@AM6PR08MB4536.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:478;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /YLAiZRe4zSHsycWh07cdx1OaNqXkGkw54xvMN6tFukiXS3z1Yf9Zn3VoZt3+RC7olu7gj4hO4ec6c0EineyPLrTb2ZBpgMA8JyjgwKXAo6VRDhVwTqUOzZ6bVw6EmRPSYUmQWkciWaVJCr7bFDh9iI8co1HZjC7N+kRj2Dv170VwsY6QZgokWhRxZpJJTkjL9StlqUfwvuUDFAm13DeuKla0rhgGKRkZixNhVMFNy3C38gSZ7N42vkp4/sPxTUGyywkO4Owq1yCuwpp+B9KH6j2KtOMK5xfgJPO4ZxbO08Om8UKxO6moKyjvRMtnB91z8Z8A6iGCAio4bznEZ/adb1HNNGnnM2f2Dnh5fqYzRuVK83IGc0r5XV199yd2bQLHLHzPE+Uh0oJkwzN0QCOqcfrmHP0lWZKXOklKTmS5nNIV6qwyXN0krDHRhm0xg+QgM8s3MiI3CK8u4su0HOQ0F3nHc3+67okctlh7Er34oXL5zbyp7o6AJpYAW+/s8GbS4/wqsadF5ZLtFSLblOzg4feMnQEobg2/20BuKq6RzPfenLrtcLEtgEjjPolZFxebk99D6wduSk7rLlDDjRrtud5/Ue9qX+X1aAfCHmL0beHQuUtySUGfIASbqu3LhQVO4WTnZwtMSIeNNUaNOlOPGF0EYCk6AV62T+f1gQvbqjagpM27DVtOFQ1JkeRDYNq
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(346002)(366004)(136003)(39840400004)(2906002)(36756003)(316002)(83380400001)(5660300002)(66556008)(1076003)(66476007)(6512007)(66946007)(52116002)(7416002)(956004)(8676002)(186003)(6916009)(6486002)(16526019)(6506007)(8936002)(38100700002)(38350700002)(6666004)(2616005)(86362001)(478600001)(4326008)(26005)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?YGQf7PqQVh627euwtpaby7z2WVjCMnHlvbAYlj3AcAchPg1LLSqoQllsu9NR?=
 =?us-ascii?Q?YlxZN+QKtXY4E2yDuspyF86Clf9KUn79LaBmlmDrZQEiL2p2J63BkXWVfenU?=
 =?us-ascii?Q?g8Y9S96yL4Zu3AVc/R4R5FxOFdBfIkzOwM8CvcgVy5CZegxpMgfX0C0hkfup?=
 =?us-ascii?Q?DWnGJPapbAFRzc+mIMYnDUtffittzdvaURjLZPyDR3chSeQl7uuDA2IYjj5O?=
 =?us-ascii?Q?jmkT5Z+vxv7/eAJoj13XOsdMUCzSjlQ6ojotfFl+zjcxtceP7ToqEl1a8ggV?=
 =?us-ascii?Q?JmAOLc/ps4NWmqtDq9nfwNORTW9/fDBdY5DznXzeR7s+1LQJQbNfeigxQuDC?=
 =?us-ascii?Q?TR9Od/1AEWXjgMWkWhi1Qx5qXgs3sjdNRw5xxg5EFNIVvJQFURGyQifX3AWH?=
 =?us-ascii?Q?dQOhuzFeVFKcQieFTZGi56nm3kBwjOFHFaxKF2eIxuMAhgUYQ3MyXXzUKKEI?=
 =?us-ascii?Q?vhxfXYTxWexCAqjRB7SmXvtf1g4z64VrLqdqqrChg0bsABtt/lRwbY8l2pgM?=
 =?us-ascii?Q?FSrcgWXBd/YxRsfszgQArl7AErg4zsoVGd4LqrWQ6n5xIop1fNZqkfzHmQ40?=
 =?us-ascii?Q?vDW/BDxV+JRXNFAS1i++mMvPf1+wpxpjEM20H7xqnBvYDw5CZDjmBJqWmpep?=
 =?us-ascii?Q?8p2mir8+bV0yOBXTOF9v9dfCBSywjOq+/9nW0PJMyawA4OmLwJs1DVTwX3Wc?=
 =?us-ascii?Q?Y562mdvwVDeNGun+QaK762/NPHxaFrA3cKNPtzo+BIJ/fXZfFPZWQ5NVFU7f?=
 =?us-ascii?Q?ItYyVyzfI781D0ESEP+Y/6z3b5Nb7Rekb+FJSPtIhiE23oFzEKo22TvCffz5?=
 =?us-ascii?Q?l9MPe47AE9GkB+v0ZPXokt5k9qi2shPLQDDkreJlhIXiR3QQx2W0GP/8l0qE?=
 =?us-ascii?Q?kDIzFXepNDPfvq2mJs6unrI0S1azTbci7r0rq+aHxJWzBdHq8E0Vp8ii017X?=
 =?us-ascii?Q?BxZH9wWHgGtYBU2HTGd8S2JHRVJPyEE0lzjX3guPchqehtkmzyi1XvAxdjLH?=
 =?us-ascii?Q?RzWbOevuB7SCnNfC9bUoUKin71RBDS9knXx8nR8JXr+zg8FAJOVF/pIiUJNI?=
 =?us-ascii?Q?JthI8QcTQX/IWYzT9sDoCJVwYeqNyLZ4Dr1M/IlMMIn6+lzjRBE9GHPSuMeb?=
 =?us-ascii?Q?Ex7jeR7i7bOZBz9GMbU0HQYuU2sqFEWESt5/3YB+CuCmo545QcGtOpCAfO4U?=
 =?us-ascii?Q?RgEsWCnXdZvJL4HJyiUxhZvb0n77TLp9WYiJIw5WnF351c0EPU/O/uG46r1W?=
 =?us-ascii?Q?PNhXpedo9vbnuwEdFywlrmvUzQJJcdsoBwvGdab7D0UVEJPmRrL2MUNCAx6T?=
 =?us-ascii?Q?feH791zbR3d4OPIjdqjlqf0A?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f018933-e04d-487f-0c13-08d925c809a4
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2021 13:12:13.6382 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n12kN2I5Dy0y5ExE+YYcdo6DFqHuMvBVorwQmLXGxBCP95XPli+BDov/DJP4GUvN61GqCyprYB8RdXP8sf2D+OyX6vmaSoFIi+GGG3qVyDw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4536
Received-SPF: pass client-ip=40.107.3.130;
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


