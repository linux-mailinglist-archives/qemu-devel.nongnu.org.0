Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 409F734C23E
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 05:38:16 +0200 (CEST)
Received: from localhost ([::1]:47826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQijH-0006zR-BT
	for lists+qemu-devel@lfdr.de; Sun, 28 Mar 2021 23:38:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lQiiE-0006Zo-Oe
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 23:37:10 -0400
Received: from mail-co1nam11on2105.outbound.protection.outlook.com
 ([40.107.220.105]:46720 helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lQiiA-0006sb-Oo
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 23:37:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CbEKPuXYuZpKFH5iqiDEWi4L/mPv2bTsXLsV6qJgcMO1ygJlsTTkbqnaslxx+m8DNgEKhyEq0Dd72chsV3NWwr08DCPyQTHQmV5G89lgcRIrtxgn3db0eAXLn4XeCVOYTr9D5I2Wr+LyAQAmqHKpowK4Z1ROJoVrFnXxqKJV6O6NcrxFAru6i9zsmJfa4hK3Zi206MSChaBn9W9ODjCtybbRj6f2OX4EwvKfL0FO+itXRJxQ288zuiLkLloiQeXAr5lIMQp/uBjgv09kfLv9BOKXDbmmnOdlTcvSBOsrIQ21KjxTHpVfb8dOoDbBFb8zOpOhh/j6MPmd9W6f98vuEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p9PtW1YHXEtQVUV8we5fZkjzzAYXAbGTTFW0M0afddM=;
 b=h8+aiiF1ysEdBg+ZdT8kIrNZIBUY9bvI//Jz3XZBVtZDhA8a8oUc3hN6IXexZzmaiqubVP8qEXsN6EdbeExG9xW/HBn1QFC+tPdKAL721dB+s7FOWRHy4uFpjHcd9CW+R7Z4/iM+qXaoo42kKcUHO8oWYvr1otJ2s0uCATz/OCakwFIid9LbyILOzMPY1actYaJSxe+5p82XBeSyLL1RElW9L5iw6qSrnhT2D5zwT96zJXb1r1s+7UXJa/PA+EyNGPatpHeMCklAHPPXHYivmwddS0UzTegDchV/qTHgGTgGOqUlNXzfgGfTOcmXxysrW0s8xEYMmBs3AD054YYVsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p9PtW1YHXEtQVUV8we5fZkjzzAYXAbGTTFW0M0afddM=;
 b=PqjBTKeJDZ8mNxr9RBdvrjFLIQAtaKbTeB2EyeLK5n9GNPzFREV6QJXJoKL+qcWF+nTYfIVC6YQ3hHwVWLb21m2iXyRdNhalOfQxKafVpY/LqrtDgdKeuH/N0DurCwr/cEN4xL3Q+jV3k5XMqP/pgR8ffdUr6XABvRGawzhA6Co=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SN6PR03MB4126.namprd03.prod.outlook.com (2603:10b6:805:b9::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.29; Mon, 29 Mar
 2021 03:21:58 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::dda8:67d8:8d23:74c6]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::dda8:67d8:8d23:74c6%6]) with mapi id 15.20.3977.033; Mon, 29 Mar 2021
 03:21:58 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PATCH] tests/qtest: add more tests for am53c974 device
