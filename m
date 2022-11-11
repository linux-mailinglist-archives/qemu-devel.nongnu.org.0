Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0690B62526A
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 05:24:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otLZZ-0000Vb-FK; Thu, 10 Nov 2022 23:23:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=83144312e2=bin.meng@windriver.com>)
 id 1otLZX-0000Um-AS
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 23:23:19 -0500
Received: from mx0b-0064b401.pphosted.com ([205.220.178.238])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=83144312e2=bin.meng@windriver.com>)
 id 1otLZU-0001Z2-Ac
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 23:23:19 -0500
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AB4N0iN024928; Fri, 11 Nov 2022 04:23:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=eO+j4U8lYVJulhU9rfL8NCdALTNM9uSn/kJ7Mrgg3KQ=;
 b=flesH5sTX58rUuKsfNGljbVCDNsU+jGvC0tyh2DLO+r00OVUjVpyyNCY6Mp+jNdJ456n
 n9oC6ijTQu1OqGlEDCzhJKMf4aIhnMZykOjg3k+ZPkZ8Nzc+behRAzbelMrF7yltlfgD
 S/Lxs0tDB1410QruSJHha5EY83uMg+y8ITsLKyPPUrR/5UoH7VAffuctxJYxrudEAPHj
 ISy9j7LtyrPFMs45vdM6azRmVOr1h1JFbZAPfCdqLQ0b7RC+WwZ3sygEE37e7GZ/IjJ+
 uE7bmWvLQkAscbCTVFY2Ucj6z7vMTRlGBcvczk9GQzSUnKll0Cv9ZO0mz5SWBxMkRFsV KA== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2103.outbound.protection.outlook.com [104.47.70.103])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3knd21ndvc-5
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Nov 2022 04:23:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EQlA7GoDLnBlCTac4aqc0JH6PsqmIos1JHnFFojiQ9dQnmtXPlSKxnYUzomp1F5G/sf+yh54dpSGiHDt8yTFSPuoNlXWIxz4tZ4rYEmHyITS5lBR9lNfd2fP6i5aaMXw451H2EPpl33X+DG0MqF88GMywa+QfqJfp3mt/D8J0fbyb1LSQUqaduXFWPvHb2dxosADxkFlfRIMuvarrowec7j5r6+UVC+0RE+7VtRs02Rqt1YHAPyNiV9pwETFP22a/o+9+0KlOvnOMjjWIHVP3kTLfS9NYGosU0P5j9iZA/NdZELcqBPnhTN4EDDFgqGhAnmrpuuUjpK38UuqDADCAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eO+j4U8lYVJulhU9rfL8NCdALTNM9uSn/kJ7Mrgg3KQ=;
 b=EP6g99lKbHAKORBtokD/leCXnaKMTxienybZHleUOovv5w80PFEtAepDUtQJziZLGg48PXaq1LGpPe1weFuEcZdu+SJCYJuxG/v8Eb818j9LdGMV2OvBC+5MX5cHkDJbNybpB2c8IYUuZc0g0Xv1C/AUe1Cjp7DEbS80f6k5vvIJsuTTlAL5uXfn+lCmIftq98xrFtPotARcYAbXDKFHL9eIRaHXV5PSATgRYnOGksuw5fZMA7qUg0c/Cgd/ih0xsXXDOL6Qtq2Q86MT6fxSzxAq3xJ5QWchmhqlPr6Bt5B72qOfqFwSBQeSuEE9hyjxHv6tnnTapPIbaH7amu+C3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5358.namprd11.prod.outlook.com (2603:10b6:5:395::7) by
 SJ0PR11MB5102.namprd11.prod.outlook.com (2603:10b6:a03:2ac::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27; Fri, 11 Nov
 2022 04:22:57 +0000
Received: from DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::8e5e:71da:1e29:bc15]) by DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::8e5e:71da:1e29:bc15%5]) with mapi id 15.20.5813.013; Fri, 11 Nov 2022
 04:22:56 +0000
