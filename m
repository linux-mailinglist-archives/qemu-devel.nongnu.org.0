Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9B6669C850
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 11:10:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU36R-0007z2-ON; Mon, 20 Feb 2023 05:08:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1415163841=bin.meng@windriver.com>)
 id 1pU36P-0007yT-LK
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 05:08:57 -0500
Received: from mx0b-0064b401.pphosted.com ([205.220.178.238])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1415163841=bin.meng@windriver.com>)
 id 1pU36L-0008TV-19
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 05:08:57 -0500
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31K8sfVe013057; Mon, 20 Feb 2023 10:08:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=AcLONJBR7YZJY6HYwvAhDEo4k4DfdL0PC/dq/i6N/SI=;
 b=YU466U1MfqIp96KuusmOvOCA4LmEQWr+h0ThCIxIDGtx0weDAMA/fRk+STai+omW0ooU
 xk4DHwlvxDXPyhjWnHfcfeENczBNSvjzXRK5lDCkp8eOuilO8Mv1TTu8/uyY+BqrZNcH
 qkN01k69nf6hp/idxHWtbwX/9mCVqMgB7K3EsBOyWYNLfJ0PpNp30f7rJcRI3K15pUYp
 U6kZgxIdyjB1/Ts5wRH2GGi64kILK3TXG6gPISB5F5eEfSwbPcOJFpqDWsuEcQUeC2cW
 wxlrXs/0ZtwZ3Vv/7WavHs+eYPxPFC5c91M/CKKItoGKCZ8DZOTc0r/ckW5q2FGsGAV2 JQ== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2173.outbound.protection.outlook.com [104.47.59.173])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ntpem1kwk-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Feb 2023 10:08:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FZyLTs68ONSfjsbthbLSUFa3AWhaGGv3EZAYnzYNRGCPixNJ2bJ0SWW2KAyVCgecI4vOCOC5Ser9Bm5TJDHMrsnBQb3tTsntFcOMNznSM07YXhLnw00KT0l1gSwAaLjoz8yyTnckrbGMQgCg/tEvu3kayvz76HDhBrGw0xF5NFpMJrf0N1NacLhLNp0bFKVJxMQu3sWwfrT1jkgpwbKjiwj7KhQsXPx+YJA0DK9T4vG/hIDg/euOEu0hEEdK0q0dwAcLywpXFTYpb135AI0s4OFJrOevtji+K5iaFyumwCN7kEBe7deaBM2TEVdg+Q92jbKmhFKYN3fg4/y1ddaJwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AcLONJBR7YZJY6HYwvAhDEo4k4DfdL0PC/dq/i6N/SI=;
 b=aJYhGHq72Hh//I2ZwfkSxGCiWgOYXoLoh8oYwepPfX6NZY0r53C+DcnugTZd/90636fD0cCTGiPT2rhH+VNTDJyXdDxfM0xDvn/85OBvf1DiUw9QhbWu12zlluex4Bm++u4Gqx/ip+nhBhi1uAE/s49XezN71Z96/pAkDUKmYi1Enr7WJYqQ/SRLdK0fQhxUsvTRf6Jejc/bhoYbB9eTbNv1n4+fEfaU+4qqxC7p8aNEICPipOJnqtqc/8JBSN0uN884cSgrmwtA96HAzdPhi5oQ9aw2SzKQkkskbZ8Zme46R1hBffwB6D5Vdw5zEH62XOMs7eh693Px+iqX6qy4wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5358.namprd11.prod.outlook.com (2603:10b6:5:395::7) by
 SA2PR11MB5066.namprd11.prod.outlook.com (2603:10b6:806:110::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6111.19; Mon, 20 Feb 2023 10:08:36 +0000
Received: from DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::6c5d:5b92:1599:ce9]) by DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::6c5d:5b92:1599:ce9%4]) with mapi id 15.20.6111.019; Mon, 20 Feb 2023
 10:08:36 +0000
From: Bin Meng <bin.meng@windriver.com>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 qemu-devel@nongnu.org
Cc: Guohuai Shi <guohuai.shi@windriver.com>
Subject: [PATCH v5 03/16] hw/9pfs: Replace the direct call to xxxdir() APIs
 with a wrapper
