Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0966B630DDC
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Nov 2022 10:38:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1owKHj-0000PL-K5; Sat, 19 Nov 2022 04:37:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1owKHS-0000Gq-Go
 for qemu-devel@nongnu.org; Sat, 19 Nov 2022 04:37:04 -0500
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manish.mishra@nutanix.com>)
 id 1owKHO-0007AN-Kx
 for qemu-devel@nongnu.org; Sat, 19 Nov 2022 04:36:57 -0500
Received: from pps.filterd (m0127840.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AJ9Gd3i011879; Sat, 19 Nov 2022 01:36:51 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=proofpoint20171006; bh=6CuVDQ1+saTVSzAH3SlPIZ6Y/EZOhdGH4CSk2dsCR/k=;
 b=GH1WB2R2a2reC7EaVbZZS8rbi3rCL3yKZWWtlQ4BYS8iID8kifbZZYAKLDS0PEMd6IVN
 Z5dR8rpLuMkZxee2Mv0coCKj23X6MVQ/hpf/T7WsLPtQZ7AZMZlkZmQYSTwm0WzrVgyq
 TmuqPSOP6CjYf8M8LZVifRtX6B9yvjRbIC+J5mosPGZJAQYRk6SQEhsfootQk3G1uEC2
 w/H25LWb79CbpKVqJIQ+E0d7qR+gT1ON5FQ42XxKfkxAWjJT4fWd41AijT+5SLIqmhUi
 Hy3gVwXqFusVtuqbIL2PO1ZK6TUA/iHcR+jOltA8ECq1ndtLM6neIQ9TvgJT8Z0V+QGd gQ== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2176.outbound.protection.outlook.com [104.47.55.176])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3kxvbxg0qy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 19 Nov 2022 01:36:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fD49dxPaaZYFBBCCf9rrJUrs95DabN7/nV00iHM0FbGrBdc63ykbIvj+YFsyckQghFIPE94tbWpIeJlIKjoyXS6TX2KA7Qs5YWZPlYo2SMX3Q0BaYAg+MT+//Ph55OimGjP3ffhrhWAMZJDQAg0OkFJSLAc6Fw+CXFMV8mJ1oybUcAU6Ni8nztg2aE4WYUZ6ENgVGBREJuPRVtW6M4JaF8+jXg6aGsmSdihj9coRGCqFtutNaogW0WXhTXxdp/taALjaWbdLAJ9yva59rFlnaPK8qQreQ2DIna3F/Oftr0WxywyZVzAMnYGXSkInv3c5Cz8O+/+ZEvMwdnSsjCSiow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6CuVDQ1+saTVSzAH3SlPIZ6Y/EZOhdGH4CSk2dsCR/k=;
 b=TdUUDYa3l6MEQN/++IZocGz62CoIh2nfykiwfCm0RhYefXo5w8GXsFJ2WK4RvnIKKHmv7H1iFc+0nHews6CGar5Ym1NRXy4E4h9FNLeoCh/J5fnhobIFRakNB+hjX5em50xkAgXJM0Me4zS9MPN/y1du2Y+5/y+3miUpXRqVhcamVasEAfQIZtET9cb4iHURWxK1Ljw4hsjbJz+UaVOTPUHfH8Mr/mnCvBcWzKZORvWQclDuEWxVIqGcRYogNDfn1PHPAlTmMfBE5rq4HWCu4hC6O3NWP3BnnYpLcC2UgoS3v3I9Kplqblm6RsRDL+FGno+9da9xMmSuCW8h6aBCyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6CuVDQ1+saTVSzAH3SlPIZ6Y/EZOhdGH4CSk2dsCR/k=;
 b=FYJXHirutbu3zbAPp6AeDXAmEGbbGmlDXliPlArPx3NVccjrl/GOq26wkk7g2yOkxC6ayTUvYL1L0ncJ5wKnfLjF0pPeSJ9tmispnxXqCfgzTVlQLnFQNE+B7FI4LcMNeZL22NoKWSgymn4t8RfqKDcQjmtr1oRsPlMtn4z+WLvxaX2jI3fXAqBwDxjMApJlRFdL9k15qNOfu2uBEa8a7uZYUUsqQJgCtv+7urgYdcgfgnRCx83qLwJYRQZxhKUEFLr1c1UKn1ws79Mao8b9PN72is3yxGb+4cBHa04U24Xc3SgpPTWDDKOS+QCt6I9wjXofM+sOemL2l+qZBm5cmw==
