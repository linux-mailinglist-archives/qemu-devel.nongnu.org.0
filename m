Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F18696B6BD7
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Mar 2023 22:47:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbTVw-0000Q6-Hu; Sun, 12 Mar 2023 17:46:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pbTVu-0000Pr-Eh
 for qemu-devel@nongnu.org; Sun, 12 Mar 2023 17:45:58 -0400
Received: from mail-db8eur05on20729.outbound.protection.outlook.com
 ([2a01:111:f400:7e1a::729]
 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pbTVr-0004XO-UH
 for qemu-devel@nongnu.org; Sun, 12 Mar 2023 17:45:57 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oZLnawpPQYX9owvIvktAX/f8RN7T6K0W+FMFBOfePVXerjATgcv0yxa1t8KMAbhX0aKS2TERS8r7MyINlS23NcgJs6KMV4qxYujBoR6rBMpTa6sUeSu/ixsFi/0J2G67p+3VRQRVdRw42YIlw6zCtAnGOHtZnTo7vBvTH2D1CAH10hxpiIvX06IWEh5nBUfLudWOa5kPJWpw3aNA3C8AEDuuAtbR0TvHPSxF14qOmhah4jHlqizjuC5+tPpMUhsRFxcCF9OnUZLF/KCQhsAzbBHu+/YFVy53lD9xMd6ssPHZVYi8lVCw0MzQfqsOq491uVM3qPwuY8tSh3v3Uaw4ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dhFGf4IR56Wv8uaoyJ0mtv2vpkfLmfqXBDBN8lOtdPw=;
 b=n0Fe8moGmQp81NiCLs4AacAwDBNxZhXVl1jvkldviLi2RfFOuwgixPewkuptkLgI1jsVmUZaR2RQHj5KFJzXSB3QBP1+HGox0EggBwdktDd1xCh9k3+FeA9QIRQ3xGxWN2dJs4BQ7YGbfH/pd5kIKkar+Z65W6wT8XjOBiStj6hJZSw5oPs38a6VWZE3Mam3XBJaKzEbzuiekxx1wmDibNRKhKNLofnkd6cRWBGzG0huHpMXgqFI0F7a1bIv6M7T9+hRm79tYeiWJA0+ulzytDPZSkwJVYeWXLJn2GcD0kjivsDE8aeFbJhb3/nF5/AiKsmM8adxs0Z0G5kvlRAyYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dhFGf4IR56Wv8uaoyJ0mtv2vpkfLmfqXBDBN8lOtdPw=;
 b=iWtEcnTDxKebdPkOKPDcDfZT6WGoQPVoM2PFT1H0PJzkUXxAp0AK2y4Itk/e1Uao2H0bTZS7XO9YAQlQkv3TfhVkN8j7YqnHxORL0K4E9NwOMFVuARqywCTaV9MNQYG8Rp4xNxyFR62Z3bMRmpZT3z2Iz/wf1RAdEqlm+Ss3W3s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by AS4P189MB2207.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:58e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Sun, 12 Mar
 2023 21:45:44 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::13ad:a312:15c6:91dc]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::13ad:a312:15c6:91dc%9]) with mapi id 15.20.6178.024; Sun, 12 Mar 2023
 21:45:44 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: 
Cc: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Subject: [PATCH v7 1/8] MAINTAINERS: Add Sriram Yagnaraman as a igb reviewer
Date: Thu,  9 Mar 2023 23:00:05 +0100
Message-Id: <20230309220012.25642-2-sriram.yagnaraman@est.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230309220012.25642-1-sriram.yagnaraman@est.tech>
References: <20230309220012.25642-1-sriram.yagnaraman@est.tech>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0095.SWEP280.PROD.OUTLOOK.COM (2603:10a6:150:8::6)
 To DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:1e7::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBP189MB1433:EE_|AS4P189MB2207:EE_
