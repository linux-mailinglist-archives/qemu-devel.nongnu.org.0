Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEDA437284A
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 11:50:08 +0200 (CEST)
Received: from localhost ([::1]:45234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldrgt-00035y-Rb
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 05:50:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ldrcW-0006v4-Q9; Tue, 04 May 2021 05:45:36 -0400
Received: from mail-vi1eur05on2125.outbound.protection.outlook.com
 ([40.107.21.125]:31488 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ldrcU-0001RP-87; Tue, 04 May 2021 05:45:36 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SclTk+VkFfpetcuu+VJ6vhXWAzrMHaSJRbOpODvoTrr34fktVZiEeVUbjdZH1wyxo2ybSOnQdX2Mx0q/VvtOXVf5kNtBBOt1cxp7MVHMDqYOt6lgU0fV/awcKAicYFPwfpzmHYipbJAV0akOMk1sAYLlLx9ZmtSmy5RKv0vCq/HzYQ7klmeQqP9FA016OC9EUTXpkuPvR27RvDNS/omCeBTM46f+jFdPSBt7PLFrFEJgB/6aYKrK7g5kF2h/j5qBy0gow+dbQB5UXd7iyE5VBEpKrxpEckkblre+n855iYWdkMNAMaexrM4sVFh1WMzMCKKtWIDzoCDNWmw8w2cjbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2hhSFkrAqW0yMvUxJpy40QDVG+y88h6pemFJZzGMVpI=;
 b=TU25NL6YTFRxqR0ft3wgT8q0ZI40TOmEaXVMxu0pAzK+90wHPHcsWVoeObvneI+2FdVj6WVIMf7xndbAOUu3iX4B2T0sX3Va99J5e64xwNV22Y8cEsHb429e58Yrvofhezpj9IVhBGeEE4UsGxzREjy3ZEMe9yKj5tN0pMGF2AeE8absfwQd4aNfrdGx6M7krdCaUqob9UG85VTpgtYg0iJ6U6PtXjrtuBfjijid52UDPTKzMJ1lN3j8P9WX2ischfYdYmr1LOiaB8jvyqixCso6fLNiZVAEhRXhzAHY7qrkpyMUs953ik81dhGHwODJiUBXTnOGjs29p+vqkXrMcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2hhSFkrAqW0yMvUxJpy40QDVG+y88h6pemFJZzGMVpI=;
 b=TD5I9vnqIhEjE43Qk65cUD/Dk7rDuLfXwWo8d/QM8txr/q3UbePXjSnCA8Bso1fAOtHkHScbjOKhRYY1jA1fSheAslM5RE7juRPjfsXE8DZJmYcJxLdAv5hkfm2bPHM8sHut+ju7SS597HMzp9gUmDS5leUhGMQtNJ5c9/UB04g=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6947.eurprd08.prod.outlook.com (2603:10a6:20b:346::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.24; Tue, 4 May
 2021 09:45:28 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.024; Tue, 4 May 2021
 09:45:28 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, berto@igalia.com
Subject: [PATCH v2 4/5] block: simplify bdrv_child_user_desc()
Date: Tue,  4 May 2021 12:45:09 +0300
Message-Id: <20210504094510.25032-5-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210504094510.25032-1-vsementsov@virtuozzo.com>
References: <20210504094510.25032-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.251]
X-ClientProxiedBy: HE1PR02CA0107.eurprd02.prod.outlook.com
 (2603:10a6:7:29::36) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.251) by
 HE1PR02CA0107.eurprd02.prod.outlook.com (2603:10a6:7:29::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.24 via Frontend Transport; Tue, 4 May 2021 09:45:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6aa0207c-529d-4210-ed16-08d90ee15984
X-MS-TrafficTypeDiagnostic: AS8PR08MB6947:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6947858214BD840901FD5814C15A9@AS8PR08MB6947.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:238;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eF/YWXWFOh8UlnXUq35g0YuKjBqunkllWH4OiWksSBiFHBGRpEYdR5KIfUV3ZBjd08rsOoaG6Ww1rxVIA7Vs0xDxJOXuZEZDtiyucbk7GKKuon7tYB3Mw1a+VJcgQ8YrataFlgZLzDB+vm5xwg13m6fEqzgm2QVRyHLuHBPNaEs0T5selyYVRtlPrJWSYpRr3foPCYFkJ4k8BANoUFGdU2017MGHBPoZd1P9ZMFBVxhRlSeywADmPcr9TVJ9zhiqN+Vy+YsaQ4YR4drl3bmRbSJWJ/XWtEBug3UA/rHbxyasA9gmPuVNa6MJxITxyc34h1XUbINOTNl6LgSE7BXMy8JQugyhU7JfFn+oSbvHW9tULnz+fqnw4u/W1H39cU/6csWPeQSc2Et5hBFlon/2i4GuUVRlQCSlZO0KdMYrn5mTFLPdMyTpjVrMcmlyTbniw/0SMUyfdve7UyR3OJneQojzqca7PvfC+T7/29gC3xyByFp6wPNw1I5G5WkwuELj2kh1z+XYF8CB8DWnUKXmJCfJESe1yUnpak5zIoh6gWS4OvHl76AwvFHHM6T2+QtzwPx+/cDokmrjCMuCydDoWpGZhiD7ZqMrcrO8/RUOq8uw9ZPkZqFT76ItE2ISWwS5KDy4LuI82raqM6q+W06m8T//fQ9T0jrVgQ1b+hWdBpxa8dI3HoXCguvADyMiXswK
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(376002)(366004)(346002)(39840400004)(6506007)(66946007)(66476007)(16526019)(52116002)(36756003)(83380400001)(6666004)(186003)(6512007)(86362001)(38350700002)(38100700002)(66556008)(478600001)(4326008)(1076003)(5660300002)(316002)(2906002)(8676002)(8936002)(6486002)(6916009)(956004)(2616005)(4744005)(26005)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?21jD1piUmuF/CDnM75a9qbUuLCrPXQuF0kYN9vAXkvcJFG38RRrXTemkXCeK?=
 =?us-ascii?Q?NZHRi1Pq2ncsxzuvmBXCzuE289NXqi1Ujpyc+m0H4fWl9h/ZFIcPnzcro0Av?=
 =?us-ascii?Q?gDz2ihnfsPGkh4TbKD0NMPeAQsg+3AhfY+nskeIKhofMmGUiwhohMOyZlp/p?=
 =?us-ascii?Q?wxMzxedocmXpm+X67oW8B8djSFSoCUUt85e1oeDDYvTGFqjT4x2FvGCo/6zm?=
 =?us-ascii?Q?4hjx10NdHF72jC6NOJ1OL+KyM7QP5fxZ4qx+G1+wBzSPr+2Tcyf4khQMNJCv?=
 =?us-ascii?Q?pPI26Ked/tZvZ/MH9s5xTap80BhPranBFnpcM39YJwsXOHsyHnzKsJqlzBBd?=
 =?us-ascii?Q?8ClyMey67NvqximYXjvmyMilf44qwWTkaD4g8dl/XUvO53Xmq8+liPGrsQMj?=
 =?us-ascii?Q?N5GRkVRzAOFIJ0JP5fHPUQFEuOvkIq97phTUE4mT45iDcKjS6JTN7RjSVzHr?=
 =?us-ascii?Q?cpMZsCWguL5yRFzDD/FEIusLJiJmiKhlWm4nTComKPcRYYSFeal3pT4tKbAr?=
 =?us-ascii?Q?Pm98aE/fY2T9XTKNyxG+i9wI0QAOMTRpJ7eY/hFrPDlhPtN6MqbyTyEiZ5PM?=
 =?us-ascii?Q?Y4ujLM2n8l/jq/A4JRst2voNUXo3EBSTXYVsUQGfTwKH73a/xBlcPTR+Y15Q?=
 =?us-ascii?Q?3SwZW0oEtdQ5ORBIB2lqaTYwhsp8MbZHeJ2vO+SUFh+K9ye4eRaze77jxEk3?=
 =?us-ascii?Q?5Q9vOrXpxEW35sf14E2GgfwzDecW3htJbTJnMTN+CI6THYrDtuQMpTLs0XC4?=
 =?us-ascii?Q?cwaN1LcH9E+aUiRC3p78kDDJTyjdNeQ5c4LvL0zrkRsWr1GoUD9R+0GkXf23?=
 =?us-ascii?Q?N1OQqEE3m4Riw3ATl6Z+Ci9TLt5qHVj4kUZoglqkBOEV3s02kg2LGkIDQtSY?=
 =?us-ascii?Q?R2fTy2jgkDgHNzFRkfMa/5rGSJgmPTSzeFnql6cg9zKZhOv1DyLR6qHsVTV3?=
 =?us-ascii?Q?mc1eR3AGsrsf7BfASvrotWBdYrjOiudmtiwVjJ2I155IkEDTdwC0dXHb8W0X?=
 =?us-ascii?Q?3wr6XQaCxcdFVrYMDVaknvxLX6ho9Kuyjc0o2QuWNov+6MzOnjvAlPscmPpG?=
 =?us-ascii?Q?uI4Kzapx60r9zciXGBGR6hUhfSiwBhDm3BKzn+V+6h6QKZV5j1OI+NIj/Rtq?=
 =?us-ascii?Q?Crp/x+BFkU66/4LbFP2Z7F9We9n62Vm/f/6MA7YW74MV8k0VD73cjX0VzcuF?=
 =?us-ascii?Q?OwAIyUj7XsNHZzK4OQOm+qcgrMjXZmVR8xvZHiy+tl6r5Ruo5bmGQn6898aX?=
 =?us-ascii?Q?8m+phkGIowRJNP7Q0r0ZNExpaa1k3C1S5l49qy4g1XBznxPZlzuBNpbdKUw7?=
 =?us-ascii?Q?ijfP64r3DznSCiywrpwkWSJY?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6aa0207c-529d-4210-ed16-08d90ee15984
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2021 09:45:28.3841 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5JYOOkf2TUeSMiBVhY3UKuaXX70x8AaUnfZ8yurEeFklxAJlCOfTsZYO+C16wx4KzjnbryxUNqleCao0kdYevhD3zG/l31sB5ENzrXI9KRE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6947
Received-SPF: pass client-ip=40.107.21.125;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All existing parent types (block nodes, block devices, jobs) has the
realization. So, drop unreachable code.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/block.c b/block.c
index 54a3da9311..2f73523285 100644
--- a/block.c
+++ b/block.c
@@ -2029,11 +2029,7 @@ bool bdrv_is_writable(BlockDriverState *bs)
 
 static char *bdrv_child_user_desc(BdrvChild *c)
 {
-    if (c->klass->get_parent_desc) {
-        return c->klass->get_parent_desc(c);
-    }
-
-    return g_strdup("another user");
+    return c->klass->get_parent_desc(c);
 }
 
 static bool bdrv_a_allow_b(BdrvChild *a, BdrvChild *b, Error **errp)
-- 
2.29.2