Received: from PH0PR02MB7384.namprd02.prod.outlook.com (2603:10b6:510:12::12)
 by PH0PR02MB7479.namprd02.prod.outlook.com (2603:10b6:510:a::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9; Sat, 19 Nov
 2022 09:36:49 +0000
Received: from PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::dff2:2d3c:e182:fb66]) by PH0PR02MB7384.namprd02.prod.outlook.com
 ([fe80::dff2:2d3c:e182:fb66%3]) with mapi id 15.20.5834.009; Sat, 19 Nov 2022
 09:36:49 +0000
From: "manish.mishra" <manish.mishra@nutanix.com>
To: qemu-devel@nongnu.org
Cc: berrange@redhat.com, peterx@redhat.com, prerna.saxena@nutanix.com,
 quintela@redhat.com, dgilbert@redhat.com, lsoaresp@redhat.com,
 "manish.mishra" <manish.mishra@nutanix.com>
Subject: [PATCH 2/2] migration: check magic value for deciding the mapping of
 channels
Date: Sat, 19 Nov 2022 09:36:12 +0000
Message-Id: <20221119093615.158072-2-manish.mishra@nutanix.com>
X-Mailer: git-send-email 2.22.3
In-Reply-To: <20221119093615.158072-1-manish.mishra@nutanix.com>
References: <20221119093615.158072-1-manish.mishra@nutanix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR01CA0058.prod.exchangelabs.com (2603:10b6:a03:94::35)
 To PH0PR02MB7384.namprd02.prod.outlook.com
 (2603:10b6:510:12::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR02MB7384:EE_|PH0PR02MB7479:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b1e181c-531a-46ef-0081-08daca119537
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qRqmgvg+U9OIsCJUNa7vYbJV0pabA7rCJlSlq8FKKbytYL0AspeOQaNYL1FsfQiqSt616YrJ7eE13I55HLV036JwTR5xg5ZZd9tWehnkxhLxEM5/1+gYUn7cXd8YZ7s2H5wof3Y11GX7D3WyvInr4rO7c00OXv79WPRDv6PQogoTVWtMwdpuG/GBUX0YEd6qayRvkcLXypb5M70Nde0zAOOLDjjQ3ZJ/DpPrILbto9xX0/xoYMBXu6LLDd+5Eju3Nentr9E4GaCPb6SlCLnlQ/fdxXvDMjel5GFFeX8Vn96s9u28KWEcQfk7Qx2PyowadvZyPdMyF53J0EURzzu2IIX0ESSiS/str2A+Cc1jIzgmV4JbIvp2l7+wU+4DVtUNYLFrYIxOcbfNDGw4InZwL7Z97hk6aRsTgxC9yL5A0MzzgwRwM003tsyY8RGGslCa9rFBqAMRk1/8ASbpA49Z5NPBUxxWGnTdnKIZySf5Fwx5sZiMp9OMJGIPJjCrntNsmN0oFufQbiCV4Is/ycmE4PtiZJketPmBXDrU6yALc1VAfCmYFfEwxrPgLIT2qaGPTQCU6hnDqZv5EU2mwcYSurwVjBTUH9k2M+iB9GDapDIXD4yITq7sZrSJLUy6I/cAwvYNfKEZE2LAGH3cm4zpIgY3jCXojO14K3vGB5MwfWo4XAVShEZ/aP4hMKOX0WRKe+2glY8Qrr/Q2KNVVQnaMg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR02MB7384.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(396003)(366004)(346002)(136003)(376002)(451199015)(478600001)(6512007)(6506007)(6666004)(6486002)(52116002)(107886003)(86362001)(316002)(6916009)(38350700002)(38100700002)(66476007)(66556008)(66946007)(4326008)(8676002)(36756003)(26005)(2906002)(41300700001)(83380400001)(186003)(8936002)(1076003)(5660300002)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XVnCD6hhAK6dvQCPeZeltUlRuxRpy8jTymEmnLwe9AjHvZ+/YH1munI+CZ4i?=
 =?us-ascii?Q?gdXcay025yHjqwl+wR3lUyA19v4tTNKPpNKLwAEsFuo8U/SFu2xTSXC/xRPJ?=
 =?us-ascii?Q?foL/PVveW+Vt8GdYgoPlMNdM2lFcXPSSOy2CTIBL6XfE8F/E9junWEh5AKV1?=
 =?us-ascii?Q?OkU8CDyWPjZ7c62Ua7KtryrukaSBu6nKokhpdVH0bXCZ/nUq6J2cJ/f5i6Pk?=
 =?us-ascii?Q?S+gaRtz1dxf1s8gMCZJmtl86bEuFd5hoeopWJfZN8AF8fonu9TEfiq44STrN?=
 =?us-ascii?Q?48HmevcPwRrAmJ/ktHZopAVOEMBc3uXFmjZM04fGIWdIj5U1ny/GyUiFOuQM?=
 =?us-ascii?Q?SjZmzc2IteVZ2ksfCJv9NVsUltLV1tDcQSHO7Ivrkj6/rKwC3qJYzTc/Vw8R?=
 =?us-ascii?Q?AspgoC6Jw9hEumql/PmDt55nmXzqOPGWrwFPxS+huy3Jc9y9HejgL/fEndaF?=
 =?us-ascii?Q?vASJ+tSqzxR7Os8A2lKOeFB+2ob+LNuI3HbSQoGUicOaHSZpAFvTl3EOOJvb?=
 =?us-ascii?Q?8a2t1KuOlbJDDA3uiaECkk89RIQc0fPzvaA6X/sXaOn9CXE85NuMvvKnfsl2?=
 =?us-ascii?Q?KsU1qKVMGuoKeZLL/M/0PdKL4mCO6nK3kp+p14L3NvOtupy1h73p0KUZQFMN?=
 =?us-ascii?Q?b1Ges7sGxMj0jaYkH6/O8PbH2pau6I/dTz8SkZ2poF/HZZF6ICLJ8tPxkN2m?=
 =?us-ascii?Q?UKj8EhB6vhKd1KFgWC3nLi69ZXUmALwATi+F5HAthwl0Wz3KMUD2kvu6Fx5q?=
 =?us-ascii?Q?v3zWRDQ/2is39oVdmz4cFW/xmVfh4c17v2CTVRnvD+xPqr33V5hJd25M5Nsb?=
 =?us-ascii?Q?FrNdatBBpGPDzXYNyhucdNT1pQNl4wH8ACuSjadIicxdvJrdjCss7kfGDZGl?=
 =?us-ascii?Q?nAu6aZM8MOBMWM1jMzwYRp78MmXbI+Gdz3BJudI1MJeYNU5EEP3McH6XhBee?=
 =?us-ascii?Q?32kO5NCgLec4mQ10IZveuaxOfHL+qFg8ZzPQZpb2NWMbssjRKRUPB2hXe7ED?=
 =?us-ascii?Q?Um35Hl2rchg1AMFvWO+Rn/xcw34OmgJGRPFSGd22XzD8Gz9VgiOums/FKc+D?=
 =?us-ascii?Q?vcJRo57JM3XgoBXzHXvfmW3qk7UHHGemMjPzC02eFILq3mG3jYMmW6A9OfbD?=
 =?us-ascii?Q?SA70hQQMHWKum2Ta7XpFuRULloRgqyeDvPz9cG+Fv6INVf2D7xNy/phNnTvY?=
 =?us-ascii?Q?p3N2oZVGq2OLBkbB/Yy8MF+ffy89oS7iLuXwtD/MkkgLS0b5m7KhksICgjBl?=
 =?us-ascii?Q?lZPo8NWTWxT0QkxiI4Vz2IBWsnfL9c16Z2HfAOnns9B+LygEPkq5T84KNlzn?=
 =?us-ascii?Q?fEGxjDKRqRirnmBfIUsH0PqxkuEAR/OnCbNdazJcDklUkRCe0DM9Bgx+5fkc?=
 =?us-ascii?Q?fm6X+dP/FA7U4UXNUQhsZY7nrN3PWFainiRaSC/sfmckUr3Kcap50dQSJzqn?=
 =?us-ascii?Q?V6fzzUoFo53/qXTVIigqAKL8bK61yUM33pdUoaB86SD1LxiseFrZzYb5xlse?=
 =?us-ascii?Q?oek8jW8FopNUgSJr9/Q3Q1dXhU3MoFjtq+XaXj/9T8Za/g5P4hGAPz8wGOFe?=
 =?us-ascii?Q?aLbF7+oXx8Io0Wo/Ql7Xdz39kgf8QHPvil4uzx7J59Mq9JYJWA7PCNjTHWRA?=
 =?us-ascii?Q?7w=3D=3D?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b1e181c-531a-46ef-0081-08daca119537
X-MS-Exchange-CrossTenant-AuthSource: PH0PR02MB7384.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2022 09:36:49.4416 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hVI1nHxu5lgskiVBH/nnf0T2xqOw4hSCxB9N8NH3xxdWHDibXbdRbhGNszeKLc0Asl3zM/9KgcYvekPGd511TD2/9oDmKuXZcQkBmj1memI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB7479
X-Proofpoint-GUID: 5Py2Nbb2_8xIF1WLKstHagQvLwIPJrsC
X-Proofpoint-ORIG-GUID: 5Py2Nbb2_8xIF1WLKstHagQvLwIPJrsC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-18_08,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=manish.mishra@nutanix.com; helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Current logic assumes that channel connections on the destination side are
always established in the same order as the source and the first one will
always be the main channel followed by the multifid or post-copy
preemption channel. This may not be always true, as even if a channel has a
connection established on the source side it can be in the pending state on
the destination side and a newer connection can be established first.
Basically causing out of order mapping of channels on the destination side.
Currently, all channels except post-copy preempt send a magic number, this
patch uses that magic number to decide the type of channel. This logic is
applicable only for precopy(multifd) live migration, as mentioned, the
post-copy preempt channel does not send any magic number. Also, tls live
migrations already does tls handshake before creating other channels, so
this issue is not possible with tls, hence this logic is avoided for tls
live migrations. This patch uses read peek to check the magic number of
channels so that current data/control stream management remains
un-effected.
---
 migration/migration.c    | 44 +++++++++++++++++++++++++++++-----------
 migration/multifd.c      | 12 ++++-------
 migration/multifd.h      |  2 +-
 migration/postcopy-ram.c |  5 +----
 migration/postcopy-ram.h |  2 +-
 5 files changed, 39 insertions(+), 26 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 739bb683f3..787e678d48 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -733,31 +733,51 @@ void migration_ioc_process_incoming(QIOChannel *ioc, Error **errp)
 {
     MigrationIncomingState *mis = migration_incoming_get_current();
     Error *local_err = NULL;
-    bool start_migration;
     QEMUFile *f;
+    bool default_channel = true;
+    uint32_t channel_magic = 0;
+    int ret = 0;
 
-    if (!mis->from_src_file) {
-        /* The first connection (multifd may have multiple) */
+    if (migrate_use_multifd() && !migrate_postcopy_ram() &&
+        qio_channel_has_feature(ioc, QIO_CHANNEL_FEATURE_READ_MSG_PEEK)) {
+        /*
+         * With multiple channels, it is possible that we receive channels
+         * out of order on destination side, causing incorrect mapping of
+         * source channels on destination side. Check channel MAGIC to
+         * decide type of channel. Please note this is best effort, postcopy
+         * preempt channel does not send any magic number so avoid it for
+         * postcopy live migration. Also tls live migration already does
+         * tls handshake while initializing main channel so with tls this
+         * issue is not possible.
+         */
+        ret = qio_channel_read_peek_all(ioc, (void *)&channel_magic,
+                                        sizeof(channel_magic), &local_err);
+
+        if (ret != 0) {
+            error_propagate(errp, local_err);
+            return;
+        }
+
+        default_channel = (channel_magic == cpu_to_be32(QEMU_VM_FILE_MAGIC));
+    } else {
+        default_channel = !mis->from_src_file;
+    }
+
+    if (default_channel) {
         f = qemu_file_new_input(ioc);
 
         if (!migration_incoming_setup(f, errp)) {
             return;
         }
-
-        /*
-         * Common migration only needs one channel, so we can start
-         * right now.  Some features need more than one channel, we wait.
-         */
-        start_migration = !migration_needs_multiple_sockets();
     } else {
         /* Multiple connections */
         assert(migration_needs_multiple_sockets());
         if (migrate_use_multifd()) {
-            start_migration = multifd_recv_new_channel(ioc, &local_err);
+            multifd_recv_new_channel(ioc, &local_err);
         } else {
             assert(migrate_postcopy_preempt());
             f = qemu_file_new_input(ioc);
-            start_migration = postcopy_preempt_new_channel(mis, f);
+            postcopy_preempt_new_channel(mis, f);
         }
         if (local_err) {
             error_propagate(errp, local_err);
@@ -765,7 +785,7 @@ void migration_ioc_process_incoming(QIOChannel *ioc, Error **errp)
         }
     }
 
-    if (start_migration) {
+    if (migration_has_all_channels()) {
         /* If it's a recovery, we're done */
         if (postcopy_try_recover()) {
             return;
diff --git a/migration/multifd.c b/migration/multifd.c
index 586ddc9d65..be86a4d07f 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -1220,11 +1220,9 @@ bool multifd_recv_all_channels_created(void)
 
 /*
  * Try to receive all multifd channels to get ready for the migration.
- * - Return true and do not set @errp when correctly receiving all channels;
- * - Return false and do not set @errp when correctly receiving the current one;
- * - Return false and set @errp when failing to receive the current channel.
+ * Sets @errp when failing to receive the current channel.
  */
-bool multifd_recv_new_channel(QIOChannel *ioc, Error **errp)
+void multifd_recv_new_channel(QIOChannel *ioc, Error **errp)
 {
     MultiFDRecvParams *p;
     Error *local_err = NULL;
@@ -1237,7 +1235,7 @@ bool multifd_recv_new_channel(QIOChannel *ioc, Error **errp)
                                 "failed to receive packet"
                                 " via multifd channel %d: ",
                                 qatomic_read(&multifd_recv_state->count));
-        return false;
+        return;
     }
     trace_multifd_recv_new_channel(id);
 
@@ -1247,7 +1245,7 @@ bool multifd_recv_new_channel(QIOChannel *ioc, Error **errp)
                    id);
         multifd_recv_terminate_threads(local_err);
         error_propagate(errp, local_err);
-        return false;
+        return;
     }
     p->c = ioc;
     object_ref(OBJECT(ioc));
@@ -1258,6 +1256,4 @@ bool multifd_recv_new_channel(QIOChannel *ioc, Error **errp)
     qemu_thread_create(&p->thread, p->name, multifd_recv_thread, p,
                        QEMU_THREAD_JOINABLE);
     qatomic_inc(&multifd_recv_state->count);
-    return qatomic_read(&multifd_recv_state->count) ==
-           migrate_multifd_channels();
 }
diff --git a/migration/multifd.h b/migration/multifd.h
index 519f498643..913e4ba274 100644
--- a/migration/multifd.h
+++ b/migration/multifd.h
@@ -18,7 +18,7 @@ void multifd_save_cleanup(void);
 int multifd_load_setup(Error **errp);
 int multifd_load_cleanup(Error **errp);
 bool multifd_recv_all_channels_created(void);
-bool multifd_recv_new_channel(QIOChannel *ioc, Error **errp);
+void multifd_recv_new_channel(QIOChannel *ioc, Error **errp);
 void multifd_recv_sync_main(void);
 int multifd_send_sync_main(QEMUFile *f);
 int multifd_queue_page(QEMUFile *f, RAMBlock *block, ram_addr_t offset);
diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
index b9a37ef255..f84f783ab4 100644
--- a/migration/postcopy-ram.c
+++ b/migration/postcopy-ram.c
@@ -1539,7 +1539,7 @@ void postcopy_unregister_shared_ufd(struct PostCopyFD *pcfd)
     }
 }
 
