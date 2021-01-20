Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E902FD78A
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 18:54:31 +0100 (CET)
Received: from localhost ([::1]:60812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2Hgc-0001PW-Ne
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 12:54:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1l2HPq-0000VT-0T
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 12:37:10 -0500
Received: from mail-co1nam11on2129.outbound.protection.outlook.com
 ([40.107.220.129]:63396 helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1l2HPn-0002uY-UV
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 12:37:09 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HK0qqO9RBQ0UIf8kKlo5Y5Vn1He/hJIk2FYVMeCH3VGj+US14XgObcl9ID+Kf4934YiaffYkWxkT8eJxAyiGynUvx5UoPcQDlFnIFy5aE4ZJk8yHCnBeZmb44ah+KCbfutEWiErs1tOH9zbVUajpZUA/00nDNutr7P25drddVb8MOtycXnJXoz0iXF0UhMg6bTUr7gcgb+nsVJVzAzCp9TBOoxKQ2ePGgSLZaCt5ugSTjPLZCzF3Qk9L1pFsezg21Y9TaS+TjHtkLV2wuVXEYhjbPYe57KfV2oGswkEOZvBdSQaTc7NGr1J932TWvNnYTLXC3TyV1arhX3f2EtBuvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2botMHaFZMn7OmxLXHemaJjm8WPekbjj+/FINhhibbc=;
 b=kD0YU+COF9mdPhCzAHjM5KpE8IPQeOg+GO5rXKHUW4/v8/xfeoHWVhjiIaa6USokSUTdO49iWu+S8AbaMAb3ERzx3UeI2ZuVAB9r7+meOiupaeLBYpNzYfOAtKckwBxjHUZt9GIkB4IJWmt6w1y81q6u7VuEVIHgjMohcO1vzASZ4LYNte72RIx5rPstl+DADmou1njKVYgfFt/ld/1QGipq8WIqF9ytqLn0G04oLKOfv0ucPXVvrqVSvSUPAywDbKmC0PB7eMbAJ7dhhrESFVbBzbTojoX9YBBtfXUBSjN+ApLyH2RXA0LDWRaKUfX8+L6xhvQVqSgIxGzrBGubmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2botMHaFZMn7OmxLXHemaJjm8WPekbjj+/FINhhibbc=;
 b=ufrCH8nnkE5iO0tAvTApDlFcfSbiRwSLygon5//h7onu/ZrHqREO7vcbRekIAacrBxDTWlgKBExeheA2i9UMVpFRei2/qkfz7S80TDZQ6OBrrR4KobwolNAxklK2kg/D/C7aEETw5Nt0SYRCcmfJAJthUcfS9bTPd05/53Dptb0=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SN6PR03MB4576.namprd03.prod.outlook.com (2603:10b6:805:102::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11; Wed, 20 Jan
 2021 17:37:02 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::e828:cd84:e00c:6310]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::e828:cd84:e00c:6310%6]) with mapi id 15.20.3784.012; Wed, 20 Jan 2021
 17:37:02 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PULL 7/7] fuzz: refine the ide/ahci fuzzer configs
