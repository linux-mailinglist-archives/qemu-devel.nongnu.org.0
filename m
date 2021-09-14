Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 760A040ABBD
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 12:31:34 +0200 (CEST)
Received: from localhost ([::1]:58588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ5iv-0003to-GK
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 06:31:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mQ5dr-0004Lm-LQ; Tue, 14 Sep 2021 06:26:19 -0400
Received: from mail-eopbgr70123.outbound.protection.outlook.com
 ([40.107.7.123]:7651 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mQ5dp-0003M0-Lb; Tue, 14 Sep 2021 06:26:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZhT91DY3h0TSnZr1MqDQkdbx7R+ydW4Pc5MEadHFZ1Jio40VKQDHMwHsrZByiuEo7rKsW9jPSXkJNTkMr3fswwoPIxa1G1sI/jtkD5mP+iBdAE87RPPZxZnEJIqMVNbEZV0ISR9fLfAVUgotbFCMfb8yPV7wxcnAaZHkz4JrKWbHP/vtWJnGJkCt1X3MRvG3mX76zLUlK55aIhe+mFMxs+qzL4UE/qZo0pUu83P6yZT5yLXtNg9Q82Tifso77lMD/dwpBzG8mXyZaglAzs7UUbvfT2ywYuOnUiTL8M8cfwCIvvdt/yWTThde3ck9BT++o6KaFA8VsYdoKUWIrut3pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=yLnJ9lhBOr4HM/2jKbVZFerN95grt02CoNvIgf6YH0I=;
 b=ULgDGiYY0AUpueSsn3Ag9OfepKqtHedrgZ2bBOz3k06HcLeT5CoVwQHo7zzaQJ/qBcYuUxHXPloVRFqxThSSW2PW4AlExKi64bGGwk+yrM1vPP22uOH+7OI4+sFAZ4BJugB9eOO8EpZwSvwSJg/ILzgplEcSPF0TLSZb/pZWQ+8ZIA6G7OV5H/x4UBmuqmSmBCtGyLrbUERMNEM0y3K8TCdrWaq9ru2hNP3lPeno4rliQujg85jCFMETtmuvdT1rVtF2r0PXCKnNetujOL1HbXhIfP/CXomtOFM6yfdNDFIYPcZ6PoY+tLTkPoUtXd5yyxLX5fcevzh9PlbowUIIHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yLnJ9lhBOr4HM/2jKbVZFerN95grt02CoNvIgf6YH0I=;
 b=dHB1z6vxo27wbxnCuSUJFvQc6mrn5vjA9ZTbKK7HYA1kWFMQcWfXWwQ/G/QjBLOngmMUpWyr+L77GgllgeDvrzIJRGY+X28IoW4TrWKtKMyJZb0v7dYatKABPo9q92ahISjl8Vzu/VeP/Ca/TQXIZlhqVkZ7J3OmSqWJt2IS2XY=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1716.eurprd08.prod.outlook.com (2603:10a6:203:39::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.18; Tue, 14 Sep
 2021 10:26:09 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4500.019; Tue, 14 Sep 2021
 10:26:09 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com
Subject: [PATCH v3 02/17] iotests.py: qemu_img*("create"): support
 IMGOPTS='compression_type=zstd'
Date: Tue, 14 Sep 2021 13:25:32 +0300
Message-Id: <20210914102547.83963-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210914102547.83963-1-vsementsov@virtuozzo.com>
References: <20210914102547.83963-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1P191CA0004.EURP191.PROD.OUTLOOK.COM (2603:10a6:3:cf::14)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.196) by
 HE1P191CA0004.EURP191.PROD.OUTLOOK.COM (2603:10a6:3:cf::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Tue, 14 Sep 2021 10:26:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0ed61147-f5e0-4763-76ac-08d9776a112f
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1716:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB1716ECDBB0CE5B23E2A624BEC1DA9@AM5PR0801MB1716.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /kpZ9Wyp8PNr51CTs8l/8+V4udlbToThWN75t2d8JenuOtehC/5DQvjz3Et2AUawzP23wVRgz+1ZkgK7yl7iVakoDpFDuGtu24hiWhHIERXAHcqcs4k3u3d+TN/4zo3MaGHBMydiZp4i0W3/jehM/N0Obg4dwXf6TI5JQQ063B80Flr9CbPLpi1K6o1doBPK0xE+sjB7Hj9DUneUPoIfQStFWtssSjkghXvFLEQZyFs/pnm9CTm/UjZtAsi6+g3Fq1Hk8HVxi0jZlChMGaMyGvyvEbVJQ2/joiRPYGh6F/X378XV/G2LiI5NEy9hiSYO9W8Zo7NOzGLIgYUB0f/Jptcgund9/yLoYAoSVSYjuVnBawE9iQ1hM+bclc3r7sGrpXCy+82GVpUzF2ngD8DqEL4tNjV82opP+gL8T8ZdXtzNIeRN6PHKpdxV5BRd5rjLSD2fcdpM5zAFOwqbW7j9xD6q64DlhgFlkYE24/vK38T42mafqpgnqgZ45cV6ab/gGYKPFifvKMpiotnGpUT2zkQYzj5u3+qnv24SG0IhGdDtoH2FK+DfBCT7G1RVFDuZHZ3iq7KxO2uyUenxYVydz4dsNjokEz0HO8XgxTnXs44eYeZ4mmO+MC9t/8FmuqjNsTyLJxwIacpujK9Ts7JWRKLYclwS6UCoez5ktgbsQDXUtZ9C1kqSSWp3/T4FkWPpwXC+TKx3ZswaOeS8CDd3kUrz3aKdgUZ2NLUyjHHOAWNCFGjiTpKwmrMddNYhLmRHHgaj06z1yN1OkoCl97zfKTWHAnZ2EHnliC4gqT3q2NU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(346002)(376002)(39850400004)(136003)(478600001)(66946007)(66476007)(66556008)(36756003)(6512007)(52116002)(186003)(4326008)(6916009)(5660300002)(2906002)(83380400001)(86362001)(2616005)(8676002)(38100700002)(38350700002)(956004)(6666004)(26005)(316002)(6486002)(8936002)(6506007)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UjA/PFjz8PuHP3o7+mE7SMloY+0cHmpZiczLFNTPG0jsDRJ0W+A+S7j+rEkh?=
 =?us-ascii?Q?AyYFLUuL29yQ3fxSy1GQuzifoFYbW81xbw8J+2xpI4AFaF4w9Ts+fcAbFlKY?=
 =?us-ascii?Q?0gcoWvcmvdB/dITqtEmcioXXIPG82zd0mxkNNL86xlT5AQ+28dkdH4YFn4OQ?=
 =?us-ascii?Q?E8HF2CK5yTer5RLwqNhD8BcdYoliuzWMpLbyD9d9UsI2ydEJg2kHlWjihk7/?=
 =?us-ascii?Q?plmpelizUpchhiOt90IdDmwr516Y3A2vZ3UPLo0JnKNJ8Dh1YNvprg6y+/NL?=
 =?us-ascii?Q?tOOGXdvVpSQpJ2ViZdxwhqT3cUh/6nrQXcBohJ7NZjZCIEUHhiFsR8QGE1FR?=
 =?us-ascii?Q?Y357u1h2+khZiaQOBcuhnPQrnnlzy5SMkPWiztxCW3OtXzAhnjs1DrePPuAN?=
 =?us-ascii?Q?K3b2H4BqZex1szi1QYM6lzxFmx3/mP7ZEeeV0mBdCPlVthFOMiA2NQ4hD2Xe?=
 =?us-ascii?Q?tWGiJMA0Xe84ac8MR9rzYq49Z05rW84UuxSylscV6f8cgkuoLaTLR8ntz5vK?=
 =?us-ascii?Q?YEo7uaX4Bmg6HmS5ZWu0Leaq3zZ2lA7Tw5gifoIGwuYT6rj8yWQLNHULAvHi?=
 =?us-ascii?Q?2sSO3m3lajJu8nPeNx2BCaXZlkVLl3sbstQCOYEuCokx9RNzPJq12ZFURzS2?=
 =?us-ascii?Q?Xi1woyLE5ViNdIxrYIE8/TA+JQ2r+0IhfJMVfQiNGhuWwgvK6dwSPkvkEnuP?=
 =?us-ascii?Q?PWLa1OgCprayqAks+d5vEKkCTaST/BsGiYDFrhXO/OfaL3OnuEdyWaUbvgCo?=
 =?us-ascii?Q?T4BU8ypTATonDkeEe7UmbGJWwZJB63dw6ZDbfp67/smmV1rMmczp2RrCdudZ?=
 =?us-ascii?Q?x/D4jXEv+3mlCjc+N7Pf1Blu4/+WNmyWCKYjKPOGLU2XArH0bswv0Djj4/9q?=
 =?us-ascii?Q?phG968pxyJN9m5CTogTiXE/EjeYUtPwzZtp1TQpY2176bCAQ5HM8uL8+Hy32?=
 =?us-ascii?Q?wztb+FwVhfJfNyH/LlUc/V4CvTeiieKV/rO/yJahiuNHM/UNSBq2tXWdl8zX?=
 =?us-ascii?Q?zfh2A54tdXOa9SSccAznVYLBDgyYDdwOtZWlKCX2ukWwcXgK9dDttZ4lY6wK?=
 =?us-ascii?Q?oybo801aub1wzElS6SYyHXnwaJozrSggtqZQpyaW2XDWlBVbMLfJ/l4rXYyu?=
 =?us-ascii?Q?+1m81QCFJvJ995jHXJyMf3G7KfrVMn08SWxT83rKj+Bl8uRnvXgZddb9u2qE?=
 =?us-ascii?Q?P6/4wyB4B1leo5x1Jb3CqmfTJB+pcbkvAQz2dKmB2cB3sYw9CgANliFwwR1+?=
 =?us-ascii?Q?7JgaKBGjSNTuIuZPxdjzqyYP/shdDYDI/uGZjTnKBXRqsas3ExxWS0eHqTc3?=
 =?us-ascii?Q?BeobBw6OeKUpOGWZEPuJe+dp?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ed61147-f5e0-4763-76ac-08d9776a112f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2021 10:26:08.9422 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bWsQokvbtN7nXppW7p0DObrZ6Dzof8qZoGFKEW9EzSipUdH8QJNK3ML4Bok3IfKHP8gO8IVwzgZHa3qebJi05zCyp3oeB5PuVRBwQ2N3OfY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1716
Received-SPF: pass client-ip=40.107.7.123;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
---
 tests/qemu-iotests/iotests.py | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 782d4f0e21..c878fdebb9 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -16,6 +16,7 @@
 # along with this program.  If not, see <http://www.gnu.org/licenses/>.
 #
 
+import argparse
 import atexit
 import bz2
 from collections import OrderedDict
@@ -139,11 +140,35 @@ def qemu_tool_pipe_and_status(tool: str, args: Sequence[str],
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


