Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEEE12FCAEB
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 07:09:07 +0100 (CET)
Received: from localhost ([::1]:60840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l26fz-0006at-2b
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 01:09:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1l26f1-00061C-1Q
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 01:08:07 -0500
Received: from mail-bn7nam10on2098.outbound.protection.outlook.com
 ([40.107.92.98]:63456 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1l26ez-0002Eh-MN
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 01:08:06 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nmBQHYJtlePqnypdDpph5owE1BivETD8C8JxBmOHBR+oy03qXHqNxpV2MSLQ+EmMzNL0eTrmx/Hm2UK7f308GAJq+WWD948GZkKZ9BlbzIFRaF/d3DBACnLWqjuyOxCzsQzLR7UuwvY3B+ft58YoTbB4cYgfknK8qsR29EIMEsStRtKHnqjL7DnzJyHzHAQG8fPb+E54PdOgbVA4khXpM8irLoOpBJ6ORExPz0nMSpJL5b8KTIeyZoIqf9KnqMIsChYkgyNS8sUtzncbGjpzd0cGSFk6daKBxgmqc00Q4/sB2hlvooV5nSEfVikIB2t23eFXxzfg9TlR3wdc3+iE6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pnkYIa0Gkw3AsUb/zt1ZYEQApxFnEUuMvcuE/JfATkw=;
 b=E8YN54DhsdvgdF52wLsUDcDKCCJcTMyKKQlpL4ABDLH6sE4zKYwxImAHFHt46blkH3UirSfS72agcrOFcVtF23DOL0bQiacRGFN6+2TaWNgmDZuyHXIgz7yK2be7YkfCdX+vww9ZUgKSIymul8j3U1W2Y/Y+l4ypBGjZQ19zWhQo9Q89kC7uFvTmWD0mBTqzqgFIQH1e5SxKtYaQdSYNq0HN7FXVPydfckNjYhzi13esIouBMWw3TFb9rhhKlWtpPnhXCnTVl2lVnCM9CHPKlsJvt7qlpPmCls/YMfWlEAzQo3ApyfQY/qDch4RMBhZTv5cXJUjHV0grQH3S5D2fIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pnkYIa0Gkw3AsUb/zt1ZYEQApxFnEUuMvcuE/JfATkw=;
 b=l0iy3bRLiLZMMWwDc0RNXRTrti1eLq8eBYZY8b9mlGHYf6yLh6aMv+5gUHXlk4ohTYtD8YSQoXTBEYFggT3/HM3hlOr2mLN0klZbXDNiPlAT7Vk2SXiGcbavLryK0A/nApqIzI2oZIKnvG3WcHhi6o8nuufaqcPt9foRoRPoiBQ=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SA2PR03MB5884.namprd03.prod.outlook.com (2603:10b6:806:f8::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9; Wed, 20 Jan
 2021 06:08:03 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::e828:cd84:e00c:6310]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::e828:cd84:e00c:6310%6]) with mapi id 15.20.3784.012; Wed, 20 Jan 2021
 06:08:03 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PATCH] fuzz: refine the ide/ahci fuzzer configs
