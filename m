Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2036C858D
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Mar 2023 20:04:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfmhq-00035V-E6; Fri, 24 Mar 2023 15:04:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pfmho-00035L-KL
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 15:04:04 -0400
Received: from mail-vi1eur04on2121.outbound.protection.outlook.com
 ([40.107.8.121] helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pfmhm-0003Xr-Vn
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 15:04:04 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nlO4E3U+583tQcCQ676B9yhLwVxWrYBc2S0u/lErceavUEuM75Ofw1wLRjQbzeMlvz8VVyArJoID14Pr3OFee/aUkbtjHQNeQko43iXuVLo494yI0VmixU2O8OAgg53IJ2UgZlvT+I9StEjWSH3r1PuM7L3IClztedDsx5Uq1Fu3aeGL9c9Kn5GAl0H07DH+waWSHRBQxXbArVL5MBA0tlKZm3EaJw5iT9mveNGHX/CVAqjzzvjbRB13NqwNEZZn4ASPLqjGDJjzw3ui+YNktqW89KPlCtsHcHxmPD9fmD32e88g48Vi7F3sf3qrMGqKkJl97SEJ/G8MgLetHr4hsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=itgiaMnPBLOR3CeHaN1XXjuBBARZTaaBCB7OunrOsfo=;
 b=F8RtRluaqowitwABGYOk35qtubM7/e8yopvWa8hBSItOBOx1JS2mYuUUsq4smvLU9FPq+ZKRAEd+tJ+HeHetOeQCJwgiwQKrTFfgY+RLMV+rNP9tIsz4DqiP6ICEITpnRcv5ydgHYRDSVEqRVRcSUbZ8m7m+fw1OlJUz0axXlviG8yfyQ25wrlEes0sLTWzzmeXQOQuNAWHiQ/dIKbX7JmsLF/OU3BL/3Wrr7jUt6qg2Jbcm4GlDIrHmxpzhNLxyMuaihll/Xm94vsanbYRuwZ8elYBpLNSXg2Z/10X8L0psicyselET3GV3d1BzObJAY0PxviV7gaDUlbiGm5VAmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=itgiaMnPBLOR3CeHaN1XXjuBBARZTaaBCB7OunrOsfo=;
 b=S55E33/Q9/VhQeM1zqgb2Lz+JKr9fynnkeReHc8SqDxoOZZyU7Uio5q6yPuzMxUZDwyyZo97aZZrrPJWH3TvCVCpi5weUbIGou44sLL6BfpSsQXU0FAo2fTxyoJtLpQxXRCSbvX8j3O3sXq5jCa/8muAC0+jpA2nfJujOPKY6y0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by DB3P189MB2380.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:439::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Fri, 24 Mar
 2023 18:58:57 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::13ad:a312:15c6:91dc]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::13ad:a312:15c6:91dc%9]) with mapi id 15.20.6178.039; Fri, 24 Mar 2023
 18:58:57 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: 
