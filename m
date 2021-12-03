Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F323467ED9
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 21:34:38 +0100 (CET)
Received: from localhost ([::1]:48252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mtFGP-0007hR-9Y
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 15:34:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mtF8p-0000qb-Dt; Fri, 03 Dec 2021 15:26:48 -0500
Received: from mail-eopbgr150132.outbound.protection.outlook.com
 ([40.107.15.132]:11453 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mtF8k-0001bp-Rc; Fri, 03 Dec 2021 15:26:47 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GuI1lZbjICSiu0nJutufwAz61UlwbTGO9n7QhFSp6SeKuPCUWex5TS8wZUW++fcjJCWCEIuuHTLapVG0E8rewiYcOHRwDIb5M5qqsP67nKP6aunpLbpAbnWdYnF0hf9MNYnJoKZ/0VJqvIOhZfbmyraPNV1wL3sCnnTS4HDWDspaaU+KSMOH39nvNPdhbUJuxeAK4FVL3P0pyQx9cyx9+b8/Z/EjnrY51h0yowWIPITiNFGh9LZ6wMvuxi//bBjTybmtT7U2j0lnVcvb1yRJzL7KwJptDx+r1M3P3Uv3oaFBTaNGXvyvnJLVHJWXuyXeqy6/pzxUgBt+EZeAI0binw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dOr0HWuR3O0+5qlixqfI+5w2UMg5tnLevoDOA0CQUOg=;
 b=mQnNnCakZSx7J/QagspPMdVVo8UVa3EPP9js8oJ/7S8DT59xe+qZjXx/TukPs2c9zPWkRF+XEMj12kJ0mDXhNJdSaljSDHXdv+NsIYJMRWQ4u7KXHVuyxDDfEQvsCf5aEWGPicB3ZMjXeJKEn3hAm8MwZf7N/NUqtwkfDWt/MIpM45IRv23UnjhKgKQnlZzJgcSeMpkbCRlnukhkViu/uGTI92cVUp+M0FKf9zhrtnjgAU4He9JzSRk0y2b0iXOpvkvu29Bi/cOtzneiM+hO8yXoov6p0yP1Vuwn8y0T6ubMM/nZ0ihM1ezojk0Oo6nxBHDP8SFeKclueoaCp0P3qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dOr0HWuR3O0+5qlixqfI+5w2UMg5tnLevoDOA0CQUOg=;
 b=YwBJJiSjnnrBQ86i/fJZ0MQCv21ZP54GSDo9HC+hjT9dommKZPbYrl1sNZbi1Hat+FbKEqPu2NxSSB7cazCz5u761+SHUvDPZLTOY1+PiiLIeUIaQF2FEEQOtLVdXot1o8V5b3cf7n4vBTA+Zu5yDQ/9MwRnJBmHR176h+KCgl0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM0PR08MB3841.eurprd08.prod.outlook.com (2603:10a6:208:106::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22; Fri, 3 Dec
 2021 20:26:19 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a%7]) with mapi id 15.20.4669.024; Fri, 3 Dec 2021
 20:26:18 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 vsementsov@virtuozzo.com, Ari Sundholm <ari@tuxera.com>
Subject: [PATCH 03/14] block/blklogwrites: don't care to remove bs->file child
 on failure
Date: Fri,  3 Dec 2021 21:25:42 +0100
Message-Id: <20211203202553.3231580-4-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211203202553.3231580-1-vsementsov@virtuozzo.com>
References: <20211203202553.3231580-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM6PR10CA0086.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:8c::27) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
Received: from kvm.ch-qa.sw.ru (130.117.225.5) by
 AM6PR10CA0086.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:8c::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.16 via Frontend Transport; Fri, 3 Dec 2021 20:26:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bc1e384f-b78d-4d8f-78c3-08d9b69b29a0
