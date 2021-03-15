Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C863933C624
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 19:51:48 +0100 (CET)
Received: from localhost ([::1]:45336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLsJf-000558-Qx
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 14:51:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lLs75-0004GC-O5
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 14:38:48 -0400
Received: from mail-dm3nam07on2131.outbound.protection.outlook.com
 ([40.107.95.131]:13664 helo=NAM02-DM3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lLs72-0006Et-B1
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 14:38:47 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZB5R0oLXIS4sKoAHbEnneLJ/5lJnQOjhViKq6Jlw2wFzz5tjWr6OIKK+E/k1eh/KAUTRmmo24BWDFagsMTrANSYI6XXyartZV79PE1H/2JFb60FqNLMUXfBnKyG3/De/zid+vOsF9cp5VAgbiXY8OB81Env1qZGT8hZnv7NJj/RNJF5TZpGx+G53CkFbFM6qYLHxCKHmceg6aGYEAzzuKk3PtreXMJIoVwn4eyCBkMuOKvgX2nSxs39/CkIqKmtuBiF9rxuJ0vehK1x4gW47SAsa4WzEGfdnLnASO64Yb14HJ5br4Dy8p+9eplprqyC7RUMs5p+B7EzKfnF16SoEpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Eu4G2op3l0V9YFKGcl055Q9MMTYx5UxqggL5X6wyz8U=;
 b=gdkES1dm9wSe2eTpV0d90NXHbOdwuW4zLVNq9ocpyuWva4pazlAgnrnRAMWH1b48llBP0qAJm4e+OO56udKnubQmO57mjSap+aJaVGWQNZNAc2qs/x1kVJn7mua4f/SucrnJzZboamln8hTiXWmfZrGh6mMy7TLuR96gRSYHSdPgcWOzImo0mdgWa6dHPWszGNfNd+ZReSQ8jkDkB7zomarG4XiodkBIzD3jUJ7g7H5r94ZZUZ0LoNWD7sYh9rN/amJoMyR8oIoHlLkOFcgLipR/oNrvMTq+S95gr5ocDPUyEfshlxd7c+KYPx4mRLdoxs87cGrmNieFueEpWmzDjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Eu4G2op3l0V9YFKGcl055Q9MMTYx5UxqggL5X6wyz8U=;
 b=5AW2L6Mygeg4z45X7j/dnSDSMO/MtaWuqlvxS3qqQr3eu/oY6sHVUatBO3pv251f2/aLD5eV7WYCc04prjKSieTHzP3EtlhU8Hk7kCfw9w4FvYmbwtZy6Ht/duAOUgnd8dDQi4TMv42JohXcPL999sO5yUlerSKCq2lRFmwO3dA=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SN6PR03MB4286.namprd03.prod.outlook.com (2603:10b6:805:c8::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31; Mon, 15 Mar
 2021 18:38:27 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::dda8:67d8:8d23:74c6]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::dda8:67d8:8d23:74c6%6]) with mapi id 15.20.3933.032; Mon, 15 Mar 2021
 18:38:27 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PULL 05/11] fuzz: don't leave orphan llvm-symbolizers around
