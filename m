Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3851540ABC4
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 12:32:53 +0200 (CEST)
Received: from localhost ([::1]:35580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ5kB-0007SN-So
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 06:32:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mQ5do-0004Ct-Uh; Tue, 14 Sep 2021 06:26:17 -0400
Received: from mail-eopbgr70123.outbound.protection.outlook.com
 ([40.107.7.123]:7651 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mQ5dn-0003M0-4w; Tue, 14 Sep 2021 06:26:16 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TKtXeOE8wVTwQHUI7lA80j59QnveXjVh0CNiNwYpEd0x4qn5qekZzjXI2eOmLb8PnHKtN1tqyBRepEEIN0sPrSKNjpj0RFP53ebzQ6UgaDAIqFtBsnYcIY+rVRrU9ccUziuTYAE29Vg4do1K/lo+P37AaB5Z8wtKKmI75FeXzmWWJ1KnX9sFina+RnuTIUP1YLFIzKMVQon52eKQcERL88oSHE+KsmomCbjhHmahi5d1u5b49IFBi0ElQpU58Z44khr8EvzyIhztKEVsA2djspN1ujrJd5LhwzcfIWlTDI1RKMl2tzG13Gdb8cSWVpJREckPLSlxD+EhZ9i9vr/Ijg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=Ti2Mw+9/ZEbCgAbQVCQKsCO/HGMNA7lDgtXys/NpHpY=;
 b=a+z+HPwYXitcVjlYRX/heQKlPYGXD/j7/zVKneLv+ZEXgHdmOGicfcLfuNlsdRgZBf68xw8kWwqzzoEMFQpQOKP6zox84FOrQ9SiXTKgHK7HVZ6yCZnNQ0ugZBSVmfBuaBZ41Tan/ybv9h3YMBLE1H2wEeUm+AaGWCFGlW3rHUqEp7b/ayx7lGw/ZXaPyL+9qgFEI04qbsBYoFfUNulpwcAYsxV5QgwRNs6T014dWuG5jajqfQPTDFbfHORYmThlvf5piad4hvQiDtUoJUTr8O3w7WdrO4P3GQeMtdEnDHNjbg/Vz6CElMVU4a+LFMlmbn8gBMZ2GpOEdm5ToQA2Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ti2Mw+9/ZEbCgAbQVCQKsCO/HGMNA7lDgtXys/NpHpY=;
 b=rTykT/MpHz9S0uwWH08xLcT/389pJn7ycaVyX4VGXDO7k7LNtjdT3Gxmki5TnGhRKfWziL546Wga8byUt7+DFFHzHyc+pLOvzGGu57szyti268QAHjMXNirxSwieBXaOxqTKagmwJX9Pu8/+5jEB+nYK/3OSf0cWVFjrigWwcAk=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1716.eurprd08.prod.outlook.com (2603:10a6:203:39::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.18; Tue, 14 Sep
 2021 10:26:08 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4500.019; Tue, 14 Sep 2021
 10:26:07 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, Max Reitz <mreitz@redhat.com>
Subject: [PATCH v3 01/17] iotests.py: img_info_log(): rename imgopts argument
Date: Tue, 14 Sep 2021 13:25:31 +0300
Message-Id: <20210914102547.83963-2-vsementsov@virtuozzo.com>
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
 15.20.4523.14 via Frontend Transport; Tue, 14 Sep 2021 10:26:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 12cc875c-44eb-4e49-1259-08d9776a1086
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1716:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB1716A2B23468ED4D1C8451D2C1DA9@AM5PR0801MB1716.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:400;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 51RBIBHW8BlELo1gWPQtz3voqa409/tvAVxQ6x8gSvf1AUcKVBMwQ6ZOjzjq1aM90/mXd0o3lePkCkajuLKi3XqLcR/cApFN/duccDX4l0K+1QecjgRC17udEXVTt+lBPg6wwbq2bmkqyZeKl23eVQZ28bcALujGSwhb1X1sSgw5Ungb/wP/85CR3rsrFJOJzi4WM3KeBcNHwBFM9HPyTsBvB7E07CycEuAZeLOq6CbOwUXHWeQTpH4X0Ya4LJsVrDwyoZiew0L0YysqDf7+PADtowqXNvdJ8AZxfTNEyKxJz7iknXwiswp6wvlbejvh08Z2H9pTy+TYa2jX1WmyqRdMOO2Bt/2ecc+f9gkRbLDabDJbIM3QscTfHGoI7ungSoopkx5GrTOCTFeZyHZMMg5I38E6u4RfNVYwM3nah34yAwFyN35H+W3DrJKbWOBVpe8JRWn+ARlkWNKLZFbJ5KGQO6ZR+Kdt8nxzZsSYsT56P0We+Ciss/tZM1MhuebIxsQ6aHrynm2wSqW3lPcbSwHbczPQDF1g4GdWxptQMcLFfyB1kBY+y8K0KzCDL2MOz8HymJ5MVgszpO9HjG7yi5ly/WHrMqcNfCIhMFBJEWlM6fD3xTg9eFFwebsUYSPW+9NQutOQYB2IzNyRkfed5EAtQyqXa0UrEtKneqgkMaknYQCEkYcFkdQO/czQBeXeozA6QOInpFNa033LtGmvtA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(346002)(376002)(39850400004)(136003)(478600001)(66946007)(66476007)(66556008)(36756003)(6512007)(52116002)(186003)(4326008)(6916009)(5660300002)(2906002)(83380400001)(86362001)(2616005)(8676002)(38100700002)(38350700002)(956004)(6666004)(26005)(316002)(6486002)(8936002)(6506007)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gIxkOje7RhNBhjsHzodSjHOUSIX1LiLsydor0eW2s7gzWHVFnzQa8v67iCRa?=
 =?us-ascii?Q?OXFly8hW+sRcW+jqn+hYOEgi+DL1BlJuz6j0MLQ2MU00AK5BEKdY3EIacUn7?=
 =?us-ascii?Q?aOCiwwiW+samlJa0E4hRQiwnMgAA9tgGiQlLzv37lbOpeKTliiNsK1/apX2s?=
 =?us-ascii?Q?e+u3u0jHfJU21myGPcqiAuo88KlTs9oHD05yQYivJEWTESaQxmN6E2CkQf5A?=
 =?us-ascii?Q?6bXAL4OlWc+Un/0u0+FlaK8NHosGnm+iya2EnN0ZWl77G6wVM3EGGFuE+0qN?=
 =?us-ascii?Q?4GS8DblSspkCPJ/v/U4y7GXDL4Uo+UiUfXq9fiIWX82JUCRFLuCFPWFXuLTg?=
 =?us-ascii?Q?uIS3MlNYQ4gd60zMvES54jib5h4gH5oIumCLbW1m6vc6HWzO4qtqvM+LFcGL?=
 =?us-ascii?Q?GviF+Br/nEhxidVn96qa/gpJuaUeoX8GOgqDUiqxOxUa6ULgNTPuFwMBNWDs?=
 =?us-ascii?Q?hWXyJLX3362g66OsvJ7Pha7t5WnbHCTIbID5xy97b/LcQtrA6m+wmFszdX39?=
 =?us-ascii?Q?cvGeyUWdCUwj3w/hsJQGTJa9UyHJOVnmKh9OtO23REkqBrE+RVc2mKgkU3nm?=
 =?us-ascii?Q?2eB4bC621OnFj0+z63ECyqQSBqsbKgzAxub7tRCvrmZZ+FnfHzOj7IXEnAwP?=
 =?us-ascii?Q?zrQvwqn2NSBOHER80NmsWTYB9FTR5gpiMmpuqRLXtWhZyv0GH73bVdwJhctx?=
 =?us-ascii?Q?uIdf40qn5cYsqJ6GhMlJCyzoFmKjsNnzMTVwW1Bn2dlqzoTHEeRuoVEJT7V1?=
 =?us-ascii?Q?d9uj2YuNd8NF8U6A7brAY1s4C1NfhxvrtLnEdn3EdMp+8hxmres+UiTc86Ku?=
 =?us-ascii?Q?EPq/N7d1IJunMAwGJWWN/hnRIgh/qGXrNrrlWzHmJ8KIm7pzDip7UUqSuWg5?=
 =?us-ascii?Q?6LymAj9/IKz4ayM1gU8jxjXRuBnRXsUZpaXrSuhtDnbuzxLesLu3Oc6n9FTO?=
 =?us-ascii?Q?6cxI3AvoNDV6ESnHOQmPHW8p62jReCttD6j43e7L+TBn1dFzzXCfDph5HM2O?=
 =?us-ascii?Q?VXVfs5UXoYV/f80Vd4FMZKFdQkIQ4Qi1O92mGiyDzS0XqogBOGefLJIa1vuD?=
 =?us-ascii?Q?N/QE9Sbwza0tZafFXUA4acmtS9rcH4EQcpL4cXHE7vjAS9XU/GWj7KMiGYBH?=
 =?us-ascii?Q?fWyTMBs/h/fzcVekNCCdBtY0U3eK6k9CkROoxGyFxVu+JYatBIi5by8MtzDO?=
 =?us-ascii?Q?oC5uHL4soZxT49oAIZ1hbulJYkadppBR+/mjGSZD7fkYeZqsb4+YAjbxx9xz?=
 =?us-ascii?Q?/01XEe9j5qFqrzxMA+RQ3m6eLeWxflzCBZst48Mbs26EuO/0tm2NfAzEysQI?=
 =?us-ascii?Q?J/fx69ALx/1CFYprAy660pTj?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12cc875c-44eb-4e49-1259-08d9776a1086
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2021 10:26:07.8878 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XYJBHtWrEtwAgAH+vgbN+jyeA9Yn1z0ElJgicmzL0ViElTbPO7nR3Uol9kExfrRKQmTLREUju2IGBN8sBGV9itBU8vm7fMOGWgLFUBypQbc=
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
index 5a62ed4dd1..79b4967225 100755
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
index 11276f380a..782d4f0e21 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -205,9 +205,10 @@ def qemu_img_log(*args):
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
2.29.2


