Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F4D467871
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 14:34:58 +0100 (CET)
Received: from localhost ([::1]:53842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mt8iH-0005Rr-P2
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 08:34:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mt8Id-00026I-U7; Fri, 03 Dec 2021 08:08:29 -0500
Received: from mail-eopbgr70115.outbound.protection.outlook.com
 ([40.107.7.115]:63695 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mt8Ib-00072T-Qj; Fri, 03 Dec 2021 08:08:27 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dOwNccXH15XigPfKD7sIyLpudzC9mKxWx0qJK4RfYZXZWa6MBp7UHNvxOeahNVEzf4S40XgS0qyYEIBDy0l3FQVNd3NBhxvmip85mEbZLPA18Cx9tq4DlNRbPql//FYgMsyCIcxsfEGCR6X3kIv9fLn4XxMsYfx0k1kgpQBiBkYJS8jrfgxwtXizDq9KWREYU/hAKzsJ+yAtUgWoWzCuL2H18sNEEzLQ38993fNZIxEiOFI+4iOhY+Uq+0fbmydVTXMMZ3Igrk0g/7DYiXkrXZ9xC3/Dqr0RmZejxTxf6UNWZRKlwgnngx5ZaQaBd2kOXfgoHeZZjOJrlyrbyYw7DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xfU5SxbYMAO+bW5dCnbZM8sH1AoGJXlQJah+VWaXImM=;
 b=YVqb0OzYuuZKjqiz93yGlf10qNru+gHI2yB9+A1gLD1TSFjJaHg/TNIaAdMSTwrFIWp8a/1jXrjT5sZ6ien1VD5i41G6beZuyKyEsqiHZ2/hnMMOSKY/Q1k6dxMJ0H5vPEMotPuiioW/wbQIjmidJ94bRRUYQ4BYf7wW+/vpDEXqFU3lchxlFhY4ENqpt+P3m6RGIgF+luMfFMpxg2pYlUJkv2SamzhiDoSaSa+FMGHYs7mLxylRbeTl4iLrXi/htujSPX5qh8uyUli4Fl/lhIaPlNX2z/TmAu4HqM3y+AXYwpGrR4jb8WNnDIhq402cqOn2v4MnF5RLpPaw+RhuEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xfU5SxbYMAO+bW5dCnbZM8sH1AoGJXlQJah+VWaXImM=;
 b=j+RKJ6b+kciKSuI5vL+s+AY/WX1s4FKZAW2dfjfaPJ3U+x3GYgUnYNT262iJCcPHF0txuiFvMoAdYEoD8SoSEsBZPE7c7lA5FcWO2eXMwNabIWEU7quWhOWok2iTVIvwhs4PxiQcppWr/GkvYIsbPR4ZdV7lVyNNZYAhoWjP3EQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM9PR08MB6968.eurprd08.prod.outlook.com (2603:10a6:20b:417::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.21; Fri, 3 Dec
 2021 13:08:21 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a%7]) with mapi id 15.20.4669.024; Fri, 3 Dec 2021
 13:08:21 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com
Subject: [PATCH v4 18/19] iotests.py: implement unsupported_imgopts
Date: Fri,  3 Dec 2021 14:07:36 +0100
Message-Id: <20211203130737.2924594-19-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211203130737.2924594-1-vsementsov@virtuozzo.com>
References: <20211203130737.2924594-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM6P194CA0095.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:8f::36) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
Received: from kvm.ch-qa.sw.ru (130.117.225.5) by
 AM6P194CA0095.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:8f::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.16 via Frontend Transport; Fri, 3 Dec 2021 13:08:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b34a6e5e-c916-40a5-eab1-08d9b65dfaf2
