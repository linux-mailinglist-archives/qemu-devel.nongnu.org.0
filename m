Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5306B6099B0
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 07:19:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ompYC-0004Fn-K7; Mon, 24 Oct 2022 00:59:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=72963f20b2=bin.meng@windriver.com>)
 id 1ompXu-0003tB-Sk
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 00:58:43 -0400
Received: from mx0b-0064b401.pphosted.com ([205.220.178.238])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=72963f20b2=bin.meng@windriver.com>)
 id 1ompXq-00068W-Bz
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 00:58:42 -0400
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 29O4mRCJ026938; Mon, 24 Oct 2022 04:58:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=OQo5jnoZPC0PninEK2UB/sHoF3/ivHf4XYEtM2sDYds=;
 b=UR9towlvPrYnamW1zKh9tTxPLcjtwbQ/MitxeGZ4PoYHfHRdc5L7xCxse99L7snz4hBg
 sVBna+ICzBCVBo1shEmPMYvfUa7X/ox2v3g7nbfagtY25aEUMxyBLSm/GGTnsYuEle61
 qu6apf3GLo6XLlslUN24ElBQVXsO9P5gA+dt6L3ANsgwTSi/xl1zVpf8pJGIMkg/ZrLG
 tBCTuN34ffm+Ug4wRDEe7LM6u++fhUK3WEkZrma4zaAYWepjQIsytRutXYad2ygk1Lwz
 a9/KTjqFBKclG8iQKswb+LWSoBOAbHBVLwBKzEh+0S996m4ox/x21yg2AIKKH3t1NGE4 Ug== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2102.outbound.protection.outlook.com [104.47.70.102])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kc7g9stj7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Oct 2022 04:58:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jvSu3G6oL6AgAzH12YLzRTAHP54KuJzHoAgqCc+gfskBJqpvspDP2F/90PB+DXyEybiKKF7enCROXZ4R7M6h8fevI5xZ5XnVc7F3gBM6m2ZY4R0uwvoS4Oqd29CW3t4tMa7GPAYO0vm5O+HCZcXBJayBz3QCQB/ZQyXpthSTejdwkb02gU2uw9aPAduIhYAuQM+/L9YJPNbQ9XZFAsS+kZso5hIhPBSliUVA0jdCI4K7SVagI12XVTKiTuZL1xhBzdDkb1rcz8AIG6Z+B18GksexEui1YYMYi9Jtw4YXN0uyFdjfXLly9zKcEtARHtyIXj427Ez8FjxP6HrqBXTIvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OQo5jnoZPC0PninEK2UB/sHoF3/ivHf4XYEtM2sDYds=;
 b=ZVJCibscG4t930FOoDqHoX8wVp56hH7bZxhUwLzEWrDxfNUps9vxuP4eRS2L0ILjSgOAU//+B0WaDpJziLymOkd5i/qz2QLCZmJERTWPVK6SVEFjHn72PKNIR3FqORYBiMM28a4gWP2IBh1krbgiHT2raGkPU9l/10US7LlqP1e+5gOeusgVgOHPxGrfYZKqIqFW5IuneQgZjSLmlV128pcJwRq9EX4cqvrWC7so+qBuh9YC6sY9iLGyQt6ESyG0H/M1vdJsNGyaDWdTCgEI0nuzse9ksqVg92z6hJ6gfhY4wgarx3wicEDfi9FLLu5Baxl6aNAGLb3jKVdp/rshIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5358.namprd11.prod.outlook.com (2603:10b6:5:395::7) by
 MW4PR11MB6911.namprd11.prod.outlook.com (2603:10b6:303:22d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.26; Mon, 24 Oct
 2022 04:58:23 +0000
Received: from DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::b051:27b7:c1c1:7cb9]) by DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::b051:27b7:c1c1:7cb9%4]) with mapi id 15.20.5746.025; Mon, 24 Oct 2022
 04:58:23 +0000
