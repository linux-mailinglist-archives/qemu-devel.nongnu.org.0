Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A8CB3C7676
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 20:28:52 +0200 (CEST)
Received: from localhost ([::1]:34084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3N9H-0002mt-F0
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 14:28:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1m3N7s-0001YG-RN
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 14:27:25 -0400
Received: from mail-dm6nam12hn2215.outbound.protection.outlook.com
 ([52.100.166.215]:27808 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1m3N7q-0005ED-2F
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 14:27:24 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oa0FyVaXs/ZhkeEIZA3KH95y2WiV8jFOrmZ6npI8RNAVBgPSrIG3u1es9kJgqRUQrQs/odDCtz6MvoEDLdWoRxJHTaNR5hCSuerq8E/+tqlEJlRAGhryrVnCH9lqySEAlOyDjnPD8Cy6p2tvMZbVJhKyLZABA3Y32V7bVhnkco0NGpPY3kRl27wfrGkY2hZsdLx3EcArwCrfPm7cAKZx+ez82wQQvPbUwSFkm4wNhXrpmRTBogPXqPyVl+dRl1G2ibzR/SNesfwHHBTTURAd67uU621Rt35C0mKq/Ileh8C8wAryAImAp9AX8oCanuf88JQxoUag1IzpNfykkOPjCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2UZ4YtM9kXYxOs+jB6s7HqMxfbeqDFYIpexw18AYDRU=;
 b=YomZxapSlIMQYXwwJs8YxVnwaPqP8/1+Xf+QsewBORq0uV7ul30WlirEKSGm9+iIX3pAZr1uJwnKVbcliejMIvwwhuNj5DMaDGOXc2cJDTSNAHKKD3oOtMInB8gfAjDuIfhSgmvPKHeq5YwMkp9c6K36rRpMO/y5WPNb6PIQ9+cGnHiRpvwgX++BFywbSzNr8PnonUlIs6kxBuUJK0GKVRzogtOkvSW5yJrMw1dgDTHXQiJNKgbQm8cm+o/XxqDIVISAjeh2ddEobWdEtd+pQqPmVG83MYoF8i/IZXXfle+PZYMhIgg0FzGxBKnyD6j1miA6oh1VcNAwoeWw0Iwqjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2UZ4YtM9kXYxOs+jB6s7HqMxfbeqDFYIpexw18AYDRU=;
 b=a35qoG/jluSHU3cNvmHWe4vnUG4UKjP25fFVK5zqLEBu+Rvy1hJPiLmxXVf4UnXenqGJQwaRc2BTl2tdiJccgT+Y1orLF5QXBWhdVRUFocXIiaENnPOpiI2IXcyiTCm2gT3L0Ewmq2X2a7QstRQSrHyHZ5GNT2Clia/J3+xP1f8=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=amd.com;
Received: from CH2PR12MB4133.namprd12.prod.outlook.com (2603:10b6:610:7a::13)
 by CH2PR12MB4230.namprd12.prod.outlook.com (2603:10b6:610:aa::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.25; Tue, 13 Jul
 2021 18:26:45 +0000
Received: from CH2PR12MB4133.namprd12.prod.outlook.com
 ([fe80::d19e:b657:5259:24d0]) by CH2PR12MB4133.namprd12.prod.outlook.com
 ([fe80::d19e:b657:5259:24d0%9]) with mapi id 15.20.4308.027; Tue, 13 Jul 2021
 18:26:45 +0000
From: Michael Roth <michael.roth@amd.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	Kostiantyn Kostiuk <konstantin@daynix.com>
Subject: [PULL 1/1] qga-win: Add support of Windows Server 2022 in get-osinfo
 command
Date: Tue, 13 Jul 2021 13:26:21 -0500
Message-Id: <20210713182621.258065-2-michael.roth@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210713182621.258065-1-michael.roth@amd.com>
References: <20210713182621.258065-1-michael.roth@amd.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN4PR0201CA0063.namprd02.prod.outlook.com
 (2603:10b6:803:20::25) To CH2PR12MB4133.namprd12.prod.outlook.com
 (2603:10b6:610:7a::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (165.204.77.1) by
 SN4PR0201CA0063.namprd02.prod.outlook.com (2603:10b6:803:20::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20 via Frontend
 Transport; Tue, 13 Jul 2021 18:26:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 788b73ab-a2f3-4db9-932e-08d9462bc51b
X-MS-TrafficTypeDiagnostic: CH2PR12MB4230:
X-Microsoft-Antispam-PRVS: <CH2PR12MB4230768BD69D6037A7A6C1F895149@CH2PR12MB4230.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:296;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pEYShnP2nI+KFMdXZCZBjrMawQsU/1ff39GRPSNWvsdfjChdPe7cbHdsqNCr?=
 =?us-ascii?Q?GN70GZItgL9qdGSFodv3NWnzHocehQURA21rl++T4hJeb3Od2s2OR1xZcLyn?=
 =?us-ascii?Q?wMm7pJCk+nM8DAQB6D9McSEqVoToJtebEwzxF72iVMkITarT8SuKOvOtRnDK?=
 =?us-ascii?Q?fg0rx6BoX0d8iwDUJ5WS7HtlWhf0RcqVWMVLO7G/0dkMT7KfICpmRd0Iohcn?=
 =?us-ascii?Q?enDNuAstcKWfvIUUGHP8KqsNRg0nKOxOs0OBrR27CF5bjV5Zhg1z7Jxgh/Yy?=
 =?us-ascii?Q?mbIMd02R23vCY3nYACXMUT+zcaUhMgE/ndWGMFqblab+2RUDggaAxp1yyXOg?=
 =?us-ascii?Q?OQK8DckkGntVHBQ67Jgb6h/pFAGg4wweoJneN9H6mVjfCiSW9gSyXuf3n3k8?=
 =?us-ascii?Q?WJZDpe8h6loVE306mWJ0GvGo6ux4kAJPg1RGC889QJHX7vG7/rji9cGjUl3v?=
 =?us-ascii?Q?2sqGmIK7LcGRIUUxTvpdOGuOkYy+Bs31+Zffsv4w0TMCCbrZRkiu9hOb0aN8?=
 =?us-ascii?Q?WVh5Q7CUuhmSGC4owDGOEKijmqh4ALEJOgsQfWjO982bOJe6lpV/RXm0Uy69?=
 =?us-ascii?Q?FsgyeIO3qRFDi+Z/j7qgXQGtV+tz17kJKX255IwAAxnXZvieks4uHCljjGhD?=
 =?us-ascii?Q?2y6XKyhP/BxYVCCbKnjBnsm4XC3HD+Xzu37Bqlm5H6q7N9TV1K8T+a72CR8M?=
 =?us-ascii?Q?QbhEi8Moz+NgjDzG0EAHmNrF5NT9JyK5coUruWzGLSHFL9l4rHUllM2kAsP7?=
 =?us-ascii?Q?JgGetm0I0eXR1Wi6Txt9ZXFPw+WSgsdLANRu764Sgo+q5hRLzZGOIU+cOxVz?=
 =?us-ascii?Q?o/ZaXMH2froQodYC1xZ2v9hU0bdCSgo6hV6s9J9NcBt107maZEs9KxgQOyEW?=
 =?us-ascii?Q?PdbUjR+1cPGcabrHu/dfuHDpF00s8cBUS1ugbhMTWyDPJkIFZHni4E4yjSfJ?=
 =?us-ascii?Q?sqo+8kctbIC5OxsEL2nzP1WKcejxGkU5sSaPt1u8UrKaCP1hwYncjN3j6gbj?=
 =?us-ascii?Q?HmcpiEOPkqhDJ+RbjzxWBuOmCzFwLz3vrd6K0aHJZs6NMVI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:5; SRV:;
 IPV:NLI; SFV:SPM; H:CH2PR12MB4133.namprd12.prod.outlook.com; PTR:; CAT:OSPM;
 SFS:(4636009)(39850400004)(346002)(376002)(136003)(366004)(396003)(1076003)(45080400002)(66556008)(8936002)(316002)(86362001)(5660300002)(36756003)(186003)(44832011)(26005)(6486002)(6666004)(6916009)(6496006)(38100700002)(83380400001)(478600001)(2616005)(2906002)(66476007)(956004)(4326008)(66946007)(4744005)(38350700002)(52116002)(8676002)(23200700001);
 DIR:OUT; SFP:1501; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pM3qBuk3xeobQbDEoV1DNxWLgGx5E/KmBF4HGkKOisQkYAw4/uCsEeeSmBqy?=
 =?us-ascii?Q?gRr1/Rxb26ADrhJyomAfX9nggpbPJekq0Ih9QCeUHQpdTkNm9fT4FzU96jiW?=
 =?us-ascii?Q?47LZG2zwMebG0rK4sYRVKEM1P7Vk5lTd9gR9SMNPpXFP1MSOz734j2Bbv4Aq?=
 =?us-ascii?Q?pAuJgGf8wncP7DpNBdSLGrRYuWVCOvJDXjGgfr22G5aBzMRZzdpDc6QyF7fC?=
 =?us-ascii?Q?twT+tUOQoxPLBh444f+3H2UTVL3QTclkakWacRTbrbFyQEjAoyh5JU71OfkO?=
 =?us-ascii?Q?Nv11P4/BQ7uHIO/zVyJUAOPTXjc4KoPGGQa+/9dwUopVLjbAWzsNTtfdNI0y?=
 =?us-ascii?Q?Gm4RlFjuGCi6adxcn9Yt/TyX0JgVlrVPtyaNBEJ+GHySwtAbA+VpXbcG5Ruz?=
 =?us-ascii?Q?bBIpdhhgU5ntky4JamBUC6KA1eKpFYXuTaOm/41q/m6LuEc0cL+/POwlDOoQ?=
 =?us-ascii?Q?2SCfU5FYu/y19p+wSCBDAZW53s8VqPfFrOS0DZsJLTra9TkLCTaxY7mYOPP0?=
 =?us-ascii?Q?KV73HER7mrMQ3GmJKMgeW8dcBFTXYWaQWukq6oiFXQG9gqQ14Uqb1vmC63Sh?=
 =?us-ascii?Q?l3A6zrSR+ctASv7k8nkyVNC4DB7hKG+rQWotUPq8Xd1+6mjG3GsrYaJ2OzsT?=
 =?us-ascii?Q?KOHyXtYE2+bNg4M2izd/iaXoLrxsWIr6Bub87Lyeme+TonPOXl2Isu8+frT8?=
 =?us-ascii?Q?MIHcs2/VljZpmS15xhYEGrtnUPDZ176z9BfE3cVTrm5Sc8pCqVNgn9r4NJQ0?=
 =?us-ascii?Q?Tvd10pJt6c5YAeRdNPne0mfV3IzjWewJ4g1+qmrxD8tm6GySX+xZHa4emWSe?=
 =?us-ascii?Q?1lECve/dGJAUEVwOS2oSNiuaX4qaB0F+ausfw3qhjhHodATyFXMRorm5DvY7?=
 =?us-ascii?Q?dHPHRz9MMFXR5pZpIaVBLraa/yuUAoo8QK/WKJ9riAjiXhsJJIcnN8GuLNaW?=
 =?us-ascii?Q?ncAzffP2reR25JiKlc8jhFar3ibHrRdi4nXLlCJmR5NK3vnoYVKF04jjaGfI?=
 =?us-ascii?Q?SFuHsYC/ifzqs56U8UUbtbqF8yfimyKqXk+72M/7BTIswZbFm6oFs0jYSkH7?=
 =?us-ascii?Q?eGq7uNhgxEDLFU8xnnp8aYOfbcv3rgOo0uhxYnNcNAUIQiXh65BlirTDjCaB?=
 =?us-ascii?Q?rw28sQJzvqsZT0CjsICDOg3l8Nq56J59C8ca+7NdikZOqnp6itHoF1hISH/Q?=
 =?us-ascii?Q?RxTUorwjkC6SvN9ys+hko5hHrskhiyg5+n2niEecY5JFDOKXQkUGnQfWHsPl?=
 =?us-ascii?Q?QbUi9eNIxG9R6w2zB+RfYx1TfK2OrJIHECNTYDCrW0bN9b9Ah9xd19xvZjyi?=
 =?us-ascii?Q?dbqaLu+9L30+NXxPA8eDeGiF?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 788b73ab-a2f3-4db9-932e-08d9462bc51b
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4133.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2021 18:26:45.5247 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5AJ/NPACE3MS4ToOKCt4uK4TeLb+LMauYWf5nzrEyizI8C/J240SwkiMJIV7LCgcKEra+SaLoliBxB1mJVMHHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4230
Received-SPF: softfail client-ip=52.100.166.215;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM12-DM6-obe.outbound.protection.outlook.com
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

From: Kostiantyn Kostiuk <konstantin@daynix.com>

Signed-off-by: Kostiantyn Kostiuk <konstantin@daynix.com>
Signed-off-by: Michael Roth <michael.roth@amd.com>
---
 qga/commands-win32.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/qga/commands-win32.c b/qga/commands-win32.c
index 27baf17d6c..a099acb34d 100644
--- a/qga/commands-win32.c
+++ b/qga/commands-win32.c
@@ -2166,9 +2166,10 @@ typedef struct _ga_win_10_0_server_t {
     char const *version_id;
 } ga_win_10_0_server_t;
 
-static ga_win_10_0_server_t const WIN_10_0_SERVER_VERSION_MATRIX[3] = {
+static ga_win_10_0_server_t const WIN_10_0_SERVER_VERSION_MATRIX[4] = {
     {14393, "Microsoft Windows Server 2016",    "2016"},
     {17763, "Microsoft Windows Server 2019",    "2019"},
+    {20344, "Microsoft Windows Server 2022",    "2022"},
     {0, 0}
 };
 
-- 
2.25.1


