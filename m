Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 398B8650A27
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 11:32:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7DHC-0003Fm-3e; Mon, 19 Dec 2022 05:21:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9352c01a6b=bin.meng@windriver.com>)
 id 1p7DGk-0003BP-0s
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 05:21:19 -0500
Received: from mx0a-0064b401.pphosted.com ([205.220.166.238])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9352c01a6b=bin.meng@windriver.com>)
 id 1p7DGh-0007S7-4z
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 05:21:13 -0500
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BJ9x60J003509; Mon, 19 Dec 2022 02:20:58 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=ZpyrFFZOAgdR/kh33Ho10x+oJuaLY7AI0lRUoLN5U7Q=;
 b=o81iWG83CYsijjC1nq6f6wPgQU9byZy/4SgpOSGagWSqjuWtnHLNa/cRnBm1Z16YhhW/
 Cn/9ChCDhcm8lf6O7b8kvfP5JW0d/BpygjTTdWG7ejleheeWjp+X+I50x6P9zLe2MWnG
 zV0ndPTFLLyvXsWDf9w/2PqjzQdH1U859rywgZUnc8ViPnuEnSNhegbIvzvnkkmFclf9
 /qRuvlDzw3hC9hw4x7oVnwQ/UIp2bWmjQV/oj8MnVP/3Ob+un0Mox5KajlEPjibZ9Lu7
 RnGuKqy9O1kTQuc/7zVW8qXJ/j1sYLvWUeSBLGJd8CNKyvmMhquZQG3q4d4BgTvvEKxi bw== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2100.outbound.protection.outlook.com [104.47.55.100])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mh9x8s77r-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Dec 2022 02:20:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oB+KIrg0bShBiifvfDXJ/rw9kfMGmlE6gyHG9qfevmEpsZUMdn/B10SK96+pO6OA3d/yxU2Uj2LG3y3cKIDd3tUmk+o+fxgNjZi/H3zSDhR903n9jD/JVV8YjOQ+5ZIsTFGiioW8OWxhLnexfmbnzTbOxQKwPIf7gHV3+UGWLZhzqhdPk1EkVgchOsI8GwsCk8D/hBCbXdD7/dHiLCH1fG1Fbe740obC9eE1Gs08Qc17iB04lcSe125WIOLU+ALecpGMWbpkxYVblG6pNrcGIP6E9RlK2KRIuPM+9jwR3KFMkMdgnhENq7Rz/UptnUcSDtQKEHTxhHBhLzXtj4Ft3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZpyrFFZOAgdR/kh33Ho10x+oJuaLY7AI0lRUoLN5U7Q=;
 b=E2+BMFrNt+OJ+CuT1oeSVo+cBerX2u/D/A7sCXsBW0KAJcP2XGVHQkyTmo368A6DtRC08MLSOGUeegzcE4ai7NOHktPcYdtlB18ssC2k/NARmV+MRUiZlLXbsUOhtJqWvHRYSEmPGT1p/gnlVb/0AptQW3vG/AhGOdX92nbeZUN57iCnS1IxL/PQYT3OwNumf0brod9/qESAMgTEQZ19pXwsSkxSKKzINtFOI7yWXEVyPJPRnleQgt3TnpopCS7vUv3TwVWjkUu4+WV0ZK92mdt1U+6NejrGpBhF+7gtcROxtuiavJhS9k1CDlUp6TNe6kMAKb0sjd1lF675W3e6gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5358.namprd11.prod.outlook.com (2603:10b6:5:395::7) by
 DM6PR11MB4691.namprd11.prod.outlook.com (2603:10b6:5:2a6::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5924.16; Mon, 19 Dec 2022 10:20:56 +0000
Received: from DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::8e5e:71da:1e29:bc15]) by DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::8e5e:71da:1e29:bc15%5]) with mapi id 15.20.5880.019; Mon, 19 Dec 2022
 10:20:56 +0000
From: Bin Meng <bin.meng@windriver.com>
To: Greg Kurz <groug@kaod.org>, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 qemu-devel@nongnu.org
Cc: Guohuai Shi <guohuai.shi@windriver.com>
Subject: [PATCH v3 06/17] hw/9pfs: Update the local fs driver to support
 Windows
