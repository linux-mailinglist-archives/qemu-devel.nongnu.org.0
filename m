Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB1F650A35
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 11:37:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7DHQ-0003LM-UA; Mon, 19 Dec 2022 05:21:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9352c01a6b=bin.meng@windriver.com>)
 id 1p7DGs-0003Bk-Hp
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 05:21:25 -0500
Received: from mx0b-0064b401.pphosted.com ([205.220.178.238])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9352c01a6b=bin.meng@windriver.com>)
 id 1p7DGp-0007TR-7j
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 05:21:20 -0500
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BJ8ll8u020840; Mon, 19 Dec 2022 10:21:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=g563yM1dO4FRXYmwgQzW4faqLmoq9XWY38e28zrZGSA=;
 b=qlC3hDvYWIO6TWF1cYa+P7Yyo8gxH/+TAODVZH9YF/uK5XdqoAXM4maqmoJUlZYHpIJE
 tS8sxPKuoRsUSVN8UZaEJd/GIagLOUNgWPcd9oEleJy2w20p9kbv38b7NzPQKoMzNYvL
 kBblcw2o3zAuYgH2O6uckBciKzQIA95QEUg7xkyME/U3qzCaRrw0eCh348L7ejPQD8j0
 zfCZAFG1UxbIzM0k4qMsLPXVpnpDnjnYymbtAWC/LcpRWUFCUrKgJdIjPjiJBqhKLz0S
 YJSdj//UdaG46MIUtCM2UTMP7S4Ze2dZX0jvDTXGbBt0+0hVo1teC+CK9iduTOB6t6Wx 7w== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2101.outbound.protection.outlook.com [104.47.70.101])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mh4r99b7c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Dec 2022 10:21:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JmNy2noqtjiWNHgiwidlHaGxSnmPVng68gPZBnFjuRo8PPYfuF+oF8FwU3McQgvWPux03Xrexy1dx7/Ml3hi7cHWqcfsKRLXoqxj/3j1P5In5YbWPiasMGwR9UKUAVcXk9QLzBdEkIdHa/9EAH2XlxuM4iu0HExyMKNdycXcU/tzvnwD6dpcSpgRt7VcSRSwOTJ33d67lFPGCgrs2nT3WeQ/G7cJ0DVl5C/Rk78HNXRlq/cXwsf2BeA+E98JxY6xUQoTlWskJGI0mrD+582AvwBACWrekRoV9o2rJYD4BwR1Sycl6bW6WxH/CZd7FO8rDoKPz3lYpMdhKRxuBghcfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g563yM1dO4FRXYmwgQzW4faqLmoq9XWY38e28zrZGSA=;
 b=iiGok9pHnLDCovqegroNFIQ1aauk18YjEV0oPjcb/acR6Hntsvkki3Mcdkf8afTi2CkA+8JTqzJFtyds9w5u6JGc8rFIuVlVEuIuGF1ig4oPcFf8tnZkrSyUwNYUqzgCNY6YsXUTGKujwqKzj5+UJbiIhrMX2Dw/RPFSwOgY4Y3DHDUoM1BNcjnu8dzkdh0nIaEZ0CfLCgcqdmpucBT6EhfBDUOLmkeI9WatNN+CT1hWGcUfkC8xmPD7fm33SdaGfzhylnt1qjv7W1EpOK4Y9C7InUYpj0Rks4ECESpph1h88BOiiWeW45zzd4yOBkd1vtDvuAKhFMMmVzWvM+QeFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5358.namprd11.prod.outlook.com (2603:10b6:5:395::7) by
 DM6PR11MB4691.namprd11.prod.outlook.com (2603:10b6:5:2a6::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5924.16; Mon, 19 Dec 2022 10:21:05 +0000
Received: from DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::8e5e:71da:1e29:bc15]) by DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::8e5e:71da:1e29:bc15%5]) with mapi id 15.20.5880.019; Mon, 19 Dec 2022
 10:21:05 +0000
From: Bin Meng <bin.meng@windriver.com>
To: Greg Kurz <groug@kaod.org>, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 qemu-devel@nongnu.org
Cc: Guohuai Shi <guohuai.shi@windriver.com>
Subject: [PATCH v3 10/17] hw/9pfs: Disable unsupported flags and features for
 Windows
