Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 434B36809F1
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 10:53:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMQqH-0002ym-Nm; Mon, 30 Jan 2023 04:52:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=13943e2a21=bin.meng@windriver.com>)
 id 1pMQqF-0002yG-AI
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 04:52:47 -0500
Received: from mx0a-0064b401.pphosted.com ([205.220.166.238])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=13943e2a21=bin.meng@windriver.com>)
 id 1pMQqC-00020R-KL
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 04:52:47 -0500
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30U96eHY000968; Mon, 30 Jan 2023 01:52:31 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=Sm74XzxaRiYXzO1G+YfdbqAZ795gmZJiLP55ipP9+Fw=;
 b=PidhLCNlokkPOpAVlwcBfjmPwKmL1Yea2Oedqq9Cqy3DcNaCHhZEN7aOPgCojeH7bZf3
 X4yV3HDVYQMzKx6PSBfjxMc3yeQ3rABs/L9Pxv2FxmDq7JTNqJ9Ozyp6tY5kI+STxdzE
 AsuCtmpTh08lvS+g2Dt8LvAzWPNJDWdah57rCeo7m2LFgBoMmXH5XAFv38StqQb4AeS1
 YQHsoI3dBZDdUwyqtJaqAfxLaFZYRyvglPzqdWQshy3dvwTJju9pKKxRhW4n/6W4a0T2
 L5pN2oi3/30/B8RVOlCdxsLxoSgIdm5eXNmwFxzFmSoQPloVEi5i3qo1noH0hLy0nkmu HA== 
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2174.outbound.protection.outlook.com [104.47.57.174])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nd43rhj5k-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Jan 2023 01:52:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OaZTFcrk+Y8YCmCRL3rQsoEEocDffOMIwY5FKoCi3bjAWhC9aeg0mu4N5jGKgOhlTYAoKVHUoJ0+aWsOkWOQPkFV17b8BaCO6xTJwOp6z3W5JmGjre9AY762hjKNkHYpEsbPOp8zBOwf/kShOmpLQ3Lno831dPmu+5LH6GVSTJ0wrfqLZQ97mnmo3d2vg8q8b0OvQO6Zzxv7BlPk4e6O5CoAfIyYcdpB2uxh4ZSa0POvcdM61kAlWG2aKxB+/4ZikpOiZJRg+T8UwHP+7XoHbxBxC1So1/bJUnwJj7lVptygh209/iKb1Ex9+q8w6zbXbpu4jtDaU5cUZJ09xiD/uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sm74XzxaRiYXzO1G+YfdbqAZ795gmZJiLP55ipP9+Fw=;
 b=hP5vJ5S3HUx9qnzW51Z3K62wjgHuf/TdwbG5iXVodZ197Kq3Jv1nuIea7LeJVNepvGvUZqGK+whbRDxMkNLz4Dq/TNNtwAblZM6JTFiOM1+1gfYUfo4iOFtrseLMqol96CSplrNdXvwziLY3w0sbDTYBX152CfP50yWn4Ac8GWi+DavzeZAB+SxFHskEzOosjrlWH/leoYZ5wY5y28nNCcy6DU9FdfMT/C0mpFziSr6srdin3mPmXWjjrhKAuoSIx2o80SFzG4sRw3XMWLWahHQ601fG1Xdh51XnQNZHdLTs6zl79WjmA7PYna+Dvo07b5axw9T8ZYmGoBrxa1Hf9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5358.namprd11.prod.outlook.com (2603:10b6:5:395::7) by
 BL1PR11MB6025.namprd11.prod.outlook.com (2603:10b6:208:390::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36; Mon, 30 Jan
 2023 09:52:30 +0000
Received: from DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::6c5d:5b92:1599:ce9]) by DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::6c5d:5b92:1599:ce9%2]) with mapi id 15.20.6043.036; Mon, 30 Jan 2023
 09:52:29 +0000
From: Bin Meng <bin.meng@windriver.com>
To: Greg Kurz <groug@kaod.org>, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 qemu-devel@nongnu.org
Cc: Guohuai Shi <guohuai.shi@windriver.com>
Subject: [PATCH v4 05/16] hw/9pfs: Update the local fs driver to support
 Windows
