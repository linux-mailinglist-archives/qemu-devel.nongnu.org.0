Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC1D47E62C
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 17:09:51 +0100 (CET)
Received: from localhost ([::1]:58718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0Qf8-0006zJ-5Y
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 11:09:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n0QXo-0005Lo-5U; Thu, 23 Dec 2021 11:02:16 -0500
Received: from mail-eopbgr70094.outbound.protection.outlook.com
 ([40.107.7.94]:61158 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n0QXk-0005KZ-Vx; Thu, 23 Dec 2021 11:02:15 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bN21Ntcayv9U8VycYs1ZDkDzgarfQLN4UHGv9gIRc0yHZbSw/ZFp+QOmNnpaaE+It6Bm5AmdeNZ4XL4kfHPlHqWHKRb8a1pHrTe1fNfb+9IsmabQJqXifW6tZcCPHO+s4hcSUVX15MY9W09lR6C0UqJmAcJoRhQgINQkyt5CEV+/SoDjON56U2YKg0MkAk/uLLX+j2yMj1lElmUoYOCHQlUTN5LVpyZNgpAjEK6EGhilFIJjDjH2Aow+MwW2Ku4HLsaPQwaMf5gd5luaSUmyz2/rA6fPvsxRW4OFxDMcAw6re8Tj7gCz3LwaZNPQwo5XNXXoNg9F9oJ5inRKvBOcKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vVh8nyePVg5t6jGI9De4e826WvLiuGz4daiKw7aF7Kk=;
 b=ZS6GOq9tubyBimSFdWK24hQVSnmC0Yfc67jVJFOnETBH6zpL7O2GoR8305Fc0o7vJBKPVu2NCaY/KfqTIjtSWEgpk3vT0CG2Y9IFtpByQ1aL5AEPRDJqFDDypDFwb+yYwwDhVfIgzWWuV/WotrGS6ELTD7MoMMlcvabQMwHpuGYgmNdrj+aydFBns2pwLv/zbAwrz8qb1UV14cKjoygTFz0TZFlMmYe18m7Az8BtVhp8p8tffs5t/h9lZqGI6sScnOLRsaI0EbMA9IuYB3kpZ2eOqkvuteK803+6NljZjsYHjTvZpOgJgqCbUlRwPya3hRQJHOfSl2xN6TeiQpMGMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vVh8nyePVg5t6jGI9De4e826WvLiuGz4daiKw7aF7Kk=;
 b=i1hkdMe4tjHEQ3Z0DFWpVtByrC6FVy/p6k4Mta4E+S8MAMM6kJXkA4FDpGT3hJSiWJJyYRcU3ywLubZL695phlTOm4jrH4dIhD/HJdlSbnJq1CPJLHpAkaDQDc793Yy4WebZRgiQNJ8uwhItcihQ+LQBbf+nxRr8erAdqOqE5Ek=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM9PR08MB6148.eurprd08.prod.outlook.com (2603:10a6:20b:284::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.18; Thu, 23 Dec
 2021 16:01:56 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112%5]) with mapi id 15.20.4823.019; Thu, 23 Dec 2021
 16:01:56 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com
Subject: [PATCH v5 06/19] iotests.py: rewrite default luks support in qemu_img
Date: Thu, 23 Dec 2021 17:01:31 +0100
Message-Id: <20211223160144.1097696-7-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211223160144.1097696-1-vsementsov@virtuozzo.com>
References: <20211223160144.1097696-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS9PR0301CA0001.eurprd03.prod.outlook.com
 (2603:10a6:20b:468::8) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 40055b04-1898-4531-de3b-08d9c62d8b83
X-MS-TrafficTypeDiagnostic: AM9PR08MB6148:EE_
X-Microsoft-Antispam-PRVS: <AM9PR08MB6148BC2B4A98F9FBE825076AC17E9@AM9PR08MB6148.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rJNl3grUCndSQWtlnyLDndL5q877QI3l8r1I7CuZwMwFOWBmUGMNn4z1+4+k6xlfYhXK3nDLlttjQQjW5ObgRNVm3wlpyrtC0Bhv4cEe5MGAAI4DFXZ63ykORBSP7ruAFMRwxgvxuKJXB6FS2cJCdJWyzxeWPyug+UZ+ct6JDs/G0g5touIlvGYgfdKD/cjFkP8pJ4YseHH8JCCa/oGzzq8x7EIUa5KUDGqGlWzmzVZtcwmZ9C0SAFi4vtltBYKQC7Gp+OhN1F1JqdFPcFyPzs7z6nIuNqvDdcNlmRQUeMxLNH92XsrU9Hhf/pL5awH7RtoOC0yzbtOq11Cwmte4o2/C7LR07XSk8DHCKSKXC7PETUh5Zyg8SwSDldzlDDZqUgkORhVzUjz/7/z2QmD4wngKKfaCeW0bAYS3Xzb047AKaQYf8y8r9MpV2lhqERKWWYXX3j2m0LjshYi97lCnSspcLzhjxxvWvFnCViMnog4y1ipNUodH3h5q/ju2ESEULSyhZZWon41cf5Bw+U6VmYzU89D3PFVUwtrncdZfqHcn5w8wYzyeODNXhDrjvOziXVwCFKgkSyCv7figXN0exRKuxMUhDJUZUl9673BULJY42NC2UoqJYieL0KdSneSmh0ZvwSVZmxdmqzOj4R4LQG4LKGfTqxhNKA7ktUwnl8ZOrAFKvjOagxDJiY0LuOTm5JzRImePmZDM7YlkLMWAtg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(36756003)(5660300002)(8936002)(508600001)(38100700002)(66946007)(316002)(38350700002)(66476007)(66556008)(1076003)(2906002)(4326008)(6666004)(83380400001)(6506007)(2616005)(6916009)(26005)(6486002)(6512007)(86362001)(8676002)(52116002)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1ziCIn+CokLcpf6N7ePpz/zeSOtBtFOkftOWzjxFHTOz/97/DYYaP/bz7ONC?=
 =?us-ascii?Q?P9xPSG+RheCpi1B3rvudOoVjlpgwwttJM9x/zDbUKi+8+gwBwqlCYcc7dLCB?=
 =?us-ascii?Q?lcQWRk1N5pwd+GO3YZHq1VHJqrFparZkgnGZBm28PedRdbkwKGaTmYUbsZ5P?=
 =?us-ascii?Q?BkjRsbbmAvpzf4tzKAb0KY0Gzj1EH1zC66o+TL17H5s1F9wp1dKzLrk/4gze?=
 =?us-ascii?Q?SxCEVj1KvdfWv7gNCcuQcDFapas8GgCrjFB57nROwMg8X/6KSfRYrErUzGn9?=
 =?us-ascii?Q?27ZBtgCVGM7+zYNungYxyZGzIf8oOFnazMUNpuOeXyDM+2GWcY2rxo8Lw9OE?=
 =?us-ascii?Q?Rkwl5H81a2GOfOIMmZAY8ZqD/Ap/o6WDpf9TYtnCGD+3Cbs0WTaElbErDQvf?=
 =?us-ascii?Q?fWKvTYKAiojC6YJy5NDdTZRDQewMtJevR6oU8gazde4Fs56fXls4nqZJBssg?=
 =?us-ascii?Q?j6FmxHHFHoj7u9mwwqOE/yE0EUrxCF8o1OqNEzMjTe0cU489CrTS2Fb9bJev?=
 =?us-ascii?Q?DK8YACQu2AtD7oRtrvu11+MQIOkbJM0vIeB7vpe6Dpii0YThWhgHTNHm/xXM?=
 =?us-ascii?Q?+H5+qKao1OiYr7hvxN6P2HQbu0F8N4rPEU85DOuZqxKhEUs3UEdaAn2sxAtd?=
 =?us-ascii?Q?SJsDofmQl1Truj/KF9Zv5asYZRCoegdpnOJZF0QuqddMnmOZemVJjj4hFMZC?=
 =?us-ascii?Q?nwv5zPZlchQ2h68klL9f+aWU25+u+qUDnh6rgN6FCGyYx8LB1V4uliLPjsjY?=
 =?us-ascii?Q?w46yod7uLXOL5ID+C+CQk4nura76g8xWBngMUJiFKtTHUkfrK575Uf/3laaf?=
 =?us-ascii?Q?ZYtlW4GFAGMsjqLmGeInJojk6R1Wq4bCgybengJ4Hwx34aaxKmSZXBD/Phx8?=
 =?us-ascii?Q?vX/XWvFJpVTpH/YWNMx/3fNZ7BPuVuL51oSjVr536D5zx9Q8JEqHjn1k2JpW?=
 =?us-ascii?Q?UYmmlX1PdSlzuZDy7W2SpSu3g/UdLh37ZfsUjdOOERqVvR0/9JNfRoT/YI2P?=
 =?us-ascii?Q?ZXZZRQFdr0+DxypxPrr3lwPZ5hDc3tOICRyZ2lFUFsh2geWUi/cHoD/dljwz?=
 =?us-ascii?Q?DGs/wvI0uzKO20EjwjOE1YaVNrwpL4QWaYDMWNdPfqUUn/3kWrVzDur4j21g?=
 =?us-ascii?Q?ecZgekEFTQWnJ4e+5Rgm/sKPGA6GE/MJgaPsM52vvPYUo/JnjAvUvyyahSZa?=
 =?us-ascii?Q?gVCIfV+9aA0uYdwX2SAslzeCmeV7E/35sMueKYU5hsu/m5RKwU5laZqoju3I?=
 =?us-ascii?Q?bklkXqHJLgdVyXMmyIV44FnZ48OyIP0VOSxrM3IsupFfFCT03P5/vaeLvvEl?=
 =?us-ascii?Q?a1j50yn9OyIjiyWMhqGTxTyxIt44lgJZJHcMVc3lmQdJ08Cinf1ay3U75KcU?=
 =?us-ascii?Q?XAqjjJPMi5fTOy08AEY9AY055pg3+X4mD8ufqIpR5hRLdJXKh5TmuTc3t2wP?=
 =?us-ascii?Q?aVR/nqFgHOHgusOOteUoDMriHBINnd4uQ6erKVDnZFE5GUcNs7LGFTSpxAaZ?=
 =?us-ascii?Q?61Um89DOWhguhp0Dw/GN0R2rTy4zJyBZ6rl3Zi6ls5cbk0YvSVkh3hf3roGf?=
 =?us-ascii?Q?yKJICwBcMeYPKSeLes5k2IErLR1FzR27VTPe/b7/jzD2GTXWsB7199e1h2mo?=
 =?us-ascii?Q?e3MrgO14Rqpg6pzvcKwrf2KZgnifTCAYtfKfSkG+XZYEvXZ79NKzoAb76UL6?=
 =?us-ascii?Q?DoNDaKeiHIb76rQ0w0XZmRjiAKU=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40055b04-1898-4531-de3b-08d9c62d8b83
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2021 16:01:56.7076 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IiK3YlMO1y0uI8qlF2UIcYYuBZwk1g1GCPsnQJ5mQX81ovzM9wsAqZqV4Cjyb/gfaqVkwABH5BVwW4oFzfJYmDxsOwvPAYlzz9JyjKI1PBI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6148
Received-SPF: pass client-ip=40.107.7.94;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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

Move the logic to more generic qemu_img_pipe_and_status(). Also behave
better when we have several -o options. And reuse argument parser of
course.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
---
 tests/qemu-iotests/iotests.py | 36 +++++++++++++++++------------------
 1 file changed, 17 insertions(+), 19 deletions(-)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 5a6bfcbb6a..f424e04573 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -160,9 +160,13 @@ def qemu_img_create_prepare_args(args: List[str]) -> List[str]:
     args = args[1:]
 
     p = argparse.ArgumentParser(allow_abbrev=False)
+    # -o option may be specified several times
+    p.add_argument('-o', action='append', default=[])
     p.add_argument('-f')
     parsed, remaining = p.parse_known_args(args)
 
+    opts_list = parsed.o
+
     result = ['create']
     if parsed.f is not None:
         result += ['-f', parsed.f]
@@ -171,8 +175,18 @@ def qemu_img_create_prepare_args(args: List[str]) -> List[str]:
     # like extended_l2 or compression_type for qcow2. Test may want to create
     # additional images in other formats that doesn't support these options.
     # So, use IMGOPTS only for images created in imgfmt format.
-    if parsed.f == imgfmt and 'IMGOPTS' in os.environ:
-        result += ['-o', os.environ['IMGOPTS']]
+    imgopts = os.environ.get('IMGOPTS')
+    if imgopts and parsed.f == imgfmt:
+        opts_list.insert(0, imgopts)
+
+    # default luks support
+    if parsed.f == 'luks' and \
+            all('key-secret' not in opts for opts in opts_list):
+        result += ['--object', luks_default_secret_object]
+        opts_list.append(luks_default_key_secret_opt)
+
+    for opts in opts_list:
+        result += ['-o', opts]
 
     result += remaining
 
@@ -203,23 +217,7 @@ def ordered_qmp(qmsg, conv_keys=True):
     return qmsg
 
 def qemu_img_create(*args):
-    args = list(args)
-
-    # default luks support
-    if '-f' in args and args[args.index('-f') + 1] == 'luks':
-        if '-o' in args:
-            i = args.index('-o')
-            if 'key-secret' not in args[i + 1]:
-                args[i + 1].append(luks_default_key_secret_opt)
-                args.insert(i + 2, '--object')
-                args.insert(i + 3, luks_default_secret_object)
-        else:
-            args = ['-o', luks_default_key_secret_opt,
-                    '--object', luks_default_secret_object] + args
-
-    args.insert(0, 'create')
-
-    return qemu_img(*args)
+    return qemu_img('create', *args)
 
 def qemu_img_measure(*args):
     return json.loads(qemu_img_pipe("measure", "--output", "json", *args))
-- 
2.31.1


