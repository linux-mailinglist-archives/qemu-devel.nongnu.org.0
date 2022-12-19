Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D83650A02
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 11:22:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7DH9-0003Cy-C0; Mon, 19 Dec 2022 05:21:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9352c01a6b=bin.meng@windriver.com>)
 id 1p7DGh-0003Al-4b
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 05:21:13 -0500
Received: from mx0b-0064b401.pphosted.com ([205.220.178.238])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9352c01a6b=bin.meng@windriver.com>)
 id 1p7DGc-0007Q7-4y
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 05:21:10 -0500
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BJ8jsme020578; Mon, 19 Dec 2022 10:20:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=Xy/0/TnZzqrfJjp7JG4s8BGGuRiy5TjlmKMjhpcBLTA=;
 b=HH5Qqi2kxr5py9Q771+YkZV3dFJUzrCNVv8dSrseDEjcBqDWHfsBMRBYoyvSrFylrV6f
 jfxxxZAz1MgXXgcUbAizpKEn2AgXdlXH/f3a05WF/q3b31xPT0LMky8YzXPYnOldqZKq
 23abioKZnuE8GB91D4D+yoXVxXSmjtUlTpAWZkmu/+QkNfd8kz8Hu7hUAeqcfLcwyBef
 cNkd+2Txte9aH59lDAgMjuzZaAlzYwVML1yPcvZtYz+FjEnFZ2m2xtq/6K9Ku/txujQ8
 Ry52TNz+npUyT4CD4Suca5r533swin63qNkj0JeHP7b4MgfxKH4V9p/LI7+YfwwkA1Wl wQ== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2105.outbound.protection.outlook.com [104.47.55.105])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mh301hdgp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Dec 2022 10:20:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KOFaKVuRBUMInKftQzBUacx9NuHqkI8ergccW5wbQzl/LY/RCGAL+l79GEmY+DAaRl6yMgZdIeQwTGQvaqgIK2AgWBhoCq4Kq8DWmBUltKr/NN4IwhKq5K26k/C/UiQ4lG8aqwLP3CRUEHmaV+vAgMnbcGHE4zVJF8WeAC0Z1+TV/VNcBvBVytPtVKJr2USGYblS2oEGXWdgrD+1ynfNvyNWZESTIHC6U+1d4MdHSYCATjLv2tcascU0KBQRFK51m6gjuHTu7/qDFYjsm4NbzQ1Q8Pn7vksESz6RJGEtRXZtlJJFsjXWerEk0+p7h2nGm1ctsFIZjnxbbZHuKoJD9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xy/0/TnZzqrfJjp7JG4s8BGGuRiy5TjlmKMjhpcBLTA=;
 b=eT5HKYQpwsnz2hR0IIKc9JC9WwF1GwydafU9Gj5FFhLiEJL5R6bAUz1TFTm5wnUXLXTtWFDE+S3mVmehsff8tqrIaEtyDphUDi6Dq0DV3RaS8rhWMpikrxaSIJudjrLFRV4k81Xl/K/gIokpgGjh9Mqwd7J/3LMe6htvTl+IzXB0PB6CoyoF8+PQRy5Dp4S0MKOUDeOhmWQVPRMYUaEv1UI85vZ5SmP0E+/wSY2WEsevO4cYE1pEIuhNQANu9HXNHrzLzGAGQGRgveaD0Ipu9Zbe7ydw8nbSRIZDW4RQOo8W6WqdR0dKjOC490o8JFtlCCWjWuAM05JXWbK0AxpjkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5358.namprd11.prod.outlook.com (2603:10b6:5:395::7) by
 DM6PR11MB4691.namprd11.prod.outlook.com (2603:10b6:5:2a6::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5924.16; Mon, 19 Dec 2022 10:20:52 +0000
Received: from DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::8e5e:71da:1e29:bc15]) by DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::8e5e:71da:1e29:bc15%5]) with mapi id 15.20.5880.019; Mon, 19 Dec 2022
 10:20:52 +0000