Date: Mon, 30 Jan 2023 17:51:51 +0800
Message-Id: <20230130095202.2773186-6-bin.meng@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: 9611c38e-ca5f-4972-6836-08db02a7b35f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u9FeBpLZlAOzyN++OWPPp6pkqBLTKY79T+BMe6ejtEhttShv57oCJmObLjR5vraKn+E6TYcED5WMux6bVnK/jP75wviGxw18RRfOS4CmzRy3LV5UdCSl+1jhlwVaA1berRiUII8K1LflSmKxlc/UUAYYPDJkCzQQAzj2fq3jl7bI6GPaT+ka1XUhmyS/He6ZWCvSn402KdHtuWusR2hGycSaa5D1w76tAKqG4hRThsRMJjp3ecAcTFbbWeLxH3MQMDIcgqpfHhF4el+Qyz5OadTVfKUePSu0HvirAdqlygxsCaZ6IB3vxqrGWPGEQudnYsQm5d8YNydl5aOnOVscWCWiGoLXOt757Moj9eWMG1Nub+ZP//s76BtJVSOgBS/MHgV6rVkXye05gPhid/Uqdc9J6P3DOCdqKuqiA+BOPu3A0ok9SoapyeAfwB65515z41jGxgo+Naikz0RAMOTYzCOk2kGJPnwATX+4/StOthRGwSFNiD61j5yBfhslTxoTPgxlPJae7Cxoe8PXXSz/si91Wo5Sm8NpgmOeZ7DxTm1SYJ6Y/o/Oht1aczylmkBDDEte8NdJZgefSZcOG+mvBJLS65506lSdX7otfASKqLCqrn4XPZRojq3DlMK3je3ki4shbrzjcvX9EaaraXSUxfIr67sW1UDjhsCiascyUwN8OoAeQbIUO8OHK4B+iKY/vngFIs8AiJ4dcCJ2iFvNeg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5358.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(136003)(346002)(366004)(376002)(39850400004)(451199018)(15650500001)(2906002)(26005)(6512007)(186003)(478600001)(6666004)(107886003)(6486002)(316002)(110136005)(36756003)(86362001)(38100700002)(38350700002)(41300700001)(8936002)(2616005)(4326008)(66556008)(66476007)(66946007)(8676002)(52116002)(6506007)(1076003)(5660300002)(44832011)(30864003)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?guDbWtjmQv9Oia1NYH+COtiWQzIyrKBN+4yNTJM9k7G++3FK2tW65job6kQ+?=
 =?us-ascii?Q?t2YlnXmbv98xBaJsrasI+AY1TJNIMYWExxNk1FK7c0LAWR7A6d1EhjJKnk0q?=
 =?us-ascii?Q?I2agrmN1BkU76iRn9z2YpxGChqeISdvu9hVMhGH6ywawYXsDI3R7wMx2bDCV?=
 =?us-ascii?Q?vWE3HN3hFO1lKANjgYQrLjSsKKSVl8d2jEwqrN9/Y0t46EY27L+ykQg23YzS?=
 =?us-ascii?Q?KGSApEtAzM4Ue4QkFJE4dSVbwWYsV2srkr38QxhLvYQQWBym38iAfC4cSAJv?=
 =?us-ascii?Q?YU1Uivjg4nJnxCV/iFfi/F77M8sXl6QH4DdY21VO5wOtUmBdFf3AY/psHJuG?=
 =?us-ascii?Q?BCxCuWc87zpmBPZNdL799Am3w2I0kG/n88tei/O7t2ve5T7Bqa2uYPibKamw?=
 =?us-ascii?Q?j4wSwq3kqcC1eIghJbTmCXS41dmQjJ/16+7uY2a1P8A3RAwkk/nVipeJubt+?=
 =?us-ascii?Q?xMLO6fa2O810NeXai1e6+SrmDyulKP4UhZWQxVi1eoPjN7hKEbbCzOEm8u/u?=
 =?us-ascii?Q?HtJSm9nAlhxLBwwvUiZbH4u9hpSt0/C1jks8InEXTs4he65t2ZNWPjharcEZ?=
 =?us-ascii?Q?xBZo/Dxm/OtotPwILSwzEbW3n1BfwaSC3JV3GouTqr16uNWmIfcpWAGp0YDX?=
 =?us-ascii?Q?SAzAuT7YEjP0XuKNyVSswJRdg8/V00+t2yivIQ0XWH6+4UXcmYqxenvwf1ut?=
 =?us-ascii?Q?mtVpIuWOQ2UfUwTPNqywezJjqThakI3dU1rN/i+ipuBRKKH592+iz7KqJjr6?=
 =?us-ascii?Q?+f2CRZXmjTu28fsr6tw21oGGQ+9hYBugKYRYklCtgnao3VgcDtffQK7F1ogE?=
 =?us-ascii?Q?K//Ajr94PIEZX0+krjKg5iwkYJsN3cyvTqn4YEgh19++8uud/+HbY/8EoW1F?=
 =?us-ascii?Q?YrgYXm10v1KNvMz8Y2Cmz/O+c+cD8OcxAk/EjeXAm/STJg1oHhr5D47i2xRe?=
 =?us-ascii?Q?XEVrmxrUkRBrWkV/yD5qMOEnoBe6P6/xfjCw+bimb/RuslXzGQTFHIRD6PK+?=
 =?us-ascii?Q?cFm4DEmyUjOSZ67uCkdt0jzhCXxRofPmeWMIobndI1nRq951jSjiYHU6bHY/?=
 =?us-ascii?Q?OASDa2O+gzvMHP3skU01AyL/eeKCbEMA8XFRMk6MvC/mPkPpv2Oomr3MUzRC?=
 =?us-ascii?Q?F1w07XAzw72WV71TcI4nxiL4NAatqqpONyMGQauxx6+Dw4is786GGOLeAdBD?=
 =?us-ascii?Q?n/JBk3zhjssr6ortzrmswXQNLGJ1pkwWLOVZ3QL581/fFRwzII1nu6TAlWNT?=
 =?us-ascii?Q?jt/FyRe+7TOegkhej8FLO7b4GrPMqSkdI+/derg8oftj3WBrBgA3LHMAXy+W?=
 =?us-ascii?Q?XNHIeCId5FHIbWtNfEwhDcZJRGWpefeGYa6WI9j+T10dfCf8kozPd9XuihKo?=
 =?us-ascii?Q?QN6kn5BP6/GTDMdmhEAmLhYMnRgatd00wWF1jvWF/SaCpxRlT5IZk39D06x3?=
 =?us-ascii?Q?GH4bQjouZG6AjHjA+u+ne6vVhnJsPIrMWfyGzWFx1O4sandMwfjGBHErDYzm?=
 =?us-ascii?Q?B8RJbqIAUTFfVsDClK/2pdZ3vOdaeiFmUECZfGnOrm4OKRddSC9SKKiG7XQ7?=
 =?us-ascii?Q?F/wUgy00rHxFly3Bc+kkKQeSIgWidhNdL60457ly3xcq62eGWE7Y/bkLGQ/G?=
 =?us-ascii?Q?TA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9611c38e-ca5f-4972-6836-08db02a7b35f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2023 09:52:29.8974 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dQzaZ5DlOS34mrj9otRba2VW00GsFpXLGPyudJT0UPwRGEXXb69MshvQC213A3Mcom+NIeSjHFviek/R9wK2BQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6025
