Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 744F06EE22C
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 14:48:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prI4J-00016G-PV; Tue, 25 Apr 2023 08:46:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1prI4B-000155-TK; Tue, 25 Apr 2023 08:46:43 -0400
Received: from mail-ve1eur01on0722.outbound.protection.outlook.com
 ([2a01:111:f400:fe1f::722]
 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1prI4A-0000dl-BD; Tue, 25 Apr 2023 08:46:43 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nlj2xLB6xMi4qFA/dBzJPLnBLgWdvhc+fRFZnjTFp6ZKU4T10xHyjITrqcyxfUsrfxbsvadkbz4aYji3n7hnmFsWijb5cLV+4S7+43pTq9icX1I6xlforzuMSLsic//n3rR5D73Z/+AbqJyt3VD+mVnWBrHG36TIS0bD6cVLZzdVKR0eCR/ArmSIlonrmo5i0l+L0vcptk773AJwdSbYlA2AlOQ4ia8SWYcSuHYdvhQjzFoOI4PZQJeoTUbZgnYaM6htA5sNf7j/4IHW1FUEBzTeoR1aSlbbwfZdv65ek3CJHCozRQBNz8eQQ8T6uApvrUOzuNzMRICm8tzhHLrTPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LGL7HxMgStalF0Xb+Gap4NMDYI2rDOLd7JEiC6WJGlI=;
 b=A9yi5oz1HjcsxAneLSRCTlsiMlIstOfXo+feW+b8kDH/CiWxTyyev++tycVCDJ/Du/vdxMvd4lqh41tu2TWThHDc5Cs3miso6LuBCn1vHdpX5qzsbHEQlnnoTM8NMNF99y8VGgoPfsNOTF5ihdy5qHgwUSkzj/H2QcmkSoy2GPgLTomfbVnNJ5aS3VONZfAB6U4Bt3Owh0V6TF3fWo+JckTukg8vqRpLlt68uP8Ld19rYCAPEgFXsxZvixv3OfjYaKCyMPvQ+Y/3vGaufn695v93/Gk4QB/xU6pA6cd+IBhHpMLLiuhYp4l36MmlObUX5Z86M/mFly3/yn7j7OB/Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LGL7HxMgStalF0Xb+Gap4NMDYI2rDOLd7JEiC6WJGlI=;
 b=gCnRHFze1esDfQKqBnZld7kY3lCboNzecUFfoIJBYcZgaMkw2zVweJDVcJVd0AqB8UamHa6eYPG0rABAv3nrRxr562aalMC/4avY52RqzyzVoAwLMQCbe6WnvmAcWa5VeaNbsY6ie59gPvCIztJ8bliKDuTFQi806NmLIeL5t7Mny+c5XMMyzq+w66q47gqnE7rJG56NDNtnBzmL2L8En7+qnYfuOLGYUH0SjkMGQRrZ9rJnD6kWg1z4Ipl05qDm6tqbEJy7oXa+40vpYVsEHI7jMV9nGon0lL6B68B7n4mz9CJP6Rbr4/IuuIbgofJfw8t/4y3ORoGQyySn8036kw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by DBBPR08MB5961.eurprd08.prod.outlook.com (2603:10a6:10:203::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.34; Tue, 25 Apr
 2023 12:46:35 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::b630:c4eb:fba3:1158]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::b630:c4eb:fba3:1158%6]) with mapi id 15.20.6319.034; Tue, 25 Apr 2023
 12:46:35 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH 6/6] iotests: Fix test 131 after repair was added to
 parallels_open()
Date: Tue, 25 Apr 2023 14:46:19 +0200
Message-Id: <20230425124620.241022-7-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230425124620.241022-1-alexander.ivanov@virtuozzo.com>
References: <20230425124620.241022-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR07CA0238.eurprd07.prod.outlook.com
 (2603:10a6:802:58::41) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:EE_|DBBPR08MB5961:EE_
