Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE9D3BA8D8
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Jul 2021 15:52:33 +0200 (CEST)
Received: from localhost ([::1]:58640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzg4N-0001Rb-TD
	for lists+qemu-devel@lfdr.de; Sat, 03 Jul 2021 09:52:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lzg2s-000095-Pg; Sat, 03 Jul 2021 09:50:59 -0400
Received: from mail-vi1eur05on2137.outbound.protection.outlook.com
 ([40.107.21.137]:45665 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lzg2p-00074s-8Z; Sat, 03 Jul 2021 09:50:58 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ROggFTUT4IJdtyLs48XuynP3celoWDCAjFrf+Egpgug9aIAyz2oCBExrdjlwCl5WEWz3s5DzPT/IqmWs4enXSN1PWfwE2f4izO9gcUja325VNvN2XpbgdtC7o3FfYKdfLW+Z/InRuUVW3pPV7eRoGx2r94fioo6CiA2YLQo+gP7eB9YJ7qaCm8e6X3Zxr/37kX8OeYaHRgyQb8lp8HhDXewHIGx1kmJueHSZstKDQl1ZjiyL8quS37aS0nu6DtjJmXPixn9M7ERuwmxlQpi8/hPzWSNW8iihsBrTelBmQL8vkUJDjkkO+3e6PA+kZ1tlclkPm/KU4AzLXJIzg5jxkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3RUPzAK5C1tL6Hr5jbmwX6KbAdKPr4ogW3LuAkdg5YA=;
 b=NWVsbga4geuc8Du37AqUtImJBeSsRbeQbwrRbmKs/f5M1wfb/9mSHGqMUQsbGxhplyugGkwzMdT1zXRCl68NYQAJJgahd4DhtsRwOO0NqD6lPelkJjMZQv/MO6K8NY5TvkbxVbqOcS0GSQk8JYq+ybCGz1YLqdArZa72SA9FCU7oZn//l/dREKAoJ8Cx/pmIzMzVeBxESmuqKFraJt/DV+38xiq67ND88firrufGZMmlPsJ19lWM/MAxHmEHr+BmmzwnoJX7lduFX8Kk25SbWLVY0iujuSiI6H9asl+a1WB7QHgfo4GcdzmAxVusKq2K8oPTWFmzo+ehCF1Z+k6zRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3RUPzAK5C1tL6Hr5jbmwX6KbAdKPr4ogW3LuAkdg5YA=;
 b=tLQcrgWOuL8M4dAHD7MtA3AcmiQrW74Igp3vGaxaw4afa84jPtosLR68Vg+XK56/C/bdEYqTL/aE+O4IjC0TIMqWo3id3HfosO5Vj4GdXtR/vSxniZuvkz+w8+1ic4DCSCj8nRDn9YCI/qN96gxeTrVyU25Bo91upK2GU+wpHOM=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (10.141.175.15) by
 AS8PR08MB6280.eurprd08.prod.outlook.com (20.182.242.204) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.21; Sat, 3 Jul 2021 13:50:49 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4264.026; Sat, 3 Jul 2021
 13:50:49 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, mreitz@redhat.com,
 eblake@redhat.com, vsementsov@virtuozzo.com, den@openvz.org,
 berrange@redhat.com, armbru@redhat.com
Subject: [PATCH v2] docs: document file-posix locking protocol
Date: Sat,  3 Jul 2021 16:50:33 +0300
Message-Id: <20210703135033.835344-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: HE1PR0301CA0018.eurprd03.prod.outlook.com
 (2603:10a6:3:76::28) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.215) by
 HE1PR0301CA0018.eurprd03.prod.outlook.com (2603:10a6:3:76::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.23 via Frontend Transport; Sat, 3 Jul 2021 13:50:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8280df42-9ff2-41fa-110d-08d93e2990d2
X-MS-TrafficTypeDiagnostic: AS8PR08MB6280:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB62803419148B516B69BD6E44C11E9@AS8PR08MB6280.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gq50C4YLCjq3fGWfEWY0BJb87ZMtt7V7YkWvEPLG5VM8eHjpPbuTGChv+gqHWfuPK6hUrjPByL5Hm1nF/Jyjk2gk25VylziQZIfdI2Xura4wCD2lUbrL6gR2xKKsIiT8HedeiP5/v+d0msQzQ8AMJvQlTjQ/Wf49ncIHMD+Mz2L0VB8de/XqzC7lipYPwEd4Zr1AaHx+aKDU5aHidh4Uw9rSwcITR9b+chReUavcwwwJXsPwSK2awMbXr2q1Dw5zRcmR0ByEjUkjq6gQQGPqqc3tLbkjUvj3gILoZT/MDLA4DGOI8fq1onPrUUSGq/9DXl0H2tc8aKRLkKUVwij2fb1jN7H9yKWiYF31HIhM0aPfncpW57VYT6ctjbuEvjZXRvSI6kdSvVbySs9eR4XazxiMsjJ67hOd4F56BEjkew32+Z7WNxC2qPuk7L3JOIiVZF1LimSjUzBc7LjsirvNTLIYzWDQCrDqLNtX4n5yamAR0EbNYYMi0gwmVD+M94kM3vTT0mpVH0gqIjHK2fb0OmQfZplVKI4uMHRFzKcbjhMrAQ5ODX35l32aYfg8zuKK+pXCbUu29o3To6UBKR2eculjAkVX4/d+7pQsGHTW/7h3+Zf0WXIGrRDLXTB/hFFoQsl+dw51wUvTpa0VShXMtRRp2GFeoH1XaGfB/K44TLnIUWA34BoxsmvXjevGSYA+GtnpH8pjb16hdrHhQQtlN47gJ/u/jZ4ZoKB+wBoWzKk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39840400004)(346002)(376002)(366004)(136003)(8936002)(956004)(1076003)(6916009)(6506007)(36756003)(8676002)(5660300002)(52116002)(6486002)(316002)(2616005)(16526019)(86362001)(66476007)(2906002)(26005)(478600001)(4326008)(186003)(6666004)(38100700002)(6512007)(66556008)(66946007)(38350700002)(83380400001)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Vvxen3cBY40DBUJ3XrJEkowj6YLYX/J6wPmGlHnfAPOu9ZvBhLZvbwGDqfO6?=
 =?us-ascii?Q?FN9ujZKyt8fAHzOOf6ZlEhIHc3Y4eFZb2ACh9OYdgTj0x72I+LDV8pgfA8lr?=
 =?us-ascii?Q?/C+Ds51GyzU6cBiyBmuEzwAeZrIdc8nPz9oe8DeTTGRQFEvi0IJ/THO4e56w?=
 =?us-ascii?Q?iIGZ/hOeoUR/yp0qo4IxVUQqEy0HhmKV2YD4UzfPMmGuga4ZGDC3B9WlIK5J?=
 =?us-ascii?Q?g+Nn101ZryfW8n1qsg0y9zyVkXEVEWIris1Mth7rwoXISZjJPlMWptTGyPJn?=
 =?us-ascii?Q?MlDcICjDtsyNCN8atWgCvlA0PkFGUYKaTVVfF7LZmu30eSewvNoGmHsVSIOh?=
 =?us-ascii?Q?uxDuOmc6AW5i7V5IWq/SjGCxnkxsXfrvefVXKL5y61zH9QFkeQlnqsY/zzi/?=
 =?us-ascii?Q?x9SjqSCDhoPAL5v3pz42ywoMBLxdrwmt1881GK6XjDFECVfpukOp63l+tDNr?=
 =?us-ascii?Q?04QrRjR5pP8Wi2/+3NENusiH5SlcalElBkswnfZ33xx1dk6v1f42VK6PT9aY?=
 =?us-ascii?Q?k1ntjetSJ+T+Z/I21oExZdk+XgmWFL+Au5awEAXoExwDsZ3PSTQCdgohhpYA?=
 =?us-ascii?Q?m3OzSrkxQh3jE+9jOPXhxvz3YfeM5u3+L4H+t+zB5m1XVXbBX5nxliHjWswT?=
 =?us-ascii?Q?tCZSC0d7syh79xhFe6KWCiUJm8s0bCbxDjua0/f3ObSgo4xsopUN21M8lkZ6?=
 =?us-ascii?Q?BpGCUmWvcTPsqGsnEQrA7aMxZiDMrMmEmETOJzCjlrqecMx0Y3oMmASTofoq?=
 =?us-ascii?Q?YWpGBAPEeqmYR6jPfDlZfTt/wQK+7jD/rG/T5/Znwk3xyHFHovdqAmCN6Aau?=
 =?us-ascii?Q?2plSnqOOUIq1O134jSwdOUlk75CmjW8P0nl3Jq2SC4LuroNOdM9tsibKCR1X?=
 =?us-ascii?Q?zrPv8KQgrCuPxcI2ts64vZrxA+zwfubfFSt30fwsDKCN7jimMN+TpEuzG1I2?=
 =?us-ascii?Q?LC5xUrd5Xris80O+HQ4vIX6fdy1wENCHg+9Qm4gIFUa3rGomcmgTkn14RZYN?=
 =?us-ascii?Q?RRGRNnoD65ViMluI9jeRl2VotOxQXR8SVmXBlSkr+MNGomVBObd5f3dCEY2V?=
 =?us-ascii?Q?ABfQSQ/XnurVcAPKPP0rOyWTPbXBM47+Nf16FTbmex+NX5hMlYdQMRuho0lu?=
 =?us-ascii?Q?yj1jJZ5pBNfaHj3P+eTSOc0nH+PtynKYQwPSxyPhzOBd3TMPmkgUkaOhGJkO?=
 =?us-ascii?Q?Pg0U9wV/mGJ8hW0SDlGme5YvjqPfEemuP6F0OBAaKyrdfzMeIPW+KdtC8v9t?=
 =?us-ascii?Q?+Opy5KHKJerZKYkxxdlfKlKaY7d0pPoGxZ4W1KKZctaBzN4zv6LixdauIAIm?=
 =?us-ascii?Q?Gn4RdXrG8PPFyRnusFOBrVmE?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8280df42-9ff2-41fa-110d-08d93e2990d2
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2021 13:50:49.6222 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tXD2nKYB+RXAMnONkuwbjqw9ItUFyU8C6u41GsIHrYS1X7RFh2oq+lpnzCfyqT5gTcxWln00qO/npUVrI+xj6PKb+AAFO8WaFUVMSpW2AJY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6280
Received-SPF: pass client-ip=40.107.21.137;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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

Let's document how we use file locks in file-posix driver, to allow
external programs to "communicate" in this way with Qemu.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---

v2: improve some descriptions
    add examples
    add notice about old bad POSIX file locks

 docs/system/qemu-block-drivers.rst.inc | 186 +++++++++++++++++++++++++
 1 file changed, 186 insertions(+)

diff --git a/docs/system/qemu-block-drivers.rst.inc b/docs/system/qemu-block-drivers.rst.inc
index 16225710eb..74fb71600d 100644
--- a/docs/system/qemu-block-drivers.rst.inc
+++ b/docs/system/qemu-block-drivers.rst.inc
@@ -909,3 +909,189 @@ some additional tasks, hooking io requests.
   .. option:: prealloc-size
 
     How much to preallocate (in bytes), default 128M.
+
+Image locking protocol
+~~~~~~~~~~~~~~~~~~~~~~
+
+QEMU holds rd locks and never rw locks. Instead, GETLK fcntl is used with F_WRLCK
+to handle permissions as described below.
+QEMU process may rd-lock the following bytes of the image with corresponding
+meaning:
+
+Permission bytes. If permission byte is rd-locked, it means that some process
+uses corresponding permission on that file.
+
+Byte    Operation
+100     read
+          Lock holder can read
+101     write
+          Lock holder can write
+102     write-unchanged
+          Lock holder can write same data if it sure, that this write doesn't
+          break concurrent readers. This is mostly used internally in Qemu
+          and it wouldn't be good idea to exploit it somehow.
+103     resize
+          Lock holder can resize the file. "write" permission is also required
+          for resizing, so lock byte 103 only if you also lock byte 101.
+104     graph-mod
+          Undefined. QEMU may sometimes locks this byte, but external programs
+          should not. QEMU will stop locking this byte in future
+
+Unshare bytes. If permission byte is rd-locked, it means that some process
+does not allow the others use corresponding options on that file.
+
+Byte    Operation
+200     read
+          Lock holder don't allow read operation to other processes.
+201     write
+          Lock holder don't allow write operation to other processes. This
+          still allows others to do write-uncahnged operations. Better not
+          exploit outside of Qemu.
+202     write-unchanged
+          Lock holder don't allow write-unchanged operation to other processes.
+203     resize
+          Lock holder don't allow resizing the file by other processes.
+204     graph-mod
+          Undefined. QEMU may sometimes locks this byte, but external programs
+          should not. QEMU will stop locking this byte in future
+
+Handling the permissions works as follows: assume we want to open the file to do
+some operations and in the same time want to disallow some operation to other
+processes. So, we want to lock some of the bytes described above. We operate as
+follows:
+
+1. rd-lock all needed bytes, both "permission" bytes and "unshare" bytes.
+
+2. For each "unshare" byte we rd-locked, do GETLK that "tries" to wr-lock
+corresponding "permission" byte. So, we check is there any other process that
+uses the permission we want to unshare. If it exists we fail.
+
+3. For each "permission" byte we rd-locked, do GETLK that "tries" to wr-lock
+corresponding "unshare" byte. So, we check is there any other process that
+unshares the permission we want to have. If it exists we fail.
+
+Important notice: Qemu may fallback to POSIX file locks only if OFD locks
+unavailable. Other programs should behave similarly: use POSIX file locks
+only if OFD locks unavailable and if you are OK with drawbacks of POSIX
+file locks (for example, they are lost on close() of any file descriptor
+for that file).
+
+Image locking examples
+~~~~~~~~~~~~~~~~~~~~~~
+
+Read-only, allow others to write
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+So, we want to read and don't care what other users do with the image. We only
+need to lock byte 100. Operation is as follows:
+
+1. rd-lock byte 100
+
+.. highlight:: c
+
+    struct flock fl = {
+        .l_whence = SEEK_SET,
+        .l_start  = 100,
+        .l_len    = 1,
+        .l_type   = F_RDLCK,
+    };
+    ret = fcntl(fd, F_OFD_SETLK, &fl);
+    if (ret == -1) {
+        /* Error */
+    }
+
+2. try wr-lock byte 200, to check that no one is against our read access
+
+.. highlight:: c
+
+    struct flock fl = {
+        .l_whence = SEEK_SET,
+        .l_start  = 200,
+        .l_len    = 1,
+        .l_type   = F_WRLCK,
+    };
+    ret = fcntl(fd, F_OFD_GETLK, &fl);
+    if (ret != -1 && fl.l_type == F_UNLCK) {
+        /*
+         * We are lucky, nobody against. So, now we have RO access
+         * that we want.
+         */
+    } else {
+        /* Error, or RO access is blocked by someone. We don't have access */
+    }
+
+3. Now we can operate read the data.
+
+4. When finished, release the lock:
+
+.. highlight:: c
+
+    struct flock fl = {
+        .l_whence = SEEK_SET,
+        .l_start  = 100,
+        .l_len    = 1,
+        .l_type   = F_UNLCK,
+    };
+    ret = fcntl(fd, F_OFD_SETLK, &fl);
+
+RW, allow others to read only
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+We want to read and write, and don't want others to modify the image.
+So, let's lock bytes 100, 101, 201. Operation is as follows:
+
+1. rd-lock bytes 100 (read), 101 (write), 201 (don't allow others to write)
+
+.. highlight:: c
+
+    for byte in (100, 101, 201) {
+        struct flock fl = {
+            .l_whence = SEEK_SET,
+            .l_start  = byte,
+            .l_len    = 1,
+            .l_type   = F_RDLCK,
+        };
+        ret = fcntl(fd, F_OFD_SETLK, &fl);
+        if (ret == -1) {
+            /* Error */
+        }
+    }
+
+2. try wr-lock bytes 200 (to check that no one is against our read access),
+   201 (no one against our write access), 101 (there are no writers currently)
+
+.. highlight:: c
+
+    for byte in (200, 201, 101) {
+        struct flock fl = {
+            .l_whence = SEEK_SET,
+            .l_start  = byte,
+            .l_len    = 1,
+            .l_type   = F_WRLCK,
+        };
+        ret = fcntl(fd, F_OFD_GETLK, &fl);
+        if (ret != -1 && fl.l_type == F_UNLCK) {
+            /* We are lucky, nobody against. */
+        } else {
+            /*
+             * Error, or feature we want is blocked by someone.
+             * We don't have access.
+             */
+        }
+    }
+
+3. Now we can read and write.
+
+4. When finished, release locks:
+
+.. highlight:: c
+
+    for byte in (100, 101, 201) {
+        struct flock fl = {
+            .l_whence = SEEK_SET,
+            .l_start  = byte,
+            .l_len    = 1,
+            .l_type   = F_UNLCK,
+        };
+        fcntl(fd, F_OFD_SETLK, &fl);
+    }
-- 
2.29.2


