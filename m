Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B3B6099C6
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 07:25:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ompYa-0004ev-2T; Mon, 24 Oct 2022 00:59:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=72963f20b2=bin.meng@windriver.com>)
 id 1ompY7-00046L-H8
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 00:58:55 -0400
Received: from mx0b-0064b401.pphosted.com ([205.220.178.238])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=72963f20b2=bin.meng@windriver.com>)
 id 1ompY5-0006Bf-9V
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 00:58:55 -0400
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 29O4weRa014413; Mon, 24 Oct 2022 04:58:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=+0mnYaFnS5jmeC+73F35KaOsy23psAhs23ArV2VeOh4=;
 b=GYQNrjhr+MZ4cfPyASznEZtKgZTvEcapaXp7Rluy2L1WloG+71n76eWsOcSz1D5VMpOx
 FeN/vPGeC9uCiI6TeTaMnrU6bF3nyvgc/3nFjp+1Ccwwt2uw3rD/P2HYV8MgVXwr6Kr9
 sPmvnihQjC24wBe3pyYg7VPSRjXmEaB7QAj2XXV6AXrz//wOYGsM/IxEitqCb4UPQ69K
 Ois+w3RU7CJrC6q+Aospc1vPuyqVDSwpDLeyCA2ddASJaqKi/OyOVAJCfXVitrmzVxxJ
 zKmnVM8oe2gWgXfGboa1lv4O78qDUncaljRDmzE89LZQc8tf/uDT1AHJ+/RiNbKNzcEt cA== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2103.outbound.protection.outlook.com [104.47.70.103])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kc7g9stjb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Oct 2022 04:58:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ri3R3xyTz3GlALdPtACbPSdW02/8kq1nrLGV3eB1Dz8hpUKHkd5QLjjkHr3aKMKZp73rwtgdnyZyDxEr2EXohBAc4By1r5YTGGzUtE+WtPSk8ZvKjfYC7rVDGxrWzLFFjF7je0lHiRp8Pmz7C5/Whi+2haeyoqS/VrwlYmHviXdkUYuqovq1lFjwGs7nU5Lq2FSycdUH1ROeywMWW77o8wDxhUZ+x4LsfFepKSALDRa+QAVUGmfDLtIyzfqHD6Zu/nx5WcIkLU23QhW+QCTSznijPsJJZa32cIQUeea48wfG1IQDqs6symWw1Iye0rxDzXvYZ2QAG3Lv/TEf8Zl6+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+0mnYaFnS5jmeC+73F35KaOsy23psAhs23ArV2VeOh4=;
 b=CqhaRfETU3qjB0tHcCoWNd2LPLZcUTElCbHsDl2E94Q96JzmntsQswiJn7WP9mchpmFru1l5DUaNdLX91jFxlGWwgUP/LqQ0UdLeAFDv2XN1IlZO3uy+kr4SYLj2WEr4rHYeMVECqJVTyIHrzryH1kUmwKXaGaHI+hxNuacsVGFHsMtfklNdzOVzWbAegJsIPP9/rPkeAZu9PMdGtzL/QMq/lHLWFyhi+OP4ske1r+wbLVMUj/Qy9Y6vAp/w7cMSJ0FbtHAr15MMQrzrEQa1yWPBjCGT0mKWd3NjwmIKYlHMLFOx4uSe0sEhOts11OpzPn559v8SqzyaV4ySCRTu5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5358.namprd11.prod.outlook.com (2603:10b6:5:395::7) by
 MW4PR11MB6911.namprd11.prod.outlook.com (2603:10b6:303:22d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.26; Mon, 24 Oct
 2022 04:58:38 +0000
Received: from DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::b051:27b7:c1c1:7cb9]) by DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::b051:27b7:c1c1:7cb9%4]) with mapi id 15.20.5746.025; Mon, 24 Oct 2022
 04:58:38 +0000
