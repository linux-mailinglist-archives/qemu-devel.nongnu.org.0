Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E203091B3
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Jan 2021 04:40:17 +0100 (CET)
Received: from localhost ([::1]:58068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5h7K-0007ou-Fd
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 22:40:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1l5h6H-0007OA-Rw
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 22:39:06 -0500
Received: from mail-eopbgr750117.outbound.protection.outlook.com
 ([40.107.75.117]:39140 helo=NAM02-BL2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1l5h6F-0000Z2-Ph
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 22:39:05 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JhZB/ZPFqYJVa1OfcS/DQboxjiPjuGIfPe/uemiovBm9dh0mm8z9xCaSRzqjJAqxH3gxRZILvLF0TABu1uU4X2GLgZ+3UzNrEUawBjKS2DELXQVvDQmI/Q1Otr58m6g6mfIHXF2/p9ez0zelE6o0ReF9Dxb47FrhzSovYeQbqDdlUMciaGkLGtFjNrG2rXFdVN67fEdnWcUzY38oYWMg8zEDUUNShiPqGWoKAMxtLFeJAN2+8ay9o+8YQ6eqTZvLhmjnY0mATJgDwJK9Tkhp1ouMX2hcfPAV150PI/VRklWXrRa6RAwyH5q9LS7tVtRF4te1jv65xlqTWsipSIDSVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PNv0Sd79rr3m3VFDUW9rb0t75Kovxm1XJceBp1DQooE=;
 b=iAYGN2M4aU+XHbidLVMnGG5zRccgyajOAReZJcyOlGQuS1YctzdkYnCAurz2y/Hpm4JpvOjD1ILFagANcTUJoKyiaV7etF5FHUiJY8WnYGfCiqmrJAfhro9M+0juy7md2oqejG7h9gqb49Xdmz60KA3mPShsFe0FAjFGkGGfxyyQtHkUlFjv25FJVdqzomh0wfhOt/yBTI/AF5S8jM7PTcbkh3iEBYMmqgUWlBZEPZNms+li4Uu4jF/BPccWXDZIrtDVLTiQKYEqDCrw5fIJzNpa4nlRSMI8k3Qllnl8BChl0hxkTTjCabMx7cgBSFTio/vUYUw68Uvrvh3QYTD90w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PNv0Sd79rr3m3VFDUW9rb0t75Kovxm1XJceBp1DQooE=;
 b=Qf17ilrvnxj5Dhy69dJ1/awt4y2RHc+RNZ1mVAvSrTCQmRtv3E12mdgycOY8AtQZsnl6Nqy6SyVA+6NpqiS9d3UiXNBdfKQ7gsp3/9dJLk7/tk+aIBOz64vYq95gsx3W+N4M4xgNR++/o7Kk9/l+w35kz3BfRBJGWKr18QDr9bA=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from SN6PR01MB4304.prod.exchangelabs.com (2603:10b6:805:a6::23) by
 SN6PR01MB5007.prod.exchangelabs.com (2603:10b6:805:bf::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3805.19; Sat, 30 Jan 2021 03:23:57 +0000
Received: from SN6PR01MB4304.prod.exchangelabs.com
 ([fe80::c5d8:3c64:9f92:90d6]) by SN6PR01MB4304.prod.exchangelabs.com
 ([fe80::c5d8:3c64:9f92:90d6%5]) with mapi id 15.20.3784.019; Sat, 30 Jan 2021
 03:23:57 +0000
Date: Fri, 29 Jan 2021 22:23:52 -0500
From: Aaron Lindsay <aaron@os.amperecomputing.com>
To: qemu-devel@nongnu.org
Subject: Detecting Faulting Instructions From Plugins
Message-ID: <YBTRSK4/F5KLH+FZ@strawberry.localdomain>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Originating-IP: [68.73.113.219]
X-ClientProxiedBy: MN2PR12CA0019.namprd12.prod.outlook.com
 (2603:10b6:208:a8::32) To SN6PR01MB4304.prod.exchangelabs.com
 (2603:10b6:805:a6::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from strawberry.localdomain (68.73.113.219) by
 MN2PR12CA0019.namprd12.prod.outlook.com (2603:10b6:208:a8::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3805.16 via Frontend Transport; Sat, 30 Jan 2021 03:23:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: abcac0f1-8b9d-48b1-6f74-08d8c4ce7a63
X-MS-TrafficTypeDiagnostic: SN6PR01MB5007:
X-Microsoft-Antispam-PRVS: <SN6PR01MB5007C777890A2653DF66BD5A8AB89@SN6PR01MB5007.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tf+IMwLb6BotzcBvOK+7x6j65NXwfxsdYyzRm3cCdXi3Q0+wWGcsqyWlAG8NGsavhC4TsjW2RxZA+Yo0EVa8GagPIhblqcLR7oJL4hiWpoj7Dk+OKmBgtDGcg2mCtsgomLCxPXn1hWrElV2na3YxbTy/6DiE+mw/l9/H/z8lGvwzemugrmhICkWMZsCrOyC6d8WsX5FVOD+FEQGNulViJRMoiYe8yanytEWp8tXN+2SRX5gGOD5PtDUhamx+tw5cWsK3+JxT7s0uQOpeqmTLSC8ZrCr4nF1ZlU3HX9iuudwBlMr69ohD36rXmT5lPZ99KjB8WrghRcVCDfxgBh+TCmDQ2PsqT58DtIZq6eOzr5ZNjtTifEx2MaJcCV2ERcEb5RbwXfAk8C2HM9DQ7ZrlNVm6WX4uWKgF5nnEhXHO4FYB195gJpRQBa+/QvFfXZoCiL2KDNqvGecQdNxngGvZHErJuEBj1AP1Hg9L9JirUHqrwkDnOOz8xGoNYrS/FFFEL/PzFloOdER2BTRHcmZlsQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR01MB4304.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(366004)(136003)(396003)(346002)(376002)(6506007)(83380400001)(66476007)(9686003)(26005)(86362001)(4744005)(33656002)(8676002)(316002)(6666004)(66556008)(5660300002)(66946007)(2906002)(478600001)(186003)(4326008)(956004)(7696005)(16526019)(55016002)(6916009)(8936002)(52116002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Bzc0nMmEh7tM4nxFeWX+SAP4g/21O7OD0YAIAMK8aG5hDRO446gdetcXeKpl?=
 =?us-ascii?Q?MnL0jwGoNApJzZ8aWA9qR5Wqey/Ra+mzUW+eIhL61oaJVTZASD816vWCGdze?=
 =?us-ascii?Q?1fCvwh4nASDTFAFAHqCNzekRROb9Z6x+bwoHpdjsRX9BwOoHcLrw6isG1tP8?=
 =?us-ascii?Q?lF1X7U+XX2WQijTIl1Yy4l1R/CP2kzRwSZ5ijO3wOfN3wtmcdXYn4TawmbO9?=
 =?us-ascii?Q?apgJU0BrmmX38dkVDXuoNTF1nVqDxpDldhnakBPpjDqjRiW87XLG/AU7a+C6?=
 =?us-ascii?Q?5A4cSA8xzPm7vEf3OzT5ysgGve7eAqmjFkLdSFTU8YjeuPsGu24S9e0Wv+op?=
 =?us-ascii?Q?KB6gHjskOEFp80TkuHUcx41kx38W1IDlQ9QTynEGeuT/V7MyxgICHo8Azksp?=
 =?us-ascii?Q?9F6GQvVsDH8Mh9fw35U4MkYCvHcb8PuLK263Zivf5pkT+X2J172T3vD0BD86?=
 =?us-ascii?Q?LDuwcgt0RUSv6jBcBByQo4BvS6b1w7weAVMuHkDo6higu1jWscYiwLgs7tUl?=
 =?us-ascii?Q?MyXFx+Z9+yu3oI3j+Axx5mvc1wKviXSsv/6h0AS2n7E0FFOIUsaFsDIcWzc0?=
 =?us-ascii?Q?aE6+Ro8djCmACESaIP+zC6Xi3igp3BZjqMFUMQbm+AQ5/jzV5+L1ITDqtR3X?=
 =?us-ascii?Q?1l4i8a/nCYMehF048+pWk80dtDON+N7OrIE60NZL6GZlbgi7GapfubQZWjEn?=
 =?us-ascii?Q?IDcqgA0IasRdT+GMbblcr+zLzoSjtWYrKZZEEKQV6R5BIBYeBBoDQbpEjbMi?=
 =?us-ascii?Q?lsxGdgmVeMYP9/iiyasDPGl3p+eYxnNZFigDGeQwx8Shc/NjTazt1fwlXIjv?=
 =?us-ascii?Q?suSzHXrCu9YQVtpMkIdRET3FizEetr9FXpZAmS4eLtYDOGMErLmZyojI4NZM?=
 =?us-ascii?Q?CCyVnxV3IBNh3t2hTFR5he3GWAgfQxibLLAkr9o1qqEm/jjzAUkWTT2PpYJb?=
 =?us-ascii?Q?v1Sp0l64l5SHyaNuKUA+dnhLhhB7nsQ0vSHLiiR6Y0dtPz+SZJbvMeuh2dZL?=
 =?us-ascii?Q?HwuHA89l7GTHEodJlPsTuYnaJRfmYxs0G7WVNI+cS157XasKcnL8RxA814NP?=
 =?us-ascii?Q?7zVXybOs?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abcac0f1-8b9d-48b1-6f74-08d8c4ce7a63
X-MS-Exchange-CrossTenant-AuthSource: SN6PR01MB4304.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2021 03:23:57.0767 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h0ZSRgtA4BA50Zf4xUsaJIEnxfFL7kHHt73gGlXm557BmZIOtATIKWvZd3iYDJwcwsHlbMuyJOb8hciExMItymzJ827k7HCFJNTpPZonZvU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR01MB5007
Received-SPF: pass client-ip=40.107.75.117;
 envelope-from=aaron@os.amperecomputing.com;
 helo=NAM02-BL2-obe.outbound.protection.outlook.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, MSGID_FROM_MTA_HEADER=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: richard.henderson@linaro.org, cota@braap.org,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

I appear to be seeing that if I register a callback for an instruction
via `qemu_plugin_register_vcpu_insn_exec_cb` I receive a callback even
if the instruction faults. For example, if an instruction attempts to
load memory from a page which isn't currently mapped by the OS, I
receive two calls for that instruction - one before the page fault, and
one afterwards when the load succeeds.

Two questions:
1. Is this considered a bug or a "feature"?
2.a. If a bug, is there a good way to detect this from inside the
	 tcg/plugin infrastructure and avoid calling the callback for the
	 faulting execution of the instruction?
2.b. If a "feature", is there a good way to detect this from my plugin?

Thanks!

-Aaron

