Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E852862526E
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 05:25:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otLZn-0000bX-9z; Thu, 10 Nov 2022 23:23:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=83144312e2=bin.meng@windriver.com>)
 id 1otLZk-0000bH-QG
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 23:23:32 -0500
Received: from mx0a-0064b401.pphosted.com ([205.220.166.238])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=83144312e2=bin.meng@windriver.com>)
 id 1otLZi-0001ci-IB
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 23:23:32 -0500
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AB40lZJ022509; Thu, 10 Nov 2022 20:23:18 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=GuVPlV4qQp+8jvTEQk8lbZWAq5jCINDQDlXwOFBdkqc=;
 b=rfpM5nkh+1e8nlxpohlIboFzN+4Jrqqwqy0gmk/AoLpgtpDHATi1FIsNW78my8qiHo6C
 obe5aak75riy02Bzh36lsYmPblK2f8rPabd86Q96MTpCO+ySaxgld/XzPuwkZa4SXqNd
 pQEDnxSZEpwng3S0+ZQpiGkFWkMwTQmx7yxLPinMeJIn9OS6qYPr0jsLWj+erzTUBEnO
 KST1PiGwzQbY2eB5JSo6f7UPLNEZmoPGQCsJe8zuWc4V3b4xqNhpirU041M8mNO8IHrm
 zJLPnfYlUnZmumYMGjSXZTraZr3MmMewMdc3VGar4mBBwr9XpjPTg35MAi3COGvUSG/D vA== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2108.outbound.protection.outlook.com [104.47.70.108])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3knk43d9mb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Nov 2022 20:23:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RVEmjdcqXv2v2CfkmDPaT5Wymn6a7ZoUo9Htz5+e6CGwTUV34Jd1GEpLviDupwiqBr3axkfkSlCTTW5fCi3mJc3h130yBJTISEXOb0/dG73nW2qFCOU8DQYILZ/zkqRCQHXWzPFYgHwHex2spregKufRhB2JABREPsDf7+VXz7z1IUglZfMh28Fy/6Q3O5Wq1W63VAwUklAvTfe2I8FYlrAKsmqu1gEwRoRL5vMLoez23rV81guD/vJenTsYqA4sBAXWp1I6OPnkZ/AwzhOoIiy5bA2gQbRDW6ev7YBFiqu8uNNstVfuc7aiOhWPDLHxdpTqPzI81DkHx7tsJLFllw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GuVPlV4qQp+8jvTEQk8lbZWAq5jCINDQDlXwOFBdkqc=;
 b=c3+GcsSkQigYUqGZEvAH/+Q6TqrW7pFBnmFeRw6GTy/EeyspRzj9OZhauI+RVw9MD/JIL1s8pHbvh1mPiWmCvyZ8pc2TV4GKkcwtGkLAPXidmMXbAH9UA1fuLsFKDhUJvouX3ZiGdlRFiSPO1mMBi8jpc/iIADBqOamUKqptvdUVlUe8qXQ+CwMs2Q6oqRQV+xtuhwrl3ph0JOdoOMP/52x6GUs63UCtKauERrthJ7J49c7Ob5lcN2pUqhgnWCZ1wsHrxH5U6WK946XEKVTs34MeLycXVin3HRKw9IbXfENiX5gNY5dZ+fqveUFFV+PKE5kRMNh53e1nllZq3iU8RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5358.namprd11.prod.outlook.com (2603:10b6:5:395::7) by
 SJ0PR11MB5102.namprd11.prod.outlook.com (2603:10b6:a03:2ac::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27; Fri, 11 Nov
 2022 04:23:15 +0000
Received: from DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::8e5e:71da:1e29:bc15]) by DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::8e5e:71da:1e29:bc15%5]) with mapi id 15.20.5813.013; Fri, 11 Nov 2022
 04:23:15 +0000
