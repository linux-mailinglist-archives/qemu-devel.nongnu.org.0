Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9960609AE6
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 09:03:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ompYX-0004Yu-LP; Mon, 24 Oct 2022 00:59:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=72963f20b2=bin.meng@windriver.com>)
 id 1ompY4-00040j-RZ
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 00:58:53 -0400
Received: from mx0a-0064b401.pphosted.com ([205.220.166.238])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=72963f20b2=bin.meng@windriver.com>)
 id 1ompY2-0006Ay-FJ
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 00:58:52 -0400
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 29O4gMkN001865; Sun, 23 Oct 2022 21:58:36 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=Dd827HPsvBbns/j7gw5UZ9B7zDyrUeNWaRHKjcmMvLg=;
 b=aM99FhlRmiPV4hzWKtFQ8N3xm+Tgh5lOX49nQEkwedmHGrQHqVU9SwBJFjuE87RwKzeN
 bjhqhlOYxaU6bAVSEIPZmWjuymLjHalESGb95/GiGfNHlm+uteKfkiFYlIgFZtMOY5xr
 15aqHH8cgLJYPVoH6Djg+ur8oS3r8cmV2Fdj/xGIwl6cJZ6Qak/XN1IEK8Y8/cBqTulK
 t6A8+4ODjSCUetYFATnng90I0rf0aYYHm6wE9F0KfrSaagjTOrzQsnuD9hRWoKwCWh0N
 ORXGDBwacscFBpFzMhED/P1nVUNaQu4auK4Oak6GNP4l3wnH1R/ow2oGu5+l45Uq3rKD 2w== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2103.outbound.protection.outlook.com [104.47.70.103])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kcg1ksmad-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 23 Oct 2022 21:58:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LZk1EKGl2RDkLCqkqW7Yo3LN/EDVKJlDcTZbQV9v9cQ679Aywe6pNydl7LU8kwTEizkgNy6+nqPdwQqg/oCvkoveXpH66sSOhF15dvhh7xxHRRjK8KS9GDn13tVWthySB8nT70P8QhkYnbM7fCIyAee59GkEsPXjQ6V4Vtz1n7Xbc5rQjnTQ+6CWABpdOlrjWL4S/Sh7IoTgNXiHdIRFSZ//9pzbYwKbKBNxMMHaJw6TBWhbVDbqunKHD7/TncoT+tvyk2OH2ShyflKyRZ/7+lhdcUIPR7x4/RnkLwXY2b3DMxXx8W+1QA0pn0UPIjZLtjTnmgFHN6M995oYuo9Mrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dd827HPsvBbns/j7gw5UZ9B7zDyrUeNWaRHKjcmMvLg=;
 b=ngev+AW0kz2C/G73LlQnaQ0QaAVpAdbbb4Jvka4cunyMWgX2bPXtYrM+RTpRGAAN9XG3sCs+LJwiqTKXLhxA8I4TobXK+YpAErKAr/REPGiVvAi6QRUgm8jY/NOeOyr5deqscByIoHnGQ1dsc54/ib66Wt3VzxHIQceLRyq8d58EzGQ2Sn0DIKNKajJmVJ0GUibOHJAeglCzWlr+MEIpQRw8pDM68m4GK4+MsVkpY6o7w/nPAEUy6GUJaxQWulacsu/yuWSaUSVGlL4mtwtpWq+fhakbhcRTCAj/aVeeoyYnr2fuOSd/WxoZuUxn/B2MuL6KIDuAiq84QT+5XfcK3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5358.namprd11.prod.outlook.com (2603:10b6:5:395::7) by
 MW4PR11MB6911.namprd11.prod.outlook.com (2603:10b6:303:22d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.26; Mon, 24 Oct
 2022 04:58:34 +0000
Received: from DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::b051:27b7:c1c1:7cb9]) by DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::b051:27b7:c1c1:7cb9%4]) with mapi id 15.20.5746.025; Mon, 24 Oct 2022
 04:58:34 +0000