Date: Wed, 20 Jan 2021 12:35:36 -0500
Message-Id: <20210120173536.265601-15-alxndr@bu.edu>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210120173536.265601-1-alxndr@bu.edu>
References: <20210120173536.265601-1-alxndr@bu.edu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [72.74.210.193]
X-ClientProxiedBy: BL1PR13CA0142.namprd13.prod.outlook.com
 (2603:10b6:208:2bb::27) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from stormtrooper.vrmnet (72.74.210.193) by
 BL1PR13CA0142.namprd13.prod.outlook.com (2603:10b6:208:2bb::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.8 via Frontend
 Transport; Wed, 20 Jan 2021 17:37:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 37a83de7-22b4-46eb-f9d4-08d8bd69fea8
X-MS-TrafficTypeDiagnostic: SN6PR03MB4576:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR03MB45760970A995C3D796B0C388BAA29@SN6PR03MB4576.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VfG8en1haECXO82xeanAIKOiGJr1K7dM36MoGsFz39FNZxkYOOIogxL8IcxshBqUwOqbQcgRXQafqzGXzj74LLtsSsEiu+/XDW0Vd+HfEJM2e3B4XUci7PNn4YdIVLSd2iKd/zZRhjJnb7oD9rhmGQiifwOR1j333TwRBqDNxy3xGIkr2jeMkrPT2mHBRsL9dEY4UyCQVq2/uRiP9zkqapYuzrUSLZcaCTIGGSDU6ZOcaOVZQv9YcVkRCNXLDAhOj7uM47br2N7u4B2zqF0lqitG38+Bdr4bq2srg4t0Rhphf+TlUw9Rp4aHhbtF95ohKcdvi/FKXeBiRe2l9cFVPUZKtA0z1KsLmAqf/xGQJbt1VW35ihPhWQZ7vhdjvSVvaifLcocuIBv15uk4EXm8Sg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(39860400002)(136003)(376002)(346002)(83380400001)(6486002)(26005)(2616005)(8676002)(52116002)(4326008)(6506007)(6512007)(86362001)(54906003)(5660300002)(2906002)(66556008)(66946007)(66476007)(75432002)(956004)(36756003)(6916009)(316002)(786003)(186003)(8936002)(478600001)(1076003)(6666004)(16526019);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?d5T02oDy0+yp+S+Dx9VUVFIwXRUR70xErfQDhQ3jHcgyZQyiXCKWaDc3/R0V?=
 =?us-ascii?Q?AMWE4tpbz56KwB0e6SQX21cwGQO7Lacy7CD/efjbZzVyRRkIkuarWiFLvbl8?=
 =?us-ascii?Q?OUV1IxbCNr9AIBzhFLpH888Ix+cbNayq7kZEuGTyAWfjBnYwRImxxX6C+P2p?=
 =?us-ascii?Q?BmNIEijmUyux4ARPx2coVSXSKtplp5bsYbILye9VOqiU9BAumtQXBBwh7GdE?=
 =?us-ascii?Q?cg26XcCivgt2MNkDWnhuziCtDw8CSqEV9lmxo51VS48OtrEe8mw8X0SKfIZD?=
 =?us-ascii?Q?JbsNKtmwdzBmLTkTZ0dpwO5ianqlQ5nBVnWz30s4QgDMF1qIK9LtDpoP30SS?=
 =?us-ascii?Q?BAOgZv5rZjFeVfoZcu5jsaX+Id5Pf+fCzoJxqO0PUwgbNyW1sv7MfcmkF+0L?=
 =?us-ascii?Q?pofLvthPCn17le0jx58L2pwLKBl461MSvQFeB/bPuhO+V17Ej7BI+mQ7P4Ps?=
 =?us-ascii?Q?qIiS2W+SAgZh+ltsJoBbrgxsShVu+C4JkzCILivZirqIaGuf2Akm1TDguwoX?=
 =?us-ascii?Q?M1/Y4urn+UwW4pjIFvwNQkatE6JPMCo8xbWHoRY58DDDMy5S0xnhyotYOu0R?=
 =?us-ascii?Q?CX6et/wEIMLRsFklgZyHRMrI/miKEfneJRX/pcVJuTFx+GA0Tln+/dhc8/Mm?=
 =?us-ascii?Q?WjqAsMOjfSeHsdMeAEBXB+r2UxXJ2D/duyTfpXnr3i6Z9CY4FtklBy97eha8?=
 =?us-ascii?Q?m+5A03cgWo6E+R0zEXlsFHUcntCUV7+QccXEtPqm2lYwjN4ZdngxqXzCDCbp?=
 =?us-ascii?Q?XJdvyCdT/oEz/SDaPEnflMrxOcOft8yk4uK4Ji2Rt9pUM7Po0ackmA0GYzp3?=
 =?us-ascii?Q?h5lGtK93I1M0iMQZVJiMkiZFydV0//SYjfDOGPionIx6bFXuBpRaEDN7eLOm?=
 =?us-ascii?Q?3lOaatmSUF9RLIu1IlIr+k9ryhZbjeiqg5m7UO4Da6JdjU8fastP6mqBPlPq?=
 =?us-ascii?Q?heyxg5IE9hboWSO2kRv2zG27Rl7tMpZ4ynXQeJ5WfMcYHEwp6P0EmXF/iFJX?=
 =?us-ascii?Q?Dsek?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 37a83de7-22b4-46eb-f9d4-08d8bd69fea8
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2021 17:37:02.2423 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K1Chh87kk0C5D/6tH3QkhIvjfzq0ek0NftvGc2oTswJ6fk4rCs86p0xifpmJKPBf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB4576
Received-SPF: pass client-ip=40.107.220.129; envelope-from=alxndr@bu.edu;
 helo=NAM11-CO1-obe.outbound.protection.outlook.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.998,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Disks work differently depending on the x86 machine type (SATA vs PATA).
Additionally, we should fuzz the atapi code paths, which might contain
vulnerabilities such as CVE-2020-29443. This patch adds hard-disk and
cdrom generic-fuzzer configs for both the pc (PATA) and q35 (SATA)
machine types.

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
Acked-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/fuzz/generic_fuzz_configs.h | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/fuzz/generic_fuzz_configs.h b/tests/qtest/fuzz/generic_fuzz_configs.h
index f99657cdbc..5d599765c4 100644
--- a/tests/qtest/fuzz/generic_fuzz_configs.h
+++ b/tests/qtest/fuzz/generic_fuzz_configs.h
@@ -106,10 +106,28 @@ const generic_fuzz_config predefined_configs[] = {
         .objects = "intel-hda",
     },{
         .name = "ide-hd",
+        .args = "-machine pc -nodefaults "
+        "-drive file=null-co://,if=none,format=raw,id=disk0 "
+        "-device ide-hd,drive=disk0",
+        .objects = "*ide*",
+    },{
+        .name = "ide-atapi",
+        .args = "-machine pc -nodefaults "
+        "-drive file=null-co://,if=none,format=raw,id=disk0 "
+        "-device ide-cd,drive=disk0",
+        .objects = "*ide*",
+    },{
+        .name = "ahci-hd",
         .args = "-machine q35 -nodefaults "
         "-drive file=null-co://,if=none,format=raw,id=disk0 "
         "-device ide-hd,drive=disk0",
-        .objects = "ahci*",
+        .objects = "*ahci*",
+    },{
+        .name = "ahci-atapi",
+        .args = "-machine q35 -nodefaults "
+        "-drive file=null-co://,if=none,format=raw,id=disk0 "
+        "-device ide-cd,drive=disk0",
+        .objects = "*ahci*",
     },{
         .name = "floppy",
         .args = "-machine pc -nodefaults -device floppy,id=floppy0 "
-- 
2.28.0