Date: Mon, 19 Dec 2022 18:20:10 +0800
Message-Id: <20221219102022.2167736-7-bin.meng@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: 0cd1ceec-69dc-4898-7e26-08dae1aab778
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HT3HCsYBD86d9/0nv6Bd/GMrctMEpuofHbTsT3BaYm5PSmMa3RKrgSD/VVeH+nV+wplkMcM+HswTIFtBlbWhc6/99X0tY6OdTvIV1EwzoJXrMoj0VM2AQgTmj1YmSYqs88i8Elp8v4apvy1b7qVSsg3t9ghd+KCqKLrYNOb2d+6NSjMk2qcqnad+El0az0p5jtIS6j8dIPKq7mqFlJ6MHSdWGA4sReT9u1hh7c/FZjqacpakPxhYCiYCc2dZydUmjypBZU7uEMv3pVNMtInsQktcE69vYjEiIc0IKuRiim7gInB5bugriW7VXiZQAZTuU14mXK2NXhC8cIYclvh6QREqCb8OMwhRKuticLy/aYvIeGzOVtrTNH2C4leFZRmae5adC0KLr3BQBcwopQMaQ9SC2OnwaPgZMYiEM64zsgWHsnCvhNLVxaP83tkgX/boJrIu6rlask2IofUtqjvdPZvvMtWVbjWRjkOly3xazd8AtMMnGQJN5D8UgkDB3HVqngyB28XqsDRKfqe9qqMiEwYEYBa84XA2lRfGfa7cfSFzEH2dm5R1Dw6+bX+puOrwCnuzbqfdnx8XEj73qcgrbT78y/u+q3agRXgnCZ+xkEaKlnS1sHQ4JzR5e/jde/lpq77szovBR9yXMxhJUw1TKQFlmgwPneatzDpibIIu2YuIfbkHVtWo3ymy/SETr0Yb7zs73Ssv+sbV5LVfWJPBxQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5358.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39840400004)(136003)(376002)(346002)(366004)(396003)(451199015)(5660300002)(6666004)(107886003)(8936002)(30864003)(83380400001)(186003)(26005)(6512007)(44832011)(2906002)(15650500001)(41300700001)(36756003)(6486002)(110136005)(1076003)(38350700002)(52116002)(316002)(478600001)(4326008)(38100700002)(8676002)(66476007)(2616005)(6506007)(66946007)(66556008)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KCx9c3KLXm2h0b0HtDLIl2u32M2dhnfRIe3OOknclDFApTNJzTvio4ZMtlUd?=
 =?us-ascii?Q?nzFI1iO9F0EZ4r46ShX5ABOOq8FHkxcOm8rC3eOoNJXYTkiN9VzRJS2hyNzE?=
 =?us-ascii?Q?bU1V8wKupI8CjQ48c2u3EKDryiSlQQ2vi84gOYCfbOtHSNA4l/h18y7BWGLa?=
 =?us-ascii?Q?T+0iwj782JawEXZOswRuG8dPHXRd985P1fGn37agXHsQODB7VMgepgAKf0jZ?=
 =?us-ascii?Q?JeeKQgLCYE5/5yE8c3weiDXuixIERWSRNOuf2WsLMfK2ilrlTOCjrEaTf9Dg?=
 =?us-ascii?Q?vpOWkIVCV7oYIEQlx21wXLxkcPuD4cBX/AhP+o44xNDQ8EyVpW5Nktj8eti9?=
 =?us-ascii?Q?o15XOsm3ReajJBn08eTkEYznyW31A+UHai0yjk6Tbn9jU3rIu80sl1IRrVLm?=
 =?us-ascii?Q?6qk7NSVovLkfOnLcr6OWfh3rtLbRHztEsB9ZPJMG+A/87U8wJP6ELj4A7dKf?=
 =?us-ascii?Q?xGTCPMGjcVB/kckOWG/euJmDr0G3v6TGEPMXWjAOrUtdR4OKcSEv1jrzzvHi?=
 =?us-ascii?Q?lGKd4zP5fZ/fNMwv/FQZEsH9ssgceSNxfHUrgMncxZ/D0itxwdV4OJIXSSXw?=
 =?us-ascii?Q?mkCoGg/kyZNGFb8zhcWgZxIMru9c2C2SlxueEpXCCshe+mZAVnqhgnxTt/l8?=
 =?us-ascii?Q?2rCgjMPTAwVQu3AQv+2aIkoqCW+4dCDJhWvMLM1+q3oJ9WTaavn/+XGQMG//?=
 =?us-ascii?Q?sq8qTk8YMVwdc0uG5V1r0zYlgms1w3rM6wGgdWqPhWUUyThY/JcjURWWkAyc?=
 =?us-ascii?Q?PgkpewCXs4MtSaP2HQCu9dQUqYlvVu+wV20j/ZrzlvmFFUsJJn0HsVjNFDeY?=
 =?us-ascii?Q?N+iosN7rD5YHXmqpSbJxEvL7smA8bDqKLZVWnkWAQb900DbgdkIQho/1z2ZS?=
 =?us-ascii?Q?S68uutnOryd+8pV+hgmExnFlQ4MwRMb3kwXZQ5SnSCorqnD8dPEDgy/eUVaT?=
 =?us-ascii?Q?1Qwyv8pwg6l96k3sazqcYXJIPildG2zmbiWaLnUDfpO3XwMz79n3ofokJ9el?=
 =?us-ascii?Q?keusSc0C9XQdp8ronQfAg1EnwBEds8wrif11de5uKNN/b0x1DIAaHif4jb93?=
 =?us-ascii?Q?ZzIsoEyww7k7JUVxgWZIWQZZAZqjf6Vk54VYhAgD737jsnqe+Bw00xu/793l?=
 =?us-ascii?Q?kSDyP5au7ygqkZLbCeo4lchEP/f+5Fl3ErHaEOW7lGuIc6aNBx5/ewXXnaZd?=
 =?us-ascii?Q?bwrhHQZv4bHB2KhertkDa6rYYsriu7VLQ6n31qLRx5ykfptoJKTCO1Th/2ga?=
 =?us-ascii?Q?qHYIC46UcU3ZWEv0CTxui38aqwRxQdeRPHADC4bANglx3MNKJdECooZSWsjj?=
 =?us-ascii?Q?rYROf64SThGFxzFmTTq9Q0jRsTQOuVv/2RtDK988p7EcV7qhud0cmjkZtsQS?=
 =?us-ascii?Q?FENNnmFpiWNLQ78pZbvPwgmaZNNXFAcAFvD3hxhhDnEjBUYMLpAYaDw6O/QX?=
 =?us-ascii?Q?m4V9EX4GsDjrbdSY/33dDvxtjQu5RFEtGlLqmrDmgFY9V5M7CvfDAO8R6eWp?=
 =?us-ascii?Q?elWk+UWCgLfkWsLC4ml8viXTx/uJ2MMkStzlG9luhsU+dPCDCE6647creXjB?=
 =?us-ascii?Q?gbYv4uEQ+jKLQmuMSzqcFSMEhyQLDy/BR+HZXmGh?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cd1ceec-69dc-4898-7e26-08dae1aab778
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2022 10:20:56.8143 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U6of3tFEquY5k8DIcSBb/Ae1Ni0nlx265x/wIHH7utYpGU6C44lnU7IM6BwMzrB58v7x+B4wdpAdYkkK7zSK1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4691
X-Proofpoint-GUID: M9ia-YFAMwz5sg6WhPYDPr3rCx9pAryz
X-Proofpoint-ORIG-GUID: M9ia-YFAMwz5sg6WhPYDPr3rCx9pAryz
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

