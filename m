Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14168369C3C
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 23:51:41 +0200 (CEST)
Received: from localhost ([::1]:48306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1la3i8-00088R-6N
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 17:51:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1la3Y4-0005PG-4a; Fri, 23 Apr 2021 17:41:16 -0400
Received: from mail-eopbgr50133.outbound.protection.outlook.com
 ([40.107.5.133]:45636 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1la3Xv-00030s-N5; Fri, 23 Apr 2021 17:41:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WsEH8taf8pkKS0lpTQSYJq636yw8yq6OkaC+mIPtFLjsg0qsDQErQcJfYh5pwq6MGiLce8MfuF+gnPrPTPKQZul/FeqOx9aO8mdv87nER6Jq6pmJoEQwkPyJMaPZiuUNRvD/bTGf4OHLyB0OemQeoXbDULsP3lLNm6mq1LQmv0vvn2RHdPEox1cm87hhm5g6xUZvq7a3huC0Na/YYLgGje4QicE9806iAhFfWOD+PfGVehf0/B/bpySrBiPUntKD913uMQq8awjYNKQq3f+JjMhN6TG4o7Im6CTylHiHqFpnVpdvrh6oLqJUuviwp+vVm9B5/H/eQSsNIUWFKIRdKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5U7Nc1aPIlQnCyKW6p4ophwtsRUazbAv+D9rQ5anEAo=;
 b=NR8OZOs4MctWJ5mBRj5zgDf0tqBVZvceOh4OsJ1wedFA5Xywpz3kAHyAmbEIsYOcgPakcU0lyaxO+N0hJo3Wm9fIAt0jwAzkw+TTZHcjZ7E23rpQYAkG6mzCBQlvYLOirqYEAIHVdrUExYUa3xin2ezKj6r6NWuBPIobEcHOiNdVHtsIYFEH0DC/ndSOZorALi93+0kF2mVqLNBo6PgSYOHMA/xVsCaIBPcIozqtNTVkSUVwo/8gCmS1fzWWUiVjh8n1vUABy1ubBHQRWIwFRNdLSv7e8cutpqjrJGXxwZdkwJTyd/COtJrmrfpRmZBLB5lldltvVZRND444lBAUqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5U7Nc1aPIlQnCyKW6p4ophwtsRUazbAv+D9rQ5anEAo=;
 b=lWs9yiSndv5sGIISNy94s/i4tEbV7jhX0cVH9AbcDKuJkmXzLlwY+rj7x916LK8eY9zV2BFxeP5S6o0nZisjQ+44qDeXu4z4bElHy7xOkJJ0CiDKyBihcNVEBpFQ/dcJSJQp9B1qfpfRcvPZp82eJjPgtXveZh57IJl2f5AJ7o0=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3221.eurprd08.prod.outlook.com (2603:10a6:209:49::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.22; Fri, 23 Apr
 2021 21:41:03 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4065.021; Fri, 23 Apr 2021
 21:41:03 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, crosa@redhat.com, ehabkost@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 philmd@redhat.com
Subject: [PATCH 10/11] qemu-io-cmds: drop do_co_readv() and do_co_writev()
 helpers
Date: Sat, 24 Apr 2021 00:40:32 +0300
Message-Id: <20210423214033.474034-11-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210423214033.474034-1-vsementsov@virtuozzo.com>
References: <20210423214033.474034-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.222]
X-ClientProxiedBy: HE1P192CA0012.EURP192.PROD.OUTLOOK.COM (2603:10a6:3:fe::22)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.222) by
 HE1P192CA0012.EURP192.PROD.OUTLOOK.COM (2603:10a6:3:fe::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.21 via Frontend Transport; Fri, 23 Apr 2021 21:41:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 68b4c489-09c1-4b10-ed57-08d906a07e82
X-MS-TrafficTypeDiagnostic: AM6PR08MB3221:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3221B422CC5561872E32916AC1459@AM6PR08MB3221.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:12;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DuKIzRrvWsXowwS6SNvYaWuynurRnvHSBd2YAbgFEl/Wav1r4UpdbvahZNcHxDc2Rvb9H1cfu03/W0Fm4OjALptIMUdK+Jnpki97VwFDbmPcgtAVRFco9hE0THCTzRtAaiXm16zhcl3qmcBVg6vGM47Ir+eqzKRN+lMzZr6BtsTXa7Dz+gsi02VY8jj0brJKV6vf/h4TZtgd8uH84njPTtg4554aQf0jnb6CCQ/BgTPaXmbmIeawu+P6CjsC58uxZdLG312VFxPtk28YRGyo/vIXxbyphOv4gs7dOrJyxJXYLBkbMgMv7r77iBAyLP6tVvJ54xeeqDw9cv8YQsgy/ALE6GTUUbrWO4Qss9KL/BNVL9GmoktPMlzfXoFq8jgYnDjfHBVMVu6KjGEnYD6BLug0LQZrOAzS8TxFM8/4me3o2VXiqHYiAQ34VnMX4EqRqbI/P9UmWXDqx/eyUvluORoFe3vqWmF9egBp4tAtwDx5V8NMao+AEaHovO1xsYsZS0iTLE1Um+d5sXD83Iqcz8cPRt6DOTqcEdvy1zhfzyNVRobdHDtIWXvwb2ROt59f6xnQkJVm9BlS0OmPPKijajONzTbeT55+49rWJbo8ybrsuW2vNZLaoqrE9nareDkQ8BAFeuwwpxMJgssSdYK1iCYY+spUkixZzhqWrjU6F2E+1McWJD7CzI2w8SDPYh25
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39840400004)(396003)(346002)(366004)(136003)(38350700002)(83380400001)(38100700002)(8676002)(186003)(36756003)(6512007)(5660300002)(26005)(66476007)(16526019)(66556008)(478600001)(4326008)(66946007)(6666004)(6486002)(86362001)(956004)(8936002)(316002)(2616005)(6916009)(2906002)(52116002)(1076003)(6506007)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?cWEtJI6KmV6XV0ZGatU9SwMhiW9v9HqB0VAsBgZqfKtV5XF0l4mwAnkO1av2?=
 =?us-ascii?Q?it68h3YvSOr0qvy+1aq1j3prDZVhsHjfrgzhdxlRcQyDWbYYk5A/Gl0FAuBW?=
 =?us-ascii?Q?KcLNP9F8wclgfLK5s48rdRU9bPE9vtzICmUf4k1+rns5CANd22jj7IE/2qen?=
 =?us-ascii?Q?RJfBBSexiAhQpGdYspjJBpXrgxbaNGEP/S6FF+dgnZtVMaWNRepG6bu3kIEm?=
 =?us-ascii?Q?zwxuotztO1B+z/GiTesEcZbrf979WE6RjaYQpyeIt1O73WNL3Gf4GRyhE8NQ?=
 =?us-ascii?Q?e7beOZh7kofY8npzt0s1ZduA8bia8n3Z7UCUFbBMFLgbSsXBSDvjidwPrCyF?=
 =?us-ascii?Q?mnE2T5KbbmO1jiLBNRfm3b3OH/WsS/N48xZCsvS8453Jh/RluOQxck3vE4rH?=
 =?us-ascii?Q?8428IF+BVNMxmzPV0q21v20pUyEb9bscKx+nQMDQywxn3tosVsutCwZrQAmQ?=
 =?us-ascii?Q?C3h8SxLo7UCJS55VMxlw3OfHGHm8ofrgEDZRPSJS5908yPiUxYUSB43sitNh?=
 =?us-ascii?Q?2hwk5GPTsv09WVqGq3nbSWHUT8ice2BZ0hXwxiVB3ksa/HLawApbQzHsGzh2?=
 =?us-ascii?Q?W2/dGSbUN+yR6NIuON4ydbL5dV3LSxOi/y1iKP7j94SKNDUdYAyheqK1acTX?=
 =?us-ascii?Q?yItBTH/tooghnCOvAj2pILnCmgOyLgtuS9R+RoDAatqsUv/K0tWWDfDQRQa0?=
 =?us-ascii?Q?WOVhvVrOa1/tdo/d/ArRpw+FXamCr9QPLBJ6rYEn1F1T50T5+Tm0h24jabgW?=
 =?us-ascii?Q?8uL/ja2lt0EXW+lc7cp0B6J/pNFBv5a4ndJRo+aD3IokcQvqSh5uurc6JVjN?=
 =?us-ascii?Q?TK8GA7xtU+9I3gPTg9Aq8zryRXgu8JH33yZhLDD7ju9/Ys6mpnz4vY6Drx3o?=
 =?us-ascii?Q?nG0fSBCz/TLyay0YsxZNnPBuEzOjPPuRZI9o66/kzz9Pabi6jnJx0TkNSjqD?=
 =?us-ascii?Q?pMDrbMtjKSnH+zTIgpii3luHqcYN8LaEjKwfZmmaj+ZvbS9+ijcTQPz2x/ow?=
 =?us-ascii?Q?buGLIGorM7p0ySwNSDPQO7QL04GHyv2XBqQmq8xFhdzQuBhYsDJcIPFFpddk?=
 =?us-ascii?Q?pSkfoth0EZgLjR3JlukA0MZd7IRkCnPxUEgC6EIpkZ0jen2Xw00gCMqJJrpq?=
 =?us-ascii?Q?oIWkutopRw231X8y5RqtQdw+Wgbn9VHboBkRJbK58OmcAxz6ZsMiJ/XcieNd?=
 =?us-ascii?Q?tBQXRbW13Y8Xsb9ViDbIj1SuN6RZuML8WHzkwuYKarBfoew4ggiLmSisk4RK?=
 =?us-ascii?Q?Lpj02YXwrEdYqtXUVaTwODSjofk3epu8+MWZTc6ciSxhdy2YuCWa6tU45JiG?=
 =?us-ascii?Q?pm5D6CZ/lFNW+2LE+Wux/A0p?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68b4c489-09c1-4b10-ed57-08d906a07e82
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2021 21:41:03.7799 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3bt0sV5CUyVwOcXWYTVmXyasmdvlOVgWBRoi9moUEz/rWWCZujWqh5N1HvClVG/WCf4VTTNGP1xkQUBn5YtXK20VadjyaSwhJJRZ24AQq5w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3221
Received-SPF: pass client-ip=40.107.5.133;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

They don't make much sense. Call blk_co_ functions directly and also
drop some redundant variables.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 qemu-io-cmds.c | 38 ++++++--------------------------------
 1 file changed, 6 insertions(+), 32 deletions(-)

diff --git a/qemu-io-cmds.c b/qemu-io-cmds.c
index 2f0a27079d..9a0e5322de 100644
--- a/qemu-io-cmds.c
+++ b/qemu-io-cmds.c
@@ -527,24 +527,6 @@ fail:
     return buf;
 }
 
