Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F2C650A25
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 11:32:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7DHD-0003Fv-3I; Mon, 19 Dec 2022 05:21:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9352c01a6b=bin.meng@windriver.com>)
 id 1p7DGl-0003BV-Az
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 05:21:19 -0500
Received: from mx0a-0064b401.pphosted.com ([205.220.166.238])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9352c01a6b=bin.meng@windriver.com>)
 id 1p7DGh-0007SG-Rk
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 05:21:15 -0500
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BJ9x60I003509; Mon, 19 Dec 2022 02:20:58 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=ueCPGOqsKfGC52IPvxW7Ib7DoVqflAATz+WJn7mNfNU=;
 b=dURwqF2Q97LueMtRR2KV/Sl87czrutLzFyDIoHQ3EwVBn/TgS5lOLCBNzg8NvP/aIhm5
 smJ2bCYvW5EEcsXPKtpJm5VNDMaX4zM4AUD6K9zuewzxrYyHeg9bQGT3N/O0Cqp8KCRB
 6rKRMl47Sv6N/WufXf8Bwqp5XMA1186+OOeqInYkSDLwiq5yPSw0Sg9NxIKsT08XF5H/
 qwQ/SW7AkeAUJ1s4oQ10w96xoi8X7Of4Uvuc146nQmmxe7XfENnydpz+LeYoAlh2Fjna
 hjA2Cf9JDyb8TQTE93nu4LwtXWl0NNxR2sX9kfUPJyGuZqegDPiKytyY43ZPmVHiT2mh Hw== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2100.outbound.protection.outlook.com [104.47.55.100])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mh9x8s77r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Dec 2022 02:20:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PwyxW5tDL4o+E+Dmqs7npz2l6SawSuNHelSaO89EL3vFhmXXr23DzoGUfLfQmpOm3eenicQhD9I4lcpauadtnx5tKgtVGs+AWy9VKRHPOfxURAk02BE4imJRd4ZJlsFUxKKwNjGvOGGRrYF9DBqBh7BfEteNmdgO7WfLWo1A0rqvXAci8Kd7srbTti2xvrQ5/VXZDPtpIZ8VDz4QLxlDKlp7QMMI0apzTvWlySMiN/Np+3wZTYf2xSpQRG63kevyzB8H4jizQzg+4hvGDcjhKC38/f1aacLgcVwcFIqp3JVVOFtDASmJbhPrZL5/k4DDzyyjLBGyJ869xuZ1UWqBug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ueCPGOqsKfGC52IPvxW7Ib7DoVqflAATz+WJn7mNfNU=;
 b=jqFFj4c+LZGoNnoZFiCb/tMVzU4MOsVKNSQ/ySTv+s71EWcxLs/cCLv5XGIdyVeM9wJ12+x3Ir0OcITzZuyg37JyP9tPATnaMzQ+jEAjKCdd+4Y0Bd9/QHod/L4KHDHsaatlbEBvrxwiadR1osGrfTW8CC6DbhDz+HB95YhYWSyYZoRyQmEPXOH7B2yvLhOqioybf5XqMjRJ1EvloEcYnzeQr4b3h1Kl1y0HIrR3l4hvtjwsSE+/FwHXU+QQX8xwjpsIZCd8O4v8FaA8jHZPHPaA9dmbbC8CEL+Z7pxEEKhUeVq75+Pa4GzNZgh6vb361whHpokKEMCwn7p6BW1TCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5358.namprd11.prod.outlook.com (2603:10b6:5:395::7) by
 DM6PR11MB4691.namprd11.prod.outlook.com (2603:10b6:5:2a6::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5924.16; Mon, 19 Dec 2022 10:20:54 +0000
Received: from DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::8e5e:71da:1e29:bc15]) by DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::8e5e:71da:1e29:bc15%5]) with mapi id 15.20.5880.019; Mon, 19 Dec 2022
 10:20:54 +0000
From: Bin Meng <bin.meng@windriver.com>
To: Greg Kurz <groug@kaod.org>, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 qemu-devel@nongnu.org
Cc: Guohuai Shi <guohuai.shi@windriver.com>
Subject: [PATCH v3 05/17] hw/9pfs: Implement Windows specific utilities
 functions for 9pfs
