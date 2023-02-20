Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D87D69C858
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 11:13:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU36R-0007z0-Iu; Mon, 20 Feb 2023 05:08:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1415163841=bin.meng@windriver.com>)
 id 1pU36O-0007wP-FB
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 05:08:56 -0500
Received: from mx0a-0064b401.pphosted.com ([205.220.166.238])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1415163841=bin.meng@windriver.com>)
 id 1pU36L-0008TK-0z
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 05:08:55 -0500
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31K8wx9d029409; Mon, 20 Feb 2023 02:08:33 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=Xy/0/TnZzqrfJjp7JG4s8BGGuRiy5TjlmKMjhpcBLTA=;
 b=ReS50mlgw+CtluUV3LDudoPljMRu5eLL8KVmv+0O1SZWE3oKZU5EdobDh8bom6zF6o97
 XCPYp7Uxr2MtR83/Ftcg7ymlLcYFMo+fKuuTrWXFFqB+NZe7qYcRRjno1L2kyJYKXg3R
 NyJunnGEXm+b+CDIzm0A2ewA4pkTEE1Hhsdwjw/ptsdPl1QoXoXTTZOmbkk/hDkmB3B6
 IboBTsSn0kDTyzju0yC93r0HipR/Kb0K2u+LfLf0bOMKulTfKHr4ruiM8kxm7GRMUcfx
 6SJZ1yQV/2cc0T0qneL538G1oM94T3daLLhwkl2ukjncqsJE94CU4rxewSstyHNfXJ0S Bw== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2173.outbound.protection.outlook.com [104.47.59.173])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nttu6sfs3-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Feb 2023 02:08:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iH2yxUWtD5Cnzyc3KoEVKRqteASwPdgF97rIHylTkTm/+jhNW1p5eDaALMt9URF4/By/j75fs7reaZwVFKDG08PWU654dI9bYfcYqWXk2H5U2l1mL7mOb5INw6nMsYC6L8uEFzx881ZZoQ/y96LcVLL4rxaHUwa4BWe9Y9roblWGAnbzYS2Fnh1bPf9h0oy1FGQGjbGg7vTy2umTUybTJS5EQuVRDzMr+a+/+itCjSO7T2MrutW02HEIpqN3P4DigDv+TUjm8LjX5zwLd49rVnC1BF7V6B73DhXyzBftzpnx4KbjQ5PPiiX6hznrvTMsdkp0RUj67wSo+vXPSY43zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xy/0/TnZzqrfJjp7JG4s8BGGuRiy5TjlmKMjhpcBLTA=;
 b=YtcqGV1Hy0blXY6LwEtK/R4Kyg4sHNXogKmsCEDEX4eJmKp+YTSm57+oTC28h2JscWdVl3BzYNkJ26P/uRxFLho0NVnWWKS1WPIHWV0Da5bURQQ8c8DE1QKU1kMojWdgCkpw6BN5IiH6kPtPpVQzvxdt5IVHopRiwEs5gvKr3dO973MjmTG2EUyKLHNg80s/tb0WoU2N2YnxT3xXIHjVqPDUFhpklQ84I9MmcSdpGS6/wV9+/PQDlbQfV8TK6j3fTtxtYA62nGq7DT3/nYBSmDdYPBWKD/F49mDt5bZr6ZqnOxjoQwoyr2yQ5usP/ecGrw97u0/z+bxFDgqAmy3hsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5358.namprd11.prod.outlook.com (2603:10b6:5:395::7) by
 SA2PR11MB5066.namprd11.prod.outlook.com (2603:10b6:806:110::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6111.19; Mon, 20 Feb 2023 10:08:32 +0000
Received: from DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::6c5d:5b92:1599:ce9]) by DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::6c5d:5b92:1599:ce9%4]) with mapi id 15.20.6111.019; Mon, 20 Feb 2023
 10:08:32 +0000
