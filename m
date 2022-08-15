Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC37592A73
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Aug 2022 09:51:47 +0200 (CEST)
Received: from localhost ([::1]:59822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNUt1-0001fg-54
	for lists+qemu-devel@lfdr.de; Mon, 15 Aug 2022 03:51:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1oNUZk-0001Gf-UV
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 03:31:53 -0400
Received: from mail-eopbgr130123.outbound.protection.outlook.com
 ([40.107.13.123]:62853 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1oNUZj-0001DF-BO
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 03:31:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TvhNq5f7TCMLzpCWnuJDhQU0ARd2pZs9lzySuHXihX2dRpoalIt1SbX7aSb/hfoK3cLtmJ/Fn9DafiToqmBzyv8xjdg+JUvikSuRfJ8pg8ZlIdzY4l9zIC9okWMl682ZGiEEPpGn+VOfpz1apB+Mux5cfExC7M2G6H+XcYLHoWwzItaYjoqVJsEWKTtxSh3OcYj89FKctRU/04SAViwTfE0pkGlKG6O3c/LdN16+vID5yazEhXehWp5XiH8584H9kaK/jLi/jzrjxySfqKiHwoTCHRj1NHuW9fQkBlTOjaAG9KWSq2BHmX95R1cGNWKiUyMIQ1OKxXKhU+XssTtsXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bf6BXyHkHS/2ZlvufP1+er50Fo5Z+SmABjiDo0y1tAI=;
 b=NWIIvoKYkOtseJmur3obpShhXgaAsoDBVqQwOmLel1vyFLKOpNY9Ec9mbBRRDDfX4ly3Ervf8DJr/GFN2lPyC73HBSnuIl9w4q8EEYbtNQFXGiXhMKBL422dKk4s0k5Iudf0FXLPKeXwSQj0Gk/C/l0O3Yg48xsPVoRv82Co1VWlCKxwBJACsxmR0BCpodT8oUTVPXMiCuH7o2Y06tdYQZh1votVQKC/Ky/USf+A6SkShENcPFe5b/3eLNll8w5lYu23FKP87Sl7p8Ai0GuY4LYX2OoxVS0pb8JUQOMKkMGUC+YWZrucdvg4TRymKSB38r+SBvtLdn8UOKsOcGIyUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=syrmia.com; dmarc=pass action=none header.from=syrmia.com;
 dkim=pass header.d=syrmia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syrmia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bf6BXyHkHS/2ZlvufP1+er50Fo5Z+SmABjiDo0y1tAI=;
 b=WSVwLIsxPsUOxVBdAn4e50isMrkiri3fOIZYeFIc2gTwJ0qI1imWDUQyth86q16llWXfdjdDPv6z7Og/7u1KaofHt9mMqdRGNcjedsAGlcVOU3WStGSG3qm0cgd/UUym2+gd5h4iihEGopAX2hbD1a2IKGBV3VqbMDMnc6+ieSk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=syrmia.com;
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com (2603:10a6:803:112::20)
 by DU0PR03MB9152.eurprd03.prod.outlook.com (2603:10a6:10:471::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Mon, 15 Aug
 2022 07:31:46 +0000
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::7996:9fde:76d3:745]) by VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::7996:9fde:76d3:745%5]) with mapi id 15.20.5525.010; Mon, 15 Aug 2022
 07:31:46 +0000
From: Milica Lazarevic <milica.lazarevic@syrmia.com>
To: thuth@redhat.com
Cc: qemu-devel@nongnu.org, cfontana@suse.de, berrange@redhat.com,
 pbonzini@redhat.com, vince.delvecchio@mediatek.com,
 richard.henderson@linaro.org, peter.maydell@linaro.org,
 djordje.todorovic@syrmia.com, mips32r2@gmail.com,
 dragan.mladjenovic@syrmia.com,
 Milica Lazarevic <milica.lazarevic@syrmia.com>
