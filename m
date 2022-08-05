Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82BD358AD83
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 17:51:29 +0200 (CEST)
Received: from localhost ([::1]:59048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJzbk-0002fP-Jt
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 11:51:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oJzYZ-0006hq-Ez; Fri, 05 Aug 2022 11:48:11 -0400
Received: from mail-eopbgr10136.outbound.protection.outlook.com
 ([40.107.1.136]:43843 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oJzYW-0003rS-Q4; Fri, 05 Aug 2022 11:48:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YtV/H/NzgPFITfpGP+/vNqzaArtH3jSRQrwwd7CidLJJmTbsVHlIjABrYhwVzl/XFIrukeMLmvVfwrQtCvoROXxHXm9jnkOBxZ+GH6bjrcohyFuF6n/2eFPEF/qJ6a/VtKI58L2AAREHdcCY9jrBEL2RpXs3Fy4bNWL51n8C5gC/oj0JtC0uKkoeu8I2AaxmydcgLBBl4ezIZyXBJ63bMerlKDWax8xediuvCfqjbhcNHN1N3+xjPYepMIlFiBElkMST7mTlFyeUZ8ssJrHDcNCUmK+gjebYzMJ2ZM2Nw/m9upNAXJZW73mBa7z+9Mc3mYc7oP3gp08KYAvoy8jgvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y6bQZASNFm856RnPhnO3KdVyh+zui49UYCbxOme18nU=;
 b=WmRkGzE1ltZA9wilWynzYot0WEbtOGVxc1Dc8FoWZoNID3YssXapv36OL9wq+1rBM0PORE5r2/BoegJxQX3haUUJeOYgH4xdWjTHZPl09/1G63mLVmkKma0oqkPkERDKNn6LUpJksLxMiEguSFbX0VSFcOht+BkMS8oGeO2+89uXXJU0EO9HJxdOBvq1ed/7Z6uVJTS5S5Y2kN4De0koaRHFpjFIGQG7OnW5zxyrGCf1TDtRzsof+ksZCOp0WqBJDmhBuCzljgs+IXzlUiDoyW3LgfTGBsi7oZrTlAP655z2vVVRiUbqxTUd1Qo5lC59jS517sUSY+cXyZDLtI6nOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y6bQZASNFm856RnPhnO3KdVyh+zui49UYCbxOme18nU=;
 b=TyXOg1g2ypM+w5pD6opIjpcRXjS6j4zQ8DbL1RCz22n1e87yWbvKImhtmJOpuaI8Cwu5bv1RnU1BaNQsERMGpIeGOHZOOhpCzZEG9+0k3K+Hkh0W96+QDuV3aEafK/ISYk1vYsmSpz3oGUg1hdOr5rFocYd34EK9H0+xWPQlGOPU4YjWOCAzlZv8Rj26s2iqZMNBTdhPlUc0VuMv9H27K0ybFjEtKz7MHaQV9kxBe54U06pMCmc4pISvraOpTo23rd6fUMcDDv0tkZFPk5wcX9jwDJEZv83jf44ode33zOp34HWg1SqxZWrC4rpt5BtPks7gvurUplYFjCIKD38OXA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by PA4PR08MB7668.eurprd08.prod.outlook.com (2603:10a6:102:265::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Fri, 5 Aug
 2022 15:48:00 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2%6]) with mapi id 15.20.5504.016; Fri, 5 Aug 2022
 15:48:00 +0000
From: alexander.ivanov@virtuozzo.com
To: qemu-devel@nongnu.org
Cc: den@virtuozzo.com, natalia.kuzmina@openvz.org, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com,
 qemu-block@nongnu.org
Subject: [PATCH v2 0/3] Check and repair duplicated clusters in parallels
 images
Date: Fri,  5 Aug 2022 17:47:49 +0200
Message-Id: <20220805154752.799395-1-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0129.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::17) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 201e694d-c9fc-4064-4c2b-08da76f9dfbd
X-MS-TrafficTypeDiagnostic: PA4PR08MB7668:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6inoW1BlETtK+cgEz1j1BKo8bM7JrrGCLZ1gPd/DXq0NkEod2XuQh4QVMy1IxkdSpx2X0MzjkEErtify37IJmkFmQyqJb/uzlWeIALl2SEmr3sgrmNT0a04GD3WMR/Vtvp9EvLlbiWwFZfV1KPDMiGs40mke+SfO+ZZLFJ8XlfUDqKfT8MFN350ZVVBIWwu9UgLw4sHJCE35HWkb/xjsibd4CR7CVP9MNKQjxEFKJgEOq++NS2ecAE1sqkjXZRkONelne1al5IXtwdonDBoZ1Y2tU5qYyPiw5njxMELz9qWSYuwHxPMJ04xUqN6b1sTbvVCmNDHVMGIpsLX20zfDRXuEN8WLGds917ibnu7vc84zWTK58jDyYiPIdMCN/KLKM8BHXkBZIqXkE+BSwPftjXrCkAyv7cd/Pb3LzLSfkMOFvQ5ZafCkZcI9v2FRoUzza26JcSPRDVeaFmxS4xWTE9TzxhJYlPeiyOd3NQjwLOl5LSvoVIZbShprFDjMO6who+Nzhw8BJiiHzSxGQFsYMjhjgf0UtBZAeSzP+bdVkqLr5Y9SFZhZIz+EOf6Ei01CFABwo0v/x7NZLkAtJOzw/UugpMZT8sXznCRwwLxkVIYfp9jEs+27CpkxTnXwKQDZmCPQ4bSRjNSdZF4uxvU47eEodZh10zK3OK2bnKZZjBmsGWieJW4PJQzhnHx5kwp/1YUefMii2uPVQZ8ahK1XKrLyZPo+TCzHQFU+2zzA1ljHlB+2M+qUPUUni0NYu7XbcdQ6B6v8VBaLz4bOJfoXcSc5/DD/t1h1NblVlqCyNEk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(346002)(376002)(39850400004)(366004)(396003)(6486002)(8676002)(5660300002)(478600001)(66556008)(66946007)(2906002)(4326008)(83380400001)(38350700002)(8936002)(66476007)(52116002)(36756003)(41300700001)(38100700002)(186003)(86362001)(1076003)(6506007)(2616005)(6666004)(26005)(6512007)(9686003)(6916009)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VYQzpPQ/d6JO2/t1PttXy1GVgNk908A1hmTKcAxtLkvZyMBnL4RnA8DyGU38?=
 =?us-ascii?Q?q698XRtF6xxJZISQiVdLx9WF1oC7dKkDTkwct7h8KBq2VgrJIknFEyfWH4rE?=
 =?us-ascii?Q?fkmOnw6korItKxfhhskI+g1wY3kOKWFXhbtVliMVks7UGccWDS2bfmmTFjs4?=
 =?us-ascii?Q?TOhfDt8rgoTh3OAUJ4g5Ydyb6AInO2QW4mQBqyWM9nWBdVcdQg7Mxs8RMU9X?=
 =?us-ascii?Q?ovjKnGS9d2ZEOcKZJI+7ugWMo2fFVSJCG1Ubh0Kbf5Vm3L4cawzu3+VhOLYc?=
 =?us-ascii?Q?dzZLtwb8HwJykaV54Ue0tA1/Z2e9N+H5M9pStHY7umEZudjQfLQrHP+dM8pX?=
 =?us-ascii?Q?U6hsVGsktojO+M+gVIF0d7UGGvEtElMg64Okiaa/vBcOCnBkUBfxT/IaJeXk?=
 =?us-ascii?Q?4ZJ13705DFTBj4LcMjEF30REfDVBpCmRgTle5UHohOH8VwtWbzIHOLPDHZYj?=
 =?us-ascii?Q?6tJDlkr/0l6sNm4e7gEFYpt4VIuEdr4MGTFnCs5L+janKPNGQIVeQfPAqsYg?=
 =?us-ascii?Q?H3aE1BohtIalQm1mSk1567WlBZS7PRd0ox1rlzfzlhH/A2CyBhZfdIf8LOTL?=
 =?us-ascii?Q?UBt/1+wsLRvDZ6kZuh719hLxCotEuYE0wG9FetopzACO4lsqUXhUf+ji/SB2?=
 =?us-ascii?Q?Y1qddiEYPm4US6T0Mk1xNcUnSrF14aFip6BWHJbmveUtytb/KF+Du+JzJLAg?=
 =?us-ascii?Q?A8QN34qC7x1/CsTSqO6d35fhFQauDuktfPsYhrNNcw3yO6G6svJky9rDs3l/?=
 =?us-ascii?Q?f4InuNqqFXbDhSzaC6wlN7CRbmvOiOXW3PBRxwNUvJB+x5AUl5IFou5siIRM?=
 =?us-ascii?Q?MFIpp6fPLe3pHIgYT97GtkJ8fclK9Uh5yEnmIfs12vkQvya5uk/R8bPTQ6gq?=
 =?us-ascii?Q?Uy684yAYEMg0Ne0g+NKPC1f7Jg8EBIc/6vTRKLmMvHKTOMiP+q03p6gApbrc?=
 =?us-ascii?Q?+dUVrBiW9ftNPTBGA97W7hYTiHJ6U/JR8NJAAhIOhd1uaqDBVdX0hpmcHEU5?=
 =?us-ascii?Q?N+sQDrb+LYlxv0ku/jXE8o7tKpTU6Qg/ndVG5YTAzxkltKdtgn6WKBXhqhum?=
 =?us-ascii?Q?sdWDBJfCzhg/Xw5ip5P1UyNDSapXyWT51ss0T5f0wbnChSM3DfFkIdc5hFtO?=
 =?us-ascii?Q?Tl+XE5vdmcNhiE4rrOuJXyAlvAmdFGlGgbx7vZdvKXpgZh37M5QApUdQLavs?=
 =?us-ascii?Q?iHDy+nDtoX5+zqXemoKC6cVApX+ha/FfdTIWEB3f0wTgFc/3Kmr1rKGXD3Vn?=
 =?us-ascii?Q?LL70aYWDoYtYxXBirKU0inTD+1yOD4kKtqTJQxH417XwSeA+7fAFuHb0WV8V?=
 =?us-ascii?Q?f874QSEO45kSmQzbfRIApuG5RmbuPaMRrpBKrDqyUwH6zyg7sDea1A6Tu3U6?=
 =?us-ascii?Q?RXotkXzLfGIppPo1qrvZhz1BmMqCGY14VKTKwiNup7Fd5cWOD7s/dU+14MJF?=
 =?us-ascii?Q?nGDPqOhX2ybsVFI/TLrVpjz/EQ5Px3/kvZeVmpJsKMbT90ZqSuTbjGf9bvGt?=
 =?us-ascii?Q?7cdmXDdtTXyDDoQvoxA2sPDGs4G/AvmLlJbmETHVBj9naG/FYLlQ+mKGOVo6?=
 =?us-ascii?Q?241Y955zXfR1m+ays0x+gYsFnZz4v3gTvOsaPVKo5ncm93kQ1uFkmCszlg8O?=
 =?us-ascii?Q?VRYBd7sije6/+pif99CWvC0=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 201e694d-c9fc-4064-4c2b-08da76f9dfbd
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2022 15:48:00.0880 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T2Zo4WB5NA/ixk6t7pWox4IAcFXmEF+8Ou1HVaREN8rAjkf+JcZN3eE8vQ1JrZ3PE7sKCzEffX0dze/MH9akC3IsAYhqcakwwXARPdBEFmo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB7668
Received-SPF: pass client-ip=40.107.1.136;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR02-HE1-obe.outbound.protection.outlook.com
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