From: Bin Meng <bin.meng@windriver.com>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 qemu-devel@nongnu.org
Cc: Guohuai Shi <guohuai.shi@windriver.com>
Subject: [PATCH v5 01/16] hw/9pfs: Add missing definitions for Windows
Date: Mon, 20 Feb 2023 18:08:00 +0800
Message-Id: <20230220100815.1624266-2-bin.meng@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230220100815.1624266-1-bin.meng@windriver.com>
References: <20230220100815.1624266-1-bin.meng@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0220.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::15) To DM4PR11MB5358.namprd11.prod.outlook.com
 (2603:10b6:5:395::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5358:EE_|SA2PR11MB5066:EE_
X-MS-Office365-Filtering-Correlation-Id: 9aa00de5-f255-4fdf-e597-08db132a6b96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bebMYaIgiif4e0dR61rGXtJLtSpOAnSobeYI8AJixAJuSdHISQc1nDOygHb2FRZ+bIzitWBwxA4r+T1TtPfxgXqJfpP0ejtGTmwG+e6GvdMn6QHBpoxBWqdJsI8i0vsToA5qZUz0c2RxpU5x1R2gkhdM+iwI3XYj65A6eA6oltQ+6omeCxPZWCyyh44r524q8Cq8MJtfpnhpv7Xia/LPDwtJ0tAnYrp+VT+TUMykof8NxqBYeKtPE/aRRQtdMvBwSCo5yPyKOZbD0rBg5rSbXS/OmPgRqzkIHFNnOBct6Q8rJLl2Bs6Ydbs3AEDaLtNwSbJI58lpBzzy6KdeoB/B0ijTiKLA4XJpdaGFZCg9ApJwC8qiVGNdcY1OmQLEf6DOhotF/bcD2xO7W9sCMJZqPJ4HAdg9YGkCXAamNneUaIdzlC/H65UJsoyZjfnVLQv5r+CIez066SI7u37LY0DM5eI9buj8v2ypNFqoxUwuGG00EA4qUVoR3eu8QTXQlD+SUtT6COdsYoHDHPKOdG0EDqkUWiNONn8vCeNxX4q23KBqeItaJIS7XKwiw7k3+OneyR3t2A0jXQrQ7WY+yQdjWoax8VIRhkQyXR6XVfMGaSAKsbxN8GtTkcvGf9EsS2NfFqsH5IBHYUXEeXUA0ofcSjMqSgmLC2ymuW6w5R1VInPsgWhTwCDvJ/ePfDjoZ7SB
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5358.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(376002)(366004)(39840400004)(136003)(396003)(451199018)(2616005)(4326008)(66556008)(8676002)(66946007)(83380400001)(66476007)(5660300002)(8936002)(6506007)(6486002)(966005)(107886003)(6666004)(1076003)(6512007)(26005)(186003)(52116002)(36756003)(478600001)(110136005)(316002)(41300700001)(38100700002)(44832011)(38350700002)(86362001)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?M5scc2bkTxop1sjdm/BelKGLpFJhEHY3Z+pzvG/Qw/FAzURYv5so/OPgZ0XO?=
 =?us-ascii?Q?hn7Sf7ejhk1dgGIRLSMuu5mQUBMb3rD5oOKXiI+kIH09V431uTcQFOd1XY6N?=
 =?us-ascii?Q?c534fMzOchNhD4wdk1euoS2HjFgLUQieOGgg5YhSU5vguIqfhU8sX1kCBpqy?=
 =?us-ascii?Q?FGtSnrUzosnT0JV/0UskqohhcB6H+MQgzh+unAglvmiuGHY7nXb1iX/d5LKd?=
 =?us-ascii?Q?kVlKZaKZRhNNHvoUWYlYxxTI0fgN414OO8Le4rADjjeneczt2zLkUhuqPZG3?=
 =?us-ascii?Q?DcHid2jYayJJbRhtGBDzgOCUP+EIhUtTquRAMzZTfAGS7FLYKneUYYp0mmst?=
 =?us-ascii?Q?8lqAdzseviPT8voaGD75uo4bNTlMpa9JaRXOd/o/j/Iy/gfplT4v5NqobTSN?=
 =?us-ascii?Q?1ztTyNtlK/O8cUNsK+ncAMcgv1m5ERh25VczGxX4SfFSObiYrKbKyB7M1uYu?=
 =?us-ascii?Q?438a5jtI8QuZAKYdwLKERQSI0Ad/AEWNUyrs0RqLzPKBWtyMfmMmX1n1xmv0?=
 =?us-ascii?Q?6Nt2b7I4dmCY0uPOQ2qTpBIDZAIvy0Sx8zQS8x3VUjJlFDD5J/UAJhNDu+ek?=
 =?us-ascii?Q?nDl6QWLzhcJS5WEWiNq6A/anPVtQ009TYPgW6UlcM8/uiSEahRsAU2beaYEh?=
 =?us-ascii?Q?/XUpA8O8iRfkIv28QLCb7lpqBOvaZ9UByNGj4g+UsvXmDf6IMdW69vy24Jm4?=
 =?us-ascii?Q?b4zBAF9P5NUK6JX7vdcSjedvyJI/pIIPMy3k7iDyRzKambFtlFw/Y61qO71f?=
 =?us-ascii?Q?Nqv52NTRZhx2HH3TRO0uZgmOKE1FrW8FtvScL5cso/1ka2EBmSFF/4SamNRv?=
 =?us-ascii?Q?sJXMGBzSqLtb2861pbFJdytTKqYlOf91RxcWcS0/X2R/5WrvvlpMcHbUBeR1?=
 =?us-ascii?Q?q5SakGdgSxLjD0c5Yei97hrrRw9HLpb+YTmmlDKCq/SaviyqNhPor2AqAsj/?=
 =?us-ascii?Q?U4/y9wLW1rDHjToH2buM6zELZPRijaaJ1cJdYDMdKO0KQq8JtID8mkkXPwye?=
 =?us-ascii?Q?oiCZJY/RjrcL7zvkfrf0ERo7gLNO1k09zcNItXV3iMcm0Jpi4UDmhzdLjFw/?=
 =?us-ascii?Q?lfsmFil4SCZkWdx66cs49EqxGoNJ61LkDbRT37CStX+0ef8hS4Dg7YX2w4eX?=
 =?us-ascii?Q?si9CdHGFjLxUrCEnRrohnI2UlLDS1s3P5aDYMuRpC7YJK0kNK4Bwx4D0JtZa?=
 =?us-ascii?Q?lS6+6Vb47I0MkiQbeVEbXp7MYIGTQwWoRT9TPD2HUl993SttlzePQMD7KBqH?=
 =?us-ascii?Q?XbinqZUrRHTkW9Y95MezgjIEFXC0fFgrpIiuyV3Kw0Xuf+vP8C0tnuynjCCV?=
 =?us-ascii?Q?bHl08c59urIWiAZX6jYI5qpknTpApBvkK9M7WEDhgWKEIaGv1+Qhe64Hz03g?=
 =?us-ascii?Q?TuKAsKDRAKxQN4g4Y8qK62pvrGsJZszIZbGmDVrGG6iekn00pMTFwpxDPBQG?=
 =?us-ascii?Q?bQfNrUVkvH+aba7aPluPXJQezMHhA5MkaEJ6ZOWMVsWVnUwF9ujU4jrKrnZC?=
 =?us-ascii?Q?z6CwW5qI5CiTn6B8nydJmx7Q+ChFpaDU9ZUzgeoOR9zzcphKIHOuBwAsfS+B?=
 =?us-ascii?Q?JvF9izN3MgdzMoVzAXIECRUdl3lwVJPjjR5TKtX+bArAXhceaSrvWtaQgrWd?=
 =?us-ascii?Q?ag=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9aa00de5-f255-4fdf-e597-08db132a6b96
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2023 10:08:32.0943 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jFoD36Gh2m87df3gwsSz9oef+1EPjCp9JT5dNo4u2NrWMyu/crT6j/w+e8aPRlVxJXubDUlbDbj+3PAK6c1VwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5066
X-Proofpoint-ORIG-GUID: 9qgRexscISjMVtL7wNdw5Xt5ercsVgo0
X-Proofpoint-GUID: 9qgRexscISjMVtL7wNdw5Xt5ercsVgo0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-20_08,2023-02-17_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 impostorscore=0 clxscore=1015 mlxlogscore=819 mlxscore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 adultscore=0 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2302200091
Received-SPF: pass client-ip=205.220.166.238;
 envelope-from=prvs=1415163841=bin.meng@windriver.com;
 helo=mx0a-0064b401.pphosted.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Guohuai Shi <guohuai.shi@windriver.com>

Some definitions currently used by the 9pfs codes are only available
on POSIX platforms. Let's add our own ones in preparation to adding
9pfs support for Windows.

Signed-off-by: Guohuai Shi <guohuai.shi@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 fsdev/file-op-9p.h | 33 +++++++++++++++++++++++++++++++++
 hw/9pfs/9p.h       | 43 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 76 insertions(+)

diff --git a/fsdev/file-op-9p.h b/fsdev/file-op-9p.h
index 4997677460..7d9a736b66 100644
--- a/fsdev/file-op-9p.h
+++ b/fsdev/file-op-9p.h
@@ -27,6 +27,39 @@
 # include <sys/mount.h>
 #endif
 
+#ifdef CONFIG_WIN32
+
+/* POSIX structure not defined in Windows */
+
+typedef uint32_t uid_t;
+typedef uint32_t gid_t;
+
+/* from http://man7.org/linux/man-pages/man2/statfs.2.html */
+typedef uint32_t __fsword_t;
+typedef uint32_t fsblkcnt_t;
+typedef uint32_t fsfilcnt_t;
+
+/* from linux/include/uapi/asm-generic/posix_types.h */
+typedef struct {
+    long __val[2];
+} fsid_t;
+
+struct statfs {
+    __fsword_t f_type;
+    __fsword_t f_bsize;
+    fsblkcnt_t f_blocks;
+    fsblkcnt_t f_bfree;
+    fsblkcnt_t f_bavail;
+    fsfilcnt_t f_files;
+    fsfilcnt_t f_ffree;
+    fsid_t f_fsid;
+    __fsword_t f_namelen;
+    __fsword_t f_frsize;
+    __fsword_t f_flags;
+};
+
+#endif /* CONFIG_WIN32 */
+
 #define SM_LOCAL_MODE_BITS    0600
 #define SM_LOCAL_DIR_MODE_BITS    0700
 
diff --git a/hw/9pfs/9p.h b/hw/9pfs/9p.h
index 2fce4140d1..ada9f14ebc 100644
--- a/hw/9pfs/9p.h
+++ b/hw/9pfs/9p.h
@@ -3,13 +3,56 @@
 
 #include <dirent.h>
 #include <utime.h>
+#ifndef CONFIG_WIN32
 #include <sys/resource.h>
+#endif
 #include "fsdev/file-op-9p.h"
 #include "fsdev/9p-iov-marshal.h"
 #include "qemu/thread.h"
 #include "qemu/coroutine.h"
 #include "qemu/qht.h"
 
+#ifdef CONFIG_WIN32
+
+/* Windows does not provide such a macro, typically it is 255 */
+#define NAME_MAX            255
+
+/* macros required for build, values do not matter */
+#define AT_SYMLINK_NOFOLLOW 0x100   /* Do not follow symbolic links */
+#define AT_REMOVEDIR        0x200   /* Remove directory instead of file */
+#define O_DIRECTORY         02000000
+
+#define makedev(major, minor)   \
+        ((dev_t)((((major) & 0xfff) << 8) | ((minor) & 0xff)))
+#define major(dev)  ((unsigned int)(((dev) >> 8) & 0xfff))
+#define minor(dev)  ((unsigned int)(((dev) & 0xff)))
+
+/*
+ * Currenlty Windows/MinGW does not provide the following flag macros,
+ * so define them here for 9p codes.
+ *
+ * Once Windows/MinGW provides them, remove the defines to prevent conflicts.
+ */
+
+#ifndef S_IFLNK
+#define S_IFLNK         0xA000
+#define S_ISLNK(mode)   ((mode & S_IFMT) == S_IFLNK)
+#endif /* S_IFLNK */
+
+#ifndef S_ISUID
+#define S_ISUID         0x0800
+#endif
+
+#ifndef S_ISGID
+#define S_ISGID         0x0400
+#endif
+
+#ifndef S_ISVTX
+#define S_ISVTX         0x0200
+#endif
+
+#endif /* CONFIG_WIN32 */
+
 enum {
     P9_TLERROR = 6,
     P9_RLERROR,
-- 
2.25.1


