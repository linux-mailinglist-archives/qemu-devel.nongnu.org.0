Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8BE7320B9E
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 17:03:16 +0100 (CET)
Received: from localhost ([::1]:43704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDrCV-0003Mt-6s
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 11:03:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lDrAU-0002VY-Ln
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 11:01:10 -0500
Received: from mail-bn7nam10on2132.outbound.protection.outlook.com
 ([40.107.92.132]:35425 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lDrAL-0006Ed-HX
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 11:01:06 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GzOpBCZB5OvuqQoROlzQXI5jsF5iF/Dthh3L+M4ulxbaU1K9EiCDr2jDPVz1awadPkiHmyiEPnCh3yhaFtFWdAgWpbEwbxWo1yCK99TeoJudI3TZyoXSCPX/HPrgaim+mRKp0al+ktfMeoM79dYBEo+Ue8MPjoHJoW6mIEqsahPP5uUHhPHd9rhw0IxKFoxyBKa/0WFGSHNrwqHo0W5vOd7RTivLR5PEAzR/5DcEVBGwRoFDt49I/HkQPOLWpRE2sWNEPmmurQfbgtv/QMI/9cN+7jB5OMD2WM6f/UmYxim2MvJvkINZDN3n7LsznKoC1WJZXm9kLFeBQ6NrZNhYPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X6x0xxhw8paNaznh1hB7iiNRSED4PDKwgt5eY6LHXs8=;
 b=IRBcysK6iL0MUUNgQeS9VbhJlA7Jsiwx8fYbmYLSDA5GmopdZab8ATj70VBTwhKJs51jlhYkn0QXjTExNDDhxw94ArRX50oBB0FwjoJa41uO1ljba3zjKijOFbXfwtklJWu4jrXBjttNXCw8xkz4TI2kt8bAohzHJ30Au78TCIHluRbMp6CHJCTXugpl6F3x9jMbk3r3z4pEShu+EQAHCnME3u7KkEkxaRspeWVp/V5XxnZ8d78F3BRIR7Ei2m7I26NlFNCG7CD5ui7m6PGCf+WW4sBfFY8FzvGXxhuuNT5pzR96Ex+8SU4/1UOgsBo453GMyqPPJMMtGUthzZCZ/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X6x0xxhw8paNaznh1hB7iiNRSED4PDKwgt5eY6LHXs8=;
 b=5i8iuDHKgFTuWG+NCB9rA2wKNtzkzytBOjM2A1J8WiJbMtqzOYmBiTvqYvqJaCy/J0HYnhTeMxNYYscEPMqoEIlt2Cerkzx3znTvSO3ZV+Qkad2cdqf3S/Kz69SPAqaimXd2JakxadLXHLvqMt6o6IVmsrF0uYv+GMDrFb/hG94=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SN6PR03MB4175.namprd03.prod.outlook.com (2603:10b6:805:ba::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.31; Sun, 21 Feb
 2021 16:00:57 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::1ed:b27e:19a1:5bfc]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::1ed:b27e:19a1:5bfc%4]) with mapi id 15.20.3868.031; Sun, 21 Feb 2021
 16:00:57 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PATCH] configure: fix --enable-fuzzing linker failures
Date: Sun, 21 Feb 2021 11:00:44 -0500
Message-Id: <20210221160044.28581-1-alxndr@bu.edu>
X-Mailer: git-send-email 2.27.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [128.197.127.33]
X-ClientProxiedBy: BL1PR13CA0359.namprd13.prod.outlook.com
 (2603:10b6:208:2c6::34) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mozz.bu.edu (128.197.127.33) by
 BL1PR13CA0359.namprd13.prod.outlook.com (2603:10b6:208:2c6::34) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.9 via Frontend
 Transport; Sun, 21 Feb 2021 16:00:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0deead56-ad03-4ac8-bb76-08d8d681e023
