Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5414B650A01
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 11:22:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7DHE-0003Gs-7D; Mon, 19 Dec 2022 05:21:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9352c01a6b=bin.meng@windriver.com>)
 id 1p7DGm-0003BY-JL
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 05:21:19 -0500
Received: from mx0b-0064b401.pphosted.com ([205.220.178.238])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9352c01a6b=bin.meng@windriver.com>)
 id 1p7DGj-0007Sb-QQ
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 05:21:16 -0500
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BJ9dUcV026145; Mon, 19 Dec 2022 10:21:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=rUPnDVFwWRPcTdt3f7ZLadQvvwIT0QOnCyIbXSmVOeA=;
 b=nH4aMrcj+jy58+/ZKq3bP4fyWyAMeKcRGqbdBVy8WmAm8ay767Z8LosrA5RhXYp2T30T
 RPZwrcqanx1yFlaTZ0WqkgvUMQQFmlH0SIMP1w7qJ1PvTP/04kbuI2rNQE/ooLTv8mw6
 Uoyl/swTMHVChGQLfIgKE2MgohNAa7unujqZ0ZRlEKwcs6QyDRHSHgZZLi/juh4MLsTC
 7c7IgrN4zmV7/CYhnjs/ojQBZYz0dZW+MQG6ykwNRQr9qExzz6Cvyn2j/kyA1+5+B2oF
 //2E5H1KAd7Egk3mu4sZ4DHAB23u4+jbu6Qw+CyHzqsgccoql+ZxrlLSctTnwJZa+frN iQ== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2104.outbound.protection.outlook.com [104.47.55.104])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mh4r99b78-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Dec 2022 10:21:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Juy/j7XJQ56NhperjWrbJbm1dlUHzdFnuBqbmS/ogoGqiR6KsUH342anMvu5hnrypzn26UR82Dy5XX8X4NihMnW1WSMivRJnevbtHQIA48Bux4DpPbIfykdG4gvPvyH7hJRQd1FipbQ1IV/60shFmLypN0DDwScowhPmSA08qUUZ3aVD1DeqkRzPm4zhRYR2sRi7nb1wCHqzGQBGnzB+l1V5XR1fufOuXCGbiFng6T5kLNJh92dcGtFlGItVcWO63RuNz7XR0rbnHwofIVirBwjd7wut5KpZ9aX8gLgVDSF7C/TlZlVzFnG+z9MWOYLOaJ//p/72YHnbt7WjZ7j/Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rUPnDVFwWRPcTdt3f7ZLadQvvwIT0QOnCyIbXSmVOeA=;
 b=Z1l97Wqowzr/wdK/J4EfUdX6OUUOJOJ7/yyyUmt4fCzDFNxfS3ORbm3tWjDBVr6xTjYQttNyd61y0NMVR9LufufP+FeklAc+say4u+cqkzW00KTtDtYaKjZbBMtk27dEm64ewR23EB7v2o+WDYYRQF6et1iuFRMi/U2WW3nLzOnrjVlDjDMPV2mu+QFb4pJl4gG07mfb9Pl1Oam155wi8QtWAELuuH1t07KOsZp65cdF/1hk/DT/uKA/9SRrt8Z6fjL4i9jeh0V2m8XP47XZZJgZN7UyWmkFCfdvLgl2c3HckyccxUOlRrUdSsbMihhaS0GiPCwHW31hpsMv6/M0sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5358.namprd11.prod.outlook.com (2603:10b6:5:395::7) by
 DM6PR11MB4691.namprd11.prod.outlook.com (2603:10b6:5:2a6::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5924.16; Mon, 19 Dec 2022 10:21:01 +0000
Received: from DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::8e5e:71da:1e29:bc15]) by DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::8e5e:71da:1e29:bc15%5]) with mapi id 15.20.5880.019; Mon, 19 Dec 2022
 10:21:01 +0000
