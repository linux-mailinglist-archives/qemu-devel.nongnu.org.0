Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7FE600825
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 09:54:32 +0200 (CEST)
Received: from localhost ([::1]:34422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okKxD-0001G5-6W
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 03:54:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1okKd9-00086R-Rw
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 03:33:53 -0400
Received: from mail-am6eur05on20730.outbound.protection.outlook.com
 ([2a01:111:f400:7e1b::730]:31873
 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1okKd5-00029q-UV
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 03:33:46 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e+lYg+RzLLWnE+rA4BPKtG70qaHedPtwXJlM/czz5XHxfJZ3t2osazhgAU1a3X8KXKj79N6LyBD0FpyTTcPt3PcAZTb4Y8gVcdbeSv+0jrDUN9WgnG7xMdboZkKlGiNxeXWvEOeRFxZIFo+y8rh/9g0Hp+svhT4yNvXiDOyYhdNyFJbmHJXXnu3/aoA/bKK8W2GmcC3CNrdYf8VAczeD5PGpZxO16JnR0BhjGvI+vE44JDEG+O3MBeCoD6fZ+RbtdWApexr/L+dqDyHAxyKHFbT7ATx0vBkmOW1VbVLJnoufG8coEFQxPwS/GGeGzHtlHC8chtduPk0Wzr7E+PQFuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ku6Djti0TjfMuEVA+aLc+awmoKymOD59H9ccnlZTYRM=;
 b=Dc52DeNTD/fhNjz6YAhXpX2vOfFVXEvO2vznkLiekU/8iR7aUrSrFl/KyJ5SnJG6UGUJPUyUMbyvdMDlSO1+qUQRa3MPtKo8vCEdzHDVDpX/lhJwddybQFK2LblwmW+jwjqDhCK+67xiS/Uz/7sv+/RTOcN6IhABd3V+PJXQ+IvnBCTohNaOdMzgr4+EUdV952bZIAVCJhuKMBkQwC9Zl5BXtWNF4SpZT2InXVairyoiYOrrj6aTi8fVtPOLc3NfU8RF55Elwm3L0RjH3AzvAZd0sa3fzhFy9RfQwcxp7FUu+C/xQNGalx9kk4qFFkC5fjJsguSfdzcy5T56o6bq+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ku6Djti0TjfMuEVA+aLc+awmoKymOD59H9ccnlZTYRM=;
 b=c9WPAy2R8y/oo2Ab+AB2ijjVqTlBmpNak3jOoccUU9eSMJRKQNjohvkVaHcRRI3NbZb96nJmXfIkRRXE7d1DDw0fijodPQguapiYQCQJfZWDTNRXVQI2jmo80oRM5kll0X628FxSOKYAxa6b4+MuNWVKceYHiQTJnGRCBvKjKhmACpWq97h3nzx3l4fS+TGmF0m6nwL93Yxvzfsv3XL60uHkLsVUukHpu0WljSIhcsbS4pfsptZXZaiNuPfr2XV86+VL0IrVD1IFEOhTgYWXzDDwIcGdUCZy2no6nKz3yYK8un2yYg5LQK+sdhZ/ovoNcPrDJa/w+LoZ++BZDMTFTA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by PA4PR08MB7458.eurprd08.prod.outlook.com (2603:10a6:102:2a5::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Mon, 17 Oct
 2022 07:28:39 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b%8]) with mapi id 15.20.5676.040; Mon, 17 Oct 2022
 07:28:39 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: den@virtuozzo.com, michael.roth@amd.com, kkostiuk@redhat.com,
 marcandre.lureau@gmail.com
Subject: [PATCH v5 4/7] qga: Add shutdown/halt/reboot support for FreeBSD
Date: Mon, 17 Oct 2022 09:28:22 +0200
Message-Id: <20221017072825.72867-5-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221017072825.72867-1-alexander.ivanov@virtuozzo.com>
References: <20221017072825.72867-1-alexander.ivanov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0033.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::12) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:EE_|PA4PR08MB7458:EE_
X-MS-Office365-Filtering-Correlation-Id: d9998b73-0480-4495-d486-08dab01135e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /ny8pDCgdFjOBlXqh9cgTB7810WPMP5n6pq65uQ0uCAgKuc31RflXYtYHRkyoao6bfOyyEfMHaBoBZh3voeJSkfErJK5xSxI8kX/t0pXyJwKmLyVDAntt1vNmZoxtyJ0bRUwzy1vM08c0uFqcdz2lgh6IJ1fSUAralfOLNeDu5SRAtH4CS/8N/y/wbOTTK+U6RiK+MQCuZa8JlSDf9KkfW/WZKGvjDSDDDdJGwqiXtk3KPCn++HRIYy/qr8iaa18TV6V0TuKANJjsRD5I9eXC9g/hVNwS1jgfvXmD1hrxlSjdwSgfsdWNn4buYpGXqDducE1YsRPE1a74w9QVmqV91Emy2n3com6yj8v99vqJrKDVSccm71eY1P9MenM730mM/Juw4UH3QHTryGZZTDZi8IP3W0rJFRJEv+s+vsrR+BfSkM8cQfPHU/mW2AMvILHPxHQCQgm/5X/0OMP6qNqWpgCEjvPLgFuBRcmYwa8KraxuMw4NipM/LnNj6zYkWFQT5rPdFaC70zIAMCV4VSBM2HAQj7+zPPKRBfGh4Lw6beOAWMoiAQluSJT+KBdvLOcV/Uvjo62YMHL9tuNU7McDShjTNRrWxkyzLOxBiYCPAY3M3tqjhzAwAEjDwU/nHpwjkCQv7UKYBR2wQ40QAMd0O7xc5H/dHaRrE5stJfz13wAz0ETVcAOOHuZ3BG0LhiJbyb/C0SEinkPO6zIvyrp2tdyRIve2UZNLHEvXX+NISHBKYk/Q8vBPCY0MIKFIfFvOkeLygz4HzC/aQRHTSuX5g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(39850400004)(346002)(136003)(366004)(376002)(451199015)(36756003)(86362001)(38100700002)(38350700002)(1076003)(186003)(2906002)(5660300002)(44832011)(6506007)(6666004)(26005)(6512007)(2616005)(478600001)(52116002)(6486002)(316002)(6916009)(66946007)(66556008)(8676002)(4326008)(66476007)(41300700001)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UStHSUVwdU1ObWI2Ym5zTDJaT1h1ekxjQVNMZTVuQUg1VURCTkN0aHFIM1hC?=
 =?utf-8?B?Z3k4Q3FwenJJanQzK29mWWxZZXlBeUwwbHRXQ0RTYnFkUml2dHZwZWYyaDdz?=
 =?utf-8?B?OTdPbzZ2b3N6Q1dUbVI4NnZPK21sbXF5U2pFWjI1RTUyWXdOTlN2TnkweTBv?=
 =?utf-8?B?NkU2WjltWnRrZTIwbk9MNmhVcU5ESi9GcnhmTitKQStYaWcyQkZ6MG4xZ2RB?=
 =?utf-8?B?YnIxeWhTcmovZUFBTWZxVFN5ZERJV0lOOGZ3TmpTZVUyT1RmMnJkQklXUS80?=
 =?utf-8?B?eUpOeC9HYWQ1cUxTOWdIcWhaL1FoOThWYXdkeVA0Z3VYUEFVYWNqN2hXZW10?=
 =?utf-8?B?Rkdnc1c0bHZTMlNYQWNOaXVXclk5WnNodHFINVJGZkJHNEhnNVNlTlJOMkor?=
 =?utf-8?B?ZkNTTTNGNS85T0NONGk2OGdjWTl5MUVpdkVQN2RodFhhN0NuZ2RidjVUOVZX?=
 =?utf-8?B?UUhDUU1mOWVrd2x3bXBmY25tcGtQK3pCWG1CeWJKS3JRbTc5WWgvM2YrYUZp?=
 =?utf-8?B?MGRGMGM2R21tN3dLYWVUNkk5ZjlIRXk4cnJnbVZ4Z21VV09GZDk0OXhaN3Az?=
 =?utf-8?B?ZTAwR3V2QWtXWWg0a3RyeWUxL25xRTh1RGtmbzBjUDRTMTRXSG5jdjg4b0wx?=
 =?utf-8?B?ZkZRMkJPWjk4UDFWZy9BSC9iNmF4WUNRS0ZWMHN6eWMrYXJxL0xGZXVwRVZm?=
 =?utf-8?B?djl1MTQ3UlJFUnpyWFZqWFNaVGovNkNZUnQ3NFFaaHE5UllDUnRXYVRtMWE3?=
 =?utf-8?B?L0JQTUJrcWY4WkcwUlBJNzYzNmoya2E2czVOWlErcmFMNHUrTURxdjVxTjhy?=
 =?utf-8?B?elhCaVN3V09kTHNDUEM0Y1VXcmFJWStZRE1xT1lwKzMrNndrZkVibHJrTnZz?=
 =?utf-8?B?aWFudDJyWWJLdFo2N0s4a1dMNEhRQnh2NnZiQzU3bldaZDd2TDAvL2g1cC9P?=
 =?utf-8?B?TCtHWVh6OFBVbWpXYTVQb1lBeDVoU3hJYUx6NlNMOU03QTMzMG4zcGxMNE9E?=
 =?utf-8?B?R1kxNytGcVgvWUtxWWFqV25xaEtGdWYyd2NzNjBvcjBucm9TMlJwclVBNlA0?=
 =?utf-8?B?dDBMOWIwUFZmTVFFRFg2MXIzM0dtQXJqdWxxcUNzTFRhNmZLNFBHd0xqdS9J?=
 =?utf-8?B?a01mODBtRy92WktUR3ZtTEJvaFFJcmFoNmYyQkJtNkE5eHNoZFczUzBHaTNS?=
 =?utf-8?B?R0J2b01mbDh5YkRZQkNxNG5zcUhiOXMxTHp2N0dRb25ZWmlBNHloOHhuM3Na?=
 =?utf-8?B?VTEzaWJLMEg4bHYvckpKblg5amxreTNXQkFwNkliR3RMWTJDd1VkNzE1eWtw?=
 =?utf-8?B?RElXWHpxTUVCaW5BUm1DL0J6NTJ1WTN6cmFWNi8wSisrbXNmNXEzeldCNGNo?=
 =?utf-8?B?aW5NNlEyb3hvYUxuT0FwRDBIYWtob3pLTFhySGtVMHpQU3Y4TEVSM1hYNlBX?=
 =?utf-8?B?UlpqUUhxcDhEdU1rRCtES0piU0M3ZDBSRWtxZ3hCRU10UHZDdVcxSTl1c0tL?=
 =?utf-8?B?WjdCTGJDS1NOSk00RHArYU9OL0hvemlDTlR1ME1FQkw1ZUl4QXN1cXJSaVp5?=
 =?utf-8?B?dWhaTHlmVFFldDI5bTVWbUhmUEU5QlRXdWVsMGdSY09LeWgvcHp4VkE0eWVL?=
 =?utf-8?B?WElaeGMrZUpRRld3UkpFNi9iMDc3dm82LzFNUDE4Z2RyeFBtVTR5V0NER3Aw?=
 =?utf-8?B?YXA5ZWdMd2hBZ24yMzFnSGplM25YYlBtMGlMdGhETWt3SnZFVUptT3p4bENJ?=
 =?utf-8?B?ODc5RXV6a0JOSmRWbzF4R2JETkxSbmxVNW0wV215R2RPa2xHeGRlNmhXRjhG?=
 =?utf-8?B?RXR6R2lsL1VUUldwSThMdzhDVmJTYmNlQ1NwOGp1YWVmRG1EQk4rNUp4bEdL?=
 =?utf-8?B?QWVxVzF6OWJEcFRXNDVXNkRROEpGWk9NYnAvYU5nbmVKMGFsd1BnTTc4K2pQ?=
 =?utf-8?B?V2dvaXUrWENWVm5VcTdCNkFwTGQ0WCtNS245dXVoOFgxNjRFUU96T0dtZHkv?=
 =?utf-8?B?cDRxN2E5bGcwNElMNFp5NmwzZ2k2RUU3TTVndHRFM29BTUJOLzJIb2NEbHdG?=
 =?utf-8?B?aTl2aWdIcVlUbzhWQlhIUk9KUllNNEZrVDBTTUZRUVVGT2R6d2pmNjBnTUgz?=
 =?utf-8?B?a2RIWUI2VXhYK2dBaVB6ZW15NXFqWmJHSVkrUkNkY0FwNlpsVWp1cnlKY05C?=
 =?utf-8?B?eHc9PQ==?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9998b73-0480-4495-d486-08dab01135e7
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2022 07:28:39.3226 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lEFdauscYJAfGREOHyqqV2BptKqcbf7uuXH893blhw2gjANXEJPk5HXSlRClfQTJGlcnucXeKUceHh3DKICfHKp3mn9pE001av4mSeUgw98=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB7458
Received-SPF: pass client-ip=2a01:111:f400:7e1b::730;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add appropriate shutdown command arguments to qmp_guest_shutdown()
for FreeBSD.

