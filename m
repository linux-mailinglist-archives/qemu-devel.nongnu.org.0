Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1216809F2
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 10:53:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMQqJ-0002zk-QV; Mon, 30 Jan 2023 04:52:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=13943e2a21=bin.meng@windriver.com>)
 id 1pMQqG-0002yd-KO
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 04:52:48 -0500
Received: from mx0a-0064b401.pphosted.com ([205.220.166.238])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=13943e2a21=bin.meng@windriver.com>)
 id 1pMQqC-00020T-WE
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 04:52:48 -0500
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30U96eHX000968; Mon, 30 Jan 2023 01:52:31 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=Q51gWYJ+HXclbGSZ9Zlgv6+QfQYRST3Ok+cRzQ1RAzU=;
 b=Wi95UR7dl1x7I+0mclcCv9Mf3SiyOKFY2qGGasRL0gQ0s/p1MnIboWqcbm1ASEG8yd0w
 jcxg9Ai/yjb99s04sDG9CsxX4cy/NIE6Nt5rTvfwpDCZE0rPUcz/Jp8WjkM585aZ0Jy7
 GT0i+R11UVIVYzFEqTrrtguVUmjFNh4rElLRHpqTSAPOzJquyIMuYdAZzul1hA5px+ki
 nzfbk5xlNXnHN5ZgFiAOUMMuZoKiAU0t0ZA6osZv7aJeNrSugVz7nmC7REo1PsbJwHV8
 rZisPYrF3I/q5/nRQ8tPPvDs1JIetayZc3ANFG4ctPksy42e8AokD48Tnt0RNxqL54fX cg== 
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2174.outbound.protection.outlook.com [104.47.57.174])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nd43rhj5k-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Jan 2023 01:52:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=adyR5r5mrgLuhO5KlprkrwgrMVMQYHRjHhr0Sy55xxpiVKNfHBQKDxO9lVwShzQiejiem6sHPv7ogtQEwXuWcxgCyiDZsrAs7z7iA5NU2W3rUjJ7YwD4ytUCPMLcw+LdkNWMtp5BhU/mmJlAi1xLaO2f8ldBnebvG6as7utFoaHoFL0//qa3tVBKmBKXO4P5UAebaH+Ev4cbDTian485vZXHI9DQ+pIM7s78nXkLv5ZDLrVm1MguKPdXG36Wy/tH7gVRvSnpvaA2ihML4QEBEMuwniN3HDOLtld2sdFcOAn27oq6g3XstqMxzWWP+xmnxQfjOeM/nMO8fpnMqhzDgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q51gWYJ+HXclbGSZ9Zlgv6+QfQYRST3Ok+cRzQ1RAzU=;
 b=BvNZVLM3zaYbs6AF4qG7T5UtYfW3BUfWZJIBbmTLZBO4LHHFtynrzrwXjC34c0AtLgd2plZsGINAqJD0CmjS9UCM8QpPtgswOM2mIMIxamWiXPPwWyS7mDFwhfUUNVbWJ/aCy/qkbBzpI1bM0JB195G7DrMlGbk4V8dxuh8dBc1Pl91GMt6WRRkeD8SelsRVuev130KVnPqhmcRbEfz3hty37ij5vhu/VoM7QwTuQLfBfcewpnAudTHzXNOP2H11DQuyBy8P02bNcYLy0Rp+F8kMxhWAY0HMuJDnHb4FE8fbI+IJLGowJNb1eP3rTLMIGadOXtE+PcF7nNjwwaA7bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5358.namprd11.prod.outlook.com (2603:10b6:5:395::7) by
 BL1PR11MB6025.namprd11.prod.outlook.com (2603:10b6:208:390::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36; Mon, 30 Jan
 2023 09:52:24 +0000
Received: from DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::6c5d:5b92:1599:ce9]) by DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::6c5d:5b92:1599:ce9%2]) with mapi id 15.20.6043.036; Mon, 30 Jan 2023
 09:52:23 +0000
