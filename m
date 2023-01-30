Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD2B680A01
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 10:54:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMQqE-0002xt-P6; Mon, 30 Jan 2023 04:52:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=13943e2a21=bin.meng@windriver.com>)
 id 1pMQqC-0002xK-95
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 04:52:44 -0500
Received: from mx0a-0064b401.pphosted.com ([205.220.166.238])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=13943e2a21=bin.meng@windriver.com>)
 id 1pMQqA-000202-Dk
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 04:52:44 -0500
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30U96eHV000968; Mon, 30 Jan 2023 01:52:30 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=AcLONJBR7YZJY6HYwvAhDEo4k4DfdL0PC/dq/i6N/SI=;
 b=L7bONpMZn+b+VKUgxSB2I16/WsovA0LuoUUMkQmFUMNgJS6/tLrQ4H6I3lxA7430MFjK
 8Ap9y4eI4GEKUxT2yM3RFDM3KLphUREcauD5KGBvfPxT//UPnJbNOzSS+U7nRwJrPtBP
 F3qngI0xRT9nM6Sk5l33M2hawp6Xk1DqqtfHvRQjZhfk78NH6DSdJ+r1a121b2PqvOKT
 hnVALqH9X3HpPqBKO5nS6u55fYVnfO3needkassvyTdkhLZU/55s9FnruertlnzS5CMo
 sCCPD9HCUJfOOHXAjSQpFCB0AWZS6PLNZ8J0YoM5yUV/jKDncNR0u0SCVAA9rBG9Hw2j mQ== 
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2174.outbound.protection.outlook.com [104.47.57.174])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nd43rhj5k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Jan 2023 01:52:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M3EWO66G04tLkQJ1rWfPcbv5QAEGV+EVpAOFt1oWz4RlawpWRgBDepAQeSQf7S/7Wy93/ZaYQnmSSjM6aoxyEw8IJaTC7k36caa1weX40k9HCnYRI8HsXACWcF+xMVTTGWn8RuFx177w68cOEEbVbSgWgfkocy2VojbL2Xo9X0gfN9GeOJ2dqlRMBvdoApN2PS19LHZmsXWgv+ip+eDcS19vZsTdbjayXbAOp8ug/6VUJ9VoqQcD5p33IwSmUjASK0dIcBYLyw7oO+H5J63etT4Cwv1Pb7Zm8+Bu2o0sAFGoC63jX4G+2eJEY7yk8lke2fjErGdxWiW8v6CnNqgkbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AcLONJBR7YZJY6HYwvAhDEo4k4DfdL0PC/dq/i6N/SI=;
 b=PkqlQKfQlq/yvh68OnwNQhmiy5bE8GCcVuqDzruMMEkjHhisj4L/HFx1pdCniVun8XFa2hmURSkZeWxKw1Og1zVmWKCX7n3wZndmni30TGrPiKOI/Md0KBAKMMOqNaq9zj3MLvF8xwKRWKxaaVTNJEKAmQSygjQWjBZXLjmEVcvXXt0wDIJav0Z4skwFdaOGu8CZ+8YJvyCH4+WI93YkIZWP/6mVanB+FVt/0PZEl1/Oor6f9l2pwfUkJNujXT8ANkmCrOwfRmY7ychhfAIEcD2z8Le4O2lNzogZ61dRwSfHvGeBLRTU5O/fAuAM7Prjb6YTwgUVaDc5ItlfqK4KFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5358.namprd11.prod.outlook.com (2603:10b6:5:395::7) by
 BL1PR11MB6025.namprd11.prod.outlook.com (2603:10b6:208:390::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36; Mon, 30 Jan
 2023 09:52:26 +0000
Received: from DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::6c5d:5b92:1599:ce9]) by DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::6c5d:5b92:1599:ce9%2]) with mapi id 15.20.6043.036; Mon, 30 Jan 2023
 09:52:25 +0000
