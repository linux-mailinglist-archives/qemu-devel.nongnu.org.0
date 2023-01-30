Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F30A6809FF
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 10:54:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMQqF-0002y9-M6; Mon, 30 Jan 2023 04:52:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=13943e2a21=bin.meng@windriver.com>)
 id 1pMQqD-0002xk-99
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 04:52:45 -0500
Received: from mx0a-0064b401.pphosted.com ([205.220.166.238])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=13943e2a21=bin.meng@windriver.com>)
 id 1pMQqB-000209-1M
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 04:52:44 -0500
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30U96eHW000968; Mon, 30 Jan 2023 01:52:30 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=BQCA7lysoYViR5t3M8lScVMY2+PANKI1hG53nyjiWU0=;
 b=bGoIuyKzU7W6e+xm4m3xj1Iul3PLeKRd1i2mBP79WYLdOnERqq6op2FrSzcEkBFI+yYo
 JpY2FN4gbWkcSXRV/uOvHvu58VHJuJspY66SP/dHUFi/0VdQLgOaNlIf+wbWiT5AKsbs
 R5v5uKnegazbPM9svEZNcUJ7ElXrcO3knsqgb7Yz/3lGFKxKPOLHhjH+r6ndddHXXAmi
 tj5ZGgaGt798qHuvhYPDk7CrFTidIGncAtpoCUA/u00xFKaOLKvL6CrN/j94xXxC+Fs7
 IYk6i33B7SOpxABCK+X+Bbk5haVCOgTX2uiX4lo8n9PI3EA3VszXFR0vG23JC/2GdY7r jg== 
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2174.outbound.protection.outlook.com [104.47.57.174])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nd43rhj5k-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Jan 2023 01:52:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SPxSnABIxgwRrVNGNrnF3YhYwXnpJxRYPgTfYLJOeouWZ9lnmvcNi2ZiN9lgt9PGxdi+ts3G5slRyVcu328sY1b6ThIvFoAAKoWCKxw9vPglB28vtZTvwBgroyqM/vnikcl4UVNi/EvQZeEQxMErh+enPaQkZIb0Gb5Af8f5oMDhYFpz+Rskc751ou1dijtXKBkV0VGVzhUvV5gWcF92FsWGXT4z1pnu6oDa7CdNPTf/5NKGCgC9wg5ynve+zm4DYlNOH+zz3emnAP89TI7IIIRRnZTxeloJAndBsnF6sbK77uPbER7DeESc8f8zU9ah0c4DynTkhl0rHvYWVJ6Avg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BQCA7lysoYViR5t3M8lScVMY2+PANKI1hG53nyjiWU0=;
 b=HvLRSqu4a7bQIcJ6WlcrhDyzBCxj3gh/RKSVxsc5/M7ICfGKg1mZlAL8iPZhDoE+2aymRmKmnuj8SfQ/8pLtlVpmjvqvkX25s9xW0A+yI/jhaV6KVzvGzqJ9A6WwUyKk2TmTnfLbqtE/9Sis8+CDlRXlKJWB7wygogompxexsGp/TZ/F/80WgZK66ON23+/iMQ5dZpP7ckNFvZ3PKKIknZFF5ZdFpDq5NKdQXtNAypttjzxKF/m5lI5oN9jQ/uJOSGpeUOlpmeW7wEaVALugvHzdJmRzJtj6fylud3mF4U1H0a5/VXmDqCvrf5uDmfCchMxDMxqjjnM/olj/eE2fFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5358.namprd11.prod.outlook.com (2603:10b6:5:395::7) by
 BL1PR11MB6025.namprd11.prod.outlook.com (2603:10b6:208:390::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36; Mon, 30 Jan
 2023 09:52:27 +0000
Received: from DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::6c5d:5b92:1599:ce9]) by DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::6c5d:5b92:1599:ce9%2]) with mapi id 15.20.6043.036; Mon, 30 Jan 2023
 09:52:27 +0000