X-Proofpoint-ORIG-GUID: BLBOe1nisKsh4kmnXpgYnjKPaVCo8PtA
X-Proofpoint-GUID: BLBOe1nisKsh4kmnXpgYnjKPaVCo8PtA
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
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_PDS_OTHER_BAD_TLD=0.01 autolearn=ham autolearn_force=no
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

Update the 9p 'local' file system driver to support Windows,
including open, read, write, close, rename, remove, etc.

All security models are supported. The mapped (mapped-xattr)
security model is implemented using NTFS Alternate Data Stream
(ADS) so the 9p export path shall be on an NTFS partition.

Symbolic link and hard link are not supported when security
model is "passthrough" or "none", because Windows NTFS does
not fully support them with POSIX compatibility. Symbolic
link is enabled when security model is "mapped-file" or
"mapped-xattr".

inode remap is always enabled because Windows file system
does not provide a compatible inode number.

mknod() is not supported because Windows does not support it.
chown() and chmod() are not supported when 9pfs is configured
with security mode to 'none' or 'passthrough' because Windows
host does not support such type request.

Signed-off-by: Guohuai Shi <guohuai.shi@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 hw/9pfs/9p-local.h |   1 +
 hw/9pfs/9p-local.c | 253 +++++++++++++++++++++++++++++++++++++++++++--
 2 files changed, 246 insertions(+), 8 deletions(-)

