Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF045369C27
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 23:43:59 +0200 (CEST)
Received: from localhost ([::1]:55692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1la3ag-0007fp-Tw
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 17:43:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1la3Xr-00059d-JG; Fri, 23 Apr 2021 17:41:03 -0400
Received: from mail-eopbgr10127.outbound.protection.outlook.com
 ([40.107.1.127]:4578 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1la3Xp-0002m3-Se; Fri, 23 Apr 2021 17:41:03 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G37ej/4ibdu/aPSuEpe53LsUwHZWAAe+Cienc2WeIxZvyf8r33mx7v5e0420UginZdT5DbSnDgxQEbW4shL7TMiEthnbZWDP1DpMO6+KHwnPAWqe5CIo4Oquspab2NDMyY1Ih9hUkKBi7KH/m5AmsU43uCLQ/VGh7yBeMe2c/JjDf3QIAwKMl9Gi6PHGf2YkcMaEhIdeBOxGKAzl/cWyvrADLFMYqWBOWzvXMK6KKvVILW9cEEt1H1fjx/rNe4cIAquKJlDqWtuGAF0+jmKaYEtbad7gTfn4Utp4ESDWz8WjhxLPbR91juHR7OAnsNBCx+jkN2xRpB6N5c9M10Fbqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oClIb++B0YTOqk4pQmLVyyga4dqyaD1gPwycgKzpWR4=;
 b=PrKFzjT/W7oxT5X7EXFIhDMI5T3+NPBmSQyDnGBvQ+uwQa14n3VT1fTjFtUGXzkEI3MgvzVWqi9wmp+2s45uJDQo0de0BTk0/G/P3CyqXTzzrjnpIEsilLNiuK2TiklKtGVgQ2yHSVn91saGMxAHyO/Put0mC18tAyjSCjiIp0xfYOX9P84BYad7K/KB2aVd/o8vI63iVxAIRUzSn8OEbWGQALi/QpC3AaS/hHG4DBUQ83y2yTiuflOSv/CZi/fKniI+T03xwZTlEA1jM9zrXnFXRqp1XzzeU+K1AdqeypmV9jtQd4qrwcylfkuekTp6rLA71xZkq7pPS3nqeHyxVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oClIb++B0YTOqk4pQmLVyyga4dqyaD1gPwycgKzpWR4=;
 b=LevsodCku/AmPDmoRmZERPuef9oX6cZWQcpR3WMEO6dZhNgSrqEhO4E3AxsRbu2WDQTwgDZaFz4N3z8/LK/UWxs83S00PViUe/gioqh0UdbUW/hi+Q7d5Q9ANIqiQO/BOdAsIAz/BqxoBNRrFDOz1zi6MKKwhlLcTHDkYdVUPqY=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6374.eurprd08.prod.outlook.com (2603:10a6:20b:338::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.22; Fri, 23 Apr
 2021 21:40:53 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4065.021; Fri, 23 Apr 2021
 21:40:53 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, crosa@redhat.com, ehabkost@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 philmd@redhat.com
Subject: [PATCH 03/11] block/block-gen.h: bind monitor
Date: Sat, 24 Apr 2021 00:40:25 +0300
Message-Id: <20210423214033.474034-4-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210423214033.474034-1-vsementsov@virtuozzo.com>
References: <20210423214033.474034-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.222]
X-ClientProxiedBy: HE1P192CA0012.EURP192.PROD.OUTLOOK.COM (2603:10a6:3:fe::22)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.222) by
 HE1P192CA0012.EURP192.PROD.OUTLOOK.COM (2603:10a6:3:fe::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.21 via Frontend Transport; Fri, 23 Apr 2021 21:40:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8a9ae1ab-e7e0-4f48-f406-08d906a0781f
X-MS-TrafficTypeDiagnostic: AS8PR08MB6374:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6374A467378A82970B388567C1459@AS8PR08MB6374.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:326;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sZ4YmqViNcvl0OSFbqkFxxmKx/fTUHv4TwJhqSZm6NcLZzi7NFYISaAq+19RGFz2PHpJvfU7Imx04jkokzJBuvJBLusLZlTEoaNlYpvbBnAMN0sHBxBzQ91OxRtP6EzgQMT34sqNLm1HHFKeezghP1l0Fpth6JQLQFYtBXaTxmadsiT0Lotp1Z/Hp8vPal6rOcav/eJgwWktZj/wfn39h10e28rArYuQfti3CAMPuc5Wbj2t0TjJkX29lN8l1U1sCLRXD1LpNSczZtVXJqIF6Dt6CQUNw2PWEEkYP2RIfrHeyeMXRoF+1xNbP+S4/1eAUP+Vyub/h6ghKaQoDCEXfAMoz9niqzu9zXgMl7Vpw4O3fnNQOR43TDfXmbiNrZuF7hsWOXsIiiVJu1iNPeOPdLjrfsfMssRH8dAAF7DkW+80FiOPR4oKki1GnJxytP6F425EAQWlYSk9KCMEn0Uj082cAqJvtXA+lXV5UUM9+zE1wFgrad1G3fp7jsXo87XpsGg9TYvk2qU4ffBdBLsvtnLA6Gh/xQ2XSwO1Bxc1IfYAMMgNPakvCmZaVtmSRIetKZXNLxzKwrEhomwHIt+Fp6L9ush90uCRWFwMZUB/n8i9kfpN5P4pQc5Yhd2WIcPeGFSOyLzuMQCXDeKp8AF9idQ2gemfV/zJpW3Yxzyj6uqxEXuOBn5zCY1i2kdd2PXv
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(396003)(39840400004)(346002)(376002)(316002)(2616005)(26005)(956004)(83380400001)(8676002)(4326008)(38100700002)(38350700002)(478600001)(4744005)(6666004)(5660300002)(86362001)(186003)(6506007)(66476007)(66556008)(1076003)(16526019)(6512007)(6916009)(6486002)(2906002)(52116002)(36756003)(66946007)(8936002)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?IJUHTq0of/EJxQTVlvdAo76GjtOgFLmZT+iZPl3Upn6FDvyVGbzQKwj6KqtS?=
 =?us-ascii?Q?1d/JqdPk47C8dWlj3LW5Hs0jh176b8bgtsHfc8gHk2qVEHqJtCSkrkZ/It+D?=
 =?us-ascii?Q?Zn02kU58EYpxqoj5XBaQ7KdERrjODksK1AM9+Knm65WDjbUQ4394FSjLOess?=
 =?us-ascii?Q?HQ4tL8Yn7fARZ3BJpPbtPOOJANpzh8rCqoRrrg7WHI0eo8yCHpl8zPqvUkqH?=
 =?us-ascii?Q?0CkHijLbzuHKHld5W3VFS2ldCcf8J3E3EMgvOOXYssOnhtx+iHbPUQI8KHwM?=
 =?us-ascii?Q?A6SmmbSuR6V32y/nzHMI3MFU7yag9tN3JwbGJW/u/ale7lPQgo6TP8jWiMJ0?=
 =?us-ascii?Q?opeYtK3Ifvpw+va3QNz4rA5hkAB61Mpuhd7oW1i4QuqmHEfFGgQHHai0YcXk?=
 =?us-ascii?Q?kdlt9PkVhGua9xWZ65LZsJyUy6uw9VyR7at1qRNAOD71/tjQTMyJboYdtcJM?=
 =?us-ascii?Q?5uZeF4yHdkAmZque5WgNcLAY1HiwP7KqARvKBg3+1i0rayYnqE6meTnL4/X7?=
 =?us-ascii?Q?OBaR7aY8fzDPSK9ed1JttKVMq/zSKWWYgcToJwglVyWbpQNOdgGGX8MxJHb9?=
 =?us-ascii?Q?4XPD8Z6pPm1ODWRFperM3jc0bCidE/xarhbTcPTmsXeC3hzoTCRkUMtjbmGT?=
 =?us-ascii?Q?xfJeaN9+uK2agywfb0KxVV6S7PJaAfWvCEqvgFe6hcNm36Gcupaml1uLJA8Z?=
 =?us-ascii?Q?nSrWy8vWGsuu8VZIub50DZfJM4HC4kdaS94v3IcFwc2b4J5+K3FnPSCHi3Kr?=
 =?us-ascii?Q?esIDQGgz0xLckMHkZ0o6X7Z0sUQN/Bpy2Ve65YC7+krzpk1I7B23fjSj/l7x?=
 =?us-ascii?Q?+oc4kc4RNLPTqjFjlP8SdGijP4T4LiqeTwRiS9mNSwhtSlSAUxNBgDkXjF7u?=
 =?us-ascii?Q?S/GoYdcPhB4aL8qczj8n/KuZpSPWrEQxybqVOC0IR34DrsUEwB3umMc2ab/U?=
 =?us-ascii?Q?7U0sGcC+XjbG+IbrL4vtl0rSIpI2Rh7TtT0kEgH0mOieCyQS2ofNFR02WSvI?=
 =?us-ascii?Q?H9mZmVomxMiKoVVc3sEbzlbnzso9VorLDyHl0hFHiudSuHO71lKKHY4noEtB?=
 =?us-ascii?Q?Pm9GR2bqy51U7Z7OBCWGVT9uI7wsYbhvzUCV16o8+vOFkVdDWU8xerHN/xI+?=
 =?us-ascii?Q?TQKzVI+099NPuCC5ZkiBdM8OsVw3ZIqgqEXloqbrBo8eTaqKu6o7LhQqUDBr?=
 =?us-ascii?Q?F74GBUw1TtqKELMzNQjOax5/0QshPHjggmq2psKsgBaDOVdlLlMZf52j1Qy3?=
 =?us-ascii?Q?WBm0apnNwlzvXTyrKXIW+QrMngiq588wVuYpNleLFxiVM0zhav8xJ5LLCvCf?=
 =?us-ascii?Q?hTN9IAKrt9XOubMcF3AFq/sE?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a9ae1ab-e7e0-4f48-f406-08d906a0781f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2021 21:40:53.0883 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P1UxnefKeZPcDmZ/IrV8O38mWyAQfZ25PEBHcaqH19AB45ZA+8g1ijrCKsZX5av7IJ1zs4T+GDRuv/Ra+z4OwPNoXocpbDZNk9V12zWDhkM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6374
Received-SPF: pass client-ip=40.107.1.127;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If we have current monitor, let's bind it to wrapper coroutine too.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/block-gen.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/block/block-gen.h b/block/block-gen.h
index c1fd3f40de..61f055a8cc 100644
--- a/block/block-gen.h
+++ b/block/block-gen.h
@@ -27,6 +27,7 @@
 #define BLOCK_BLOCK_GEN_H
 
 #include "block/block_int.h"
+#include "monitor/monitor.h"
 
 /* Base structure for argument packing structures */
 typedef struct AioPollCo {
@@ -38,11 +39,20 @@ typedef struct AioPollCo {
 
 static inline int aio_poll_co(AioPollCo *s)
 {
+    Monitor *mon = monitor_cur();
     assert(!qemu_in_coroutine());
 
+    if (mon) {
+        monitor_set_cur(s->co, mon);
+    }
+
     aio_co_enter(s->ctx, s->co);
     AIO_WAIT_WHILE(s->ctx, s->in_progress);
 
+    if (mon) {
+        monitor_set_cur(s->co, NULL);
+    }
+
     return s->ret;
 }
 
-- 
2.29.2


