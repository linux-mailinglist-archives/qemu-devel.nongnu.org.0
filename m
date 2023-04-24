Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7640D6EC942
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 11:44:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqsjX-0003us-LW; Mon, 24 Apr 2023 05:43:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pqsjE-0003uI-B1; Mon, 24 Apr 2023 05:43:24 -0400
Received: from mail-db8eur05on20723.outbound.protection.outlook.com
 ([2a01:111:f400:7e1a::723]
 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pqsjC-0001KL-77; Mon, 24 Apr 2023 05:43:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MeXye9PSgUwIhqj1fvCfztzPqKoAWpXVdbKL4/d/uFIeLA4aYDOZ4WVhBrpF2bAqfbHPLUX4dK1uRH3O8OqDaMWKQf1R99SQrxb1wXo89aQrcLkRVaghFpOzBlE4aYrqgnp6dR5TpBCurAB7URDykwCynJAqzhO2/8XR0Qg8E1aA6O/iZh/H5Fb5OsATWbKPeI9cR7xHTTMnNKTn7iPyGgqcTwpXXVLqvWjNpL5CR5zuTKPZlq+ZoMQifCCpu5aIxgsKkhg+Ct957reOKO4wVr4A9xGoFUqr9yRwDLGPta1y2x3PwA+hjfg6tT8EyE68BWeuB85sJVGFvY6EmGKV+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aWhR8t4G1TdDb+7BBADYv0HZwDxU7tJOn2slqQt0Dnw=;
 b=GOM/WVutY04vla+HjBdyXE/nh2Z6Hzkg0eQQNRPOLOEVBU6EJaevTJIFfe24qcGBUHyyjoGAVd9+H/VNQsjbuqTYcik+jkd6b6LC2xSnNomOlRBOMffw3eBo4Qp3v9M2lfijnbH7x2rMJKlYQniXybFA7ivn6v0qSm6LKUt1wtLt60jJsdbgZTzqxOmAHNtDW3NEhjKK3CbiVMUK7X7/dYfPprfZNXHhqrNlPGTBR7ttFavQkYqRZJD6zHN6KLxXxpWFDdcT3gMoivhsUXNBPlK+36aL51VqAFLKqvV8cJAzyB1rlCXA4AnWIhkODE3um+Mg/oh1JGhBg/ugI4/7kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aWhR8t4G1TdDb+7BBADYv0HZwDxU7tJOn2slqQt0Dnw=;
 b=dIsONlPEwjpdW42Nh28MZ1j3hu5/mHzL4xUFrQGxX+HSQpAlckhjWY58jor7nUTGv5Pahoq6W7offfPE93ZGjM1Diu/J8O2Pl+Ywb4Dyo4uf6HrRYcpIPw3hcRUr6amlXhl/rTEbDzL0qZX4ASnPB+RrVl/rJnM91+9BjRCanGXxTkDLtFs1fTgZsOP7GHyZ5W+an5U/BEeZH0aJpBgnEJ13Hi8ZKnLcWNgGRpnxzRnjSrldMWDSPmSGpZGv/wya1t9xL8ayG5Dj81pRCDbr0I1I2Hg2otRbxlbZE2zUTYSPowH0p9z5cfCMzzroqqnvXgxF0TTAYFR4KnIGXoPjhg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by DBBPR08MB6188.eurprd08.prod.outlook.com (2603:10a6:10:1f6::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Mon, 24 Apr
 2023 09:43:18 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::b630:c4eb:fba3:1158]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::b630:c4eb:fba3:1158%6]) with mapi id 15.20.6319.033; Mon, 24 Apr 2023
 09:43:18 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v4 0/5] parallels: Add duplication check, repair at open,
 fix bugs
Date: Mon, 24 Apr 2023 11:43:04 +0200
Message-Id: <20230424094309.197969-1-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR07CA0247.eurprd07.prod.outlook.com
 (2603:10a6:803:b4::14) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:EE_|DBBPR08MB6188:EE_