-bool postcopy_preempt_new_channel(MigrationIncomingState *mis, QEMUFile *file)
+void postcopy_preempt_new_channel(MigrationIncomingState *mis, QEMUFile *file)
 {
     /*
      * The new loading channel has its own threads, so it needs to be
@@ -1548,9 +1548,6 @@ bool postcopy_preempt_new_channel(MigrationIncomingState *mis, QEMUFile *file)
     qemu_file_set_blocking(file, true);
     mis->postcopy_qemufile_dst = file;
     trace_postcopy_preempt_new_channel();
-
-    /* Start the migration immediately */
-    return true;
 }
 
 /*
diff --git a/migration/postcopy-ram.h b/migration/postcopy-ram.h
index 6147bf7d1d..25881c4127 100644
--- a/migration/postcopy-ram.h
+++ b/migration/postcopy-ram.h
@@ -190,7 +190,7 @@ enum PostcopyChannels {
     RAM_CHANNEL_MAX,
 };
 
-bool postcopy_preempt_new_channel(MigrationIncomingState *mis, QEMUFile *file);
+void postcopy_preempt_new_channel(MigrationIncomingState *mis, QEMUFile *file);
 int postcopy_preempt_setup(MigrationState *s, Error **errp);
 int postcopy_preempt_wait_channel(MigrationState *s);
 
-- 
2.22.3


