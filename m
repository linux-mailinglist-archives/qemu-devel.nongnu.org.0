Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E3A680A0A
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 10:55:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMQqD-0002xY-SA; Mon, 30 Jan 2023 04:52:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=13943e2a21=bin.meng@windriver.com>)
 id 1pMQqA-0002wo-Oc
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 04:52:42 -0500
Received: from mx0a-0064b401.pphosted.com ([205.220.166.238])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=13943e2a21=bin.meng@windriver.com>)
 id 1pMQq7-0001zl-GN
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 04:52:42 -0500
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30U9hjuC015618; Mon, 30 Jan 2023 01:52:24 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=Xy/0/TnZzqrfJjp7JG4s8BGGuRiy5TjlmKMjhpcBLTA=;
 b=H75mkmO0gmaJdkIwRGH2iBhwRHwocM9nUJx6+gBaj6tlCYtGWZQkZA5zyJS2Yjyhgtx6
 e6sO0CdpWpK2LS9cAgkuVwJOGezHmVOH0FFb92WfVYCIr8nLZGO525xw7d1fwXCjzmBA
 06+MnB0g2DBOu0U/+EtxJY3Abgxir0Bg0y3gDbqryafWxXYVToztu8N3g+VROxxhrfVh
 QrdUgYCGCfvTjXuNOsECxIUgRN1krccGIu+wwcuRiIhIghxheQ82f0ECBCCbJKliBWGx
 K9SBqEbp6+N6RvreQsNWWXrzZYGxklRhD00nxBBOVJcrl+2ZI/Oxr6LNT9xE+e/grSFz IA== 
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam04lp2046.outbound.protection.outlook.com [104.47.74.46])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nd43rhj5h-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Jan 2023 01:52:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hX7tQeOpmAbFUwUJhMg8Y+4yzXlqWx9ctxH1ck0eJNrziIrzQQ7sJ+kLfqOXDEg9VJ/YjkwU9v+EKjABxv5b/pQu3oL06g3Z5JXTxwg0IEP8cAcjh+X9Sm8ZUUI07Kom1UQRcSdolIsQiWzSaz3S/0wYXSM07yiMGl9lK2yqEmrhfzo8kLNHwX7NoPptcyACsRWTQa9h73XanAZrYpyjT03fg4ZdpvgWTUErlVz6Bg5t5r0UvEjZwJ9hclpTmltNZkyCSbtrWLC36JkzYxP71ZQr4pggJU27k3pUA4sUzgQj65pnbjGtQVJV6F7PpIAW+idGMb9zbwNk/lWFYtlk8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xy/0/TnZzqrfJjp7JG4s8BGGuRiy5TjlmKMjhpcBLTA=;
 b=JtpV5BbtNdsKyEaQ4Fi7rpcCzm8/e2rBboj/+0/QRP4qoHhGc0H8LUaneqV4s6kDR0Z8XWsCVHCJ+nodfBnlXmq2FlteIdxUQ++BQaF1+tU96E5OtaO1uiMB+nWN1hkoeKB8B7E/kWELoLyY8zEDFT1Abg2WlLlVkg9VIWlHKmsvyzodOYKKsVtNZ9XPj4Dkc0IXzkotXZziOXg7OXLbwgeoLVzXdy/7JRNs6u1YBsHgCePAsfjprL4PBGIFk1eQ18uXRjKv2bT4xeRFXF4McSgY9AxO1p/7QTHH5S6dg57ly+p5BcNvcMB81z+wjk8L/STSkqUzHnUNHzWkA9MyxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5358.namprd11.prod.outlook.com (2603:10b6:5:395::7) by
 SJ0PR11MB6573.namprd11.prod.outlook.com (2603:10b6:a03:44d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36; Mon, 30 Jan
 2023 09:52:21 +0000
Received: from DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::6c5d:5b92:1599:ce9]) by DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::6c5d:5b92:1599:ce9%2]) with mapi id 15.20.6043.036; Mon, 30 Jan 2023
 09:52:21 +0000
