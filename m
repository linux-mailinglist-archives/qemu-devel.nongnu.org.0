Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D723742D5E6
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 11:22:07 +0200 (CEST)
Received: from localhost ([::1]:43066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mawwA-0001gy-MZ
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 05:22:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lma@suse.com>) id 1mawqe-0004lc-Va
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 05:16:25 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.111.102]:38341)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lma@suse.com>) id 1mawqd-00051f-86
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 05:16:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1634202981;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h4C7b7jtf2NXK+xt0rNa6NStSs5CJW3Ym1UIwDaHS8o=;
 b=C34Z2+V8zx08D/Igyl/pMO8dOKdQxoWp/y4TwvLXNM8pFjUH+XH3ecO3LA7zkLUUWutMjZ
 vJgchGTNCDbkEG8BLcPnAo4qrsVvOXUDvQpftnwdaAoJ8Deznml8yI8shEoM3S6ouQ3T+P
 b7GFh0SIuJLb3hZe2Yaiv2nuP+8L87c=
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2052.outbound.protection.outlook.com [104.47.8.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-4-NNpIlvL1OaassmGogEZ1Sg-1;
 Thu, 14 Oct 2021 11:16:20 +0200
X-MC-Unique: NNpIlvL1OaassmGogEZ1Sg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sc64UADqdeZ0uPqErpXDAqehyGmtJNFBhAaV3IGq1r5zW3dRGDKEFmk9ah+dQiSRzMHdO+Fo+GrC1hjDFFX87P8Fn6tu13LPTxP1Y5SPe4cDcv8CBYx9ZC1ER4kSkpZOYr+0e5hQjcpiyekNlkeGZMsT7PjlBcRH1N8RaHZS/BPMfL9R7FT+oRDrgYTyiYk2L2xveUutMza6t4Sc4yqDzGHJ2a8iKy9e77YWC3sLYjwbbzEk4yvztTBojwb00ZznCI5wa5Uv1OJMle0FO/LcLHieg51HywiaLOzxqYnBHh6W+nM6dEMhl9rI1tywXC2XnLBVS36hSmiyKVWDYPhYcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2fuGTTIAZYKp4k9JyA/zCdCJp0OJW1Np2q1gighPCpw=;
 b=CD9ZD4IV+pK61UfQSOeyxUiTfGAzwE8kcLUMO8TuROu5AxEHcpyhUueOIPkM3dUCAWPRJjFLlbTgUJI/p/T4SteGopVPLa46Ye/k19fyA6nlXUvNxCzg1Yq3BIPQV2SpdGljpFzkTubPExf1t0sm4I2yU9LrYTN2NkuNsTH9/N8SsWK+zkVhC4B0C/6tUkugHU16SWLVtCkSCjFioT1Xr36144b17NEHvohvs7IZ19/C18cLgye6hiztAZQoVREd6SubpNCTjNm4sS52ubl7qBukUzv1eq/EB4gnP7vp5/Lp0TLypZsnSVcj72qq7nt/RXpjVpdIwzKOFsU6dAFHUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=suse.com;
Received: from AM9PR04MB8602.eurprd04.prod.outlook.com (2603:10a6:20b:439::12)
 by AM9PR04MB8826.eurprd04.prod.outlook.com (2603:10a6:20b:409::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15; Thu, 14 Oct
 2021 09:16:20 +0000
Received: from AM9PR04MB8602.eurprd04.prod.outlook.com
 ([fe80::5499:6698:e99f:cf7f]) by AM9PR04MB8602.eurprd04.prod.outlook.com
 ([fe80::5499:6698:e99f:cf7f%8]) with mapi id 15.20.4608.016; Thu, 14 Oct 2021
 09:16:20 +0000
From: Lin Ma <lma@suse.com>
To: qemu-devel@nongnu.org
CC: quintela@redhat.com,
	dgilbert@redhat.com,
	Lin Ma <lma@suse.com>
Subject: [PATCH 3/3] tests: add postcopy-uffd-usermode-only capability into
 migration-test
Date: Thu, 14 Oct 2021 17:15:51 +0800
Message-ID: <20211014091551.15201-4-lma@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20211014091551.15201-1-lma@suse.com>
References: <20211014091551.15201-1-lma@suse.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: HK0PR01CA0071.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::35) To AM9PR04MB8602.eurprd04.prod.outlook.com
 (2603:10a6:20b:439::12)
MIME-Version: 1.0
Received: from localhost (60.251.47.115) by
 HK0PR01CA0071.apcprd01.prod.exchangelabs.com (2603:1096:203:a6::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.25 via Frontend
 Transport; Thu, 14 Oct 2021 09:16:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 95bf8360-eeda-4822-0ff3-08d98ef348ea
X-MS-TrafficTypeDiagnostic: AM9PR04MB8826:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM9PR04MB8826A8E21B4E3061C0E65375C5B89@AM9PR04MB8826.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aRFmlh6KyvQ6Y7DZmz9+wYCQrtbhZWuiPD7VRNJNYcduvJEqOaWmcP80vtMVGoXLjr3tDcQdk4bukH5/yjPt9MuM7g55whTW+CAgb/XUx8mna6V/n+5kOOiuf4RNUTZQpKgTQSCySr+aepI5nXFjS8NbuEqWarQRAZJOast6T4ugCyn9yyij5H8J//LsAconyEblUGWovAR2YlqG6SlbfTCXvdfOpjJW5oGkyT6xUC1jexvNXucGCgamg/LTgBaMZi8C63sJObnGwag9rvUw7B9ZxVe/jwwDZ4Mt/AasV9+hZ8IlidiW3e4ebq0QoT2yWQoNpDobCydmwqf0/no4TGdnI4cdOhk4Uc8yGGEwST/qJB9D1pz2QN9t7PumFFVJ6p2/A/NwNUfz7Lep4GYWLNi6mw3d0p6c3eQTzNkh2BagTZGA1GhQztjLdltmzeW9RI5E/rcSDz3Uaq3dusHpn085WGO3Ock6ufXbbcllWG+Fev39yK7FW5HYY1GwZMwK4ehGCgUNPGQ/2D0b70qW6KSv32SE5c+qNf304JCmOW7DjhpcAAY3sVw1e9uSrO84bHCMXB/7rBIRdSD74uH9g26AgHvkFPqmlKZ2hkI2KOfMTzaBSn4IVkK5zcBpBjTYQHkyzfE9HdT62H9ci2STIQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR04MB8602.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6666004)(66946007)(6916009)(66556008)(66476007)(508600001)(8676002)(107886003)(1076003)(86362001)(8936002)(5660300002)(38100700002)(83380400001)(55236004)(6496006)(186003)(2906002)(4326008)(2616005)(956004)(26005)(6486002)(316002)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vqrA3/Fc6r5Q7KhDbelUJbURo9CfqokH0IsNuqsV+9Sp9kplqn9XCyAd4bgJ?=
 =?us-ascii?Q?JaL2VdutkSd/nxZdkMMulfjDrF9NDDKeM+Oq5tQU6YBC1m45XvM3+eR+rK9A?=
 =?us-ascii?Q?xBosj1CCSkxfLSJ2CL1HO180CvJ7NlSQo/BjhIhq5Cwn4ra+0vGNSmipW3x/?=
 =?us-ascii?Q?+x9eZHK7+4fFGDJCZ8WazOkghq39+iJ5c5uejyVsqY5vGRJwEOPwH3vzutMC?=
 =?us-ascii?Q?IOnhOQ0BZH1ijPJQHIH3DjfkjB3VhTTziVHBSFNG0dYDuDsqUXWBaO9dfV0g?=
 =?us-ascii?Q?9g7KHM7XiC8gALBiXKZ3F+u6QamBKZMIbH+duHQ2LGsbTmPvw+F+FpeIWTF5?=
 =?us-ascii?Q?Rt/ABoWdOF741rN60WCrQjDbjZCy+j6MtHWbvY1ANXEtJTlI6D8+2W8YCBO9?=
 =?us-ascii?Q?4opnZOFgRmKo5doPXyaCnixf+BYC5lXx+xI4z7Y0a3YlsaV/o5KemmGmtknr?=
 =?us-ascii?Q?Qwhiu1YqCOlOEdICP/iqVKLKXBGDdJ4mzv83W3chOzAxyz7q27dDLTbYeZOV?=
 =?us-ascii?Q?xOfNLCsTOoJGPELDr6ppqcpBB2VWFtAU9CaaBU1c7v3A8PM3BQttgnzgumyn?=
 =?us-ascii?Q?Uex4taix/yfFR2ix1VX5U4EFlBlbpw1KcdjxO4819BF2rQXs3uvCGZ/KakvE?=
 =?us-ascii?Q?DN2X31YbCP/cDuRDQSYu6i9Z89Dsa45/pQ7D9j035oZvauGBpnqL9WKr1R0W?=
 =?us-ascii?Q?0cYavpDsIRy3VxNfPHJYpeI/vHCjrXYIa6IrXOuQMyUhNk98eABBVb7ivrM9?=
 =?us-ascii?Q?xaJwWlO0ToYaa22oGHt6squJROHEz2FEyp7xhB7+lGUZthl22tqy6AuufhjW?=
 =?us-ascii?Q?pc85Pumcx1q7ygkoZD6htooZeb448rVTAIkVQCsKLyDodAqSe4K6D5kP9OiU?=
 =?us-ascii?Q?C+ISk0NN69nSbfsmsAcJsVdBT/enrdWYHMeRBhZNuEhhUO59GIRsYi2XBquZ?=
 =?us-ascii?Q?W64l3DraMhOYjiM2javz2pDK3CeV/O8QFrzniryqspY7CWJCIKXKYkxBVh2P?=
 =?us-ascii?Q?ZQ+0TYrAYU42lsQ3v3KNRcEmbzH/RSth6XVUKBpwtoLurTLolRCY45XfMdhr?=
 =?us-ascii?Q?rrP3u/mZzA/qzgnkZIB3UG4hCu/H6Pt95s/yA//8oQss76hzJedJ7ELrpN+6?=
 =?us-ascii?Q?lRPXKcGMbdPN5mp/bEOxit3QZavZgbbfr1c6ZSdfotmYmq+zE/26CXqk/ppP?=
 =?us-ascii?Q?aN8F/+yHIARZiyDTZ4/lYkiXxF3JRNMxqNt6Xbkn0spdrlBzObAeqTBPssrL?=
 =?us-ascii?Q?2cclCZRPPBWs3tMxJtBg5i87zcYipM9+YiJ7VwClpZsc0iyz0suECpmWiDvO?=
 =?us-ascii?Q?NLnr9Jjb0JaXpmEVXEUQOG1W?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95bf8360-eeda-4822-0ff3-08d98ef348ea
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8602.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2021 09:16:20.2057 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OZRA1d/Hg27ZZSM76J6sRE/5WkBJWJhp1eGzaHB4aH8qw/6cMs8WkyvQm79EOhtx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8826
Received-SPF: pass client-ip=194.104.111.102; envelope-from=lma@suse.com;
 helo=de-smtp-delivery-102.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Signed-off-by: Lin Ma <lma@suse.com>
---
 tests/qtest/migration-test.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index cc5e83d98a..0cd4f49bed 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -38,6 +38,7 @@
 unsigned start_address;
 unsigned end_address;
 static bool uffd_feature_thread_id;
+static bool uffd_usermode_only;
=20
 /* A downtime where the test really should converge */
 #define CONVERGE_DOWNTIME 1000
@@ -60,8 +61,12 @@ static bool ufd_version_check(void)
     int ufd =3D syscall(__NR_userfaultfd, O_CLOEXEC);
=20
     if (ufd =3D=3D -1) {
-        g_test_message("Skipping test: userfaultfd not available");
-        return false;
+        ufd =3D syscall(__NR_userfaultfd, O_CLOEXEC | UFFD_USER_MODE_ONLY)=
;
+        if (ufd =3D=3D -1) {
+	    g_test_message("Skipping test: userfaultfd not available");
+            return false;
+	} else
+            uffd_usermode_only =3D true;
     }
=20
     api_struct.api =3D UFFD_API;
@@ -670,6 +675,8 @@ static int migrate_postcopy_prepare(QTestState **from_p=
tr,
     }
=20
     migrate_set_capability(from, "postcopy-ram", true);
+    if (uffd_usermode_only)
+        migrate_set_capability(to, "postcopy-uffd-usermode-only", true);
     migrate_set_capability(to, "postcopy-ram", true);
     migrate_set_capability(to, "postcopy-blocktime", true);
=20
--=20
2.26.2


