Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B753CF903
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 13:43:31 +0200 (CEST)
Received: from localhost ([::1]:46516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5o9q-0007TS-Mn
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 07:43:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m5o5d-0003DS-ID; Tue, 20 Jul 2021 07:39:09 -0400
Received: from mail-db8eur05on2091.outbound.protection.outlook.com
 ([40.107.20.91]:40417 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m5o5a-0007CC-Ho; Tue, 20 Jul 2021 07:39:09 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MSCDGglyJuipqVved3gLOEshOchNo+wYCCTrBVKAwO5mIycu3TAuvmKYnJrHlIBB2CZHV1/qK0G6ElzIj83+XspgdJmUuHq9yZG+zBJVcNqf7vwXl1mt8sZhiH/1zWfAo0p8CRL8EQxP4N/PU7n8Um2BstBhFwLAkjiIvObDrPzRtWqBqxKU7IIyFk9F4mWdKTd8jdqhS45zJq0vwTL4DMhGEarBnkWt1G5g3Rb5qa20/8inY2GkcRu591g4O5A+1e9lB8F2vBa0nstBc8+gRFmfyG9Gllh7wCcW3Thtvr4vGyVMitLC3ZTsKwb9tgUEzvyCcqwU6IUpp12kMSzgoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D8cmTDJcjiL7ldlibJc3KkBBRAfKQ97MiCAmsda9bdg=;
 b=kozBVbGS8CNWPGztFYEPDb5GGHfxNcf6UQDQFenZFqbfrVm/98NuPnal6jh48aEHjjqrqt6rTTet5sOQm3VP05gd0/Yge6E6DYKLyFU0QXQgudltNhh0I+n8tCqwYOQbM69KGRR13/imcn5PN90ban04+xncsfMCEdokgVH0hlhG3qnpLtxOEatsCdYVCpao9iHcgDOjWxdITt8HeL8+1C1uGvZzIZY/iu1jDe+2yvDbFOKBG53WJOz++6NrvxUgMIAwpAGsVSKuApRD+mQGnHW4DeM17eRj2f25N7W7s7vxF6JzR39qrZks0+B4w0O33YVQTqBZGzWuQQ6aAkSxVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D8cmTDJcjiL7ldlibJc3KkBBRAfKQ97MiCAmsda9bdg=;
 b=HWSNEyaGDI7yJK4Mrn+IJmp8wS2sbDx7C/zASNCCeeLjW9nnEhUR/xuWUxUg/xIBeQrOgggbpzRVawCnFkNeUunyAIgR2p0wQu2NZoPgf/SQS1Xsj6gd9MHv9d+BabIEYcMnNL/bVjYCR3dPl1YVRDKQSVbaI4K+uyC3kDu8+g8=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6119.eurprd08.prod.outlook.com (2603:10a6:20b:290::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.26; Tue, 20 Jul
 2021 11:38:55 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%6]) with mapi id 15.20.4331.034; Tue, 20 Jul 2021
 11:38:55 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com, den@openvz.org,
 jsnow@redhat.com, vsementsov@virtuozzo.com
Subject: [PATCH v2 04/17] iotests.py: rewrite default luks support in qemu_img
Date: Tue, 20 Jul 2021 14:38:19 +0300
Message-Id: <20210720113832.586428-5-vsementsov@virtuozzo.com>
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
 15.20.4331.25 via Frontend Transport; Tue, 20 Jul 2021 11:38:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 020a310f-8846-485a-d122-08d94b72f4e5
X-MS-TrafficTypeDiagnostic: AS8PR08MB6119:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB611906BF53929CA24BF947A0C1E29@AS8PR08MB6119.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gNb9J3pi8z19TNHnY6aDp9qjn9wjX7yfA/VtKzE0RxR7FvY4N+6ZLXWvT4t/WxU3K9uDSm/HBb8JuvchO7Dh86WXSObM45QOGX0hom8XaIRvwAGCrKbYEqETNModCOYVO/JZy6fnV8XAf3GXTFKfB3hJzD63PblLD1R2jbyw2KDlyemJ9iZOFHtJJqag47weXIY7vjTJDoj+/LRrLF+/G1/DXbEyxdQpUgVdzJ/71zyKQp2TtLUebP1cGBh+/f7LDy5oIEoyzFkNlLtB2RHVqKJzxpc//mrGESSDVyJRM8tMa5962qwBDLr7hQESUDyfEncg2HtYUJVkC1+c/1Jz5fEmsE4qJu8OqgRX4crRaHR2B1McMlydCYS6MwHXzZ7kKnAwhjQ4HvtdMabNmxrUtC/ASHoITxsnNoWVWoVbj6KLHvh2kwMARIcIP8R15G9XVP5QXdig5TD/5SpHMu3JgiiXGppx+UkyZ3kp8e6HVnl7j6RhZ+StLfe6nQf3VDHh48xjk480/Nuf07MiZ++Q7VUnRn+QDGbJcWuGbdF3GIoG8CMWtuWtswVgdqyqYFKqW3QyrnjQWfkG9fFj0FwJPAemgBmDNUAZtmjiVT0mzf5M0w7zrrtMhxYJw1YNqsY8sqVryq04muF/OzbgR2Zy78I+p6sISa8TaOKEhlAN8QDq4Wlg4xJM/TI4w7MWzX1d8MnZvuMS9EwFontzPD1ZFQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39840400004)(346002)(396003)(366004)(376002)(186003)(1076003)(478600001)(5660300002)(6512007)(6486002)(2906002)(83380400001)(316002)(956004)(2616005)(86362001)(107886003)(4326008)(8676002)(6506007)(6916009)(8936002)(26005)(38100700002)(66556008)(38350700002)(6666004)(66476007)(36756003)(52116002)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OvKMmNnTyuimrWGQeeGzly3tPSwwC2GVTmLm+y+HeIwAYorNA23Pp7HtTuSP?=
 =?us-ascii?Q?CVR1sDZ9NEHU0/fJ2Dh49aUaFMXfjrTycUmXjGI9O0lRXiZV9ZeQw/krMih6?=
 =?us-ascii?Q?6LrDTFq0rOdbV/109VxqhQCHG+Fv5fMg0l2qGwFfXjOPvQip+HTb4PvjGFIj?=
 =?us-ascii?Q?9J9dLo1o4CvK2CnWNFhFvuEIPQVBWzytI1DwkYlLlfB52Ifz5CIadgEENVg+?=
 =?us-ascii?Q?IrSm6q2aE1m78UX3w/m1npt4nj7OLSpPTuxEmwVj+4cFIr5U0YWM1WkAWsgG?=
 =?us-ascii?Q?71MWQOctmwbVVFTz6/jGCA/F5es/0gLAFfzpZS0yHwHWCY9s+8NDY05aK+YC?=
 =?us-ascii?Q?BXxFun5E6ssTOwIa0MIK+SVb1dKLGZ7ugZKvPNLtAMt+INbRaFKchp0DhzeD?=
 =?us-ascii?Q?s5b54ddSLBVF9oIHpTNDMykoMLOQ1Hj2lpAHkE0np45GszsjZaDmWkRpgN50?=
 =?us-ascii?Q?Czp7IWCGYjXSTbBaXJ3cn0QknnTuPDD1zMeCzNsIL9Sv3d/SOOh780Yxk+vx?=
 =?us-ascii?Q?rmYU1YUUhGBEbBZU46cXFCzVKroDkRP7xju9C08P5UJ+MYK3mYRgkz75C7dd?=
 =?us-ascii?Q?CtwR9Uepk3XLINEio9bSVaeversIGdn10Hv0I9GlELVdZwjPNBFuqMI82WbV?=
 =?us-ascii?Q?XuCgPsjAPDOU9g9YxZn5EYt9QcbCOw0/dS3WcbKt+goqY1dHYed6hjoGzZ5V?=
 =?us-ascii?Q?nblcz/n/TnOHH0PYEyEjgKV82vVJmjmWXxKP94bFRi3zn/k2tFz6jUWGateB?=
 =?us-ascii?Q?fF5M5mee+ciqf6cq8ShSyTZRYajVoCShgPp00laevwPqTPOFYoKMkLeDbl0a?=
 =?us-ascii?Q?9zkUmdgAw8EOSjozbYv8oAcwEluB/rkXhhE2lV6apctlC+RaKWkTOBKUxdhx?=
 =?us-ascii?Q?MtUyBC1+bJLoORpz7CeI3bufPdI+jY2eo9zepJPZnpnLJchI0cVHbrQDKEf9?=
 =?us-ascii?Q?MSTp/vKOpYNR4XN89bwqNRZBfKXzTG3+nAgA8ogUt0vc+pnDRt9EekpIqs1g?=
 =?us-ascii?Q?c89jCM4zSfTWmbq8f6wbu8qOfzdzHN92/A3jCcw9elc/ln1gkYl/F1/dT6NB?=
 =?us-ascii?Q?ai9QihbsCtaAcDymuwkU3KBJ0ZXREthO1AGZrSeqnp6mDd4sRFgrgxe2WlgY?=
 =?us-ascii?Q?9jG/nucjwwWspzftNCHNNah8Uw0xgP5wpOU0GGiAm2qodZuqwoUqe+dSHmBO?=
 =?us-ascii?Q?uJOwGnw5xWRUOkpAPPOTTD0wMz2VxGwA+k98TaTQ4DasoYXOvEN7MJGiUoDu?=
 =?us-ascii?Q?m2Zn0c4DMedbpV+J1U5+4TSq1XFtaActELKnvDc6O0SvTIBQodHzkpgBasaL?=
 =?us-ascii?Q?5sc3MwH7ezuVNeb74B16QfOk?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 020a310f-8846-485a-d122-08d94b72f4e5
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2021 11:38:55.8385 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZslmSy7rokeDstNk7f4Qr1rYzg2gthEDBBcT2BZadVJcbfrcJg6PBoMo4TVXWHsoeMoItbA+aYUmyfzBEbdyM9N2FsMNIiuECeExBwhtGa0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6119
Received-SPF: pass client-ip=40.107.20.91;
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

Move the logic to more generic qemu_img_pipe_and_status(). Also behave
better when we have several -o options. And reuse argument parser of
course.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/iotests.py | 36 +++++++++++++++++------------------
 1 file changed, 17 insertions(+), 19 deletions(-)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index def6ae2475..484f616270 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -128,9 +128,13 @@ def qemu_img_create_prepare_args(args: List[str]) -> List[str]:
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
@@ -139,8 +143,18 @@ def qemu_img_create_prepare_args(args: List[str]) -> List[str]:
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
 
@@ -171,23 +185,7 @@ def ordered_qmp(qmsg, conv_keys=True):
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
2.29.2