(no changes since v1)

 hw/9pfs/9p-local.h |   1 +
 hw/9pfs/9p-local.c | 350 +++++++++++++++++++++++++++++++++++++++++++--
 2 files changed, 343 insertions(+), 8 deletions(-)

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
index c95ede0dcb..d399c3439a 100644
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
@@ -472,6 +484,12 @@ static ssize_t local_readlink(FsContext *fs_ctx, V9fsPath *fs_path,
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
@@ -486,6 +504,7 @@ static ssize_t local_readlink(FsContext *fs_ctx, V9fsPath *fs_path,
     out:
         g_free(name);
         g_free(dirpath);
+#endif
     }
     return tsize;
 }
@@ -524,9 +543,41 @@ static int local_opendir(FsContext *ctx,
         return -1;
     }
 
+#ifdef CONFIG_WIN32
+    char *full_file_name;
+
+    /*
+     * Windows POSIX API does not provide opendir().
+     * MinGW emulate opendir() by itself.
+     * So at here, it should always close the dirfd returned from
+     * local_opendir_nofollow(), because the dirfd is not related to the MinGW's
+     * directory fd.
+     *
+     * dirfd returned from local_opendir_nofollow() is created by CreateFile()
+     * and coverted by _open_osfhandle(). MinGW's closedir() does not close it.
+     */
+    HANDLE hDir = (HANDLE)_get_osfhandle(dirfd);
+
+    full_file_name = get_full_path_win32(hDir, NULL);
+
+    close(dirfd);
+
+    if (full_file_name == NULL) {
+        return -1;
+    }
+    stream = opendir(full_file_name);
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
@@ -569,13 +620,17 @@ again:
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
@@ -583,7 +638,94 @@ again:
 
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
@@ -649,7 +791,14 @@ static int local_chmod(FsContext *fs_ctx, V9fsPath *fs_path, FsCred *credp)
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
 