From: Bin Meng <bin.meng@windriver.com>
To: Greg Kurz <groug@kaod.org>, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 qemu-devel@nongnu.org
Cc: Guohuai Shi <guohuai.shi@windriver.com>
Subject: [PATCH v3 08/17] hw/9pfs: update helper qemu_stat_rdev()
Date: Mon, 19 Dec 2022 18:20:12 +0800
Message-Id: <20221219102022.2167736-9-bin.meng@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221219102022.2167736-1-bin.meng@windriver.com>
References: <20221219102022.2167736-1-bin.meng@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0158.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:35::14) To DM4PR11MB5358.namprd11.prod.outlook.com
 (2603:10b6:5:395::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5358:EE_|DM6PR11MB4691:EE_
X-MS-Office365-Filtering-Correlation-Id: 75e5faf8-1eb9-4bc7-e708-08dae1aaba19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Vb7/+gkmRZUev/PvkGUuOuw9h6IauIWRkKDqrbDVhDUX9EvkWcIYnJ4bcWdIKnS+P8cJHw/D0qiMY4AbHBTGIGzDsbPV9vw2zr55pxWpRX8AW3OyqLLig69M7WbT0vMR0DdYyXEK2xrh69ZEFYnDTbMrl8X8wmS1+pzavBgleWS5vVazQCNHaU5ghlGUhXBcSoxTYN5MrpD4LyKHmyUfp94M9FTJzvtdACvB4kcbGLxXVcV5wkBc+XxJbAxtMd4rjrSfsyKAKZiGvY4awVDgutYmfUriWBBjv4oJBnBbjDbs4UeiOrLeE/sfB9MY6VsL+UFJVBaPGFglfBdel1Hsb7AKs3czTEwEKDZ67qWk0KNIWprg/xlLFMYIT9wm52yiPPhRHI7I19AYhG6FhESmDLOI9ewzhTExVEasGKxCUveayAuuOos0Kontaa/F8BhgGqg0usAmG5LOgrHGxs+CRGpFy9k+cMGZTKUyzfi8nOaaGq1dV3Y6Wd3MyVZVkmLRC/yEMgKtVuDrcren/hMpIj/oD0y3D/NBTwFBiDNtCRF0i7mulyWrQvtcPC//At5gLuMOEcrNb8iAgm5qiid+CY96cVI75UPf7SN/eJNuSmjtIhgPiqe9w3E7QO0rPy1BDs9vKanH8S5EO4o03OC0ulAHymTmrf82QbPdJG/7ulTzZoRN86fNgj34wXlxXg4n
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5358.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39840400004)(136003)(376002)(346002)(366004)(396003)(451199015)(5660300002)(6666004)(107886003)(8936002)(83380400001)(186003)(26005)(6512007)(44832011)(2906002)(41300700001)(36756003)(6486002)(110136005)(1076003)(38350700002)(52116002)(316002)(478600001)(4326008)(38100700002)(8676002)(66476007)(2616005)(6506007)(66946007)(66556008)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zuQYj0+HGqZiEXpb9RvKZ71cMsKG+a7Abk4uQ8bESj17NStfR4cs5XLJbUYK?=
 =?us-ascii?Q?8bGmMipr8jRbvycU8EieqVeUcjgGfOPsnckUXUCQsFckQPjr1BRBLLKdSSDh?=
 =?us-ascii?Q?AfZOIp8aZ0wiCLnl2ZqPNYa3vc45bv/qjwsTzbnidSajmwGpMTeTycc7Ycq9?=
 =?us-ascii?Q?BIsDKhanFlj0ki24Z7PI6iqNDlgklmsMWG5Mjczjl4XlrQ1Q6UEAAhyrQB3i?=
 =?us-ascii?Q?Fw8OxakhbhTBo3Dmx/nj0aNja9rSgXWCSkUKxosW4A0Fw4LQ20ni5gR+sCK4?=
 =?us-ascii?Q?sjyfnqvc4ovVAxHKBsCXEIGi+fVLqzSLaSYGuGKBNAa9zDkje1Vq3cWk1Mza?=
 =?us-ascii?Q?O4oI+7/rNqqOnlKhrai4yt9xw2Ul1tydhkdRiPPtsiYEcfKOFA4b6ajk+OAC?=
 =?us-ascii?Q?w6UdemgLH9F8/TjhycZsuZD69YaHe6+cMn6Q16pV0uqgFi32d9X+UkuPZu5F?=
 =?us-ascii?Q?EGgUvkXRVLxrjHfaJUaGG1GKGNq2deDOQug6mXKcQYzNEhyN1wsL5PBu30wW?=
 =?us-ascii?Q?H/BDs1Jprt2ZalM2haEMJEqlqJsCGfLSeppkfvn95xC4K9u1uvjUaeCFky8V?=
 =?us-ascii?Q?4FjZyJDocbGa6xpNk9JQXlnIq4gwCrKE6vKnAXl/z5omByU1lQXmjCb5uAZc?=
 =?us-ascii?Q?f1H31NxMYzpsVrrwy3rx5+2+PMb1zSI9hNd96T1PnoBPolNBAJ451wrJ9mcE?=
 =?us-ascii?Q?kEsCFkICQu19Rr0ZQAvrRXPWXCVJIORrR1a/zDIt69YKOu9ITaNL67sEzFDv?=
 =?us-ascii?Q?MPhcVhahKaE64Z3dRZ67TECtfqaja9L6/FYD66qHtEBn6o8vQcIqXQEDmTBy?=
 =?us-ascii?Q?JvCjrEb+i1EzsVs73EzhisXjJctPaOd3Mmi1Lv9SfBLsy6gJoaDWtUVVxzwp?=
 =?us-ascii?Q?JlIvzEGFXaAaAFaVSknNswgEb45/uRryF5dVplG3RzOvJbrpzxQLYZNyubc7?=
 =?us-ascii?Q?11S+u3ugj2Xa/IEbjRREtenUxPt+V0EVjW/hv8AzGNxGFf+2X2SF8VItnlz7?=
 =?us-ascii?Q?LIOIuctUCQ/tge/dV1e3sQY8BkLcraJr364wxHrB3aAH4OGibyJ+VbULVz12?=
 =?us-ascii?Q?Hl4lergNdVbhCvcFX/kPmx2wY7G5rc2bTB+8VQ4HYOPG9iB9cJ74hTSTBDOM?=
 =?us-ascii?Q?6GWuJ2FfWduMT1NviMaXYQ4n+HSPuxirBoxcE80Je8ZWVtIjvZEiIujuXCFg?=
 =?us-ascii?Q?KtpZ9MX/qBi5U97llfCVzckP4lTpA+CcLtjjurjnzQoY6HJfXgUBsc0lL+ZD?=
 =?us-ascii?Q?CRhpQAanoDjhCv3QhA1u80Op87mqFR2WmeW/29/oE88tqvnRrmlgYRz9MRDh?=
 =?us-ascii?Q?WVig8KvUdQlBIETPNrHDEpstjF6dZWkKjeeWLuW2V3/JgawxCce3BpOBewFP?=
 =?us-ascii?Q?T5ZwfGLDAGa+9uVkhWMrmrCJjZZaTra0TEwsspqtxXbx0TS11JI6/vLFZ20O?=
 =?us-ascii?Q?QLvhsJQQesy68CIrJy9LWURluhAlncRUbS+DxRUiictMKA3HX6bY5EqGyz4C?=
 =?us-ascii?Q?ZsMq+36lRJ3g8va5tNXY4K0POtp0wr9y/WTcLPlnyeeeKJQ76vATdSFEO6gS?=
 =?us-ascii?Q?VJ6R0vdfy/xNeH4QgQYFqEldK+wUHZBaNGFZLusT?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75e5faf8-1eb9-4bc7-e708-08dae1aaba19
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2022 10:21:01.1014 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RJGs3g3PTptjCBZnMEQc4MJhz+qp4iyUfGc5TnXmbGSeMw2/mU0XOJ8rkkgsNPvuz4/S4gQBsZmj4VD+TeNqwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4691
X-Proofpoint-GUID: EuwFioBB5vyWFygA-ZxFa6rivaCbjd3a
X-Proofpoint-ORIG-GUID: EuwFioBB5vyWFygA-ZxFa6rivaCbjd3a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-18_13,2022-12-15_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0
 mlxlogscore=999 priorityscore=1501 clxscore=1015 phishscore=0
 lowpriorityscore=0 impostorscore=0 mlxscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212190091
