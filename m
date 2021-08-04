Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F91D3E028B
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 15:58:55 +0200 (CEST)
Received: from localhost ([::1]:49950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBHQ6-0003CC-Im
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 09:58:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1mBHOX-0001Qr-RP
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 09:57:18 -0400
Received: from mail-bn8nam08on2112.outbound.protection.outlook.com
 ([40.107.100.112]:9952 helo=NAM04-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1mBHOV-0007M7-C9
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 09:57:17 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XfJTAEKjwl+uI5/AM0N35qsWn66SBQXPA2SJFNb2R/QXNonywFL8RbhZsGxgqpb0KhLfx5WTtkm1ye8w5j+XnjzQhQyTcE/tdTogIFyL/dTTFkBTqI/tGt4ULGIwgH7GqjubivBebUycz4MqPvqY5H1Y1rP37BxhwCZPduyaRpNZWVAgIyhDXW/9HtWuK+CzYiVvcMB+jKKqtjiu2q8sqsA+4SJgjR1jmvHqV1axvITPUFkJPOo51VGqguFuViTgVU0x4Jka1/CBwas6bdvg4Ccf6Y6ByHLXXfsnquOz+ZROg1Opw5o2TqtjGtISMWmhDVKVVzu3vebJ2mdRD6Wa9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JqZvg8+4n6fFzmLglEDEc1931ol06VbYyo0PGmfyLBQ=;
 b=aPpZdIi5G9RG06/hQMpI6IKAZ0deB6LN685nLycwhC9/aqNmfwm0B2RfdZpGxIieFleHSi6mFbFksnhEKo87hcKa6Vpj0z8UJkhMPLcqomHH4uZgTYMBzVC9ZjUn0KStDUte2/U2/p34i4bvefDKmvJS5LOxC3sM2C+gYCeOttump8wA4mGRIbRq8hNneO1UPne3u2gKl7lxp9q12UautHhRs6/u16n0REnmC2uGUMGJJbFExgqted6v2ULoe5xlvfMe4z7iLzUuwwybdUbAZtnu0gpB1oPwNDx3mmIbEGh41NYSfmx3ezFG5SpvU6ZDRFQi0VpQyZCmpB+fS0GbuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JqZvg8+4n6fFzmLglEDEc1931ol06VbYyo0PGmfyLBQ=;
 b=svRq73CixCkFxZjrDqkHAy8j0HCKlYisVMzyHCL5XzCRLcy10pwS1IyqRJLF1wlUAz1LicVAN2ytC6jgG6NMq3QZ3VCNFyEgzETm/CSQApmH+ZFbED8j2kUWIlhXrSMZgNO80Tf01V+PQLiR34qtZYoTX5zec1VvG9Z8sdMR+DE=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SN6PR03MB3422.namprd03.prod.outlook.com (2603:10b6:805:4a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.21; Wed, 4 Aug
 2021 13:56:40 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::24fc:a5d:be8d:eb3f]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::24fc:a5d:be8d:eb3f%3]) with mapi id 15.20.4373.027; Wed, 4 Aug 2021
 13:56:40 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] fuzz: unblock SIGALRM so the timeout works
