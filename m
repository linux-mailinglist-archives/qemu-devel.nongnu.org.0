Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD9F38CCB8
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 19:52:00 +0200 (CEST)
Received: from localhost ([::1]:55936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk9JX-0000yv-Q2
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 13:51:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lk9HY-0005jU-I7; Fri, 21 May 2021 13:49:58 -0400
Received: from mail-eopbgr30105.outbound.protection.outlook.com
 ([40.107.3.105]:26486 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lk9HV-00065R-PA; Fri, 21 May 2021 13:49:56 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gDB/EG90xHdUamd8XkE90NvJs9pyhO6tALhVEaouUgU6xCXTN3J9TgoaWgcXPL5Fbpe1rBNDMpqPxPqa1a6NK2+HsRBRpnwa3RrS8yPBxVtURvwq+YmXT/FqmES4KhOx+6BsNkcm96doId+MHJ45R8CsrFbjyc8SbRMlX5xjuTmpKcKY6r4p4o8aK2Z/MTMkQXBL5hlp2jk6Jl/N30fNefL7FKluVAyb5AkpwBASzNdW+IhWoT2eXZZvhfe96lQAQhx0Wau4dByH0SDGwPBSf3c58HmOxY7sbAY0wFPU2Vd/6IUXjgpEzsoZkfUY1HoXLVnzG802Rdkme0c2ngGq6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FsM8UA1xqmsIsKc3h+9eoRECzg0XMMTjb+xgRtuBDa8=;
 b=c6aB/GqjSQBEw6EoT+cb5/ncsbtPijtYcD0YAm95EsNJCs28x6PGk9sdUsZUVCMAzLs/nJQN5/wtKzPuxgiAbTrowD5WwmU1N2skEFQp6uxQwoko24ataX8WSq0Mlfv+rs5e938FPzfGvo0GIBIGZRY9JljA4C5z8Y8b9BQ7DKrI+OJIaJyrRUiPWNTa2YftDztJUHHgt18PMItn1AcnmYfgZ2NCHdjXHvKO1pSn2R0ESFVtrrAC6QMR6DJMX39+EhuSfaCk/jgO79ko34u2OE4o/g295zNS06uJTBwhTcHnijlVbGvHXUO8Ty7nkjEiLH6Z4sTrsDWPDclGC/oFkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FsM8UA1xqmsIsKc3h+9eoRECzg0XMMTjb+xgRtuBDa8=;
 b=syb0DLcYqf3eH8TddErwel8vz5+vOWug6AY+TTvKLqfGnDDY8hsdDQUGW8MzJBjGeyRcqqrK0jpmdYt4ARyu/VvrL2C9RdYLJcXD5XwyG62uiEqW7CvJHTuDPc7R0bC9j9hDYTWutklSbLvjVxluaFuqW4biRpDp3nlNAUvEIOk=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB5911.eurprd08.prod.outlook.com (2603:10a6:20b:292::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.26; Fri, 21 May
 2021 17:49:43 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%8]) with mapi id 15.20.4150.025; Fri, 21 May 2021
 17:49:43 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH 4/6] block: blk_root(): return non-const pointer