Subject: [PATCH 16/20] disas/nanomips: Replace Cpp enums for C enums
Date: Mon, 15 Aug 2022 09:26:25 +0200
Message-Id: <20220815072629.12865-17-milica.lazarevic@syrmia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220815072629.12865-1-milica.lazarevic@syrmia.com>
References: <20220815072629.12865-1-milica.lazarevic@syrmia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VE1PR08CA0009.eurprd08.prod.outlook.com
 (2603:10a6:803:104::22) To VE1PR03MB6045.eurprd03.prod.outlook.com
 (2603:10a6:803:112::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 595c6171-cf82-4c87-c7a6-08da7e903581
X-MS-TrafficTypeDiagnostic: DU0PR03MB9152:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Qx8cN/CACpd+RY0BMIpvnWyi4twJY+3vg8zMJ9zMy4mFiQnCEW2DUocbAbyVVbQS5N4Va+5WJNeGPLQgJEd20J3VLj94DmJ8UcemyG6Y11nrHx5OpoiEXuc3HlNA/Mv2dSvl8M6WeXtlCzsEnRjY2Vg/JOhPhlAdq/+o2Gjfybz4dOOMRpRvkcEV0jsjYiA3jy4Dxf9v1dCcZPizjFYED1QExDkoyBZ2Z71QRgtDgnX5K8kG3c44C85m9sfUcTo94iQiyBx9sepSeH7Zggk2DsfrFM4cYRs/sNdLrpCV//ssi3IA7y7KlnjcJeY4nzfYBj18jq/FEGic2uKJXu8XWL34LSsoVx/Cm4cRaZtQyoK3xTo4ORAJNuI2bq0oFfyU4S27l6sYbQWdfC7qYdTjg/vVbJnMW8cc9ow71ZUnKxk1UgR6DklZ6Y7SzvjKf/iABQmdR8o2RADYvWoPwYTWxZMXanCZRgbk1/v6LyXcrwlUhAGGx3zOWJbErY//y0ia4XpRsitRA33rbQUx9P+B/Ki/5W2pF7PXhEi8BPhXUACU6D2lVxewBOncpprcM+wVwlUgdEVkShVl1Uvd+MhgVGuG4rgiV/znvMMaYea+SfNGOPymN0ugumKQdIAC5NeEgvul/YXiPO9IGwdqJb8r6Zcam4/VWidcx+dEzfMLftygzmtUL+MV+HhPKGIS2rObuSk1hCcCn1QMjgMfIl9O7KdqlwDXHtkKYGTCWgBqvNy2r+bEOm+3bF5EHEt8uMej1XV4iwqXw6XRltKw/jjCJLz9Ra+Zxui8+huat5DitOM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR03MB6045.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39840400004)(376002)(396003)(136003)(346002)(366004)(52116002)(1076003)(8936002)(5660300002)(44832011)(2906002)(26005)(86362001)(4744005)(41300700001)(66476007)(186003)(6666004)(2616005)(6506007)(6512007)(83380400001)(478600001)(38100700002)(4326008)(8676002)(66556008)(316002)(107886003)(6916009)(38350700002)(6486002)(66946007)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?El0TU9FA7NM69M9x1heQefkiyuXpKB/NTp0oI7Lm7Q1iA72OzvU5hCK2pTn1?=
 =?us-ascii?Q?mvL3obCKXU/xNN7o0OuP/HDOpNwsfHP0tfP3+eXLIbqb2X6skRIXVG5QpDc7?=
 =?us-ascii?Q?P4X0MJ4C+o7donMVxhpzJsLaLL04FwIveNnJmJoJSMbkWg2S64Agiaj/q1tO?=
 =?us-ascii?Q?kzvpzvyKQUShoZkq7BETSNyAuYj9Tnpatc+S/8wU1AGSwPeyRD55ivNnyiLu?=
 =?us-ascii?Q?eaBv7faW6iq9Yiy2Wk5tkoqLu80G1u6FqaImsfGJ9RtvMz2jnYMcV4tj2kHz?=
 =?us-ascii?Q?E+EH0dIqJnNQVI13rAS1Iqn+kIE4DQes8UES9OSIFlJT8XYbIYRQu6ctdcxO?=
 =?us-ascii?Q?Uaxnr8suYEpf3tNB6JnZmMf6Q53grIgfloTCu2k+TJB3TowggH8/9ZEhYjVx?=
 =?us-ascii?Q?gy7W1INoDbd7p8xMGLzKkXeQR9ScYV4TiXwgEaWXM/eMuUuEmMEupnZxt6Rb?=
 =?us-ascii?Q?D2ruY6lxRYgZ7Z/vMCIDIYbWYzqpz3u64YkJNgh2zAnmvzOz/OJ9vAu9wIHa?=
 =?us-ascii?Q?xhOknlVlQAE4ldVtqNAsPGpLU+UwYBon3doQCSlVcOeYmxuHrsGwOVbwGWd7?=
 =?us-ascii?Q?QXFnZMXsrNCfwGuPjuz4VXTP0JhInUKMrg8mHff3SPl3R2wcf7fmspZPjtPg?=
 =?us-ascii?Q?aYaFI8YYe9Lb90PQW0ZBu6zgDnI/E8SM0p3Iox/vg/pRESt6WiAsyhHOlH+/?=
 =?us-ascii?Q?Qw7xw/L/u6dEbkUst50m4k0/wo/xPYE3fqHGydwCgsuam3XUBsCXAE4k+kf9?=
 =?us-ascii?Q?Sf3d9V3dnV4+zMS4d9cUGJRSEYT2Y9DhMITK/VlTXj4eEc0JyVG/P5rG8pBu?=
 =?us-ascii?Q?xZ4ofeL2CiK+uiWe3tINSD8T6+1yvNpYphS9Gznlwq6jkV1fihhNtsaJiyiW?=
 =?us-ascii?Q?08+9gasMTceOh9R+BGVq6zJDkQsj4bG6bzQRi96P0AKBVRh/yrDuoTETjBWH?=
 =?us-ascii?Q?9wK4DKhUGv00y1STnYIjPrtUtPjLOmK3cDB7RvV6FYQwq0gwKBAk1MInmirR?=
 =?us-ascii?Q?gpJudqN+hqHGjCMok43lv8IKwjbb50u6lrWiSNcAnfo+udoHH3a+HoNNW3Vd?=
 =?us-ascii?Q?8+YdQxJxDUTddsun8Ynag5a6ZljcWwOZOg6vbhRi+gmdCqGUOIaPk70i7ZCZ?=
 =?us-ascii?Q?/ugQ27R5RUyW842MFngKt3jyrkgH4VJ2CHIDWwzbXYY9D4QYULRpwMNWfAHt?=
 =?us-ascii?Q?+EYNT2z1Hxh58bWDT4OVGjgZ6P6fwhMJau1bvcxc2VhOhOObekwCI1lqiPtb?=
 =?us-ascii?Q?beOg9RrNvCcTWkbOMIsAUldEMg6uSlwtydTCu72zQs4k9RQwCl9WEupCIYBz?=
 =?us-ascii?Q?HrCp2mgItsKaDypdjd8jYsB3+d3X4FfAFN49HJG4IOZonxCCYo36CC/lrAAQ?=
 =?us-ascii?Q?+z8EwA1y5b7ThbYEiezvC2Q1sm9s7By9RaCU+BPbUel1FjvEqclMOrq+rP1Z?=
 =?us-ascii?Q?LFwHY06wZzfNWd9DUZkb19STXEkeLVgwq5ZN+inLpVb4PaFO21T9x2zuIYze?=
 =?us-ascii?Q?SnOpUvDKohtd/I6sKcWxSx99CtKDh65ufmXN0Eu8AqSsrn24r9LEnarhYQEd?=
 =?us-ascii?Q?JP8uWuTqXyd1qBl6iYbisbLsIygcTnzuPJle5LLVUsQMfVTpnEexex2M67pv?=
 =?us-ascii?Q?4g=3D=3D?=
X-OriginatorOrg: syrmia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 595c6171-cf82-4c87-c7a6-08da7e903581
X-MS-Exchange-CrossTenant-AuthSource: VE1PR03MB6045.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2022 07:31:46.5528 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 19214a73-c1ab-4e19-8f59-14bdcb09a66e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C0xR5gl+yw0OlBnIazijB6pgp4rsUElUa6d4/+/OUPXq65YK4wgWoBMYeBwStKLXkH0KcQCJsrA2iZgWQ8LL/SwVcgwp5GMFLDvPoh2ZuyU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB9152
Received-SPF: pass client-ip=40.107.13.123;
 envelope-from=Milica.Lazarevic@Syrmia.com;
 helo=EUR01-HE1-obe.outbound.protection.outlook.com
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

Change enums to typedef enums to keep naming clear

Signed-off-by: Milica Lazarevic <milica.lazarevic@syrmia.com>
---
 disas/nanomips.cpp | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/disas/nanomips.cpp b/disas/nanomips.cpp
index a8cd878809..9406805367 100644
--- a/disas/nanomips.cpp
+++ b/disas/nanomips.cpp
@@ -43,16 +43,16 @@ typedef uint64_t img_address;
 typedef bool(*conditional_function)(uint64 instruction);
 typedef const char *(*disassembly_function)(uint64 instruction);
 
-enum TABLE_ENTRY_TYPE {
+typedef enum {
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
@@ -70,7 +70,7 @@ enum TABLE_ATTRIBUTE_TYPE {
     TLB_       = 0x00004000,
     MVH_       = 0x00008000,
     ALL_ATTRIBUTES = 0xffffffffull,
-};
+} TABLE_ATTRIBUTE_TYPE;
 
 struct Pool {
     TABLE_ENTRY_TYPE     type;
-- 
2.25.1


