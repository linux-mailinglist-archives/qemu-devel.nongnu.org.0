Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D54F69C85E
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 11:15:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU36d-0008Af-8J; Mon, 20 Feb 2023 05:09:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1415163841=bin.meng@windriver.com>)
 id 1pU36a-00089M-TJ
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 05:09:08 -0500
Received: from mx0a-0064b401.pphosted.com ([205.220.166.238])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1415163841=bin.meng@windriver.com>)
 id 1pU36X-00009T-PJ
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 05:09:08 -0500
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31K9f823020143; Mon, 20 Feb 2023 02:08:54 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=iDJXqj4XOxb/nnwKqkF3Hh2hAAii9wCHHUvqDsYvMv8=;
 b=Mug4TykZWyiMfhGvHrcxIzpeGR+sfm1YWlofTjtXgBU8ZNA3lgPO39PWW4s/2EcA6BEq
 lxaSvrsPsfGZZvn171BiLJeap54mLUldjwEdNf/10duuRVDG2tUqmKDTcUiy3JLcFHLF
 jHGlGlmXNFzPgISgrkU6lMLNMT3jtIxsMl5gA1t3ZZ8GItrDlMwpB7sf77Zp1NA6ZXuy
 76jBb7zvm2nAgf+lF8FWu8LFQs80Yzmn0gwzlI4sQdSuvYYloJ86cFx37cqig+svjsSJ
 U3V2CmRgp+1TtqMIkpdx5SBPNzz853XlMq6Jm79HGJrkvshz6Kqnu+tKl3P/yCdmOcjV aA== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2170.outbound.protection.outlook.com [104.47.59.170])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nty2psac0-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Feb 2023 02:08:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V+02+tTH+bmzZ2BRlnYDjZVTfHWfQKb+5geWBhLO5bvZDf5Em3GbUnpoKuGl5790ypz1nXPCQvKMbtTdjalA3eSaJHPGKUb22rQ5KXG4TL6LMvJ0lkMnKnuBaisJSAQF2SgBbL7pjxa7gszEIROGlXbQBA/CN6/KHXxNZnZLO4vsUtWXcXiZHVcxM/cv1ew+yIEvQLwRJe9hK2uDYnjKMra0OwIft71fqup1oFQlCqSLtWPGYJr8+HyacW9YKm3IATF0xELwJgXXioHmqGV8Vb4aGEOaYPoKsLFiXtdRGHwze25Og/PV2v+UXoK/VkMGfiIjhA/3rI/7bxdo62GkXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iDJXqj4XOxb/nnwKqkF3Hh2hAAii9wCHHUvqDsYvMv8=;
 b=ARbJHEzs4rW4g+ProQQqZToprxJy4tR5Rg2cHoAomH83m+ZLtX84vGudMHeQ7z+c4rGnb+Yx53LqBZpLZAM1hXoQepQOXVLD/6mxVGPJAkrJ7sjq8pbLUj0BypNMHJHch8dXYHp9KH/xXGeq+oPAchueENRzp9YxxkhDLwbPkAiC90jpPKPWLquR3VvK3s2ElBk6yITp2MVW4OEjtKETsEqUOuXGXXieyEjAGWpSQ/+JiR4nlczlUz3bM/sId4ntNJtli43rLCwMHDONQWWdaA3y7MUvhvhgb1e1+lzfrLBEFisI8GDfTzs79qm3YSa5oGZr5Zx9J/TZW+H/lC6ntA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5358.namprd11.prod.outlook.com (2603:10b6:5:395::7) by
 IA0PR11MB7912.namprd11.prod.outlook.com (2603:10b6:208:3dd::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.20; Mon, 20 Feb
 2023 10:08:51 +0000
Received: from DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::6c5d:5b92:1599:ce9]) by DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::6c5d:5b92:1599:ce9%4]) with mapi id 15.20.6111.019; Mon, 20 Feb 2023
 10:08:51 +0000