Date: Mon, 19 Dec 2022 18:20:14 +0800
Message-Id: <20221219102022.2167736-11-bin.meng@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: c865bed6-b122-460f-7077-08dae1aabca2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hvwX0n3mMEIHlNFhH50CEbLq5UIO0S83EsERTyjkRQyJdhDtFhTU+0RlMdKZQ2alTorcPwarMwYilgfG4MSnt7TYUW4jmWkg3xRkxjJEms7MOsyFfxL0ZcWR/5/DIi4h62QUvJdfQSVRFOBFiqx6tmUbOapmRLHRR+kT7wqZLpltglD9NmH0DKXvH1layLDCeG17PrwQol+gWYmYaoTZLlFKB/r4k6XxQC5XKcCgXbD5Azt2zbXS1L5dMCDzamr4bdcvJbgVAlCOICKUGEoo0wqvFXG1jSVLy0DRaGzDhMjL7770FlrMTWnnFFEAA0bX8yU5TTxOGP/rzToRjYDRhAzxVdWimPfNaD5q9A1SK/bNRZjCSIq+dtYUBWoh6O6MU8klapVRm+tiR4Ox03JiIZ1PYqgPJ1TfEfJaDIOuI8GstpRMrU594e4rY2OKUQDa6KRyDHBvb4fo5HtO25167bhp+COCHWSXiW97M2aUBI53aob5xtL5UGcC6hTRSBeAKKlWpefLZ4Gm07ysgvhPtWe0jye/CccTFCzgmeamXPEv+6O7CZ5uwW78mT7hAc61X1G6wgKSWouN7YLkU2ANidSA+QqgEugFCQv5HUDETmK83iUMcrZYQj0eApiwqkwOnlPDPnBYnZzCohC9FmYECljWAyt9zJDWTTyI9Q/hG18chAMw6RQONy/wVBomLdI6rA4FxiZJBOO0QOcnS0/nCg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5358.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39840400004)(136003)(376002)(346002)(366004)(396003)(451199015)(5660300002)(6666004)(107886003)(8936002)(83380400001)(186003)(26005)(6512007)(44832011)(2906002)(41300700001)(36756003)(6486002)(110136005)(1076003)(38350700002)(52116002)(316002)(478600001)(4326008)(38100700002)(8676002)(66476007)(2616005)(6506007)(66946007)(66556008)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GcjArosQ+m0xJpHm8HBLlI6JMQpQphhU+WOdcCsoRN8mLnfOh8nvZxT1rP7F?=
 =?us-ascii?Q?7QeUq7MYOL9N9SjcLFEmkzj206F8QQv14WT5nl8oT3M/vIwDkW2f8fGcdcoa?=
 =?us-ascii?Q?ZtAfBIbdonpC0YZM+4ZW9xbkmRiYeo6jBFZCBGm1wLFzsD9sXeQch4BLyZnO?=
 =?us-ascii?Q?Erm+P3IwUe2grwNAcgD2xN8jj8fMi8uSFFlR65W1duf0LF1FaTey43KtHocE?=
 =?us-ascii?Q?bXtMAg+hc6KNFwkBesZFnprfNDlZYys1p448Oq1d+SwUcLscc2G25TsfNKTa?=
 =?us-ascii?Q?oNnBF4ZYw3K6HoX+PhTS1XQ9NREoKxOSCQ4soTtSo5fTV4bbJdFmr0mpeR/P?=
 =?us-ascii?Q?lBExGjE+vl3U/519e+7ki77ARP+35TpARuICuszBLQkXYWIAegP7KSAiea4O?=
 =?us-ascii?Q?PjwSAEIJ3JEEkNfjViS/JRlHr+odsFaTdkCwmo0DZj0/6Pkmg0q6V8sBpzuz?=
 =?us-ascii?Q?hMouX3vULaBZG9ieeYvqpGfb9gutlENKc1VhBfENhZS9ikeOASwUkxVqCdI5?=
 =?us-ascii?Q?ZwJR+1eBoIKx4R3uYBAcyVJvFoUkZv7HQKgsD9nHYZrNJL2fVb/EkWCppyOR?=
 =?us-ascii?Q?sFDlPQ09vzorMlS2TIwtRzvEdWrgQiy8s4R7tUe5KCv69cgiT3qCuBhpVeTI?=
 =?us-ascii?Q?J8OUW1JkQAGIssxQn4q9rvE7dEufFYKrZ4nWXZoGOZeUNdOWgNlHGjSscj+D?=
 =?us-ascii?Q?lGiSBNDKsLAUPUHeF1daR0deL3KbN1S6Z7D2Ea3jfrAObY/NWoN3eav+womf?=
 =?us-ascii?Q?i7nhFwP1s9rOxMsh0pdHRfN9PfAhbpYh03/QMe+pSxDIdviITUO3+wthcz4B?=
 =?us-ascii?Q?Hpk7DwF96rno6FIXImBf/m+QISu5yRvn6vOuoEj7/s2lkk7PuGkeN6PauhLo?=
 =?us-ascii?Q?+N5ijcRyi2VlXbXeTB/vCd5gyQKFg6/tV9cwxXok6D30s1aMsU04Klnyp3mY?=
 =?us-ascii?Q?YIy67LPqKhXQPfA5DWA7hwL08G/Rnn9Si0lQ9T7siclg/6c0260zAXOqzzt3?=
 =?us-ascii?Q?SdGdiCfAXDK833cu4jemdX8S7yv4fldMtd9AcVpfVyqsmtbJ41FxjJ7OhYLW?=
 =?us-ascii?Q?uaHOwJWS9Rhi8BCm7mt4/WEakq0VrsXbah+cDDRafDILLGW3X1MBkNkqsMkF?=
 =?us-ascii?Q?b6uyReZuLbcSGtuCNVfVxdfxlUQ1fRjZN1t+07fglSdGMv5rUMPI1qxFTAhH?=
 =?us-ascii?Q?4V2PjzXvqJRiMwR9RmULWe+g5F5SCNDFeWOwUCeTQcMgcdIMAiRlSnZKRUk9?=
 =?us-ascii?Q?M/9Y6xBO/FKK/YY6Qmdr40ov3njdSQ9cSiUi5G4GVB++Vsb+UlCKd+2UJvTQ?=
 =?us-ascii?Q?15hSHuYBrU3y5UgGGLpMymzGxSAyNHLL/wyC6cDW7DhZHeqOgUio4PR1s/mc?=
 =?us-ascii?Q?PjcPKcDDCJLzbzL62GciiRSN6rryL5LMkaDDKlOKEKd97uOEvtvZ4BTpHqhH?=
 =?us-ascii?Q?MEVQhCflLs5bG3C1Spm/03ZqYlhrF5bGtUq3A+9HfcKh9bFKVCGA+mIq1AYH?=
 =?us-ascii?Q?A+VKiR71lMW/JdbwL/Do4W4PWlFpABN9PxFBBQPcC7vnwfitoIr2e2ei6vw8?=
 =?us-ascii?Q?95K+gxjYSJC5sbSQmAM0xS6ikIM2JeFXTn8aurgp?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c865bed6-b122-460f-7077-08dae1aabca2
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2022 10:21:05.3516 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pgCItmwWtL2G8l9K3DdalSP6B63BySvZLU3/XPYJ8GzInzuQhQ7W2wMZ0ngMKttcJ/43cdpHPH7XKq9U72+Ihw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4691
X-Proofpoint-GUID: tpSp5-ESVS-eLfsY9_vCnkQdHLSI-Yxr
X-Proofpoint-ORIG-GUID: tpSp5-ESVS-eLfsY9_vCnkQdHLSI-Yxr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-18_13,2022-12-15_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0
 mlxlogscore=999 priorityscore=1501 clxscore=1015 phishscore=0
 lowpriorityscore=0 impostorscore=0 mlxscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212190091
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

