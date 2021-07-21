Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46AAA3D0C78
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 12:35:35 +0200 (CEST)
Received: from localhost ([::1]:40014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m69Ze-0006Ro-BN
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 06:35:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m697r-0008D3-SC; Wed, 21 Jul 2021 06:06:51 -0400
Received: from mail-vi1eur05on2135.outbound.protection.outlook.com
 ([40.107.21.135]:17760 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m697q-0002He-2L; Wed, 21 Jul 2021 06:06:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G/VHHuZJPXXWnRSeQW20Wv7aLfdxAWjViq1sCOvrokosDqwGg3jN9Zu0Pe2eCQDa8xcMpbkdjkENHTp4UcHCHZxgPqn/xuNcGOcTKj9BcQT40N3buf1U9swwQm7JSAnLF6fQftbr61VLe53Vtnkx1rZ+Lgbmaz0eB4Rtv9RxonH/4cFL2dL2WOVPpq/gqqiDcQf38mS5kevnEgxarKI2FQsUjKRYuzCyQ0qqwMSvdby25AcEkJ1pBeEyqbVFw107WR+zBphC3MPbW8+O2f3EraVGeX/0RvoJsOh1VFSm3w71Z8OQoFb5nTmMFwWZc/UN4hUAE7IBjF+T5JwXjlz1Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6FJWIhLdp3ZBunz4U3SknoYuQthg0pb2m2HtQWXoZ80=;
 b=i+SNntES5FLT5q3PBHs5iP0NMREIAACR6ZJVFQuh97HH7BkIUcDGaXLvI9OkyBq8mPdjzzJqzC76J1RKZWA5tLdKxKisIgMYvSFBstlSOlIYWDOhda985pQazloyNk0NZm1FKCW3d3bqc51ilAVrINLCFgvGjk7XrT5KEBlWfnm6UBJDj9ty2npF6IsX81jKoa/J1c+/sEsqUxNymSXztLSUFHMFfu2s1xg8twDtlcZBLRi8dsiLAv/1l7aP02PqxYmq7e8k1vvvc2laUPEFoFBttkCgq7xYPwWFArJfg/1HcgT597wfrnkIwt/SL7mKkfB+U2qhqp7vUTgqpOpdCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6FJWIhLdp3ZBunz4U3SknoYuQthg0pb2m2HtQWXoZ80=;
 b=AaU9zbtj0JoVWFmCepy4ImMXD170rxbzRxxI+KcQpjJVCwmROF3MAzd6xE6hK2SwVCcKAvm1hOc4Hxj6d4fMh/H7jZ2cf2U6s64UkcmOSi25BFBQ/QNS2G9T5DIQ/8qujsVJPFK/6sHkxZ++bXrW8e0fFCyzbtycDFGkdt9IJ/w=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.25; Wed, 21 Jul
 2021 10:06:42 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%6]) with mapi id 15.20.4331.034; Wed, 21 Jul 2021
 10:06:42 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v6 23/33] python/qemu/machine.py: refactor _qemu_args()