From: Bin Meng <bin.meng@windriver.com>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 qemu-devel@nongnu.org
Cc: Guohuai Shi <guohuai.shi@windriver.com>
Subject: [PATCH v5 11/16] hw/9pfs: Add Linux error number definition
Date: Mon, 20 Feb 2023 18:08:10 +0800
Message-Id: <20230220100815.1624266-12-bin.meng@windriver.com>
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
X-MS-TrafficTypeDiagnostic: DM4PR11MB5358:EE_|IA0PR11MB7912:EE_
X-MS-Office365-Filtering-Correlation-Id: 99012594-2b19-4e1f-9e6d-08db132a76f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0ztzR8sKgA0w0qR0bjVy8nVDafuc1Y3H+NxB9QqknnzxmL0mXJG4VbY1lCEN9qVDPyLP7Ky7jgvvON4lk5BSjskBTGM42fyT+jptxwqK/36p7BDf6Tgff9EENzoCbmAdNwXdQtFbnznsLfcUxJatgTSjpLEnFpvADKeCDlsirxS4AODSG/IZIbPKq7PUX7VU/yFY9kHuhEhy5qsL2TJb5alt5MExGCZeTl+ix2J5ReAP7sRyfNKrYisvWOVw1YsQquM9Pbdef/pfvb17nTnsudRZ3X38QD8gxQbQj+q+JJOrbBGFDiMT98GwZFnuqANoimBKwauWzopbbf9S8b41hms8X2GNmx4oYZmT0otg1xZkybGGAREXfoQcXWeHXO7n4ghQV5yUhEtUl1sMLGUN1WkvqIPQOtEZNEsYneOEuZOKneesLFIj/XxLhcWPq8qCNOAEDsTv1jsq+9Iw+btNZVX9yk73dXL13XenqPApiPKtDODR0QaxCa1FlN5CJ9mW0RINoMzgEfZVcga3VeqNm3TG1Beh1L2bSryir8MBnOiGkE8S35CYqrn9TuEbMefgHftAlkG6YW9RMINHIkVFS8WnJB3HsLANNDD2Cy9r/ZOUvaPO8NDwjz0GiGmfKqky2CvHDhbNjEy1yyLkWepa39srMdDX5Gr5NXPpTxTEhccP6ozvVb568adQpI2I14QE
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5358.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(376002)(396003)(39850400004)(366004)(136003)(451199018)(8936002)(83380400001)(5660300002)(41300700001)(86362001)(44832011)(2906002)(4326008)(52116002)(6486002)(6666004)(186003)(26005)(6512007)(1076003)(107886003)(66556008)(8676002)(66946007)(66476007)(316002)(478600001)(2616005)(110136005)(38350700002)(36756003)(38100700002)(6506007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iUS8LsvmILp2XaFwe/N392a1FKtlAClRVHQ8xszxbaJohTayUGeFs+7t8jum?=
 =?us-ascii?Q?QEcnU21Rufecy4A8b+VHHV8b423NjesrcPKxUB0zAX15TzGhddv2qzoJJFLn?=
 =?us-ascii?Q?VEkhnTGC3B7hpO4BOXer9OEwcWEfZ6PyaxNiowTUwnHA4bdn4BMRKsvvqfhX?=
 =?us-ascii?Q?/i1iuVx64qoY8anFy9R/YKKPzkdPEZuSrIgs5p/kmH2NAoWbrKDU2KFSR4m1?=
 =?us-ascii?Q?mB0r8Rz+AamgWkQcw46hPlp6GlDkGl/Th0b1Pqk9eOEmitdsIIiUrmc97q8M?=
 =?us-ascii?Q?kDHJxylWFzakRvejTjtluh1Kf/+yD3kylWKxlXSTmVB6FopHos2Bek/2xVkn?=
 =?us-ascii?Q?SL1StlncDbqkd2s1NrGJWOBK/v2tZ+meW2GTKJxubSfy8i9fXQrNgMzUVmHI?=
 =?us-ascii?Q?cl4HoZ8sAueudsW8iYgpnwxIqgfUIiA92Ci7GMWRpGolNMZ4F3rWsVTPJXXf?=
 =?us-ascii?Q?VHq/07JqRwgiXk/NpMUsw2OwIcM1syP8rLepQizdQjsKaWwmQ+LH14mOfSnU?=
 =?us-ascii?Q?XXtWu5BKxvH32hCTLmwPlbuDmVPlCiRQrRG0uaL8lfU1MZnMXE/V30fZaU2k?=
 =?us-ascii?Q?OttZ9BSj/k8kemC9yxJM9g7/FaYETHPzRJovtQSUUjYzSXYQQ7S+A71paN73?=
 =?us-ascii?Q?DDgZpgjLiq6mhrz3jiG88oowvsHfDx8xIwwwnWAx4Cl0MrZu0yCtoEUMjMWc?=
 =?us-ascii?Q?96jJPDm8Jw2ccP5iEQYF5jfj7D1HqBpyO+5JbpFUWmQwx/BMG5HM+ufkZ0Y5?=
 =?us-ascii?Q?TuO1H9SsebL0qEJqd8C3J2eAZ2sOvJuor+fI//EQ9tIzDS8pgE9biqrp5atp?=
 =?us-ascii?Q?1Dry8O2TkoTQfHnzT+nHmoKbIqNyRoyW8y6bCa8BkCA6fsNFqPzrERVLHf/j?=
 =?us-ascii?Q?CxF28gEs4wRAfmmPpbc3Z9VnZLY7W0LDs82lC3U45AWuLJOztmD2eh+P1cMC?=
 =?us-ascii?Q?JSazBTJwBkfHXs7CpNhZkv/90qncKa7UGPHCKxeMXLRezmspN49k1btM86D9?=
 =?us-ascii?Q?8Ywe0sflmBQccGPxglr8nRDE+dWpT8xMhh8Iypk2vUlCRLtfZPMG/fGaLBws?=
 =?us-ascii?Q?4CZjPU76r4uKfj2CUVMCtzMlRuDsBsBIO3iRWsfvoVLT6O7f42OfD+PU5Dt0?=
 =?us-ascii?Q?bsTs6Mg7+zJH5TnC/sx3k0RGKu/aCBnGTRGptt/HS9PACOPdpB4I4PrURuFv?=
 =?us-ascii?Q?TDwcMQpnk2r8Hpq5ODgitJssuxjmccfCD0oLb2adJuDD3KtMscRWcRTcL0aW?=
 =?us-ascii?Q?ozQf7uOwB09zSvEGiWvyN3fl8L8i2SC5hKRK8OQjQxCBBwKNQCMulz00efO5?=
 =?us-ascii?Q?rcl37aVnfpqDntiJ+kqXlsuS3phWbTHgR/2S62Wa3El1RdDLRbqRZGWZ+r0R?=
 =?us-ascii?Q?LAttxZlFOUwjpy/sGMgd+vKAo6rw0uKm72j3jyCHBRYa61k6JjrqfRxJIwTy?=
 =?us-ascii?Q?gdqwd/QByoPPdlf6BmwDK0/4hYN5482uetpHzptn3yOf5ZXVdD4ZaMWJAqbi?=
 =?us-ascii?Q?g6Fw32+Jq0JfYOxulJ6TWJ8sAUYEfYtuyTaIZVkuY+lkWOsrF5PrV+Auargs?=
 =?us-ascii?Q?Ne6a5D743jnGID/G85HKpKPRW65leFdVq9OraicWCwoPJYTYGPuNB+lmBxeJ?=
 =?us-ascii?Q?Yw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99012594-2b19-4e1f-9e6d-08db132a76f9
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2023 10:08:51.1507 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vLwHcSIIcESCTHqVlJBWq1ImhoenQju2BRhyzI5NOp63mFakcCMiCTSTfuOemehhlEdoLD34r8irBrdKSJKAlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7912
X-Proofpoint-ORIG-GUID: DGQB9zG24XLmjTv-I6Wwu6ADfWGanSf-
X-Proofpoint-GUID: DGQB9zG24XLmjTv-I6Wwu6ADfWGanSf-
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

When using 9p2000.L protocol, the errno should use the Linux errno.
Currently magic numbers with comments are used. Replace these with
macros for future expansion.

Signed-off-by: Guohuai Shi <guohuai.shi@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 hw/9pfs/9p-linux-errno.h | 151 +++++++++++++++++++++++++++++++++++++++
 hw/9pfs/9p-util.h        |  24 +++----
 2 files changed, 162 insertions(+), 13 deletions(-)
 create mode 100644 hw/9pfs/9p-linux-errno.h

diff --git a/hw/9pfs/9p-linux-errno.h b/hw/9pfs/9p-linux-errno.h
new file mode 100644
index 0000000000..56c37fa293
--- /dev/null
+++ b/hw/9pfs/9p-linux-errno.h
@@ -0,0 +1,151 @@
+/*
+ * 9p Linux errno translation definition
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include <errno.h>
+
+#ifndef QEMU_9P_LINUX_ERRNO_H
+#define QEMU_9P_LINUX_ERRNO_H
+
+/*
+ * This file contains the Linux errno definitions to translate errnos set by
+ * the 9P server (running on non-Linux hosts) to a corresponding errno value.
+ *
+ * This list should be periodically reviewed and updated; particularly for
+ * errnos that might be set as a result of a file system operation.
+ */
+
+#define L_EPERM             1   /* Operation not permitted */
+#define L_ENOENT            2   /* No such file or directory */
+#define L_ESRCH             3   /* No such process */
+#define L_EINTR             4   /* Interrupted system call */
+#define L_EIO               5   /* I/O error */
+#define L_ENXIO             6   /* No such device or address */
+#define L_E2BIG             7   /* Argument list too long */
+#define L_ENOEXEC           8   /* Exec format error */
+#define L_EBADF             9   /* Bad file number */
+#define L_ECHILD            10  /* No child processes */
+#define L_EAGAIN            11  /* Try again */
+#define L_ENOMEM            12  /* Out of memory */
+#define L_EACCES            13  /* Permission denied */
+#define L_EFAULT            14  /* Bad address */
+#define L_ENOTBLK           15  /* Block device required */
+#define L_EBUSY             16  /* Device or resource busy */
+#define L_EEXIST            17  /* File exists */
+#define L_EXDEV             18  /* Cross-device link */
+#define L_ENODEV            19  /* No such device */
+#define L_ENOTDIR           20  /* Not a directory */
+#define L_EISDIR            21  /* Is a directory */
+#define L_EINVAL            22  /* Invalid argument */
+#define L_ENFILE            23  /* File table overflow */
+#define L_EMFILE            24  /* Too many open files */
+#define L_ENOTTY            25  /* Not a typewriter */
+#define L_ETXTBSY           26  /* Text file busy */
+#define L_EFBIG             27  /* File too large */
+#define L_ENOSPC            28  /* No space left on device */
+#define L_ESPIPE            29  /* Illegal seek */
+#define L_EROFS             30  /* Read-only file system */
+#define L_EMLINK            31  /* Too many links */
+#define L_EPIPE             32  /* Broken pipe */
+#define L_EDOM              33  /* Math argument out of domain of func */
+#define L_ERANGE            34  /* Math result not representable */
+#define L_EDEADLK           35  /* Resource deadlock would occur */
+#define L_ENAMETOOLONG      36  /* File name too long */
+#define L_ENOLCK            37  /* No record locks available */
+#define L_ENOSYS            38  /* Function not implemented */
+#define L_ENOTEMPTY         39  /* Directory not empty */
+#define L_ELOOP             40  /* Too many symbolic links encountered */
+#define L_ENOMSG            42  /* No message of desired type */
+#define L_EIDRM             43  /* Identifier removed */
+#define L_ECHRNG            44  /* Channel number out of range */
+#define L_EL2NSYNC          45  /* Level 2 not synchronized */
+#define L_EL3HLT            46  /* Level 3 halted */
+#define L_EL3RST            47  /* Level 3 reset */
+#define L_ELNRNG            48  /* Link number out of range */
+#define L_EUNATCH           49  /* Protocol driver not attached */
+#define L_ENOCSI            50  /* No CSI structure available */
+#define L_EL2HLT            51  /* Level 2 halted */
+#define L_EBADE             52  /* Invalid exchange */
+#define L_EBADR             53  /* Invalid request descriptor */
+#define L_EXFULL            54  /* Exchange full */
+#define L_ENOANO            55  /* No anode */
+#define L_EBADRQC           56  /* Invalid request code */
+#define L_EBADSLT           57  /* Invalid slot */
+#define L_EBFONT            58  /* Bad font file format */
+#define L_ENOSTR            59  /* Device not a stream */
+#define L_ENODATA           61  /* No data available */
+#define L_ETIME             62  /* Timer expired */
+#define L_ENOSR             63  /* Out of streams resources */
+#define L_ENONET            64  /* Machine is not on the network */
+#define L_ENOPKG            65  /* Package not installed */
+#define L_EREMOTE           66  /* Object is remote */
+#define L_ENOLINK           67  /* Link has been severed */
+#define L_EADV              68  /* Advertise error */
+#define L_ESRMNT            69  /* Srmount error */
+#define L_ECOMM             70  /* Communication error on send */
+#define L_EPROTO            71  /* Protocol error */
+#define L_EMULTIHOP         72  /* Multihop attempted */
+#define L_EDOTDOT           73  /* RFS specific error */
+#define L_EBADMSG           74  /* Not a data message */
+#define L_EOVERFLOW         75  /* Value too large for defined data type */
+#define L_ENOTUNIQ          76  /* Name not unique on network */
+#define L_EBADFD            77  /* File descriptor in bad state */
+#define L_EREMCHG           78  /* Remote address changed */
+#define L_ELIBACC           79  /* Can not access a needed shared library */
+#define L_ELIBBAD           80  /* Accessing a corrupted shared library */
+#define L_ELIBSCN           81  /* .lib section in a.out corrupted */
+#define L_ELIBMAX           82  /* Attempting to link in too many shared libs */
+#define L_ELIBEXEC          83  /* Cannot exec a shared library directly */
+#define L_EILSEQ            84  /* Illegal byte sequence */
+#define L_ERESTART          85  /* Interrupted system call should be restarted */
+#define L_ESTRPIPE          86  /* Streams pipe error */
+#define L_EUSERS            87  /* Too many users */
+#define L_ENOTSOCK          88  /* Socket operation on non-socket */
+#define L_EDESTADDRREQ      89  /* Destination address required */
+#define L_EMSGSIZE          90  /* Message too long */
+#define L_EPROTOTYPE        91  /* Protocol wrong type for socket */
+#define L_ENOPROTOOPT       92  /* Protocol not available */
+#define L_EPROTONOSUPPORT   93  /* Protocol not supported */
+#define L_ESOCKTNOSUPPORT   94  /* Socket type not supported */
+#define L_EOPNOTSUPP        95  /* Operation not supported on transport endpoint */
+#define L_EPFNOSUPPORT      96  /* Protocol family not supported */
+#define L_EAFNOSUPPORT      97  /* Address family not supported by protocol */
+#define L_EADDRINUSE        98  /* Address already in use */
+#define L_EADDRNOTAVAIL     99  /* Cannot assign requested address */
+#define L_ENETDOWN          100 /* Network is down */
+#define L_ENETUNREACH       101 /* Network is unreachable */
+#define L_ENETRESET         102 /* Network dropped connection because of reset */
+#define L_ECONNABORTED      103 /* Software caused connection abort */
+#define L_ECONNRESET        104 /* Connection reset by peer */
+#define L_ENOBUFS           105 /* No buffer space available */
+#define L_EISCONN           106 /* Transport endpoint is already connected */
+#define L_ENOTCONN          107 /* Transport endpoint is not connected */
+#define L_ESHUTDOWN         108 /* Cannot send after transport endpoint shutdown */
+#define L_ETOOMANYREFS      109 /* Too many references: cannot splice */
+#define L_ETIMEDOUT         110 /* Connection timed out */
+#define L_ECONNREFUSED      111 /* Connection refused */
+#define L_EHOSTDOWN         112 /* Host is down */
+#define L_EHOSTUNREACH      113 /* No route to host */
+#define L_EALREADY          114 /* Operation already in progress */
+#define L_EINPROGRESS       115 /* Operation now in progress */
+#define L_ESTALE            116 /* Stale NFS file handle */
+#define L_EUCLEAN           117 /* Structure needs cleaning */
+#define L_ENOTNAM           118 /* Not a XENIX named type file */
+#define L_ENAVAIL           119 /* No XENIX semaphores available */
+#define L_EISNAM            120 /* Is a named type file */
+#define L_EREMOTEIO         121 /* Remote I/O error */
+#define L_EDQUOT            122 /* Quota exceeded */
+#define L_ENOMEDIUM         123 /* No medium found */
+#define L_EMEDIUMTYPE       124 /* Wrong medium type */
+#define L_ECANCELED         125 /* Operation Canceled */
+#define L_ENOKEY            126 /* Required key not available */
+#define L_EKEYEXPIRED       127 /* Key has expired */
+#define L_EKEYREVOKED       128 /* Key has been revoked */
+#define L_EKEYREJECTED      129 /* Key was rejected by service */
+#define L_EOWNERDEAD        130 /* Owner died */
+#define L_ENOTRECOVERABLE   131 /* State not recoverable */
+
+#endif /* QEMU_9P_LINUX_ERRNO_H */
diff --git a/hw/9pfs/9p-util.h b/hw/9pfs/9p-util.h
index ea8c116059..778352b8ec 100644
--- a/hw/9pfs/9p-util.h
+++ b/hw/9pfs/9p-util.h
@@ -65,8 +65,11 @@ static inline uint64_t host_dev_to_dotl_dev(dev_t dev)
 #endif
 }
 