Some flags and features are not supported on Windows, like mknod,
readlink, file mode, etc. Update the codes for Windows.

Signed-off-by: Guohuai Shi <guohuai.shi@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

(no changes since v1)

 hw/9pfs/9p.c | 45 ++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 38 insertions(+), 7 deletions(-)

diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
index def85a57fa..2497a06f43 100644
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
+#if !defined(CONFIG_DARWIN) && !defined(CONFIG_WIN32)
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
+#if !defined(CONFIG_DARWIN) && !defined(CONFIG_WIN32)
     /*
      * Ignore direct disk access hint until the server supports it.
      */
@@ -1117,12 +1131,14 @@ static mode_t v9mode_to_mode(uint32_t mode, V9fsString *extension)
     if (mode & P9_STAT_MODE_SYMLINK) {
         ret |= S_IFLNK;
     }
+#ifndef CONFIG_WIN32
     if (mode & P9_STAT_MODE_SOCKET) {
         ret |= S_IFSOCK;
     }
     if (mode & P9_STAT_MODE_NAMED_PIPE) {
         ret |= S_IFIFO;
     }
+#endif
     if (mode & P9_STAT_MODE_DEVICE) {
         if (extension->size && extension->data[0] == 'c') {
             ret |= S_IFCHR;
@@ -1203,6 +1219,7 @@ static uint32_t stat_to_v9mode(const struct stat *stbuf)
         mode |= P9_STAT_MODE_SYMLINK;
     }
 
+#ifndef CONFIG_WIN32
     if (S_ISSOCK(stbuf->st_mode)) {
         mode |= P9_STAT_MODE_SOCKET;
     }
@@ -1210,6 +1227,7 @@ static uint32_t stat_to_v9mode(const struct stat *stbuf)
     if (S_ISFIFO(stbuf->st_mode)) {
         mode |= P9_STAT_MODE_NAMED_PIPE;
     }
+#endif
 
     if (S_ISBLK(stbuf->st_mode) || S_ISCHR(stbuf->st_mode)) {
         mode |= P9_STAT_MODE_DEVICE;
@@ -1369,7 +1387,8 @@ static int stat_to_v9stat_dotl(V9fsPDU *pdu, const struct stat *stbuf,
     v9lstat->st_atime_nsec = stbuf->st_atimespec.tv_nsec;
     v9lstat->st_mtime_nsec = stbuf->st_mtimespec.tv_nsec;
     v9lstat->st_ctime_nsec = stbuf->st_ctimespec.tv_nsec;
-#else
+#endif
+#ifdef CONFIG_LINUX
     v9lstat->st_atime_nsec = stbuf->st_atim.tv_nsec;
     v9lstat->st_mtime_nsec = stbuf->st_mtim.tv_nsec;
     v9lstat->st_ctime_nsec = stbuf->st_ctim.tv_nsec;
@@ -2492,6 +2511,7 @@ static int coroutine_fn v9fs_do_readdir(V9fsPDU *pdu, V9fsFidState *fidp,
     struct dirent *dent;
     struct stat *st;
     struct V9fsDirEnt *entries = NULL;
+    unsigned char d_type = 0;
 
     /*
      * inode remapping requires the device id, which in turn might be
@@ -2553,10 +2573,13 @@ static int coroutine_fn v9fs_do_readdir(V9fsPDU *pdu, V9fsFidState *fidp,
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
 
@@ -2912,8 +2935,12 @@ static void coroutine_fn v9fs_create(void *opaque)
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
@@ -3983,7 +4010,7 @@ out_nofid:
 #if defined(CONFIG_LINUX)
 /* Currently, only Linux has XATTR_SIZE_MAX */
 #define P9_XATTR_SIZE_MAX XATTR_SIZE_MAX
-#elif defined(CONFIG_DARWIN)
+#elif defined(CONFIG_DARWIN) || defined(CONFIG_WIN32)
 /*
  * Darwin doesn't seem to define a maximum xattr size in its user
  * space header, so manually configure it across platforms as 64k.
@@ -4000,6 +4027,8 @@ out_nofid:
 
 static void coroutine_fn v9fs_xattrcreate(void *opaque)
 {
+    V9fsPDU *pdu = opaque;
+#ifndef CONFIG_WIN32
     int flags, rflags = 0;
     int32_t fid;
     uint64_t size;
@@ -4008,7 +4037,6 @@ static void coroutine_fn v9fs_xattrcreate(void *opaque)
     size_t offset = 7;
     V9fsFidState *file_fidp;
     V9fsFidState *xattr_fidp;
-    V9fsPDU *pdu = opaque;
 
     v9fs_string_init(&name);
     err = pdu_unmarshal(pdu, offset, "dsqd", &fid, &name, &size, &flags);
@@ -4061,6 +4089,9 @@ out_put_fid:
 out_nofid:
     pdu_complete(pdu, err);
     v9fs_string_free(&name);
+#else
+    pdu_complete(pdu, -1);
+#endif
 }
 
 static void coroutine_fn v9fs_readlink(void *opaque)
-- 
2.25.1


