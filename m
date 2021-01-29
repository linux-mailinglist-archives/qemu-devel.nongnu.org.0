Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27825308B47
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 18:18:57 +0100 (CET)
Received: from localhost ([::1]:39610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5XQ8-0001Xx-6h
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 12:18:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l5X0Z-0001cF-IO; Fri, 29 Jan 2021 11:52:31 -0500
Received: from mail-eopbgr60091.outbound.protection.outlook.com
 ([40.107.6.91]:6275 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l5X0Q-0007Pt-AL; Fri, 29 Jan 2021 11:52:31 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oM2JzjjStRb80cxNhoNsFsoyCCd34M6R1M78F/B+v5eCMmrX+eKrOnFPV4yU7G1SCbsD1taa3dOZ9IqiNI3M5LMV0dDVP+E4VJtWkzshnYyK0XvNm+lkoSnyWYO6FiL35mN3sdY4AutLSZCp853MpRSbmNyA1c8+akYN1hL7KcZE7Rm/gKoBpJxBGs8m0WcxwIUL10CebnJbLqI9aruUFGnVXSTzWEm3h5tQj4oQmwQxX9XLCm+VoquGSODGsfm6c8yJ+EHhg/shvCuw/m+J3Psa+KfGP47nXeFHag0fXHX22YB/2QT4vqWg29AK3VkCoLF53CpTICdl7kFCjkXCNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AYzBXpgmuISa5N1uD0Uv9BisBpP67e04XXPa5K10Hes=;
 b=Ol4xwY4DPHVjdCkVipDLA+gFaDhbP4vXnSKha/42AEbA53k1vxdR/uYOKM9NgVYruq/swPePCzxzMBk4NU9qGn/E/Rv8trzRNRnrS+yyYdgk+oQ4vBwYKWGKyxzkXKe97Asc67z0mRAiiBCx9ZxUMtGvbzkNPtp6J684uIFDCR/9o/N6RBy4HIpgxIJ/MnyK+qpKvLNp1Ps/kvgSV+oBE0tt/TaYT9GHZlV6EyrNvRNxsSEFUMHvMrp93047tDLK4A7Si/8ptsodxvGHAgrzTY2+AwGN1YmcAR4d/sZvcoXJZeJLx4QGgeK3NKjSOeOGLGIqUr1dlF6hoD+w/2+t/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AYzBXpgmuISa5N1uD0Uv9BisBpP67e04XXPa5K10Hes=;
 b=X1bdGJx2glnVK8Zte7ojC/G2VRKJULf26Cd4jhio6I0lqWMz9d5o8xV/6pAzbQh/0d0IS9RndJRbKL5IDVfezIQ2+fTX5PQCylC1K6qVQNeBSoFNx4QIYyyxvfTstmWl2QTw/6/l9a/mkcuaXJ85nbgZx3TQXD6YgHgFou1X5dQ=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3621.eurprd08.prod.outlook.com (2603:10a6:20b:4b::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.17; Fri, 29 Jan
 2021 16:51:45 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3784.019; Fri, 29 Jan 2021
 16:51:44 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH 5/7] simplebench: bench_one(): support count=1
Date: Fri, 29 Jan 2021 19:50:28 +0300
Message-Id: <20210129165030.640169-6-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210129165030.640169-1-vsementsov@virtuozzo.com>
References: <20210129165030.640169-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.152]
X-ClientProxiedBy: AM0PR02CA0001.eurprd02.prod.outlook.com
 (2603:10a6:208:3e::14) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.152) by
 AM0PR02CA0001.eurprd02.prod.outlook.com (2603:10a6:208:3e::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3805.16 via Frontend Transport; Fri, 29 Jan 2021 16:51:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 82dc5d1a-1132-4aef-45fb-08d8c4762919
X-MS-TrafficTypeDiagnostic: AM6PR08MB3621:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3621742CCE385A16BD654C31C1B99@AM6PR08MB3621.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2043;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ED1t+wOYCtVhqtStw8RSrV4rTYUT/nn8ywvzBF2MKlYPYSCMqfnwVxBKgzxiJWo0iz16CETeVuWknOEhUvEVQ7EzzJ4lMEjqUV8UN6Vk6QR9O6TZaQEvAJWnV5l3ISv0xOGptqtdJu0onmsf9jBV2MMbgBiTiC+l9pGwDyhBItSbErZGYVTVE4/Mh4aXEodIEtKTVQkuiFXuF9bDRdh83HgSurc6aONPR2wxakv8AlGlkgLndAXu7LD53GKjzExgA5xa1IMJpQJ7YeSjNHlQwFKtg2iHCjYKIGq0E85PSgVrJvw04MIlPl4EClbWB4uVbOXlJm599SL06ONVDnWN0E29PEOKX82nqKfmYzdXZrbnY/Plv1mdw6MK9cQukUeQSEyMeA8HmJXeygbGRerhFZDR4CHAKR9SVTq5phJmDFfsZ4yJDT1G4TqOP/AJkhK6FhaiPT7RXcYxN6Rs6XlPMTtpOvVDKZBThEqD406JgYLsCnApOC2EeXrEbvk99Wx53n4frzkpAA45HO1338xCng==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(396003)(136003)(39840400004)(376002)(66476007)(83380400001)(1076003)(86362001)(8936002)(6486002)(316002)(52116002)(6512007)(66946007)(8676002)(2616005)(2906002)(66556008)(36756003)(4744005)(4326008)(16526019)(6506007)(26005)(186003)(107886003)(956004)(6916009)(6666004)(5660300002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?pFeD1sYpG9/CWgkGqe62C49NhDfq4XVenlVqdSGytgTcef437oaqVik0z2Vl?=
 =?us-ascii?Q?FB9M+Ex9EHd5L0m3cfQOpkMX/RcLNdlkquPXXxMU3HFMrTz7/z3wbzzC2rFD?=
 =?us-ascii?Q?UMCYvG/m+H0TY003OhSpM4yRgOsH3CJgiFZkzzS+ALzZ+XKJDc+oAlb2z221?=
 =?us-ascii?Q?/lEcMmZ834u1yRzqSw4jQcMihAU/XYMDUb1V661QXyzQBSSpa7STHJ7X9Z2y?=
 =?us-ascii?Q?xozS9sdWgFw2C9jWEiRWeV5j/SPFzVbg3xxMfCDPCGRNxUbzfZUN5U/xMti5?=
 =?us-ascii?Q?sDrWSLbD4betCJHxQbZP2fUIaYd2uxWV2yBnUlxE3PR2ejYXXVXqNQC+yH7x?=
 =?us-ascii?Q?vgHmzahaC+oQ3iCdQNlaa2BYhoatJeVR2G2jaJ6QU+VjZD8hruACoNjgkXeI?=
 =?us-ascii?Q?u5mwKeJXhpvpHAsT6+PxTJFUl5tznMi6o0TOtfj6Q3Lz1/wfbVJdh/vETimH?=
 =?us-ascii?Q?4ScyjlTlYArKySWicizzJPApzQ9Q9P9YzBrEdXBuIx7bOxzEVxyOqWD9nnUq?=
 =?us-ascii?Q?H2v1WLesf8CpAOP3glSKUwQF/MZTF2MknbSwbt1qvxuZLs41vPC8BAhodgrv?=
 =?us-ascii?Q?b6rrCRJi3of+sfD3+Otafrtdm43KnZCvJQ96iQo+6KS5yL9QpP/1FGaySaCS?=
 =?us-ascii?Q?fAw+ZeihWlDusmfcXidUbhfgPtb1h8y6SWsyWw6ge8cOZHJT4gvCwXc/TKtL?=
 =?us-ascii?Q?Fo5i/2HsSgOOJSg1Z/6fltiT586NMbOpCUd3tIGKRXqegwu5wCtkmSPjumzS?=
 =?us-ascii?Q?EOisCUV7iudo3PWaXBFfo80dxDVr9ubMzzYhcOx6UZYl35E76DyZVCihOC72?=
 =?us-ascii?Q?m6F/EyNiqkhGZlGK0on1zkczxIEsDBtRdVIiWW+IYIQlCGLXTaEOmLfwW2bp?=
 =?us-ascii?Q?b/Md802i51vDUeBYCKVUg/DTRTQJzHREiznDppqtE3/M6ypeXgOgRRjYK43q?=
 =?us-ascii?Q?cgSRYw6vCyRWou81gqnESHozynT2Sb9XB8ZRqW+kj55ez+A0XQ6klgEbriCk?=
 =?us-ascii?Q?iVRsG/aCozPS+HQNCCntegX1xZCGwfrFvc87DT73DevxMuiJUi0w2smTzaAJ?=
 =?us-ascii?Q?ItOg6qJU?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82dc5d1a-1132-4aef-45fb-08d8c4762919
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2021 16:51:44.9135 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lEBobpzE4HPXyaUZEs1NvrLCYvwAQaPHbfV1w1/3ByTKe4q/lIutw5+LJOxr9b7O9GkmyPrBRrBQSfR8G4tIfyZxb4T7Zelmg61qIW6oRPU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3621
Received-SPF: pass client-ip=40.107.6.91;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, armbru@redhat.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

statistics.stdev raises if sequence length is less than two. Support
that case by hand.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 scripts/simplebench/simplebench.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/scripts/simplebench/simplebench.py b/scripts/simplebench/simplebench.py
index 78d90faf4d..407e95cec3 100644
--- a/scripts/simplebench/simplebench.py
+++ b/scripts/simplebench/simplebench.py
@@ -92,7 +92,10 @@ def bench_one(test_func, test_env, test_case, count=5, initial_run=True,
             dim = 'seconds'
         result['dimension'] = dim
         result['average'] = statistics.mean(r[dim] for r in succeeded)
-        result['stdev'] = statistics.stdev(r[dim] for r in succeeded)
+        if len(succeeded) == 1:
+            result['stdev'] = 0
+        else:
+            result['stdev'] = statistics.stdev(r[dim] for r in succeeded)
 
     if len(succeeded) < count:
         result['n-failed'] = count - len(succeeded)
-- 
2.29.2


