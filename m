Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF7E869C847
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 11:10:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU36W-00086D-25; Mon, 20 Feb 2023 05:09:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1415163841=bin.meng@windriver.com>)
 id 1pU36R-0007z3-3n
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 05:08:59 -0500
Received: from mx0a-0064b401.pphosted.com ([205.220.166.238])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1415163841=bin.meng@windriver.com>)
 id 1pU36N-00004r-0Z
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 05:08:58 -0500
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31K8vraG027690; Mon, 20 Feb 2023 02:08:43 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=q/WvttN3SK8jHbWyKsG3+Ui/gFd/oIOzMhKYDy9ibTc=;
 b=HHInvt/b+3f7vULU2eDp6/nPYGS4h6XsxR2HFqyWluqofL3G4g0/R55TU9VzYILmSGCY
 7i0nuzfK9ySK14H6L+8XQqB2XRsnrMiRt+GjKitKyLjs6T+Yn6bv04ehRLKrxTsVGEcq
 dUbgmIpcz0YeXL5U0hNozYdWIcdnVWlnDSgvVvCtvVRWVkCaoQcV+yqXdqB3eLD0bQY1
 7FAQ+IZ6cIhSm/LMfGhnzBcMOmbuAufhKGM0ksE3xc1vLyJK434SAXrsilrA2IQ2+VLZ
 Nvj66x+CeR3IEcCnIqi4oMRoRroeQ34OzXMLvxqLR24W7Vai6SzVPancOJBB3hLWrvRG 5Q== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nty2psabv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Feb 2023 02:08:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dQHX3/yHFlGUcieygRFwjBXB+dtc/vem6w4GlBfkuIvPYQn7MlMG2Gx0YVvtVBoEKrP1kg3rrPrR+uQbiFYuL8qgpbw16kapUvhdu380A1guYwpgDD5xWs09eGeWqpgJ7+0kWNq9nJenMKYtc7LqmdTGUvpZiOy6m8u7ru3tzHZoGqoroqGqLjZdceITCQCG2RTKQ1Cf0EtiLxpBcL5JNaWIqhd2UAz+2/siRn3usB5MStxMA4hp1SDFto1xD7UPAvymkMXSEW4B6pjFjDEspZGX8RTxzKRcPYl3ByoIV+binEZ9AsI8Bv5okHv2oSQUuE98RghwWq20T7znGtJYnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q/WvttN3SK8jHbWyKsG3+Ui/gFd/oIOzMhKYDy9ibTc=;
 b=ilvXxRAS4PyS/ZFm3h3ZGvOEWrVNEC4kZ9hry7M6BiPrgRcm94J1BTdNeVzwPhBlQLYgz/ycQsUE4TbfLr75dN8Hop1NOHHcXkDRE45bYhhfmzm9fohkfQ/Snr609hyvnBGso8leltM/z/jnDL9ewOUcheqoIac9oHdz0LBKPMpoUECQ7LkRhz2DqWx1ADG+dOwcff0VPnimBDLlR781155p/LcJR5b7E45cTmo5DtVsHS+pdKSodrNUgWXU7vBVe7iBtS2G0rBwMKULUSMWOF9R5PQHhZ8ju+ZIWY4rNfg/pH41vtVZtGXE2JGKKGh5dBsAQ4OCv/guxNugqEs1lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5358.namprd11.prod.outlook.com (2603:10b6:5:395::7) by
 SA2PR11MB5066.namprd11.prod.outlook.com (2603:10b6:806:110::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6111.19; Mon, 20 Feb 2023 10:08:41 +0000
Received: from DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::6c5d:5b92:1599:ce9]) by DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::6c5d:5b92:1599:ce9%4]) with mapi id 15.20.6111.019; Mon, 20 Feb 2023
 10:08:41 +0000
From: Bin Meng <bin.meng@windriver.com>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 qemu-devel@nongnu.org
Cc: Guohuai Shi <guohuai.shi@windriver.com>
Subject: [PATCH v5 06/16] hw/9pfs: Support getting current directory offset
 for Windows
