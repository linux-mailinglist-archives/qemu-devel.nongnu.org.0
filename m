Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90CFE6809F6
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 10:53:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMQqU-00038t-Hq; Mon, 30 Jan 2023 04:53:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=13943e2a21=bin.meng@windriver.com>)
 id 1pMQqR-000388-H7
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 04:52:59 -0500
Received: from mx0b-0064b401.pphosted.com ([205.220.178.238])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=13943e2a21=bin.meng@windriver.com>)
 id 1pMQqP-00023T-BA
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 04:52:59 -0500
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30U8OtRH025559; Mon, 30 Jan 2023 09:52:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=iDJXqj4XOxb/nnwKqkF3Hh2hAAii9wCHHUvqDsYvMv8=;
 b=PopFLyGiJl+77ex8Eo4MkYql5nV8S/BI9G75TjiP7Xk1N+xdZ31UvbXtsAwXCP/ii92T
 xpa3XFC+L8ZORiQnyVqZTb2iQfC8Df5Y/ecmYoc1DIIkIBxWif5eWRICoB9VUHH7OHUF
 R1F9tH3//4i/nskt7vomNwMsaDqzz1bZccaWL6KRHMIEPLT2ASyDHXHsLFBg8mska/Ms
 9MxiEcAN+TzP9jNHY7Jgjqs8AIvc5mU0D0NygmbjLBROZ3y3USD03oIMQ2LMZyyccDkV
 /X446n3H6t72aXvUiUqQnc6an/Xb6ljblprlwbTrSNGJMtbCcMVSor57IISQ6TLAfmX3 +w== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2042.outbound.protection.outlook.com [104.47.66.42])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nctpat10m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Jan 2023 09:52:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BCYWGZOcUgp5y2noO7P9LBwPshn+Tbr+KdESo3xoQQyBM4uZGNWJmT+pKAg4izSp7W22aSOvSB/+FlJ3MMOi5oLe5HLOzq/FNzXH+YPnxh6JtIjWC/PJVKOjvB2q9AH0hRvYAjjW6/JcCyo0OpGxMJohgQZuRe95b1JHip1XZ3hX6iJWuT0HkSC24k8AEann/xAkSGrLrN74w7pWgUSM6uag/qwhAn4Rp1Ru545+06bjh1n7J8cTgR2/WAyMTtGQeli11Y3ge01AbDb0m2eXP/IEwDkoTZem7eNYus0+6Gdw+hWuICD3zUFMt9XfAuOuMGPVmi9df0/upFQZJrQfrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iDJXqj4XOxb/nnwKqkF3Hh2hAAii9wCHHUvqDsYvMv8=;
 b=dr9TF6frCexJ5u8GSEnSl0IqbQnwh71MAtAiMVQrCGyJc2lQLnpFzAYBiLslAQkktV9IDxqjL47qD68kr72QxEp+J4S+9LQU5eYh96uPw4uQmEC99fcxbmOMN3ilkld3W72B6GHd1BdhPOfpTYpoBjJm0lH0Wx62BPt4BkPAETNvKmyXqSapQ0Zex9TIiaKVH4rjw85kBqQrujGcba9R2nV2ozfrvgruoxam8pgfCEzacuSdO3dTawo+YDRpv07rLQBKRsdIXqG8YBnxf8MWsxrHN2I1Xdjaq6dpIRqOHJDLUcqYt3zNnb5uwHh5qBTRJJgLQGBU2jstYt7Usjtprg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5358.namprd11.prod.outlook.com (2603:10b6:5:395::7) by
 SJ0PR11MB4992.namprd11.prod.outlook.com (2603:10b6:a03:2d4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36; Mon, 30 Jan
 2023 09:52:42 +0000
Received: from DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::6c5d:5b92:1599:ce9]) by DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::6c5d:5b92:1599:ce9%2]) with mapi id 15.20.6043.036; Mon, 30 Jan 2023
 09:52:42 +0000
