Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6BC69C854
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 11:12:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU36S-0007zS-Bh; Mon, 20 Feb 2023 05:09:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1415163841=bin.meng@windriver.com>)
 id 1pU36Q-0007yl-BV
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 05:08:58 -0500
Received: from mx0a-0064b401.pphosted.com ([205.220.166.238])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1415163841=bin.meng@windriver.com>)
 id 1pU36L-0008Vy-0y
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 05:08:57 -0500
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31K9fSWS030356; Mon, 20 Feb 2023 02:08:40 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=op9BZ0rOkqmdwuRMJ8UbP7oCV0yE2esAem3+VcQpVjc=;
 b=iD4CgipeBu4/A+lnHapmNGmU53LKAzap7A/Znogy/PnkZFzoXpSN054SPhJeniWatwnL
 905gXqihxUeMGx8ihXLRmH6FXSEULs1NKkqMX2ORjBvV3tyzfG7KGXHs1BiT5iq/6VsJ
 4KYLEbaYnx7d0v2Svqg5NmeaHfSW3dvu42bxZU5cvjzmQanfQg2r8efoU9fD3cJj06jt
 CRBgZaHJ5Di83ez7uURLPaKpvXj1MEkhmRAw/4usyWeZ3gnDXuER+5TOcHFiywnWNsHo
 IvEfQ8TSYTNaW2PNUYOSgdjKfBUFb4zi9LAD7t1O07Sh/h8yPnbpS+DkgNascKv/DB4Q xA== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2177.outbound.protection.outlook.com [104.47.59.177])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nttu6sfs5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Feb 2023 02:08:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MrubD7BGAJ5BdgSjNtpAMUrtJ5WYARTBvZoTtbeFxy6mjAPKP2T8pa8Ov14ydHEJFo7Dq5Dr4+Er5ZZFsiBAst3G4bescLUYnb0d1ZBDb7Fx2w9qfBDZjkuCCiuIO4D50E4Ut6FAjNvL7xk5CblUTY8e1WNPtzPjfPm7LsKycwCFC34MVNkM7jmwf9bvFwAyZ+6UttiWwImvOEIr40oIKnvUlOuAbZ25kWdyDvSs9aSehRBxrgIW5P3AYoHD4Hhkwmx/OkUgwQLsNYrixttSV/NMYv0SvN0Ms2uxnblUmy/Ir7hUchi8mYPDo+7lPbVZVab5j2BzT3H1iLcco8pvuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=op9BZ0rOkqmdwuRMJ8UbP7oCV0yE2esAem3+VcQpVjc=;
 b=g5oTRfYrN6353IHJvDPg0oPMmhp/kK7ff1GvWGamEQQNSlnbmelTtw3tjmeAeMrOiY7/KAX3GflwObxK3f+/TvSy3yc4wYSCCw9i8nYmycoYqkBwT/L7DgCty76gKMBk7QZ6nr9J39N5UATkVRj6jqZy9OB8ohUDKedpiAufOlotibHYUXMautXRESTdve6a4yL1sIu24GhFuuFVDUa61ezavVxi1JK3b/rID8tTx3dHXqnJr3CfQgcOTJPUyLommk0VblAQPzY296VDyxKwXf1S6vFMJB3nT9OovWa5DbZx/iCjpS1yoBmbAc5y8Auo+JIumpG0tkji3oEAeJ3avg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5358.namprd11.prod.outlook.com (2603:10b6:5:395::7) by
 SA2PR11MB5066.namprd11.prod.outlook.com (2603:10b6:806:110::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6111.19; Mon, 20 Feb 2023 10:08:38 +0000
Received: from DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::6c5d:5b92:1599:ce9]) by DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::6c5d:5b92:1599:ce9%4]) with mapi id 15.20.6111.019; Mon, 20 Feb 2023
 10:08:38 +0000