Cc: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Subject: [PATCH v10 1/8] MAINTAINERS: Add Sriram Yagnaraman as a igb reviewer
Date: Fri, 24 Mar 2023 16:34:54 +0100
Message-Id: <20230324153501.20695-2-sriram.yagnaraman@est.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230324153501.20695-1-sriram.yagnaraman@est.tech>
References: <20230324153501.20695-1-sriram.yagnaraman@est.tech>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0118.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:8::31) To DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:1e7::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBP189MB1433:EE_|DB3P189MB2380:EE_
X-MS-Office365-Filtering-Correlation-Id: 6912553a-014f-4e93-25a1-08db2c99d0ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BAb+iY/j+1X81CcZeQ192LQrOs+LeF0JI2Uv+Y//+rE52PEAsKwpdI3PD03Cu60cH90NqU3na+ag9lA4+fi9tRErg9hOKkzr8Aoaw9HfE/I51hQQrsy1QUuqvPcMBs74akUaoCkOoO9GdO+ZgjYE50PKUVAkdw3EQtuXU9jqK5DydfRrdZlJM9wA3msKxAuaDWtVikReXIEFhMkKbPgIDy3Rg30JS9uC0lyB/4cPJv//bJvGbASOTy/6mqh5AnfO+mQURfdCe3iknWz53zXFCl7BkK1mOZCuZTRz8t/Qu8vJeblwiVUdnQm+ac3nH/04c47Lu+dZtq37OYGhxNGSK9/XHOUL8JJ1DqDsK/i/VrCjnlUFB+IFPOAIMqRxLdfSPOYt+UucOhbpBccTlSpwAvr4E8glXJ1CttK3NKKwymDGDHBwg9nRjL//7va/MJFGukbGir00m5pJXYlIroAfxa2/945UhMHHG9N5Vt5GJknjW87pnEdQ65pBEAQJs/pnoMlkbBGsI2mNDewN/9yM7I8pDK7gZ0QditysaP73UMFn/mTBB5yoaKpqa9e1Fzf0i6jkmrYaXLTtyPAlNmnuHiumjSgBmWr/SlIY+EhDdQ1i7hVjeSNMs68ic4fa6uu5jpfE2Hp8e0ldq6LCECTsQw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(136003)(396003)(346002)(39840400004)(451199021)(109986019)(66946007)(54906003)(316002)(66556008)(38100700002)(8676002)(70586007)(44832011)(66476007)(86362001)(4326008)(41300700001)(36756003)(5660300002)(8936002)(4744005)(186003)(2616005)(2906002)(6486002)(6666004)(26005)(6512007)(478600001)(1076003)(6506007)(266003)(37730700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cXrak5uwhaRpwjtbGlgmOPJkd4RJNi07WPcF1P4VVHdNGcN6RGbTdFOBH6fH?=
 =?us-ascii?Q?VQTrVFpTouHfd7YIoGfSQees6+LXq6K1kYynkPEQfzaZki9Gb4aLJLDuT++s?=
 =?us-ascii?Q?l43uZg/NqwgKIVYNAU1HJXl4/5iGI8HAYnkM3qG7DL1+NA2JAFt52m9HKU+/?=
 =?us-ascii?Q?rTQsB1a5ryLq0gOMDEVKw+BHdO1dw2SyvrQ5gDFgf9tbxZb3mjBxtJNOAj5L?=
 =?us-ascii?Q?QE1ZinRX9W2u8Lzb+Lz6Ms/CIMSVK3cu5hbydd/H0BHzXkOKPE941A7xG8+r?=
 =?us-ascii?Q?hIs6s3oe0dkcO2Kq3WPE+ypBQDXr6NCwCHxBye8MR3TEQcoUnx9Wj23uv2B4?=
 =?us-ascii?Q?J0LKV4qLDDzS8c2Ht3TQ27GiUAtMUq39CpnJBCDuV1SJugMBO2f9UGKhyPzw?=
 =?us-ascii?Q?fx0aj26a+n4Wtky3/yZm6nbxnnN6LfcPdtePjI2vHkNFvcqPHORZg89ps/hg?=
 =?us-ascii?Q?xx5dNxPf0b92bypTh8GR/1+FmRzVoNXg5kXiXNS1K6sKTuB/MCE+dv09eRen?=
 =?us-ascii?Q?oDEke2he77kUYbYXX7axv4wM4J0rDO68cR1koq0IFYxIIL3BoCCYY+zGXpaw?=
 =?us-ascii?Q?/F0PV2h2DA7zKc2sDy9MCddlRVUL39cvPglS4IcTq0tY331+SuXAd1YQLRFI?=
 =?us-ascii?Q?idprNzL2bvDiLBd1iv4Fbpe/d6AAJVmE6oLvEezosShebIzt1VcAAhGJnI8I?=
 =?us-ascii?Q?gPSVT8FKoIr9Qko4E1MaoRb60YRSQEnnaFjMpSwkrfRWmiKC+AuhLAl+1Lwa?=
 =?us-ascii?Q?oKPPr12xRtOw1ZN5CbJ0IpQpTOpWRsjzxxBRpXkv/jkqDA1Rtmc/SDNLzgpD?=
 =?us-ascii?Q?guxUSp5MF88mBiwdtEIUgfKsd2x22Hn2bbpzko1bFIb6qhY/5FUeIIAJrhj3?=
 =?us-ascii?Q?9VTJCZ3wK2nZzvzfLUXGnMicW7x7JNMW0iRr2z/E1bgnmWJEpe+afBv+LhdP?=
 =?us-ascii?Q?f8iO4dHnh+O+Hj7dLZB2tyEwVPrO4UXzyvAeMtHDw1p/+Xl65FSm2jD4C7Pl?=
 =?us-ascii?Q?jHu5Q9HNnKXoo16Rie4noNy7TVZQ24fh3TsqYwpDgEQLjYHnd9Qw7tubpmBs?=
 =?us-ascii?Q?1q+Hf7edPRXqhqnKOlKbhiPy00mM8u7bHSE0fp3GtpXlE3qSWBYLwG7TVTZz?=
 =?us-ascii?Q?lTyUs7LnEfFRfnghzXDUWIUxwCMYVhnPdRilrNBbNXLAr693xWztV1Mm71Ku?=
 =?us-ascii?Q?/j4jSeMQhvM57Z7I3xmuN2m0qYXNS0S9TNfVQQ/brs5UbL9l2/F0ApY9vhWg?=
 =?us-ascii?Q?YBRn/5RYXoynny4RG6Pe+vo3pMhvxnNm+5KZcZgqFUCzYvJ7tAhraS9EK/eM?=
 =?us-ascii?Q?HU1S93Mw5LtbpBVOBZduve3Ksu/Cd4TNySSKepU01SLTBQ2+AUOxkciDep+F?=
 =?us-ascii?Q?11GkEJI87bnvD1S1zOJmppvW4+WugdEmwcF2qOEaTvq+D8eFVANzLZBmn/gz?=
 =?us-ascii?Q?jVURwwbyG36UuQdKxLQmxPeqcHKtccgTM0YXmVJYR9PQ7MrrGuUlBIidjsqU?=
 =?us-ascii?Q?EzV36BYOgRvfrGiIcYprm2572u5INFQaNZiVkhE7t+hkBxTrGmKIKs8BkFEw?=
 =?us-ascii?Q?+x31oPptvRCrrM49WtTgh7To8Z96HxaHC+sLUFLyMkZ26Lwz6tpLBuicBvsV?=
 =?us-ascii?Q?YA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 6912553a-014f-4e93-25a1-08db2c99d0ad
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2023 18:58:54.6933 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EP795gg65/nxB3tLudQSx44u4lo3S4iXQKUb+Kcp7QqQRyUyBD0UDxQzAcCqV08wQDA9fyiaQJojRSd/ZxWzwmZzmpOIowlax0eae5ZCBrw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3P189MB2380
Received-SPF: pass client-ip=40.107.8.121;
 envelope-from=sriram.yagnaraman@est.tech;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_03_06=1.592,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

I would like to review and be informed on changes to igb device

Signed-off-by: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9b56ccdd92..a9ed6143f5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2252,6 +2252,7 @@ F: tests/qtest/libqos/e1000e.*
 
 igb
 M: Akihiko Odaki <akihiko.odaki@daynix.com>
+R: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
 S: Maintained
 F: docs/system/devices/igb.rst
 F: hw/net/igb*
-- 
2.34.1


