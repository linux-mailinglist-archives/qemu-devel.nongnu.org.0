Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B423F7606
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 15:40:00 +0200 (CEST)
Received: from localhost ([::1]:52484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIt8J-0000nE-U4
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 09:39:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1mIt2p-0008T7-AK
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 09:34:19 -0400
Received: from mail-dm6nam10on2122.outbound.protection.outlook.com
 ([40.107.93.122]:65035 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1mIt2l-0005W2-5p
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 09:34:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Af1GOJdralrDgqVtG+jqAKzqFtWd2bi9j01n4T0hG1qeuFjuNKzDRzNbwSGYzFcOmMY5m+NmMAAmgJz2TCc21oAtuICww8epedUsTxKw8tPwD2hGgNArNxnamLCNTlCuRJIlfN66XV/VEDNaLYkzswypo0CqfcycdKayoupOI+52OCkk0pt5jIi3ufIHMjzEU+/HOu6W5VjdwqGlfh/autWfTuMkbkhhKs6+eZzGWBmUZ7qH1YCmYFVbVmVRHv52/5U/PfZI/4/SF8bIVCW+/itm1dNX5kgYdkWQE1SO/c2gb6J4EodTydr5ZTgdMzQbmEOE6wF2UOtfgnlb6OhC8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ViKyFqWQnUNATUV6hbSOgD+ZMIhOJoUIKxxvWtS8oG4=;
 b=U+EZtyH2h8vJEZWuAf/qZF1Y2BFtwFXqc3SGUtKiy0f/34UAEhQP2d900MnsVLmpcVppKRr3NLCm+nYxkBxEKrd7gBMyCe23xOfu4wYxW+9yaZJUh1jg9Q+QkDtvPBRSINLT2yzHxpZw323DycJdXUeynwwpotq10gcobOP6ef3xm7kGRATz7EW060t35mYP/Tx6sfd55cJQa+S5XX8yiiC/ejwtL5r+vwjdrfJ7v+rxCxnrW4dYBeq5/RbfynMkFg2kXEjYgb2kuMCJgKKRa3fekwmaZFGhpuUpZ1LSw5hAPUTkyKFepi0fjk+i/jIn8RJuF/rwa7D5LbjORM5/Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bu.edu; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ViKyFqWQnUNATUV6hbSOgD+ZMIhOJoUIKxxvWtS8oG4=;
 b=hyFa23JGQ3lOwYPgblEwQaAQKuAjrhQufshpvxGpuN0kolU8xF21zUUZYBWRAm7qWaaRHqpYMYMsSOVo182UtCprDppDrGzcopuuO5TmKZHTFpj1IqsxBE8xJvzV0bslSLeKSUg4FM147CsBsIuoXMJp/McyKR0gXkuKjFUJUVs=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SN6PR03MB4447.namprd03.prod.outlook.com (2603:10b6:805:ff::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17; Wed, 25 Aug
 2021 13:33:52 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::f6:2ec0:d576:8139]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::f6:2ec0:d576:8139%7]) with mapi id 15.20.4436.025; Wed, 25 Aug 2021
 13:33:52 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 6/8] fuzz: unblock SIGALRM so the timeout works