Reviewed-by: Konstantin Kostiuk <kkostiuk@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
---
 qga/commands-posix.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index 6875ea8888..b0b467ebdb 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -90,6 +90,10 @@ void qmp_guest_shutdown(bool has_mode, const char *mode, Error **errp)
     const char *powerdown_flag = "-i5";
     const char *halt_flag = "-i0";
     const char *reboot_flag = "-i6";
+#elif defined(CONFIG_BSD)
+    const char *powerdown_flag = "-p";
+    const char *halt_flag = "-h";
+    const char *reboot_flag = "-r";
 #else
     const char *powerdown_flag = "-P";
     const char *halt_flag = "-H";
@@ -120,6 +124,9 @@ void qmp_guest_shutdown(bool has_mode, const char *mode, Error **errp)
 #ifdef CONFIG_SOLARIS
         execl("/sbin/shutdown", "shutdown", shutdown_flag, "-g0", "-y",
               "hypervisor initiated shutdown", (char *)NULL);
+#elif defined(CONFIG_BSD)
+        execl("/sbin/shutdown", "shutdown", shutdown_flag, "+0",
+               "hypervisor initiated shutdown", (char *)NULL);
 #else
         execl("/sbin/shutdown", "shutdown", "-h", shutdown_flag, "+0",
                "hypervisor initiated shutdown", (char *)NULL);
-- 
2.34.1


