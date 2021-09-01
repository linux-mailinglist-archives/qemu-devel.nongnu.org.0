Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E263FD938
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 14:06:30 +0200 (CEST)
Received: from localhost ([::1]:37524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLP0f-0004La-Nf
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 08:06:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1mLOlT-0007Dq-Kh
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 07:50:47 -0400
Received: from mail-bn7nam10on2134.outbound.protection.outlook.com
 ([40.107.92.134]:37985 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1mLOlR-0002UE-Un
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 07:50:47 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kmGNhk5x0JeJC9C4shrWaiyo7Mw0ezMiRUv1L6IYrG4IXOWhPDgGK0lqTpA3oW/ldaovGZXMGlC8TPlUjI8lw0/m3hLjkrae17NWeewyPE4H+XiaAzREmHNowrenzCrL7Dm0+AQnqXO53daBFWlJEYeLy5uKvI8CBd3o4l9OpwIPsfD+ecuZYsg+mJIZGL9RtTXM6VSehxv9q4219mNwyQ570ssi+1IBd+/dwYVygo/kdC4RiaXGzB18AkJ1MXTuVE6BTOZdk8TmM2xNdu2mylpYwfAw8JDgN6iXtbjfFT0vHQ4JgtluPEzjSAz0DAkGX53yFtnlbl+hoX0c7h53wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ViKyFqWQnUNATUV6hbSOgD+ZMIhOJoUIKxxvWtS8oG4=;
 b=iOPzn1oASqUMXmdkhjXbxfEwEchMEnn7/XzP+piA+ebbuXIUtGg5iktBVaTngOrAsq6KJpPxvQfiGQkIXBKyoJjXJZ7U4nOlDcxMRkoHvNKEBF3Au7vvAfhpXd9tF854GCntYvoZO3ppAYbgBFj951xBPngy8xEhb5oIW5PxnoOKhpDLFMg7CvPvOnA1zoZ0wTQWarlsfM44EvbDOKLr/3NqZonDJG7UdsAMarvSwv4EjsR3LoGBi1lWKl/0TnlAckEcUv4n+9UvLg1H4crQnCk5L6Abgg74OBfc8l63XiAhHr7CJZXYuc9aHiG+8kVV099sCDoeHzQBzIit1xII2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bu.edu; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ViKyFqWQnUNATUV6hbSOgD+ZMIhOJoUIKxxvWtS8oG4=;
 b=CYJpy7kzTF6+Q1KasAb5+YrW2yuC5+d/bvzofnxVTB233DkMBAF9j+BiAnaH3ZZChLcQnRjmDQHnA7ie/gjUE2JpvZCd7KGmecavJsMao4pZk93tGfoc0ADocP9FIwur7Nm2Qp49qgADR/D4gTngCNu381cnPAFSXjHwCHuYMYATGqxmNL9oRzkL1EKdaGBlAe/iekwuw8787RnwkYIbjzzQT/4wpvBysyDOXYHpDvEnqh/wioJvbjDe6CkB4OBziT5OuhhBXR85ikG2Br94N1Uw01lTimkBvExP39J+wUptOi2CYmyKDutaoVn35UV7ocLQrdd4UK1IfdNCGiuqjg==
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SN6PR03MB4224.namprd03.prod.outlook.com (2603:10b6:805:ba::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Wed, 1 Sep
 2021 11:50:31 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::f6:2ec0:d576:8139]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::f6:2ec0:d576:8139%7]) with mapi id 15.20.4457.024; Wed, 1 Sep 2021
 11:50:31 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PULL v3 6/8] fuzz: unblock SIGALRM so the timeout works
