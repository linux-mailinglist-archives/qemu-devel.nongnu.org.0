Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0054D38B21A
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 16:42:30 +0200 (CEST)
Received: from localhost ([::1]:43926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljjsb-0004xZ-Uf
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 10:42:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ljjZu-0006FO-LZ; Thu, 20 May 2021 10:23:10 -0400
Received: from mail-eopbgr10092.outbound.protection.outlook.com
 ([40.107.1.92]:6738 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ljjZs-0005se-Nr; Thu, 20 May 2021 10:23:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ldM8tKL8WbE4FXWC+S8eP7JDpIn7vwZ4721wfW2zK93W+qqE7tLteXz9RFMMkvIdpmgWP56pS5TiK0iEA8kFTpDK777UyAd1y40UAGjqvMXMd12wCR+23PM2CTKMiIwFPZeqbbU4d1sGd9791hmJZuC1SdtGs/gAA1H/eVYsKGdplH1UyrRP1z1ywXk90Y5rliNcARKukrqe2cH0o8/IS4ZCTt4uoDye6EH0fbX1o61CeHoS9HeM3ZWlArVIWEH4gK0xCkxX35BKQ1cUZGg+BnI6yrAh9/MUzoJBI816TA9npQ+yENA2lqE4qO90HWzJGde7HlcNBkNOHDJEXefhow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S788zpFtUV3yvt0smeND5HyWBA0WB4Bo5L0uTDR4kHE=;
 b=S6YxBodnGzfYnqQ12OQve/1egHymqny5rTZKTg7Akab8WG6Lr+SFZPB5mX8Xukil5XeMFlJ0uP/rny26L/SwGpQ875RTDeXQr7Ik2ykebRerYn1tSaMmwk0F5Pah7FLnrA0wGrnZfi+EgKophlN1zCrelY19734sA161HPvr5xZHdIDmLhPZKEQQr4GqbswgsRLczeHFIctCJ8fCVLzTB3hKPtW/LUBCGpObDV9lrjOyKgtBlCubM25c972af74gXWAZ60jCdz0DMs+9xkqVLGI1KTSnq6ybo4pjj6Pf9Pd27v8zkyCbEHjXl9duQlCFMiPUPg3NV44tLBoHQhM0yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S788zpFtUV3yvt0smeND5HyWBA0WB4Bo5L0uTDR4kHE=;
 b=tKZF83njgZb30rQqLELK1F1H1uX/9yIyX2qIylTlc0Z1wO2t/LWEaRxwGP0t6BE7N9kML8IAVUA40YBF04lQTUYXe1Uil3xWQ3Y7naxCfhg0vEHhAGhOgusIuJtlQTcvzPfoagxBGAxHDiTVPxLxrAou3hXee0t2g/fcZll1YBU=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4072.eurprd08.prod.outlook.com (2603:10a6:20b:a8::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23; Thu, 20 May
 2021 14:22:58 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4129.033; Thu, 20 May 2021
 14:22:58 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, den@openvz.org
Subject: [PATCH v2 25/33] iotests.py: VM: add own __enter__ method
Date: Thu, 20 May 2021 17:21:57 +0300
Message-Id: <20210520142205.607501-26-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210520142205.607501-1-vsementsov@virtuozzo.com>
References: <20210520142205.607501-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.197]
X-ClientProxiedBy: HE1P190CA0034.EURP190.PROD.OUTLOOK.COM (2603:10a6:7:52::23)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.197) by
 HE1P190CA0034.EURP190.PROD.OUTLOOK.COM (2603:10a6:7:52::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.23 via Frontend Transport; Thu, 20 May 2021 14:22:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 686cfe73-e8f8-4954-7a23-08d91b9ac48a
X-MS-TrafficTypeDiagnostic: AM6PR08MB4072:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4072F98CE8EC302790DA601CC12A9@AM6PR08MB4072.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1107;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CjGmbon400Ne5vB14/prVuQ+03GcpNFeT33c0wTvg89JzZYZAPlhoC5jWrkI1iRu8HWkp3RAwtZ1EUUgffD26s9EPx9eSYmslee7Xvch/896bVB1GRJxV/zy46RtbQsa0nAguj6jI0hpBt6PGvLQi2X4e+eBJAsJIUrTetOF4Ge5rVq5x+YyYF+jGjiW+HJF4B6B10eaFgYGI1waOGtCCXiDuWaR8oqUQJe+vyASSbDFIRV8si9OJjdx/4km8BpAEcYoxfhFz+J0vZ+5gq7KYCn17/V8yQeX0GN3KtwEsXn/7jZds8R1d3/J+aXedOwBPSNX/J46/Y3EkvsnT9VLjbviuQFa7LuBjtDRmEcS2KRK6eptiMoJNTrjovqXNpOecumNyy6fCBU+XYohozO9PeIYAdnechMBCYsGtv8DlOhcODLnc00pGa6klebil16hhB1hPLLTtpLhlVGjLTbqW8R/6xZuLLo0LT2xHi4+nmp7Wv07qiIslIeCdTdyZ2ZVb5DtV6Rci32jANISIqus7Pmo+lfMY0UErzTKstF7LTVLMAiUjdBJ2+fBPezBlUQv7NyoF9VBIlX17ZskZK3Y5YjkyXlky2/qGW5u9mtuGd+h4RnGEWewcmxBeyFL0e1gnE772erbQsp8FqIYJiLNHvsOF+7NjxznMgjmgM02TikFCogmIGqAfa1oAixz+Qjs
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(366004)(39840400004)(396003)(346002)(38100700002)(478600001)(186003)(1076003)(38350700002)(2906002)(36756003)(4326008)(4744005)(26005)(52116002)(6506007)(6486002)(66556008)(6512007)(66946007)(2616005)(66476007)(8676002)(16526019)(956004)(6916009)(8936002)(107886003)(86362001)(316002)(5660300002)(7416002)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?2kS62sqKmMaI+EUiIC92eA9+3xklhdZUzj3z3yR717vma+gDc/k/CdZ2csk6?=
 =?us-ascii?Q?xs7nnDK9a59Sn0U/JC8XcURG4vCE7RADQr9/YGF5Ez9YQV/y+8szsT5tF1qB?=
 =?us-ascii?Q?27fBDNy0ULqShqxKJn1snS8dqJWEODvXC3i70NG32YJb9E3/cq5VZnwO8+mW?=
 =?us-ascii?Q?TqScG4hqCdmMPfRhIJ4+EpjzsPO15hjTolAKJUU3SgsIA3qq9Y2vG7UqxjGd?=
 =?us-ascii?Q?f6s6StxTk1BfDxab7jsiKHV4hpNcEwTWiltQ8RTqSei//lAM55k3uT5Kgplc?=
 =?us-ascii?Q?RJ80yEwTNvxrSZm136XHQb2ll4RltK0QIDJV/uHpxm0IcagNi5UNfIdPrah9?=
 =?us-ascii?Q?2/QecN62cig1jWU1731rsQg8C6e2hjEdWaeTqwF1gpxx84jT2RiAYhElT0zE?=
 =?us-ascii?Q?6BwdPW2J0JsS1Z8QDCeBDfTXNdVZBTpRr18FuS9KvAzreQQXoivP81o5uNBI?=
 =?us-ascii?Q?BXgue27ybmIwxlIgnxGLTgY75JB5vu/61QwCRUrYbW8YQKZRMI3ZnHc9Sd6H?=
 =?us-ascii?Q?VpXjNz9TinfjK4FVBK52Nr+v0Y4sRzVXAXXM6R3bZao/fZmRllNPtX+crAdd?=
 =?us-ascii?Q?5Q+7OHByYXPHmyX6O4rroX0Vpdn3RAwH0S4FaoIInT5/om0fUGmiY/Xeu1UP?=
 =?us-ascii?Q?/MoZ12Y1xn7e9KP5S7J/R1fW9/4reMAgAR9fIiweO+tA+qZJOZjUF5tUBK2f?=
 =?us-ascii?Q?nGHF2MO8TrSj2pVuI/d8yzf6aPIwABADsED+L7S2qvPC/pVuyXEVguX/ghu5?=
 =?us-ascii?Q?rr/SdR5Ax/jW8IBSINRC9ffIoA597BhNWxqRq3DnKbe9MPD+mF15C2vcP78q?=
 =?us-ascii?Q?nXy+6qNbBFnME5Nrr2eJ/Ws5Lg5LxXKPBcplhr3wkJgdrutKna6lzNOuPVDV?=
 =?us-ascii?Q?XcmfNi1cFBfCZlg2LvhaRhS7qDDhwbbyaHMWgGBa6AH6+WNwyjiYTAHVxVuN?=
 =?us-ascii?Q?pP3YUFjFx9fqZMXRE/tx0ESLfMkqRMxoWaH/u4G+qEj0FyiPOVJmy8h1ov+Z?=
 =?us-ascii?Q?HX1rphgZesfs6slDE9lBdP83afDEk1K7CVEXFzFn4zkJAex+kgcMDTQpqknE?=
 =?us-ascii?Q?VRzW0M0tvK63hkpEcRZVjvdAuGR97qwPdRfxLgqXCZGSvi+3d+PZhoWZ35Pd?=
 =?us-ascii?Q?gcRSlRlQq479EhDhp7yqc3W8PRqggK3/fW0ejNidOZt34tcY5fhfd4IAYdtD?=
 =?us-ascii?Q?cr7VcqdOiYm1Hfy63RRz5U3HSZqfwjFOTyvH+l8N6+XbqaagXrW+uUa+XY6F?=
 =?us-ascii?Q?xLU0iFw7a7lWMy+d72A2lVdy+EE0+8ge0jBmYfpiq1Bd+EmK/Ab4IgxzEI1f?=
 =?us-ascii?Q?T2f4SXxfe1KARy/p7JL2eRcb?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 686cfe73-e8f8-4954-7a23-08d91b9ac48a
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2021 14:22:58.7352 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BmT2LsLPPJ3BuhyNOLnk2JNLcdgbLkv5XxAZ24K7DxKC4EHTdPaTUhVVqz1ASzKq8KdKiZzd7RNNmehjhuvSlt/Wl1y0mPVH5sAvVyoy33Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4072
Received-SPF: pass client-ip=40.107.1.92;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-HE1-obe.outbound.protection.outlook.com
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

In superclass __enter__ method is defined with return value type hint
'QEMUMachine'. So, mypy thinks that return value of VM.__enter__ is
QEMUMachine. Let's redefine __enter__ in VM class, to give it correct
type hint.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/iotests.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 777fa2ec0e..c7ec16c082 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -568,6 +568,10 @@ def remote_filename(path):
 class VM(qtest.QEMUQtestMachine):
     '''A QEMU VM'''
 
+    # Redefine __enter__ with proper type hint
+    def __enter__(self) -> 'VM':
+        return self
+
     def __init__(self, path_suffix=''):
         name = "qemu%s-%d" % (path_suffix, os.getpid())
         super().__init__(qemu_prog, qemu_opts, name=name,
-- 
2.29.2