From: Bin Meng <bin.meng@windriver.com>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 qemu-devel@nongnu.org
Cc: Guohuai Shi <guohuai.shi@windriver.com>
Subject: [PATCH v5 04/16] hw/9pfs: Implement Windows specific xxxdir() APIs
Date: Mon, 20 Feb 2023 18:08:03 +0800
Message-Id: <20230220100815.1624266-5-bin.meng@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: be0fa702-b9ca-4878-13b7-08db132a6f15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zvu7z+wK6iegcCYMfJKVXQMyvc1KTX60Y0I3NLNf1v0O+gSWKZldcAaH3hr/IqyowHctHjLacGD1SHDdrdbOXjWNX1U8npWxAwwqvcTSbi0AEVlqrNrvEEIRqtY3LjdDDJi/ntHf2SeJZJj2skrzzwZQGUJlHpT5omUlZMHI/7gFja5PE1PrOmcQmiB5xHR/ye7neLppY4daBHNzVKEaoLdTzXA2WGLCgNR41Kw3Z7djR+IDETr1FW9MMYUWvMCLnKHMcRgRdEkX108TAPDLOM6Yg2t+3rC3tIgMj6TE99lsJDd4npRW7ym/PzV9nIrfR85xnz+1YCmrZ+g9e6KprKd8jqLS2JXOKeQDDooQbTSETTsbkH6o9Y29kGHRXTb4cYp/EshgxR/54sUyxxJbTiJx3ZGsM50YT0P5umSIbzSomoZjZAo5Y/g6koXkZ3dHpKIO9elTwcMPxP+K+WEq/HQPZerpLV3Efzn7xhWTLGFlhVFlmjLXO5sGFw3FAKZAlsClrStXVL88yTA7skpW1wM3Jwu0l/DLeb5buqXgwyBqwYBUrW5bXYz/BZsGIb0hMDQ0rFH06d/stIi9S45XJiRn0cS4xLoBOqF6bHbxey755zPRGg5agJsBaY+NhWhJ0NEgu4rsZpqrXHaqOCPUkzK3oVauYwRTXbdlQgfUqa+YYd8GBEPCZ+EuHRrDUamg68fFNtib/pcoFvW2ocBAfQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5358.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(376002)(366004)(39840400004)(136003)(396003)(451199018)(2616005)(4326008)(66556008)(8676002)(66946007)(83380400001)(66476007)(5660300002)(8936002)(6506007)(6486002)(107886003)(6666004)(1076003)(6512007)(26005)(186003)(52116002)(36756003)(478600001)(110136005)(316002)(41300700001)(38100700002)(44832011)(38350700002)(86362001)(2906002)(30864003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IqBSAAIVsqHP4BV7JGxB59U+QoCGCSN8d/5ZvJePD9tLbdqSGybkXTJrtvCG?=
 =?us-ascii?Q?cR8rZU6IvWUS//DIH3WH+iA8Z3ATXMFONX9Zx68ujZDziqrE9zPEt6C+w4nZ?=
 =?us-ascii?Q?L5XVb21mlIL7+rCIjYHINFLL8kbIIS0x18znXLIfzAwy+34eKR2ofkUujxRz?=
 =?us-ascii?Q?Yt5u6oKdhWs3KhcS9I0kXxxPrqlCXq0y5gPOOJakoVAjhaHYR+GpT8y/UOv0?=
 =?us-ascii?Q?Xwe/WxVCEa1uCydi4I0HbPuGaom+b3JXwwl3kZMv8pZLylBWB8pCepw9KhKd?=
 =?us-ascii?Q?jWgot3cH2xb+My5TvavPTLlbUquGT7s+Wy/66opFjZupU7v6TLiLJ/oHViLI?=
 =?us-ascii?Q?DfacPT3HvBLhvpvPiyJU3nTfej4+pS5l6v1Nw85VUHCGXGAzsGQ24z8Odq5Y?=
 =?us-ascii?Q?oxE5MUltNzAfqmQV0yb57C0q4JoxtkzgPAWexF1t+8mCFYxiK7kbxeVwpp9X?=
 =?us-ascii?Q?plVcrIXdsoDpQriR++1w9HK6CpLxmXbfcQI3Ob/HAi1b+jFWshikuZmFfVGO?=
 =?us-ascii?Q?rRMXHl1TzlRScg5Fh11bMwxPZMxjW49Qa2v5TPbrsAslhVywVaz32FJq/jLq?=
 =?us-ascii?Q?UqhrfbsFQZGG9s5/RsqWmq1HL4QlqB0GrgYJVJn0zQOrhepP3LbT+sVYkmib?=
 =?us-ascii?Q?PCRyDykO5RXks+BKS5hIH0i5EaIgpYx1vOnBReYM+BT7MrfXYS8DyWpsPbZq?=
 =?us-ascii?Q?W6Mtj/mPxQOZLtoB9svXbO1q+Ly1mZgfwviLOhwG0KIgEwR+vuX+7hC5ujWU?=
 =?us-ascii?Q?lh8LzBAxJtXDwDaDNpBORWHzWL97hqvL9mpdnj6lne5qIOyfMXAMcdJ6A0Cr?=
 =?us-ascii?Q?bsijmEXSe4fCIxtBxbDjKsGtl17B8r77JEMFJGByZqYbKuCoyu6Fwik7o14s?=
 =?us-ascii?Q?GyEMhr4yDepB5bmL4MzUK9Mcwds7aZ2EBaBd6bgGi1JkxeM9vnWBRV4svOk+?=
 =?us-ascii?Q?LdAy8VIxwlXatGh4dpb41xdpYhPszEODudgLppaGtUSTHl8vypx7shBrKwd+?=
 =?us-ascii?Q?ABtfD+lL6RNjWyhj6Sx3C3lEDcrFVYcwR3jmLnsddQF/Adb72PJzavktt5tT?=
 =?us-ascii?Q?IQ557P6Ef9lLP2vsS17GATrPQqXZVd/ClMMhhSdDRfbP3cYjV1qkBuoL0ThS?=
 =?us-ascii?Q?i60bUrobdohuwyAc6a8A5VF7aoZE2MIkySL5usR8ZYZ91UEEeYfW/ZUe+ZxZ?=
 =?us-ascii?Q?9kfK264Q88+KcLNdTDQjihTYVMEPN6mzcfgWaS82ReHt4hwdZ9O2fdp70gk9?=
 =?us-ascii?Q?oKV/QOSVfmD0mD5aJuH/kO+Lo8sFIIPXo9HHUgOKdm4HKi3yZWp4f23jkZ7M?=
 =?us-ascii?Q?nNQBiXRaXCwJzzPqGeAuxyHnrvvobXMMVYX7TtVXAclikTqv4SLqayyMqGdb?=
 =?us-ascii?Q?BeixTVslajah20eDaWxz/HU44yrZjsTlYi3ffbvATX+ZO2xknkXQussdUJZl?=
 =?us-ascii?Q?gSTmCSpUvzek2Im3XBJYRXE8swecEnzY/7VX2MlHmwb89ONVho1Qu9Sqih7J?=
 =?us-ascii?Q?9ivPm1a9vKSNopgpKt3nI6vAydYWb/x7oWrYWEAwHI/mR54y35lGtGzWf3sz?=
 =?us-ascii?Q?Ai6Se59Gi2hH7rpGUjSE7AIt83HQgraUvNioDLfphp+zrdO/dOxAMT9H9mv4?=
 =?us-ascii?Q?Ug=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be0fa702-b9ca-4878-13b7-08db132a6f15
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2023 10:08:37.9231 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZGNlv0/ccmmj8BIPpl9P8KFujn6xht5x9Da8BklFuCUV4hd0weCjmprvutRJeYGdU5c9hV5I6nz6K7IHAldyPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5066
X-Proofpoint-ORIG-GUID: q9IdMR4bCORemXk5IsIUjF2rWUwjEnC6
X-Proofpoint-GUID: q9IdMR4bCORemXk5IsIUjF2rWUwjEnC6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-20_08,2023-02-17_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 impostorscore=0 clxscore=1015 mlxlogscore=577 mlxscore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 adultscore=0 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2302200091
Received-SPF: pass client-ip=205.220.166.238;
 envelope-from=prvs=1415163841=bin.meng@windriver.com;
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
 hw/9pfs/9p-util-win32.c | 443 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 449 insertions(+)

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
index a99d579a06..e9408f3c45 100644
--- a/hw/9pfs/9p-util-win32.c
+++ b/hw/9pfs/9p-util-win32.c
@@ -37,6 +37,16 @@
  *    Windows does not support opendir, the directory fd is created by
  *    CreateFile and convert to fd by _open_osfhandle(). Keep the fd open will
  *    lock and protect the directory (can not be modified or replaced)
+ *
+ * 5. Neither Windows native APIs, nor MinGW provide a POSIX compatible API for
+ *    acquiring directory entries in a safe way. Calling those APIs (native
+ *    _findfirst() and _findnext() or MinGW's readdir(), seekdir() and
+ *    telldir()) directly can lead to an inconsistent state if directory is
+ *    modified in between, e.g. the same directory appearing more than once
+ *    in output, or directories not appearing at all in output even though they
+ *    were neither newly created nor deleted. POSIX does not define what happens
+ *    with deleted or newly created directories in between, but it guarantees a
+ *    consistent state.
  */
 
 #include "qemu/osdep.h"
@@ -51,6 +61,25 @@
 
 #define V9FS_MAGIC  0x53465039  /* string "9PFS" */
 
+/*
+ * MinGW and Windows does not provide a safe way to seek directory while other
+ * thread is modifying the same directory.
+ *
+ * This structure is used to store sorted file id and ensure directory seek
+ * consistency.
+ */
+struct dir_win32 {
+    struct dirent dd_dir;
+    uint32_t offset;
+    uint32_t total_entries;
+    HANDLE hDir;
+    uint32_t dir_name_len;
+    uint64_t dot_id;
+    uint64_t dot_dot_id;
+    uint64_t *file_id_list;
+    char dd_name[1];
+};
+
 /*
  * win32_error_to_posix - convert Win32 error to POSIX error number
  *
@@ -977,3 +1006,417 @@ int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t dev)
     errno = ENOTSUP;
     return -1;
 }
+
+static int file_id_compare(const void *id_ptr1, const void *id_ptr2)
+{
+    uint64_t id[2];
+
+    id[0] = *(uint64_t *)id_ptr1;
+    id[1] = *(uint64_t *)id_ptr2;
+
+    if (id[0] > id[1]) {
+        return 1;
+    } else if (id[0] < id[1]) {
+        return -1;
+    } else {
+        return 0;
+    }
+}
+
+static int get_next_entry(struct dir_win32 *stream)
+{
+    HANDLE hDirEntry = INVALID_HANDLE_VALUE;
+    char *entry_name;
+    char *entry_start;
+    FILE_ID_DESCRIPTOR fid;
+    DWORD attribute;
+
+    if (stream->file_id_list[stream->offset] == stream->dot_id) {
+        strcpy(stream->dd_dir.d_name, ".");
+        return 0;
+    }
+
+    if (stream->file_id_list[stream->offset] == stream->dot_dot_id) {
+        strcpy(stream->dd_dir.d_name, "..");
+        return 0;
+    }
+
+    fid.dwSize = sizeof(fid);
+    fid.Type = FileIdType;
+
+    fid.FileId.QuadPart = stream->file_id_list[stream->offset];
+
+    hDirEntry = OpenFileById(stream->hDir, &fid, GENERIC_READ,
+                             FILE_SHARE_READ | FILE_SHARE_WRITE
+                             | FILE_SHARE_DELETE,
+                             NULL,
+                             FILE_FLAG_BACKUP_SEMANTICS
+                             | FILE_FLAG_OPEN_REPARSE_POINT);
+
+    if (hDirEntry == INVALID_HANDLE_VALUE) {
+        /*
+         * Not open it successfully, it may be deleted.
+         * Try next id.
+         */
+        return -1;
+    }
+
+    entry_name = get_full_path_win32(hDirEntry, NULL);
+
+    CloseHandle(hDirEntry);
+
+    if (entry_name == NULL) {
+        return -1;
+    }
+
+    attribute = GetFileAttributes(entry_name);
+
+    /* symlink is not allowed */
+    if (attribute == INVALID_FILE_ATTRIBUTES
+        || (attribute & FILE_ATTRIBUTE_REPARSE_POINT) != 0) {
+        return -1;
+    }
+
+    if (memcmp(entry_name, stream->dd_name, stream->dir_name_len) != 0) {
+        /*
+         * The full entry file name should be a part of parent directory name,
+         * except dot and dot_dot (is already handled).
+         * If not, this entry should not be returned.
+         */
+        return -1;
+    }
+
+    entry_start = entry_name + stream->dir_name_len;
+
+    /* skip slash */
+    while (*entry_start == '\\') {
+        entry_start++;
+    }
+
+    if (strchr(entry_start, '\\') != NULL) {
+        return -1;
+    }
+
+    if (strlen(entry_start) == 0
+        || strlen(entry_start) + 1 > sizeof(stream->dd_dir.d_name)) {
+        return -1;
+    }
+    strcpy(stream->dd_dir.d_name, entry_start);
+
+    return 0;
+}
+
+/*
+ * opendir_win32 - open a directory
+ *
+ * This function opens a directory and caches all directory entries.
+ */
+DIR *opendir_win32(const char *full_file_name)
+{
+    HANDLE hDir = INVALID_HANDLE_VALUE;
+    HANDLE hDirEntry = INVALID_HANDLE_VALUE;
+    char *full_dir_entry = NULL;
+    DWORD attribute;
+    intptr_t dd_handle = -1;
+    struct _finddata_t dd_data;
+    uint64_t file_id;
+    uint64_t *file_id_list = NULL;
+    BY_HANDLE_FILE_INFORMATION FileInfo;
+    struct dir_win32 *stream = NULL;
+    int err = 0;
+    int find_status;
+    int sort_first_two_entry = 0;
+    uint32_t list_count = 16;
+    uint32_t index = 0;
+
+    /* open directory to prevent it being removed */
+
+    hDir = CreateFile(full_file_name, GENERIC_READ,
+                      FILE_SHARE_READ | FILE_SHARE_WRITE | FILE_SHARE_DELETE,
+                      NULL,
+                      OPEN_EXISTING,
+                      FILE_FLAG_BACKUP_SEMANTICS | FILE_FLAG_OPEN_REPARSE_POINT,
+                      NULL);
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
+    file_id_list = g_malloc0(sizeof(uint64_t) * list_count);
+
+    /*
+     * findfirst() needs suffix format name like "\dir1\dir2\*",
+     * allocate more buffer to store suffix.
+     */
+    stream = g_malloc0(sizeof(struct dir_win32) + strlen(full_file_name) + 3);
+
+    strcpy(stream->dd_name, full_file_name);
+    strcat(stream->dd_name, "\\*");
+
+    stream->hDir = hDir;
+    stream->dir_name_len = strlen(full_file_name);
+
+    dd_handle = _findfirst(stream->dd_name, &dd_data);
+
+    if (dd_handle == -1) {
+        err = errno;
+        goto out;
+    }
+
+    /* read all entries to link list */
+    do {
+        full_dir_entry = get_full_path_win32(hDir, dd_data.name);
+
+        if (full_dir_entry == NULL) {
+            err = ENOMEM;
+            break;
+        }
+
+        /*
+         * Open every entry and get the file informations.
+         *
+         * Skip symbolic links during reading directory.
+         */
+        hDirEntry = CreateFile(full_dir_entry,
+                               GENERIC_READ,
+                               FILE_SHARE_READ | FILE_SHARE_WRITE
+                               | FILE_SHARE_DELETE,
+                               NULL,
+                               OPEN_EXISTING,
+                               FILE_FLAG_BACKUP_SEMANTICS
+                               | FILE_FLAG_OPEN_REPARSE_POINT, NULL);
+
+        if (hDirEntry != INVALID_HANDLE_VALUE) {
+            if (GetFileInformationByHandle(hDirEntry,
+                                           &FileInfo) == TRUE) {
+                attribute = FileInfo.dwFileAttributes;
+
+                /* only save validate entries */
+                if ((attribute & FILE_ATTRIBUTE_REPARSE_POINT) == 0) {
+                    if (index >= list_count) {
+                        list_count = list_count + 16;
+                        file_id_list = g_realloc(file_id_list,
+                                                 sizeof(uint64_t)
+                                                 * list_count);
+                    }
+                    file_id = (uint64_t)FileInfo.nFileIndexLow
+                              + (((uint64_t)FileInfo.nFileIndexHigh) << 32);
+
+
+                    file_id_list[index] = file_id;
+
+                    if (strcmp(dd_data.name, ".") == 0) {
+                        stream->dot_id = file_id_list[index];
+                        if (index != 0) {
+                            sort_first_two_entry = 1;
+                        }
+                    } else if (strcmp(dd_data.name, "..") == 0) {
+                        stream->dot_dot_id = file_id_list[index];
+                        if (index != 1) {
+                            sort_first_two_entry = 1;
+                        }
+                    }
+                    index++;
+                }
+            }
+            CloseHandle(hDirEntry);
+        }
+        g_free(full_dir_entry);
+        find_status = _findnext(dd_handle, &dd_data);
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
+    stream->file_id_list = file_id_list;
+
+    if (sort_first_two_entry == 0) {
+        /*
+         * If the first two entry is "." and "..", then do not sort them.
+         *
+         * If the guest OS always considers first two entries are "." and "..",
+         * sort the two entries may cause confused display in guest OS.
+         */
+        qsort(&file_id_list[2], index - 2, sizeof(file_id), file_id_compare);
+    } else {
+        qsort(&file_id_list[0], index, sizeof(file_id), file_id_compare);
+    }
+
+out:
+    if (err != 0) {
+        errno = err;
+        if (stream != NULL) {
+            if (file_id_list != NULL) {
+                g_free(file_id_list);
+            }
+            CloseHandle(hDir);
+            g_free(stream);
+            stream = NULL;
+        }
+    }
+
+    if (dd_handle != -1) {
+        _findclose(dd_handle);
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
+
+    if (stream == NULL) {
+        errno = EBADF;
+        return -1;
+    }
+
+    /* free all resources */
+    CloseHandle(stream->hDir);
+
+    g_free(stream->file_id_list);
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
+retry:
+
+    if (stream->offset >= stream->total_entries) {
+        /* reach to the end, return NULL without set errno */
+        return NULL;
+    }
+
+    if (get_next_entry(stream) != 0) {
+        stream->offset++;
+        goto retry;
+    }
+
+    /* Windows does not provide inode number */
+    stream->dd_dir.d_ino = 0;
+    stream->dd_dir.d_reclen = 0;
+    stream->dd_dir.d_namlen = strlen(stream->dd_dir.d_name);
+
+    stream->offset++;
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
+    stream->offset = pos;
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


