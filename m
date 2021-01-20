Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 916102FD72E
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 18:40:32 +0100 (CET)
Received: from localhost ([::1]:51844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2HT5-0002IZ-G7
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 12:40:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1l2HPS-0000NU-Ss
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 12:36:50 -0500
Received: from mail-dm6nam12on2125.outbound.protection.outlook.com
 ([40.107.243.125]:3041 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1l2HPQ-0002pJ-FY
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 12:36:46 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MtXrD0As2sqpZyl9KyGiyMB5BeRKpuEZOX7sgGBIKd/iwY0u8O1aCCtZxuGcoqeKstAV48QrjhJpUgNViioMg/6mX1h5ua4IRN92O++geb2SdTxzm/SZ/3xG/+iLpgebSwiGkwUFx0TsoRIkbCrGixQwrjJl73T0vT8ZBRcGHf1wQp3IT7FCQotBnG63pvA0FNk3U9BdFg3hR14xO/+8MN03toy9jVv2JAwK6aDOjO0uQw1tZCKlOr1OewN8prtGirxlwTkAMUtT4GDg2ccMmEMK7ENbzBNo4rjLUU98xZbA5fGZ2Ld90VmHs1G/JD2396jQvuv2tXxJdlWrmTAGnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=odkLeuyb4jU44XNZPCmqJU85iReGUgnlk/lWg/omeCM=;
 b=MnmwPZiso5ctgRFuuRUiFDdbPwdD7dVBmJK3LrHD1HDM84tU+oDNCEvMMJi03qRKKsTtCZ5tjRtin48QJUV3x0B2xruWkckT5B+OuBt+miKaVgVYoXCXHYGW1uuL0qBx81kJcxGcFt7j2lY6QkazmnyxtJ+FuP/R/RmgVG2dMuIR2dY/W1JeiJJdn8JSw5HPvwt0m32CSU+HhCwESHLRL63b/r+LZmMYzpY96hk1dS1xprB5FldT3QWVWAd6LFVpcryjcJGd3jO2wqFKwBnQOgYYv9Nj95F28J2Po5Kl3bBqOyp43HW8C2hwcNy+cx85Q+329pc1ded2DJv829ICCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=odkLeuyb4jU44XNZPCmqJU85iReGUgnlk/lWg/omeCM=;
 b=4nai4PK3r12yVgzSW/TCQ9r88KTPPWou6JOCCrjTHpjyTY7aCOnwNWoof0kuVsNeeXop8q67VuvKSpLd3bRyI2mKeCz0r/4TuKuiwuCpvd9PMB+Dk1bFITa0VC1/nfejtbS98d8hnI9Pw6up0WHgLqpbd71kV6ZcMO5Jfch1nEo=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SA0PR03MB5530.namprd03.prod.outlook.com (2603:10b6:806:b0::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.13; Wed, 20 Jan
 2021 17:36:38 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::e828:cd84:e00c:6310]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::e828:cd84:e00c:6310%6]) with mapi id 15.20.3784.012; Wed, 20 Jan 2021
 17:36:38 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PULL 2/7] fuzz: refine the ide/ahci fuzzer configs
Date: Wed, 20 Jan 2021 12:35:26 -0500
Message-Id: <20210120173536.265601-5-alxndr@bu.edu>
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
 Transport; Wed, 20 Jan 2021 17:36:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a4b5b96a-8cb9-4f8c-341e-08d8bd69f08e