Date: Mon, 20 Feb 2023 18:08:05 +0800
Message-Id: <20230220100815.1624266-7-bin.meng@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: c89c0362-c2dd-4a61-bd24-08db132a716b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sZbSbgZzw8FsD2I1CQBZiNVgcNdv4cTEodJ4hngQtqeRXZleZmSP8O4DZakXlb7qDB6j0AbWoS4Ft7ZVNJ2izPgrbK1eITNUcyiDJDhSIAe5gClH27Y7GzRwKpJZR0F21uN+Ggcc9GNat6X5ZgBlwlNg7l4tPl5nzQopfTZgHJVgULjCXN17jSsU10mWHsj28wsk2t46VVAgBRsizoRvXxlvLyzJyJHpDCg5hRDmLzI2oBHRkDzTbuoXuFxdsBsS83tDU47FSVkFnyL/T99ocyMLMLHctaiopqOc51djt8E4qL5pX1VMCrYtQutcKglzrsw8nTxVz4y5kPJ4BCBxXQ7g1Yua1Vsyk1UAhaOMcfgGH8YXwfJuo0xy6tgd4C/T8HrYl/gIyNIRXg1DZdkzZ4hWDc66lZeunwU3lSYO9DUE8iQ2+1WBqRYyRgumhLXEBspGpex5NgIebkvvpWvmJk77nc6sYZA4QAZ34KDaulUS0dTaDUKjTfWM5qt7SizUdFtlrJuuCBWQzXC8QmQ+DiiZiR6sOwPEA4KCtpHjrvVJvKq3B1+Min469tkDDjia4N6kU/9nADBu1hbxAK6RksLz27Y6ZTqLBGlj9gKqyOtvGtdcCWRNB0THvU7APLoSFN4HPQczrdAUfGqSpoh+mycIwuf2XVnspoO4fPa6Llqq2rK/SmvB/w/AuZQraXj3r/Osn0BpLdP0ZddHGXdRZg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5358.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(376002)(366004)(39840400004)(136003)(396003)(451199018)(2616005)(4326008)(66556008)(8676002)(66946007)(83380400001)(66476007)(5660300002)(8936002)(6506007)(6486002)(107886003)(6666004)(1076003)(6512007)(26005)(186003)(52116002)(36756003)(478600001)(110136005)(316002)(41300700001)(38100700002)(44832011)(38350700002)(86362001)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?X8b5co4oDDZSmHvDTHjFavEr5y3No+wbLl31vIV1tSQIiivYnHTdspFoB38l?=
 =?us-ascii?Q?u+htfJajNcOHE6YLTn2I8hKp3axVM5qUBsr+973zWOJTiALxq/k7MOwaOODl?=
 =?us-ascii?Q?UvixDmo4WFdMsN6G6feD70yrvwviIYAh8VTE+yg7hgkjC3DPFzpKNPyFAAdA?=
 =?us-ascii?Q?CH0o9PSy0tjgHVYTnoRfa8lCi5yzztbjuV1BvlAR96OkAoQTSojgY9QNvcmS?=
 =?us-ascii?Q?ZIoxawLIDTKFEuwWzxgRZua982z8PCS87APXfrzxxYuu4SzJD2OvZgkUVDmS?=
 =?us-ascii?Q?XAKaXhUtJ8j3VfMqXCa5yxotQSjKK62u0Y6WnBWIB0S2tzOABA28Ysovpf3x?=
 =?us-ascii?Q?2NHVo3ee9skrpK2Z+LYWurJxaaUQVUvRUgcpF9854l/iSCfjbdoIrNcajlhE?=
 =?us-ascii?Q?KcxK01gXyzkq3UkfAih5WxgvO2XZk3WrkRUtNYiBSnl3ghR/bcmsP8qb7AIU?=
 =?us-ascii?Q?UlHFPn+VDByYn/Pmr0NRLgyuifsaFUalQ4xWtLz84MZlVBCz8LvYxBCTGSqU?=
 =?us-ascii?Q?ppvBR8B50oEMoEq+f8driWms3/WLhAzfyWyNbIzcyIQv5cebm+g07mhLM6Rr?=
 =?us-ascii?Q?Lppw+b/fLWfKuVdX3YtRlisXWb72FK7GzqcCOcyCcPgK4UoxZ0+I+zHpD4nU?=
 =?us-ascii?Q?Q4mbKP7mm4ZPBUsiAhN4qB316DIqFoWkUEnCCiXuesouibPAVkcWz6GKaH0h?=
 =?us-ascii?Q?DC345Navp2VPpPLlzWaAPVTkSnGTK1BAoxiW79nFWlOFbLPKRfLQZkaGnTu8?=
 =?us-ascii?Q?JTPgVs9rqmQZhTobRJaitdK8DSZKhnPWlDF49dDQxCzrP+kq3jTsDfUc3wm0?=
 =?us-ascii?Q?hhlUBuI2gdPLrZ9AeYgZI1CKpRfhBmt1na483TY8aqNwYsQnl2gpN/1NhN+m?=
 =?us-ascii?Q?2gn8J6lQKjlmGf9pJj7DB7fV9nZ+D2vm8sDOygohghr0lts4hgL51dPbkaKy?=
 =?us-ascii?Q?uigCpaN+yWv63pVJ4W9w/S9Tuqmda2ubFM1lc1P8qp1CW1gIx/qbhHnGGtrF?=
 =?us-ascii?Q?c2CjWYDJ9qDovhxHyOXxtQUwGS0cJjEMOQLGtJ/9iLslFP3xHjsDLpNf7wkl?=
 =?us-ascii?Q?PqKLbnQqEpZbddDGt7FircY6qn/Ys1YvB07f9LMWtwAySx5/suV3wcp8QRRh?=
 =?us-ascii?Q?FKsVB52CqI/6ENtnAG2HOMZdwuuN8epKJPxHhUQtjWqEWfqBYYuSs+2KjsJl?=
 =?us-ascii?Q?pdYfqmjNRFRKBx3hhgJ2pL0HeIxk8hPs6HYqCZl9CvhCPm86zN6JDQiG46Y2?=
 =?us-ascii?Q?LsbOh1FtTxA1JN8X4pr61Zh8b4MhVim+8hm8zkLngrbWuy1SO15UMxTkbr/g?=
 =?us-ascii?Q?AD+iEjocsy8JbZrZ+cpgkz/sP8LMDyyNLzzDM3USeWUIC/Ocx8WCvbim+dhv?=
 =?us-ascii?Q?uxiPnhfnidtXPbD8KOvHiziaS7/hW0JuMdNltpgHXNo2wjqCeXMrwPuYg099?=
 =?us-ascii?Q?mfbGWVCT7D0Lv1Ur65fBLAAuZxvKX+95YDYGN87Pn6et+LJajfWusJRbH73a?=
 =?us-ascii?Q?3qwJGAWRg2Lt1W6ZMiXvkUaDy+mNZuaNUTFhzygfwoFTsvez3P5UJ3YmfsUQ?=
 =?us-ascii?Q?Sl2RT5l+NJ758mCSiDgtFQPT/YyuCssToZCCWWh073XAtH+PgS7SkaOkTiZL?=
 =?us-ascii?Q?xw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c89c0362-c2dd-4a61-bd24-08db132a716b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2023 10:08:41.8465 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kj328CSc/aoCl0EOZw/ozh0SX7jUS1jvE7KmTGBa8Yt1YJj89gsEjDQAIsIiCx+pFPtfwsZN/+kIMM/wrO91Fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5066
