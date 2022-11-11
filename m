Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1757625266
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 05:24:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otLZY-0000Uo-0U; Thu, 10 Nov 2022 23:23:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=83144312e2=bin.meng@windriver.com>)
 id 1otLZV-0000UV-P1
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 23:23:17 -0500
Received: from mx0b-0064b401.pphosted.com ([205.220.178.238])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=83144312e2=bin.meng@windriver.com>)
 id 1otLZT-0001Yz-Uf
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 23:23:17 -0500
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AB4N0iL024928; Fri, 11 Nov 2022 04:23:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=p4PqmM8VRzaiQongGzltUo2mhDuqdEHEEZ/RVds/fAE=;
 b=LW/rfcNqI5apCbFV23d3PzaQCoDxNr1L362HvVPVvDExe8xFleodKBCSYw2gsQmXTDGe
 YEcnoPZVttcIjtpvwqTC5RDJoLnp53/GAYsLEn8clY9flLwsIP+3aNnGBMuQZfakbWqL
 B07NcZzUagY0VUXo+lQMDeh0ikUA+zbSb+ca63nAj3vcWkQMdTiKN7wC1nwuAeYX7xcH
 yMSps40R4Nssr1f83klo6UNvkfXIIZCAzHjwWhwuOv1voa3qqlb7rHxUXITY4dNgVVFK
 EsdlABKANhSOiPL/W7lujK7xjSHgcRV/z4wR0ODKH65HFwwGlbVGOxXDST3HOidsfIME jw== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2103.outbound.protection.outlook.com [104.47.70.103])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3knd21ndvc-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Nov 2022 04:23:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jal5Om/27kLfIa3MvDiQ6QeGymaM/2ZtT7se2AtSqts925kACgB7C3dRGFlr+krhXi/7vqqWDix/WyQ8DJoRAkaAZPZgc+/SHGpYjkFS3g54MZXrjvZ6boSYPKvCQVpJR71rgqCvV72S5lhZ8+WMfR60zxpvVjsBz5K/pe1tZdBvMN63VERjRcmYVw93kTBRSo+GHFbMV81bJ5KIHR1ZOjnhfGCproSIXRIC/xIJlIjzjp4bC5YCLDig88ti/zjIgPWLUo9T33V0zm56kRRS3kZnasxUJDrF/7TCcATLfxVdkKnWTnkXUZPz9CKeF/dKhjviZmg14Zm99phvf+lQtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p4PqmM8VRzaiQongGzltUo2mhDuqdEHEEZ/RVds/fAE=;
 b=BkWqKzM/lPZFKeIQcFm7GyYK0olCS8tcM9XN9n0WoLU8itZ+Q7iC9ct1TGVCFPpWG2FvlS/fv/VtGXlfq5KKSavHKIt/9pt17nA28fwdt52bRVwdgg9LH93HChnyl/tBvcJp01N9ZBvpuIVcVkAyq5c8bDaG2fhUHaW9jddX1ulIkqNqPIGHKgv8ceyajZ7+LqHSyxeA5B4/rsb/ZMGYW0xPRQ6lKoN6iWXXcK1dL01I6J8K11RtKJiB7EoBnwPGsf4+dhJr3Dwtlxg3jongFm4Pvbgnril7siRVQVf/n/HyNqk/o8W3gczP6+e7wZwy7dLpXJQTnu0pQXmOsExbqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5358.namprd11.prod.outlook.com (2603:10b6:5:395::7) by
 SJ0PR11MB5102.namprd11.prod.outlook.com (2603:10b6:a03:2ac::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27; Fri, 11 Nov
 2022 04:22:52 +0000
Received: from DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::8e5e:71da:1e29:bc15]) by DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::8e5e:71da:1e29:bc15%5]) with mapi id 15.20.5813.013; Fri, 11 Nov 2022
 04:22:52 +0000
From: Bin Meng <bin.meng@windriver.com>
To: qemu-devel@nongnu.org
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>
Subject: [PATCH v2 03/19] hw/9pfs: Replace the direct call to xxxat() APIs
 with a wrapper
