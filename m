Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20278625275
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 05:25:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otLZZ-0000Vo-J4; Thu, 10 Nov 2022 23:23:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=83144312e2=bin.meng@windriver.com>)
 id 1otLZX-0000Ul-9W
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 23:23:19 -0500
Received: from mx0b-0064b401.pphosted.com ([205.220.178.238])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=83144312e2=bin.meng@windriver.com>)
 id 1otLZU-0001ZD-S1
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 23:23:19 -0500
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AB4N0iO024928; Fri, 11 Nov 2022 04:23:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=gNc9mXTr/EyEiKJ6AiSyzYNMP3zaIbsnD4BKi7tOfKg=;
 b=OA4f54ZJNXVphr9gAkN5CFtbCc0kd34MBKipyc4lPFYd4Ey1Aq5fz6ZB9TAHLatoMRnp
 YjrgCx5UkM0Pu061JyvNI5A/KMq2VY0zbh2zZFhZg7dmN0SVkQx3VcLbsej3T2n1KIor
 xw80BHmLQR5/bpO0ilIWyta+082Rv9pnCpSXnBL22JSMMobNEvfTdso0zmtYGNKYZZL7
 mbiYIVXmjZybRN29kNhJJhzYLcQWVkiR2MGvSAADq3NakDSifp78Uj55NQYLuBbwtgB7
 3nigQYCVGsaYP3+8yxTFxVgjjpfG0ctUW/uNsoQlIjPVEWLyIdBFFsrzlraZr6BlEWOP jA== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2103.outbound.protection.outlook.com [104.47.70.103])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3knd21ndvc-6
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Nov 2022 04:23:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ha7PXRpeAla0Z1aYm58TKqGZjuLT2fWHrMDCDjYQWx/M6cZ9iAChauy+ROXMjUiBCZqe4J/LyfOLwwsFv6qs45zQVitzn2OAPKPT1HqaETPdJ37R435zBcSHW7GNhu9vbuHQ/TMsuEwclzIqFtWcg5lqqzHqK7swTgpL09pcIJ3JTJvsA8qUYreYhbyrlz34WLnaLOX+ibE+b7FOnGru1pxy0QmKv1huuHVd75wDFB333vDmY/8JFMIyYOWcp0xzfrn6Ai9RBLdaX/EsbvXFXDPOeVqIv728Yx5rNFAENVyZTQ+qTgB/LvRnTvBqc9J0CGqJn21JGKL3+Gmz+IMaCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gNc9mXTr/EyEiKJ6AiSyzYNMP3zaIbsnD4BKi7tOfKg=;
 b=JepxFwEjeXkvwxqBqxbXMWXXe3EMmlCLVD7C9OZO0bO37+OoFA23+M/X/7XnmhYO00poHbehXGbEb+X1zKhlXg18Kfl3zSyzntSC9Iv0c9H2+CWiF1q8r/mODd1nZDztPvyz90iG1BuBXTTLvLjY4iWOFWdHIscCL82i3ELnhOgOVDBU5TLHaS15W8uJSWqXiiKmzCZNS7eI61+Fx96yyOPuOF1z+DwQPuaUuqhxTdtAEzEbZyoLJVOanWg+d/6MjQ52WZgy03YdD//bij4E6E6VVJcbIzgx4shKQT/FXq6ZqxcGorBh9wipCLMkRuXYz0vQHTv8DtE9+tyQzY52VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5358.namprd11.prod.outlook.com (2603:10b6:5:395::7) by
 SJ0PR11MB5102.namprd11.prod.outlook.com (2603:10b6:a03:2ac::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27; Fri, 11 Nov
 2022 04:22:59 +0000
Received: from DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::8e5e:71da:1e29:bc15]) by DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::8e5e:71da:1e29:bc15%5]) with mapi id 15.20.5813.013; Fri, 11 Nov 2022
 04:22:58 +0000
