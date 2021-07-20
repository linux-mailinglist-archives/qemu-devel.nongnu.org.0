Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8DC13CF909
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 13:46:09 +0200 (CEST)
Received: from localhost ([::1]:53674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5oCO-0003vd-QI
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 07:46:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m5o5V-0003C7-U9; Tue, 20 Jul 2021 07:39:02 -0400
Received: from mail-db8eur05on2136.outbound.protection.outlook.com
 ([40.107.20.136]:65205 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m5o5U-00077C-6b; Tue, 20 Jul 2021 07:39:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=errzxPq70FmgV1o05xtnJtXFlpNQamxzISG0w8lvwvMwGqxqY99BzoSLwJJSgBnJwBRVLRSyaauhIPD7P8/FQ8hkGHIrydVLXjcCO6JP0WXo46yfqOH90UZPxHca2hZdtDBLTXGEDZOAGGzdepAYwXTRveecFkfoqoS+9SCU/Wvh3pHW6B47PV8mHSz0K7lstQV64LHE8aXPdRF3EnzBREms5Qxv4Ec+68I37Rn2N104H1BmDNw+gsCjiP0fhwZ+kXUbrsPpu+7xLJd9zJhZhSl9nkV3CnSsJtw+mGRjJCg0I3nFFVBIjk5sPqud7s7PWh3aHJiVEDDrGIzvsLKwVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TAViqR+MKQeHKejPrJh81g3QDmpDY0X1jSzTOrl57MM=;
 b=bZgTUZ9d6Ucz/yqZ0W+slm+1oDuDiJKv9pa00kJ/NJ7HwKLQjVS4rlYNsJB6vs8a+ogSLnqQHAFqckqwmahRkYov7zKw/oLTr10lkjOFKFLz1AU9P2NiDjlI/k69RZoMYx4OyHMv1eP11ygGUETaBj8tVV5DGgPjZiCmwrSW4tVpRU3sDG6LT172ufmA2lmmEZu30Rp1h3xDyVWGzj09MJZxIIhbr+o1IL82jXnNmntGphQ/ozgykmX+8ZWT7PXVbZI0SgQrV9QDxHCdopzDDyRcN5BMpl+DuI74l7QhI64tVbYp2MStAjTo44OUMYhi81/ifhdbSi/KfqFBzq5XuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TAViqR+MKQeHKejPrJh81g3QDmpDY0X1jSzTOrl57MM=;
 b=ZMa/9YT8lg39kB0fr1F7FV6uBn+EBjB5dwM/QZLFyxeAkPDz0oRvfiMaZD1m8Ns2TxqYu249+1M721sgYrVqJ/l/AoESQaEvLG1/tCyTF9wiBQCsuVYsuDvIdx4QEdgIyWrGKoAjWYJ3TAzPMWt+c2R95bLVn06cwd7IMAf5xCg=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6119.eurprd08.prod.outlook.com (2603:10a6:20b:290::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.26; Tue, 20 Jul
 2021 11:38:53 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%6]) with mapi id 15.20.4331.034; Tue, 20 Jul 2021
 11:38:53 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com, den@openvz.org,
 jsnow@redhat.com, vsementsov@virtuozzo.com
Subject: [PATCH v2 02/17] iotests.py: qemu_img*("create"): support
 IMGOPTS='compression_type=zstd'
Date: Tue, 20 Jul 2021 14:38:17 +0300
Message-Id: <20210720113832.586428-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210720113832.586428-1-vsementsov@virtuozzo.com>
References: <20210720113832.586428-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR05CA0146.eurprd05.prod.outlook.com
 (2603:10a6:7:28::33) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (31.173.85.199) by
 HE1PR05CA0146.eurprd05.prod.outlook.com (2603:10a6:7:28::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.25 via Frontend Transport; Tue, 20 Jul 2021 11:38:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d58fa475-7806-48b3-1b51-08d94b72f332
X-MS-TrafficTypeDiagnostic: AS8PR08MB6119:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6119B5CE7D0F34A977602104C1E29@AS8PR08MB6119.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DmHp9bb5WSk0iZk62JE/Gohlht1vMIlfa8lLK6vDtJERety1gt4UYZKjxvfP2hBa9BegTl3sYLqT0WMihd9LUwsHhAomtkMGorTVfiHWTIhqxuoqEiKCBbwssTt4qboeH5ydIJXaM4fQ0/7xuTxwDCbWoeEnVPBl/IJlCzXE2HyF0panCu80RV9PcP7UJheRqrKmSDnAj50eQZN6JgoIuP3CLH1HfsEkl1uoLVVS9GWwdqOf5zokAFOtLW6Z1cwMcX/JwMsvobvTWo+QUb4na5IIMu9A5QZyFslcrDG2jeOfZyQMtoBEELBoqSNzjwFsvVEIIHjEQqVWRmCvy9lu57Tjq0ZM75ejwVFYkuScdJ2Zmko3XeqzK0Equg5i5wU2vzvjs4vJFEHK1tb9XR6OCYY2v3JTpvQ8CWpKUfAOetBpSPErasDEcKFRZz3usnsCGYd7oEizgq8kkRKqwu/Zb8rdjdTY+vcQkOS/sEmy9Ii9cLimRKfbNmnxw2llrZXOAAjJ82L7cJOtez9r3aG+uS7YceSLGO6Srf4knoIpIwmikmzCw4Q1DZ9M6/P2Z24p+WkQCS/iMQT3/Zs8EIEqKqw85bLccMsKZlgaX7BGj8tcFuwgGpoe/3iwVhmEuU3G2uxK+qCDhYD2g4Gp+NITH97EA1Sa7zyGj2mqeT9qtXGk2GNoE0cNQ/9xfj0acDO+qZEjNq6T9TpJbPtMbhZg9M8j9JeIwCMGUZ3mpRgcLfh8yoMgelFGZqF4BUgHLcYfg420HiZ3JOukx/0FpS2E+28OyoHLtwITc+MT0c2mpfg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39840400004)(346002)(396003)(366004)(376002)(186003)(1076003)(478600001)(5660300002)(6512007)(6486002)(2906002)(83380400001)(316002)(956004)(2616005)(86362001)(107886003)(4326008)(8676002)(6506007)(6916009)(8936002)(26005)(38100700002)(66556008)(38350700002)(6666004)(66476007)(36756003)(52116002)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yeCf4wsXXXTL/KLHhQQ7Ox8fl7wMrggFWeh7GsW5ENSM6TYNU7jaNIe5tEp7?=
 =?us-ascii?Q?971LweYd/+gKMhQRT4mK/8o0z14h0jyxG4f20NLS+NoUN5l9iVq25EgcdApf?=
 =?us-ascii?Q?tBxZt0j6vCpdCHeQw2cItDug76qfFPVXTEgO32usc7Qu2XzImG1FKl8GVuyh?=
 =?us-ascii?Q?kCwHm9b7Hn/Oxrr3sYvCVhB/r0C7o7BnDACgskIci9JKUT/5cugx+aXtOuMF?=
 =?us-ascii?Q?ZSi9k8ySxhXFScV6GzufFiuGxGEpC+waF0g+j51nLwVFlNNS2eY41iGurs+f?=
 =?us-ascii?Q?eL5krIKdpToKXPA4AFbccrt0ry9njVlpZPgULndPjG+lQqrBTxhomubrmZp2?=
 =?us-ascii?Q?qAHMAEzPU+Beh14d92AfB/X0xw78yWks51fbLmwOOEod2+CHUAPKx5ZhzWda?=
 =?us-ascii?Q?kZxYslFnNdCVNNslSRUOnUY6PTRpBlCcW29sM+9B+rVWFhGIU79IUPlbV2Vj?=
 =?us-ascii?Q?32zt0pLNL5GVqX7tniIC/Mo8HYl8hxoZqn8PcG4TWcdDFToph55uKXWFaYDJ?=
 =?us-ascii?Q?gz4SY9axnSTqwNQVC2gw0VXf6mnj8sxLZL6taNmbITflmymtHYfvo3CG3ItF?=
 =?us-ascii?Q?gBUVPn9W+/b1YMb100LqKULAfFltD4b7nKRNqk7OqzxbJM47R2lXUZvC3drh?=
 =?us-ascii?Q?KmAYV/GDeOayJTipsTDb5olzEQFKfD3Fz47qVJH1e5QyG1TOMpfP7w8Mk+d1?=
 =?us-ascii?Q?sxRd3YZXtmO9+GDnruTfamGPoy4ykzvmTCXl0xmDnjwJhjSZkfaat903pNUW?=
 =?us-ascii?Q?RDU0Sf7Gz1xx+1CsZptYZ8DkmRrI/nMj2K5KaZxCbezxCdKOSWX4mXpw3+oV?=
 =?us-ascii?Q?BhdswcmWf69C+EY4ZPFMg2WSfmjWh7YmHPPdVQN8PYdu3/vQSM6GFVbGdJ4k?=
 =?us-ascii?Q?mn2z71t2tw35ZCCzduUCCnhmadxTDWhfVw+rXfUIUJTs8kkhv1Ug5CeSayTu?=
 =?us-ascii?Q?z+UrcgO4nR9O1hS2u/GHcd1EUxm7X8ab3guS8vk6BJx+cmqxxlHj4/ZMpMkx?=
 =?us-ascii?Q?IOCcXRTAMO+yzDa+BsF/Tww398hMR9LRWOtPtzMqFCJd0zxKCRd8qeQItxkV?=
 =?us-ascii?Q?6uKCiFi15HcuXPI97DFdTUB4RV6VOfEf5uxAL88NoWlANYVxWNmwPWS1LHEU?=
 =?us-ascii?Q?RuYI9pGGT4tX1MRWvLUR8GJ9mxW6maqowgWMuoy5dW2vyaA2IFoRZ0gT1qXo?=
 =?us-ascii?Q?n1vPeDGRunT63QxoVBI/M8fTIlEanMCAi2PVrK0zqZ1h/P7ACW39F4Qc01cU?=
 =?us-ascii?Q?Uh9NBpPtxguEym8q5vqaSw9uoqI+t4VnXa9t2C76aNqdPgwhUTmKwvKTJr2q?=
 =?us-ascii?Q?E7/nvknYuzNYUTR2+a3MCliE?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d58fa475-7806-48b3-1b51-08d94b72f332
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2021 11:38:52.9830 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Db1/6T+3XrlxJnWQFysnl0pydtOgn76aHb1Pjh/ceN7uwqB9ySfg914EB5wc8yOFeqQKeiGhf/n0MswJsUaqK2MitV8CFc+9hLmQfHqHxfQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6119
Received-SPF: pass client-ip=40.107.20.136;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

Adding support of IMGOPTS (like in bash tests) allows user to pass a
lot of different options. Still, some may require additional logic.

Now we want compression_type option, so add some smart logic around it:
ignore compression_type=zstd in IMGOPTS, if test want qcow2 in
compatibility mode. As well, ignore compression_type for non-qcow2
formats.

Note that we may instead add support only to qemu_img_create(), but
that works bad:

1. We'll have to update a lot of tests to use qemu_img_create instead
   of qemu_img('create'). (still, we may want do it anyway, but no
   reason to create a dependancy between task of supporting IMGOPTS and
   updating a lot of tests)

2. Some tests use qemu_img_pipe('create', ..) - even more work on
   updating

3. Even if we update all tests to go through qemu_img_create, we'll
   need a way to avoid creating new tests using qemu_img*('create') -
   add assertions.. That doesn't seem good.

So, let's add support of IMGOPTS to most generic
qemu_img_pipe_and_status().

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/iotests.py | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 0d99dd841f..03cc00366e 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -16,6 +16,7 @@
 # along with this program.  If not, see <http://www.gnu.org/licenses/>.
 #
 
+import argparse
 import atexit
 import bz2
 from collections import OrderedDict
@@ -121,11 +122,35 @@ def qemu_tool_pipe_and_status(tool: str, args: Sequence[str],
                                {-subp.returncode}: {cmd}\n')
         return (output, subp.returncode)
 
+def qemu_img_create_prepare_args(args: List[str]) -> List[str]:
+    if not args or args[0] != 'create':
+        return list(args)
+    args = args[1:]
+
+    p = argparse.ArgumentParser(allow_abbrev=False)
+    p.add_argument('-f')
+    parsed, remaining = p.parse_known_args(args)
+
+    result = ['create']
+    if parsed.f is not None:
+        result += ['-f', parsed.f]
+
+    # IMGOPTS most probably contain options specific for the selected format,
+    # like extended_l2 or compression_type for qcow2. Test may want to create
+    # additional images in other formats that doesn't support these options.
+    # So, use IMGOPTS only for images created in imgfmt format.
+    if parsed.f == imgfmt and 'IMGOPTS' in os.environ:
+        result += ['-o', os.environ['IMGOPTS']]
+
+    result += remaining
+
+    return result
+
 def qemu_img_pipe_and_status(*args: str) -> Tuple[str, int]:
     """
     Run qemu-img and return both its output and its exit code
     """
-    full_args = qemu_img_args + list(args)
+    full_args = qemu_img_args + qemu_img_create_prepare_args(list(args))
     return qemu_tool_pipe_and_status('qemu-img', full_args)
 
 def qemu_img(*args: str) -> int:
-- 
2.29.2


