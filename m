Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D3448DD8C
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 19:18:00 +0100 (CET)
Received: from localhost ([::1]:59808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n84ff-0004Sx-OX
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 13:17:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i@zenithal.me>) id 1n84aW-0001t6-Bq
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 13:12:40 -0500
Received: from [2a01:111:f403:7010::730] (port=41879
 helo=JPN01-TYC-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i@zenithal.me>) id 1n84aU-0001yL-Km
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 13:12:39 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GnEQoQHbBpkjsLqm2YxAwyVvKdaZrJRWt5QwmoMtIkDwitXNbthds20Y7oWmafsIdKKLHI4UZIyhYfyYRLPTcip2FrEIWJQ8elBgOeAQ9oiRArNwxIUKaS7/CpS7XmMpm+LeKB3adB5cBr+eKJa/IbfH4kq/m8fBsyVbQ8htH0EwCa7DnRyKcPDn4sjvOnIVXVKynzZ1pPv8X+8CS8dV+xw7vAUdPFX1vQ0FbHP0mZ7/rALWuCy+jdIF92c0hbJzc1/g6jJDLh+MuRoLkpZcm2ky6MM8PwG14RuGsI7HQbph5AsBC0nM87bzL2pU+BJviPf/PGYoYWaDIFLFFhOQuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xe9iOLv7iamUXphV6+faF9atlrqNzbnQ47tgV+SXHzw=;
 b=WtFtzAqKmVCZNvf8/aiQM+HFBeUl4NjpxyHpL+wqzgbFy18UPOI177HtOcTqfQu/fEaHb6+5TD9AE+5cklhmwdS7ySsUrgpBX1W5m8eA9wgUBR5oCz8x4xWBAelx/eU+/QkRWGiz0JkKa+DUrqcmK9LCaV2dhYnvHmZl1u7825SJ5HsZUZ10wt6nnQBJUa3N9d7Bm6SZ43KqxesT/BUl5wkiIEccre4TCgH2EP9SFmrZd0hzhMqVrr+zW19mwwfNGyCjJ/qj3kFWK3T+g5kbYwDje3EdMvtLSm8d4628QqnG7GMEV/OjTlO0GZUaoAK6TN9ugjbZ1NG0h1DWVcEc2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=zenithal.me; dmarc=pass action=none header.from=zenithal.me;
 dkim=pass header.d=zenithal.me; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zenithal.me;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xe9iOLv7iamUXphV6+faF9atlrqNzbnQ47tgV+SXHzw=;
 b=ThiBbyWZbr+ZGWJ0Z1I+sF0W8EgXwXZ3zqThGVCPvksYvfmN5nsgXpDxTBvbAjtaQXZTT0qM/NHB5tM1XoJP3nddL3RkuU0ZpmGFaPhCQEfjt7bNJZBoImR2B7njjNKwYzh+Kd7iY9Cwrsl85Cf8YFNU7fAk3wg35hUyn4w63q0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=zenithal.me;
Received: from TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:c0::6) by
 OSZP286MB1166.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:13b::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4888.9; Thu, 13 Jan 2022 18:12:14 +0000
Received: from TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 ([fe80::5cf9:8c86:9001:90d9]) by TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 ([fe80::5cf9:8c86:9001:90d9%8]) with mapi id 15.20.4888.011; Thu, 13 Jan 2022
 18:12:14 +0000
Date: Fri, 14 Jan 2022 02:12:12 +0800
From: "Hongren (Zenithal) Zheng" <i@zenithal.me>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 6/6] MAINTAINERS: add myself as CanoKey maintainer
Message-ID: <YeBrfDkT4ZBgJRPa@Sun>
References: <YeBqg2AmIVYkrJcD@Sun>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YeBqg2AmIVYkrJcD@Sun>
X-Operating-System: Linux Sun 5.10.81 
X-Mailer: Mutt 2.1.5 (2021-12-30)
X-ClientProxiedBy: HK2PR04CA0046.apcprd04.prod.outlook.com
 (2603:1096:202:14::14) To TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:c0::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 47549bfa-2b76-4531-b82a-08d9d6c03a18
