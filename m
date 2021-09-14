Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA31340ABCE
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 12:37:00 +0200 (CEST)
Received: from localhost ([::1]:45638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ5oB-0005ph-Fz
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 06:36:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mQ5dz-0004ou-PL; Tue, 14 Sep 2021 06:26:27 -0400
Received: from mail-db8eur05on2115.outbound.protection.outlook.com
 ([40.107.20.115]:20224 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mQ5dx-0003Ok-SE; Tue, 14 Sep 2021 06:26:27 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WyRrgV4XBTFlJ55DJj7tm87+UdZbNVqqfU3Pt5kgFS+3CGJuK7LL/l+78H3MGBpmEdQXfh9zB0G6p9O0dJx2bbFCcnNcItxXpptbCE877txGgGG7hJujOR713zCb0MDJgwfDLsV/fZxCPFtDIVBvfGG7CgFyoQlFDzR/+ciJMm1uJUH0r4lY8FTI1+n7/icv5zw+n13q+g7gg/91dFthTpOFsSaetPV8cCUOiagaE/+7eS0SqJ/4PjvkY8Xt0ahTOYQhqfjGd3JeRWZznyN0prextEN5rTjMVJdNf3+qX7qxFhTRhyxCloH8vc48SInNuMUcO6c3kLK9mUGCEgdZBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=jG2ggPQVmfAAMk4zmRJKA5ti4bwdu8H5a2BGZYFPCiQ=;
 b=n+/sLm+w8kTbQWe9l0QWaDhMQwcxihkSbxR7LA7mjitV35Jmjl3ZaGClBo2Ta88kRwdfcm0n+Z1kp4h0DLQEr5JG3jzBCRxPoiKLgXdCMTbIcyjgKwFLUb1E7t0URdSHns0Dp6xyeXH6mJU9e0lfoFLN+ql19sPvMDzZy7CEFOkr2Bk6My7UWOETqhoOW1Lo7v2QPD4EaaodrR/i12UidWfh4QEL5aV4LUNVZuU3VC0zMN81jn+0CJCqexZVW9kqJ+Au4HFICMhiLD0fpqGDXj9G5wrQREV5f+Qp7Ly7JywMdP5EPYCdIDpiZ5qol+z5f8L/jEeFw1RmQTqI+eZ3gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jG2ggPQVmfAAMk4zmRJKA5ti4bwdu8H5a2BGZYFPCiQ=;
 b=bGY5WGFJPVJzLftm3YOhgYc6OWHpXvDRB5kWB/Koj4+PofprL3AzqAami2edYhx3F8bCkABiAQAv8/dZ65eQWFUS+yHFtMts3zaEg+wbhrG/2J89AFg10UfweKgRJtAcQL5Gy6AeUMQaLBRecpluQUS8vt6JIhdTv6wRPuXil+8=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6071.eurprd08.prod.outlook.com (2603:10a6:20b:29f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Tue, 14 Sep
 2021 10:26:16 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4500.019; Tue, 14 Sep 2021
 10:26:16 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, Max Reitz <mreitz@redhat.com>
Subject: [PATCH v3 09/17] iotest 302: use img_info_log() helper
Date: Tue, 14 Sep 2021 13:25:39 +0300
Message-Id: <20210914102547.83963-10-vsementsov@virtuozzo.com>
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
 15.20.4523.14 via Frontend Transport; Tue, 14 Sep 2021 10:26:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1b41318f-963c-4f15-93d3-08d9776a1583
X-MS-TrafficTypeDiagnostic: AS8PR08MB6071:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6071B68D2C63D477CB98CFC1C1DA9@AS8PR08MB6071.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vD7RSstkpvQYeldwM9Rbc6E2GvFhJW/Un51iGnzJuhTfHp33qASLoWNYn4Xg+aN2tTSuFjcoj4JcuT9xwwa5OLV9eNxzOh1ABVTP67cmCpxgpoE2Twbf42rDTri+2ytTeeL+aSO9ImXxbHRv7if8/JGr+Eibt+piLLwXhMjJUs9DzDup505GjeC0IafoIH8g4dqNPdxc9hQJtMARQWTkEeXbt97hM70j6YIKp26cCVgBSR+FSmfKJAhW5RjVncUKuat5SY0ORI6zVONzVqd1BLFSJvCx3iCn0EuHf3HIFjHk33kgtrHcKwq/V5UGBfNYtpWnx9F7KZQSGm0MefocoDvch4iJmJ2NbFAhBsE8w9EBkgFTgS7Wsf96825TrWtz9/6oF8KXrPF4coKFSiN3IvjkfNTfOtAPdYCzE8SZkbZ2uSm0jxJNMfn8MSmgX1r2E70X1N26x2laOGC6kcjHearX2JXo9C57EepJcBVJHVgNUnBvIq9VFZolRlobUvgR6naIClHKcB0eCUg+N2rNYwX8KunXTfSsUMWgBrbzDGRlYvR8uXDWjjoUD18BjeHS/3pnLRW0/tDVXedufxryB9/elQotSr3c0pbWNvK+Pb1jVhsXz8eTQ0fXRwT/kOnOKDQoB1PBjTChKrari0PQLwgdGlJBViGYmqJM/ZIPJ9cCfFhS97xfziBe7gQDaaujebEr+wfJrEnR7ZAmbY0sUg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(39840400004)(366004)(136003)(396003)(6486002)(26005)(86362001)(2906002)(6666004)(38350700002)(66476007)(38100700002)(66946007)(478600001)(8676002)(36756003)(956004)(66556008)(1076003)(186003)(6506007)(6512007)(6916009)(83380400001)(5660300002)(2616005)(8936002)(4326008)(316002)(52116002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?95n7jOvVVy3E8cbTIogcBRm//jYP6q6jVL2mYxSlmUW89ZjeE/8HMF3w2l9E?=
 =?us-ascii?Q?xZp2FPwR0cUS6lJw/+tpfQMZzCcc5/gtHUewbL17p2P6coFxYpzBQZstg+qi?=
 =?us-ascii?Q?iD2tbypaxOcgaTRotM1qckHNEWCfUI0tzlViUXUBJBf6hj3NFlgB+Km7XCqB?=
 =?us-ascii?Q?dkF/rEO4gky/U+boQTto8lkjAXQAi3o70IRjLHn8jGzmxwHNwCaQDXqhxqBF?=
 =?us-ascii?Q?/63iIXoO3Okufc781o2liuI2wZDA5Z82JST538xwLiJivzNANQWr8C8JHs19?=
 =?us-ascii?Q?ReDrjFT+/rr7FKUIGg6tZQYkoz/1+sMctaCJBWoaWkc3q/8WNXrnrL0igbuk?=
 =?us-ascii?Q?0YnVwkP0zAyBeRQHmoV/twN+y2oyYa53hFVOM0H7fcMVYbKOhA8JCguWQ8Kf?=
 =?us-ascii?Q?Cb9V2CNTqLkv1l52G+jfJrNs4rXorHCHdfy/wlR6h8wgdKjec1z2IrHtOS3o?=
 =?us-ascii?Q?gBhNg/SQDr7HhWX2uN/TuptZul60Id6+HhorAJJ485r78qPe6qVUNS+UYHEW?=
 =?us-ascii?Q?/UQ2n2LHzATitcpXJU6QufFECH1R5/LdiHQJ4tsUQS9E3Fhpu7xSAsmVPrPv?=
 =?us-ascii?Q?HsvBRX0qP13athuzIrWgsQCBkgDOFDI2PZ8LK0xnwN7zOM4wKOwIfmfBNAu/?=
 =?us-ascii?Q?6aHtnAXnInde8o+bEBbSO0g6jv8KGNCzguIjOB3Xp8N8FNpMQWg8ykndmCDc?=
 =?us-ascii?Q?Q3ED9JILcVGL++oXdWUd8OGZVbxyk+ZGeAiYPpfl5LD578A4we2wfyXeRJe7?=
 =?us-ascii?Q?haxDUF4HEJWgLLrOPK9ifSeruXc2vy90xhmWRMAL/4kzKYMYVUC0KULI3LEP?=
 =?us-ascii?Q?KNPKFuh53L+7Q7GthcAYxbA0B5fBvUFtGct0Wx1UF4XbsDQB3zjqiTgaa4mp?=
 =?us-ascii?Q?FBVCKbDUQez2pRHPJHl2INuFheK3wvz4J9c4V6ZT5ITuT1TEcjeFORWIg8PO?=
 =?us-ascii?Q?XuNdmyg/VeuYGvYVuQFstsZc6oupfrhOGMHFdYJpqxr1IOIQ/d9Spxcaawhl?=
 =?us-ascii?Q?Du4em/Ij9xanoawDKLbzCcF9HQRRTQY3O3LPAn5Dj32A1TmgwTH1yk49U5Cc?=
 =?us-ascii?Q?yqDvtmwXCtc/nhc5F8bI7ozabNR49y4sVX6GJhylDX8tfsIASaBJ2XNf6Ve9?=
 =?us-ascii?Q?XECoImU7eFuq7qSjwKaNQ/029aNlPVJu6YQ0LNHPIMFlvoM5lxzmvXySab8v?=
 =?us-ascii?Q?88cE0kBuVPweWBmIW1PuVqwJUab34fsUeYxey650fnFIdPw8JKWuOmu065k0?=
 =?us-ascii?Q?kxVvVavId8Vl8USznG0KI5EaBp1mGnqOfWWMDL/LkjLwTeWq8zQM3bWcJe5m?=
 =?us-ascii?Q?kjITgx73rGjbu2NxXnSXas3j?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b41318f-963c-4f15-93d3-08d9776a1583
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2021 10:26:16.2332 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +VEVQIMHkYz7PwwxeG83wIt9lxzVwDF6UKBct65uk2C7VlNYjP1xFL5KU+SbOL1OxuXNueRcjb1nvCnvFn1rREYEL6ZqaICom6F5Ku2xVDA=
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

Instead of qemu_img_log("info", ..) use generic helper img_info_log().

img_info_log() has smarter logic. For example it use filter_img_info()
to filter output, which in turns filter a compression type. So it will
help us in future when we implement a possibility to use zstd
compression by default (with help of some runtime config file or maybe
build option). For now to test you should recompile qemu with a small
addition into block/qcow2.c before
"if (qcow2_opts->has_compression_type":

    if (!qcow2_opts->has_compression_type && version >= 3) {
        qcow2_opts->has_compression_type = true;
        qcow2_opts->compression_type = QCOW2_COMPRESSION_TYPE_ZSTD;
    }

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/302     | 4 +++-
 tests/qemu-iotests/302.out | 7 +++----
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/tests/qemu-iotests/302 b/tests/qemu-iotests/302
index 5695af4914..a6d79e727b 100755
--- a/tests/qemu-iotests/302
+++ b/tests/qemu-iotests/302
@@ -34,6 +34,7 @@ from iotests import (
     qemu_img_measure,
     qemu_io,
     qemu_nbd_popen,
+    img_info_log,
 )
 
 iotests.script_initialize(supported_fmts=["qcow2"])
@@ -88,6 +89,7 @@ with tarfile.open(tar_file, "w") as tar:
             tar_file):
 
         iotests.log("=== Target image info ===")
+        # Not img_info_log as it enforces imgfmt, but now we print info on raw
         qemu_img_log("info", nbd_uri)
 
         qemu_img(
@@ -99,7 +101,7 @@ with tarfile.open(tar_file, "w") as tar:
             nbd_uri)
 
         iotests.log("=== Converted image info ===")
-        qemu_img_log("info", nbd_uri)
+        img_info_log(nbd_uri)
 
         iotests.log("=== Converted image check ===")
         qemu_img_log("check", nbd_uri)
diff --git a/tests/qemu-iotests/302.out b/tests/qemu-iotests/302.out
index e2f6077e83..3e7c281b91 100644
--- a/tests/qemu-iotests/302.out
+++ b/tests/qemu-iotests/302.out
@@ -6,14 +6,13 @@ virtual size: 448 KiB (458752 bytes)
 disk size: unavailable
 
 === Converted image info ===
-image: nbd+unix:///exp?socket=SOCK_DIR/PID-nbd-sock
-file format: qcow2
+image: TEST_IMG
+file format: IMGFMT
 virtual size: 1 GiB (1073741824 bytes)
-disk size: unavailable
 cluster_size: 65536
 Format specific information:
     compat: 1.1
-    compression type: zlib
+    compression type: COMPRESSION_TYPE
     lazy refcounts: false
     refcount bits: 16
     corrupt: false
-- 
2.29.2