X-Proofpoint-ORIG-GUID: p4Z9hNgimmqY58sclvPzq5mSZQmmTDVu
X-Proofpoint-GUID: p4Z9hNgimmqY58sclvPzq5mSZQmmTDVu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-20_08,2023-02-17_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 lowpriorityscore=0 phishscore=0 adultscore=0 suspectscore=0 bulkscore=0
 mlxlogscore=999 spamscore=0 priorityscore=1501 malwarescore=0 mlxscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302200091
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

On Windows 'struct dirent' does not have current directory offset.
Update qemu_dirent_off() to support Windows.

While we are here, add a build time check to error out if a new
host does not implement this helper.

Signed-off-by: Guohuai Shi <guohuai.shi@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 hw/9pfs/9p-util.h       | 16 +++++++++++++---
 hw/9pfs/9p-util-win32.c |  5 +++++
 hw/9pfs/9p.c            |  4 ++--
 hw/9pfs/codir.c         |  2 +-
 4 files changed, 21 insertions(+), 6 deletions(-)

diff --git a/hw/9pfs/9p-util.h b/hw/9pfs/9p-util.h
index c1c251fbd1..91f70a4c38 100644
--- a/hw/9pfs/9p-util.h
+++ b/hw/9pfs/9p-util.h
@@ -19,6 +19,10 @@
 #define O_PATH_9P_UTIL 0
 #endif
 
