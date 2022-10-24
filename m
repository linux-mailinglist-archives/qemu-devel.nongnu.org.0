Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B4E16099D5
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 07:31:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ompYV-0004Qx-5s; Mon, 24 Oct 2022 00:59:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=72963f20b2=bin.meng@windriver.com>)
 id 1ompY2-0003zK-JV
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 00:58:51 -0400
Received: from mx0b-0064b401.pphosted.com ([205.220.178.238])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=72963f20b2=bin.meng@windriver.com>)
 id 1ompXy-0006AX-O2
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 00:58:50 -0400
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 29O4uZvQ011846; Mon, 24 Oct 2022 04:58:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=6aclRzkAXh0uzcBoQTvPL1E++MVkrMwSiPU1IskNBXU=;
 b=UlgFe+d5GugHlqC8cbVFzTPZlRwzd8q6F6ghN78UBduswv+O2mwFlyxW8eE+TMtQmE08
 jucl/VCkDfAJbjlSfEB0ao3Fg+t3I6qZLGqR+XQAeIYeusN96JfvyhdknfLEKmDWboLp
 PWvxbNrR6kRQlCAeqDEQV4pzPUiYGE5IZTl6V7U0mCQifOpRhFS7SoAcJRvhOUGbSlMs
 h+oUGLJKVzwksnsdRLYWEAalYy7e9d8ZjljZHJfIxTDq6XFv1GXMyZHXE2aq8VSH3061
 XfCN4eB9fxwjdidynP3xClTc63eUv4Cou1q3Sc3OUAbQQkcyKophUbEUWyNcYO+BHCOr ow== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2108.outbound.protection.outlook.com [104.47.70.108])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kc7g9stja-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Oct 2022 04:58:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mNfbY5QGs/3SJiukQYQ2uxJdvw0ZGCsFVz3haXSm/c21N57P3rPUA+Cpc+LsbDrbGDWphGTiOZihW4ZXVXamsTqtxUE2glKdL26IT91lZZ1AdwuHkODEkKvZt968FTTx2jHjW4DpQHJn9UpBogDUMdBZ85xASRt9n19kPzSuYKgpoXSuU9TBhF+Yi1AuiZNXzuld9yCSkBFJUajQ2EZJsnNUu9IJ5mkreBrF36IUcOe2lXdMy8vUSSHM8Su5UU46IBOXj8oahgCOGareq+iR8JSVfQvkXPxthF2SDNnO4J4HfLRoqVCwhslp2gaDkJYIxWPZPKfR/gvRLVX5N+xiBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6aclRzkAXh0uzcBoQTvPL1E++MVkrMwSiPU1IskNBXU=;
 b=Ztse8BQg4ERaVCdoHw59ifHddZc1mVbE5RlzzSsuf2ydCwKvkpjmtkxSgVZp+PMg5/i6142dR1FH5jKVXcFtXwweGLB7LxFgyw4z983qT4u4/G0mfnJdvwccUxalbpTLdsU36Aos/ZFBLTZttb11BRD4NhzCXW2KmWhvcVSH3btX8HaTCVqImFS0cOiw0f0RbU8NJeIYS6tlKUHCxA1DVJw5sJ5gfHg9aUoIIdlJ+L2GOJNB0bJiVueot+0xNoWWko78nnHA6aRqpKbyKE8JZgCA7Jqts8tSlGnRy4JarbnOEgy1ZQAh3KQl0XhqkAZeWipsZRJPDdCnA75ZvJs1/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5358.namprd11.prod.outlook.com (2603:10b6:5:395::7) by
 MW4PR11MB6911.namprd11.prod.outlook.com (2603:10b6:303:22d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.26; Mon, 24 Oct
 2022 04:58:30 +0000
Received: from DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::b051:27b7:c1c1:7cb9]) by DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::b051:27b7:c1c1:7cb9%4]) with mapi id 15.20.5746.025; Mon, 24 Oct 2022
 04:58:30 +0000