Date: Wed, 21 Jul 2021 13:05:45 +0300
Message-Id: <20210721100555.45594-24-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210721100555.45594-1-vsementsov@virtuozzo.com>
References: <20210721100555.45594-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR0701CA0068.eurprd07.prod.outlook.com
 (2603:10a6:3:64::12) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.211) by
 HE1PR0701CA0068.eurprd07.prod.outlook.com (2603:10a6:3:64::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.12 via Frontend Transport; Wed, 21 Jul 2021 10:06:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 695fa1ba-caf3-47e8-a967-08d94c2f3d17
X-MS-TrafficTypeDiagnostic: AM7PR08MB5494:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR08MB54941CD6BDE1F863A04E93FEC1E39@AM7PR08MB5494.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YpFrGrMiZy1kEsZ5m7cqgsPSq1ZE0nSg6UpMlAJ6yoyRZTVJqVWN3kWTP3Gw3bNBH4iBVtQ4fEdUEpIRvRTTIlqCi7SN0BVTHx5gjT19NZczphlx7UUvaJM9FirDjdV4M3yi2eZrqvLZd2zRY1GcjcdfKE1xd885TOuJgaQze2hCgjgnIHANNIK7qQXauWkc4zSRSULT403RbSjT9L/hxCc5OjAbZx57BKwExkQsSkpGMNO2mO70Y6Figy9RZn+TD2chHR9TS318caDR1MNALNJ2HlxVqno5k2x0+W9U823lGGQjVQgIEz09DVVgMh9ijTHWhqjTB4g0ryH+5zokFtYWJb5WSbR5Iap9z4sq2maWGWnzu4QIADjGhaCpEoIokQ1SGCvCo28eFW1zMoy06is+kIQYJ4JHU/2TutcEs7l8IA7i/roUK8S5KoJV47rS6JhSXkzYgDK7PDrcZjiDXehP/LKhp/Fx5CO5/PTQLIFrMtWkDH7ZHfqRZOcRV5K1hlQZxHnsNtQ+wTN9F+7RdiUhqAqGtXvDfqzLd0riiex5bi7g9MN7DtDNEV1ttZXzUCUWhW485RYF8Mf2A9kW5L1Qbx1Dt9tlXoPi2ULxwHCm10Vqzj/F5Gwi2AQD2OJ16VETUoqe0tIwNxXBLVBApWVTDLA2RW9Pqh+eUq4Klkwk/oVFr57Brd5tYUsCOyq9nOLt5xY52LcFC909Wx00+A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(376002)(366004)(346002)(396003)(136003)(4326008)(36756003)(186003)(8676002)(478600001)(66946007)(86362001)(83380400001)(66476007)(7416002)(8936002)(66556008)(5660300002)(2616005)(956004)(26005)(6916009)(52116002)(2906002)(316002)(6486002)(6512007)(6506007)(1076003)(38100700002)(38350700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?na9/SP8wLBbslk7pXNaW8qE3VixwSkGwW+slw8teb7VGbhngqu0Akme4FEnj?=
 =?us-ascii?Q?M14zzvJj5KuQg63PvsKkGNSLB/ziZaEhdieLjWwC7JfOhoVtvX+y8XcdqCXV?=
 =?us-ascii?Q?hQFso9gbxIH9/TauL96pVVWuOTx2bTuc0lGCnnKeR/V87+AOGj/qUizFitMq?=
 =?us-ascii?Q?hM+UKYiuMXiuhLAYGGlBY2qoFoBpmV0te21PC1iAA5ONOWjBTxZZv9/8XwBl?=
 =?us-ascii?Q?Ag9t5Fx/clpGFIaD9nJ3XB1c17UmD/GNw7K8Jiv2czMxh35/8tBl+tDvPd9s?=
 =?us-ascii?Q?ssgz3DCQT4g6xPE8wD3CIUsmLCsgajjOXPkHbAUWvEUkduNIqr39tLTk8eiK?=
 =?us-ascii?Q?Ob+JAlhnn91iD08YIlZH8nL8U1i8t+Lm/DMKghES2Ytd3L+Pne0LOBWGHQQz?=
 =?us-ascii?Q?fzT/oIXWdvHoIT/bW8zlXVSfSu/FPQcqVopfmXhccui7P7jxYk9QzkAu6Wbs?=
 =?us-ascii?Q?OdcVxZsTqZquE1TeijeIkzEXvM8EZXFIEzdTKgpNtO8SEgQUB2NJt1YiyrOX?=
 =?us-ascii?Q?/WljlFsdv7g5Aiy79xLGUUs2o5ejOF7uzlj309dyepul5JzGQsisATvPygo2?=
 =?us-ascii?Q?OKu8IbuOzZ36GPNuhY0MvofFkgX1DXq9yDN5ZbhzSxP2YcfD4/RJj+cyuSd6?=
 =?us-ascii?Q?O0xCmcBbWXh8/g7mdFOgdBUkN7WjOS9kQTtAFonuw/P2u+CwC5Hqhy6ruqoH?=
 =?us-ascii?Q?irKmJXSIogLeZpvO9J5B5XBqaN7dPcZqXq3mqMqmIwCOkKFAP0hmVZXy1p41?=
 =?us-ascii?Q?Rh81eAbvWXCFD0QHNb8DZGN+uV3+XcYUd+CP9h8s4BB8E/zAIRIKelQGwZlm?=
 =?us-ascii?Q?Mz0+4+rkOJDQ2jQccyZdqhuuKICBLyO1ARMr0+yvuZuSJiPEYhWun1hj0q0w?=
 =?us-ascii?Q?ug7oaOKKpFuve77FoSRwpemK1gO20IV34ywzBEqVKHBqvGLQlav5Pl+CuJz5?=
 =?us-ascii?Q?SKqNOt2K6hbloMLDIEYlsuoZQLBQyV4zsI6UM2hXh5JVc45YEil0oum0RzD/?=
 =?us-ascii?Q?9sG2ZC0Zhyb470fyDe7bp4evXMCqI9CqLAEBF6Kg0/UK+vZRUy/5v6KDWt+4?=
 =?us-ascii?Q?m8Ck/azwNG/VahUGyqZlJsmj6yAPTmjyla40bP5PlTc9hgnssWmVlv9ffD47?=
 =?us-ascii?Q?k/DaYuEeL9MAXnu6dfNsnyYSWhpEASNoLJHgto4fYlzpS34Slbers/fM4xtQ?=
 =?us-ascii?Q?8WIWidu4wokYHB5IbsnH4GbR1L0sHsRGI6fqRJFrOtdHbnRZ/CwP0zBys34T?=
 =?us-ascii?Q?KzSQB9ANLlsv7ZC5zYfc704FWV9YrSdF7wxOZsulI+AoVMEhbh13+i8dC6uf?=
 =?us-ascii?Q?mljR9rGocOxbOSfbi5mpNwRP?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 695fa1ba-caf3-47e8-a967-08d94c2f3d17
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2021 10:06:42.3941 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EDFHwb9gBysjrdrCDhKkX8/D4tMbCndVKKYvpTWtcNufoiy58cw+t91WKsf6jJY0QXWrm24DVdhpisEco4D1H/QNHSY5wrtETytuaof5tpk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5494
Received-SPF: pass client-ip=40.107.21.135;
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

 - use shorter construction
 - don't create new dict if not needed
 - drop extra unpacking key-val arguments
 - drop extra default values

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: John Snow <jsnow@redhat.com>
---
 python/qemu/machine/machine.py | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
index 971ed7e8c6..5eab31aeec 100644
--- a/python/qemu/machine/machine.py
+++ b/python/qemu/machine/machine.py
@@ -564,14 +564,12 @@ def _qmp(self) -> QEMUMonitorProtocol:
         return self._qmp_connection
 
     @classmethod
-    def _qmp_args(cls, _conv_keys: bool = True, **args: Any) -> Dict[str, Any]:
-        qmp_args = dict()
-        for key, value in args.items():
-            if _conv_keys:
-                qmp_args[key.replace('_', '-')] = value
-            else:
-                qmp_args[key] = value
-        return qmp_args
+    def _qmp_args(cls, conv_keys: bool,
+                  args: Dict[str, Any]) -> Dict[str, object]:
+        if conv_keys:
+            return {k.replace('_', '-'): v for k, v in args.items()}
+
+        return args
 
     def qmp(self, cmd: str,
             conv_keys: bool = True,
@@ -579,7 +577,7 @@ def qmp(self, cmd: str,
         """
         Invoke a QMP command and return the response dict
         """
-        qmp_args = self._qmp_args(conv_keys, **args)
+        qmp_args = self._qmp_args(conv_keys, args)
         return self._qmp.cmd(cmd, args=qmp_args)
 
     def command(self, cmd: str,
@@ -590,7 +588,7 @@ def command(self, cmd: str,
         On success return the response dict.
         On failure raise an exception.
         """
-        qmp_args = self._qmp_args(conv_keys, **args)
+        qmp_args = self._qmp_args(conv_keys, args)
         return self._qmp.command(cmd, **qmp_args)
 
     def get_qmp_event(self, wait: bool = False) -> Optional[QMPMessage]:
-- 
2.29.2


