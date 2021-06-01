Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99ECB3978B4
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 19:06:57 +0200 (CEST)
Received: from localhost ([::1]:37266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo7qy-000839-Lo
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 13:06:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lo7bz-00038Z-U0; Tue, 01 Jun 2021 12:51:27 -0400
Received: from mail-eopbgr130139.outbound.protection.outlook.com
 ([40.107.13.139]:37856 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lo7bw-0002Zc-Nv; Tue, 01 Jun 2021 12:51:27 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B7VJewMFFUAjonQ7bHCfiib32CY2uHRrfUqe5Rspvj//72uAPcQPRdzJzgWIkglUSUe9w2qeJstkR7NGXkfoJVpZtmvnkwTGb9nweVLjlRMPRcJL9Wto52C4lIVEUv6sC2ZMIpALBuZv+W2OkZSM6uHTtI8GWAfpqFzyZ9Ql+h1od6qCRwb10oZfIpvsj18I8e9KAlJ57OfeboqybrlV8cZa5RWSyKnnebdQTIPUwoizVp9qsZUPJSJpDsuw7l8Yxcas9OpNPWhqMLpRDc6ecO2+FNLR4MkQtAdFu+vlWK3ZZvYtJB1GQcWYnc5pdLM8y9PpQJNO3J7iTehzhhH+UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3hThZmQm51Sm7nJEhS46GAn4Lu/YtWxwc3tRvkYElg0=;
 b=TwcCrEEjjTpNU5Rbu64xjPuTUmuXTrzGw8b9V0jH+jD6l8e4MRvnOIaPZUFA98axr+OKBqwm65SAUOdgSNTR9GxdsOrg25WSOyI2sL7qnKrm3VaTpdwgiAmAGp21ekJ8d1E6ptfxM0EMqdDtzPeZgkh1BoVFa2pjYM6V8jyRwunw4iQCdhjmm5TJbtW4W0dVuJ+NvGnN8WRMEh9OqtAJI17idNNv+fuFcTICZehpp2LTGQ2zPChyK74QeriFlpKfvCjiD29nm1N1ba7bASJ8S9mW4fxM6lk8pgpJulUvcaTQ/00889m8Rf/uak72fgMWGY/c8kwH6ivkfFE1bbDJQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3hThZmQm51Sm7nJEhS46GAn4Lu/YtWxwc3tRvkYElg0=;
 b=d+n8vDlWyGzNK/9c73gNsTL5TMmqhXjWeHDlJDeTqyJet2HUlaSjd/TCm9a/9XEP17NVRJ0ah1XhpbgSe0Hdka6i+woDxxE6WCA4KOX8XbGwRRI2yUDaMlWCsSGJeDabI3vekZwzreG00EEMH45ZSeEwS8tIcaq6EBmyM9uqwH8=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3864.eurprd08.prod.outlook.com (2603:10a6:20b:8e::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.27; Tue, 1 Jun
 2021 16:51:20 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%7]) with mapi id 15.20.4173.030; Tue, 1 Jun 2021
 16:51:20 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v3 28/35] iotests/222: fix pylint and mypy complains
