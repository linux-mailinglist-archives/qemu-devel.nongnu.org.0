Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 106C53BBA30
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 11:31:33 +0200 (CEST)
Received: from localhost ([::1]:40410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0Kwu-0001uA-Un
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 05:31:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m0KiG-0002a9-PU; Mon, 05 Jul 2021 05:16:24 -0400
Received: from mail-db8eur05on2138.outbound.protection.outlook.com
 ([40.107.20.138]:40000 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m0KiF-000816-3w; Mon, 05 Jul 2021 05:16:24 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cFq4YZDsVRKTVTfAw/0VVD8NwD4E/OlzUBo4jMQPhAQmjcVgT1Te8UWyLcWqKP6QQSpmKnIB9ztW1wHj5p5RHsW9XqcZF/EGyoDu6VSFSKQ9zN2So3flhResLLVrRXavU8RtVsHzDtPZlpVS2/4TPW6mno8y1S2WhURSHkKZK7AzbTYWrrnebV7UrhOiIMCEOQY4sektygyT/MeNmJMcnQFQ4PfgD7rFXc76qiKerYo8CwwnizXiI4eV4X+JCYcQt22J9ZmWf5Bp+S6Q966goOL0svnMSbvohSBm33TwieHDOOWINaT6I/sAEMQkWmN3V/2umlksLB3zFMTHdhMi2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dIYqD3Xie1Q5yPkhlVdAH+j4XsXSYKjQOjn8kSLMHXA=;
 b=AJLQdEc8aZyp50Z+0GaoJvZpYyVvVRwTxYgpQWfcJZk0zQQ0Id5Lv/q7L40Uh1FE6gOS0YeiuvKburFSfXAuCEYnTuq9B/A4/Wswf1DLM7FFZfvakjHpYN1BB4rajWNpZktGBStAgAwa1B36ZKrBd9xiRxRW4zYR4ma4cevWxvDJPNqfssGhjVPXmxJQWzSVo+6XaBbeRLZi1KUFpxE0/O1IOaK7EJMoZ4q9/J3h2P6KRErMEvnQ0jCAQxh0hUJCYOvH+U7Tsm2clYFKCzOIyz/pP/fWpqj8aNu5wy5xR/oS8hPHh8cGJbxtztwwSI2DYiIAIlldS3Z43Y8VW/QOFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dIYqD3Xie1Q5yPkhlVdAH+j4XsXSYKjQOjn8kSLMHXA=;
 b=LwI9AUEpomb7RLjDuus/7XZEbfX5bRE44Xq4DYq/wKRuCM6IEcAkQka7TkO2oeW6XRMi/+THCNHBFKyMkABLmGhDg0PSa489ukMbpM27ZV1mzE0SzFFOiR/sE81PoVPDK+EHRjJSfMEwykDfByjHO56pU6ZalDLykEbkX0YRq0M=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4470.eurprd08.prod.outlook.com (2603:10a6:20b:b5::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22; Mon, 5 Jul
 2021 09:16:14 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4264.026; Mon, 5 Jul 2021
 09:16:14 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, mreitz@redhat.com,
 vsementsov@virtuozzo.com, den@openvz.org, jsnow@redhat.com
Subject: [PATCH 09/14] iotests/common.rc: introduce _qcow2_dump_header helper
Date: Mon,  5 Jul 2021 12:15:44 +0300
Message-Id: <20210705091549.178335-10-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210705091549.178335-1-vsementsov@virtuozzo.com>
References: <20210705091549.178335-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: HE1PR05CA0235.eurprd05.prod.outlook.com
 (2603:10a6:3:fb::11) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.215) by
 HE1PR05CA0235.eurprd05.prod.outlook.com (2603:10a6:3:fb::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.22 via Frontend Transport; Mon, 5 Jul 2021 09:16:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2014934c-15ee-42ba-b602-08d93f958975
X-MS-TrafficTypeDiagnostic: AM6PR08MB4470:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4470F2EC9170C97A2BA0869EC11C9@AM6PR08MB4470.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jxtotNWIspEJ6oy3gW3dJo9Q/qIeQo3AnAgauR1XEt+Q3MywCUOnzvEQm8j+wKLD1cUiPdzYzNQEvFDzhkylaZrtV/EGniZZt2yT3JM282HQ77xWvtziCG4cvRKInOftt37TpQfcnQQLcr9xla0Nmyq8IWtzkoZEKKd4dpy/XZQqnB/nrU8zb+KemVaXq3+bCopLchV3Sro4/ACGCj+EmgRSaDITN5HsrvS5UTebRySeDMQUwsixbJ7zlvYUtzYOlE6SIDNO3t4gPY0y0aj8LJAbmyKq5rX+jFvN5vcA1XFa/Po/FjqGYuNIxLWOMl4dt5KYqwdFXMvP9wFgVmVCPHBbk0wxEKQ4I6i4KTBBRLIoznzIcvDUcozZVt+vIz0P52KMY4ryO6nEC2W5hXv7PRsnJ7Z47g4T0Tv+8qdWSBNtzhbfyhkkAqvvsP9lBH1dyE2rYr2ktdZS5l5aTPZTXJNn7OXHQnTGx7GYaA3dX4GylRqw0QvoIpivovURaDqSMditkhirf5yP6T7G3mskonF+dQmYa9ShGk72wa04413OBRriWrLelf0CUh0jMf0ymtECasJrREHpMfOzOf0J+3VaSpfVTx6mynYQfRXJ118paTir4+SNI2SHwjhg2fa4ylP4gGLKzgR/S5tNKKRkdxN/1xqERNMV9GmsOxHoW3xc9IdMbJdxvtr5yZmqf6KS0thvLY2y9Z/T5Cnrzh5rG6IdXYCfsYsPazSZ3NS+s5M=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39840400004)(366004)(376002)(346002)(396003)(478600001)(66946007)(66476007)(66556008)(4326008)(956004)(2616005)(6512007)(2906002)(38350700002)(316002)(38100700002)(6916009)(6506007)(4744005)(6486002)(1076003)(26005)(186003)(16526019)(5660300002)(36756003)(52116002)(8936002)(6666004)(86362001)(8676002)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2AbxwYig2mqs1GmxGDWD3AtmvLElDeEvH/dw89Tp2qK5NGmNzFWawBU54lSD?=
 =?us-ascii?Q?jHv9k6Np6sVGkBl0rD+OJrie8nWW9uVsccA4HV9sz4bj7TL/scsHfQVM8Ssd?=
 =?us-ascii?Q?xlyGuNhcZisFEyrLoumh/R2MTlLgycnl4unaGuaacnI2p98rnbzNIRhWkgXm?=
 =?us-ascii?Q?bRXfaJATcUVWfceazvwMGMXbiefoFiKln5YHb15/ZcBgj4QMbO/uI+y9bFEY?=
 =?us-ascii?Q?RD/LZP4nYWQcvnxO2hb57VWLQLwNMc0V8HqJ/NYvV7z/afY/ei8glPy2Qyhr?=
 =?us-ascii?Q?Elh//M5hilOphMl/GMdZXnDHWXnHIa9juInkGTAwXIapfqy9Bd77D6YaLJkU?=
 =?us-ascii?Q?nk2yBE5MkK2EDlBTqcIeNyFn61IxvCHbaNOSY5khMjwqKqyKKmw6WfN+azxf?=
 =?us-ascii?Q?FRLuDQ2zCkDiG6wSk7msyubftXNG/DiIn9AEY9IGLNUZvxsc2cGja7Wd8gia?=
 =?us-ascii?Q?b8DDdcmz39eHaA4hLoEv8WFU+A3iKr4wBxlObxjGPoyi+6g9DDjHq8T4wKnK?=
 =?us-ascii?Q?1EchoWZC0cCNdpUshfjL2M3Mbf2MVNY0KaIwKdmJy3lo5X34Vsl3GufBOLgG?=
 =?us-ascii?Q?oirlPesiIXyzK0g5KH3GieAfrF2pw/W2cXRpWySBMCe3XZtlQCAWVOGMRb7C?=
 =?us-ascii?Q?A+3P7pXJmdCT5ufXW3adEjAxxvzZmIC5PQh1mgXACOMfrxgJEQCHbLyCdXBn?=
 =?us-ascii?Q?1Wa+lYExvR/SencoJw8vOxrovsfhS4qhDvrBEgGkVpJqNTPrJHvYAnumisu4?=
 =?us-ascii?Q?DaGpLKZotkCdL6jxvd7ug/BP2YVjoiwXqGvgZni2D74dQzLv/BofsFZlHgv5?=
 =?us-ascii?Q?QXm3njC5DFTym1GfWOMcbuei7y3jSHo3lL1oQd9c+0qpGJBQCZbmDKEAYXLu?=
 =?us-ascii?Q?t0d3xajmmelA3IujfIQLzGGBaQ0xC145HNf31fRXe6ffKG6eol0Mlv9fqbDd?=
 =?us-ascii?Q?NKK18r4g47s+RQNWdM7kCMiGLy0dRvHt9aUKNrRJg29hX2YjP9ykjJTduxJq?=
 =?us-ascii?Q?Rds26Hc67qF3YQEJwxcf2/cxWsmHpt6n9xB+m9R91Bxl3k8L94k6LcbnH59B?=
 =?us-ascii?Q?FTg9oc6HBLdDYUA8UcDQbhkk17uIUcb7Nz5LJDQ0F0dnCtr37HUuFmzf8poD?=
 =?us-ascii?Q?g9tsqn3ejDNAKngVzPQGlrzwfqzAAE3b595nqAXF1pvgWBgGKQByYIJ1Lo6V?=
 =?us-ascii?Q?1N3SIzky4VnTMHa99rPZezH9o0xM6IxoeGznreGtSWpWAd7tJQGNH/l+5FG6?=
 =?us-ascii?Q?ZI/Zy6OOwwC49BbGJ+z6IGfc8FKdkKE/6VQWbM2BXImalYLHVjsyKPTrn2ol?=
 =?us-ascii?Q?KPZVXHuT34nn3MV5v3mB9NsS?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2014934c-15ee-42ba-b602-08d93f958975
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2021 09:16:13.9810 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4CA1J1L+ANp5gYklOFrESbwyb9kfIuo0iApVM7cm60rJ5BrqTDE4GLd2H3xIj2GFbGH2Fo6FkcR81K8C7a8UKNkypYhCBZxMFXgkVzXuHoY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4470
Received-SPF: pass client-ip=40.107.20.138;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

We'll use it in tests instead of explicit qcow2.py. Then we are going
to add some filtering in _qcow2_dump_header.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/common.rc | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tests/qemu-iotests/common.rc b/tests/qemu-iotests/common.rc
index 4cae5b2d70..ee4b9d795e 100644
--- a/tests/qemu-iotests/common.rc
+++ b/tests/qemu-iotests/common.rc
@@ -994,5 +994,15 @@ _require_one_device_of()
     _notrun "$* not available"
 }
 
+_qcow2_dump_header()
+{
+    img="$1"
+    if [ -z "$img" ]; then
+        img="$TEST_IMG"
+    fi
+
+    $PYTHON qcow2.py "$img" dump-header
+}
+
 # make sure this script returns success
 true
-- 
2.29.2


