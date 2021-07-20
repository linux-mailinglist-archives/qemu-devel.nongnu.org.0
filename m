Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E173CF911
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 13:46:27 +0200 (CEST)
Received: from localhost ([::1]:55086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5oCg-0004rb-GB
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 07:46:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m5o5k-0003Ew-U5; Tue, 20 Jul 2021 07:39:20 -0400
Received: from mail-db8eur05on2091.outbound.protection.outlook.com
 ([40.107.20.91]:40417 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m5o5e-0007CC-6S; Tue, 20 Jul 2021 07:39:14 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WX9p7kWmbEjCxqUKby6UUPstzvO3EE8ATO7DfRy0OzjK7G0ng2ZzCfxO2W7uxYYMuaKz2/OR4D0veBkUqnJM5Uq/gdb+v6KlVKoU1t/ysUHxU6s461iYcPxVMiDC10b6kCcFbMu7Qk0NJsGjS+TOplRjrFciGxjMgTfFef6shKUEbRckByG8REqi3XCgrKChGO1HKGkp93KOiNDwSpMP4GBP+pLaMNf1B1nc6YPNRuJyTNSIi8+s5QLD8ljjsyVwc+V6mas8FdKq1Q05c/E2e9Efb3p7AAf+SjX6t31Hu5XP3Cp5TItutj+1cW5sQ1/qc+VTClVDW3vQwGkoh4O3sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gY/t8id5XdxpwSV5oBw1czyUbckrm0T4fK3jWEl1gqc=;
 b=JOtW+bb9kSBt3gWEIP+/0oD5TpnD1eoujbureBDxMOewiV28Zwip3sF4ErB9NERXcb7wNP5bX/HfRKSBVW16oqRpgBOxGcg25T9kNNSFP0pxbp8lvsq3oiq9fEIn3u+LmtmjZicrn9YfyWgxQp2STB8CjUEJCOj/LCChRMt7De1gzjsqUBVJtTysrLg9KfgkosY9avnc+jUlfmxI4rq3RSP4X9a8rScm1KzvF/rjyH+PwEx8RVLaXz442HVfj7kSrtYdI6BJfu2gPwQ10TebsiJ1W4j3bAPOWg4XGhv2Q2pumkzqDmLaB+hdRfMQW1KjHBEvsI1zuHAuUamBwtJzCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gY/t8id5XdxpwSV5oBw1czyUbckrm0T4fK3jWEl1gqc=;
 b=VTRatgsPSe0FNZ+ylmfEiVl/SFMgxnp0yUFiAyEJz2ErHEtEpez8XjpkAm3JiDTBz83H5UyYUhBD7EHWtCNM4FI8DLKS2FTV6J5cYSolECWN4QNnb3opjDhmd/vmAh/Wp3RHlQ1L7ZKuA6IkQFtq+PVGxTX0a1XjaTYyAfHXzFg=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6119.eurprd08.prod.outlook.com (2603:10a6:20b:290::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.26; Tue, 20 Jul
 2021 11:38:58 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%6]) with mapi id 15.20.4331.034; Tue, 20 Jul 2021
 11:38:58 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com, den@openvz.org,
 jsnow@redhat.com, vsementsov@virtuozzo.com
Subject: [PATCH v2 06/17] iotest 065: explicit compression type
Date: Tue, 20 Jul 2021 14:38:21 +0300
Message-Id: <20210720113832.586428-7-vsementsov@virtuozzo.com>
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
 15.20.4331.25 via Frontend Transport; Tue, 20 Jul 2021 11:38:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 04ab898a-3faa-472c-3c1c-08d94b72f692
X-MS-TrafficTypeDiagnostic: AS8PR08MB6119:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6119782E38257D0E575F192EC1E29@AS8PR08MB6119.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4y6Xoo28WqE5GLOh6k/bqopt3UVQynrYNp/J6oYMW7gjMnK16T3eSbd0M3RH0PoKBcxoOQ4YhUeMCK/zCV/guUqHfKkkS3oIO1yHy8d+VyZ5hlLamy0JfyrKEAmHaRM+GV2ZrPZ/+q7yFkUBX5XC41YoKankyMaZblFign8445VKlBQ7qeaWIYZCnW/SG0QCXvCMCyJKcqTVW0MLn+Jqm1N7lGj7NTLmj2V2hzUF/KkhZoDel0gA7JZeYOGWaqJEjhU/M655b8uNvtkafA3bxOSrtGtVTDTx6nmJGZF4XZzVpj2FPk50UC8q7a+OBcTnLOtlSueW2koAo1Y6VNGaa1GreXSgv6QKzieCPOJFNwDq6IiLWWi/U7dxlv+BLGkwuyd8d4ZS91VEbcJ63w44/wJy+cjmHJ4AD/ErAddZn1NpLKqIC8x66QCZAC3DT8QNRCRd2WAtX2QMceN6cs5SB7bKbTgQdHwEiNh57boosLOcgnnYeBheP+9oUK8hjiSpSsXHu5y1+M6EA2KvtSjAaC7Q5/PdiTtrlJTVvTTX2svgLU5vJdphZIZsWDNQJN+uiJdhFnB2p8IDCRlB0jvsNLD+wciWjGBYCeRnis1orm7qWL+ItdKs1449wKhvKY04MfoVKoy2BIqIJJ1bXc1q+l7Ozdvl9hRzbnml+kZuUfVY6/6LDHtPQMvH1xRRkm0+GA2DfM0Uj7BTI//ziE4qaQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39840400004)(346002)(396003)(366004)(376002)(186003)(1076003)(478600001)(5660300002)(6512007)(6486002)(2906002)(83380400001)(316002)(956004)(2616005)(86362001)(107886003)(4326008)(8676002)(6506007)(6916009)(8936002)(26005)(38100700002)(66556008)(38350700002)(6666004)(66476007)(36756003)(52116002)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?McNhZzqdt/uy50bjvngkxNWTkbmRnIUX/6aDqMkeRCgOGThMSwlj3XH0WiXm?=
 =?us-ascii?Q?jbqPILaQLXIjw6zY9mI/yqsgkBBa/eBWWUJtcO6JfuRDe+R0aPYFt2zUGNol?=
 =?us-ascii?Q?ysdrQZQVwhlfYChuvubUWbW/seK5K/uYC87ITgZHUbWQ8PM/1fMau6sJekgP?=
 =?us-ascii?Q?P2RXH6784mWLudsJO6CRLClNWNmNW8c7KbnOzWZrZ5BHUrJdpOkawIfh48vN?=
 =?us-ascii?Q?2IFtXSC9MX3J8/sEeg/4RSeiXGzYuh/gOSiW0pADVcx3InhmeMaeUMlBID7O?=
 =?us-ascii?Q?q9+HgvQyxYnHFkuoJvYSoqK841JQrGmHRYovLpMFNGRySdMDLKxt2AHKCVjO?=
 =?us-ascii?Q?WioZy+CXNilmYtm04D/shNAgzq1cMxNWI4YyHWJzM3CkJrAyAV9EK0kvqCiS?=
 =?us-ascii?Q?ar5vpk4oVTjL6CdnAYWuHAC8hDnrxnynO9dEMfsMl7ol2ihjFM2a6d3vDb1i?=
 =?us-ascii?Q?UI5O4j0ckSCWDLL0sArBaBrDPTk+IkSLkvMYm6OZbmUvu6Eki1nGCfxevBWm?=
 =?us-ascii?Q?8ZPUH87fMWcVtk8DucmnUFASWMq/0A/hiTaqsSo0STMHsHYWJfLXD5ur+RXi?=
 =?us-ascii?Q?tL84DrapWJDquvG2PXk/lGHJ2Aao0MjdfrOpEcHbfSG0YOnQgvXlkLLbmwAe?=
 =?us-ascii?Q?th7GajAs+8KMMM2erMxXIstAVw0si3l/RX81wOW2SpzZbfkTrHNCuDq6tnKb?=
 =?us-ascii?Q?JPtoMA5r7enuZDONA26tWMOmkVfB3oX/fMKTMzaPNreOYl3TDi90l9F/CJqG?=
 =?us-ascii?Q?4LxybCvBzpyT/G6A8zLwteh6rAtSeVGa90abjDeXmoK54UyWbaybRIV31elp?=
 =?us-ascii?Q?z8ldcdiAQNogUxJ4dfLpg/vAH//WE00580PQZ9Ulbw7gQLAnmv2vOh4fa4W0?=
 =?us-ascii?Q?mbpQNMY0oU1f33b+5nxuKMhwdXVWqdmRvW+dgdfEjsWLaBw9U8PR2lj6r63b?=
 =?us-ascii?Q?OIxz0nAg6U3f+RhN7hKNdCvbj9TJwZapdp2PPvhpg8HVSUBY1v/ldNtmzxuZ?=
 =?us-ascii?Q?BZRLUafYmU92+ORCS7siCm7eXN31o9mGfpCLY/HAM4fTeiqNME54VCuMJ/Bu?=
 =?us-ascii?Q?umYHmOTukJl0dpMp7uIVhQlK20OJXiyuT3BsuxbxGRrSS+SbkxqNVPA86eua?=
 =?us-ascii?Q?/SjzwVpJx8PlGONMwvRCudz9xx8oNbn2m0JuWj5uD/d1jIqw9XFb0/RE/7/Q?=
 =?us-ascii?Q?Y8N+AdK7/sx62GZ//T2h5OYaGRP8l4sa+Y9rBQr1aVCiVe4Li0HwvauGwKWt?=
 =?us-ascii?Q?yzhAJcHy7JS9jaz3y8zuUZO5y/E21NKq2iOzznzzypf6CpMSJTzMKnubRybn?=
 =?us-ascii?Q?IU6yjbTwBaxMVlkHja/euJex?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04ab898a-3faa-472c-3c1c-08d94b72f692
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2021 11:38:58.6312 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X4zo/npb2krbaJTonoVDUP/hcjr6dEG8xvvDTpqqxS5BXeIl1+l49ZPPuE/Q7mssLSnEtG2ifk7q/UAQy8vuL0BLdtomMg60fDO4ymIPUBU=
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

The test checks different options. It of course fails if set
IMGOPTS='compression_type=zstd'. So, let's be explicit in what
compression type we want and independent of IMGOPTS. Test both existing
compression types.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/065 | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/tests/qemu-iotests/065 b/tests/qemu-iotests/065
index 3c2ca27627..4b3c5c6c8c 100755
--- a/tests/qemu-iotests/065
+++ b/tests/qemu-iotests/065
@@ -88,7 +88,7 @@ class TestQMP(TestImageInfoSpecific):
 
 class TestQCow2(TestQemuImgInfo):
     '''Testing a qcow2 version 2 image'''
-    img_options = 'compat=0.10'
+    img_options = 'compat=0.10,compression_type=zlib'
     json_compare = { 'compat': '0.10', 'refcount-bits': 16,
                      'compression-type': 'zlib' }
     human_compare = [ 'compat: 0.10', 'compression type: zlib',
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


