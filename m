Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ABA1609A27
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 08:00:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ompYA-0004BR-3p; Mon, 24 Oct 2022 00:58:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=72963f20b2=bin.meng@windriver.com>)
 id 1ompXs-0003rx-6t
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 00:58:41 -0400
Received: from mx0a-0064b401.pphosted.com ([205.220.166.238])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=72963f20b2=bin.meng@windriver.com>)
 id 1ompXp-00068B-Kh
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 00:58:39 -0400
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 29O4rWf0025182; Sun, 23 Oct 2022 21:58:24 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=R3zsBy+TCgtsGTT4WRluFlAR+9iL6gS1nLR7/kVXLtw=;
 b=UMeH1pBQA1Oz8Ea0JiuPOT9EDqY9n2O89+1fS1l+2wBPHSTWGj3YrIWLyFtFXdEEByDu
 ORPTq8GAyQH/JS8BlUeXgTgLKM5EdqkKL6JocUkG/zYKSCMkU84KkpFwBQISK+1XO0I5
 +mjyQoSOz6GeH+WTuCDtDJtQhPSQHmY9+ZbWINqilmcK6R8YHLzh9BECQta+5m13Brx9
 xcmhOlj2Goge3GjgejGDPozQuY/wc3I9RSXC6err7TQuGfNe5WJbKDrPRbmfBvbTdLxd
 RcSjESnjAP9cvG+PvBV7lH+m89RkaEDaPtJjq4OIyn+bVrAT1rnXl8mHDs1yq6OOckpz jA== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2103.outbound.protection.outlook.com [104.47.70.103])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kcg1ksma9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 23 Oct 2022 21:58:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JUMIdd4KymK/Am9eUIY5ie+f5fQwP/NfWlcrsEjlnY+Qh5dDg2d3GSqBVjhzb3OUkn3OeF5EUpajg/TptvT47JByylXiGFtg9i2CQ4VdYpJsbQwJ4DkBf2qxOYjX1YZ/uBf/1I912c2Psm/ANfXhv41od/n6smIqEAyj8H/HhWUR/vs6WMbDkvJzGuk5cp63bxGh2CUxsha9gUu+2MxHH0/1eu5aCWL6D6jxiGWLRY9LqyGGx+fweGDg0f5JnBlxko1381AmE0Y9f9eJbZe9riE176enPtm1WzZCiyREmXtY5arT4LEsHppdYm8N0HQwL/caocw/Jsjqe0powd+Bgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R3zsBy+TCgtsGTT4WRluFlAR+9iL6gS1nLR7/kVXLtw=;
 b=fs70tCrx9RQC31vnSbAKdT29WKG4OVUFHNMpfLXV6i/KwWiYmLoZjkVEX3rsZBrTvAH2wfFOfPY0+H02p3A60rb1LYPHVZslfeEexYy7lpKxgDrAhoEmWA/FrdFxqxSbdML1JSUKijhNT6cFe3RwAvIxaBL8RSAAm8NZykRhLqu684PbbjSDPSRr+a6KRK2OOdLw4eiKBdN4iqoan4Rue450MmbZZ4OJdjE8e11vOZ9O1AJQoNUywlpcI4a+FSxKPM4gr4lUogiJ7pe65VQFrp151NJr5jz9GqA6vUyrsWN7Njqq59TAWZzGd8mXq+YwjHDMME7WEPx27IrQtQViwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5358.namprd11.prod.outlook.com (2603:10b6:5:395::7) by
 MW4PR11MB6911.namprd11.prod.outlook.com (2603:10b6:303:22d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.26; Mon, 24 Oct
 2022 04:58:22 +0000
Received: from DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::b051:27b7:c1c1:7cb9]) by DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::b051:27b7:c1c1:7cb9%4]) with mapi id 15.20.5746.025; Mon, 24 Oct 2022
 04:58:22 +0000
From: Bin Meng <bin.meng@windriver.com>
To: qemu-devel@nongnu.org
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>
Subject: [PATCH 03/16] hw/9pfs: Replace the direct call to xxxat() APIs with a
 wrapper
