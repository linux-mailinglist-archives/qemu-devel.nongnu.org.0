Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D5082FD784
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 18:52:58 +0100 (CET)
Received: from localhost ([::1]:55110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2Hf5-0007So-MX
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 12:52:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1l2HXn-0001UK-HV
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 12:45:26 -0500
Received: from mail-bn8nam12on2129.outbound.protection.outlook.com
 ([40.107.237.129]:51169 helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1l2HXk-0003o3-5Z
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 12:45:22 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MWcflrH40+gRexaDuUL22YZExdNBo4X92NlMKQhcUj9tQrKxJNzdZ7dkuJ8lQKIp6zqaLkDrhK2anOY4eCir6DxT14dJHG1mQ9iwf+Tnp/qI9USksDRQ+vFLZXz+FpLKwP5MqmTju/6GAO05OvpoSZA2/pMHhBLvqdB8aJDpDd2w73BpjrEhqA6Rb0pdw7gYJyZSVt1wj6g9mSdgeY3KJoLPhlgjbUfuyvpkokg2uzdVrDaJgUXE9TpfwMELLjPnpsTwrmdKCUtICJtjRtXcOPjd103MLhMQp8BNdE8owofjHf0SkF475ydWquwzhAtim28F25rr1C4Dy/SBI7Lkww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=odkLeuyb4jU44XNZPCmqJU85iReGUgnlk/lWg/omeCM=;
 b=l9kwkBWr1p8lhqWinc4FK0WVcZ27pAMDmimyYaNVlaONofqT4CF7jRCLDq0ZfuuddIudmQ/4st4hYV4uGQsmejUC+k+YORIfofzMrcBkXVHgvg8ajmzzdmQhglZiZfTm3ppvi5AZwYYJ2cH1nGGr/n86pnyLbIQtnU5fGy/5kmPfOFzP7iFyx5ijaVkpqFJZIcFnRDXKQJXoa9dYYd5tEY/pHBOcMMHfNy1E4OKDea15X+BT5bkwvtk4X1cCnOvN/xCd1pNgLgMoiW0v1qwI5BxiWhubc0PEf5hHQgmgOurmZS2MYLMa9KBCpMuGSCilu6U4vJ8JSmXSEqejzIFuVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=odkLeuyb4jU44XNZPCmqJU85iReGUgnlk/lWg/omeCM=;
 b=Te7TTPAtXCqwMVfa0Za7OHIbQ4wEm9y7ai+6GidbICnh2mqwWOW7R2z0YWPK0twdF9QsM/v1de1ZLIDOz8iP+efhGl9ixyjGNDgH0fNzy/qEJCOMszMO5EQlviyd+2d+PdcbjMeqAbAIK6FC1riKfaBK8agqGSysT1zppUihH5E=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SA2PR03MB5835.namprd03.prod.outlook.com (2603:10b6:806:113::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12; Wed, 20 Jan
 2021 17:45:10 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::e828:cd84:e00c:6310]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::e828:cd84:e00c:6310%6]) with mapi id 15.20.3784.012; Wed, 20 Jan 2021
 17:45:10 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PULL 2/7] fuzz: refine the ide/ahci fuzzer configs