From: Bin Meng <bin.meng@windriver.com>
To: qemu-devel@nongnu.org
Cc: Guohuai Shi <guohuai.shi@windriver.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>
Subject: [PATCH v2 06/19] hw/9pfs: Add missing definitions for Windows
Date: Fri, 11 Nov 2022 12:22:12 +0800
Message-Id: <20221111042225.1115931-7-bin.meng@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221111042225.1115931-1-bin.meng@windriver.com>
References: <20221111042225.1115931-1-bin.meng@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0138.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1::17) To DM4PR11MB5358.namprd11.prod.outlook.com
 (2603:10b6:5:395::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5358:EE_|SJ0PR11MB5102:EE_
X-MS-Office365-Filtering-Correlation-Id: 5398c00b-8bfa-4718-c69c-08dac39c6a0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ufM0HiCE4ndWHvwNR9DrnZmBewCVRGwQvZAxKM0Vs/P66EbGwQhPC83ruxPZ6gz3h+frAFVLSEZ5buIbrMyXsWs72OYIfOk1UzukNGlUXB0BnHXQC6LnY71rSD8cslQDgtGbSNb8SAdFjopOFPX3fD4Qcpm3KgPJfaJJl4TW5w6DC8ipFkmvkq+K984PtWg0NqbmDIYsGKSRPWdK24VLIzHgeljtoTreQGPIkILFdjwjLtlM1VD9N9PVCoXFywRsIBZbsMELSUC4rFHu3+NsQzZYIUeUBSSW2S13JzWYhF8y4p/aA4q1u5xaiBRLDYgcwSJ5lDXgSfiHVzhYVx81sfGBzp4apNxhWUOYdf8iE39NgWNFfHqr13sFNeJnXHzNWRedKJ7JkTPgJ1dFY1UTF52PN8eO4tsPLsbQenf0eZ6MgBLuYrzTqt5bHSn+1uhrzbUjqCp2al9d+ZNLT4AKE2nR2vEW1EcNN7nFL4XxNhASYPTFhKPNb3ZmqM01IjxBQNDJ8fx/ThThHrm5yncBaleQ1KHmET6ALm0sMFHT6fEs5AtTGQF1yLjFMic7LIBWd5r7iAhAoOykOBQnl35ystsuel8uhNirkCoMsT9Y5YGJSEhZdK3WDiz2dzvyAo26GdsZFXkaAKCX5Kne8BTcncH/aLj0UkXYB2925l8AaMsSEBDmDyXvmwczB9MtGhQfteXFcLHsdg6TqnTolqpK3XsPPYSLvNArcsEqRs0OOmdFcOqZ8VNHfbYhjJBTbeiJYNHGeEUYVcabJFZxSg2IH7sn7LcRtHO6FT3Ek1B9/SM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5358.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(346002)(376002)(39850400004)(366004)(136003)(451199015)(66556008)(316002)(86362001)(8676002)(66476007)(66946007)(4326008)(38350700002)(38100700002)(36756003)(44832011)(83380400001)(966005)(52116002)(6512007)(2616005)(1076003)(26005)(6506007)(478600001)(6666004)(186003)(6486002)(8936002)(41300700001)(6916009)(2906002)(54906003)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZFiYL+H/o1Zv8Ywfl/Jz7HT2tUP/1Wp+/35BFTVg/ISwYKYbrWgF6Dh9Eue4?=
 =?us-ascii?Q?T+/YbVm9DjSBT0d/2DVHXFkpba+MLipXCD4fYKJeN7zh1CwWxLWmpFqftoXC?=
 =?us-ascii?Q?rzxT2DtGhGSNyGSEyUVNfiodpwpJitcMEmKequJJpPkjKP+LbejtL3zFLrHk?=
 =?us-ascii?Q?WbGpIgT3qTgYpm7Cfad45SIlmvZ4qsVVWATCWZV2sLLmjXigXrVhWo/aXCcV?=
 =?us-ascii?Q?+EXfwS+BnBFzhJmr3WhZ/0m3SuQN3JJj9gXLfC4pNUAfOAhfJMFMho7Qa1WO?=
 =?us-ascii?Q?VjLy4H6exOwuC+XdxPDDJSq2P86/m9kTvQtwtGAI3HxIku6Hqk/goJcg3yh8?=
 =?us-ascii?Q?U7czxoQ9Bs/DQnGNroL6PhrFV1esfdtJcTeBqHu5SyFwQohs8UgsB2cOm8uF?=
 =?us-ascii?Q?FEd3PVIzJMQWJtPksNTWy9RdKaltVJIwkR+kSlK6LiPjaKxrEWZ4KfXvTg8n?=
 =?us-ascii?Q?bzHyZzB/Whhy0U81oqhKt1+28X4jlB0Sgsd2bPCT/gZT0K54nT+howBef9DZ?=
 =?us-ascii?Q?PJcqwz4muxCvjaGNFHwfoBI1VFfYGJ6JkI4G/MSLhav6Yf12dMuslXnDBwPR?=
 =?us-ascii?Q?a7b+Xg6lOyjEDZCssaasxRvM1qnhC45APy1hXT3ppsZwY8idYw0oOue5QSsJ?=
 =?us-ascii?Q?LyQUx6f6IYWPogIO+fITojT+mOen0IHGaFzeB3RdiCj4PCIL8NiIlLzhOY27?=
 =?us-ascii?Q?9vYXtU95CjvcRcBYzZ1uAtDwnf52OaXTnOnhLncfZdOdGOTmWnSxtHT45Jd1?=
 =?us-ascii?Q?TJvs7xaFHBY0K2T0dqCtQLqnX4DlUAc/cwdF+27C/qhraBuJ48ghVA4QOLvI?=
 =?us-ascii?Q?7acVqKFtS+oOnmZyWgJ9i/6adEIqHgYOnJswcgXBxiVz/qbOEuRaUM7hSBaR?=
 =?us-ascii?Q?8Wo8VtQL50Lf+6WJn16EbqtXaWutII4bcXbwbjMzI4+sGhdQ+80xs4Sry3l1?=
 =?us-ascii?Q?ufYDc8wtr9kT260N6lurMwsITZrUp3bvJ2QhX+9VEyJicLaD1wptiDi3I5Ue?=
 =?us-ascii?Q?v7C6wypAastFo0qExrbb32y/TvnEL8UV9inOklpMx9OriEGGJaAlbvznaXDT?=
 =?us-ascii?Q?yi7CPg/J6skezAGXKg8p/1p3FhbKeybuOWXW5uTawosf5JebES7OeOX3Ec1m?=
 =?us-ascii?Q?K1wv+6ZO85IY+WSgzYRVLyi4xHtEyO7na7eTfEXvLvBXkmYV/qED9jw/y6Vh?=
 =?us-ascii?Q?alxq6dN9iaTcUJxy/3V18PYeXuNLbFN18WIdeRvsx1ltjk1Vef+xwjWMb5qZ?=
 =?us-ascii?Q?Is+wSPBoeH7ET9IPlZlyPNF6EdY1HWigtdGPXq/ndDwOQEjg/ftCG1vcza9S?=
 =?us-ascii?Q?mjBayX2NooaL0xCJI+YciPWPOzSZ1wsOV1eALdXVwlWx2myNdHqm6n8ohGdE?=
 =?us-ascii?Q?vmQ9IqYsN4AiSc6gWMZq1XTx98ITV/WgXZZjqBMjZBxxi/VCjzWr+kmUwG91?=
 =?us-ascii?Q?gSy0m8hRzf2mOE8go4TCLchkDSqfqpPmLZcjV3pDYMb8CN39fLCAoTwwsz27?=
 =?us-ascii?Q?dA6awsYOG9p5Q3/uPLtt9cq3S7I08/aEth9KVoXnzPtDdA1KTADrU8cO2t7h?=
 =?us-ascii?Q?+TD4TvvZwXkWcneVcE7KkkQJ5jKb5Wod/N3GvVn+?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5398c00b-8bfa-4718-c69c-08dac39c6a0a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2022 04:22:58.9326 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BLMgCJIpkYeQE8NeaMysK/apU514htT4EqErg7xBXrP0WGDhZwbV4cZf366iz98jSDqm73iZaaWnZ3qCq+RjGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5102
X-Proofpoint-GUID: sPQ9gfdlgHQZeFIyNjBjpEVu6rdXzt0L
X-Proofpoint-ORIG-GUID: sPQ9gfdlgHQZeFIyNjBjpEVu6rdXzt0L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-11_01,2022-11-09_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015
 suspectscore=0 lowpriorityscore=0 mlxscore=0 malwarescore=0 adultscore=0
 bulkscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 mlxlogscore=535 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211110027
Received-SPF: pass client-ip=205.220.178.238;
 envelope-from=prvs=83144312e2=bin.meng@windriver.com;
 helo=mx0b-0064b401.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Changes in v2:
- Add S_IFLNK related macros to support symbolic link

 fsdev/file-op-9p.h | 33 +++++++++++++++++++++++++++++++++
 hw/9pfs/9p.h       | 33 +++++++++++++++++++++++++++++++++
 2 files changed, 66 insertions(+)

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
index 2fce4140d1..957a7e4ccc 100644
--- a/hw/9pfs/9p.h
+++ b/hw/9pfs/9p.h
@@ -3,13 +3,46 @@
 
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
+#define NAME_MAX            MAX_PATH
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
+#ifndef S_IFLNK
+/*
+ * Currenlty Windows/MinGW does not provide the following flag macros,
+ * so define them here for 9p codes.
+ *
+ * Once Windows/MinGW provides them, remove the defines to prevent conflicts.
+ */
+#define S_IFLNK         0xA000
+#define S_ISUID         0x0800
+#define S_ISGID         0x0400
+#define S_ISVTX         0x0200
+
+#define S_ISLNK(mode)   ((mode & S_IFMT) == S_IFLNK)
+#endif /* S_IFLNK */
+
+#endif /* CONFIG_WIN32 */
+
 enum {
     P9_TLERROR = 6,
     P9_RLERROR,
-- 
2.25.1