Date: Fri, 21 May 2021 20:49:23 +0300
Message-Id: <20210521174925.62781-5-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210521174925.62781-1-vsementsov@virtuozzo.com>
References: <20210521174925.62781-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.197]
X-ClientProxiedBy: HE1PR09CA0083.eurprd09.prod.outlook.com
 (2603:10a6:7:3d::27) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.197) by
 HE1PR09CA0083.eurprd09.prod.outlook.com (2603:10a6:7:3d::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.23 via Frontend Transport; Fri, 21 May 2021 17:49:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c638a32e-2514-412a-c61a-08d91c80d0b6
X-MS-TrafficTypeDiagnostic: AS8PR08MB5911:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB591125D2DB98D16D8C8A825AC1299@AS8PR08MB5911.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DeDEqWXr0pPgA+1/NXf+YL6dNzsjLPEgiKUeRaJXWxVDkg/BFrC0qjOq0ieVetws+M04Gc/S7YzEHkp8PT96tonO3xAQeDou9r+beufiw4reBTwe/lDmbj4eOeyLX2osvHhCu9WzJBtpRc1tMjfcti8kWCX1bucrR3NADBzRQpgNJvFgXMvUFcRYGsJ9MjRaTa6nTCbuZotfT/YklIlmEtYUy7ZlI32brg77xvgFeXdXI9/EdxLtoOSl1hPKUs/YdiiwB0x6Ff+7my1rDkZPT6TWLe7yTqXMrojTb+PmtNKsW47Kxw4X+jkL0KDdLTe2YEhxaIAlM2gtd+aJwapcHmfI5Dvgnla6I8YqbT4zHUf8uR8v4XCQLUYtUdmm2bsjjSwOXgx2oD9x2G/0jGuV1w+qAErsfHgYmovjiriLSFZkO7O8MslL4rFWaX8x7BB5nkxQyA69iF2GWXZnLA+YtC6V43Krbq8MooyVJvW2vi7SXKrZ0qF/CeCdTFp6PfcRNrYsaGsLWNJ8k0x+aMilOj3sk23rwCg2rdeoV/3GOikEFPlejAw2LSaDCTegydb2OzjUIrZSqjBMBSK7StPLiQp3YHHzob2LMzmb2Q+LD90lHvJ39N8Lbvqkk8jD9inYinsJzAj0njjsMLp3tpdR56L8HVRIjFPj8tkXtnmxi8VqdH/w+w0bixy/I+ymOJt/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(136003)(396003)(376002)(39840400004)(6506007)(38100700002)(38350700002)(6916009)(6666004)(86362001)(52116002)(478600001)(36756003)(316002)(2616005)(956004)(4326008)(8676002)(5660300002)(1076003)(26005)(83380400001)(6512007)(8936002)(66476007)(66946007)(66556008)(186003)(2906002)(16526019)(6486002)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?t8rSEkR4XyZ/ANpwjwonByebzLUW2tgb2yQJ1nTFPHXZGlrorjjX1mq4mApf?=
 =?us-ascii?Q?9Ohaeh/FMxhrE+4w3xNjih302upNTYmcYU4oLZ9Z4I7HlqAolztKvon+JWUF?=
 =?us-ascii?Q?bqmhPOiHu2C1T2PqBXBLKVt5d0Zv+1MWM3KDPLPI+ru8fBGgWn/vaF1E9ESa?=
 =?us-ascii?Q?rykhFp7FNb8GIy+A/U/pWverj3kfFA2qCwHO2c41BIaCwPmHpAlivBwOxI7j?=
 =?us-ascii?Q?GTqCy/5nDcHs4vAZQvvGsNMTwyUSxVLRBIgb5zw/boizka3yLu1kSFJtGHD9?=
 =?us-ascii?Q?s1BYMik4pgUdHr+m+2ePjov1LkH7HZ1W16Bk2UILVbepHC0qOKxdDjav2NVM?=
 =?us-ascii?Q?K5rYRqO7uYI78mHlulLDRnMVE8qVVqcmG1ni0Fi4g1wlIqVvUOEzTAAc9bB6?=
 =?us-ascii?Q?kH2x5o2TLHj6PIi4XoBNsANTHqMclMSTAiG6w1NRfkvLIghYh19ZiwUq0SKg?=
 =?us-ascii?Q?fAMFJJZn3e4ay31uZx0+5xDEmRuRvvs12a2OOquFm5VZ5eiX16j0IzgWreje?=
 =?us-ascii?Q?vtvf8DD5X6/7M7c0aIM4oFzo13kgzHwfREXzrn/sCmLEKppS6NSj+//8rM5A?=
 =?us-ascii?Q?70WmW5teSIQNvBfIBMTl413yxVpqOKKgH10XfpQsatNDVFKl7IFqKmwCaRyF?=
 =?us-ascii?Q?+rca0suudcataKxGjGftd1M1NMnfO6sSWmIpM9RypDE0Z42YYQMVIEYn82t9?=
 =?us-ascii?Q?YqjkgUj5oLFJwqik1DmtvYbk7dOUWuWVmcclu2Oy6geWVurdnVHG2iVa15OT?=
 =?us-ascii?Q?NqF+T5TTXwZ5AFF4+55gVnLXKNoeAKa9awFq5EWkhuUOJtrcnzeePalU6raA?=
 =?us-ascii?Q?+ZZw/m7N0/degRjq33Ikn7d9KG2BQa5WGKLwvE7QUuB1+9hY4N7rU9IweLQt?=
 =?us-ascii?Q?NmdxLHMjmtsZqqBl7ehM73U6I+hFLULP7x1f6REujHSgVAMIi2eMfll6ZhS5?=
 =?us-ascii?Q?JJCakcInbVgRO9TdgY6FV/rJG+OKfKMO+utW6RKoFqd16NA8XCmt2KxltvEA?=
 =?us-ascii?Q?HGWaralwbgdORRx0H/WZ62VH8B8JEDiDtMW/yLsbK0Gj+JmI39n5o0uWwfN1?=
 =?us-ascii?Q?oYTYSUIIFO+6iXKBIXyOe9Bjpa3avD/PNtDv/38fTrzAoWKDcYuYn6VXK8Gc?=
 =?us-ascii?Q?Vpaexf6N/4sog75+V3gMlqGluHAy4udGxo4NWKHvIQBhVtgh1EB4n7gk3X0s?=
 =?us-ascii?Q?ZMMH3Ja55gUUb1H2mJacqJtt0NXyYa85mikSihHJ2Ju6STDyHItH+6jnAS0O?=
 =?us-ascii?Q?2Sm3cY+WBDl7PKWMnUvjTLscspx2KYCXuBIjqy66uJ61wroXi+MGOCnG391R?=
 =?us-ascii?Q?Z7wdGWfMMl9YtLkGteKn6Wa+?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c638a32e-2514-412a-c61a-08d91c80d0b6
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2021 17:49:43.4199 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /Ev0XEgCs0VsVuUf9RRbhX1JtB5EQTuDoQ9AZE8P+/94CBQ0S/i3/W2CQOkLx+q9LDssnmWtPQ7lNm1K6ybcId+9y3CkyksntLUzBnla92w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5911
Received-SPF: pass client-ip=40.107.3.105;
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

In the following patch we'll want to pass blk children to block-copy.
Const pointers are not enough. So, return non const pointer from
blk_root().

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/sysemu/block-backend.h | 2 +-
 block/block-backend.c          | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/sysemu/block-backend.h b/include/sysemu/block-backend.h
index aec05ef0a0..9c755c38b1 100644
--- a/include/sysemu/block-backend.h
+++ b/include/sysemu/block-backend.h
@@ -266,7 +266,7 @@ int coroutine_fn blk_co_copy_range(BlockBackend *blk_in, int64_t off_in,
                                    int bytes, BdrvRequestFlags read_flags,
                                    BdrvRequestFlags write_flags);
 
-const BdrvChild *blk_root(BlockBackend *blk);
+BdrvChild *blk_root(BlockBackend *blk);
 
 int blk_make_empty(BlockBackend *blk, Error **errp);
 
diff --git a/block/block-backend.c b/block/block-backend.c
index b1abc6f3e6..758cd8507e 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -2452,7 +2452,7 @@ int coroutine_fn blk_co_copy_range(BlockBackend *blk_in, int64_t off_in,
                               bytes, read_flags, write_flags);
 }
 
-const BdrvChild *blk_root(BlockBackend *blk)
+BdrvChild *blk_root(BlockBackend *blk)
 {
     return blk->root;
 }
-- 
2.29.2