Date: Wed, 20 Jan 2021 12:44:51 -0500
Message-Id: <20210120174456.275312-3-alxndr@bu.edu>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210120174456.275312-1-alxndr@bu.edu>
References: <20210120174456.275312-1-alxndr@bu.edu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [72.74.210.193]
X-ClientProxiedBy: BL0PR05CA0005.namprd05.prod.outlook.com
 (2603:10b6:208:91::15) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from stormtrooper.vrmnet (72.74.210.193) by
 BL0PR05CA0005.namprd05.prod.outlook.com (2603:10b6:208:91::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3805.5 via Frontend Transport; Wed, 20 Jan 2021 17:45:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f985081e-ea9c-4d0c-0231-08d8bd6b221d
X-MS-TrafficTypeDiagnostic: SA2PR03MB5835:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA2PR03MB58357C1C06C02F8C74600C40BAA29@SA2PR03MB5835.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XbDGOkwg9sRh8xmHEIMXa74glDES7gJ5buqR3dvre97ydJbNa9kWWBq7VUtnkqJHmyWRQw0qpbMV6r0Ryu+3V5P9HeOCGJuFxy79Q8mSgZewuMwCkkDvTzKhSxsEtVxx323o7qf3OmdvvhinYJbgxiDV20e3FsY3vphD3OD/AeyFFZTCFU2OOcg1Ylha9PxF7YICfENxZHkfYpmatffjNVbGMw5q05NxYdBq2seq30wmh3uTUbF31xpMHtIez0DRgY9Vm5FVd9r3WHXtK48cbFSSjadFcaKD4gXgBd/JMKDYeWyvNEmNLzJo3fvkZ+s2OuE6H5S8QMI0TOH3zqbuWGpRlyIxwbYKaiOj8BnnOAkx/TKGRUNfmGUqoO+CI2pfD1XrTTOEIHRyD7UdhgTmNSlCPVoFmAWaQHsDArdJHyCkF6XiHbjauU5QjkrsLYH1nYyMj64tQfXoHilY83VEITXK8nCeS+DUco0tOGdXET1GK/U2BAL3Mt/1TAAa2kmvZQsKJG8n2lve7Vg/gWOyCA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(376002)(346002)(396003)(39860400002)(8676002)(52116002)(4326008)(2616005)(6512007)(6666004)(956004)(54906003)(75432002)(83380400001)(6486002)(5660300002)(16526019)(186003)(1076003)(6506007)(26005)(8936002)(478600001)(6916009)(316002)(786003)(66946007)(66556008)(66476007)(36756003)(86362001)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?F4v5qRClP+msZOMGxiqji5BfIc7jz6e84yKIpsIGQwgK/Rr55KA1QY0uQ4Z8?=
 =?us-ascii?Q?9ltcbHub3eaOLYQ85nZk1KAcaelJsvtZ5roDW47WpJu6mNlr7s74lWvRrBtJ?=
 =?us-ascii?Q?81xFpVUI4J/RteNuOTwFXOkSteGoqCVPcaUq6XUpxm+Z5Ze3SNBd2hjYJy+R?=
 =?us-ascii?Q?NQs1awcejJdnNtd16ckTiL+8GqSn+shI7ro7qDgW9epjJ/Ck1HUgB4+9BuTB?=
 =?us-ascii?Q?Av68vEOB84P729PBYP0cFur/kdQ92292hzR2vbfylDr0cg75+RG/bvh1Fmgp?=
 =?us-ascii?Q?Kl9JXPsGJHIDaS6VUoqmQ09TFkTpcQMCB3kc0KHkzy3a6LIiL4wCgeVSQbay?=
 =?us-ascii?Q?+qBMlDjLJLq2Xu16maiSac1IE+8lkBryPto96/rCqoFVuWxcV+4ROmwqaBOo?=
 =?us-ascii?Q?Th6If9x6s0PJfQytxdm+C9zSfySbsN3cnCSRvxMBKAxqGWANn7EZrLArNnzm?=
 =?us-ascii?Q?smelankeTpyj6qlIrsD/v4DdvP9sf2DauVdOvNth3lZCbjWJ2MGzAhO2IuwA?=
 =?us-ascii?Q?MTGU/ZrTfeBGl+Va9R3u0HLpwohAA/uw83B+Iadq3JlVvrN+UWakyI/q5IC9?=
 =?us-ascii?Q?JlSZQi5rXIYYq7x1U2HLREghwX0mnqOasmJc4mVAPBuwA7CcUf/MvmldQqUY?=
 =?us-ascii?Q?j4NZE/eEs/yISo/+pWY9cqD0a3KKWAwpA/CbgSTV9vMP+BYyvtj+8Ab1xj57?=
 =?us-ascii?Q?RxBWbYs2Gv5yoHHm/a9glKsBFv+5/7h329cd7TYXCnYMIvS88UHqIzPEj6AQ?=
 =?us-ascii?Q?hW0h2pnWZW5Y/ryYG0QpPurhZflidzf+I5IFw+TIBFUgL1oyvY4rPsiXq1DJ?=
 =?us-ascii?Q?M2RKuzW2n3oiKC+tykV0dwIvIhoZdBRNJg4G1Ucm7id+hb8SlYpwiK64NrWk?=
 =?us-ascii?Q?dZTaZrZLgeYH7Q3GDXDqbpCM1ZOgFs/9F/f+yB2+GPm9qJsAXfj9VMg4zeM6?=
 =?us-ascii?Q?v31Ak6UbUu5YTXzMTFHsMOKOAU70gYOR+V/YmUqZnScBf9Iae7go+2564Nyb?=
 =?us-ascii?Q?pSrH?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: f985081e-ea9c-4d0c-0231-08d8bd6b221d
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2021 17:45:10.7660 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MeQGiLNdi8+G5SQcIx5UxeDHUX6VhNiv4p7jIzajp76DsVi6WUNu9uDJujbvGSBB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5835
Received-SPF: pass client-ip=40.107.237.129; envelope-from=alxndr@bu.edu;
 helo=NAM12-BN8-obe.outbound.protection.outlook.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Darren Kenny <darren.kenny@oracle.com>, Alexander Bulekov <alxndr@bu.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Disks work differently depending on the x86 machine type (SATA vs PATA).
Additionally, we should fuzz the atapi code paths, which might contain
vulnerabilities such as CVE-2020-29443. This patch adds hard-disk and
cdrom generic-fuzzer configs for both the pc (PATA) and q35 (SATA)
machine types.

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
---
 tests/qtest/fuzz/generic_fuzz_configs.h | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/fuzz/generic_fuzz_configs.h b/tests/qtest/fuzz/generic_fuzz_configs.h
index 7fed035345..aa4c03f1ae 100644
--- a/tests/qtest/fuzz/generic_fuzz_configs.h
+++ b/tests/qtest/fuzz/generic_fuzz_configs.h
@@ -85,10 +85,28 @@ const generic_fuzz_config predefined_configs[] = {
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


