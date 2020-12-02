Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 409FB2CC2BD
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 17:51:31 +0100 (CET)
Received: from localhost ([::1]:47550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkVLm-0006d5-8R
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 11:51:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1kkVDJ-0001lh-KB
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 11:42:47 -0500
Received: from mail-bn8nam11on2109.outbound.protection.outlook.com
 ([40.107.236.109]:60513 helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1kkVDC-0000Am-TC
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 11:42:41 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OJMikObSwgS87OOyoPUz6L8K/zGTN44VzyX73MKUMJDX036wUhaZVqdfCwfzBFJB7VnfN6DpW+esKSicyJyDETS7t07vHo4O4evyzsM8N+4DtT9ZMLIvaRoMN+esixbsRRAoqUphnYGD/K5O70Yb+Qv4Xv1PqUc3uSniRV/mCliF4KueVDL1nut1Z4xpc03N/8x3DpWeXDm09cjZSk1YAwXSsRPyHcMcvQ3ZZwtyT7CTJwpzokEb9XsNWtRLoUxgcrHC96LRLZxQIgaqI4FIMPgQ2kF69gFhkv4H+1gn8uWvup+j4z04UExKFBYksW1/Oq6nGy1srbmbBQ/8Izuzxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1iJ8YmrqXputn6ny4vroIyUY5LHsbjARkbrC8Lbn2AU=;
 b=Fd061e0cZcmO28vzk/Ke0DYwx9T7MWCdxo1ij7nZJ0UkZslSpH2Z0cyiJS350ciLf6UyEC09AbMg3Cj3t+YYd5U+PPcS0WvUplSToi1sU64RzWDUx011K66scXe1Rx7X9Wij5trFWe4S9DP7+cdMIMwYedCrjZ24QzeOUiQkRcL1uPWuZXs/q3xSvxTaFgHg4T5XQM5oIgu1kiOyqJsnEOu4CzTbBrsqAGUytc2aCL8uZ4De2lk4N45tQezX6woGPt4NRjhGPON82ldfB3OiDsM8b2YZ4sVg8nFPMM8izRghnyHYgZ012FgO+DaPrQiUsJ6vy3b2TjWKZDeuvHIy6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1iJ8YmrqXputn6ny4vroIyUY5LHsbjARkbrC8Lbn2AU=;
 b=jksECEe0vzfgnWoJh9EQIV9OktI9aEKnIpYPOU2rtJweVoC2iiBqH8r+zsazHcbaE7kD3AA2k666t87YbY7WiixhzoS1Ttf0CJ+manTJkxgjkwlHQCCPtMGLJUiXH063ZUOLnFi7fe6n44T9CZ271+D9lrl5i/IAzkngv/b3KFM=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SA2PR03MB5756.namprd03.prod.outlook.com (2603:10b6:806:112::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.22; Wed, 2 Dec
 2020 16:42:37 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::d520:4c19:8ce6:7db2]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::d520:4c19:8ce6:7db2%2]) with mapi id 15.20.3611.031; Wed, 2 Dec 2020
 16:42:37 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PATCH] fuzz: avoid double-fetches by default
