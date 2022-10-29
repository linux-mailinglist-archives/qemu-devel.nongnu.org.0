Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6255A611F5D
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Oct 2022 04:40:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oobkB-0006wC-0X; Fri, 28 Oct 2022 22:38:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <taisei1212@outlook.jp>)
 id 1oobg5-0003As-DY
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 22:34:29 -0400
Received: from mail-tyzapc01olkn20827.outbound.protection.outlook.com
 ([2a01:111:f403:704b::827]
 helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <taisei1212@outlook.jp>)
 id 1oobg3-0007Zp-0o
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 22:34:29 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P5LH0BRRU3VcNe1Fj3jP7ncK+JYhB1EWW8aRNQYhPkU60RQ8TQnlm4OsNpXKdLWlNrrJEHedo2CfNJNfSBhEXDt5lfXQ+F2fusX9A9E45sUkfNHpV3CaUDtBXjhc+cSn1v4YF3UoPWOLUg2ws2x8EzllsoSuIDQG2Xk0jyhaWHzGMLlNxg/bimGk6s5SGeVWY0GSU9XjtP/0O+tA962uiDjntcLQYlxlUNVme8z1nmbKvo8p/m3Oamq5zxs5ZhMYTHbtT9lAW9MDq8KQg8VDRU+Yj9/LW29cKGAdA91Sx0SJ2uUYdAiMTtD5hcJZ4ikEWed2qz4Xgv/Pl3KBAtwcUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ffemJ4AYzGIgtgpXBmoRFetlyQyp0g7SFJTwlVMWLs8=;
 b=mfr+Kj082VrbW0UDYwLeS3ypqhPAMGB+J6WChZS/cx/TK8z6K2p5iwQs22FRJmsf76JcCG5hl4enKhMtvk5WvVUXWr9KFYnQnjxaT/YLOQbq6WfGaVre9D+u5gLhGs+DernwTvLuWIA54VMo4bPBN5pA2Vn5rI9YVCdR1bX3lIrdBk85vC/5Pfjr6KAPxA5Bsqi8y8q5tvSzBBQbd06IlyZOzbqxQzTanJidYpPOtoG9FCxM98SweTGdAUkETLwGItO7M4nwPHf4ZhHMj/ok3B2ngqF7zjCW5O+yPRxOjNA40LCCgllyTEWnQVyxJ0taR3eLoJzKihdGiz6AaJkpFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from TY0PR0101MB4285.apcprd01.prod.exchangelabs.com
 (2603:1096:400:1b0::11) by TY0PR0101MB4119.apcprd01.prod.exchangelabs.com
 (2603:1096:400:1bd::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15; Sat, 29 Oct
 2022 02:29:17 +0000
Received: from TY0PR0101MB4285.apcprd01.prod.exchangelabs.com
 ([fe80::847c:70a1:e7f5:2a4b]) by
 TY0PR0101MB4285.apcprd01.prod.exchangelabs.com
 ([fe80::847c:70a1:e7f5:2a4b%3]) with mapi id 15.20.5769.015; Sat, 29 Oct 2022
 02:29:17 +0000
From: TaiseiIto <taisei1212@outlook.jp>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, f4bug@amsat.org, TaiseiIto <taisei1212@outlook.jp>
Subject: [PATCH] [PING^3] gdb-xml: Fix size of EFER register on i386
 architecture when debugged by GDB
Date: Sat, 29 Oct 2022 11:28:51 +0900
Message-ID: <TY0PR0101MB4285F4F5B75AB31F7FCCE751A4359@TY0PR0101MB4285.apcprd01.prod.exchangelabs.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [7vBpAQhtyCifTkI5xD4NluznFdFom41f]
X-ClientProxiedBy: TYCP286CA0086.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b3::12) To TY0PR0101MB4285.apcprd01.prod.exchangelabs.com
 (2603:1096:400:1b0::11)