X-MS-TrafficTypeDiagnostic: SA0PR03MB5530:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR03MB553055C2CC3809736FF5E921BAA20@SA0PR03MB5530.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8FQnywOc0xiY0lr+xFX440MVXOYltrnkFDjFeautXnDVDm2EYAu5G7rltd7viSZN59NbpwtK62cUE8CwAHmTgvPcbA8pcqjl+Wxu+6rs8bQ1ZRbvdKeA8Sz+Ai5TyeDsh+tpash76n9BTGmF2fU6f7aoDpIEcex58KRjZdJxcmIOniCntV8KcTwhJAQnU71z1QVWC6U0eLX7JLmVEUmtwWo07EqydTUwVbTKn6vBBORvZXcc4eUBdLp4m+AD8+JaZAXOfiaZG9QYUAw1G9gpLPj8pXg4/eiTolHrNhiONb6gc3Xm1QwOW9mwF6gidZ5pj8M+GmObwsA6ZWzahw4268xYzX/Ii0TxWTZECE5IfY5gDtJvWMUrYDdnDwlmayAqRwYQ/sEIPB6yzuANPwO/Qg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6666004)(8936002)(6512007)(66476007)(6486002)(8676002)(956004)(5660300002)(4326008)(2616005)(1076003)(75432002)(2906002)(66556008)(86362001)(83380400001)(6916009)(52116002)(186003)(6506007)(16526019)(498600001)(36756003)(54906003)(66946007)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Mm5O27IbSvUI363X14lFMGxXO6vuInyY9EIsMTHFyPFwvMgU3R3u1V7iO1MN?=
 =?us-ascii?Q?tPyzesrurZ/kV+X9/cmG24bvek6McwyLEpfe8CRUD5URNEB8ilK29poEQabY?=
 =?us-ascii?Q?vrk8u6gM1i9BP5nkL+SshiFk7WOHC8nfh9UzLxQpDiRFPDVv+YSTtds9rXlK?=
 =?us-ascii?Q?T1jIZj4QAun0MuItNueJZUcQgrGjxuQtTbQmpcbtA6SJHYsRD1yNRWOd2le/?=
 =?us-ascii?Q?utOr7bjhj3xxxScx6IBHo+vWX32cH+voRJsJicuN7Llcm/yPrvGHRTIetWIX?=
 =?us-ascii?Q?46ta3ODZSts0aSp/3QivwodpDX5gOKkzg/mvAXi7Vn6NVIIBk19Kxl69xXyl?=
 =?us-ascii?Q?xE/6dRFqMRSm8gw2aAakhtW04VGxiro5O6XPzbNgzKpnIX3RFzxNbx2pgw7k?=
 =?us-ascii?Q?VRNTOYrHTGA6plbGkMxRQaKRv31XlqXKiwpDGyPOewGDL4tMKezZdvjVZtgc?=
 =?us-ascii?Q?NWH88SY1cPS59jFojLlqlNQ4u+MridatlryUrGgjsHFr1WwcsHF7XHQD6Vy3?=
 =?us-ascii?Q?7nKmUTwxXucoFFOujMHy88Q9hIJWsslZiipDsALLuqvJ8puAzbt+5Z82JY40?=
 =?us-ascii?Q?kISPWIlI8XqoXxiDWldgNdKQTA+KsNXvI6478zDoLX/fTHepLXee0lhW0AEx?=
 =?us-ascii?Q?MYfoNBDxmd1SMmiZXAs20CI1ur+wUMBxUYMFa4Umt/u77SnXVkMCdF3i+Fp6?=
 =?us-ascii?Q?Mm3BWQQX5IqneMc57jow6nvAtWj2GNh3CP/P+0ACaCyUvCyese4Vz7hpWphd?=
 =?us-ascii?Q?KrERwWohb3F84rh0KJwyqwENeBcI9uNKuU8FxwrBe7vgcPvHkudcsj8KOW+h?=
 =?us-ascii?Q?zSK4fsm671rWIPHzovRpRTUpNsu6QgzhBZ+ZerM9oPQsOTCOciQaFff8j/DD?=
 =?us-ascii?Q?1QsjFVdQa6jP/antxwwrHP6oiuQpOtIJ1LmUln7MtwPYT7EG3gISTj+RwZJB?=
 =?us-ascii?Q?xPT7LPJkUgDu5fCxWlRUbPFen8DbRqNDjo/HLnpRrzMlZ9X/tdcoZGYY/fdl?=
 =?us-ascii?Q?xYuY?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: a4b5b96a-8cb9-4f8c-341e-08d8bd69f08e
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2021 17:36:38.4918 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZvdWAA11Uafm3LWUDDssW80JUCEgKjxuyydqIJCmlYUnZ1NDPAkDwYX3O0HHWore
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5530
Received-SPF: pass client-ip=40.107.243.125; envelope-from=alxndr@bu.edu;
 helo=NAM12-DM6-obe.outbound.protection.outlook.com
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
 Alexander Bulekov <alxndr@bu.edu>, Darren Kenny <darren.kenny@oracle.com>,
 Bandan Das <bsd@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
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


