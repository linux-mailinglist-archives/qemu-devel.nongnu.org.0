Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 868825B7057
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Sep 2022 16:28:20 +0200 (CEST)
Received: from localhost ([::1]:50000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oY6tf-0003TX-4i
	for lists+qemu-devel@lfdr.de; Tue, 13 Sep 2022 10:28:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <taisei1212@outlook.jp>)
 id 1oY4lh-0002xV-MP
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 08:11:57 -0400
Received: from mail-psaapc01olkn20821.outbound.protection.outlook.com
 ([2a01:111:f400:feae::821]:42721
 helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <taisei1212@outlook.jp>)
 id 1oY4lf-0007TZ-UW
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 08:11:57 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mvfVCrMRXCqsP0neLjc/akAIRf3N65wba/uuoIs5eDQKWKqQrDxNTV7oDOu9EMUyIZX2yrKSUrAADU/Z04AGf7MAm8Aa7+af4ETW3hSaFkO25m9uWu9R4mVO5bC/IJCJxvGZhengFZ3IMW+Wb8mhU/SziYTfPWqSQ04ourYA2icpDrtEmumDYihAw9z82QylxO7pSCiokQDoHAhchlrxHsofO9Xn6Hc7j+JM6lSvf2jgrkcL8XO9xjoqorD358Rcs0SQZaJOhjIql5Ckc8oWAv3qcTj2QeNkZg9pXuvN1PeACZrvq2Sb6LPxPrQlAsZG1fdKEPLPv8/xoZSn5COyIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kbPsCvQA5S5AqiYqTN9738gwCWR9zK+4K3BkeUUzj/Y=;
 b=fNelnSOPELIV+GeTwJIYgVKZYWafDye3ERZ1cyxbtmX5L9UeNTHoMHlT0nlcTFGJfqr5xOUQ6XLWt+7JE5kvvGZA7avyg5thg6SMQf9ci8YdT+piMkrAAr07xw2lGgIfrs5QXIBgzYkGYTnmX6ZZSemaFUTBRPb58cGRtMqHWj4ziPmP1HShUBubkrERJxb/sZZKtI3qJRqdIAHvGU4jZv7jXGFsMveEywB9yE11mIJ75gpmWj0ly9IPJVEkSz8US/QqmA9dt/pmmN8dZw4POaMSP/HKerOBVdYgHz8Vk/MhgBFafb9yTNjdYer9GfFzdA9z+e9FM/dwt+ALhy5pyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from TY0PR0101MB4285.apcprd01.prod.exchangelabs.com
 (2603:1096:400:1b0::11) by SEYPR01MB4199.apcprd01.prod.exchangelabs.com
 (2603:1096:101:57::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Tue, 13 Sep
 2022 12:06:46 +0000
Received: from TY0PR0101MB4285.apcprd01.prod.exchangelabs.com
 ([fe80::8c3e:86b1:feb7:f027]) by
 TY0PR0101MB4285.apcprd01.prod.exchangelabs.com
 ([fe80::8c3e:86b1:feb7:f027%7]) with mapi id 15.20.5612.022; Tue, 13 Sep 2022
 12:06:46 +0000
From: TaiseiIto <taisei1212@outlook.jp>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, f4bug@amsat.org, TaiseiIto <taisei1212@outlook.jp>
Subject: [PATCH] gdb-xml: Fix size of EFER register on i386 architecture when
 debugged by GDB
Date: Tue, 13 Sep 2022 12:06:00 +0000
Message-ID: <TY0PR0101MB4285F637209075C9F65FCDA6A4479@TY0PR0101MB4285.apcprd01.prod.exchangelabs.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [XQF9Xe8mhZ0PhLMjTR7sk58TfKNH4sFm]
X-ClientProxiedBy: TYCPR01CA0046.jpnprd01.prod.outlook.com
 (2603:1096:405:1::34) To TY0PR0101MB4285.apcprd01.prod.exchangelabs.com
 (2603:1096:400:1b0::11)
X-Microsoft-Original-Message-ID: <20220913120600.13857-1-taisei1212@outlook.jp>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY0PR0101MB4285:EE_|SEYPR01MB4199:EE_
X-MS-Office365-Filtering-Correlation-Id: 188187f1-7d18-4c4e-3733-08da95806e13
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +bGYv8A7O6/C77EjxE1QXhiAmNmsI9Tg1FBR+BxjJCiA6I9x2g747rCJPk8WbqVxSawmFzHd00scfnYfp1I75nssTdggx0ZnJh1T1W13VIMHvOISpigmAtIp4yXT8EgbYEOc+TXwTbG1lDPGAinqZvKezyHdlQYZWadqBglmlQQ/D61nW06/l6SJeE6vXNoknDtG1E4Lv3Oku3V1scbpqAyhxwjo98j+l9lHBoYpV9M2vQrLtrx9CM1vYEz6zRedws+M4igDogcSVEzJZ3APsPrB2kcFe4IRMLfgM1/hoQfbTnYflv9SccpegWyY+WEmr2H2CJHmEDo1v6b+THVnfajFfnzWpl8+rvXKbZx8ePU7jIqXb6QEhlVjBBFfhGIbufAzd5c9ZwWeAww3gSv0ryjTSjdx9SEPd+FFJb5k/QruSqHsbHky3HduDnmC711n227strmankRzmJttyhb+CwLspE3LIidGBMJjjaM2tb2DM6tzrxwHTDZXxAn3tFmK+oCSqIi3AKMn5WPT+Lmpw5g+Hhs//cERaGACSc3oN8VEZsluxEqytdjvIN0hoBea2cion4Of1ahVF2FQERWbj7WrCsEw+mVk/X280KI+HWnzVxhGIroM3XaXKJSgJekCA5sgzRwiwRPR0lep8mgDZg==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?x9GgGIFMqZD5HWxDtwPDdFkZ3qjou7+veagQhgffx9YfF3tgMaG+Q378b3hi?=
 =?us-ascii?Q?BfW6VFkJ5YwkTMyF8ngl3nYx6fMam20K7XltaORgyYCcX8r+YLED3I6pKTKr?=
 =?us-ascii?Q?LrzTiOYLIAbYE2NGSvb9yousezd4X7gEbSyZsEB/VV9c0BwipAe7I8ihe8Ho?=
 =?us-ascii?Q?9pXOgSnjbSoSm5bQYThNc4q9rXRkFCiWk9cksvArXHEluVmlwIC0ZS/pTHR+?=
 =?us-ascii?Q?A9c/liCHyYB8x6I6zU1MUtr3LGPsfWWtaT/ARrT6MJAfoXCAbPKGvZwh3cZH?=
 =?us-ascii?Q?+PyLlteoJBEZWoIHlMFKuhQ2CxCrdE3xrOYGEApoWUKICdoGcy4s19Eh+cQd?=
 =?us-ascii?Q?eIQEM7ao2zgMj6HSUTJFSDKCnU3bR2/qFusJ8Rme2rfAhUMhSTVvsTPtLdBf?=
 =?us-ascii?Q?xH9DeThKliDBBQPNS3iNHBuxTSqdfLwi+tUG5+tG5wh8Rrz7mLJPtwCpz7no?=
 =?us-ascii?Q?0+rPdgXBfbk3p+/3XbbHy73TIZCZOHNaPttAj1rzCh/YwU+nU5FejACdlBuy?=
 =?us-ascii?Q?vO4RR0lHxfx8aDh4Xk4S4A6ECikiN05IGxQdoMJannv3nwaDV5cN7LyPD2+x?=
 =?us-ascii?Q?iKnOYJ+aZq9Fr8l3q7RHcXxXJgP71m2Ny/ajrR2LO6LopS9Uxy/ugIT2egfH?=
 =?us-ascii?Q?Ijmwag0OQ0EDVpVwawuEp7F8A8TgPs6x3E3z2xVayoAXoDWJnGHjWHcQftt1?=
 =?us-ascii?Q?6+aSm7yyGPMMcXHbCCGgIPPfcMrrXbu7f3h9JKDT2xV2Bbz+fVqgFjIuoTqV?=
 =?us-ascii?Q?9ytasgwRqXuekPua4a1/CMLN63GxD+TVVCknEUYj+jWC+h0iJ6fmyq+yrvB6?=
 =?us-ascii?Q?n7o26qTlzt/8Wyqhs5Yoaq7jXulyXS+2Z1+db4LcCO3957uyeT/iqMH76Eot?=
 =?us-ascii?Q?PYhiedAqmMA6kem5eSRa+p7BHAwpOE4ooT+bS1buKJiDGh3qMXjidF1Yrwpm?=
 =?us-ascii?Q?dT2tdmuZkaXo/uXY7TeK4qAOumXHWDx8sm1ed0flzmqvrP1Tbn1Tfmf7xMqa?=
 =?us-ascii?Q?jBe9Nm+V8vd+IANi9G9YsfYaQkZ5Msi8Azdh7K9vE2sXPnmCIpN2fcWbJq5t?=
 =?us-ascii?Q?BX2nCmWd6TYup4bFT2mRsrlUXqXwLzUgvEHuzT9gepovUu1KSM2mr9Pa7/73?=
 =?us-ascii?Q?+NiujwpIWXO50qHlbNwZmuOubuqTitxV5FPRq3GCIsvBFGq+1E8nNzO555/F?=
 =?us-ascii?Q?KgoM83wAJjN9WTIET+6PWpgFJg3FTa5sX15jbXqzsyEHxh0QajDSPzU6yKWO?=
 =?us-ascii?Q?OGdoLSqtSgqRq+wUzrpNj6VHADVJYFsE0mDo/VRqug=3D=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-d8e84.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 188187f1-7d18-4c4e-3733-08da95806e13
X-MS-Exchange-CrossTenant-AuthSource: TY0PR0101MB4285.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2022 12:06:46.5358 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR01MB4199
Received-SPF: pass client-ip=2a01:111:f400:feae::821;
 envelope-from=taisei1212@outlook.jp;
 helo=APC01-PSA-obe.outbound.protection.outlook.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FROM=0.001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 13 Sep 2022 10:25:23 -0400
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

Before this commit, there were contradictory descriptions about size of EFER
register.
Line 113 says the size is 8 bytes.
Line 129 says the size is 4 bytes.

As a result, when GDB is debugging an OS running on QEMU, the GDB cannot
read 'g' packets correctly. This 'g' packet transmits values of each
registers of machine emulated by QEMU to GDB. QEMU, the packet sender,
assign 4 bytes for EFER in 'g' packet based on the line 113.
GDB, the packet receiver, extract 8 bytes for EFER in 'g' packet based on
the line 129. Therefore, all registers located behind EFER in 'g' packet
has been shifted 4 bytes in GDB.

After this commit, GDB can read 'g' packets correctly.

Signed-off-by: TaiseiIto <taisei1212@outlook.jp>
---
 gdb-xml/i386-32bit.xml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/gdb-xml/i386-32bit.xml b/gdb-xml/i386-32bit.xml
index 872fcea9c2..7a66a02b67 100644
--- a/gdb-xml/i386-32bit.xml
+++ b/gdb-xml/i386-32bit.xml
@@ -110,7 +110,7 @@
 	<field name="PKE" start="22" end="22"/>
   </flags>
 
-  <flags id="i386_efer" size="8">
+  <flags id="i386_efer" size="4">
 	<field name="TCE" start="15" end="15"/>
 	<field name="FFXSR" start="14" end="14"/>
 	<field name="LMSLE" start="13" end="13"/>
-- 
2.34.1


