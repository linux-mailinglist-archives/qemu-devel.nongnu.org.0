Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 101B65B5AD0
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Sep 2022 15:04:33 +0200 (CEST)
Received: from localhost ([::1]:33004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXj72-0000hX-65
	for lists+qemu-devel@lfdr.de; Mon, 12 Sep 2022 09:04:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1oXic1-0007Z0-17
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 08:32:29 -0400
Received: from mail-eopbgr70122.outbound.protection.outlook.com
 ([40.107.7.122]:61667 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1oXibz-0006aE-Gz
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 08:32:28 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NITWAJcgwB6TyPVKDudKDLmXxTJFLApgLLjF/DgPj5HlnG0j1W6ywcRKW8khgDeWz+B2kG3z6jCw9d8xjVgjjKPbNqk8fKvg4oC6/mNZdYjvBzPGM0Bc32mDIZ57y4pAwhRgB/Vlnf+v+Qh64AxHiL05IS8b2lCkCrG8YhoEY0gXNZmcb2l1U+S3jygv78CWDs34J/oaRFKzBKEOqyEifGZerLJhNKpTMV73XmfKGpygiw2XRMrQK8RcOat3RQ66R8p8cT46Gp5BpG8EixX4IiKtEWL0TYMntUkQ9JF2p0Ne7KEvrhtz5J5I+slxH82wcgTufW7TAKocPSAL7kp0pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cI7pCniV1thh+YoW1Q64i525O2Fc3LeB+R3tqvLqwpE=;
 b=GCHJsrUBuBSxS5O2L0Lm/XyAoOw2edsAhaXhFNuhzXkwZFk5q9hM66D5IKCPzziknM/2AapIjEkhMePsuOimmuyAUQ2ODCAqJT9RUMj8u+UY8tqbWLN/RHhlu/JO+Nl11g+OOd2Bz1S8HXBIK2YqTsrelm708sFcuIunUzBRJdZFdI1cYkV27Ix3ljgV2reTNmDW7oUVomwWkTRu0+M7V+oXEIawiAxH7/NDNELWcEDYgCeDedLQoXRONrs1tOEJevvYKjJ3tVWzJBPc4hGN4VbfMXWRNidQmq6jUZVWwyP0SlVQrD7rGpUH5uVKxaj03ISAKfoZgH/Mo875/99gYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=syrmia.com; dmarc=pass action=none header.from=syrmia.com;
 dkim=pass header.d=syrmia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syrmia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cI7pCniV1thh+YoW1Q64i525O2Fc3LeB+R3tqvLqwpE=;
 b=ZMDEhxW/d+hnNBULLp9Bl9DoDvjcVPYpH/VQY216xzYGj7eenrAwjN5Wu5ULuvEBcqJOsGSVikypgVFpRqIwuey0qxUy13bblneyMKJLccO08/yl/N+Y4YyVHICwJ711l/GI85uhDuG42x0lC2GLwtOLaRADhITqMtHTfe1ZvSY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=syrmia.com;
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com (2603:10a6:803:112::20)
 by AS8PR03MB7603.eurprd03.prod.outlook.com (2603:10a6:20b:34e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Mon, 12 Sep
 2022 12:32:24 +0000
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::6dde:d3f:2ed9:e27c]) by VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::6dde:d3f:2ed9:e27c%6]) with mapi id 15.20.5612.022; Mon, 12 Sep 2022
 12:32:24 +0000
From: Milica Lazarevic <milica.lazarevic@syrmia.com>
To: thuth@redhat.com
Cc: qemu-devel@nongnu.org, cfontana@suse.de, berrange@redhat.com,
 pbonzini@redhat.com, vince.delvecchio@mediatek.com,
 richard.henderson@linaro.org, peter.maydell@linaro.org,
 djordje.todorovic@syrmia.com, mips32r2@gmail.com,
 dragan.mladjenovic@syrmia.com,
 Milica Lazarevic <milica.lazarevic@syrmia.com>