Date: Mon, 19 Dec 2022 18:20:09 +0800
Message-Id: <20221219102022.2167736-6-bin.meng@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: 21bde913-e97d-4787-9ffd-08dae1aab62f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ylJilmEChnbTxvByq7aAldF6xPHiJd91PChGPBBlWRt0KAx2vXTd0gOSysBKTH64rDO24N6DidMEMKrFAJV5k7swwz1I1w+ruUq1tWL3dDye5Ve8jNBMfkKUUlQjWt8X+A6CQC6yN9VvnbErsqCQuiPwmGYwGM75WML5o/3BWfrDBAkScY9U5JjnpvE4FvOZgDiWjFOqi1g50tje2kcBnvCZmCsBl7RSFnUCkyv7KgtrCkICi7QyaHRsqOaa8mBYw0WqWQtqx3b0dzyL4QYoaKhj5opV7dYNk7huazbVONmvpajH+QsjoQSXLoR5TGQvOZF/iscFNqJQ+E3xR/2y8FlXL6wdfh0SvwozO+JyPlHH9UK+ozyZPaBpx9TPsRhk//t+k3dOVdt/nCqCugsDOcxNQl6ZeUN3AlnNEgLiTAyCehPsQFevW9WOZsy3iKCQjJd3uuFJrQ10x/CdRlHRgReIJLDJCs7PytlXL6Nxba6xe2IkLYDS37E/uu0hw9+wmeA6Nw14HKZRnUF2Z+dU9HP3zlJAHHVODHtl1V+lYDT+IpjXM4d6irEzjud7AHp77LZucQXgoRGTW9V/PyJ1gY8BQvWhR49xD01qovxNGrL/zOTZ5RYuHgInO8C0fFt2kpQ8XbBHeaH7e07gndjyBY9TRzS71d8cc1vqoFCnp5IW1iOdI52TmpMc5OpVVI/ThthkFovHzUDK4Q0r28vqBg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5358.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39840400004)(136003)(376002)(346002)(366004)(396003)(451199015)(5660300002)(6666004)(107886003)(8936002)(30864003)(83380400001)(186003)(26005)(6512007)(44832011)(2906002)(41300700001)(36756003)(6486002)(110136005)(1076003)(38350700002)(52116002)(316002)(478600001)(4326008)(38100700002)(8676002)(66476007)(2616005)(6506007)(66946007)(66556008)(86362001)(21314003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?W40G+WdLfzAhg7AT52LhIt4efgz4fCURIaD0Rg8uIg1ch0bDhOrixEeWgOlH?=
 =?us-ascii?Q?tUrSptA9l8cxD/HsahzbYwCPt/i8neY4jNIcc9ih5VN+cq7i9NMhmdaXqb/8?=
 =?us-ascii?Q?QDdejVlckGH+CCXNc68ohQ+TJGjFvbWDHl8OvU7l3vxEb7jCE6TX6s06dU0x?=
 =?us-ascii?Q?mFy5ZCSGkYhnT1I9ZXb2E/oLecrzmc2mKSywBvODR/h+aVHlNp2/Y2q5eGqN?=
 =?us-ascii?Q?ZX7sJ1RY4g0VaZ/Wd68SwZGQzMV7j6JZJN2vJXt/h2IqWnCVHIMeoITE1c0E?=
 =?us-ascii?Q?ht8Un4e01leudT4fOENBHlhncQ9Q9hkNXMVxM1TD8O2FXWVf7yagPlTmBvXB?=
 =?us-ascii?Q?CDYv1+quxPF573kJMPJoMpG7fTuDxtV1ufUq3bdcn9Ob4mk2u6JtuE1sv2WG?=
 =?us-ascii?Q?C1lepvPpDkibRphVfSmHLoyUx8MmSMaz3xr6SuDQq72rWe2Gsg6kxnXonLPv?=
 =?us-ascii?Q?eSSALFW3hcGWgEJBkjmu4x77HzdO13ds3gpYT4+OdsppYe0N1kerGdkRYRy4?=
 =?us-ascii?Q?ySDyW0bK1Y9oe1GrmMB6wL2GOPh6RYbhUOJyxIz3akAh3WalhNasl0YwzBkx?=
 =?us-ascii?Q?NHdsId9GdjCWdT14zM1u0e/U+1MoPP34L23EBL9fYWpLVR7jo70nrVE/wQXw?=
 =?us-ascii?Q?EAjY8HPSA1mPY9/4s0wdcrGjos1tOHmhHjdbReMQY/W7N4SfCyFcGFWVdWDR?=
 =?us-ascii?Q?OIoYK5w+iO2jzE7uvnrNV1cP78l1FXMg7ErjLAptG7oyhN+5k2D5DKsKRg/7?=
 =?us-ascii?Q?0YKDlT/xS6NcxA8jx9BKiCF0knc44bV74GLU0CGCgrkqPme88E8wCgq3lwhL?=
 =?us-ascii?Q?Zs4dMvcTmCeYvKMVNG6n9s+018HSkKTvuZ3NOyWbZhtwZ4qOhpb86PUL4tNw?=
 =?us-ascii?Q?YdJ7OCmX6agfcOYe09YLDZNCX650yG+oHEmzZ7lXWuTs1PeRqR740I7ab12f?=
 =?us-ascii?Q?YunoHBAS4MT3p+5Zh62BdtR4w6LsBAI/jaTBEMK1u2kGXAnyC5ePjBgfTxka?=
 =?us-ascii?Q?/AaQ3lhjsJn6VCRLUMYNy0MblPaNiAlDNo7u0/qd/i0G7A4qRhflZZYuEmL1?=
 =?us-ascii?Q?rax07IUVEJwpHQsgtpqqptLWH+jBIaY75BY2ufwzYnmqgoMnDnjSmEMmpH2k?=
 =?us-ascii?Q?HgS2kK4qxRb9TPpHMb1QaFxWrOsk5NRAaTvmNIOyjsBQjGLakEZINg7y1V5r?=
 =?us-ascii?Q?8D5nxiW03N2Gha8PoOfsbfbBP5cJnVeivaZzLHrlvDvXSeVnl1QneW9V1LNm?=
 =?us-ascii?Q?1V9ApCH/eyKMshHD6k8+/akQ9JdNkuSRi/Q7VZIrvkPIYOfy7bXl5F8QLJy+?=
 =?us-ascii?Q?rTWeGppFeEz0CQjhAC27Xx8Ghft693DHrP4VEx+xTIwJoxNfyBvcPR3vrsBm?=
 =?us-ascii?Q?HLdxuTrQeOp8bByFTtHPAr/1YREbH9prt5ECo2qBoFVjtTe2t/7g9ZNqqb3i?=
 =?us-ascii?Q?CwbB1a3loxbrsFb03uOW9INv98tYY/+bJLnBIrNke1fiNtxz/yVACOEFUY/W?=
 =?us-ascii?Q?zr8j4M4HfTDmZ/oq3Qkqi69OuYTlvBxBZK4RQLTPe8XzUJ2YAGdeusc409xn?=
 =?us-ascii?Q?ht4BuZuXC4npFR1Py/6wIV96fFY8cyl97W4aPMZ8?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21bde913-e97d-4787-9ffd-08dae1aab62f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2022 10:20:54.6891 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k3R6qBpR67Kd68Z1nxqdCj21tddNZ2TTmEuSGcItpPw9I3OXW0zGXL1PkIbrFQczgJ2nVKOlCijmPABYNHCDrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4691
X-Proofpoint-GUID: w7jaQ3VbuijSNol3CVcr83iGXI79F208
X-Proofpoint-ORIG-GUID: w7jaQ3VbuijSNol3CVcr83iGXI79F208
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-18_13,2022-12-15_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0
 mlxlogscore=999 malwarescore=0 priorityscore=1501 clxscore=1015 mlxscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 impostorscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2212190092
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
 hw/9pfs/9p-util-win32.c | 931 ++++++++++++++++++++++++++++++++++++++++
 4 files changed, 969 insertions(+), 5 deletions(-)
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
index d2246a3d7e..c95ede0dcb 100644
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
index 0000000000..7a270a7bd5
--- /dev/null
+++ b/hw/9pfs/9p-util-win32.c
@@ -0,0 +1,931 @@
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
+    if (GetFileInformationByHandle(hFile, &file_info) == 0) {
+        errno = EACCES;
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
+ * This function set extended attribute to file <path> in the directory
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