-static int coroutine_fn do_co_readv(BlockBackend *blk, QEMUIOVector *qiov,
-                                    int64_t offset, int *total)
-{
-    int ret = blk_co_preadv(blk, offset, qiov->size, qiov, 0);
-
-    *total = qiov->size;
-    return ret < 0 ? ret : 1;
-}
-
-static int coroutine_fn do_co_writev(BlockBackend *blk, QEMUIOVector *qiov,
-                                     int64_t offset, int flags, int *total)
-{
-    int ret = blk_co_pwritev(blk, offset, qiov->size, qiov, flags);
-
-    *total = qiov->size;
-    return ret < 0 ? ret : 1;
-}
-
 static void read_help(void)
 {
     printf(
@@ -767,11 +749,10 @@ static int coroutine_fn readv_f(BlockBackend *blk, int argc, char **argv)
 {
     struct timespec t1, t2;
     bool Cflag = false, qflag = false, vflag = false;
-    int c, cnt, ret;
+    int c, ret;
     char *buf;
     int64_t offset;
     /* Some compilers get confused and warn if this is not initialized.  */
-    int total = 0;
     int nr_iov;
     QEMUIOVector qiov;
     int pattern = 0;
@@ -821,16 +802,13 @@ static int coroutine_fn readv_f(BlockBackend *blk, int argc, char **argv)
     }
 
     clock_gettime(CLOCK_MONOTONIC, &t1);
-    ret = do_co_readv(blk, &qiov, offset, &total);
+    ret = blk_co_preadv(blk, offset, qiov.size, &qiov, 0);
     clock_gettime(CLOCK_MONOTONIC, &t2);
 
     if (ret < 0) {
         printf("readv failed: %s\n", strerror(-ret));
         goto out;
     }
-    cnt = ret;
-
-    ret = 0;
 
     if (Pflag) {
         void *cmp_buf = g_malloc(qiov.size);
@@ -853,7 +831,7 @@ static int coroutine_fn readv_f(BlockBackend *blk, int argc, char **argv)
 
     /* Finally, report back -- -C gives a parsable format */
     t2 = tsub(t2, t1);
-    print_report("read", &t2, offset, qiov.size, total, cnt, Cflag);
+    print_report("read", &t2, offset, qiov.size, qiov.size, 1, Cflag);
 
 out:
     qemu_iovec_destroy(&qiov);
@@ -1100,11 +1078,10 @@ static int coroutine_fn writev_f(BlockBackend *blk, int argc, char **argv)
     struct timespec t1, t2;
     bool Cflag = false, qflag = false;
     int flags = 0;
-    int c, cnt, ret;
+    int c, ret;
     char *buf;
     int64_t offset;
     /* Some compilers get confused and warn if this is not initialized.  */
-    int total = 0;
     int nr_iov;
     int pattern = 0xcd;
     QEMUIOVector qiov;
@@ -1151,16 +1128,13 @@ static int coroutine_fn writev_f(BlockBackend *blk, int argc, char **argv)
     }
 
     clock_gettime(CLOCK_MONOTONIC, &t1);
-    ret = do_co_writev(blk, &qiov, offset, flags, &total);
+    ret = blk_co_pwritev(blk, offset, qiov.size,  &qiov, flags);
     clock_gettime(CLOCK_MONOTONIC, &t2);
 
     if (ret < 0) {
         printf("writev failed: %s\n", strerror(-ret));
         goto out;
     }
-    cnt = ret;
-
-    ret = 0;
 
     if (qflag) {
         goto out;
@@ -1168,7 +1142,7 @@ static int coroutine_fn writev_f(BlockBackend *blk, int argc, char **argv)
 
     /* Finally, report back -- -C gives a parsable format */
     t2 = tsub(t2, t1);
-    print_report("wrote", &t2, offset, qiov.size, total, cnt, Cflag);
+    print_report("wrote", &t2, offset, qiov.size, qiov.size, 1, Cflag);
 out:
     qemu_iovec_destroy(&qiov);
     qemu_io_free(buf);
-- 
2.29.2