From: Bin Meng <bin.meng@windriver.com>
To: Greg Kurz <groug@kaod.org>, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 qemu-devel@nongnu.org
Cc: Guohuai Shi <guohuai.shi@windriver.com>
Subject: [PATCH v4 01/16] hw/9pfs: Add missing definitions for Windows
Date: Mon, 30 Jan 2023 17:51:47 +0800
Message-Id: <20230130095202.2773186-2-bin.meng@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230130095202.2773186-1-bin.meng@windriver.com>
References: <20230130095202.2773186-1-bin.meng@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR02CA0061.namprd02.prod.outlook.com
 (2603:10b6:a03:54::38) To DM4PR11MB5358.namprd11.prod.outlook.com
 (2603:10b6:5:395::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5358:EE_|SJ0PR11MB6573:EE_
X-MS-Office365-Filtering-Correlation-Id: 19d35270-791a-4c00-c27a-08db02a7ae5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2sPP+oKCynG+jhp8oRJ8ZCQ50boIhZkPB4DYFKf2gCleKWnCAGbnwErhz5GIw2o2sTLAVCD21fZ4p0z1TOq6eRc5yJKs3aM4haNBLs1XqQDckR267IYWajVqi76rAkNddnqmGSgSwjQGW219PauieB++7l30wb4IJ/xCi4ZiTRoRGP9tKzFhyJkLbk83uNw4FTKqO3tYbeVyvVbr/gW/DpomGQIxNTOFKCem/2tcNz+egxmcY87Swn950g1jbG5aRh8AxhsCK8F5XxxQAqWp1cvbIYKH/AoOEypUQmsTAxp7b2ZT/zDFeQtTwgKWk9IZqVcelwNJLPrVzPJzDC3ECxzqy9yX4h1MUbwE2bY2gWGmY3YxOj5TeVG0iSuu2lrPR0TunkAESm0ibcvlSNuMxQT3CHoNisCWgJc1oj5VOJy2a4DrY1mquXdsAcymqkgXFYH0smmCAx3WmWtQHC8ISVKSU98gGTG6fmjbZOVu5HIOQsQYJwzGODGIz6fkcCMhbeZ/Vjtre2SQzbzAJdpYQ9CxuFydikigLbJAXhFSda/+A6GDMDOLsFszIkPZJ1seGj6FxcqyLMc1b5QdWPICsJElAYYDioL1fx4JZcstE2tYcVvsPH5wSd9OjyWNBj+C0JanlX8EPRrV3EM9WGjIk4QFNdPo2KQtzHF4XpEBo29l8d6VFTU6I0fTz933ipE1sEhIZ0hCMVXxkhSusYOj1QYyGFv143XWdM1J0La2IGM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5358.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(396003)(376002)(136003)(39850400004)(346002)(451199018)(86362001)(38100700002)(38350700002)(478600001)(36756003)(2906002)(110136005)(107886003)(6666004)(52116002)(6486002)(966005)(41300700001)(26005)(8936002)(5660300002)(44832011)(66946007)(316002)(8676002)(4326008)(83380400001)(66556008)(66476007)(6512007)(186003)(1076003)(6506007)(2616005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2ineZShIdvHGjIovamP0qTIwbjGxB1L+eWl1UX6IX7F7lr4vZkDPxrXxFgGP?=
 =?us-ascii?Q?EtmkeaPB6OmH5yZSJ/74rfzQ01AUjE0ClY88ZkTZJqCWxxGptwqlwKyamwre?=
 =?us-ascii?Q?f0XCXupO04HUgG7U6aLe7ZyPsWgMK8ts1gRPWkm0QagF2UZV+dzjtlyUY1SM?=
 =?us-ascii?Q?j4yTDkIWAJDKIpDWl1yHtilbj2URxwhxoQ2oUaTYAUlU4yCIWCTcHrrx5IcI?=
 =?us-ascii?Q?ZHs/pSxYovF7H2kp/mGSZSY0pssWjGo+3FZ7deDFDh46IjSBoPOI3li8aHo0?=
 =?us-ascii?Q?nLtGu1k8PUYRUP0QLFq6LXH42kT6t2KohqtfQjlZAslWsSxmgtWEVPNQzzvW?=
 =?us-ascii?Q?7C08Y8ajR95ZU+jQlgp/ejR9XfzcgB2DR2LQIpwTu2wR3Ttfz7XOZP1iOjx6?=
 =?us-ascii?Q?IgEu08Z7raDMmbS1PUAXSCt2xoKar2Qi367KV3tqXdprsmZCKdbLjasMZ3sm?=
 =?us-ascii?Q?jqgLqrwe8sx+WnJBHnS4Q7dMgwshXGyR8UahVLq4k6vaAFr3Sifs8S+ifkC1?=
 =?us-ascii?Q?n2YBxLsj4i58iN3Ce4B4U7z3B9Al4+S36FAT9ZM2uta/ri0jrcetKHtZ6504?=
 =?us-ascii?Q?iXvioSdn0fHRAHI2Xrq+BcQLypYSzBHFTGmVdgpo9cB8xtTzXIAWcLBT4gXz?=
 =?us-ascii?Q?ds1eUIe4id2bKHqMQDRXYpORDf6bwcuJtY0DjWOymcRI4T2aVNnSQ9AgCXoY?=
 =?us-ascii?Q?wYPqRl6FeICZ02Si2T1a6AsckbiyFsGaugBGI+7gYsgGDBrLQaah150ZJgkF?=
 =?us-ascii?Q?YAmzI7huePzVcsAScUlr9zF5dxkF3TS7LoPuU7O/V3PR9M2PYQ8W2o+hpTZm?=
 =?us-ascii?Q?7uMUiiOybbJ7xMRdbjw5q+aCMaEfmeVmtgtEFLpJz7T9AU0r3+/o8DhY8u/4?=
 =?us-ascii?Q?jjIHAzwLnnMOd1XxIqlOQ6zf+TFU0QuYV+vne0u3+O0UiRc4aLScvdDs1R4k?=
 =?us-ascii?Q?kNqCEi/8Wm8w0TANCI9Xf8+mSQiiPsdmE8VJx7rno2c/AsHXBNvGl329T/a+?=
 =?us-ascii?Q?w5LlQqln4SsWt15a1ArpzmxleSnIxTrUHjK+1425SA8X0wKxM6FBnRNrSbId?=
 =?us-ascii?Q?Xk0op/p8/aDBpZMnZtgcSyDLGZRBbRfIbXRRTrFWV+0K6frSzzs1/IutNK00?=
 =?us-ascii?Q?hCYgCfAwswa1eYMoiUzLH6Nj1119jmK5dktpnNtbxQmiKMY7KaOjq3xSwTFK?=
 =?us-ascii?Q?iU8i8ozg1EwQxmefVB1Dh2CC+FTrAFw4PunWsL0SsgY66XPFwZ8L52OUjayT?=
 =?us-ascii?Q?juxNFzlw2kgUAqyNkV7QtFAK1ImRESA12Y4vDHXOcDa5HieLcEplsfGjQ25k?=
 =?us-ascii?Q?s3z8zPGFLYpJLVRmTezZCwgFpPhhBTIWfos+DrIpWs1d5byWp+StS+paM6Yl?=
 =?us-ascii?Q?CDuHLWh7r8/3QaFLCgaRL61r0PjkOzJZNjAqGP/rJDi9LZ0mRlVOTlmrthpI?=
 =?us-ascii?Q?+DP8504Mlun/qUPtUVnP7etwBf6qnYqv+w7PaTlDD2jDQ1oEJhn/NkklNNat?=
 =?us-ascii?Q?RTHtqhw/h6E5Wi0DQnEs0yK1ZnBNkxxKQQIkpiDrsnS2epV+9Hhr1ltDblPb?=
 =?us-ascii?Q?cwIJg+AUqUpJR21NdDJ8QonnvlJIaaQxoRpOdSmj9vHeWTdpQoPAczb8iBeT?=
 =?us-ascii?Q?NQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19d35270-791a-4c00-c27a-08db02a7ae5e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2023 09:52:21.4746 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J692MswqOVHd3tBUTQJMf2bccq4MOfFyTE9tQYfZZbCqhk7pZTwcIt2pDOWMJ74QxU3EYCslQQFry6gjnC3haQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6573
X-Proofpoint-ORIG-GUID: 1ybrlnIfEigmWLG7rkGvIsin7zyMc9Y2
X-Proofpoint-GUID: 1ybrlnIfEigmWLG7rkGvIsin7zyMc9Y2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-30_09,2023-01-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 mlxlogscore=748
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301300094
Received-SPF: pass client-ip=205.220.166.238;
 envelope-from=prvs=13943e2a21=bin.meng@windriver.com;
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