X-MS-Office365-Filtering-Correlation-Id: 932efeda-ba15-4f27-88c0-08db458b1ab2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R86DqjyUhSV1G+6BjRuCxVA+1NYb8qeGW19a6saxkaTkjYfa0+1z1v1c0UXZNx1cSq4l+QiLLY4rwPLm+KTleGRZ/0Pi1Ox9AnDPIRIudRA0wqvav85VcoBb9a3TWxvP/bP1wdJTvZjzt8y9tLDNl3XOTBYY4AJD98ogqs05hHJj5niRcZ4NbZYQlvgt6f9vdySWnqf2JeZOinEXbNOaQfsiLgL0nooJKsrN8CSjgNzieoRRGUFrcGHBX3D9wAWuKtoJD3dWGgRndoAeKxSFUhs/52RHUdSiw6PZw3NnJIkSdb6xB5kHAfSVg/nMheQdALVUCNK7SKD88UGUGf3O6UUR4DiUzV5DKDb/+AG+RYT6y99ujGThukoAsu10iVr6JD8lltva+F91MCiNfJ0cPTsf1dpNHf5Cb5R/akTHLpZSiZI5G+P23YBMNuoIWrDyVeiOYZdHYJ+xNC/7o2UykVU9glPsxFm8sTHzXfcapmecq8Z47Chi/JYb52ZiLjupJubmXDnh5fki8MY3x2fLRyLhbRoN9WhIMqLzdG/j3hk3iNizOIaDIDFpxagpigc6OZyDT3hoUjX2NDjyrn2lBRiRaarVN9iuvSMZdAodYnbFsAZrjv8mQmW8ZsEWPDdCXJxqJI/Y4YA4vHrRu+koVA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(136003)(376002)(39850400004)(366004)(396003)(451199021)(83380400001)(478600001)(52116002)(6486002)(6666004)(2616005)(6512007)(1076003)(26005)(6506007)(186003)(5660300002)(44832011)(36756003)(38350700002)(38100700002)(66946007)(66556008)(4326008)(6916009)(66476007)(41300700001)(86362001)(2906002)(8936002)(316002)(8676002)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ES4+4S5GlCnNhiTrEBBV5+59C3MOVqePZxQPy+18gQUbL3iJd7E38cxXypZC?=
 =?us-ascii?Q?nIESAndSuzYADKvE4nABrQHJRC/mUPx6+pDwZuaTSYcY8RaLZGCBHrDio+0I?=
 =?us-ascii?Q?hlScZcB4H+qaEoJGbNyoOO0RDXEzmsT7cRSdcMWygFMtUUXC3ioajfvrVLUP?=
 =?us-ascii?Q?NOR8I/w2OHBR2A4ODpnxl6b+eztVH79p0k+KTp3I4IheMvCv1SxMYDBF6U4E?=
 =?us-ascii?Q?lkn8bcJmGYkR0o3e/NrvZQi8S1BC7r6Kbf2TsYjzQEnfraQho0cBvXhjles6?=
 =?us-ascii?Q?cZC+filU+aUr1SNtqsVlcdYA5SOSFGFQXFm5Uw2Pw2vdxzba3V9B8lyRuHto?=
 =?us-ascii?Q?GsAm/wOCAvgHt7oSd66yrXTPD/Sjvsfh0OCxEaNcpvnIZnF1rgTxC/xlFAY2?=
 =?us-ascii?Q?dF5/X1Pw90XYcnT+gR3OpD6AtNqKe9Ag4XVzOp2s0jV63LEtFM3hMdn5/dUP?=
 =?us-ascii?Q?q1r0D4gwdvgsykFMSH41BM6wC6FOEwNDF2q5AfEpx0g0kvLZ3Hy3UiX8ad9l?=
 =?us-ascii?Q?0j4A7lXjBlm8CmzUVOBiBXKLKbYQtE2kodsP1PXCn6jhGjEL70ScoUGVvNj9?=
 =?us-ascii?Q?FQjdk+5sN/rXWFoSTLdPkkIFKsEn6T6VeDF6iMwHSfPAnBEUxfzRL9Yr1/Ec?=
 =?us-ascii?Q?AfNFOI/1J6AHTS8My9zoEoy01+OqnDPJzkPP9hogwmSk26ZgXawCVljNfH2q?=
 =?us-ascii?Q?kGsH1lrcAhERv1QrTi/P4pEe5KmaIGRUwAkMHGfU1AAF+4W86EhZ4yrlbleO?=
 =?us-ascii?Q?UZ78CzrdCGTjdUNJiZrvlT3sc/BCeA+RpirilcItpAjOh0TorWXqGjyXo6xO?=
 =?us-ascii?Q?SVX2g1HuIcOV3vncY+jZ8bZtBBUn7xLkjNLFuQ40iBBIJZRq6OeLTaIHh6ck?=
 =?us-ascii?Q?IR5ANNofQBXaSeV0r8Ri5xC56TFFqZ+zBvHsN9bu+erMgdNTAq8yjyWXyxkm?=
 =?us-ascii?Q?Q1V/DXhIUUXpcxdymGE51VROoVk9LSonNsthZ7rSc++zgr5V+nE5jjmwbCrK?=
 =?us-ascii?Q?IVAuoZNJ2jv/vSJE/cVuLV1An97/SoaQWicfUAIIReqf4Z+Hcm/A3kxuGiHw?=
 =?us-ascii?Q?qBO917c79bV9tKcRk73tmBE0aPjSpAU/XgFzY8O4WIydBttj8ubQrIL1MyZH?=
 =?us-ascii?Q?N4VFnFUopJBbjSaAoMcCtYC8RQUGjMDLNGbTKqmst/ov+MjrCyTtjboTe9x2?=
 =?us-ascii?Q?ZgcPf0knrEfb52rYGerms3OkFqsYS73vaB2TfJjyXgVU6zK3ErZREdIztHEn?=
 =?us-ascii?Q?19MEykYIZUg6finwjDQloLYVFa/bQ/uSGCl3zI1ye+tK+mF7kY5n98t0c2tr?=
 =?us-ascii?Q?aJ63O8zW4ZUXV5LlfCv8T9dP+8bOHGbWymMoIrrlDJPVT+Gly4VaKWZKh2nf?=
 =?us-ascii?Q?kzXH9DczFipt3fS+XbpO5pcuSVbUHCUOwKWyRsJmtwb1uQX1fCR49JEFFC98?=
 =?us-ascii?Q?9PCE/sH4cCY6XqE613AqDHme5TEKn5HxkcbRMdezm0Hq7pJxlD9SuyxsbykL?=
 =?us-ascii?Q?h5fqh0809OaEsuuX866fscjZBNH86j4k9vjCvrvhm+O8VQRcfs2MvHu9WV4w?=
 =?us-ascii?Q?bWGJqleesstjzLlmJpiuCVoZ+MltZuzY8YoOt5h/03HiUvQUa9BmTi0zpaLO?=
 =?us-ascii?Q?7g=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 932efeda-ba15-4f27-88c0-08db458b1ab2
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2023 12:46:35.6167 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sy3FKMFtR807JEQqjwsnqZYGi5rn6fSjmIF5QQIemVo6blgoEPhXbQp09vrYX8PvIL4CENyykOmrMu3PFAl2Jy7RypISBuy4SkMeJQ4C8iY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5961
Received-SPF: pass client-ip=2a01:111:f400:fe1f::722;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR01-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Images repairing in parallels_open() was added, thus parallels tests fail.
Access to an image leads to repairing the image. Further image check don't
detect any corruption. Remove reads after image creation in test 131.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
---
 tests/qemu-iotests/131     |  6 ++----
 tests/qemu-iotests/131.out | 15 ++-------------
 2 files changed, 4 insertions(+), 17 deletions(-)

