Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFFFC650A1C
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 11:29:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7DHS-0003Le-Mr; Mon, 19 Dec 2022 05:21:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9352c01a6b=bin.meng@windriver.com>)
 id 1p7DGz-0003Dn-VD
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 05:21:31 -0500
Received: from mx0b-0064b401.pphosted.com ([205.220.178.238])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9352c01a6b=bin.meng@windriver.com>)
 id 1p7DGx-0007Vt-Sz
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 05:21:29 -0500
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BJ9dUcW026145; Mon, 19 Dec 2022 10:21:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=aC5SOPayUo/VGWIHCcxSV4cInvSd2clRALxgRa5dDJM=;
 b=j4jcxUaJKt7RghQrPSqhaDMatYz/yRXktZKckph8buQgdqCAe/lxA7Vmp3uUEIkO2E4b
 ZCmLz5upozwbRaXylSGdL67H+SF7iD+cbLx7kav+zAmvibHw0t6+ZvVdHp/oye1Y0b/1
 LSI7juivblApikMDcY41ZVUfN2m9MUD6bngd6szVBrcMYN9i2m8QYRplxJWlrzUT2tEC
 cJNkqDeknNLRYmDsVgSdqUF8+48CHDKQ+6Xdn6C8rzLM5o40QFlVWS5h6O6lqjFyJB/W
 MU6eqmNBjVY9VSQhA5lwgKLavSSDhoCTucEkHXweN0xQjaBaexjkk+AvWZqdMlc6K1HZ xw== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2108.outbound.protection.outlook.com [104.47.55.108])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mh4r99b7e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Dec 2022 10:21:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n16dUeVNqsYCmJi4eGQMLzkoja9Q02PdM4CttlJhUuA7yp4bSJPveOfzlw4izkyFKFXOIQ7Z7ZwrW43gP/BNkZEuueFttSpsxg0PfkaAPWXcLC6WtTax+CR7Z21vdOv6joqtsC9dSwmUsJUTxtLJ8C76C5v4g/TVWD7NKyY1BqCC0LRtMYjkSegIAk7FBivdPMk9e14nJoO9Aw7E5SeQLI53uuyDiV2aX0MSPSvkzPo2aZrf2Rk84agwePbEioHWUcu78hzrdkferixrL34espgcmcLnYM45HGdoodbmo2AsOhDcaRQJg358u7FhOXalM5wmhzhHNuHFbgKQyfLfxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aC5SOPayUo/VGWIHCcxSV4cInvSd2clRALxgRa5dDJM=;
 b=bXW4G4Prr7cEMqnodGss3WMsJPlsP92uuEpmoAeYT1e9/V104w0Z96gGy9C58uNzzsHjgS0I8BC0k8u4gQV0YxEtNIRXs4X6NZ7VG3VSQ6R0GBGh6LO4Ser8n7Oo4O1auZxwYzOtDhp8DJnDCvSbw/A//TitbiKxP8VLujdw2xtiv6agWFCmQui5UMf6vfKAlvMKXWXwLVI1wlqk8+d88AevGXi0rEk93rwuCu68WQiB7Hfrqj7DquEVtuePDk7AAzYWSvZR0uqVJ6tzdepcENcVwfuOYcmxGR0ICU/xa/m6hXSANsd8Gpj/EjCKKoV+4XlLfLEO2C+jOcJsRRHGCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5358.namprd11.prod.outlook.com (2603:10b6:5:395::7) by
 DM6PR11MB4691.namprd11.prod.outlook.com (2603:10b6:5:2a6::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5924.16; Mon, 19 Dec 2022 10:21:09 +0000
Received: from DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::8e5e:71da:1e29:bc15]) by DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::8e5e:71da:1e29:bc15%5]) with mapi id 15.20.5880.019; Mon, 19 Dec 2022
 10:21:09 +0000