Date: Wed,  4 Aug 2021 09:56:21 -0400
Message-Id: <20210804135621.31455-3-alxndr@bu.edu>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210804135621.31455-1-alxndr@bu.edu>
References: <20210804135621.31455-1-alxndr@bu.edu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR22CA0027.namprd22.prod.outlook.com
 (2603:10b6:208:238::32) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from stormtrooper.vrmnet (72.74.210.193) by
 MN2PR22CA0027.namprd22.prod.outlook.com (2603:10b6:208:238::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.16 via Frontend
 Transport; Wed, 4 Aug 2021 13:56:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 070b9ecd-3901-499a-91e4-08d9574faef7
X-MS-TrafficTypeDiagnostic: SN6PR03MB3422:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR03MB3422085A3A45E42E93F03C4CBAF19@SN6PR03MB3422.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1002;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EIK41fXbpnkLInc5STp455QckAwIe7km62SE1mt6HGhWnuvqSypTW87KobM+3Ef5L8FrhwzHWRfCWSVg+4bVezr+hxGtx4xNtopQwDq9y9T259FE8LSmIYl4ylZb+iTZ4UfHdxcfp54N0qDA/hSJ0mvbZ8hh/JLNUjZAQWOCH5NUFALFhkKE0iLOXoIwvEVTgXsuXTmPkVSnbiS2dXyCi+3jJ/5A0IAD4FzkPg03YnKzkPnsc92jaIQ6HVbHkc/ET0AI52QBQj6rquifd2lCFNQtVy4iHKZxpHmbZ3UZVSO2wHDgfU4bvLxrgAgreb4Y21x2jPatNqgONMSrzDpJ7Fk7v8TOLMSt3La9KaBgaMaxmmFevAttEdMGR7V5Hww4L905uhI63ahKgJamBuu1y5EK1G1RKciVN/Q9ErUFj+VUjsKk1f4I5nJ6yp7DdSTChWueHdBnKDIU8Yl60TQnd6E7OOaEuatRRbaupuqNAhBf1CaPalHGgB7B0tJxBPQnmSciGmOY2+aPd1zYYFBYC4o+pBVqnLeI1GgLeToWaMVHbmNb5r2DXO4FluOq9oAETj7KlOoSGJDrng5rWGbnxZKmnV9WeM/cAr1Xnz8Lg+eDes2xBjGpQMXVn8MBN+EaSO/JECQ7Vc2v33vUidJsQZPiNCKe52lQwfiO3ywDt3hgpTOCJ4jHiCptmaCMijDLhr36IsaeS+btuFVJJpobtw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(86362001)(8936002)(66946007)(66476007)(186003)(66556008)(8676002)(6666004)(1076003)(26005)(83380400001)(6512007)(6916009)(2616005)(36756003)(956004)(508600001)(38350700002)(2906002)(786003)(316002)(38100700002)(5660300002)(6486002)(54906003)(52116002)(4326008)(75432002)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ey6wFM0cpwRHOZr5objKI9hxfZ7RJmVUnzv68F47qOtLoarn2dVsU+avr6fy?=
 =?us-ascii?Q?eiLUan1cxLTf+ikftONK1SvqtT3Mjxc70asxOqbxcLtK2UEfSQ17zr/wAvT8?=
 =?us-ascii?Q?6ZIa7T498H0TQQklocPvvJmY6xs4XCQNXFe+4uv3v7tlXIGKicqpKnwlWvqO?=
 =?us-ascii?Q?GQ/gb8PdXQsBa+d67XEYBD+3OMTd2I2o215xT+efr7kGXWiHwS8ilpFSpey8?=
 =?us-ascii?Q?tL1a4s4dTG0CMMQXYfQyQF7UHPIAA0Dai3RAWGgcGxLy8nhDtwiLlGg98iOP?=
 =?us-ascii?Q?ZRZBFhU15Y7ia7a86U3bALoLDj4uXZOwYbm9Fp5pW92GxCVLQFYa0iJITsLb?=
 =?us-ascii?Q?iHFC4ienNrBxeGtju2YxbzSigjm++dLd4jgqqDYeyYvzDvlb53D/WbCSD0zA?=
 =?us-ascii?Q?ZXEPq7HZB7ELHHKf2hpBptTm2A/vqOBoe+y3T1LIRltIN/4f4BfzZHo5pElV?=
 =?us-ascii?Q?76E4XAwxgyUtWHOdj/1KeggsxsPgDLJyEJ2Z5KBKUvVHE/RIsU9n2KG7SndI?=
 =?us-ascii?Q?+kTYIPBq+aI32dD2xsfQMAoM2xCYA2x3cRzrOtIW3f14+GmLraIK561z2ZGz?=
 =?us-ascii?Q?JGvCZrfW0xWIBaqDMbrq4WbFxtZBR2OgX+qf66hsmle4+CmENXR9oJjWA7zw?=
 =?us-ascii?Q?/4bVLl7CAk6WLRbZzEdH/TQByOjRfjqhhsVm5Vx+K6mXL3We1TYRDopmhpxm?=
 =?us-ascii?Q?+BoRjWIrRbJSMBTJd6h3EEBu0zn+PUcNJm20xVj/7BGSEeZMFcR9jxTlijye?=
 =?us-ascii?Q?C0+2DQDP4PnP+bbBjzfcpl4q0p4Ta3CeCZjsLfzpzVYwLyOqZXVtyYkEM608?=
 =?us-ascii?Q?srqV4FsTGIviwotZieNJAQwajD8dBMNDNPXvS10BlQ10BMjuaXCEjOlYSdPl?=
 =?us-ascii?Q?KfKIQUbaCEIEtL5ZkcbFrrnriSnGpeGLoUlq1mu+dnDgSlzOQgEUijy/rWj8?=
 =?us-ascii?Q?5Z36RnvHhzqbcNPc+SVzDZIg3Pb79UBSdzUHWxFbbc3RC0OcyGC/fzqME8ER?=
 =?us-ascii?Q?DmLW5C45pJaVoi/lP04XuHAIYO9+k+qr8Rtq63zhryBMQBo9NpeUCdIPUYB4?=
 =?us-ascii?Q?QmCtYplb0yq2IkqT88SszIUqIzdU/DRSKpze4csvVr4SsgeBn4cWpjEtZJxm?=
 =?us-ascii?Q?5Ji1xmAuvQhhi/TDKTirQB67DX3y72RwgWqQ4nxz4B+R1EgLrpEd9a5cDcbj?=
 =?us-ascii?Q?pGIp/BsDlcxx1T437fXQR6gXGQ7m82OdkWkvfbbYfh2Jww8AHzruglsA3jAH?=
 =?us-ascii?Q?WiG1ZSrqPP+AByIEga7KM6DoV/0O7pUcrJ6OI33utpRLWqtEQIrikh/1D6Ew?=
 =?us-ascii?Q?JBAZisVaTUWHxAjl0CxFxBA/?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 070b9ecd-3901-499a-91e4-08d9574faef7
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2021 13:56:40.0508 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tcQtd0ccyZxIl5tXyPEazfUn+llvpUjkJlDBV5uqdbb+de0QJlQtYGb2z5ptNvBh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB3422
Received-SPF: pass client-ip=40.107.100.112; envelope-from=alxndr@bu.edu;
 helo=NAM04-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: 1
X-Spam_score: 0.1
X-Spam_bar: /
X-Spam_report: (0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998, MSGID_FROM_MTA_HEADER=0.001,
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
 Darren Kenny <darren.kenny@oracle.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 stefanha@redhat.com, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The timeout mechanism wont work if SIGALRM is blocked. This changes
unmasks SIGALRM when the timer is installed. This doesn't completely
solve the problem, as the fuzzer could trigger some device activity that
re-masks SIGALRM. However, there are currently no inputs on OSS-Fuzz
that re-mask SIGALRM and timeout. If that turns out to be a real issue,
we could try to hook sigmask-type calls, or use a separate timer thread.

Based-on: <20210713150037.9297-1-alxndr@bu.edu>
Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
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