X-MS-Office365-Filtering-Correlation-Id: 779ad7d0-8aac-41b8-1bd5-08db23432154
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NZ+MjFje5mSR/843/hldYeEH5SKXSSw7uWEFCVfa8wpzlZ8eadbbX6EJrCRLbW4aH16XGDhvfOHs9dGLes52qt2YZOZ4xLgGIxH/JZig9BKTQ7QeMwnlWyz1Iug21KN9pZu/+mNfqN61R2AzaVnvRkmcGenKFtBgTk9iHijcu1Uy5+5DhpqfkUQtJovE5pw3RR1+MBv2XI5VfIdIEtxd0GQF6Qh7RH2GnMlLa98nTDY64eL0um40rb7v1t8X0aHywTQzydxhDYaKkKilnVj252QuFSqjMpK7CIA79KcjRWn9mB+7AcsTkradP2NLJvIZFosDLhIBpQBoJDXaRKv8JoaPf8mCt91rPSi00f2ALDlJaMbHpvMYOn4jSdLZlxYsd6t1ZLGCK+joGnm7zWCzTptaXIWf4NdXMZiHf9au9bORFs2OEr4H8E4YlSCAWq5jEFMiNZSb+QRxeRzSPqMj/Zpoj3amhDGP4/Nz4urnirRytzZBfgasCWBv0fFkDd/ZMu7tD6eYzr7cJY3gdY8iEd2/Ypcp3CJVY5lxoupQcyVnKGNbC04+Nmst61iX+1qOQYUEc2js7zV/ybZJzuobQJqCyCvqVO59ybXPigEsVIaqECn3Hl4fW5EGbYDIWHa+J30lSbdyeThhGNIWIoYCFHFeN62/d7UcDJQvQ7G8C/eBDwLpKB3KZaCM89eVTi4/+5dx1LpK/ftQ/ygUM425CZJpeSorAEpEA6JSQas/XEQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(396003)(136003)(39830400003)(346002)(451199018)(109986016)(86362001)(36756003)(38100700002)(4326008)(70586007)(8676002)(66946007)(66556008)(66476007)(41300700001)(8936002)(54906003)(478600001)(316002)(4744005)(44832011)(5660300002)(2906002)(2616005)(6506007)(6486002)(186003)(6666004)(6512007)(1076003)(26005)(266003)(37730700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nGB7WEfR9ShHXzI+6BHokFQextHiC0ALyk2M67M+pcJj7JFqClQ2qV3aKLCm?=
 =?us-ascii?Q?iZEATSPLK4sIPxs0Qr7RQLqKUd+EdzAxqXJZmTMArW0/yxU0DcqfcMrg+NU6?=
 =?us-ascii?Q?NvnwEs0FY15mvczZAY0Q6eLF6cnpqcY+DLXiMAabkOp8Fr4/O0wdiyRhbA/W?=
 =?us-ascii?Q?kTuSW2gUkNH3XlLWaa+JZI6d2im5akWxzcPaSA1Mhxp0oca0XlY3FghXTtIC?=
 =?us-ascii?Q?tLi6OAO1gurN/7H2KdZ9cLP8pjy694ztktYXtjr3LL7Hhqvt623FyIsNJ2Wr?=
 =?us-ascii?Q?cHS8wU7dfFeL7tLWReCOJYqds1im509G5bQ5vWjc1Q71Ho1v8GMHZ9pqZQ89?=
 =?us-ascii?Q?GqoluRi+k5snsDqcPVIkVYbb4X0ZOsI0+FCdUUR5M6s/u0XCSns/VtvLT3oW?=
 =?us-ascii?Q?MBIS5c4PEVFpGmNbp1KOqfN48rQeEG+ecfxPH8+yUBwqDbMr4y/LC23n6w5T?=
 =?us-ascii?Q?q4G3h2z1jV+2tr/+z20ljUfV2tGNfcbpCKuJtYjU9gQkulZgmSTpHxCqiX7o?=
 =?us-ascii?Q?oO4C/psaL4Fex5Xk4vI+n1tz1igr7+7wovlF6Z5UO8MBsTVLhWnACPRhz5wO?=
 =?us-ascii?Q?GpXYq0/FieNPElk76AMPS6SjCO2aKH7G4mL6zaKO9QaBe/FAA7K61Y37VPsH?=
 =?us-ascii?Q?Oh5exiNDNpQucsqav39KHcCEoo5sk/FFczdc5UdBn0zn2j29+lHIfIaZ2hsf?=
 =?us-ascii?Q?Yk1HyuWTJR47D8kvxrDwhIsb+f4dKb5ld+ziZVcB5fccJoyQAFpUWoEY2n+E?=
 =?us-ascii?Q?6O0nFXx8ieKcYTQgMBoYdqQ47SGqzEcnh1DTY/Vd189AJRawz+O9JiyyleuK?=
 =?us-ascii?Q?DaKCfNs2V7y++5IFmtRxlUP5Xe4RMocTQLUo/YS0UPAGBwNfgiiAKw//z78j?=
 =?us-ascii?Q?7UGUT/vklz6nLeOBRt8Ht3o8dArQvHB+D3ucD82fTq5J7dIpCpSWiu1VsQvK?=
 =?us-ascii?Q?VEtFW8BFP7HjF50nHu45gaKQFyx5gkJddLV03pbhYcjB98XgjCr2DxBj66wX?=
 =?us-ascii?Q?RFKUzc9FWfCAAFMKKjWjoBmAa/XSghdDLg7EGpcpu+vOXlzp3g2t8fYSs3v7?=
 =?us-ascii?Q?IbW4jNhXziGRBmWtp8+E9SZ6YvMK9voJ8vpF2YYMj2nUDgnO6zlNYixaEvGx?=
 =?us-ascii?Q?Vtq3hPOIvNn27bG0tzUYO25u73bFnWG/p7KRbHrV/kFn8Lir05nIzHLV/z1r?=
 =?us-ascii?Q?uBM6UeyxXexNo1DvuMhajiQxotmDqbnfF1az68abMxvQOPyJFZLWqtAd+YXB?=
 =?us-ascii?Q?guQBys7Mrok8V7BxVrVfDU5FdxB5lX7ILWmcdJNqlJFCOpuWe/eaVzsdz217?=
 =?us-ascii?Q?l2qAjYLxIFYrO5eTAZW1iQE/GDjxh0ogUK+YRtNFs9sMJS684r+otxQsjrg7?=
 =?us-ascii?Q?UiztLLYgEC7auUhwC2xs2QQuG4W8gLbLVPnvkojb648MGs70IqK9V6tf4crR?=
 =?us-ascii?Q?h3moXAWjvBigzuQ6UkSrQoV76Sj2fyw+Xvx+iIFSezdSd1dNrC+Y4Z6i4BBY?=
 =?us-ascii?Q?c8UYQL2GDcYYd2KUSGhcSQOZojLEp+s8fUb/9IMwiToOTEpuuHVyLAS3ab8j?=
 =?us-ascii?Q?44jNBUUhQEVgdcUpKShT0bmykYaF7g9G4X6uJP8pX7BytG4dm4NhnrVCYgZo?=
 =?us-ascii?Q?GA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 779ad7d0-8aac-41b8-1bd5-08db23432154
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2023 21:45:43.4185 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jUff1ooqFHF2MRFguNuV6t4Qk2XesyQ2kvLOhnMSaR+9H0mnvmcBDOtIfwkiUcT9BzMDMI3/kAOHnrOHIRV3g6c6aL5/YADlh7dS2HSuaqo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4P189MB2207
Received-SPF: pass client-ip=2a01:111:f400:7e1a::729;
 envelope-from=sriram.yagnaraman@est.tech;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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
index 95c957d587..70685c9dab 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2251,6 +2251,7 @@ F: tests/qtest/libqos/e1000e.*
 
 igb
 M: Akihiko Odaki <akihiko.odaki@daynix.com>
+R: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
 S: Maintained
 F: docs/system/devices/igb.rst
 F: hw/net/igb*
-- 
2.34.1


