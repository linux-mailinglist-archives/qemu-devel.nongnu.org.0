Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 880D55F971A
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 04:53:33 +0200 (CEST)
Received: from localhost ([::1]:54084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohiv6-0004xV-Lb
	for lists+qemu-devel@lfdr.de; Sun, 09 Oct 2022 22:53:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <taisei1212@outlook.jp>)
 id 1ohiu8-0003ct-9o
 for qemu-devel@nongnu.org; Sun, 09 Oct 2022 22:52:32 -0400
Received: from mail-sgaapc01olkn20814.outbound.protection.outlook.com
 ([2a01:111:f400:feab::814]:65248
 helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <taisei1212@outlook.jp>)
 id 1ohiu6-0001tP-Aq
 for qemu-devel@nongnu.org; Sun, 09 Oct 2022 22:52:31 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I5m317IE3cr12xZSq2C6fhxHtN9Bs27ay+TjXhLeA4fwpAX8Mms966DEQKvtrrr8i03bNBXUq+ozRvqp/j3nmSwu8cnIIpQ4NSzb1J0tvfdXkf8PERp/DLoGRWJLactmjy3M0Ou6thB0JcVc2WGVBxcmdcw0aZfE+oTJCT9SSiy/yriocrYInW3D78jYjtB85bjkMFZj45ioutD0VDoK7ydfqnHK+VHCHJQyaAvAreaE+nylgtUZKprPuYnf761hFfOC+ArgxqfCkIptk1Tv3L3+ocdWnMfjOhO5FUWm/qdE08U55MV8LT9nW3mLUe8Boiu6YiVbqlk+TWM9igiQGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ffemJ4AYzGIgtgpXBmoRFetlyQyp0g7SFJTwlVMWLs8=;
 b=kQzOQvp9X1e/P1fa7Zoh7jTIVvM1aBsHELDP/DJdRy97FKVXIFrKyOwLArma1CBi4DoZznMsSfPDeAk2SoRjvKItusAzN3DY01XFZ3XGig2F0qd9CAaQEBRb6q13jov81LR8DW208svQXW3M/fhkmUzCNMB1Q/aLiOWO6Q7aJfSxm/pRGoPs3u0ql8E1ykQRPF687oOTPUClQwSyzjiIR1maD3LXhZyq6WOCtBjpitw4/hV4BdcfZID4qeejBgecE8Vr0tzl0be19OYDj9LT29VK8So4tFQwGi4kX/FMnA0PCrN6ChtRTJ+KzNTkL8u0EsCJdioAqbN2PPXY+08uRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from TY0PR0101MB4285.apcprd01.prod.exchangelabs.com
 (2603:1096:400:1b0::11) by SG2PR01MB4435.apcprd01.prod.exchangelabs.com
 (2603:1096:4:1b6::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.34; Mon, 10 Oct
 2022 02:47:19 +0000
Received: from TY0PR0101MB4285.apcprd01.prod.exchangelabs.com
 ([fe80::d219:190d:d802:bbc4]) by
 TY0PR0101MB4285.apcprd01.prod.exchangelabs.com
 ([fe80::d219:190d:d802:bbc4%4]) with mapi id 15.20.5654.025; Mon, 10 Oct 2022
 02:47:19 +0000
From: TaiseiIto <taisei1212@outlook.jp>
To: taisei1212@outlook.jp
Cc: alex.bennee@linaro.org,
	f4bug@amsat.org,
	qemu-devel@nongnu.org
Subject: [PATCH] [PING] gdb-xml: Fix size of EFER register on i386
 architecture when debugged by GDB
Date: Mon, 10 Oct 2022 11:46:53 +0900
Message-ID: <TY0PR0101MB4285FA2526435F8CEC158355A4209@TY0PR0101MB4285.apcprd01.prod.exchangelabs.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <TY0PR0101MB4285F637209075C9F65FCDA6A4479@TY0PR0101MB4285.apcprd01.prod.exchangelabs.com>
References: <TY0PR0101MB4285F637209075C9F65FCDA6A4479@TY0PR0101MB4285.apcprd01.prod.exchangelabs.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [ZxbOVSU4DMMVdOnzIvBVpjPO0hCdPkGE]
X-ClientProxiedBy: TYCPR01CA0045.jpnprd01.prod.outlook.com
 (2603:1096:405:1::33) To TY0PR0101MB4285.apcprd01.prod.exchangelabs.com
 (2603:1096:400:1b0::11)
X-Microsoft-Original-Message-ID: <20221010024653.465-1-taisei1212@outlook.jp>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY0PR0101MB4285:EE_|SG2PR01MB4435:EE_
X-MS-Office365-Filtering-Correlation-Id: a9693642-ee38-4efa-f819-08daaa69bf7b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PrYcxuqvclYo+G7qoMVHduFuzBWZ9exB/juJc7qSwfhIDoirrOCnUKoVne0CHrqcyvtqJOwMmZKyxtChP2JNo+6XxpJUUchJocon5sQxUqYHTxL74JL7GRDtON9rMGGnbq5pXB7Iw04o00Z37sN3j+d07JB0cMSPpcJJaA0bEsJELfqFrgvTv3wH0yqhoS5q/j5BTPL/e7bn2EZGzPsirJ29J8tF9vuzUSLlcAASTs8WmCOQlggHRVjCy0Rzi2EYbPJ47kHAN+/h/s6PDDK7mkTlZlsjFV9FlWspxi010J4EdTgzB0ycuGM2gMnReRpM2F6s/uIztga0ZIBhHAnM6oBxyWmEIOaEdeZmBCUWvTLm6CuTLmAsRxm5JEsC1Rv6fvahPy7pS8BCLLvT797bAT9YcKDR+OpY8yoR6J/S1CP6Cni2j6Gr1AqMKPU+TRCv4GZ9B7Q7Up2WBunsNym6TFfW+LPfl3fe2zRFqhyZNeCrzfkoPgaJhphqhrJWbXkVXgbZ/f594dlgOJ8rmJLjdAA+FngQQCzEBWU3dHe+JXy5C0VKlpE604UcdIvOM/keYKqvk2Hzb8+u737ddjeLJSZeGE5EktcEs/eVYbf6yjDIfhJTfqWwsiJuedsuLKGcoBXl/EEzDZQlqW0AMovj7lIPp8WBMuV9mlPYg7oLqXL6pPVR0iTV/vtBnr2/+ZvT
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?l5W+bcBmBO6eci3Au6h8M0OcQa9qBZDDY5H3tfl4/TMOGJHMlRVmqZoyKXZX?=
 =?us-ascii?Q?CNpE7zzHDtTR+Os1tzBmUkbzHQUrpFRL3gEsQgNlttwJ8YYfaugaZSploxz/?=
 =?us-ascii?Q?B2Qi5c5kc2CX/Fd5SQtjHtB8Y8ZPspoWDZIupcaQ38IvjKr9k1PaEx09ElDb?=
 =?us-ascii?Q?5pSZdgd48EGmA6f6HWMjuvKbe9IxcPdaEVvDwcdZQEgkUIGEonu1DGO1PG4a?=
 =?us-ascii?Q?lcvj3ExpLi/wM3pUUBbs32I9A/V/sLRzIqWVgLHB9dUCHixDOCZ9z+Chyh1G?=
 =?us-ascii?Q?Xz6agW+Iaj4LvldRCpBhKO13LbLcoZ4sirHknT2Cvk0p0KLLxIBSTgMa4B+N?=
 =?us-ascii?Q?A0hyCOhtsqtgnWosZChig8T3mYdqNdIIsKgnWfJdFYzKvjUXRW/8fw0oEJmn?=
 =?us-ascii?Q?QgHYtzyY5p9HzfKVysSRVY0Zifm7rc4HMTOgHZnXI33g2L0kW+Ii8Z5Lk2i5?=
 =?us-ascii?Q?fN4o4L8GRL5dWoYNmVtH4Cf8XWrOQGkow/A4Cv4n6bcAocodXahpt9Czm/Sm?=
 =?us-ascii?Q?rBdRClG8WAoAFzUw0Y44ayqvsU59O4TP6hjUNi/ztqVL6idWMZbo0SCTWkX+?=
 =?us-ascii?Q?A73+w+4gDqxFV4alRHPqViLqeyh9M8o7O+YImd9UQAAnXO/sTikQn1QsJ053?=
 =?us-ascii?Q?WT7vHmwYG5Op9ZstR7YZpUeAF5T46C+b4UN6VGUITVa+RbFVOwZse3CNNmpj?=
 =?us-ascii?Q?l1kEi7CG6Ty5/Tfvv+xa/gEmJWwpLldK2SjDQBc3uxv/4cnJaT9pUiVtr0nn?=
 =?us-ascii?Q?2/F58u9+A0ilZ1a+X/hS3ajfQePwTle0/wxKpV1swScDm37owOxRjNJ+eBIt?=
 =?us-ascii?Q?ZVd5IqvQMgLu6sMRJLdEHCq6SwDyEySatwodPLqjfw0BQK2kLtYprxscwoeK?=
 =?us-ascii?Q?BvDOC0hbnfI9SwWOLJaOcoAYA9+SeSjFrLIeFPIIAYhOArWVHNbMR/qeaT7n?=
 =?us-ascii?Q?rmYLJh5CV+0FYy/Sz1xr3jvFiVKRt7jhHQOk33KFhgsYMwJQ+1Yyv1et0KT9?=
 =?us-ascii?Q?vYVDfDwUc7C+7RDb6PRO9ayF+6Zgi1jWD0wQJJbDiWIDRM2BKSWAORY0Ia5N?=
 =?us-ascii?Q?puQlE++d5kKs5JaEl67r9EqviIzi7xlwDuL3cgq8mn45FGYeBvd+2XxLqCQ4?=
 =?us-ascii?Q?03YEpgnxw3+yCTJtVpvX9JbwIilExJF1rfrRxBHgShgHJsKJaY6iFL1H4Lnr?=
 =?us-ascii?Q?mEKqPi3ZZp3lbQbEp1A3gAqSKRY8bH5K2RE6OZWtUbK8pDpPOyvdDh+IuV2N?=
 =?us-ascii?Q?1cMiCMwVv3/y+XEzXcYIOlD274zNzbViU6dLUZE1Kw=3D=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-d8e84.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: a9693642-ee38-4efa-f819-08daaa69bf7b
X-MS-Exchange-CrossTenant-AuthSource: TY0PR0101MB4285.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2022 02:47:19.5633 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR01MB4435
Received-SPF: pass client-ip=2a01:111:f400:feab::814;
 envelope-from=taisei1212@outlook.jp;
 helo=APC01-SG2-obe.outbound.protection.outlook.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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