From: Bin Meng <bin.meng@windriver.com>
To: qemu-devel@nongnu.org
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>
Subject: [PATCH 04/16] hw/9pfs: Introduce an opaque type 9P_FILE_ID
Date: Mon, 24 Oct 2022 12:57:47 +0800
Message-Id: <20221024045759.448014-5-bin.meng@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221024045759.448014-1-bin.meng@windriver.com>
References: <20221024045759.448014-1-bin.meng@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR03CA0021.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::26) To DM4PR11MB5358.namprd11.prod.outlook.com
 (2603:10b6:5:395::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5358:EE_|MW4PR11MB6911:EE_
X-MS-Office365-Filtering-Correlation-Id: 109361d9-d446-41c8-113a-08dab57c6125
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: B0MqBfurEe9YK7wYpZETeFt+QJneUQfQIb/WRNdeVSumoIiDpHqV2NSnRWje5EOjSDv0lJgAWHvz0KAz+1CErjM9iMDR6ucQ+RNJOrhr3n7NJy8LRKzf0+q86QwYkbgZbMy8aeMqJ0I6bNxTBGtvMixFSV6EaA/7uQ/UV5jCAwYxN3nYZc3ZbQbRV+zhczqajMEx9bYYZfQjOe3LwnKABcFH4yxMLo5cCe9XYUflVewnAmRJ3lWc6f+zVtcXcVJh+SHfL/r2KvTHh2Ho8R9o4Z1K4+RRS491GRT9U0xHtIi65AZQC5UlatIZPeJpaK1LuGUgHhWc4NZSQRsFJW+y4BlPFQMWI8mu6De3SBABTEz1GkE+0TZ1EamWhlpkQp/GvKGkAD1XdJKGDqRpMuqoFnJds1/wlAYz3pHzPSjKdsdqmVlnN5lKKpstIJ2qc6VTMDWTuDNWfF+/rD2WQje8IxJdOlpwByFAgnRHqW9fXWROAk7KUkQeI/nTVwaszyEMQnC1VjXD33wvsbcudBiPwEFccS8zWB4+n98XEzXqSC6U+g+aL3Ldg51Vdxh3Pgx4Ryx7TiXIWfeRlj5kthUAeJRN3KZspl+/tbiRrlA4YzGK79VsSlAfd4z5FwnnQMM1lObtIOZpRGLMAZA9chZ+Bkn8AhOR7W3UO3hz+STbjNAl1yQh8ulT93/21Gam7XrAeDoy5KAxhAefKCc3tj8N5lvfAj6mWo8RYh/JYs4cyEnwfSU0OSuq+4J/ozdN1+yOcHkowQreL4rnTasq+KmatA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5358.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(396003)(39850400004)(346002)(136003)(366004)(451199015)(6666004)(6506007)(2616005)(52116002)(6512007)(26005)(1076003)(186003)(83380400001)(44832011)(2906002)(30864003)(6916009)(54906003)(316002)(478600001)(6486002)(5660300002)(8936002)(41300700001)(66946007)(66556008)(4326008)(8676002)(66476007)(86362001)(36756003)(38100700002)(38350700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CJh5KcNX38mdKLjaQEpwb3m/sFpkz/1gMbEwMDz7nILa4wz222LsM39PU8KX?=
 =?us-ascii?Q?LbQN8wZCOyf9eBr/Y3cFKCHmck5TBfLaM1aP3JDSQVdRzoX+5kLusuoO9NxK?=
 =?us-ascii?Q?G99WtlChw7qqG0+c0WtaE7ST2NdxEGCnR6sGu7McQdwPylGqNB6pSYFepT5B?=
 =?us-ascii?Q?gj6dJJ5oDRkL1zrAiTnm+sc59/CTVrKChlYFyxpsUaIXxDjW8xjI1uFBLj4j?=
 =?us-ascii?Q?GV4D2LXc7S9jqIqy30xN3peBC90hJvj2P8tVX2X/H43DgMg9ssuoSpGy+arV?=
 =?us-ascii?Q?JDsVEt7WhauDuRtRMypINP8ZUXetC4o57sqSde32rY5FklGqeqmdl6+m6eG9?=
 =?us-ascii?Q?5e7uoznHo+F/oMY8Sg8jgQezWMfzv4br3393N5RolmTgO8V0jGIrBCsWYWSk?=
 =?us-ascii?Q?ezc2T6PgJm2QCPIBNnP9KZDfRKrIX2p35/cgmG5DJSseukEPeLpSO0GnlUFz?=
 =?us-ascii?Q?/O/KNbyqDMeJ0/jzTvlCrglMsjvktw3oeUTUUR9oDxJOiqVZfC1xyTb9J0d+?=
 =?us-ascii?Q?jiZhnwg1SHqYT1ZsmZD4/Io+qtzeSsz59sIPUWCpH/ujoXXdl+TbqTAUx7gf?=
 =?us-ascii?Q?jPU+Za73RDxIopLCpZVpXnxxDwDPMh4hWr6TaoulHe+fBhlOjiU3KRVcBTWl?=
 =?us-ascii?Q?1G2oXVRjgIY/aW9mamEXa3nXuZq1FdqxUlB0ehlMwfw6suCNIKsTnDQ5neqj?=
 =?us-ascii?Q?udU4PpikuGN5946SnL4ihohNWCO0xLy7soN/zz+TmigtuKYBDK680pNbxk2p?=
 =?us-ascii?Q?xRWL86KomldY53RwTwQle+IJwD3F3EHQKGOGk9q1p95N0EsERZz9So/vKm10?=
 =?us-ascii?Q?hARNVBCz/LMDkkPomsrAN6wQRa0ypTsH5FUYzDwAanqKFniw2bcz2pHwELru?=
 =?us-ascii?Q?nDG1HXvgzuryVsrgqymMv6adf34IISQjH3wNjiMGOGNb9XoH7fCXrg+a1nGp?=
 =?us-ascii?Q?IiTNZnaigZGwtpq7q/kVd1g2RCFgQ80dB5mO9jZLfdjQ68Sx2+2hfs+qXgYZ?=
 =?us-ascii?Q?Y0+IzxjYUfvK4mx4tdiwi324D9M8s/rrlV2ETjZswqaYhZqe1+r+S9uM3tJh?=
 =?us-ascii?Q?N1N8eU1cloO3MEqe/SsC5LyPZh5OeNUyVuyrQ4Ga6H/xy1THkKfJFOQKijir?=
 =?us-ascii?Q?oUsF7zWfJ0RhoUvO/EAcIqiVOXptIeveAaTqHNUcDovvWhuU8pzx9irX1cJ4?=
 =?us-ascii?Q?coC19dkjOOVD0A5E1vwdZdRM8Ljv9k4R22J3c/TZiFxUGkoEYqRiovtWKvAT?=
 =?us-ascii?Q?erDmq4aKBMhM/uNMuXMIrd7scOBQa+yFt6YbRM3oXbQ2cbSw+fHTw4A0Bxv4?=
 =?us-ascii?Q?u4KPrcbAH0tPRGQ3vl+dkyn5uhWHJtvpLclp9KSNCb3uKpDb4rEp+fr55ZCB?=
 =?us-ascii?Q?oTUUqgb/wvOx9q5eZQd7Uk6anxyrgk9j9k661csGvR7xGXeQpf22GIGIltnM?=
 =?us-ascii?Q?fuZs9sfoPrDvOUiPYCP3+DnN74W6A+X2OsY90EbMRleEXVGCmYsWcqLyotW1?=
 =?us-ascii?Q?ePcfXBkMhYZStic4ecQYP9yRAuX7IQ5uMwdhjjEl/lg+ic75Tn6HCfvdfu/Z?=
 =?us-ascii?Q?a63kUhuYxb24g067d/9HJlwTfztwPa2fidSqmikoOuDYsv9OiTDCNzzBCzCo?=
 =?us-ascii?Q?Ag=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 109361d9-d446-41c8-113a-08dab57c6125
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2022 04:58:23.8300 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LEmoPOvarmEKcxG1AT9eCw2uHnWM15XcZmm2YD3gCzu+q2JYrGJNbLNdfLkd40MhzXWOH62NsEwLH7cnT7cH7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6911
X-Proofpoint-GUID: gLl_et4pQfNYBlMgB7YU7VxZ_7MPkNVc
X-Proofpoint-ORIG-GUID: gLl_et4pQfNYBlMgB7YU7VxZ_7MPkNVc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-23_02,2022-10-21_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015
 bulkscore=0 malwarescore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 mlxscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2210240031
Received-SPF: pass client-ip=205.220.178.238;
 envelope-from=prvs=72963f20b2=bin.meng@windriver.com;
 helo=mx0b-0064b401.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Introduce an opaque type to represent a file in the 9pfs. This is
file descriptor on POSIX systems. In the upcoming patches, we can
extend it to support Windows.

With this new opaque type, it significantly reduces the number of
deviated code paths when adding Windows support.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 hw/9pfs/9p-file-id.h     |  21 +++++
 hw/9pfs/9p-local.h       |   8 +-
 hw/9pfs/9p-util.h        |  28 ++++---
 hw/9pfs/9p-local.c       | 166 ++++++++++++++++++++-------------------
 hw/9pfs/9p-util-darwin.c |  14 ++--
 hw/9pfs/9p-util-linux.c  |  14 ++--
 hw/9pfs/9p-xattr.c       |  16 ++--
 7 files changed, 150 insertions(+), 117 deletions(-)
 create mode 100644 hw/9pfs/9p-file-id.h

diff --git a/hw/9pfs/9p-file-id.h b/hw/9pfs/9p-file-id.h
new file mode 100644
index 0000000000..60cbfbf4dd
--- /dev/null
+++ b/hw/9pfs/9p-file-id.h
@@ -0,0 +1,21 @@
+/*
+ * 9p file representation for different hosts
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef QEMU_9P_FILE_ID_H
+#define QEMU_9P_FILE_ID_H
+
+/*
+ * 9pfs file id
+ *
+ * This is file descriptor on POSIX platforms
+ */
+typedef int P9_FILE_ID;
+
+/* invalid value for P9_FILE_ID */
+#define P9_INVALID_FILE -1
+
+#endif
diff --git a/hw/9pfs/9p-local.h b/hw/9pfs/9p-local.h
index 32c72749d9..c8404063e5 100644
--- a/hw/9pfs/9p-local.h
+++ b/hw/9pfs/9p-local.h
@@ -13,8 +13,10 @@
 #ifndef QEMU_9P_LOCAL_H
 #define QEMU_9P_LOCAL_H
 
-int local_open_nofollow(FsContext *fs_ctx, const char *path, int flags,
-                        mode_t mode);
-int local_opendir_nofollow(FsContext *fs_ctx, const char *path);
+#include "9p-file-id.h"
+
+P9_FILE_ID local_open_nofollow(FsContext *fs_ctx, const char *path, int flags,
+                               mode_t mode);
+P9_FILE_ID local_opendir_nofollow(FsContext *fs_ctx, const char *path);
 
 #endif
diff --git a/hw/9pfs/9p-util.h b/hw/9pfs/9p-util.h
index c314cf381d..1e7dc76345 100644
--- a/hw/9pfs/9p-util.h
+++ b/hw/9pfs/9p-util.h
@@ -13,6 +13,8 @@
 #ifndef QEMU_9P_UTIL_H
 #define QEMU_9P_UTIL_H
 
+#include "9p-file-id.h"
+
 #ifdef O_PATH
 #define O_PATH_9P_UTIL O_PATH
 #else
@@ -101,30 +103,31 @@ static inline int errno_to_dotl(int err) {
 #define qemu_utimensat  utimensat
 #define qemu_unlinkat   unlinkat
 
-static inline void close_preserve_errno(int fd)
+static inline void close_preserve_errno(P9_FILE_ID fd)
 {
     int serrno = errno;
     close(fd);
     errno = serrno;
 }
 
-static inline int openat_dir(int dirfd, const char *name)
+static inline P9_FILE_ID openat_dir(P9_FILE_ID dirfd, const char *name)
 {
     return qemu_openat(dirfd, name,
                        O_DIRECTORY | O_RDONLY | O_NOFOLLOW | O_PATH_9P_UTIL);
 }
 
-static inline int openat_file(int dirfd, const char *name, int flags,
-                              mode_t mode)
+static inline P9_FILE_ID openat_file(P9_FILE_ID dirfd, const char *name,
+                                     int flags, mode_t mode)
 {
-    int fd, serrno, ret;
+    int serrno, ret;
+    P9_FILE_ID fd;
 
 #ifndef CONFIG_DARWIN
 again:
 #endif
     fd = qemu_openat(dirfd, name, flags | O_NOFOLLOW | O_NOCTTY | O_NONBLOCK,
                      mode);
-    if (fd == -1) {
+    if (fd == P9_INVALID_FILE) {
 #ifndef CONFIG_DARWIN
         if (errno == EPERM && (flags & O_NOATIME)) {
             /*
@@ -155,13 +158,13 @@ again:
     return fd;
 }
 
-ssize_t fgetxattrat_nofollow(int dirfd, const char *path, const char *name,
-                             void *value, size_t size);
-int fsetxattrat_nofollow(int dirfd, const char *path, const char *name,
+ssize_t fgetxattrat_nofollow(P9_FILE_ID dirfd, const char *path,
+                             const char *name, void *value, size_t size);
+int fsetxattrat_nofollow(P9_FILE_ID dirfd, const char *path, const char *name,
                          void *value, size_t size, int flags);
-ssize_t flistxattrat_nofollow(int dirfd, const char *filename,
+ssize_t flistxattrat_nofollow(P9_FILE_ID dirfd, const char *filename,
                               char *list, size_t size);
-ssize_t fremovexattrat_nofollow(int dirfd, const char *filename,
+ssize_t fremovexattrat_nofollow(P9_FILE_ID dirfd, const char *filename,
                                 const char *name);
 
 /*
@@ -219,6 +222,7 @@ static inline struct dirent *qemu_dirent_dup(struct dirent *dent)
 #if defined CONFIG_DARWIN && defined CONFIG_PTHREAD_FCHDIR_NP
 int pthread_fchdir_np(int fd) __attribute__((weak_import));
 #endif
-int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t dev);
+int qemu_mknodat(P9_FILE_ID dirfd, const char *filename, mode_t mode,
+                 dev_t dev);
 
 #endif
diff --git a/hw/9pfs/9p-local.c b/hw/9pfs/9p-local.c
index d2246a3d7e..7e8d8492ea 100644
--- a/hw/9pfs/9p-local.c
+++ b/hw/9pfs/9p-local.c
@@ -54,18 +54,18 @@
 #endif
 
 typedef struct {
-    int mountfd;
+    P9_FILE_ID mountfd;
 } LocalData;
 
-int local_open_nofollow(FsContext *fs_ctx, const char *path, int flags,
-                        mode_t mode)
+P9_FILE_ID local_open_nofollow(FsContext *fs_ctx, const char *path, int flags,
+                               mode_t mode)
 {
     LocalData *data = fs_ctx->private;
-    int fd = data->mountfd;
+    P9_FILE_ID fd = data->mountfd;
 
-    while (*path && fd != -1) {
+    while (*path && fd != P9_INVALID_FILE) {
         const char *c;
-        int next_fd;
+        P9_FILE_ID next_fd;
         char *head;
 
         /* Only relative paths without consecutive slashes */
@@ -94,20 +94,21 @@ int local_open_nofollow(FsContext *fs_ctx, const char *path, int flags,
     return fd;
 }
 
-int local_opendir_nofollow(FsContext *fs_ctx, const char *path)
+P9_FILE_ID local_opendir_nofollow(FsContext *fs_ctx, const char *path)
 {
     return local_open_nofollow(fs_ctx, path, O_DIRECTORY | O_RDONLY, 0);
 }
 
-static void renameat_preserve_errno(int odirfd, const char *opath, int ndirfd,
-                                    const char *npath)
+static void renameat_preserve_errno(P9_FILE_ID odirfd, const char *opath,
+                                    P9_FILE_ID ndirfd, const char *npath)
 {
     int serrno = errno;
     qemu_renameat(odirfd, opath, ndirfd, npath);
     errno = serrno;
 }
 
-static void unlinkat_preserve_errno(int dirfd, const char *path, int flags)
+static void unlinkat_preserve_errno(P9_FILE_ID dirfd, const char *path,
+                                    int flags)
 {
     int serrno = errno;
     qemu_unlinkat(dirfd, path, flags);
@@ -117,9 +118,10 @@ static void unlinkat_preserve_errno(int dirfd, const char *path, int flags)
 #define VIRTFS_META_DIR ".virtfs_metadata"
 #define VIRTFS_META_ROOT_FILE VIRTFS_META_DIR "_root"
 
-static FILE *local_fopenat(int dirfd, const char *name, const char *mode)
+static FILE *local_fopenat(P9_FILE_ID dirfd, const char *name, const char *mode)
 {
-    int fd, o_mode = 0;
+    P9_FILE_ID fd;
+    int o_mode = 0;
     FILE *fp;
     int flags;
     /*
@@ -134,7 +136,7 @@ static FILE *local_fopenat(int dirfd, const char *name, const char *mode)
         return NULL;
     }
     fd = openat_file(dirfd, name, flags, o_mode);
-    if (fd == -1) {
+    if (fd == P9_INVALID_FILE) {
         return NULL;
     }
     fp = fdopen(fd, mode);
@@ -145,16 +147,16 @@ static FILE *local_fopenat(int dirfd, const char *name, const char *mode)
 }
 
 #define ATTR_MAX 100
-static void local_mapped_file_attr(int dirfd, const char *name,
+static void local_mapped_file_attr(P9_FILE_ID dirfd, const char *name,
                                    struct stat *stbuf)
 {
     FILE *fp;
     char buf[ATTR_MAX];
-    int map_dirfd;
+    P9_FILE_ID map_dirfd;
 
     if (strcmp(name, ".")) {
         map_dirfd = openat_dir(dirfd, VIRTFS_META_DIR);
-        if (map_dirfd == -1) {
+        if (map_dirfd == P9_INVALID_FILE) {
             return;
         }
 
@@ -187,10 +189,10 @@ static int local_lstat(FsContext *fs_ctx, V9fsPath *fs_path, struct stat *stbuf)
     int err = -1;
     char *dirpath = g_path_get_dirname(fs_path->data);
     char *name = g_path_get_basename(fs_path->data);
-    int dirfd;
+    P9_FILE_ID dirfd;
 
     dirfd = local_opendir_nofollow(fs_ctx, dirpath);
-    if (dirfd == -1) {
+    if (dirfd == P9_INVALID_FILE) {
         goto out;
     }
 
@@ -233,14 +235,14 @@ out:
     return err;
 }
 
-static int local_set_mapped_file_attrat(int dirfd, const char *name,
+static int local_set_mapped_file_attrat(P9_FILE_ID dirfd, const char *name,
                                         FsCred *credp)
 {
     FILE *fp;
     int ret;
     char buf[ATTR_MAX];
     int uid = -1, gid = -1, mode = -1, rdev = -1;
-    int map_dirfd = -1, map_fd;
+    P9_FILE_ID map_dirfd = P9_INVALID_FILE, map_fd;
     bool is_root = !strcmp(name, ".");
 
     if (is_root) {
@@ -259,7 +261,7 @@ static int local_set_mapped_file_attrat(int dirfd, const char *name,
         }
 
         map_dirfd = openat_dir(dirfd, VIRTFS_META_DIR);
-        if (map_dirfd == -1) {
+        if (map_dirfd == P9_INVALID_FILE) {
             return -1;
         }
 
@@ -296,7 +298,7 @@ update_map_file:
         /* We can't go this far with map_dirfd not being a valid file descriptor
          * but some versions of gcc aren't smart enough to see it.
          */
-        if (map_dirfd != -1) {
+        if (map_dirfd != P9_INVALID_FILE) {
             close_preserve_errno(map_dirfd);
         }
     }
@@ -305,7 +307,7 @@ update_map_file:
     }
 
     map_fd = fileno(fp);
-    assert(map_fd != -1);
+    assert(map_fd != P9_INVALID_FILE);
     ret = fchmod(map_fd, 0600);
     assert(ret == 0);
 
@@ -339,10 +341,11 @@ update_map_file:
     return 0;
 }
 
-static int fchmodat_nofollow(int dirfd, const char *name, mode_t mode)
+static int fchmodat_nofollow(P9_FILE_ID dirfd, const char *name, mode_t mode)
 {
     struct stat stbuf;
-    int fd, ret;
+    P9_FILE_ID fd;
+    int ret;
 
     /* FIXME: this should be handled with fchmodat(AT_SYMLINK_NOFOLLOW).
      * Unfortunately, the linux kernel doesn't implement it yet.
@@ -362,16 +365,16 @@ static int fchmodat_nofollow(int dirfd, const char *name, mode_t mode)
     /* Fallback for systems that don't support O_PATH: we depend on the file
      * being readable or writable.
      */
-    if (fd == -1) {
+    if (fd == P9_INVALID_FILE) {
         /* In case the file is writable-only and isn't a directory. */
         if (errno == EACCES) {
             fd = openat_file(dirfd, name, O_WRONLY, 0);
         }
-        if (fd == -1 && errno == EISDIR) {
+        if (fd == P9_INVALID_FILE && errno == EISDIR) {
             errno = EACCES;
         }
     }
-    if (fd == -1) {
+    if (fd == P9_INVALID_FILE) {
         return -1;
     }
     ret = fchmod(fd, mode);
@@ -380,7 +383,7 @@ static int fchmodat_nofollow(int dirfd, const char *name, mode_t mode)
      * link, O_PATH | O_NOFOLLOW causes openat(2) to return a file descriptor
      * referring to the symbolic link.
      */
-    if (fd == -1) {
+    if (fd == P9_INVALID_FILE) {
         return -1;
     }
 
@@ -401,7 +404,7 @@ static int fchmodat_nofollow(int dirfd, const char *name, mode_t mode)
     return ret;
 }
 
-static int local_set_xattrat(int dirfd, const char *path, FsCred *credp)
+static int local_set_xattrat(P9_FILE_ID dirfd, const char *path, FsCred *credp)
 {
     int err;
 
@@ -440,7 +443,7 @@ static int local_set_xattrat(int dirfd, const char *path, FsCred *credp)
     return 0;
 }
 
-static int local_set_cred_passthrough(FsContext *fs_ctx, int dirfd,
+static int local_set_cred_passthrough(FsContext *fs_ctx, P9_FILE_ID dirfd,
                                       const char *name, FsCred *credp)
 {
     if (fchownat(dirfd, name, credp->fc_uid, credp->fc_gid,
@@ -478,10 +481,10 @@ static ssize_t local_readlink(FsContext *fs_ctx, V9fsPath *fs_path,
                (fs_ctx->export_flags & V9FS_SM_NONE)) {
         char *dirpath = g_path_get_dirname(fs_path->data);
         char *name = g_path_get_basename(fs_path->data);
-        int dirfd;
+        P9_FILE_ID dirfd;
 
         dirfd = local_opendir_nofollow(fs_ctx, dirpath);
-        if (dirfd == -1) {
+        if (dirfd == P9_INVALID_FILE) {
             goto out;
         }
 
@@ -507,10 +510,10 @@ static int local_closedir(FsContext *ctx, V9fsFidOpenState *fs)
 static int local_open(FsContext *ctx, V9fsPath *fs_path,
                       int flags, V9fsFidOpenState *fs)
 {
-    int fd;
+    P9_FILE_ID fd;
 
     fd = local_open_nofollow(ctx, fs_path->data, flags, 0);
-    if (fd == -1) {
+    if (fd == P9_INVALID_FILE) {
         return -1;
     }
     fs->fd = fd;
@@ -520,11 +523,11 @@ static int local_open(FsContext *ctx, V9fsPath *fs_path,
 static int local_opendir(FsContext *ctx,
                          V9fsPath *fs_path, V9fsFidOpenState *fs)
 {
-    int dirfd;
+    P9_FILE_ID dirfd;
     DIR *stream;
 
     dirfd = local_opendir_nofollow(ctx, fs_path->data);
-    if (dirfd == -1) {
+    if (dirfd == P9_INVALID_FILE) {
         return -1;
     }
 
@@ -640,10 +643,10 @@ static int local_chmod(FsContext *fs_ctx, V9fsPath *fs_path, FsCred *credp)
     char *dirpath = g_path_get_dirname(fs_path->data);
     char *name = g_path_get_basename(fs_path->data);
     int ret = -1;
-    int dirfd;
+    P9_FILE_ID dirfd;
 
     dirfd = local_opendir_nofollow(fs_ctx, dirpath);
-    if (dirfd == -1) {
+    if (dirfd == P9_INVALID_FILE) {
         goto out;
     }
 
@@ -667,7 +670,7 @@ static int local_mknod(FsContext *fs_ctx, V9fsPath *dir_path,
                        const char *name, FsCred *credp)
 {
     int err = -1;
-    int dirfd;
+    P9_FILE_ID dirfd;
 
     if (fs_ctx->export_flags & V9FS_SM_MAPPED_FILE &&
         local_is_mapped_file_metadata(fs_ctx, name)) {
@@ -676,7 +679,7 @@ static int local_mknod(FsContext *fs_ctx, V9fsPath *dir_path,
     }
 
     dirfd = local_opendir_nofollow(fs_ctx, dir_path->data);
-    if (dirfd == -1) {
+    if (dirfd == P9_INVALID_FILE) {
         return -1;
     }
 
@@ -719,7 +722,7 @@ static int local_mkdir(FsContext *fs_ctx, V9fsPath *dir_path,
                        const char *name, FsCred *credp)
 {
     int err = -1;
-    int dirfd;
+    P9_FILE_ID dirfd;
 
     if (fs_ctx->export_flags & V9FS_SM_MAPPED_FILE &&
         local_is_mapped_file_metadata(fs_ctx, name)) {
@@ -728,7 +731,7 @@ static int local_mkdir(FsContext *fs_ctx, V9fsPath *dir_path,
     }
 
     dirfd = local_opendir_nofollow(fs_ctx, dir_path->data);
-    if (dirfd == -1) {
+    if (dirfd == P9_INVALID_FILE) {
         return -1;
     }
 
@@ -816,9 +819,9 @@ static int local_fstat(FsContext *fs_ctx, int fid_type,
 static int local_open2(FsContext *fs_ctx, V9fsPath *dir_path, const char *name,
                        int flags, FsCred *credp, V9fsFidOpenState *fs)
 {
-    int fd = -1;
+    P9_FILE_ID fd = P9_INVALID_FILE;
     int err = -1;
-    int dirfd;
+    P9_FILE_ID dirfd;
 
     if (fs_ctx->export_flags & V9FS_SM_MAPPED_FILE &&
         local_is_mapped_file_metadata(fs_ctx, name)) {
@@ -832,7 +835,7 @@ static int local_open2(FsContext *fs_ctx, V9fsPath *dir_path, const char *name,
     flags |= O_NOFOLLOW;
 
     dirfd = local_opendir_nofollow(fs_ctx, dir_path->data);
-    if (dirfd == -1) {
+    if (dirfd == P9_INVALID_FILE) {
         return -1;
     }
 
@@ -840,7 +843,7 @@ static int local_open2(FsContext *fs_ctx, V9fsPath *dir_path, const char *name,
     if (fs_ctx->export_flags & V9FS_SM_MAPPED ||
         fs_ctx->export_flags & V9FS_SM_MAPPED_FILE) {
         fd = openat_file(dirfd, name, flags, fs_ctx->fmode);
-        if (fd == -1) {
+        if (fd == P9_INVALID_FILE) {
             goto out;
         }
         credp->fc_mode = credp->fc_mode | S_IFREG;
@@ -856,7 +859,7 @@ static int local_open2(FsContext *fs_ctx, V9fsPath *dir_path, const char *name,
     } else if ((fs_ctx->export_flags & V9FS_SM_PASSTHROUGH) ||
                (fs_ctx->export_flags & V9FS_SM_NONE)) {
         fd = openat_file(dirfd, name, flags, credp->fc_mode);
-        if (fd == -1) {
+        if (fd == P9_INVALID_FILE) {
             goto out;
         }
         err = local_set_cred_passthrough(fs_ctx, dirfd, name, credp);
@@ -882,7 +885,7 @@ static int local_symlink(FsContext *fs_ctx, const char *oldpath,
                          V9fsPath *dir_path, const char *name, FsCred *credp)
 {
     int err = -1;
-    int dirfd;
+    P9_FILE_ID dirfd;
 
     if (fs_ctx->export_flags & V9FS_SM_MAPPED_FILE &&
         local_is_mapped_file_metadata(fs_ctx, name)) {
@@ -891,7 +894,7 @@ static int local_symlink(FsContext *fs_ctx, const char *oldpath,
     }
 
     dirfd = local_opendir_nofollow(fs_ctx, dir_path->data);
-    if (dirfd == -1) {
+    if (dirfd == P9_INVALID_FILE) {
         return -1;
     }
 
@@ -903,7 +906,7 @@ static int local_symlink(FsContext *fs_ctx, const char *oldpath,
 
         fd = openat_file(dirfd, name, O_CREAT | O_EXCL | O_RDWR,
                          fs_ctx->fmode);
-        if (fd == -1) {
+        if (fd == P9_INVALID_FILE) {
             goto out;
         }
         /* Write the oldpath (target) to the file. */
@@ -962,7 +965,7 @@ static int local_link(FsContext *ctx, V9fsPath *oldpath,
     char *odirpath = g_path_get_dirname(oldpath->data);
     char *oname = g_path_get_basename(oldpath->data);
     int ret = -1;
-    int odirfd, ndirfd;
+    P9_FILE_ID odirfd, ndirfd;
 
     if (ctx->export_flags & V9FS_SM_MAPPED_FILE &&
         local_is_mapped_file_metadata(ctx, name)) {
@@ -971,12 +974,12 @@ static int local_link(FsContext *ctx, V9fsPath *oldpath,
     }
 
     odirfd = local_opendir_nofollow(ctx, odirpath);
-    if (odirfd == -1) {
+    if (odirfd == P9_INVALID_FILE) {
         goto out;
     }
 
     ndirfd = local_opendir_nofollow(ctx, dirpath->data);
-    if (ndirfd == -1) {
+    if (ndirfd == P9_INVALID_FILE) {
         close_preserve_errno(odirfd);
         goto out;
     }
@@ -996,12 +999,12 @@ static int local_link(FsContext *ctx, V9fsPath *oldpath,
         }
 
         omap_dirfd = openat_dir(odirfd, VIRTFS_META_DIR);
-        if (omap_dirfd == -1) {
+        if (omap_dirfd == P9_INVALID_FILE) {
             goto err;
         }
 
         nmap_dirfd = openat_dir(ndirfd, VIRTFS_META_DIR);
-        if (nmap_dirfd == -1) {
+        if (nmap_dirfd == P9_INVALID_FILE) {
             close_preserve_errno(omap_dirfd);
             goto err;
         }
@@ -1032,10 +1035,11 @@ out:
 
 static int local_truncate(FsContext *ctx, V9fsPath *fs_path, off_t size)
 {
-    int fd, ret;
+    P9_FILE_ID fd;
+    int ret;
 
     fd = local_open_nofollow(ctx, fs_path->data, O_WRONLY, 0);
-    if (fd == -1) {
+    if (fd == P9_INVALID_FILE) {
         return -1;
     }
     ret = ftruncate(fd, size);
@@ -1048,10 +1052,10 @@ static int local_chown(FsContext *fs_ctx, V9fsPath *fs_path, FsCred *credp)
     char *dirpath = g_path_get_dirname(fs_path->data);
     char *name = g_path_get_basename(fs_path->data);
     int ret = -1;
-    int dirfd;
+    P9_FILE_ID dirfd;
 
     dirfd = local_opendir_nofollow(fs_ctx, dirpath);
-    if (dirfd == -1) {
+    if (dirfd == P9_INVALID_FILE) {
         goto out;
     }
 
@@ -1078,10 +1082,11 @@ static int local_utimensat(FsContext *s, V9fsPath *fs_path,
 {
     char *dirpath = g_path_get_dirname(fs_path->data);
     char *name = g_path_get_basename(fs_path->data);
-    int dirfd, ret = -1;
+    P9_FILE_ID dirfd;
+    int ret = -1;
 
     dirfd = local_opendir_nofollow(s, dirpath);
-    if (dirfd == -1) {
+    if (dirfd == P9_INVALID_FILE) {
         goto out;
     }
 
@@ -1093,13 +1098,13 @@ out:
     return ret;
 }
 
-static int local_unlinkat_common(FsContext *ctx, int dirfd, const char *name,
-                                 int flags)
+static int local_unlinkat_common(FsContext *ctx, P9_FILE_ID dirfd,
+                                 const char *name, int flags)
 {
     int ret;
 
     if (ctx->export_flags & V9FS_SM_MAPPED_FILE) {
-        int map_dirfd;
+        P9_FILE_ID map_dirfd;
 
         /* We need to remove the metadata as well:
          * - the metadata directory if we're removing a directory
@@ -1110,10 +1115,10 @@ static int local_unlinkat_common(FsContext *ctx, int dirfd, const char *name,
          * mode. We just ignore the error.
          */
         if (flags == AT_REMOVEDIR) {
-            int fd;
+            P9_FILE_ID fd;
 
             fd = openat_dir(dirfd, name);
-            if (fd == -1) {
+            if (fd == P9_INVALID_FILE) {
                 return -1;
             }
             ret = qemu_unlinkat(fd, VIRTFS_META_DIR, AT_REMOVEDIR);
@@ -1123,7 +1128,7 @@ static int local_unlinkat_common(FsContext *ctx, int dirfd, const char *name,
             }
         }
         map_dirfd = openat_dir(dirfd, VIRTFS_META_DIR);
-        if (map_dirfd != -1) {
+        if (map_dirfd != P9_INVALID_FILE) {
             ret = qemu_unlinkat(map_dirfd, name, 0);
             close_preserve_errno(map_dirfd);
             if (ret < 0 && errno != ENOENT) {
@@ -1143,11 +1148,11 @@ static int local_remove(FsContext *ctx, const char *path)
     char *dirpath = g_path_get_dirname(path);
     char *name = g_path_get_basename(path);
     int flags = 0;
-    int dirfd;
+    P9_FILE_ID dirfd;
     int err = -1;
 
     dirfd = local_opendir_nofollow(ctx, dirpath);
-    if (dirfd == -1) {
+    if (dirfd == P9_INVALID_FILE) {
         goto out;
     }
 
@@ -1188,10 +1193,11 @@ static int local_fsync(FsContext *ctx, int fid_type,
 
 static int local_statfs(FsContext *s, V9fsPath *fs_path, struct statfs *stbuf)
 {
-    int fd, ret;
+    P9_FILE_ID fd;
+    int ret;
 
     fd = local_open_nofollow(s, fs_path->data, O_RDONLY, 0);
-    if (fd == -1) {
+    if (fd == P9_INVALID_FILE) {
         return -1;
     }
     ret = fstatfs(fd, stbuf);
@@ -1276,7 +1282,7 @@ static int local_renameat(FsContext *ctx, V9fsPath *olddir,
                           const char *new_name)
 {
     int ret;
-    int odirfd, ndirfd;
+    P9_FILE_ID odirfd, ndirfd;
 
     if (ctx->export_flags & V9FS_SM_MAPPED_FILE &&
         (local_is_mapped_file_metadata(ctx, old_name) ||
@@ -1286,12 +1292,12 @@ static int local_renameat(FsContext *ctx, V9fsPath *olddir,
     }
 
     odirfd = local_opendir_nofollow(ctx, olddir->data);
-    if (odirfd == -1) {
+    if (odirfd == P9_INVALID_FILE) {
         return -1;
     }
 
     ndirfd = local_opendir_nofollow(ctx, newdir->data);
-    if (ndirfd == -1) {
+    if (ndirfd == P9_INVALID_FILE) {
         close_preserve_errno(odirfd);
         return -1;
     }
@@ -1302,7 +1308,7 @@ static int local_renameat(FsContext *ctx, V9fsPath *olddir,
     }
 
     if (ctx->export_flags & V9FS_SM_MAPPED_FILE) {
-        int omap_dirfd, nmap_dirfd;
+        P9_FILE_ID omap_dirfd, nmap_dirfd;
 
         ret = qemu_mkdirat(ndirfd, VIRTFS_META_DIR, 0700);
         if (ret < 0 && errno != EEXIST) {
@@ -1310,12 +1316,12 @@ static int local_renameat(FsContext *ctx, V9fsPath *olddir,
         }
 
         omap_dirfd = openat_dir(odirfd, VIRTFS_META_DIR);
-        if (omap_dirfd == -1) {
+        if (omap_dirfd == P9_INVALID_FILE) {
             goto err;
         }
 
         nmap_dirfd = openat_dir(ndirfd, VIRTFS_META_DIR);
-        if (nmap_dirfd == -1) {
+        if (nmap_dirfd == P9_INVALID_FILE) {
             close_preserve_errno(omap_dirfd);
             goto err;
         }
@@ -1373,7 +1379,7 @@ static int local_unlinkat(FsContext *ctx, V9fsPath *dir,
                           const char *name, int flags)
 {
     int ret;
-    int dirfd;
+    P9_FILE_ID dirfd;
 
     if (ctx->export_flags & V9FS_SM_MAPPED_FILE &&
         local_is_mapped_file_metadata(ctx, name)) {
@@ -1382,7 +1388,7 @@ static int local_unlinkat(FsContext *ctx, V9fsPath *dir,
     }
 
     dirfd = local_opendir_nofollow(ctx, dir->data);
-    if (dirfd == -1) {
+    if (dirfd == P9_INVALID_FILE) {
         return -1;
     }
 
diff --git a/hw/9pfs/9p-util-darwin.c b/hw/9pfs/9p-util-darwin.c
index 95146e7354..c509034fb2 100644
--- a/hw/9pfs/9p-util-darwin.c
+++ b/hw/9pfs/9p-util-darwin.c
@@ -11,8 +11,8 @@
 #include "qemu/error-report.h"
 #include "9p-util.h"
 
-ssize_t fgetxattrat_nofollow(int dirfd, const char *filename, const char *name,
-                             void *value, size_t size)
+ssize_t fgetxattrat_nofollow(P9_FILE_ID dirfd, const char *filename,
+                             const char *name, void *value, size_t size)
 {
     int ret;
     int fd = openat_file(dirfd, filename,
@@ -25,7 +25,7 @@ ssize_t fgetxattrat_nofollow(int dirfd, const char *filename, const char *name,
     return ret;
 }
 
-ssize_t flistxattrat_nofollow(int dirfd, const char *filename,
+ssize_t flistxattrat_nofollow(P9_FILE_ID dirfd, const char *filename,
                               char *list, size_t size)
 {
     int ret;
@@ -39,7 +39,7 @@ ssize_t flistxattrat_nofollow(int dirfd, const char *filename,
     return ret;
 }
 
-ssize_t fremovexattrat_nofollow(int dirfd, const char *filename,
+ssize_t fremovexattrat_nofollow(P9_FILE_ID dirfd, const char *filename,
                                 const char *name)
 {
     int ret;
@@ -52,8 +52,8 @@ ssize_t fremovexattrat_nofollow(int dirfd, const char *filename,
     return ret;
 }
 
-int fsetxattrat_nofollow(int dirfd, const char *filename, const char *name,
-                         void *value, size_t size, int flags)
+int fsetxattrat_nofollow(P9_FILE_ID dirfd, const char *filename,
+                         const char *name, void *value, size_t size, int flags)
 {
     int ret;
     int fd = openat_file(dirfd, filename, O_PATH_9P_UTIL | O_NOFOLLOW, 0);
@@ -110,7 +110,7 @@ out:
     return err;
 }
 
-int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t dev)
+int qemu_mknodat(P9_FILE_ID dirfd, const char *filename, mode_t mode, dev_t dev)
 {
     int preserved_errno, err;
 
diff --git a/hw/9pfs/9p-util-linux.c b/hw/9pfs/9p-util-linux.c
index db451b0784..cb5e988354 100644
--- a/hw/9pfs/9p-util-linux.c
+++ b/hw/9pfs/9p-util-linux.c
@@ -19,8 +19,8 @@
 #include "qemu/xattr.h"
 #include "9p-util.h"
 
-ssize_t fgetxattrat_nofollow(int dirfd, const char *filename, const char *name,
-                             void *value, size_t size)
+ssize_t fgetxattrat_nofollow(P9_FILE_ID dirfd, const char *filename,
+                             const char *name, void *value, size_t size)
 {
     char *proc_path = g_strdup_printf("/proc/self/fd/%d/%s", dirfd, filename);
     int ret;
@@ -30,7 +30,7 @@ ssize_t fgetxattrat_nofollow(int dirfd, const char *filename, const char *name,
     return ret;
 }
 
-ssize_t flistxattrat_nofollow(int dirfd, const char *filename,
+ssize_t flistxattrat_nofollow(P9_FILE_ID dirfd, const char *filename,
                               char *list, size_t size)
 {
     char *proc_path = g_strdup_printf("/proc/self/fd/%d/%s", dirfd, filename);
@@ -41,7 +41,7 @@ ssize_t flistxattrat_nofollow(int dirfd, const char *filename,
     return ret;
 }
 
-ssize_t fremovexattrat_nofollow(int dirfd, const char *filename,
+ssize_t fremovexattrat_nofollow(P9_FILE_ID dirfd, const char *filename,
                                 const char *name)
 {
     char *proc_path = g_strdup_printf("/proc/self/fd/%d/%s", dirfd, filename);
@@ -52,8 +52,8 @@ ssize_t fremovexattrat_nofollow(int dirfd, const char *filename,
     return ret;
 }
 
-int fsetxattrat_nofollow(int dirfd, const char *filename, const char *name,
-                         void *value, size_t size, int flags)
+int fsetxattrat_nofollow(P9_FILE_ID dirfd, const char *filename,
+                         const char *name, void *value, size_t size, int flags)
 {
     char *proc_path = g_strdup_printf("/proc/self/fd/%d/%s", dirfd, filename);
     int ret;
@@ -64,7 +64,7 @@ int fsetxattrat_nofollow(int dirfd, const char *filename, const char *name,
 
 }
 
-int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t dev)
+int qemu_mknodat(P9_FILE_ID dirfd, const char *filename, mode_t mode, dev_t dev)
 {
     return mknodat(dirfd, filename, mode, dev);
 }
diff --git a/hw/9pfs/9p-xattr.c b/hw/9pfs/9p-xattr.c
index 9ae69dd8db..aaa364ea4a 100644
--- a/hw/9pfs/9p-xattr.c
+++ b/hw/9pfs/9p-xattr.c
@@ -78,13 +78,13 @@ ssize_t v9fs_list_xattr(FsContext *ctx, const char *path,
     char *orig_value, *orig_value_start;
     ssize_t xattr_len, parsed_len = 0, attr_len;
     char *dirpath, *name;
-    int dirfd;
+    P9_FILE_ID dirfd;
 
     /* Get the actual len */
     dirpath = g_path_get_dirname(path);
     dirfd = local_opendir_nofollow(ctx, dirpath);
     g_free(dirpath);
-    if (dirfd == -1) {
+    if (dirfd == P9_INVALID_FILE) {
         return -1;
     }
 
@@ -168,11 +168,11 @@ ssize_t local_getxattr_nofollow(FsContext *ctx, const char *path,
 {
     char *dirpath = g_path_get_dirname(path);
     char *filename = g_path_get_basename(path);
-    int dirfd;
+    P9_FILE_ID dirfd;
     ssize_t ret = -1;
 
     dirfd = local_opendir_nofollow(ctx, dirpath);
-    if (dirfd == -1) {
+    if (dirfd == P9_INVALID_FILE) {
         goto out;
     }
 
@@ -196,11 +196,11 @@ ssize_t local_setxattr_nofollow(FsContext *ctx, const char *path,
 {
     char *dirpath = g_path_get_dirname(path);
     char *filename = g_path_get_basename(path);
-    int dirfd;
+    P9_FILE_ID dirfd;
     ssize_t ret = -1;
 
     dirfd = local_opendir_nofollow(ctx, dirpath);
-    if (dirfd == -1) {
+    if (dirfd == P9_INVALID_FILE) {
         goto out;
     }
 
@@ -223,11 +223,11 @@ ssize_t local_removexattr_nofollow(FsContext *ctx, const char *path,
 {
     char *dirpath = g_path_get_dirname(path);
     char *filename = g_path_get_basename(path);
-    int dirfd;
+    P9_FILE_ID dirfd;
     ssize_t ret = -1;
 
     dirfd = local_opendir_nofollow(ctx, dirpath);
-    if (dirfd == -1) {
+    if (dirfd == P9_INVALID_FILE) {
         goto out;
     }
 
-- 
2.25.1


