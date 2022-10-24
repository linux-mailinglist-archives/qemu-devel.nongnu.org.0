Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EABF1609A21
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 07:58:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ompYY-0004cc-Eg; Mon, 24 Oct 2022 00:59:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=72963f20b2=bin.meng@windriver.com>)
 id 1ompY4-00040k-SO
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 00:58:53 -0400
Received: from mx0b-0064b401.pphosted.com ([205.220.178.238])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=72963f20b2=bin.meng@windriver.com>)
 id 1ompY2-0006Av-6x
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 00:58:52 -0400
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 29O4wcqL017682; Mon, 24 Oct 2022 04:58:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=hDKyFjUO2d0ZQCKUFKsW1EMc1WJrDhhLACoty+3AVCQ=;
 b=K+ZZBh5WH2LO0EMv7X43XY2gbH8gqOrlX+nLmDIZ0u0biE8jduP63SFaY9UwtLlR9Rh3
 y8gaKsxwcM7eYLJUupJxB7Z/FpQBZEPVhCIGgmzPCCx0RRGWIbGHd1zWo1hSlvcxaYJO
 DtRnu8OFij8U+joJ30hwcdEkvhw6bW/iCh6G+82nURzfRk9efZiodMfuLaPDIVsRzW/r
 WsS5zpa+YMauh0Pf5ud/QWwsQLnfkanHl0Hj3f2q6ZJQdfnj00qbI68OCLKIyIp7aN2J
 +tCdtZ+C/wyyQyEhT7aKk4x6RBFJZfqBoi1iUAnSl/fHw/k3DmdKXc27alcxD063hYtx gw== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2105.outbound.protection.outlook.com [104.47.70.105])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kc5r2svrf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Oct 2022 04:58:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NzjqvY9rcZVojy5cgZfvsibiMaeD0hCfRN16t2Ojn6z5WvuK4/kV6Wvg8ZaKvgk3IRROtgmJloLw7VmlSLppQW4lSZw6+fRAjlYNDWJKtihGtzs5fPuahgOLJRxDXpyYxcxkqR51UY2e7K+ioVfUNwt6CoRsi8tUIZeofpep7HrGrNnOShhntO0u48xyMBN+bpzJYSjsP7Pfmah4u4xP396tJnpda9ULqAIY+pl8OIdPL9krpmRSIL4LOHDyUuN2o1Mz+IXzvCJ9RnPdIw0EhV2qME3c05P50d/uG2xkVT5qDFRxK41iNvcwPZ3jh+fiJQYIoJAPc2hILDuEZNoAFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hDKyFjUO2d0ZQCKUFKsW1EMc1WJrDhhLACoty+3AVCQ=;
 b=Iovz5uHiheIbO3ex4feYki7uDZ2HiqLXjqqEo+IQdljMtAF0yj3YuGzYSdFgxMgLo/TJPB+U8VB/+MtH3NR9FPGA5EZZiFL6IxsID6ogMPXo7vFSPNxaU/4cQXQxxd3cHmKaO2iH4ETgDaP/UuLJKwXadHpf8zjpxnEsf02CtvOfKFsc2MyGmVsmd4IWBAJDzxLk5ZMBVCtfVA85lQdAqm6jiLtJAQmclDx6iF8Ih0q7YDOGvbTTAMf/Rb78gZwRNOO441WyuRUf9xQ34R5Pojd4zJ3NHZYQezA+pF982K1UwyeC3QQL0jXhL59Lsxzw8fjdMKgtx2mNuOPPumBNuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5358.namprd11.prod.outlook.com (2603:10b6:5:395::7) by
 MW4PR11MB6911.namprd11.prod.outlook.com (2603:10b6:303:22d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.26; Mon, 24 Oct
 2022 04:58:36 +0000
Received: from DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::b051:27b7:c1c1:7cb9]) by DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::b051:27b7:c1c1:7cb9%4]) with mapi id 15.20.5746.025; Mon, 24 Oct 2022
 04:58:36 +0000
