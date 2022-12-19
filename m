Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B76C650A1B
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 11:29:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7DHH-0003JS-AY; Mon, 19 Dec 2022 05:21:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9352c01a6b=bin.meng@windriver.com>)
 id 1p7DGh-0003Am-4t
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 05:21:13 -0500
Received: from mx0a-0064b401.pphosted.com ([205.220.166.238])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9352c01a6b=bin.meng@windriver.com>)
 id 1p7DGc-0007Pu-NI
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 05:21:10 -0500
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BJ9StvV005147; Mon, 19 Dec 2022 02:20:52 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=p4PqmM8VRzaiQongGzltUo2mhDuqdEHEEZ/RVds/fAE=;
 b=jZpv1XxZCHUIExjN23f/LrEVmjujKWH+1E2kDSlKx68ywZSI6qg/Z0N9k35VRljraaN8
 7yY6Zk0+iN/KUCf3PPkb59l/mPTCPeenaW5xzzzjboNFRn75cqdHVUfLxLmACqHAD8oK
 4kMXERrBwjj+QzyNg9uLiLpS+9pODRV9DHTlzYNuwgp0i17VvL9JSKy+mf276EQFxHwv
 ElaRIGtR7vgPrPu+rR/abqNH60YGG/rIb1aaopk9I5PDjnVdP/Txcx/R9pBsFIexcAXS
 LNJDP3oocMOAMk2Z+4s5vHlJqjhF5DMLjfC7PPXQoJ3mF5sU4+mdj79hazOBKLcivA9x wA== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2101.outbound.protection.outlook.com [104.47.55.101])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mhe5q937h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Dec 2022 02:20:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KdCaArnrN4YxkCHqTeZxyYZnvv/XlV/ec7lHPjJbaTuX+mOgab6xpT9yAFJwSTyGONwXFYpvCfWkQsMBpkg0H0zInBsC2+6Pqh9mTruyCptGwxSEoIIsIzEFkVIFuRT25cKNyj/2cl10KmC7sdeK4+iLMed1ApXqZTxAZWy1S+vvtvskW57phPG45WkTN8ek6gG4B9ywnre1g8r7mpD1W5q/KqJiBREhkfVeaeUFzYd5RdntjHxvPD/SXRNMgNSLYHI3PkijqJ6HIwPn+AGX53J/ola/v4uWqgH6YSFyRoFPplRNf9Z2sZOPold5Gvy56rj8HP9OfMaDZXvH2IwSbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p4PqmM8VRzaiQongGzltUo2mhDuqdEHEEZ/RVds/fAE=;
 b=Pyxd0N0GWV8x8oiobNxd/staMn5rHUiyeq0u6EQPU9gePfJJa8OhgNexPNeTWkmo354ucur+XytMNOKLfLY7Lp7iycaxt2ZBZ7BUbKXA2fvkU39nTq/ud12oZX6aS2sS3DctpCD3SMzzwmoTFu9zOZ6GHSnRNC/cTJk5ZGZjkeaioQL35VUgNcf4UT8Kt+rrK3qsTCEJNAa4OlO5MFvQ+Ytc7BwtQVe0A7uj8DWD00lqqZ63yI+w3Fm9kdkvQkUsHteFgXpYzOjOr6JPqq1r4n75Qzd8H6ZDNO4DByOPBkwvLFkjug96pziMB/1gM32a54LiUVAPt8BLMQQXQLvYgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5358.namprd11.prod.outlook.com (2603:10b6:5:395::7) by
 DM6PR11MB4691.namprd11.prod.outlook.com (2603:10b6:5:2a6::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5924.16; Mon, 19 Dec 2022 10:20:50 +0000
Received: from DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::8e5e:71da:1e29:bc15]) by DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::8e5e:71da:1e29:bc15%5]) with mapi id 15.20.5880.019; Mon, 19 Dec 2022
 10:20:50 +0000
From: Bin Meng <bin.meng@windriver.com>
To: Greg Kurz <groug@kaod.org>, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 qemu-devel@nongnu.org
Subject: [PATCH v3 03/17] hw/9pfs: Replace the direct call to xxxat() APIs
 with a wrapper