X-MS-TrafficTypeDiagnostic: AM0PR08MB3841:
X-Microsoft-Antispam-PRVS: <AM0PR08MB38417A9E355F7E6ECBE56803C16A9@AM0PR08MB3841.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:288;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TAA19pqxRrR0ZNBliqhsj/3uOp6GSkLcS/geW7OLY92jvVgegPmZR3TFZmD5gXkbptODVfOZOhCaCB4i7e9RunSIz+rS+c/AlXhQcxlShO9mZNggXK2DGcD9zBD+BI0ZVrJF3CGDsc7GXPsSjypFAcSV65pJVjnDnouzIR1RmkHqv8zESzUCukVorGoZ82dV27fjygYQQL0QHZsh0HgCuUhmwEjsmG7vxdKDgZtsMg3wkwsUd6M+jcqC7+8xXUOdsqdx19u5sEesEae80/8Jby1LlGVm0b91tR59KQqrCC71jNDjmkAH7EpU5eNjN0vHinnQJERUA7bTtUQ3wfDglSxZlCGlwwgsF3zEma5hqu+yqzpTIoxPMFAZDKmcPTCOE7jxMxRy2/13D9LO6LuIK6QN5GXd9To90/FA7t1Y++R9GjxaOOhWm4/sw6ht1/pMrU6QbYUWnuF6OUO1IVd3LqLkfF3lf4gsvuyGEPTI+C9G8gjzHzPESSS9he0uUAll4bk7EVS4NGB/tW3vwRvGhYSZFMgzHqoINGP79WQ7NtbfJ2QN1qoJXT+hE47BM/HhcezjqU2OUDl47NiNpnqbBxMxvKWYAjYqegpWQcwEnfsQ6pdStvDjuHFS5wbsSXL50bOU2RtouPKA6rL35jQ2nxvnvIqa+8EonnvwaeOfI9CKlFzf9DheK4MT4QpJ0xm78qQCB4jNH/Zrc8xUIv0WZA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(186003)(86362001)(2906002)(2616005)(6506007)(6916009)(1076003)(66946007)(26005)(36756003)(6666004)(66556008)(6512007)(52116002)(38100700002)(4744005)(83380400001)(38350700002)(8936002)(8676002)(5660300002)(508600001)(4326008)(6486002)(316002)(956004)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pIwfIA2Ysg/xBN4quk7juRwgmS1/k1m/5kotxFJlqJkPSZsRSZl8grVWrLEC?=
 =?us-ascii?Q?asg1reNwfupX1OQexv3YcFeWqWV/drQEdj8NAW+HutjlgSfgYGade7grUlqZ?=
 =?us-ascii?Q?Nrk6LeGwD+BoWTRXMjOhdPcBzVYjNw+vagNGP4VwnTkh8jxWX7pwjrxuzJ+h?=
 =?us-ascii?Q?/i0iRDn187wwTHxyfa+KVR5Tr2qvTtBD/S1WtqVBy/r2ZxKn6sFCTAwEUcG/?=
 =?us-ascii?Q?CsbrApcfJ+YtYpF3Jn0n6m7yYaGiUmIn5J9ojAfMm33bx3C9D4cf3bRD4j+d?=
 =?us-ascii?Q?VShRgeEqAizpcdP/T+Zy3x2bq7p8pvzuN2xc8uvvl/8S/TAy++sZDgx2f1gj?=
 =?us-ascii?Q?0c8aFEy5UGo9fYeVdrlY5OFGKOWN0ViktThialceJiYnHoDA90TSEbxtEeut?=
 =?us-ascii?Q?2yUlnnwsJdL3OYqMg011YdQ0EepTXh6faKwNp9ydfIK7NDutBm8Y36HhSVqP?=
 =?us-ascii?Q?u6Bo1tsFXShgd+l4bDsDbBBvPoB+OI79nUB8jcnyJpS10zYI+B+sZ+kQ4rE2?=
 =?us-ascii?Q?znf+nXfNaMUj5CDZ3m08rmReKrMduSYAXG3sAHj+pSlKtcxST1QnDYGxRKHS?=
 =?us-ascii?Q?melFp1Dp+L7hDJTZ79QYyZ4PV7yw6atlnA7UN6LbU0ko+YFbHAjNBNhG0NVf?=
 =?us-ascii?Q?X1W4K8GX7S5sod7Ef2sDMf658BA0NNaikY2w+0tVyrw8e5KxN31d9F5C/RKK?=
 =?us-ascii?Q?Lc34OebWbBfbbuDG8K6ZzxWKs7oynnFI/gHUaM06mz29dYaylFx/ROmXrFDK?=
 =?us-ascii?Q?r49pTzWhBT6BCjyROBJBVRnHl2jcpskwOqMfYwEfLfLq2z2WmVk1zXolzh62?=
 =?us-ascii?Q?5xiob3wDS6uRV7cNHy+dq1ebFfJvSHp2dvISS1MnFIc8m/erEdG5pc63Oy+L?=
 =?us-ascii?Q?oyFKalSz70Ir8KC/lgQ+sWob47ypRbFziFI9RJhXAIV/HIgzSVjgVg+OFYDi?=
 =?us-ascii?Q?s8CwsXlSFRvvwAm5J3vlvE0+i9GMvEuMCljW8RrO7V6yySsexiHN2oSshi5s?=
 =?us-ascii?Q?1EdCc8WienyjaIf+jl8ORnEez5iBFrccT2yCTtFXVS6XSKCeVuW9sRaLxg7K?=
 =?us-ascii?Q?9698XKzU5RxHhZiti1eZimDh7+9lrohgCmIIoiGZ1IoPxvHTfYBPCmJ+YPP2?=
 =?us-ascii?Q?ctNcT3qSg64VvcZ86RPrCfqrTtDKAASaBB6aNr9ypoK8QxB93VszqdHlx2w9?=
 =?us-ascii?Q?8v80MGaZKliM1YXrwB7nnS3cDFvgjp1Wu71IOaF5M+4GDH27eswNik0tbQ6a?=
 =?us-ascii?Q?DWKWDdle5ADjF/n6qPU6h61ahxm6T90d9SOFuT6PlpMhO8XNmh+GPbD+jDfG?=
 =?us-ascii?Q?sk9Wddfi1PFjLob9WiLcr9sJ8LRyj7PMrWrKEOD6+ZG6jeO4GKN98oM318H9?=
 =?us-ascii?Q?ZVE3KGEBHPQymtlRabMoY8iBOgvpOf6ZVnG/D/K4RJ3woZmpwU1wYCkVQSGx?=
 =?us-ascii?Q?vnCiRr3G4Mkw0rjgm/mPUeYZR/8FBb5C661tRxJ3jxNAMwNo0ZGxhexsrg/z?=
 =?us-ascii?Q?zsgsyU273UocPrSkfqq/zsoccAAdCz/Mx6FRB//Hc2J8dkDmTpPh+5Yvw/N4?=
 =?us-ascii?Q?3/dtjNjOwWb3ktiJIj1CZx6mZc0fpFZi0f0QVD+8TvbxD3yjuRMixRBsGEcO?=
 =?us-ascii?Q?PAHJ4rHZuxcYTecmC0Q/WKLZaGJQYY7q9TMMIqBuFaacGaEDF7Z6ZaocGSMp?=
 =?us-ascii?Q?6Rse3Q=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc1e384f-b78d-4d8f-78c3-08d9b69b29a0
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2021 20:26:18.6076 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nL7+MOE6GNS/buib8GBN7obtC4c214IUcP3MUtChkO+77CKhvvRIFlG/zQLOS6b4opRbK2G4fvP8tF2Pf1+mycpzt2VuUj7ILd0BQEyUc34=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3841
Received-SPF: pass client-ip=40.107.15.132;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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

We don't need to remove bs->file, generic layer takes care of it. No
other driver cares to remove bs->file on failure by hand.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/blklogwrites.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/block/blklogwrites.c b/block/blklogwrites.c
index f66a617eb3..7d25df97cc 100644
--- a/block/blklogwrites.c
+++ b/block/blklogwrites.c
@@ -254,10 +254,6 @@ fail_log:
         s->log_file = NULL;
     }
 fail:
-    if (ret < 0) {
-        bdrv_unref_child(bs, bs->file);
-        bs->file = NULL;
-    }
     qemu_opts_del(opts);
     return ret;
 }
-- 
2.31.1


