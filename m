Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF092F8F9B
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Jan 2021 23:09:20 +0100 (CET)
Received: from localhost ([::1]:41126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0tl1-0000gA-TM
	for lists+qemu-devel@lfdr.de; Sat, 16 Jan 2021 17:09:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l0tVC-0004OM-Sb; Sat, 16 Jan 2021 16:52:59 -0500
Received: from mail-vi1eur05on2126.outbound.protection.outlook.com
 ([40.107.21.126]:26209 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l0tVA-0000WU-IA; Sat, 16 Jan 2021 16:52:58 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YwIYkpvOQns/2wrZk2ToLfZudp8Klo2HnHpHunoSw0elWt0twwZZvjWlBH4pjbdfn8tJk2ibHmruoarlaRLO8ZYH8cldBIhMZdx4DfKRQzPNzq36MLQKpPH8tpDvRICdaTsgmabW2NMzNdw4tGZyoGM1q0svckzn0PSsuq2VOeHhIFpLSnSSsQVFMmS23y2fxaN7yhEsnTKGAZ7Gd0ZFNFJAMsSUEB06qN8+oUbITJJn5S2wHYKo6hlI1j4gInzQdhGhE0/VFPr0SZN3/0vJXdywQnEA1qfogmDdxgYBlFuV3ZlDn9Bk5NvJa1MWKQoevY3Pn/brPM7DyygBtLPLVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NHnm0nzmIwn+sgo8rhgq9lMJ3jmOf1G9O/f4rw2SwiU=;
 b=hDTunGcTk7Jc3dOgkYf6wt591rbA6zL1hSR1hlUD3PeSkGikBrYjuTm/FR8BNNU/anSrmFuMBu+X45KSlpV+T5cqKGtF5eZlStGbsb34gUiEuPWahE38+vaY4tuuzPSfP2RljrHskI3c8YXrEOjg26WeLQUUj2aT6CyDuWDiFZAQVZYsvPsOa0Y3fQ8/gNROYFkUspKaX0CcVe+Y0+3tVfdJl/qq39t1cl9K4QiO2YJvbG8GJZGwnLwR5fLO65mb4gwaLdRwONlPEBsrw2zzcFn0ex2tbDAtmiTynuHzOZAiLGeSAj+VwZcUEOqHU8A1NOtWluATxl/rOGXss9RmKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NHnm0nzmIwn+sgo8rhgq9lMJ3jmOf1G9O/f4rw2SwiU=;
 b=rGbbDUJnEInQoTBw1T/qCvTIz8Ty7bh5RA5Fv7Bn4bv+HkdI6EUrPHgI5dJaqg7TtV0CmmkdL3OncTC7KMkiOQJBay4DKiN4OzUDlHG53CAeCnw4iXwxmbArt2oDFot934HF99XkaRNkdMEjdAIqjx51Lqa29moI1iFtimbVB2Q=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3542.eurprd08.prod.outlook.com (2603:10a6:20b:4b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.12; Sat, 16 Jan
 2021 21:52:49 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%9]) with mapi id 15.20.3763.013; Sat, 16 Jan 2021
 21:52:49 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v6 04/14] blockdev: fix drive_backup_prepare() missed error
Date: Sun, 17 Jan 2021 00:51:59 +0300
Message-Id: <20210116215209.823266-5-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210116215209.823266-1-vsementsov@virtuozzo.com>
References: <20210116215209.823266-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.72]
X-ClientProxiedBy: AM9P195CA0006.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:21f::11) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.72) by
 AM9P195CA0006.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:21f::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.10 via Frontend Transport; Sat, 16 Jan 2021 21:52:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 39c9f047-8ecc-4be4-54f5-08d8ba6910ea