X-MS-TrafficTypeDiagnostic: AM9PR08MB6968:
X-Microsoft-Antispam-PRVS: <AM9PR08MB69680D39C247566D74757A0FC16A9@AM9PR08MB6968.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gtCFH0W6iGn+HFbq6Z700X9kMx6xCMwaJZN/IO4WLSNQkY4+WtKgsKZr03f4Abpi2UdGHzzxe4Vd0SJpyNpYwbku77oh7gl/r18gKiwygmGN0tIu7p3Rww090AWvRmzkaSporRYSvYXFd35hF36SMc7LIHGEdwN/mYE5f4CbVEJamUym0urNic2TRgsc3HzwNyyo0wpGVt78hi2fbt9bD8cnKvE8kyH8TJEMZVqj1syBE0rvy6HTQee6HRuHl0X6012qPNq45Nt0Kn7LCr1t36KVhj3lh6xmAFpM8e0ecXonJMMeFefFHdgjNd58XvH/B7cpNBXzZ+UIcc+X9FZTVlYEZ5bUIuArd6zi+9gMt8oUQqcjEyYZQRSH+DY0MLAQ9MvjwU2ehNrdvZJKChJKR+KwpKmZ7lUeZrY301A7+w9gOG2mrsEXsyRR7btlWeP2IPPhccW9OZcpNm8GjlYvhVBIu2B9sHkr3fd1rVbinugrUKHpj5UiteX+yr8tmfON4o0wxgZ6JUOBP069zRzIITm0Sc2M3HF2LZ98p4yrFRWRAcLZXZX1xIYdYKepr0vFmlqutP6EtrXfHVPcKuweIPv/7JwmjrCSM5HIhEoU4II/X6V7E3MwGHpMulVKVbOVTmSS5rhBIzEPmIdfWsjVuaItkdQHCS55ZNf3UGW3/GV9p37LMXK2r2xXtT6GFFWdgVm+d46AZKdiGB1qtxBcVg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(36756003)(1076003)(6666004)(6486002)(8936002)(2616005)(52116002)(86362001)(316002)(6506007)(508600001)(956004)(6512007)(5660300002)(2906002)(4326008)(38350700002)(186003)(38100700002)(66556008)(66946007)(8676002)(66476007)(6916009)(83380400001)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+CxgTfeJZG0RxowD/qnZGeErQnuyDj9kZ9G0ewK6eqLuvWxaJhNwnZ9rJiRi?=
 =?us-ascii?Q?C2mnRXjPjpE7f5QLQ6tJDHHJhm9ukHeyrK+6yF6inGywZQ8n9gpCIYS8lS6Q?=
 =?us-ascii?Q?TTEQoXNxwV42jRlVjMkAnTG86y1/Cd4OOWmRD8N7LLsGYekOivEW/vMBb0fr?=
 =?us-ascii?Q?A/y0v9rbssrja/8WIE4/n4Eh5lqRIHX7ENWsanve4dYBkBcIGFYqhR41Ba81?=
 =?us-ascii?Q?EMvX4YXJgILYoNfbSdVvDVTJbOaQctjQYBmRUu0mA9M7bunM+DePvqS14Jux?=
 =?us-ascii?Q?u4ERJil+aXThc2YX197ZYtWKSrYUHGHPfzRtqVu3soXlp+0B5hv1RPAnjBDg?=
 =?us-ascii?Q?qTgvDvGGD56LT3gWxtv9Fy2COUvqA1TZQ9Zi7Gyb4iL3BPgXV+e3FPk2+8sD?=
 =?us-ascii?Q?jqkHUmm2esNKw08lbON+aaJACIY3sMRM/cm2RIQ/hxcO5bfhFR08R/6SmHcw?=
 =?us-ascii?Q?JPzUcnd3VWZ8/t5Jno45DixdPuKkQFaPA06h2s+cWe2CgjLh3Ud+gi65yKl2?=
 =?us-ascii?Q?MgAH4a4/X2xSr6PiUL4gNqiwa48Wsv2XDKvElLK4dLJnsdqWqzFTMT3yThxc?=
 =?us-ascii?Q?TXFJ4DdocQs4NXfhyhzlbl3pacGY0wFq0WiKzKyqGpdLCJocqV+hJADH8KVY?=
 =?us-ascii?Q?J0RyiUEJ/4u85xIWOJ0JMyLbxGpRDERBztTGaT+/3O04VFTqMLek0rUpWoL+?=
 =?us-ascii?Q?Ycuy2of6+CSDmbbTUK2cyVirStE3MtlBgh9wVtx2sJaTjVeXpDAbc4ggsNH4?=
 =?us-ascii?Q?8zFxrJsvNe+FFbZ+T78znDXaYsvP8/1qt+DcMmEbrnUp0q4DmTirrpcouwfv?=
 =?us-ascii?Q?ePA84EVP75Qw1gZ0DBfQ/h37BPepU16sGRuokgG5O/mkcLYDmWgTs5gXhMwI?=
 =?us-ascii?Q?/0++zpE1ShxE1VNgbcjlp5jrP8294Vrs30I5TBUG86tlqxDjtZRWSIEy6lc/?=
 =?us-ascii?Q?6W6PbdjBRDgjm78oTwEk7/63f3ayRSY65A6sePOsnR/2K2dNK2pyVqjLv8Do?=
 =?us-ascii?Q?zBgt7NeCpScBSQqcLyzX9tAEV/X3ScmRIjK+TY9d9fxaG1VY/pF06OIaMjg+?=
 =?us-ascii?Q?a6rRLQCZpkJDefeliBdgWT1Eeoiyt3TOjfkxrvizILliQF832edhOipfdjzD?=
 =?us-ascii?Q?GWIcxG5YZMNc2DyH9Whos2MARvszChjoPzmzelvXgihdsxLpfBTov8/oiBqU?=
 =?us-ascii?Q?r+neaIu3xL3H+GWgxrG8SbHYnS+gzJy4DUw6HNSk+9wVDruKryYE+aGIMAJQ?=
 =?us-ascii?Q?RseFUWLiCB7hE/x6mVrd62a3cpGgm1ga33A8VBGGMW0Hw6qEAuKieLQQvFDr?=
 =?us-ascii?Q?m8eVXQkECPZWiui9yRxwpiO96y9mO327pANTtMwp7cIyiE44NHLoczEy1VpY?=
 =?us-ascii?Q?AGtHOlCk7LlT2FSJEaTg8YYv4IvbjzEU260NRzT3DBOibtNBUY2aZqkpWqT2?=
 =?us-ascii?Q?Fn4/LPifw8sGz9sfIWd8RACBzMZ+gqmb+XXOvgS2EWzqK6OM6FQOkcSRCUwG?=
 =?us-ascii?Q?d8FptYYyt2E0s2upJmxQPlPr2Jq0d2KIYl42Iwe8emQZF+WB5QyIisJRLt7E?=
 =?us-ascii?Q?T62h41gz0+KmYooJPQC21WBSLxqBPc8vNqAL3+nIwz2P4lLfi7n1iHnhEL/H?=
 =?us-ascii?Q?5Jsk1zwLDkWo06nAyQo66NLnW4py5ebC/StTBW60Hrve+6Qg6om++E/UHGR1?=
 =?us-ascii?Q?1ZinIA=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b34a6e5e-c916-40a5-eab1-08d9b65dfaf2
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2021 13:08:21.3210 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sTMyR/7yOLQubjdC0Sg2B0K9IrH12eta5kPnvKsyqKgFq84i7C0rUROdKjKjzC2gcHJ8pN0TlfNtORNn/ca2mSPhNulaBQDR7gOD9ucNIOo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6968
Received-SPF: pass client-ip=40.107.7.115;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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

