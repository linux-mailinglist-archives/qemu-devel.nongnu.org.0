Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E28625272
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 05:25:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otLZc-0000Wx-5D; Thu, 10 Nov 2022 23:23:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=83144312e2=bin.meng@windriver.com>)
 id 1otLZa-0000W8-A1
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 23:23:22 -0500
Received: from mx0a-0064b401.pphosted.com ([205.220.166.238])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=83144312e2=bin.meng@windriver.com>)
 id 1otLZX-0001Zj-Bs
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 23:23:22 -0500
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AB4N5DM004957; Thu, 10 Nov 2022 20:23:06 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=s601e/7v4tldu0dGoFfcjj104NlHNzgzG04TEzou+Io=;
 b=cQq72DevbIdQ8LkyTaMS0vn8KT1FWj3vNwkUWRHkmEkfO8s76Rz0lJ9fBMWYFkDTdkGN
 u9sFv2BT1DpgjRUqVKNLQM2slnwx1oviFlWZL95xrzor+VnghzdmGoN599ildP+INOXY
 s21yOFS5avjBDMMRKUN1rukAZjdXP1UXKkOq0ms1of5IT2FrLXXK98sPSGMVllQ4HGs0
 NZ+MsQIj+fdCurVf0xOzPdtw0fITLGufX+soz0AiMx175+IWttdwWomwKEKM+I4XyO7c
 p2QCTBvtaE9O0Iyhijc81RVvlQTzwpY6b8c2xdUA0XNpBtWNbYS8WqoHNik3pQJ5e2VD Qg== 
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3knk43d9m3-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Nov 2022 20:23:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jnqmCvDDhk4DR3BTAtuJRpeNMLiLiqrHqJvvAnTGhfNoBDf++9eEt1AUY10ra3Oh6Xe6cfFvqQogBNvKNLlVoJzAUgRrJ+A7o427aSb3jWdFDKocJDQnHZn54hbja3OgGQLHPpK0PqxXcF+4QjZRP1B8coUgZ2L/DE5dvX/xyD7yhDXYQArqZGEVf/gNDc2gxFbmz9c3KGXhBp61hWnkIpldUpIR3x8N9TEJ5k/IgeXF84PUjDtDisSVofpVy1ntPqpkiuTi9L2xCEXu5xMTAZTL5naeoTQiwUi6iwOgX9AaSZj3nzy2eAXoMgXXdnOSSOqCUHPziBtitA6UDemCdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s601e/7v4tldu0dGoFfcjj104NlHNzgzG04TEzou+Io=;
 b=gmhJ1MIdOq1/LYqmsD3PGDaOp755KzZL2X03n9s78hn39cqqkBIs2GriFVzFm3zsss3Xk64PXg8/ib4QLvV6b3rdVTy9AVhXOC6hVUFI74dIGnNFvK7dCAciXNf6L5BxwApyxGRhmXNH0ZRWJd+Ci/nbfJpZWdr3pYUGqet3mY7i56OzAr3lShXyvKJu/lfqhVqd7tdUkHrTeJDBJR1Q7uTeHjog/CTXAeUWBfocb3986N4AgyHQGVzBEzyOjCQ5EVJqbx4q5vlWYFAX1E8BAft+h3vTflALy/DB2WwKAiMahYk67NSP8UT+ygSaCUIn+IQj5MFaiEokGQfARFcVhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5358.namprd11.prod.outlook.com (2603:10b6:5:395::7) by
 SJ0PR11MB5102.namprd11.prod.outlook.com (2603:10b6:a03:2ac::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27; Fri, 11 Nov
 2022 04:23:03 +0000
Received: from DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::8e5e:71da:1e29:bc15]) by DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::8e5e:71da:1e29:bc15%5]) with mapi id 15.20.5813.013; Fri, 11 Nov 2022
 04:23:03 +0000
From: Bin Meng <bin.meng@windriver.com>
To: qemu-devel@nongnu.org
Cc: Guohuai Shi <guohuai.shi@windriver.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>
Subject: [PATCH v2 08/19] hw/9pfs: Update the local fs driver to support
 Windows