X-MS-TrafficTypeDiagnostic: SN6PR03MB4175:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR03MB417577916B50AD4D128D5EA6BA829@SN6PR03MB4175.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: W8L8aWMloiwXyNWr34oL9c3LdbOVxwHYywSv0Te6OxPFcURo5sRWZAZSLKxK8BXI9/mEdhrCI5JoCAaW5KgzgYIzIWDozcMuDe2AwlvlaWnVEXo8oP4SH4DwPyMSDoVMAMNt4z8UX37UY7PpzjWZ5u/CLvB9nJnr/1IlPg/z3W2w9UOWcDHnSqD0IpSfzcYtJgUtQj4OjUzdH1iyu7WPrGWiJpzJLGC8ewfyCd/A+vfUYQAysfaoBbY4IoHIZOFuvkJ4WbhwwcexDtgZSwdIKSgNortjb+Kw6eqBiQHFrX6JsveuJEAdMdiQXbIfmiWYpMAwSmyIGbR9GZt6d0jrILbLFFIWREjBovxzq0es6p5LEN/VAJNKdCbogEAPD4N1v+X8tkKQH1KIe/j0GTq0qJkKD/mnQBguvgD3IwpPV4CdvX26O3LdTcElRX0Wb8keV/bkC82oqjp5pMhM4M04oCzWl1DUm0GwxyLcyXpAzlFMDbZVmrBlZaH0eiKev11tR/0RJp2yOobIdd1O9ecDEJ1kRhCtDZ/gNFIGksV8wUMFnWe0Rdlo+nc446K4rpj4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(136003)(346002)(39860400002)(396003)(86362001)(956004)(5660300002)(8676002)(4326008)(1076003)(66476007)(66556008)(6916009)(7696005)(75432002)(54906003)(786003)(316002)(52116002)(36756003)(66946007)(6666004)(8936002)(4744005)(2616005)(26005)(16526019)(6486002)(2906002)(186003)(478600001)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?NK1s1ofTLEC/sq1dTDx7WA0t2LI8vPMLwmNh6R+fdbKfKTxFYp38i6oVzMC0?=
 =?us-ascii?Q?h+LC9FIyETmgYGqx2qJ5tbloYRN1xnHlNMFAZB6Hyc2/IESs+5oAI9skGP7e?=
 =?us-ascii?Q?HQstviQ2XxB0zYhYnqkyRo/xjggZlYGQAu/GKGOd4+HC48O0M57dLX+ssq0V?=
 =?us-ascii?Q?41n7dlzyFH+6Dqxuy1Q1Gxhv3DjCLvVdELQ8DNu/b3S/h0XFp/Qf5J3Rp0/o?=
 =?us-ascii?Q?+qNUGTpu3dbpRQ2O+JFul5CTWiNTlj7MmyFM4KUgdt2f+uiURQ0w3QDWFNfB?=
 =?us-ascii?Q?qXd+tiIN1um3W6XSQfdrLlp+pZTCLEz2r2k944SgQCWaEwBqN7ivjThcVcgs?=
 =?us-ascii?Q?B1ygrMPvGUcrEuHakFFe3WxKtezRBctWz4HoD+bq2edY7aMS1QRUPCWTBY4u?=
 =?us-ascii?Q?vmQenZv7XiVB2c3taWVdb/2+0tMqBkmY1eNqdmo8Yzsy019QdckbiFv9W4Yk?=
 =?us-ascii?Q?Uj/ZCtI5NdZ8x2oI671PhD0S/k2OpQZjSaPT2hrc5NuGyN1+7+4xl70dnoan?=
 =?us-ascii?Q?hn0lE27o8jG0JGm/tXefV2rUWmcPCCucMS+3AhOx9tbWzSaow5h9NKxqSd+I?=
 =?us-ascii?Q?egTWisMSvEfVOlnGj/rnCvCTXQpvxra2QuNRCneBpTn908m2k8TRmYUYdzH3?=
 =?us-ascii?Q?9jh2JpfK5dJeNc5LAv+JNekMsYsHmWUA3fsKmq6Q1Rm/UrrHaYSSpBSUcJkJ?=
 =?us-ascii?Q?Zr2hkVmhta+qRzZ20Zv3ta/+pH1+UMrNp4KjAhdDk7qOdWTBzt5kFiqD8g0Y?=
 =?us-ascii?Q?+HEsEV+QKIfwr3VRzxdxQO+82JEbhJes9huWdAxlSyzVlRpG+SH+F+/+0mhA?=
 =?us-ascii?Q?zK/w5QF6wzYMU0ZNRy+hmmy0QaYhemlX7JeCdXkRSBRg2tK9T9R2ElyEgJKD?=
 =?us-ascii?Q?fLXVR3GOgGNSSl6FqWSWfEN7GbpA1tY1EDe4vz+i8F3krdTFJ1CfXYirAJiu?=
 =?us-ascii?Q?05s2hiEfvIwkTkb8hfaJvLk9JL3jdrzPb4gxhE1+9kEKEUSn8/Ch2mO9SrhW?=
 =?us-ascii?Q?MxxRTKLgLaWPi6lGhQfeKxQmeLHMVmuR8viAMArAWTanhelfn0d9k22dVka8?=
 =?us-ascii?Q?9sVLAoJM6aYUquMetu4HD5ox8bmUeaH6/IjXahfQgpD9FAXPImW0BE7xSyDv?=
 =?us-ascii?Q?HngwuLEs8o3GvomCmZ3HFbUN21vm8RyEpqMBjDSkH2JKD4nkw9m8NaWzmHPa?=
 =?us-ascii?Q?qiVrFwQXycJXy9VB32bZxY29ekcq0yrcLiXjCv+Oh0YgGW4uLvGIkL8XurwW?=
 =?us-ascii?Q?wig8mx8/8GhS/6bIVZCEkbZkevvMCO7dBsOpu0sN7P19P9YY6idPG9p+hgIe?=
 =?us-ascii?Q?2jLTyY6Jq40gOvBCHApNiuUg?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 0deead56-ad03-4ac8-bb76-08d8d681e023
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2021 16:00:57.4917 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RoV0eT1+/1asKYJGPDKa3qssOCvRmjCoIWbCL6ySczAM2ErhH/cFR82fHsxVxklh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB4175
Received-SPF: pass client-ip=40.107.92.132; envelope-from=alxndr@bu.edu;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
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
Cc: pbonzini@redhat.com, thuth@redhat.com, Li Qiang <liq3ea@163.com>,
 f4bug@amsat.org, Alexander Bulekov <alxndr@bu.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

With --enable-fuzzing, QEMU_CFLAGS include -fsanitize=fuzzer-no-link.
This should allow us to build non-fuzzer binaries using objects
instrumented for fuzzing. However, to do that, we also need to link with
-fsanitize=fuzzer-no-link. We were not doing that.

Reported-by: Li Qiang <liq3ea@163.com>
Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
---
 configure | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configure b/configure
index a79b3746d4..02aaea31c8 100755
--- a/configure
+++ b/configure
@@ -6097,6 +6097,7 @@ if test "$fuzzing" = "yes" ; then
   # needed CFLAGS have already been provided
   if test -z "${LIB_FUZZING_ENGINE+xxx}" ; then
     QEMU_CFLAGS="$QEMU_CFLAGS -fsanitize=fuzzer-no-link"
+    QEMU_LDFLAGS="$QEMU_CFLAGS -fsanitize=fuzzer-no-link"
     FUZZ_EXE_LDFLAGS="-fsanitize=fuzzer"
   else
     FUZZ_EXE_LDFLAGS="$LIB_FUZZING_ENGINE"
-- 
2.27.0


