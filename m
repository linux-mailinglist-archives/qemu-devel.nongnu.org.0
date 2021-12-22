Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89A8A47D751
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 20:01:36 +0100 (CET)
Received: from localhost ([::1]:33576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n06rn-0003z2-DQ
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 14:01:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n06jj-0008Fr-AH; Wed, 22 Dec 2021 13:53:15 -0500
Received: from mail-vi1eur05on2137.outbound.protection.outlook.com
 ([40.107.21.137]:20601 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n06jh-0004am-Lh; Wed, 22 Dec 2021 13:53:14 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lFTmvaUgxzu85kMcHg5Kna+a9J+8we5UlxJLLuqZp6qBVdaKFFc0u3GIIGzKq7BOpNTq3Runs9Y4PDvwGY1LNkQTZJ82OgNV/Vm+hOS3SX8zKuvnaAo4GI+Viub4D0RtCIBRSB4WHAvqb+GatY3XRIMmK8v1CPSIwJ1i4ozA8xFpbdEXy+iQdGR1pcAldVs5NGUOR2CZhAiY7yw3CjxkjR5mDHwyp8au6LXvJMCMDGbJRVfDaNSuIXhSyvyHTI5JzNcUYVEFoWJQOPEZdzpoQIVmQEuIMkyIKNWm4d07S+yCa4MHtUPGGaAtF2znSmcso3vSooAibFhmWeLmYVBm/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cmr9n2riQ6bGqpdEnMEYSQxhI4hjxNtZIqsGLwjnqO0=;
 b=j9QiSqNKTTQqFTWAAhm9gsLIwXrtriMUrdlqTYB14jFfg94BLBOZ3dgAnNMa9xUy/2C9w0fzlhYFjsxlr+CIYX94FHF9ZPt3Pl85zytAIwMqanWiRLtQOdEE2JNu/qhRcB7DYUbR7p/pBNmNMl3v7os4V/CFJaMUUrhM1AzRip9Ux2Q+mqC6cV/eB8U7OUhomKB/iyP9D/9j9Ve7wHo4hnC5uvhdMXiQDaaMFSoas2EaG8n3qNzg8jwZwrKnWFDmRcaGxSTLuS2Y5dunJfECzxyGTzG7277o9h4mn7FN5ePDLYGKdqbGaclpyPyuVf0onTnk883LHHRALqMrUNToSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cmr9n2riQ6bGqpdEnMEYSQxhI4hjxNtZIqsGLwjnqO0=;
 b=lQPnqz2R+HSxDaXGkSFKjBAlKwTl+SRZSTjoL1Vxf3uwUkkS70NUJ6KyzEjnZR5T+9Am73y3iCC8kxOZMBaguck9MygAQB9occV3bPO9/RCaTht5YgoB06SOvkR2/X4qZMYuOAcNL45U1qsr+IsuqJe1AMTjX+JitR2HQ9m/CPc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM8PR08MB5857.eurprd08.prod.outlook.com (2603:10a6:20b:1d2::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.16; Wed, 22 Dec
 2021 18:53:03 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112%5]) with mapi id 15.20.4823.019; Wed, 22 Dec 2021
 18:53:03 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: richard.henderson@linaro.org, peter.maydell@linaro.org,
 vsementsov@virtuozzo.com, eblake@redhat.com, qemu-devel@nongnu.org,
 Nikita Lapshin <nikita.lapshin@virtuozzo.com>
Subject: [PULL 5/7] iotests.py: add and use qemu_io_wrap_args()
Date: Wed, 22 Dec 2021 19:52:46 +0100
Message-Id: <20211222185248.466010-6-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211222185248.466010-1-vsementsov@virtuozzo.com>
References: <20211222185248.466010-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM7PR02CA0009.eurprd02.prod.outlook.com
 (2603:10a6:20b:100::19) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 651ba886-da80-4317-45f5-08d9c57c4867
X-MS-TrafficTypeDiagnostic: AM8PR08MB5857:EE_
X-Microsoft-Antispam-PRVS: <AM8PR08MB58576DBC91C53CFFCF3FD37CC17D9@AM8PR08MB5857.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: f7NzHz/jCZQFoAH4gLv7z9e8Ug+mLMMaS3iJQU2k87NjqjWBL1Z0YtQWcIcw8vQQtWQbQAty7iMukBbDIz78+nJKfLyR14Qf72fIR0JI0h4LqeIXo7cGqLDk3FZ0Zppm2mm0NThzf7cmS1OnqrwkHMSpZTAIDjpuSqv7YJyrNT3fQM8F1uIjwLy5+vkYShTqyiQ/tUYAeWYE+2T/MF6qgJ1cIjDNF2W5KzdiJUjhjh60fES+4TUu7RThWm4l37HE1SZimLMxuCprjNhTUVf5SbI5Qwg9IVsxCxCusqlbcuxe0Mf+hR0RhXX21xXxOg9f6o9wBBFzPWGwg4D2pUOxwZ43qiDC8FCAaN4P6R5Pgws1V84MGhhCkOpzMTIZ1WP7b3MzL7iGiS9+gdP6EW+O3Cps5mNAwCvACU+iAfuooPpCJRxU+SO6SonWmzHpoZ9+UJnKajqlnSi1JhuUbJrpTjoqO7c2LVysQ3r8l6DnL28Ap9Ep3ZE9jpWAdK1fywAHk7xxzRbxeliol63/ekhxcxVy5RZYFVaRwxyvRGeapUTY+dZZ+bCloEGmCMLqrzowOIRIUK/iwV/qefT6H+ec7QZHM1Yf3opQfqDvHQe4xuIt1+Sd1UQaEenUsrnqo1V0jL15CmO5Hh7movTcSe4GftclvHKCmYl0KpEUkJy2T7gqgPSWFuAwZ+XDGwP/5PMcbq0MKF8WXtW5UhFKouylQg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(107886003)(2616005)(6512007)(4326008)(6486002)(38350700002)(38100700002)(6506007)(83380400001)(66556008)(66476007)(36756003)(26005)(66946007)(5660300002)(8676002)(8936002)(186003)(6666004)(6916009)(2906002)(52116002)(86362001)(508600001)(316002)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xyUxbOHAPUIgFpDRtJ6JJhtIpRcGOvuiJ6Q6gTimRmN7SIVG3mgGVzWmnA5x?=
 =?us-ascii?Q?TCKnakg9tFax6aYnh3ufkYuwiNvlf4jpPkj8gRkOa/koTtND8wvWdmtiKDQk?=
 =?us-ascii?Q?hNaxWm30OCHOWAOKfkZQE4GMfBqfejCGTzenqgcggVrtyoIWAF2EJV9FrRzL?=
 =?us-ascii?Q?cdRnB16V0xxZw3ymLp74VQmvu7/R1a4b7SLGdPgGLGyur755PBYaK8f9kDcF?=
 =?us-ascii?Q?kYXgCwRPRGOHQFzRIP00WhVqB/hCvUg08fTd5ETiu0yh3nLAIfHz+VFYsyFM?=
 =?us-ascii?Q?8riN8p94yQgLKqfHiZr55YrOxIGbIxiIQN2bYc52IXjzITK4NAC9cQEAnfrW?=
 =?us-ascii?Q?KIeoogbFtXN86B7S4Lk+W3gaM9bz+ayu+7LwEAZzNrec32V0ahoQNgXNxwHO?=
 =?us-ascii?Q?NZR38GDeYun2qXlRrlZCkt5v14LrYI0ScoaP5KzOERcE5MJp4VzBE+dxGoCU?=
 =?us-ascii?Q?3LPLbEBYkBV64d+3b3XLNOEDZLyeLBdAZHDKxhD47o14dzSr94WlZleIkz7e?=
 =?us-ascii?Q?K6LoMrdMCaSnOAXZ8N9J5+48oJeKYKBk2YmTBhNGCBOxeyym5k9vRE8OYZ1k?=
 =?us-ascii?Q?J3POTr1N4UoNHKAIxbeY8X/ib1hBuCGTTMTsZpDygijYb0/pJl5CcN9egPML?=
 =?us-ascii?Q?sJv7vD73PvcQKbE9ooA1j0j6B0PyzX0DCoFHDQef8A4dyHdYkVyGcrmX2U6e?=
 =?us-ascii?Q?b2ApQig+vpn0Mx4gsFRG88eYoQVhg/zEqLtYkcBbno+q1x1cIF2W3AUUW258?=
 =?us-ascii?Q?3U4Hv/kti/jWtwJMpzOt+SN5zRSxwntzCiP/YcTNFVArZX2xzucPUw9ZAqcE?=
 =?us-ascii?Q?/CvObS987fVDKp+4Wg3t+Az3yLV3iZ1ZFOg47VL5NWg18xrI7Z94qQPasgdE?=
 =?us-ascii?Q?RHIQrgMG2qFO/YYyVwvWLrC6zaIKIxbBVAp8RpvbB7XjCKpMrMjnnnJvxSgB?=
 =?us-ascii?Q?1o+kTqxrVW7oIDi7KQXVsKRStGZvxjkJxXFmYxJlqDOA0MRI6Jrsrl+lJB04?=
 =?us-ascii?Q?A1bngujpvshum0h9xflqcJPikIT6tj+ph8FMY8uIuxed+bJKu2haocdSVaBb?=
 =?us-ascii?Q?1eYHH9Yyvj8awaiCd3kB0CsPHkclUQ/op9d9BQYQv6l18qK+isV8MyRBG7pt?=
 =?us-ascii?Q?ZqGzTpMCWXmMh0oIwNZyxVdk2TENsECeFsRKKgu+5OCCgmx4Rv0DGODOqIER?=
 =?us-ascii?Q?x1OimA56w3iiEX5QoK6Lupg/NQrUiMJYg818CF8fwV83S51HgzXS+fHsP04w?=
 =?us-ascii?Q?xgeNliVstwIC3IxmPdhs2nKOjKpKGS7q66xwhjAEs7cS5pO3kvcFKJVBRRdN?=
 =?us-ascii?Q?ncAOjlu6H+wuba+yme/JvuxrMYKkQ42zwCBVPFwavMkad5ljsZyDb7TBUArg?=
 =?us-ascii?Q?rTgdItWT6se6jinYxr83YhrdtIycEQThP+eG8XMy3pVc1jisPAJOyOolFCQY?=
 =?us-ascii?Q?q8ARjnaOV3jH4yhBGr+f6EIxblmmEFjCgZ68euLOM4tzx96UC/6IYr4mrDQ1?=
 =?us-ascii?Q?ZecWcU69+iUrtXrWHAU4UQCvoPnSloibWv40GUMmmifyyQw3mwbnxU+lONCp?=
 =?us-ascii?Q?GIxl3h1o/oUYplNafV744AcOkrn06J3R4+16XfBrvoYHdueCU73mTcOwBVEf?=
 =?us-ascii?Q?ztiJGGTN/2AtSz9odZjb0tqNtWpgUjjjqv/FZhYWwSMhLb+027JH/MyFRQWt?=
 =?us-ascii?Q?hNHxSj93O80AuuD4tzvZcYpyeS0=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 651ba886-da80-4317-45f5-08d9c57c4867
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2021 18:53:03.1761 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Letd2DER7XpoCgnI5eA3hOBK3oYVRHJhO4NwzNmkss5X4wo9eQeUNKESab48kbP6+TlqxOd2jZAgoPOOniVy4ZThl2kER6YUCesP9oHUZQ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5857
Received-SPF: pass client-ip=40.107.21.137;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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

For qemu_io* functions support --image-opts argument, which conflicts
with -f argument from qemu_io_args.

For QemuIoInteractive use new wrapper as well, which allows relying on
default format.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Nikita Lapshin <nikita.lapshin@virtuozzo.com>
---
 tests/qemu-iotests/iotests.py | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 7f9a8bf012..1ed3eb1058 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -240,10 +240,15 @@ def img_info_log(filename, filter_path=None, imgopts=False, extra_args=()):
         filter_path = filename
     log(filter_img_info(output, filter_path))
 
+def qemu_io_wrap_args(args: Sequence[str]) -> List[str]:
+    if '-f' in args or '--image-opts' in args:
+        return qemu_io_args_no_fmt + list(args)
+    else:
+        return qemu_io_args + list(args)
+
 def qemu_io(*args):
     '''Run qemu-io and return the stdout data'''
-    args = qemu_io_args + list(args)
-    return qemu_tool_pipe_and_status('qemu-io', args)[0]
+    return qemu_tool_pipe_and_status('qemu-io', qemu_io_wrap_args(args))[0]
 
 def qemu_io_log(*args):
     result = qemu_io(*args)
@@ -252,12 +257,7 @@ def qemu_io_log(*args):
 
 def qemu_io_silent(*args):
     '''Run qemu-io and return the exit code, suppressing stdout'''
-    if '-f' in args or '--image-opts' in args:
-        default_args = qemu_io_args_no_fmt
-    else:
-        default_args = qemu_io_args
-
-    args = default_args + list(args)
+    args = qemu_io_wrap_args(args)
     result = subprocess.run(args, stdout=subprocess.DEVNULL, check=False)
     if result.returncode < 0:
         sys.stderr.write('qemu-io received signal %i: %s\n' %
@@ -266,14 +266,14 @@ def qemu_io_silent(*args):
 
 def qemu_io_silent_check(*args):
     '''Run qemu-io and return the true if subprocess returned 0'''
-    args = qemu_io_args + list(args)
+    args = qemu_io_wrap_args(args)
     result = subprocess.run(args, stdout=subprocess.DEVNULL,
                             stderr=subprocess.STDOUT, check=False)
     return result.returncode == 0
 
 class QemuIoInteractive:
     def __init__(self, *args):
-        self.args = qemu_io_args_no_fmt + list(args)
+        self.args = qemu_io_wrap_args(args)
         # We need to keep the Popen objext around, and not
         # close it immediately. Therefore, disable the pylint check:
         # pylint: disable=consider-using-with
-- 
2.31.1


