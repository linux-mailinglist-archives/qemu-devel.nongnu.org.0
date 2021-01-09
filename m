Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1981D2EFF73
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Jan 2021 13:33:00 +0100 (CET)
Received: from localhost ([::1]:60634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyDQQ-0005Wi-Sg
	for lists+qemu-devel@lfdr.de; Sat, 09 Jan 2021 07:32:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kyDL7-00089y-EH; Sat, 09 Jan 2021 07:27:29 -0500
Received: from mail-eopbgr60116.outbound.protection.outlook.com
 ([40.107.6.116]:64990 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kyDL5-00067G-O9; Sat, 09 Jan 2021 07:27:29 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mi/7DhavbJ9KImkPSry0r23P/39/c3FPdD4IYsYEFr0zkpRv101rl2DO7iQgQCoPnhFBEI8WmVMuEqK1Y0fs74mpmk2udQMhuxO4VJGXshxoh82o/fFsqUPOm2YFsBm0mtWfn8r+2pGNArimJPEpNezPBIAlVjHlFwILObJY+zn1YA+DulW8Rd2AVC1/q8RcWh/QZjsZ01qv0LjuxuQ/bACE4rEXfdxAvohYL7hqJ1sCox+jdqZbSQcPF6A9qmFRCxc2CFrwsbFY4DVllG4grU5r/YduW1o/A5ihTokN4/gqJ12Qrysd0cFihuM4pJbpd5BToBZ6ktJGxmPhD/NUSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LovCxJ1eNXoaCXRlRgPlXRbTG/ySt0Bzk+u1SvQmJA0=;
 b=n+lqJXqzD12Hyb0HDp9Pp2NJ+MhaDiRDbUZOcv+2PgPqsMkKqglT1IaY/bAqiAyKgv4SVy1Gh7ah1+iKfuCb6KgJpCD6uQ4hI5HkLh8fNQ36j7DZCaWZPkzO/lH+PMyjVSgbVQF5971KUvNPJ1pKCHaOGh+FymN3JHuQK4oDscalaFHh0sTNHpOpx17tmSKwQ9y4JcOmVnNrJglLzGIUBhO+V8wTHYWv7IhjB6VFYBOT3ho+p7kdOnjEjkjqggEWfzjADXNEE1e0EP6E2bnDqevU5SC/lV2NafPe7/ZcLtgAijuMSKPt/R0//Clb32nitTslF3CFaOhg8g879eBacg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LovCxJ1eNXoaCXRlRgPlXRbTG/ySt0Bzk+u1SvQmJA0=;
 b=Sp3g2+hgId+aLLM6GfC5is7/Pzn+b/JnZbilDpRGbhT/Y3tuaes9bqEzqJ01TMKJOlJ/C+ujNob472NnhTLv63Kzzbg4muEKD5hhRHJZHbmHlzybmo0rUE6PTUsMk7K3J3vC+gyD6hncP7RZPTtMsBBXC1OxQihR3V5rBLG+QSI=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4168.eurprd08.prod.outlook.com (2603:10a6:20b:aa::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Sat, 9 Jan
 2021 12:27:12 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%7]) with mapi id 15.20.3742.011; Sat, 9 Jan 2021
 12:27:12 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v6 11/11] iotests: rename and move 169 and 199 tests
Date: Sat,  9 Jan 2021 15:26:31 +0300
Message-Id: <20210109122631.167314-12-vsementsov@virtuozzo.com>
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
 Transport; Sat, 9 Jan 2021 12:27:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f2e7c02e-288d-4899-76d3-08d8b499e447