+#include "9p-linux-errno.h"
+
 /* Translates errno from host -> Linux if needed */
-static inline int errno_to_dotl(int err) {
+static inline int errno_to_dotl(int err)
+{
 #if defined(CONFIG_LINUX)
     /* nothing to translate (Linux -> Linux) */
 #elif defined(CONFIG_DARWIN)
@@ -76,18 +79,13 @@ static inline int errno_to_dotl(int err) {
      * FIXME: Only most important errnos translated here yet, this should be
      * extended to as many errnos being translated as possible in future.
      */
-    if (err == ENAMETOOLONG) {
-        err = 36; /* ==ENAMETOOLONG on Linux */
-    } else if (err == ENOTEMPTY) {
-        err = 39; /* ==ENOTEMPTY on Linux */
-    } else if (err == ELOOP) {
-        err = 40; /* ==ELOOP on Linux */
-    } else if (err == ENOATTR) {
-        err = 61; /* ==ENODATA on Linux */
-    } else if (err == ENOTSUP) {
-        err = 95; /* ==EOPNOTSUPP on Linux */
-    } else if (err == EOPNOTSUPP) {
-        err = 95; /* ==EOPNOTSUPP on Linux */
+    switch (err) {
+    case ENAMETOOLONG:  return L_ENAMETOOLONG;
+    case ENOTEMPTY:     return L_ENOTEMPTY;
+    case ELOOP:         return L_ELOOP;
+    case ENOATTR:       return L_ENODATA;
+    case ENOTSUP        return L_EOPNOTSUPP;
+    case EOPNOTSUPP:    return L_EOPNOTSUPP;
     }
 #else
 #error Missing errno translation to Linux for this host system
-- 
2.25.1


