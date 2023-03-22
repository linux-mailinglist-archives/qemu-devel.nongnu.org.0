Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B7B36C4CAE
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 15:00:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pez0f-0003j3-5g; Wed, 22 Mar 2023 10:00:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pez0c-0003ia-OL
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 10:00:10 -0400
Received: from mail-am7eur03on2071a.outbound.protection.outlook.com
 ([2a01:111:f400:7eaf::71a]
 helo=EUR03-AM7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pez0b-0002CS-3b
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 10:00:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AUq++mLk6jLoc+JXmR/oE05WpIc5ao9CG8SPwTSoNPNbnW77VNnGYw2tuI5CwdpDUEoUyiMjFV3hPZAh5Oh7/uvfz3XBniS03xuAyMJ8B4W26TeYy//BeZiu4U6xFdL3Bxv9nhJ7VnoOmSu8/TgCc5cMoBum9eQIe1XUMbSxTj5icjR7BP2uiBfijccSf0UX/GTdr2iiHIrL9M3T43bn6d2vGbmXF+10LZh9nwVnUYVBJ1uhNuEqMqJdwNkQJBg8frgceS74aWAHiclHyj5QJ+KKx6rF4uc+hoxu5HVtwxoWMFksD6aeUo83WFVv3ATnbYgqUcNEaioBamWMK+df4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=itgiaMnPBLOR3CeHaN1XXjuBBARZTaaBCB7OunrOsfo=;
 b=db323xdPqWg9JJoFrF8/Y529XdlICJJEsYw3QFvoBga9Si/4SqbvlVNEWaYrMnp4AwYlgk36a6x9lAecm1tY9LLa57+WpYe4GGPKhLJTXLpCp5mZ037YYFXurzRTWixaOAsU+YfGA2JWK/HFl39mTHaQj0Lr2DZwWyLNk1GctbNj/XWap5C7QmBeR3y0I56IUv+mW6YcR5EHvOcbM88seI7O18Q4W7/HrcjhDNsFH7QFNCkah1MmEzIZXp/8FH6GHile+GOYhx3WsES7jyU9IfFBO45hxdkXL7WAt3Jzo5UscXnIQZe/9+kDqUrPp1PTI7Ap9mxoLJC2XtXbn0x1aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=itgiaMnPBLOR3CeHaN1XXjuBBARZTaaBCB7OunrOsfo=;
 b=l0bPFla/wrzBh0or6TxDMB+TkHbGbTf9WKrR+kOK5Nb03SS7cZKcDJHyW9b32QnoTQ/Xb+Ck/KseperoOmB3DT2NRLHeEFHlx74CPbb6vGqIHe2s8ENR5/TXCLc87GYkULSgrOKO5gX5Qrz9gKN3KC6Udl1CLNZieuwKC2JR+BE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by PRAP189MB1850.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:27b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 14:00:03 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::13ad:a312:15c6:91dc]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::13ad:a312:15c6:91dc%9]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 14:00:03 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: 
Cc: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Subject: [PATCH v9 1/8] MAINTAINERS: Add Sriram Yagnaraman as a igb reviewer
Date: Wed, 22 Mar 2023 14:04:33 +0100
Message-Id: <20230322130440.26808-2-sriram.yagnaraman@est.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230322130440.26808-1-sriram.yagnaraman@est.tech>
References: <20230322130440.26808-1-sriram.yagnaraman@est.tech>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0103.SWEP280.PROD.OUTLOOK.COM (2603:10a6:150:8::8)
 To DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:1e7::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBP189MB1433:EE_|PRAP189MB1850:EE_