X-MS-TrafficTypeDiagnostic: AM6PR08MB4168:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4168299F19EF72411A48B8FBC1AD0@AM6PR08MB4168.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:751;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yPPDEPO30tdK5q78bATZU6j6zxf309Qkq1UKT2nRwHmo/xZfbymOU8oCJegZNu+fHUZqM4JWZIcnxuCj2el0PjYegKpr0HUjjchTl3OjU5x5KD9PxKA5Dww4lQb9gmYvUHrjtmC4EOW8nI6cYZPn51UBF5aoFkpnF886ejjVrEr7RV6pjUaZNKcCI3KwHPjB2UO7YqO9GZkr9grhq3IlZE0rglVcycN51NZMEcc79wxraWv+k0W+xUtZaen7ZccWvCIqwCNrmou5FAOF84srgf8eYRCGOvqJ7WywavFCK+AV8CK66UZyc7tGZkEyqCeECJY842Icx0r+dvD9s0I+iCl3ayQ51bbkne9+3MKW8UytgDMuctX2OpQKtmBCsncueXdsF2tuUYEN26J1wP+xaQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(346002)(136003)(396003)(39840400004)(66556008)(1076003)(316002)(66476007)(66946007)(8936002)(6916009)(52116002)(6666004)(83380400001)(26005)(478600001)(36756003)(4326008)(16526019)(6506007)(6512007)(86362001)(2906002)(6486002)(8676002)(956004)(2616005)(186003)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?i0S0Enp7r/TJ3txO5yJ9jCJJ7k6iYVsoCIph0/QufIAP6u+OXubQy6Y1DHBU?=
 =?us-ascii?Q?weV6fIkk8D+Thj4kYAJnouKsE9clyixYb3qdkIJ8P8ULNYDLEJvssOh2+1A8?=
 =?us-ascii?Q?Cvwlymu19p4LjRNBXMUiiJiND59q/nYZHuIwMap3lTIXF31zvjcSbJDpyYzu?=
 =?us-ascii?Q?axC8BfEG28JE2ZR3M85xf0uHZqufrR4eU6tcZmf98CRKbL4wtdV1K6DvJ66z?=
 =?us-ascii?Q?8UpArgI/zik+SxgkROXS++psO53xpYXpG6bGRoFr572WmbJa00yHKMEemWhd?=
 =?us-ascii?Q?N2faT9/98JwrS2W0C5gPWY5dCSbFSnezT4zqhxY/L+e6/YW2+o6p6uqGtbDI?=
 =?us-ascii?Q?fFSVDxP7Q9nqWBtAwPa2sRoKqBtajll51YgH/xuU17C1dUB/HRlbUxhPpx/z?=
 =?us-ascii?Q?hZ6QeY7+PXMitLjW0cK3u8RCQ6XXX/Q5mfhMjm99HNdotkn6QRC+bTlwsVgP?=
 =?us-ascii?Q?OVseaN3TKf6jjwAVaQYN0KcRq/ozNDi3myCExhIri1mf6G79DOHI3gzYTv+K?=
 =?us-ascii?Q?69MqmyLy/f+T8QwRKHDHQ5QAE7sL6+Go6v1zXmNlJgJb+34Lntttef99C9UP?=
 =?us-ascii?Q?7uFIZxSKQ9Q/kBOMl6YU1vHmOG1x3gvryCmeougrbKmNhsmX23z1LQA6+2Vw?=
 =?us-ascii?Q?JTOXARvCTq459Ifi1oItIFFQviL6PUEjSMR7KrARnDhQ3sV/1DtL603coaJE?=
 =?us-ascii?Q?v+Yjb6/A0+OpELqrcatJ1i5l3wphWPU+ARVMumHo1pzf/tMv1WH36Mn46gvc?=
 =?us-ascii?Q?MrbznlDac9eHu4SXzkSm2jJ1G00E6jaw5rh9r/lzyeZskKvk6VC4x8ThvOeD?=
 =?us-ascii?Q?54MDgSsjFlRG/H8xJpAMjPojZn5IFWqJbhYwgFbCyrcT3d7TPfMoeHbtthjj?=
 =?us-ascii?Q?76SyKMSrVRP0fs0EsyTJ8UhQMUDQjuMA5Ao0pj5DBKtVFFU1qvB2yMzC01c+?=
 =?us-ascii?Q?Hx5Mx1KciQnlQcj+7uwNB7BmYs7r19ZqfywhVStACi2GzpSSIVAGYdCePmPR?=
 =?us-ascii?Q?0bP3?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2021 12:27:12.4923 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: f2e7c02e-288d-4899-76d3-08d8b499e447
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PTYGVHwvlMxXUUjtdiDRdO/0Ay8eSwmfDlzTs25L62/eNxegX4tynqu7cTDE/vUXkJ1Epx0zhzlZcUIAq6q29s6QLiRfMGUCl1h3rWIJWig=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4168
Received-SPF: pass client-ip=40.107.6.116;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rename bitmaps migration tests and move them to tests subdirectory to
demonstrate new human-friendly test naming.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---

This patch is and RFC and may be postponed. Or may be applied as well..

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