diff --git a/hw/9pfs/9p-local.h b/hw/9pfs/9p-local.h
index 77e7f57f89..5905923881 100644
--- a/hw/9pfs/9p-local.h
+++ b/hw/9pfs/9p-local.h
@@ -17,6 +17,7 @@ typedef struct {
     int mountfd;
 #ifdef CONFIG_WIN32
     char *root_path;
+    DWORD block_size;
 #endif
 } LocalData;
 
diff --git a/hw/9pfs/9p-local.c b/hw/9pfs/9p-local.c
index 4385f18da2..d308a88759 100644
--- a/hw/9pfs/9p-local.c
+++ b/hw/9pfs/9p-local.c
@@ -21,11 +21,13 @@
 #include "9p-xattr.h"
 #include "9p-util.h"
 #include "fsdev/qemu-fsdev.h"   /* local_ops */
+#ifndef CONFIG_WIN32
 #include <arpa/inet.h>
 #include <pwd.h>
 #include <grp.h>
 #include <sys/socket.h>
 #include <sys/un.h>
+#endif
 #include "qemu/xattr.h"
 #include "qapi/error.h"
 #include "qemu/cutils.h"
@@ -38,7 +40,9 @@
 #include <linux/magic.h>
 #endif
 #endif
+#ifndef CONFIG_WIN32
 #include <sys/ioctl.h>
+#endif
 
 #ifndef XFS_SUPER_MAGIC
 #define XFS_SUPER_MAGIC  0x58465342
@@ -90,10 +94,12 @@ int local_open_nofollow(FsContext *fs_ctx, const char *path, int flags,
     return fd;
 }
 
+#ifndef CONFIG_WIN32
 int local_opendir_nofollow(FsContext *fs_ctx, const char *path)
 {
     return local_open_nofollow(fs_ctx, path, O_DIRECTORY | O_RDONLY, 0);
 }
+#endif
 
 static void renameat_preserve_errno(int odirfd, const char *opath, int ndirfd,
                                     const char *npath)
