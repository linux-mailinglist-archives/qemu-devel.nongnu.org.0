Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D6E3BBA15
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 11:20:53 +0200 (CEST)
Received: from localhost ([::1]:45014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0Kma-0002Rk-OQ
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 05:20:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m0Ki5-000267-NL; Mon, 05 Jul 2021 05:16:13 -0400
Received: from mail-am6eur05on2129.outbound.protection.outlook.com
 ([40.107.22.129]:48480 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m0Ki3-0007yh-JX; Mon, 05 Jul 2021 05:16:13 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kUCRUg80BN77u9UsYSMWZdLky77Trr7iKSzcCnro3Fo3ChG0+n0MAudRMc1nH4drD0zQWyDZ5JoM9TzIDoe4R5+0xNsXCTzS6u4qS/9ZIfGdYhUY1aRLGpKr25/w7cW/GKNTCgsURSWFBN+wvhrj5ft9gTcPJ9ZqDTyfRZVIuf9KC/FVItP3DvPNKypv6MV4qlFw7nIpmLjRfWRN+6w0vOyC8Dp5kKuBC6+uG/PPtgs/iEYaGAbKV4SBg/t7DmE/V3Rhs9j+yd1jI20tHCaygWO0nJRT04Rms1aFy9Oc7Xx6Afy7qAd+ZST2/jBV13V1pxKLUmWLNMFT8XBixiU/2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vCSBNm6+0slCKwEpKDfYHWGBoUbGrfS93D1VZagP9j0=;
 b=ncGtsFjF8YdEVgeRMNiP1HO6M8HCbAZ+jJ1GtIFPejhAGbK6Pk3YmwBOuNO+33cG/V/sUPdHGS0+2hUlOrCwBW628490ELucYxdcYN44E4dScZsvOAWnyAvrgeVFQG+nKJW23ZJR4vgO/0/oc+cfqT1LZc3xriKsBz9YcKMWzguOQNbsTp5+MeqyFX9eoukmQr10cmGRUUq4x3Nvg+OyVv5JHR2IKThuTEJ5/y3M0vDDqLu3g3H/Xf8w1cISC8wUlJjQ9FX7GNfcpQdzsmNDZend5m2quIkUDFfWblrM2SwXLPpBgor6YKXRgBpjr+qLmge1a+3Q6qXYTN/oCeZdgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vCSBNm6+0slCKwEpKDfYHWGBoUbGrfS93D1VZagP9j0=;
 b=wDw1mfn4sIaYYdW4FGK3S6puso8Y5wHmLdN3q3/feKBune49khJ7jsQ7YR2YAPD9gMSWQL4gy+Xoi4hnA6px7Cppnp5tOKzBGvnwM6eG8fhKkKAnTMBpCGVjYnwmksIwl1eqtf2hlHomqyXsfItxH7dtOEAzHw0Uff7EJqyVbjs=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4533.eurprd08.prod.outlook.com (2603:10a6:20b:b5::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.26; Mon, 5 Jul
 2021 09:16:08 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4264.026; Mon, 5 Jul 2021
 09:16:08 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, mreitz@redhat.com,
 vsementsov@virtuozzo.com, den@openvz.org, jsnow@redhat.com
Subject: [PATCH 04/14] iotest 065: explicit compression type
Date: Mon,  5 Jul 2021 12:15:39 +0300
Message-Id: <20210705091549.178335-5-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210705091549.178335-1-vsementsov@virtuozzo.com>
References: <20210705091549.178335-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: HE1PR05CA0235.eurprd05.prod.outlook.com
 (2603:10a6:3:fb::11) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.215) by
 HE1PR05CA0235.eurprd05.prod.outlook.com (2603:10a6:3:fb::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.22 via Frontend Transport; Mon, 5 Jul 2021 09:16:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2df2e322-10ef-4256-76e6-08d93f958643
X-MS-TrafficTypeDiagnostic: AM6PR08MB4533:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB453347F0C3781DF17C9A4ACDC11C9@AM6PR08MB4533.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: f6V1FV39gXh/luPhy+OookcYbHcqQG0HAumG35V3Rz5sBBh6JR3UCTKPQbMU05vKQahXcqE55AZeQcQbs67nVEf3ldh08g9C8oFvxbUSka3cAExS2iopql5Sr3ZDP0d9dPQ3t306xVRGxDbG1a7yrYl+UL3Exgx0fSDO9J4MDliyzVxiUCPKSqFyJ0HKicyuuI66nnkGjmH3pqVbWVFBgNmpz+j9a5vfYcAuqOcPmmuH+HXivXaVDDIuAmO/qXT+qD+KeAxu38+yAvHOxK0xeJ2l4WhGijZipRn9JDzv09hqn1U6arZUt+/DtLvuZ1m9nAWIakLNfSWMMMQgfcGZihWj33QME81cN+37//7cSxksFCdvqdp9y0+TgxZO0AZQ0//esXJLpHiJYP5UwassG4RRAA4zJ+dhP/etRMtMMCjtY3iIaU0kt0VfqwWRFjAqpWy7NOGPl8B00FzQaE5gPA/8JWvWIX84M+phFne1YVZ4/8qOiILN0DfySsrrML8vgKWRlcSn5NaHfSd5CSB3tVXVC3cnU8PQwFKLk3ifXBYlSQhsTYhlhkY+O+NYe9yrTDrPROCSoG4eWnzUfaqSyo6BI5MdoBv5fn1T5bxZBGVOdve0NH38lodzocxzJlyhk4nEtQs/bh3pfrpFUxDcxcVkZ4ttoEYq7Ad63qUwZcvaxfBiVEZ+MuPUtxMrALfUFr0em3oTlOEjdnUSt2xRpL958SMbbofpX53SaxDNEu1b7y0yQJZyPVT2dB/wwHXM
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(136003)(39830400003)(376002)(396003)(52116002)(6916009)(2616005)(5660300002)(66556008)(66476007)(83380400001)(316002)(86362001)(36756003)(956004)(6486002)(478600001)(6506007)(2906002)(66946007)(1076003)(6666004)(8936002)(4326008)(186003)(38350700002)(38100700002)(16526019)(6512007)(26005)(8676002)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?o761zSyzGUDh+YoZYsAivuOlUCdPNHjWdya8kBpj2lYthJK0dqsluuQyt4em?=
 =?us-ascii?Q?WW3TTV6SScjVw53xvuOsYhoHYHUPnvFeSIBzVZqsQ+F9rs3Fy2Cbtf9x72iH?=
 =?us-ascii?Q?fYqmga23sfxX1xb2BtMguru0SjCXOrU+rKTVIndMMTRK5qhXZDM5+H4bW57Y?=
 =?us-ascii?Q?dGH0Vx8tAsg7q0xkNz+tKxEd7gOzb2fVgqKZvwpP205HFjSTchQulRzyOKem?=
 =?us-ascii?Q?7FqfgukEW8tCtDcVG3KfK2ZdkO2NoYXeY0NR3x3CIyxq57aTZ8AidPmhBM1S?=
 =?us-ascii?Q?jFpy+YzGsggzS/KldNd2JFmAf393Oe7ApVIeiyz1z225EXMr84o9mGmdy7h3?=
 =?us-ascii?Q?SZACeFkOClbQjJb2qEJyQ5xxfskS580OZk6X+CsZbKZ/vh6RgHyfrbJHaR4S?=
 =?us-ascii?Q?tG05kfcvF/4Z/OdVGX12dl6S+iEioIfsC+oLQZ7nzB9LCDE1gP5m65bT3KJr?=
 =?us-ascii?Q?UE8AhNYXEwt21nB0y9peWAk9uAMljBBLysBGqlEbqJUvWD26mo+ZfRZMnwa4?=
 =?us-ascii?Q?LVJVOn7G7FNJcGxAviB1sHFzZcFX8oJKdV6hgXgeDyxnW0nSS7uCQDooQCur?=
 =?us-ascii?Q?PQT++x2dLU2NJdJhLLpDnWeMeVogojFge5lr2Oiq500VhWShfhkeWauFHmaz?=
 =?us-ascii?Q?wEsuL009pVov/Ve2m+PnnHeAAfDmJfUdA99QjI+u2hIKS30D8Xyx96d8JZAZ?=
 =?us-ascii?Q?HbmRJo525W5ldK2IWaqQYlTJAZnGofMaNx0FmTXJLnC/EfafZnhWPwp+UNJa?=
 =?us-ascii?Q?ChxneCG8w3ehzP+WY7Jpa64j1IxhjtrPmx5erMsHgWuk/yqSx5DvXHYyvS/K?=
 =?us-ascii?Q?KXrT7sgSvt5d8JCfVcVJawy8jSSBM1DLCsjN0yB+LBMDGDfxURyoKFHkfPOC?=
 =?us-ascii?Q?zW386IMra+SOTmef2nMrrjnIevBew2vFmIGcQuO7mp3UMGOj7Ol8y/W4jFOl?=
 =?us-ascii?Q?NBzK8dwIF+s/W14STH4Ijy+nMMUR/Olr2iHLMn9XH0ZsLizHw9aFEcxcUiQI?=
 =?us-ascii?Q?EdfsTaDZUylyy1+QmbdaFrvZhyklofcSNoj/9oZ7GjE60rar6Oc5GrK0J8Ub?=
 =?us-ascii?Q?W3gI0AKs4xYoL3m8KP5jZbqdOQQoI7ykOpZ+UH2EVuDbEDJ68qnGKFGVS8mw?=
 =?us-ascii?Q?XBNRDShc6IzR9Xmhq5c7bgj6sr+Dl3Jk1jihtU5yjSiQtwCzzLUnkGEx2e6M?=
 =?us-ascii?Q?erecP+1cW4yBPyD6Y2CF+cmx6dtGmWRP82SgecQ4GekWYF8IfZngvpUTwOXw?=
 =?us-ascii?Q?psuw+nX16io22/iBkBNbdPgep52YQbswY2iugYDhgmnMQVdO8UoWIT+oHH61?=
 =?us-ascii?Q?+MYNmdep0bJD0Kkn0MSVy+S9?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2df2e322-10ef-4256-76e6-08d93f958643
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2021 09:16:08.6623 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s8GA5sGFnQE7vfl0wgiVf1oRdwxTkHX3iOaj/AcQZRPASDGGedlLTF5BP5ppQgNMvEi8TMpjAFbQhf5TFabS3q0X5Y+zRO/ftHKT/EvBvus=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4533
Received-SPF: pass client-ip=40.107.22.129;
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

The test checks different options. It of course fails if set
IMGOPTS='compression_type=zstd'. So, let's be explicit in what
compression type we want and independent of IMGOPTS. Test both existing
compression types.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/065 | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/tests/qemu-iotests/065 b/tests/qemu-iotests/065
index 3c2ca27627..22203ed480 100755
--- a/tests/qemu-iotests/065
+++ b/tests/qemu-iotests/065
@@ -96,17 +96,17 @@ class TestQCow2(TestQemuImgInfo):
 
 class TestQCow3NotLazy(TestQemuImgInfo):
     '''Testing a qcow2 version 3 image with lazy refcounts disabled'''
-    img_options = 'compat=1.1,lazy_refcounts=off'
+    img_options = 'compat=1.1,lazy_refcounts=off,compression_type=zstd'
     json_compare = { 'compat': '1.1', 'lazy-refcounts': False,
                      'refcount-bits': 16, 'corrupt': False,
-                     'compression-type': 'zlib', 'extended-l2': False }
-    human_compare = [ 'compat: 1.1', 'compression type: zlib',
+                     'compression-type': 'zstd', 'extended-l2': False }
+    human_compare = [ 'compat: 1.1', 'compression type: zstd',
                       'lazy refcounts: false', 'refcount bits: 16',
                       'corrupt: false', 'extended l2: false' ]
 
 class TestQCow3Lazy(TestQemuImgInfo):
     '''Testing a qcow2 version 3 image with lazy refcounts enabled'''
-    img_options = 'compat=1.1,lazy_refcounts=on'
+    img_options = 'compat=1.1,lazy_refcounts=on,compression_type=zlib'
     json_compare = { 'compat': '1.1', 'lazy-refcounts': True,
                      'refcount-bits': 16, 'corrupt': False,
                      'compression-type': 'zlib', 'extended-l2': False }
@@ -117,7 +117,7 @@ class TestQCow3Lazy(TestQemuImgInfo):
 class TestQCow3NotLazyQMP(TestQMP):
     '''Testing a qcow2 version 3 image with lazy refcounts disabled, opening
        with lazy refcounts enabled'''
-    img_options = 'compat=1.1,lazy_refcounts=off'
+    img_options = 'compat=1.1,lazy_refcounts=off,compression_type=zlib'
     qemu_options = 'lazy-refcounts=on'
     compare = { 'compat': '1.1', 'lazy-refcounts': False,
                 'refcount-bits': 16, 'corrupt': False,
@@ -127,11 +127,11 @@ class TestQCow3NotLazyQMP(TestQMP):
 class TestQCow3LazyQMP(TestQMP):
     '''Testing a qcow2 version 3 image with lazy refcounts enabled, opening
        with lazy refcounts disabled'''
-    img_options = 'compat=1.1,lazy_refcounts=on'
+    img_options = 'compat=1.1,lazy_refcounts=on,compression_type=zstd'
     qemu_options = 'lazy-refcounts=off'
     compare = { 'compat': '1.1', 'lazy-refcounts': True,
                 'refcount-bits': 16, 'corrupt': False,
-                'compression-type': 'zlib', 'extended-l2': False }
+                'compression-type': 'zstd', 'extended-l2': False }
 
 TestImageInfoSpecific = None
 TestQemuImgInfo = None
-- 
2.29.2