Subject: [PATCH v3 22/24] disas/nanomips: Replace Cpp enums for C enums
Date: Mon, 12 Sep 2022 14:26:33 +0200
Message-Id: <20220912122635.74032-23-milica.lazarevic@syrmia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220912122635.74032-1-milica.lazarevic@syrmia.com>
References: <20220912122635.74032-1-milica.lazarevic@syrmia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR08CA0145.eurprd08.prod.outlook.com
 (2603:10a6:800:d5::23) To VE1PR03MB6045.eurprd03.prod.outlook.com
 (2603:10a6:803:112::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR03MB6045:EE_|AS8PR03MB7603:EE_
X-MS-Office365-Filtering-Correlation-Id: dc359bba-77f5-44ad-aecb-08da94bad890
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WzteyT1vZWvgqUdeLeY6WRqmpP/fFhcTpWoiCFkOYBK7QXC8Z47XnD9vZeek0K8cxqNtKJ00ffmlJkii3lQVVTuCX1zAtb5Wqil/ryXP/NOAB3tLElE95YgSzNb0twLi+bZTU2Ag+WryTo1VW/FX1ZdQ0+Fd1ysExORB3BOH1Bj6Yzi2qnseDiNo+/MUytG9gjM2vGv+IPJUxw7v4xtZOHzOPc+15lb0YDz6GcnGUGuvLbrI2ptWC/6DF+bdsbt6ef/ZhCozS1EeARFrdFmnEYzXPckMLowO4dA2eKTzS2xZQKGjtPtEUzM1sGvR8C0V/tHomAkLyqoW25xpPtACKWq62kVX+YTuUOYnF9EM2yTZx5EChJHjdH46S5R2VBplFS4UYIApmfgeTYIeI/PKlxskuInYtOED9ewuPuSX9F8K7eXBLZTd4MX9bMKzemhT7YUkIzRxkyT7/S99dwzE/qvXMINwdsR3lr5dOEKA74NHueKZydrMs40TjOXWoevqdGxa6hmLf6msScM7ie8ZiCVZdlqA1IRHwQK8fMVmI5Cz9QASCecuTgMv/usxe6IJuArIIVzYJzdpnzSXgSvLRPBZm8v3Iy8lGlqXYLx+rUR7XDqs3ycZBJkz8+aShZ31gdtjIHM5kpVm6z1t+lxKgsnFejbA2F+uIeWPiBQ3xHRMKNo2vqaU3P+fzpKTeQMXLbohtpdUZmeC0oRSdvZhk5zc3s30XWZTeJUHiONnu9z5VEuzWoRytjBkJnGDjDL9
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR03MB6045.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(376002)(346002)(396003)(366004)(39840400004)(38100700002)(38350700002)(44832011)(83380400001)(2616005)(186003)(1076003)(8936002)(4326008)(66476007)(66946007)(316002)(8676002)(2906002)(6916009)(5660300002)(36756003)(66556008)(6506007)(41300700001)(6486002)(478600001)(26005)(6512007)(52116002)(86362001)(107886003)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Z8FHC1r33D9qhFqCyVuHNjTgRWRtQeB+5GVmgmjY4y+M6SSI9V4Ocz++zPU5?=
 =?us-ascii?Q?xRuMzb3C3hHtbGNOlS1oeJ+QZ2xMjFJybeygjvu8th20tjQxAFrH+7Hd/X1e?=
 =?us-ascii?Q?1qbnC+/mOetxZgegfosiu3AEycvkfVsQseKNe812GBrP008tJqRfQFqFvvXj?=
 =?us-ascii?Q?TNEIqThB6Ms+2XK3MJAySnZ7pccM58Y+WC/LuO1xNO54QfU54yy1L4rIsKyl?=
 =?us-ascii?Q?oU8SHf6iDBD/qqZhLGouzPogXPGBSMBDP2upPxYBWQcbOCXNCll+YwSvJvfR?=
 =?us-ascii?Q?IwC+N1tGyGIjpa7ScovGbN+TUgJymzX5VLzPDCssFt9bDw6BEFcmyAD616NZ?=
 =?us-ascii?Q?EzV9spG8Qyv+RQABQOb2R4r7NLYesfEFFJ05WpTgE7BUKGAnEHj+abQwDqXW?=
 =?us-ascii?Q?qGeHbKzdtPOQgBC8JivgBQN4PTsm5Q3hIy20g6FSMDUNHDemjsoD6gGPHLKW?=
 =?us-ascii?Q?5iPdUrlGV2y2GVnA25oCcjoi3tTw0TpamZCEWp2hP7W3tg/cgsDDvwNX0zz1?=
 =?us-ascii?Q?j2JYp33MBW/gJ4AFI2i9HV3IKGHeWiq46efYfvD2Ue3yQdyHna0AISXtTR2d?=
 =?us-ascii?Q?rkgjcN3wMjpUpn5V7qi6JS77RkoGQamIxucct4+FU7/IFORKpbjZT6ouhsWk?=
 =?us-ascii?Q?I5bILzZsirercdjOeCCth6iELEr7NP9QggZM1K1T9CQYlvZf/hd/HheX0FOn?=
 =?us-ascii?Q?kNV1pZXahIMfCIYF6g0cBgCoVZ36ZpegvZORg3wmwGSCOhE3bkiBJ10s5w52?=
 =?us-ascii?Q?SEoEoJWKi2/aQMiXCFZk9WIjkgjHADyFG7rFa4/stc/o2kw7YCtiRodaZk4O?=
 =?us-ascii?Q?rLbzKM0hitJLb3aFmEM9qM+FPieOTXf0PPT0GB/0Y/HCFz8OYHl8K2D6w1x8?=
 =?us-ascii?Q?4nS4bm3uU1nAHSu2rd1F8Ahw+sCmO8LOCAhm/LUjO2XCnoSbm4iA4MhgvlZ2?=
 =?us-ascii?Q?SGhO+tTPaCXJZ7an9q6SuwRam8AdrH0Ro/LPGYczs6t7NYRwQsx8ryzPcMjK?=
 =?us-ascii?Q?8XzUWh3lXphQnkh9qqff3C3w7d/FPErVwRcQdjH6M168gJfRfj7bbO1m7T4T?=
 =?us-ascii?Q?ZjHS3FRSdirm12agHq3rvHw1DNPlA3IpeSHjfgObyHt/LblGM9l5QJ7u0BMN?=
 =?us-ascii?Q?QkN25irL4zWJgfsFOwFQfugbGUe+X06FAFG7VXGc6okrRLxuoWeFBBSmN3oS?=
 =?us-ascii?Q?3MHKQAAHy9VWPy+vIydAhShGsqsPKqf9KQmYcS+9EjQuWnKSrlP0ZYdpTmA2?=
 =?us-ascii?Q?EN42OdYzVxhdymDw+m6NpiivuOVPiR2FBL310XyFCgkJdMxKq8xXKSqOsiZC?=
 =?us-ascii?Q?4IWxeEItE3zFDJm50d5v3Df7qRqL9GcEUuKxXB1uqGlX6JkBcPCUu/ca7Tjk?=
 =?us-ascii?Q?BqAOiVhCmHDOBgCzEgFo/L7ckK5zclAGQmv+VnTMMs88mheH2vAjlYv2haIp?=
 =?us-ascii?Q?ZtvTmMkvgccs0BH+KXSNqsmnR78/lvcqKsvJuj0kjqDMBVQtq6iAdliHybST?=
 =?us-ascii?Q?UNXNDhQjjyiB5AXOC/WifnE5UsRCj9dys4vTAY2VG+zJMD7hWk1Oo708w5iX?=
 =?us-ascii?Q?qB34nxJ4J6/CpM0mvtF4WLxaIWB5jyurFaVzEZ1yiZMdTLSypnXRNejx0N/T?=
 =?us-ascii?Q?KA=3D=3D?=
X-OriginatorOrg: syrmia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc359bba-77f5-44ad-aecb-08da94bad890
X-MS-Exchange-CrossTenant-AuthSource: VE1PR03MB6045.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2022 12:32:24.6253 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 19214a73-c1ab-4e19-8f59-14bdcb09a66e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HDFj9PsT13sX4atcMyk1c/PcMC2XjRevlE//ryzYrfL9jiePWiWO/e/4mU7xbvMl8leIAYogcHx7Wli+4RkpZirkZvirMNFXBCZ2qDMCCB0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7603
Received-SPF: pass client-ip=40.107.7.122;
 envelope-from=Milica.Lazarevic@Syrmia.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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

Change enums to typedef enums to keep naming clear.

Signed-off-by: Milica Lazarevic <milica.lazarevic@syrmia.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 disas/nanomips.cpp | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/disas/nanomips.cpp b/disas/nanomips.cpp
index 0121d5da61..7e45897f9c 100644
--- a/disas/nanomips.cpp
+++ b/disas/nanomips.cpp
@@ -40,16 +40,16 @@ typedef uint32_t uint32;
 typedef uint16_t uint16;
 typedef uint64_t img_address;
 
-enum TABLE_ENTRY_TYPE {
+typedef enum  {
     instruction,
     call_instruction,
     branch_instruction,
     return_instruction,
     reserved_block,
     pool,
-};
+} TABLE_ENTRY_TYPE;
 
-enum TABLE_ATTRIBUTE_TYPE {
+typedef enum {
     MIPS64_    = 0x00000001,
     XNP_       = 0x00000002,
     XMMS_      = 0x00000004,
@@ -67,7 +67,7 @@ enum TABLE_ATTRIBUTE_TYPE {
     TLB_       = 0x00004000,
     MVH_       = 0x00008000,
     ALL_ATTRIBUTES = 0xffffffffull,
-};
+} TABLE_ATTRIBUTE_TYPE;
 
 typedef struct Dis_info {
   img_address m_pc;
-- 
2.25.1


