Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C63547B6E
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Jun 2022 20:13:29 +0200 (CEST)
Received: from localhost ([::1]:47664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0S5Y-0006tH-3U
	for lists+qemu-devel@lfdr.de; Sun, 12 Jun 2022 14:13:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i@zenithal.me>) id 1o0S3k-0004iF-8L
 for qemu-devel@nongnu.org; Sun, 12 Jun 2022 14:11:36 -0400
Received: from mail-tycjpn01on20715.outbound.protection.outlook.com
 ([2a01:111:f403:7010::715]:41615
 helo=JPN01-TYC-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i@zenithal.me>) id 1o0S3i-0005bz-OU
 for qemu-devel@nongnu.org; Sun, 12 Jun 2022 14:11:35 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ao32axUBCO/klzHhW4JhWoZQG7+bSNRn7+ZoytSlmdDXMxbpaaMB4WsNaw8yzEttPINzIyQHGFBXMrN35XkzvRONtbkQ/vdrAdxL5F2Enq8V6bvVvwCwTWsWNmiluun8Vr40TvUY7CCDyaP1WrQbbziYDdWJmAGLDm0JDN8ab3jF4AapQfuRpMmv10dQq2xFQP4wonscsYj4iKO69PkSoazinuzboUsKaj/7j1D60fKlN/WCfr1/7wqzMwH/sBvKnLgaXw9pM3Oj8Ed/Jk1us+VrcBxkQeE4G0J8ey9cCeqzLZdLXFcNYTjaFTkKwIh3x8qFEnuofOxGB6ihNYF1+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=28fPQPq5fYzVswU/w4rX/n8olAyXvdyvQZ01xyy0j+U=;
 b=Rms8b+uYmppIQ5VVMJc/9llj/l66tPesAd0H9UQOYHDOJ7jB1k9xk6NclifX1EUbQBnC5OuK0UERD9OSAQiNmvyX5ZR7+v+mclyyuGpyKZD6+PKQ4/tPTsPBf9Ry/8Aw6jVVvFemXITloVYZFvQydWqu6kFSA9MBmm4qXL4Ezbc3gLtGjaxlOLmWwEVcHeEuUcKGRGhlRK/hAI06dbSRZkFexJGc5uhNmVwXpX/NZnSU5+mr/sn+hiMbtszPQuMxg4cv79rHBOhYmrXi+FGR6zHX5F/J7BFwCNrw7hHC2fKPjjXhLpBIZPInHK8XH4TkrAvHRqUXZE8YJk3Ac2fTyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=zenithal.me; dmarc=pass action=none header.from=zenithal.me;
 dkim=pass header.d=zenithal.me; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zenithal.me;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=28fPQPq5fYzVswU/w4rX/n8olAyXvdyvQZ01xyy0j+U=;
 b=FrtN0VCI5G2kwzVRwcWLXseJz++GhlmNCbc5A5h7Km+wBz4V+cuP2Aq0JF5IDys6BKk7cnH+ybeXs1T+3vwjU1nzNAJY6baipngyD7pUsZgLH/j+crGTiSSNTQfG0MveYRJVAHLgD1CL1ZlWs42I5aRTfi/MJdvaWsR9rfLWPeQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=zenithal.me;
