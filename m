Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFCE830187B
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jan 2021 22:08:35 +0100 (CET)
Received: from localhost ([::1]:56156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3Q94-0002pr-Pn
	for lists+qemu-devel@lfdr.de; Sat, 23 Jan 2021 16:08:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l3Q5s-0000zE-Fd; Sat, 23 Jan 2021 16:05:16 -0500
Received: from mail-eopbgr150139.outbound.protection.outlook.com
 ([40.107.15.139]:30663 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l3Q5q-0001gI-Ok; Sat, 23 Jan 2021 16:05:16 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mbn17kbZQMg0z01WVDWpjoRcUnyOZ1jroJ8PwyE23j2DvJEK6GTjRhluIN1ZQUH3SWRN0wFEBFspzJpD5QUNXmjB96ItD8GGGEnQIgrleAW+mzAQq7f3wUQxjCxzfZgt1OhydkIiT5n2qStzoNFwezEtl6X+mgYkninzkFqRkNB84k8/wfs2C5cmlFfPqNNld5CfTru7RFRmpVxIyI4Dw7jmT+vCO1j56GmDx8MUa1nJqKnaXXyqC6rUQ4h9wgBEgWVO00Vk7+fdHwpTYLL5SpAXQ8rv4x15XN8/flV+0ShDP0jpNKlJn9qDrLJc3TVVIEU3ncsAjXv72esT9TZA0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FtE0VJL6N4O93BLVx+z3eArBoVg82V4idyb1Sk5Ka4w=;
 b=coczZWCnZdI3ngOnF8gpGtVjzht1T+K8eJQUdEie1UqvZt9SoCkrP4mMvJPZu5onQf0A8zkAaCQZCkitnvwjWI6Uqkwt+UHbXMBitP9q23Ob2JpAD3cYmhbamdUBUmqOgg6snSBCdBv0Y55fhNPi5DIcmHpucxiCFd09eSXjzE5MQ/UYubrcfmVxREQ9etHkgV9s7jpjOa2aUJRUDN5XDdq5kLzxUBsJEEU5uTE5XdPpE/+dR0NtD1tKl6O5HvFQkmSi3Q6DGzrbpGTbSezxbjEc/XdHb8a9VDaNrDyRcJDvkSqxvUBqWUrjXa0kxlCs3H0FhXMs0lDJyszvvP7WXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FtE0VJL6N4O93BLVx+z3eArBoVg82V4idyb1Sk5Ka4w=;
 b=onsaLPS7C51X6i0wFGSwB+DbDYD6pqu8YWABHkxrnhosWuLQM8ddbaB5L/FmFPwL3ClX62gyFz28Fuxx4FhzqYRvbvVLa19dflx/KxmO5VLGWnNIGoFviNLR4YwWNg0e98G7oQESkOUM0KRgL/EGm7RLW9ggi4dxb3sT188EABw=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6053.eurprd08.prod.outlook.com (2603:10a6:20b:292::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11; Sat, 23 Jan
 2021 21:04:54 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3784.015; Sat, 23 Jan 2021
 21:04:54 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v8 5/5] iotests: rename and move 169 and 199 tests
Date: Sun, 24 Jan 2021 00:04:28 +0300
Message-Id: <20210123210428.27220-6-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210123210428.27220-1-vsementsov@virtuozzo.com>
References: <20210123210428.27220-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [178.176.79.161]
X-ClientProxiedBy: HE1PR05CA0196.eurprd05.prod.outlook.com
 (2603:10a6:3:f9::20) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (178.176.79.161) by
 HE1PR05CA0196.eurprd05.prod.outlook.com (2603:10a6:3:f9::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.11 via Frontend Transport; Sat, 23 Jan 2021 21:04:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6bf09b7d-c7b6-483a-7ae7-08d8bfe28801
X-MS-TrafficTypeDiagnostic: AS8PR08MB6053:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6053B5F2741574E6A167A412C1BF0@AS8PR08MB6053.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:497;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y1kQ4Ckgi6flV9sTnFwaf1mdqyJ58MkzbpVaYd3R4Lm+Xjg8lO1a6FbbmkKAFCzUYCt4UY4+Nec0G1wSkdpD2MxI4ywH2CcsamtNQhb3B/61IR1SsPmekeS+uomswU/HFs1dxD3F66CNEOFcbygJXB57MRXHKc9rbyCPKcR2ezFE01XTJdORts0fgeWgb5klqGPtcahR7oqwjUapZWzndCuKvcOtRl2OknFw1tvbEaLQxB2/E1VWER5b2CupIdmlXD51Hbwl2o2Fd+kFSUvZHOTQOJZv4bvAU0J95jJPyKAq3X168Y4dSSVbRC+Qk+LIRngr/bxJcN9Es7nVb/hchEqhLt9ghK/ET1Yrq+W0DQR95weA+8os1Ipta8CXiopDHoOp9++Qt3uaA8TN005QMVn5nHUIJ9KdEXwJ9iV2Hm5pkpXQ7uLxbNqIcPSrKXU00ZG94gbQVzFR5my37aN4ihIpq7kqcBEjOHKuDYhKIpW297r7Nliuu9NTuflK1guHeZpLJEbU2xBSX95is10QEg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(396003)(136003)(376002)(39840400004)(83380400001)(956004)(107886003)(6486002)(186003)(66946007)(66476007)(4326008)(52116002)(5660300002)(1076003)(8936002)(478600001)(26005)(2906002)(6916009)(6512007)(6666004)(36756003)(8676002)(6506007)(2616005)(316002)(66556008)(16526019)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?9VzpHdCEKJ4gM0UeGOYUP0DomQvGv13XXqJbGyE/gsCQ3ImGqK/HCDnLQQ9o?=
 =?us-ascii?Q?PHeibdRPx2+XobGDx9LxNDi38CNkAu1KBzyQSZEi74BEZ9kCzSJfvs1p1dF9?=
 =?us-ascii?Q?OgasvgWf5j+GbtJl58UFUJLtVmKbUdU/8WKYGuIGyXAzPBwJUTGArZjGSCBt?=
 =?us-ascii?Q?9Xr7SWs30XlBla8pmKG+MtPJQoGMYtMwoUL3QCAh0ThRUyGGH7GBYs+phuuh?=
 =?us-ascii?Q?V4i02lfkq4zSMwF9ZcZuW7XkuTcm/aqM3i/PEMj/tprPuHigsWvf2oC5Deg4?=
 =?us-ascii?Q?wSIOeQkxM0gRZ4nP5AF3WiiD3hrOqJPVBbaSF6XG/advDp2fxKkJF+TRHOeN?=
 =?us-ascii?Q?nUDdHTB1NJHlEpp0CDXHalxZlSMSCr/k8riee7gvO0uXKpf0FnEUoj7OxPew?=
 =?us-ascii?Q?gjZ2bNz5Zbw6agQLsKNLRFZWfJayHjteY1eWQg6guBYlD5ZFBp99hVFOu59S?=
 =?us-ascii?Q?/gF+ZIhpwY0uY0pe/Us8BNgdFoGawa6rdHmgHrlnx5td5LbhSwWW0Ztcxlin?=
 =?us-ascii?Q?wyRvwEWeHqbohhBmfgkgp6s8hFSHrcTIK0Lcgj9FuUV+Pt57Is+qm7jcx+s0?=
 =?us-ascii?Q?MEFPVAo2uPU2y3RJqR1NyC+leHCiuYYh0tlPSNgkGBeSEXnLt3I8+IE+0TZy?=
 =?us-ascii?Q?aAoJfh3ARQ95mic+z3kAIkT/aF4O4rrgEHFvkWv6KDFyFL5ccjT2LbvIuN1V?=
 =?us-ascii?Q?q2KIIj/IJAz8jMOzYz61jLaYx9I+4VKXFH9DWW3zGvC6wxGOv8FwIkRPfraX?=
 =?us-ascii?Q?qpXGchnEDizoXB+WFElLZWIT4ucQs/tZFwv+DdeuIQt/MufeuleUxOHAE5CJ?=
 =?us-ascii?Q?OBlE5DtojFf0v+HvEtUWO+Dn0EStnxEpMMOiGnzMXGRhy3gfeftfXyzA/wYE?=
 =?us-ascii?Q?HvPLG7rh4K5PHFwEMLZ/NSq3Uv3NwOM4300LuTMFdGSjjQ6x+YExlM42Ai34?=
 =?us-ascii?Q?lr8Bl2B1qbQ50KNU0pvBVb2OD3fqOOYlURR0HP5p0RQd3GcLWZviy/Ssq1Mr?=
 =?us-ascii?Q?4pWL?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bf09b7d-c7b6-483a-7ae7-08d8bfe28801
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2021 21:04:54.0179 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eg35AnO/8pl7jjUVa1uE1eh9bLNHH5CJFu42dIcP89x6/GlxqCXJsfuRsQZpUcKJVi6RgC+F6xCSUID7KMAvt+oVl0+j0LPFVhek2r3Utjg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6053
Received-SPF: pass client-ip=40.107.15.139;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-DB5-obe.outbound.protection.outlook.com
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rename bitmaps migration tests and move them to tests subdirectory to
demonstrate new human-friendly test naming.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/{199 => tests/migrate-bitmaps-postcopy-test}   | 0
 .../{199.out => tests/migrate-bitmaps-postcopy-test.out}          | 0
 tests/qemu-iotests/{169 => tests/migrate-bitmaps-test}            | 0
 tests/qemu-iotests/{169.out => tests/migrate-bitmaps-test.out}    | 0
 4 files changed, 0 insertions(+), 0 deletions(-)
 rename tests/qemu-iotests/{199 => tests/migrate-bitmaps-postcopy-test} (100%)
 rename tests/qemu-iotests/{199.out => tests/migrate-bitmaps-postcopy-test.out} (100%)
 rename tests/qemu-iotests/{169 => tests/migrate-bitmaps-test} (100%)
 rename tests/qemu-iotests/{169.out => tests/migrate-bitmaps-test.out} (100%)

diff --git a/tests/qemu-iotests/199 b/tests/qemu-iotests/tests/migrate-bitmaps-postcopy-test
similarity index 100%
rename from tests/qemu-iotests/199
rename to tests/qemu-iotests/tests/migrate-bitmaps-postcopy-test
diff --git a/tests/qemu-iotests/199.out b/tests/qemu-iotests/tests/migrate-bitmaps-postcopy-test.out
similarity index 100%
rename from tests/qemu-iotests/199.out
rename to tests/qemu-iotests/tests/migrate-bitmaps-postcopy-test.out
diff --git a/tests/qemu-iotests/169 b/tests/qemu-iotests/tests/migrate-bitmaps-test
similarity index 100%
rename from tests/qemu-iotests/169
rename to tests/qemu-iotests/tests/migrate-bitmaps-test
diff --git a/tests/qemu-iotests/169.out b/tests/qemu-iotests/tests/migrate-bitmaps-test.out
similarity index 100%
rename from tests/qemu-iotests/169.out
rename to tests/qemu-iotests/tests/migrate-bitmaps-test.out
-- 
2.29.2