Date: Wed,  1 Sep 2021 07:50:02 -0400
Message-Id: <20210901115004.34768-7-alxndr@bu.edu>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210901115004.34768-1-alxndr@bu.edu>
References: <20210901115004.34768-1-alxndr@bu.edu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0328.namprd13.prod.outlook.com
 (2603:10b6:208:2c1::33) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from stormtrooper.vrmnet (72.74.210.193) by
 BL1PR13CA0328.namprd13.prod.outlook.com (2603:10b6:208:2c1::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.8 via Frontend
 Transport; Wed, 1 Sep 2021 11:50:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6a7bd2c3-c933-4565-3e56-08d96d3eb336
X-MS-TrafficTypeDiagnostic: SN6PR03MB4224:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR03MB4224711F4AA1280167A31683BACD9@SN6PR03MB4224.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QyBjngZZXj2Wv9ae8pOlHBKNga/CKcJ06bNqJpVEemsCFxgfvXN4x8qCDnaVbJ07req+TZjNstKTvrUyAJub8fqcgbMV3voQraw6+j4HXvX64wm4Bqf3D6VXNgHl+CuufuYaCk3l2wi6OrKDqUbARtOomOliacLKHhOejPD0bq5L8iHpPvQOu0Ha3vCH2YLYV/7RFQnFd7UmhmTMnM4m/BxGgK2GWYwGv8zXkCGelgpCnbcemyIRaoYm2JeDsUp8l7lQve5PsHs2K3QmMX9K2DJ2WvVKcJ5sS1jAfu8RAq3p1crR3WywAL262PBTdBNIWyjmTASDRZnVU65VD9B7cltqfuIK+YoLmcluKi31CdaW++tWBidl7XYLT4myYYceiGnxlocY/jeHBZ6MslCsEgCDE4RevIbkQWUKQqE3rnVflA4tdQbWhgr3Ku32haMCZmEXjpqeKhu20NfbEEm+xoHQ+I0l+bM/bX2OwXgFFDTETpTYgvDVvURh4GEumuEVef3fANNgRDAWDlCDVqVEBSlx0ChOei/yKb3BFsrV7t5b/4QuWiZJH5JB9lfvvUg9K131iUVT8ELpiiUiDVwuLpkLzR3lTzt7ZqxctVA8tTmBqnnKqNW8kvemWJ9nV4yowtDUzKf/XUWrZLOZk7MBulNIcRR2BqolMlI8C37PbWkDNiXbp3zTjTJva8Kr62LpPbrKxP29B38sCTB3LFwwpg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(136003)(376002)(366004)(39860400002)(75432002)(8936002)(38100700002)(38350700002)(6486002)(4326008)(52116002)(5660300002)(86362001)(36756003)(956004)(2616005)(2906002)(66476007)(66556008)(54906003)(1076003)(83380400001)(186003)(316002)(6916009)(66946007)(6512007)(6506007)(8676002)(26005)(478600001)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5snUul9KTFlonAV0WRpPYrLtje2Ips94sgC3Ma6eXvjfaNURZUFhlzJGVdFR?=
 =?us-ascii?Q?u4VIFp2LNKAh7CUf5BuOnowl2zJCqGQq2lsMosp3ywSmI8p3TI5jkuPqhz+7?=
 =?us-ascii?Q?4eP5J7WftrK/VEdh8UFxMPPdezr8gK27wplZHGtuEwa1wDFhmoEQYwA1EEjB?=
 =?us-ascii?Q?iAG9G6SZ/Xz1EEgAP20r2Gwmqwo6xmm+LKMTCbT1Bcw3pEmM8TSoMPPrAPVe?=
 =?us-ascii?Q?hU/SWBdVL0l845LLndPoLB8TxFSifp3fZBF/su6FTmR6nSkkLdSpufDPbAvK?=
 =?us-ascii?Q?p74FYRziM/YKp4/oGqJJwQCi5oMmz0d/UdzgO11cmYkfq4MthV8l+iEZi4WM?=
 =?us-ascii?Q?HKOj+MEAjIJvpbplAhuM8RF6xXSBndI1PLg3gW2QfSMZWreAHIzLbK6g0GzA?=
 =?us-ascii?Q?NG1BUHugedotA3JMhbGGB2HOHZD6qqvONQYW6QQ1EhU3hajzXw2WOjR3A3a9?=
 =?us-ascii?Q?tIECfU/H7KX5DiI56Ne88uItiJrQt/S0DFONuZS2rURdeIsfKJLkGphthWV5?=
 =?us-ascii?Q?mQjmPvEczNv7faNoRQhTiNnrKdxrLWbrGVHqQdoFqeoSQxuch3rjgm/5Sudl?=
 =?us-ascii?Q?aUKYcfe3VdrHp0z27+xPxSzeTizziflyi3745FuRS56+Mn5rSy4j0oYsZNp7?=
 =?us-ascii?Q?JBZBCw7PAOFSgAt4eoP9VRlWTVE2WvIYZrhKJa0zIhFluQjlA80zZbMbfHuq?=
 =?us-ascii?Q?6ymFx8gTWcCSJz1JdWB5QFFikJMacRJOQaTpF6D+F3/GBrapMV+gHCryWE3A?=
 =?us-ascii?Q?uMlDIm0+ZLachYM0ONsSCTkUJNn8kWTnBqZ3YWipdNAk1vwP8hcxp37MKD5w?=
 =?us-ascii?Q?jRB8AkjPCBC7m3YEFEsREke3LRMCz4rxrRlXp7EIx5L32fDwmhNhwgEW0+Ad?=
 =?us-ascii?Q?OavY2sx/9/mpE4VLdq8X+LN/yRJ6XPyWq2P0kvL1t6UrbuNgxGbACjEOEgdp?=
 =?us-ascii?Q?PSEKK3Y7v3GPaZ4OwMo6ZttjmNyHQ5i1UZfVcXdnGLRdgbxNrPLaXzSYwp+P?=
 =?us-ascii?Q?5rwA/MNt2l3pSzPe4ehmKYfrFOAgrSPg+UuMH/stb1BR8ZtFlmHcHok/i1hT?=
 =?us-ascii?Q?pU+fV16GHfT4X2rAZBqpMuhyHS9Q33f4PLAK3XrOdJWtti/Emp8hkwM48cVA?=
 =?us-ascii?Q?Rewc6PEaFm6+2gzBnUR+IUjk1w/tlfts3TM85TlLZzG6cMdt+pGUqniLCaCG?=
 =?us-ascii?Q?3nFzyJa0Kbpu9O7q0Kmp3ALj32MUnkn4eBGi8bBTRDKTlCW4I27/4tFN7esk?=
 =?us-ascii?Q?339AiH9AxM5YvZRbXVwMUxtv/6e9gXYtrMLpAaVHPlINKzKFsk9Zo9m1vMjU?=
 =?us-ascii?Q?WXj9+0guP+PqbSGS9HMt4z2V?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a7bd2c3-c933-4565-3e56-08d96d3eb336
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2021 11:50:31.3011 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AU6ic2vbqhcVnlZLgiZqvB8TVXIgMIz8QAdF3ojdiL/IQfS7LJ+PyU9QMWM0nG86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB4224
Received-SPF: pass client-ip=40.107.92.134; envelope-from=alxndr@bu.edu;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.238, HK_RANDOM_FROM=0.999, MSGID_FROM_MTA_HEADER=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: bonzini@redhat.com, peter.maydell@linaro.org,
 Darren Kenny <darren.kenny@oracle.com>, Alexander Bulekov <alxndr@bu.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The timeout mechanism won't work if SIGALRM is blocked. This changes
unmasks SIGALRM when the timer is installed. This doesn't completely
solve the problem, as the fuzzer could trigger some device activity that
re-masks SIGALRM. However, there are currently no inputs on OSS-Fuzz
that re-mask SIGALRM and timeout. If that turns out to be a real issue,
we could try to hook sigmask-type calls, or use a separate timer thread.

Based-on: <20210713150037.9297-1-alxndr@bu.edu>
Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
---
 tests/qtest/fuzz/generic_fuzz.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/qtest/fuzz/generic_fuzz.c b/tests/qtest/fuzz/generic_fuzz.c
index de427a3727..dd7e25851c 100644
--- a/tests/qtest/fuzz/generic_fuzz.c
+++ b/tests/qtest/fuzz/generic_fuzz.c
@@ -670,6 +670,7 @@ static void generic_fuzz(QTestState *s, const unsigned char *Data, size_t Size)
     if (fork() == 0) {
         struct sigaction sact;
         struct itimerval timer;
+        sigset_t set;
         /*
          * Sometimes the fuzzer will find inputs that take quite a long time to
          * process. Often times, these inputs do not result in new coverage.
@@ -684,6 +685,10 @@ static void generic_fuzz(QTestState *s, const unsigned char *Data, size_t Size)
             sact.sa_handler = handle_timeout;
             sigaction(SIGALRM, &sact, NULL);
 
+            sigemptyset(&set);
+            sigaddset(&set, SIGALRM);
+            pthread_sigmask(SIG_UNBLOCK, &set, NULL);
+
             memset(&timer, 0, sizeof(timer));
             timer.it_value.tv_sec = timeout / USEC_IN_SEC;
             timer.it_value.tv_usec = timeout % USEC_IN_SEC;
-- 
2.30.2