From: Bin Meng <bin.meng@windriver.com>
To: Greg Kurz <groug@kaod.org>, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 qemu-devel@nongnu.org
Cc: Guohuai Shi <guohuai.shi@windriver.com>
Subject: [PATCH v3 12/17] hw/9pfs: Add Linux error number definition
Date: Mon, 19 Dec 2022 18:20:16 +0800
Message-Id: <20221219102022.2167736-13-bin.meng@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: 14e21197-ae58-4890-7ab7-08dae1aabf07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LN+nKDRMeiyTcvvCCpn6NSvBzF+0SxlI8EVwAJFzhix1Ul8A2TZ9t9EXqJLcvsogAGTLm4Bl4GSyHfYWwr0rer/4IejRkguNuDX4hB49tuLuFXObhzrQYrzg66FyoY30J8qp3rXP2kkyZyLEP811Uu0DkGjxElCKmIk5woITBbhn4gWi61G8V2vEXfc+BN/z1Lxu+JxLPGV82u5vR2Cchzr8aNQlPr5vTTVAQPUoW9ozMk7UEr12Y7Qc7j5Hgbsb9NfI5sd+1QHMLZS6T3qArdGoGV7gbbfrBERLyNTls9woskHqOakcbdfN2MBF3yRrQYMjJwzjeHIjqro7oJCNWOqDlz5H+VCFIBh+7zRvf6I8ekVVj3BeOmsJKhOYngmZcX4R79zoWQj5gzNvifnj7ninbqGMSyRHx63E62k56IWJq3W8uBk/UFofChxUfgrO19LV+8/QAZLlfh1dS7OpRY3w4qll4lHDoBoctAWhMy7Lvtj/xVTxST+QbCEjU2MJHTIRSLmNPFhojfDlTh5OtGDtrW0n/Vj5kidtie55jlapadHuk4W2abgtHBZwzoZYNi1mQIHoZut3VP8NKbxtvU7aY6DFxoiOykIDJjmIcphmFwlQN3beW84F+K1Q06FJ0QaQzCXmD10BU1ah0g4IeVC6UwEQNUZcWe5RTNzxixA1k6fmWzMxnr6V1UR3AM9d
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5358.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39840400004)(136003)(376002)(346002)(366004)(396003)(451199015)(5660300002)(6666004)(107886003)(8936002)(83380400001)(186003)(26005)(6512007)(44832011)(2906002)(41300700001)(36756003)(6486002)(110136005)(1076003)(38350700002)(52116002)(316002)(478600001)(4326008)(38100700002)(8676002)(66476007)(2616005)(6506007)(66946007)(66556008)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Rg/w2iQFEki2Se+isVy00Bx9+fGolAMvP9nzSFVM3fVDQoma33Jtlm1WaMb9?=
 =?us-ascii?Q?AQokFtv3XD+ccntKpQBTy8SLcpr9BlLGsDjcrhJWkNBE7hcn6qv9k6B4G636?=
 =?us-ascii?Q?oO482HJS37MR/bES6qa4Cq6vZ50a+yxKjWNeQEtVqONiNFUNPHspFqSYL2VX?=
 =?us-ascii?Q?L0S/PizteySKXld3qsL9xQx3qYSwjC21FkVseU91k90qR9IZFc5Ipwj8QiTk?=
 =?us-ascii?Q?OhqOnaTYveOCAH0vqh6TeEjShtF+L73UqyvfaFSOMbsZeTA9JKR2/vEfBoyt?=
 =?us-ascii?Q?LPwCRCcyOYSxoO9xw6eHYWSqbDSKaG1m9TiUbHDJE9sF6Mf0/z4H2dba14Rg?=
 =?us-ascii?Q?0AxaUlIYmvQbLfGASIYj9cYVKJn8jxEpe2jPQPKVJliaL1ll+zGdIhwDwHlf?=
 =?us-ascii?Q?nAo16zOPHJ8+keNaLiVHgGl253rhrU8bCKw+wqVpKYzRjxeiwnN0MNg5NT6W?=
 =?us-ascii?Q?+hHlR5+Ts4mBvWmHAktPSsX8Hax/ZZlxyW9DwoTSbPzJYqmGyAeUilqIerxO?=
 =?us-ascii?Q?ctulf+yaHPTq8jkE79DNOwpZtGK3xUqQ1Wxjf2aTQDyuCV/EPgRuHUAzctVJ?=
 =?us-ascii?Q?GbM9yY6E0QiFfBrfL0ft7BzS0mR6VbZUwUnahbuEkSl0HTealt/rf+v9e5eS?=
 =?us-ascii?Q?Z6xXfydcH8jxCK26+Dsxjo1W70+LeIbD2Joe0T63I4xwmSum1RVqXl+mMtGk?=
 =?us-ascii?Q?dSnBGLuJLufl8CFDNbHdR5TBFrTc1cWc9Y4LC3ulCJpdhM7PKDbemeRx02/g?=
 =?us-ascii?Q?AuKUbqNLEKfRIMXfxlDOOoRua+9Reo42F0PidpKH/hwPkFMeivG0ndYuGzWE?=
 =?us-ascii?Q?FA1mVg/UWRz5rRXbblmmIg+XwJcSjZnuzNgurUVd5qU4ef8HkVO9plbYHIxx?=
 =?us-ascii?Q?fFqoxaYdmD5Ly21SePaaQrgVgIuZV3lVbZyXXhXDDfMYJrlW5nyNDPzpvUdl?=
 =?us-ascii?Q?U47x6wWmZ8PeI6woWC7y9QFVi7XYSa4NDb54iM4pwBxse++gg3TgBGub6Tza?=
 =?us-ascii?Q?p6yD3OG3FI/mnvz36zg6lTzyGkA08VMzRKtzL4pXxHxPJVwSoXRU3AgB9fAc?=
 =?us-ascii?Q?5/Vmv8HJ7lRJwB275GFeI5DX1jzVmRwocRSEY7iQAIFE/u/LaG/UKNaUUtcN?=
 =?us-ascii?Q?KWeyUsavTODs8QSvB9gtSNRhykTYTDXkakuZEBIauFTVhI52b7WdwVbEICI/?=
 =?us-ascii?Q?rARD3R6nRuO7pmhhmaP0F2pFYC7AniVPKMB6M+TsAtirCnd78yRAk9RYXBWD?=
 =?us-ascii?Q?1owePufVt5+/Lm4XfAW73mRyquItGchdh+2AftvokWAZzNYwNieYsfQp/4zs?=
 =?us-ascii?Q?yb35zKARbrw1CfIH+IAlYLYTEuiA6bgG/KNPCgxeSyG15+1Gm9CNixCy2h6D?=
 =?us-ascii?Q?o7IP1ZigTjaykHUQFzbrQj+L3/KXhsKSNKEQl8eV/7rEEYeyxKPi5tHCyfV3?=
 =?us-ascii?Q?iT8sl/HzhECfyQeFIVHjQF6js4mVvlnowusnTakWclDpZQwHOpro6m8L5pfO?=
 =?us-ascii?Q?H4OxHZj2D3bgKP9cN2k8GxlcmhUHcRRU9xklg7jbxKLStdKjDvzlieG1EGkG?=
 =?us-ascii?Q?hzcnIUkJPlKty+aIVCfgPeV0/+sNgylTULM5PgDP?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14e21197-ae58-4890-7ab7-08dae1aabf07
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2022 10:21:09.4162 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 97eTwTE00qbJ3hUysOuUdEKZjW6ZLW2ys/c/7JW8iRPwy+HnKHeaKBtNO27fzjSCbt6CgIRTd6NXSKvJncFq2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4691
X-Proofpoint-GUID: dHO-hNB8EPpRBPe_zyfCRELoRealFLbK
X-Proofpoint-ORIG-GUID: dHO-hNB8EPpRBPe_zyfCRELoRealFLbK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-18_13,2022-12-15_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0
 mlxlogscore=999 priorityscore=1501 clxscore=1015 phishscore=0
 lowpriorityscore=0 impostorscore=0 mlxscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212190092
Received-SPF: pass client-ip=205.220.178.238;
 envelope-from=prvs=9352c01a6b=bin.meng@windriver.com;
 helo=mx0b-0064b401.pphosted.com
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

(no changes since v1)

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
index ff16e74f5d..0ef67a53ce 100644
--- a/hw/9pfs/9p-util.h
+++ b/hw/9pfs/9p-util.h
@@ -60,8 +60,11 @@ static inline uint64_t host_dev_to_dotl_dev(dev_t dev)
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
@@ -71,18 +74,13 @@ static inline int errno_to_dotl(int err) {
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