X-MS-TrafficTypeDiagnostic: AM6PR08MB3542:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3542F321DA36B24F544A1903C1A60@AM6PR08MB3542.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1051;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cZeWOfESXVybaXDKMAmlmAd+JBAx57WIDAkcNRfMd2e97xU/y5rB1qUmrk4OKC87+rS0qvxlU154EB2+Jkc2LDliKP3mUE5jS5IpHVKIYsfdNJLBLJkgDw2GoBC4ol8CEahIRZk9dttq8CIoUQMTmckEiLRFAfmJMIwP0Ki11mdw4RbyVMkUZvq22bvCx1AHJcFw4fRafe1xLoprCypPkFrjyU46SJIPXTi0JHa4Vv+IXMW1GKPbPlljJCrW6dkyV9wmm/SYlX64IwCbKG+VKRGhdPw/bF39fWZZNHyYzcGRX4tchCJf+oxpp5IKNIdZe6xSodJ7Dr7l/Sq0u72WMdNbnwpgSrEp1bu+fna0cq25GM2bLIsCoTSkim39t7CHHgPRxLyb4LIIRlPnnh73FLQGBXXBSJy/0mUG0orzNxwqJVScvgj+JFvGW6qUkb7lab9veSIYzgOGN7lyx0MVHapMZIa7VvRLByPPStuGPDri+F2WRzZFTp9VhKY08eocyyk40GTpkHw6+VeGM5h46g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39840400004)(376002)(136003)(366004)(396003)(66946007)(66556008)(66476007)(83380400001)(6486002)(26005)(8676002)(8936002)(86362001)(2906002)(16526019)(478600001)(316002)(6506007)(52116002)(186003)(36756003)(6666004)(4326008)(6916009)(6512007)(2616005)(5660300002)(4744005)(1076003)(7416002)(956004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?aPe2LJVdNA8zzmPxNqiQgk/m+d8nfqhedAMgvo9Erxud4NkPaUSIORTAzgpT?=
 =?us-ascii?Q?GCQoOT/0WkDm6pqNMc5sNI2mpPhtd2MKrzriaEDNLMQy1HKJQozXXKkpc17F?=
 =?us-ascii?Q?+4fOQ2bmdG5LyGPonUY9BypV7ay60xEEBhxbX5oeGjHysa3KealHlqyK1JuY?=
 =?us-ascii?Q?bRbPF9u98lqW/ZLhwT34U6E+k8VE0uzUfY8CKTqgFeUlh9eVAKvTKhJe7t5T?=
 =?us-ascii?Q?VaU68AKSg11wRrKPm8KIX4v5qKKKHoPAbCIEi2WDOdSPzy9v1frIDIpzv8nt?=
 =?us-ascii?Q?CgSjpPpKGUGgdgxE+dntRw9PUMMVgsCtEGvt42eL4N0EFzttmvT9w3Pgf8e4?=
 =?us-ascii?Q?mF9R2pfaWMQUdz0qFTIbK6Ph3rdyCUYrhR/CzlaL483c8R8n105HeJd7SKHY?=
 =?us-ascii?Q?UO+HngPmKJTmX3KYiJogubqxmyBtAD1JHv9i/o5E7uir/rVfFLyAvshxnMdz?=
 =?us-ascii?Q?+EbLLlygaZJz2eVInDkqhBjFsBn1Os6u3nA27NcfD0jeVgWYJPiCU9jYjJdW?=
 =?us-ascii?Q?8Oop+et7f487r+s0QCXrGknYiaUgYc5e6oCaCFZaatW9dvZaRFLbRhLmboUs?=
 =?us-ascii?Q?xcu9jw5dH1N0KHPuguCYVOeVid6PORhxQtoSfNNm7qVvRcTFpJXs1u/arEQX?=
 =?us-ascii?Q?mPfNLPCPYo+VZSmB1i2z3khyjt9y/tW+DG6rc6O1XY/IT/V2wt+XMUZT6t5B?=
 =?us-ascii?Q?WqsYE5qZrs8PMMCHw/4MIlXpkE6fh7lGkUIfSvBv+WukCbj3NoYGeJnCY9RZ?=
 =?us-ascii?Q?YYJ7UnzgZrY7wi8k0KdkocE9UItNLth3ICY1C70x+ywDWiowZAnJ1mb8SMGz?=
 =?us-ascii?Q?Ns5UjYpxOyLxvKXER+azkv9By5zui0jz2LLI+4V8juLJisj0GChQIBGHCRhk?=
 =?us-ascii?Q?+AX5kAxy3DRT+ZFPxYYg1E5MBEII/+z5aTC/f7HRDz6Cyy4JBDr80G1vhRbf?=
 =?us-ascii?Q?GWuzB0Ww+diNecwpfDAlkqm8yVWa1IlS44a2/swTWHNjQkWuZbRjtrQfkrFu?=
 =?us-ascii?Q?IdZ2?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39c9f047-8ecc-4be4-54f5-08d8ba6910ea
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2021 21:52:49.2618 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QCaSn1T09iTZVpdp/TqLHXbiLvVmx+l/c0aUsU4t3Vx6Ysginr/reR+rPaD/Lz53webi9Eh9beprrlqTdVpNgnRT6uPRG1pI4HUBxMoVJxw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3542
Received-SPF: pass client-ip=40.107.21.126;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, berto@igalia.com,
 pavel.dovgaluk@ispras.ru, qemu-devel@nongnu.org, armbru@redhat.com,
 Greg Kurz <groug@kaod.org>, stefanha@redhat.com, pbonzini@redhat.com,
 mreitz@redhat.com, jsnow@redhat.com, ari@tuxera.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We leak local_err and don't report failure to the caller. It's
definitely wrong, let's fix.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
Reviewed-by: Alberto Garcia <berto@igalia.com>
---
 blockdev.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/blockdev.c b/blockdev.c
index 84c5cde07c..753fb90c16 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -1825,9 +1825,7 @@ static void drive_backup_prepare(BlkActionState *common, Error **errp)
     aio_context_acquire(aio_context);
 
     if (set_backing_hd) {
-        bdrv_set_backing_hd(target_bs, source, &local_err);
-        if (local_err) {
-            error_propagate(errp, local_err);
+        if (bdrv_set_backing_hd(target_bs, source, errp) < 0) {
             goto unref;
         }
     }
-- 
2.29.2