Date: Wed, 20 Jan 2021 01:07:45 -0500
Message-Id: <20210120060745.558970-1-alxndr@bu.edu>
X-Mailer: git-send-email 2.28.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [72.74.210.193]
X-ClientProxiedBy: MN2PR13CA0014.namprd13.prod.outlook.com
 (2603:10b6:208:160::27) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from stormtrooper.vrmnet (72.74.210.193) by
 MN2PR13CA0014.namprd13.prod.outlook.com (2603:10b6:208:160::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.6 via Frontend
 Transport; Wed, 20 Jan 2021 06:08:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d0fa5e86-8346-418d-0009-08d8bd09bf4a
X-MS-TrafficTypeDiagnostic: SA2PR03MB5884:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA2PR03MB5884525EB88FC4FE863D418ABAA20@SA2PR03MB5884.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bOOL8Ve0pMUUsbhh97AsNKGRpz1Dsw+mjoggLdGLuvZv9rGpITCRKT2Y55HdSIdnbzwkd2i/C9ty22g1svHollJFQiSn7yx06GaOVmLhkRYsoZHsDS0UbqfHOr5e2dwVGwiQMhRGBXgX981RxK5bfwms+zFcSIVFxJpa74pJzTBPnaNrpYXSrMdosMsgGVVFdQbVB/l6J9hjeHkn0N3+4kuqpAL3Iv+NvBcFfRjPgbD+cRP+NBxcM8ZRBJbbliOvT8NZcERCdYfGgsB3+9tAZn2bAWsb2lEH+8ZisDu2ssHlxIQUjVZzuL+ppcs7ocnjXqlKPxyOI1HFjzWacQxYf+oVafoVdKADGg9ldZu0qV6WOgjN7JEDjHy8jYIaHqjxxr8poNrA6uTJ1kCLAQL3ig==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(376002)(366004)(136003)(396003)(83380400001)(6512007)(66556008)(5660300002)(8936002)(6506007)(956004)(6486002)(2616005)(75432002)(54906003)(4326008)(186003)(36756003)(52116002)(16526019)(66476007)(86362001)(316002)(6916009)(8676002)(26005)(2906002)(1076003)(6666004)(478600001)(786003)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?j9Fj8f2ZLbdMGhrsUY/6B9Std+YE5wQzsEU5YIPUFqutml5ceUKG1bJJOud4?=
 =?us-ascii?Q?Afm8o/kbdoHRKdoJVoabNOrl77XQ7F0Qx+NEhLJWlPe9/jqovR9q0sQP9ybI?=
 =?us-ascii?Q?eN6Dtdmfstc6lfY41kJRsvfa0b3yYNjlKQ5Xddr59a42IxK8Op34AkTPYOb9?=
 =?us-ascii?Q?cYUOAwrmW3X8ezTCswha489wu+wFK8YIneonDJGA/PJKFSr7Pc3ggi089xUL?=
 =?us-ascii?Q?ScIOgCrcg3vM3AS5qkktyKGssENwTD95bhl3dLpOj7h7Kcl1riNxPeOKYHlg?=
 =?us-ascii?Q?IFGXZfCTEmNs398Fjb4gYqjwODTtVH1DvJel1wzT01tfvmwtetSShp5awkhv?=
 =?us-ascii?Q?zNLXpqSZWCKtWhMantv+Tq7tNYZudxsTsJpeL/aBqY2xc3+7DjVGoU1/pNo7?=
 =?us-ascii?Q?8OvikhDTQez+m86IeaIFkecy0zNaJQma0jv4JaAS3BjT5BsGBQCVEVkyU5o3?=
 =?us-ascii?Q?R4A+jkgX/TdmO65QMl3p9iQxfljITG3jhRU2y0U/3N2nxFRrjA3G5DXtb46r?=
 =?us-ascii?Q?vzMVGJux5UFn79co1IucUgOXRoT4VL0cTLuQOjLdd76eBOK2cviCxDtYVxOy?=
 =?us-ascii?Q?dHLip79+RDm0mkugtp/DO0vODA7iTWgEIyTRSdMbV11jrM1xW+qLCdXgXHGN?=
 =?us-ascii?Q?H2b2WEiHYqhTwY6YD4oDHJUku8AOXjfYg1ykDiwZUoBLtEqOwCu9XUXN2hkc?=
 =?us-ascii?Q?h6m7JQ1IHpUg2/4hXG40kkqSOD0hz19xtaH/kEpXzZAC311jofEljkZwppUI?=
 =?us-ascii?Q?6kcHcwEGOo/SBka5zCkAbEpmN4JE4EIFSMfoWDFJuLJUzoUOqSSbn7op3u+7?=
 =?us-ascii?Q?NtOJ2b9VCMoRnngfX2tuC5iIqk6Vgt4gSo7UhPCpG4IB9QDB8ZwovCu9pixz?=
 =?us-ascii?Q?CV07kJDRGBL+BQzm8tsCWrp61NJMX2bN9wiD6RkJCPfYrRCGm+jAtUbFP1DE?=
 =?us-ascii?Q?GiCzMWlEB4bqpYQLpAoW+Zx9PAKFw09uMeTwqZ/ye057ouPU270aomIiUptV?=
 =?us-ascii?Q?sbIX?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: d0fa5e86-8346-418d-0009-08d8bd09bf4a
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2021 06:08:03.6997 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f+2RcXybA+0YkjNwB+MLc8u0T8yeHYBjpjpISvvs9dC8XO9Ql66jj+4QRL/gPoiT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5884
Received-SPF: pass client-ip=40.107.92.98; envelope-from=alxndr@bu.edu;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
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
---
 tests/qtest/fuzz/generic_fuzz_configs.h | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/fuzz/generic_fuzz_configs.h b/tests/qtest/fuzz/generic_fuzz_configs.h
index 7fed035345..2ec52fbb63 100644
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
+        .args = "-machine q35 -nodefaults "
+        "-drive file=null-co://,if=none,format=raw,id=disk0 "
+        "-device ide-hd,drive=disk0",
+        .objects = "*ahci*",
+    },{
+        .name = "ahci-atapi",
         .args = "-machine q35 -nodefaults "
         "-drive file=null-co://,if=none,format=raw,id=disk0 "
         "-device ide-hd,drive=disk0",
-        .objects = "ahci*",
+        .objects = "*ahci*",
     },{
         .name = "floppy",
         .args = "-machine pc -nodefaults -device floppy,id=floppy0 "
-- 
2.28.0