Date: Mon, 15 Mar 2021 14:38:06 -0400
Message-Id: <20210315183812.27760-6-alxndr@bu.edu>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210315183812.27760-1-alxndr@bu.edu>
References: <20210315183812.27760-1-alxndr@bu.edu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [128.197.127.33]
X-ClientProxiedBy: BL1PR13CA0323.namprd13.prod.outlook.com
 (2603:10b6:208:2c1::28) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mozz.bu.edu (128.197.127.33) by
 BL1PR13CA0323.namprd13.prod.outlook.com (2603:10b6:208:2c1::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.11 via Frontend
 Transport; Mon, 15 Mar 2021 18:38:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 10cb7bda-e58b-4929-9f2c-08d8e7e18608
X-MS-TrafficTypeDiagnostic: SN6PR03MB4286:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR03MB4286590D08CB8434F55B2D6DBA6C9@SN6PR03MB4286.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7+jRHauEhHPeNyIawRDDzin+qhozgduDeB1rQaGgAXityGt4lxfAwp2pdz7j3MHTV1UtMjAy7qxitI5AS8PyAFFfw5MmSsfh3m11AoBviI8QzHGDvrrJKayeYaWNZEILFBtifHtOWY++wg2lcPvLpyRDtBVgqU8RmumLvfPi+LfLW1LFCT/nlYklKhLw9mwQZgkqyuPkyTpLHYd8Jmw1vKDNZvWqXa2b7NwL8rLnDEhBjZ2CZL15W4N5bSQYVz+AAz/JZ2Ouo1axY4CQmE6HlVrBJVkk/xDIXEu+QAXGSfroBasZJAZGvId5x3mYdeyD8t2kf+AfVLNrQRn7hCcShPifQr1sYgYMfY/EHfOKi9XkLWIIX+FDqqPSi5WsWgHKy0pWr1pAFYfNXIXWK/ptv2pbFzFvw9ShZUhKI4zWalO23EO0/Gjux7gTliJN3WcRYgxErFtZkDAXoYCmeVlGhDG4WDeXTnhW+JUam7ODMsU2fE/tvIY28fhdkjTS1d2K+lYroUH9Cp/0dGkZaxMOrkOUspDL5vQiXBdgW5u6gQrQQoNx6Ea5Kj55bbaZTgI1
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(346002)(39860400002)(136003)(366004)(2906002)(6916009)(52116002)(786003)(26005)(66946007)(86362001)(6486002)(6666004)(186003)(2616005)(16526019)(8936002)(66476007)(1076003)(83380400001)(956004)(66556008)(54906003)(75432002)(478600001)(4326008)(8676002)(36756003)(316002)(5660300002)(7696005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?LCZjZpkKiGScVaONrsbgDpB9Q2zeAmGn9dA8RmMr6VWrl0JhAHkd5z+FHTZa?=
 =?us-ascii?Q?PZkrU6iR65PFxRVrwmZn46qcKPGisoPhPAzxQJaoWNFmZMuS2tx3gnCwdFOs?=
 =?us-ascii?Q?R29MaLkKGUY0DkkevXqCS3CYXOw7GiXsVRQgfDk4PiqEbPEo9lgiFfj4pIai?=
 =?us-ascii?Q?hanZ5WwebHWWbidpaWHJtPVtcY4rt5UquKpDZ6YzvoFbXGpQXoDu7dQHZDln?=
 =?us-ascii?Q?0p8QvX+Zj7tHt/i+c453iTxNCO/KevWKbaeZWhYbji4WfRz2JJRYPmojh78n?=
 =?us-ascii?Q?NUZl6gXLSO+fUrvjI/uCaCbdRk023dK5YLKG5Csiy0/Fkk89fxzBCtTDKvI6?=
 =?us-ascii?Q?IzJtMPgZXbY/D05Xy+JbN5ruwmbM5r4BCkusld5f+Ntej7f1Gh4/xAhEKdor?=
 =?us-ascii?Q?0mXcaLZrdEYUdIfPLhUFZZbTr/PrxtF41nu9ExDzpThdNodpkyt7g68euGNj?=
 =?us-ascii?Q?bK/6w2SKbiDAO5+b7ANvRy+Gq61siu3fll/L/lZuIgGGnTlu2iCvk6xcKIfP?=
 =?us-ascii?Q?t/SBQkg6k+xoFJy2PwdFFo4JbAOjmCp/dFxohi0Hq30k6/ZBh9l0H8QQi0vJ?=
 =?us-ascii?Q?xvtKfY+E8iuUzd5hEp+EKctzHqL3HTY/H6WKE/KxX7ZmNdBxjqhqaNw/h5D1?=
 =?us-ascii?Q?uSuP7DULdG+CCxI7G54nVXp2NxccY15SLRHCurgu0b53ZCF3hUjjVAJlaerm?=
 =?us-ascii?Q?Ppz8TSQ9KAMYVoFDP3tudp2P5ZwSHFGWW6x+7eJp/gqmVbUAGDv3GpGYte5g?=
 =?us-ascii?Q?seltEP1xiwGhB6UwWXwNrQ15I+JODWPaQweYuQ9q9+8Dx49CMfdUTlv7wtmg?=
 =?us-ascii?Q?mba5eifmIfDFDKM701Dhvlbfo1SXMJGZFFljINPcb/YBc5b4pPuBYQudXqa3?=
 =?us-ascii?Q?KjXdMeRsOGH6C3uJtglKBNFY2CEH7dax4dKDV9kTyZLJFSHvS+dLDz9OijFT?=
 =?us-ascii?Q?pPGHYySs7J+2M7TPuVuVims0JWcSJ4qSl/C46lSqJqkmHmme9FnS/TSFhWkE?=
 =?us-ascii?Q?rDspOgqD4n4i2yrF7Ts0neQX5umyIJaH3L2Yc1NPIjnIxYfsD/aTYgSX6X9T?=
 =?us-ascii?Q?rfuhJAqWbSGiihHf2rMBZC5M/Y1E+HgJhM4g0oNOfdV7tLpyFS1Zaf0QzatA?=
 =?us-ascii?Q?2TS4TkM2L+li3MeQitnjmN5va5eW1QU7niqx8TANvIiJJ0rEU56i4P7wGuj8?=
 =?us-ascii?Q?/a6+7Yd6j7puqKWFlr0sCVSLKq2riTYsIdLvTAa80pZNtguZ9qcn8BN6xH1L?=
 =?us-ascii?Q?sJ+13wFhXa8GX23mrdONdV+3tY4gD21GbId84tk7QYQKaAsZVp8Wt0XiRgLU?=
 =?us-ascii?Q?Aq3XVcV31UeKNuSJMA2AfnPj?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 10cb7bda-e58b-4929-9f2c-08d8e7e18608
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2021 18:38:27.6424 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oQ2SvekS+Moef38iKkEJJm2Jp6gZZPdqDilsoemkriF2w8tlWdXW//tbrmwqC9Sb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB4286
Received-SPF: pass client-ip=40.107.95.131; envelope-from=alxndr@bu.edu;
 helo=NAM02-DM3-obe.outbound.protection.outlook.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Alexander Bulekov <alxndr@bu.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I noticed that with a sufficiently small timeout, the fuzzer fork-server
sometimes locks up. On closer inspection, the issue appeared to be
caused by entering our SIGALRM handler, while libfuzzer is in it's crash
handlers. Because libfuzzer relies on pipe communication with an
external child process to print out stack-traces, we shouldn't exit
early, and leave an orphan child. Check for children in the SIGALRM
handler to avoid this issue.

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
Acked-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
---
 tests/qtest/fuzz/generic_fuzz.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/tests/qtest/fuzz/generic_fuzz.c b/tests/qtest/fuzz/generic_fuzz.c
index ee8c17a04c..387ae2020a 100644
--- a/tests/qtest/fuzz/generic_fuzz.c
+++ b/tests/qtest/fuzz/generic_fuzz.c
@@ -583,6 +583,21 @@ static void handle_timeout(int sig)
         fprintf(stderr, "[Timeout]\n");
         fflush(stderr);
     }
+
+    /*
+     * If there is a crash, libfuzzer/ASAN forks a child to run an
+     * "llvm-symbolizer" process for printing out a pretty stacktrace. It
+     * communicates with this child using a pipe.  If we timeout+Exit, while
+     * libfuzzer is still communicating with the llvm-symbolizer child, we will
+     * be left with an orphan llvm-symbolizer process. Sometimes, this appears
+     * to lead to a deadlock in the forkserver. Use waitpid to check if there
+     * are any waitable children. If so, exit out of the signal-handler, and
+     * let libfuzzer finish communicating with the child, and exit, on its own.
+     */
+    if (waitpid(-1, NULL, WNOHANG) == 0) {
+        return;
+    }
+
     _Exit(0);
 }
 
-- 
2.27.0


