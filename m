Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E32D4467889
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 14:37:12 +0100 (CET)
Received: from localhost ([::1]:58740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mt8kS-0000Sf-01
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 08:37:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mt8Xm-0004Zj-3T; Fri, 03 Dec 2021 08:24:06 -0500
Received: from mail-vi1eur05on2095.outbound.protection.outlook.com
 ([40.107.21.95]:4097 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mt8Xi-00089d-TA; Fri, 03 Dec 2021 08:24:05 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jX+32NppHnSo5hLIldDNxsv/jrJ8+OGMT4YCr9xLcMN1ALoSj2IL+cxMIOYxVXkLIO7IXsZXzeFHZ1V1whGYw8gevPjq1wEgYT/bcgrISJhfZVXitjMe2F6RAgX4VhRZFOpYbYMMptsjQ7lstQVYyoDdm9zzS+eUxlH2ZPTflTqctmAal+p3ENPwThbluSjRAJReInayAUdqtLcTmuHyUOz/wutxBJ5Czv76Mp0pCZ7JclCUYc3zkarHniYRkt18uxf/987+isDlcJrqTWTWRBxp8JO5No7lltJuDcGnNqt0TdOuJbYbeMBTSLWpLkiTl1ikKp65Uzt0tWy8+TqqsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=04/nOXA0pTZ9jUmwK4jLfeALXKT0Ap5/s2cSQZArKkE=;
 b=PrLLmYsVjmq/JMJQCFxfeUjITVjLfPaGQaTMp0qY8ELwRRdLQuEuszucEZkrmFwRv2rjpl2GEzobvKdu71AOy7QFwhiQ2xnTJZ3ZzztmcJzURDiLrmW2/Voql9YOgXWBU9Pq3yOZK4aa3/pxKtQ7Uu3qdKEbPhwolzGmlUyOsU2yYhQRsKwJfjnvSKO9LRqYxRZiQpNvQGsRJF3BX3aK/AeKnwg00xoEfO7jP8Qd1oRzalvMdhtAFKFtDPOvvGAhQXCYdQzYjxx5KhzJ8RgYJr5vCtekJjSfEwFFAzuhdWqsxGqMrItQasbUJE/bSSHYrjav4808IBxhm/qz5Ux2qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=04/nOXA0pTZ9jUmwK4jLfeALXKT0Ap5/s2cSQZArKkE=;
 b=qLWvLqTwIrtRjUaE6SS6djDYcE6uQBOOjQVFtzzutJRbP9SF6WLSfcqqSWOZrBBxI+EB1+um7EP9BPpDBgwoVBVkhUOnSFdt8lCDfWV67HJ0wL36FQ0/NgGbJ/3CzqiuojPnXD3wAsXFcKGReWOorPQFS/TT20iUiw37zs78uw8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM4PR0802MB2177.eurprd08.prod.outlook.com (2603:10a6:200:5d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Fri, 3 Dec
 2021 13:08:05 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a%7]) with mapi id 15.20.4669.024; Fri, 3 Dec 2021
 13:08:04 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, Max Reitz <mreitz@redhat.com>
Subject: [PATCH v4 01/19] iotests.py: img_info_log(): rename imgopts argument
Date: Fri,  3 Dec 2021 14:07:19 +0100
Message-Id: <20211203130737.2924594-2-vsementsov@virtuozzo.com>
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
 15.20.4755.16 via Frontend Transport; Fri, 3 Dec 2021 13:08:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8ff5be16-3bed-400a-42f6-08d9b65df0f4
X-MS-TrafficTypeDiagnostic: AM4PR0802MB2177:
X-Microsoft-Antispam-PRVS: <AM4PR0802MB2177619F014962B13716E727C16A9@AM4PR0802MB2177.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:400;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yP4VLFBWZF7ATTFaHJLIEn5aTd69wwXNL7BrXYufSfbEkQuqlAH7FhTwdm+W2LzwuGcR7LsFxoIISiGUhAH0NvcEWohT7hniN6IrAzwbTqARcqpbEBHWjRpSYQRTnCREUZto3WsyV8BYZWXLbyba/NYhV6s1a0diDjzwrHf3KkbUsobiPgw/xYzVEyuB44l/Z8DgRzDIZrf8jyatsbCdE+xuQBXLTNDaldZ5LQQyG3Apc3kokSiWPmOXH2E+rLV7VcmAIDn7xO4L0SJzgKGMqdoeIquwB87JLTKmrVaSpdV5+djBJnLgjOr00rDjIyg6c71OsojrJmBcAy+OjXHDJv8kmjdlNfb3dFzs1P6LbRZDAyZMVZ6L2WcbmIh4EHnbgNTLB78FlXXwCeXbsaPFdx3GU0qL1XyDx4UpXcjQnf8R2S6252fyrl34kD+uNfCrTCBHQb4XM0tBYNttVvk+gbbZaEWoYsz1R2PkDcCs5DCx8seczuEAoZzGafKhwgRpLNDvlwu/+fqtVooGlGgfbe6jJ/bHAc1ROXZovuQDz5dCcffuZCfw82cQGGOZ82NByvXkoX/RcVfGvymHB8AaYCAGiy2/1i6h+iia/XyFwJJqJBfX7JS3zyq4M9GTazI/hc7CHtx/n5SlKQin4rBqcyWQe3Wsi6mYjJltX+3SV4IbkbtTAdUp5PrW/LRZ5Whw8MerD94K08N4y1SR94K41Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(316002)(83380400001)(26005)(66946007)(4326008)(186003)(66476007)(38350700002)(38100700002)(1076003)(66556008)(6916009)(956004)(6512007)(6666004)(6506007)(8936002)(86362001)(6486002)(52116002)(2906002)(36756003)(8676002)(508600001)(5660300002)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?T3U520LxGceRt9OiykPn3oXjuXNFZ0HuIXDaZMdMGBjIYXecfyjG2rUuySec?=
 =?us-ascii?Q?ShXyvxooWgiy46SFaCncUmMSyR5KPkuHELKmMO7gAg10uhvvBTE9rP/4NvpP?=
 =?us-ascii?Q?wvg78iDu66AcmrQ71DspJSBZb8v3Lua9Dpq/dB5iUBcAIrqivRY0T+JX+Reb?=
 =?us-ascii?Q?9Vw9f1vXqRjHLCOW/CItPxqAcrmfUbY2cARoayRs3DPBgXwp6wKuIxjWWVu7?=
 =?us-ascii?Q?aP3ikrjDU9GxJ8Z/kLdORdqbr/VHgXxOzwn5VUptVv6N/I6ykSMKfGTB29U6?=
 =?us-ascii?Q?nbec17Y0hNQGavjeF968otc+p2j9lpe6kDvCETnREquv5ZObJKGtSGywEDIA?=
 =?us-ascii?Q?8Aty/xz+lx+h4Zk6FQz5dh94recgClNYv1opd/LvxE/2jiPORhSIFl1Tr1Pc?=
 =?us-ascii?Q?Upis8vItyYZB00shVuFdqEFCUFFYk04oDt8HPW/Po5ZAw1ymvuywFgVhnWea?=
 =?us-ascii?Q?X8cWXJDAEJUGjwNKKrtv9PuRDIhu4S8li0AJHr2nmDGEP4PPqACi4jN2hIVC?=
 =?us-ascii?Q?m6+y1ysM7r5WF+7DTI/fgTTfYaaZSq65oSKtplgra1nq0YlK0yg5kgnnTr7s?=
 =?us-ascii?Q?5mJv030ICfd1bME2Ty1VTy5KNTjw8I77sS9XSJDbS5VCy/96c9Rp8gUpXvyO?=
 =?us-ascii?Q?KZXDZOV3iaq0m5U53IKUzLlcGwbRfkPzcITnGkRWAlQ5XrkImTBEqRKYNlKv?=
 =?us-ascii?Q?koQnurGWDRvc7bcxKNK9rpS8nkxUFoV9/l+HRpSkGltfmc66nbbiHX3TP9Gl?=
 =?us-ascii?Q?4iqQ6572+6zoJ/oX4/bHnf7WLpUAn5RJjXoPQtcQAOL4fpJK65QwOrrCLv2Z?=
 =?us-ascii?Q?KZvGqDDWiuqzCXZb+b9ANB199zVpTpuoxN159+OZXaAqQuNsaVVooBjIGXMr?=
 =?us-ascii?Q?FXNNGCfQcrIH9QzwQnMFh3bVTc8mAcAgdNUyckKAENB4hgkYdSDA0ocHKq3U?=
 =?us-ascii?Q?7ovFoRYvrVNjePs1EgdhdNi5DbzSBjBGxmX6m8FJ4B+BGA+7Ypo0y+YpW3wk?=
 =?us-ascii?Q?7o++IHUj9sukXmlYHCNNSOntb+mCLO1+s8RTK3T7asXJyPNOW5eQzmHw8LL5?=
 =?us-ascii?Q?pxy7RF3bcFWZdcVwG9xZ8vbtXr/N2n49r6OCrsp0kyrfZUjXD52FG9TsV0uz?=
 =?us-ascii?Q?f1L47+gN+YOtPkycQZ/swsAOwsmvfPSIRlO8GOmoNaNN4jMTxD2CZY8L7827?=
 =?us-ascii?Q?z8p0KIED6nFVuyy4u1Sao8F5RF8fC84ZK+s3mLLdonCxmMRzq7iaXJqLrjgp?=
 =?us-ascii?Q?Ptb8TcCi1w+JhHiC9cD+hXy99gqDLK9ctr46cLQIQ7NKpprHYZvCdpVO6c+K?=
 =?us-ascii?Q?8kCsgxwC5QNFmCSSB9BScTyOyQJ5ly6bIG2KRKXi/NN2pHz+P9ztZ55UtlXG?=
 =?us-ascii?Q?qAloucC2OO9zZDtb2qg9t/8VZvn4Nd5ExoZw1lHNwiijGWvzJfvp3ZapGzE7?=
 =?us-ascii?Q?re+3qC9YY3oA91ubb/inBhom0NdBmN6fdKhYaTt321opjSyM6WUjjMybkUa2?=
 =?us-ascii?Q?HDWGN1cI/wZhoAk3B/Cu+LM31X+0KiOfwglandDjw+WX0c1t8Oo5sRC95gaK?=
 =?us-ascii?Q?dmUzy7C/NGswCFU7dRikLmBqwMQUsYmUItIrGMTfMt0l2DPvROA0PBNW+jiQ?=
 =?us-ascii?Q?YkvHoHqq8XtcIMZ1JUXBx0DuTVhCfgBfWsdescAd5s+ZfuP0F9LUf5nLwNQX?=
 =?us-ascii?Q?XGF9hw=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ff5be16-3bed-400a-42f6-08d9b65df0f4
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2021 13:08:04.7647 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YfDGdhdvo8Ip8BRkfqHreQGN6zdkEGtHJM1VMh8CJt6TOGAbxMeixGGQ/d8zDbuPy1wKWXOhFRXS10S/JwV5+lpAzTlUpUPv/nD7UIKvu5Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0802MB2177
Received-SPF: pass client-ip=40.107.21.95;
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

We are going to support IMGOPTS environment variable like in bash
tests. Corresponding global variable in iotests.py should be called
imgopts. So to not interfere with function argument, rename it in
advance.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/210        | 8 ++++----
 tests/qemu-iotests/iotests.py | 5 +++--
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/tests/qemu-iotests/210 b/tests/qemu-iotests/210
index a4dcc5fe59..10b0a0b87c 100755
--- a/tests/qemu-iotests/210
+++ b/tests/qemu-iotests/210
@@ -62,7 +62,7 @@ with iotests.FilePath('t.luks') as disk_path, \
         'driver=luks,file.driver=file,file.filename=%s,key-secret=keysec0' % (disk_path),
         filter_path=disk_path,
         extra_args=['--object', 'secret,id=keysec0,data=foo'],
-        imgopts=True)
+        use_image_opts=True)
 
     #
     # Successful image creation (with non-default options)