From: Bin Meng <bin.meng@windriver.com>
To: Greg Kurz <groug@kaod.org>, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 qemu-devel@nongnu.org
Cc: Guohuai Shi <guohuai.shi@windriver.com>
Subject: [PATCH v4 02/16] hw/9pfs: Implement Windows specific utilities
 functions for 9pfs
Date: Mon, 30 Jan 2023 17:51:48 +0800
Message-Id: <20230130095202.2773186-3-bin.meng@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: 3b6d3d70-b91b-45bc-4731-08db02a7af99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RuS7Vs5N93txuSw0V5zzXFfD6RiGhCgKqvpnZeoY6iw7TEUoq2Bt8SwexCEjua3pbZrPE1sGmXpYKJsZZuAtxWC3QXuBa6vSLrTEbOKkexoK3aakR1GeHW8nbatsWvZB30acsKk/a/a7zE4M7oOlen3unKERx/TAJFG3ANcTFsPQxXGsNQCL4F1FLWMD/yfF+LaHcS4+nPg86LCOvh/xzpcar6/Z3Q7z0P3VSsDoWq0dAyMS5WgkNRTAH1337BxqHEuNLdZ7EhhetSwt7jfXwghGAkkdNsPBpYFf1COuwF2w8Xv84UGySjp5KrKQz9LvlmWLtDQ2qnz2jQC7ofIvsnJpuym0A1rTuW4noJzbK6oyzrZPgsP5hSpmzPGmU7ysUtO9iFcjly6RFi2/H39dpVA5uTUUd3NGxF89ahCyx0AEJbhWcW9+FygJM0epj7UJZeT+i+ZzenEqQnLGlCI7LJJihIMpnwBgnCBCO09MAZmWNlR8JkL7P9TKN181FY0LGrlZCm9N7AUeGoJDODTOrGDN6fgZ6tHwX/J3t7gSDxZm9Nml0gYGdxAnB998jLKyQb+MWPiuI5CadlqN4FMQR1rAmpEEHRNkwGtVwTIl77PqvWInoF1ebx2CXnpzF6Wa7JDcD5OKpRNTCEtiQFiZw5sCTekGMig+OK5MVrVD0d6SfXPaQ6hTGd7ofD6TI6FJyNxp7a5wFMd1Q3p4q97KUDbaLk4w/FZp+k9s26GTZn4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5358.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(136003)(346002)(366004)(376002)(39850400004)(451199018)(2906002)(26005)(6512007)(186003)(478600001)(6666004)(107886003)(6486002)(316002)(110136005)(36756003)(86362001)(38100700002)(38350700002)(41300700001)(8936002)(2616005)(4326008)(66556008)(66476007)(66946007)(8676002)(52116002)(6506007)(1076003)(5660300002)(44832011)(30864003)(83380400001)(21314003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YHRCjO9FUEKfJY85CPeh/wmM9svKfILpCkY4PKSwPteYCzzoWh+Ifem4tVp1?=
 =?us-ascii?Q?vdqKcgvodg2uH2Hihz36uVyB8Pp6JArRdHhkH89PSmFUYfQwAh6atpqwbp8H?=
 =?us-ascii?Q?zLd9y871Hx8XgPUAWswiDa439R4yey8BoxkBTvaS9I+5Xo/5vNrRgRIuLLMj?=
 =?us-ascii?Q?TnxI9l/jXyQzMBvnUKEu57NHGftgX6Izv28oDi+Ajcr+1OaP/0LlAZ/fU2G9?=
 =?us-ascii?Q?DMUYiavMRgdOtLCxr+kejwMkPHD3QnXlV8PeXo9MEk8JiiIZ2nvjKg51xiqW?=
 =?us-ascii?Q?kHz/fijhWMvCxfN+73Vk+acD/hfo6YaLhxZymwCWHsyj8lCoeSMpDZy71rYj?=
 =?us-ascii?Q?vj+oDzeaF8fhi7+GAFIovo0sDgASW10bRrcsfso27DNsl4zseVV6Q4vafiXW?=
 =?us-ascii?Q?jWRGykTHxITDq1lf20rhFHnWhEg0NXvKT77ko/GAjatrEfryWIc5cXNOEaBU?=
 =?us-ascii?Q?BnhdJw9rEUDygPmLpa7pmM1q/4S9Ue9Mi5qHiXHuAw1d1K8duYv8xch/gPFu?=
 =?us-ascii?Q?xN08sN4uNoTlZg8eyLfW0Rc6xbyjUi7kXmwZjRcRBA+X/e1OTMzp5ol93mSs?=
 =?us-ascii?Q?B8aLFcvDzEzVlffwrWgxTAHv6NfQd3E9pK8Fg34g9nyg+TuE+NVnvRamuggi?=
 =?us-ascii?Q?CrlaOLHfc73tq6vtDzO5YiGYA28ylgeVZaqkLF1UOSjqppq6AAOm2YTsllAm?=
 =?us-ascii?Q?QNJZOgwgzqouKgmQy3UqAvf1PDcz0SppATjXQ6Zsfrp62L2kzcA0AMPMeRIX?=
 =?us-ascii?Q?W+KiDtRuNqb7yWuSObNG478qPoV3YWuLu1zu44K0HahZ8/DeZPVF7+SbdVEg?=
 =?us-ascii?Q?wRV9b3QfzTkqWyLCumpXpD0UPycP+lO1sXU773d7HWU55ly0tM++tWvsa0bt?=
 =?us-ascii?Q?wXjVviTdcFrjZf+zSUviYp6ZVjMuAZgRKmN+/TnxqoDD/C+0BBWKUzylpkSU?=
 =?us-ascii?Q?Ex42I9qnoTNmczEL7KNhnyVXDEpqFXvHGYY7sH93cJQ3iMWIrKHpdLDbBjhX?=
 =?us-ascii?Q?EdTEhQ94zd0a7PCZoNBneU1olBV8wJYxwDxAdIdOKgH19mEPDqR+40BGbHsb?=
 =?us-ascii?Q?4HgPm9zbYdi4f4sXp+vTI4WdkoEh5aymLlITQB2A0mVm/gF80bhdPj/bEyrf?=
 =?us-ascii?Q?SwkiXi2f4CImvnlEZZXM2Pyi7RtMyX9nm5o18pKqsm9GpmlpVcUlNlvL2Ufs?=
 =?us-ascii?Q?MJQ2qPshJsLzFlqOSWsiWVehiMM6NrxPPej3tL4PzV9f2W6huKPCeBoNfTnm?=
 =?us-ascii?Q?aKnE5i4V66+zWwPWkyW/a+333tK2xnbEDTDn50jF5v1bRHlv7AiZBsKLzNhT?=
 =?us-ascii?Q?4pz6ppviZLw910cZo+r0ZOEtYaybnV6NDiyC9lTMN2/O4jZ02YiEhpTb7F0K?=
 =?us-ascii?Q?23tbVLGtIFy/pq/wVT15aG4+Zz36WzUdE3tgqA7F0n1w30wez9gJ4q+LXZm8?=
 =?us-ascii?Q?MMrZEln74ol96VBA2r9fWgNxV/dr4FO7lBttSfEjmokup5n5/wUDE7Hxfl+1?=
 =?us-ascii?Q?XYaNXdb4zDz3az8k0MlovXqZvzR5CWnLQDTroEICc6r0+vPzRlvmbMwC2vQ8?=
 =?us-ascii?Q?szq6EmZAC2C7HL/HEG5bkRi2OWZTL+ufW5SQJwbWkxevjx1zbxYtxRmDxwlx?=
 =?us-ascii?Q?Og=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b6d3d70-b91b-45bc-4731-08db02a7af99
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2023 09:52:23.7234 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x6E4c2/sNXZhPNomea6hzeVpjSJM1T1tIXCjaDAXHXFEgVxD4zUDuGWpqQ8HK9Y0rs5R+a/KWHhTbD9b1kdnWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6025
X-Proofpoint-ORIG-GUID: 4rsPNIKJrfB3YFQskcEdvcGgow25ye0h
X-Proofpoint-GUID: 4rsPNIKJrfB3YFQskcEdvcGgow25ye0h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-30_09,2023-01-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 mlxlogscore=999
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


