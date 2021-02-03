Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD9B30DF86
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 17:18:36 +0100 (CET)
Received: from localhost ([::1]:42380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7KrT-0001zh-8q
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 11:18:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1l7KnP-0006uh-4F; Wed, 03 Feb 2021 11:14:23 -0500
Received: from mail-eopbgr750137.outbound.protection.outlook.com
 ([40.107.75.137]:17582 helo=NAM02-BL2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1l7KnM-000840-Qv; Wed, 03 Feb 2021 11:14:22 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FxdrYkUopF7xs3tF6dtRM4hJPmk+iN0YFJvN3X80JP7hkSPL5NBVo6y53nac0oCYQfCNSX71yTpzDOxqWmP7davEvc00z9qHIb3Tcyz3GvsBhM0ozoWY5IpftCE9fll0RsbAK2bt9C7lxiBE5UYiX3friuvc7kx1fDHRTp7gYU0d6ln4gZUgNuNEwj2nbdqmEl/i5pEWNrG/DxnrDOFQdI6qxHvJTETHK+lVOQC92WJyAnmBJ57YlhRueaMGkT00jveL2IG7XtMLwlzU7xKR0gMDUl7OePClwMNIu4tSRWMsW16a15e/8FD3Mc4eW99azhdcUJTu5NzFRYG9lckk6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qGlG7b+2LSwO3GtU4iyw/7UqXY2fRnRj8l7HGIcOU2w=;
 b=MwlkCh7PB8KM6uGrey8EkZQB/p+lhesn8/ZBb556jxE9e1wzjWCBh+NMGto2zb0LQwe0lPai0i/ZfvuKXkT7CG7daSHtnT8wfdI4iGTE2lqwsYuNlcUYeVmjaToVnkbeec381Ni+YOIXuEjteioR/Zn03iJY7u1sty4V8Xu0clC0rGIDp4lzbmFaARpnEwdJ+97xVBHEsYN+CiG5sSSU+3dr0By0SUBL0SSR0FXL54jv6if8M2lwCXKLp85YEYwJQBgo5T5yOohvpphUyorkagGxpR65C8B7bx9ksnDab2+nEwy1sKar7n7ODW04VU+SCNxwpFifCU84C1o9zZ0Hew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qGlG7b+2LSwO3GtU4iyw/7UqXY2fRnRj8l7HGIcOU2w=;
 b=i0HX1BNYlQsgFkXj74f5ul69QEF6XEjdne9oUDw6ugvV2KEB+g/LCePLLlSmLNo/vH4DpSTtTfeR6NinFua3PPrNty1wy6Kb51HGK01J4JbJMMpD1oTJB32lWko/+hErLrOe4aV48rgCRA0dxe41cGaelEt9qrTq9WirR0ikE9Y=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from SN6PR01MB4304.prod.exchangelabs.com (2603:10b6:805:a6::23) by
 SA0PR01MB6233.prod.exchangelabs.com (2603:10b6:806:e6::6) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3805.24; Wed, 3 Feb 2021 16:14:17 +0000
Received: from SN6PR01MB4304.prod.exchangelabs.com
 ([fe80::6caf:7c56:c4de:b5c5]) by SN6PR01MB4304.prod.exchangelabs.com
 ([fe80::6caf:7c56:c4de:b5c5%6]) with mapi id 15.20.3805.027; Wed, 3 Feb 2021
 16:14:17 +0000
From: Aaron Lindsay <aaron@os.amperecomputing.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH] target/arm: Don't migrate CPUARMState.features
Date: Wed,  3 Feb 2021 11:13:40 -0500
Message-Id: <20210203161340.55210-1-aaron@os.amperecomputing.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <CAFEAcA-qq-Eue+ktR1tNO7FZdtCe428=5vdA5472W-16p=d75A@mail.gmail.com>
References: <CAFEAcA-qq-Eue+ktR1tNO7FZdtCe428=5vdA5472W-16p=d75A@mail.gmail.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [68.73.113.219]
X-ClientProxiedBy: BL0PR01CA0024.prod.exchangelabs.com (2603:10b6:208:71::37)
 To SN6PR01MB4304.prod.exchangelabs.com
 (2603:10b6:805:a6::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from strawberry.localdomain (68.73.113.219) by
 BL0PR01CA0024.prod.exchangelabs.com (2603:10b6:208:71::37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.17 via Frontend Transport; Wed, 3 Feb 2021 16:14:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 76624561-9050-4733-7c51-08d8c85ec16e
X-MS-TrafficTypeDiagnostic: SA0PR01MB6233:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR01MB62335C2CC76D38713D4774C48AB49@SA0PR01MB6233.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8p+1ew0QLj/DC52Mj3w+p/ek08W95R7iB+NJDskfWpUkYdXaSigevnUrtD5DzGABoWNc4AN6AZHMDD5QhA+eSdd4V8+S631/gFmtu97Z6Xl051sOSaQ2Tiv1HpUstyW1J3UWVIbuANLXtmB60IPZVKxTl/ZpYkIwyuHLY32zJHLCHhQ6ab9U3MXvCwQJFkx617cViglGb02QGHj5yJ5QD3l95jE7Dwx4DB/TK4oGZaafUgmDZY1ge30EsTT7pBzearRfuvmbRtPPiRAHIzk1bu73w1ulmwJ8UxYd6dqr3vIMgIZ5ccnc4LQUQrh71u2BUcqNwwRFr0JR88tOVHoUHO4v9aKKxeD62eqiXoAnF+8sbOg3kg5JBenzQY39Js1Xkpk3CUv8JTbAGpglciMS4rxH0FUMtTyuHXf3rNOQ3sRN64NS4xpFShZjJymbbcmBVpnRMVOjhPWrmrtPUgpFKxIBrF5DTQQfmGAHlrCkv4tSb5RLwsfa02rsRhKrOCSHDZevXQbYQl7ImGPO976kJQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR01MB4304.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(39850400004)(396003)(346002)(366004)(136003)(376002)(4326008)(6506007)(6512007)(26005)(8676002)(107886003)(2906002)(956004)(66476007)(186003)(86362001)(316002)(478600001)(52116002)(66556008)(54906003)(8936002)(5660300002)(83380400001)(6916009)(6666004)(6486002)(1076003)(2616005)(66946007)(16526019);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?czY39ySXKij3z+C6XzTQgko7eW8xwW76AyIf9EM7XRUsdYy6+g1kvxvDWBTe?=
 =?us-ascii?Q?d+JTxeX62bHiG6n1XlRFMR2FqCuMyJ4rgwpq4R2RZlIUC/WVG9ImzjzJLU6B?=
 =?us-ascii?Q?+yLffgQAvJ6wIXqfRwFzryz/kyPRY8dVeWcrXbLLL5y477pDg8qE+X7yYD2L?=
 =?us-ascii?Q?ogyNS2PsrjhzANelxVlzsoRNX9+IZS81jszkPtcPAyTVTjtN87ZHBBo4kxpW?=
 =?us-ascii?Q?OJJoO6QKyqo+omhzGnJ7AEJtpD7/nnWOT7JSX6xRiLj7pEFauyC6NGf8gFyg?=
 =?us-ascii?Q?Z2JqnzqyrwBS3Wrchjd85mtj9wjWrBi9qNsRu8WqtQdWjxkMlGDZ6hwZ6hGD?=
 =?us-ascii?Q?KZAlLWkr19DhXyc+sxGWm/uFcKsVdigvpKlSQpyL2alI/1oscY7He+UAHPWU?=
 =?us-ascii?Q?CRqX5/C4LPUg3KHUIFltEgBq6d2KvKij25zVb20IP0PtECHMnAGPw0fe5M9a?=
 =?us-ascii?Q?7+zzKBEUzIj2pe0yLTWTLzDKjfuZBexIMOVR0U64xwGHSGLaN+zPrc3wGeXe?=
 =?us-ascii?Q?Zsc6ZNhqlRYCnFgtNOkqRX424kzeUVOeP+IyPn9LYNxhpKNG72blyGvpTfPC?=
 =?us-ascii?Q?4vl00ZtLf0H0KHfB6PTDBaS9dh87uq7SoKUOB7Xb90L8TXen25Aknc7hPAv5?=
 =?us-ascii?Q?ovnnq6ZEF8ZZi34HvzSXQoQKppuJg7jLl1XK56N2ng8FYnYdPDZNRqP4gbhC?=
 =?us-ascii?Q?SWd5y4ywyjPdPaU4goapZ4sZjF5poU0wWl2DlYwdCF1o0HFNv+08rtgjxwgg?=
 =?us-ascii?Q?iadrNDFHisgE+92W+Zh6UT03Bx+BOo+kCUb6XHjHQ0FqT22AIvOvu9Qt3FKk?=
 =?us-ascii?Q?NYDufLDi45pyp7xlEVFOlvMAIvPRPTKvP7Z+V4oPsHSzN0PApOWBCGJnYncp?=
 =?us-ascii?Q?utxFGv+Jl8aJsGz7et3D05ss5gZo4KjIwiXV/e3PtDsSTWUjvVW/WHekIp/X?=
 =?us-ascii?Q?Zyo3yxt6B5VyQShA39EXVKsTUsSoZtJXO3RiKPwBAaNkIeOFnPB7ftfU7KSj?=
 =?us-ascii?Q?NxT5QIfy5W/dppcU/TFVhyqZ2jctebfaVJDCmQ/LyPUJzz+chz2M/OAI4Gxj?=
 =?us-ascii?Q?ru4Z6MPR?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76624561-9050-4733-7c51-08d8c85ec16e
X-MS-Exchange-CrossTenant-AuthSource: SN6PR01MB4304.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2021 16:14:17.2388 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XWFcHnkjqR/mYMXxDmKvsXKijNzdLrYH+fbdyQlWqo8yi6yKJrS03H0yEpK99oPaYXrBUDtH1Qqf9hIE1vBBAFVUGa2/B+9Etso8IxYG6c4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR01MB6233
Received-SPF: pass client-ip=40.107.75.137;
 envelope-from=aaron@os.amperecomputing.com;
 helo=NAM02-BL2-obe.outbound.protection.outlook.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, MSGID_FROM_MTA_HEADER=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: Andrew Jones <drjones@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Aaron Lindsay <aaron@os.amperecomputing.com>, qemu-arm <qemu-arm@nongnu.org>,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As feature flags are added or removed, the meanings of bits in the
`features` field can change between QEMU versions, causing migration
failures. Additionally, migrating the field is not useful because it is
a constant function of the CPU being used.

Signed-off-by: Aaron Lindsay <aaron@os.amperecomputing.com>
Suggested-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/machine.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/machine.c b/target/arm/machine.c
index c9e9fd0a12..7f2511b6ed 100644
--- a/target/arm/machine.c
+++ b/target/arm/machine.c
@@ -834,7 +834,7 @@ const VMStateDescription vmstate_arm_cpu = {
         VMSTATE_UINT64(env.exclusive_addr, ARMCPU),
         VMSTATE_UINT64(env.exclusive_val, ARMCPU),
         VMSTATE_UINT64(env.exclusive_high, ARMCPU),
-        VMSTATE_UINT64(env.features, ARMCPU),
+        VMSTATE_UNUSED(sizeof(uint64_t)),
         VMSTATE_UINT32(env.exception.syndrome, ARMCPU),
         VMSTATE_UINT32(env.exception.fsr, ARMCPU),
         VMSTATE_UINT64(env.exception.vaddress, ARMCPU),
-- 
2.17.1