Date: Fri, 11 Nov 2022 12:22:09 +0800
Message-Id: <20221111042225.1115931-4-bin.meng@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: 7505de7b-ae2e-4555-30ec-08dac39c663b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Tx2oCDlRlHEd/G8yP/6pWHFAw0P3P+sQNrXZoaQARQkQqaVT0BeXh01wgBMDtU8rwOOlvSmOs/NkA0DFpRU/SM3qDJEfrKIA0j7MFgpNueFUvoeHliN2kJrl8GLVY8nB+mbD0gIaMJ/1Gl8tVXpyZwOw8kXdAfMBbkMfhrtsJdQSqVfSXI6n+kfMCmZe9DGs3MutEfzuuqTR4oSMNBzhHKnyj0XrQUCuTmtLqz0dY/9KIz6vAj4wR/nH404L7XbnuqaT3qlTXnQycPSm3vg8crYZBNNZiUP7eGPEAsYsNZFmpUVjZPMTi0AhMIajzoaPbV2JeVcOcF/OFtHm8/ytt7mPi9BE6noDmH2HVMWxGhDIIcfoo5qAnNRINcq/cCVV3mTCSyFmrh1Fs7XCZRe+41PFAKgCz+GSr9hE6gSTrgwgO4E8D4qQpAXJ+YeQPqhBOVlxOrMtD/qCM12uCDcl3HJevdKdIBTKm0HiNXljIuY1YdriCPHpFPx8wHiVtmMjHvnOyHkaFTKf/37W2LOYHHHxQH9AM31prW/V544cQVhXuj5lZ97rKjoro4yKhBUeVKamrBdg2uuO3Ucm0sTG+2f6AS4v6ljIKw6CF9thd8FhPoM6eWzMNFkcp/XY0TiNy/Zp9RsZfSYhqOgnolriA60KUBnMESOX2d0Y07iEcSZMko2qVruyUg6HycMf3BFoibg9VumaptOrDWOVFhtWkwPO2aTY0MTRPi+mq2IOEzPvnsPUHl7FkYQJC0Y+tfnjV5VbD5b47cle4ZpLJ2e6Bg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5358.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(346002)(376002)(39850400004)(366004)(136003)(451199015)(66556008)(316002)(86362001)(8676002)(66476007)(66946007)(4326008)(38350700002)(38100700002)(36756003)(44832011)(83380400001)(52116002)(6512007)(2616005)(1076003)(26005)(6506007)(478600001)(6666004)(186003)(6486002)(8936002)(41300700001)(6916009)(2906002)(54906003)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HiJRUJVyacNdD77PPrPC4Qew0orkTeV5K9s6jVRRJFKkVLlPJ2Ryaqj32qtT?=
 =?us-ascii?Q?ua5D1amsf1qzGU4jyHS1fQHdLlmKWlslyd3j3m/crMXA9iY2aUHqhWmBqDBM?=
 =?us-ascii?Q?A8MbodVCiq9DvcmNB+uU86f/JNYEMOImPve0aU/8wqWp4zNUyEbEzhOD8/L4?=
 =?us-ascii?Q?8JOc7X/9B7/lMEQb1uW8R+KAIiUR5bSPznzYvH18WQS3cTSu7DkjVJnAWkGv?=
 =?us-ascii?Q?j2PBEDnmoqBm17cbx6rbRztcv0W0bx+wfWU22nyDp0JnWWsnDw+kH+QRr0+W?=
 =?us-ascii?Q?Nhyj8/4vSvQ0jZOmiNba/QHeNjfakfixCOs2yle3WjWEBAX8Cs2mIPfrXgXT?=
 =?us-ascii?Q?hUY935bDJ1wQn8g6f23usSjWJkBq1mv+Rpn+XczRLdxaVxMeI8VkbtJoyXGY?=
 =?us-ascii?Q?LpMfI0ju8djAcLrNt4WDef42m2i5xIIl41FVoHrTY6BHBVAkBKoAIMDvAZMJ?=
 =?us-ascii?Q?YEpOZK2Py4uoSKocyzB1MNOpLpHIWC4Yvyfi4ihI1E1u4ElhWF510sGMQkJt?=
 =?us-ascii?Q?H2nCub349b7oFQlnGlfnjbxnp65waFBK9bfgDGJ++KgAjKQJN5LEosS+AWmB?=
 =?us-ascii?Q?QCB0kmNQ1AbfDXpnuQsG6JYx9QBDCuTFxSylPAw/zLWBSIzV2AefLdPqYcFB?=
 =?us-ascii?Q?C9qi4wWjQbE29ROPz5p3so2MPj2HGCYWcLAuyhX8ZHvRpmSy15ZEjULmcHDn?=
 =?us-ascii?Q?i1KsEjoLCS3sC4/m12kTUqMBiz5Y2vJOnmOCN+mXwg8uffbh5W70LwIT7cAw?=
 =?us-ascii?Q?O2VKIqHe9gDiUaJIyHPSY2ZPTjXbqTJ4VgkvSOchXu6oGIhNkUh0cTHWnxOR?=
 =?us-ascii?Q?jug8E4ygz8nqITlZrwNc4FxGqBwrtc/9prBrrAe3JKu0aaDwrVhal48V0CZV?=
 =?us-ascii?Q?u6Cz0ELk2NswlTXQIeahs3mV6kv/okIzL6mF/d+Ay4JQQFaXlxBCR6BhAW74?=
 =?us-ascii?Q?gROZZ4nPjWWxp0rhYQZDt0TmiPwNiuh2E0asSXLDtqK4FNbJm8ibYX0HBe89?=
 =?us-ascii?Q?yUXvClvoqOj040PsMmUJVhs6wk3+VH2eCuUjLLWeLcjgvH7CQgZ2jBZpl4WC?=
 =?us-ascii?Q?66DVZC2qwyS2G04Ghcc1cUR+VAjA1RGkIM873/Ta1Eotw3OsrCO8Kdh0IFAC?=
 =?us-ascii?Q?+XeE4QCGfgUJZoZgEO0s/Sly0dbKpOkwVEtc9plJZ+Os20mfbLaO5dePgSa4?=
 =?us-ascii?Q?kpYnHEBmSrDvjqM/Uaq5T9tSxGFSoRvZsU0wR6eZ8CsustthU2qrz9SrU5ZT?=
 =?us-ascii?Q?lPpJfvuWxZSGau2AvkofeqAGGX9/DTINZkXPZ0XN7XzOhQRRV1MYRTwr8u0H?=
 =?us-ascii?Q?car4j10Hs3Oqn4HU7jzncntQgHIrCMNNOG78cXnNOl2zR2x07OLYfuuRLFmh?=
 =?us-ascii?Q?EfSIx4dKpuTj1RNh6KpTZkJHVQRRwPW8ILfOkpLoWyWwEzFgn/qjW7CK9V1p?=
 =?us-ascii?Q?wq6u1+alYKEZzH74T+BU57WiFmceEmchcizVMsy9Q3zPR2pgopLoGOLuGkGd?=
 =?us-ascii?Q?pHVDfMkdG1AMB7z8KbsTWUfQEjav9Q/UJUS7StgqsWJGYMeplOAkoAgDppTq?=
 =?us-ascii?Q?6FMWepQ+oCaBv7SJeGCWwI+j+g26bQ6kJ/aKKzwl?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7505de7b-ae2e-4555-30ec-08dac39c663b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2022 04:22:52.5222 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TrDyz4yNX5gdGA4a5sBUI4r/X5tZLBJM78j4pMxsZpNINbvqbWoBNg4Qde+i//G13Kxkj4KaKQ2sSFuoFKSO6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5102
X-Proofpoint-GUID: JFuDdXqJE621Gq4L7R4YB5YxNSb7LIH3
X-Proofpoint-ORIG-GUID: JFuDdXqJE621Gq4L7R4YB5YxNSb7LIH3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-11_01,2022-11-09_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015
 suspectscore=0 lowpriorityscore=0 mlxscore=0 malwarescore=0 adultscore=0
 bulkscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 mlxlogscore=595 classifier=spam adjust=0 reason=mlx scancount=1
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