Date: Mon, 19 Dec 2022 18:20:07 +0800
Message-Id: <20221219102022.2167736-4-bin.meng@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: 37dc777e-8aeb-40ed-5b1f-08dae1aab3d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: g9PqJp47/6BueysOj8aJlXHJOPC44U7YJSPajZ1sdiW4KjGewplR1MK7A8Fy8W3Ia9gQdOBxnPaTEB1pDcp65LLtULJZR62/qSbEC6BuaUOpigucgUHZMpcFIo55/yOtdZE56EejE92zZtCF5QEaLPuD0mMRmcVFekqWGSPBkowSySsRsd88Rg/hwL+F67t2ZEYghsyzQyuV4c5Jo4Hn8LxgRdcZxxNputFies6R+tf9ei4iX+li0JecTisAbSQeTq6TwMHxKfnj/u8z8lIT84mwwmN5llKUM3geRpwSi0S2MTAbreWmDLv0P1m/VgW4t4vqwQzwasQJ1nnE8OKigdHsFwbth2V2Jr1cq0hppYi0VSimUoRsqBcbeCvd1zOFpiQXyK1JwAS9k4BEtvCOUS3XC5I51F56ik1CmpJ1kKUVNwwpGVzLyCg2pDB/lrgEwFaZXhRXYRmuiUJahOJnL0fTBydFhkf/aTtSIQEh+pRr1g4hV12lU12SsnDub0ZY1993YkUCr9zTGqlYvUrnrHbMNjfDvjjBtFnDYYGy/nyVn+qLSMNxzSRh06cPjj/LpACwcIWV7QPvvoDR9Ke5g19jjbL0Ht/7YE3MecnMjp3lxka/BW8YzQ6fEtSUUqM2LAkIS5EkxlrEIJVQIUaOogkPuvDs8cucXFUxQEu2o1mUSWDQj6I7OY34zc9arc6SrcLp7E7xmN6IPXZ6fEEw9w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5358.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39840400004)(136003)(376002)(346002)(366004)(396003)(451199015)(5660300002)(6666004)(8936002)(83380400001)(186003)(26005)(6512007)(44832011)(2906002)(41300700001)(36756003)(6486002)(110136005)(1076003)(38350700002)(52116002)(316002)(478600001)(38100700002)(8676002)(66476007)(2616005)(6506007)(66946007)(66556008)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?n5y3md2XXIGCpuMRCWbnDQvS8eAMrtFSyTzXvGEX21K+ZEhIw8oKsM2ZX4+q?=
 =?us-ascii?Q?tGy/kzQT7hsEwLzxLsJ+kzlQrR71vzXZooZMMW/c+pePnRIKyEz1uNUL4dS2?=
 =?us-ascii?Q?eSFyP7AXQotxNTRxG6HvIBrauDEm2n1XjUc19eqNZZXkN8EJcoa8tSZkpVI/?=
 =?us-ascii?Q?4fLs6byp7vraFYROkhtPOby1R8fnkY6/nRy//mta+2VYz/5wOSKXYj6bwJl4?=
 =?us-ascii?Q?SqgR2/qMmZN2m1FWkB+epXytmoRleiIj/FgJfzARnw/4McxAmHlRE3oWicN5?=
 =?us-ascii?Q?+UM49hcRHnx8XHXLzdv4vRjdTGj9B/wmXTC4LywBtvKabgRdPgIcb+TJM7Tf?=
 =?us-ascii?Q?1gd8yorftnPBFRSmjDnENQMB5rvdn+++DhNEO+KNnuB0zi/b3k7kPK1PCcYk?=
 =?us-ascii?Q?UeQmSn6fUgVuXVbh/gxEbQxW/oJBVPQp3hHPYe6FhpHJMHCvTE132z+KqYkZ?=
 =?us-ascii?Q?Rh5L46OsqO8vhXo2cXGcJEWbMmnqsPeAstg+U5wHDr/FTmyUtuMLpBkVIvwT?=
 =?us-ascii?Q?d1oJYo6VNu/Yot4x3xwo1rXq8XgcA82+Sst/YlW2CnjPhzVR9CspcZVlp6+T?=
 =?us-ascii?Q?wsyN0XqDv+lJZOBPjUurWLp/AFOjKzxgD9HlhbMLVxpD3pRn2W82Ne3gc0WR?=
 =?us-ascii?Q?PIBvlC4FJXTPnWomgv1VnwzlHtS/tl4TItmTOTvVt/vWZZ2fpXgMqqsScrlW?=
 =?us-ascii?Q?XYqAABbFLTTZjpy7Vm4u6MdsqKez5Oi988LNCS94s1u5iNkKQ8reCfg9qlkm?=
 =?us-ascii?Q?89K8/Di79bgZo2G8fAyXidq00chSmWqtbJloVSCXiBOoTpSSknCQEaJ+TBWb?=
 =?us-ascii?Q?UeJ7kXEXMiPcQHW5B9nzDfh27P12XmHyqadI43rraKoczl67i+GUveePzTh+?=
 =?us-ascii?Q?csaB2YGfEM0CFtyKSfxO+CzMkRNJUJvRDcmuJi/3SU/IjyvfUIXe7O/7itXj?=
 =?us-ascii?Q?nigti8W7eP81nHRrzL4+vf7U5q9G9EeTMPBDN7gjPJHxRWkZOkqJXARmWrnB?=
 =?us-ascii?Q?KWSRF4vUo2DS6WicZ8qB5yIWKMAOWojzOLdsjjnWTA1fUDA9geb2zXpclwz6?=
 =?us-ascii?Q?kWaF/ZGJivGCjdCRRSxTx2f1160tGNdKxvypDa4KEfCFv0OShCXOE+WEPa+a?=
 =?us-ascii?Q?DB2viHyZekXzyNEEhPmplRzHH0Q8nkBbGFaWdxmMl9bG0n2kccMZPWk4tffa?=
 =?us-ascii?Q?POpgC05pcI65blOp6qzcpbN2zF8LuAITfYOqNxT/D04ob1SlhhNy5MC7YXgq?=
 =?us-ascii?Q?HBJT2wJaKH2sqpROEdjmAsyUzCf9EsgCpXfiLi1gE4n65994Hz1i9aMO+1/8?=
 =?us-ascii?Q?Kcm86hKbNoCwcwg25gLJJ/uPt33WT85egXf2gmdsc5uDqpL5YxjYvEfRBKBB?=
 =?us-ascii?Q?is+/lVCGdV1kWCF6aMmx/y82VO6h/61e1bkRK+Sg6pjZz23yhqaFEo8GCpVJ?=
 =?us-ascii?Q?gfquCnZCeVwNWNoDbjG45rmhItgGZK7I+G1HlQb2ospJpLdFqy9x8ya6Rpd7?=
 =?us-ascii?Q?A0FhedKLBn8G4orfzlZZtjvAd2SThP8/iilth2aMee3hLWHI6eE4Q7krdB4x?=
 =?us-ascii?Q?wSSoYWITILHbIsCGr9FBio7ohIQicOuFV/6gN6eL2VyQuCOZC2gLZvMtmdVf?=
 =?us-ascii?Q?xg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37dc777e-8aeb-40ed-5b1f-08dae1aab3d0
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2022 10:20:50.5375 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a588AQn5M4/cZ4tGFwxUYApz5mQ70XEyhLcUoy26tJ9F/ZubmaVr24wVI+KR/X8ui0RkM2iAbGigsaA+JHI1/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4691
X-Proofpoint-ORIG-GUID: 5BcluoAdz8l8k4fsVuNdZwQZL5nAJkQk
X-Proofpoint-GUID: 5BcluoAdz8l8k4fsVuNdZwQZL5nAJkQk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-18_13,2022-12-15_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 impostorscore=0 lowpriorityscore=0 mlxlogscore=747 phishscore=0 mlxscore=0
 adultscore=0 spamscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212190092
Received-SPF: pass client-ip=205.220.166.238;
 envelope-from=prvs=9352c01a6b=bin.meng@windriver.com;
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

xxxat() APIs are only available on POSIX platforms. For future
extension to Windows, let's replace the direct call to xxxat()
APIs with a wrapper.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

(no changes since v1)

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