Date: Sun, 28 Mar 2021 23:21:42 -0400
Message-Id: <20210329032142.430539-1-alxndr@bu.edu>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <161667857481.32669.15954116519339833776.malone@soybean.canonical.com>
References: <161667857481.32669.15954116519339833776.malone@soybean.canonical.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [72.74.210.193]
X-ClientProxiedBy: BL1PR13CA0164.namprd13.prod.outlook.com
 (2603:10b6:208:2bd::19) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from stormtrooper.vrmnet (72.74.210.193) by
 BL1PR13CA0164.namprd13.prod.outlook.com (2603:10b6:208:2bd::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.16 via Frontend
 Transport; Mon, 29 Mar 2021 03:21:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e06fdfd0-990e-4504-0158-08d8f261cf37
X-MS-TrafficTypeDiagnostic: SN6PR03MB4126:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR03MB4126C2B611A3C57B378F7415BA7E9@SN6PR03MB4126.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:862;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: InvZEZdQKQgYtnEZeIYGeETqRBDvkZOUpO7fZYU0YNc9Dca52Y4SBSJP7OgbpFvL3EsYyke+yjiXDM/iCVPn4AOuYRLkbc8xu24fLtMWPTUGpJyezJVJIo4pUlVCT/gyyrrZEjhD5JfrZNmmAN8MZuXxPW1vMtflZFPp3mG+lwD1sKwgLxf5SdtY07lVRxEU/5P6VaEAVelKL8sKN4E1x+D8owUWyhP+sHhkt7rPtIPovpxxrRftQ0kZv8/be8rYPoeC29BIJUIUPcYz1v1gsxPb2La3FQqD51fQeiRLGU0OA1HFMmhX8tkA/Uq8hCfI72ekmZmK/oW1SCDFxWg/hjzob1EkVGZx3sMZW42Y92vKNUmgSlWHaWPrAbcBZSlNV1q/Kq3XKy3yIHa6umZHq6BDdPhFIslIxTZFqretqK2O+ojdxQuciEIdCG7gEddfakQ1d6Uz4Cle7nEQdlR8RMmBxxUTLaxxG+Af135PJovqgz7bYTOQqJM71MLnSJ9obtr1LO64+pQXuDxdBvq27KFQIflUCkZ3UAWmueN8YFCuLgKb+YeMZxQ5JWQl1wBGWq0c9s8m6RSGPqAaWhdz11ukKOKbbuq0U3vIovI+XotwVBSjyNdGYVAIIsdaqAf5TPZgD/LNbVRAOxE941fHWDoPAixP+zpWBLHpLMB7wTQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(136003)(346002)(366004)(39860400002)(186003)(36756003)(66476007)(16526019)(66946007)(66556008)(478600001)(786003)(1076003)(75432002)(38100700001)(52116002)(30864003)(316002)(86362001)(6916009)(5660300002)(8936002)(26005)(54906003)(2616005)(6506007)(956004)(8676002)(2906002)(6666004)(6512007)(4326008)(6486002)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?oChFdrRjrzw/Q0MZKVqyX9djoE8MHa7aGPUMU3mpStdq69KZj9/k+KGAr9ZR?=
 =?us-ascii?Q?wy0v4V6mM96zZC4yOmkEdVQHN2LqK3BZiOWtDSaubExoVaM414D7SF5hHFTa?=
 =?us-ascii?Q?rI0WY05amAmO0IlQ6eDFUjJFs9AWbpWnrkk5GxwgE+u8TE5JU1a9zc0zJViU?=
 =?us-ascii?Q?BjvrNc+uIKnaxdZedbvyPq78zxtedsDz0KVWkDEXKDekP9nr5g7dhuhCXPP5?=
 =?us-ascii?Q?qqSmKyJharCdb4YIszI9sCvJhVl3jXQJc9J3yOwBPkVhYZUSWRB3BCSLM/uH?=
 =?us-ascii?Q?7gJ9tKJCl+sNMgrMcJvLoKxCyBp9m6LEXvP/Ah3pDvNuSyWylvMfdOktC3BE?=
 =?us-ascii?Q?T+H4fAmbSZ531+LRhXdzd4xN9tV6sBbC7HrRxkuwmTf1aSxqYjTMKJ+QMZnE?=
 =?us-ascii?Q?VCV+wMAPW/WGXyu+Z+ajO4t+CcS+2U88DcrESc++pXI/nXQGimRteDBNYq5x?=
 =?us-ascii?Q?A3nMEJITzA3+qiW4nj7yPtncQqb/MJ+j5XAyUPDJ7ECW04wbf5/IE+IHpLHf?=
 =?us-ascii?Q?1Q657cjc5HNAsCdn7mYvPOBTGPw/emFChPLX9L632nIHwUZg0kkZmxKM5Uak?=
 =?us-ascii?Q?bUG9dls58byLcBGlNowk8hOijbaxKQZZuQj59ZLuOmYETQLf9JnKxE5wD71h?=
 =?us-ascii?Q?gDnk8TqoPWc9+gbqV0ZwB7DPKvqE/HhbvDpr7kh41xoND/2IBycj8VQJl2xl?=
 =?us-ascii?Q?xb4+vckycR5q8GxVWMZuBdHw9aK1titA+nmN/s3L1LtXhJX3a91EQSdnOKCF?=
 =?us-ascii?Q?i4lIofREmMoyaUyYm4QW2q+Qe8EkU6eCm/6OACP8MYqzWE7KcIKcFkhx59ga?=
 =?us-ascii?Q?Wyf6i+ITatFX+biqkZPzNHn0wnNuDAaatcNR7sW3h6P4BRF+GoYXec82SujG?=
 =?us-ascii?Q?MaX+g79kiLNs3SUgf4zrGkqRSp6dT+ncd4gMCTjCr6m23dekZKiI+pB2J/t8?=
 =?us-ascii?Q?pENVW35wYGFm+e9021Rrbty+XzLhkNO2rN1ZEHXnvz1bc7J5HB3o7XcOds0I?=
 =?us-ascii?Q?AWVAZTKKDAwdNjiAor9aGgkfJe38HgQseRoPN6h5Rm0eCANO8L3E6fUbECYw?=
 =?us-ascii?Q?OwWJb0pgowViCaBuFuuJhBidlTw9wpYO8vWHfgjggcFq2BfHtpDVDgWaeqsU?=
 =?us-ascii?Q?/qn6V/et6k//m3x4KilzDId3Y14Qx29q5bdSGyY0DccaMec4nitM2kQRxa18?=
 =?us-ascii?Q?9+2Bl4OW0PtedGCpFCJ2wwp2M8VUPfZtOT1hQM4EusQOiUAvgPpmXgrGYj7w?=
 =?us-ascii?Q?gZUOatjuefzL2EfF2HmaV148F/eQz8YWBMtVZCR/Ka4eF3LtnZFqGH0azDU1?=
 =?us-ascii?Q?JnkLlZb/BMZrrO3j365UWObe?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: e06fdfd0-990e-4504-0158-08d8f261cf37
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2021 03:21:57.9750 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RCDABTx3+j8HELr0fPGAFr3ReR82HhrH9Mwt0EIIOWLZ8q/mO5awk+N3/+2tw279
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB4126
Received-SPF: pass client-ip=40.107.220.105; envelope-from=alxndr@bu.edu;
 helo=NAM11-CO1-obe.outbound.protection.outlook.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.999,
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
Cc: Alexander Bulekov <alxndr@bu.edu>,
 Mark Cave-Ayland <1909247@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add some more regression tests for the esp device. 

(Prasad's Patch)
Based-on: <161657108250.32717.5311086901810004029.malone@soybean.canonical.com>
(Mark's v2 Patchset)
Based-on: <20210317230223.24854-1-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
---

Hi Mark,
Hopefully these are useful. I realized that my previous message was
innacurate (I forgot to apply Prasad's patch, or your v2
patchset). The only corruptions that I am continuing to see are
heap-overflows. I am guessing that most of these are due to some mututal
root cause, so the number of tests far-exceeds the actual number of
errors, but I am providing all of the crashes with unique-looking
stack-traces, just in case.
Please let me know if I can provide anything else that would help.
-Alex

 tests/qtest/am53c974-test.c | 1137 +++++++++++++++++++++++++++++++++++
 1 file changed, 1137 insertions(+)

diff --git a/tests/qtest/am53c974-test.c b/tests/qtest/am53c974-test.c
index c90bd4c187..cb2a5646a6 100644
--- a/tests/qtest/am53c974-test.c
+++ b/tests/qtest/am53c974-test.c
@@ -9,6 +9,1125 @@
 
 #include "libqos/libqtest.h"
 
+/*
+ * cat << EOF | ./qemu-system-i386 -display none -machine accel=qtest, -m \
+ * 512M -device am53c974,id=scsi -device scsi-hd,drive=disk0 -drive \
+ * id=disk0,if=none,file=null-co://,format=raw -nodefaults -qtest stdio
+ * outl 0xcf8 0x80001010
+ * outl 0xcfc 0xc000
+ * outl 0xcf8 0x80001004
+ * outw 0xcfc 0x01
+ * outb 0xc000 0x4
+ * outb 0xc008 0xa0
+ * outl 0xc03f 0x0300
+ * outl 0xc00b 0xc300
+ * outw 0xc00b 0x9000
+ * outl 0xc00b 0xc300
+ * outl 0xc00b 0xc300
+ * outl 0xc00b 0xc300
+ * outw 0xc00b 0x9000
+ * outw 0xc00b 0x1000
+ * EOF
+ */
+static void crash_0900379669(void)
+{
+    QTestState *s = qtest_init(
+        "-display none -m 512M -device am53c974,id=scsi -device scsi-hd,drive=disk0 "
+        "-drive id=disk0,if=none,file=null-co://,format=raw -nodefaults");
+    qtest_outl(s, 0xcf8, 0x80001010);
+    qtest_outl(s, 0xcfc, 0xc000);
+    qtest_outl(s, 0xcf8, 0x80001004);
+    qtest_outw(s, 0xcfc, 0x01);
+    qtest_outb(s, 0xc000, 0x4);
+    qtest_outb(s, 0xc008, 0xa0);
+    qtest_outl(s, 0xc03f, 0x0300);
+    qtest_outl(s, 0xc00b, 0xc300);
+    qtest_outw(s, 0xc00b, 0x9000);
+    qtest_outl(s, 0xc00b, 0xc300);
+    qtest_outl(s, 0xc00b, 0xc300);
+    qtest_outl(s, 0xc00b, 0xc300);
+    qtest_outw(s, 0xc00b, 0x9000);
+    qtest_outw(s, 0xc00b, 0x1000);
+    qtest_quit(s);
+}
+/*
+ * cat << EOF | ./qemu-system-i386 -display none -machine accel=qtest, -m \
+ * 512M -device am53c974,id=scsi -device scsi-hd,drive=disk0 -drive \
+ * id=disk0,if=none,file=null-co://,format=raw -nodefaults -qtest stdio
+ * outl 0xcf8 0x80001010
+ * outl 0xcfc 0xc000
+ * outl 0xcf8 0x80001004
+ * outw 0xcfc 0x01
+ * outl 0xc008 0x20
+ * outw 0xc000 0x1
+ * outb 0xc040 0x03
+ * outl 0xc00b 0xc200
+ * outl 0xc00b 0xc200
+ * outl 0xc00b 0xc200
+ * outl 0xc00b 0xc200
+ * outl 0xc00b 0xc200
+ * outl 0xc00b 0xc200
+ * outl 0xc00b 0xc200
+ * outl 0xc00b 0xc200
+ * outl 0xc00b 0xc200
+ * outl 0xc00b 0xc200
+ * outl 0xc00b 0xc200
+ * outw 0xc00b 0x4200
+ * outl 0xc00a 0x410000
+ * EOF
+ */
+static void crash_094661a91b(void)
+{
+    QTestState *s = qtest_init(
+        "-display none -m 512M -device am53c974,id=scsi -device scsi-hd,drive=disk0 "
+        "-drive id=disk0,if=none,file=null-co://,format=raw -nodefaults");
+    qtest_outl(s, 0xcf8, 0x80001010);
+    qtest_outl(s, 0xcfc, 0xc000);
+    qtest_outl(s, 0xcf8, 0x80001004);
+    qtest_outw(s, 0xcfc, 0x01);
+    qtest_outl(s, 0xc008, 0x20);
+    qtest_outw(s, 0xc000, 0x1);
+    qtest_outb(s, 0xc040, 0x03);
+    qtest_outl(s, 0xc00b, 0xc200);
+    qtest_outl(s, 0xc00b, 0xc200);
+    qtest_outl(s, 0xc00b, 0xc200);
+    qtest_outl(s, 0xc00b, 0xc200);
+    qtest_outl(s, 0xc00b, 0xc200);
+    qtest_outl(s, 0xc00b, 0xc200);
+    qtest_outl(s, 0xc00b, 0xc200);
+    qtest_outl(s, 0xc00b, 0xc200);
+    qtest_outl(s, 0xc00b, 0xc200);
+    qtest_outl(s, 0xc00b, 0xc200);
+    qtest_outl(s, 0xc00b, 0xc200);
+    qtest_outw(s, 0xc00b, 0x4200);
+    qtest_outl(s, 0xc00a, 0x410000);
+    qtest_quit(s);
+}
+/*
+ * cat << EOF | ./qemu-system-i386 -display none -machine accel=qtest, -m \
+ * 512M -device am53c974,id=scsi -device scsi-hd,drive=disk0 -drive \
+ * id=disk0,if=none,file=null-co://,format=raw -nodefaults -qtest stdio
+ * outl 0xcf8 0x80001010
+ * outl 0xcfc 0xc000
+ * outl 0xcf8 0x80001004
+ * outw 0xcfc 0x01
+ * outb 0xc000 0x4
+ * outl 0xc007 0x8000
+ * outl 0xc03f 0x0300
+ * outl 0xc00b 0x4300
+ * outw 0xc00b 0x9000
+ * outl 0xc00b 0xc300
+ * outl 0xc00b 0xc300
+ * outl 0xc00b 0xc300
+ * outw 0xc00b 0x9000
+ * outw 0xc00b 0x1000
+ * EOF
+ */
+static void crash_0fff2155cb(void)
+{
+    QTestState *s = qtest_init(
+        "-display none -m 512M -device am53c974,id=scsi -device scsi-hd,drive=disk0 "
+        "-drive id=disk0,if=none,file=null-co://,format=raw -nodefaults");
+    qtest_outl(s, 0xcf8, 0x80001010);
+    qtest_outl(s, 0xcfc, 0xc000);
+    qtest_outl(s, 0xcf8, 0x80001004);
+    qtest_outw(s, 0xcfc, 0x01);
+    qtest_outb(s, 0xc000, 0x4);
+    qtest_outl(s, 0xc007, 0x8000);
+    qtest_outl(s, 0xc03f, 0x0300);
+    qtest_outl(s, 0xc00b, 0x4300);
+    qtest_outw(s, 0xc00b, 0x9000);
+    qtest_outl(s, 0xc00b, 0xc300);
+    qtest_outl(s, 0xc00b, 0xc300);
+    qtest_outl(s, 0xc00b, 0xc300);
+    qtest_outw(s, 0xc00b, 0x9000);
+    qtest_outw(s, 0xc00b, 0x1000);
+    qtest_quit(s);
+}
+/*
+ * cat << EOF | ./qemu-system-i386 -display none -machine accel=qtest, -m \
+ * 512M -device am53c974,id=scsi -device scsi-hd,drive=disk0 -drive \
+ * id=disk0,if=none,file=null-co://,format=raw -nodefaults -qtest stdio
+ * outl 0xcf8 0x80001010
+ * outl 0xcfc 0xc000
+ * outl 0xcf8 0x80001004
+ * outw 0xcfc 0x01
+ * outw 0xc00c 0x41
+ * outw 0xc00a 0x00
+ * outl 0xc00a 0x00
+ * outw 0xc00c 0x43
+ * outw 0xc00b 0x00
+ * outw 0xc00b 0x00
+ * outw 0xc00c 0x00
+ * outl 0xc00a 0x00
+ * outw 0xc00a 0x00
+ * outl 0xc00a 0x00
+ * outw 0xc00c 0x00
+ * outl 0xc00a 0x00
+ * outw 0xc00a 0x00
+ * outl 0xc00a 0x00
+ * outw 0xc00c 0x00
+ * outl 0xc00a 0x00
+ * outw 0xc00a 0x00
+ * outl 0xc00a 0x00
+ * outw 0xc00c 0x00
+ * outl 0xc00a 0x00
+ * outl 0xc006 0x00
+ * outl 0xc00b 0x00
+ * outw 0xc00b 0x0800
+ * outw 0xc00b 0x00
+ * outw 0xc00b 0x00
+ * outl 0xc006 0x00
+ * outl 0xc00b 0x00
+ * outw 0xc00b 0x0800
+ * outw 0xc00b 0x00
+ * outw 0xc00b 0x4100
+ * outw 0xc00a 0x00
+ * outl 0xc00a 0x100000
+ * outl 0xc00a 0x00
+ * outw 0xc00c 0x43
+ * outl 0xc00a 0x100000
+ * outl 0xc00a 0x100000
+ * EOF
+ */
+static void crash_1548bd10e7(void)
+{
+    QTestState *s = qtest_init(
+        "-display none -m 512M -device am53c974,id=scsi -device scsi-hd,drive=disk0 "
+        "-drive id=disk0,if=none,file=null-co://,format=raw -nodefaults");
+    qtest_outl(s, 0xcf8, 0x80001010);
+    qtest_outl(s, 0xcfc, 0xc000);
+    qtest_outl(s, 0xcf8, 0x80001004);
+    qtest_outw(s, 0xcfc, 0x01);
+    qtest_outw(s, 0xc00c, 0x41);
+    qtest_outw(s, 0xc00a, 0x00);
+    qtest_outl(s, 0xc00a, 0x00);
+    qtest_outw(s, 0xc00c, 0x43);
+    qtest_outw(s, 0xc00b, 0x00);
+    qtest_outw(s, 0xc00b, 0x00);
+    qtest_outw(s, 0xc00c, 0x00);
+    qtest_outl(s, 0xc00a, 0x00);
+    qtest_outw(s, 0xc00a, 0x00);
+    qtest_outl(s, 0xc00a, 0x00);
+    qtest_outw(s, 0xc00c, 0x00);
+    qtest_outl(s, 0xc00a, 0x00);
+    qtest_outw(s, 0xc00a, 0x00);
+    qtest_outl(s, 0xc00a, 0x00);
+    qtest_outw(s, 0xc00c, 0x00);
+    qtest_outl(s, 0xc00a, 0x00);
+    qtest_outw(s, 0xc00a, 0x00);
+    qtest_outl(s, 0xc00a, 0x00);
+    qtest_outw(s, 0xc00c, 0x00);
+    qtest_outl(s, 0xc00a, 0x00);
+    qtest_outl(s, 0xc006, 0x00);
+    qtest_outl(s, 0xc00b, 0x00);
+    qtest_outw(s, 0xc00b, 0x0800);
+    qtest_outw(s, 0xc00b, 0x00);
+    qtest_outw(s, 0xc00b, 0x00);
+    qtest_outl(s, 0xc006, 0x00);
+    qtest_outl(s, 0xc00b, 0x00);
+    qtest_outw(s, 0xc00b, 0x0800);
+    qtest_outw(s, 0xc00b, 0x00);
+    qtest_outw(s, 0xc00b, 0x4100);
+    qtest_outw(s, 0xc00a, 0x00);
+    qtest_outl(s, 0xc00a, 0x100000);
+    qtest_outl(s, 0xc00a, 0x00);
+    qtest_outw(s, 0xc00c, 0x43);
+    qtest_outl(s, 0xc00a, 0x100000);
+    qtest_outl(s, 0xc00a, 0x100000);
+    qtest_quit(s);
+}
+/*
+ * cat << EOF | ./qemu-system-i386 -display none -machine accel=qtest, -m \
+ * 512M -device am53c974,id=scsi -device scsi-hd,drive=disk0 -drive \
+ * id=disk0,if=none,file=null-co://,format=raw -nodefaults -qtest stdio
+ * outl 0xcf8 0x80001010
+ * outl 0xcfc 0xc000
+ * outl 0xcf8 0x80001004
+ * outw 0xcfc 0x01
+ * outl 0xc00a 0x420000
+ * outl 0xc00a 0x430000
+ * outl 0xc00b 0x00
+ * outw 0xc00b 0x00
+ * outw 0xc00b 0x00
+ * outl 0xc00b 0x00
+ * outw 0xc00b 0x00
+ * outl 0xc00b 0x00
+ * outw 0xc00b 0x00
+ * outl 0xc00b 0x00
+ * outb 0xc008 0x00
+ * outw 0xc00b 0x00
+ * outb 0xc008 0xa0
+ * outw 0xc00b 0x00
+ * outw 0xc00b 0x00
+ * outw 0xc00b 0x00
+ * outl 0xc00a 0x00
+ * outw 0xc00b 0x00
+ * outl 0xc00a 0x00
+ * outl 0xc00a 0x00
+ * outl 0xc00b 0x00
+ * outw 0xc00b 0x00
+ * outl 0xc00b 0x1000
+ * outw 0xc00b 0x1000
+ * EOF
+ */
+static void crash_1afe349482(void)
+{
+    QTestState *s = qtest_init(
+        "-display none -m 512M -device am53c974,id=scsi -device scsi-hd,drive=disk0 "
+        "-drive id=disk0,if=none,file=null-co://,format=raw -nodefaults");
+    qtest_outl(s, 0xcf8, 0x80001010);
+    qtest_outl(s, 0xcfc, 0xc000);
+    qtest_outl(s, 0xcf8, 0x80001004);
+    qtest_outw(s, 0xcfc, 0x01);
+    qtest_outl(s, 0xc00a, 0x420000);
+    qtest_outl(s, 0xc00a, 0x430000);
+    qtest_outl(s, 0xc00b, 0x00);
+    qtest_outw(s, 0xc00b, 0x00);
+    qtest_outw(s, 0xc00b, 0x00);
+    qtest_outl(s, 0xc00b, 0x00);
+    qtest_outw(s, 0xc00b, 0x00);
+    qtest_outl(s, 0xc00b, 0x00);
+    qtest_outw(s, 0xc00b, 0x00);
+    qtest_outl(s, 0xc00b, 0x00);
+    qtest_outb(s, 0xc008, 0x00);
+    qtest_outw(s, 0xc00b, 0x00);
+    qtest_outb(s, 0xc008, 0xa0);
+    qtest_outw(s, 0xc00b, 0x00);
+    qtest_outw(s, 0xc00b, 0x00);
+    qtest_outw(s, 0xc00b, 0x00);
+    qtest_outl(s, 0xc00a, 0x00);
+    qtest_outw(s, 0xc00b, 0x00);
+    qtest_outl(s, 0xc00a, 0x00);
+    qtest_outl(s, 0xc00a, 0x00);
+    qtest_outl(s, 0xc00b, 0x00);
+    qtest_outw(s, 0xc00b, 0x00);
+    qtest_outl(s, 0xc00b, 0x1000);
+    qtest_outw(s, 0xc00b, 0x1000);
+    qtest_quit(s);
+}
+/*
+ * cat << EOF | ./qemu-system-i386 -display none -machine accel=qtest, -m \
+ * 512M -device am53c974,id=scsi -device scsi-hd,drive=disk0 -drive \
+ * id=disk0,if=none,file=null-co://,format=raw -nodefaults -qtest stdio
+ * outl 0xcf8 0x80001010
+ * outl 0xcfc 0xc000
+ * outl 0xcf8 0x80001004
+ * outw 0xcfc 0x01
+ * outl 0xc007 0x2000
+ * outw 0xc00b 0x0100
+ * outw 0xc00c 0x43
+ * outl 0xc00a 0x00
+ * outw 0xc00a 0x00
+ * outl 0xc00a 0x00
+ * outw 0xc00c 0x00
+ * outl 0xc00a 0x00
+ * outw 0xc00a 0x00
+ * outl 0xc00a 0x00
+ * outw 0xc00c 0x00
+ * outl 0xc00a 0x00
+ * outw 0xc00a 0x00
+ * outl 0xc00a 0x00
+ * outw 0xc00c 0x00
+ * outw 0xc00b 0x00
+ * outw 0xc00b 0x00
+ * outw 0xc00c 0x00
+ * outl 0xc00a 0x00
+ * outw 0xc00a 0x00
+ * outl 0xc00a 0x00
+ * outw 0xc00c 0x00
+ * outl 0xc00a 0x00
+ * outl 0xc00a 0x00
+ * outw 0xc00c 0x00
+ * outl 0xc00a 0x00
+ * outw 0xc00c 0x00
+ * outw 0xc00b 0x00
+ * outw 0xc00b 0x00
+ * outw 0xc00c 0x00
+ * outw 0xc00a 0x00
+ * outl 0xc00a 0x100000
+ * outl 0xc00a 0x100000
+ * outl 0xc00a 0x00
+ * outw 0xc00c 0x43
+ * outl 0xc00a 0x100000
+ * outl 0xc00a 0x100000
+ * EOF
+ */
+static void crash_1b42581317(void)
+{
+    QTestState *s = qtest_init(
+        "-display none -m 512M -device am53c974,id=scsi -device scsi-hd,drive=disk0 "
+        "-drive id=disk0,if=none,file=null-co://,format=raw -nodefaults");
+    qtest_outl(s, 0xcf8, 0x80001010);
+    qtest_outl(s, 0xcfc, 0xc000);
+    qtest_outl(s, 0xcf8, 0x80001004);
+    qtest_outw(s, 0xcfc, 0x01);
+    qtest_outl(s, 0xc007, 0x2000);
+    qtest_outw(s, 0xc00b, 0x0100);
+    qtest_outw(s, 0xc00c, 0x43);
+    qtest_outl(s, 0xc00a, 0x00);
+    qtest_outw(s, 0xc00a, 0x00);
+    qtest_outl(s, 0xc00a, 0x00);
+    qtest_outw(s, 0xc00c, 0x00);
+    qtest_outl(s, 0xc00a, 0x00);
+    qtest_outw(s, 0xc00a, 0x00);
+    qtest_outl(s, 0xc00a, 0x00);
+    qtest_outw(s, 0xc00c, 0x00);
+    qtest_outl(s, 0xc00a, 0x00);
+    qtest_outw(s, 0xc00a, 0x00);
+    qtest_outl(s, 0xc00a, 0x00);
+    qtest_outw(s, 0xc00c, 0x00);
+    qtest_outw(s, 0xc00b, 0x00);
+    qtest_outw(s, 0xc00b, 0x00);
+    qtest_outw(s, 0xc00c, 0x00);
+    qtest_outl(s, 0xc00a, 0x00);
+    qtest_outw(s, 0xc00a, 0x00);
+    qtest_outl(s, 0xc00a, 0x00);
+    qtest_outw(s, 0xc00c, 0x00);
+    qtest_outl(s, 0xc00a, 0x00);
+    qtest_outl(s, 0xc00a, 0x00);
+    qtest_outw(s, 0xc00c, 0x00);
+    qtest_outl(s, 0xc00a, 0x00);
+    qtest_outw(s, 0xc00c, 0x00);
+    qtest_outw(s, 0xc00b, 0x00);
+    qtest_outw(s, 0xc00b, 0x00);
+    qtest_outw(s, 0xc00c, 0x00);
+    qtest_outw(s, 0xc00a, 0x00);
+    qtest_outl(s, 0xc00a, 0x100000);
+    qtest_outl(s, 0xc00a, 0x100000);
+    qtest_outl(s, 0xc00a, 0x00);
+    qtest_outw(s, 0xc00c, 0x43);
+    qtest_outl(s, 0xc00a, 0x100000);
+    qtest_outl(s, 0xc00a, 0x100000);
+    qtest_quit(s);
+}
+/*
+ * cat << EOF | ./qemu-system-i386 -display none -machine accel=qtest, -m \
+ * 512M -device am53c974,id=scsi -device scsi-hd,drive=disk0 -drive \
+ * id=disk0,if=none,file=null-co://,format=raw -nodefaults -qtest stdio
+ * outl 0xcf8 0x80001010
+ * outl 0xcfc 0xc000
+ * outl 0xcf8 0x80001004
+ * outw 0xcfc 0x01
+ * outl 0xc007 0x1500
+ * outw 0xc00b 0x4100
+ * outw 0xc00b 0x4100
+ * outl 0xc00b 0x0300
+ * outl 0xc00b 0x0300
+ * outl 0xc00b 0x0300
+ * outl 0xc00b 0x0300
+ * outl 0xc00b 0x0300
+ * outl 0xc00b 0x0300
+ * outl 0xc00b 0x0300
+ * outl 0xc00b 0x0300
+ * outl 0xc00b 0x0300
+ * outl 0xc00b 0x0300
+ * outl 0xc00b 0x0300
+ * outl 0xc00b 0x0300
+ * outl 0xc00b 0x0300
+ * outl 0xc00b 0x0300
+ * outl 0xc00b 0x00
+ * outw 0xc00b 0x1000
+ * outw 0xc009 0x00
+ * outl 0xc00b 0xc000
+ * outl 0xc00b 0xc000
+ * outl 0xc00b 0xc000
+ * outl 0xc00b 0xc000
+ * outl 0xc00b 0x0
+ * outl 0xc00b 0xc000
+ * outl 0xc00b 0xc000
+ * outl 0xc00b 0xc000
+ * outl 0xc007 0x00
+ * outl 0xc00b 0x0300
+ * outl 0xc00b 0x1000
+ * outl 0xc007 0x00
+ * outw 0xc00b 0x4100
+ * EOF
+ */
+static void crash_30e28cfa86(void)
+{
+    QTestState *s = qtest_init(
+        "-display none -m 512M -device am53c974,id=scsi -device scsi-hd,drive=disk0 "
+        "-drive id=disk0,if=none,file=null-co://,format=raw -nodefaults");
+    qtest_outl(s, 0xcf8, 0x80001010);
+    qtest_outl(s, 0xcfc, 0xc000);
+    qtest_outl(s, 0xcf8, 0x80001004);
+    qtest_outw(s, 0xcfc, 0x01);
+    qtest_outl(s, 0xc007, 0x1500);
+    qtest_outw(s, 0xc00b, 0x4100);
+    qtest_outw(s, 0xc00b, 0x4100);
+    qtest_outl(s, 0xc00b, 0x0300);
+    qtest_outl(s, 0xc00b, 0x0300);
+    qtest_outl(s, 0xc00b, 0x0300);
+    qtest_outl(s, 0xc00b, 0x0300);
+    qtest_outl(s, 0xc00b, 0x0300);
+    qtest_outl(s, 0xc00b, 0x0300);
+    qtest_outl(s, 0xc00b, 0x0300);
+    qtest_outl(s, 0xc00b, 0x0300);
+    qtest_outl(s, 0xc00b, 0x0300);
+    qtest_outl(s, 0xc00b, 0x0300);
+    qtest_outl(s, 0xc00b, 0x0300);
+    qtest_outl(s, 0xc00b, 0x0300);
+    qtest_outl(s, 0xc00b, 0x0300);
+    qtest_outl(s, 0xc00b, 0x0300);
+    qtest_outl(s, 0xc00b, 0x00);
+    qtest_outw(s, 0xc00b, 0x1000);
+    qtest_outw(s, 0xc009, 0x00);
+    qtest_outl(s, 0xc00b, 0xc000);
+    qtest_outl(s, 0xc00b, 0xc000);
+    qtest_outl(s, 0xc00b, 0xc000);
+    qtest_outl(s, 0xc00b, 0xc000);
+    qtest_outl(s, 0xc00b, 0x0);
+    qtest_outl(s, 0xc00b, 0xc000);
+    qtest_outl(s, 0xc00b, 0xc000);
+    qtest_outl(s, 0xc00b, 0xc000);
+    qtest_outl(s, 0xc007, 0x00);
+    qtest_outl(s, 0xc00b, 0x0300);
+    qtest_outl(s, 0xc00b, 0x1000);
+    qtest_outl(s, 0xc007, 0x00);
+    qtest_outw(s, 0xc00b, 0x4100);
+    qtest_quit(s);
+}
+/*
+ * cat << EOF | ./qemu-system-i386 -display none -machine accel=qtest, -m \
+ * 512M -device am53c974,id=scsi -device scsi-hd,drive=disk0 -drive \
+ * id=disk0,if=none,file=null-co://,format=raw -nodefaults -qtest stdio
+ * outl 0xcf8 0x80001010
+ * outl 0xcfc 0xc000
+ * outl 0xcf8 0x80001004
+ * outw 0xcfc 0x01
+ * outb 0xc008 0x42
+ * outw 0xc00b 0x4100
+ * outw 0xc00b 0x4100
+ * outw 0xc00b 0x00
+ * outw 0xc00b 0x1000
+ * outl 0xc00b 0x0300
+ * outl 0xc00b 0x0300
+ * outl 0xc00b 0x0300
+ * outl 0xc00b 0x0300
+ * outl 0xc00b 0x0300
+ * outl 0xc00b 0x0300
+ * outl 0xc00b 0x0300
+ * outl 0xc00b 0x0300
+ * outl 0xc00b 0x0300
+ * outl 0xc00b 0x0300
+ * outl 0xc00b 0x0300
+ * outl 0xc00b 0x0300
+ * outl 0xc00b 0x0300
+ * outl 0xc00b 0x0300
+ * outw 0xc00b 0x1000
+ * EOF
+ */
+static void crash_34093bfc7c(void)
+{
+    QTestState *s = qtest_init(
+        "-display none -m 512M -device am53c974,id=scsi -device scsi-hd,drive=disk0 "
+        "-drive id=disk0,if=none,file=null-co://,format=raw -nodefaults");
+    qtest_outl(s, 0xcf8, 0x80001010);
+    qtest_outl(s, 0xcfc, 0xc000);
+    qtest_outl(s, 0xcf8, 0x80001004);
+    qtest_outw(s, 0xcfc, 0x01);
+    qtest_outb(s, 0xc008, 0x42);
+    qtest_outw(s, 0xc00b, 0x4100);
+    qtest_outw(s, 0xc00b, 0x4100);
+    qtest_outw(s, 0xc00b, 0x00);
+    qtest_outw(s, 0xc00b, 0x1000);
+    qtest_outl(s, 0xc00b, 0x0300);
+    qtest_outl(s, 0xc00b, 0x0300);
+    qtest_outl(s, 0xc00b, 0x0300);
+    qtest_outl(s, 0xc00b, 0x0300);
+    qtest_outl(s, 0xc00b, 0x0300);
+    qtest_outl(s, 0xc00b, 0x0300);
+    qtest_outl(s, 0xc00b, 0x0300);
+    qtest_outl(s, 0xc00b, 0x0300);
+    qtest_outl(s, 0xc00b, 0x0300);
+    qtest_outl(s, 0xc00b, 0x0300);
+    qtest_outl(s, 0xc00b, 0x0300);
+    qtest_outl(s, 0xc00b, 0x0300);
+    qtest_outl(s, 0xc00b, 0x0300);
+    qtest_outl(s, 0xc00b, 0x0300);
+    qtest_outw(s, 0xc00b, 0x1000);
+    qtest_quit(s);
+}
+/*
+ * cat << EOF | ./qemu-system-i386 -display none -machine accel=qtest, -m \
+ * 512M -device am53c974,id=scsi -device scsi-hd,drive=disk0 -drive \
+ * id=disk0,if=none,file=null-co://,format=raw -nodefaults -qtest stdio
+ * outl 0xcf8 0x80001010
+ * outl 0xcfc 0xc000
+ * outl 0xcf8 0x80001004
+ * outw 0xcfc 0x01
+ * outw 0xc000 0x1
+ * outb 0xc040 0x03
+ * outl 0xc00b 0xc200
+ * outl 0xc00b 0xc200
+ * outl 0xc00b 0xc200
+ * outl 0xc00b 0xc200
+ * outl 0xc00b 0xc200
+ * outl 0xc00b 0xc200
+ * outl 0xc00b 0xc200
+ * outl 0xc00b 0xc200
+ * outl 0xc00b 0xc200
+ * outl 0xc00b 0xc200
+ * outl 0xc00b 0xc200
+ * outl 0xc00b 0xc200
+ * outw 0xc007 0xa000
+ * outl 0xc00a 0x410000
+ * EOF
+ */
+static void crash_3a05434a1f(void)
+{
+    QTestState *s = qtest_init(
+        "-display none -m 512M -device am53c974,id=scsi -device scsi-hd,drive=disk0 "
+        "-drive id=disk0,if=none,file=null-co://,format=raw -nodefaults");
+    qtest_outl(s, 0xcf8, 0x80001010);
+    qtest_outl(s, 0xcfc, 0xc000);
+    qtest_outl(s, 0xcf8, 0x80001004);
+    qtest_outw(s, 0xcfc, 0x01);
+    qtest_outw(s, 0xc000, 0x1);
+    qtest_outb(s, 0xc040, 0x03);
+    qtest_outl(s, 0xc00b, 0xc200);
+    qtest_outl(s, 0xc00b, 0xc200);
+    qtest_outl(s, 0xc00b, 0xc200);
+    qtest_outl(s, 0xc00b, 0xc200);
+    qtest_outl(s, 0xc00b, 0xc200);
+    qtest_outl(s, 0xc00b, 0xc200);
+    qtest_outl(s, 0xc00b, 0xc200);
+    qtest_outl(s, 0xc00b, 0xc200);
+    qtest_outl(s, 0xc00b, 0xc200);
+    qtest_outl(s, 0xc00b, 0xc200);
+    qtest_outl(s, 0xc00b, 0xc200);
+    qtest_outl(s, 0xc00b, 0xc200);
+    qtest_outw(s, 0xc007, 0xa000);
+    qtest_outl(s, 0xc00a, 0x410000);
+    qtest_quit(s);
+}
+/*
+ * cat << EOF | ./qemu-system-i386 -display none -machine accel=qtest, -m \
+ * 512M -device am53c974,id=scsi -device scsi-hd,drive=disk0 -drive \
+ * id=disk0,if=none,file=null-co://,format=raw -nodefaults -qtest stdio
+ * outl 0xcf8 0x80001010
+ * outl 0xcfc 0xc000
+ * outl 0xcf8 0x80001004
+ * outw 0xcfc 0x01
+ * outw 0xc000 0x01
+ * outb 0xc040 0x03
+ * outl 0xc00b 0xc200
+ * outl 0xc00b 0xc200
+ * outl 0xc00b 0xc200
+ * outl 0xc00b 0xc200
+ * outl 0xc00b 0xc200
+ * outl 0xc00b 0xc200
+ * outl 0xc00b 0xc200
+ * outl 0xc00b 0xc200
+ * outl 0xc00b 0xc200
+ * outl 0xc00b 0xc200
+ * outl 0xc00b 0xc200
+ * outl 0xc00b 0xc200
+ * outl 0xc00b 0xc200
+ * outl 0xc00b 0x4200
+ * outl 0xc00b 0x4000
+ * outl 0xc00b 0x4000
+ * outl 0xc00b 0x4000
+ * outl 0xc00b 0x4000
+ * outl 0xc00b 0x4000
+ * outl 0xc00b 0x4000
+ * outl 0xc00b 0x4000
+ * outl 0xc00b 0x4000
+ * outl 0xc00b 0x4000
+ * outl 0xc00b 0x4000
+ * outl 0xc00b 0x4000
+ * outl 0xc00b 0x4000
+ * outl 0xc00b 0x4000
+ * outl 0xc00b 0x4000
+ * outl 0xc00b 0x4000
+ * outl 0xc00b 0x4000
+ * outl 0xc00b 0x4000
+ * outl 0xc00b 0x4000
+ * outl 0xc00b 0x4000
+ * outl 0xc00b 0x4000
+ * outl 0xc00b 0x4000
+ * outl 0xc00b 0x4000
+ * outl 0xc00b 0x4000
+ * outl 0xc00b 0x4000
+ * outl 0xc00b 0x4000
+ * outl 0xc00b 0x4000
+ * outl 0xc00b 0x4000
+ * outl 0xc00b 0x4000
+ * outl 0xc00b 0x4000
+ * outl 0xc00b 0x4000
+ * outl 0xc00b 0xc200
+ * outl 0xc00b 0x00
+ * outl 0xc00b 0x00
+ * outl 0xc00b 0x00
+ * outl 0xc00b 0x00
+ * outl 0xc00b 0x00
+ * outl 0xc00b 0x00
+ * outl 0xc00b 0x00
+ * outl 0xc00b 0x00
+ * outl 0xc00b 0x00
+ * outl 0xc00b 0x00
+ * outl 0xc00b 0x00
+ * outl 0xc00b 0x00
+ * outl 0xc00b 0x00
+ * outl 0xc00b 0x00
+ * outl 0xc00b 0x00
+ * outl 0xc00b 0x00
+ * outl 0xc00b 0x00
+ * outw 0xc00b 0x00
+ * EOF
+ */
+static void crash_3ab5744bc3(void)
+{
+    QTestState *s = qtest_init(
+        "-display none -m 512M -device am53c974,id=scsi -device scsi-hd,drive=disk0 "
+        "-drive id=disk0,if=none,file=null-co://,format=raw -nodefaults");
+    qtest_outl(s, 0xcf8, 0x80001010);
+    qtest_outl(s, 0xcfc, 0xc000);
+    qtest_outl(s, 0xcf8, 0x80001004);
+    qtest_outw(s, 0xcfc, 0x01);
+    qtest_outw(s, 0xc000, 0x01);
+    qtest_outb(s, 0xc040, 0x03);
+    qtest_outl(s, 0xc00b, 0xc200);
+    qtest_outl(s, 0xc00b, 0xc200);
+    qtest_outl(s, 0xc00b, 0xc200);
+    qtest_outl(s, 0xc00b, 0xc200);
+    qtest_outl(s, 0xc00b, 0xc200);
+    qtest_outl(s, 0xc00b, 0xc200);
+    qtest_outl(s, 0xc00b, 0xc200);
+    qtest_outl(s, 0xc00b, 0xc200);
+    qtest_outl(s, 0xc00b, 0xc200);
+    qtest_outl(s, 0xc00b, 0xc200);
+    qtest_outl(s, 0xc00b, 0xc200);
+    qtest_outl(s, 0xc00b, 0xc200);
+    qtest_outl(s, 0xc00b, 0xc200);
+    qtest_outl(s, 0xc00b, 0x4200);
+    qtest_outl(s, 0xc00b, 0x4000);
+    qtest_outl(s, 0xc00b, 0x4000);
+    qtest_outl(s, 0xc00b, 0x4000);
+    qtest_outl(s, 0xc00b, 0x4000);
+    qtest_outl(s, 0xc00b, 0x4000);
+    qtest_outl(s, 0xc00b, 0x4000);
+    qtest_outl(s, 0xc00b, 0x4000);
+    qtest_outl(s, 0xc00b, 0x4000);
+    qtest_outl(s, 0xc00b, 0x4000);
+    qtest_outl(s, 0xc00b, 0x4000);
+    qtest_outl(s, 0xc00b, 0x4000);
+    qtest_outl(s, 0xc00b, 0x4000);
+    qtest_outl(s, 0xc00b, 0x4000);
+    qtest_outl(s, 0xc00b, 0x4000);
+    qtest_outl(s, 0xc00b, 0x4000);
+    qtest_outl(s, 0xc00b, 0x4000);
+    qtest_outl(s, 0xc00b, 0x4000);
+    qtest_outl(s, 0xc00b, 0x4000);
+    qtest_outl(s, 0xc00b, 0x4000);
+    qtest_outl(s, 0xc00b, 0x4000);
+    qtest_outl(s, 0xc00b, 0x4000);
+    qtest_outl(s, 0xc00b, 0x4000);
+    qtest_outl(s, 0xc00b, 0x4000);
+    qtest_outl(s, 0xc00b, 0x4000);
+    qtest_outl(s, 0xc00b, 0x4000);
+    qtest_outl(s, 0xc00b, 0x4000);
+    qtest_outl(s, 0xc00b, 0x4000);
+    qtest_outl(s, 0xc00b, 0x4000);
+    qtest_outl(s, 0xc00b, 0x4000);
+    qtest_outl(s, 0xc00b, 0x4000);
+    qtest_outl(s, 0xc00b, 0xc200);
+    qtest_outl(s, 0xc00b, 0x00);
+    qtest_outl(s, 0xc00b, 0x00);
+    qtest_outl(s, 0xc00b, 0x00);
+    qtest_outl(s, 0xc00b, 0x00);
+    qtest_outl(s, 0xc00b, 0x00);
+    qtest_outl(s, 0xc00b, 0x00);
+    qtest_outl(s, 0xc00b, 0x00);
+    qtest_outl(s, 0xc00b, 0x00);
+    qtest_outl(s, 0xc00b, 0x00);
+    qtest_outl(s, 0xc00b, 0x00);
+    qtest_outl(s, 0xc00b, 0x00);
+    qtest_outl(s, 0xc00b, 0x00);
+    qtest_outl(s, 0xc00b, 0x00);
+    qtest_outl(s, 0xc00b, 0x00);
+    qtest_outl(s, 0xc00b, 0x00);
+    qtest_outl(s, 0xc00b, 0x00);
+    qtest_outl(s, 0xc00b, 0x00);
+    qtest_outw(s, 0xc00b, 0x00);
+    qtest_quit(s);
+}
+/*
+ * cat << EOF | ./qemu-system-i386 -display none -machine accel=qtest, -m \
+ * 512M -device am53c974,id=scsi -device scsi-hd,drive=disk0 -drive \
+ * id=disk0,if=none,file=null-co://,format=raw -nodefaults -qtest stdio
+ * outl 0xcf8 0x80001010
+ * outl 0xcfc 0xc000
+ * outl 0xcf8 0x80001004
+ * outw 0xcfc 0x01
+ * outl 0xc00b 0x4100
+ * outw 0xc00b 0xc200
+ * outl 0xc03f 0x0300
+ * EOF
+ */
+static void crash_530ff2e211(void)
+{
+    QTestState *s = qtest_init(
+        "-display none -m 512M -device am53c974,id=scsi -device scsi-hd,drive=disk0 "
+        "-drive id=disk0,if=none,file=null-co://,format=raw -nodefaults");
+    qtest_outl(s, 0xcf8, 0x80001010);
+    qtest_outl(s, 0xcfc, 0xc000);
+    qtest_outl(s, 0xcf8, 0x80001004);
+    qtest_outw(s, 0xcfc, 0x01);
+    qtest_outl(s, 0xc00b, 0x4100);
+    qtest_outw(s, 0xc00b, 0xc200);
+    qtest_outl(s, 0xc03f, 0x0300);
+    qtest_quit(s);
+}
+/*
+ * cat << EOF | ./qemu-system-i386 -display none -machine accel=qtest, -m \
+ * 512M -device am53c974,id=scsi -device scsi-hd,drive=disk0 -drive \
+ * id=disk0,if=none,file=null-co://,format=raw -nodefaults -qtest stdio
+ * outl 0xcf8 0x80001010
+ * outl 0xcfc 0xc000
+ * outl 0xcf8 0x80001004
+ * outw 0xcfc 0x01
+ * outl 0xc03f 0x0300
+ * outw 0xc00b 0x4300
+ * outw 0xc000 0x01
+ * outw 0xc009 0x00
+ * outw 0xc00b 0x1000
+ * outl 0xc00d 0x02000000
+ * outw 0xc00c 0xc2
+ * outw 0xc00b 0x4100
+ * outl 0xc00b 0x1000
+ * EOF
+ */
+static void crash_76ab101171(void)
+{
+    QTestState *s = qtest_init(
+        "-display none -m 512M -device am53c974,id=scsi -device scsi-hd,drive=disk0 "
+        "-drive id=disk0,if=none,file=null-co://,format=raw -nodefaults");
+    qtest_outl(s, 0xcf8, 0x80001010);
+    qtest_outl(s, 0xcfc, 0xc000);
+    qtest_outl(s, 0xcf8, 0x80001004);
+    qtest_outw(s, 0xcfc, 0x01);
+    qtest_outl(s, 0xc03f, 0x0300);
+    qtest_outw(s, 0xc00b, 0x4300);
+    qtest_outw(s, 0xc000, 0x01);
+    qtest_outw(s, 0xc009, 0x00);
+    qtest_outw(s, 0xc00b, 0x1000);
+    qtest_outl(s, 0xc00d, 0x02000000);
+    qtest_outw(s, 0xc00c, 0xc2);
+    qtest_outw(s, 0xc00b, 0x4100);
+    qtest_outl(s, 0xc00b, 0x1000);
+    qtest_quit(s);
+}
+/*
+ * cat << EOF | ./qemu-system-i386 -display none -machine accel=qtest, -m \
+ * 512M -device am53c974,id=scsi -device scsi-hd,drive=disk0 -drive \
+ * id=disk0,if=none,file=null-co://,format=raw -nodefaults -qtest stdio
+ * outl 0xcf8 0x80001010
+ * outl 0xcfc 0xc000
+ * outl 0xcf8 0x80001004
+ * outw 0xcfc 0x01
+ * outb 0xc000 0x4
+ * outw 0xc007 0x4000
+ * outl 0xc03f 0x0300
+ * outl 0xc00b 0xc300
+ * outw 0xc00b 0x9000
+ * outl 0xc00b 0xc300
+ * outw 0xc00b 0x9000
+ * outl 0xc00b 0x00
+ * outl 0xc00b 0xc300
+ * outw 0xc00b 0x9000
+ * outw 0xc00b 0x1000
+ * EOF
+ */
+static void crash_7f743a0082(void)
+{
+    QTestState *s = qtest_init(
+        "-display none -m 512M -device am53c974,id=scsi -device scsi-hd,drive=disk0 "
+        "-drive id=disk0,if=none,file=null-co://,format=raw -nodefaults");
+    qtest_outl(s, 0xcf8, 0x80001010);
+    qtest_outl(s, 0xcfc, 0xc000);
+    qtest_outl(s, 0xcf8, 0x80001004);
+    qtest_outw(s, 0xcfc, 0x01);
+    qtest_outb(s, 0xc000, 0x4);
+    qtest_outw(s, 0xc007, 0x4000);
+    qtest_outl(s, 0xc03f, 0x0300);
+    qtest_outl(s, 0xc00b, 0xc300);
+    qtest_outw(s, 0xc00b, 0x9000);
+    qtest_outl(s, 0xc00b, 0xc300);
+    qtest_outw(s, 0xc00b, 0x9000);
+    qtest_outl(s, 0xc00b, 0x00);
+    qtest_outl(s, 0xc00b, 0xc300);
+    qtest_outw(s, 0xc00b, 0x9000);
+    qtest_outw(s, 0xc00b, 0x1000);
+    qtest_quit(s);
+}
+/*
+ * cat << EOF | ./qemu-system-i386 -display none -machine accel=qtest, -m \
+ * 512M -device am53c974,id=scsi -device scsi-hd,drive=disk0 -drive \
+ * id=disk0,if=none,file=null-co://,format=raw -nodefaults -qtest stdio
+ * outl 0xcf8 0x80001010
+ * outl 0xcfc 0xc000
+ * outl 0xcf8 0x80001004
+ * outw 0xcfc 0x01
+ * outb 0xc000 0x4
+ * outl 0xc03f 0x0300
+ * outl 0xc00b 0xc300
+ * outw 0xc00b 0x9000
+ * outl 0xc00b 0x00
+ * outl 0xc00b 0xc300
+ * outw 0xc00b 0x9000
+ * outl 0xc00b 0x00
+ * outl 0xc00b 0xc300
+ * outl 0xc00b 0xc300
+ * outw 0xc00b 0x9000
+ * outw 0xc00b 0x1000
+ * EOF
+ */
+static void crash_87744a2e67(void)
+{
+    QTestState *s = qtest_init(
+        "-display none -m 512M -device am53c974,id=scsi -device scsi-hd,drive=disk0 "
+        "-drive id=disk0,if=none,file=null-co://,format=raw -nodefaults");
+    qtest_outl(s, 0xcf8, 0x80001010);
+    qtest_outl(s, 0xcfc, 0xc000);
+    qtest_outl(s, 0xcf8, 0x80001004);
+    qtest_outw(s, 0xcfc, 0x01);
+    qtest_outb(s, 0xc000, 0x4);
+    qtest_outl(s, 0xc03f, 0x0300);
+    qtest_outl(s, 0xc00b, 0xc300);
+    qtest_outw(s, 0xc00b, 0x9000);
+    qtest_outl(s, 0xc00b, 0x00);
+    qtest_outl(s, 0xc00b, 0xc300);
+    qtest_outw(s, 0xc00b, 0x9000);
+    qtest_outl(s, 0xc00b, 0x00);
+    qtest_outl(s, 0xc00b, 0xc300);
+    qtest_outl(s, 0xc00b, 0xc300);
+    qtest_outw(s, 0xc00b, 0x9000);
+    qtest_outw(s, 0xc00b, 0x1000);
+    qtest_quit(s);
+}
+/*
+ * cat << EOF | ./qemu-system-i386 -display none -machine accel=qtest, -m \
+ * 512M -device am53c974,id=scsi -device scsi-hd,drive=disk0 -drive \
+ * id=disk0,if=none,file=null-co://,format=raw -nodefaults -qtest stdio
+ * outl 0xcf8 0x80001010
+ * outl 0xcfc 0xc000
+ * outl 0xcf8 0x80001004
+ * outw 0xcfc 0x01
+ * outw 0xc00c 0x41
+ * outl 0xc00a 0x00
+ * outw 0xc00c 0x43
+ * outw 0xc00b 0x00
+ * outw 0xc00b 0x00
+ * outw 0xc00c 0x00
+ * outl 0xc00a 0x00
+ * outw 0xc00a 0x00
+ * outl 0xc00a 0x00
+ * outw 0xc00c 0x00
+ * outl 0xc00a 0x00
+ * outw 0xc00a 0x00
+ * outl 0xc00a 0x00
+ * outw 0xc00c 0x00
+ * outl 0xc00a 0x00
+ * outw 0xc00a 0x00
+ * outl 0xc00a 0x00
+ * outw 0xc00c 0x00
+ * outw 0xc00b 0x00
+ * outw 0xc00b 0x00
+ * outw 0xc00c 0x00
+ * outl 0xc00a 0x00
+ * outw 0xc00a 0x00
+ * outl 0xc00a 0x00
+ * outw 0xc00c 0x00
+ * outl 0xc00a 0x00
+ * outl 0xc00a 0x00
+ * outw 0xc00c 0x00
+ * outl 0xc00a 0x00
+ * outw 0xc00c 0x00
+ * outw 0xc00b 0x00
+ * outw 0xc00b 0x00
+ * outw 0xc00c 0x00
+ * outw 0xc00a 0x00
+ * outl 0xc00a 0x100000
+ * outl 0xc00a 0x100000
+ * outl 0xc00a 0x00
+ * outw 0xc00c 0x43
+ * outl 0xc00a 0x100000
+ * outl 0xc00a 0x100000
+ * EOF
+ */
+static void crash_9f92a77bd6(void)
+{
+    QTestState *s = qtest_init(
+        "-display none -m 512M -device am53c974,id=scsi -device scsi-hd,drive=disk0 "
+        "-drive id=disk0,if=none,file=null-co://,format=raw -nodefaults");
+    qtest_outl(s, 0xcf8, 0x80001010);
+    qtest_outl(s, 0xcfc, 0xc000);
+    qtest_outl(s, 0xcf8, 0x80001004);
+    qtest_outw(s, 0xcfc, 0x01);
+    qtest_outw(s, 0xc00c, 0x41);
+    qtest_outl(s, 0xc00a, 0x00);
+    qtest_outw(s, 0xc00c, 0x43);
+    qtest_outw(s, 0xc00b, 0x00);
+    qtest_outw(s, 0xc00b, 0x00);
+    qtest_outw(s, 0xc00c, 0x00);
+    qtest_outl(s, 0xc00a, 0x00);
+    qtest_outw(s, 0xc00a, 0x00);
+    qtest_outl(s, 0xc00a, 0x00);
+    qtest_outw(s, 0xc00c, 0x00);
+    qtest_outl(s, 0xc00a, 0x00);
+    qtest_outw(s, 0xc00a, 0x00);
+    qtest_outl(s, 0xc00a, 0x00);
+    qtest_outw(s, 0xc00c, 0x00);
+    qtest_outl(s, 0xc00a, 0x00);
+    qtest_outw(s, 0xc00a, 0x00);
+    qtest_outl(s, 0xc00a, 0x00);
+    qtest_outw(s, 0xc00c, 0x00);
+    qtest_outw(s, 0xc00b, 0x00);
+    qtest_outw(s, 0xc00b, 0x00);
+    qtest_outw(s, 0xc00c, 0x00);
+    qtest_outl(s, 0xc00a, 0x00);
+    qtest_outw(s, 0xc00a, 0x00);
+    qtest_outl(s, 0xc00a, 0x00);
+    qtest_outw(s, 0xc00c, 0x00);
+    qtest_outl(s, 0xc00a, 0x00);
+    qtest_outl(s, 0xc00a, 0x00);
+    qtest_outw(s, 0xc00c, 0x00);
+    qtest_outl(s, 0xc00a, 0x00);
+    qtest_outw(s, 0xc00c, 0x00);
+    qtest_outw(s, 0xc00b, 0x00);
+    qtest_outw(s, 0xc00b, 0x00);
+    qtest_outw(s, 0xc00c, 0x00);
+    qtest_outw(s, 0xc00a, 0x00);
+    qtest_outl(s, 0xc00a, 0x100000);
+    qtest_outl(s, 0xc00a, 0x100000);
+    qtest_outl(s, 0xc00a, 0x00);
+    qtest_outw(s, 0xc00c, 0x43);
+    qtest_outl(s, 0xc00a, 0x100000);
+    qtest_outl(s, 0xc00a, 0x100000);
+    qtest_quit(s);
+}
+/*
+ * cat << EOF | ./qemu-system-i386 -display none -machine accel=qtest, -m \
+ * 512M -device am53c974,id=scsi -device scsi-hd,drive=disk0 -drive \
+ * id=disk0,if=none,file=null-co://,format=raw -nodefaults -qtest stdio
+ * outl 0xcf8 0x80001010
+ * outl 0xcfc 0xc000
+ * outl 0xcf8 0x80001004
+ * outw 0xcfc 0x01
+ * outb 0xc008 0xa
+ * outw 0xc00b 0x4100
+ * outw 0xc00b 0x4100
+ * outw 0xc00b 0x1000
+ * outl 0xc00b 0x0800
+ * outl 0xc00b 0x0400
+ * outl 0xc00b 0x0400
+ * outl 0xc00b 0x0400
+ * outl 0xc00b 0x0400
+ * outl 0xc00b 0x0400
+ * outl 0xc00b 0x0400
+ * outl 0xc00b 0x0800
+ * outl 0xc00b 0x0400
+ * outl 0xc00b 0x0400
+ * outl 0xc00b 0x0400
+ * outl 0xc00b 0x0800
+ * outl 0xc00b 0x0400
+ * outl 0xc00b 0x0400
+ * outl 0xc00b 0x0400
+ * outl 0xc00b 0x4200
+ * EOF
+ */
+static void crash_d94dc29565(void)
+{
+    QTestState *s = qtest_init(
+        "-display none -m 512M -device am53c974,id=scsi -device scsi-hd,drive=disk0 "
+        "-drive id=disk0,if=none,file=null-co://,format=raw -nodefaults");
+    qtest_outl(s, 0xcf8, 0x80001010);
+    qtest_outl(s, 0xcfc, 0xc000);
+    qtest_outl(s, 0xcf8, 0x80001004);
+    qtest_outw(s, 0xcfc, 0x01);
+    qtest_outb(s, 0xc008, 0xa);
+    qtest_outw(s, 0xc00b, 0x4100);
+    qtest_outw(s, 0xc00b, 0x4100);
+    qtest_outw(s, 0xc00b, 0x1000);
+    qtest_outl(s, 0xc00b, 0x0800);
+    qtest_outl(s, 0xc00b, 0x0400);
+    qtest_outl(s, 0xc00b, 0x0400);
+    qtest_outl(s, 0xc00b, 0x0400);
+    qtest_outl(s, 0xc00b, 0x0400);
+    qtest_outl(s, 0xc00b, 0x0400);
+    qtest_outl(s, 0xc00b, 0x0400);
+    qtest_outl(s, 0xc00b, 0x0800);
+    qtest_outl(s, 0xc00b, 0x0400);
+    qtest_outl(s, 0xc00b, 0x0400);
+    qtest_outl(s, 0xc00b, 0x0400);
+    qtest_outl(s, 0xc00b, 0x0800);
+    qtest_outl(s, 0xc00b, 0x0400);
+    qtest_outl(s, 0xc00b, 0x0400);
+    qtest_outl(s, 0xc00b, 0x0400);
+    qtest_outl(s, 0xc00b, 0x4200);
+    qtest_quit(s);
+}
+/*
+ * cat << EOF | ./qemu-system-i386 -display none -machine accel=qtest, -m \
+ * 512M -device am53c974,id=scsi -device scsi-hd,drive=disk0 -drive \
+ * id=disk0,if=none,file=null-co://,format=raw -nodefaults -qtest stdio
+ * outl 0xcf8 0x80001010
+ * outl 0xcfc 0xc000
+ * outl 0xcf8 0x80001004
+ * outw 0xcfc 0x01
+ * outw 0xc00b 0x4100
+ * outl 0xc00b 0x0300
+ * inl 0xc00b
+ * outl 0xc00b 0x0800
+ * outl 0xc00b 0x0800
+ * outl 0xc00b 0x0800
+ * outl 0xc00b 0x0800
+ * outl 0xc00b 0x0800
+ * outl 0xc00b 0x0800
+ * outl 0xc00b 0x0800
+ * outl 0xc00b 0x0800
+ * outl 0xc00b 0x0800
+ * outl 0xc00b 0x0800
+ * outl 0xc00b 0x0800
+ * outl 0xc00b 0x0800
+ * outl 0xc00b 0x0800
+ * outl 0xc00b 0x0800
+ * outl 0xc00b 0x00
+ * outl 0xc00a 0x410000
+ * EOF
+ */
+static void crash_df5a21ccf3(void)
+{
+    QTestState *s = qtest_init(
+        "-display none -m 512M -device am53c974,id=scsi -device scsi-hd,drive=disk0 "
+        "-drive id=disk0,if=none,file=null-co://,format=raw -nodefaults");
+    qtest_outl(s, 0xcf8, 0x80001010);
+    qtest_outl(s, 0xcfc, 0xc000);
+    qtest_outl(s, 0xcf8, 0x80001004);
+    qtest_outw(s, 0xcfc, 0x01);
+    qtest_outw(s, 0xc00b, 0x4100);
+    qtest_outl(s, 0xc00b, 0x0300);
+    qtest_inl(s, 0xc00b);
+    qtest_outl(s, 0xc00b, 0x0800);
+    qtest_outl(s, 0xc00b, 0x0800);
+    qtest_outl(s, 0xc00b, 0x0800);
+    qtest_outl(s, 0xc00b, 0x0800);
+    qtest_outl(s, 0xc00b, 0x0800);
+    qtest_outl(s, 0xc00b, 0x0800);
+    qtest_outl(s, 0xc00b, 0x0800);
+    qtest_outl(s, 0xc00b, 0x0800);
+    qtest_outl(s, 0xc00b, 0x0800);
+    qtest_outl(s, 0xc00b, 0x0800);
+    qtest_outl(s, 0xc00b, 0x0800);
+    qtest_outl(s, 0xc00b, 0x0800);
+    qtest_outl(s, 0xc00b, 0x0800);
+    qtest_outl(s, 0xc00b, 0x0800);
+    qtest_outl(s, 0xc00b, 0x00);
+    qtest_outl(s, 0xc00a, 0x410000);
+    qtest_quit(s);
+}
 
 static void test_cmdfifo_underflow_ok(void)
 {
@@ -106,6 +1225,24 @@ int main(int argc, char **argv)
     g_test_init(&argc, &argv, NULL);
 
     if (strcmp(arch, "i386") == 0) {
+        qtest_add_func("fuzz/crash_0900379669", crash_0900379669);
+        qtest_add_func("fuzz/crash_094661a91b", crash_094661a91b);
+        qtest_add_func("fuzz/crash_0fff2155cb", crash_0fff2155cb);
+        qtest_add_func("fuzz/crash_1548bd10e7", crash_1548bd10e7);
+        qtest_add_func("fuzz/crash_1afe349482", crash_1afe349482);
+        qtest_add_func("fuzz/crash_1b42581317", crash_1b42581317);
+        qtest_add_func("fuzz/crash_30e28cfa86", crash_30e28cfa86);
+        qtest_add_func("fuzz/crash_34093bfc7c", crash_34093bfc7c);
+        qtest_add_func("fuzz/crash_3a05434a1f", crash_3a05434a1f);
+        qtest_add_func("fuzz/crash_3ab5744bc3", crash_3ab5744bc3);
+        qtest_add_func("fuzz/crash_530ff2e211", crash_530ff2e211);
+        qtest_add_func("fuzz/crash_76ab101171", crash_76ab101171);
+        qtest_add_func("fuzz/crash_7f743a0082", crash_7f743a0082);
+        qtest_add_func("fuzz/crash_87744a2e67", crash_87744a2e67);
+        qtest_add_func("fuzz/crash_9f92a77bd6", crash_9f92a77bd6);
+        qtest_add_func("fuzz/crash_d94dc29565", crash_d94dc29565);
+        qtest_add_func("fuzz/crash_dd24c44f80", crash_dd24c44f80);
+        qtest_add_func("fuzz/crash_df5a21ccf3", crash_df5a21ccf3);
         qtest_add_func("am53c974/test_cmdfifo_underflow_ok",
                        test_cmdfifo_underflow_ok);
         qtest_add_func("am53c974/test_cmdfifo_overflow_ok",
-- 
2.28.0


