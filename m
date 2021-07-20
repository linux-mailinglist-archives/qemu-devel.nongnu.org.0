Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A05B23CF946
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 13:59:42 +0200 (CEST)
Received: from localhost ([::1]:43092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5oPV-0001RF-Kb
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 07:59:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m5o68-0003d6-FF; Tue, 20 Jul 2021 07:39:40 -0400
Received: from mail-db8eur05on2136.outbound.protection.outlook.com
 ([40.107.20.136]:65205 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m5o66-00077C-CS; Tue, 20 Jul 2021 07:39:39 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eiBY2WM/zUQnqcSpyEiqCH+SmKgCVPNkNFq9MLho/vF3PnPdq1KjSQYfFndIdR0QBimP+6bgXs77PcEvxe70cUVQGSTEizwvZ3ry8q8Op9dZTPI3JsUOfZkiajAR6Xia/ewW2EReTkqA5emFUPjANEaAi8BWkNbHnVn2xfZGfh/gpuedCXYkzoXjNgd0/nc7mdF2XcXlmEdneJB67x9k9Yvytf0eNLekcQUgmu8kmuhIiAsQ1an7HCRGiAMQR6agTx248FBUcyB2cLoFRzS3REnZEW4CJ2Tr5b9TsmBK4WTMvdziJjeq87B6TrbwGMs6TvPyZbxsr1f6FIVTW0s3sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DflGnfCnKJ7R5aFFDbKXwyt7+W6Mg0/R8lONJLIquVM=;
 b=aekM+MukEsGnp/rlGyHJfWcJmwgHwXVh6ncbSjKQLjCJHgnuTnywlPvDzEhYOb8Yu6BaNsuSffGgstK44IpmMY19lZEc3lim3Fy4Op4TmVgk/h/rr+8IAJG+fOCbSqoirGSwOp3bZDKlhcgZYFWS9+YNviBN/910Jjrk0EZcg1lzeUGD8uyiLbEo81ghNLYHVEzxeWoJKDh1tyD1z9hX26FvOlXT8RXdolrdnLyd5wpiDvxEFGqTzmUInihCAFCtSxHl4mVpWgxH9wNCf8BHNgDp+JWUk4n3PpHmMoskziKoPzntr4+7pyj0CGcAEMRROQnSCAYJuSn1qIAsllOxng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DflGnfCnKJ7R5aFFDbKXwyt7+W6Mg0/R8lONJLIquVM=;
 b=C8oamIfSUI78QSDcSbrUtAaPERLrbvH3Q4SVMs9+O9MUeuubaMY+k4UdjhFiZC/UltEORAu+wGhHlTtP5dKLbbDg3yw6H2CpJD461D9vbGiWpmRberVQF9EWNReWhWilGk9kb7h3rGMQhozve/rjEupjSaZfEDYVkHRA1hzxFE8=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6119.eurprd08.prod.outlook.com (2603:10a6:20b:290::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.26; Tue, 20 Jul
 2021 11:39:12 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%6]) with mapi id 15.20.4331.034; Tue, 20 Jul 2021
 11:39:12 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com, den@openvz.org,
 jsnow@redhat.com, vsementsov@virtuozzo.com
Subject: [PATCH v2 15/17] iotests 60: more accurate set dirty bit in qcow2
 header
Date: Tue, 20 Jul 2021 14:38:30 +0300
Message-Id: <20210720113832.586428-16-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210720113832.586428-1-vsementsov@virtuozzo.com>
References: <20210720113832.586428-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR05CA0146.eurprd05.prod.outlook.com
 (2603:10a6:7:28::33) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (31.173.85.199) by
 HE1PR05CA0146.eurprd05.prod.outlook.com (2603:10a6:7:28::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.25 via Frontend Transport; Tue, 20 Jul 2021 11:39:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bf822160-d58e-49a4-4369-08d94b72feac
X-MS-TrafficTypeDiagnostic: AS8PR08MB6119:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB611960B4BB9350593A67B3DAC1E29@AS8PR08MB6119.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:256;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cqo61eYN5LBWXLxznM8Su9NCJ+h5FwXJkWycMMZRD4xJBk2IXqk1cmcOc6XEz/IhcP2nFpoXAv0sA5r45k43YN03X0T0S4qbl882JblfqoEk8GmxuM1w05H4/pZ/nyCX5WM7R4AH/DjvqaxdSvLBu/3AgTB4K4WUVPntsxe6jk2gHMKtIS3m4EJqayP86W/Rt6sF8wpEV9jlHiqcBIs1Ul2UO/h8oEmiJwOeOHHdLxYHOBQqcWmfjVUCbT+JSmwOBqH9QvsZ6ZIZj5HhECS8KlsQv7hNuWmuF/Kv4z8dKhaK6MeS1IWK5Vo9Pb88vC39Gfe91z6dflz3gB3IfIMnDG8ucOQCZ95ll+CIiwumFOJQgSpoGudWkeThw+8nnpeIJccUaGWH0U7aqBpdQAgn63O7Uy881weHV5fxVvUfumvjXPMsN7FEeyRrrJKvRK1eLTjt/8GSE/TwH2iSD11HNQVWxkWF/ZjGLyjKbM2SRRQIGzkJKs1Vu3DuvbM3eIBVzPFP5ClrjY7tvnXWVt8ckd55EYUPwcKo46d/cp/ctIutoZg1ek3t/udkSa6e5E+7n4xm2MtebyBiO/f9n0jQvwkMl/jjklMrTGEmVS7lX4ES3WWkpMc06tyeDwFMpwlVT59y8iX7opvcKDuO015nKaqW8a1X1M1VG3jdwVcYnbM2B6rerNpRz8xDJ140o8tXKy0pCOtnOBCHEhc7H/l3HHVGnX6rIDu1cnkTR6ouHf4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39840400004)(346002)(396003)(366004)(376002)(186003)(4744005)(1076003)(478600001)(5660300002)(6512007)(6486002)(2906002)(83380400001)(316002)(956004)(2616005)(86362001)(107886003)(4326008)(8676002)(6506007)(6916009)(8936002)(26005)(38100700002)(66556008)(38350700002)(6666004)(66476007)(36756003)(52116002)(66946007)(14143004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nRllLqUH/+6SyXRe6S9W4fN8MBBjjfgv161kFB5yUV23qyVVqN1W1wG5DGuh?=
 =?us-ascii?Q?TfdGlXFzo67se2oRNP1n3gCab2LwfgUzBbbAEkFlEXUZz1k2k/01dhWaGAsw?=
 =?us-ascii?Q?r9F+12MqQgFqBz8fHY4CQBLnfVYdxUeFWeHxYBmsQqwN4iyLwld/A0ebVahH?=
 =?us-ascii?Q?Cvd/uz0Wc9w4dsI77nClfKgAXqBmmPSnlJr4SPQHGwmCePDLr68R9GqPzjQI?=
 =?us-ascii?Q?42y5zOHcEvAFSotGduwLVPC11XprA4wo/G+lCQYA/eFBOVNcSK1rxOVff951?=
 =?us-ascii?Q?hkzGXy27K/rbOqaznlTZxpRM0QSXFTdwKnQUpOg1HWJ6d/Z7w4VRCDeFe83T?=
 =?us-ascii?Q?ZK6TDfvJr+Z7VG0pElCaPdjNKf4AtEa0qj5YVgqrnbdfQ2AeXS1XxdcpsqNX?=
 =?us-ascii?Q?T4RjoqcYxd1VjmpbFmXoSacV5MsXUp9PVvnxVaXIKCGcifJh89yL9l3RlIc1?=
 =?us-ascii?Q?5hh2v+gwH5UotnSUz/pRar7e6Kh5pSQWQYKpzkDeLnDjG3huIL+eERLeWyuT?=
 =?us-ascii?Q?NQMK+wQ4RIIXCDw1pUmhUcLtCj8htd3V+QDJ2K4QB9eGVRJUY9F5kRmZp7DE?=
 =?us-ascii?Q?/kPX7xMwYiK49eVz31Auf3jiDEl5w56aZOaBdXyjwvHqYcBjHmU7xFEa5Vjf?=
 =?us-ascii?Q?ltNyiW3SCITMTde9/YrPCXGsgCw/ip66Ny43rB+xhSmcH+x+T5JuhBTK92R2?=
 =?us-ascii?Q?zh2s1nyVZSNQhxCbdAf4Xwxtc7WP6/2tZqNuj9hqtdbOblalRAgGJ/i07O9B?=
 =?us-ascii?Q?WZKFxyyAGa/FvxSID9Opwz508a6j+6w7d0qXNkkIg5s0l2VsJfLA4bN22bTS?=
 =?us-ascii?Q?a5/58X1n1V/2sk6yYKlW8jQaXOR1A4WT3Hnk2bZzK0CueuCpJX8tGrZw5+WV?=
 =?us-ascii?Q?jQnQn6lT+BpWpi07nLlwWxog98syLfcZvdKaaMdj5dBrqOFW1io/uCbgBVzG?=
 =?us-ascii?Q?AfLOI6rZnzQgvqmuth5GEg4uWcTLXgRh9fnkE7CDXCfLQDeAJM5UOp9lj8pd?=
 =?us-ascii?Q?J3uzTHKL4jxx2F9bmVin1KnFXtNT1cLUHtS01dJwu71uf/j2l7Sp0sqqyWOU?=
 =?us-ascii?Q?rwEaOm9R5t9t/OVK0JmhkyiuaXqS8cl2I482otJa9MDce3+Kce8ajfz5VcaW?=
 =?us-ascii?Q?T4r8EDNZd/I2QLsk9pai2SVuaIyf+kLlJ9UReTC4T+ubzcyEYJ5ty22XBQAn?=
 =?us-ascii?Q?zPlYeXFsnetl1z/IrCPo01WlwU8m2bmX6yItSG6LMuGpHgW/4IMe0XSUW499?=
 =?us-ascii?Q?/kDlLtwe2PowODKKjQR7x2/GSR92u9H2akbTLFWYVPuu2RgiyNAmrRvJdK8i?=
 =?us-ascii?Q?L8vtqRPtNO+6h18ApneMSPr8?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf822160-d58e-49a4-4369-08d94b72feac
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2021 11:39:12.2744 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9KF7MMKLnrvIIA2v7KQLgnFPCJPsvoP+yaETlN0ZuBWtqiUTrhyGOzDyyHkq06QBsG6fnVzM7lQdYt6EpwS4BdV3OrEMW+r2JzIIXGacDFY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6119
Received-SPF: pass client-ip=40.107.20.136;
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

Don't touch other incompatible bits, like compression-type. This makes
the test pass with IMGOPTS='compression_type=zstd'.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/060 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/060 b/tests/qemu-iotests/060
index d1e3204d4e..df87d600f7 100755
--- a/tests/qemu-iotests/060
+++ b/tests/qemu-iotests/060
@@ -326,7 +326,7 @@ _make_test_img 64M
 # Let the refblock appear unaligned
 poke_file "$TEST_IMG" "$rt_offset"        "\x00\x00\x00\x00\xff\xff\x2a\x00"
 # Mark the image dirty, thus forcing an automatic check when opening it
-poke_file "$TEST_IMG" 72 "\x00\x00\x00\x00\x00\x00\x00\x01"
+$PYTHON qcow2.py "$TEST_IMG" set-feature-bit incompatible 0
 # Open the image (qemu should refuse to do so)
 $QEMU_IO -c close "$TEST_IMG" 2>&1 | _filter_testdir | _filter_imgfmt
 
-- 
2.29.2