X-MS-Office365-Filtering-Correlation-Id: 274d703e-4c2d-4ceb-5f6e-08db2addbb62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tsNatoO6osL8Sel6Qo7hKyeMnDreY3l04KPTLJBUn8QDV89gO4poOAUd57iqWnAvp1z4QBf9yh+46V8xLB7BJ25UhzAZBYGilqNkudUe7ZbELvx32UNDOVRGRyIex5czLJQH/8+zCXPlRZg+ithdEutRmCX1uaQddfXJ52twIq+I4SvXTdetgHT3j8oHIbOp7Ea53itdtL96BFPUnBsjIGBoWSrjWMcBu2hrCcSJ0BguP0AfdnsUX44mfBLfzWFdL4ejWL9iZBIW/8ZW7KiSHs7b0vmAWiiHPDViK0ja7F3AnDrx6hRmB0qyZCiZyH1gOkrvYm5VFqcZzAyDjkVCWMRzu0HeGK+TGR1VMfb9o4RzAo328PeEXxoR7q8On2rOZ8gXgEQ36pxAJkTLY+NsJ5qfP5Ubo8ws/vlcFSC5ufOG9KcJp7MhHETJH9m+UM8lI1UffwkR6SigX/rRr1ABUMJXFXiK+Zq+14JDg3hvKCAIG+r9bNG4cC4tJD/Ww+vIHU/VO5Ck8wnxQHl+/iz5SKxUIAMVbXnvEwO/Sw21ntovqKIkd6rdQm7cfeM8GkFVAjv1CRIblzr1n9ZoajlFRPFy31LJYHZ/oiCnnmI53xVDnqs1cqwetZY93WV0FsGi2+xJc66itr0wi3k08YOwogfvBEeiuszr/1r+aUTKYGO6JvuKOL1TFg0huAXd5sWoJhlCV+2U/LIluTLefMAHZqoLyt5/qDMNsXa7VN/eQIw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(136003)(39840400004)(376002)(346002)(109986016)(451199018)(86362001)(36756003)(186003)(66476007)(8676002)(316002)(4326008)(66946007)(70586007)(478600001)(2616005)(54906003)(1076003)(6506007)(26005)(6512007)(6486002)(6666004)(66556008)(38100700002)(4744005)(5660300002)(44832011)(41300700001)(8936002)(2906002)(266003)(37730700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FUfOcl4Yw5d5DCukcmKuhEhJ47PFlmnFLHtZabBGn524+70vPWH9ZolN1naa?=
 =?us-ascii?Q?Qzj+TzAr5N0viVv1Ky1HmcdwTKCNDOlqiBnfV4ZPQPANnpzDpQOxKfY+Z3xf?=
 =?us-ascii?Q?kQtABYwocIcGjYROYZkpVL5vfHQMP+FPVXtIQr52SS3mKsU/lY5JvEvUnxwH?=
 =?us-ascii?Q?d9Vbx5MMLHUXROzF997vFN8Z7ngCsqkldchHbl/R2oU4L63HHGj7i7/H0tU+?=
 =?us-ascii?Q?+yua12cdzMubEGacIEHzwei2pZY/LpoVn5bpOgh/YB/yUGKI3EQUuctabviq?=
 =?us-ascii?Q?3XjkPNZzSK33YiY4XVaIOSj3KmJSLRZKwMPlykPqLox3QofCAjrwt6+QNDpJ?=
 =?us-ascii?Q?Wu3e2TgUH2+M1248lZoY5mR0tPHQTJKV/v71tiEEZByGD52E+Eozuqzyt263?=
 =?us-ascii?Q?WHS+AQxI8viHQHAsRQsnpXq0ymuf4TZ+72FKNWKxwipYmYk+v0ljHSnf9pfK?=
 =?us-ascii?Q?/JrZHdHm5C3LI5pCdDTN0tOKQofTtRWxL66MfAfALWbIS2XB6iptUqBJ9WcD?=
 =?us-ascii?Q?qmA/wePz4ftkp3dcnm+9C2wp/P6fBz9oTbDjP5vOGbGrk2KHNTJYy8CHZXFz?=
 =?us-ascii?Q?A7i86O3vHq7KrDDtjwttqOe9JCHcABUgYPE/zCeIA4Fid3eg0kOlgKAgb6tK?=
 =?us-ascii?Q?+dCZvp3lTXMffijzf1UOPZVsFpDKzGFTFJs+YPpFTGpD+7Go4WZJ2Z7iT1MV?=
 =?us-ascii?Q?uwRF7ixEjeCSOxxq2H47PKIu74ZZ4jd5C1+lU3cMZzL7n4i+X037VKYoymUD?=
 =?us-ascii?Q?8SOLaKKLcBxuQkmZiq1BNfPFdAHHxVji8HoVpjo7WVFq9Bcu5VIDQCaC8zSe?=
 =?us-ascii?Q?BGqwsuvYBjeCT1uBSr+tx2GXc8BbSHT+3YJ4GjbC9BTQmB7vF4N68YdPvnh4?=
 =?us-ascii?Q?aO9PatamY/PyI+xLwRQLw8G5J/5oESvxIb0Xh2bmZHNISzOzifqjmueqLTRf?=
 =?us-ascii?Q?J5EfcyrXpA8jJoyri9SIVDv3t5hHPSlAsXg2/QtAkqhRIVl/fIvRyZuhqJ/p?=
 =?us-ascii?Q?hhxQPqDI/wEc8qesxMKvcR1yrjXGSoP+VBsn8rpaXfrfikWljcsI3Mcz6wB4?=
 =?us-ascii?Q?c2nCd9lbWtKDSTl3xndYfawqVex6OLrGi9l9Y7FMpV1SBBG32IC8KahLo+PM?=
 =?us-ascii?Q?z77e/LdARBRPc4Z1EJ4EM6xExUH4+ZoXxLKDyWf5OUjJHStOc9ZaeLGm2M3O?=
 =?us-ascii?Q?KCtTD1crqPvR0FrDygo6GG3Uy4R728vgZJVa7O+w4Rz7xjXQRbhdgDAaFmUD?=
 =?us-ascii?Q?QYWptOsQoky8fy3MF8aYqtiW9LHD+kyKcwgkKoZ6dMUxmy6qI5ICP4de93ph?=
 =?us-ascii?Q?SxIH8cnVLhURREssXkE6NkEjMwKPLY8UcS4oSWoTtI0l8Xio2GiVfMOzC7DO?=
 =?us-ascii?Q?bz0W2wAA/+peroVnnsJXe2RyHdEw43IsLTtbxLGMFNi3gKQWIWn/VomhJzzy?=
 =?us-ascii?Q?F2hbxVtuNOEGLD7MGsl0CyOqZvF+tgsZKJQMF8x5M1h7wVD9HTAVh/RAi4Aj?=
 =?us-ascii?Q?JH7uUIaTN1mDsUbK3AafW/jCH+mWDJ8gA8QXWAqst2Ko9sTozjL5sXvMNXaT?=
 =?us-ascii?Q?2rtkiHm1SqGIT0uK14eDQBotNUHW4gTqDUfGfnJlzuY+BEcKoGHhQzOb65q9?=
 =?us-ascii?Q?aQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 274d703e-4c2d-4ceb-5f6e-08db2addbb62
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 14:00:02.4088 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XBopHx9PjtC8RGFLRfFMMAR0fAHt9CrvfQGdex7sFB0bkZS+5/WV3C3ykrQ/QDy7fRzKUsZcRTXV6EFeggW/Fialg0VVtL3JnbbRW24EuWY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PRAP189MB1850
Received-SPF: pass client-ip=2a01:111:f400:7eaf::71a;
 envelope-from=sriram.yagnaraman@est.tech;
 helo=EUR03-AM7-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_HELO_PASS=-0.001,
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