From: Bin Meng <bin.meng@windriver.com>
To: Greg Kurz <groug@kaod.org>, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 qemu-devel@nongnu.org
Cc: Guohuai Shi <guohuai.shi@windriver.com>
Subject: [PATCH v4 04/16] hw/9pfs: Implement Windows specific xxxdir() APIs
Date: Mon, 30 Jan 2023 17:51:50 +0800
Message-Id: <20230130095202.2773186-5-bin.meng@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230130095202.2773186-1-bin.meng@windriver.com>
References: <20230130095202.2773186-1-bin.meng@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR02CA0061.namprd02.prod.outlook.com
 (2603:10b6:a03:54::38) To DM4PR11MB5358.namprd11.prod.outlook.com
 (2603:10b6:5:395::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5358:EE_|BL1PR11MB6025:EE_
X-MS-Office365-Filtering-Correlation-Id: affedad9-7421-4fe2-a360-08db02a7b229
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VoInPnDgXc+A5mqrKlDgYY/eoymPLgkFuaFe9rsAK9hnxNo1YHVocclLKxLWjU85g7QBxHsK1Lp4gujI4Ja45QFxanl1AimCcOVA4sbsqRe7FC8+wNxROCeBeM+almWlUgGcCMnmynRuPo5sN0Z7ER9/KfI9ae8vTU4mwmgDtEY1anCSTGoZoeV4biht51SD+i+dkFPSh6Y3f6/ealp3hBDiOfyYIo9eFCHcBDbnr5IpXKeKjO9OrkyXwGB9IlFTo4xiuzg1i1dxhAPlfRMfV2mqJwDFGpgK8iRjBot8oG2w4KN43c9YDXJ938ByxlwU6WsnyZRo1Umi0PGODVVtyFlCx+Tz1LmiLrK9X1qhp90cHsdrWZE+r9ahDjFDSB4HtO+h9G9ea+XyWBb2B6UCdyfyZ1M/F3jxD5qACScR4jclG+uEyY1QN0gzuJ3ApFZvk0PftmR1OtUXOOGyEE2ptGjkx+dSfvbDvjfANqOv5H0KuAmSj4+ItgUMBEGB0izMBAwZSC1B2PZ6rae/v5UvlOAKy+eOqF0CWcCX5efTw253mjJ0KajpT5ed0YqjXkFfcyz916bBAtUf9p2UNuTnl82O4tgTaHzOkuFRtOHF4/13j7MwSeoen4ffksHoKFHvg5O1WmqWaGA+mOmefJVTiAcB9woveF/x1gPK18FkN/laZ+oqmLiCxB0QR9ILNO0wxqU9Rf5ZjGXhioiFliPmmA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5358.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(136003)(346002)(366004)(376002)(39850400004)(451199018)(2906002)(26005)(6512007)(186003)(478600001)(6666004)(107886003)(6486002)(316002)(110136005)(36756003)(86362001)(38100700002)(38350700002)(41300700001)(8936002)(2616005)(4326008)(66556008)(66476007)(66946007)(8676002)(52116002)(6506007)(1076003)(5660300002)(44832011)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PRmrThh7eXvhPUH5DImMSnX8Wi+w3IzKPGjQuz2NMiESNo6FHc13SEAiB2uh?=
 =?us-ascii?Q?NvmibvgI1f0SZ9FMx6Ye4MGKNQOWqjtmret28zUYcX1G5GIuL7NKsFHY3Vdb?=
 =?us-ascii?Q?vW7z7ipnREZ6nKdsXb2FKHa2VuAgJILS4QV1vhABMuZnh78fQAy65Jx8GY91?=
 =?us-ascii?Q?jJeHbiViXe0vT+nG5LJDtkm7CY0j7I7mzK9sd1obTSACwb0tq1KR5pKEC2ig?=
 =?us-ascii?Q?cpa7JjDQXty6VFKeryxfTSVeGV/lV6IYb89aZK7Rwdlo3dPiBBx6z78BXeTA?=
 =?us-ascii?Q?vd1Br4s+j0Qbo+1YKEV5PQgX6MPsRNp6xKYPUu6oq8G2o6Ctj3hN1kCCOLps?=
 =?us-ascii?Q?jRlZX8vmB/dD1sDRK2opqAmX0ZHhX3c82rEiYX3Gp8e3RrNwqY0oKioLMqN6?=
 =?us-ascii?Q?9+FjMveec+afYilPtrzz+nYVs3FO4t+Z5nPnFepfXzMu2B78ixF9w86nWaFV?=
 =?us-ascii?Q?lGu4MFukEykZNpyz5GFFmtukE+8kcGapSF4sgcn6kW2Gs/LAB/renzR3rEVq?=
 =?us-ascii?Q?JZLMRqORoP9GgOSoLxTc1l6ncDcjx9GYxZnJfKx6mHzpfPxsYfNWpr+34urK?=
 =?us-ascii?Q?C6obTUH5adNJWoHt1kbNBVtKdj2sHBac7RIWt44OwsMXvundyTqRao7p1EXx?=
 =?us-ascii?Q?m+BFXaohsAzeupI0eONU9psoMbHFs5j70hZeKbwOx8WcvnPVP9iflOUrnxOv?=
 =?us-ascii?Q?/fwhIJoOMbKgPs1MnjguG6CU01Vuj9BrjgeKAZEt6uY5M28Lyd64QIrSCcjX?=
 =?us-ascii?Q?c26EGVKMBnLKVSavJQE2lQ5njWRhMvuJmaB4Di0na6JiD+Mg0ICOfFcMGqL+?=
 =?us-ascii?Q?3oUbkTXRLAlF8uMrNpaOGyritsc/CP7h5XXVFACQ7LlErpIm+598282rJ9Gc?=
 =?us-ascii?Q?7gEtOGIKR5BHLu3HjcHhWqrrt0pr9uf8hO7Rqnl+oXxnTiMnMh4Ox0Lf8/0D?=
 =?us-ascii?Q?tJw+mgiB0ZxvsXKaNDHdKsvrk2WVLRxI4SnLFWputlSc9fmY1EU82pcQKCyB?=
 =?us-ascii?Q?yeMZRTz+vzNvs6h3+KWSry1zEzMQ8/cPV+Hyuz9zKXJHUuhSk7mt0cgc/24M?=
 =?us-ascii?Q?/KLZstVCLrWEwjXEcFJlyw9P6jyuuZqNH29Q3B99h0FFmjDj3pya2MreE2Dr?=
 =?us-ascii?Q?vWgigrJOcXYKAnWODji3lmTwuOiSr0iHINt0A0T1O1l0C7+QKvkuVDBiXM2a?=
 =?us-ascii?Q?LvH453Ee1oxMHecYUtHpiNQJBWRaKxri7FTsE33drUx+BV7sxaFWlmF4G5Gf?=
 =?us-ascii?Q?z82hLppCLOPQ0XFXhzXhcFU1nqju75qVXp33S6ueoqjZG4699rbTeaDxseUC?=
 =?us-ascii?Q?vMr5I/zel9Xc8tqXxNbn77UYas0FoA3mph9jlJgqEmAfq1GwGqdfvClGNZD1?=
 =?us-ascii?Q?A+wHYj0oWElq1qJHjteFpIj/8P2D3Ly1ekS7c8RIQcFtno6RxxivFQs+BCcG?=
 =?us-ascii?Q?Fe/1EcWpxAe9Sc2HZEd+HCgr3XiWl320zxS7x/LzgLpTfFif8F3KKMoKdVfi?=
 =?us-ascii?Q?fErZZO0bI1np7oJ9JIEEXjmdvf6+Zp5dQqNHzTLPnrFuLEXHbDNn5GJ6ETM5?=
 =?us-ascii?Q?fTI49WkbpgeSsBFyVcYu5vM0GWkY7BrPn8QBQ+KGyVExMKccWKZ02NFP4YYH?=
 =?us-ascii?Q?Qg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: affedad9-7421-4fe2-a360-08db02a7b229
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2023 09:52:27.7891 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tci8n11+VfalVahG8CJA9yaL6YZhpH9QUWVbvHyYWeNlfcfbCB5Ao6MRHyz1LdwoEVZtoSQssjrZNs5dh8+BXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6025
X-Proofpoint-ORIG-GUID: tYRGw5gleuFVfkAqk2RuM02CigX0_Rkl
X-Proofpoint-GUID: tYRGw5gleuFVfkAqk2RuM02CigX0_Rkl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-30_09,2023-01-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 mlxlogscore=608
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301300094
Received-SPF: pass client-ip=205.220.166.238;
 envelope-from=prvs=13943e2a21=bin.meng@windriver.com;
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

This commit implements Windows specific xxxdir() APIs for safety
directory access.

Signed-off-by: Guohuai Shi <guohuai.shi@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 hw/9pfs/9p-util.h       |   6 +
 hw/9pfs/9p-util-win32.c | 296 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 302 insertions(+)

diff --git a/hw/9pfs/9p-util.h b/hw/9pfs/9p-util.h
index 0f159fb4ce..c1c251fbd1 100644
--- a/hw/9pfs/9p-util.h
+++ b/hw/9pfs/9p-util.h
@@ -141,6 +141,12 @@ int unlinkat_win32(int dirfd, const char *pathname, int flags);
 int statfs_win32(const char *root_path, struct statfs *stbuf);
 int openat_dir(int dirfd, const char *name);
 int openat_file(int dirfd, const char *name, int flags, mode_t mode);
+DIR *opendir_win32(const char *full_file_name);
+int closedir_win32(DIR *pDir);
+struct dirent *readdir_win32(DIR *pDir);
+void rewinddir_win32(DIR *pDir);
+void seekdir_win32(DIR *pDir, long pos);
+long telldir_win32(DIR *pDir);
 #endif
 
 static inline void close_preserve_errno(int fd)
diff --git a/hw/9pfs/9p-util-win32.c b/hw/9pfs/9p-util-win32.c
index a99d579a06..5503199300 100644
--- a/hw/9pfs/9p-util-win32.c
+++ b/hw/9pfs/9p-util-win32.c
@@ -37,6 +37,13 @@
  *    Windows does not support opendir, the directory fd is created by
  *    CreateFile and convert to fd by _open_osfhandle(). Keep the fd open will
  *    lock and protect the directory (can not be modified or replaced)
+ *
+ * 5. Windows and MinGW does not provide safety directory accessing functions.
+ *    readdir(), seekdir() and telldir() may get or set wrong value because
+ *    directory entry data is not protected.
+ *
+ *    This file re-write POSIX directory accessing functions and cache all
+ *    directory entries during opening.
  */
 
 #include "qemu/osdep.h"
@@ -51,6 +58,27 @@
 
 #define V9FS_MAGIC  0x53465039  /* string "9PFS" */
 
+/*
+ * MinGW and Windows does not provide safety way to seek directory while other
+ * thread is modifying same directory.
+ *
+ * The two structures are used to cache all directory entries when opening it.
+ * Cached entries are always returned for read or seek.
+ */
+struct dir_win32_entry {
+    QSLIST_ENTRY(dir_win32_entry) node;
+    struct _finddata_t dd_data;
+};
+
+struct dir_win32 {
+    struct dirent dd_dir;
+    uint32_t offset;
+    uint32_t total_entries;
+    QSLIST_HEAD(, dir_win32_entry) head;
+    struct dir_win32_entry *current;
+    char dd_name[1];
+};
+
 /*
  * win32_error_to_posix - convert Win32 error to POSIX error number
  *
@@ -977,3 +1005,271 @@ int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t dev)
     errno = ENOTSUP;
     return -1;
 }
+
+/*
+ * opendir_win32 - open a directory
+ *
+ * This function opens a directory and caches all directory entries.
+ */
+DIR *opendir_win32(const char *full_file_name)
+{
+    HANDLE hDir = INVALID_HANDLE_VALUE;
+    DWORD attribute;
+    intptr_t dd_handle = -1;
+    struct _finddata_t dd_data;
+
+    struct dir_win32 *stream = NULL;
+    struct dir_win32_entry *dir_entry;
+    struct dir_win32_entry *prev;
+    struct dir_win32_entry *next;
+
+    int err = 0;
+    int find_status;
+    uint32_t index;
+
+    /* open directory to prevent it being removed */
+
+    hDir = CreateFile(full_file_name, GENERIC_READ,
+                      FILE_SHARE_READ | FILE_SHARE_WRITE | FILE_SHARE_DELETE,
+                      NULL,
+                      OPEN_EXISTING, FILE_FLAG_BACKUP_SEMANTICS, NULL);
+
+    if (hDir == INVALID_HANDLE_VALUE) {
+        err = win32_error_to_posix(GetLastError());
+        goto out;
+    }
+
+    attribute = GetFileAttributes(full_file_name);
+
+    /* symlink is not allow */
+    if (attribute == INVALID_FILE_ATTRIBUTES
+        || (attribute & FILE_ATTRIBUTE_REPARSE_POINT) != 0) {
+        err = EACCES;
+        goto out;
+    }
+
+    /* check if it is a directory */
+    if ((attribute & FILE_ATTRIBUTE_DIRECTORY) == 0) {
+        err = ENOTDIR;
+        goto out;
+    }
+
+    /*
+     * findfirst() need suffix format name like "\dir1\dir2\*", allocate more
+     * buffer to store suffix.
+     */
+    stream = g_malloc0(sizeof(struct dir_win32) + strlen(full_file_name) + 3);
+    QSLIST_INIT(&stream->head);
+
+    strcpy(stream->dd_name, full_file_name);
+    strcat(stream->dd_name, "\\*");
+
+    dd_handle = _findfirst(stream->dd_name, &dd_data);
+
+    if (dd_handle == -1) {
+        err = errno;
+        goto out;
+    }
+
+    index = 0;
+
+    /* read all entries to link list */
+    do {
+        dir_entry = g_malloc0(sizeof(struct dir_win32_entry));
+        memcpy(&dir_entry->dd_data, &dd_data, sizeof(dd_data));
+        if (index == 0) {
+            QSLIST_INSERT_HEAD(&stream->head, dir_entry, node);
+        } else {
+            QSLIST_INSERT_AFTER(prev, dir_entry, node);
+        }
+
+        prev = dir_entry;
+        find_status = _findnext(dd_handle, &dd_data);
+
+        index++;
+    } while (find_status == 0);
+
+    if (errno == ENOENT) {
+        /* No more matching files could be found, clean errno */
+        errno = 0;
+    } else {
+        err = errno;
+        goto out;
+    }
+
+    stream->total_entries = index;
+    stream->current = QSLIST_FIRST(&stream->head);
+
+out:
+    if (err != 0) {
+        errno = err;
+        /* free whole list */
+        if (stream != NULL) {
+            QSLIST_FOREACH_SAFE(dir_entry, &stream->head, node, next) {
+                QSLIST_REMOVE(&stream->head, dir_entry, dir_win32_entry, node);
+                g_free(dir_entry);
+            }
+            g_free(stream);
+            stream = NULL;
+        }
+    }
+
+    /* after cached all entries, this handle is useless */
+    if (dd_handle != -1) {
+        _findclose(dd_handle);
+    }
+
+    if (hDir != INVALID_HANDLE_VALUE) {
+        CloseHandle(hDir);
+    }
+
+    return (DIR *)stream;
+}
+
+/*
+ * closedir_win32 - close a directory
+ *
+ * This function closes directory and free all cached resources.
+ */
+int closedir_win32(DIR *pDir)
+{
+    struct dir_win32 *stream = (struct dir_win32 *)pDir;
+    struct dir_win32_entry *dir_entry;
+    struct dir_win32_entry *next;
+
+    if (stream == NULL) {
+        errno = EBADF;
+        return -1;
+    }
+
+    /* free all resources */
+
+    QSLIST_FOREACH_SAFE(dir_entry, &stream->head, node, next) {
+        QSLIST_REMOVE(&stream->head, dir_entry, dir_win32_entry, node);
+        g_free(dir_entry);
+    }
+
+    g_free(stream);
+
+    return 0;
+}
+
+/*
+ * readdir_win32 - read a directory
+ *
+ * This function reads a directory entry from cached entry list.
+ */
+struct dirent *readdir_win32(DIR *pDir)
+{
+    struct dir_win32 *stream = (struct dir_win32 *)pDir;
+
+    if (stream == NULL) {
+        errno = EBADF;
+        return NULL;
+    }
+
+    if (stream->offset >= stream->total_entries) {
+        /* reach to the end, return NULL without set errno */
+        return NULL;
+    }
+
+    memcpy(stream->dd_dir.d_name,
+           stream->current->dd_data.name,
+           sizeof(stream->dd_dir.d_name));
+
+    /* Windows does not provide inode number */
+    stream->dd_dir.d_ino = 0;
+    stream->dd_dir.d_reclen = 0;
+    stream->dd_dir.d_namlen = strlen(stream->dd_dir.d_name);
+
+    stream->offset++;
+    stream->current = QSLIST_NEXT(stream->current, node);
+
+    return &stream->dd_dir;
+}
+
+/*
+ * rewinddir_win32 - reset directory stream
+ *
+ * This function resets the position of the directory stream to the
+ * beginning of the directory.
+ */
+void rewinddir_win32(DIR *pDir)
+{
+    struct dir_win32 *stream = (struct dir_win32 *)pDir;
+
+    if (stream == NULL) {
+        errno = EBADF;
+        return;
+    }
+
+    stream->offset = 0;
+    stream->current = QSLIST_FIRST(&stream->head);
+
+    return;
+}
+
+/*
+ * seekdir_win32 - set the position of the next readdir() call in the directory
+ *
+ * This function sets the position of the next readdir() call in the directory
+ * from which the next readdir() call will start.
+ */
+void seekdir_win32(DIR *pDir, long pos)
+{
+    struct dir_win32 *stream = (struct dir_win32 *)pDir;
+    uint32_t index;
+
+    if (stream == NULL) {
+        errno = EBADF;
+        return;
+    }
+
+    if (pos < -1) {
+        errno = EINVAL;
+        return;
+    }
+
+    if (pos == -1 || pos >= (long)stream->total_entries) {
+        /* seek to the end */
+        stream->offset = stream->total_entries;
+        return;
+    }
+
+    if (pos - (long)stream->offset == 0) {
+        /* no need to seek */
+        return;
+    }
+
+    /* seek position from list head */
+
+    stream->current = QSLIST_FIRST(&stream->head);
+
+    for (index = 0; index < (uint32_t)pos; index++) {
+        stream->current = QSLIST_NEXT(stream->current, node);
+    }
+    stream->offset = index;
+
+    return;
+}
+
+/*
+ * telldir_win32 - return current location in directory
+ *
+ * This function returns current location in directory.
+ */
+long telldir_win32(DIR *pDir)
+{
+    struct dir_win32 *stream = (struct dir_win32 *)pDir;
+
+    if (stream == NULL) {
+        errno = EBADF;
+        return -1;
+    }
+
+    if (stream->offset > stream->total_entries) {
+        return -1;
+    }
+
+    return (long)stream->offset;
+}
-- 
2.25.1