From: Bin Meng <bin.meng@windriver.com>
To: qemu-devel@nongnu.org
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>
Subject: [PATCH v2 05/19] hw/9pfs: Update 9pfs to use the new QemuFd_t type
Date: Fri, 11 Nov 2022 12:22:11 +0800
Message-Id: <20221111042225.1115931-6-bin.meng@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: 54f4ee7d-b7c5-43e3-effd-08dac39c68ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6wueHGXveE5YEJ9zq73UvU4lY8Lt2i/miYBMZTls4F96Hr9l8ANajSwqi6F3RsursILssVo/tQKaipdWzYXPZI3irjegTQ6RwKu0f/hHLPjF8KxbxlomEkXt9FQJf/jRlfb1e8SbjvnX8VLLBZ0v91rmLONsPxPHN7zU2lcNR8Zym7H9SdiRJ6CGyCNOGI9WOPPXW3FOhusYEIRaO8bU23YdqGNMDGP+JcNiMMHZjUT7Lzq0OqNrQD/C8s0a6XBbL6qV1O4FrgeMTRRetmmuW4ZGUXSpvpGS9ZTF1h5Gk0zIRT4klRAq9pe9492f54kXq4gxxhecwc2y6sAJozSQ542mCK/TgVC6ACfu3vZLVVxcx01OmOD8DXqh158TGezFbq2wiS0YZBiJzI7mTq+B/M0/3i3zAdsPErcztNK9icZM5UbiLDNZG/F0JV+FvTxrISmrN3w8Z8R6fE6Sy1SOkeOfFejYamsTgymc7PrsWMMyQxrhgf+WmcTZA6xyGoxJxyCfCwlPPc5u1yToemrAYYmIjg+cLkHjTlHELMQpRl7sUAtzCzfZaRbsDjkgVsyGmM0wTadkLTepSq1mENO2C6rCVvQrQibUFMQ2wbYQdkg/PqwhBkxfmUI4q0bdBFZwQHe/y7hHEI4CC0oNAIcRxB1I6I5w4BPkVbpdoBt8Sn8JtCCxdeXWg3g/IJ7ZPuyUs4FpSNWKPEPnOA2tvYXIbCuSmer3P9fuPPRpPsyNzrqMXASFcQPMxN5yIRqqeco0pmHFnj3G7d+ngo1ua2cd7Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5358.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(346002)(376002)(39850400004)(366004)(136003)(451199015)(66556008)(316002)(86362001)(8676002)(66476007)(66946007)(4326008)(38350700002)(38100700002)(36756003)(44832011)(83380400001)(52116002)(6512007)(2616005)(1076003)(26005)(6506007)(478600001)(6666004)(186003)(6486002)(8936002)(30864003)(41300700001)(15650500001)(6916009)(2906002)(54906003)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dladdF7Et8Q2SgHAAwBXrAuv61LTA0r3ZeMO4Tk8nURWTSXVaTrG458KRFtu?=
 =?us-ascii?Q?M1fswtJSrjc15iwxgsLiyc7XEnNjk0JV8RILIae1mP9Duos2xPzqaivQXct7?=
 =?us-ascii?Q?oyO9I1nX6LreXz1mtSPFyiY63ocXkQ7iU74lfQx8fWGM2zDkRo3DjCcwLUsl?=
 =?us-ascii?Q?5ZhfiClvzAR0nXXchVIUd1YRzWj6VVAFTXNjZmM+YqR8isMrUxLgK5Je48db?=
 =?us-ascii?Q?W+7dF2b7S9c/o3m3Vl5pfp4nrQJa1WsTJNzQeRGNdjT2bCugpRWf8uiAXftR?=
 =?us-ascii?Q?hPGJqKR7rZn/DpMWEwHItNaEU5I6oSq8VsysI+l2sExdTRZthXCk3G8IPEVB?=
 =?us-ascii?Q?6fpdaZL2p9sbvdZwEQIQGhDvPae9fsqklJ8MVXfRCSyX0u6lXYpP+kpXj0Gl?=
 =?us-ascii?Q?AwNtHw+INj42PNfFm+XFFIVsJKoXoK/dGHb5xe5MWkJYdxLCOC/2NGZuzb/0?=
 =?us-ascii?Q?j37dbnFJrA07s1LtOrtsUkxaIONCMwaQ5IDecivqbqSt/6dawbW3PZTLX04D?=
 =?us-ascii?Q?s22wxfzHaSXbFZSnNLUhnH8cfeDC6b4XyjAkjK5jeXYdB5FDan9i+iBKn1Ik?=
 =?us-ascii?Q?cpMk44Q5iHVEOJ5yVGQazDnr25ZsWr6QcKdICWIBNz3xaNNKQrJLbg5OlgOq?=
 =?us-ascii?Q?5vgAL2hxoIkj18h3DZJlyjAOYK0dt3j/gGk3PFg6h4tYm3tMSv07GZ0DFVUJ?=
 =?us-ascii?Q?6NkqFPnJQfXwKJ9C3YgkcKhg3enLiGqoCX6E74Se4OIM8sBUyxUfG5bJq2Xn?=
 =?us-ascii?Q?PQUjufJKV6/zK7NL2qisKmuvfFn6zkA7Oey9uo7im359Y53k/8QW9ZXuYiX0?=
 =?us-ascii?Q?U62AytnCpUMo0RU7QkGhiNtuUeDFBWPg/t33sug0EE8my8aF7UY2J4Ty0Xs+?=
 =?us-ascii?Q?XnRZH0wl3L2DmDyPH7QXT7k4MMlYGB91dqmCOUbdZFccLA7hGt6hK9TU1pzB?=
 =?us-ascii?Q?/WAf1KMMp/5/ox0aWXOkJiy5C2bWitCdtw/UKr06cpH+MwRFVb+4UJBiZCYE?=
 =?us-ascii?Q?aCYwiRwbxhsBtr8rrP7Uey15rt7Cys5Kw6luym+GbaYUkTcnk6k0K6HJAwAo?=
 =?us-ascii?Q?fQKnufvXoRXR/POEScVn4ARoGuPVPTV6o7uH61qQUysq+Xjwi2SCQ18mXZPe?=
 =?us-ascii?Q?Hoxt0ibuIK7pEJ+ThSnO6678NIof/ELMxxGqAsxhfAj6VPLDhLjq4laxD8ur?=
 =?us-ascii?Q?dSsLxdzCQpAsDfGdf/5BJMJzJzFH7up4eIFUO1dEuij2M+RAzpftfbqN12BG?=
 =?us-ascii?Q?JuyRkVpAvazD01xnEdlyCds7hn/IZGn9LU9rlVRAJa1BljlbHhl0BH5rVnaR?=
 =?us-ascii?Q?mAUNT3uBQfkU2UZV60T567rE7SSnbjeykD5Yr6uHQUAwAQ2XKWYSRMqdV/Ec?=
 =?us-ascii?Q?/ruKZ5e//3Hf4PwhWbCzDyCUJLk7pJcBtjggNccMp1Z6Qudfibe/et2AKqvX?=
 =?us-ascii?Q?vqXtNhYV8MxTPtkghIq1QF4lreGn5VRRpqWoRIUf9Zazce9aKbs/uOoei9n7?=
 =?us-ascii?Q?cW7k8O7sy8A4uloDm1P8g/pC5X2z7zwQOASD6gtsg3vDEP7XkPrTy1KlQtcm?=
 =?us-ascii?Q?OYOaFW8sQRmiY7vLmjpsndfqG92f2iVQ8AU9MakW?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54f4ee7d-b7c5-43e3-effd-08dac39c68ca
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2022 04:22:56.9459 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RpQ3Qs9rW5qlRG5a3QWWvDD+OYNuZwYE66GaqPLSv8x2m7+qaJ0EKFXILOi/NwDjxyeQZNaRCHzFB8vibeMlWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5102
X-Proofpoint-GUID: BhplmFcIvXXolupRXi0PUh5MOPGeaR6k
X-Proofpoint-ORIG-GUID: BhplmFcIvXXolupRXi0PUh5MOPGeaR6k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-11_01,2022-11-09_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015
 suspectscore=0 lowpriorityscore=0 mlxscore=0 malwarescore=0 adultscore=0
 bulkscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 mlxlogscore=916 classifier=spam adjust=0 reason=mlx scancount=1
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