Date: Mon, 24 Oct 2022 12:57:46 +0800
Message-Id: <20221024045759.448014-4-bin.meng@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: 6955e678-2ffa-4b35-1800-08dab57c600e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PRCT7ibY0wUD2y3WjFKuQ0xMGIFPoS9MoA3dn/8LTUIINQmDEMfpFcxUipMqM/98nSWMJ9M1iTDFU+CFXnQO2gDc4CPFvbEoDv2yhadhfBcvJi0nk8iPjWQuqt7L6V7q+PWUfet7McT4PoiOOYdylSoS2IednHFAIXhCw85RVd8GgZHyBOSD94H2S0Cp77H2AS+mhQkm768wGWEf+mBxLSHPSVVJo3buwQnxqyMWwWonS15m7PlbR0Hb4HbGojCqrGEDUAQu65Ixce0xqkbLulmHCWSc2B/1w6qdF82caA+OFDZgfKfwpDXsYqhWnsynxcX9QxrltYGXHkrkkO4NN68N/DeDjd/pcl4FXo4oesbTOXw5tIc2J9QfU9ssOUVoLDsE5eNLMTFL1hWLxpxevEUyt7VlBX9k9rukDVayRneQl95P+55mPPEu6hhxzC2N4cP4S+yEynPftRHeihn/4NullGwxaMJhtBwCfYGZoYuDYJDVAyodFXpf5imME0esbsGKmyEDkdL9YhB6B7lIYh0A4W7fk42oKbRr9XIm8qoeWLzgKkeebalFjyZUPdcOqHJ/la7zj06STrPLLIt4ErXg8fJycy5eLR4ncO4eeM9fn0VojIfe+I/1/l4D/4ZlEjTuCXZrfpz4LlVsli3YiaP2HQTqDICWpaapyj5GotYDW+lnaiDQiVYmQmFM+KUH6njkx+y7bsMiOlbPpNrI2JDuDnxbS0kZaz2Kznl4UNJOCjHO10PLgaxxs3kLZUcFfJemvtEfWN0lq/Eavaqn5g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5358.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(396003)(39850400004)(346002)(136003)(366004)(451199015)(6666004)(6506007)(2616005)(52116002)(6512007)(26005)(1076003)(186003)(83380400001)(44832011)(2906002)(6916009)(54906003)(316002)(478600001)(6486002)(5660300002)(8936002)(41300700001)(66946007)(66556008)(4326008)(8676002)(66476007)(86362001)(36756003)(38100700002)(38350700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Focq3eQKubbjDqnAYhEBGRYqpIGy7cCHrUQiKhYaUTKjiK/oTJvTGetxY6Jw?=
 =?us-ascii?Q?jYnitwFQxnmss3Nb3S+Df9RQknT2X1D4A+k7jUkkwQUxcQeQupyiUuVJGrjF?=
 =?us-ascii?Q?MRgvi1Jupilc8NFr1papyjSPO45uaPBkhRaS/mp9nBDoDBK0JvxjVBc+QOPh?=
 =?us-ascii?Q?xIbodmptHybWYKsLtqEiLoNvft1Z3ySvFkhFBi1mJWrgvYt1aLKLKMUN+meM?=
 =?us-ascii?Q?AqsV34P1e0lLy6/nTQIH86QOMGpjy3ptOhkPOTEpEdaTBHPqiR8uW+EkOvnr?=
 =?us-ascii?Q?JyObp/bsZIh8JwSAqBeLjIUg8VHwivjuE9ZbICxJtQwsBLZ0FpEVocjOVjNZ?=
 =?us-ascii?Q?FN8Z0NOQSttdHV7tgN06bAZ6qzzu81yE1I9D4ps8rIE0FtReqZ9NmhrAUeVx?=
 =?us-ascii?Q?dy6FXj+ZBACVlUD8bKxN7isRT9bznPW5tt+e+ypKNSra5u3Dr5Yva+gdOQ5G?=
 =?us-ascii?Q?kLMw9oX1bMetSBtcSgqbLgwe9iAeln9/O1AD+F93FjwxdsBKuozNOfPy60ee?=
 =?us-ascii?Q?CdvGfsUmd/bjt76+WuFxY7EWnoaJYaLKQAwTtdslPhKTjyZYGRC41hXGhjj1?=
 =?us-ascii?Q?1fH5an9cfl4yA+PY1QzcJdnJPbKZdDB4/hog9Z+fQduoSv8osO7NawEosGGv?=
 =?us-ascii?Q?12/7YnP2344LbK0KUdz2zTK9rIWBjBVOrlQ2weMlAvxr5gJxnQrJnwfKigs+?=
 =?us-ascii?Q?x1mM3C69m2BO/DC5yZg4rN/K24N96qnF7p6TXSwXmNND//EM0JUMCYDyObov?=
 =?us-ascii?Q?rMttg33QWNaJTGYvszZKwQ7uIAwRo+9YARmfu4J1CTFtb5cGzx6wrAaN3FIB?=
 =?us-ascii?Q?zBIMn+QDUNRyTdTl8vvFVjyETeqQmOxLEGwjy/Xli3v8Y/AHyEFfF6U3TFYy?=
 =?us-ascii?Q?fQDIGsn84KEptXRLfsjpsnLbPv+wnZksnTvfVrwJg0H1r7NDOzdjgjHYqawl?=
 =?us-ascii?Q?B5Xhn5Js2Hy+EK2I4U5h3/vVLB6OjR1Q2zsHKlNdSRBZW9TdExkJxyihfKEN?=
 =?us-ascii?Q?j+IAtdFw3iLqokc8ZNpWRheW6fNMGIIEnUlByvfmloOoQVWPizrNM3S/AiI+?=
 =?us-ascii?Q?C/xrB6JimuTjMDRorFb03E1A5qVLri+gogPNp24YQFGTL4Hg7dHWjj3Pu4/O?=
 =?us-ascii?Q?qdXZxzeo7xBsBG33LlSjkPM68BbTtZxULgc8Mmpo94gkvtI+HyazKBX+IGrX?=
 =?us-ascii?Q?IdeHtf1s3t2trdySx6/MqRviqX6iruGmJhx1dx+rLRvPM6mmMaq/3pHQTt2Q?=
 =?us-ascii?Q?fnhvpL8R8/udZABRQb50Mp9o/Ib0IpnwCIq6KGRwaap+2KYpg2eAdFND9dxR?=
 =?us-ascii?Q?7MWgAHOaJG11vKVrAM0XH3vqXZcG/8ZDW8xol6Kcx/vM1shObSD+u41+MIZ7?=
 =?us-ascii?Q?h0xKGIa1v+LEgkk2Ui8Z49VM+v1bG2jQKgUASTGbLdFGhtl7K1yRVwVgMZqE?=
 =?us-ascii?Q?0O7T6VJThCmrE0qeOAmVFrtqy4VTteQNcYjxsFrKRQ7gDQN5vy7xFIpwOb9h?=
 =?us-ascii?Q?A6b4LVIE67zr0EzxSKD6f48oiHQYdtJxVJ14iKFi6Ar2qqG8uDHEiLdW2Ros?=
 =?us-ascii?Q?AaAMM4Bgx4EFc+PtOvZR7Xid8+s/qpGa9qfElc9qb4vMNdQG//vaU6IgA4kN?=
 =?us-ascii?Q?tg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6955e678-2ffa-4b35-1800-08dab57c600e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2022 04:58:22.0006 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bPNsHkZ8lyar6OyuwbTq1rc2UIyzede1tP5lQTcV5ysg9REWRBOc4kpwRhHB13Cc+8oG30jqBBWakBmrjLrAiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6911
X-Proofpoint-ORIG-GUID: Iz69Qq1NslHgL9AetrOU5nxu-zTyTQVQ
X-Proofpoint-GUID: Iz69Qq1NslHgL9AetrOU5nxu-zTyTQVQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-23_02,2022-10-21_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 mlxlogscore=601 mlxscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210240031
Received-SPF: pass client-ip=205.220.166.238;
 envelope-from=prvs=72963f20b2=bin.meng@windriver.com;
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

xxxat() APIs are only available on POSIX platforms. For future
extension to Windows, let's replace the direct call to xxxat()
APIs with a wrapper.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 hw/9pfs/9p-util.h  | 15 +++++++++++----
 hw/9pfs/9p-local.c | 32 ++++++++++++++++----------------
 2 files changed, 27 insertions(+), 20 deletions(-)

diff --git a/hw/9pfs/9p-util.h b/hw/9pfs/9p-util.h
index ccfc8b1cb3..c314cf381d 100644
--- a/hw/9pfs/9p-util.h
+++ b/hw/9pfs/9p-util.h
@@ -94,6 +94,13 @@ static inline int errno_to_dotl(int err) {
 #define qemu_fgetxattr fgetxattr
 #endif
 
+#define qemu_openat     openat
+#define qemu_fstatat    fstatat
+#define qemu_mkdirat    mkdirat
+#define qemu_renameat   renameat
+#define qemu_utimensat  utimensat
+#define qemu_unlinkat   unlinkat
+
 static inline void close_preserve_errno(int fd)
 {
     int serrno = errno;
@@ -103,8 +110,8 @@ static inline void close_preserve_errno(int fd)
 
 static inline int openat_dir(int dirfd, const char *name)
 {
-    return openat(dirfd, name,
-                  O_DIRECTORY | O_RDONLY | O_NOFOLLOW | O_PATH_9P_UTIL);
+    return qemu_openat(dirfd, name,
+                       O_DIRECTORY | O_RDONLY | O_NOFOLLOW | O_PATH_9P_UTIL);
 }
 
 static inline int openat_file(int dirfd, const char *name, int flags,
@@ -115,8 +122,8 @@ static inline int openat_file(int dirfd, const char *name, int flags,
 #ifndef CONFIG_DARWIN
 again:
 #endif
-    fd = openat(dirfd, name, flags | O_NOFOLLOW | O_NOCTTY | O_NONBLOCK,
-                mode);
+    fd = qemu_openat(dirfd, name, flags | O_NOFOLLOW | O_NOCTTY | O_NONBLOCK,
+                     mode);
     if (fd == -1) {
 #ifndef CONFIG_DARWIN
         if (errno == EPERM && (flags & O_NOATIME)) {
diff --git a/hw/9pfs/9p-local.c b/hw/9pfs/9p-local.c
index d42ce6d8b8..d2246a3d7e 100644
--- a/hw/9pfs/9p-local.c
+++ b/hw/9pfs/9p-local.c
@@ -103,14 +103,14 @@ static void renameat_preserve_errno(int odirfd, const char *opath, int ndirfd,
                                     const char *npath)
 {
     int serrno = errno;
-    renameat(odirfd, opath, ndirfd, npath);
+    qemu_renameat(odirfd, opath, ndirfd, npath);
     errno = serrno;
 }
 
 static void unlinkat_preserve_errno(int dirfd, const char *path, int flags)
 {
     int serrno = errno;
-    unlinkat(dirfd, path, flags);
+    qemu_unlinkat(dirfd, path, flags);
     errno = serrno;
 }
 
@@ -194,7 +194,7 @@ static int local_lstat(FsContext *fs_ctx, V9fsPath *fs_path, struct stat *stbuf)
         goto out;
     }
 
-    err = fstatat(dirfd, name, stbuf, AT_SYMLINK_NOFOLLOW);
+    err = qemu_fstatat(dirfd, name, stbuf, AT_SYMLINK_NOFOLLOW);
     if (err) {
         goto err_out;
     }
@@ -253,7 +253,7 @@ static int local_set_mapped_file_attrat(int dirfd, const char *name,
             }
         }
     } else {
-        ret = mkdirat(dirfd, VIRTFS_META_DIR, 0700);
+        ret = qemu_mkdirat(dirfd, VIRTFS_META_DIR, 0700);
         if (ret < 0 && errno != EEXIST) {
             return -1;
         }
@@ -349,7 +349,7 @@ static int fchmodat_nofollow(int dirfd, const char *name, mode_t mode)
      */
 
      /* First, we clear non-racing symlinks out of the way. */
-    if (fstatat(dirfd, name, &stbuf, AT_SYMLINK_NOFOLLOW)) {
+    if (qemu_fstatat(dirfd, name, &stbuf, AT_SYMLINK_NOFOLLOW)) {
         return -1;
     }
     if (S_ISLNK(stbuf.st_mode)) {
@@ -734,7 +734,7 @@ static int local_mkdir(FsContext *fs_ctx, V9fsPath *dir_path,
 
     if (fs_ctx->export_flags & V9FS_SM_MAPPED ||
         fs_ctx->export_flags & V9FS_SM_MAPPED_FILE) {
-        err = mkdirat(dirfd, name, fs_ctx->dmode);
+        err = qemu_mkdirat(dirfd, name, fs_ctx->dmode);
         if (err == -1) {
             goto out;
         }
@@ -750,7 +750,7 @@ static int local_mkdir(FsContext *fs_ctx, V9fsPath *dir_path,
         }
     } else if (fs_ctx->export_flags & V9FS_SM_PASSTHROUGH ||
                fs_ctx->export_flags & V9FS_SM_NONE) {
-        err = mkdirat(dirfd, name, credp->fc_mode);
+        err = qemu_mkdirat(dirfd, name, credp->fc_mode);
         if (err == -1) {
             goto out;
         }
@@ -990,7 +990,7 @@ static int local_link(FsContext *ctx, V9fsPath *oldpath,
     if (ctx->export_flags & V9FS_SM_MAPPED_FILE) {
         int omap_dirfd, nmap_dirfd;
 
-        ret = mkdirat(ndirfd, VIRTFS_META_DIR, 0700);
+        ret = qemu_mkdirat(ndirfd, VIRTFS_META_DIR, 0700);
         if (ret < 0 && errno != EEXIST) {
             goto err_undo_link;
         }
@@ -1085,7 +1085,7 @@ static int local_utimensat(FsContext *s, V9fsPath *fs_path,
         goto out;
     }
 
-    ret = utimensat(dirfd, name, buf, AT_SYMLINK_NOFOLLOW);
+    ret = qemu_utimensat(dirfd, name, buf, AT_SYMLINK_NOFOLLOW);
     close_preserve_errno(dirfd);
 out:
     g_free(dirpath);
@@ -1116,7 +1116,7 @@ static int local_unlinkat_common(FsContext *ctx, int dirfd, const char *name,
             if (fd == -1) {
                 return -1;
             }
-            ret = unlinkat(fd, VIRTFS_META_DIR, AT_REMOVEDIR);
+            ret = qemu_unlinkat(fd, VIRTFS_META_DIR, AT_REMOVEDIR);
             close_preserve_errno(fd);
             if (ret < 0 && errno != ENOENT) {
                 return -1;
@@ -1124,7 +1124,7 @@ static int local_unlinkat_common(FsContext *ctx, int dirfd, const char *name,
         }
         map_dirfd = openat_dir(dirfd, VIRTFS_META_DIR);
         if (map_dirfd != -1) {
-            ret = unlinkat(map_dirfd, name, 0);
+            ret = qemu_unlinkat(map_dirfd, name, 0);
             close_preserve_errno(map_dirfd);
             if (ret < 0 && errno != ENOENT) {
                 return -1;
@@ -1134,7 +1134,7 @@ static int local_unlinkat_common(FsContext *ctx, int dirfd, const char *name,
         }
     }
 
-    return unlinkat(dirfd, name, flags);
+    return qemu_unlinkat(dirfd, name, flags);
 }
 
 static int local_remove(FsContext *ctx, const char *path)
@@ -1151,7 +1151,7 @@ static int local_remove(FsContext *ctx, const char *path)
         goto out;
     }
 
-    if (fstatat(dirfd, name, &stbuf, AT_SYMLINK_NOFOLLOW) < 0) {
+    if (qemu_fstatat(dirfd, name, &stbuf, AT_SYMLINK_NOFOLLOW) < 0) {
         goto err_out;
     }
 
@@ -1296,7 +1296,7 @@ static int local_renameat(FsContext *ctx, V9fsPath *olddir,
         return -1;
     }
 
-    ret = renameat(odirfd, old_name, ndirfd, new_name);
+    ret = qemu_renameat(odirfd, old_name, ndirfd, new_name);
     if (ret < 0) {
         goto out;
     }
@@ -1304,7 +1304,7 @@ static int local_renameat(FsContext *ctx, V9fsPath *olddir,
     if (ctx->export_flags & V9FS_SM_MAPPED_FILE) {
         int omap_dirfd, nmap_dirfd;
 
-        ret = mkdirat(ndirfd, VIRTFS_META_DIR, 0700);
+        ret = qemu_mkdirat(ndirfd, VIRTFS_META_DIR, 0700);
         if (ret < 0 && errno != EEXIST) {
             goto err_undo_rename;
         }
@@ -1321,7 +1321,7 @@ static int local_renameat(FsContext *ctx, V9fsPath *olddir,
         }
 
         /* rename the .virtfs_metadata files */
-        ret = renameat(omap_dirfd, old_name, nmap_dirfd, new_name);
+        ret = qemu_renameat(omap_dirfd, old_name, nmap_dirfd, new_name);
         close_preserve_errno(nmap_dirfd);
         close_preserve_errno(omap_dirfd);
         if (ret < 0 && errno != ENOENT) {
-- 
2.25.1


