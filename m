Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E5E569C84F
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 11:10:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU36S-0007ze-Uh; Mon, 20 Feb 2023 05:09:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1415163841=bin.meng@windriver.com>)
 id 1pU36R-0007z4-4a
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 05:08:59 -0500
Received: from mx0b-0064b401.pphosted.com ([205.220.178.238])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1415163841=bin.meng@windriver.com>)
 id 1pU36L-0008Tv-0m
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 05:08:58 -0500
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31K8sfVd013057; Mon, 20 Feb 2023 10:08:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=Q51gWYJ+HXclbGSZ9Zlgv6+QfQYRST3Ok+cRzQ1RAzU=;
 b=e7uAHvzETM2rDAYlc53vLRaTR3SLp/Z3uaDl+np5MjhrXw8Ypi57If73cIgxXmhF2n82
 HDvcUJYNzM0UT3FOXGHKeZBmdtRQbxIvHMggmDUQcQ3R1Q/l6yCn8RppbihReeoFWCfs
 zzpIcc7+SV6w2KYuUonoVmAcRn4X5wjkrXXjnza/TOgTAch8kfWE7ZdG5iq0gL8jOR01
 QT593C3nCDiRk6LHLZES47Sr4D1ZFymoUsfsj469V1EWs7JiWqMMEUc27jjl8Grneg4j
 PW4rtFtIlCSw/mELeY+UViiwGhMw0AArv93l0PQrmDgeumIxV1ZwL+tmvifCsSzrbV8g KQ== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2173.outbound.protection.outlook.com [104.47.59.173])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ntpem1kwk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Feb 2023 10:08:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RWSpjn/pS9EzvESBcw8KjjoqYYAizdEAZNqupZxR/pGnbYpH73jgAEv6j7WcHtFHF7kVcxD2H1n9GDbPL9NTIlkMiPQ1vVRvDk+CffM3SSrDqDytvAzQ+o7byIMxquIfBTSRkCoqXv0/wLDUWYraHJ3W2liPN0trvbFWMQQ60H70wEvOUld2fUQmnIGtsA6U8yCSFZm56dfoCUsYBwJ5N2dA0jRuYgMBr3MRQadmrH/Bm5xiwA0xyWwkdEInu0obobrVXQzYuy07VRMKnVICjpJ84zVkozHjA+Secgb1kF+knN7SugZ1FKItb8CJBcBglcBaxQKWXzeAAOsMgzGppw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q51gWYJ+HXclbGSZ9Zlgv6+QfQYRST3Ok+cRzQ1RAzU=;
 b=MKKJbjRgaRPnQMFehzqpXBex7jOVK089pWnSdo/cBFGCKyvpINjoJw788YUvBgjWUT5Y8WOenC4u65d93R88mP2MeUni5szhMdVvZ1nkea4kOt2yUR2wp8CB5gDfuNAnjBlrVANoNVocP4p11FuDD6GH2kJBUtyqSO9JtIi6LkLg6piatbT8o3976Yvoo/bl+70XgkNXYrcFnIySIQrzlVax6ILBdo+ZTQeZ69QJXVXkDomoUSU0TMLIo/DobxP8a1yBr0fwoX4e+GNzaWpUCAjfnkGkBausP8YTYQUWD2jGCfg13Oh6UJqUUOd96Ak/C3nMYMKixpGXwPT92vXUFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5358.namprd11.prod.outlook.com (2603:10b6:5:395::7) by
 SA2PR11MB5066.namprd11.prod.outlook.com (2603:10b6:806:110::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6111.19; Mon, 20 Feb 2023 10:08:34 +0000
Received: from DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::6c5d:5b92:1599:ce9]) by DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::6c5d:5b92:1599:ce9%4]) with mapi id 15.20.6111.019; Mon, 20 Feb 2023
 10:08:34 +0000
From: Bin Meng <bin.meng@windriver.com>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 qemu-devel@nongnu.org
Cc: Guohuai Shi <guohuai.shi@windriver.com>
Subject: [PATCH v5 02/16] hw/9pfs: Implement Windows specific utilities
 functions for 9pfs
