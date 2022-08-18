Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6A8598781
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Aug 2022 17:30:01 +0200 (CEST)
Received: from localhost ([::1]:36904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOhT6-0007CH-5W
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 11:30:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oOhEx-0005pf-5a; Thu, 18 Aug 2022 11:15:23 -0400
Received: from mail-eopbgr60114.outbound.protection.outlook.com
 ([40.107.6.114]:10693 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oOhEv-000726-Jl; Thu, 18 Aug 2022 11:15:22 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hD0kGjnz4ROtoLMAVnsII8O6O7644SXU2GZFs2ZUOQhWma/IbhLepB2dbg+m8nnG6Teu9JbHy0/rX2/KJ8qD5gOrzBRu4uV0qgE76/GRakB+B+WgZW3Fo2ndV2XO/ptJUDsPlpNosj4VfqfPD0KbOa+3MemgUR5wGZZWMa5R0YuABXSQ32nfV537mS/MJUlyOc+0FxF8f8Ai6ThnwyjK0RjiBCCNKHq7wcsBnw23otl9lwg/Nqs4vjr3RBg82DgcSWaNx4qeIPeiLKEqjMXCLH/u5UtHLDVCtS84tLWjmYSS8dqQbyW7yGFlBaup7uPYfhydX2G/Reznz3ytPKf1xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PJnMNwp/a2PxEmYwg2k03vzzhEm6DFca4Y2NriGGeVc=;
 b=VK342eto40kh6vC4qz9qGE3AnmC4ehhYOkx9Ws1SVPmwTfvELT+2QMk89qP0eYRbOJ8YCsC12c4OUyyhZpnbbKkAoU8kK8BKmP4vytSyxxiBF+UMTtdD4lHEa2ZsXtoI7haoZ9ZDXuPjnHafvOMoFGDQSv0UiczXoTiS1WtIWHkLkMBwjqRxffpdDj21rELvBvNEtOyiIf4EcEfhlII5fIoLQ9BYLs5xuxgTByKOrBrbzMPdS7fa/Yk4iJud1hBU2U/IITojxTgh4e0XVsQQEBNa4GAx5ch1pKdWRfE/POyC0esVbEBmCXifUFy07NTkis+WvjqfDoDBkuM7zl0VVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PJnMNwp/a2PxEmYwg2k03vzzhEm6DFca4Y2NriGGeVc=;
 b=GetfwkCZMExmsnAHC4y74CsMXRKr/bEJ2p6bWj2lCBucUGX9s1slygGBWxFXlMdlm5D+N3KhrYSRe/xY0yAhZeBZ6gqbAs5LamQTUaaBF1cxSMAQ+4apTiZn/+984nqt5MJLixhw/tNpd9+D7rz/lpVlYExd2pNyWdwP2ZJhMw152x8FS6vfCF9VTFux/mkgd8oAZZDIl1WQLHga5h5kvlG9mrJyjMMKfS2NAZ9s+36tMqSRrYKq3qntJ8qKMvZi8ChrNkVg+as1aBANzCQOrdamKEtkOOpiTUmXoQYrElaE1cYXZbDc8d/CSjuFXyKdV0GzPJsyzh/GTnliWRlDuw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by AM6PR08MB3335.eurprd08.prod.outlook.com (2603:10a6:209:4c::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Thu, 18 Aug
 2022 15:15:12 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2%7]) with mapi id 15.20.5546.016; Thu, 18 Aug 2022
 15:15:12 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH 9/9] parallels: Replace qemu_co_mutex_lock by
 WITH_QEMU_LOCK_GUARD