From: Bin Meng <bin.meng@windriver.com>
To: qemu-devel@nongnu.org
Cc: Guohuai Shi <guohuai.shi@windriver.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>
Subject: [PATCH 07/16] hw/9pfs: Implement Windows specific utilities functions
 for 9pfs
Date: Mon, 24 Oct 2022 12:57:50 +0800
Message-Id: <20221024045759.448014-8-bin.meng@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: 2c95dae0-c5e8-4f48-e237-08dab57c64d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u9fAi5PiNRImI9/iSsb4iBqg9zwfwvF77Omelt6WA3g9DBqFHEFTJT3t7YzMNOR7Cptu6tS/cUgyuwL/4ERLPRhUAUnlBBzYM13DHlqnvrYJHVw7Npxhw1UdEI7gEND2WuOvoo83o9sbGHgiqOQSauZ1TdA+Txw7yZXzXnpKpg1RusUbPW9WnzScnZR7zzSshkfOMbI+zngTgcNqKsT/qQeEHQcU+uOmpkLEiG70nPO+4beXzHtQtSmvthHdfsDRQjHBojAo5f/gwvJeVCSdxCcn75ODwGRUNodwUSAkj57w856m50uvVAfpJjG11Hjc6g483pFWFZWKZqoCLmRv2IfrJPX2bTsP+BQf8V+y9ns1rL4gjCpcipYXjVtOqQR5NR9VGgWhLIIdZJyiQ9YGeBblV6vhgjqr+AasO+w6D2kcI1GMWZu96k7CGs9SBiq9jqT6N/uccfPlznX1Y3ORihoyPgKsGguKxmDlhNe16g5Zrutiq7+UR5fyYCFxdiC6GOIgicUbAkxJ70cG0rVT6QBDk7QmBsgXZpb9w54u47ZMB13gz+lw0HVBZ0tc9LO5rKwUhM/9EiBPx0A4/C22lDXImoBBOZP5rlYkPthkVEZi4D0gQUy8+HJ39fMI43y1DGjPJL6Xzls5xBzgaglpVsJQiTq/WMzyq2VjnfPhkfBHWEIkRRvsA/66t0X4dkW00BnxVO+49y/Af0AcwTUrvSGrvTqIeW5nKJDIwVo9RMZ326SvOcGWhgAFN4IQcOcBuyrU7KBIPLd+GMsJOTeqjQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5358.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(396003)(39850400004)(346002)(136003)(366004)(451199015)(6666004)(6506007)(2616005)(52116002)(6512007)(26005)(1076003)(186003)(83380400001)(44832011)(2906002)(30864003)(6916009)(54906003)(316002)(478600001)(6486002)(5660300002)(8936002)(41300700001)(66946007)(66556008)(4326008)(8676002)(66476007)(86362001)(36756003)(38100700002)(38350700002)(21314003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oudslNHSAAq4SHxcgTTBRUTXex2T877Njb7EjxlMVpwP6nJ+8S6PcgChxaIx?=
 =?us-ascii?Q?Yi8upSpyrcPWp/UtRjoyTXVa5b3mb7bNGwn9jE27Xx4KLXWBwxd9/om7MWcJ?=
 =?us-ascii?Q?rTn6IaqIz0gByTpUoy4CShK8jCnsfdzBPLs8ZUUUAfG6hUpYLLDJ+SXWSax0?=
 =?us-ascii?Q?K89/I5+JPP/GHskm+e/ZJkQXY5Dw7ahwqT5pdyfysEVaE4JXNbxf4w8evqNw?=
 =?us-ascii?Q?mK3lh90zi/S/My/icTyr1SsRXqqywi9oATNCef88rEcuLBrBTwO6fY2xyZh2?=
 =?us-ascii?Q?pQPfXvXUN4g3BAi03GYjs+hO2QdAcGeJ5PJRGitem5mIHM9ZLEcllGA7vDl1?=
 =?us-ascii?Q?WUvBdRaqr+MXmhf7RdICf0Z2VP/B2d8D85fFKAnZIv9ssOa8hH1saR9w1piR?=
 =?us-ascii?Q?fSTKw/xtSuNx0JoFmxmJKEa2xSTy+zrGb31GB733MfJk1Ptkqu7SPTH0nM5s?=
 =?us-ascii?Q?yKeqGPDKl7h+ZZBH60/HCQYtmNpleg8kW+ejtb2dYfFRwO7Dfr9KpmhN1X3k?=
 =?us-ascii?Q?FhbeIDc6dEIQsDn84eFE0DUcl3Upk2Wmrue7uIuJkUMpqqWNeuaJTnjSK+Vv?=
 =?us-ascii?Q?hw80kjMh10Vgnc4h0OV2CtADSlawycQ4oA5g7cTY2v/4GHeoto6XYAGke8dw?=
 =?us-ascii?Q?6dWdP5uz5a6sB0FYsF4R10CnAjxXboQDYupficS6ngvM7MGfhp0OI+Q4i5+X?=
 =?us-ascii?Q?ASTMi1u1mJjUaOvnlLnrFQwfOBMdW64V94OihYWoHztE1gjPvfci5W6d0i7c?=
 =?us-ascii?Q?5YaAAZwyyAlD1Inj7EuOlIj0jH13oiDHno84KxCeEVPrirNhNt+6CbSFhtfl?=
 =?us-ascii?Q?wvJDpaa53EcvuloUaxZ2RQ4wOMtPfd3/CtPTqSZDk109eNPSXlCbQIsaLs3r?=
 =?us-ascii?Q?jeF6Zh6YU936C9eRktS5ZdTUDCewbAbkMkwbuXtDlY5cb8modYbEuY1TYWyg?=
 =?us-ascii?Q?QrEbjBDnj873wMBsxkxx+GsWfj31Yb1cT4hEDJrO6eZg0j8K/K6vuVkkl0yo?=
 =?us-ascii?Q?KXqv1vzzRa+70fBNnX5pbUho33QXvU+lVpTJrlXohDL2zAVntJcRM39MtGdz?=
 =?us-ascii?Q?/hh6Qz0HnXRyNr4FdLW1eOl0dkwauuxO/QaQxkcXSYhWLo1fVDrzOTuayfPI?=
 =?us-ascii?Q?qARMgOvCfbVXiKglneSoWuppZsHqai/ktmeD4TtltyiZFpCe4Jj693feJp11?=
 =?us-ascii?Q?twBVCZXHk7iy4o2dQ3XamnGMKJDlKUZlSOOc25rBsbnHLFDP3lj+bAG7HRGX?=
 =?us-ascii?Q?i++2rA2QIoZWcBX7WlmZHz5tYkJfvO2ucLXCWdS/K1SvPTJoacjghmFp9Xge?=
 =?us-ascii?Q?WBnkuHBQBc4046IQgAOiRaSZ0Hnot9QdxEi56tdMyV3VCmLnpu2BCDDu0vGw?=
 =?us-ascii?Q?KyH4erC/9hxZKjcH0cikkHFmb595Tv/B6nl6wJxDduRs9fHg9VUMAWZpAr19?=
 =?us-ascii?Q?uh83LLVxwvziiUzNpisKVCqdtjCowANDIJ8x9jM4Nscsqhi8yDa/ulXzBHXY?=
 =?us-ascii?Q?h6g0dq35+WhFnsc002Wh3zTGlrVGLvT3O4BKMuy20TLGStFWzMURE+/dMk0z?=
 =?us-ascii?Q?2SdoJJqf0hkMNKftAnao7KaYcZhNer67mHpoW0Qc0/tHl89LPzAKk6mDnPyc?=
 =?us-ascii?Q?Zg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c95dae0-c5e8-4f48-e237-08dab57c64d7
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2022 04:58:30.0350 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: md+OxQ+qo/++o9/I6llTYrQSCr8hK92EMb53wFRC8AqL1p9q7o3oUFAngTLKVGpRI+y/7vsPEbpo9AdtvhGc9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6911
X-Proofpoint-GUID: W2M-d8zIpLGoGnVBAt2SiT6cbkL47XJC
X-Proofpoint-ORIG-GUID: W2M-d8zIpLGoGnVBAt2SiT6cbkL47XJC
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

From: Guohuai Shi <guohuai.shi@windriver.com>

Windows POSIX API and MinGW library do not provide the NO_FOLLOW
flag, and do not allow opening a directory by POSIX open(). This
causes all xxx_at() functions cannot work directly. However, we
can provide Windows handle based functions to emulate xxx_at()
functions (e.g.: openat_win32, utimensat_win32, etc.).

Windows does not support extended attributes. 9pfs for Windows uses
NTFS ADS (Alternate Data Streams) to emulate extended attributes.

Windows does not provide POSIX compatible readlink(), and symbolic
link feature in 9pfs will be disabled on Windows.

Signed-off-by: Guohuai Shi <guohuai.shi@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 hw/9pfs/9p-local.h      |   7 +
 hw/9pfs/9p-util.h       |  40 +-
 hw/9pfs/9p-local.c      |   4 -
 hw/9pfs/9p-util-win32.c | 885 ++++++++++++++++++++++++++++++++++++++++
 4 files changed, 931 insertions(+), 5 deletions(-)
 create mode 100644 hw/9pfs/9p-util-win32.c

diff --git a/hw/9pfs/9p-local.h b/hw/9pfs/9p-local.h
index c8404063e5..02fd894ba3 100644
--- a/hw/9pfs/9p-local.h
+++ b/hw/9pfs/9p-local.h
@@ -15,6 +15,13 @@
 
 #include "9p-file-id.h"
 
+typedef struct {
+    P9_FILE_ID mountfd;
+#ifdef CONFIG_WIN32
+    char *root_path;
+#endif
+} LocalData;
+
 P9_FILE_ID local_open_nofollow(FsContext *fs_ctx, const char *path, int flags,
                                mode_t mode);
 P9_FILE_ID local_opendir_nofollow(FsContext *fs_ctx, const char *path);
diff --git a/hw/9pfs/9p-util.h b/hw/9pfs/9p-util.h
index 1e7dc76345..82b2d0c3e4 100644
--- a/hw/9pfs/9p-util.h
+++ b/hw/9pfs/9p-util.h
@@ -90,26 +90,61 @@ static inline int errno_to_dotl(int err) {
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
+char *get_full_path_win32(P9_FILE_ID fd, const char *name);
+ssize_t fgetxattr_win32(int fd, const char *name, void *value, size_t size);
+P9_FILE_ID openat_win32(P9_FILE_ID dirfd, const char *pathname, int flags,
+                        mode_t mode);
+int fstatat_win32(P9_FILE_ID dirfd, const char *pathname,
+                  struct stat *statbuf, int flags);
+int mkdirat_win32(P9_FILE_ID dirfd, const char *pathname, mode_t mode);
+int renameat_win32(P9_FILE_ID olddirfd, const char *oldpath,
+                   P9_FILE_ID newdirfd, const char *newpath);
+int utimensat_win32(P9_FILE_ID dirfd, const char *pathname,
+                    const struct timespec times[2], int flags);
+int unlinkat_win32(P9_FILE_ID dirfd, const char *pathname, int flags);
+int statfs_win32(const char *root_path, struct statfs *stbuf);
+P9_FILE_ID openat_dir(P9_FILE_ID dirfd, const char *name);
+P9_FILE_ID openat_file(P9_FILE_ID dirfd, const char *name, int flags,
+                       mode_t mode);
+#endif
 
 static inline void close_preserve_errno(P9_FILE_ID fd)
 {
     int serrno = errno;
+#ifndef CONFIG_WIN32
     close(fd);
+#else
+    CloseHandle(fd);
+#endif
     errno = serrno;
 }
 
+#ifndef CONFIG_WIN32
 static inline P9_FILE_ID openat_dir(P9_FILE_ID dirfd, const char *name)
 {
     return qemu_openat(dirfd, name,
@@ -157,6 +192,7 @@ again:
     errno = serrno;
     return fd;
 }
+#endif
 
 ssize_t fgetxattrat_nofollow(P9_FILE_ID dirfd, const char *path,
                              const char *name, void *value, size_t size);
@@ -167,6 +203,7 @@ ssize_t flistxattrat_nofollow(P9_FILE_ID dirfd, const char *filename,
 ssize_t fremovexattrat_nofollow(P9_FILE_ID dirfd, const char *filename,
                                 const char *name);
 
+#ifndef CONFIG_WIN32
 /*
  * Darwin has d_seekoff, which appears to function similarly to d_off.
  * However, it does not appear to be supported on all file systems,
@@ -181,6 +218,7 @@ static inline off_t qemu_dirent_off(struct dirent *dent)
     return dent->d_off;
 #endif
 }
+#endif /* !CONFIG_WIN32 */
 
 /**
  * qemu_dirent_dup() - Duplicate directory entry @dent.
diff --git a/hw/9pfs/9p-local.c b/hw/9pfs/9p-local.c
index 7e8d8492ea..d0d6d93549 100644
--- a/hw/9pfs/9p-local.c
+++ b/hw/9pfs/9p-local.c
@@ -53,10 +53,6 @@
 #define BTRFS_SUPER_MAGIC 0x9123683E
 #endif
 
-typedef struct {
-    P9_FILE_ID mountfd;
-} LocalData;
-
 P9_FILE_ID local_open_nofollow(FsContext *fs_ctx, const char *path, int flags,
                                mode_t mode)
 {
diff --git a/hw/9pfs/9p-util-win32.c b/hw/9pfs/9p-util-win32.c
new file mode 100644
index 0000000000..953e7da6fa
--- /dev/null
+++ b/hw/9pfs/9p-util-win32.c
@@ -0,0 +1,885 @@
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
+ *    completely.
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
+ *    by xxx_at_win32() and Windows handle is used to replace the directory fd.
+ *
+ *    Windows file system does not allow replacing a file or directory if it is
+ *    referenced by a handle. Keep the handle open will lock and protect the
+ *    parent directory and make the access to files atomically.
+ *
+ *    If we don't protect (lock) the parent directory, the parent directory may
+ *    be replaced by others (e.g.: a symbolic link) and cause security issues.
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
+char *get_full_path_win32(P9_FILE_ID fd, const char *name)
+{
+    g_autofree char *full_file_name = NULL;
+    DWORD total_size;
+    DWORD name_size;
+
+    full_file_name = g_malloc0(NAME_MAX);
+
+    /* get parent directory full file name */
+    name_size = GetFinalPathNameByHandle(fd, full_file_name,
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
+ * Windows POSIX API does not support opening a directory by open(). Only
+ * handle of directory can be opened by CreateFile().
+ *
+ * So openat_win32() has to use a directory handle instead of a directory fd.
+ *
+ * For symbolic access:
+ * 1. Parent directory handle <dirfd> should not be a symbolic link because
+ *    it is opened by openat_dir() which can prevent from opening a link to
+ *    a dirctory.
+ * 2. Link flag in <mode> is not set because Windows does not have this flag.
+ *    Create a new symbolic link will be denied.
+ * 3. This function checks file symbolic link attribute after open.
+ *
+ * So symbolic link will not be accessed by 9p client.
+ */
+P9_FILE_ID openat_win32(P9_FILE_ID dirfd, const char *pathname, int flags,
+                        mode_t mode)
+{
+    g_autofree char *full_file_name1 = NULL;
+    g_autofree char *full_file_name2 = NULL;
+    HANDLE hFile = INVALID_HANDLE_VALUE;
+    int fd;
+
+    full_file_name1 = get_full_path_win32(dirfd, pathname);
+    if (full_file_name1 == NULL) {
+        return hFile;
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
+            hFile = INVALID_HANDLE_VALUE;
+            close(fd);
+        }
+    }
+
+    return hFile;
+}
+
+/*
+ * fstatat_win32 - emulate fstatat()
+ *
+ * This function emulates fstatat().
+ *
+ * Windows POSIX API does not support opening a directory by open(). Only
+ * handle of directory can be opened by CreateFile().
+ *
+ * So fstatat_win32() has to use a directory handle instead of a directory fd.
+ *
+ * Access to a symbolic link will be denied to prevent security issues.
+ */
+int fstatat_win32(P9_FILE_ID dirfd, const char *pathname,
+                  struct stat *statbuf, int flags)
+{
+    g_autofree char *full_file_name = NULL;
+    HANDLE hFile = INVALID_HANDLE_VALUE;
+    DWORD attribute;
+    int err = 0;
+    int ret = -1;
+
+    full_file_name = get_full_path_win32(dirfd, pathname);
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
+        err = EACCES;
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
+    ret = stat(full_file_name, statbuf);
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
+ * Windows POSIX API does not support opening a directory by open(). Only
+ * handle of directory can be opened by CreateFile().
+ *
+ * So mkdirat_win32() has to use a directory handle instead of a directory fd.
+ */
+int mkdirat_win32(P9_FILE_ID dirfd, const char *pathname, mode_t mode)
+{
+    g_autofree char *full_file_name = NULL;
+    int ret = -1;
+
+    full_file_name = get_full_path_win32(dirfd, pathname);
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
+ * Windows POSIX API does not support openning a directory by open(). Only
+ * handle of directory can be opened by CreateFile().
+ *
+ * So renameat_win32() has to use a directory handle instead of a directory fd.
+ *
+ * Access to a symbolic link will be denied to prevent security issues.
+ */
+int renameat_win32(HANDLE olddirfd, const char *oldpath,
+                   HANDLE newdirfd, const char *newpath)
+{
+    g_autofree char *full_old_name = NULL;
+    g_autofree char *full_new_name = NULL;
+    HANDLE hFile;
+    DWORD attribute;
+    int err = 0;
+    int ret = -1;
+
+    full_old_name = get_full_path_win32(olddirfd, oldpath);
+    full_new_name = get_full_path_win32(newdirfd, newpath);
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
+ * Windows POSIX API does not support opening a directory by open(). Only
+ * handle of directory can be opened by CreateFile().
+ *
+ * So utimensat_win32() has to use a directory handle instead of a directory fd.
+ *
+ * Access to a symbolic link will be denied to prevent security issues.
+ */
+int utimensat_win32(P9_FILE_ID dirfd, const char *pathname,
+                    const struct timespec times[2], int flags)
+{
+    g_autofree char *full_file_name = NULL;
+    HANDLE hFile = INVALID_HANDLE_VALUE;
+    DWORD attribute;
+    struct utimbuf tm;
+    int err = 0;
+    int ret = -1;
+
+    full_file_name = get_full_path_win32(dirfd, pathname);
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
+        err = EACCES;
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
+ * Windows POSIX API does not support opening a directory by open(). Only
+ * handle of directory can be opened by CreateFile().
+ *
+ * So unlinkat_win32() has to use a directory handle instead of a directory fd.
+ *
+ * Access to a symbolic link will be denied to prevent security issues.
+ */
+
+int unlinkat_win32(P9_FILE_ID dirfd, const char *pathname, int flags)
+{
+    g_autofree char *full_file_name = NULL;
+    HANDLE hFile;
+    DWORD attribute;
+    int err = 0;
+    int ret = -1;
+
+    full_file_name = get_full_path_win32(dirfd, pathname);
+    if (full_file_name == NULL) {
+        return ret;
+    }
+
+    /* open file to prevent other one modify it */
+    hFile = CreateFile(full_file_name, GENERIC_READ,
+                       FILE_SHARE_READ | FILE_SHARE_WRITE | FILE_SHARE_DELETE,
+                       NULL,
+                       OPEN_EXISTING, FILE_FLAG_BACKUP_SEMANTICS, NULL);
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
+ * Windows POSIX API does not support opening a directory by open(). Only
+ * handle of directory can be opened by CreateFile().
+ *
+ * So openat_dir() has to use a directory handle instead of a directory fd.
+ *
+ * Access to a symbolic link will be denied to prevent security issues.
+ */
+P9_FILE_ID openat_dir(P9_FILE_ID dirfd, const char *name)
+{
+    g_autofree char *full_file_name = NULL;
+    HANDLE hSubDir;
+    DWORD attribute;
+
+    full_file_name = get_full_path_win32(dirfd, name);
+    if (full_file_name == NULL) {
+        return INVALID_HANDLE_VALUE;
+    }
+
+    attribute = GetFileAttributes(full_file_name);
+    if (attribute == INVALID_FILE_ATTRIBUTES) {
+        return INVALID_HANDLE_VALUE;
+    }
+
+    /* check if it is a directory */
+    if ((attribute & FILE_ATTRIBUTE_DIRECTORY) == 0) {
+        return INVALID_HANDLE_VALUE;
+    }
+
+    /* do not allow opening a symbolic link */
+    if ((attribute & FILE_ATTRIBUTE_REPARSE_POINT) != 0) {
+        return INVALID_HANDLE_VALUE;
+    }
+
+    /* open it */
+    hSubDir = CreateFile(full_file_name, GENERIC_READ,
+                         FILE_SHARE_READ | FILE_SHARE_WRITE | FILE_SHARE_DELETE,
+                         NULL,
+                         OPEN_EXISTING, FILE_FLAG_BACKUP_SEMANTICS, NULL);
+    return hSubDir;
+}
+
+P9_FILE_ID openat_file(P9_FILE_ID dirfd, const char *name, int flags,
+                       mode_t mode)
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
+ssize_t fgetxattrat_nofollow(P9_FILE_ID dirfd, const char *path,
+                             const char *name, void *value, size_t size)
+{
+    g_autofree char *full_file_name = NULL;
+    char ads_file_name[NAME_MAX + 1] = { 0 };
+    DWORD dwBytesRead;
+    HANDLE hStream;
+
+    full_file_name = get_full_path_win32(dirfd, path);
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
+ * This function set extended attribute to file <path> in the directory
+ * specified by <dirfd>.
+ *
+ * This function emulates extended attribute by NTFS ADS.
+ */
+
+int fsetxattrat_nofollow(P9_FILE_ID dirfd, const char *path, const char *name,
+                         void *value, size_t size, int flags)
+{
+    g_autofree char *full_file_name = NULL;
+    char ads_file_name[NAME_MAX + 1] = { 0 };
+    DWORD dwBytesWrite;
+    HANDLE hStream;
+
+    full_file_name = get_full_path_win32(dirfd, path);
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
+ssize_t flistxattrat_nofollow(P9_FILE_ID dirfd, const char *filename,
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
+    int ret;
+
+    full_file_name = get_full_path_win32(dirfd, filename);
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
+ssize_t fremovexattrat_nofollow(P9_FILE_ID dirfd, const char *filename,
+                                const char *name)
+{
+    g_autofree char *full_file_name = NULL;
+    char ads_file_name[NAME_MAX + 1] = { 0 };
+
+    full_file_name = get_full_path_win32(dirfd, filename);
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
+ * This function returns a Windows file handle of the directory specified by
+ * <dirpath> based on 9pfs mount point.
+ *
+ * Windows POSIX API does not support opening a directory by open(). Only
+ * handle of directory can be opened by CreateFile().
+ *
+ * This function checks the resolved path of <dirpath>. If the resolved
+ * path is not in the scope of root directory (e.g. by symbolic link), then
+ * this function will fail to prevent any security issues.
+ */
+HANDLE local_opendir_nofollow(FsContext *fs_ctx, const char *dirpath)
+{
+    g_autofree char *full_file_name = NULL;
+    LocalData *data = fs_ctx->private;
+    HANDLE hDir;
+
+    hDir = openat_dir(data->mountfd, dirpath);
+    if (hDir == INVALID_HANDLE_VALUE) {
+        return INVALID_HANDLE_VALUE;
+    }
+
+    full_file_name = get_full_path_win32(hDir, NULL);
+    if (full_file_name == NULL) {
+        CloseHandle(hDir);
+        return INVALID_HANDLE_VALUE;
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
+        CloseHandle(hDir);
+        hDir = INVALID_HANDLE_VALUE;
+    }
+
+    return hDir;
+}
-- 
2.25.1