Date: Mon, 20 Feb 2023 18:08:01 +0800
Message-Id: <20230220100815.1624266-3-bin.meng@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: 2f4fa0ba-a2eb-4cb0-fd52-08db132a6cbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: a0VJKb2F18DQX5W+beLt8fv+9r4qqTAALAOc0GmuTZqJzI/u9ttSi+j5X67zxAoRWLnOO1unYiYH7JeHTSUQ3TpGjvKuMFL3VAgEvivFY2/51bxputIx+0KSSkopBbASrLqpBcwEH+k7xvrqrQEcxZmNA734QmsP4CRlVUt7cWWoYQA6Ub77GEzh387ImRm4ScgfDbAwuSVErj9rgM4mR80TW5yO+AHd+oSnEW8u1EFKCg3yZ2qX6a/XbTZiLTgqlXbxF+Q3RTvnPR4po1NatE4qVzeqPx1hWa5d7zvcZxMS2BkYMXreDX/ZC98c/LuwtqH/5magQ1OpV1Qcot8C3wfgghqycivOmusblPlQpkVlhRdSm9mtntTrWiuYJ+ZgZ+NGEgivN+1vgS9QLkUSDEOLsHBYAoto6kjc3NBhFxp9Q77dekFjoLzcO3MoGXy/n+doo0E9juBBcl4FsYfkePx8ZXVU/scC+LqnREUVnQs+/674bVfQ50cweZ1B1UdUzcss8TY2yce6YqKbICHUawJoIcmhpVIHCUlxFfBOMZU2A7EXdomXrk01h4GIXewIQdnlruAh7/72LykLEZTsbwfKULXdkEkRtn9HgdAmRVxtmwCfxX+vyl9nOXOsVXSwic2ogG8GQYAlhliXkkCkgXTU1bie/Qj9edD0qHDPJ0F0ONgy/ncu3mzgan459Gn3CUIc71CM7mbGJZRiszQ/PMNWxrkAWAmEmUwFIPB5n1E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5358.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(376002)(366004)(39840400004)(136003)(396003)(451199018)(2616005)(4326008)(66556008)(8676002)(66946007)(83380400001)(66476007)(5660300002)(8936002)(6506007)(6486002)(107886003)(6666004)(1076003)(6512007)(26005)(186003)(52116002)(36756003)(478600001)(110136005)(316002)(41300700001)(38100700002)(44832011)(38350700002)(86362001)(2906002)(30864003)(21314003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?n4VyVbERhKeP+X9n6hW0Xw0xU/J6EsPWqYYybols5ov/8ef1fW7ZKhGHxs1p?=
 =?us-ascii?Q?bzMirkbeNKhkIn7lEbEb7UHIeZLdOZXIoDdbm8iyPrSO5q9KE8dHIFVoLptz?=
 =?us-ascii?Q?XYKX4nn00dN/pwsaOcX2u2KWN0WIwBScJ4PE07R4aV7fgzZ0B2O4VEPPThVp?=
 =?us-ascii?Q?DcOMDy4ZXNh1WjppiFuP6EnZUq/TLmmguCKNbT96QintnmeBmlV6dwc44L0X?=
 =?us-ascii?Q?VSDfNRF/uzyYWFBdfxAc65lJFLvxYTKGJrKri/B/dCXXthSifexA65zREbUa?=
 =?us-ascii?Q?aM8kcl+rF0a2olgOnmZaJXYAeSn6ajfMoP7WEZ/5dbasAV5vTB25j8+ICbU4?=
 =?us-ascii?Q?3cZ7u67MOolFkKdBwb+Z6SmJIkMqcpo1/my31NpMqE9x6Rh2PNEvDDidlD2k?=
 =?us-ascii?Q?m8iLgyKzLk1Kzjfgg7nBim5TzIim0CTBTbvWZ7UBTa4NS1AmxU0AS/YE7lDp?=
 =?us-ascii?Q?qb/YN7cwsmYi9jQbhmXqi9giTk/6jXB8905LVl79jByRobvn+4iKSRRkMEwH?=
 =?us-ascii?Q?rfNfUnnGn3jLV2hp86kmgOUXOWewW5gvsm8vUpM6TZwrHcPsmdsN/QqvmS6E?=
 =?us-ascii?Q?5O62Rsm3OhXYi6mo6G9KAYlZIxXBVostgvVEVAqzJHETXCdlhhAywslxb8i9?=
 =?us-ascii?Q?Do6QteDSuYBNQPTCpzqyT7Nse3tVs1P/SbqzYtmzcMvi6MmfJqL+471+bzsI?=
 =?us-ascii?Q?kK8xFHWKZoKcRyl8abwFpdlk80BHpngIS4otCUyWl9RKwSOxFk27i1P7acDI?=
 =?us-ascii?Q?7ifPWZd76Kl6gQJPPOFfr1pCqivKkKtr5AfV8CuliugIOO8QX1qXsQWGy8O7?=
 =?us-ascii?Q?hnjaFz7hARQ4zasJV3vyrVG0i79qaNhcAGPIone+akO8gc9eUeiP4PQclV8F?=
 =?us-ascii?Q?O/DqLM5/eVbvPCklsFoMqvZ2KrdAWTtEKIS68GCLF2GXQroLRzvZ8Qq1kN+T?=
 =?us-ascii?Q?7uDVTW+BbXQVES6StadO8C3HwSOyDGT0x/Ky3wrscedvTrozwdbcL6V9qlsL?=
 =?us-ascii?Q?ZyYr4I6SBWvK13dSgESo0cssPjHvpcVCjdtjty6uStGydzR1UXhiCosG9kGp?=
 =?us-ascii?Q?Lr8LU8lbQgMxVjPb0RkP+r3gF5Dt01vAFf1hwPEB9PKb4MUO9bhWajBlsbnf?=
 =?us-ascii?Q?u7Ao17x4U6DIoJif+zn9voPijJOsoxox6cIyeVyVgnMiPr4F6SgfaLB1MYq3?=
 =?us-ascii?Q?zLzKesWKR0KtFcbx1AEHEt4H7Yluo4dCw1qJK2xcMmFkMRwS2ygUOsjb0kTW?=
 =?us-ascii?Q?04FDwjoE+P8cVvrAfOWwXLaTYJjhLUiSiIHkRm2zCS6pZQGjAv+QEawaxqTU?=
 =?us-ascii?Q?7VTdAR6ZPbaRD/oespeYmykJt9283QNXkcQJRfavzGNwFb9lZfPinqOkUzga?=
 =?us-ascii?Q?uhMutRJAn9rFy9RecYkzb9o7jQZiwJnqDfx0k0kpN8c427wAecE4O+kyw6l4?=
 =?us-ascii?Q?wnVyy9cTiTeFYVg/DlIYZTt4pqjtO/9+6hDxEyZk5VFNPina6A/iUMFeHlTn?=
 =?us-ascii?Q?g+btc4nmlpFsvDg1sZ0zrgrQPCsDblIE6OU3jU+FB3aFQSTe6azattjtwRED?=
 =?us-ascii?Q?c3T2C+k/vLZltORx2L0azzJsPRLshfS7dsl0aeZX/EIe9FW+w1weYt+3qT26?=
 =?us-ascii?Q?Sg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f4fa0ba-a2eb-4cb0-fd52-08db132a6cbb
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2023 10:08:34.1713 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RKmuVVZ47P3QX8/+WeDmsZ58F5u+rldLCqpDZyjsm4rEL40KmZTEWbhWIUL3ABrlbD9rW8jia6qxeZYMo5bJ2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5066
X-Proofpoint-ORIG-GUID: UYtz02UArNVfB6hYBePofkVM74RHX1eG
X-Proofpoint-GUID: UYtz02UArNVfB6hYBePofkVM74RHX1eG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-20_07,2023-02-17_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=999
 bulkscore=0 spamscore=0 malwarescore=0 impostorscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302200089
Received-SPF: pass client-ip=205.220.178.238;
 envelope-from=prvs=1415163841=bin.meng@windriver.com;
 helo=mx0b-0064b401.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

Windows POSIX API and MinGW library do not provide the NO_FOLLOW
flag, and do not allow opening a directory by POSIX open(). This
causes all xxx_at() functions cannot work directly. However, we
can provide Windows handle based functions to emulate xxx_at()
functions (e.g.: openat_win32, utimensat_win32, etc.).

NTFS ADS (Alternate Data Streams) is used to emulate 9pfs extended
attributes on Windows. Symbolic link is only supported when security
model is "mapped-xattr" or "mapped-file".

Signed-off-by: Guohuai Shi <guohuai.shi@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 hw/9pfs/9p-local.h      |   7 +
 hw/9pfs/9p-util.h       |  32 +-
 hw/9pfs/9p-local.c      |   4 -
 hw/9pfs/9p-util-win32.c | 979 ++++++++++++++++++++++++++++++++++++++++
 4 files changed, 1017 insertions(+), 5 deletions(-)
 create mode 100644 hw/9pfs/9p-util-win32.c

diff --git a/hw/9pfs/9p-local.h b/hw/9pfs/9p-local.h
index 32c72749d9..77e7f57f89 100644
--- a/hw/9pfs/9p-local.h
+++ b/hw/9pfs/9p-local.h
@@ -13,6 +13,13 @@
 #ifndef QEMU_9P_LOCAL_H
 #define QEMU_9P_LOCAL_H
 
+typedef struct {
+    int mountfd;
+#ifdef CONFIG_WIN32
+    char *root_path;
+#endif
+} LocalData;
+
 int local_open_nofollow(FsContext *fs_ctx, const char *path, int flags,
                         mode_t mode);
 int local_opendir_nofollow(FsContext *fs_ctx, const char *path);
diff --git a/hw/9pfs/9p-util.h b/hw/9pfs/9p-util.h
index c314cf381d..90420a7578 100644
--- a/hw/9pfs/9p-util.h
+++ b/hw/9pfs/9p-util.h
@@ -88,18 +88,46 @@ static inline int errno_to_dotl(int err) {
     return err;
 }
 
-#ifdef CONFIG_DARWIN
+#if defined(CONFIG_DARWIN)
 #define qemu_fgetxattr(...) fgetxattr(__VA_ARGS__, 0, 0)
+#elif defined(CONFIG_WIN32)
+#define qemu_fgetxattr fgetxattr_win32
 #else
 #define qemu_fgetxattr fgetxattr
 #endif
 
+#ifdef CONFIG_WIN32
+#define qemu_openat     openat_win32
+#define qemu_fstatat    fstatat_win32
+#define qemu_mkdirat    mkdirat_win32
+#define qemu_renameat   renameat_win32
+#define qemu_utimensat  utimensat_win32
+#define qemu_unlinkat   unlinkat_win32
+#else
 #define qemu_openat     openat
 #define qemu_fstatat    fstatat
 #define qemu_mkdirat    mkdirat
 #define qemu_renameat   renameat
 #define qemu_utimensat  utimensat
 #define qemu_unlinkat   unlinkat
+#endif
+
+#ifdef CONFIG_WIN32
+char *get_full_path_win32(HANDLE hDir, const char *name);
+ssize_t fgetxattr_win32(int fd, const char *name, void *value, size_t size);
+int openat_win32(int dirfd, const char *pathname, int flags, mode_t mode);
+int fstatat_win32(int dirfd, const char *pathname,
+                  struct stat *statbuf, int flags);
+int mkdirat_win32(int dirfd, const char *pathname, mode_t mode);
+int renameat_win32(int olddirfd, const char *oldpath,
+                   int newdirfd, const char *newpath);
+int utimensat_win32(int dirfd, const char *pathname,
+                    const struct timespec times[2], int flags);
+int unlinkat_win32(int dirfd, const char *pathname, int flags);
+int statfs_win32(const char *root_path, struct statfs *stbuf);
+int openat_dir(int dirfd, const char *name);
+int openat_file(int dirfd, const char *name, int flags, mode_t mode);
+#endif
 
 static inline void close_preserve_errno(int fd)
 {
@@ -108,6 +136,7 @@ static inline void close_preserve_errno(int fd)
     errno = serrno;
 }
 
+#ifndef CONFIG_WIN32
 static inline int openat_dir(int dirfd, const char *name)
 {
     return qemu_openat(dirfd, name,
@@ -154,6 +183,7 @@ again:
     errno = serrno;
     return fd;
 }
+#endif
 
 ssize_t fgetxattrat_nofollow(int dirfd, const char *path, const char *name,
                              void *value, size_t size);
diff --git a/hw/9pfs/9p-local.c b/hw/9pfs/9p-local.c
index 9d07620235..b6102c9e5a 100644
--- a/hw/9pfs/9p-local.c
+++ b/hw/9pfs/9p-local.c
@@ -53,10 +53,6 @@
 #define BTRFS_SUPER_MAGIC 0x9123683E
 #endif
 
-typedef struct {
-    int mountfd;
-} LocalData;
-
 int local_open_nofollow(FsContext *fs_ctx, const char *path, int flags,
                         mode_t mode)
 {
diff --git a/hw/9pfs/9p-util-win32.c b/hw/9pfs/9p-util-win32.c
new file mode 100644
index 0000000000..a99d579a06
--- /dev/null
+++ b/hw/9pfs/9p-util-win32.c
@@ -0,0 +1,979 @@
+/*
+ * 9p utilities (Windows Implementation)
+ *
+ * Copyright (c) 2022 Wind River Systems, Inc.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+/*
+ * This file contains Windows only functions for 9pfs.
+ *
+ * For 9pfs Windows host, the following features are different from Linux host:
+ *
+ * 1. Windows POSIX API does not provide the NO_FOLLOW flag, that means MinGW
+ *    cannot detect if a path is a symbolic link or not. Also Windows do not
+ *    provide POSIX compatible readlink(). Supporting symbolic link in 9pfs on
+ *    Windows may cause security issues, so symbolic link support is disabled
+ *    completely for security model "none" or "passthrough".
+ *
+ * 2. Windows file system does not support extended attributes directly. 9pfs
+ *    for Windows uses NTFS ADS (Alternate Data Streams) to emulate extended
+ *    attributes.
+ *
+ * 3. statfs() is not available on Windows. qemu_statfs() is used to emulate it.
+ *
+ * 4. On Windows trying to open a directory with the open() API will fail.
+ *    This is because Windows does not allow opening directory in normal usage.
+ *
+ *    As a result of this, all xxx_at() functions won't work directly on
+ *    Windows, e.g.: openat(), unlinkat(), etc.
+ *
+ *    As xxx_at() can prevent parent directory to be modified on Linux host,
+ *    to support this and prevent security issue, all xxx_at() APIs are replaced
+ *    by xxx_at_win32().
+ *
+ *    Windows does not support opendir, the directory fd is created by
+ *    CreateFile and convert to fd by _open_osfhandle(). Keep the fd open will
+ *    lock and protect the directory (can not be modified or replaced)
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "qemu/error-report.h"
+#include "9p.h"
+#include "9p-util.h"
+#include "9p-local.h"
+
+#include <windows.h>
+#include <dirent.h>
+
+#define V9FS_MAGIC  0x53465039  /* string "9PFS" */
+
+/*
+ * win32_error_to_posix - convert Win32 error to POSIX error number
+ *
+ * This function converts Win32 error to POSIX error number.
+ * e.g. ERROR_FILE_NOT_FOUND and ERROR_PATH_NOT_FOUND will be translated to
+ * ENOENT.
+ */
+static int win32_error_to_posix(DWORD win32err)
+{
+    switch (win32err) {
+    case ERROR_FILE_NOT_FOUND:      return ENOENT;
+    case ERROR_PATH_NOT_FOUND:      return ENOENT;
+    case ERROR_INVALID_DRIVE:       return ENODEV;
+    case ERROR_TOO_MANY_OPEN_FILES: return EMFILE;
+    case ERROR_ACCESS_DENIED:       return EACCES;
+    case ERROR_INVALID_HANDLE:      return EBADF;
+    case ERROR_NOT_ENOUGH_MEMORY:   return ENOMEM;
+    case ERROR_FILE_EXISTS:         return EEXIST;
+    case ERROR_DISK_FULL:           return ENOSPC;
+    }
+    return EIO;
+}
+
+/*
+ * build_ads_name - construct Windows ADS name
+ *
+ * This function constructs Windows NTFS ADS (Alternate Data Streams) name
+ * to <namebuf>.
+ */
+static int build_ads_name(char *namebuf, size_t namebuf_len,
+                          const char *filename, const char *ads_name)
+{
+    size_t total_size;
+
+    total_size = strlen(filename) + strlen(ads_name) + 2;
+    if (total_size  > namebuf_len) {
+        return -1;
+    }
+
+    /*
+     * NTFS ADS (Alternate Data Streams) name format: filename:ads_name
+     * e.g.: D:\1.txt:my_ads_name
+     */
+
+    strcpy(namebuf, filename);
+    strcat(namebuf, ":");
+    strcat(namebuf, ads_name);
+
+    return 0;
+}
+
+/*
+ * copy_ads_name - copy ADS name from buffer returned by FindNextStreamW()
+ *
+ * This function removes string "$DATA" in ADS name string returned by
+ * FindNextStreamW(), and copies the real ADS name to <namebuf>.
+ */
+static ssize_t copy_ads_name(char *namebuf, size_t namebuf_len,
+                             char *full_ads_name)
+{
+    char *p1, *p2;
+
+    /*
+     * NTFS ADS (Alternate Data Streams) name from enumerate data format:
+     * :ads_name:$DATA, e.g.: :my_ads_name:$DATA
+     *
+     * ADS name from FindNextStreamW() always has ":$DATA" string at the end.
+     *
+     * This function copies ADS name to namebuf.
+     */
+
+    p1 = strchr(full_ads_name, ':');
+    if (p1 == NULL) {
+        return -1;
+    }
+
+    p2 = strchr(p1 + 1, ':');
+    if (p2 == NULL) {
+        return -1;
+    }
+
+    /* skip empty ads name */
+    if (p2 - p1 == 1) {
+        return 0;
+    }
+
+    if (p2 - p1 + 1 > namebuf_len) {
+        return -1;
+    }
+
+    memcpy(namebuf, p1 + 1, p2 - p1 - 1);
+    namebuf[p2 - p1 - 1] = '\0';
+
+    return p2 - p1;
+}
+
+/*
+ * get_full_path_win32 - get full file name base on a handle
+ *
+ * This function gets full file name based on a handle specified by <fd> to
+ * a file or directory.
+ *
+ * Caller function needs to free the file name string after use.
+ */
+char *get_full_path_win32(HANDLE hDir, const char *name)
+{
+    g_autofree char *full_file_name = NULL;
+    DWORD total_size;
+    DWORD name_size;
+
+    if (hDir == INVALID_HANDLE_VALUE) {
+        return NULL;
+    }
+
+    full_file_name = g_malloc0(NAME_MAX);
+
+    /* get parent directory full file name */
+    name_size = GetFinalPathNameByHandle(hDir, full_file_name,
+                                         NAME_MAX - 1, FILE_NAME_NORMALIZED);
+    if (name_size == 0 || name_size > NAME_MAX - 1) {
+        return NULL;
+    }
+
+    /* full path returned is the "\\?\" syntax, remove the lead string */
+    memmove(full_file_name, full_file_name + 4, NAME_MAX - 4);
+
+    if (name != NULL) {
+        total_size = strlen(full_file_name) + strlen(name) + 2;
+
+        if (total_size > NAME_MAX) {
+            return NULL;
+        }
+
+        /* build sub-directory file name */
+        strcat(full_file_name, "\\");
+        strcat(full_file_name, name);
+    }
+
+    return g_steal_pointer(&full_file_name);
+}
+
+/*
+ * fgetxattr_win32 - get extended attribute by fd
+ *
+ * This function gets extened attribute by <fd>. <fd> will be translated to
+ * Windows handle.
+ *
+ * This function emulates extended attribute by NTFS ADS.
+ */
+ssize_t fgetxattr_win32(int fd, const char *name, void *value, size_t size)
+{
+    g_autofree char *full_file_name = NULL;
+    char ads_file_name[NAME_MAX + 1] = {0};
+    DWORD dwBytesRead;
+    HANDLE hStream;
+    HANDLE hFile;
+
+    hFile = (HANDLE)_get_osfhandle(fd);
+
+    full_file_name = get_full_path_win32(hFile, NULL);
+    if (full_file_name == NULL) {
+        errno = EIO;
+        return -1;
+    }
+
+    if (build_ads_name(ads_file_name, NAME_MAX, full_file_name, name) < 0) {
+        errno = EIO;
+        return -1;
+    }
+
+    hStream = CreateFile(ads_file_name, GENERIC_READ, FILE_SHARE_READ, NULL,
+                         OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, NULL);
+    if (hStream == INVALID_HANDLE_VALUE &&
+        GetLastError() == ERROR_FILE_NOT_FOUND) {
+        errno = ENODATA;
+        return -1;
+    }
+
+    if (ReadFile(hStream, value, size, &dwBytesRead, NULL) == FALSE) {
+        errno = EIO;
+        CloseHandle(hStream);
+        return -1;
+    }
+
+    CloseHandle(hStream);
+
+    return dwBytesRead;
+}
+
+/*
+ * openat_win32 - emulate openat()
+ *
+ * This function emulates openat().
+ *
+ * this function needs a handle to get the full file name, it has to
+ * convert fd to handle by get_osfhandle().
+ *
+ * For symbolic access:
+ * 1. Parent directory handle <dirfd> should not be a symbolic link because
+ *    it is opened by openat_dir() which can prevent from opening a link to
+ *    a dirctory.
+ * 2. Link flag in <mode> is not set because Windows does not have this flag.
+ *    Create a new symbolic link will be denied.
+ * 3. This function checks file symbolic link attribute after open.
+ *
+ * So native symbolic link will not be accessed by 9p client.
+ */
+int openat_win32(int dirfd, const char *pathname, int flags, mode_t mode)
+{
+    g_autofree char *full_file_name1 = NULL;
+    g_autofree char *full_file_name2 = NULL;
+    HANDLE hFile;
+    HANDLE hDir = (HANDLE)_get_osfhandle(dirfd);
+    int fd;
+
+    full_file_name1 = get_full_path_win32(hDir, pathname);
+    if (full_file_name1 == NULL) {
+        return -1;
+    }
+
+    fd = open(full_file_name1, flags, mode);
+    if (fd > 0) {
+        DWORD attribute;
+        hFile = (HANDLE)_get_osfhandle(fd);
+
+        full_file_name2 = get_full_path_win32(hFile, NULL);
+        attribute = GetFileAttributes(full_file_name2);
+
+        /* check if it is a symbolic link */
+        if ((attribute == INVALID_FILE_ATTRIBUTES)
+            || (attribute & FILE_ATTRIBUTE_REPARSE_POINT) != 0) {
+            errno = EACCES;
+            close(fd);
+        }
+    }
+
+    return fd;
+}
+
+/*
+ * fstatat_win32 - emulate fstatat()
+ *
+ * This function emulates fstatat().
+ *
+ * Access to a symbolic link will be denied to prevent security issues.
+ */
+int fstatat_win32(int dirfd, const char *pathname,
+                  struct stat *statbuf, int flags)
+{
+    g_autofree char *full_file_name = NULL;
+    HANDLE hFile = INVALID_HANDLE_VALUE;
+    HANDLE hDir = (HANDLE)_get_osfhandle(dirfd);
+    BY_HANDLE_FILE_INFORMATION file_info;
+    DWORD attribute;
+    int err = 0;
+    int ret = -1;
+    ino_t st_ino;
+    int is_symlink = 0;
+
+    full_file_name = get_full_path_win32(hDir, pathname);
+    if (full_file_name == NULL) {
+        return ret;
+    }
+
+    /* open file to lock it */
+    hFile = CreateFile(full_file_name, GENERIC_READ,
+                       FILE_SHARE_READ | FILE_SHARE_WRITE | FILE_SHARE_DELETE,
+                       NULL,
+                       OPEN_EXISTING,
+                       FILE_FLAG_BACKUP_SEMANTICS
+                       | FILE_FLAG_OPEN_REPARSE_POINT,
+                       NULL);
+
+    if (hFile == INVALID_HANDLE_VALUE) {
+        err = win32_error_to_posix(GetLastError());
+        goto out;
+    }
+
+    attribute = GetFileAttributes(full_file_name);
+
+    if (attribute == INVALID_FILE_ATTRIBUTES) {
+        err = EACCES;
+        goto out;
+    }
+
+    /* check if it is a symbolic link */
+    if ((attribute & FILE_ATTRIBUTE_REPARSE_POINT) != 0) {
+        is_symlink = 1;
+    }
+
+    ret = stat(full_file_name, statbuf);
+
+    if (GetFileInformationByHandle(hFile, &file_info) == 0) {
+        err = win32_error_to_posix(GetLastError());
+        goto out;
+    }
+
+    /*
+     * Windows (NTFS) file ID is a 64-bit ID:
+     *   16-bit sequence ID + 48 bit segment number
+     *
+     * But currently, ino_t defined in Windows header file is only 16-bit,
+     * and it is not patched by MinGW. So we build a pseudo inode number
+     * by the low 32-bit segment number when ino_t is only 16-bit.
+     */
+    if (sizeof(st_ino) == sizeof(uint64_t)) {
+        st_ino = (ino_t)((uint64_t)file_info.nFileIndexLow
+                         | (((uint64_t)file_info.nFileIndexHigh) << 32));
+    } else if (sizeof(st_ino) == sizeof(uint16_t)) {
+        st_ino = (ino_t)(((uint16_t)file_info.nFileIndexLow)
+                         ^ ((uint16_t)(file_info.nFileIndexLow >> 16)));
+    } else {
+        st_ino = (ino_t)file_info.nFileIndexLow;
+    }
+
+    statbuf->st_ino = st_ino;
+
+    if (is_symlink == 1) {
+        /* force to set mode to 0, to prevent symlink access */
+        statbuf->st_mode = 0;
+
+        /* hide information */
+        statbuf->st_atime = 0;
+        statbuf->st_mtime = 0;
+        statbuf->st_ctime = 0;
+        statbuf->st_size = 0;
+    }
+
+out:
+    if (hFile != INVALID_HANDLE_VALUE) {
+        CloseHandle(hFile);
+    }
+
+    if (err != 0) {
+        errno = err;
+    }
+    return ret;
+}
+
+/*
+ * mkdirat_win32 - emulate mkdirat()
+ *
+ * This function emulates mkdirat().
+ *
+ * this function needs a handle to get the full file name, it has to
+ * convert fd to handle by get_osfhandle().
+ */
+int mkdirat_win32(int dirfd, const char *pathname, mode_t mode)
+{
+    g_autofree char *full_file_name = NULL;
+    int ret = -1;
+    HANDLE hDir = (HANDLE)_get_osfhandle(dirfd);
+
+    full_file_name = get_full_path_win32(hDir, pathname);
+    if (full_file_name == NULL) {
+        return ret;
+    }
+
+    ret = mkdir(full_file_name);
+
+    return ret;
+}
+
+/*
+ * renameat_win32 - emulate renameat()
+ *
+ * This function emulates renameat().
+ *
+ * this function needs a handle to get the full file name, it has to
+ * convert fd to handle by get_osfhandle().
+ *
+ * Access to a symbolic link will be denied to prevent security issues.
+ */
+int renameat_win32(int olddirfd, const char *oldpath,
+                   int newdirfd, const char *newpath)
+{
+    g_autofree char *full_old_name = NULL;
+    g_autofree char *full_new_name = NULL;
+    HANDLE hFile;
+    HANDLE hOldDir = (HANDLE)_get_osfhandle(olddirfd);
+    HANDLE hNewDir = (HANDLE)_get_osfhandle(newdirfd);
+    DWORD attribute;
+    int err = 0;
+    int ret = -1;
+
+    full_old_name = get_full_path_win32(hOldDir, oldpath);
+    full_new_name = get_full_path_win32(hNewDir, newpath);
+    if (full_old_name == NULL || full_new_name == NULL) {
+        return ret;
+    }
+
+    /* open file to lock it */
+    hFile = CreateFile(full_old_name, GENERIC_READ,
+                       FILE_SHARE_READ | FILE_SHARE_WRITE | FILE_SHARE_DELETE,
+                       NULL,
+                       OPEN_EXISTING, FILE_FLAG_BACKUP_SEMANTICS, NULL);
+
+    if (hFile == INVALID_HANDLE_VALUE) {
+        err = win32_error_to_posix(GetLastError());
+        goto out;
+    }
+
+    attribute = GetFileAttributes(full_old_name);
+
+    /* check if it is a symbolic link */
+    if ((attribute == INVALID_FILE_ATTRIBUTES)
+        || (attribute & FILE_ATTRIBUTE_REPARSE_POINT) != 0) {
+        err = EACCES;
+        goto out;
+    }
+
+    CloseHandle(hFile);
+
+    ret = rename(full_old_name, full_new_name);
+out:
+    if (err != 0) {
+        errno = err;
+    }
+    return ret;
+}
+
+/*
+ * utimensat_win32 - emulate utimensat()
+ *
+ * This function emulates utimensat().
+ *
+ * this function needs a handle to get the full file name, it has to
+ * convert fd to handle by get_osfhandle().
+ *
+ * Access to a symbolic link will be denied to prevent security issues.
+ */
+int utimensat_win32(int dirfd, const char *pathname,
+                    const struct timespec times[2], int flags)
+{
+    g_autofree char *full_file_name = NULL;
+    HANDLE hFile = INVALID_HANDLE_VALUE;
+    HANDLE hDir = (HANDLE)_get_osfhandle(dirfd);
+    DWORD attribute;
+    struct utimbuf tm;
+    int err = 0;
+    int ret = -1;
+
+    full_file_name = get_full_path_win32(hDir, pathname);
+    if (full_file_name == NULL) {
+        return ret;
+    }
+
+    /* open file to lock it */
+    hFile = CreateFile(full_file_name, GENERIC_READ,
+                       FILE_SHARE_READ | FILE_SHARE_WRITE | FILE_SHARE_DELETE,
+                       NULL,
+                       OPEN_EXISTING,
+                       FILE_FLAG_BACKUP_SEMANTICS
+                       | FILE_FLAG_OPEN_REPARSE_POINT,
+                       NULL);
+
+    if (hFile == INVALID_HANDLE_VALUE) {
+        err = win32_error_to_posix(GetLastError());
+        goto out;
+    }
+
+    attribute = GetFileAttributes(full_file_name);
+
+    /* check if it is a symbolic link */
+    if ((attribute == INVALID_FILE_ATTRIBUTES)
+        || (attribute & FILE_ATTRIBUTE_REPARSE_POINT) != 0) {
+        errno = EACCES;
+        goto out;
+    }
+
+    tm.actime = times[0].tv_sec;
+    tm.modtime = times[1].tv_sec;
+
+    ret = utime(full_file_name, &tm);
+
+out:
+    if (hFile != INVALID_HANDLE_VALUE) {
+        CloseHandle(hFile);
+    }
+
+    if (err != 0) {
+        errno = err;
+    }
+    return ret;
+}
+
+/*
+ * unlinkat_win32 - emulate unlinkat()
+ *
+ * This function emulates unlinkat().
+ *
+ * this function needs a handle to get the full file name, it has to
+ * convert fd to handle by get_osfhandle().
+ *
+ * Access to a symbolic link will be denied to prevent security issues.
+ */
+
+int unlinkat_win32(int dirfd, const char *pathname, int flags)
+{
+    g_autofree char *full_file_name = NULL;
+    HANDLE hFile;
+    HANDLE hDir = (HANDLE)_get_osfhandle(dirfd);
+    DWORD attribute;
+    int err = 0;
+    int ret = -1;
+
+    full_file_name = get_full_path_win32(hDir, pathname);
+    if (full_file_name == NULL) {
+        return ret;
+    }
+
+    /*
+     * open file to prevent other one modify it. FILE_SHARE_DELETE flag
+     * allows remove a file even it is still in opening.
+     */
+    hFile = CreateFile(full_file_name, GENERIC_READ,
+                       FILE_SHARE_READ | FILE_SHARE_WRITE | FILE_SHARE_DELETE,
+                       NULL,
+                       OPEN_EXISTING, FILE_FLAG_BACKUP_SEMANTICS, NULL);
+
+    if (hFile == INVALID_HANDLE_VALUE) {
+        err = win32_error_to_posix(GetLastError());
+        goto out;
+    }
+
+    attribute = GetFileAttributes(full_file_name);
+
+    /* check if it is a symbolic link */
+    if ((attribute == INVALID_FILE_ATTRIBUTES)
+        || (attribute & FILE_ATTRIBUTE_REPARSE_POINT) != 0) {
+        err = EACCES;
+        goto out;
+    }
+
+    if (flags == AT_REMOVEDIR) { /* remove directory */
+        if ((attribute & FILE_ATTRIBUTE_DIRECTORY) == 0) {
+            err = ENOTDIR;
+            goto out;
+        }
+        ret = rmdir(full_file_name);
+    } else { /* remove regular file */
+        if ((attribute & FILE_ATTRIBUTE_DIRECTORY) != 0) {
+            err = EISDIR;
+            goto out;
+        }
+        ret = remove(full_file_name);
+    }
+
+    /* after last handle closed, file will be removed */
+    CloseHandle(hFile);
+
+out:
+    if (err != 0) {
+        errno = err;
+    }
+    return ret;
+}
+
+/*
+ * statfs_win32 - statfs() on Windows
+ *
+ * This function emulates statfs() on Windows host.
+ */
+int statfs_win32(const char *path, struct statfs *stbuf)
+{
+    char RealPath[4] = { 0 };
+    unsigned long SectorsPerCluster;
+    unsigned long BytesPerSector;
+    unsigned long NumberOfFreeClusters;
+    unsigned long TotalNumberOfClusters;
+
+    /* only need first 3 bytes, e.g. "C:\ABC", only need "C:\" */
+    memcpy(RealPath, path, 3);
+
+    if (GetDiskFreeSpace(RealPath, &SectorsPerCluster, &BytesPerSector,
+                         &NumberOfFreeClusters, &TotalNumberOfClusters) == 0) {
+        errno = EIO;
+        return -1;
+    }
+
+    stbuf->f_type = V9FS_MAGIC;
+    stbuf->f_bsize =
+        (__fsword_t)SectorsPerCluster * (__fsword_t)BytesPerSector;
+    stbuf->f_blocks = (fsblkcnt_t)TotalNumberOfClusters;
+    stbuf->f_bfree = (fsblkcnt_t)NumberOfFreeClusters;
+    stbuf->f_bavail = (fsblkcnt_t)NumberOfFreeClusters;
+    stbuf->f_files = -1;
+    stbuf->f_ffree = -1;
+    stbuf->f_namelen = NAME_MAX;
+    stbuf->f_frsize = 0;
+    stbuf->f_flags = 0;
+
+    return 0;
+}
+
+/*
+ * openat_dir - emulate openat_dir()
+ *
+ * This function emulates openat_dir().
+ *
+ * Access to a symbolic link will be denied to prevent security issues.
+ */
+int openat_dir(int dirfd, const char *name)
+{
+    g_autofree char *full_file_name = NULL;
+    HANDLE hSubDir;
+    HANDLE hDir = (HANDLE)_get_osfhandle(dirfd);
+    DWORD attribute;
+
+    full_file_name = get_full_path_win32(hDir, name);
+    if (full_file_name == NULL) {
+        return -1;
+    }
+
+    attribute = GetFileAttributes(full_file_name);
+    if (attribute == INVALID_FILE_ATTRIBUTES) {
+        return -1;
+    }
+
+    /* check if it is a directory */
+    if ((attribute & FILE_ATTRIBUTE_DIRECTORY) == 0) {
+        return -1;
+    }
+
+    /* do not allow opening a symbolic link */
+    if ((attribute & FILE_ATTRIBUTE_REPARSE_POINT) != 0) {
+        return -1;
+    }
+
+    /* open it */
+    hSubDir = CreateFile(full_file_name, GENERIC_READ,
+                         FILE_SHARE_READ | FILE_SHARE_WRITE | FILE_SHARE_DELETE,
+                         NULL,
+                         OPEN_EXISTING, FILE_FLAG_BACKUP_SEMANTICS, NULL);
+    return _open_osfhandle((intptr_t)hSubDir, _O_RDONLY);
+}
+
+
+int openat_file(int dirfd, const char *name, int flags, mode_t mode)
+{
+    return openat_win32(dirfd, name, flags | _O_BINARY, mode);
+}
+
+/*
+ * fgetxattrat_nofollow - get extended attribute
+ *
+ * This function gets extended attribute from file <path> in the directory
+ * specified by <dirfd>. The extended atrribute name is specified by <name>
+ * and return value will be put in <value>.
+ *
+ * This function emulates extended attribute by NTFS ADS.
+ */
+ssize_t fgetxattrat_nofollow(int dirfd, const char *path,
+                             const char *name, void *value, size_t size)
+{
+    g_autofree char *full_file_name = NULL;
+    char ads_file_name[NAME_MAX + 1] = { 0 };
+    DWORD dwBytesRead;
+    HANDLE hStream;
+    HANDLE hDir = (HANDLE)_get_osfhandle(dirfd);
+
+    full_file_name = get_full_path_win32(hDir, path);
+    if (full_file_name == NULL) {
+        errno = EIO;
+        return -1;
+    }
+
+    if (build_ads_name(ads_file_name, NAME_MAX, full_file_name, name) < 0) {
+        errno = EIO;
+        return -1;
+    }
+
+    hStream = CreateFile(ads_file_name, GENERIC_READ, FILE_SHARE_READ, NULL,
+                         OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, NULL);
+    if (hStream == INVALID_HANDLE_VALUE &&
+        GetLastError() == ERROR_FILE_NOT_FOUND) {
+        errno = ENODATA;
+        return -1;
+    }
+
+    if (ReadFile(hStream, value, size, &dwBytesRead, NULL) == FALSE) {
+        errno = EIO;
+        CloseHandle(hStream);
+        return -1;
+    }
+
+    CloseHandle(hStream);
+
+    return dwBytesRead;
+}
+
+/*
+ * fsetxattrat_nofollow - set extended attribute
+ *
+ * This function sets extended attribute to file <path> in the directory
+ * specified by <dirfd>.
+ *
+ * This function emulates extended attribute by NTFS ADS.
+ */
+
+int fsetxattrat_nofollow(int dirfd, const char *path, const char *name,
+                         void *value, size_t size, int flags)
+{
+    g_autofree char *full_file_name = NULL;
+    char ads_file_name[NAME_MAX + 1] = { 0 };
+    DWORD dwBytesWrite;
+    HANDLE hStream;
+    HANDLE hDir = (HANDLE)_get_osfhandle(dirfd);
+
+    full_file_name = get_full_path_win32(hDir, path);
+    if (full_file_name == NULL) {
+        errno = EIO;
+        return -1;
+    }
+
+    if (build_ads_name(ads_file_name, NAME_MAX, full_file_name, name) < 0) {
+        errno = EIO;
+        return -1;
+    }
+
+    hStream = CreateFile(ads_file_name, GENERIC_WRITE, FILE_SHARE_READ, NULL,
+                         CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, NULL);
+    if (hStream == INVALID_HANDLE_VALUE) {
+        errno = EIO;
+        return -1;
+    }
+
+    if (WriteFile(hStream, value, size, &dwBytesWrite, NULL) == FALSE) {
+        errno = EIO;
+        CloseHandle(hStream);
+        return -1;
+    }
+
+    CloseHandle(hStream);
+
+    return 0;
+}
+
+/*
+ * flistxattrat_nofollow - list extended attribute
+ *
+ * This function gets extended attribute lists from file <filename> in the
+ * directory specified by <dirfd>. Lists returned will be put in <list>.
+ *
+ * This function emulates extended attribute by NTFS ADS.
+ */
+ssize_t flistxattrat_nofollow(int dirfd, const char *filename,
+                              char *list, size_t size)
+{
+    g_autofree char *full_file_name = NULL;
+    WCHAR WideCharStr[NAME_MAX + 1] = { 0 };
+    char full_ads_name[NAME_MAX + 1];
+    WIN32_FIND_STREAM_DATA fsd;
+    BOOL bFindNext;
+    char *list_ptr = list;
+    size_t list_left_size = size;
+    HANDLE hFind;
+    HANDLE hDir = (HANDLE)_get_osfhandle(dirfd);
+    int ret;
+
+    full_file_name = get_full_path_win32(hDir, filename);
+    if (full_file_name == NULL) {
+        errno = EIO;
+        return -1;
+    }
+
+    /*
+     * ADS enumerate function only has WCHAR version, so we need to
+     * covert filename to utf-8 string.
+     */
+    ret = MultiByteToWideChar(CP_UTF8, 0, full_file_name,
+                              strlen(full_file_name), WideCharStr, NAME_MAX);
+    if (ret == 0) {
+        errno = EIO;
+        return -1;
+    }
+
+    hFind = FindFirstStreamW(WideCharStr, FindStreamInfoStandard, &fsd, 0);
+    if (hFind == INVALID_HANDLE_VALUE) {
+        errno = ENODATA;
+        return -1;
+    }
+
+    do {
+        memset(full_ads_name, 0, sizeof(full_ads_name));
+
+        /*
+         * ADS enumerate function only has WCHAR version, so we need to
+         * covert cStreamName to utf-8 string.
+         */
+        ret = WideCharToMultiByte(CP_UTF8, 0,
+                                  fsd.cStreamName, wcslen(fsd.cStreamName) + 1,
+                                  full_ads_name, sizeof(full_ads_name) - 1,
+                                  NULL, NULL);
+        if (ret == 0) {
+            if (GetLastError() == ERROR_INSUFFICIENT_BUFFER) {
+                errno = ERANGE;
+            }
+            CloseHandle(hFind);
+            return -1;
+        }
+
+        ret = copy_ads_name(list_ptr, list_left_size, full_ads_name);
+        if (ret < 0) {
+            errno = ERANGE;
+            CloseHandle(hFind);
+            return -1;
+        }
+
+        list_ptr = list_ptr + ret;
+        list_left_size = list_left_size - ret;
+
+        bFindNext = FindNextStreamW(hFind, &fsd);
+    } while (bFindNext);
+
+    CloseHandle(hFind);
+
+    return size - list_left_size;
+}
+
+/*
+ * fremovexattrat_nofollow - remove extended attribute
+ *
+ * This function removes an extended attribute from file <filename> in the
+ * directory specified by <dirfd>.
+ *
+ * This function emulates extended attribute by NTFS ADS.
+ */
+ssize_t fremovexattrat_nofollow(int dirfd, const char *filename,
+                                const char *name)
+{
+    g_autofree char *full_file_name = NULL;
+    char ads_file_name[NAME_MAX + 1] = { 0 };
+    HANDLE hDir = (HANDLE)_get_osfhandle(dirfd);
+
+    full_file_name = get_full_path_win32(hDir, filename);
+    if (full_file_name == NULL) {
+        errno = EIO;
+        return -1;
+    }
+
+    if (build_ads_name(ads_file_name, NAME_MAX, filename, name) < 0) {
+        errno = EIO;
+        return -1;
+    }
+
+    if (DeleteFile(ads_file_name) != 0) {
+        if (GetLastError() == ERROR_FILE_NOT_FOUND) {
+            errno = ENODATA;
+            return -1;
+        }
+    }
+
+    return 0;
+}
+
+/*
+ * local_opendir_nofollow - open a Windows directory
+ *
+ * This function returns a fd of the directory specified by
+ * <dirpath> based on 9pfs mount point.
+ *
+ * Windows POSIX API does not support opening a directory by open(). Only
+ * handle of directory can be opened by CreateFile().
+ * This function convert handle to fd by _open_osfhandle().
+ *
+ * This function checks the resolved path of <dirpath>. If the resolved
+ * path is not in the scope of root directory (e.g. by symbolic link), then
+ * this function will fail to prevent any security issues.
+ */
+int local_opendir_nofollow(FsContext *fs_ctx, const char *dirpath)
+{
+    g_autofree char *full_file_name = NULL;
+    LocalData *data = fs_ctx->private;
+    HANDLE hDir;
+    int dirfd;
+
+    dirfd = openat_dir(data->mountfd, dirpath);
+    if (dirfd == -1) {
+        return -1;
+    }
+    hDir = (HANDLE)_get_osfhandle(dirfd);
+
+    full_file_name = get_full_path_win32(hDir, NULL);
+    if (full_file_name == NULL) {
+        close(dirfd);
+        return -1;
+    }
+
+    /*
+     * Check if the resolved path is in the root directory scope:
+     * data->root_path and full_file_name are full path with symbolic
+     * link resolved, so fs_ctx->root_path must be in the head of
+     * full_file_name. If not, that means guest OS tries to open a file not
+     * in the scope of mount point. This operation should be denied.
+     */
+    if (memcmp(full_file_name, data->root_path,
+               strlen(data->root_path)) != 0) {
+        close(dirfd);
+        return -1;
+    }
+
+    return dirfd;
+}
+
+/*
+ * qemu_mknodat - mknodat emulate function
+ *
+ * This function emulates mknodat on Windows. It only works when security
+ * model is mapped or mapped-xattr.
+ */
+int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t dev)
+{
+    if (S_ISREG(mode) || !(mode & S_IFMT)) {
+        int fd = openat_file(dirfd, filename, O_CREAT, mode);
+        if (fd == -1) {
+            return -1;
+        }
+        close_preserve_errno(fd);
+        return 0;
+    }
+
+    error_report_once("Unsupported operation for mknodat");
+    errno = ENOTSUP;
+    return -1;
+}
-- 
2.25.1


