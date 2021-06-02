Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 976B1398A6C
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 15:28:09 +0200 (CEST)
Received: from localhost ([::1]:37506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loQum-0002ei-I1
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 09:28:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1loQfZ-0001fL-Ol; Wed, 02 Jun 2021 09:12:25 -0400
Received: from mail-am6eur05on2123.outbound.protection.outlook.com
 ([40.107.22.123]:34529 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1loQfW-0003Gh-RO; Wed, 02 Jun 2021 09:12:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Iqa3J4yvDCuuyh7hTZTEmXfVqBmt4lKpWJizkTgXJhnfKB/1Y2yAHPc9+tKKWVh6QhpSEfw8p0YOjJY0ocET+pqPvvhPw1rU/5AIdRVd2n1s8llAcrct9OkdW2NqEaDQPaHBAMvMOnT2fgEY4HFMYEy1gr+a0wPHjhsBy1NKhQq4/WdQ1Nt8WaPT1gZoYLv8NSoaW0hl6kUz2rj5V3MD3hjRnhmilcXTCaZ12ytdayC+YzcZUn9VtVjZvgCvQr0lw50URF0bipchQp2e+OjiL1Sn7AgK0Mkhh55D30RVhsW/QruKr3za8aUqoaja7Eyr16/60IeKWDeF3Pj9wO9JJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3nPaXzB1TSOvIgseQ0oiQsTdVYUhUW7OsgvqLlIiGhY=;
 b=dJ4LwnnjvjFCARCVLHZSq7hCDoUSR9qD1QR5JygGzD4J7ymMzMSLmDrB+/TePVzJJeFUNtwH67UFC6Ui9jqEzHcAz5mogDMS9rO/hYm9eGp+XYYAla/J8eiNmYwOJBiAs3ijDmSXZjOwO+JVuQtij+W9/yM05baYjgJGvKx+DhTUsgyeJK4xJzobpM2PUQvpSIUX1WRdrtnWN7kLsBmj/DR20N0wvcowhTPgif7YvGYoShop0EWLN1AYMZ8K+x0ll0lxr2rj/2T+zi0HrVSBriqr7yNqyu2Cy1DrbYdTFw46+lGljAhynCINZdID0QVCer9SUMjv9Xq57cciy+Gp5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3nPaXzB1TSOvIgseQ0oiQsTdVYUhUW7OsgvqLlIiGhY=;
 b=iesop0mrxbDBvJZBGq3JRmn9GQYG/6kkZXgYsdmypad19fdhVy3j9lMBEoY9bMZSIjo/5eKn0dWCnaV4McWjZ80Wha9c4wZeSFU1RyzKHYlTWtQv4Z6804CobvquQVT4t32Tp/UBzYyiZ1wu9NNJRlSiCv1/fJCHNoEvB9ljgG0=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6693.eurprd08.prod.outlook.com (2603:10a6:20b:39c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.24; Wed, 2 Jun
 2021 13:12:02 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%7]) with mapi id 15.20.4173.030; Wed, 2 Jun 2021
 13:12:02 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v4 26/35] python/qemu/machine: QEMUMachine: improve qmp()
 method