Date: Wed,  2 Dec 2020 11:42:14 -0500
Message-Id: <20201202164214.93867-1-alxndr@bu.edu>
X-Mailer: git-send-email 2.28.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [72.93.72.163]
X-ClientProxiedBy: MN2PR13CA0017.namprd13.prod.outlook.com
 (2603:10b6:208:160::30) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from stormtrooper.vrmnet (72.93.72.163) by
 MN2PR13CA0017.namprd13.prod.outlook.com (2603:10b6:208:160::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.8 via Frontend
 Transport; Wed, 2 Dec 2020 16:42:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d7f65fd1-dfd1-4f6e-5b82-08d896e14683
X-MS-TrafficTypeDiagnostic: SA2PR03MB5756:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA2PR03MB57563E24094AC7A83A06C7F7BAF30@SA2PR03MB5756.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1Qvm3mDTdNbw5lSblor0+dUdmGYYURx/fLvuT+WzjIoBC9XXnfrwIBaFUbhjWx/POFanrjMP6RSxgbJXrqhrzNHwrCe+rmbp6nL8w0i5qSfbLRQeTRtBQe6R1mA1HgjoJj1RngHRN1yopqeFnbDMTRT5RDL093vzaqhdXBSHxEyv/Sosym+GAGG/bZ/iOliCyPGKO9AJfMiP7kfOVswgBi1CkZH6FyuNoykiXoy3zKJX3eh76PKHq4PApq/7SLbHTX/1emGso1X9g6Jd12t4Nrfn6VjSvJj+e2vieTyuaKwCxNMi1cRY4QIGdM1zBU3hBPQubLSw+UvC3fpl+o2cDQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(396003)(366004)(136003)(346002)(52116002)(186003)(66556008)(4326008)(478600001)(66946007)(6486002)(2906002)(6666004)(16526019)(8936002)(75432002)(6506007)(86362001)(1076003)(2616005)(8676002)(316002)(786003)(26005)(956004)(6916009)(5660300002)(36756003)(6512007)(66476007)(54906003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?9O+XUGq93suTPCxo0BmhA6gFwRx3aSBeWQtG53XQ6rIlHS7Rq3R1G7jbkU+s?=
 =?us-ascii?Q?Jao3FBvq+kYnzAxpgQCyoaB5HJ35uLDe0/e+05x2i2Euk0Nbxbf97BIadvic?=
 =?us-ascii?Q?HcMEF++EEhnbtdDmvgqCPhtS+StoL6IzydUVRz0/9yhFd9jPO04qJxrbA7Z/?=
 =?us-ascii?Q?MrOq+Hfx888clV7m+RvY5Ykum6IGNAb0fjwzfG+zUB7HGSePmmOPP5XWZwFN?=
 =?us-ascii?Q?p/rJeL4yoweR4pHGXt98DLiJ+EndaDJik2gsAcfZRoRTE9EVhga1apqeEs4V?=
 =?us-ascii?Q?dnKzBRGTDtO9X3JTmPwQQncDH36PEc+L4TPH1n6Vey6Kl5S+4Duld3DlIx4+?=
 =?us-ascii?Q?BhfsU4mS3tPsKjth6qKYPAYq8SO9pfpeNBv3MLhDIiwvKCXQIjDCemPzPNXp?=
 =?us-ascii?Q?oEALwlmjcKXLtycrcEbSfvU2gGLctN5fHRTxFSd29T3uVslsNeYARnspo+0P?=
 =?us-ascii?Q?RSSD+SHJ1SBtkIWML1TWE3RNrpFCMn1ItyU0hLG2o4b+jbUcBxAJ2mCTdE1g?=
 =?us-ascii?Q?fqFw8kE8CXJlT4wFJB/Bp4kDE7KqH4pIR+BGpp/nS3nvY8B2vvPfxPuQiGLC?=
 =?us-ascii?Q?4ojiYwLuy01oS2ywsBqP+2TcTGpQUauTFpQAGjU0RuOU7lvhHX3Nn1jq3vdg?=
 =?us-ascii?Q?AKlUzUaOtQHD3x1w2qDLR0K1tmVps4AZKHa0Ckkr7y6jjm+wndRnoFXw9fD0?=
 =?us-ascii?Q?Ww+LTn652U9BnoOesPgr3ourURqRQwCg8nhQvMKFqrj7VPO53H52ro3xMQyA?=
 =?us-ascii?Q?6ZvHaKt9KxZkSktxfLRRjxhsFmCrtpj6hxZFy0bepudSvGe/5C1DLujmyPxe?=
 =?us-ascii?Q?OS60KRxMunqAg3rNEfI7KtOw1yLf3kKDcUjBitxvdOQvwhmvMErY/6l3EYZz?=
 =?us-ascii?Q?PQl7B92p4jNCJvoLVfdgeCV/7Xb7Lkw97+/yakNCsTMypRea4zdahDUIMFiT?=
 =?us-ascii?Q?C9e32KGvEumAQTatoIUf7LChR8ejsLVJAHX0Af6eezQ=3D?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: d7f65fd1-dfd1-4f6e-5b82-08d896e14683
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2020 16:42:37.1754 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0ZAz9fuWoP0ujFZJI6hIIg7BnPeoD//Js+yTB0oqdJibcNOGF+UtbwwtutQrg5as
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5756
Received-SPF: pass client-ip=40.107.236.109; envelope-from=alxndr@bu.edu;
 helo=NAM11-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.001,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The generic fuzzer can find double-fetch bugs. However:
* We currently have no good way of producing qemu-system reproducers for
  double-fetch bugs. Even if we can get developers to run the binary-blob
  reproducers with the qemu-fuzz builds, we currently don't have a minimizer for
  these reproducers, so they are usually not easy to follow.
* Often times the fuzzer will provide a reproducer containing a
  double-fetch for a bug that can be reproduced without double-fetching.

Until we find a way to build nice double-fetch reproducers that
developers are willing to look at, lets tell OSS-Fuzz to avoid
double-fetches.

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
---
 tests/qtest/fuzz/generic_fuzz.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/qtest/fuzz/generic_fuzz.c b/tests/qtest/fuzz/generic_fuzz.c
index 262a963d2e..07ad690683 100644
--- a/tests/qtest/fuzz/generic_fuzz.c
+++ b/tests/qtest/fuzz/generic_fuzz.c
@@ -916,6 +916,7 @@ static GString *generic_fuzz_predefined_config_cmdline(FuzzTarget *t)
     g_assert(t->opaque);
 
     config = t->opaque;
+    setenv("QEMU_AVOID_DOUBLE_FETCH", "1", 1);
     setenv("QEMU_FUZZ_ARGS", config->args, 1);
     setenv("QEMU_FUZZ_OBJECTS", config->objects, 1);
     return generic_fuzz_cmdline(t);
-- 
2.28.0


