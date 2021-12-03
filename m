Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B8D0467820
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 14:23:15 +0100 (CET)
Received: from localhost ([::1]:37238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mt8Ww-0001S8-7l
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 08:23:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mt8Ij-0002A7-H9; Fri, 03 Dec 2021 08:08:34 -0500
Received: from mail-eopbgr40107.outbound.protection.outlook.com
 ([40.107.4.107]:61828 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mt8If-00071J-OA; Fri, 03 Dec 2021 08:08:32 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A0jqynyEeWGi1DV1ZyXljRkFg/BYFXagr5fr4eQ/sEBLMVBnVk1pU/GYYc7x4cuGH4sPwOuVP8vxMkH/oq4UIjQeO714CdruFinKCHRRW2Z0tUGIxzJRFTik/UPrNftgcrw2Op4UPPtwTWkODoQ83TkHP00uIuqP4OO8126N5/VehsndNbedStv2JnxcPvkb8NMArcpqtjsCl9wOUtOT1z2HbmQNH6sifNCTtiI8kBrVKgxPwY3I87FUzKBFKHBR+5qT19DezPgPbUt1dv4v2IlfyMeM+ypftifWDoc7yxtrJFoqtiXOHeZZevSpe03ZtuFP0iCA9DCB4whysaSfTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qRgWlaPlXz07pjacdZ8Q6G9t2x49Jbk6j/j+XkcksbI=;
 b=P413oYOmkjCtospLICG07FaR/IgJDO3YpnNECJT4zNbf7yGYDMXruEkGcIiT3Ef3LaUt4xQSv2Ocl08ZpI5TZ1V/AtPUkmK6uDgp8MwBCxNm3nKPryWkRALl4ibB5gMV2IBhuNpZcBXP9kctztJHwdUeMJWXXsWkFKVubZPUmpeeAtbZwa2X1YnT1/J34xoErKSNwkZcj/m5HzbyiYgGk1NxG95/nkQpQauD+X7AFxG/3/mXWFqpgIOF08h/m784JXS7s6fVradrF1X8flEI9BNznMXZs7QVVTZ7gE4ZoByH8VYnT+MwLjBJu8cAJQvp6uVbCstU8Gs0Ct7jHrtGuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qRgWlaPlXz07pjacdZ8Q6G9t2x49Jbk6j/j+XkcksbI=;
 b=DFMy8MMbzc8vyZDwckelxWSDYZw3BPScm3uCnMvR2SoyJMDYHqwYFsN26JD6Kgea/0rygj2DVRmmLn9TXQUbVQMy62t5L3NJL8aYu4iOdSGiaaSXIG0ahc7VtrdZCSjDGo44LtnmY2mxTH6nCd4P3KwTvKusKx0EAsNXSg6qy2I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM0PR08MB4515.eurprd08.prod.outlook.com (2603:10a6:208:148::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Fri, 3 Dec
 2021 13:08:05 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a%7]) with mapi id 15.20.4669.024; Fri, 3 Dec 2021
 13:08:08 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com
Subject: [PATCH v4 04/19] iotests.py: rewrite default luks support in qemu_img
Date: Fri,  3 Dec 2021 14:07:22 +0100
Message-Id: <20211203130737.2924594-5-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211203130737.2924594-1-vsementsov@virtuozzo.com>
References: <20211203130737.2924594-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM6P194CA0095.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:8f::36) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
Received: from kvm.ch-qa.sw.ru (130.117.225.5) by
 AM6P194CA0095.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:8f::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.16 via Frontend Transport; Fri, 3 Dec 2021 13:08:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f25ac73b-021e-45e2-d4ea-08d9b65df2fb
