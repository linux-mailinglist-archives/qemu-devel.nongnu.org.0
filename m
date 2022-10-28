Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A3E2610967
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 07:00:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooHRj-0003ji-Ln; Fri, 28 Oct 2022 00:58:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7300ee25fa=bin.meng@windriver.com>)
 id 1ooHRg-0003ip-Ie
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 00:58:16 -0400
Received: from mx0b-0064b401.pphosted.com ([205.220.178.238])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7300ee25fa=bin.meng@windriver.com>)
 id 1ooHRe-000262-KJ
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 00:58:16 -0400
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 29S4vKLF032280; Fri, 28 Oct 2022 04:58:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=XTajlg8zWR4ljYU7tENX2Jx3IUIKPhlrual8lt7JCD0=;
 b=TMtDiArbAkTsJG8Lv79HuNzEaA1hokKkq+RDGjPj7lhTZS9/rqFPE90plgvvUhx829Gp
 VBY7t3/1vcPQuWtxENn40n9GR87TlAoppC9hdF7O/lw7rQwjb1VIUi93WFVzB4BpiL9e
 28ajA0B5/6AnH2LuYhle6131bf6Lk1w4MLrP7zt6glew17cMLoZkS34Hav9lqjvVlwOd
 k7OiTtoSQfROq6xLR3DKPA4AhcYi2xt0pHhAAtCtT+sHgp5kBQ5x+TJGZ4k66GsomFrE
 q+YddVuzSspv8fR52jdtA8ZbpRVUhF/bvvS0RfIn2T9XnqY3f+53RSwswL4x3yQLKz/1 Rg== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2171.outbound.protection.outlook.com [104.47.59.171])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kfg56h33t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Oct 2022 04:58:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J8cdFDI9ekHsUprn1sZtfvfFb3GW27rkPyvf3Yth44gdoWd2RmQ205S4HAbjbqbNeRKjveVp6Xo6lQBNhdrIG5fwd+NbcvQ5r7zA6pRUlRi63xNG/xOo2NRPiL1DFDJroZZQA8VU9SS3uJhntm1R/aSZcrA/F+3rza+ru1LQhhM8nNKRuJ/nRM8urpq0SX4WquZ0w3rX+jtVXpb17F4tFh6dFN1tkzJQ3wOQgYb+65fUkFtrC+zWHzXIzZuJfpOJPlrMXbwpbYUyG17fjT1PaZ9RBSqLl19iJcWi2zCw4rYSmz3I7kR/JBHPUrwPpynkj/AV8HN7rC1dxr+V7o0l4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XTajlg8zWR4ljYU7tENX2Jx3IUIKPhlrual8lt7JCD0=;
 b=ef8n7+TC6RnKHZNcNTQxLfh9hAkPMDcpERpLE0lz5Tdu2sJM7OCPup/7dWAiWMnXk8HqyGuoUd/4cVQu9FxeYtC6XYPfUAWWfeXGDb7gjyhO7zZgs1qo9DsAoTIxFU4CdxRrkVBQKn0BkOLTSDVkSUT0Wu0fmjKS1N8M58FwUvc7Dz05UxQtBkqEhRkKdT2vGlcIA5oDq49D8UL6/wzEKZY6cHNgDaDgUcS5pJOfmrk2rT1qcvP/gbrt+NHazri8+61AA9ERf4r+oCzOT/vkkgo943VTNtu2zCgsjTXSg+sL7k+NjtmHHpZUzwfP+eHmX93EebZ6lhJch4m3B2tOzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BL1PR11MB5351.namprd11.prod.outlook.com (2603:10b6:208:318::5)
 by MN2PR11MB4632.namprd11.prod.outlook.com (2603:10b6:208:24f::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Fri, 28 Oct
 2022 04:58:09 +0000
Received: from BL1PR11MB5351.namprd11.prod.outlook.com
 ([fe80::9a11:fa81:cdd8:b201]) by BL1PR11MB5351.namprd11.prod.outlook.com
 ([fe80::9a11:fa81:cdd8:b201%9]) with mapi id 15.20.5746.026; Fri, 28 Oct 2022
 04:58:09 +0000
From: Bin Meng <bin.meng@windriver.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Xuzhou Cheng <xuzhou.cheng@windriver.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: [PATCH v6 03/11] tests/qtest: Support libqtest to build and run on
 Windows
Date: Fri, 28 Oct 2022 12:57:28 +0800
Message-Id: <20221028045736.679903-4-bin.meng@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221028045736.679903-1-bin.meng@windriver.com>
References: <20221028045736.679903-1-bin.meng@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2PR04CA0009.apcprd04.prod.outlook.com
 (2603:1096:100:2d::21) To BL1PR11MB5351.namprd11.prod.outlook.com
 (2603:10b6:208:318::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5351:EE_|MN2PR11MB4632:EE_
X-MS-Office365-Filtering-Correlation-Id: e1a7a26e-3d81-4844-e6ea-08dab8a101f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Yp9ofU6DUF1k5g9Z0ZIpLA6O2akGo5HWubfIIl2EfFW9SF2WpcnHotc0Rs3hmkOyhRQuRbc2yUS2wqYF3evVLAi7m57zcGtryLIZsW13RCN+2yRX0/Q49Fnq/wM3VJRrKl/mR4O5+iBldYJR8o+G/0nMiYYCr77fSXH5xh/jP7JN5eMZkxRk1bEaVFqo8OiiWK+rVouUlka/oGhgn70hBn/HnN6fjCIS3AlBxOJIB+YlvN4YrOPbSFYWuqcP7j4yge9emA6NeacEt64CQpSxoBy/U3groBSmsGPkxHU8cfEYW9Lm0qC9koB+RZ8QXL0eyX0/39bwYXOU9OlO3K6w1DV+2UUYWutTiDc1JhCHkXwrmmcFHsw+kvwKFiG9y/0WM8sNog/NTg2MZ6gXVrhEgQRQ96FvhywEnbiUmbnR/fWWcTiv7MsBk0PNwVFqM8/2kWRyRTtSJwVNI5JegYOu6YVih2y7nB6dSNAg+6H/92eXmEy3lfbduL+3l1eA+Ii5WhG7AltpkbGFpGsjz6caxc7nwA9vbxB5kwkWwGr7tfY3uGRVUsD62UkSwnIsHsE6HB+nOcCeVPwDOBmcP3uLUgAoSPTEi9CJKb036ASLklxuit6KIatJ0layR2iAKMldCPqRNPGALGHg0w3so4NqFyjf2daw5KIj13fFOqDUTtcMdoybb5tkD2IwB6rvtB7/jszK0hs++x7NiSGwMx8sDCEu5NrVfw6mq0rb70uE2kWBlKit+2uO+0SQwwgYmoXNYk6j6FB0EAQPBcVduTGt6A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5351.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(376002)(39850400004)(346002)(366004)(396003)(451199015)(478600001)(26005)(6486002)(6506007)(36756003)(2906002)(83380400001)(52116002)(6666004)(86362001)(5660300002)(38100700002)(38350700002)(2616005)(316002)(186003)(1076003)(6512007)(66476007)(8676002)(54906003)(4326008)(6916009)(41300700001)(66946007)(66556008)(44832011)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6kz0NzbCHYPcfqBh9Z8zAex1gfB3Kfkz7FbBdg6QaApxboB/rYiSqwxfEknS?=
 =?us-ascii?Q?B8945zZjgvmm0bO5+hRYWmBAs23FZhVrva1p8ImRAipzQ2G4zEQ88LsCbXKv?=
 =?us-ascii?Q?qvn8lftH50KOlR9udx5hmDb1PoY+GpYUtfcaRSN1CB75rJwyfB0JQ6ozx28X?=
 =?us-ascii?Q?344UT4KD6syrE/zhxXMyc0ecv/CnoKae7jwx579BZ6Q0Re02XQFk/pDu+d3j?=
 =?us-ascii?Q?QNCF3ape1KbCk+uk+3ZQ8pPmtA5on7AJqv0nu+N+Etg5p5Vaet4uk/fuyl2Z?=
 =?us-ascii?Q?wHKpJTGbbqrePCcXUYYpNZ5sK3sBXSi4YTJlZrq8ehvdmieqhKZFxZj7gt8i?=
 =?us-ascii?Q?lDcc16t7Oz0jwHET7I9ukL4UzTSW4hM383pJ2zVka0I3T52NEsqef9xaWLXN?=
 =?us-ascii?Q?8r/ktuQpEpDuuFTKoiGob+T1OG8CS2KKmHzHMkfZRALjwDj//bhatsbyM1ve?=
 =?us-ascii?Q?2pY7A3UV/Lrmh5ZfqdSnNBYDE6V1q/MV7CQTlFYUGoCdN7T4JUG/JaOOU1ZG?=
 =?us-ascii?Q?mTuOWB1tWnoHywGfjQ7qg7sXZVS0idlJoPB2pa1dZi5EGI1PJ+jkFGuqrqqb?=
 =?us-ascii?Q?NsvOXqygAY9SbGhND+6r8Oy2rOzt60Uy7TnPaCBHJxkCUDOkv7/RaaWlVMVG?=
 =?us-ascii?Q?2fDbRNmnwr+1dqQ4aeuoXakYNLb7ZUKt9MuXvg6hAykEqrba9a66ks8gNlSz?=
 =?us-ascii?Q?Ar1LvREMdV7D3NOH3QRa7oE4mEB/tizEd6KI7/QBYeZghcz6OuUDmv8QJ7eg?=
 =?us-ascii?Q?8Knu5oeCV7fkw5fl5mIftcelBoYlJBGPFUBTba8f9mb4bJGctuU8PIwHxfkP?=
 =?us-ascii?Q?f0PAwfmrnmOrH/UrPaZdaMIUtpUx7AnWDx8WxD2xUaKsGft1UXqpyjQLj0KX?=
 =?us-ascii?Q?jiyCiSbG1ige23BVtPMnKfRrQtAIOMYPjym/XMasDGB1K86/8WVuZuxatmZJ?=
 =?us-ascii?Q?7JtHKi/Q8gCFlo2XdxTkSavoRUd/M2gMhk64dsaRF1On73+6yUCU+O6Z6clK?=
 =?us-ascii?Q?dO5KxLIQXgPI8MVsMdi/SlyS1GNwXzjo2frTPdcrNdRx+GaOAnYqjNcZ0hvu?=
 =?us-ascii?Q?v8qWQpWpyxXD3L+/EfCVrTosirP2fyL7SSMV9HsZDkmi0FZQfOUeZ+zgcJD4?=
 =?us-ascii?Q?YWMvOD8tFz5uR6auBMog6rZkVfu+2BGLdJ40W9uWUHJlGzdsBBRIX0Sbgn+n?=
 =?us-ascii?Q?UvKYggyTZiUxHJbFjYXTL2kVvc0m/nRY1JQKWdIxErSK5rmb8kzJKAYL75Vz?=
 =?us-ascii?Q?R0OzGgkKkLSS7hv6puLude1u/FgG9qaCHD8lCt5b8ZT0zAryIwcEiottoaXk?=
 =?us-ascii?Q?m2n+82cnu5PUCdJPJ1Pgs15TdFcoqgIAAN6hsX3Ld6YMJNTQJ90ZJVhEeopd?=
 =?us-ascii?Q?ZWl04iYo2PbQZeQ2m05bnrBMY0qpvtNdeE+FAQITBUyXQbTDvyly3ixkVeXQ?=
 =?us-ascii?Q?h+XLXtWEybrUZQxqKaJ5P0CucCdAUFcpqHx68dQQoJq1MOuOUejDE7Q+gpgn?=
 =?us-ascii?Q?Gx6PWVSnNSdNsdB+Nn+ihunlNJZpSJhOY+ySBFj/6SrEWaKfXYBSpgF/BegA?=
 =?us-ascii?Q?8q2RVYDnCk9gYCXnn25najj4dbFItHL7LmyOM2Lu?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1a7a26e-3d81-4844-e6ea-08dab8a101f2
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5351.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2022 04:58:09.4536 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pzQOl6dKQCjskfwUrJdwWl9oVUgVDgT3x/wBA0DXzw6lIMf4MK7PaGa2dsTY6c1wnXJgwFXjlQZcrjJcDq1zhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4632
X-Proofpoint-GUID: BaAXBUj_YgImiZszJXEpSfdnKcViPu69
X-Proofpoint-ORIG-GUID: BaAXBUj_YgImiZszJXEpSfdnKcViPu69
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-28_02,2022-10-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 adultscore=0 bulkscore=0 lowpriorityscore=0 mlxscore=0 suspectscore=0
 mlxlogscore=989 impostorscore=0 phishscore=0 malwarescore=0 clxscore=1015
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2210280030
Received-SPF: pass client-ip=205.220.178.238;
 envelope-from=prvs=7300ee25fa=bin.meng@windriver.com;
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

At present the libqtest codes were written to depend on several
POSIX APIs, including fork(), kill() and waitpid(). Unfortunately
these APIs are not available on Windows.

This commit implements the corresponding functionalities using
win32 native APIs. With this change, all qtest cases can build
successfully on a Windows host, and we can start qtest testing
on Windows now.

Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>

---

Changes in v6:
- save the "exit_code" in struct QTestState

Changes in v2:
- Move the enabling of building qtests on Windows to a separate
  patch to keep bisectablity
- Call socket_init() unconditionally
- Add a missing CloseHandle() call

 tests/qtest/libqtest.c | 96 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 94 insertions(+), 2 deletions(-)

diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index b01846fd98..d12a604d78 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -16,9 +16,11 @@
 
 #include "qemu/osdep.h"
 
+#ifndef _WIN32
 #include <sys/socket.h>
 #include <sys/wait.h>
 #include <sys/un.h>
+#endif /* _WIN32 */
 #ifdef __linux__
 #include <sys/prctl.h>
 #endif /* __linux__ */
@@ -36,6 +38,16 @@
 #define MAX_IRQ 256
 #define SOCKET_TIMEOUT 50
 
+#ifndef _WIN32
+# define CMD_EXEC   "exec "
+# define DEV_STDERR "/dev/fd/2"
+# define DEV_NULL   "/dev/null"
+#else
+# define CMD_EXEC   ""
+# define DEV_STDERR "2"
+# define DEV_NULL   "nul"
+#endif
+
 typedef void (*QTestSendFn)(QTestState *s, const char *buf);
 typedef void (*ExternalSendFn)(void *s, const char *buf);
 typedef GString* (*QTestRecvFn)(QTestState *);
@@ -58,6 +70,9 @@ struct QTestState
     int qmp_fd;
     pid_t qemu_pid;  /* our child QEMU process */
     int wstatus;
+#ifdef _WIN32
+    DWORD exit_code;
+#endif
     int expected_status;
     bool big_endian;
     bool irq_level[MAX_IRQ];
@@ -119,10 +134,18 @@ bool qtest_probe_child(QTestState *s)
     pid_t pid = s->qemu_pid;
 
     if (pid != -1) {
+#ifndef _WIN32
         pid = waitpid(pid, &s->wstatus, WNOHANG);
         if (pid == 0) {
             return true;
         }
+#else
+        GetExitCodeProcess((HANDLE)pid, &s->exit_code);
+        if (s->exit_code == STILL_ACTIVE) {
+            return true;
+        }
+        CloseHandle((HANDLE)pid);
+#endif
         s->qemu_pid = -1;
     }
     return false;
@@ -136,13 +159,25 @@ void qtest_set_expected_status(QTestState *s, int status)
 void qtest_kill_qemu(QTestState *s)
 {
     pid_t pid = s->qemu_pid;
+#ifndef _WIN32
     int wstatus;
+#else
+    DWORD ret;
+#endif
 
     /* Skip wait if qtest_probe_child already reaped.  */
     if (pid != -1) {
+#ifndef _WIN32
         kill(pid, SIGTERM);
         TFR(pid = waitpid(s->qemu_pid, &s->wstatus, 0));
         assert(pid == s->qemu_pid);
+#else
+        TerminateProcess((HANDLE)pid, s->expected_status);
+        ret = WaitForSingleObject((HANDLE)pid, INFINITE);
+        assert(ret == WAIT_OBJECT_0);
+        GetExitCodeProcess((HANDLE)pid, &s->exit_code);
+        CloseHandle((HANDLE)pid);
+#endif
         s->qemu_pid = -1;
     }
 
@@ -150,6 +185,7 @@ void qtest_kill_qemu(QTestState *s)
      * Check whether qemu exited with expected exit status; anything else is
      * fishy and should be logged with as much detail as possible.
      */
+#ifndef _WIN32
     wstatus = s->wstatus;
     if (WIFEXITED(wstatus) && WEXITSTATUS(wstatus) != s->expected_status) {
         fprintf(stderr, "%s:%d: kill_qemu() tried to terminate QEMU "
@@ -166,6 +202,14 @@ void qtest_kill_qemu(QTestState *s)
                 __FILE__, __LINE__, sig, signame, dump);
         abort();
     }
+#else
+    if (s->exit_code != s->expected_status) {
+        fprintf(stderr, "%s:%d: kill_qemu() tried to terminate QEMU "
+                "process but encountered exit status %ld (expected %d)\n",
+                __FILE__, __LINE__, s->exit_code, s->expected_status);
+        abort();
+    }
+#endif
 }
 
 static void kill_qemu_hook_func(void *s)
@@ -244,6 +288,38 @@ static const char *qtest_qemu_binary(void)
     return qemu_bin;
 }
 
+#ifdef _WIN32
+static pid_t qtest_create_process(char *cmd)
+{
+    STARTUPINFO si;
+    PROCESS_INFORMATION pi;
+    BOOL ret;
+
+    ZeroMemory(&si, sizeof(si));
+    si.cb = sizeof(si);
+    ZeroMemory(&pi, sizeof(pi));
+
+    ret = CreateProcess(NULL,   /* module name */
+                        cmd,    /* command line */
+                        NULL,   /* process handle not inheritable */
+                        NULL,   /* thread handle not inheritable */
+                        FALSE,  /* set handle inheritance to FALSE */
+                        0,      /* No creation flags */
+                        NULL,   /* use parent's environment block */
+                        NULL,   /* use parent's starting directory */
+                        &si,    /* pointer to STARTUPINFO structure */
+                        &pi     /* pointer to PROCESS_INFORMATION structure */
+                        );
+    if (ret == 0) {
+        fprintf(stderr, "%s:%d: unable to create a new process (%s)\n",
+                __FILE__, __LINE__, strerror(GetLastError()));
+        abort();
+    }
+
+    return (pid_t)pi.hProcess;
+}
+#endif /* _WIN32 */
+
 QTestState *qtest_init_without_qmp_handshake(const char *extra_args)
 {
     QTestState *s;
@@ -271,6 +347,7 @@ QTestState *qtest_init_without_qmp_handshake(const char *extra_args)
     unlink(socket_path);
     unlink(qmp_socket_path);
 
+    socket_init();
     sock = init_socket(socket_path);
     qmpsock = init_socket(qmp_socket_path);
 
@@ -279,7 +356,7 @@ QTestState *qtest_init_without_qmp_handshake(const char *extra_args)
 
     qtest_add_abrt_handler(kill_qemu_hook_func, s);
 
-    command = g_strdup_printf("exec %s %s"
+    command = g_strdup_printf(CMD_EXEC "%s %s"
                               "-qtest unix:%s "
                               "-qtest-log %s "
                               "-chardev socket,path=%s,id=char0 "
@@ -288,7 +365,7 @@ QTestState *qtest_init_without_qmp_handshake(const char *extra_args)
                               "%s"
                               " -accel qtest",
                               qemu_binary, tracearg, socket_path,
-                              getenv("QTEST_LOG") ? "/dev/fd/2" : "/dev/null",
+                              getenv("QTEST_LOG") ? DEV_STDERR : DEV_NULL,
                               qmp_socket_path,
                               extra_args ?: "");
 
@@ -297,6 +374,7 @@ QTestState *qtest_init_without_qmp_handshake(const char *extra_args)
     s->pending_events = NULL;
     s->wstatus = 0;
     s->expected_status = 0;
+#ifndef _WIN32
     s->qemu_pid = fork();
     if (s->qemu_pid == 0) {
 #ifdef __linux__
@@ -319,6 +397,9 @@ QTestState *qtest_init_without_qmp_handshake(const char *extra_args)
         execlp("/bin/sh", "sh", "-c", command, NULL);
         exit(1);
     }
+#else
+    s->qemu_pid = qtest_create_process(command);
+#endif /* _WIN32 */
 
     g_free(command);
     s->fd = socket_accept(sock);
@@ -337,9 +418,19 @@ QTestState *qtest_init_without_qmp_handshake(const char *extra_args)
         s->irq_level[i] = false;
     }
 
+    /*
+     * Stopping QEMU for debugging is not supported on Windows.
+     *
+     * Using DebugActiveProcess() API can suspend the QEMU process,
+     * but gdb cannot attach to the process. Using the undocumented
+     * NtSuspendProcess() can suspend the QEMU process and gdb can
+     * attach to the process, but gdb cannot resume it.
+     */
+#ifndef _WIN32
     if (getenv("QTEST_STOP")) {
         kill(s->qemu_pid, SIGSTOP);
     }
+#endif
 
     /* ask endianness of the target */
 
@@ -393,6 +484,7 @@ QTestState *qtest_init_with_serial(const char *extra_args, int *sock_fd)
     g_assert_true(sock_dir != NULL);
     sock_path = g_strdup_printf("%s/sock", sock_dir);
 
+    socket_init();
     sock_fd_init = init_socket(sock_path);
 
     qts = qtest_initf("-chardev socket,id=s0,path=%s -serial chardev:s0 %s",
-- 
2.25.1