X-MS-TrafficTypeDiagnostic: OSZP286MB1166:EE_
X-Microsoft-Antispam-PRVS: <OSZP286MB11668EE842D1EA281A4EC6FDBC539@OSZP286MB1166.JPNP286.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:214;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kHLSakfvpkJj4TMSLHjnsj5kwmKXWYtrX+MaH+1dOI6nqJjkeo5K4eW2Nl0zXcdreHiCwsgWxbDOI/lo4/7V6p7EBaZLeYeBAYstEok7phhCSrsL8EF3NaXdvXhxFuGKcuYPMf5uv2myVL01ZqGBC1xnQvwKz/MVXE9vOE3yZabjqRwaBzO3PhIu7QD4HIeZQ7F7OciWqqFT3y1NvwsZSC4alhcO8RKhnne10TLP8f5xrjav1PVC2qUKz362dhv0MKdwjxEfkSM0podxNaq6hz9od/MAKeOCwZBDhR6d6Wh+LseP6pImXLUuvM/7qt6T2IjvR7gjBkBrC1Dv6mMPU0sxAIoxAVsur3UKq+GkojFI1K0DHT99BMT77JkCwkLgXxkyd2ie2npF81JAS6O7jUh8zOLaLtu/Rh99sWa+v4fzaimYOQ3x53qZDYvxAExJoJzsZ+yJcZxYFVkYzhfwkdSt/H28m/wntv7VK19kvYu/QHdOKMHS4/KfGTQc7M9J/BCGVSBDGdwt6iaFBx5QT9zrRiFi9itwIVADbgt6KwETkNkQoczi581GVQ1vmAnc0WEStwX2rSpble+9HMLkaX/te+2jPzEPOuuUD87msNZINANdfJBNf/ShWJIcChvtTwJZXYRBaSQ3PplpwZW2DmBQ0gh76lCh7FGe9+YjSaiCbIMz4iRUorIoiVslPu7isHpc6rKrXVRQhwIei5FVaQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(7916004)(396003)(346002)(39830400003)(366004)(136003)(376002)(6486002)(54906003)(8676002)(186003)(4326008)(52116002)(4744005)(5660300002)(8936002)(6506007)(2906002)(38100700002)(66946007)(66556008)(66476007)(316002)(9686003)(6916009)(6512007)(86362001)(508600001)(33716001)(786003)(49092004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bAxXxaO3/W0rr+yJVeCUUGzsRX0m2pEgT1pFIoD+5XNiACUO4Q84JioZtodk?=
 =?us-ascii?Q?4Kv5SJxxzOjDZ6LiRjC+qYjA2SpyojHPJkRrGJTVmsLVIkfbmyN5V4gq6QLE?=
 =?us-ascii?Q?6jOFszYp/GO5BXHFLDQPt74baghwAT+B4axMw3zKhMoVN2g1SvSRfAlvipSo?=
 =?us-ascii?Q?FDPHUnG0cULFpCGbDYngM0pKaGoRhVveEP2SLkrjuW97/ITnc6LpK1mTK2+I?=
 =?us-ascii?Q?nyHUn/f7SoeaoY0ZoukHepf1tvyI7PhEkRwPMvgFuQTUJcYMS2KeUM/FRhSM?=
 =?us-ascii?Q?W6gPWbtLT+hB7pnipjJXDzqRPrxS06beCawyuXwVBrzt+rfoA69HmNfXii9g?=
 =?us-ascii?Q?ljJXrTBk40b3bFq3LpcMHg/bHtlvpef12quRchtevZqD0uRxkbDoPRRvIZZK?=
 =?us-ascii?Q?fiIIKHaugTVlWZ76Nwn4SOWlb4iUKp9SyxlPsONbGt/oHSFaGKGY9kgA01C4?=
 =?us-ascii?Q?Pumm9xsxsU/5TiC7i+kH7cast13lyimEdlBlb4VPnzmvMujHwGVx/Be+Qeww?=
 =?us-ascii?Q?QzGLoMcsUJAB+kKROxFwtt5qiximvaGZatm4jor9WBZ63mkAM+A5Vsh+LfoL?=
 =?us-ascii?Q?xC5VBADTOJ2OA/yDgDjSmPSEe3PvdyVwZhIeuCiBZa2uZGJSH8WGpmkTcNmI?=
 =?us-ascii?Q?Lw7CN/uKFBI2T6Y6jaVuvNQ6MV+re/0nSqDKALdnsBEe4QEjadM8U4BE4gEP?=
 =?us-ascii?Q?c4DeJ0G3LipvtZ1YXFwwNhHCf4OfjJ/RqdQBHiEHyEukrBtB59MDRruwffts?=
 =?us-ascii?Q?t5z93YcmtWIJSotF1NUOQ0mfuaLBHKheraJt5LUlhyhr0uzvGZ7wtDjjhos6?=
 =?us-ascii?Q?KN9KM+CWQ49bgaZePfxYnE50OLSIQIFU9mCIEoDNBvBXmzKcYwKflQFv56Ke?=
 =?us-ascii?Q?jPT7ZWyMUUzunmuleUqLgtX5eERdowYz0Gqel9H1jMKVdIUAg4ziPDOoUynm?=
 =?us-ascii?Q?uDOpZkD98+tr7SUgXkaCDC0weFT/jHHoE6bOEP02Z8TnTxA5rSXtaA9iKc9C?=
 =?us-ascii?Q?5tSwVG2R4vXiY/SR99+GU1NzV/GRsWeVpWX/mZK8CmENbS1FwliTjzOf5zFU?=
 =?us-ascii?Q?f5ZPDXYjvVtD5ZyAZ8qaJ2Qz1bDHIrTGoKsXRz+vS4lz+1r+v/my02cfGPGI?=
 =?us-ascii?Q?fwOhpTDTquIjd7lWu/CzuNtDnPkcOIABf+aV5GtvhstTbn9hZEwmFtj5Y5e5?=
 =?us-ascii?Q?kgx/F11c7TkMVi0f2zpumcFH17/bx84bmNdGJvt73piDAS7HipZDeZbnGPt0?=
 =?us-ascii?Q?GKbqNd1VhF/j69BYcLYLEcTUskrpBevYX9QN8lPTLFr+x3xdWz+gsiK1bVBR?=
 =?us-ascii?Q?0fCKAZ0ZR4usT0hyF/jASe+rwOml+kPEUhbvviWi/oNHkVb6MjDGOBIW0Rzl?=
 =?us-ascii?Q?lyhaUBw8Z0jYm4QiV5gkGb539/xma+TJKGFfWhbJcjOiaSD+XRBrTZFxFtEK?=
 =?us-ascii?Q?soJUudHocBqwahKI2JYQmuvk1XmlfXduOTIt/jpL70VDqul+fxy92iy/NxA7?=
 =?us-ascii?Q?qEgzIUPBNDCfIYcJAODErf2yqdl3Mexnzmizyc2/RixGgAXhuSqp0xqH9OG6?=
 =?us-ascii?Q?TsubZZ2DP+kEF/WIauA3ecfXf2msirzeU5F7LzLG?=
X-OriginatorOrg: zenithal.me
X-MS-Exchange-CrossTenant-Network-Message-Id: 47549bfa-2b76-4531-b82a-08d9d6c03a18
X-MS-Exchange-CrossTenant-AuthSource: TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2022 18:12:14.7648 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 436d481c-43b1-4418-8d7f-84c1e4887cf0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uGZXSdvqkalQG9fAsuieArTyzwtFTpu/XvdVb7rHjxNt2pfR0xvX+7CXbAp1vtbN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZP286MB1166
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f403:7010::730
 (failed)
Received-SPF: pass client-ip=2a01:111:f403:7010::730;
 envelope-from=i@zenithal.me;
 helo=JPN01-TYC-obe.outbound.protection.outlook.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 contact@canokeys.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Hongren (Zenithal) Zheng <i@zenithal.me>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f871d759fd..51dae611fa 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2296,6 +2296,14 @@ F: hw/timer/mips_gictimer.c
 F: include/hw/intc/mips_gic.h
 F: include/hw/timer/mips_gictimer.h
 
+CanoKey
+M: Hongren (Zenithal) Zheng <i@zenithal.me>
+S: Maintained
+R: Canokeys.org <contact@canokeys.org>
+F: hw/usb/canokey.c
+F: hw/usb/canokey.h
+F: docs/canokey.txt
+
 Subsystems
 ----------
 Overall Audio backends
-- 
2.34.1