X-MS-TrafficTypeDiagnostic: AM0PR08MB4515:
X-Microsoft-Antispam-PRVS: <AM0PR08MB4515B860515B5536B75226C0C16A9@AM0PR08MB4515.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4sKrQL+5AeEdudimNBCsD4oJRAScwAT8QPXU7/PPOepkQVxz9u2l2YKGrc2ioIbMoUN/aCUxXfWHxYEyYtGxJjKoLk4hn7YQsJZaPVhvj1sH30sglWgOE8Ilzs2wN9qXdwR/CPgXwlXbs/NHw8KXGwq/TgjcTMC18MDAdwMcgQ0V+1xRYiD58/X3dFcgpfqiJIDN4aESWqk0j0DMhTLN9P1xtDF3wZtX+XF3/wm/ZEKSgLP5a6/zagr5PCIfHB224Jdqi5A2UkBKTeFl2FXxEHnzoaOSNJtXCLLO0YViFVT2IvyVpj9wT10kO4Sr1ROPtycoo9TSA7YCN69GAj86IEYDGMWsPn859ByjI0Lwu46eEXvj3CmJlWizG/X/fTP0oo27eHRcvLIKki7RL4UeukQOQQBgw3p4QNMaD0X9owo/h3w/Oynh7QKrT0NL0NibktRVHGEtAXW4AtIN56im/AjMO7nkD5vFm/4Ws80f8TMQmjP/xvkIXR7aPooFWqqIdScXLkw0PW8BWLmAQkD0Eu38CO0ZHoJe12KxCgGfKJDAeSDfBR7KQbwPK4vjlGKGlzxmqEY3iFA74U0MZjIScRMQKOixkwwwoiC9efHNTlhkn3C5RruOHfuRBscKwXaKasLH1hwbImQaG90c40tbuDWc2X8xOUV4m4lzN3vLwQkEcrOxxlEomn5HCWV/EyNinhZzfRCOqz52A6pdb10fzg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2906002)(4326008)(186003)(6512007)(52116002)(6506007)(1076003)(5660300002)(36756003)(86362001)(38100700002)(26005)(956004)(508600001)(2616005)(8676002)(316002)(6486002)(66476007)(8936002)(66946007)(66556008)(6666004)(83380400001)(38350700002)(6916009);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Srl9ayqZSZyEkWzHipFHwdjPMCgFEfg8OSC0LiYa25UcZWSk5L3o73OPrCSp?=
 =?us-ascii?Q?550LeUlp+kZGM3IUEUB4EDXG64ky8yCSN0uO1m4QxbzCRhfsaumhJywgBhVD?=
 =?us-ascii?Q?we5lYqfgsPYj/OV/HkKIUku6Qb/1Y7B97ZGRxHUlln2U1u0kNfT1A7pkvQtG?=
 =?us-ascii?Q?F+kRreODjAD/SJnvMU7wdTTFKw9j0pLJGbDdE0nBl/2bsOF0IAu/WpSfBI2a?=
 =?us-ascii?Q?U+QCsH8bPz2uS+c8CCYOqCJJyEbCbdVylVdbMRinNiZfonez4e+LxPZfXqTH?=
 =?us-ascii?Q?Yg3nU+Zi5sPrWxt/cvZweKoNLWJtzfUcvM291JgkKGOMx+vMZF4TJAJvQbH4?=
 =?us-ascii?Q?mzVYaeEgFr6RKX4xcp6u911MJO5moECj62kaFMmoJCIDUn17lVjbRS/t3XXE?=
 =?us-ascii?Q?BbGxblPjG0/z4b1R7zcJawD89NMDaz02uVscrTEAiRRViehZWLbZtAz9xfYW?=
 =?us-ascii?Q?mAzpiRw1BjEbxU0gFvz6F1ZaG8T51b/lxjliTFnB3K4Ixc2VrA6PzBtrAdzs?=
 =?us-ascii?Q?N8NmEkbos8UsvSGHEeJP4rV2Oc1NuvV3R8JacjlQSouVdiiuLMCW7/Rlu0rt?=
 =?us-ascii?Q?NMj6T1qxWvApFiE/BeWkrMBQzPI/5XPMnWpjx+onUSRn9+PqfNXjFcmYIHzN?=
 =?us-ascii?Q?F69hopSLzi1/EU269O/rmIZqImdJHv6dkDV1BH3ydZTb5bstiLCDE8k4VNMV?=
 =?us-ascii?Q?LEpP7XOEyZIfPvDz4JRcIVAfo0vumtxnJqDglFATICU/4pFqWZx7Qg89c79/?=
 =?us-ascii?Q?7l6xvjiEqpHs1ng8IzG7BRRnEPPUvGSg8kMhu5ZblhNkmKvW65GNwY4rD0YC?=
 =?us-ascii?Q?TODUKcaKnJMMC8y3Owy/eszVCDV/DF7WHPYUGsmWMgUtghbhZEPm8zwoxdVK?=
 =?us-ascii?Q?aJ+I6bq2nZCZVlMRAnADvCY6bLUJvEbfeR2YPni7+Yd9yj1PSHvQTYa/UoXJ?=
 =?us-ascii?Q?W0akodiD+lnt0cdymo0sBEZ31OCyQJZxrNNPsr7XrQYiikkydy/VAEkEuGEk?=
 =?us-ascii?Q?dnKt4jS55d0T3pImgUeQHOoyAfD4JUDLatGISM2PzZYqQzaANSwvEM5jDG5G?=
 =?us-ascii?Q?7Jr0Sz1S9bBU+j7p0VEKqeJsOHvI9TQFiE2tx0DrTFcycp7dwYIh6gpYv1El?=
 =?us-ascii?Q?dZeI0yCyw7L5KVGvnQIxQ/Yo5TZzInVeMbv/kV2b7ZOPp1m5hqLo4DheAH/P?=
 =?us-ascii?Q?rtecc1Ia4MZ4UFPu5Vbr00eEFFSAUKaOv6Mpqbs5o2igUqKrpsejyMJR6R19?=
 =?us-ascii?Q?yEpuNDopF0oJajKxrSmvRgli444Mup+AjOakzhyPcsqU9BcFvKTPbeBw/Peg?=
 =?us-ascii?Q?aYvFNwAdjzoiJv46EqtcwvdX7cIRS/PHzIZ02Hil3lvyMPb4WA/j1rGqF3Av?=
 =?us-ascii?Q?qgmPabIRAXqTjeJZoMd7zcOXTU4Tnqr/ZFz+URkpWXxKsLCZ1JJ0xCzgPhLu?=
 =?us-ascii?Q?23EaonjY3PyrzCOmQjRgxb7o5hw3vZcS+mDdGkgSCOdBIyhFIbHyV5+Oq7MZ?=
 =?us-ascii?Q?/oW8tH9hSeqo/P9qNk8kfC0FmABiAdM4wzsFAkG3TFuNyN9YzCJtQcOA6pC8?=
 =?us-ascii?Q?IYJFxNd/tw4lvpWb3VK9x3BC94n0VAbD08c7/plYt1doXf+NsbSaD5GU7o2d?=
 =?us-ascii?Q?HLCZKKihHj/oDjmTsk/A8h0p3WE4ZYx1W/iEGszCLHzTuEnBEGSdSmJuwe25?=
 =?us-ascii?Q?I4N8EQ=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f25ac73b-021e-45e2-d4ea-08d9b65df2fb
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2021 13:08:08.2833 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r2yRl6gWL3KgGev1g+GnqBi8Rdk51XxAp/1G0yFzl5lr0OFto+X3TkhX+i5x5r3xmZs3PyGssSTJ5YeQcAu6+5WL+x3e3AI5NY5XS35kS7c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4515
Received-SPF: pass client-ip=40.107.4.107;
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
index 4846ba7c60..055b162531 100644
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