X-Microsoft-Original-Message-ID: <20221029022851.751-1-taisei1212@outlook.jp>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY0PR0101MB4285:EE_|TY0PR0101MB4119:EE_
X-MS-Office365-Filtering-Correlation-Id: ca420140-9b52-46ac-3545-08dab95560de
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ezB5tXjNZnRaLVexQN94sAK4BjMhWkmRnhQsn4cptQfN/Rg8cPfI2sIQTOv5QuVxuZUSNSr7p2VFv/omxIGzNFbz81OajRg87LMexlLxkTew+ucXR0XPRHTgRx7+JpYpO9SUFq4FvWgCIZCYcx5BmRfxpSZHFjP5mqIA8kcBAEGywM8/tJf+rheaTt4mSLnMKj/BlqyN+aojjBDIXw8+rsx/nCYmYXSynnOdEEuo6MyGRgaaeLyY3V+kcH1ZJVx257zSasrZb71HbxI8SWlvyxxdaGdJIIQZgPa2FzmZsyoYgOBiAqXPmWMMkxo7ZT2qnRUCjAVPkNcWDjegth2LX1R9LWsylI9cEqlck520lsw42FJH3nvcg378bi+ZNpOKo0HGm+WqK9uzrBYifqregzvYnqwMA7O8rtAHEMdBeu7rAfItzwBQGxZNJmt/yqngVA5Vv8DxJcf2Tmzaipjr7klsxtxohxAa6tbzZhhDFY1j60qqIJUE8PWrKI0WcJsX4n/ihmuori3hcl/3ycS12zfOOHzFj0fa4nvC2HVDmmWCajF7CYGsfqoO5aFPouQxoJq8n0wXR0ZdK5Ir7SH9pgrCJW0qZIPGMjp4PR6MrwLCbXqBzu1Zz+ne2Sn2iVYZ4oyJbeNZ9VJeD6k+ObhC4q/J8+CP0b+7H5Uv7VcNogJcV90+n52JA1vjmwvbXe9MHreiW9sM296qlB7TcJkB+w==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VetZ8vJcjWE1XQbgXjBBpzYv05INiNowXzx0IIXVY5cFb+M8r/cUGydfI+2b?=
 =?us-ascii?Q?KG7sQtx6dD8/br6c+eSm9YUKXmwkW0f+wb9o9CBJ/oh78JFwf65DMJqEHtDg?=
 =?us-ascii?Q?LEwuza7Eh6ot2zIXgZ+wWiZM740N7SN9cerNBtTy6eWc8zMR1+gJLgmLEuNW?=
 =?us-ascii?Q?m9ACckwRT6DyJcLy2/m2jBepayFnsjWnFmuVnA0THjrD2DCOaKk6pWDITy+/?=
 =?us-ascii?Q?cXDqqvl/oBpFGzdGhCNUpQywQpSFmZsxFjMZRi/Fs34H+vCoqm/hOg/e9FGQ?=
 =?us-ascii?Q?/Z2JCRuO4+sVH/uK/CAj1YaUakPmAfGo2S381KdKQ89xCjGs0Zp8DHDw8Q9L?=
 =?us-ascii?Q?Tz4FaMmvGqLyxy574LVWyog72MZ9fTbOlZP5urJXP/5YC/qjiAK2c/YQu+9X?=
 =?us-ascii?Q?rcyJXbZDdVqgHMYZIVhtQ0kJ/wvieRzxi+zr2Po1d5dMkY7qjAjVnWegxJ6V?=
 =?us-ascii?Q?fHsSIfCuGFb9e9KgQ42gm+BD0XzXDQJyKAgf/Sq08CD1xSYRuDMAAWr6WsCh?=
 =?us-ascii?Q?6vy0arj5OGhSxT3dY0oZoNP95R5GfkhHfTPqAGXWj9WLiWN7ufwlWEfAMM8Z?=
 =?us-ascii?Q?Y+4kWeGOKPw0Vs4bKiQK+zZD33lPtJQ+AN75+3ecZPq7GsctKmtQDoMhMq98?=
 =?us-ascii?Q?/xJfKEY0hf0Iu4wVI7ob6f5HeGxwK24VfZGxcyiDVRgPdN1pD6a6AIJ6LCP9?=
 =?us-ascii?Q?V0kPxiMKnKDgFOnLwraQWRyYgUjtV+ekNsUsYTRhNJre0JUotvpiI6gkzjRc?=
 =?us-ascii?Q?uGgDvZ9U7AFgX060T5EDH5yTo+kg7AxIOKrGNAJ0J7Zz4GmHXfalxUjOwX+9?=
 =?us-ascii?Q?d6QJ+1iXfEMEs7mcYyIRnTj30SwbL9dhZihZp6IIuHLtKEyJYdmxr9RfcLW8?=
 =?us-ascii?Q?vr8Gefk8i4XF04Tc79ApYqVchl4U7yXb1gM+W2ARKll4JGzSc50EA6FPGWGr?=
 =?us-ascii?Q?6hxbPqh8VWGyV0Ka+7weWrHzT6gcVeBiMFK3WU/rttq96B250CO+wJ+5MGgM?=
 =?us-ascii?Q?znVU0v4+s0roKPkCz0JMFaqAoeXyc3+F/8DwiCLvD79nLvf/ohgFje3qg6qX?=
 =?us-ascii?Q?tAOOgbKN+u06RV7bhyIr/xXg2EOY851sh5JSENWkSF/jESz69PXbsnCLZfiC?=
 =?us-ascii?Q?aIRr9J1QaXcFCFxw9jPPqHNjOhsGZYbOEgFY7nP7Si+Y8k0MId4+PJi2ydZr?=
 =?us-ascii?Q?WEfGG7MPo9YpTxpW4ZpcRb0d3oz2NFctzv558/bwebvPSH9g/6piQ6ylQXAi?=
 =?us-ascii?Q?Ibh8sY6IQj+01LT2+Ji3z9wSSaVjInMpufJJldPs2A=3D=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-d8e84.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: ca420140-9b52-46ac-3545-08dab95560de
X-MS-Exchange-CrossTenant-AuthSource: TY0PR0101MB4285.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2022 02:29:17.6599 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR0101MB4119
Received-SPF: pass client-ip=2a01:111:f403:704b::827;
 envelope-from=taisei1212@outlook.jp;
 helo=APC01-TYZ-obe.outbound.protection.outlook.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FROM=0.001, SPF_HELO_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This is a ping to the patch below.

https://patchew.org/QEMU/TY0PR0101MB4285F637209075C9F65FCDA6A4479@TY0PR0101MB4285.apcprd01.prod.exchangelabs.com/
https://lore.kernel.org/qemu-devel/TY0PR0101MB4285F637209075C9F65FCDA6A4479@TY0PR0101MB4285.apcprd01.prod.exchangelabs.com/

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