Date: Wed, 25 Aug 2021 09:33:30 -0400
Message-Id: <20210825133332.44378-7-alxndr@bu.edu>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210825133332.44378-1-alxndr@bu.edu>
References: <20210825133332.44378-1-alxndr@bu.edu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BLAPR03CA0085.namprd03.prod.outlook.com
 (2603:10b6:208:329::30) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from stormtrooper.vrmnet (72.74.210.193) by
 BLAPR03CA0085.namprd03.prod.outlook.com (2603:10b6:208:329::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Wed, 25 Aug 2021 13:33:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fbf2545d-b5b2-40e2-c276-08d967ccfa79
X-MS-TrafficTypeDiagnostic: SN6PR03MB4447:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR03MB4447402A2D8C0EF126580BE3BAC69@SN6PR03MB4447.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CNeg9VHEFRlpCGvpQoYQ0MIUXKfE1lSiE9OaHx+epLyLFRxSCPP5Rf6tG5sdHfIRhHroGdt6VubuhLwgMg81lvPQp3cOCU8wdXXKam5iGdwWDcHZDM8NIRmYjoZjfEGheaSE6z06phdil8rzjanF5IE/9wTiCzE90muzyoJmtPdM1caFwvEGpg5tTqInsLdyt2KboTwYmeEemLFe0h/4RGddOlgYunI1zKei5VrtsUWWczRYxfIrnOTsW3edttM8VfyRRN4IvgOV2o7NcTyJ/0ACk/67Nov6lKLuWzUpsXEYc0TvUmefBRAgxuOf7Yq7afHMZEBedISZzBrWksxYdAqyRNAQhJocf+L2fdzFBJbUnWtna8Dc18fUjzO9gsNewp7yV8KZMiHdmb4xAG3WOhOMDDQBdWhaUWY/wxL+XsX1uhWILCOnvD92Kh+3Z09H+9rF4mHNEBgLC9QhZX19W8lZ8qWO7Awv+zLjh2Mr3p/40mg0D2t5ejQp5PNoMocIPEE7TO34n895+iBa1GDko0SVf6hXC+nBl+uOYwPh3oJelIibhjqMHJv6R1jVXFIS538asLq1jG7vK/B/BIXHDpCBmadUkbGXCgseXMson/g+lQ+3309KOy9h6mkC9/K6rUUN7PcQyqdhjuHKr6oXzygtFJuL+SdJLqlph8ZMulj28+oUyopKhZH84dQirspn/s7fEWAqj0GSKkpFRAmeOg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(396003)(346002)(136003)(366004)(83380400001)(75432002)(186003)(1076003)(86362001)(478600001)(8936002)(36756003)(6916009)(52116002)(4326008)(6512007)(6666004)(26005)(6486002)(38100700002)(54906003)(66556008)(38350700002)(5660300002)(2906002)(66476007)(316002)(786003)(2616005)(956004)(8676002)(6506007)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?j5Cvs8YXl/pyrevfQ+uJZTrIxZt5oBJtwWYD7DV7yYvgjTs3WFPSQSD3Fu0C?=
 =?us-ascii?Q?WFl1hHEGIb1cNC+wI+z1zoS4ofmk6AHo9h1pS7XG4CewpMrt2qobO1HzdPeM?=
 =?us-ascii?Q?6nCXqvPGnpWYsudOhQ7vDs+FqtTTBDELXo/ZmTsSUGLLvf+da4XeaiUsiqC3?=
 =?us-ascii?Q?+l6oteTnmwICBdz2bufBRgqDMap6zrvgBJ9td0ZxlHoMKEmFXEG1SS1rCfyT?=
 =?us-ascii?Q?MgCNk855feMfpKbrUdmTuUMlcp6BOiOVnukQn1YUA3WY36tIIgBLpkBt+7wy?=
 =?us-ascii?Q?xpiOc/cUr0hCvt5p8rQS5KoH+f+uGMpin7EYplAhPkOdP7U1VT5OJCN83gSF?=
 =?us-ascii?Q?8c9dIulTD2WOMQT04N1v/bgwlHHUrXQ1ybEW7zQixC5MYv2ovpOsOWdrwio1?=
 =?us-ascii?Q?/eY7qR2KaLc8ntVOZH9JTK3R+D1qeetk0A+Hp5jpyR4/2ESCMKrS6uF6fyDt?=
 =?us-ascii?Q?k22ieucbUfRTmW2L4XUfjqa3WikGux0CA63XKXSN1IiDeCEn7Jo72hJs4aFB?=
 =?us-ascii?Q?hj6iaB0ax4D36ubrnyWXIvEwNRR347DemdBF4Rfm+pZf7vE2w0FUb+EKgHcZ?=
 =?us-ascii?Q?X8CTAy9aFo0MSNZhsatwg5jpq1MHkKVHiELujP33Rj8QtBYaFKi+wNPuPPbv?=
 =?us-ascii?Q?VPJvldftHRwsOb5qOZDxh2M9FKBmM0ds0am227Ra42XR8H10NO2DCweQlBH3?=
 =?us-ascii?Q?bhwfXOx8Jh6/x6/gLenHrwVA3f3mndcHEFH9/+Q6sb7kqCJMyY1gQu9YO06N?=
 =?us-ascii?Q?+3FXofqYx2QPsni++buF960xeeES6erSYhXEstUM/E/Dgwfy/vH3Rm+DG3ne?=
 =?us-ascii?Q?SN6gR/lwxCjxdJI4X1V0UN4farmsMQmwHQ24HjTGN6VLNH8XLtNhKipnvtJQ?=
 =?us-ascii?Q?nWocIXbgQ9LgnvieCIsbyFAAVQavUVrQmLntwEZcMRjUex7i2mVsurlN3cBE?=
 =?us-ascii?Q?O4jg9K/aJOrJRHH6EjmdyPR+SRn1RiKVAXei4JpG8wiCKrMmU4bUf+6ca89w?=
 =?us-ascii?Q?58SPv4ZWLwMoKCBoL3oCZCqa+U2WOtXc6Wd/TuLR2WYmxerzUJKONELAq1Rl?=
 =?us-ascii?Q?XPVwfHeYrhxMiVnurf9oFFBgZIzzBlxMGmtA23AYe/T0liKFOEg7KOYcnX7I?=
 =?us-ascii?Q?4UhhsTpzIFj5OgWYhWSpMmBuO/AF/j8L7HSNCvvHJonOWjXNnU1ja5jqw4HQ?=
 =?us-ascii?Q?qF5NDLpSi5kSjwiKci8KOYGpT75EV7ENlEpTamK3tMr1BzXCvtXsvyLamb73?=
 =?us-ascii?Q?jZD6l1R7s/briFmTfpWxrTyxFYCJ0ha4CHBd1zma2v9DwOHgEmtNnfurLj4/?=
 =?us-ascii?Q?OrHSZX4xS0NYNfjFmwIQYQUD?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: fbf2545d-b5b2-40e2-c276-08d967ccfa79
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2021 13:33:52.4148 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DwYcxRQPwXDl0YEtKzvEUDlmqD5dLTBMTULzsj59zHwwklp5leW3bv5xpm9BAxh5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB4447
Received-SPF: pass client-ip=40.107.93.122; envelope-from=alxndr@bu.edu;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.89, HK_RANDOM_FROM=0.999, MSGID_FROM_MTA_HEADER=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
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