Date: Tue,  1 Jun 2021 19:50:19 +0300
Message-Id: <20210601165026.326877-29-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210601165026.326877-1-vsementsov@virtuozzo.com>
References: <20210601165026.326877-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.210]
X-ClientProxiedBy: HE1P189CA0028.EURP189.PROD.OUTLOOK.COM (2603:10a6:7:53::41)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.210) by
 HE1P189CA0028.EURP189.PROD.OUTLOOK.COM (2603:10a6:7:53::41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.20 via Frontend Transport; Tue, 1 Jun 2021 16:51:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 568af198-f4fc-4234-e8bf-08d9251d7b7e
X-MS-TrafficTypeDiagnostic: AM6PR08MB3864:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3864DB9F8D69923A72CA62E9C13E9@AM6PR08MB3864.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:454;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LWXrcWE2lWFL8gBJxPEFAtoIkCjY2rC08v+ufsyGkStfGzGVkNFM962jUNutYIEgKFyex7AApnp6lpRocP4aaF/G+5ifKjmJo8FN2OreFkVyyzAKUDkj1IWSiQ5NSAYDCML6S56O4pZXu74JezzI7I9N8UIQYMGqcccfuMFLwvnYHYFakxtzzFzc+jwnMywp1BpSZQ/opZQfenutAQysvJJ6Ch87atOGd1pNba41v24iML2u1HFsGSyCiaiZ8/4F7bTZUPbnZ8W+gpu3W3A6jfyNI6DLfNOYSwcaW6lDtSEyV+So9Tdh8GscUH0AWstzm0jwSg/nkLEXGOT603iVOTCgs1qGanKhfVQ/BhA6WkqOH4NGrQZBx1/Wrf5DOFLCm7Kk6+lKA9umGNV7qF7gwvGmPz20Fv96zQ9i5+s6nHx3FVdXOMcD+5oifTVuqOtKIXGRkvnzu1oT9/pEUzxbJMIT9gKtROngOe5JOfz5T1cGpxKetKla6Kfid1tn+1UFP/fMUCbbwf3eJ4jK3CBbgVbw45csVpR58vx9i2CmDVFEn5abdwSVAVqMBXiDUxzASyPEjgrUAxjZsK4CVC9LAd4RNKNSTsFQdZTBHrodI+53xnNZVkxd/TshP5xiaco+hakmjaYMaulu7/FXv7f/plki6nfcZa9ktSXmHwRwYJ9V4F5arD15osAXF7GvRoIK
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(136003)(376002)(346002)(39840400004)(5660300002)(86362001)(26005)(1076003)(8936002)(66556008)(6486002)(83380400001)(478600001)(36756003)(8676002)(2616005)(66476007)(6506007)(38350700002)(6512007)(6916009)(7416002)(52116002)(2906002)(16526019)(4326008)(186003)(316002)(66946007)(38100700002)(956004)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?43x23biZdQSkMRls2vOR/+V5CdAu/IXp7E/hoyqAP3T7eQTzGfjoTQ+vB64q?=
 =?us-ascii?Q?cR6aEaXEdF39/iTeyXz9Sdi4mszXk3hJRu9iMSvohvm63jnvKejnGNcVVcsh?=
 =?us-ascii?Q?x4sdL96G9AodgutjCo83YJ/DICdf6AN/+PyMsOlK5FXd8V4OSxvZVRm4OG2X?=
 =?us-ascii?Q?8fnFuzVeMXNOHPotA21S/BpZcQDhZMiUwQJv2+ZFRCnUMO3ADBXKSzJgoko2?=
 =?us-ascii?Q?I0yjE0m1y+NusjSCtkFB3Br+WdW1n/bqEDXc52YnUeJl8jEH9mUe6PdNHL7V?=
 =?us-ascii?Q?aNcXLcbl4+Y1QKXKQqwn9L4U+T/SLnUsdUZLoWUZVjDfmVSbuRfsC/glmTWn?=
 =?us-ascii?Q?T/LJLf//PipWSDrsOWvavPPlnN/UC2EAIa0b1WqvNZqKETgXDjLwOiFkozmE?=
 =?us-ascii?Q?KpS80zhuQsZciwqa+KGuA8P7LoeGAz0WOpimSaSk8rwDpQcx2dl5iIxjLVHi?=
 =?us-ascii?Q?Wpi7UXW2mufR85bqNeeyn5iRVY4YqEdJwzkloVQJmTMLomXyH6pxT5BkKLCU?=
 =?us-ascii?Q?031LCkl791a89RwkQAY5V/Ho6Gy2pds66/3q5rd+/A33DZN+SmValWdHbnub?=
 =?us-ascii?Q?QK1/Q3hJ3h48uI5tjDoiH0+mAUlyyiiehZK+oiLmcf1A4x5ycXH9zBHuco9d?=
 =?us-ascii?Q?9tpFKgg4WuFI3TuLDKJ9xz6b4neS989XeUay4r2HA8Z0+p5MbwgSvUS02Zv1?=
 =?us-ascii?Q?EEeQ3+wExlLy8dCeuQeUT+70kyv5sMkJGYf27xqhvUlApT9//IS99/m3l/eL?=
 =?us-ascii?Q?G4hnegcyvsi25pK2E1PUyvJIiwcD5ycsf7DCuJzXUb17pbJG9R3OoLilHe4a?=
 =?us-ascii?Q?1BQ1JoH36eLKxOkRbJEciQN4yBwSNh2Ts5k3eV7e+mxnVtRxLEm0i5LSZRFd?=
 =?us-ascii?Q?snLh1CrOaj2rchG2WG3NMAOAOinCe7mthpxal2LnVdBFxH7mH9PpcRu5Lx10?=
 =?us-ascii?Q?tBn5i29VcHJqAke3RmbJMRW7xhljoyUjR1PcnqdaJonpYjio0Y7CH/uW6TEr?=
 =?us-ascii?Q?wvAkNzEgtTcTP3Ptc4QRzsn4CoXAiGNdZBYh3wf2ahmIP0x6dhDnG4mOPZkS?=
 =?us-ascii?Q?+YKDeZrruw1T0vfnXY1V92Yazz7NR3y5LN7svLu46XWtKsvOhNmusrFJ+kfV?=
 =?us-ascii?Q?lIa0lQTckiP7KwrZaB43mercqa14uD0r02LDDYkRA7VJPU0RdU0JYAyGQv+m?=
 =?us-ascii?Q?rTUoViuadnqNj+6aIx9Yn+AnjLefE4qpRXBQaVLEWNMPxnKGiwG9fvYvMRAx?=
 =?us-ascii?Q?gcy02TtYSvINWsOSs20yXIx1oI3xQDx/WdfkxWDNyUkfy4lcp3F25x3JF283?=
 =?us-ascii?Q?+O2MKHgbxzWhvCDMHXFp7eK7?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 568af198-f4fc-4234-e8bf-08d9251d7b7e
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2021 16:51:20.6954 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KrWXX+kCg1oZ/kx/YKQxNXdwcooOvEgW0+vMf0uuTEI9GYICfndBGf1bu7xrC8t9vCk7mvrEoagkV6jS7MxXy8wwJgTViI0EjJBV6FEY8yA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3864
Received-SPF: pass client-ip=40.107.13.139;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-HE1-obe.outbound.protection.outlook.com
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

Here:
 - long line
 - move to new interface of vm.qmp() (direct passing dict), to avoid
   mypy false-positive, as it thinks that unpacked dict is a positional
   argument.
 - extra parenthesis
 - handle event_wait possible None value

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/222 | 20 +++++++++++---------
 tests/qemu-iotests/297 |  2 +-
 2 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/tests/qemu-iotests/222 b/tests/qemu-iotests/222
index b48afe623e..5e2556f8df 100755
--- a/tests/qemu-iotests/222
+++ b/tests/qemu-iotests/222
@@ -50,7 +50,8 @@ remainder = [("0xd5", "0x108000",  "32k"), # Right-end of partial-left [1]
 
 with iotests.FilePath('base.img') as base_img_path, \
      iotests.FilePath('fleece.img') as fleece_img_path, \
-     iotests.FilePath('nbd.sock', base_dir=iotests.sock_dir) as nbd_sock_path, \
+     iotests.FilePath('nbd.sock',
+                      base_dir=iotests.sock_dir) as nbd_sock_path, \
      iotests.VM() as vm:
 
     log('--- Setting up images ---')
@@ -81,7 +82,7 @@ with iotests.FilePath('base.img') as base_img_path, \
     tgt_node = "fleeceNode"
 
     # create tgt_node backed by src_node
-    log(vm.qmp("blockdev-add", **{
+    log(vm.qmp("blockdev-add", {
         "driver": "qcow2",
         "node-name": tgt_node,
         "file": {
@@ -103,8 +104,8 @@ with iotests.FilePath('base.img') as base_img_path, \
 
     nbd_uri = 'nbd+unix:///%s?socket=%s' % (tgt_node, nbd_sock_path)
     log(vm.qmp("nbd-server-start",
-               **{"addr": { "type": "unix",
-                            "data": { "path": nbd_sock_path } } }))
+               {"addr": { "type": "unix",
+                          "data": { "path": nbd_sock_path } } }))
 
     log(vm.qmp("nbd-server-add", device=tgt_node))
 
@@ -112,7 +113,7 @@ with iotests.FilePath('base.img') as base_img_path, \
     log('--- Sanity Check ---')
     log('')
 
-    for p in (patterns + zeroes):
+    for p in patterns + zeroes:
         cmd = "read -P%s %s %s" % p
         log(cmd)
         assert qemu_io_silent('-r', '-f', 'raw', '-c', cmd, nbd_uri) == 0
@@ -130,7 +131,7 @@ with iotests.FilePath('base.img') as base_img_path, \
     log('--- Verifying Data ---')
     log('')
 
-    for p in (patterns + zeroes):
+    for p in patterns + zeroes:
         cmd = "read -P%s %s %s" % p
         log(cmd)
         assert qemu_io_silent('-r', '-f', 'raw', '-c', cmd, nbd_uri) == 0
@@ -140,8 +141,9 @@ with iotests.FilePath('base.img') as base_img_path, \
     log('')
 
     log(vm.qmp('block-job-cancel', device=src_node))
-    log(vm.event_wait('BLOCK_JOB_CANCELLED'),
-        filters=[iotests.filter_qmp_event])
+    e = vm.event_wait('BLOCK_JOB_CANCELLED')
+    assert e is not None
+    log(e, filters=[iotests.filter_qmp_event])
     log(vm.qmp('nbd-server-stop'))
     log(vm.qmp('blockdev-del', node_name=tgt_node))
     vm.shutdown()
@@ -150,7 +152,7 @@ with iotests.FilePath('base.img') as base_img_path, \
     log('--- Confirming writes ---')
     log('')
 
-    for p in (overwrite + remainder):
+    for p in overwrite + remainder:
         cmd = "read -P%s %s %s" % p
         log(cmd)
         assert qemu_io_silent(base_img_path, '-c', cmd) == 0
diff --git a/tests/qemu-iotests/297 b/tests/qemu-iotests/297
index a37910b42d..7cb8c531fd 100755
--- a/tests/qemu-iotests/297
+++ b/tests/qemu-iotests/297
@@ -31,7 +31,7 @@ SKIP_FILES = (
     '096', '118', '124', '132', '136', '139', '147', '148', '149',
     '151', '152', '155', '163', '165', '169', '194', '196', '199', '202',
     '203', '205', '206', '207', '208', '210', '211', '212', '213', '216',
-    '218', '219', '222', '224', '228', '234', '235', '236', '237', '238',
+    '218', '219', '224', '228', '234', '235', '236', '237', '238',
     '240', '242', '245', '246', '248', '255', '256', '257', '258', '260',
     '262', '264', '266', '274', '277', '280', '281', '295', '296', '298',
     '299', '302', '303', '304', '307',
-- 
2.29.2