Received: from TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:c0::6) by
 TYBP286MB0320.JPNP286.PROD.OUTLOOK.COM (2603:1096:404:801c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Sun, 12 Jun
 2022 18:10:59 +0000
Received: from TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 ([fe80::a162:2f17:bb41:c95]) by TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 ([fe80::a162:2f17:bb41:c95%9]) with mapi id 15.20.5332.020; Sun, 12 Jun 2022
 18:10:58 +0000
Date: Mon, 13 Jun 2022 02:10:52 +0800
From: "Hongren (Zenithal) Zheng" <i@zenithal.me>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org, contact@canokeys.org,
 MkfsSion <myychina28759@gmail.com>
Subject: [PATCH 3/3] docs/system/devices/usb/canokey: remove limitations on
 qemu-xhci
Message-ID: <YqYsLI3EDWy/FeWB@Sun>
References: <YqYrIpNQHCBaOca5@Sun>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YqYrIpNQHCBaOca5@Sun>
X-Operating-System: Linux Sun 5.15.26 
X-Mailer: Mutt 2.2.1 (2022-02-19)
X-ClientProxiedBy: BYAPR08CA0044.namprd08.prod.outlook.com
 (2603:10b6:a03:117::21) To TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:c0::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c1e26edc-38e0-4712-e007-08da4c9ee6dd
X-MS-TrafficTypeDiagnostic: TYBP286MB0320:EE_
X-Microsoft-Antispam-PRVS: <TYBP286MB0320E4F2A902349DD22DFE13BCA89@TYBP286MB0320.JPNP286.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J0G5cU0QfeCw/FlRJUqremMPmhG49jpyU6gFtXrRQmP18DxWQxz1aI4EhiE3q5sHYkEfObMj2aYgnu2Ol319ACMFnkmUd0B27ve/RfDJzAwDRIfqx830PSR5yvC1vRppoijSS42KJg8KxwlexnJzfJgk8NbTG7YYWNk1jkMzonzwzi716wBVKu8dVkBLu6kIvm5e4PjA/SRa1FpnCdNp1dTc85IDBbuZsdzy5ohPIx0TccyLVUNRQFuj0SL9R7c9H5nFLcLC3NUWfAaRoAIjWjzJlEOsHmCCXNPmQF8e4ktjKMf5fKdUTZU08P0pbITjtrn/LAd7CUPzCN1TgKVzA7Z4BVB/hDNMhHSf67g3HR76FkWwfc9Sy6KJwYMqkCmEfj34ocze+Sr4GRRTbDW9Fn5NDVRPZA6u45/oO69R1dfUTjyzXrccPOykNmE6JTOb9cQVfydE4yFL77ePVAX/Rt6EWoZYztzRiz3H/8mG+bX9c3BFPznkRy8SlQb3UCu5MN1eZyUG4HG4Jkkzkk+rZm5B/jGivCESWwNDOcHhIW756sZLeXwk2eJGFyZj42RYyfNkKH8G1n3Q+166c8q2TDfiCSgmanSnCfSmDMOKAvjLCDaD9MCQLbGPgNdO0N+tS3jopS8Aksh4s6fQaPDVIpJ1981ZCvxw9ckI13btxZaPGf0WSNYOSmGzx8AehkS+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230016)(7916004)(396003)(136003)(39830400003)(366004)(346002)(33716001)(316002)(786003)(186003)(83380400001)(41300700001)(6916009)(8936002)(508600001)(5660300002)(4744005)(6486002)(4326008)(8676002)(66946007)(66556008)(66476007)(6666004)(2906002)(41320700001)(38100700002)(52116002)(6512007)(9686003)(6506007)(86362001)(49092004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Cp3XNwyXxl4L2YTkGy2BDfa0yyuCLhULnlB6LojMLjx4AHDEMzqquVLjsrWD?=
 =?us-ascii?Q?w5Clk9aHKCDnpA+eKu/k7/CUDKkxe1UY3TW+CIhz4AAbZYfgKT3P0BHfKLeA?=
 =?us-ascii?Q?ZpWKWeW6lExAN6B9V4FHBujAV3RgmKU2tuMbT8uEkR5BTq345aMULc1fHWgZ?=
 =?us-ascii?Q?JsCbUmovqHLp3W8kNZJBxo+WfxB9EHBhPAd75OwBOBdeo6b7YuzxP5icm/K6?=
 =?us-ascii?Q?8W0Al2kVeYrcmmwo1LGXofg2zRMq0bW8I6j6M6bqQ8ImjJky8VvroeX3gVZd?=
 =?us-ascii?Q?18j4PBb9ksFjgG8dk6Ip/MpChA7WPd6UyzDs6GO6lsJ9S7ooSN86cLwKnML2?=
 =?us-ascii?Q?suocH0dq3C+qWLENSemKmvl6BTQq3qjXRSpd2FVgFJdX8PxBPGHLEJqVhsOM?=
 =?us-ascii?Q?ILPOIPhzz8IEPlisvoZOS099Ss9AGKvPwekvPZDftCZkB+nuE2szu4WNls+i?=
 =?us-ascii?Q?qSIale66DDflZUkdWov7q6YUJN19yQHTnv1sxDC/OEl34H+CSiFsiJRsSL5y?=
 =?us-ascii?Q?BGsABre3bQmCk6M/fB6lQQnKgvVcCx+PZwv7VcnBre4k3/iY7x6uE61U4/6T?=
 =?us-ascii?Q?7IEl3Qaa9zJptACF/PXolJSMpBXoDwNwfmBQjLNtl9kSC7icoy3p+OvJ3XMa?=
 =?us-ascii?Q?P/HAZjrRfyTQQEnblEqowqG2vnoIoRzUAtVqhOhxlswYTATk1Y2uHvprD2E7?=
 =?us-ascii?Q?a126x/0CXbgQDIIM6iDlFRHVOhRLekuMTrPLCuEmEp3p5bZWLZ7jvKShW75Q?=
 =?us-ascii?Q?LP5cwh9VhOy2rJ+IwKIg2j5lcmlWazPkQ9BHKcKxxGLdRQFEbUVq8Vt/2209?=
 =?us-ascii?Q?14PP0yRKSExlmLnJHk7SGZPF5Y1xkmnW4engSrtnPKKj5a6LrJFnudRRNjcd?=
 =?us-ascii?Q?QT9v17QbS9hp4JEPOyNEM1sSI/wne69HnBSzxGU7DaXNJJAeq9t4054EJdmp?=
 =?us-ascii?Q?YQJSTPMArdHv4xnVMi/TmEYlO9EQGckv90n0pm38SI0RwdS/nvFNvVdp6vNL?=
 =?us-ascii?Q?QH6VDFkmFZZUIV00hUQHgIhSpVgduM1N8YEBJm5pry2rl38FrmhzuXkICYnX?=
 =?us-ascii?Q?vfPSN3iTh4Ro16VMPGKyuf/sZWnhP5s3Y/kmR87ccblQHh7u1gtKijZ2CW7q?=
 =?us-ascii?Q?uxjOdX2xj700fGvi5iAUqJmh/n07tobn0DiTBDHrS455nwu9ogjfItEjkwnp?=
 =?us-ascii?Q?c5BnNekTnIlNf9QFDqTPsK/Vt1Qrvgx8g2DGPhobPj/TlefWnNmLJ9nYZ2GM?=
 =?us-ascii?Q?/BFdjY0bfVR5L8327uTNOATRfi2odNGWZ5K+s+bI9RAiVGroKp2HHXR5hnoF?=
 =?us-ascii?Q?Zz+9b+Vx38R8KCTdhCm6W5Z4baqHLgCO50Z9xKeGjdHJruHdgcWcjbRJ84yj?=
 =?us-ascii?Q?bzpZMJhGpxUAJ2Dk35WWnq2S/NBdq1Jty8l2T+sCKVDSsWzcGMxN0/cVC0i3?=
 =?us-ascii?Q?FqHuoYvNrEHTJQzikL11NV2BKL1z/flxijGvChVZOLlZ38JidQ1YLMIc3IdW?=
 =?us-ascii?Q?d+6bALeTGHLuc032sepx7ImNdbOIcVboTy6gTBEKDsFCLr1cAEbbKSAlFLLY?=
 =?us-ascii?Q?bk4tFIi3RXE+185wo4AF1Dioo1PEwZT9cj1+LGzls9AU4v/ZdSIG0UCNqY7H?=
 =?us-ascii?Q?KYNwIeutdHhk+8tQs4lFnQT2vT+IkKb4DKwoxcFmLxK/c7KjKW8coQlV0aKh?=
 =?us-ascii?Q?BbO3e8uAA8OUImRzYjBzYfbc7skCE3D5groXvuOQ0QcuIrwkMhCsfPGhhIEO?=
 =?us-ascii?Q?AW3tFI7ZiQ=3D=3D?=
X-OriginatorOrg: zenithal.me
X-MS-Exchange-CrossTenant-Network-Message-Id: c1e26edc-38e0-4712-e007-08da4c9ee6dd
X-MS-Exchange-CrossTenant-AuthSource: TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2022 18:10:58.8816 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 436d481c-43b1-4418-8d7f-84c1e4887cf0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1GDLbznZgEz3ngDDdZWrMcNoCKDsRB0EjblLYxPQw06LX/lICJQ4Lw6SBtTbqvN8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYBP286MB0320
Received-SPF: pass client-ip=2a01:111:f403:7010::715;
 envelope-from=i@zenithal.me;
 helo=JPN01-TYC-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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

Signed-off-by: Hongren (Zenithal) Zheng <i@zenithal.me>
---
 docs/system/devices/canokey.rst | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/docs/system/devices/canokey.rst b/docs/system/devices/canokey.rst
index 169f99b8eb..c2c58ae3e7 100644
--- a/docs/system/devices/canokey.rst
+++ b/docs/system/devices/canokey.rst
@@ -146,16 +146,6 @@ multiple CanoKey QEMU running, namely you can not
 Also, there is no lock on canokey-file, thus two CanoKey QEMU instance
 can not read one canokey-file at the same time.
 
-Another limitation is that this device is not compatible with ``qemu-xhci``,
-in that this device would hang when there are FIDO2 packets (traffic on
-interrupt endpoints). If you do not use FIDO2 then it works as intended,
-but for full functionality you should use old uhci/ehci bus and attach canokey
-to it, for example
-
-.. parsed-literal::
-
-   |qemu_system| -device piix3-usb-uhci,id=uhci -device canokey,bus=uhci.0
-
 References
 ==========
 
-- 
2.35.1