From: Bin Meng <bin.meng@windriver.com>
To: Greg Kurz <groug@kaod.org>, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 qemu-devel@nongnu.org
Cc: Guohuai Shi <guohuai.shi@windriver.com>
Subject: [PATCH v4 11/16] hw/9pfs: Add Linux error number definition
Date: Mon, 30 Jan 2023 17:51:57 +0800
Message-Id: <20230130095202.2773186-12-bin.meng@windriver.com>
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
X-MS-TrafficTypeDiagnostic: DM4PR11MB5358:EE_|SJ0PR11MB4992:EE_
X-MS-Office365-Filtering-Correlation-Id: 01ccb3b3-6f05-408f-781e-08db02a7bada
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GTi5w1H2QZHAt6QDRk1gDjUESgQEkeezFIqkeBvLijIVNsMNBuiV2h4z9yrHA8Ap657D5FLAr4NGvJv0udHqkixkFuipeZDjpqn/v+sRqoy1wE3/pzecC4ngL8aifkm6YE8uHUQBcmjisghvpedcPEUmsuXERTKKUnLfBjrtxaUtbwORd5ILEGjbB61FpD2KWaOrGBjRgQuwodnRUhHXkm5dPUn0ZBkpPQn8qbYSheMsUrRFlicSszt38T4i4kiMX2ryBOtZ75RN9TJh6ybZR5ymadmDIL225k85dwFFsAM2olxsI3IRc07IYOnV1W6NJVi1sNHijuktjm2LaD57wDIMjgWz2jrhcVhaP9zYknKlfyYol9vdjxHOhX90ASh8Uaswi71vnsZnKT+IVazkp/gAC7X9mxsOIIcO2+W0Z4SKTgs72m2I+B+Kmu8nNhsNSyfqaxIL7Ua9Fy4qVwodW/uoG69XUWB71WFf3RYy8zLQbOsYgIKMQR/4baXvSvkOJqnO1e5J7gStNQhNLGFywfvjRZPeoC7sNTtM3kqlD7949Gudn5X3K/PXB26R5+7kY1naI3a9S8sTz4QychX0ktFtEb4KJJy+RRF00lYZR4q05H7YpMQtz65q3EDNVgqyYU2Zu3JfNBlLFWcStLzytSasN6d3PHyXhkkkbHAOZOQkAx5V0Gmg82yFmYw+b9uu
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5358.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(376002)(39850400004)(366004)(346002)(136003)(451199018)(2906002)(83380400001)(66556008)(41300700001)(8936002)(44832011)(6512007)(26005)(107886003)(6506007)(6666004)(1076003)(2616005)(186003)(5660300002)(86362001)(38100700002)(38350700002)(66476007)(4326008)(66946007)(316002)(478600001)(110136005)(8676002)(52116002)(36756003)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Db0Z0Hur6iknY6ja4hM9Fjb4WgXAhlFr+3kGqEBlVAm951kBRJeYfPWca7yM?=
 =?us-ascii?Q?F99kTxePpEY6bB5OYMsWVvNGbwZfAVEL+Cv8eoGywVsmzMkIaiYAY53WTWqr?=
 =?us-ascii?Q?TSA6/nyMf4TjRiHeG1zvGAn0rqsCuQjirfHyI3AzpUPqXiia9txMVq7QXY7+?=
 =?us-ascii?Q?ahlbp3oW66ZkAesy3ip2MWC/1e+J+KcPkhf+OaABgvaicP2uv0xC9sssHpzP?=
 =?us-ascii?Q?svo2WpGpdEEEKkiZCLdd6WLOi+au25UKTXOOEoJXQjb+lSHA6My5K47hgtF+?=
 =?us-ascii?Q?UwMWqqhNwMuDwOFqWDn76llUo8PHW64lCpbogqqWaUlmQSTFh+nWKvXM2MkH?=
 =?us-ascii?Q?ZQhkrDyxFuEOhjGo5RtGova+ZIB3B63FY/Qxoq6iak8GtxIeCpTk6d6KssyP?=
 =?us-ascii?Q?WwVNjkOZKYlgAflBgUqXGgKESb/LA1m7ceAyqaff+9zzt13zzkCehk+CV3+7?=
 =?us-ascii?Q?OBtDkNds8cTuf5NURJ0fO4Fnli8UWpuTK/edT7VVJyeNnsO39xpb2Y9krndk?=
 =?us-ascii?Q?iZ2bk5U18PnOrmbke9aky1kKXOaWj8JKMhB2RVqbwBd8Fb2+jGpOphBhKSNo?=
 =?us-ascii?Q?ofcG+5A2gtF0StM80Mn2Qe0d3x3tLJpSyM2qWHtQuhe24DIDWJfI/b9t7jE7?=
 =?us-ascii?Q?EN/5b2MQR1Z9xEKy4QrQuWRGmZU4XISbnwnI5DzExRVfhhTjsNgUopXEpgDU?=
 =?us-ascii?Q?ObnKCbKFq/7/W7ln082BQHXMk07c5SdfiEj6NpwiA7gf2bTqN+741BJrJVuk?=
 =?us-ascii?Q?/iW3/JtB4ONqSQNSglYsiMlO/8uhTVg4AMmeRQUjzk7+vZS07aYzriDwZape?=
 =?us-ascii?Q?akCxElI2Xf3eBYoRrJBT5QnbBae1KFI8JxMoITfbkpOkWzdCX04U44FLuRt6?=
 =?us-ascii?Q?YWkINuiuUOirg6NrGqr7JHNE92ESQtcRKXbUpnCzmqLbuO4pALvDyM5qWEEG?=
 =?us-ascii?Q?4031bv74bjzYnYUqm1fxmQrYwUZILw06+XrVuetaHHyHHACYF/1NrBLf7r8u?=
 =?us-ascii?Q?BPRhGPGkjJxvdFgyZU9nEk2KlcQJD6x3SMxUAQX2uqMXS+zfcEtPE1k3QLbP?=
 =?us-ascii?Q?j5O8DOQ7+gNLCSLPTPI3R+nLO56zWRBKXFSQ+Sp72fGWIVk6cBpF+x7tZ2BP?=
 =?us-ascii?Q?5YUJHFjn+tm7Wmj2sk1g+QNXGdS5kUYMUYabcjDtaVRT8peiTZ9czLMDvcum?=
 =?us-ascii?Q?JuUPejNfbICKZl+DrvsNT4sAgTsiVtzH8jG6X97xvgoxCBfkDKFWAkuTuulR?=
 =?us-ascii?Q?NU4c2Oc7qFWM9IzylnyL26DUvdXs1PzGK9lIcVAFqzVrKCFGRATBTc2Kb0Aq?=
 =?us-ascii?Q?um5pcoeL8WTwqhn0vVZhZxIxWBE+YXer0KmrXXyZ1vIRrrXGROgPiS/BR9rM?=
 =?us-ascii?Q?nWO3kKLLtCkMt51jEurMIQImHAoCco851bMOOoQj3WeSobehGYfDmQvIJngx?=
 =?us-ascii?Q?407T0ovb32rnLUoNMKN9Y50FoYCfIlCYjGCv8aSAjzG6wpIaynTVbIpFYTvG?=
 =?us-ascii?Q?FhM1k3UJZBaa8YnT6bA7LbR/b6EWmDloe6R683RO1M3wZoISYb4bGQpymgcl?=
 =?us-ascii?Q?+XIuNGLQy/TJOdUYaJvjny6jt/3qefBC2u2kodFyIpdgJ0jhql+qwJSSnRhn?=
 =?us-ascii?Q?OQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01ccb3b3-6f05-408f-781e-08db02a7bada
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2023 09:52:42.4324 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NQINPiZkAObLNWwsGZ7tkxyY9qa3vG8LiCkQPh88fCV8xyx1n1kv3cT3nty0y1mHoe4avD7pX+mwg5KubHWvqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4992
X-Proofpoint-GUID: wLtP4AkZhmDrQidncmJdTN4u2K3MPmjV
X-Proofpoint-ORIG-GUID: wLtP4AkZhmDrQidncmJdTN4u2K3MPmjV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-30_09,2023-01-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 mlxscore=0 clxscore=1015 adultscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301300094
Received-SPF: pass client-ip=205.220.178.238;
 envelope-from=prvs=13943e2a21=bin.meng@windriver.com;
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