With this new QemuFd_t type, it significantly reduces the number of
deviated code paths when adding Windows support.

Signed-off-by: Bin Meng <bin.meng@windriver.com>

---

Changes in v2:
- Use the new QemuFd_t type

 hw/9pfs/9p-local.h       |   6 +-
 hw/9pfs/9p-util.h        |  26 +++---
 hw/9pfs/9p-local.c       | 174 ++++++++++++++++++++-------------------
 hw/9pfs/9p-util-darwin.c |  14 ++--
 hw/9pfs/9p-util-linux.c  |  14 ++--
 hw/9pfs/9p-xattr.c       |  16 ++--
 6 files changed, 129 insertions(+), 121 deletions(-)

diff --git a/hw/9pfs/9p-local.h b/hw/9pfs/9p-local.h
index 32c72749d9..66a21316a0 100644
--- a/hw/9pfs/9p-local.h
+++ b/hw/9pfs/9p-local.h
@@ -13,8 +13,8 @@
 #ifndef QEMU_9P_LOCAL_H
 #define QEMU_9P_LOCAL_H
 
-int local_open_nofollow(FsContext *fs_ctx, const char *path, int flags,
-                        mode_t mode);
-int local_opendir_nofollow(FsContext *fs_ctx, const char *path);
+QemuFd_t local_open_nofollow(FsContext *fs_ctx, const char *path, int flags,
+                             mode_t mode);
+QemuFd_t local_opendir_nofollow(FsContext *fs_ctx, const char *path);
 
 #endif