From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>

We will add more and more checks of images so we need to reorganize the code.
Put each check to a separate helper function with a separate loop.
Add two helpers: truncate_file() and sync_header(). They will be used
in multiple functions.

Parallels image file can be corrupted this way: two guest memory areas
refer to the same host memory area (duplicated offsets in BAT).
qemu-img check copies data from duplicated cluster to the new cluster and
writes new corresponding offset to BAT instead of duplicated one.

Test 314 uses sample corrupted image parallels-2-duplicated-cluster.bz2.
Reading from duplicated offset and from original offset returns the same
data. After repairing changing either of these blocks of data
does not affect another one.

v2 changes:
 * Split parallels_co_check() to separate functions.
 * Move buffer allocation outside the loop.
 * Replace work with internals by zeroing BAT entries and
   allocate_clusters() calling.
 * Make reverse table unsigned and replace -1 by 0xFFFFFFFF.
 * Some minor fixes.
 * Add more detailed comments.

Alexander Ivanov (3):
  parallels: Put the image checks in separate functions
  parallels: Add checking and repairing duplicate offsets in BAT
  iotests, parallels: Add a test for duplicated clusters

 block/parallels.c                             | 315 +++++++++++++++---
 tests/qemu-iotests/314                        |  89 +++++
 tests/qemu-iotests/314.out                    |  36 ++
 .../parallels-2-duplicated-cluster.bz2        | Bin 0 -> 148 bytes
 4 files changed, 393 insertions(+), 47 deletions(-)
 create mode 100755 tests/qemu-iotests/314
 create mode 100644 tests/qemu-iotests/314.out
 create mode 100644 tests/qemu-iotests/sample_images/parallels-2-duplicated-cluster.bz2

-- 
2.34.1