X-MS-Office365-Filtering-Correlation-Id: b41d944a-a1ad-41b5-e00c-08db44a8556f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dlZvhIO+YabBRCx9QrdDC1+Xx8ucjpVOTcpLCBB/gfaUnDpw5+gjckfk/9irzfLpI22NujAESTuBuGSZY+CuOjZhEA/lt1G7FFld5Kc1GKSp1lRzBesb7NHY5MPDqgjSgu67uCV8Fb+AvVu/us3ABmeDWIpGInS1GfjuJYGo9k1+FMng830WEnC2IQWouyxz/PL10RbuLZVXN8nbFtnL2IUHBaQ6/GRes2LOVdSSEdlwSAsJfu12M5ZEzObywvxBaKtR0RI1WRTAqE2x60WbcoS0QiWk2I8tsVLv4Pxy06DupazxSaamy7d5y54CKBlkRLVXdVeE+waLE++db7iP70fRNWxMhqo2178Kck00fYLUUsYe0TvL/Dhb729a5cs2qdBRLE0R/CF8Dn4+tDP80h4G/TwjOjUD6YhrPlOltg055IZbTxZbACN2OgzYetEy8E0CTVPnRnoA1q8+B1blP288Aufhy25QeIjxq0BsfWqOJupkGoXx0uP77aatLWP1FYjQ2jlLuVxobLe/zEVQCr//jkqBGIe4YxNfPJRj0Ix7nWT65WMc6Z03x3axxvgXtgAN93GLdySNvc9hc9WFLVzjyUKeXvAW3hyPYndzWFLHmHNO880ekb53w/XuKtag
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(39850400004)(366004)(376002)(346002)(396003)(451199021)(2906002)(66476007)(66556008)(66946007)(6916009)(316002)(4326008)(44832011)(8676002)(8936002)(5660300002)(41300700001)(36756003)(86362001)(6512007)(26005)(186003)(1076003)(38100700002)(38350700002)(478600001)(52116002)(6486002)(6666004)(83380400001)(2616005)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Hw5D/qgPKl557EVzzUKnxruCJmpaiceLtnkkASEjzoeggq8/MwbYuGKo4681?=
 =?us-ascii?Q?JxDMllZCc8ceE6QaFHMj4y4AvRYFrU9zFNary+AqycI/LZR1Fc7+ZqSdItqG?=
 =?us-ascii?Q?xTTEoOC4PrMJIvsvAxfP1Ft9B9uxD80ZVRBZRkRPzm1TDSUpyRc+QNL9xTZX?=
 =?us-ascii?Q?3iKML3yLjnRhHuzgIRre79AOuFwaP58A2gq1L++qek08yRB676djspaHKGWV?=
 =?us-ascii?Q?TfbV0bzWpTE5Q7gqW4ucRPHZZgGB3g4z1SUWv909CfIeIwfCVyP29bdhORG8?=
 =?us-ascii?Q?elpP1KnTQP5Lab6HzNu5Sy9F6LtLWI4Jz08H0NNyF9bgSrHO7l9joN1UbtBn?=
 =?us-ascii?Q?vNtTupKKQSUQNe0nUIfDaCBnTi27fc+9jDwApsNc+ECr5sgcUnfJSC9jFA9d?=
 =?us-ascii?Q?/FEKCSYEuOpi+bIC5iuTbxIWTw3wZMBxryJ+hglbwCutVDxB6yRdPBTB0rQn?=
 =?us-ascii?Q?QPGim8l8ATwSKw+PUaQO2I/Ttx2KRStZ6L7/nTrxC4KTouFpjjjDlsJVqCDa?=
 =?us-ascii?Q?mZVS+8VFlhBH+RplKnFuRTcmdpQFizgRCksqGPiCyM/h0tzm1mn+VyP8DkBo?=
 =?us-ascii?Q?UbwqsdnngeYUr/XSBIgF2uHCJ7gyFnBIhGVM8ld4jhx4zGC9dCoeZTDmBbUD?=
 =?us-ascii?Q?tAisu82yhY5PtXTrL5eS0UKr8ihzuAa1btXGxAuIouNkcJOhaVKcMj48AH6z?=
 =?us-ascii?Q?cBBvwKkltA2pP6Ij6jCvqLrlubZ8VK40BXFL2ugf1Kq4PMLABwy/5yB6bE5Z?=
 =?us-ascii?Q?8ylhSEfUltt0U+tRc0zYKexmZMhh0zjKdtBx78Oy6Lz+zjVHORBz4FqRLO0G?=
 =?us-ascii?Q?XA0Yswiyn4iTODrptlxGJc6WlrWOaK/DbOOU36y3YT8onQsVdCiMNXnyoqw5?=
 =?us-ascii?Q?ILC4CQ4REFm1oGFsdFBPclvXA8wmQM1LpPpSBSpgd1oeWSFtA4vkvFHVwjlV?=
 =?us-ascii?Q?S08shUjD76561ju7P/ZK0ueZr/KnatWeyEuWPIuZyUzfgqATJzw0tsfnRiEC?=
 =?us-ascii?Q?Lwru2C1sYwzFnDVTxtED4r3uZTpyyP0f5M74omU7JWTX4cokmTuxnh1efoEg?=
 =?us-ascii?Q?S/Hw9BRvZctKGT/JRqy74N/79R4HrPPGO34of0s9W2DUhDalUkn3WMKJpVZd?=
 =?us-ascii?Q?Av+r0QtT4h5q/mt20MmF9S5QdW3cH5augSROfetKNWIGps3gp3OEqGAPFOeQ?=
 =?us-ascii?Q?zdvkdS+nR0ygBCPSe+7saFto675pgqSrX6VuVL6Gq8fxZ8Q8rlSmADX9jauY?=
 =?us-ascii?Q?hlbB7Q0QkTnVbRK/G18jGlEo/N6qw+CLfBN4QaGdFmB563oTwQ8sU4XbjLpc?=
 =?us-ascii?Q?RX+y3rCPoPZGP0Rs3t+MuMttGESizkYO0TsZX0apgjEoG6a8u4rzsTPEpFDI?=
 =?us-ascii?Q?pNhnGZm+Lte92N4sd2UH7fkC4OvL29t8NhfLzZkCHDRGVonWhrj9i5qB3v8s?=
 =?us-ascii?Q?uYF5qoHb06efuN/7aO370+H7eoH0so/yOafo9+BqtLG9KSlhgMhgmhWZXoKf?=
 =?us-ascii?Q?sVcSsaMf2n7CoYD5pZjVGfNP6+sq9bix6gNZWWptyrlgFE3q6Lolae1HhziP?=
 =?us-ascii?Q?1D+XkmH+l0AjZ0lOGdC3lvDtEP1IrN8AKJS9iYk8w3kNPVzeb/tZpAv7oU7C?=
 =?us-ascii?Q?Dg=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b41d944a-a1ad-41b5-e00c-08db44a8556f
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 09:43:18.3218 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HL0Ql/mwY/HkvaFgEqlj6bRcM+tDpIFagONdnmdGD6tEVk0VGXa543L2tBNOX3qBTM0ewqZX1SLjE8tRR0CHLyP6Ow0ENxzLwKduFP/7vGs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6188
Received-SPF: pass client-ip=2a01:111:f400:7e1a::723;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

