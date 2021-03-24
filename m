Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02583348349
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 21:58:27 +0100 (CET)
Received: from localhost ([::1]:51946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPAa9-0004fs-Nc
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 16:58:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lPAU8-0006iA-FF; Wed, 24 Mar 2021 16:52:12 -0400
Received: from mail-eopbgr140109.outbound.protection.outlook.com
 ([40.107.14.109]:48878 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lPAU5-0005Mt-CC; Wed, 24 Mar 2021 16:52:12 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lst9FIr0ya8TNzd3rFxFnzvuW1kYdATWvxvRrJ6nT9eY8yfYJzromUq7Bk3HsHEtFHRmNXWCfwpUDC5qi0fIN9lD+AqB5rhkByb/TUGAwwID/gxmNpk3s9gO8UQVhDX2P5X61VmBmzBWoCLRil2YJ+Cgj5WxBtPA1mfU07NmkkiqPxoCaWHzJfEcNoIu8q5VlCS1NxpW+uFtO/x1gRJgNRdwKR+GzvCF0uuNKJFqSdGGbF8UlI+nmxiFTE/nAikdNOQ9LAN4fklejqT8aN0DSxKghr76Ens7dJU8O4Xs4WFVPZRrnfkoVab6In/P6wDTRw1i1xT8ARvtqHf9fpyTHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2igTTbRtCSDChe6pEOhuLZR1KtVLw3XXracJeMmdLSw=;
 b=PzweuTl0u6IqeZ16XURvs/9HmlV1XTl+kdw41T9nGSsanrUZKHLQuGSJRrT7H1hJttygqSUOxU1qZSEv4FU2DKRphbSSi3r7fRy7taDu9uQ6X83OcwbY9KzqG1C2nS/Zfr86p/kTHutIj4fJQ5f4phEobHcAnizSxg44DERblF1PNNxuTmgvZ78MZxaHYf+tzQTxjoYTa4yXEp8whOM96tyIJ7Z+rGTNjklCo6OurRdERab6afiQ0fznFyv/Ys3BFAQQXNlWMnoVkc/apeA24zQndBxvj9GgCYq793f95TthUCpqL/imG5Yx7y+tDHKnEBMtixZgZLYx3KEPAJ9c4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2igTTbRtCSDChe6pEOhuLZR1KtVLw3XXracJeMmdLSw=;
 b=c8D10MT4jR2XHCorDy+jhyS1YqYGuP+hxr0MyqORtJ+dZyKxrt8IFAj2131mt8IIRQUoRzjB3XKREmPyUnfIQ+vh9Qs+4vEd6uo4EjTuww4EoE/WRBeLtBSQABeNiWBN9ZTW9nkH7YHYq4L9tHwq91r/lQs27NwMv3zlA2ASblo=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6904.eurprd08.prod.outlook.com (2603:10a6:20b:394::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24; Wed, 24 Mar
 2021 20:51:59 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%7]) with mapi id 15.20.3955.027; Wed, 24 Mar 2021
 20:51:59 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, integration@gluster.org, namei.unix@gmail.com,
 dillaman@redhat.com, berto@igalia.com, eblake@redhat.com, pl@kamp.de,
 ronniesahlberg@gmail.com, fam@euphon.net, sw@weilnetz.de,
 stefanha@redhat.com, pbonzini@redhat.com, pavel.dovgaluk@ispras.ru,
 ari@tuxera.com, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com
Subject: [PATCH v4 09/11] block: make BlockLimits::max_pdiscard 64bit
Date: Wed, 24 Mar 2021 23:51:30 +0300
Message-Id: <20210324205132.464899-10-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210324205132.464899-1-vsementsov@virtuozzo.com>
References: <20210324205132.464899-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: AM0PR07CA0022.eurprd07.prod.outlook.com
 (2603:10a6:208:ac::35) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.202) by
 AM0PR07CA0022.eurprd07.prod.outlook.com (2603:10a6:208:ac::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.9 via Frontend Transport; Wed, 24 Mar 2021 20:51:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cbc01d8f-1af7-4cb6-160e-08d8ef06ab41
X-MS-TrafficTypeDiagnostic: AS8PR08MB6904:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6904544452CF86625F304700C1639@AS8PR08MB6904.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GS4bZGhvg6rarFRd9b91JnqJ5qXDHNLApGfUfl6lAzzJYcqH37A+AcgDE2Mt7lLGFUIFVrouwgU1wJfa64JlzKGj6gWgUMfwzo/bCKrAkiFikMu/82hnJ30by6A856JVAzGW/tDzLVci/PAKditAUbt1Ly7mVgjYC/c+xDIl1WwMBy/SneTEdK7dFSkzcNA5Sk6EJxHsT+0kh1RKMZE5xzqfUXwLrc63t0x59fPPyEJ+72QfK/X1zJWfK07t9d94+uKkfI+/gQKgCKMH4K/tpM+5W5T2oazuMxdTwiIiTy3jIW05X81Ueh3kDjGtUr3ddAaIDdj3D58k5I5IPiiVpsZKeR5Dt91c6FNzclxHhfPHDTy5UmHQhlHXGsl1MTk1/rgKjJYA0uiuXjIBwMLInVFw4B75fpBnUnf8kbKrqFYKBWDnsxZ8O8pCWOT/j2m8V0ZDj2I6G5Yp2b1yoOcRH6c4SZysVzQnb4v0D2XELiiUc1Al1Qn4DPrnmfLOXBsQzxOficik2pFq1uGHxoc6N00Ui2XIR25Rn3ks11P8fWJT6zC0dDBuFpv9bQIf1G3gBjFKQAK3S2aRX353rToO/mQ+TA20b4k/5oMT0Lkrs9bIlZkp0NrHWEKKzpeJ+AKcBKIwMsMcKn1VouW0i3Ld6kWN7689R76NbZoBHWm/824YHHfdkUsuHxAr1LnDzDKW
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(346002)(396003)(136003)(39840400004)(38100700001)(16526019)(478600001)(6916009)(8936002)(8676002)(186003)(26005)(52116002)(316002)(36756003)(2616005)(6506007)(4326008)(5660300002)(956004)(69590400012)(6486002)(1076003)(6666004)(2906002)(66946007)(6512007)(86362001)(83380400001)(7416002)(66556008)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?a+Qoo6juenaR09Gh41IfuFRf/GmmQcrnJayqV4cpDU09FY6hHmotzvMnI5Hn?=
 =?us-ascii?Q?Od9tBTd971MvZl8zN8CpHaffP/P7TnuBMdk8r5WFmBnOFYstrssp/lj70X9+?=
 =?us-ascii?Q?7etg+fjfgFZsCtt1/d3I+n8WiOqhS2dwytoP8DWR31QG37oVHRXK2z3xD5ST?=
 =?us-ascii?Q?n87tJMnwT0msUee8JLcRsGUAXbBifumrIFQEf5Jyb9gNGnCdSXQeJ8BFwCIx?=
 =?us-ascii?Q?B8t9/Dfv4U9Zpd6sA9mTYMjDDn31t6fDIKwqAyuLWEo45uK31EYnStc3HXwS?=
 =?us-ascii?Q?90LaJWCyuhqf+/CYM49F60ou890hjIGDm8iNawAulrITDR03Y3JbZdiAwoGM?=
 =?us-ascii?Q?1KrNz9JkMIFCnIGpfPQ0eBin4ROi48VsZ2N91tLK8XINRMY4104xn7Ef3Kn6?=
 =?us-ascii?Q?hcThMKy7VQE7EPADLb9E/ilpaolOpcty0vmmtl0AZWQN0G3Rv9Zyxr2Rctzr?=
 =?us-ascii?Q?XkQ7/akVaSFzPi6U9tTcUBRFAl7bzK3jmMvywrJ6lOf3gZSw5R1P2Og9pyQk?=
 =?us-ascii?Q?VHEKXJwfI3ooSFvSufgiCWhr6EjZ3TZTaEo8ViJGIhrmQxceyhAUsDb4nU1D?=
 =?us-ascii?Q?q38+SG0QkIyedZ7730P9P4n3XIZs6E83+Bir9yONE6vfXM6OPqyCXcW4QNJW?=
 =?us-ascii?Q?BIaJipJS7zswAVk+UJLbclgvpWzTx54auC/u5YPSTOCqFbr7MWjRaxVFFTSC?=
 =?us-ascii?Q?F33EuRvrqVos5GghTjufe2JHuiV1N3fnr+lLtzHmIoRXrvPCXlk/3m2m6BQd?=
 =?us-ascii?Q?vH+x2kbcq9PPKXi6xkbM/Bf+r1Xw1Lxfye/PUC79UTNpgRrWAa3wyyoYuBjX?=
 =?us-ascii?Q?xL4/v57MzoT8UlMIKVd1GRhw6kLeD7VZh/8eU/jLtwiwh2r1/ixzDjLJQyzh?=
 =?us-ascii?Q?hLGoJMkIeDTJVi2zesrcduwZ3oSNIJHLPpF/NYSidxSMgO0e95/aytts6js9?=
 =?us-ascii?Q?mZ6dGQmpz64RZOZLPl+TFPSkpHJHQrulh2oLFk3mfLaPNVbDTzZ9rrYbSBJc?=
 =?us-ascii?Q?vjzFrrDODg/zeDtqc0gyertcMPumpXWRcZPTyJpbUpEty0CR5f3XkSdztfU2?=
 =?us-ascii?Q?94mqY3iqdT4m01gMK076ey+LcZrjRff4fn17j1ZzFqwYY4YU7HVfSjfxivm/?=
 =?us-ascii?Q?Rfe/UHjxas2JtPLtYyQPTLDQ/uQ1ftJDA/Zr0L8jA9yw1+5wyHwJG4D+X8Rl?=
 =?us-ascii?Q?oZDyY9LUXuC9RANKTTIx6qH7ges46FkI8jLzOnVP4PS47oHmaK47CXsB5BXd?=
 =?us-ascii?Q?KfGGg19h0seh/P5EizOZy1UVlASW4XchYGZrRkhvY3yXPU7jIfsr03Dau7Ns?=
 =?us-ascii?Q?hydzJM1bcF5FuhFXzw5RTR/6?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbc01d8f-1af7-4cb6-160e-08d8ef06ab41
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2021 20:51:59.6091 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HRRsNGKDHBSFZBzCKV8X3U17cLxOZTCPKcb0qOfU3ACDu1Qe5knexCUoJThRHgntExa6plFoVTlyjD06jvg1xuK+kOVOYh5NSpYtcwjCT/w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6904
Received-SPF: pass client-ip=40.107.14.109;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-VE1-obe.outbound.protection.outlook.com
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

We are going to support 64 bit discard requests. Now update the
limit variable. It's absolutely safe. The variable is set in some
drivers, and used in bdrv_co_pdiscard().

Update also max_pdiscard variable in bdrv_co_pdiscard(), so that
bdrv_co_pdiscard() is now prepared to 64bit requests. The remaining
logic including num, offset and bytes variables is already
supporting 64bit requests.

So the only thing that prevents 64 bit requests is limiting
max_pdiscard variable to INT_MAX in bdrv_co_pdiscard().
We'll drop this limitation after updating all block drivers.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/block_int.h | 9 ++++-----
 block/io.c                | 3 ++-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/block/block_int.h b/include/block/block_int.h
index d9e1f04b21..0245620bf6 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -664,11 +664,10 @@ typedef struct BlockLimits {
      * otherwise. */
     uint32_t request_alignment;
 
-    /* Maximum number of bytes that can be discarded at once (since it
-     * is signed, it must be < 2G, if set). Must be multiple of
-     * pdiscard_alignment, but need not be power of 2. May be 0 if no
-     * inherent 32-bit limit */
-    int32_t max_pdiscard;
+    /* Maximum number of bytes that can be discarded at once. Must be multiple
+     * of pdiscard_alignment, but need not be power of 2. May be 0 if no
+     * inherent 64-bit limit */
+    int64_t max_pdiscard;
 
     /* Optimal alignment for discard requests in bytes. A power of 2
      * is best but not mandatory.  Must be a multiple of
diff --git a/block/io.c b/block/io.c
index a3c2b7740c..129cfba68e 100644
--- a/block/io.c
+++ b/block/io.c
@@ -2964,7 +2964,8 @@ int coroutine_fn bdrv_co_pdiscard(BdrvChild *child, int64_t offset,
                                   int64_t bytes)
 {
     BdrvTrackedRequest req;
-    int max_pdiscard, ret;
+    int ret;
+    int64_t max_pdiscard;
     int head, tail, align;
     BlockDriverState *bs = child->bs;
 
-- 
2.29.2