Received-SPF: pass client-ip=205.220.178.238;
 envelope-from=prvs=9352c01a6b=bin.meng@windriver.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

As Windows host does not have stat->st_rdev field, we use the first
3 characters of the root path to build a device id.

Co-developed-by: Guohuai Shi <guohuai.shi@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

(no changes since v1)

 hw/9pfs/9p-util.h       | 20 +++++++++++++++++---
 hw/9pfs/9p-util-win32.c | 18 ++++++++++++++++++
 hw/9pfs/9p.c            |  5 +++--
 3 files changed, 38 insertions(+), 5 deletions(-)

diff --git a/hw/9pfs/9p-util.h b/hw/9pfs/9p-util.h
index e395936b30..b8e5c037a2 100644
--- a/hw/9pfs/9p-util.h
+++ b/hw/9pfs/9p-util.h
@@ -19,7 +19,7 @@
 #define O_PATH_9P_UTIL 0
 #endif
 
-#if !defined(CONFIG_LINUX)
+#ifdef CONFIG_DARWIN
 
 /*
  * Generates a Linux device number (a.k.a. dev_t) for given device major
@@ -51,10 +51,12 @@ static inline uint64_t makedev_dotl(uint32_t dev_major, uint32_t dev_minor)
  */
 static inline uint64_t host_dev_to_dotl_dev(dev_t dev)
 {
-#ifdef CONFIG_LINUX
+#if defined(CONFIG_LINUX) || defined(CONFIG_WIN32)
     return dev;
-#else
+#elif defined(CONFIG_DARWIN)
     return makedev_dotl(major(dev), minor(dev));
+#else
+#error Missing host_dev_to_dotl_dev() implementation for this host system
 #endif
 }
 