From: Bin Meng <bin.meng@windriver.com>
To: qemu-devel@nongnu.org
Cc: Guohuai Shi <guohuai.shi@windriver.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>
Subject: [PATCH 10/16] hw/9pfs: Update the local fs driver to support Windows
Date: Mon, 24 Oct 2022 12:57:53 +0800
Message-Id: <20221024045759.448014-11-bin.meng@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221024045759.448014-1-bin.meng@windriver.com>
References: <20221024045759.448014-1-bin.meng@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR03CA0021.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::26) To DM4PR11MB5358.namprd11.prod.outlook.com
 (2603:10b6:5:395::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5358:EE_|MW4PR11MB6911:EE_
X-MS-Office365-Filtering-Correlation-Id: 5049416d-5c93-464e-a6b7-08dab57c6894
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XUZnBJE0HFbAJbnNGv9zT4QrsU3S7n7qqYNUOaV6i9Xc6ucwaGoh/s5ycoJq/tdQn3pWAu9M0QiL0vNTG/Y43O3GKo20lTupTJ7/CI52gBLBqmX0jQmpYDHemkt+UkFvmcT+u2PJw3xPXdeOA52PsviCPgrOiDSSkflpgr3ZROdUT7tyRwjvDtanekzMlZROwSaI7oLtY/+C+kZf2+/ctpeJ8P614otOMvie+poucBEknVVd/mJ/PTyEGp9Q44B7HdiPOKKVaBXP30B3pWU2rGT5gYjISmXOWhKTRJjImzSPT+1Ftiy1I4VCBoL6u6Pf/5RhjmLNfUhRM7MITAlyEwUwBU7OD7vasHr7sjm6E+0zLorBV3rsDEXNMKTN1+7xFQcO9PQG/Cq8WyMyP5Mp0B9RPDcEB6JgrDqRRfHkQcBqgYWMmV4JoCckYXRWhIX1OXnIYbpJSOmmHhZd6gt+zpM+scOmucQzU+T5eM7ZYWoCkPbOzsYOc06q6UT+O0jBWoDtlKuBSeXyeU8lMjAmZ/9wDOh+lcAjal5NQB00cukKiyHwGeXl5dVifvp2v4NqcNnr/tomB/OLQrqj/qEM+rCvqxg08AyU1TQgypGeNHLJDpz1bpjuJ8SqnNfW3bjtp0iFPI99mq76KeHOZCwdx6xp2xg2HMEvT7PZviKJ1+Y43Rz2m8jrodEW5shHmcGG5Rx653dT2eAvBcXUbo0jQ80McPQVbE96vpzbQ0Qcl9xCrdBUAbUGrRsGF4GFkqD+t+StmHpH3cxxPr8n5K6GEA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5358.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(396003)(39850400004)(346002)(136003)(366004)(451199015)(6666004)(6506007)(2616005)(52116002)(6512007)(26005)(1076003)(186003)(83380400001)(44832011)(15650500001)(2906002)(30864003)(6916009)(54906003)(316002)(478600001)(6486002)(5660300002)(8936002)(41300700001)(66946007)(66556008)(4326008)(8676002)(66476007)(86362001)(36756003)(38100700002)(38350700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9g6VSRLbJ8ri7dpb5h7muTM6HrTE5Hvz5hPbs6tff1Zy6/ROsd6cj/VJk0RD?=
 =?us-ascii?Q?U5A4Fum2Cn4OrBQefNAiPK0WqQz266BDsGh48AbXaOQZQ/tJk1aeG2ouNGCP?=
 =?us-ascii?Q?95p+oj0IhEzi2d/eTtueXyAPQhpk3reAtBtMli7n2doQUIlCL290uDFoeUt9?=
 =?us-ascii?Q?QleIvZZ8KHjQwJBWYY/mSUCCrOWOGgzJ1KXAEef9rDACukl3IkWtwDcJu4OF?=
 =?us-ascii?Q?majwRGHWKVhdzBIEHSv4NP7SRh9ww/o7xSuyUZu1Iw/JoA/ejujFX1SR87yD?=
 =?us-ascii?Q?7DCjVQOh/4487kPyEyGwy0lFtXYE1hs8eBwawIecuF8TAmNKO1bP2mInBaiy?=
 =?us-ascii?Q?i+stweqyHWESg5NsE+noJMMlCqjuCs+j8+gnGjGWv+NZuxwNawxIy7fXMQg+?=
 =?us-ascii?Q?rzC1IpMl3ZrCIXM+YBGWyccylwPDsWSZkJWyulWDPCrqucBJihnHnDUFE2ud?=
 =?us-ascii?Q?sxYqFQ255PbIZTIXK8DTv9leRBRZbb9BNw+AlmuPHd0qxc4F2FZni0iFcBdm?=
 =?us-ascii?Q?rVC/Xh7NSVi87piKzxfNmCj7U1ZiPT7GyVpHSgZrNmDtAMTTnRBFikLcwsJH?=
 =?us-ascii?Q?c9IKuGUJuGqL+k9yarHcCOccGHFhHpeoBr9cEbAhnVZ5mITM+KIibHQwNs/z?=
 =?us-ascii?Q?Of/7IlChyxJVB7OmUJ/+qTpZqzL0Q8OEBBqaMDOBm2aL1IP/J1H+GAiWR/wf?=
 =?us-ascii?Q?y7c46Ki9yynWij2OJfdezsf9okTdbVjJpMlK+bHE99S4/e/Zkk1Z8tmYr1jV?=
 =?us-ascii?Q?pdIx+DRrkIyHbr8U9GkDdCmljb7bhLLkXGrdfzCMrQKaFKuBs73wPAz/B3Br?=
 =?us-ascii?Q?inhWV117VTpe+Qq8MbhvwZk+E90ity3nPeSDWr8/1TzBmTwppNA/mD/ozXn4?=
 =?us-ascii?Q?rKf9XClsliAz7yJ/0Q0IGmH2YUSOEIct+opNEar+AdVFC6RYffqew+i9v5IB?=
 =?us-ascii?Q?ify3sDWGXKGHVVliztGLL8Zx6Lw/q1u8z88ZHOk1QbH4A79p7XVmLILtWb44?=
 =?us-ascii?Q?bxeLlcPAx+CW+SDd9ZJ4JP+Vkkdr0NWDuicZ+39V2jNfIXFz9hMHLzyLYA4Q?=
 =?us-ascii?Q?fpkDUpUGnBBWsiD0NEO+TxAMuZo8fesQhGIuebqodsFFf0TIxrIVWPSUAKYr?=
 =?us-ascii?Q?cxFVRxCegnLD4d8J+6McAMzEvWRw/H3+NNuCvva+fj+tyoM3g/tsrdZYMqDt?=
 =?us-ascii?Q?MEqvX6gjyyJb4XwE2zpSc6dhHOVZ9itw87xxlYgjgC0x2O8P84WaCcH9T5H/?=
 =?us-ascii?Q?CXRtyKXI0aLxzYg/DXnqIKKvVvCDi8amUiEHMEQDPUiKy2VTXg1Cdwn14KM7?=
 =?us-ascii?Q?t1wcloyNT01jIRMxVnQGtCSh2vv93VBq2hNgcMPDJD8XbedU3d6JCw6rWbZ7?=
 =?us-ascii?Q?ZgX3FCfJ72osK2D/Jc0Elv7o+uJlMVtmKqBHJAORbx20ZGR1JpvT3mOZuKOQ?=
 =?us-ascii?Q?zJjGPAdkb5OGMT7EgUYHZ6QNF5UdPnE1TQqvL4xTMS6yIvc0K41/ajQ0Xbg5?=
 =?us-ascii?Q?7dhtgOXPZ7DkCDAbC9n9zO3NFgOf7I9PE7G4JPoRNeyrxZ/wACpZ5HHthzwl?=
 =?us-ascii?Q?LxelJnvu9RgOiF6oETTE++YFX8A8NDr6WRgn81yMhJqgS3idMyv3+6w7JTVi?=
 =?us-ascii?Q?qQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5049416d-5c93-464e-a6b7-08dab57c6894
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2022 04:58:36.2740 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5i+pJE9RFtR40vjyw2uoUDmHlU/93Npir8plmZ/l/YpncGpkjtadekZItuaYBWs/qbmLf3sUW83wVsM0gzIcYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6911
X-Proofpoint-ORIG-GUID: Gc0zWYZd9J1j4w4cSrzFCclt6C84OV2i
X-Proofpoint-GUID: Gc0zWYZd9J1j4w4cSrzFCclt6C84OV2i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-23_02,2022-10-21_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 mlxlogscore=882 mlxscore=0
 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0 clxscore=1015
 spamscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2209130000 definitions=main-2210240031
Received-SPF: pass client-ip=205.220.178.238;
 envelope-from=prvs=72963f20b2=bin.meng@windriver.com;
 helo=mx0b-0064b401.pphosted.com
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_OTHER_BAD_TLD=1.997, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Guohuai Shi <guohuai.shi@windriver.com>

At present there is no Windows support for 9p file system.
This commit adds initial Windows support for 9p file system.
'local' file system backend driver is supported on Windows,
including open, read, write, close, rename, remove, etc.

All security models are supported. The mapped (mapped-xattr)
security model is implemented using NTFS Alternate Data Stream
(ADS) so the 9p export path shall be on an NTFS partition.

Symbolic link and hard link are not supported because Windows
NTFS does not fully support them with POSIX compatability.
inode remap is always enabled because Windows file system does
not have inode number.

mknod() is not supported because Windows does not support it.
chown() and chmod() are not supported when 9pfs is configured
with security mode to 'none' or 'passthrough' because Windows
host does not support such type request.

Signed-off-by: Guohuai Shi <guohuai.shi@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 hw/9pfs/9p-local.c | 336 +++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 327 insertions(+), 9 deletions(-)

diff --git a/hw/9pfs/9p-local.c b/hw/9pfs/9p-local.c
index d0d6d93549..b5680d046a 100644
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
@@ -90,10 +94,12 @@ P9_FILE_ID local_open_nofollow(FsContext *fs_ctx, const char *path, int flags,
     return fd;
 }
 
+#ifndef CONFIG_WIN32
 P9_FILE_ID local_opendir_nofollow(FsContext *fs_ctx, const char *path)
 {
     return local_open_nofollow(fs_ctx, path, O_DIRECTORY | O_RDONLY, 0);
 }
+#endif
 
 static void renameat_preserve_errno(P9_FILE_ID odirfd, const char *opath,
                                     P9_FILE_ID ndirfd, const char *npath)
@@ -135,10 +141,20 @@ static FILE *local_fopenat(P9_FILE_ID dirfd, const char *name, const char *mode)
     if (fd == P9_INVALID_FILE) {
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
 
@@ -238,7 +254,7 @@ static int local_set_mapped_file_attrat(P9_FILE_ID dirfd, const char *name,
     int ret;
     char buf[ATTR_MAX];
     int uid = -1, gid = -1, mode = -1, rdev = -1;
-    P9_FILE_ID map_dirfd = P9_INVALID_FILE, map_fd;
+    P9_FILE_ID map_dirfd = P9_INVALID_FILE;
     bool is_root = !strcmp(name, ".");
 
     if (is_root) {
@@ -302,10 +318,12 @@ update_map_file:
         return -1;
     }
 
-    map_fd = fileno(fp);
+#ifndef CONFIG_WIN32
+    P9_FILE_ID map_fd = fileno(fp);
     assert(map_fd != P9_INVALID_FILE);
     ret = fchmod(map_fd, 0600);
     assert(ret == 0);
+#endif
 
     if (credp->fc_uid != -1) {
         uid = credp->fc_uid;
@@ -337,6 +355,7 @@ update_map_file:
     return 0;
 }
 
+#ifndef CONFIG_WIN32
 static int fchmodat_nofollow(P9_FILE_ID dirfd, const char *name, mode_t mode)
 {
     struct stat stbuf;
@@ -399,6 +418,7 @@ static int fchmodat_nofollow(P9_FILE_ID dirfd, const char *name, mode_t mode)
     close_preserve_errno(fd);
     return ret;
 }
+#endif
 
 static int local_set_xattrat(P9_FILE_ID dirfd, const char *path, FsCred *credp)
 {
@@ -439,6 +459,7 @@ static int local_set_xattrat(P9_FILE_ID dirfd, const char *path, FsCred *credp)
     return 0;
 }
 
+#ifndef CONFIG_WIN32
 static int local_set_cred_passthrough(FsContext *fs_ctx, P9_FILE_ID dirfd,
                                       const char *name, FsCred *credp)
 {
@@ -455,10 +476,15 @@ static int local_set_cred_passthrough(FsContext *fs_ctx, P9_FILE_ID dirfd,
 
     return fchmodat_nofollow(dirfd, name, credp->fc_mode & 07777);
 }
+#endif
 
 static ssize_t local_readlink(FsContext *fs_ctx, V9fsPath *fs_path,
                               char *buf, size_t bufsz)
 {
+#ifdef CONFIG_WIN32
+    errno = ENOTSUP;
+    return -1;
+#else
     ssize_t tsize = -1;
 
     if ((fs_ctx->export_flags & V9FS_SM_MAPPED) ||
@@ -491,6 +517,7 @@ static ssize_t local_readlink(FsContext *fs_ctx, V9fsPath *fs_path,
         g_free(dirpath);
     }
     return tsize;
+#endif
 }
 
 static int local_close(FsContext *ctx, V9fsFidOpenState *fs)
@@ -512,7 +539,13 @@ static int local_open(FsContext *ctx, V9fsPath *fs_path,
     if (fd == P9_INVALID_FILE) {
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
 
@@ -527,9 +560,24 @@ static int local_opendir(FsContext *ctx,
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
@@ -572,13 +620,17 @@ again:
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
@@ -586,7 +638,94 @@ again:
 
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
@@ -652,7 +791,12 @@ static int local_chmod(FsContext *fs_ctx, V9fsPath *fs_path, FsCred *credp)
         ret = local_set_mapped_file_attrat(dirfd, name, credp);
     } else if (fs_ctx->export_flags & V9FS_SM_PASSTHROUGH ||
                fs_ctx->export_flags & V9FS_SM_NONE) {
+#ifdef CONFIG_WIN32
+        errno = ENOTSUP;
+        ret = -1;
+#else
         ret = fchmodat_nofollow(dirfd, name, credp->fc_mode);
+#endif
     }
     close_preserve_errno(dirfd);
 
@@ -665,6 +809,10 @@ out:
 static int local_mknod(FsContext *fs_ctx, V9fsPath *dir_path,
                        const char *name, FsCred *credp)
 {
+#ifdef CONFIG_WIN32
+    errno = ENOTSUP;
+    return -1;
+#else
     int err = -1;
     P9_FILE_ID dirfd;
 
@@ -712,6 +860,7 @@ err_end:
 out:
     close_preserve_errno(dirfd);
     return err;
+#endif
 }
 
 static int local_mkdir(FsContext *fs_ctx, V9fsPath *dir_path,
@@ -753,10 +902,12 @@ static int local_mkdir(FsContext *fs_ctx, V9fsPath *dir_path,
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
 
@@ -773,7 +924,12 @@ static int local_fstat(FsContext *fs_ctx, int fid_type,
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
@@ -825,10 +981,10 @@ static int local_open2(FsContext *fs_ctx, V9fsPath *dir_path, const char *name,
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
     if (dirfd == P9_INVALID_FILE) {
@@ -858,13 +1014,22 @@ static int local_open2(FsContext *fs_ctx, V9fsPath *dir_path, const char *name,
         if (fd == P9_INVALID_FILE) {
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
@@ -880,6 +1045,18 @@ out:
 static int local_symlink(FsContext *fs_ctx, const char *oldpath,
                          V9fsPath *dir_path, const char *name, FsCred *credp)
 {
+#ifdef CONFIG_WIN32
+    /*
+     * Windows symbolic link requires administrator privilage.
+     * And Windows does not provide any interface like readlink().
+     * All symbolic links on Windows are always absolute paths.
+     * It's not 100% compatible with POSIX symbolic link.
+     *
+     * With above reasons, symbolic link feature is disabled on Windows host.
+     */
+    errno = ENOTSUP;
+    return -1;
+#else
     int err = -1;
     P9_FILE_ID dirfd;
 
@@ -953,11 +1130,16 @@ err_end:
 out:
     close_preserve_errno(dirfd);
     return err;
+#endif
 }
 
 static int local_link(FsContext *ctx, V9fsPath *oldpath,
                       V9fsPath *dirpath, const char *name)
 {
+#ifdef CONFIG_WIN32
+    errno = ENOTSUP;
+    return -1;
+#else
     char *odirpath = g_path_get_dirname(oldpath->data);
     char *oname = g_path_get_basename(oldpath->data);
     int ret = -1;
@@ -1027,6 +1209,7 @@ out:
     g_free(oname);
     g_free(odirpath);
     return ret;
+#endif
 }
 
 static int local_truncate(FsContext *ctx, V9fsPath *fs_path, off_t size)
@@ -1038,7 +1221,13 @@ static int local_truncate(FsContext *ctx, V9fsPath *fs_path, off_t size)
     if (fd == P9_INVALID_FILE) {
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
@@ -1058,8 +1247,13 @@ static int local_chown(FsContext *fs_ctx, V9fsPath *fs_path, FsCred *credp)
     if ((credp->fc_uid == -1 && credp->fc_gid == -1) ||
         (fs_ctx->export_flags & V9FS_SM_PASSTHROUGH) ||
         (fs_ctx->export_flags & V9FS_SM_NONE)) {
+#ifdef CONFIG_WIN32
+        errno = ENOTSUP;
+        ret = -1;
+#else
         ret = fchownat(dirfd, name, credp->fc_uid, credp->fc_gid,
                        AT_SYMLINK_NOFOLLOW);
+#endif
     } else if (fs_ctx->export_flags & V9FS_SM_MAPPED) {
         ret = local_set_xattrat(dirfd, name, credp);
     } else if (fs_ctx->export_flags & V9FS_SM_MAPPED_FILE) {
@@ -1172,6 +1366,12 @@ out:
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
@@ -1185,12 +1385,14 @@ static int local_fsync(FsContext *ctx, int fid_type,
     } else {
         return fsync(fd);
     }
+#endif
 }
 
 static int local_statfs(FsContext *s, V9fsPath *fs_path, struct statfs *stbuf)
 {
-    P9_FILE_ID fd;
     int ret;
+#ifndef CONFIG_WIN32
+    P9_FILE_ID fd;
 
     fd = local_open_nofollow(s, fs_path->data, O_RDONLY, 0);
     if (fd == P9_INVALID_FILE) {
@@ -1198,39 +1400,65 @@ static int local_statfs(FsContext *s, V9fsPath *fs_path, struct statfs *stbuf)
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
@@ -1393,6 +1621,7 @@ static int local_unlinkat(FsContext *ctx, V9fsPath *dir,
     return ret;
 }
 
+#ifndef CONFIG_WIN32
 #ifdef FS_IOC_GETVERSION
 static int local_ioc_getversion(FsContext *ctx, V9fsPath *path,
                                 mode_t st_mode, uint64_t *st_gen)
@@ -1442,11 +1671,72 @@ static int local_ioc_getversion_init(FsContext *ctx, LocalData *data, Error **er
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
+
+        /* Get file system type name */
+        if (GetVolumeInformationByHandleW(mountfd, NULL, 0, NULL, NULL, NULL,
+                                          fs_name, MAX_PATH + 1) == 0) {
+            error_setg_errno(errp, EINVAL,
+                             "cannot get file system information");
+            CloseHandle(mountfd);
+            return -1;
+        }
 
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
+    /*
+     * hold the root handle will prevent other one to delete or replace the
+     * root directory during runtime.
+     */
+    data->mountfd = mountfd;
+    data->root_path = root_path;
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
     if (data->mountfd == -1) {
         error_setg_errno(errp, errno, "failed to open '%s'", ctx->fs_root);
@@ -1457,7 +1747,17 @@ static int local_init(FsContext *ctx, Error **errp)
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
@@ -1477,6 +1777,15 @@ static int local_init(FsContext *ctx, Error **errp)
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
@@ -1488,8 +1797,17 @@ static void local_cleanup(FsContext *ctx)
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