This patchset should be applied on the top of [PATCH v10 00/12] parallels:
Refactor the code of images checks and fix a bug.

Fix incorrect data end calculation in parallels_open().

Split image leak handling to separate check and fix helpers.

Add checking and repairing duplicate offsets in BAT

Replace fprintf() by qemu_log().

Image repairing in parallels_open().

v4:
2,5: Rebased.

v3:
2: Added (size >= res->image_end_offset) assert and changed the comment in
   parallels_get_leak_size(). Changed error printing and leaks fixing order.
3: Removed highest_offset() helper, instead image_end_offset field is used.
5: Moved highest_offset() code to parallels_open() - now it is used only in
   this function. Fixed data_end update condition. Fixed a leak of
   s->migration_blocker.

v2:
2: Moved outsude parallels_check_leak() 2 helpers:
   parallels_get_leak_size() and parallels_fix_leak().
   
3: Used highest_offset() helper in parallels_check_leak(). Fixed a typo.
   Added comments. Replaced g_malloc() call by qemu_memalign(). Replaced
   bdrv_pread() call by bdrv_co_pread(). Got rid of keeping bytes and
   sectors in the same variable. Added setting the bitmap of the used
   clusters for a new allocated cluster if it isn't out of the bitmap.
   Moved the leak fix to the end of all the checks. Removed a dependence
   on image format for the duplicate check.
   
4 (old): Merged this patch to the previous.
4 (former 5): Fixed formatting.
5 (former 6): Fixed comments. Added O_INACTIVE check in the condition.
              Replaced inuse detection by header_unclean checking.
              Replaced playing with corutines by bdrv_check() usage.

Alexander Ivanov (5):
  parallels: Incorrect data end calculation in parallels_open()
  parallels: Split image leak handling to separate check and fix helpers
  parallels: Add checking and repairing duplicate offsets in BAT
  parallels: Replace fprintf by qemu_log in check
  parallels: Image repairing in parallels_open()

 block/parallels.c | 291 ++++++++++++++++++++++++++++++++++++----------
 1 file changed, 228 insertions(+), 63 deletions(-)

-- 
2.34.1