+/* forward declaration */
+union V9fsFidOpenState;
+struct V9fsState;
+
 #if !defined(CONFIG_LINUX)
 
 /*
@@ -147,6 +151,7 @@ struct dirent *readdir_win32(DIR *pDir);
 void rewinddir_win32(DIR *pDir);
 void seekdir_win32(DIR *pDir, long pos);
 long telldir_win32(DIR *pDir);
+off_t qemu_dirent_off_win32(struct V9fsState *s, union V9fsFidOpenState *fs);
 #endif
 
 static inline void close_preserve_errno(int fd)
@@ -220,12 +225,17 @@ ssize_t fremovexattrat_nofollow(int dirfd, const char *filename,
  * so ensure it is manually injected earlier and call here when
  * needed.
  */
-static inline off_t qemu_dirent_off(struct dirent *dent)
+static inline off_t qemu_dirent_off(struct dirent *dent, struct V9fsState *s,
+                                    union V9fsFidOpenState *fs)
 {
-#ifdef CONFIG_DARWIN
+#if defined(CONFIG_DARWIN)
     return dent->d_seekoff;
-#else
+#elif defined(CONFIG_LINUX)
     return dent->d_off;
+#elif defined(CONFIG_WIN32)
+    return qemu_dirent_off_win32(s, fs);
+#else
+#error Missing qemu_dirent_off() implementation for this host system
 #endif
 }
 
diff --git a/hw/9pfs/9p-util-win32.c b/hw/9pfs/9p-util-win32.c
index e9408f3c45..37d98a3e63 100644
--- a/hw/9pfs/9p-util-win32.c
+++ b/hw/9pfs/9p-util-win32.c
@@ -1420,3 +1420,8 @@ long telldir_win32(DIR *pDir)
 
     return (long)stream->offset;
 }
+
+off_t qemu_dirent_off_win32(struct V9fsState *s, union V9fsFidOpenState *fs)
+{
+    return s->ops->telldir(&s->ctx, fs);
+}
diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
index 9621ec1341..1b252c6eaf 100644
--- a/hw/9pfs/9p.c
+++ b/hw/9pfs/9p.c
@@ -2334,7 +2334,7 @@ static int coroutine_fn v9fs_do_readdir_with_stat(V9fsPDU *pdu,
         count += len;
         v9fs_stat_free(&v9stat);
         v9fs_path_free(&path);
-        saved_dir_pos = qemu_dirent_off(dent);
+        saved_dir_pos = qemu_dirent_off(dent, pdu->s, &fidp->fs);
     }
 
     v9fs_readdir_unlock(&fidp->fs.dir);
@@ -2535,7 +2535,7 @@ static int coroutine_fn v9fs_do_readdir(V9fsPDU *pdu, V9fsFidState *fidp,
             qid.version = 0;
         }
 
-        off = qemu_dirent_off(dent);
+        off = qemu_dirent_off(dent, pdu->s, &fidp->fs);
         v9fs_string_init(&name);
         v9fs_string_sprintf(&name, "%s", dent->d_name);
 
diff --git a/hw/9pfs/codir.c b/hw/9pfs/codir.c
index 7ba63be489..6d96e2d72b 100644
--- a/hw/9pfs/codir.c
+++ b/hw/9pfs/codir.c
@@ -167,7 +167,7 @@ static int do_readdir_many(V9fsPDU *pdu, V9fsFidState *fidp,
         }
 
         size += len;
-        saved_dir_pos = qemu_dirent_off(dent);
+        saved_dir_pos = qemu_dirent_off(dent, s, &fidp->fs);
     }
 
     /* restore (last) saved position */
-- 
2.25.1