Date: Mon, 20 Feb 2023 18:08:02 +0800
Message-Id: <20230220100815.1624266-4-bin.meng@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: be19cd4a-64fa-4b64-74e1-08db132a6df4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3YWXH3SfEvt0waTp3UIaRFGVee+hTF6HoCtZv2r8us866nfJotapURklq0bnHQHWWzhpbtIzv9GCtExN29MLG9IRPLSDhQ6pOI3YDSHKBuH3fO1kid8sHdEuzgPhn3HFMUP3TqSN2aJrB7zdXE/gu73SwyR6hxRbba7ubZhScsYV640fRc734L35OgvxGR1j3qHg3Bb1ZuJhxoDMlZnjCtu9hNMlRWUhWiudQOhCREfFJ6YIPZy5m+lgjaeRFIQi02kc2/UtAwLNAB05rNAkY5Ca8VljGjisqsEedzofQUonTy5zk+wV8T17DUVKeAAuYNiGMJP8lyJwXXugq1W9uzNcT9l2R0Snvzxbg/Db2PVVnkYrB8fObkj/VxUJqqWNd4GC2shWesJ6ulsS9Ei8Ea2F8SqyNQJChDNJKAuTXu712qV+QBZE4uQWPXU9jG/gyY64QUvBUFwaB8clvoekrL8Rh5MbzFQ0eNXuaMwDlUGkX6Uj4mEckAXcfb9T/TiPHgsBHLxU7NDZNDbkY2Ja6qaAw5e3/IJlpj/r1TL5sg5rRJfp4g/4oCz2AmW7sQ0E/FG417DS+60GZRE6t0mBNRXwOs70B33M7k7mdsdN1s+1cqBDgg5aHQDXffG17GRrOgJjf3m9wHGeqcYg3vxoj0Pc51ATAYbT8otE9SGK8MSIocg42gKfrGpoWmK181PCJsPU8BOsjlxewwO/N6+7JQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5358.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(376002)(366004)(39840400004)(136003)(396003)(451199018)(2616005)(4326008)(66556008)(8676002)(66946007)(83380400001)(66476007)(5660300002)(8936002)(6506007)(6486002)(107886003)(6666004)(1076003)(6512007)(26005)(186003)(52116002)(36756003)(478600001)(110136005)(316002)(41300700001)(38100700002)(44832011)(38350700002)(86362001)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GXmjM0xmddb/69u8QFRmf94YSbEKd6eqi2073+1rziQIWlR8otzf2pinMCMc?=
 =?us-ascii?Q?MGB4+IlTeBcbduISslAyZqnj408jkQpGR5CiOzkMyPnKipOyosQZ3D0EUNFw?=
 =?us-ascii?Q?ds79uU74xowEBF76CXs0mGSQGlB/Sh/6JxypBg1OvdK4zIkjImoLuwMTURm7?=
 =?us-ascii?Q?d5yiHLpw1vVaeorHRKmsilbjmqskqvW7gP5sIqQfKTKtFoc5PdvfbMpXsHrz?=
 =?us-ascii?Q?nylQeKGR4pbwXlEbh8xJzOhW4ZUS1MaxEZxSkEMuKgDDdLlhqZlJ91LRRsfs?=
 =?us-ascii?Q?5r3F54gS8MLreB90KSTGLZdpsxyuDCO3Vt+vwp+TPUCJRZ/KKXjnCrud2uyR?=
 =?us-ascii?Q?Hek+ypNzsL405UkfGADVEzuOFcOEN5NYt4dTdHbHFHtTiEnHOx1JXyG/uf/z?=
 =?us-ascii?Q?OqE5iVnF3h0vtjHN9RWCJweQQVQboTBJ7D9hBIpw+S/8jvzajg0clb2EZztC?=
 =?us-ascii?Q?wLSgJk5h4/dfpVfBYJDUxICHp90Os1hMNVqkUHc840Z3moNHuWSqlxuvN0uM?=
 =?us-ascii?Q?hYPCo40GHD2duV3SOuUk2Nm4zJZsCsUnpgVQwArcCimHw9TeS48ixfGmVnnD?=
 =?us-ascii?Q?THClKq515arvmLxa+dKHkGGTraJrfZ7u0amTlya3PwRX20iQGguPlNXClwOp?=
 =?us-ascii?Q?4rM6EInsSySwTyynYbew484hRNRXQkSHlPF4C00VQIBWBaYFlLRRpC7fPyu3?=
 =?us-ascii?Q?e8TGwa2rIyX0o1xEFVnrUFk+ba9Rne7a1P2MBApUECrKCQOXYBy7SMe44zXH?=
 =?us-ascii?Q?Iep4RcRwba/ATHmpEkL49neb5tX+rKwO1jaUYbNtQVdwzX5Upa+FisWIiWgZ?=
 =?us-ascii?Q?E7il14hpW5zssoo+3fIICPuf0XYTvPMfjvzEUx6aQHXB0jXgw/Kv82EvkRnW?=
 =?us-ascii?Q?IXLdELnBKqugYWbpPb3XKL8DMLkdYn+2okVMigAnN1Xm0Zreu59KGArly7Bc?=
 =?us-ascii?Q?LYP9GoLKJ4QmXV5l1Wqdv3RWQo4RC7W282i3H6I0pxO/5p27tRhapzgsIK7X?=
 =?us-ascii?Q?nKelLXYzJ/N5oT+3rowtKK/Myqxc82RwyU9fviV7cijyw8XiTT3KRhmksSma?=
 =?us-ascii?Q?0PAkCXV8xYquCsM6Hm47UAKD4JeC4a+ji6Wtcnqmh5z6pTx0WNnLSZAwXbfk?=
 =?us-ascii?Q?oRXyOz13BJQxzD1J75IE2oKPFsfHwO7ASbZ7clXHK7JPmVOp1Bmhnpjmq/vG?=
 =?us-ascii?Q?/YW83qd3KthSRY18N1ccs/i1v3ExN0uh+U6HYn5ig+UNml7sC91f0G28cw7v?=
 =?us-ascii?Q?i5OP//9PL9vv7+InRaJP8lsX8a1B1LCflUfJiUiVXz20HBZsdwEDDK8Fvbr1?=
 =?us-ascii?Q?23t6zrWYi9mCA/mUukmqPxoARU530AsJLdt+2U83/+x9vYO6bPKNHcHZVR4I?=
 =?us-ascii?Q?8N+WRvM0PJ3wELBSP6v3z7waS0ZGsU6z+q7027v8mQGCHMJN7pawuAUpXDYB?=
 =?us-ascii?Q?hAtWgxQIf2FGEHzfXaUlHyknw6SIZRaq/ZHAfJ/0hl2nmhEH4K+rE8ayoC8R?=
 =?us-ascii?Q?1UQOtoOEwhgUTgNPkinjJ3ZcW9tqM/tf15p5WGmTA0qWc9E0EotVVb61QC56?=
 =?us-ascii?Q?8ucTtauPw9kSSod+3ZsPnvFNhUi0M5LrXYp3G3evkyn720pKhqUoCxW9O6LO?=
 =?us-ascii?Q?CQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be19cd4a-64fa-4b64-74e1-08db132a6df4
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2023 10:08:36.0316 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gm77nKrghdkYqaLn40pUUAIcTnA9QHMyHmEF7LfPCoWht/1gEh6YpmPVDMO4Eehp8C6dEFHBtopJLpp0+xNMJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5066
X-Proofpoint-ORIG-GUID: ozAousc-xasex_2BQ1NLitQQm79dvm71
X-Proofpoint-GUID: ozAousc-xasex_2BQ1NLitQQm79dvm71
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-20_07,2023-02-17_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=774
 bulkscore=0 spamscore=0 malwarescore=0 impostorscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302200089
Received-SPF: pass client-ip=205.220.178.238;
 envelope-from=prvs=1415163841=bin.meng@windriver.com;
 helo=mx0b-0064b401.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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