From: Bin Meng <bin.meng@windriver.com>
To: Greg Kurz <groug@kaod.org>, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 qemu-devel@nongnu.org
Cc: Guohuai Shi <guohuai.shi@windriver.com>
Subject: [PATCH v3 04/17] hw/9pfs: Add missing definitions for Windows
Date: Mon, 19 Dec 2022 18:20:08 +0800
Message-Id: <20221219102022.2167736-5-bin.meng@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: 7e466fa9-da68-4296-994b-08dae1aab4fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Vzxki5wCEESSDfvC1chThlTEXBfBVr9QbN1s2mYvRypF+DqphCf4f3eqUK5NzQsF/4UsRTTrtUPRXhAivSmHtslGnTzO3G1EXWW+nObmzhI3PXtDKAoX0yfbz6qzdGZzv9dbsDqp6k529Op5PfgD26UKNlKTrHEAgR0B2NNDuTW310bTeTIGeHzfPK+eoz9Mbjlicm8+ghBFxSciUIIsf3F7bnECEnEBylQGhgkiXsxkSb7n+ofLB+lGrU7jc29ActzPMOBRnd3tF86avlgKN7/axVw5SfQ485KbnLpD8nNY62mfS+W6lR1p22bw7tYKqcv/aM7W3i7Y2yxSJdWfyReaXZv07Bk1c7A3HlRRroLnKYSz08wJVys3xJ34bg2flBCrlfH8bTtqHZ7bilJGu61+mo+19VD+agBVbDNs8OiLdsUZguC9gVWFcjjm4AKFoiLeH31ArDwJFfw2OLurKAqN2iXEvb/r69gWL/9/j0RgsDUBKrnK9OqW7Kuo4BkBHQMgV3VcZ3UjUZ2nQcgeeECaqbGucUJkKKEUxqSkKjPCYgFMcRa1IcmIzr9wZG958oV7t6pNdDKbSo2BScVyWsRgT/vuTFtT0qGxNMXARF8X/0K3pvtDEz2Zp7LUtFZ4JuCvoSPvYTectSimLdPuW4VPeyxhDez0j2yzEKfAoM0nOUyh/PRCcf+mkFszZ9LM0Agj5K1sWGPeZztmYz+bd0EuajJySsymNfRb3jGLatg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5358.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39840400004)(136003)(376002)(346002)(366004)(396003)(451199015)(5660300002)(6666004)(107886003)(8936002)(83380400001)(186003)(26005)(6512007)(44832011)(2906002)(41300700001)(36756003)(6486002)(966005)(110136005)(1076003)(38350700002)(52116002)(316002)(478600001)(4326008)(38100700002)(8676002)(66476007)(2616005)(6506007)(66946007)(66556008)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Wfj809IJ7MIRiVpKlnneXF29187iO0sh0QVxlUqaaeUUxIV5mynVhGr4seYz?=
 =?us-ascii?Q?lWDeph1s+TAPwCtx44uUMrmq7cLFE6cJhpukPen/+GoKK8mlaNR64d1Y6WeE?=
 =?us-ascii?Q?iuv5urRCyGVo8c8DAo0GJNAf8BMof3+osv5sUrgNQ4fQElEQ/OQL5NR/PEq1?=
 =?us-ascii?Q?ppTOFvBcUb7YxH0W4S6A+dhVsC0D1ro5itIQkYxpFB7gIs9ciSzOkKHLcFC1?=
 =?us-ascii?Q?3UwDJ//6i7f0jxDIHG/R6yCV8IoHWu37Ucf/EFAU3ddlJV7bPiAGUvKM5XN0?=
 =?us-ascii?Q?giGs8+ixPiQ4Z3ILUC11rbqm09Wi2n7C5UHZWZy3VhG1Q7PA73qSVMZQ2xop?=
 =?us-ascii?Q?Ak4QiXuTxEjjLHJQglazovcLGVu2TXKSg4shEvit06yWQ68SSRYSWRmgpwnk?=
 =?us-ascii?Q?YSj2O1a90j7OwSNkc2tGiiO3tYlkQhwm2O+1liqUFWr1Si1IOVxUTRn+uFtL?=
 =?us-ascii?Q?33Ct3LhRquM7Jv/UhuUvTzKBxM/wWimUFDXNdIffow4AhTZiEBj+x1mND8jn?=
 =?us-ascii?Q?ewL4cLouejTThMNp8fJrUA8gWm/QPPFT+oqudRrHyTRzEtdcE3DGgdsxazBy?=
 =?us-ascii?Q?7gwVFE6QMeb1x1UrTUiHEgtFyIg/2F+jHFBvcNovsdB/hLC/ZZswijik9YIL?=
 =?us-ascii?Q?/xJwO0vEbmdeNmYcpw1u9tADRTV21n/RDSNRovU6T0ciZV/QBFaPIPpBxaNi?=
 =?us-ascii?Q?6np4MkhXFJ+uO1qnIFwnPdIWb9c+lLTpyhadM/pWVF8d7u3mwOVsfscgY2Wm?=
 =?us-ascii?Q?M4bDYZ4Ej7ovuxW+qFJW5+CXo9Y7cdOeD5kRMxR9yRvtuun9notwwd34Bm+o?=
 =?us-ascii?Q?lPNj2ZtPTD7a1EFEpvKwsYR1mW2Z8+QK6Eni1dZojYsr6/hq5DUUi6B6mipI?=
 =?us-ascii?Q?9gMyl4MZam7AzRGohOj8Z6XbEfEBLOTrLtQtXaa7RFhfKPhtmrP0ccvAoPvj?=
 =?us-ascii?Q?ZEIiAVDb1Yw9kbbgzyMbJsPh8IwCdUxvwo06WRRnXfGChpHlXawMmiDhaJgY?=
 =?us-ascii?Q?F8kEfZuAEbXBVnzJCfacJEtYyVNQHPgIXld3RfBwG6VHAWlcpUEJcaxsYnkN?=
 =?us-ascii?Q?PhCRMxWnaupGY/rVhKXdhJvhuuJyx6dvaxbXBTu94fvKmpQLNxHk8aZ50p2/?=
 =?us-ascii?Q?weWt6bb4wG4/KbivpRlTr4szBTR8M8bumUh3INL/HR8/+Jz59y+5bt4BEmos?=
 =?us-ascii?Q?oVwYJ/hNSW6wQxvS2zeLj8KozikEvoE/rqK4t7FZ12Rpg3Fgi0Lz1D7KbSmQ?=
 =?us-ascii?Q?fRRdtH8MvkTMLn6yD9VBM8G+mHm8kjaACjopGigpY9b2x2URoZqzpOQNljcT?=
 =?us-ascii?Q?xN1JOQgeEZZsJYfQHfk9uIif0cFeFXtAbyej7NrSFnKzKtlvx8URBYAtAHHh?=
 =?us-ascii?Q?NIODYwHUZJyGSMtOnC8Wt+S0UnJkM9oI7F0Ttlzbm1KJ8hnsbBVzvGHkAhoT?=
 =?us-ascii?Q?fNqdPd2ygt+8P0k3i4tVYcqo5e1VLImEEBuwSb6A8wYXqZlLn2j3OeEETKa+?=
 =?us-ascii?Q?0r56bfN4cEK75EdOcrE0YNuzqJTYVw5YUqynxOsX+lHdo8E3g6l3Ed6glJch?=
 =?us-ascii?Q?PvUYbB2uC9s8mjXF7KdOL7KmWO5HRqXXM3FvDClm?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e466fa9-da68-4296-994b-08dae1aab4fe
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2022 10:20:52.5495 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Co06lN7EMecZ2e4tQ0EPlgTWP5YCf+eJ410k5jS+whWzgC2o5aLk3rYSxRrP2zfI85IhaXjGXoZc77RY7vn20g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4691
X-Proofpoint-ORIG-GUID: WRvdzJDDGbE4NVFefp_fFniQamweS6Nb
X-Proofpoint-GUID: WRvdzJDDGbE4NVFefp_fFniQamweS6Nb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-18_13,2022-12-15_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 impostorscore=0 mlxscore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 malwarescore=0 phishscore=0 adultscore=0
 mlxlogscore=756 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2212190091
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


