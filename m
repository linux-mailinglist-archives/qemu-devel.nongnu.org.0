Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A250440ABB2
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 12:29:47 +0200 (CEST)
Received: from localhost ([::1]:55114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ5hC-0001Y0-Jb
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 06:29:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mQ5do-0004BG-8z; Tue, 14 Sep 2021 06:26:16 -0400
Received: from mail-db8eur05on2115.outbound.protection.outlook.com
 ([40.107.20.115]:20224 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mQ5dl-0003Ok-PY; Tue, 14 Sep 2021 06:26:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EHoGEcKOX2/QId5dmaOFhnDTfi/B4J2geEpq9NV/JjrTxv3evzoEAA9tpsi2zcMC9xDcLGKr3h6Qm8hyvBFsaAng2YrCcJdKB8teywblU/CZz3znOSDJKNVuBIB+Q+EsS2wkIdY2gzCQ8Udh0gpWfHYMjDXsQpXTPd41FKiCzgQ4snAlOlQioaseS1OMs+Q9EeR6ocG7yM/kJi+TYO5KTR6mrGB2e09+HFbSBaE3H1QqpNb1RFe6temknMeflMfRDSQUMqj+uAJJKLy3WqVQzxERwmCYGyarEiznr4upaZZiyR7ncZYBfzEwY4cGTLvsovQvcYtipwmD1QgRrw7ToA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=iEpVDIxKUyicKgoOP7UXW3oP23jidC1MqwU5O2E+uUA=;
 b=b21u/CzVNxWQy+OqEwSLzQUw+SwGPdsec0LkazMR4nsBJtKQqJXsNR0uC7RSvCJwkV7OeNrCaIFhuqqXxQU4q9IIZrtstJu2LRiTCJjqX3CMM/SWILYCnxh5A5T03VV67kDY3o80JyQkI45kjUpdnM52SmoBPSKfECP8zisenvY1dUdP0sfnqO2NBgUTyenhHOSkfDT6VMOeuoxszY7ChFbBbUcVGcOtWBwku+kn5w8GzjXmo0guxefUjoBExobu9K5t5kKJ4iTVwIVb6HbFyHiZVHsUefD6MTZysgWckXXJwMuhrN6/nYXLBLEpsxe09jETu+Q0sPMTaSlctKlMfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iEpVDIxKUyicKgoOP7UXW3oP23jidC1MqwU5O2E+uUA=;
 b=O4zsyU+k2UaTtjnooMlJON0Zb/DRn+iKDgDqL2tOBhDmI0RMkP6l5YAgo3YS8MNyD2lC2oefEwBFva12wGEpzQvQmY+/YW14Eo8RqnooGlIuqu64Qzg7otldTyZNYfyYo9tMC4k2nP/dzhaHch/jDhVBJ4uZHhl17xzpBxFjBA8=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6071.eurprd08.prod.outlook.com (2603:10a6:20b:29f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Tue, 14 Sep
 2021 10:26:11 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4500.019; Tue, 14 Sep 2021
 10:26:11 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com
Subject: [PATCH v3 04/17] iotests.py: rewrite default luks support in qemu_img
Date: Tue, 14 Sep 2021 13:25:34 +0300
Message-Id: <20210914102547.83963-5-vsementsov@virtuozzo.com>
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
 15.20.4523.14 via Frontend Transport; Tue, 14 Sep 2021 10:26:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 50f0e58d-69b4-465f-037c-08d9776a1258
X-MS-TrafficTypeDiagnostic: AS8PR08MB6071:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB60711CB56D916478A7991FCFC1DA9@AS8PR08MB6071.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jQfY4S/27mWQaklZS9dcxSzjPyXR8cd9tazDe2bC1Ly0mhP2hzYSIPEoD56fnzd8eFOvixIY+HxNFR7DRXGLmEXBALYSnteVMfW+MUToWpgeb4o2P0w7a2Kg6Q75id3FXDdoDEJGg1t6KWDHRbSBMiARXk+2AIwOs81T34QpuTQppnqOeI8IyuclfueAT/gt4CYdHKt33JcVHtUXo8pAveM0UqqcplCDNVWl9HlkTioTtWyW5y8xy2hsjz5pgm4QhPDxaOoq2EEWUt1clsDXi0NfQkf52A/ut5zem/J78f93m/pIVCRAEO8Yms5jgREs6PQpgYenX4NMmlzX8UkmOvHRirEmrV1lbFwuMEXUA0rmHQEeKy0js4/P79HZTzjIAxK4XKRZtyhSbQEhlK12Mzzsn0kP6MrStCn1GoPBqp+6SE5hi1dwIpBErYwvBdBmpyOHJTPZi2us0oF2loNo5rr7F8xzpbeOd/7Dw0LvmDqphW6XpKd727b4xWDrOBoimlO1KfgBSfoLF2HwVqnLHmOVC3IEqfOdeeu7zC4YzKVqo5Bxw8sjMkgKnBsu8/gBiAa9aGU505OPhvM/pdZtWxub6+kcIa3JHxqZfw6SQ2OT+vmszFhaIgeZzE3pnUTWBWznfn7K1XstY+BdoS+kgONtPBmQ8Ue4IRqKHXx/xwC2eve07UVKPtEUyOXCfztYP8CcOEaGa7gRGkTQGq9axw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(39840400004)(366004)(136003)(396003)(6486002)(26005)(86362001)(2906002)(6666004)(38350700002)(66476007)(38100700002)(66946007)(478600001)(8676002)(36756003)(956004)(66556008)(1076003)(186003)(6506007)(6512007)(6916009)(83380400001)(5660300002)(2616005)(8936002)(4326008)(316002)(52116002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?I9I7Uzr+8izIzhJdHzEsOct1gTyY8tHN+oHUdYjYdCCUHfBh6ITXz4UUjkIC?=
 =?us-ascii?Q?oipZelEBAQl9McnMXnHDPIaVTkWZ2NRsX68iwBLTzlaZZIZCbGVaCqsqTZ55?=
 =?us-ascii?Q?tztl5jELPx5uoVacaGkmgerO1Tq+cSszYuuWftsVZo2E5pN1xPnwtYvUl1hK?=
 =?us-ascii?Q?k38rbdLisjLCa//+ub+Z4YqmMazTNi84YlAx3wBiIK6gts4IPW+dsHhm8qcn?=
 =?us-ascii?Q?IlMTbkpPYwk1O4CjJ6DrE49UmttgBUvCihoTOybQaDNIR5htZurXmO0LFZC5?=
 =?us-ascii?Q?GHUREJTlcTL85V8CS4p2xZhUaNq4BWjaIMUIfUg+j/wd39d1iyZ3vBjNRwZ/?=
 =?us-ascii?Q?hTV7m1lxIBHGVLXX9e43ZlQoV12sqA3h1anBkHglwHM6G4iC/6a9fMKOihlE?=
 =?us-ascii?Q?cqlZS+7lKVWK2d6eUdQalD10FrUmhwiQlEhC+5CTQGp1IR5H5P7bImosYaFA?=
 =?us-ascii?Q?PNWsWewsZkhSJMDb3UzrBQzrsL1m4eRvjyqhfVs67Gpa2ZpJwDCb9HPmk7od?=
 =?us-ascii?Q?/sjWNnE/J1jqG2lEE/ijgpbQp9jh8n50Hqr38+AVm/Q5SxpckVCnMP0Tjiuf?=
 =?us-ascii?Q?koSH/sCXKPMX8F0Z1TmXwx3qXnyAmh1RT7Ubhj3kzTRgkuNQYTKheKJE/HME?=
 =?us-ascii?Q?W7JHKcnVZVw0D6c9YHZcgu8fYPKI6b39B+Px/stHZpe3zCjjlytGgm+OC0l9?=
 =?us-ascii?Q?h/g4qWZ3/mNB1sew47iJs0Y6mdwJ8/aoJfhvKNRws5p0QnNtyBBQ+PuGXGqq?=
 =?us-ascii?Q?RnEKxdt0OnSpx9QiP9ixopQ7I4MWaxZiVcgTp9u8GpCpDsctjpEJrV5mjNM7?=
 =?us-ascii?Q?7sLZqQtDx5rE7cfQyzxW6HatD1mXelSMQcJPLP9g21rsb/F/ddxr7nKsE6fZ?=
 =?us-ascii?Q?kEs1AmRFI4zqJOQbxSp+8zqmFyEibq5YYnyxw5LvOMGn/eC+LbgFJGMlVNSI?=
 =?us-ascii?Q?sFuOqK8JJZNRU3V/QoZBkJrZmDCTDQaxx33w0fDW9+gmZmcaqDdwYUdnR7oV?=
 =?us-ascii?Q?qfiec1aYFbUfDyghslw5NixY5W5JLsRSv54WCdaC2QK+mYEoEm5pVUh4v4Y+?=
 =?us-ascii?Q?mwjJCigZ6pdWkx953szcz0IDj4dZ50w0qvHIDKAks0ty3luqIvIcFIU9ptMC?=
 =?us-ascii?Q?JHNyCRVcNw9NOzwcMf7Bq2NYRdkC2tM8o8NMUE7w9eBlQnDE8tuupW3QOKt9?=
 =?us-ascii?Q?kw7hOi+Upp9PJnY0KfhMSuI30VtemjDsw2Zk4NGnyetK7EIh3Im5n6dRhrl2?=
 =?us-ascii?Q?jJPHgCcEe1538l5CGMX08Kd1raxq17PPIeQR4vCkNVMhSGje32mckrL0rexk?=
 =?us-ascii?Q?fgikdzMffvwYUhRR32Zp7VsY?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50f0e58d-69b4-465f-037c-08d9776a1258
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2021 10:26:10.9016 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0Il4AXqf+ZCHwy371Kz5knfsMpX3W3BhQqTfKB1EdWUL5o+Tc/DUZScbY+1I0NVPB1riYeAdmVX4dXIDZGfqg4mkbZNdvt1uZQD1CKrlmFw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6071
Received-SPF: pass client-ip=40.107.20.115;
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
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
---
 tests/qemu-iotests/iotests.py | 36 +++++++++++++++++------------------
 1 file changed, 17 insertions(+), 19 deletions(-)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index fed7e1f640..a838737c28 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -146,9 +146,13 @@ def qemu_img_create_prepare_args(args: List[str]) -> List[str]:
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
@@ -157,8 +161,18 @@ def qemu_img_create_prepare_args(args: List[str]) -> List[str]:
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
 
@@ -189,23 +203,7 @@ def ordered_qmp(qmsg, conv_keys=True):
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