From: Bin Meng <bin.meng@windriver.com>
To: qemu-devel@nongnu.org
Cc: Guohuai Shi <guohuai.shi@windriver.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>
Subject: [PATCH 11/16] hw/9pfs: Add Linux error number definition
Date: Mon, 24 Oct 2022 12:57:54 +0800
Message-Id: <20221024045759.448014-12-bin.meng@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: 342b7cac-e3fa-4956-831f-08dab57c69d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lYFXcrDdqeHJWPcBrrZ8/S5q8oO8OA/VXgjCWmd8MYO8LAzrZvJcnhyYNfgpdoz2YaS805nN1tpMzyVstTAVEe5JaRRhW6Acd/CfpQ3cvGxH6V/OPOdQ5qUdghNoR+BRJLMNYReIJMycA8WFEoG6P1Yq2LCk6yTjbZVd1sXyueDW04A+6CQPXMP6JDAlLiywmnM+ngnIooMMtUL9KGYEIiirH5bx3tkA5/yHbF4PtgxugBoM5y3yqJbBffzn0/IxopOLFoM8O5YwASIOH5ARfwpyHlxk3ecf+0IG0VdZZgOzXzGqsQ9ilx9yme9O/zoD4Ze6/RLD0Nv35cXT/YFnKQNSwkaUMZQB7x33b+BpEYoHMqETYFS0hHaNm8UT+2BCeya0IURuVSXU+MWqCx6/mEC5dBzFBEKw01Yub06XCsR4jivGVRis4Kk3HU3viVTbM7+xpn3htsI8yHprnmGZtALVrC5dX+UPmNLxYo/BuIjSSaDY80YJizRC+G2ymoNxLxLVZ2lv5f/XdzdhsblU6V3shh9txNif3x6mbXEKlGNO17D4uOSN/2TnmPFonTMSiQ6REtKCtwzU7kbL7mus1cOH1ucmh0NBCu2VOw9kUzHROPVNtBCC23b+ZaLGhSDvkXAU4yOxX+EjWwWL6J18FIvUD/oou6IWIqmyYx9pNg4hyn68J5OejzJGtcrb+CtTNEUCqA5Tmf75uIQrDqsCBWfCjg1pk8DvZ6/pYqt1pJKfzbHp7C48NlzJRq9n8PZs
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5358.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(396003)(39850400004)(346002)(136003)(366004)(451199015)(6666004)(6506007)(2616005)(52116002)(6512007)(26005)(1076003)(186003)(83380400001)(44832011)(2906002)(6916009)(54906003)(316002)(478600001)(6486002)(5660300002)(8936002)(41300700001)(66946007)(66556008)(4326008)(8676002)(66476007)(86362001)(36756003)(38100700002)(38350700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1NawIDuYmI+S9O9V7A1K2i+kS/nY50ZeuidA/42zlIh8/mgmVIkS+QHiOMzD?=
 =?us-ascii?Q?gbs7g8d0ZaOUcuyKzll6wN2W7JFB0qRfLzwJM6nsu50aIUfZMifR5pHMReG2?=
 =?us-ascii?Q?24iauYog+oBOKwPzoO21jN/qPO26v3hYFConWBY/U2h6TS+Z8b+AAjU5hdHp?=
 =?us-ascii?Q?rzBly1XF32pkqUURFKvpEFd7DNwdAVFEGdpI8li+k0hOIvEXyj83PhOHjr1s?=
 =?us-ascii?Q?KRUz9WaRaXnCVM8hVqHx9OXxMKnjrHm+FIsr+LIKDArm2J99XCEFxYAxbXKZ?=
 =?us-ascii?Q?9/p+V55ASLNmy9xdF0Pes1MirLq+E6m2a/RknBDJ+06O2HAanNSE/goVorDJ?=
 =?us-ascii?Q?G2TOw9FdrdtvygreY8ySboLJ1iB36megvQdJSZg+sH+hW/g0qNImLYM7aFDR?=
 =?us-ascii?Q?mFUklsreMwfhH1lXdt6y2xAtG6ngPeo2twJpeWTtPqlXjIHGJJTKTJVusc4k?=
 =?us-ascii?Q?2mI+6/1aHcBWn1U6WG1vInfFFEKZjLa4GPFguE1yKjOF9wA9SIKHQpQtOFcT?=
 =?us-ascii?Q?uhFzZFk+4AyIfbVSO1EaJY7wDfbzchb6bxWVdgSeGdksUzEHeO8ZUWdXd7NH?=
 =?us-ascii?Q?BLzCDq3lE1a7KGnEFlrAX9F6P8N3WQKPRUVJq4U9VQldafn54EQTWzghUgwc?=
 =?us-ascii?Q?nlwY+4R+30/XP1AsC08PktCCCklT+xyd1dLiw5jZrztHtObGCEVV3w+gG86v?=
 =?us-ascii?Q?i4j27Zw2EMgH6GdJ3UxQ8Al4lLEKGjZM/W0zBtMKXaBUNa5YuLZnNoTJ4OIY?=
 =?us-ascii?Q?OoIFK7JWmwkHKdhJQ91rsC88N/McLSpESDi/oJcBe7SU7h+A502gtzxRvGus?=
 =?us-ascii?Q?BVIGKbwL7hkhZYp9hKMuSNC5vFZwVHMwA+DWUzoj9QK7rRV2EmGUyLRbpItc?=
 =?us-ascii?Q?NkQNko+iF6TF6Lck6ZWFB1VKR+fK1pWV+Pf0IhqnEWH0yfRfgq0sMa+Wo3lA?=
 =?us-ascii?Q?zZnfvHjvusi4PdmjuA7CDumxKacNqHsHHegq65ZJ+qtRa9cyD+JKJyywz3Bw?=
 =?us-ascii?Q?1pLcEwJjLgWkfHJpGUb/n9hQx2EK3aN5WQo3FtBBlzly0e4sbl+0NAJOFjxM?=
 =?us-ascii?Q?rx8fb4vOZBSY9miRH3fa5uBi3/R7oqLc8cEpTFixErXEnpHG7KhfEh/Z4EUA?=
 =?us-ascii?Q?05DvMOuhFqHKOmM6ZMFjPJ09BtMIQT62slR8f1z72Xz7SE5kAIfYpM0ugXwW?=
 =?us-ascii?Q?SrIHaa996vH+5523aERRJz0oiVgwSQOEIlV58t891sbmPFM1vnC2oPjnbOCL?=
 =?us-ascii?Q?VIALnCVgIPZw4zzUPNGymhX2Lej25PzRMz4AZDrQoH6GRV2ye53cPsdga/n9?=
 =?us-ascii?Q?4gDX5nLScTMlTDdYI4eLawHESu7Fk/41HWh/jxAzUIEyfR7lEFDP4Mcf8gnO?=
 =?us-ascii?Q?6ZltJQIAv5aSJ82GE7it7GWLaJDk6RoO4ThlA0FryIFXHZJU2ehrxU0o8egn?=
 =?us-ascii?Q?0A9dRY8yN/GmtAL/t2w7biYkQUndqTL7JW3W3Y99H2nVta81c71NZ+yJwOCI?=
 =?us-ascii?Q?J3aqh9MLRIM8kuXEEcsAe3Rf2g0g6fyqJKGekeXLnKwCFD2yr9pSeNtcFVUi?=
 =?us-ascii?Q?y/0Ysl3+czYeJmcAxWjw82eMzw8WXHMGWYNWWgRz9jOsg82CEa081Jg6M4nX?=
 =?us-ascii?Q?IA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 342b7cac-e3fa-4956-831f-08dab57c69d6
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2022 04:58:38.3677 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oVT0GIgXgAIbnNQcK5/JrQrc96hBnIbqc1k1RrllFMl0BLicAdRnkA4F7uGOvEfWiqVIA9QmDcnaAtriBynBBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6911
X-Proofpoint-GUID: PHRMBcgTc6VndYx-B8kEoPWs5_Kopaaz
X-Proofpoint-ORIG-GUID: PHRMBcgTc6VndYx-B8kEoPWs5_Kopaaz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-23_02,2022-10-21_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015
 bulkscore=0 malwarescore=0 mlxlogscore=804 spamscore=0 suspectscore=0
 mlxscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2210240031
Received-SPF: pass client-ip=205.220.178.238;
 envelope-from=prvs=72963f20b2=bin.meng@windriver.com;
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Guohuai Shi <guohuai.shi@windriver.com>

When using 9p2000.L protocol, the errno should use the Linux errno.
Currently magic numbers with comments are used. Replace these with
macros for future expansion.

Signed-off-by: Guohuai Shi <guohuai.shi@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 hw/9pfs/9p-linux-errno.h | 151 +++++++++++++++++++++++++++++++++++++++
 hw/9pfs/9p-util.h        |  38 ++++++----
 2 files changed, 176 insertions(+), 13 deletions(-)
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
index 3d154e9103..281fdcbf8c 100644
--- a/hw/9pfs/9p-util.h
+++ b/hw/9pfs/9p-util.h
@@ -62,8 +62,11 @@ static inline uint64_t host_dev_to_dotl_dev(dev_t dev)
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
@@ -73,18 +76,27 @@ static inline int errno_to_dotl(int err) {
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
+    case ENAMETOOLONG:
+        err = L_ENAMETOOLONG;
+        break;
+    case ENOTEMPTY:
+        err = L_ENOTEMPTY;
+        break;
+    case ELOOP:
+        err = L_ELOOP;
+        break;
+    case ENOATTR:
+        err = L_ENODATA;
+        break;
+    case ENOTSUP
+        err = L_EOPNOTSUPP;
+        break;
+    case EOPNOTSUPP:
+        err = L_EOPNOTSUPP;
+        break;
+    default:
+        break;
     }
 #else
 #error Missing errno translation to Linux for this host system
-- 
2.25.1