From: Bin Meng <bin.meng@windriver.com>
To: Greg Kurz <groug@kaod.org>, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 qemu-devel@nongnu.org
Cc: Guohuai Shi <guohuai.shi@windriver.com>
Subject: [PATCH v4 03/16] hw/9pfs: Replace the direct call to xxxdir() APIs
 with a wrapper
Date: Mon, 30 Jan 2023 17:51:49 +0800
Message-Id: <20230130095202.2773186-4-bin.meng@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: 39c7772f-e5ce-4d4e-8ceb-08db02a7b0f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GTNcykkF3fHx5/texJ+5vtbeFLN3N3Kcyrk//jnpIFTTJxlC39HL56g79AUJytiGxZ/xsT4uBWszFDz0vlIlvlaVpBpkxoxqwYTPSCllvoVAVu9UtWDaIxMTOozXyeG12A3gW7aMu/QG2ZDsmg6kPoyVzm52KLwnoykdfB4mpbs1k23HO95jiFXcVrAHHt65qhOYmn7YAyUoVf9VOv3yLkkgFbYJpzPXigGqIvQ+6iGQcfLKxvNMH2XGPyRzzkG3w36TEG0Ui9H9E3AvxGcWbTgN0Gzwoa1UbCYEW/oLq+lizBsZ/kRe3nY7VBuKPvIxY/isD5IYAwxOXPRwR90X9ly4WkhHZ5uxXBX2Zb4yLEpRrpnpAM1557WXt3mNlMsLJLsfsBWZr8igRP7zEFR5zem0zj1Ge4bxNuqlMG7hGd2P1JbTRh/IfKk3S2PyhdT7KIHpRRd2OmjQaowmzTbZitpVyXljWdntFoSyaqAkd0RiOu53KBfHT/QktS0vndLcjyDuhMz1dda2KNwBZ0z958X5aPJwaLGxDbinjNuOKRmF+8YtHYI1SQ8UcVtPap1sv3lghT1sGUTxTTreBdci7JqARkLWMmStH8zlOUg4UGR7s+i6p0tcLrucC6Oo67PybY7UxuNl7BqBcdNxYbsfbRflpn5btlvXDnMf+9RxW+W9MS4lD7nUCi0NV4+ys4zI1ttYNu/T2vaT8+6cOv41sQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5358.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(136003)(346002)(366004)(376002)(39850400004)(451199018)(2906002)(26005)(6512007)(186003)(478600001)(6666004)(107886003)(6486002)(316002)(110136005)(36756003)(86362001)(38100700002)(38350700002)(41300700001)(8936002)(2616005)(4326008)(66556008)(66476007)(66946007)(8676002)(52116002)(6506007)(1076003)(5660300002)(44832011)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LSpRPatdMlpvdmdDb/qp0Kogic1+el8tvfFbVQ3DehIWuo6YEXtpXxU65ovN?=
 =?us-ascii?Q?uCV7pXGvYuN0DpfyAW7vTEnRGd52hDJaORYxQ2g7LKBrqGLM327pDfMBUVJR?=
 =?us-ascii?Q?EciMxsIgGH1trt/y7Y8vEhqk3kKUCYZlu/zNt7mNGQEQT9/7iyjToUGnucTI?=
 =?us-ascii?Q?lYoly7UKX5SG4GV408NdJrezfiWbECjy7iRJSvkVrzpltJd3NRuHCfiEWb2u?=
 =?us-ascii?Q?k8AcvV3WAzzEXtYXaN5F561EXSdYNPIu0DqMmixlLYdXfCMKtg+7uC+Kl+o8?=
 =?us-ascii?Q?vaTsyz+7Yxk/PkLWV1ZcSqtv3KwRKjsqNipBNawXAHC7FCwyFxtUiL6RXSA4?=
 =?us-ascii?Q?rklsp6yl/X5oPMkuHLtSOIisMTwKqXWqsfKAu43fjsUzLy6py5Ho9zynq9ul?=
 =?us-ascii?Q?XM+2V8wRySosmcMkLIDP6RpNN4OoCylFCi7PtSVU+Viu3pABQk37CC+8cxFl?=
 =?us-ascii?Q?mBXlwxhJkV/zgHC/EFuwdfCENw04tY0bckBJ5aTLqht2+PMWP1EhDLDtUygS?=
 =?us-ascii?Q?5NObOSqxYGWS6wVc+QIXUfXMDpWhRFgnDvoE1Z/5YNWzQdw8JWAaMK7Unyrc?=
 =?us-ascii?Q?JXhudO/b1aHtXtE0OYreeKUzfb2ZlJziryKRltY/E3OVIrGRyvd8DyZWSZLk?=
 =?us-ascii?Q?7GRCjSuwASAjH89yA0BoFazvUV7dUOQXMxYSVFb1AVodk/WJiw5SO0PO2Wv5?=
 =?us-ascii?Q?DjldGbL/T1hkbvg8M6rqXwlbL16gRS+CuDMnPXv4lQGWJNu/TSEEC4BCFa6y?=
 =?us-ascii?Q?kiy7uT39XcN+N/XAgf+FKhHwnn89wfcjew1/gAjZxovyMi2wgFJllvG/DMh5?=
 =?us-ascii?Q?95Oef7JSgh0Lv51OpqKtcxt7O1Q2dmVEjqj/zSYNn5DKo5NxMWWM00vy6z71?=
 =?us-ascii?Q?fLK+2vGr/Lz85vJZ5XJD2zGy+d3NdhpSNu4C6o4EZSApzIkNbtazKtmWsO3P?=
 =?us-ascii?Q?eCFlr3JD+cukr+mtMPyyZv0TGdBSOvbAadZiZKRYM0sJFFI+1h/O5t7r5m9Z?=
 =?us-ascii?Q?YHlQWOSoGToutL3LYr9tn7WeUACCaMbSXPyUGKlwqs41730It/n9bYi0g5k2?=
 =?us-ascii?Q?lPU0hx5oRzAOjgbuLFHrJnOD5w1PDc5BiDruHSQtcSJzX7UL6LVB11nDMXjM?=
 =?us-ascii?Q?3XsgNvcxnFDCM3kO4KUlVh1dsVug4BnoaHTZNp6qVd8aVN4nsZbDgv5jAyxn?=
 =?us-ascii?Q?rkODk1/oWtdmR5STr02TPaUfGyretnYtWq4u4srP13KxMM8jgKQxxKsrI+8l?=
 =?us-ascii?Q?LQvO5iXWUQb8ss5vlXVRCRoUA6zBBX59rcdovN0ZgUJhnzw/feBR8HrIUQl0?=
 =?us-ascii?Q?Euk7hnjEGA8JJ1qJ+uiF7ao45QcGgTBXqeHOu/v6Tdkqbd38wQfLTnOQTQbn?=
 =?us-ascii?Q?y4pciVNT+dnZdhpizVl+s0zjLwIHvmbJ7QQ2/guyVHdGHe+hFXaBWTwkitWq?=
 =?us-ascii?Q?/BWLljHjAGxeGG8uZ5NaViD3mTD/Wn1VvAEs/1/+Z2kiYSrfuZ+AuHZaSQnK?=
 =?us-ascii?Q?3sP7xNov+ehFsC0oGFEHhOz30xhEerfTZuxD49/xDmnSt4WY4IbheY8V0U4S?=
 =?us-ascii?Q?ED9SAo1cZbidKDdurxN68o8Tu63sRGkNb/lD7OoOS8qlgPfIEEPuCnEtmq34?=
 =?us-ascii?Q?2Q=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39c7772f-e5ce-4d4e-8ceb-08db02a7b0f3
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2023 09:52:25.7570 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lKg9SYM+JP6pdIxZUPhcQj+CNHtbnXuJesdd4T90Bk7RwYitSKxxGtxqH2j80lFibUXCrOnS73L1CzcunWDNmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6025
X-Proofpoint-ORIG-GUID: SZ5_Lwr2OZD9gaczTvRElF-rdyeSLLoF
X-Proofpoint-GUID: SZ5_Lwr2OZD9gaczTvRElF-rdyeSLLoF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-30_09,2023-01-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 mlxlogscore=705
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

