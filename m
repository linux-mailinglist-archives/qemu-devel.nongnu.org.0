Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9693CF936
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 13:54:03 +0200 (CEST)
Received: from localhost ([::1]:51714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5oK2-0004qu-J6
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 07:54:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m5o5y-0003PW-K0; Tue, 20 Jul 2021 07:39:30 -0400
Received: from mail-db8eur05on2136.outbound.protection.outlook.com
 ([40.107.20.136]:65205 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m5o5s-00077C-Lw; Tue, 20 Jul 2021 07:39:27 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I5BJ7zdt1bB0GyvvTmlXmSlUbrWr3D6bPnlteLkqk8/DZ6u5I108EsU9jhfqN8e4r6ew3mtvvsCmMVD2JPH0s3cLUeEIqw+vw347M488vgLl/nFQYA0jXBggCKyaHr0Km6JHKpx/LwM94ttlnmT9epOuJ3lJjXxcAhMDJSRUNKeTdJwneJmBqwej0wR7Sa1T5y7bFPeM7a/x6vsQ8+8buJ0dxJSlecdx3UQedoRrhfPuUt93ZnPQHjaQaM/9t5sTyMUD2pk4yDoB37CpiTh2ByeMa7EUVHRZJ8/b6KeU9dkk7h2nFswppOB3yq2Wj1/UNaJK8DRKgyju84LTG9UOeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jG2ggPQVmfAAMk4zmRJKA5ti4bwdu8H5a2BGZYFPCiQ=;
 b=OjHAS4OT1BZZiECerML/x915ufWodk6YxeKn8i6VTZJZgpD63uLW9khHKt1d2pFFzcG787HWpfzx0JMDPtk4gj6MRYiYgHn0U9vGRsZ3wbruw86hyvkDnJXLgs0Qh9/K5Ffcunsd+hW2MFpkKFU9McWEUJUHL7zQ2NlJ/hiPh+jkps7blde6TEKsOUHlFqOvFh4p3AxN0gpDIU+CrImaJH087FusIg+fKOqec7JwQw9b7YgV6jnCbFICBtwWhZM7FEmXmmwGcmOzT0ZEVKfX1wiSGbksnWr66fMqG2SYvTcFlKtxFVo8DAwCwwGckQdWU116wUV7LNUhjQ7oZtNeZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jG2ggPQVmfAAMk4zmRJKA5ti4bwdu8H5a2BGZYFPCiQ=;
 b=lei8MCRbUZxb81o0e+lmQkxb3KvReJ3DevSm4MfnMDOt8VkM6iENhq9GZPOhiSZRbKlDzhIXvPAEXydqj5517u+Hx7bhKBZiiJUP7zQgk0PjcF8eKQgWqINKjiCJ2MUShopHYXaaq2ax4wclqKKL9sTJdc8JtMJScEJazVp4L6M=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6119.eurprd08.prod.outlook.com (2603:10a6:20b:290::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.26; Tue, 20 Jul
 2021 11:39:03 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%6]) with mapi id 15.20.4331.034; Tue, 20 Jul 2021
 11:39:03 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com, den@openvz.org,
 jsnow@redhat.com, vsementsov@virtuozzo.com
Subject: [PATCH v2 09/17] iotest 302: use img_info_log() helper
Date: Tue, 20 Jul 2021 14:38:24 +0300
Message-Id: <20210720113832.586428-10-vsementsov@virtuozzo.com>
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
 15.20.4331.25 via Frontend Transport; Tue, 20 Jul 2021 11:39:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6347ba96-e2a5-4cd0-8f75-08d94b72f97b
X-MS-TrafficTypeDiagnostic: AS8PR08MB6119:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6119DB12A18834236881D322C1E29@AS8PR08MB6119.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6xKFak7xAtE4yaIh4iergDELkQLuuuAD9FL489rc/XPAHS0leXBV9ycYKSivY1ELrkEWLeCouDIX1/Zs/XFYhUUEdx4NnP113TDHehCjZt2DNH3t11/LgSlmkQjAh05CbONaH9LJnO8m+dHQMscBRD3Gs/tzbFW3l+0EMbp5lGxlI0vXmxEutVYByEk9vO/fncecoickSFqORButqzhEwBlMmjuRyzQhdrD1oqxvfpd42vdyPRzkahFy8jiOYx9Ib+PuQulMjllW5gaA5sHcgq4eq0zWt5wDvrWFAZp7jsK/Qgee0GK3itP5lmoM+wG7dw1F4HsaxbalobvVoAITmJEv5OOQ8avOJUzEx/JIzjC59koEMrp7FUDLBlaxLoVOThWSs1YkayJqXa0lnDhcZpAXeiXaM/ANaSD89VoUQXAsqlEj+wQLhk8XqyWTEo/5GK3czJUu1TzUMMFYXp+uMhpqi5S0DMkrpA2XLZgPtdlAaorv4GYC+f/HsXTe9eSDA4iiPuDJKKPcPBxieADvWBq2Uoq6jxnBiSBv1OJvZeD+Kngd0YVpDW0plhP7OOZ5fdIuSZw+UWCJ7cEl9REinbJr9IRZpTkbBf99lt3U/q92ui7T9tx3lRelD1d7akjh3FrrD6+NELXl/9kGZx1RKkNLXt6y4eRzfaxPOe8IgNQO5+pG3g64eyGAMAsd2EHiF4TkFJ0P+Br0gsh8hQkV0w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39840400004)(346002)(396003)(366004)(376002)(186003)(1076003)(478600001)(5660300002)(6512007)(6486002)(2906002)(83380400001)(316002)(956004)(2616005)(86362001)(107886003)(4326008)(8676002)(6506007)(6916009)(8936002)(26005)(38100700002)(66556008)(38350700002)(6666004)(66476007)(36756003)(52116002)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Orey2h7gUfjLTq08GNJFMXEfRfnr86XXCsBJMICNNCBKBL1mckNvoqaPoEuL?=
 =?us-ascii?Q?1FaoU0gJTCi5rcoZncGbGyW7/NPxsFg/1waYplw7H8L2VKDkwY482qK3w6Jt?=
 =?us-ascii?Q?ZrhwvS79tDsiQHDm/8ipSvn9D6VrnFmDCT12m2A/wqoyIGszNgxoOspRjT/S?=
 =?us-ascii?Q?v1GmVEH5ew3WJgUL/ik9LTVZ63U3h+L8i5iER9HBwETE72AwlVfWHEKCTjmM?=
 =?us-ascii?Q?PcRFuejKRvPKIC3e9bywIXfhDZm/3Ie08hdELjTQIoKKJ00C3wD1P070YCQc?=
 =?us-ascii?Q?8AMT7MxwpXOVrV+dvsgfWDa0hE5BblInVEIljuwe9JnNCKyqALugqT0wUAij?=
 =?us-ascii?Q?kN6Q+aFPGiMVO8dj4v24dAXEWLUWRn3dBnZxECoaI19xO1veUTaT3J1EIslm?=
 =?us-ascii?Q?W+RCaYj/jn+93bIXUUxsDFuFahKsa4bGKP34fM0HIqIQxakgYzPogMuxAk0v?=
 =?us-ascii?Q?4jR0ZAYf/PIKMk6MqsS3aTRy0DD7hYi/ITm7CgK2yZVJlpcgmf6P78TGp2pP?=
 =?us-ascii?Q?wCr792tf/6KKkcrmJLW8LtFmfGcNri1YzKKAM7cUO3yD6YFprZiGhL9VAfny?=
 =?us-ascii?Q?mm7jjEh0u9GPS6su/y3ev5TZxdeRv69iAXzf/K3x8t1WFrqiVMAukrSRfiEs?=
 =?us-ascii?Q?yU6jHvnfVAk6Pl7bIZ58rZvTg9iNFRgcHu1iESwTkVK2zVrX3UCnm5PIhbAr?=
 =?us-ascii?Q?SVhrZs1tjuyFFUB+m3QfhX0C1TWtVAT0iW1pRlEG5r+y99PEt0Q6rHm9tRne?=
 =?us-ascii?Q?73A1qqwSngz5bm8rqbOT7EchKlP+zCKBnqZqTTYH1KF6WbuqlAdJ5qtmnVGN?=
 =?us-ascii?Q?iN+iwn8WGgBI5IVN6rY5r3mD2ckstqmW3vpwXwMcK4GFlNa7jvti76Chm7Hl?=
 =?us-ascii?Q?SEOZkVDZLb66iVSlwZDtBlr/Zm6m0pEuDXA2kywxB3fH+w1RUh/susP5Z9Jx?=
 =?us-ascii?Q?9C0I/xBHMV4zp2dP2rifngXQ2Ohi2JizUyDMRzgjG1wljnNWMcvlR6iOv8RD?=
 =?us-ascii?Q?QJO5M9khBHeDuLtr8hm4srteMQnhBeDhpteC+vytcoRxgx92hOJqH+T4Ow+P?=
 =?us-ascii?Q?i0e5vFj78JdgPfEUdnrxR8YKfiYOQBxRhLYOnCXyWJ8luWKNVEVPGatpgLu+?=
 =?us-ascii?Q?dtMcGnHt2EExYtcypf6xRvIrQak2DNUPlpBbtgweHOKrZeMvHlw4erkqsAjZ?=
 =?us-ascii?Q?2/4mXxP7/zpKgAjNK/lPf8V6WNmBhdVUYY1RchD7QkgufK5in2F4srRJRPoF?=
 =?us-ascii?Q?Pr4SI1AqyjmgiIYoNAnT/tFD29ZCzcHfulOQHjExxEdd7oB7MF0n07f8sStS?=
 =?us-ascii?Q?m2OVOFelO6OoW9c3kZcIqERg?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6347ba96-e2a5-4cd0-8f75-08d94b72f97b
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2021 11:39:03.5566 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uZhQnXOlBJ8Xd13xM1Y6JxDFhNwWUmusIS9YkANW4fupEZ4lIhVhFW18A+eehqOWVzcT3bWvEh5QdKgKuh7br34M6CQC0tFAU0+8zelDiVw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6119
Received-SPF: pass client-ip=40.107.20.136;
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