diff --git a/tests/qemu-iotests/131 b/tests/qemu-iotests/131
index 78ef238c64..57fe1e5577 100755
--- a/tests/qemu-iotests/131
+++ b/tests/qemu-iotests/131
@@ -69,11 +69,9 @@ echo == check that there is no trash after written ==
 echo == check that there is no trash before written ==
 { $QEMU_IO -c "read -P 0 0 $CLUSTER_HALF_SIZE" "$TEST_IMG"; } 2>&1 | _filter_qemu_io | _filter_testdir
 
-echo "== Corrupt image =="
+echo "== corrupt image =="
 poke_file "$TEST_IMG" "$inuse_offset" "\x59\x6e\x6f\x74"
-{ $QEMU_IO -c "read -P 0x11 $CLUSTER_SIZE $CLUSTER_SIZE" "$TEST_IMG"; } 2>&1 | _filter_qemu_io | _filter_testdir
-_check_test_img
-_check_test_img -r all
+echo "== read corrupted image with repairing =="
 { $QEMU_IO -c "read -P 0x11 $CLUSTER_SIZE $CLUSTER_SIZE" "$TEST_IMG"; } 2>&1 | _filter_qemu_io | _filter_testdir
 
 echo "== allocate with backing =="
diff --git a/tests/qemu-iotests/131.out b/tests/qemu-iotests/131.out
index 98017a067e..d2904578df 100644
--- a/tests/qemu-iotests/131.out
+++ b/tests/qemu-iotests/131.out
@@ -21,20 +21,9 @@ read 524288/524288 bytes at offset 2621440
 == check that there is no trash before written ==
 read 524288/524288 bytes at offset 0
 512 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
-== Corrupt image ==
-qemu-io: can't open device TEST_DIR/t.parallels: parallels: Image was not closed correctly; cannot be opened read/write
-ERROR image was not closed correctly
-
-1 errors were found on the image.
-Data may be corrupted, or further writes to the image may corrupt it.
+== corrupt image ==
+== read corrupted image with repairing ==
 Repairing image was not closed correctly
-The following inconsistencies were found and repaired:
-
-    0 leaked clusters
-    1 corruptions
-
-Double checking the fixed image now...
-No errors were found on the image.
 read 1048576/1048576 bytes at offset 1048576
 1 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 == allocate with backing ==
-- 
2.34.1