xxxdir() APIs are not safe on Windows host. For future extension to
Windows, let's replace the direct call to xxxdir() APIs with a wrapper.

Signed-off-by: Guohuai Shi <guohuai.shi@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 hw/9pfs/9p-util.h  | 14 ++++++++++++++
 hw/9pfs/9p-local.c | 12 ++++++------
 2 files changed, 20 insertions(+), 6 deletions(-)

diff --git a/hw/9pfs/9p-util.h b/hw/9pfs/9p-util.h
index 90420a7578..0f159fb4ce 100644
--- a/hw/9pfs/9p-util.h
+++ b/hw/9pfs/9p-util.h
@@ -103,6 +103,13 @@ static inline int errno_to_dotl(int err) {
 #define qemu_renameat   renameat_win32
 #define qemu_utimensat  utimensat_win32
 #define qemu_unlinkat   unlinkat_win32
+
+#define qemu_opendir    opendir_win32
+#define qemu_closedir   closedir_win32
+#define qemu_readdir    readdir_win32
+#define qeme_rewinddir  rewinddir_win32
+#define qemu_seekdir    seekdir_win32
+#define qemu_telldir    telldir_win32
 #else
 #define qemu_openat     openat
 #define qemu_fstatat    fstatat
@@ -110,6 +117,13 @@ static inline int errno_to_dotl(int err) {
 #define qemu_renameat   renameat
 #define qemu_utimensat  utimensat
 #define qemu_unlinkat   unlinkat
+
+#define qemu_opendir    opendir
+#define qemu_closedir   closedir
+#define qemu_readdir    readdir
+#define qeme_rewinddir  rewinddir
+#define qemu_seekdir    seekdir
+#define qemu_telldir    telldir
 #endif
 
 #ifdef CONFIG_WIN32
diff --git a/hw/9pfs/9p-local.c b/hw/9pfs/9p-local.c
index b6102c9e5a..4385f18da2 100644
--- a/hw/9pfs/9p-local.c
+++ b/hw/9pfs/9p-local.c
@@ -495,7 +495,7 @@ static int local_close(FsContext *ctx, V9fsFidOpenState *fs)
 
 static int local_closedir(FsContext *ctx, V9fsFidOpenState *fs)
 {
-    return closedir(fs->dir.stream);
+    return qemu_closedir(fs->dir.stream);
 }
 
 static int local_open(FsContext *ctx, V9fsPath *fs_path,
@@ -533,12 +533,12 @@ static int local_opendir(FsContext *ctx,
 
 static void local_rewinddir(FsContext *ctx, V9fsFidOpenState *fs)
 {
-    rewinddir(fs->dir.stream);
+    qeme_rewinddir(fs->dir.stream);
 }
 
 static off_t local_telldir(FsContext *ctx, V9fsFidOpenState *fs)
 {
-    return telldir(fs->dir.stream);
+    return qemu_telldir(fs->dir.stream);
 }
 
 static bool local_is_mapped_file_metadata(FsContext *fs_ctx, const char *name)
@@ -552,13 +552,13 @@ static struct dirent *local_readdir(FsContext *ctx, V9fsFidOpenState *fs)
     struct dirent *entry;
 
 again:
-    entry = readdir(fs->dir.stream);
+    entry = qemu_readdir(fs->dir.stream);
     if (!entry) {
         return NULL;
     }
 #ifdef CONFIG_DARWIN
     int off;
-    off = telldir(fs->dir.stream);
+    off = qemu_telldir(fs->dir.stream);
     /* If telldir fails, fail the entire readdir call */
     if (off < 0) {
         return NULL;
@@ -581,7 +581,7 @@ again:
 
 static void local_seekdir(FsContext *ctx, V9fsFidOpenState *fs, off_t off)
 {
-    seekdir(fs->dir.stream, off);
+    qemu_seekdir(fs->dir.stream, off);
 }
 
 static ssize_t local_preadv(FsContext *ctx, V9fsFidOpenState *fs,
-- 
2.25.1


