Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2CB9344E8F
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 19:31:09 +0100 (CET)
Received: from localhost ([::1]:41074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOPKW-00047p-BD
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 14:31:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lOPHa-0002DU-M9; Mon, 22 Mar 2021 14:28:06 -0400
Received: from mail-eopbgr60113.outbound.protection.outlook.com
 ([40.107.6.113]:3712 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lOPHX-0007OC-F0; Mon, 22 Mar 2021 14:28:05 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JdeY5ApKehfh2XubRr24mMFoXaP8g0elNIP4Np5cgjCpbWa8EDvjFSV7FB07WsMkiirEeBPHYQGBlDyucTxTLZJtEboVLn5k4dOO4JKn0QxDnhKuK542HZLsFzZuGhEdBYNjLJOEHDuLobJBI2Z4UeLwC3u3h8WyA1GUtctQ09qnVEdUXdwCAepYkHNJrpA1lRfZb7BEeP5XkPvshAsMxtPWzQqveL3muYhuTPQeKMejJX8NBfkFf4F0Tvkw+kyGiyWS6ZEH+nvJd8sqtH2abKegyGagqz+pNsbca52fzcnVtSS9JLWZtySRlNU5k4h5olMMzKHBgb1QsE0KQFoUhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LgenAGj7OzRXwPucXcsViBQY6DlZcqpXcffa1qd8yw0=;
 b=jUJcWSw8IxeoRp5t+N+djtEj2/N13aKJL0f2mEKLwtZv5Xh9tv8hhHogYK5hX/bojiXKpLFvf20dfxJKGzhhYkWf8QltONnXTdtAc4SN72My7ddrj6HQ+Hycq73UrgcsC0JyC2cF9wcEw7mBBThDmEBDHETuXZzIfrUhBuMB3ewIMouCXi6p4tdY4Lk0ltyWYPQ11TE0XEaxJEi7v8SctsucZHXiSYlnieD2Jgq6s8bFK4pD/J1MtnAnAnsq6gmA2uOnObg1TnsC1ux2S3CY32Gmq/XhGrZYVvNQLwyw7ZHYnLYEvSA9ZyEtfNZjzO0lhQk+nDUfYhBytPEFLczGCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LgenAGj7OzRXwPucXcsViBQY6DlZcqpXcffa1qd8yw0=;
 b=I5G2fbzRnyOjgweEbTmrY+DaVWwLr0prW7QCUcA8C/c3VtS2982tYbiBQLjVg6DxAvFC6dl6gX4k/rqpjtD8PEqHemUuEU528ZVlSf8jeu1s90/7jJ4yjhxl1d187/cgfyx8I3SoT/IMPDSD9e44yVqkRermvuK9IhH0/bbSoHE=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from VI1PR08MB5503.eurprd08.prod.outlook.com (2603:10a6:803:137::19)
 by VI1PR0801MB2014.eurprd08.prod.outlook.com (2603:10a6:800:8d::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.23; Mon, 22 Mar
 2021 18:27:59 +0000
Received: from VI1PR08MB5503.eurprd08.prod.outlook.com
 ([fe80::f947:3484:b0d7:ab52]) by VI1PR08MB5503.eurprd08.prod.outlook.com
 ([fe80::f947:3484:b0d7:ab52%9]) with mapi id 15.20.3955.027; Mon, 22 Mar 2021
 18:27:59 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, mreitz@redhat.com,
 eblake@redhat.com, vsementsov@virtuozzo.com, den@openvz.org
Subject: [PATCH RFC] docs: document file-posix locking protocol
Date: Mon, 22 Mar 2021 21:27:38 +0300
Message-Id: <20210322182738.60395-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: HE1PR02CA0104.eurprd02.prod.outlook.com
 (2603:10a6:7:29::33) To VI1PR08MB5503.eurprd08.prod.outlook.com
 (2603:10a6:803:137::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.202) by
 HE1PR02CA0104.eurprd02.prod.outlook.com (2603:10a6:7:29::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18 via Frontend Transport; Mon, 22 Mar 2021 18:27:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 37ff009e-c14a-4fca-b85d-08d8ed603828
X-MS-TrafficTypeDiagnostic: VI1PR0801MB2014:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0801MB2014DA874B77E4B9844986CAC1659@VI1PR0801MB2014.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HRvLLlYDPDOeEiXmMZFibgo3eYnovx4KLhpQK2F1Kiry5ziIX57NvyHl2y51kncCOBLc8dJxASROqTL2FWjSqxeXGJtMdqTJem0XeBRULckqFMtxcqBK1BmPTW05r/qlKWeO6tu9yJ+HaN9S6T1YEfDME562TNbBgwjcbJMtZS6wCD9Yy5zIdPNiVNEZzqHrLhvVVLWSOJ7Cv0KDX57ZEXlhxlZV3lRED+50z/lFx9gFJZokogvuJFqG9WMwTAPTTv3cOT9dvGjrVkyPub1SQKnkaLWlCTDYo2tIx3fQlAvYZ3hzTdtQqLTJL1U+Ga4OuTSfvkkyKDORcSMZqGIyUD4ncpi1M0y2gOFcyS/Zi9X31znTszI1HPnZauDAjaaVl9+p3TSMtraMGPBeltDYkmIPpfUsF4ATid69J9GREZoR0vcZNaEFyLPxnB5WBWp5tHCysiSPOse2yd5h4Xj/U68o48loBJqAsYo0GU5uMxZ6FrutH7CDQF+T+ydF6PiXOr3LJZudXEamK3icthAEsFZy6eh0KI4NmNWs8eogIfZCUnzvEU1GHj//Xtw4gQy4Ddp3jdhqvmdKLK4V816rpv2FGCULfx/DlirO6nj/wH7YFIcjIqBlcXudNgGn/vHd3Lt/pikmUUGxBg+XEGYRpK39kp3pvwTcdZxnAffaO08WBWVnumUpor6PqiPuDHE/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR08MB5503.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(396003)(39840400004)(366004)(376002)(478600001)(52116002)(1076003)(956004)(66946007)(316002)(66556008)(4326008)(8936002)(6506007)(2616005)(8676002)(36756003)(6666004)(107886003)(83380400001)(2906002)(5660300002)(26005)(16526019)(69590400012)(186003)(6512007)(6486002)(6916009)(66476007)(38100700001)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?7LWr+YZ2F2noHnRuIZeIcLNu20fhXoa8RpvHOES+lCXcoce4QG9B63G/Nco1?=
 =?us-ascii?Q?9322tJEOpwhzN+8D2pjkA2tCquUPq0Q3ZmUogRaICLLE8fSj8WjR5TO26h+A?=
 =?us-ascii?Q?RHrNsTG7xRl2HAu9lWlyBFSD62aS6LAgGsFkt91ZeK1D0C9tMHRuHYu+xUsy?=
 =?us-ascii?Q?vLcsuSS963Yty0qmdnuAicRoJEv2mIKWu55Y7qZpBDWqSFHLEWBub/jD2aSy?=
 =?us-ascii?Q?CrvjG9qvNHxU0d67WRUV3TGcMed3p2xNFpATGU9J2eE+2rG9oaz3hLMq5Dcw?=
 =?us-ascii?Q?9xq5X0MjREX5s9MzCwmaeqIfz5GhA+zpMTUm/hQ34FqNkZVBsZa4vd3qwQxq?=
 =?us-ascii?Q?mEYrYvzlxVkFAsKUddliDAb1azR8PrYxvIExepoOa0A40AdyGUmdhpCOqfQ2?=
 =?us-ascii?Q?bsDOkPOTCe9dMudhm9IeJPVK0O5wgcP62hUMoQ3NdGS+aUTuP/nTS2bWmn+9?=
 =?us-ascii?Q?QrJOYIeUrKuppDkMaRUfXwW+M+vWNPXpHD5mJNGjj32F7frrWe/RBoiWeALr?=
 =?us-ascii?Q?9o0yR8vkJhFnmw7zKT8j17gki0RzqKYzHOmLAFqdLxTAzQ7ZCttuhR/BUTl8?=
 =?us-ascii?Q?TE+3ry0JKSmUHOcHTa2E68Vd4v5/DmG6xdKGAQo+ZfxN5K3XKp9nSxSn6pS0?=
 =?us-ascii?Q?BbHB6qMj2O3M198m/piToOXamqpP5aH4o6RFoUlhY9mEaPPZH4KyEi9J139g?=
 =?us-ascii?Q?s1ZdfYC56adgOa25kZHu8G4T3sv2YoMKOF06S++l4Xw6dDh3GH2Z7dXB+WE1?=
 =?us-ascii?Q?94X6ytxeyA8oCKIwaLDZ+dM5yBPIwIy0nGWmkcmFoB/zxFsviEanKyjM2SEg?=
 =?us-ascii?Q?fJNxBDhsM6IsAUq/eVIQ/7UVpP/MR8Xvz9xPblVlPyrMvhNfAt8CJN/rBCi/?=
 =?us-ascii?Q?zyiYh5OzFmApPueQGayMlflSsPsaMK/Wmi8+Dxe4xvRbBqV1CmfiYSBAdoam?=
 =?us-ascii?Q?j/J07dqh97h0xvIBcmJFHPsJAaBvM2nsD9tqKg3uG4Lo5tNJzbNGurDBc1tM?=
 =?us-ascii?Q?P6dYcYM2kyTO9tcbmKuNTh+0mgfso5uUI/OyqTvyV8CgJiBX4vZmLtPCRu9q?=
 =?us-ascii?Q?s1YCqmTIpFVWocT64rwBfY5VzkU2h2cs8sGnN67aZBvKIVH12Ur8JRvXf1wM?=
 =?us-ascii?Q?Eun+rz8x2nG3edXTjcGyTRfNYvNMu+wi1z3WeM7J1hGnWVAbLUWZxle5X5P4?=
 =?us-ascii?Q?edoxFZ74FRPM4gnMzCRgksOkfegGDP4ozq9mkDRcchiupU6KD6bDax7Qlraz?=
 =?us-ascii?Q?l+WevGnGqKjioRmzM7GgJV/qzxX7Vxfxu6wllabhRvRgNOuxUhC8hlgQitpP?=
 =?us-ascii?Q?nX70QeURfb+Q7F2dHx1MvyQr?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37ff009e-c14a-4fca-b85d-08d8ed603828
X-MS-Exchange-CrossTenant-AuthSource: VI1PR08MB5503.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2021 18:27:59.0947 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OqdvD+zArCIApHkjCTkoxKLQ2A3hficy5sy5yk3Clr02wD/LE1cqNbS+06V7WbzgjfsUCKtT/QWYjC7HORH/8CUlNxfRo5PFVNIRTJzAT44=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB2014
Received-SPF: pass client-ip=40.107.6.113;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let's document how we use file locks in file-posix driver, to allow
external programs to "communicate" in this way with Qemu.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---

Hi all!

We need to access disk images from non-Qemu code and coordinate with
Qemu utilities which may use same image. So, we want to support Qemu
file locking in the external code.

So, here is a patch to document how Qemu locking works, and make this
thing "public".

This is an RFC, because I'm unsure how should we actually document
different operations we have.

For example greaph-mod is a strange thing, I think we should get rid
of it at all.. And at least, no sense in locking corresponding byte in a
raw file.

The other thing is write-unchanged.. What it means when we consider a
raw file opened in several processes? Probably we don't need it too..

 docs/system/qemu-block-drivers.rst.inc | 55 ++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/docs/system/qemu-block-drivers.rst.inc b/docs/system/qemu-block-drivers.rst.inc
index b052a6d14e..3cd708b3dc 100644
--- a/docs/system/qemu-block-drivers.rst.inc
+++ b/docs/system/qemu-block-drivers.rst.inc
@@ -952,3 +952,58 @@ on host and see if there are locks held by the QEMU process on the image file.
 More than one byte could be locked by the QEMU instance, each byte of which
 reflects a particular permission that is acquired or protected by the running
 block driver.
+
+Image locking protocol
+~~~~~~~~~~~~~~~~~~~~~~
+
+QEMU holds rd locks and never rw locks. Instead, GETLK fcntl is used with F_WRLCK
+to handle permissions as described below.
+QEMU process may rd-lock the following bytes of the image with corresponding
+meaning:
+
+Permission bytes. If permission byte is rd-locked, it means that some process
+uses corresponding permission on that file.
+
+Byte    Operation
+100     read
+          Lock holder can read
+101     write
+          Lock holder can write
+102     write-unchanged
+          Lock holder can write same data
+103     resize
+          Lock holder can resize the file
+104     graph-mod
+          Undefined. QEMU sometimes locks this byte, but external programs
+          should not. QEMU will stop locking this byte in future
+
+Unshare bytes. If permission byte is rd-locked, it means that some process
+does not allow the others use corresponding options on that file.
+
+Byte    Operation
+200     read
+          Lock holder don't allow read operation to other processes.
+201     write
+          Lock holder don't allow write operation to other processes.
+202     write-unchanged
+          Lock holder don't allow write-unchanged operation to other processes.
+203     resize
+          Lock holder don't allow resizing the file by other processes.
+204     graph-mod
+          Undefined. QEMU sometimes locks this byte, but external programs
+          should not. QEMU will stop locking this byte in future
+
+Handling the permissions works as follows: assume we want to open the file to do
+some operations and in the same time want to disallow some operation to other
+processes. So, we want to lock some of the bytes described above. We operate as
+follows:
+
+1. rd-lock all needed bytes, both "permission" bytes and "unshare" bytes.
+
+2. For each "unshare" byte we rd-locked, do GETLK that "tries" to wr-lock
+corresponding "permission" byte. So, we check is there any other process that
+uses the permission we want to unshare. If it exists we fail.
+
+3. For each "permission" byte we rd-locked, do GETLK that "tries" to wr-lock
+corresponding "unshare" byte. So, we check is there any other process that
+unshares the permission we want to have. If it exists we fail.
-- 
2.29.2