From: Bin Meng <bin.meng@windriver.com>
To: qemu-devel@nongnu.org
Cc: Guohuai Shi <guohuai.shi@windriver.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>
Subject: [PATCH 09/16] hw/9pfs: Disable unsupported flags and features for
 Windows
Date: Mon, 24 Oct 2022 12:57:52 +0800
Message-Id: <20221024045759.448014-10-bin.meng@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: 9e3a05d1-3957-4800-febd-08dab57c6754
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BB+T/6x5EiBbcuSb2nxRnHr4PPqgWRSi4J83jL0U5GwWAjDeL1yVn6l7Yd5fVhU4hH9pZGYayBmyjZvYNBGE7H1CkQyXmy+cSgBoNrSfw+k8JltkK82NHvfYzJ7xYBbdldibGOfeUxTVZ4qylChlDU+5U+KD49b7YzLZ+KsHjcCQTA8Q9wv+nX9Lg0L5fsVnjNfMru0HCVGr7ap/Uwf8xThZfKmtj1J1l5gV9ttz+FsKy1o0WY9ERkPOll9BBbaI9/5tzVBjWpXIeGYJ3dVdspWCHM16mONfTxkfkoy/3utSynmRXwUuSY5DOsn6KLjT7fEe+WgOgOkpd8uReRKVtcW2RTuEMGQLdhWR5AUP0guYlVsN5iDIEVLJKExFZb53A8abVfvChBpNyhZSDU9fhuGK4qmdIAtIFsU4NQpdTOAGM2P8tHcuEf/zghr4x3/hUbkWZoAJr3h7hwo9ng170nUe72u5K4/3uRuY+hTZ0FVR7SO4/G76LOHurh/1vtwXojvp4Qimccz0Ecpw8fSlbQnXPY8ut1DxPHAWrVrqfIIZCCihGD0ldJVhQv43ebOBK6cgp7d7zJ5hYFF7w/nas/1X5VWzGPI3iVhJYzP7HuFaCGzK0bPr1BqRz9Lbkgasm1ZfwXG74zvv5nkw55MQXdYnzcbfg6k4kpu8NjLKONdmD71hJNDfTxTs8hs7NkMOpsBLUaViTfydNCnRwKVQlqRaeK9F7kAYkgdHo+COsDfN9/8lKH45ZcR99QKYySKv
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5358.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(396003)(39850400004)(346002)(136003)(366004)(451199015)(6666004)(6506007)(2616005)(52116002)(6512007)(26005)(1076003)(186003)(83380400001)(44832011)(2906002)(6916009)(54906003)(316002)(478600001)(6486002)(5660300002)(8936002)(41300700001)(66946007)(66556008)(4326008)(8676002)(66476007)(86362001)(36756003)(38100700002)(38350700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9bmjAgwlDObnM+OPxY7K+lodDqSfPcYpvHola0p9y5rlUFwuW3U9g20DcMfj?=
 =?us-ascii?Q?kgqMTdg167th6FZihUmtuZ/eJycQkFM5N1JXc/xIUKbvLJkB60HGnCzN8EPI?=
 =?us-ascii?Q?HBM0xNyX0kKDgi/ybcWpZIHAM98lRJD17zaI04GyOMxNeqXDPOQZ41WStzHo?=
 =?us-ascii?Q?6nYLwKd9lrqJ0UuCGEAMW8zh90fB3VMQMjV1wwQTUWj781U1GOhxhxSDBo4z?=
 =?us-ascii?Q?lFur+BAZGePVGbSDBkapDzRXhcBhSEyqDVSg8YT+45nZ8alRHTuzKqu3+SZ0?=
 =?us-ascii?Q?677iKBsdCvLopRyQyhldLkZ+VCbL3y56aBiuAdN2VNRLSpyyGdmGhpHuSYvh?=
 =?us-ascii?Q?F2IDgpC33jwF5pVqfMHnjEN4DobfVieOzxnL4uoYKHdzXqzjdU1s/g7c0b6e?=
 =?us-ascii?Q?Vfy/pe5RGlbor+rFvRK9UmgAf2JzQkgdhjZS5b/2LvjOABYHLNF3tVuNjz4C?=
 =?us-ascii?Q?uXiJ7muY5/yUBw/lH8MOdd5js9Jf8pa/85jCgoc4EPF16D+Oy3UXMgAdsWMW?=
 =?us-ascii?Q?yVFWgPzvZfBoPNKPk0PC0eUeOFaCNtDRwOVJibLoe4KmHTsb3TrRdVDXYpro?=
 =?us-ascii?Q?BKgQHXTtVkKGCB+4z785CTCUSpLzMSQMy8AxbyNdAbWY8TsmhfoivNCYuIFS?=
 =?us-ascii?Q?JN+AKfUs+vOAXCy8gbHeVq+Z8mWCLPaWjNtQyI1+kXQzM1OrI4mMCgs0bPdf?=
 =?us-ascii?Q?eCLtmRTmc7qXlJjfmaF3dfDeu8tJISxEp37TJmJt79y9ZeuX8rzJMBX7S+sP?=
 =?us-ascii?Q?+Uo79O/S/R+OM1qgD5eFFkFxjuOZnNZf5NBvhcrlPfg8Y4/jnzUr+qYxQIm2?=
 =?us-ascii?Q?R0nuo+gfKfniPeSyajUETxHDu9GXD4rR9ZJ3v7nXJAUkMycv7RRiVkjC8GnS?=
 =?us-ascii?Q?WgWvXYVznwwzSE7vRfb48qp4sh7pTN5DrBSsEzV+M1e16/aG0F8/r8wFn4Bb?=
 =?us-ascii?Q?ja+NWrv/BhM9ggFhx3NtCGl+3iuNLTA1yA24BvEHRVJS82TjtkINn8393SvV?=
 =?us-ascii?Q?IIVknK+79SRlhTwQgKlT2UiNeIIRlsAqaOVwEyYJ5ci0d+/ePS7kWKQdlaq3?=
 =?us-ascii?Q?23B/EfuM1+KOGiD3yrOVJO95C5BwjXAUhDD1zY4pZCin3Lbpwvi4WSBiio3d?=
 =?us-ascii?Q?Nxay0mGwLXTX6C27Rv3h2d62eZhewSiJzrcSejneov6+ZNIJ/7rANqvpEvNI?=
 =?us-ascii?Q?KimYDEP4m8M/49N+lQ06/jgqhJstGXISWl/NVxf4GB5lMATMp22f/rj/Fb8y?=
 =?us-ascii?Q?RCPKImXGi+E1+xptYaaqqXK6c34L9EJSpB63ESc7gYP5o11KYMGgHjcvHt0v?=
 =?us-ascii?Q?hBvl0kHhJZifQMlr4lLQz+/ccXQD5jy2v73bbXV+WNMNqAT9+Oyhx00IAMO+?=
 =?us-ascii?Q?QGnlwqt9y1TIFCmPtQoMNJZhmlc4H++DOeAqJAFN6pBz5KhPHRVdHbmhyY/+?=
 =?us-ascii?Q?Oou+KNzk4JJrnTH8JkOInly6Am1Anki/pGxjxu84NkWULDKN/1MXx8wHQGL/?=
 =?us-ascii?Q?Xi77eMxLmgs9mVYdMg8QSXXrvU9hq4hl2uTCcElBlALeQLs93dipAjQZdmQT?=
 =?us-ascii?Q?hGljhZU4xy8094ywiGju12XhhAwat+mdBYKpW9DLo2XkQtDsD3h+4XAlyczB?=
 =?us-ascii?Q?kw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e3a05d1-3957-4800-febd-08dab57c6754
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2022 04:58:34.1949 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gi+QT2KrK2OLmH0JYZObM0Cg1nqk7KCepHBwLwL+iOOKUpWmDAiBnA3F3ZKYRGJ4MF8QOcpixeVgGTSY/ssWFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6911
X-Proofpoint-ORIG-GUID: 5pssW_kazj2W5zlXIpo5YrBQuIAY3VeJ
X-Proofpoint-GUID: 5pssW_kazj2W5zlXIpo5YrBQuIAY3VeJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-23_02,2022-10-21_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 mlxlogscore=999 mlxscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210240031
Received-SPF: pass client-ip=205.220.166.238;
 envelope-from=prvs=72963f20b2=bin.meng@windriver.com;
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Guohuai Shi <guohuai.shi@windriver.com>

Some flags and features are not supported on Windows, like mknod,
readlink, file mode, etc. Update the codes for Windows.

Signed-off-by: Guohuai Shi <guohuai.shi@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 hw/9pfs/9p-util.h |  6 +++-
 hw/9pfs/9p.c      | 90 ++++++++++++++++++++++++++++++++++++++++++-----
 2 files changed, 86 insertions(+), 10 deletions(-)

diff --git a/hw/9pfs/9p-util.h b/hw/9pfs/9p-util.h
index 82b2d0c3e4..3d154e9103 100644
--- a/hw/9pfs/9p-util.h
+++ b/hw/9pfs/9p-util.h
@@ -53,8 +53,10 @@ static inline uint64_t makedev_dotl(uint32_t dev_major, uint32_t dev_minor)
  */
 static inline uint64_t host_dev_to_dotl_dev(dev_t dev)
 {
-#ifdef CONFIG_LINUX
+#if defined(CONFIG_LINUX)
     return dev;
+#elif defined(CONFIG_WIN32)
+    return 0;
 #else
     return makedev_dotl(major(dev), minor(dev));
 #endif
@@ -260,7 +262,9 @@ static inline struct dirent *qemu_dirent_dup(struct dirent *dent)
 #if defined CONFIG_DARWIN && defined CONFIG_PTHREAD_FCHDIR_NP
 int pthread_fchdir_np(int fd) __attribute__((weak_import));
 #endif
+#ifndef CONFIG_WIN32
 int qemu_mknodat(P9_FILE_ID dirfd, const char *filename, mode_t mode,
                  dev_t dev);
+#endif
 
 #endif
diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
index 6c4af86240..771aab34ac 100644
--- a/hw/9pfs/9p.c
+++ b/hw/9pfs/9p.c
@@ -39,6 +39,11 @@
 #include "qemu/xxhash.h"
 #include <math.h>
 
+#ifdef CONFIG_WIN32
+#define UTIME_NOW   ((1l << 30) - 1l)
+#define UTIME_OMIT  ((1l << 30) - 2l)
+#endif
+
 int open_fd_hw;
 int total_open_fd;
 static int open_fd_rc;
@@ -132,13 +137,17 @@ static int dotl_to_open_flags(int flags)
     DotlOpenflagMap dotl_oflag_map[] = {
         { P9_DOTL_CREATE, O_CREAT },
         { P9_DOTL_EXCL, O_EXCL },
+#ifndef CONFIG_WIN32
         { P9_DOTL_NOCTTY , O_NOCTTY },
+#endif
         { P9_DOTL_TRUNC, O_TRUNC },
         { P9_DOTL_APPEND, O_APPEND },
+#ifndef CONFIG_WIN32
         { P9_DOTL_NONBLOCK, O_NONBLOCK } ,
         { P9_DOTL_DSYNC, O_DSYNC },
         { P9_DOTL_FASYNC, FASYNC },
-#ifndef CONFIG_DARWIN
+#endif
+#ifdef CONFIG_LINUX
         { P9_DOTL_NOATIME, O_NOATIME },
         /*
          *  On Darwin, we could map to F_NOCACHE, which is
@@ -151,8 +160,10 @@ static int dotl_to_open_flags(int flags)
 #endif
         { P9_DOTL_LARGEFILE, O_LARGEFILE },
         { P9_DOTL_DIRECTORY, O_DIRECTORY },
+#ifndef CONFIG_WIN32
         { P9_DOTL_NOFOLLOW, O_NOFOLLOW },
         { P9_DOTL_SYNC, O_SYNC },
+#endif
     };
 
     for (i = 0; i < ARRAY_SIZE(dotl_oflag_map); i++) {
@@ -179,8 +190,11 @@ static int get_dotl_openflags(V9fsState *s, int oflags)
      * Filter the client open flags
      */
     flags = dotl_to_open_flags(oflags);
-    flags &= ~(O_NOCTTY | O_ASYNC | O_CREAT);
-#ifndef CONFIG_DARWIN
+    flags &= ~(O_CREAT);
+#ifndef CONFIG_WIN32
+    flags &= ~(O_NOCTTY | O_ASYNC);
+#endif
+#ifdef CONFIG_LINUX
     /*
      * Ignore direct disk access hint until the server supports it.
      */
@@ -986,9 +1000,11 @@ static int stat_to_qid(V9fsPDU *pdu, const struct stat *stbuf, V9fsQID *qidp)
     if (S_ISDIR(stbuf->st_mode)) {
         qidp->type |= P9_QID_TYPE_DIR;
     }
+#ifndef CONFIG_WIN32
     if (S_ISLNK(stbuf->st_mode)) {
         qidp->type |= P9_QID_TYPE_SYMLINK;
     }
+#endif
 
     return 0;
 }
@@ -1097,6 +1113,7 @@ static mode_t v9mode_to_mode(uint32_t mode, V9fsString *extension)
         ret |= S_IFDIR;
     }
 
+#ifndef CONFIG_WIN32
     if (mode & P9_STAT_MODE_SYMLINK) {
         ret |= S_IFLNK;
     }
@@ -1106,6 +1123,7 @@ static mode_t v9mode_to_mode(uint32_t mode, V9fsString *extension)
     if (mode & P9_STAT_MODE_NAMED_PIPE) {
         ret |= S_IFIFO;
     }
+#endif
     if (mode & P9_STAT_MODE_DEVICE) {
         if (extension->size && extension->data[0] == 'c') {
             ret |= S_IFCHR;
@@ -1118,6 +1136,7 @@ static mode_t v9mode_to_mode(uint32_t mode, V9fsString *extension)
         ret |= S_IFREG;
     }
 
+#ifndef CONFIG_WIN32
     if (mode & P9_STAT_MODE_SETUID) {
         ret |= S_ISUID;
     }
@@ -1127,6 +1146,7 @@ static mode_t v9mode_to_mode(uint32_t mode, V9fsString *extension)
     if (mode & P9_STAT_MODE_SETVTX) {
         ret |= S_ISVTX;
     }
+#endif
 
     return ret;
 }
@@ -1182,6 +1202,7 @@ static uint32_t stat_to_v9mode(const struct stat *stbuf)
         mode |= P9_STAT_MODE_DIR;
     }
 