Date: Fri, 11 Nov 2022 12:22:14 +0800
Message-Id: <20221111042225.1115931-9-bin.meng@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221111042225.1115931-1-bin.meng@windriver.com>
References: <20221111042225.1115931-1-bin.meng@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0138.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1::17) To DM4PR11MB5358.namprd11.prod.outlook.com
 (2603:10b6:5:395::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5358:EE_|SJ0PR11MB5102:EE_
X-MS-Office365-Filtering-Correlation-Id: e741222e-37a8-4b00-ac5c-08dac39c6c9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RnMprc5k+4HRVnimlrcO8k1li2eQy7VyKQv5aaSIRY+Co/y9vn4uxpDDi1isgTk8/pIOc97wJtMA/ohR78UM/pFmboZxvtowYvYAClZYnhYEqeTsP8UTNO/gK3Wc6SpZ8ssIWQeCZBZcEO6dOcWQ6Zt2BGBnn/inOLNb9PVJ42UNL18dawSbyt4W+7L4HCXOvfM9YVPgTAuzhx4bQ6VlCjgZPntY8R6kr7XsyDrB045HH0VI9i04k2d97x6pooPGfa4e76ZbdziXuw01D+38jp1tBshQJcekBysYJ2ABdNJLL35HnHizRSac4JyK0KbMRRYoG+47AJ9C3n1I4ze+0Cm/0rvWidQ1LBs5GF4G/fnqUqTEnqJUyHw5bh/bCI6XQY/Ai7AGehZNIEc1r3S6xRZIhv3DOyklhPpfToRiuiu2Fu4HFQa88l8fQJM2WsIDUf2HDK6K70zGeAiKUuNv6Aro3DvCejL79FswB/vucQFrE1PC0Lsb3BCpvOt+pgE5SDhU66yD9m/jUNvyVt/UcPqyO00wxyTokzDwqI8pHdB5xp/cpaZKzrjaBoTeiHdVC0OicfG68SccXqOdLhcFTp1ATHfEJbf07o0x7MY/s1fJM1t+OIOeFStOWKi2VY5WzSn9A87qTT386xmWpHwY10/W7RHUJsZi6m+ZTL2h+B48iM8+48k2HgMSqE/oNRSUoWY0HRqQjC7X+m3u7q0a7/C2JI6Z4H9XiEtl+umQ8CF/T5LxOFVgXVqHZSeXvLSFYeU8V/tA++nd2+TSmXDvCQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5358.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(346002)(376002)(39850400004)(366004)(136003)(451199015)(66556008)(316002)(86362001)(8676002)(66476007)(66946007)(4326008)(38350700002)(38100700002)(36756003)(44832011)(83380400001)(52116002)(6512007)(2616005)(1076003)(26005)(6506007)(478600001)(6666004)(186003)(6486002)(8936002)(30864003)(41300700001)(15650500001)(6916009)(2906002)(54906003)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iwmWvxGoqkQZDOUeaTgE+rfcUKiRwXiS2zJDbZjEw5O9IuHleUq2LhHyIZno?=
 =?us-ascii?Q?jQv2N9nXc6XNXWgDFsnLcvm/oRmkIsJV7EFKg6hWUk6TzaCxhVHZMeZ4Rr4S?=
 =?us-ascii?Q?1UByxXRvAuBqiwUwfT9/BRbEmDnnaUtQzvtMeX2XBI191UoMtFh54ZZzx8TF?=
 =?us-ascii?Q?BlSGbm6tFDnKJuMkMtN7/J3zynOOL8Zt+kp4g3zFRvsPYTqD1tTY3PAM4FDd?=
 =?us-ascii?Q?8J9Fi/NrTD6Y8YJg5ujpad7oQeeBl2HWD0YTmPfBhod0RDnf1ygpGKYeCotu?=
 =?us-ascii?Q?HqFk7+twJc/ZWytFrPr+0CDPpmGmqJwvZfwKY97pFT9cohe9+2p30tS5TkNQ?=
 =?us-ascii?Q?lTi47bA2BLxjem9wfanXaEQ8E2nhyolUZTnD3wsrbJRqya4lWfTT/cmyyOJv?=
 =?us-ascii?Q?Ch4Qa/aSU5k8N+zKd5V2zkJRdOEsSD83Q2ajp/emPvFDt/sgr7tb1kajKtuR?=
 =?us-ascii?Q?fRt+kD/9O3m3I/DSRb1ZZmGpxdt0bd2RzxwgfvKokX8O6x28sUbRuBN+C3lV?=
 =?us-ascii?Q?V8+Lg7rsXjVvGd/HnJXSZoMpX4w/xTBrmYVdAib1KN7Pp43qynLzdrPm0HB0?=
 =?us-ascii?Q?v/53XAZ1H+LVkWzo6eJKMjyWPvHC2FlZa1ei7AzvZsCZamFf1qQtsr/DydHl?=
 =?us-ascii?Q?PSFP6Clzeb/rckf38aPVTn9E8AOif3vSXoNNwA3S46WmvjCTrn0KrlHk6KRZ?=
 =?us-ascii?Q?5CpIN2WVtvv6NM7qFHUoKnKOO8QYBbvl382ImEl9ORGGFMrW/PExlE/13Xhk?=
 =?us-ascii?Q?NDYixvZ0v5QrrSLamxXctaIpKDO4UFQs61aCPZVQEL7xC1Tu3VoGX3S4xzM3?=
 =?us-ascii?Q?NwloHg4EKOXM3YOM0K7yMZ5k7fvzKfmN+asWw1ocGDerK6vQ2o13fPyp3ghn?=
 =?us-ascii?Q?9+MwMLifhxptJPDKAI3igPqZ0JIctRmozSMTJBDo7XdZcKj38kK46WsWELu0?=
 =?us-ascii?Q?NwJhBOZ24YtM1gr1NcMGHKPt6b5MljNoX0z5WJtdpKl5g94p62en0FDhKsNb?=
 =?us-ascii?Q?lPrRs/VyC2rurIRBxDZezz4NpYVtFtKJb7iEGJ8LBzsD8Ppy5821d4yfiTDW?=
 =?us-ascii?Q?ZDkBvM/YJ5LSFfznUbup65Jsf5FoUd8+fowj+qdiwvSFQEmwOWVN4UPWN+XE?=
 =?us-ascii?Q?VzFS5XHqbvNACrayk1kDIANiXCWHhM3QREF17GlMIq82spsg6pUIiX7YvE6F?=
 =?us-ascii?Q?oBkpcbOwlQo2beDlQNDu/GJD57H/2l4EsLn89AucA2R/gU3nTeHYqc3HjtpH?=
 =?us-ascii?Q?A7B0oQEM2UFf/0lcSd1hAEg7HP7IsT0YVRWR6KCoPxEnSs7CXT4NkW8jeAN4?=
 =?us-ascii?Q?+91aO04VFKdB3oy2EYQxXoDkBAvv2R4NmVciRBGmJdtAppzoFcXqIRatgA2N?=
 =?us-ascii?Q?NXfPS3/sQBeWClj3C6BBmMvmHo+kshkN6SaF6qy8vlUPAAdV7tZ8pmecbAMq?=
 =?us-ascii?Q?hKMBL8Z20jk8xExOwBv5DZ6h6Ph7lGSkKUhDQHyy+7wUqnH12s+Rjn+U4jKj?=
 =?us-ascii?Q?34HgiZTf4B1ouoVQZ647+LG20TZOS8vaPm5UQRyO2BfZ8HQy4INRRCnj7qmE?=
 =?us-ascii?Q?6U0vxss8WPCHWTvothaHPbXCpje038pC+5vphl92?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e741222e-37a8-4b00-ac5c-08dac39c6c9f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2022 04:23:03.2783 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NFAPtHnaSpwvF+tOUyqIxvfKInr77qwEvpWqNG8btEIcSCEr48jf9I5hSM5lcrlo3Zm1ZVe7xuo21wsLympAxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5102
X-Proofpoint-ORIG-GUID: 2bODpACHrIISw1HeC9Y_GM8FKDv5pdjP
X-Proofpoint-GUID: 2bODpACHrIISw1HeC9Y_GM8FKDv5pdjP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-11_01,2022-11-09_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015
 mlxlogscore=942 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 phishscore=0 mlxscore=0 adultscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211110027
Received-SPF: pass client-ip=205.220.166.238;
 envelope-from=prvs=83144312e2=bin.meng@windriver.com;
 helo=mx0a-0064b401.pphosted.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, PDS_OTHER_BAD_TLD=2,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Changes in v2:
- Update to support symbolic link when applicable
- Warn user if a specific 9pfs operation is not supported

 hw/9pfs/9p-local.h |   1 +
 hw/9pfs/9p-local.c | 388 +++++++++++++++++++++++++++++++++++++++++++--
 2 files changed, 378 insertions(+), 11 deletions(-)

diff --git a/hw/9pfs/9p-local.h b/hw/9pfs/9p-local.h
index eb4f39ddc2..311067d9af 100644
--- a/hw/9pfs/9p-local.h
+++ b/hw/9pfs/9p-local.h
@@ -17,6 +17,7 @@ typedef struct {
     QemuFd_t mountfd;
 #ifdef CONFIG_WIN32
     char *root_path;
+    DWORD block_size;
 #endif
 } LocalData;
 
diff --git a/hw/9pfs/9p-local.c b/hw/9pfs/9p-local.c
index 24e21141d5..20e3091cd7 100644
--- a/hw/9pfs/9p-local.c
+++ b/hw/9pfs/9p-local.c
@@ -1,5 +1,5 @@
 /*
- * 9p Posix callback
+ * 9p callback
  *
  * Copyright IBM, Corp. 2010
  *
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
@@ -90,10 +94,12 @@ QemuFd_t local_open_nofollow(FsContext *fs_ctx, const char *path, int flags,
     return fd;
 }
 
+#ifndef CONFIG_WIN32
 QemuFd_t local_opendir_nofollow(FsContext *fs_ctx, const char *path)
 {
     return local_open_nofollow(fs_ctx, path, O_DIRECTORY | O_RDONLY, 0);
 }
+#endif
 
 static void renameat_preserve_errno(QemuFd_t odirfd, const char *opath,
                                     QemuFd_t ndirfd, const char *npath)
@@ -135,10 +141,20 @@ static FILE *local_fopenat(QemuFd_t dirfd, const char *name, const char *mode)
     if (qemu_fd_invalid(fd)) {
         return NULL;
     }
+#ifdef CONFIG_WIN32
+    int _flags = mode[0] == 'r' ? O_RDONLY : 0;
+    int _fd = _open_osfhandle((intptr_t)fd, _flags);
+    assert(_fd != -1);
+    fp = fdopen(_fd, mode);
+    if (!fp) {
+        close(_fd);
+    }
+#else
     fp = fdopen(fd, mode);
     if (!fp) {
         close(fd);
     }
+#endif
     return fp;
 }
 
@@ -238,7 +254,7 @@ static int local_set_mapped_file_attrat(QemuFd_t dirfd, const char *name,
     int ret;
     char buf[ATTR_MAX];
     int uid = -1, gid = -1, mode = -1, rdev = -1;
-    QemuFd_t map_dirfd = QEMU_FD_INVALID, map_fd;
+    QemuFd_t map_dirfd = QEMU_FD_INVALID;
     bool is_root = !strcmp(name, ".");
 
     if (is_root) {
@@ -302,10 +318,12 @@ update_map_file:
         return -1;
     }
 
-    map_fd = fileno(fp);
+#ifndef CONFIG_WIN32
+    QemuFd_t map_fd = fileno(fp);
     assert(!qemu_fd_invalid(map_fd));
     ret = fchmod(map_fd, 0600);
     assert(ret == 0);
+#endif
 
     if (credp->fc_uid != -1) {
         uid = credp->fc_uid;
@@ -337,6 +355,7 @@ update_map_file:
     return 0;
 }
 
+#ifndef CONFIG_WIN32
 static int fchmodat_nofollow(QemuFd_t dirfd, const char *name, mode_t mode)
 {
     struct stat stbuf;
@@ -399,6 +418,7 @@ static int fchmodat_nofollow(QemuFd_t dirfd, const char *name, mode_t mode)
     close_preserve_errno(fd);
     return ret;
 }
+#endif
 
 static int local_set_xattrat(QemuFd_t dirfd, const char *path, FsCred *credp)
 {
@@ -439,6 +459,7 @@ static int local_set_xattrat(QemuFd_t dirfd, const char *path, FsCred *credp)
     return 0;
 }
 
+#ifndef CONFIG_WIN32
 static int local_set_cred_passthrough(FsContext *fs_ctx, QemuFd_t dirfd,
                                       const char *name, FsCred *credp)
 {
@@ -455,6 +476,7 @@ static int local_set_cred_passthrough(FsContext *fs_ctx, QemuFd_t dirfd,
 
     return fchmodat_nofollow(dirfd, name, credp->fc_mode & 07777);
 }
+#endif
 
 static ssize_t local_readlink(FsContext *fs_ctx, V9fsPath *fs_path,
                               char *buf, size_t bufsz)
@@ -464,17 +486,33 @@ static ssize_t local_readlink(FsContext *fs_ctx, V9fsPath *fs_path,
     if ((fs_ctx->export_flags & V9FS_SM_MAPPED) ||
         (fs_ctx->export_flags & V9FS_SM_MAPPED_FILE)) {
         QemuFd_t fd;
+        int _fd;
 
         fd = local_open_nofollow(fs_ctx, fs_path->data, O_RDONLY, 0);
         if (qemu_fd_invalid(fd)) {
             return -1;
         }
+#ifdef CONFIG_WIN32
+        _fd = _open_osfhandle((intptr_t)fd, 0);
+#else
+        _fd = fd;
+#endif
         do {
-            tsize = read(fd, (void *)buf, bufsz);
+            tsize = read(_fd, (void *)buf, bufsz);
         } while (tsize == -1 && errno == EINTR);
+#ifdef CONFIG_WIN32
+        close(_fd);
+#else
         close_preserve_errno(fd);
+#endif
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
         QemuFd_t dirfd;
@@ -489,6 +527,7 @@ static ssize_t local_readlink(FsContext *fs_ctx, V9fsPath *fs_path,
     out:
         g_free(name);
         g_free(dirpath);
+#endif
     }
     return tsize;
 }
@@ -512,7 +551,13 @@ static int local_open(FsContext *ctx, V9fsPath *fs_path,
     if (qemu_fd_invalid(fd)) {
         return -1;
     }
+#ifdef CONFIG_WIN32
+    int _fd = _open_osfhandle((intptr_t)fd, 0);
+    assert(_fd != -1);
+    fs->fd = _fd;
+#else
     fs->fd = fd;
+#endif
     return fs->fd;
 }
 
@@ -527,9 +572,24 @@ static int local_opendir(FsContext *ctx,
         return -1;
     }
 
+#ifdef CONFIG_WIN32
+    char *full_file_name = get_full_path_win32(dirfd, NULL);
+    if (full_file_name == NULL) {
+        CloseHandle(dirfd);
+        return -1;
+    }
+    stream = opendir(full_file_name);
+    g_free(full_file_name);
+#else
     stream = fdopendir(dirfd);
+#endif
+
     if (!stream) {
+#ifdef CONFIG_WIN32
+        CloseHandle(dirfd);
+#else
         close(dirfd);
+#endif
         return -1;
     }
     fs->dir.stream = stream;
@@ -572,13 +632,17 @@ again:
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
@@ -586,7 +650,94 @@ again:
 
 static void local_seekdir(FsContext *ctx, V9fsFidOpenState *fs, off_t off)
 {
+#ifndef CONFIG_WIN32
+    seekdir(fs->dir.stream, off);
+#else
+    off_t count;
+    struct dirent *findentry;
+    struct dirent *entry;
+    size_t namelen[3] = { 0 };
+    off_t direntoff[3] = { -1, -1, -1 };
+    char *d_name[3];
+    int i;
+
+    /*
+     * MinGW's seekdir() requires directory is not modified. If guest OS is
+     * modifying the directory when calling seekdir(), e.g.: "rm -rf *",
+     * then MinGW's seekdir() will seek to a wrong offset.
+     *
+     * This function saves some old offset directory entry name,
+     * and looks up current entry again, and compares the offset.
+     *
+     * If the new offset is less than the old offset, that means someone is
+     * deleting files in the directory, thus we need to seek offset backward.
+     *
+     * If the new offset is larger than the old offset, that means someone is
+     * creating files in the directory, thus we need to seek offset forward.
+     */
+
+    direntoff[0] = telldir(fs->dir.stream);
+
+    /* do nothing if current offset is 0 or EOF */
+    if (direntoff[0] == 0 || direntoff[0] < 0) {
+        seekdir(fs->dir.stream, off);
+        return;
+    }
+
+    d_name[0] = g_malloc0(sizeof(entry->d_name) * 3);
+    d_name[1] = d_name[0] + sizeof(entry->d_name);
+    d_name[2] = d_name[1] + sizeof(entry->d_name);
+
+    /* save 3 nearest entries and offsets */
+    for (i = 0; i < 3; i++) {
+        entry = &fs->dir.stream->dd_dir;
+
+        memcpy(d_name[i], entry->d_name, entry->d_namlen);
+        namelen[i] = strlen(d_name[i]) + 1;
+
+        direntoff[i] = telldir(fs->dir.stream);
+
+        entry = readdir(fs->dir.stream);
+        if (entry == NULL) {
+            break;
+        }
+    }
+
+    /* look up saved entries again */
+    for (i = 0; i < 3 && direntoff[i] != -1; i++) {
+        rewinddir(fs->dir.stream);
+        count = 0;
+        while ((findentry = readdir(fs->dir.stream)) != NULL) {
+            count++;
+
+            if (memcmp(findentry->d_name, d_name[i], namelen[i]) == 0) {
+                if (count + i == direntoff[i]) {
+                    seekdir(fs->dir.stream, off);
+                    goto out;
+                } else if (count + i < direntoff[i]) {
+                    off = off - (direntoff[i] - count) - i;
+                    if (off <= 0) {
+                        off = 0;
+                    }
+                    seekdir(fs->dir.stream, off);
+                    goto out;
+                } else {
+                    off = off + (count - direntoff[i]) - i;
+                    seekdir(fs->dir.stream, off);
+                    goto out;
+                }
+            }
+        }
+    }
+
+    /* cannot get anything, seek backward */
+    off = off - 1;
     seekdir(fs->dir.stream, off);
+
+out:
+    g_free(d_name[0]);
+    return;
+#endif
 }
 
 static ssize_t local_preadv(FsContext *ctx, V9fsFidOpenState *fs,
@@ -652,7 +803,14 @@ static int local_chmod(FsContext *fs_ctx, V9fsPath *fs_path, FsCred *credp)
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
 
@@ -696,6 +854,12 @@ static int local_mknod(FsContext *fs_ctx, V9fsPath *dir_path,
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
@@ -704,6 +868,7 @@ static int local_mknod(FsContext *fs_ctx, V9fsPath *dir_path,
         if (err == -1) {
             goto err_end;
         }
+#endif
     }
     goto out;
 
@@ -753,10 +918,12 @@ static int local_mkdir(FsContext *fs_ctx, V9fsPath *dir_path,
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
 
@@ -773,7 +940,12 @@ static int local_fstat(FsContext *fs_ctx, int fid_type,
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
@@ -825,10 +997,10 @@ static int local_open2(FsContext *fs_ctx, V9fsPath *dir_path, const char *name,
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
     if (qemu_fd_invalid(dirfd)) {
@@ -858,13 +1030,22 @@ static int local_open2(FsContext *fs_ctx, V9fsPath *dir_path, const char *name,
         if (qemu_fd_invalid(fd)) {
             goto out;
         }
+#ifndef CONFIG_WIN32
         err = local_set_cred_passthrough(fs_ctx, dirfd, name, credp);
         if (err == -1) {
             goto err_end;
         }
+#endif
     }
+#ifdef CONFIG_WIN32
+    int _fd = _open_osfhandle((intptr_t)fd, 0);
+    assert(_fd != -1);
+    err = _fd;
+    fs->fd = _fd;
+#else
     err = fd;
     fs->fd = fd;
+#endif
     goto out;
 
 err_end:
@@ -898,6 +1079,7 @@ static int local_symlink(FsContext *fs_ctx, const char *oldpath,
     if (fs_ctx->export_flags & V9FS_SM_MAPPED ||
         fs_ctx->export_flags & V9FS_SM_MAPPED_FILE) {
         QemuFd_t fd;
+        int _fd;
         ssize_t oldpath_size, write_size;
 
         fd = openat_file(dirfd, name, O_CREAT | O_EXCL | O_RDWR,
@@ -905,12 +1087,21 @@ static int local_symlink(FsContext *fs_ctx, const char *oldpath,
         if (qemu_fd_invalid(fd)) {
             goto out;
         }
+#ifdef CONFIG_WIN32
+        _fd = _open_osfhandle((intptr_t)fd, 0);
+#else
+        _fd = fd;
+#endif
         /* Write the oldpath (target) to the file. */
         oldpath_size = strlen(oldpath);
         do {
-            write_size = write(fd, (void *)oldpath, oldpath_size);
+            write_size = write(_fd, (void *)oldpath, oldpath_size);
         } while (write_size == -1 && errno == EINTR);
+#ifdef CONFIG_WIN32
+        close(_fd);
+#else
         close_preserve_errno(fd);
+#endif
 
         if (write_size != oldpath_size) {
             goto err_end;
@@ -928,6 +1119,21 @@ static int local_symlink(FsContext *fs_ctx, const char *oldpath,
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
@@ -945,6 +1151,7 @@ static int local_symlink(FsContext *fs_ctx, const char *oldpath,
                 err = 0;
             }
         }
+#endif
     }
     goto out;
 
@@ -958,6 +1165,11 @@ out:
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
@@ -1027,6 +1239,7 @@ out:
     g_free(oname);
     g_free(odirpath);
     return ret;
+#endif
 }
 
 static int local_truncate(FsContext *ctx, V9fsPath *fs_path, off_t size)
@@ -1038,7 +1251,13 @@ static int local_truncate(FsContext *ctx, V9fsPath *fs_path, off_t size)
     if (qemu_fd_invalid(fd)) {
         return -1;
     }
+#ifdef CONFIG_WIN32
+    int _fd = _open_osfhandle((intptr_t)fd, 0);
+    assert(_fd != -1);
+    ret = ftruncate(_fd, size);
+#else
     ret = ftruncate(fd, size);
+#endif
     close_preserve_errno(fd);
     return ret;
 }
@@ -1058,8 +1277,15 @@ static int local_chown(FsContext *fs_ctx, V9fsPath *fs_path, FsCred *credp)
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
@@ -1172,6 +1398,12 @@ out:
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
@@ -1185,12 +1417,14 @@ static int local_fsync(FsContext *ctx, int fid_type,
     } else {
         return fsync(fd);
     }
+#endif
 }
 
 static int local_statfs(FsContext *s, V9fsPath *fs_path, struct statfs *stbuf)
 {
-    QemuFd_t fd;
     int ret;
+#ifndef CONFIG_WIN32
+    QemuFd_t fd;
 
     fd = local_open_nofollow(s, fs_path->data, O_RDONLY, 0);
     if (qemu_fd_invalid(fd)) {
@@ -1198,39 +1432,65 @@ static int local_statfs(FsContext *s, V9fsPath *fs_path, struct statfs *stbuf)
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
@@ -1393,6 +1653,7 @@ static int local_unlinkat(FsContext *ctx, V9fsPath *dir,
     return ret;
 }
 
+#ifndef CONFIG_WIN32
 #ifdef FS_IOC_GETVERSION
 static int local_ioc_getversion(FsContext *ctx, V9fsPath *path,
                                 mode_t st_mode, uint64_t *st_gen)
@@ -1442,11 +1703,88 @@ static int local_ioc_getversion_init(FsContext *ctx, LocalData *data, Error **er
 #endif
     return 0;
 }
+#endif
 
-static int local_init(FsContext *ctx, Error **errp)
+#ifdef CONFIG_WIN32
+static int init_win32_root_directory(FsContext *ctx, LocalData *data,
+                                     Error **errp)
 {
-    LocalData *data = g_malloc(sizeof(*data));
+    HANDLE mountfd;
+    char *root_path;
+    DWORD SectorsPerCluster;
+    DWORD BytesPerSector;
+    DWORD NumberOfFreeClusters;
+    DWORD TotalNumberOfClusters;
+    char disk_root[4] = { 0 };
+
+    mountfd = CreateFile(ctx->fs_root, GENERIC_READ,
+                         FILE_SHARE_READ | FILE_SHARE_WRITE | FILE_SHARE_DELETE,
+                         NULL,
+                         OPEN_EXISTING, FILE_FLAG_BACKUP_SEMANTICS, NULL);
+    if (mountfd == INVALID_HANDLE_VALUE) {
+        error_setg_errno(errp, EINVAL, "cannot open %s", ctx->fs_root);
+        return -1;
+    }
+
+    if ((ctx->export_flags & V9FS_SM_MAPPED) != 0) {
+        wchar_t fs_name[MAX_PATH + 1] = {0};
+        wchar_t ntfs_name[5] = {'N', 'T', 'F', 'S'};
 
+        /* Get file system type name */
+        if (GetVolumeInformationByHandleW(mountfd, NULL, 0, NULL, NULL, NULL,
+                                          fs_name, MAX_PATH + 1) == 0) {
+            error_setg_errno(errp, EINVAL,
+                             "cannot get file system information");
+            CloseHandle(mountfd);
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
+            CloseHandle(mountfd);
+            error_setg_errno(errp, EINVAL, "require NTFS file system");
+            return -1;
+        }
+    }
+
+    root_path = get_full_path_win32(mountfd, NULL);
+    if (root_path == NULL) {
+        CloseHandle(mountfd);
+        error_setg_errno(errp, EINVAL, "cannot get full root path");
+        return -1;
+    }
+
+    /* copy the first 3 characters for the root directory */
+    memcpy(disk_root, root_path, 3);
+
+    if (GetDiskFreeSpace(disk_root, &SectorsPerCluster, &BytesPerSector,
+                         &NumberOfFreeClusters, &TotalNumberOfClusters) == 0) {
+        CloseHandle(mountfd);
+        error_setg_errno(errp, EINVAL, "cannot get file system block size");
+        return -1;
+    }
+
+    /*
+     * hold the root handle will prevent other one to delete or replace the
+     * root directory during runtime.
+     */
+    data->mountfd = mountfd;
+    data->root_path = root_path;
+    data->block_size = SectorsPerCluster * BytesPerSector;
+
+    return 0;
+}
+#endif
+
+static int local_init(FsContext *ctx, Error **errp)
+{
+    LocalData *data = g_malloc0(sizeof(*data));
+#ifndef CONFIG_WIN32
     data->mountfd = open(ctx->fs_root, O_DIRECTORY | O_RDONLY);
     if (qemu_fd_invalid(data->mountfd)) {
         error_setg_errno(errp, errno, "failed to open '%s'", ctx->fs_root);
@@ -1457,7 +1795,17 @@ static int local_init(FsContext *ctx, Error **errp)
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
@@ -1477,6 +1825,15 @@ static int local_init(FsContext *ctx, Error **errp)
     return 0;
 
 err:
+#ifdef CONFIG_WIN32
+    if (data->root_path != NULL) {
+        g_free(data->root_path);
+    }
+
+    if (data->mountfd != 0 && data->mountfd != INVALID_HANDLE_VALUE) {
+        CloseHandle(data->mountfd);
+    }
+#endif
     g_free(data);
     return -1;
 }
@@ -1488,8 +1845,17 @@ static void local_cleanup(FsContext *ctx)
     if (!data) {
         return;
     }
+#ifdef CONFIG_WIN32
+    if (data->root_path != NULL) {
+        g_free(data->root_path);
+    }
 
+    if (data->mountfd != 0 && data->mountfd != INVALID_HANDLE_VALUE) {
+        CloseHandle(data->mountfd);
+    }
+#else
     close(data->mountfd);
+#endif
     g_free(data);
 }
 
-- 
2.25.1