From: Bin Meng <bin.meng@windriver.com>
To: qemu-devel@nongnu.org
Cc: Guohuai Shi <guohuai.shi@windriver.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>
Subject: [PATCH v2 14/19] hw/9pfs: Add Linux error number definition
Date: Fri, 11 Nov 2022 12:22:20 +0800
Message-Id: <20221111042225.1115931-15-bin.meng@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: 82371a24-e348-4d64-89a2-08dac39c73b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vCAriHjDXD3CZPLbVJa9qa+dBkJqjZGk4JXOAyYhImCzyICw064oBvoi7ZRgNMuKwtCxlokhgis8wYDAdFi2xPeRDt8gVfg8/LRHmCcVMIr73StPDCcdXN5Mr76SoEaR0KDqLprlSDFt3XQ67hs/FT/zgsnK+p/duC5jpFRJo3zDWlaZpltLO17Ectxn8/JAPNwrsQJkXBvL1sVZYY8NWOoLKAOHV+juwwiwLsQ20j8htupaBv1eEYHbmqJzg/5To6KZHZI6XN8pGh6JJq7H0yFU34YRpPvjSulnfRNIy4Fpq5lxP9hiXT9llLjsh7DiIz3zTVsz5oweOyc7+fwnlCE9uEeWZCVJKbTN7Ufo8d2NCAFpXdYjznWQJxuSau6db9zuVPV4Z3L6KXe0VyVyGMIjmcYObOAIEmY9wHHD/99lYvi0CXNFm/9EBFnckMqoduP00IvDSdZt0nFmq3s8AsKjMHJv9VCyNoxvAULsdY++kgROUBcgDUWiZgkt3mg9ghp0ZDJCuVeuSkYEj09JQ40NQ5y1dlGlt2WGIq9pWVmA3+hr5rYFjf0I6qTdm1K+0ftlcummFH/sE1exqtPFj7fopP8Jha3ZlKF6aJevcg547wjbUbL20N0GjbjtqrERi/oc7zCxPqLEp7k29q6A9Ca8vNRjJMh+KHhekR+wxxP9G7W5g0MaNvuH95kbw/onUcLXpytWcWxoNeJytmI03s27yqyvk9M9gr4J1LDT0O6ufAGM/jcMMDpFbMQBQPhc
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5358.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(346002)(376002)(39850400004)(366004)(136003)(451199015)(66556008)(316002)(86362001)(8676002)(66476007)(66946007)(4326008)(38350700002)(38100700002)(36756003)(44832011)(83380400001)(52116002)(6512007)(2616005)(1076003)(26005)(6506007)(478600001)(6666004)(186003)(6486002)(8936002)(41300700001)(6916009)(2906002)(54906003)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aprwv2FNftUmHdNy+Zhm+tLguFwCW+RmhmL8tzUjS8einWO7MLYCnVjp7HAi?=
 =?us-ascii?Q?TpAXnjh0xSucZY9lvVQT5MNjCW2yyUA/hM0F/XoCXUfz32y5yZBRMswY16mU?=
 =?us-ascii?Q?Se9M5Hwls3PJteJ74b4SzU6baA5k5p/gp6GpxisQ2hk/RIqLpVNVpzbx2h9h?=
 =?us-ascii?Q?DSjfMiT36bWGjjlgArHEufPfRg3Okjl9b9DvfAxN2aFPbNp4InLQQlD0YwRH?=
 =?us-ascii?Q?hw6w5QQPB7NHE8N2b3Ri9d8bZWcxXJUFBQ59vsGy2QDnbPtcYIswBOgj8+lx?=
 =?us-ascii?Q?zcW4b5p1IFWJrokctDYPK6vnHRRMD1FzY4wkCwjTragySjIH1uhBE2iFujiJ?=
 =?us-ascii?Q?5hlEhzWgsQMhLd4xPXzeUBdfV90C3QEqAhqVIt9MzXHZ1XVBxeJ6aGJXpok5?=
 =?us-ascii?Q?aC1jtTa51/iTyj9LUh+kRScIJ/jxe21eqaemsUGOSfVWiF6XbIzx6QT2rKbH?=
 =?us-ascii?Q?8niBJ0OepvKgDy3bD45pamF0IhY+9gaEvsuIQAB1MrmdGFSV7xK3Jr4sT1hr?=
 =?us-ascii?Q?YP1tuggcHe1Yl/Oj6sBKkaECQ7r84eNDWEHIj7V1hPc23RP1x2hNgMms3hMQ?=
 =?us-ascii?Q?9jaK5jKMdcXAqPYEpnS5XhPjjN46nv5iXxTAdB6ur/mLvl0wF5L9SQk3azsY?=
 =?us-ascii?Q?3Y8qB2HTW2UQBw6rJK2yQKhl8vSDslRvKV1WqqIdZLSSyXJXaBWYHFypDAa2?=
 =?us-ascii?Q?RtWZnmVofxD0MIxFzf0A+Zzz6a9EF0Ob7iWKfB46xkThMJq4fou7leYHPc/S?=
 =?us-ascii?Q?42/Sat3a2aozAHdTjlDBJMW4DVJh9ZJCHobwwtr+L9FxXbaoOgcBA3Zcecso?=
 =?us-ascii?Q?WKHB5ekkuEL1kJEBWQpCPFDR9S8FtQN1zCOILGs1x7tdezLjsa/JdSSuqhOs?=
 =?us-ascii?Q?27SDbMNzX7hOMxpkjeO8l45O8GkPiltlJPoh+BwE0Cx+SPJVZLgJ395VvM4W?=
 =?us-ascii?Q?V58p31ulLcXKjQWVIPxF4c3ghAe+ySkSeEQdIbWiGCFWudrZdFRP5/lf5P0Q?=
 =?us-ascii?Q?BstE40SMO4bHwfHQN3s4gsGInsNp/C+3NThsShzqzuOrIP0BT9grred+RegA?=
 =?us-ascii?Q?cm8bCDoKCgb1nIB4asHad6HiMQuIvyaWOn2hrlq42gcF/T8s5aAEh4OHe3F/?=
 =?us-ascii?Q?mupLx6tCFX8P0lrE/m5ouNbFUh09zTrgciM6w3m241WHg0z29mLPHI7jw+hA?=
 =?us-ascii?Q?FjEusQROXBwWoYt9kWhop3dYieEWWKhFjv/6LPyj0tLN6kTJCGeb7Md+dq/X?=
 =?us-ascii?Q?t/l4wXIqFc0vT60cMr3LGPFNfILksmQIkQkF5XE8GcWVbZkHcw/7NZONs6TR?=
 =?us-ascii?Q?vmEsR8bTAf/uIti+TLz5SlMt1WqVt36KvUt5FpB1TKDSMkgifxECMdLxmJ84?=
 =?us-ascii?Q?3lbsIWQskjpPrrQbUD9eq0eLy8HL7H4HPCjO20KrW42jTJRuN2hDNcSWw6Zx?=
 =?us-ascii?Q?OmHQXIAm7wZfxys+z2pNcoihFbPUYGCE8MdQQIFAgVPJbed4hf7xHADglubr?=
 =?us-ascii?Q?2ShuJVq+98+I+DmXPqRYXxHN3BX/uLwt4fS1bTtJrJqRyOuVrGB7Ekv1L5le?=
 =?us-ascii?Q?dRvcJSz8iYCVhcymoWowyvHkNKm5YRnMvcUjvl4n?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82371a24-e348-4d64-89a2-08dac39c73b4
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2022 04:23:15.2527 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yo28KSRODjD3U2l0pGoqCuhDBD6DVGHp4bwXlbj/PUokS9GF5V33FiB8f3JSzdvL2pSkskG9HHbtc4dgf5CcxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5102
X-Proofpoint-ORIG-GUID: -m0Muav9F0FxKIRsVUMIvn6pZM-S8WOd
X-Proofpoint-GUID: -m0Muav9F0FxKIRsVUMIvn6pZM-S8WOd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-11_01,2022-11-09_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015
 mlxlogscore=822 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 phishscore=0 mlxscore=0 adultscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211110027
Received-SPF: pass client-ip=205.220.166.238;
 envelope-from=prvs=83144312e2=bin.meng@windriver.com;
 helo=mx0a-0064b401.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Changes in v2:
- Use a more compact solution in the switch..case.. block

 hw/9pfs/9p-linux-errno.h | 151 +++++++++++++++++++++++++++++++++++++++
 hw/9pfs/9p-util.h        |  25 ++++---
 2 files changed, 163 insertions(+), 13 deletions(-)
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
index df84374b78..c76a53f2a8 100644
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
@@ -71,18 +74,14 @@ static inline int errno_to_dotl(int err) {
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
+    default:            g_assert_not_reached();
     }
 #else
 #error Missing errno translation to Linux for this host system
-- 
2.25.1