+#ifndef CONFIG_WIN32
     if (S_ISLNK(stbuf->st_mode)) {
         mode |= P9_STAT_MODE_SYMLINK;
     }
@@ -1193,11 +1214,13 @@ static uint32_t stat_to_v9mode(const struct stat *stbuf)
     if (S_ISFIFO(stbuf->st_mode)) {
         mode |= P9_STAT_MODE_NAMED_PIPE;
     }
+#endif
 
     if (S_ISBLK(stbuf->st_mode) || S_ISCHR(stbuf->st_mode)) {
         mode |= P9_STAT_MODE_DEVICE;
     }
 
+#ifndef CONFIG_WIN32
     if (stbuf->st_mode & S_ISUID) {
         mode |= P9_STAT_MODE_SETUID;
     }
@@ -1209,6 +1232,7 @@ static uint32_t stat_to_v9mode(const struct stat *stbuf)
     if (stbuf->st_mode & S_ISVTX) {
         mode |= P9_STAT_MODE_SETVTX;
     }
+#endif
 
     return mode;
 }
@@ -1247,9 +1271,17 @@ static int coroutine_fn stat_to_v9stat(V9fsPDU *pdu, V9fsPath *path,
             return err;
         }
     } else if (v9stat->mode & P9_STAT_MODE_DEVICE) {
+        unsigned maj, min;
+
+#ifndef CONFIG_WIN32
+        maj = major(stbuf->st_rdev);
+        min = minor(stbuf->st_rdev);
+#else
+        maj = min = 0;
+#endif
         v9fs_string_sprintf(&v9stat->extension, "%c %u %u",
                 S_ISCHR(stbuf->st_mode) ? 'c' : 'b',
-                major(stbuf->st_rdev), minor(stbuf->st_rdev));
+                maj, min);
     } else if (S_ISDIR(stbuf->st_mode) || S_ISREG(stbuf->st_mode)) {
         v9fs_string_sprintf(&v9stat->extension, "%s %lu",
                 "HARDLINKCOUNT", (unsigned long)stbuf->st_nlink);
@@ -1317,7 +1349,14 @@ static int32_t blksize_to_iounit(const V9fsPDU *pdu, int32_t blksize)
 
 static int32_t stat_to_iounit(const V9fsPDU *pdu, const struct stat *stbuf)
 {
-    return blksize_to_iounit(pdu, stbuf->st_blksize);
+    int32_t blksize;
+
+#ifndef CONFIG_WIN32
+    blksize = stbuf->st_blksize);
+#else
+    blksize = 0;
+#endif
+    return blksize_to_iounit(pdu, blksize);
 }
 
 static int stat_to_v9stat_dotl(V9fsPDU *pdu, const struct stat *stbuf,
@@ -1332,7 +1371,11 @@ static int stat_to_v9stat_dotl(V9fsPDU *pdu, const struct stat *stbuf,
     v9lstat->st_rdev = host_dev_to_dotl_dev(stbuf->st_rdev);
     v9lstat->st_size = stbuf->st_size;
     v9lstat->st_blksize = stat_to_iounit(pdu, stbuf);
+#ifndef CONFIG_WIN32
     v9lstat->st_blocks = stbuf->st_blocks;
+#else
+    v9lstat->st_blocks = 0;
+#endif
     v9lstat->st_atime_sec = stbuf->st_atime;
     v9lstat->st_mtime_sec = stbuf->st_mtime;
     v9lstat->st_ctime_sec = stbuf->st_ctime;
@@ -1340,7 +1383,8 @@ static int stat_to_v9stat_dotl(V9fsPDU *pdu, const struct stat *stbuf,
     v9lstat->st_atime_nsec = stbuf->st_atimespec.tv_nsec;
     v9lstat->st_mtime_nsec = stbuf->st_mtimespec.tv_nsec;
     v9lstat->st_ctime_nsec = stbuf->st_ctimespec.tv_nsec;
-#else
+#endif
+#ifdef CONFIG_LINUX
     v9lstat->st_atime_nsec = stbuf->st_atim.tv_nsec;
     v9lstat->st_mtime_nsec = stbuf->st_mtim.tv_nsec;
     v9lstat->st_ctime_nsec = stbuf->st_ctim.tv_nsec;
@@ -2471,6 +2515,7 @@ static int coroutine_fn v9fs_do_readdir(V9fsPDU *pdu, V9fsFidState *fidp,
     struct dirent *dent;
     struct stat *st;
     struct V9fsDirEnt *entries = NULL;
+    unsigned char d_type = 0;
 
     /*
      * inode remapping requires the device id, which in turn might be
@@ -2540,10 +2585,13 @@ static int coroutine_fn v9fs_do_readdir(V9fsPDU *pdu, V9fsFidState *fidp,
         v9fs_string_init(&name);
         v9fs_string_sprintf(&name, "%s", dent->d_name);
 
+#ifndef CONFIG_WIN32
+        d_type = dent->d_type;
+#endif
         /* 11 = 7 + 4 (7 = start offset, 4 = space for storing count) */
         len = pdu_marshal(pdu, 11 + count, "Qqbs",
                           &qid, off,
-                          dent->d_type, &name);
+                          d_type, &name);
 
         v9fs_string_free(&name);
 
@@ -2873,8 +2921,12 @@ static void coroutine_fn v9fs_create(void *opaque)
         }
 
         nmode |= perm & 0777;
+#ifndef CONFIG_WIN32
         err = v9fs_co_mknod(pdu, fidp, &name, fidp->uid, -1,
                             makedev(major, minor), nmode, &stbuf);
+#else
+        err = -ENOTSUP;
+#endif
         if (err < 0) {
             goto out;
         }
@@ -2899,8 +2951,12 @@ static void coroutine_fn v9fs_create(void *opaque)
         v9fs_path_copy(&fidp->path, &path);
         v9fs_path_unlock(s);
     } else if (perm & P9_STAT_MODE_SOCKET) {
+#ifndef CONFIG_WIN32
         err = v9fs_co_mknod(pdu, fidp, &name, fidp->uid, -1,
                             0, S_IFSOCK | (perm & 0777), &stbuf);
+#else
+        err = -ENOTSUP;
+#endif
         if (err < 0) {
             goto out;
         }
@@ -3634,7 +3690,7 @@ out_nofid:
 
 static void coroutine_fn v9fs_mknod(void *opaque)
 {
-
+#ifndef CONFIG_WIN32
     int mode;
     gid_t gid;
     int32_t fid;
@@ -3691,6 +3747,10 @@ out:
 out_nofid:
     pdu_complete(pdu, err);
     v9fs_string_free(&name);
+#else
+    V9fsPDU *pdu = opaque;
+    pdu_complete(pdu, -1);
+#endif
 }
 
 /*
@@ -3963,7 +4023,7 @@ out_nofid:
 #if defined(CONFIG_LINUX)
 /* Currently, only Linux has XATTR_SIZE_MAX */
 #define P9_XATTR_SIZE_MAX XATTR_SIZE_MAX
-#elif defined(CONFIG_DARWIN)
+#elif defined(CONFIG_DARWIN) || defined(CONFIG_WIN32)
 /*
  * Darwin doesn't seem to define a maximum xattr size in its user
  * space header, so manually configure it across platforms as 64k.
@@ -3980,6 +4040,7 @@ out_nofid:
 
 static void coroutine_fn v9fs_xattrcreate(void *opaque)
 {
+#ifndef CONFIG_WIN32
     int flags, rflags = 0;
     int32_t fid;
     uint64_t size;
@@ -4041,10 +4102,15 @@ out_put_fid:
 out_nofid:
     pdu_complete(pdu, err);
     v9fs_string_free(&name);
+#else
+    V9fsPDU *pdu = opaque;
+    pdu_complete(pdu, -1);
+#endif
 }
 
 static void coroutine_fn v9fs_readlink(void *opaque)
 {
+#ifndef CONFIG_WIN32
     V9fsPDU *pdu = opaque;
     size_t offset = 7;
     V9fsString target;
@@ -4080,6 +4146,10 @@ out:
     put_fid(pdu, fidp);
 out_nofid:
     pdu_complete(pdu, err);
+#else
+    V9fsPDU *pdu = opaque;
+    pdu_complete(pdu, -1);
+#endif
 }
 
 static CoroutineEntry *pdu_co_handlers[] = {
@@ -4341,6 +4411,7 @@ void v9fs_reset(V9fsState *s)
 
 static void __attribute__((__constructor__)) v9fs_set_fd_limit(void)
 {
+#ifndef CONFIG_WIN32
     struct rlimit rlim;
     if (getrlimit(RLIMIT_NOFILE, &rlim) < 0) {
         error_report("Failed to get the resource limit");
@@ -4348,4 +4419,5 @@ static void __attribute__((__constructor__)) v9fs_set_fd_limit(void)
     }
     open_fd_hw = rlim.rlim_cur - MIN(400, rlim.rlim_cur / 3);
     open_fd_rc = rlim.rlim_cur / 2;
+#endif
 }
-- 
2.25.1