Date: Thu, 18 Aug 2022 17:14:56 +0200
Message-Id: <20220818151456.2118470-10-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220818151456.2118470-1-alexander.ivanov@virtuozzo.com>
References: <20220818151456.2118470-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0092.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::13) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 80c07167-024b-4dd0-7363-08da812c726b
X-MS-TrafficTypeDiagnostic: AM6PR08MB3335:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8nvD4kqdh5mbpuYE49gJuN3lAm57w9VxRw0YPfA7Gr6ge3tSXkkddQXgHY/kIOd4L0Xe3XsZ/7PEdHcPTiDGFhtOQb+IBoLVvQZ/7CoJVSgxe1tX0XUPeOTF5IckRc6JK3JCtYQxmolPdhrdpsdwT1X64dTn8cKSEmg48YfbAggFO7TuRrmHttjjSSEchT2Daj/BeE56gQd/m0I7pElS5mkjmjDCIFr211scEBigmQdsUdvdqAjXScz+4J6HEIAjScVJf50nI2Lnr7j/4JpWsfus72pVnTsDsAlzPCBFTTBbt9Kh18rP4iQDQodQMz0TRj1F/JHd5bwkubSOulMA4MrAmvohWQPgE4WfIXDsLSal3/1M3JONrch/aXkBesZZnK86avrvA9Df9rbbms3Nqu6sd8jvoGpQnXZBQvB9SxGFHPVoGaZpFjnRqfTSSz36ObyBWKBPUi0/4ZyxjhwuRl4CHPMMRVc9ysBlLzILb8/K8hrbGP77UWb2vSIHkEtJ9qDMG4OSyCHPq8LwvMYuJA8csNR8qNcEPde+L0fv6/812yMKQmKXeajHjAFmXH2Td8wuWnpz+ADB5cNVu3qe57/OHwVwLgCoqxMfrLYA6PxeIO0L2g2UPiNyUHqmxo73/4sALOIOSeQaKO23F4oUTeGIImeUI3+kdimFcCPMmK3UcIewK92qRam5JZ9ZP7Y157VPZISVRHDL7GiHXnCWVPxTWYeqao3ss3DrhCIuYQ6cM9vuzYNoltuXo76uh/xl59mjJupR/67R5YRQ3alXdg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(396003)(39850400004)(366004)(136003)(346002)(26005)(2616005)(186003)(1076003)(6512007)(52116002)(41300700001)(38350700002)(6666004)(316002)(86362001)(478600001)(6506007)(38100700002)(6916009)(4326008)(83380400001)(44832011)(6486002)(5660300002)(66946007)(36756003)(66556008)(8676002)(2906002)(66476007)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JkjPJQSA0DYwOU7n6m3PXoq6lsNhAgX1UZ1oBQKD+5j29Sl8sLD9ACdETy5k?=
 =?us-ascii?Q?nSmCFsHkbP+XkaQNNH/SlP1z+Bz9dMsMXHNSEn8A8FXmpXqvF1HeZKU8ixg3?=
 =?us-ascii?Q?F/A43Kqnhz+iV/7diKk1smMoWWx9ppb7nvKcBdT3mg/+MAvn+gRHzTSqw3ur?=
 =?us-ascii?Q?6E2L9/f+33NuiQ3r/OPcSdbvCgaIE2I+AVh/ud8FGOmqKOp2WhJYmjaBI+LL?=
 =?us-ascii?Q?Ve1Mi/O/CYjMdqgEs3DV/MwVcm0+9aoFBFe50EiBxDLLZp8A3BewySd7xXjf?=
 =?us-ascii?Q?WeKsbudRFimMuUCtTXBIXeRaDN99RUK+0zoUlWU+VjM73vUBpR2ehfNUZMlA?=
 =?us-ascii?Q?3rUcPO1LMmSHbSANfxOd/Vw11X8E8Po6aD+3Pou/UApJ35vJtYD0h4QldR8v?=
 =?us-ascii?Q?r9U+U3xsr5zebCkvEegiWscVVI44TmeaPD+fu0DGK/jtmqCQGaB4+DoW6rTx?=
 =?us-ascii?Q?IatpD7cGN0y7zLMb/ErYnt1/1WVgxtF1+rFJgFfj2Qe3//mheTangp7S8Qoa?=
 =?us-ascii?Q?XW/2Jk8qgHVByBlN5P0UrVFB6o2a8qXtBkWm1/eA3RCufmr9fIz2jwOZ5moA?=
 =?us-ascii?Q?j9suUGclEwbqW5bRZlIAnsLbnlQrvoUMyo4ZrOpl61yO+WhWzlvPMZS8bqM6?=
 =?us-ascii?Q?UFINQesrP450S5PEkHJltWI+Q/jfDqpR2ue1YHb4I+WPTuc7rfYux1yHKecq?=
 =?us-ascii?Q?Q2+uCTnTeva8ywUIvJINbely5yxktLPJn7uyca1pnGCpnC4MOAFtCWuYz6eE?=
 =?us-ascii?Q?hWdKyHGEYA/pPv0A1Ejt+Bk/DARGFqKFOsV7dMtoyTzpcXcxZcAIMbxAEtgv?=
 =?us-ascii?Q?njcW1pXv3tYLXTs39dI2No+A7KuFrrPCCjAW/jujsFNmblgwuOw7OVKmHqC1?=
 =?us-ascii?Q?ASn3jd0LRqQ945uc3wb5hebVk3onA61+n6EB0N3nW7ROo+Cm/lZhtT5EWThB?=
 =?us-ascii?Q?TFa2zLUpZybgy6T94qCYn+1KoR3QS0S9lojth2sM0tu85e/RJu47+ut9JuYD?=
 =?us-ascii?Q?9RPuq4100aluQyJcznqJ1t5kqRt8IT3313goUhrQJGddwUzXbLZnJGZJWLoN?=
 =?us-ascii?Q?qh8XM24ZE3+Wv9ooC3zMuYWAYIPW2oYun8KPbL+KgjqlMRUYCt5PRzLUcwqQ?=
 =?us-ascii?Q?6gRrJHO4EZL8M9DX/ze3Ko8E6aDY438ldANFTzOspqOjVmJxwCATBQkJFPwx?=
 =?us-ascii?Q?SHamYb0nez3lO5/BRBM8xQugx36QL7FqeK3Qdy1Xbrz3sk4eMYo+6GqCCsNN?=
 =?us-ascii?Q?/ha85qFMCW06H8wmshFGwjthV7ktThA7VLIPhgotyRpdtPeeosaTtvVj6F0p?=
 =?us-ascii?Q?Xvh7+TriOZ3XXGX1EruGgEjcJphqbURLUFYltSfD923gvzW90XBPK7ufMp1g?=
 =?us-ascii?Q?WI451Sqyu8e/oy+2WGsMwlVer7aQLZqRv6SiwPnBUW8h/JBf692SSS/wxy64?=
 =?us-ascii?Q?UmaWDmcNPOTfZkN9TnJTXjo+9QRDqJ0RExms1rbAzgNSoByK1u9l4UrBjhFR?=
 =?us-ascii?Q?lSBXspOWEaFtofoN/NQkTODpUcpOyKYvmJZFMQHG3PDQ/HF6XjuJ/gZnAkqP?=
 =?us-ascii?Q?+WhoCehsJ6cdHmc3/kdDmQia+DotzoQVxeYlfWzzwrRzN78FwIiTY3BkgWDd?=
 =?us-ascii?Q?eMyK1rwnotcTBWChyPom9F0=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80c07167-024b-4dd0-7363-08da812c726b
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2022 15:15:12.5473 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M13+DB8wdgHgPdloQtjUk8/H9A9aeqOCv8W7ThnxENIRCJ9K8RY7bs8gLYpVbjJHjJdHVWEUW/k5Qc9ugeSPAG9S59itkNDJo/YQIAjNQls=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3335
Received-SPF: pass client-ip=40.107.6.114;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replace the way we use mutex in parallels_co_check() for simplier
and less error prone code.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
---
 block/parallels.c | 26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/block/parallels.c b/block/parallels.c
index f19e86d5d2..173c5d3721 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -563,24 +563,22 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
     BDRVParallelsState *s = bs->opaque;
     int ret = 0;
 
-    qemu_co_mutex_lock(&s->lock);
+    WITH_QEMU_LOCK_GUARD(&s->lock) {
+        parallels_check_unclean(bs, res, fix);
 
-    parallels_check_unclean(bs, res, fix);
+        ret = parallels_check_outside_image(bs, res, fix);
+        if (ret < 0) {
+            return ret;
+        }
 
-    ret = parallels_check_outside_image(bs, res, fix);
-    if (ret < 0) {
-        goto out;
-    }
-
-    ret = parallels_check_leak(bs, res, fix);
-    if (ret < 0) {
-        goto out;
-    }
+        ret = parallels_check_leak(bs, res, fix);
+        if (ret < 0) {
+            return ret;
+        }
 
-    parallels_collect_statistics(bs, res, fix);
+        parallels_collect_statistics(bs, res, fix);
 
-out:
-    qemu_co_mutex_unlock(&s->lock);
+    }
 
     if (ret == 0) {
         ret = bdrv_co_flush(bs);
-- 
2.34.1