We have added support for some addition IMGOPTS in python iotests like
in bash iotests. Similarly to bash iotests, we want a way to skip some
tests which can't work with specific IMGOPTS.

Globally for python iotests we now don't support things like
'data_file=$TEST_IMG.ext_data_file' in IMGOPTS, so, forbid this
globally in iotests.py.

Suggested-by: Hanna Reitz <hreitz@redhat.com>
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/iotests.py | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 903686b402..2cbb13d67a 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -1238,6 +1238,17 @@ def _verify_virtio_scsi_pci_or_ccw() -> None:
         notrun('Missing virtio-scsi-pci or virtio-scsi-ccw in QEMU binary')
 
 
+def _verify_imgopts(unsupported: Sequence[str] = ()) -> None:
+    imgopts = os.environ.get('IMGOPTS')
+    # One of usage examples for IMGOPTS is "data_file=$TEST_IMG.ext_data_file"
+    # but it supported only for bash tests. We don't have a concept of global
+    # TEST_IMG in iotests.py, not saying about somehow parsing $variables.
+    # So, for simplicity let's just not support any IMGOPTS with '$' inside.
+    unsup = list(unsupported) + ['$']
+    if imgopts and any(x in imgopts for x in unsup):
+        notrun(f'not suitable for this imgopts: {imgopts}')
+
+
 def supports_quorum():
     return 'quorum' in qemu_img_pipe('--help')
 
@@ -1414,7 +1425,8 @@ def execute_setup_common(supported_fmts: Sequence[str] = (),
                          unsupported_fmts: Sequence[str] = (),
                          supported_protocols: Sequence[str] = (),
                          unsupported_protocols: Sequence[str] = (),
-                         required_fmts: Sequence[str] = ()) -> bool:
+                         required_fmts: Sequence[str] = (),
+                         unsupported_imgopts: Sequence[str] = ()) -> bool:
     """
     Perform necessary setup for either script-style or unittest-style tests.
 
@@ -1434,6 +1446,7 @@ def execute_setup_common(supported_fmts: Sequence[str] = (),
     _verify_aio_mode(supported_aio_modes)
     _verify_formats(required_fmts)
     _verify_virtio_blk()
+    _verify_imgopts(unsupported_imgopts)
 
     return debug
 
-- 
2.31.1


