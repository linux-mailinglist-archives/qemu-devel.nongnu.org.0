Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B81423EEC
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 15:26:18 +0200 (CEST)
Received: from localhost ([::1]:34968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY6w5-0002Ae-4o
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 09:26:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mY6o4-00053y-BZ; Wed, 06 Oct 2021 09:18:00 -0400
Received: from mail-eopbgr40136.outbound.protection.outlook.com
 ([40.107.4.136]:14496 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mY6nz-0004IV-OG; Wed, 06 Oct 2021 09:18:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z/rMskjGi03w/Dw4pyxvLfCNHjmx72RTVYVMRE4UCIVXjjPhmwAb3u8cEah02aD/zzVIpu1j5KnNyz/WHU6tNXg03x9H30mJhrCgBuE6vTfp+mZ4I57dxs/VkrAZRxy4l4mbIUO0ooIwQtmtplGiAnkLXE62DoajZ/JtgNRc8jjNIdPX/ixXs5B1XsHZvQpzncZ4+Cy8l30S7kLQSCFfVDQ5siOMHnFkI5UDjLGy/jgT8BbnfYlCcW8C+dvo+LPfDGkJyKPm0O3ys4o4A6fhIh1k+qZTKSpERBWFG5y+nBy+HC1Aky0nJdd6G+zHsxQRyuh68x3OwfqWd94VrKDBtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bAnZaQ7L1S/w7KDM93nxKwGap85/mRYpCalKtiUxP+s=;
 b=nQwyIJ4BmKGCpcpHXODxX1aPPA+F9iZcpf1htdc6m8dXt/bFN0m1myjNw2rBIpwzDkZrEoeP6qAXZ8ze4Zke+UFxuIAcBMt6AN0UCOzc4aZzNfFV6DouTwvo9dQNqAGkgM8UuA0JH5aisptWQHMFjtpuwWwZOwXk6Dah2A3cI05WaP6UoyjAGV4vZDXK3Mt9EhW3858mDXtB/74olvBx8hbR9nLvxbVYEwSf1myPQG9YRt4jLOZc1GZ15uv2crmRpJJE+fuQUGHCJrY+TTf/33Kyu+HapVqxCdWmeapb4hx9bRECoPBjSCBZYb7XRKl3oLt4Tt/nKnIi+O7JZpwFBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bAnZaQ7L1S/w7KDM93nxKwGap85/mRYpCalKtiUxP+s=;
 b=SXr7Y6l/rNRq4gL61+i3EvCdCDnGRwfDBq0LR7lfqZxpL4BUz4cIfJiyHpIE1JmESjWaEpSMAytw8ylTQ0J9cgGJUOwgVLDCCZ/OB/iNrZ4FdMsI4cweulugNmrZqJyF1QHuf48z0/2WDezx6cXeqz7JfI0xFKCCV2caRJAI9Zw=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB2981.eurprd08.prod.outlook.com (2603:10a6:209:44::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.22; Wed, 6 Oct
 2021 13:17:35 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc%4]) with mapi id 15.20.4566.022; Wed, 6 Oct 2021
 13:17:35 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, crosa@redhat.com, ehabkost@redhat.com,
 hreitz@redhat.com, kwolf@redhat.com, eblake@redhat.com,
 vsementsov@virtuozzo.com, stefanha@redhat.com
Subject: [PATCH 06/12] block-coroutine-wrapper.py: support BlockBackend first
 argument
Date: Wed,  6 Oct 2021 15:17:12 +0200
Message-Id: <20211006131718.214235-7-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211006131718.214235-1-vsementsov@virtuozzo.com>
References: <20211006131718.214235-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS9PR06CA0296.eurprd06.prod.outlook.com
 (2603:10a6:20b:45a::16) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
Received: from kvm.ch-qa.sw.ru (130.117.225.5) by
 AS9PR06CA0296.eurprd06.prod.outlook.com (2603:10a6:20b:45a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend
 Transport; Wed, 6 Oct 2021 13:17:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c27cd70f-f4c9-4fa3-3309-08d988cba9a5
X-MS-TrafficTypeDiagnostic: AM6PR08MB2981:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB2981797679D1978D00907990C1B09@AM6PR08MB2981.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: o6yBySv0NRzSNDgjd+bkCt29OE+nsYwkHKsw/qjSNpQFUHREdu2APnJ7N5qSCx+D/rIlEolaH+zjkF8L1VERvpy0zXS4ezquVyNfpP7D4UBVctE0dOiaFNPmx6N343ANQW5y+wtzT4PrgMaf9PdaHo6UmaCfeuo3pUDEYVY37gOTJiv2vGvvuSVjct3M7DHkIpjXuMEueDsRRVAiDFkasoEg9sq7MNJIYmGbknMSxADy6BmXLfHCwcqCMywrbjYIK55UZdnFgX9T6fDwDNQs2b16J/Km7L2dKVxXWmSMSdtpitfAE3MTc65UH30oEIVjpZ6Aesvg1uZsE6H6/t8t6Q+Jbi0i3YZa6OZAscP7uMqoRoG9aGIUmJk1vbpMJOcaJ3s8TapyjH0eldixbef8GRYi/UkMgBYKE6bkB82M97/kGpXaNq+m1k+KZ2UlmBnkkKL9EXfpJ8yqdvZjoe37uMEgvPcD+nKy0jqmFToo7OnoJ2fHEBKBWvJtSsoVU8ESI0h+vna05XIADYNRXIKtEBmmknEiKAuVRgd1pRKN+niVzyWyQyxY+kQRilGzfoZT/IhjaDfrf+LgkaqhJEEGkWE+l2tLId5qGS4sCXyYn+XLPwj+2dyBNLEHJjBn+dbUph2j8EtXZM6sk9ZiM2WW/2CG6YsGPv/NmO5pPRTeLUpdvDgEwtPZWeqjHkt9a6J3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(4326008)(2906002)(36756003)(6512007)(6666004)(83380400001)(38100700002)(38350700002)(1076003)(6486002)(508600001)(316002)(86362001)(6506007)(6916009)(26005)(52116002)(66556008)(66476007)(66946007)(5660300002)(186003)(8676002)(956004)(8936002)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: f9+U8m9J3hf3sAK3Ro62DNRkgdhz1vcBa2g4Kkampc3xTSOBosotIcAeL23RNmVl4lMrDz067kiu7d/UDVvMy3Av1wv8G3enKShYCDy7WcxSoYVVphDX7Z0jC1LpWdxTeZt1aVJfGrLgW2MAW3vMKvFdzHMsDDI1BW10hgA+qpOWFuE5pTa9W3AKeveUgJkmTsnrgVzf6AkkZp4ovwISrV0STlqnnwa7UWqBzvO4HCglUofgZjmtns2aEIKmSymSAJO4FRc2dxsSTk23xv/RgBHafTSHTwl89FjUwng4wxtDyjXgFTXZK9pAJstXVDJJuib3sGd/YEV/5vUgsGMR05pGRg/bFXGYGTDi5AtoyPTPR27rwr8b5bvbIo32G9Q5XMYGpwpwhWfSgSbVPDt6rqtMlw9s45MOCVSzEbtdwzd1WpsVAnB8vkXfkvXldNvjMl51nA6FjNbZMTWbKyQlz4pOqgkDc+/ycS7VqIbrNrU7Ix7J8niAKzAXxFOolrWl8SYXCZV+oGJILI5oO/Bjg+Gk2kwoYPoQXz7OzCnyhKfyxmKw9TR8Hyz+uM2qqp5SJ49sGcPDSXYA2GghLwKvvHdLteIJ8tUoPf5AAzv5J32xp79AeRN2+wBQ0XQI1y5RFIbG3jg1cOB1jKBd274g0/ujnYhErJA1bbaKPaWSf8Ww/ADK+SWoanCDud0BgmDkI5wWcTMnNOgCJE9FZeKNy7sw48zLwfJSuKEhl0iEuwjz3+qWeUKnNCkX5keaPNiU
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c27cd70f-f4c9-4fa3-3309-08d988cba9a5
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2021 13:17:35.8298 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MFEqQXYdh6dAD3TdFptmDUvNn47cguQHsMZt+oNcpGus8SGRxE/N3TH/bLeQBKRvdE1adM7FbZQF/jwTPlJheioMJ4LS3Nxp59wzGQbgO0c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB2981
Received-SPF: pass client-ip=40.107.4.136;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-DB5-obe.outbound.protection.outlook.com
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

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/coroutines.h                 |  3 +++
 scripts/block-coroutine-wrapper.py | 12 ++++++++++--
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/block/coroutines.h b/block/coroutines.h
index 514d169d23..35a6c49857 100644
--- a/block/coroutines.h
+++ b/block/coroutines.h
@@ -27,6 +27,9 @@
 
 #include "block/block_int.h"
 
+/* For blk_bs() in generated block/block-gen.c */
+#include "sysemu/block-backend.h"
+
 int coroutine_fn bdrv_co_check(BlockDriverState *bs,
                                BdrvCheckResult *res, BdrvCheckMode fix);
 int coroutine_fn bdrv_co_invalidate_cache(BlockDriverState *bs, Error **errp);
diff --git a/scripts/block-coroutine-wrapper.py b/scripts/block-coroutine-wrapper.py
index 85dbeb9ecf..08be813407 100644
--- a/scripts/block-coroutine-wrapper.py
+++ b/scripts/block-coroutine-wrapper.py
@@ -100,12 +100,20 @@ def snake_to_camel(func_name: str) -> str:
 def gen_wrapper(func: FuncDecl) -> str:
     assert not '_co_' in func.name
     assert func.return_type == 'int'
-    assert func.args[0].type in ['BlockDriverState *', 'BdrvChild *']
+    assert func.args[0].type in ['BlockDriverState *', 'BdrvChild *',
+                                 'BlockBackend *']
 
     subsystem, subname = func.name.split('_', 1)
 
     name = f'{subsystem}_co_{subname}'
-    bs = 'bs' if func.args[0].type == 'BlockDriverState *' else 'child->bs'
+
+    t = func.args[0].type
+    if t == 'BlockDriverState *':
+        bs = 'bs'
+    elif t == 'BdrvChild *':
+        bs = 'child->bs'
+    else:
+        bs = 'blk_bs(blk)'
     struct_name = snake_to_camel(name)
 
     return f"""\
-- 
2.31.1