@@ -236,7 +242,7 @@ static int local_set_mapped_file_attrat(int dirfd, const char *name,
     int ret;
     char buf[ATTR_MAX];
     int uid = -1, gid = -1, mode = -1, rdev = -1;
-    int map_dirfd = -1, map_fd;
+    int map_dirfd = -1;
     bool is_root = !strcmp(name, ".");
 
     if (is_root) {
@@ -300,10 +306,12 @@ update_map_file:
         return -1;
     }
 
-    map_fd = fileno(fp);
+#ifndef CONFIG_WIN32
+    int map_fd = fileno(fp);
     assert(map_fd != -1);
     ret = fchmod(map_fd, 0600);
     assert(ret == 0);
+#endif
 
     if (credp->fc_uid != -1) {
         uid = credp->fc_uid;
@@ -335,6 +343,7 @@ update_map_file:
     return 0;
 }
 
+#ifndef CONFIG_WIN32
 static int fchmodat_nofollow(int dirfd, const char *name, mode_t mode)
 {
     struct stat stbuf;
@@ -396,6 +405,7 @@ static int fchmodat_nofollow(int dirfd, const char *name, mode_t mode)
     close_preserve_errno(fd);
     return ret;
 }
+#endif
 
 static int local_set_xattrat(int dirfd, const char *path, FsCred *credp)
 {
@@ -436,6 +446,7 @@ static int local_set_xattrat(int dirfd, const char *path, FsCred *credp)
     return 0;
 }
 
+#ifndef CONFIG_WIN32
 static int local_set_cred_passthrough(FsContext *fs_ctx, int dirfd,
                                       const char *name, FsCred *credp)
 {
@@ -452,6 +463,7 @@ static int local_set_cred_passthrough(FsContext *fs_ctx, int dirfd,
 
     return fchmodat_nofollow(dirfd, name, credp->fc_mode & 07777);
 }
+#endif
 
 static ssize_t local_readlink(FsContext *fs_ctx, V9fsPath *fs_path,
                               char *buf, size_t bufsz)
@@ -470,6 +482,12 @@ static ssize_t local_readlink(FsContext *fs_ctx, V9fsPath *fs_path,
         close_preserve_errno(fd);
     } else if ((fs_ctx->export_flags & V9FS_SM_PASSTHROUGH) ||
                (fs_ctx->export_flags & V9FS_SM_NONE)) {
+#ifdef CONFIG_WIN32
+        errno = ENOTSUP;
+        error_report_once("readlink is not available on Windows host when"
+                          "security_model is \"none\" or \"passthrough\"");
+        tsize = -1;
+#else
         char *dirpath = g_path_get_dirname(fs_path->data);
         char *name = g_path_get_basename(fs_path->data);
         int dirfd;
@@ -484,6 +502,7 @@ static ssize_t local_readlink(FsContext *fs_ctx, V9fsPath *fs_path,
     out:
         g_free(name);
         g_free(dirpath);
+#endif
     }
     return tsize;
 }
@@ -522,9 +541,31 @@ static int local_opendir(FsContext *ctx,
         return -1;
     }
 
+#ifdef CONFIG_WIN32
+    char *full_file_name;
+
+    HANDLE hDir = (HANDLE)_get_osfhandle(dirfd);
+
+    full_file_name = get_full_path_win32(hDir, NULL);
+
+    close(dirfd);
+
+    if (full_file_name == NULL) {
+        return -1;
+    }
+    stream = qemu_opendir(full_file_name);
+    g_free(full_file_name);
+#else
     stream = fdopendir(dirfd);
+#endif
+
     if (!stream) {
+#ifndef CONFIG_WIN32
+        /*
+         * dirfd is closed always in above code, so no need to close it here.
+         */
         close(dirfd);
+#endif
         return -1;
     }
     fs->dir.stream = stream;
@@ -567,13 +608,17 @@ again:
 #endif
 
     if (ctx->export_flags & V9FS_SM_MAPPED) {
+#ifndef CONFIG_WIN32
         entry->d_type = DT_UNKNOWN;
+#endif
     } else if (ctx->export_flags & V9FS_SM_MAPPED_FILE) {
         if (local_is_mapped_file_metadata(ctx, entry->d_name)) {
             /* skip the meta data */
             goto again;
         }
+#ifndef CONFIG_WIN32
         entry->d_type = DT_UNKNOWN;
+#endif
     }
 
     return entry;
@@ -647,7 +692,14 @@ static int local_chmod(FsContext *fs_ctx, V9fsPath *fs_path, FsCred *credp)
         ret = local_set_mapped_file_attrat(dirfd, name, credp);
     } else if (fs_ctx->export_flags & V9FS_SM_PASSTHROUGH ||
                fs_ctx->export_flags & V9FS_SM_NONE) {
+#ifdef CONFIG_WIN32
+        errno = ENOTSUP;
+        error_report_once("chmod is not available on Windows host when"
+                          "security_model is \"none\" or \"passthrough\"");
+        ret = -1;
+#else
         ret = fchmodat_nofollow(dirfd, name, credp->fc_mode);
+#endif
     }
     close_preserve_errno(dirfd);
 
@@ -691,6 +743,12 @@ static int local_mknod(FsContext *fs_ctx, V9fsPath *dir_path,
         }
     } else if (fs_ctx->export_flags & V9FS_SM_PASSTHROUGH ||
                fs_ctx->export_flags & V9FS_SM_NONE) {
+#ifdef CONFIG_WIN32
+        errno = ENOTSUP;
+        error_report_once("mknod is not available on Windows host when"
+                          "security_model is \"none\" or \"passthrough\"");
+        goto out;
+#else
         err = qemu_mknodat(dirfd, name, credp->fc_mode, credp->fc_rdev);
         if (err == -1) {
             goto out;
@@ -699,6 +757,7 @@ static int local_mknod(FsContext *fs_ctx, V9fsPath *dir_path,
         if (err == -1) {
             goto err_end;
         }
+#endif
     }
     goto out;
 
@@ -748,10 +807,12 @@ static int local_mkdir(FsContext *fs_ctx, V9fsPath *dir_path,
         if (err == -1) {
             goto out;
         }
+#ifndef CONFIG_WIN32
         err = local_set_cred_passthrough(fs_ctx, dirfd, name, credp);
         if (err == -1) {
             goto err_end;
         }
+#endif
     }
     goto out;
 
@@ -768,7 +829,12 @@ static int local_fstat(FsContext *fs_ctx, int fid_type,
     int err, fd;
 
     if (fid_type == P9_FID_DIR) {
+#ifdef CONFIG_WIN32
+        errno = ENOTSUP;
+        return -1;  /* Windows do not allow opening a directory by open() */
+#else
         fd = dirfd(fs->dir.stream);
+#endif
     } else {
         fd = fs->fd;
     }
@@ -820,10 +886,10 @@ static int local_open2(FsContext *fs_ctx, V9fsPath *dir_path, const char *name,
         return -1;
     }
 
-    /*
-     * Mark all the open to not follow symlinks
-     */
+#ifndef CONFIG_WIN32
+    /* Mark all the open to not follow symlinks */
     flags |= O_NOFOLLOW;
+#endif
 
     dirfd = local_opendir_nofollow(fs_ctx, dir_path->data);
     if (dirfd == -1) {
@@ -853,10 +919,12 @@ static int local_open2(FsContext *fs_ctx, V9fsPath *dir_path, const char *name,
         if (fd == -1) {
             goto out;
         }
+#ifndef CONFIG_WIN32
         err = local_set_cred_passthrough(fs_ctx, dirfd, name, credp);
         if (err == -1) {
             goto err_end;
         }
+#endif
     }
     err = fd;
     fs->fd = fd;
@@ -921,6 +989,21 @@ static int local_symlink(FsContext *fs_ctx, const char *oldpath,
         }
     } else if (fs_ctx->export_flags & V9FS_SM_PASSTHROUGH ||
                fs_ctx->export_flags & V9FS_SM_NONE) {
+#ifdef CONFIG_WIN32
+        /*
+         * Windows symbolic link requires administrator privilage.
+         * And Windows does not provide any interface like readlink().
+         * All symbolic links on Windows are always absolute paths.
+         * It's not 100% compatible with POSIX symbolic link.
+         *
+         * With above reasons, symbolic link with "passthrough" or "none"
+         * mode is disabled on Windows host.
+         */
+        errno = ENOTSUP;
+        error_report_once("symlink is not available on Windows host when"
+                          "security_model is \"none\" or \"passthrough\"");
+        goto out;
+#else
         err = symlinkat(oldpath, dirfd, name);
         if (err) {
             goto out;
@@ -938,6 +1021,7 @@ static int local_symlink(FsContext *fs_ctx, const char *oldpath,
                 err = 0;
             }
         }
+#endif
     }
     goto out;
 
@@ -951,6 +1035,11 @@ out:
 static int local_link(FsContext *ctx, V9fsPath *oldpath,
                       V9fsPath *dirpath, const char *name)
 {
+#ifdef CONFIG_WIN32
+    errno = ENOTSUP;
+    error_report_once("link is not available on Windows host");
+    return -1;
+#else
     char *odirpath = g_path_get_dirname(oldpath->data);
     char *oname = g_path_get_basename(oldpath->data);
     int ret = -1;
@@ -1020,6 +1109,7 @@ out:
     g_free(oname);
     g_free(odirpath);
     return ret;
+#endif
 }
 
 static int local_truncate(FsContext *ctx, V9fsPath *fs_path, off_t size)
@@ -1050,8 +1140,15 @@ static int local_chown(FsContext *fs_ctx, V9fsPath *fs_path, FsCred *credp)
     if ((credp->fc_uid == -1 && credp->fc_gid == -1) ||
         (fs_ctx->export_flags & V9FS_SM_PASSTHROUGH) ||
         (fs_ctx->export_flags & V9FS_SM_NONE)) {
+#ifdef CONFIG_WIN32
+        errno = ENOTSUP;
+        error_report_once("chown is not available on Windows host when"
+                          "security_model is \"none\" or \"passthrough\"");
+        ret = -1;
+#else
         ret = fchownat(dirfd, name, credp->fc_uid, credp->fc_gid,
                        AT_SYMLINK_NOFOLLOW);
+#endif
     } else if (fs_ctx->export_flags & V9FS_SM_MAPPED) {
         ret = local_set_xattrat(dirfd, name, credp);
     } else if (fs_ctx->export_flags & V9FS_SM_MAPPED_FILE) {
@@ -1163,6 +1260,12 @@ out:
 static int local_fsync(FsContext *ctx, int fid_type,
                        V9fsFidOpenState *fs, int datasync)
 {
+#ifdef CONFIG_WIN32
+    if (fid_type != P9_FID_DIR) {
+        return _commit(fs->fd);
+    }
+    return 0;
+#else
     int fd;
 
     if (fid_type == P9_FID_DIR) {
@@ -1176,11 +1279,14 @@ static int local_fsync(FsContext *ctx, int fid_type,
     } else {
         return fsync(fd);
     }
+#endif
 }
 
 static int local_statfs(FsContext *s, V9fsPath *fs_path, struct statfs *stbuf)
 {
-    int fd, ret;
+    int ret;
+#ifndef CONFIG_WIN32
+    int fd;
 
     fd = local_open_nofollow(s, fs_path->data, O_RDONLY, 0);
     if (fd == -1) {
@@ -1188,39 +1294,65 @@ static int local_statfs(FsContext *s, V9fsPath *fs_path, struct statfs *stbuf)
     }
     ret = fstatfs(fd, stbuf);
     close_preserve_errno(fd);
+#else
+    LocalData *data = (LocalData *)s->private;
+
+    ret = statfs_win32(data->root_path, stbuf);
+    if (ret == 0) {
+        /* use context address as fsid */
+        memcpy(&stbuf->f_fsid, s, sizeof(intptr_t));
+    }
+#endif
+
     return ret;
 }
 
 static ssize_t local_lgetxattr(FsContext *ctx, V9fsPath *fs_path,
                                const char *name, void *value, size_t size)
 {
+#ifdef CONFIG_WIN32
+    return -1;
+#else
     char *path = fs_path->data;
 
     return v9fs_get_xattr(ctx, path, name, value, size);
+#endif
 }
 
 static ssize_t local_llistxattr(FsContext *ctx, V9fsPath *fs_path,
                                 void *value, size_t size)
 {
+#ifdef CONFIG_WIN32
+    return -1;
+#else
     char *path = fs_path->data;
 
     return v9fs_list_xattr(ctx, path, value, size);
+#endif
 }
 
 static int local_lsetxattr(FsContext *ctx, V9fsPath *fs_path, const char *name,
                            void *value, size_t size, int flags)
 {
+#ifdef CONFIG_WIN32
+    return -1;
+#else
     char *path = fs_path->data;
 
     return v9fs_set_xattr(ctx, path, name, value, size, flags);
+#endif
 }
 
 static int local_lremovexattr(FsContext *ctx, V9fsPath *fs_path,
                               const char *name)
 {
+#ifdef CONFIG_WIN32
+    return -1;
+#else
     char *path = fs_path->data;
 
     return v9fs_remove_xattr(ctx, path, name);
+#endif
 }
 
 static int local_name_to_path(FsContext *ctx, V9fsPath *dir_path,
@@ -1383,6 +1515,7 @@ static int local_unlinkat(FsContext *ctx, V9fsPath *dir,
     return ret;
 }
 
+#ifndef CONFIG_WIN32
 #ifdef FS_IOC_GETVERSION
 static int local_ioc_getversion(FsContext *ctx, V9fsPath *path,
                                 mode_t st_mode, uint64_t *st_gen)
@@ -1432,11 +1565,90 @@ static int local_ioc_getversion_init(FsContext *ctx, LocalData *data, Error **er
 #endif
     return 0;
 }
+#endif
 
-static int local_init(FsContext *ctx, Error **errp)
+#ifdef CONFIG_WIN32
+static int init_win32_root_directory(FsContext *ctx, LocalData *data,
+                                        Error **errp)
 {
-    LocalData *data = g_malloc(sizeof(*data));
+    HANDLE hRoot;
+    char *root_path;
+    DWORD SectorsPerCluster;
+    DWORD BytesPerSector;
+    DWORD NumberOfFreeClusters;
+    DWORD TotalNumberOfClusters;
+    char disk_root[4] = { 0 };
+
+    hRoot = CreateFile(ctx->fs_root, GENERIC_READ,
+                       FILE_SHARE_READ | FILE_SHARE_WRITE | FILE_SHARE_DELETE,
+                       NULL,
+                       OPEN_EXISTING, FILE_FLAG_BACKUP_SEMANTICS, NULL);
+    if (hRoot == INVALID_HANDLE_VALUE) {
+        error_setg_errno(errp, EINVAL, "cannot open %s", ctx->fs_root);
+        return -1;
+    }
+
+    if ((ctx->export_flags & V9FS_SM_MAPPED) != 0) {
+        wchar_t fs_name[MAX_PATH + 1] = {0};
+        wchar_t ntfs_name[5] = {'N', 'T', 'F', 'S'};
+
+        /* Get file system type name */
+        if (GetVolumeInformationByHandleW(hRoot, NULL, 0, NULL, NULL, NULL,
+                                          fs_name, MAX_PATH + 1) == 0) {
+            error_setg_errno(errp, EINVAL,
+                             "cannot get file system information");
+            CloseHandle(hRoot);
+            return -1;
+        }
+
+        /*
+         * security_model=mapped(-xattr) requires a fileystem on Windows that
+         * supports Alternate Data Stream (ADS). NTFS is one of them, and is
+         * probably most popular on Windows. It is fair enough to assume
+         * Windows users to use NTFS for the mapped security model.
+         */
+        if (wcscmp(fs_name, ntfs_name) != 0) {
+            CloseHandle(hRoot);
+            error_setg_errno(errp, EINVAL, "require NTFS file system");
+            return -1;
+        }
+    }
+
+    root_path = get_full_path_win32(hRoot, NULL);
+    if (root_path == NULL) {
+        CloseHandle(hRoot);
+        error_setg_errno(errp, EINVAL, "cannot get full root path");
+        return -1;
+    }
+
+    /* copy the first 3 characters for the root directory */
+    memcpy(disk_root, root_path, 3);
 
+    if (GetDiskFreeSpace(disk_root, &SectorsPerCluster, &BytesPerSector,
+                         &NumberOfFreeClusters, &TotalNumberOfClusters) == 0) {
+        CloseHandle(hRoot);
+        error_setg_errno(errp, EINVAL, "cannot get file system block size");
+        return -1;
+    }
+
+    /*
+     * hold the root handle will prevent other one to delete or replace the
+     * root directory during runtime.
+     */
+
+    data->mountfd = _open_osfhandle((intptr_t)hRoot, _O_RDONLY);
+    data->root_path = root_path;
+    data->block_size = SectorsPerCluster * BytesPerSector;
+
+    return 0;
+}
+
+#endif
+
+static int local_init(FsContext *ctx, Error **errp)
+{
+    LocalData *data = g_malloc0(sizeof(*data));
+#ifndef CONFIG_WIN32
     data->mountfd = open(ctx->fs_root, O_DIRECTORY | O_RDONLY);
     if (data->mountfd == -1) {
         error_setg_errno(errp, errno, "failed to open '%s'", ctx->fs_root);
@@ -1447,7 +1659,17 @@ static int local_init(FsContext *ctx, Error **errp)
         close(data->mountfd);
         goto err;
     }
+#else
+    if (init_win32_root_directory(ctx, data, errp) != 0) {
+        goto err;
+    }
 
+    /*
+     * Always enable inode remap since Windows file system does not
+     * have inode number.
+     */
+    ctx->export_flags |= V9FS_REMAP_INODES;
+#endif
     if (ctx->export_flags & V9FS_SM_PASSTHROUGH) {
         ctx->xops = passthrough_xattr_ops;
     } else if (ctx->export_flags & V9FS_SM_MAPPED) {
@@ -1467,6 +1689,16 @@ static int local_init(FsContext *ctx, Error **errp)
     return 0;
 
 err:
+#ifdef CONFIG_WIN32
+    if (data->root_path != NULL) {
+        g_free(data->root_path);
+    }
+#endif
+
+    if (data->mountfd != -1) {
+        close(data->mountfd);
+    }
+
     g_free(data);
     return -1;
 }
@@ -1479,6 +1711,11 @@ static void local_cleanup(FsContext *ctx)
         return;
     }
 
+#ifdef CONFIG_WIN32
+    if (data->root_path != NULL) {
+        g_free(data->root_path);
+    }
+#endif
     close(data->mountfd);
     g_free(data);
 }
-- 
2.25.1