diff --git a/hw/9pfs/9p-util.h b/hw/9pfs/9p-util.h
index c314cf381d..3d6bd1a51e 100644
--- a/hw/9pfs/9p-util.h
+++ b/hw/9pfs/9p-util.h
@@ -101,30 +101,31 @@ static inline int errno_to_dotl(int err) {
 #define qemu_utimensat  utimensat
 #define qemu_unlinkat   unlinkat
 
-static inline void close_preserve_errno(int fd)
+static inline void close_preserve_errno(QemuFd_t fd)
 {
     int serrno = errno;
     close(fd);
     errno = serrno;
 }
 
-static inline int openat_dir(int dirfd, const char *name)
+static inline QemuFd_t openat_dir(QemuFd_t dirfd, const char *name)
 {
     return qemu_openat(dirfd, name,
                        O_DIRECTORY | O_RDONLY | O_NOFOLLOW | O_PATH_9P_UTIL);
 }
 
-static inline int openat_file(int dirfd, const char *name, int flags,
-                              mode_t mode)
+static inline QemuFd_t openat_file(QemuFd_t dirfd, const char *name,
+                                   int flags, mode_t mode)
 {
-    int fd, serrno, ret;
+    int serrno, ret;
+    QemuFd_t fd;
 
 #ifndef CONFIG_DARWIN
 again:
 #endif
     fd = qemu_openat(dirfd, name, flags | O_NOFOLLOW | O_NOCTTY | O_NONBLOCK,
                      mode);
-    if (fd == -1) {
+    if (qemu_fd_invalid(fd)) {
 #ifndef CONFIG_DARWIN
         if (errno == EPERM && (flags & O_NOATIME)) {
             /*
@@ -155,13 +156,13 @@ again:
     return fd;
 }
 
-ssize_t fgetxattrat_nofollow(int dirfd, const char *path, const char *name,
-                             void *value, size_t size);
-int fsetxattrat_nofollow(int dirfd, const char *path, const char *name,
+ssize_t fgetxattrat_nofollow(QemuFd_t dirfd, const char *path,
+                             const char *name, void *value, size_t size);
+int fsetxattrat_nofollow(QemuFd_t dirfd, const char *path, const char *name,
                          void *value, size_t size, int flags);
-ssize_t flistxattrat_nofollow(int dirfd, const char *filename,
+ssize_t flistxattrat_nofollow(QemuFd_t dirfd, const char *filename,
                               char *list, size_t size);
-ssize_t fremovexattrat_nofollow(int dirfd, const char *filename,
+ssize_t fremovexattrat_nofollow(QemuFd_t dirfd, const char *filename,
                                 const char *name);
 
 /*
@@ -219,6 +220,7 @@ static inline struct dirent *qemu_dirent_dup(struct dirent *dent)
 #if defined CONFIG_DARWIN && defined CONFIG_PTHREAD_FCHDIR_NP
 int pthread_fchdir_np(int fd) __attribute__((weak_import));
 #endif
-int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t dev);
+int qemu_mknodat(QemuFd_t dirfd, const char *filename, mode_t mode,
+                 dev_t dev);
 
 #endif
diff --git a/hw/9pfs/9p-local.c b/hw/9pfs/9p-local.c
index d2246a3d7e..22377a3105 100644
--- a/hw/9pfs/9p-local.c
+++ b/hw/9pfs/9p-local.c
@@ -54,18 +54,18 @@
 #endif
 
 typedef struct {
-    int mountfd;
+    QemuFd_t mountfd;
 } LocalData;
 
-int local_open_nofollow(FsContext *fs_ctx, const char *path, int flags,
-                        mode_t mode)
+QemuFd_t local_open_nofollow(FsContext *fs_ctx, const char *path, int flags,
+                             mode_t mode)
 {
     LocalData *data = fs_ctx->private;
-    int fd = data->mountfd;
+    QemuFd_t fd = data->mountfd;
 
-    while (*path && fd != -1) {
+    while (*path && !qemu_fd_invalid(fd)) {
         const char *c;
-        int next_fd;
+        QemuFd_t next_fd;
         char *head;
 
         /* Only relative paths without consecutive slashes */
@@ -94,20 +94,21 @@ int local_open_nofollow(FsContext *fs_ctx, const char *path, int flags,
     return fd;
 }
 
-int local_opendir_nofollow(FsContext *fs_ctx, const char *path)
+QemuFd_t local_opendir_nofollow(FsContext *fs_ctx, const char *path)
 {
     return local_open_nofollow(fs_ctx, path, O_DIRECTORY | O_RDONLY, 0);
 }
 
-static void renameat_preserve_errno(int odirfd, const char *opath, int ndirfd,
-                                    const char *npath)
+static void renameat_preserve_errno(QemuFd_t odirfd, const char *opath,
+                                    QemuFd_t ndirfd, const char *npath)
 {
     int serrno = errno;
     qemu_renameat(odirfd, opath, ndirfd, npath);
     errno = serrno;
 }
 
-static void unlinkat_preserve_errno(int dirfd, const char *path, int flags)
+static void unlinkat_preserve_errno(QemuFd_t dirfd, const char *path,
+                                    int flags)
 {
     int serrno = errno;
     qemu_unlinkat(dirfd, path, flags);
@@ -117,9 +118,10 @@ static void unlinkat_preserve_errno(int dirfd, const char *path, int flags)
 #define VIRTFS_META_DIR ".virtfs_metadata"
 #define VIRTFS_META_ROOT_FILE VIRTFS_META_DIR "_root"
 
-static FILE *local_fopenat(int dirfd, const char *name, const char *mode)
+static FILE *local_fopenat(QemuFd_t dirfd, const char *name, const char *mode)
 {
-    int fd, o_mode = 0;
+    QemuFd_t fd;
+    int o_mode = 0;
     FILE *fp;
     int flags;
     /*
@@ -134,7 +136,7 @@ static FILE *local_fopenat(int dirfd, const char *name, const char *mode)
         return NULL;
     }
     fd = openat_file(dirfd, name, flags, o_mode);
-    if (fd == -1) {
+    if (qemu_fd_invalid(fd)) {
         return NULL;
     }
     fp = fdopen(fd, mode);
@@ -145,16 +147,16 @@ static FILE *local_fopenat(int dirfd, const char *name, const char *mode)
 }
 
 #define ATTR_MAX 100
-static void local_mapped_file_attr(int dirfd, const char *name,
+static void local_mapped_file_attr(QemuFd_t dirfd, const char *name,
                                    struct stat *stbuf)
 {
     FILE *fp;
     char buf[ATTR_MAX];
-    int map_dirfd;
+    QemuFd_t map_dirfd;
 
     if (strcmp(name, ".")) {
         map_dirfd = openat_dir(dirfd, VIRTFS_META_DIR);
-        if (map_dirfd == -1) {
+        if (qemu_fd_invalid(map_dirfd)) {
             return;
         }
 
@@ -187,10 +189,10 @@ static int local_lstat(FsContext *fs_ctx, V9fsPath *fs_path, struct stat *stbuf)
     int err = -1;
     char *dirpath = g_path_get_dirname(fs_path->data);
     char *name = g_path_get_basename(fs_path->data);
-    int dirfd;
+    QemuFd_t dirfd;
 
     dirfd = local_opendir_nofollow(fs_ctx, dirpath);
-    if (dirfd == -1) {
+    if (qemu_fd_invalid(dirfd)) {
         goto out;
     }
 
@@ -233,14 +235,14 @@ out:
     return err;
 }
 
-static int local_set_mapped_file_attrat(int dirfd, const char *name,
+static int local_set_mapped_file_attrat(QemuFd_t dirfd, const char *name,
                                         FsCred *credp)
 {
     FILE *fp;
     int ret;
     char buf[ATTR_MAX];
     int uid = -1, gid = -1, mode = -1, rdev = -1;
-    int map_dirfd = -1, map_fd;
+    QemuFd_t map_dirfd = QEMU_FD_INVALID, map_fd;
     bool is_root = !strcmp(name, ".");
 
     if (is_root) {
@@ -259,7 +261,7 @@ static int local_set_mapped_file_attrat(int dirfd, const char *name,
         }
 
         map_dirfd = openat_dir(dirfd, VIRTFS_META_DIR);
-        if (map_dirfd == -1) {
+        if (qemu_fd_invalid(map_dirfd)) {
             return -1;
         }
 
@@ -296,7 +298,7 @@ update_map_file:
         /* We can't go this far with map_dirfd not being a valid file descriptor
          * but some versions of gcc aren't smart enough to see it.
          */
-        if (map_dirfd != -1) {
+        if (!qemu_fd_invalid(map_dirfd)) {
             close_preserve_errno(map_dirfd);
         }
     }
@@ -305,7 +307,7 @@ update_map_file:
     }
 
     map_fd = fileno(fp);
-    assert(map_fd != -1);
+    assert(!qemu_fd_invalid(map_fd));
     ret = fchmod(map_fd, 0600);
     assert(ret == 0);
 
@@ -339,10 +341,11 @@ update_map_file:
     return 0;
 }
 
-static int fchmodat_nofollow(int dirfd, const char *name, mode_t mode)
+static int fchmodat_nofollow(QemuFd_t dirfd, const char *name, mode_t mode)
 {
     struct stat stbuf;
-    int fd, ret;
+    QemuFd_t fd;
+    int ret;
 
     /* FIXME: this should be handled with fchmodat(AT_SYMLINK_NOFOLLOW).
      * Unfortunately, the linux kernel doesn't implement it yet.
@@ -362,16 +365,16 @@ static int fchmodat_nofollow(int dirfd, const char *name, mode_t mode)
     /* Fallback for systems that don't support O_PATH: we depend on the file
      * being readable or writable.
      */
-    if (fd == -1) {
+    if (qemu_fd_invalid(fd)) {
         /* In case the file is writable-only and isn't a directory. */
         if (errno == EACCES) {
             fd = openat_file(dirfd, name, O_WRONLY, 0);
         }
-        if (fd == -1 && errno == EISDIR) {
+        if (qemu_fd_invalid(fd) && errno == EISDIR) {
             errno = EACCES;
         }
     }
-    if (fd == -1) {
+    if (qemu_fd_invalid(fd)) {
         return -1;
     }
     ret = fchmod(fd, mode);
@@ -380,7 +383,7 @@ static int fchmodat_nofollow(int dirfd, const char *name, mode_t mode)
      * link, O_PATH | O_NOFOLLOW causes openat(2) to return a file descriptor
      * referring to the symbolic link.
      */
-    if (fd == -1) {
+    if (qemu_fd_invalid(fd)) {
         return -1;
     }
 
@@ -401,7 +404,7 @@ static int fchmodat_nofollow(int dirfd, const char *name, mode_t mode)
     return ret;
 }
 
-static int local_set_xattrat(int dirfd, const char *path, FsCred *credp)
+static int local_set_xattrat(QemuFd_t dirfd, const char *path, FsCred *credp)
 {
     int err;
 
@@ -440,7 +443,7 @@ static int local_set_xattrat(int dirfd, const char *path, FsCred *credp)
     return 0;
 }
 
-static int local_set_cred_passthrough(FsContext *fs_ctx, int dirfd,
+static int local_set_cred_passthrough(FsContext *fs_ctx, QemuFd_t dirfd,
                                       const char *name, FsCred *credp)
 {
     if (fchownat(dirfd, name, credp->fc_uid, credp->fc_gid,
@@ -464,10 +467,10 @@ static ssize_t local_readlink(FsContext *fs_ctx, V9fsPath *fs_path,
 
     if ((fs_ctx->export_flags & V9FS_SM_MAPPED) ||
         (fs_ctx->export_flags & V9FS_SM_MAPPED_FILE)) {
-        int fd;
+        QemuFd_t fd;
 
         fd = local_open_nofollow(fs_ctx, fs_path->data, O_RDONLY, 0);
-        if (fd == -1) {
+        if (qemu_fd_invalid(fd)) {
             return -1;
         }
         do {
@@ -478,10 +481,10 @@ static ssize_t local_readlink(FsContext *fs_ctx, V9fsPath *fs_path,
                (fs_ctx->export_flags & V9FS_SM_NONE)) {
         char *dirpath = g_path_get_dirname(fs_path->data);
         char *name = g_path_get_basename(fs_path->data);
-        int dirfd;
+        QemuFd_t dirfd;
 
         dirfd = local_opendir_nofollow(fs_ctx, dirpath);
-        if (dirfd == -1) {
+        if (qemu_fd_invalid(dirfd)) {
             goto out;
         }
 
@@ -507,10 +510,10 @@ static int local_closedir(FsContext *ctx, V9fsFidOpenState *fs)
 static int local_open(FsContext *ctx, V9fsPath *fs_path,
                       int flags, V9fsFidOpenState *fs)
 {
-    int fd;
+    QemuFd_t fd;
 
     fd = local_open_nofollow(ctx, fs_path->data, flags, 0);
-    if (fd == -1) {
+    if (qemu_fd_invalid(fd)) {
         return -1;
     }
     fs->fd = fd;
@@ -520,11 +523,11 @@ static int local_open(FsContext *ctx, V9fsPath *fs_path,
 static int local_opendir(FsContext *ctx,
                          V9fsPath *fs_path, V9fsFidOpenState *fs)
 {
-    int dirfd;
+    QemuFd_t dirfd;
     DIR *stream;
 
     dirfd = local_opendir_nofollow(ctx, fs_path->data);
-    if (dirfd == -1) {
+    if (qemu_fd_invalid(dirfd)) {
         return -1;
     }
 
@@ -640,10 +643,10 @@ static int local_chmod(FsContext *fs_ctx, V9fsPath *fs_path, FsCred *credp)
     char *dirpath = g_path_get_dirname(fs_path->data);
     char *name = g_path_get_basename(fs_path->data);
     int ret = -1;
-    int dirfd;
+    QemuFd_t dirfd;
 
     dirfd = local_opendir_nofollow(fs_ctx, dirpath);
-    if (dirfd == -1) {
+    if (qemu_fd_invalid(dirfd)) {
         goto out;
     }
 
@@ -667,7 +670,7 @@ static int local_mknod(FsContext *fs_ctx, V9fsPath *dir_path,
                        const char *name, FsCred *credp)
 {
     int err = -1;
-    int dirfd;
+    QemuFd_t dirfd;
 
     if (fs_ctx->export_flags & V9FS_SM_MAPPED_FILE &&
         local_is_mapped_file_metadata(fs_ctx, name)) {
@@ -676,7 +679,7 @@ static int local_mknod(FsContext *fs_ctx, V9fsPath *dir_path,
     }
 
     dirfd = local_opendir_nofollow(fs_ctx, dir_path->data);
-    if (dirfd == -1) {
+    if (qemu_fd_invalid(dirfd)) {
         return -1;
     }
 
@@ -719,7 +722,7 @@ static int local_mkdir(FsContext *fs_ctx, V9fsPath *dir_path,
                        const char *name, FsCred *credp)
 {
     int err = -1;
-    int dirfd;
+    QemuFd_t dirfd;
 
     if (fs_ctx->export_flags & V9FS_SM_MAPPED_FILE &&
         local_is_mapped_file_metadata(fs_ctx, name)) {
@@ -728,7 +731,7 @@ static int local_mkdir(FsContext *fs_ctx, V9fsPath *dir_path,
     }
 
     dirfd = local_opendir_nofollow(fs_ctx, dir_path->data);
-    if (dirfd == -1) {
+    if (qemu_fd_invalid(dirfd)) {
         return -1;
     }
 
@@ -816,9 +819,9 @@ static int local_fstat(FsContext *fs_ctx, int fid_type,
 static int local_open2(FsContext *fs_ctx, V9fsPath *dir_path, const char *name,
                        int flags, FsCred *credp, V9fsFidOpenState *fs)
 {
-    int fd = -1;
+    QemuFd_t fd = QEMU_FD_INVALID;
     int err = -1;
-    int dirfd;
+    QemuFd_t dirfd;
 
     if (fs_ctx->export_flags & V9FS_SM_MAPPED_FILE &&
         local_is_mapped_file_metadata(fs_ctx, name)) {
@@ -832,7 +835,7 @@ static int local_open2(FsContext *fs_ctx, V9fsPath *dir_path, const char *name,
     flags |= O_NOFOLLOW;
 
     dirfd = local_opendir_nofollow(fs_ctx, dir_path->data);
-    if (dirfd == -1) {
+    if (qemu_fd_invalid(dirfd)) {
         return -1;
     }
 
@@ -840,7 +843,7 @@ static int local_open2(FsContext *fs_ctx, V9fsPath *dir_path, const char *name,
     if (fs_ctx->export_flags & V9FS_SM_MAPPED ||
         fs_ctx->export_flags & V9FS_SM_MAPPED_FILE) {
         fd = openat_file(dirfd, name, flags, fs_ctx->fmode);
-        if (fd == -1) {
+        if (qemu_fd_invalid(fd)) {
             goto out;
         }
         credp->fc_mode = credp->fc_mode | S_IFREG;
@@ -856,7 +859,7 @@ static int local_open2(FsContext *fs_ctx, V9fsPath *dir_path, const char *name,
     } else if ((fs_ctx->export_flags & V9FS_SM_PASSTHROUGH) ||
                (fs_ctx->export_flags & V9FS_SM_NONE)) {
         fd = openat_file(dirfd, name, flags, credp->fc_mode);
-        if (fd == -1) {
+        if (qemu_fd_invalid(fd)) {
             goto out;
         }
         err = local_set_cred_passthrough(fs_ctx, dirfd, name, credp);
@@ -882,7 +885,7 @@ static int local_symlink(FsContext *fs_ctx, const char *oldpath,
                          V9fsPath *dir_path, const char *name, FsCred *credp)
 {
     int err = -1;
-    int dirfd;
+    QemuFd_t dirfd;
 
     if (fs_ctx->export_flags & V9FS_SM_MAPPED_FILE &&
         local_is_mapped_file_metadata(fs_ctx, name)) {
@@ -891,19 +894,19 @@ static int local_symlink(FsContext *fs_ctx, const char *oldpath,
     }
 
     dirfd = local_opendir_nofollow(fs_ctx, dir_path->data);
-    if (dirfd == -1) {
+    if (qemu_fd_invalid(dirfd)) {
         return -1;
     }
 
     /* Determine the security model */
     if (fs_ctx->export_flags & V9FS_SM_MAPPED ||
         fs_ctx->export_flags & V9FS_SM_MAPPED_FILE) {
-        int fd;
+        QemuFd_t fd;
         ssize_t oldpath_size, write_size;
 
         fd = openat_file(dirfd, name, O_CREAT | O_EXCL | O_RDWR,
                          fs_ctx->fmode);
-        if (fd == -1) {
+        if (qemu_fd_invalid(fd)) {
             goto out;
         }
         /* Write the oldpath (target) to the file. */
@@ -962,7 +965,7 @@ static int local_link(FsContext *ctx, V9fsPath *oldpath,
     char *odirpath = g_path_get_dirname(oldpath->data);
     char *oname = g_path_get_basename(oldpath->data);
     int ret = -1;
-    int odirfd, ndirfd;
+    QemuFd_t odirfd, ndirfd;
 
     if (ctx->export_flags & V9FS_SM_MAPPED_FILE &&
         local_is_mapped_file_metadata(ctx, name)) {
@@ -971,12 +974,12 @@ static int local_link(FsContext *ctx, V9fsPath *oldpath,
     }
 
     odirfd = local_opendir_nofollow(ctx, odirpath);
-    if (odirfd == -1) {
+    if (qemu_fd_invalid(odirfd)) {
         goto out;
     }
 
     ndirfd = local_opendir_nofollow(ctx, dirpath->data);
-    if (ndirfd == -1) {
+    if (qemu_fd_invalid(ndirfd)) {
         close_preserve_errno(odirfd);
         goto out;
     }
@@ -996,12 +999,12 @@ static int local_link(FsContext *ctx, V9fsPath *oldpath,
         }
 
         omap_dirfd = openat_dir(odirfd, VIRTFS_META_DIR);
-        if (omap_dirfd == -1) {
+        if (qemu_fd_invalid(omap_dirfd)) {
             goto err;
         }
 
         nmap_dirfd = openat_dir(ndirfd, VIRTFS_META_DIR);
-        if (nmap_dirfd == -1) {
+        if (qemu_fd_invalid(nmap_dirfd)) {
             close_preserve_errno(omap_dirfd);
             goto err;
         }
@@ -1032,10 +1035,11 @@ out:
 
 static int local_truncate(FsContext *ctx, V9fsPath *fs_path, off_t size)
 {
-    int fd, ret;
+    QemuFd_t fd;
+    int ret;
 
     fd = local_open_nofollow(ctx, fs_path->data, O_WRONLY, 0);
-    if (fd == -1) {
+    if (qemu_fd_invalid(fd)) {
         return -1;
     }
     ret = ftruncate(fd, size);
@@ -1048,10 +1052,10 @@ static int local_chown(FsContext *fs_ctx, V9fsPath *fs_path, FsCred *credp)
     char *dirpath = g_path_get_dirname(fs_path->data);
     char *name = g_path_get_basename(fs_path->data);
     int ret = -1;
-    int dirfd;
+    QemuFd_t dirfd;
 
     dirfd = local_opendir_nofollow(fs_ctx, dirpath);
-    if (dirfd == -1) {
+    if (qemu_fd_invalid(dirfd)) {
         goto out;
     }
 
@@ -1078,10 +1082,11 @@ static int local_utimensat(FsContext *s, V9fsPath *fs_path,
 {
     char *dirpath = g_path_get_dirname(fs_path->data);
     char *name = g_path_get_basename(fs_path->data);
-    int dirfd, ret = -1;
+    QemuFd_t dirfd;
+    int ret = -1;
 
     dirfd = local_opendir_nofollow(s, dirpath);
-    if (dirfd == -1) {
+    if (qemu_fd_invalid(dirfd)) {
         goto out;
     }
 
@@ -1093,13 +1098,13 @@ out:
     return ret;
 }
 
-static int local_unlinkat_common(FsContext *ctx, int dirfd, const char *name,
-                                 int flags)
+static int local_unlinkat_common(FsContext *ctx, QemuFd_t dirfd,
+                                 const char *name, int flags)
 {
     int ret;
 
     if (ctx->export_flags & V9FS_SM_MAPPED_FILE) {
-        int map_dirfd;
+        QemuFd_t map_dirfd;
 
         /* We need to remove the metadata as well:
          * - the metadata directory if we're removing a directory
@@ -1110,10 +1115,10 @@ static int local_unlinkat_common(FsContext *ctx, int dirfd, const char *name,
          * mode. We just ignore the error.
          */
         if (flags == AT_REMOVEDIR) {
-            int fd;
+            QemuFd_t fd;
 
             fd = openat_dir(dirfd, name);
-            if (fd == -1) {
+            if (qemu_fd_invalid(fd)) {
                 return -1;
             }
             ret = qemu_unlinkat(fd, VIRTFS_META_DIR, AT_REMOVEDIR);
@@ -1123,7 +1128,7 @@ static int local_unlinkat_common(FsContext *ctx, int dirfd, const char *name,
             }
         }
         map_dirfd = openat_dir(dirfd, VIRTFS_META_DIR);
-        if (map_dirfd != -1) {
+        if (!qemu_fd_invalid(map_dirfd)) {
             ret = qemu_unlinkat(map_dirfd, name, 0);
             close_preserve_errno(map_dirfd);
             if (ret < 0 && errno != ENOENT) {
@@ -1143,11 +1148,11 @@ static int local_remove(FsContext *ctx, const char *path)
     char *dirpath = g_path_get_dirname(path);
     char *name = g_path_get_basename(path);
     int flags = 0;
-    int dirfd;
+    QemuFd_t dirfd;
     int err = -1;
 
     dirfd = local_opendir_nofollow(ctx, dirpath);
-    if (dirfd == -1) {
+    if (qemu_fd_invalid(dirfd)) {
         goto out;
     }
 
@@ -1188,10 +1193,11 @@ static int local_fsync(FsContext *ctx, int fid_type,
 
 static int local_statfs(FsContext *s, V9fsPath *fs_path, struct statfs *stbuf)
 {
-    int fd, ret;
+    QemuFd_t fd;
+    int ret;
 
     fd = local_open_nofollow(s, fs_path->data, O_RDONLY, 0);
-    if (fd == -1) {
+    if (qemu_fd_invalid(fd)) {
         return -1;
     }
     ret = fstatfs(fd, stbuf);
@@ -1276,7 +1282,7 @@ static int local_renameat(FsContext *ctx, V9fsPath *olddir,
                           const char *new_name)
 {
     int ret;
-    int odirfd, ndirfd;
+    QemuFd_t odirfd, ndirfd;
 
     if (ctx->export_flags & V9FS_SM_MAPPED_FILE &&
         (local_is_mapped_file_metadata(ctx, old_name) ||
@@ -1286,12 +1292,12 @@ static int local_renameat(FsContext *ctx, V9fsPath *olddir,
     }
 
     odirfd = local_opendir_nofollow(ctx, olddir->data);
-    if (odirfd == -1) {
+    if (qemu_fd_invalid(odirfd)) {
         return -1;
     }
 
     ndirfd = local_opendir_nofollow(ctx, newdir->data);
-    if (ndirfd == -1) {
+    if (qemu_fd_invalid(ndirfd)) {
         close_preserve_errno(odirfd);
         return -1;
     }
@@ -1302,7 +1308,7 @@ static int local_renameat(FsContext *ctx, V9fsPath *olddir,
     }
 
     if (ctx->export_flags & V9FS_SM_MAPPED_FILE) {
-        int omap_dirfd, nmap_dirfd;
+        QemuFd_t omap_dirfd, nmap_dirfd;
 
         ret = qemu_mkdirat(ndirfd, VIRTFS_META_DIR, 0700);
         if (ret < 0 && errno != EEXIST) {
@@ -1310,12 +1316,12 @@ static int local_renameat(FsContext *ctx, V9fsPath *olddir,
         }
 
         omap_dirfd = openat_dir(odirfd, VIRTFS_META_DIR);
-        if (omap_dirfd == -1) {
+        if (qemu_fd_invalid(omap_dirfd)) {
             goto err;
         }
 
         nmap_dirfd = openat_dir(ndirfd, VIRTFS_META_DIR);
-        if (nmap_dirfd == -1) {
+        if (qemu_fd_invalid(nmap_dirfd)) {
             close_preserve_errno(omap_dirfd);
             goto err;
         }
@@ -1373,7 +1379,7 @@ static int local_unlinkat(FsContext *ctx, V9fsPath *dir,
                           const char *name, int flags)
 {
     int ret;
-    int dirfd;
+    QemuFd_t dirfd;
 
     if (ctx->export_flags & V9FS_SM_MAPPED_FILE &&
         local_is_mapped_file_metadata(ctx, name)) {
@@ -1382,7 +1388,7 @@ static int local_unlinkat(FsContext *ctx, V9fsPath *dir,
     }
 
     dirfd = local_opendir_nofollow(ctx, dir->data);
-    if (dirfd == -1) {
+    if (qemu_fd_invalid(dirfd)) {
         return -1;
     }
 
@@ -1446,7 +1452,7 @@ static int local_init(FsContext *ctx, Error **errp)
     LocalData *data = g_malloc(sizeof(*data));
 
     data->mountfd = open(ctx->fs_root, O_DIRECTORY | O_RDONLY);
-    if (data->mountfd == -1) {
+    if (qemu_fd_invalid(data->mountfd)) {
         error_setg_errno(errp, errno, "failed to open '%s'", ctx->fs_root);
         goto err;
     }
diff --git a/hw/9pfs/9p-util-darwin.c b/hw/9pfs/9p-util-darwin.c
index 95146e7354..f85cfd26bb 100644
--- a/hw/9pfs/9p-util-darwin.c
+++ b/hw/9pfs/9p-util-darwin.c
@@ -11,8 +11,8 @@
 #include "qemu/error-report.h"
 #include "9p-util.h"
 
-ssize_t fgetxattrat_nofollow(int dirfd, const char *filename, const char *name,
-                             void *value, size_t size)
+ssize_t fgetxattrat_nofollow(QemuFd_t dirfd, const char *filename,
+                             const char *name, void *value, size_t size)
 {
     int ret;
     int fd = openat_file(dirfd, filename,
@@ -25,7 +25,7 @@ ssize_t fgetxattrat_nofollow(int dirfd, const char *filename, const char *name,
     return ret;
 }
 
-ssize_t flistxattrat_nofollow(int dirfd, const char *filename,
+ssize_t flistxattrat_nofollow(QemuFd_t dirfd, const char *filename,
                               char *list, size_t size)
 {
     int ret;
@@ -39,7 +39,7 @@ ssize_t flistxattrat_nofollow(int dirfd, const char *filename,
     return ret;
 }
 
-ssize_t fremovexattrat_nofollow(int dirfd, const char *filename,
+ssize_t fremovexattrat_nofollow(QemuFd_t dirfd, const char *filename,
                                 const char *name)
 {
     int ret;
@@ -52,8 +52,8 @@ ssize_t fremovexattrat_nofollow(int dirfd, const char *filename,
     return ret;
 }
 
-int fsetxattrat_nofollow(int dirfd, const char *filename, const char *name,
-                         void *value, size_t size, int flags)
+int fsetxattrat_nofollow(QemuFd_t dirfd, const char *filename,
+                         const char *name, void *value, size_t size, int flags)
 {
     int ret;
     int fd = openat_file(dirfd, filename, O_PATH_9P_UTIL | O_NOFOLLOW, 0);
@@ -110,7 +110,7 @@ out:
     return err;
 }
 
-int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t dev)
+int qemu_mknodat(QemuFd_t dirfd, const char *filename, mode_t mode, dev_t dev)
 {
     int preserved_errno, err;
 
diff --git a/hw/9pfs/9p-util-linux.c b/hw/9pfs/9p-util-linux.c
index db451b0784..8dd9da10b6 100644
--- a/hw/9pfs/9p-util-linux.c
+++ b/hw/9pfs/9p-util-linux.c
@@ -19,8 +19,8 @@
 #include "qemu/xattr.h"
 #include "9p-util.h"
 
-ssize_t fgetxattrat_nofollow(int dirfd, const char *filename, const char *name,
-                             void *value, size_t size)
+ssize_t fgetxattrat_nofollow(QemuFd_t dirfd, const char *filename,
+                             const char *name, void *value, size_t size)
 {
     char *proc_path = g_strdup_printf("/proc/self/fd/%d/%s", dirfd, filename);
     int ret;
@@ -30,7 +30,7 @@ ssize_t fgetxattrat_nofollow(int dirfd, const char *filename, const char *name,
     return ret;
 }
 
-ssize_t flistxattrat_nofollow(int dirfd, const char *filename,
+ssize_t flistxattrat_nofollow(QemuFd_t dirfd, const char *filename,
                               char *list, size_t size)
 {
     char *proc_path = g_strdup_printf("/proc/self/fd/%d/%s", dirfd, filename);
@@ -41,7 +41,7 @@ ssize_t flistxattrat_nofollow(int dirfd, const char *filename,
     return ret;
 }
 
-ssize_t fremovexattrat_nofollow(int dirfd, const char *filename,
+ssize_t fremovexattrat_nofollow(QemuFd_t dirfd, const char *filename,
                                 const char *name)
 {
     char *proc_path = g_strdup_printf("/proc/self/fd/%d/%s", dirfd, filename);
@@ -52,8 +52,8 @@ ssize_t fremovexattrat_nofollow(int dirfd, const char *filename,
     return ret;
 }
 
-int fsetxattrat_nofollow(int dirfd, const char *filename, const char *name,
-                         void *value, size_t size, int flags)
+int fsetxattrat_nofollow(QemuFd_t dirfd, const char *filename,
+                         const char *name, void *value, size_t size, int flags)
 {
     char *proc_path = g_strdup_printf("/proc/self/fd/%d/%s", dirfd, filename);
     int ret;
@@ -64,7 +64,7 @@ int fsetxattrat_nofollow(int dirfd, const char *filename, const char *name,
 
 }
 
-int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t dev)
+int qemu_mknodat(QemuFd_t dirfd, const char *filename, mode_t mode, dev_t dev)
 {
     return mknodat(dirfd, filename, mode, dev);
 }
diff --git a/hw/9pfs/9p-xattr.c b/hw/9pfs/9p-xattr.c
index 9ae69dd8db..062bf2d1f0 100644
--- a/hw/9pfs/9p-xattr.c
+++ b/hw/9pfs/9p-xattr.c
@@ -78,13 +78,13 @@ ssize_t v9fs_list_xattr(FsContext *ctx, const char *path,
     char *orig_value, *orig_value_start;
     ssize_t xattr_len, parsed_len = 0, attr_len;
     char *dirpath, *name;
-    int dirfd;
+    QemuFd_t dirfd;
 
     /* Get the actual len */
     dirpath = g_path_get_dirname(path);
     dirfd = local_opendir_nofollow(ctx, dirpath);
     g_free(dirpath);
-    if (dirfd == -1) {
+    if (qemu_fd_invalid(dirfd)) {
         return -1;
     }
 
@@ -168,11 +168,11 @@ ssize_t local_getxattr_nofollow(FsContext *ctx, const char *path,
 {
     char *dirpath = g_path_get_dirname(path);
     char *filename = g_path_get_basename(path);
-    int dirfd;
+    QemuFd_t dirfd;
     ssize_t ret = -1;
 
     dirfd = local_opendir_nofollow(ctx, dirpath);
-    if (dirfd == -1) {
+    if (qemu_fd_invalid(dirfd)) {
         goto out;
     }
 
@@ -196,11 +196,11 @@ ssize_t local_setxattr_nofollow(FsContext *ctx, const char *path,
 {
     char *dirpath = g_path_get_dirname(path);
     char *filename = g_path_get_basename(path);
-    int dirfd;
+    QemuFd_t dirfd;
     ssize_t ret = -1;
 
     dirfd = local_opendir_nofollow(ctx, dirpath);
-    if (dirfd == -1) {
+    if (qemu_fd_invalid(dirfd)) {
         goto out;
     }
 
@@ -223,11 +223,11 @@ ssize_t local_removexattr_nofollow(FsContext *ctx, const char *path,
 {
     char *dirpath = g_path_get_dirname(path);
     char *filename = g_path_get_basename(path);
-    int dirfd;
+    QemuFd_t dirfd;
     ssize_t ret = -1;
 
     dirfd = local_opendir_nofollow(ctx, dirpath);
-    if (dirfd == -1) {
+    if (qemu_fd_invalid(dirfd)) {
         goto out;
     }
 
-- 
2.25.1