@@ -96,7 +96,7 @@ with iotests.FilePath('t.luks') as disk_path, \
         'driver=luks,file.driver=file,file.filename=%s,key-secret=keysec0' % (disk_path),
         filter_path=disk_path,
         extra_args=['--object', 'secret,id=keysec0,data=foo'],
-        imgopts=True)
+        use_image_opts=True)
 
     #
     # Invalid BlockdevRef
@@ -132,7 +132,7 @@ with iotests.FilePath('t.luks') as disk_path, \
         'driver=luks,file.driver=file,file.filename=%s,key-secret=keysec0' % (disk_path),
         filter_path=disk_path,
         extra_args=['--object', 'secret,id=keysec0,data=foo'],
-        imgopts=True)
+        use_image_opts=True)
 
     #
     # Invalid sizes
@@ -176,4 +176,4 @@ with iotests.FilePath('t.luks') as disk_path, \
         'driver=luks,file.driver=file,file.filename=%s,key-secret=keysec0' % (disk_path),
         filter_path=disk_path,
         extra_args=['--object', 'secret,id=keysec0,data=foo'],
-        imgopts=True)
+        use_image_opts=True)
diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 83bfedb902..9b374dad3d 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -219,9 +219,10 @@ def qemu_img_log(*args):
     log(result, filters=[filter_testfiles])
     return result
 
-def img_info_log(filename, filter_path=None, imgopts=False, extra_args=()):
+def img_info_log(filename, filter_path=None, use_image_opts=False,
+                 extra_args=()):
     args = ['info']
-    if imgopts:
+    if use_image_opts:
         args.append('--image-opts')
     else:
         args += ['-f', imgfmt]
-- 
2.31.1