@@ -693,6 +842,12 @@ static int local_mknod(FsContext *fs_ctx, V9fsPath *dir_path,
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
@@ -701,6 +856,7 @@ static int local_mknod(FsContext *fs_ctx, V9fsPath *dir_path,
         if (err == -1) {
             goto err_end;
         }
+#endif
     }
     goto out;
 
@@ -750,10 +906,12 @@ static int local_mkdir(FsContext *fs_ctx, V9fsPath *dir_path,
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
 
@@ -770,7 +928,12 @@ static int local_fstat(FsContext *fs_ctx, int fid_type,
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
@@ -822,10 +985,10 @@ static int local_open2(FsContext *fs_ctx, V9fsPath *dir_path, const char *name,
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
@@ -855,10 +1018,12 @@ static int local_open2(FsContext *fs_ctx, V9fsPath *dir_path, const char *name,
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
@@ -925,6 +1090,21 @@ static int local_symlink(FsContext *fs_ctx, const char *oldpath,
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
@@ -942,6 +1122,7 @@ static int local_symlink(FsContext *fs_ctx, const char *oldpath,
                 err = 0;
             }
         }
+#endif
     }
     goto out;
 
@@ -955,6 +1136,11 @@ out:
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
@@ -1024,6 +1210,7 @@ out:
     g_free(oname);
     g_free(odirpath);
     return ret;
+#endif
 }
 
 static int local_truncate(FsContext *ctx, V9fsPath *fs_path, off_t size)
@@ -1054,8 +1241,15 @@ static int local_chown(FsContext *fs_ctx, V9fsPath *fs_path, FsCred *credp)
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
@@ -1167,6 +1361,12 @@ out:
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
@@ -1180,11 +1380,14 @@ static int local_fsync(FsContext *ctx, int fid_type,
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
@@ -1192,39 +1395,65 @@ static int local_statfs(FsContext *s, V9fsPath *fs_path, struct statfs *stbuf)
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
@@ -1387,6 +1616,7 @@ static int local_unlinkat(FsContext *ctx, V9fsPath *dir,
     return ret;
 }
 
+#ifndef CONFIG_WIN32
 #ifdef FS_IOC_GETVERSION
 static int local_ioc_getversion(FsContext *ctx, V9fsPath *path,
                                 mode_t st_mode, uint64_t *st_gen)
@@ -1436,11 +1666,90 @@ static int local_ioc_getversion_init(FsContext *ctx, LocalData *data, Error **er
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
+
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
@@ -1451,7 +1760,17 @@ static int local_init(FsContext *ctx, Error **errp)
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
@@ -1471,6 +1790,16 @@ static int local_init(FsContext *ctx, Error **errp)
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
@@ -1483,6 +1812,11 @@ static void local_cleanup(FsContext *ctx)
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