@@ -128,6 +130,7 @@ int statfs_win32(const char *root_path, struct statfs *stbuf);
 int openat_dir(int dirfd, const char *name);
 int openat_file(int dirfd, const char *name, int flags, mode_t mode);
 off_t qemu_dirent_off_win32(void *s, void *fs);
+uint64_t qemu_stat_rdev_win32(void *fs_ctx);
 #endif
 
 static inline void close_preserve_errno(int fd)
@@ -244,6 +247,17 @@ static inline struct dirent *qemu_dirent_dup(struct dirent *dent)
     return g_memdup(dent, sz);
 }
 
+static inline uint64_t qemu_stat_rdev(const struct stat *stbuf, void *fs_ctx)
+{
+#if defined(CONFIG_LINUX) || defined(CONFIG_DARWIN)
+    return stbuf->st_rdev;
+#elif defined(CONFIG_WIN32)
+    return qemu_stat_rdev_win32(fs_ctx);
+#else
+#error Missing qemu_stat_rdev() implementation for this host system
+#endif
+}
+
 /*
  * As long as mknodat is not available on macOS, this workaround
  * using pthread_fchdir_np is needed. qemu_mknodat is defined in
diff --git a/hw/9pfs/9p-util-win32.c b/hw/9pfs/9p-util-win32.c
index 3592e057ce..54c10069b9 100644
--- a/hw/9pfs/9p-util-win32.c
+++ b/hw/9pfs/9p-util-win32.c
@@ -936,3 +936,21 @@ off_t qemu_dirent_off_win32(void *s, void *fs)
 
     return v9fs->ops->telldir(&v9fs->ctx, (V9fsFidOpenState *)fs);
 }
+
+uint64_t qemu_stat_rdev_win32(void *fs_ctx)
+{
+    uint64_t rdev = 0;
+    LocalData *data = ((FsContext *)fs_ctx)->private;
+
+    /*
+     * As Windows host does not have stat->st_rdev field, we use the first
+     * 3 characters of the root path to build a device id.
+     *
+     * (Windows root path always starts from a driver letter like "C:\")
+     */
+    if (data) {
+        memcpy(&rdev, data->root_path, 3);
+    }
+
+    return rdev;
+}
diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
index be247eeb30..36916fe581 100644
--- a/hw/9pfs/9p.c
+++ b/hw/9pfs/9p.c
@@ -1266,7 +1266,8 @@ static int coroutine_fn stat_to_v9stat(V9fsPDU *pdu, V9fsPath *path,
     } else if (v9stat->mode & P9_STAT_MODE_DEVICE) {
         v9fs_string_sprintf(&v9stat->extension, "%c %u %u",
                 S_ISCHR(stbuf->st_mode) ? 'c' : 'b',
-                major(stbuf->st_rdev), minor(stbuf->st_rdev));
+                major(qemu_stat_rdev(stbuf, &pdu->s->ctx)),
+                minor(qemu_stat_rdev(stbuf, &pdu->s->ctx)));
     } else if (S_ISDIR(stbuf->st_mode) || S_ISREG(stbuf->st_mode)) {
         v9fs_string_sprintf(&v9stat->extension, "%s %lu",
                 "HARDLINKCOUNT", (unsigned long)stbuf->st_nlink);
@@ -1346,7 +1347,7 @@ static int stat_to_v9stat_dotl(V9fsPDU *pdu, const struct stat *stbuf,
     v9lstat->st_nlink = stbuf->st_nlink;
     v9lstat->st_uid = stbuf->st_uid;
     v9lstat->st_gid = stbuf->st_gid;
-    v9lstat->st_rdev = host_dev_to_dotl_dev(stbuf->st_rdev);
+    v9lstat->st_rdev = host_dev_to_dotl_dev(rdev);
     v9lstat->st_size = stbuf->st_size;
     v9lstat->st_blksize = stat_to_iounit(pdu, stbuf);
     v9lstat->st_blocks = stbuf->st_blocks;
-- 
2.25.1