Date: Wed,  2 Jun 2021 16:10:59 +0300
Message-Id: <20210602131108.74979-27-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210602131108.74979-1-vsementsov@virtuozzo.com>
References: <20210602131108.74979-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.211]
X-ClientProxiedBy: HE1PR0501CA0011.eurprd05.prod.outlook.com
 (2603:10a6:3:1a::21) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.211) by
 HE1PR0501CA0011.eurprd05.prod.outlook.com (2603:10a6:3:1a::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.15 via Frontend Transport; Wed, 2 Jun 2021 13:12:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9341c6a8-faca-4605-52f2-08d925c802f6
X-MS-TrafficTypeDiagnostic: AS8PR08MB6693:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6693241B36937B4CE00F5AF2C13D9@AS8PR08MB6693.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1148;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4Ksfz+oXwMI09aNh4hrGMynZpMVRhOmxg+uLCB0w5v+LOLYuMkSdNlz4/C9DgRSBF/R8Po3H75EdjVhQOY6E0zgE7g8aRlR5E2AjfD3XWi8vlsBp5uMhBq7eOxexftfyrBU/nnv7bJbzAHQjSjhtBHQIUb26fqjiePuwlSwyyu3olaARKvteITVeLXPRqP4TMeJ7gtDNWZcKodBU22xD0TcuNoEP35BPMJZJS1gDQnTd7r35haWMFKE3pAa0Wa+01WRabACaOBFkgsVuRY8qlO3Asm73eZLMv5RKIAXlCKcw6zvlsO/bvQbqew0/PVj8pt6oUPmhePT2LWxfd+p7EQau/xv0GKcXK+W2ttwWDNta52z4pEXPWgrW7A8ZiMxnjv6stptb5soz68CRHUYZ7i+EPgSWfbuljZI5tS2LK2/THToOyDxvF1mMhyHemElryDqgDnCp0Oq6Wojw7GnCJv3B+AcsykWSSDIPHbfkMZPshNTIpGF0zdl9UIJ1JybbEGOATXBDwDv/7swt8zVlTz2+yKw5O6Ih5dat0u4UmSMKzsPdXA8HEr8EOazdobKuku6Ddmw04Hrrdq5emzhf4I54Ge0dq7FS++1ym6ylSmjoAMxQKuigHLAhtqqnTusfVLr5+r9SQAymU9n0pQaF2jFHU6uSy7jO0IqIqFTnnkwdROPDF6i3h+wYMc0bQ10c
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(366004)(346002)(376002)(39840400004)(8936002)(5660300002)(83380400001)(38350700002)(38100700002)(36756003)(1076003)(6486002)(7416002)(4326008)(6512007)(16526019)(186003)(2616005)(956004)(316002)(6916009)(6506007)(66556008)(478600001)(66946007)(66476007)(2906002)(86362001)(52116002)(8676002)(26005)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?8KaE/jKnRwIh8AVDJuqWThYNR8j+7pcG1JCPC2t8b0rdakRpO9kqevodZnSE?=
 =?us-ascii?Q?8UFmfnngFRw6Wb2HN8U6j4SY3M0wRWjmxsIZbK6UzhfH8AemTgHtVT2dlnTr?=
 =?us-ascii?Q?c5u/cGXrVcEAzbYiRrkE14WBxzWpWp5ME9iQwy/bDNqIJMdaAWJWUYRsIOno?=
 =?us-ascii?Q?86SqY1gUKJvcEEJ0cUBVV57JOWuXTxfKUik3bZjh4Jc+gKdV6ienH97Owve4?=
 =?us-ascii?Q?uAATpc+4NuZbrXCRo2pmGJLO+zSJdVIZaMjUaJszil0QAqKS/6lMpE33WxgN?=
 =?us-ascii?Q?mAy25qQuCs7gPf47RjyOxxeEYI/fNkxHhrqr/rY6LwNDKcsJ27rcgKDM1hlm?=
 =?us-ascii?Q?dPlueU9i8LbNkp8Nkf2FfoZtd95AtVaxadkKxrF4FtiKkrtAzTYOy81pBPh6?=
 =?us-ascii?Q?vGF2TnA0YXg6ti+7ISDMgVkJgLuSgaDtzl93rs8eoUYfIGDOGJEY1dcFAvWD?=
 =?us-ascii?Q?6ABKNb7Zi91VDNl8CXLzL63oduyp9Wfsiz2OWlrgbwvYhKPXVGbIvYPk0w/y?=
 =?us-ascii?Q?hvDiIwj4D63uw/SalLCeL173jp2VA8dCwEon02PZPIGXtlJvujvrSGlHKEIE?=
 =?us-ascii?Q?N4hAPxnmQ3bReyiF1o8sPoKUpGJqM/ROlo+z8iMeFt4ZvmyQqEOdH/cWp1De?=
 =?us-ascii?Q?E9KrCGqHAZXQeQXt17wWomC6covWxIvIO60pr1Jeud2A5Vo1L9SfmoHBVrlU?=
 =?us-ascii?Q?d2YpmzGYG8+e/aL6xk4IEX446O6KKOOyntIJab/Qfz91r/sl2Li6b+sBh0fC?=
 =?us-ascii?Q?id8TVJDzz+/bkwdKW2RG6p9lIgW91/jo2I576qqD3hk5Ssd4nbJ8tYfeMDcF?=
 =?us-ascii?Q?HygVpHboJ+2sZ2Df4eyGtEYqRgQ+Bp8AwEPGikU4tkEiUUIx/q3lLyqbS3x+?=
 =?us-ascii?Q?1u9vLtTYgjSVlKLz4gml386SMli7JLzuoTvl3F0TEZ7ZSV9sIgTqLQqD1eQq?=
 =?us-ascii?Q?4khYUk1fInX6i8ZtWpz8WuE9nT5mH9uKrwf1wwGITCNvBVN0N98chdN2DuRi?=
 =?us-ascii?Q?orgtJXVrSbA6xcAIZCiuSV6ikm8gfN0cY8H7y3X/vs5NkrD84AWoYOy8VQCB?=
 =?us-ascii?Q?dIzhBejp+9YlgoxtteBT2T0gDNqyIpwu3fpmBjYT+ePycFeocnersL6sHlRx?=
 =?us-ascii?Q?VIzsvPyacyyDxpyYQvpDpbxN+731pLzgEfAjatR7dZy1qwtRLjDdqSmOhjzE?=
 =?us-ascii?Q?s+bPhT4gI/GadV7E/LBeb7fhFOSiV9uv92wsArbA+2F7cwvRfCSgWoY+6pCw?=
 =?us-ascii?Q?KXsaWS8GqHwxuJTCVun7ls7EHWTTc/l82J3nBCHgE4R1u7VNwWAnandpE6r/?=
 =?us-ascii?Q?X3hivVF7kwLNr9lL5E2cVE1S?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9341c6a8-faca-4605-52f2-08d925c802f6
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2021 13:12:02.4354 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QgnnixsuWHRZnlY2cVqCQo+WfGTDlgjKp0ZltAg6zIQE9nemnHHMELHMTDjyPJmdb9W5eZViCdlAz9cxdaXTSQ/4ois5r9KHQ7oSFU8BSQI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6693
Received-SPF: pass client-ip=40.107.22.123;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We often call qmp() with unpacking dict, like qmp('foo', **{...}).
mypy don't really like it, it thinks that passed unpacked dict is a
positional argument and complains that it type should be bool (because
second argument of qmp() is conv_keys: bool).

Allow passing dict directly, simplifying interface, and giving a way to
satisfy mypy.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 python/qemu/machine.py | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/python/qemu/machine.py b/python/qemu/machine.py
index ff35f2cd6c..7a14605040 100644
--- a/python/qemu/machine.py
+++ b/python/qemu/machine.py
@@ -549,11 +549,21 @@ def _qmp_args(cls, conv_keys: bool,
             return args
 
     def qmp(self, cmd: str,
-            conv_keys: bool = True,
+            args_dict: Optional[Dict[str, Any]] = None,
+            conv_keys: Optional[bool] = None,
             **args: Any) -> QMPMessage:
         """
         Invoke a QMP command and return the response dict
         """
+        if args_dict is not None:
+            assert not args
+            assert conv_keys is None
+            args = args_dict
+            conv_keys = False
+
+        if conv_keys is None:
+            conv_keys = True
+
         qmp_args = self._qmp_args(conv_keys, args)
         return self._qmp.cmd(cmd, args=qmp_args)
 
-- 
2.29.2


