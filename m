Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1885034B0CA
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 21:51:49 +0100 (CET)
Received: from localhost ([::1]:48532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPtQp-0005mf-Ru
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 16:51:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lPsdy-0000Yb-Oj; Fri, 26 Mar 2021 16:01:18 -0400
Received: from mail-vi1eur05on2133.outbound.protection.outlook.com
 ([40.107.21.133]:54454 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lPsdt-0006Yw-Nn; Fri, 26 Mar 2021 16:01:18 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PNcB5liyv2b/z+gB3hUhpkBFLa7z0w7WY6mm24+A2+ibdVmfreMjP4HZDyzTB/AWGCb/5Lt2UWrdYvCZX8yOMAbW17XBKRyN2gVUJRoTr9pgsHxmUuYXeZ5qRh9lDx7YNEhpeEwoHjHIdVwKxzxYw5DWe3jtB6mr0MA/iltCHMwN5C0Q4otFk6/SAaLxrd4CADSTt6NkUKfO7Czksjbk/JZOy6GivsaTD7I85Io2HPeEBi5NzKemzdYDruwi9XRTeBtYkYhtUDH4Dok0xnbBUjy7Wjr/B7gWrZw2FPHC+PV524zeuYXbr8lllq2bYDq82A05OlNmA6jOOzH63ndNUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fBWNHREMp+DrTjs0IlaNUg3+8U1Nq//1jBxyeP0IVBY=;
 b=HFmCLRJqDDtDUSb4Yy5lrtgtWpHKlLeu4EieUjZY4UhEOpPN1dbBSbAQMpwR/hi6FMj0Kx6yGuzf+RHQedXh9Hz92/bkz97nclBH9fFnBJwaR+XntVql3E6LzoDVWEhfqarBCuM8JVhMNoWUvwc5FscRbZe5EA7/clostCVhjnS0D59uDqEn2UBmk2U9Q8z8Lp+RrvI8Og88DegHt8dBFewNnEnf+ac5pl38lulmBr+Lmcc/9O3HvCQJX/R88O1Oii8rA2TgU0oKXJfDAVe6MSSMDzqH0nIW5OrUEl3tOdNd2gtMMYsbRNMc/PMnVe1qflGd10woj5Zdliihi8D11A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fBWNHREMp+DrTjs0IlaNUg3+8U1Nq//1jBxyeP0IVBY=;
 b=Uj2bI8IqrBghJ13dI4p4cOFshQSBKw1uxFOnMVxAxBeGocC+TGyKRaYFi6dq/UGPfm6mnSH6Sl7BsC4IMYAFFtL5aJcwt9YXVJ+J6RMCDqzPqGB1sBVDCMeYgwqYqg70psRamDrGZah/c7SR672pD4QRPIIWCl0rFphWNp4aNfE=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB5877.eurprd08.prod.outlook.com (2603:10a6:20b:291::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25; Fri, 26 Mar
 2021 20:01:04 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%6]) with mapi id 15.20.3977.029; Fri, 26 Mar 2021
 20:01:04 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, den@openvz.org
Subject: [PATCH v5 2/6] qcow2: fix cache discarding in update_refcount()
Date: Fri, 26 Mar 2021 23:00:41 +0300
Message-Id: <20210326200045.363290-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210326200045.363290-1-vsementsov@virtuozzo.com>
References: <20210326200045.363290-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: HE1PR05CA0166.eurprd05.prod.outlook.com
 (2603:10a6:3:f8::14) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.202) by
 HE1PR05CA0166.eurprd05.prod.outlook.com (2603:10a6:3:f8::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.24 via Frontend Transport; Fri, 26 Mar 2021 20:01:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 19488822-1fd8-460f-79d6-08d8f091e2dd
X-MS-TrafficTypeDiagnostic: AS8PR08MB5877:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB587769C38BE756C971854D4DC1619@AS8PR08MB5877.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:173;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zvHTSLCZinIG3Ha7Tzq6l+p+fZNrEH7pCq5Z6IQzM8dfIu7Xm/9h2FDkyJ1264HpQj1pnun0q+/DINQcsum5HHKyqJXZ+8bbIGzkX8zCDqc0HWPvvSUdFAcbBOkZjun/ZDcai7pbeheB5U5IQ6CNDRAgFUWlI1zqI15NsWG+BcG/GPC3SzZL1FAYMAt1lgccLedQR1YqqiR7h+vxOV/VMTwwwmqJS84YAE+5AgDw8l/wO7GSOqdbiOYRJxejX6Uhhiutq81DCQRFt9A1fE8ZBL3O6wRdF+QgaM7z5Kggm2mC3LbDZrQ71jX8ARjg7oIRP9oiosyTYI2BZTNqtHTXb4qOsMKt/DHdxE3aYcA5+lFZ+2JgJUYRSjfsGHbIUekdZ0GJ3bUJsrBL1kGVUcRSJG2TImgUX/sWYoCgmKxWJzfvcsSTJhG1F/HvDuqotCGIPMMOQwB/4uZYfNM9V677q7TuNVe4zSU0G5+tTXiyjEArT1lwUuzklZHt8hFHtfc72JnVQ/UBqamv2FQJAjvJz+ftHgTXDZomj1PYEwrdtrZaa06xfjD/MM1nst92SUe2DuxNXHHX4dPas4VFDICTaOa4lvxcOB3H7QjuqjXA8Dz0kbMFBcoGQKb6Zj0LGW7yhyBpUFjv70KOSUnVLNr00KYAzzjrsqTHruioZ6g91XB+DpaUd97cHy2fnOSy8+gr
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39830400003)(366004)(376002)(136003)(396003)(1076003)(316002)(6486002)(15650500001)(52116002)(36756003)(6916009)(86362001)(8936002)(956004)(107886003)(5660300002)(2616005)(4326008)(26005)(16526019)(186003)(83380400001)(38100700001)(6506007)(6666004)(69590400012)(478600001)(66946007)(2906002)(66556008)(66476007)(8676002)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?WXQFD5kbhuAsF8YV/E3Of5IGCTnzi2vql7n/ZBIjndntFZubR6L5y56GaVzF?=
 =?us-ascii?Q?kddTdogTwDLh1E0x3FJTBHcV5TdU05km1EE9RU9vHPDlW7LxhSw5eXGl9TKU?=
 =?us-ascii?Q?0RIh/wzU/IqvJv/P3Mns3EmQGb1ggruUAnxxmpZ/TLjiNaM7bTiNXOyG2WJK?=
 =?us-ascii?Q?89AHXXWtB4DMfFLszeruFd23doFqFdQ/2x+EXhi/q+eMQAx836wPmp+LsyLZ?=
 =?us-ascii?Q?6hkJ3Zp7pJbx1WA7hjj1+W+YQzHXRO/3xc+uBkj4UvHYoRwNo/aVI9Rzze4t?=
 =?us-ascii?Q?yWJwj1xPmq8S8lLTDhSs5MEJUFIWXIS4j/mYT8Ke7XxkVD8CsR5XHL+83UU1?=
 =?us-ascii?Q?QikUKxWYEoM6kO7KnXezmPB8ehYqAyNDgkzwhs4Lzw56EuisFO5rLST+Aksz?=
 =?us-ascii?Q?Hl4RhH9QX4A/zMr+LhLS/Jjr7bG538UJ/r5egBWicAhf/4wm9JkqQsdlwcl7?=
 =?us-ascii?Q?1KueJBuWXAuME0s040mbsiz36lLaEAL5QWdlQY5vnW9kjFGlYwJWvL/pXr4h?=
 =?us-ascii?Q?JY+CI52gdQyrwto+QbggSfr5JenqlTSMJSKsn1cbi+x5rG3Lbelw2T2cORTD?=
 =?us-ascii?Q?7BQ82xZO/mk6Yp2GZi03bHBEwjIVBYPE4+g3xhOqmN98iprIkYh0zAvwz2UR?=
 =?us-ascii?Q?9mZM1buS1IDkqQ9vQn/HKi5pl77uySsf/ZnI3s5SaV/BKrqtjwWYkrvD/jxz?=
 =?us-ascii?Q?I6FfzEM492ZAU93cZFopxTSwswBrZH856CpK0h84L9JDNy96c2gPgXb/agIy?=
 =?us-ascii?Q?fwy9NOuiBGceNlsJJ62Vo3BuGVqgFpa7xEf7le9kgAxyYshL5C52h4znS0o1?=
 =?us-ascii?Q?ylrTlisiSdNuG7kNRhQeZtGOM/UBisKBxEkZzOKvL31cwG1BlS77q4JMpn75?=
 =?us-ascii?Q?VSvD7z8EOuaPjmXGSB7veLoHW/WtX9iUaY4Mvq+okJVlKwAmZflPGIIJNVvn?=
 =?us-ascii?Q?EFnJtzzyLUeN6YFFvoKjqpYzsO/R5sLBjnN/BrGHhtU5CLW6o1lyLhd5dybh?=
 =?us-ascii?Q?rPYFBIzZLznG0GjBIcGURceqNHf/mJFZhRM4k/M0+gPG5H/EAT+5MpC5IXar?=
 =?us-ascii?Q?7S0932GhmJMeLnEbB6Wz/Vmz2eSepuEMB5n8N3Od46iiekR7yujalRvX0X+I?=
 =?us-ascii?Q?D8UKRMVOouPaB6GMA02RZXJ+WiPn2gB7CXEvN6pxWU0pGz+rgWwomeB1baVc?=
 =?us-ascii?Q?jooKPVZa4vk6jC9aOYR6z6fKssfC7uwC8x0JN4dDibaDO3UJRPsuboBrTttu?=
 =?us-ascii?Q?KHlgKFtBs4ffZgyPOQSHSrE0Ekkdl6kRrGZ6g2DgNYRdORuT1YNMiGTyCg8x?=
 =?us-ascii?Q?D+8Rm2lOpegjLUnasXjLctSe?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19488822-1fd8-460f-79d6-08d8f091e2dd
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2021 20:01:04.1707 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qnlM32FY+A7wln9zSMYmv58U20iwig9m/C4nstTkuf0ICPgDwVRxXxCFQpJBlOuddnNoQXXnc4igZiXDj937b3omjozO0wkieQizfTN0Xlk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5877
Received-SPF: pass client-ip=40.107.21.133;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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

Here refcount of cluster at @cluster_offset reached 0, so we "free"
that cluster. Not a cluster at @offset. The thing that save us from the
bug is that L2 tables and refblocks are discarded one by one. Still,
let's be precise.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/qcow2-refcount.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
index 8e649b008e..543fcf289c 100644
--- a/block/qcow2-refcount.c
+++ b/block/qcow2-refcount.c
@@ -887,14 +887,15 @@ static int QEMU_WARN_UNUSED_RESULT update_refcount(BlockDriverState *bs,
             void *table;
 
             table = qcow2_cache_is_table_offset(s->refcount_block_cache,
-                                                offset);
+                                                cluster_offset);
             if (table != NULL) {
                 qcow2_cache_put(s->refcount_block_cache, &refcount_block);
                 old_table_index = -1;
                 qcow2_cache_discard(s->refcount_block_cache, table);
             }
 
-            table = qcow2_cache_is_table_offset(s->l2_table_cache, offset);
+            table = qcow2_cache_is_table_offset(s->l2_table_cache,
+                                                cluster_offset);
             if (table != NULL) {
                 qcow2_cache_discard(s->l2_table_cache, table);
             }
-- 
2.29.2


